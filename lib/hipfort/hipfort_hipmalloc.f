!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! ==============================================================================
! hipfort: FORTRAN Interfaces for GPU kernels
! ==============================================================================
! Copyright (c) 2020 Advanced Micro Devices, Inc. All rights reserved.
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

  interface hipMalloc
    !> 
    !>    @brief Allocate memory on the default accelerator
    !>  
    !>    @param[out] ptr Pointer to the allocated memory
    !>    @param[in]  size Requested memory size
    !>  
    !>    If size is 0, no memory is allocated, ptr returns nullptr, and hipSuccess is returned.
    !>  
    !>    @return #hipSuccess, #hipErrorOutOfMemory, #hipErrorInvalidValue (bad context, null ptr)
    !>  
    !>    @see hipMallocPitch, hipFree, hipMallocArray, hipFreeArray, hipMalloc3D, hipMalloc3DArray,
    !>   hipHostFree, hipHostMalloc
    !>  
#ifdef USE_CUDA_NAMES
    function hipMalloc_b(ptr,mySize) bind(c, name="cudaMalloc")
#else
    function hipMalloc_b(ptr,mySize) bind(c, name="hipMalloc")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_b
#else
      integer(kind(hipSuccess)) :: hipMalloc_b
#endif
      type(c_ptr) :: ptr
      integer(c_size_t),value :: mySize
    end function

    module procedure hipMalloc_i4_1_c_int, hipMalloc_i4_1_c_int_array, hipMalloc_i4_1_c_size_t, hipMalloc_i4_1_c_size_t_array,hipMalloc_i4_2_c_int, hipMalloc_i4_2_c_int_array, hipMalloc_i4_2_c_size_t, hipMalloc_i4_2_c_size_t_array,hipMalloc_i4_3_c_int, hipMalloc_i4_3_c_int_array, hipMalloc_i4_3_c_size_t, hipMalloc_i4_3_c_size_t_array,hipMalloc_i4_4_c_int, hipMalloc_i4_4_c_int_array, hipMalloc_i4_4_c_size_t, hipMalloc_i4_4_c_size_t_array,hipMalloc_i4_5_c_int, hipMalloc_i4_5_c_int_array, hipMalloc_i4_5_c_size_t, hipMalloc_i4_5_c_size_t_array,hipMalloc_i4_6_c_int, hipMalloc_i4_6_c_int_array, hipMalloc_i4_6_c_size_t, hipMalloc_i4_6_c_size_t_array,hipMalloc_i4_7_c_int, hipMalloc_i4_7_c_int_array, hipMalloc_i4_7_c_size_t, hipMalloc_i4_7_c_size_t_array,hipMalloc_i8_1_c_int, hipMalloc_i8_1_c_int_array, hipMalloc_i8_1_c_size_t, hipMalloc_i8_1_c_size_t_array,hipMalloc_i8_2_c_int, hipMalloc_i8_2_c_int_array, hipMalloc_i8_2_c_size_t, hipMalloc_i8_2_c_size_t_array,hipMalloc_i8_3_c_int, hipMalloc_i8_3_c_int_array, hipMalloc_i8_3_c_size_t, hipMalloc_i8_3_c_size_t_array,hipMalloc_i8_4_c_int, hipMalloc_i8_4_c_int_array, hipMalloc_i8_4_c_size_t, hipMalloc_i8_4_c_size_t_array,hipMalloc_i8_5_c_int, hipMalloc_i8_5_c_int_array, hipMalloc_i8_5_c_size_t, hipMalloc_i8_5_c_size_t_array,hipMalloc_i8_6_c_int, hipMalloc_i8_6_c_int_array, hipMalloc_i8_6_c_size_t, hipMalloc_i8_6_c_size_t_array,hipMalloc_i8_7_c_int, hipMalloc_i8_7_c_int_array, hipMalloc_i8_7_c_size_t, hipMalloc_i8_7_c_size_t_array,hipMalloc_r4_1_c_int, hipMalloc_r4_1_c_int_array, hipMalloc_r4_1_c_size_t, hipMalloc_r4_1_c_size_t_array,hipMalloc_r4_2_c_int, hipMalloc_r4_2_c_int_array, hipMalloc_r4_2_c_size_t, hipMalloc_r4_2_c_size_t_array,hipMalloc_r4_3_c_int, hipMalloc_r4_3_c_int_array, hipMalloc_r4_3_c_size_t, hipMalloc_r4_3_c_size_t_array,hipMalloc_r4_4_c_int, hipMalloc_r4_4_c_int_array, hipMalloc_r4_4_c_size_t, hipMalloc_r4_4_c_size_t_array,hipMalloc_r4_5_c_int, hipMalloc_r4_5_c_int_array, hipMalloc_r4_5_c_size_t, hipMalloc_r4_5_c_size_t_array,hipMalloc_r4_6_c_int, hipMalloc_r4_6_c_int_array, hipMalloc_r4_6_c_size_t, hipMalloc_r4_6_c_size_t_array,hipMalloc_r4_7_c_int, hipMalloc_r4_7_c_int_array, hipMalloc_r4_7_c_size_t, hipMalloc_r4_7_c_size_t_array,hipMalloc_r8_1_c_int, hipMalloc_r8_1_c_int_array, hipMalloc_r8_1_c_size_t, hipMalloc_r8_1_c_size_t_array,hipMalloc_r8_2_c_int, hipMalloc_r8_2_c_int_array, hipMalloc_r8_2_c_size_t, hipMalloc_r8_2_c_size_t_array,hipMalloc_r8_3_c_int, hipMalloc_r8_3_c_int_array, hipMalloc_r8_3_c_size_t, hipMalloc_r8_3_c_size_t_array,hipMalloc_r8_4_c_int, hipMalloc_r8_4_c_int_array, hipMalloc_r8_4_c_size_t, hipMalloc_r8_4_c_size_t_array,hipMalloc_r8_5_c_int, hipMalloc_r8_5_c_int_array, hipMalloc_r8_5_c_size_t, hipMalloc_r8_5_c_size_t_array,hipMalloc_r8_6_c_int, hipMalloc_r8_6_c_int_array, hipMalloc_r8_6_c_size_t, hipMalloc_r8_6_c_size_t_array,hipMalloc_r8_7_c_int, hipMalloc_r8_7_c_int_array, hipMalloc_r8_7_c_size_t, hipMalloc_r8_7_c_size_t_array,hipMalloc_c4_1_c_int, hipMalloc_c4_1_c_int_array, hipMalloc_c4_1_c_size_t, hipMalloc_c4_1_c_size_t_array,hipMalloc_c4_2_c_int, hipMalloc_c4_2_c_int_array, hipMalloc_c4_2_c_size_t, hipMalloc_c4_2_c_size_t_array,hipMalloc_c4_3_c_int, hipMalloc_c4_3_c_int_array, hipMalloc_c4_3_c_size_t, hipMalloc_c4_3_c_size_t_array,hipMalloc_c4_4_c_int, hipMalloc_c4_4_c_int_array, hipMalloc_c4_4_c_size_t, hipMalloc_c4_4_c_size_t_array,hipMalloc_c4_5_c_int, hipMalloc_c4_5_c_int_array, hipMalloc_c4_5_c_size_t, hipMalloc_c4_5_c_size_t_array,hipMalloc_c4_6_c_int, hipMalloc_c4_6_c_int_array, hipMalloc_c4_6_c_size_t, hipMalloc_c4_6_c_size_t_array,hipMalloc_c4_7_c_int, hipMalloc_c4_7_c_int_array, hipMalloc_c4_7_c_size_t, hipMalloc_c4_7_c_size_t_array,hipMalloc_c8_1_c_int, hipMalloc_c8_1_c_int_array, hipMalloc_c8_1_c_size_t, hipMalloc_c8_1_c_size_t_array,hipMalloc_c8_2_c_int, hipMalloc_c8_2_c_int_array, hipMalloc_c8_2_c_size_t, hipMalloc_c8_2_c_size_t_array,hipMalloc_c8_3_c_int, hipMalloc_c8_3_c_int_array, hipMalloc_c8_3_c_size_t, hipMalloc_c8_3_c_size_t_array,hipMalloc_c8_4_c_int, hipMalloc_c8_4_c_int_array, hipMalloc_c8_4_c_size_t, hipMalloc_c8_4_c_size_t_array,hipMalloc_c8_5_c_int, hipMalloc_c8_5_c_int_array, hipMalloc_c8_5_c_size_t, hipMalloc_c8_5_c_size_t_array,hipMalloc_c8_6_c_int, hipMalloc_c8_6_c_int_array, hipMalloc_c8_6_c_size_t, hipMalloc_c8_6_c_size_t_array,hipMalloc_c8_7_c_int, hipMalloc_c8_7_c_int_array, hipMalloc_c8_7_c_size_t, hipMalloc_c8_7_c_size_t_array 
  end interface
  
  interface hipHostMalloc
    !> 
    !>    @brief Allocate device accessible page locked host memory
    !>  
    !>    @param[out] ptr Pointer to the allocated host pinned memory
    !>    @param[in]  size Requested memory size
    !>    @param[in]  flags Type of host memory allocation
    !>  
    !>    If size is 0, no memory is allocated, ptr returns nullptr, and hipSuccess is returned.
    !>  
    !>    @return #hipSuccess, #hipErrorOutOfMemory
    !>  
    !>    @see hipSetDeviceFlags, hipHostFree
    !>  
#ifdef USE_CUDA_NAMES
    function hipHostMalloc_b(ptr,mySize,flags) bind(c, name="cudaHostMalloc")
#else
    function hipHostMalloc_b(ptr,mySize,flags) bind(c, name="hipHostMalloc")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_b
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_b
#endif
      type(c_ptr) :: ptr
      integer(c_size_t),value :: mySize
      integer(kind=4),value :: flags
    end function

    module procedure hipHostMalloc_i4_1_c_int, hipHostMalloc_i4_1_c_int_array, hipHostMalloc_i4_1_c_size_t, hipHostMalloc_i4_1_c_size_t_array,hipHostMalloc_i4_2_c_int, hipHostMalloc_i4_2_c_int_array, hipHostMalloc_i4_2_c_size_t, hipHostMalloc_i4_2_c_size_t_array,hipHostMalloc_i4_3_c_int, hipHostMalloc_i4_3_c_int_array, hipHostMalloc_i4_3_c_size_t, hipHostMalloc_i4_3_c_size_t_array,hipHostMalloc_i4_4_c_int, hipHostMalloc_i4_4_c_int_array, hipHostMalloc_i4_4_c_size_t, hipHostMalloc_i4_4_c_size_t_array,hipHostMalloc_i4_5_c_int, hipHostMalloc_i4_5_c_int_array, hipHostMalloc_i4_5_c_size_t, hipHostMalloc_i4_5_c_size_t_array,hipHostMalloc_i4_6_c_int, hipHostMalloc_i4_6_c_int_array, hipHostMalloc_i4_6_c_size_t, hipHostMalloc_i4_6_c_size_t_array,hipHostMalloc_i4_7_c_int, hipHostMalloc_i4_7_c_int_array, hipHostMalloc_i4_7_c_size_t, hipHostMalloc_i4_7_c_size_t_array,hipHostMalloc_i8_1_c_int, hipHostMalloc_i8_1_c_int_array, hipHostMalloc_i8_1_c_size_t, hipHostMalloc_i8_1_c_size_t_array,hipHostMalloc_i8_2_c_int, hipHostMalloc_i8_2_c_int_array, hipHostMalloc_i8_2_c_size_t, hipHostMalloc_i8_2_c_size_t_array,hipHostMalloc_i8_3_c_int, hipHostMalloc_i8_3_c_int_array, hipHostMalloc_i8_3_c_size_t, hipHostMalloc_i8_3_c_size_t_array,hipHostMalloc_i8_4_c_int, hipHostMalloc_i8_4_c_int_array, hipHostMalloc_i8_4_c_size_t, hipHostMalloc_i8_4_c_size_t_array,hipHostMalloc_i8_5_c_int, hipHostMalloc_i8_5_c_int_array, hipHostMalloc_i8_5_c_size_t, hipHostMalloc_i8_5_c_size_t_array,hipHostMalloc_i8_6_c_int, hipHostMalloc_i8_6_c_int_array, hipHostMalloc_i8_6_c_size_t, hipHostMalloc_i8_6_c_size_t_array,hipHostMalloc_i8_7_c_int, hipHostMalloc_i8_7_c_int_array, hipHostMalloc_i8_7_c_size_t, hipHostMalloc_i8_7_c_size_t_array,hipHostMalloc_r4_1_c_int, hipHostMalloc_r4_1_c_int_array, hipHostMalloc_r4_1_c_size_t, hipHostMalloc_r4_1_c_size_t_array,hipHostMalloc_r4_2_c_int, hipHostMalloc_r4_2_c_int_array, hipHostMalloc_r4_2_c_size_t, hipHostMalloc_r4_2_c_size_t_array,hipHostMalloc_r4_3_c_int, hipHostMalloc_r4_3_c_int_array, hipHostMalloc_r4_3_c_size_t, hipHostMalloc_r4_3_c_size_t_array,hipHostMalloc_r4_4_c_int, hipHostMalloc_r4_4_c_int_array, hipHostMalloc_r4_4_c_size_t, hipHostMalloc_r4_4_c_size_t_array,hipHostMalloc_r4_5_c_int, hipHostMalloc_r4_5_c_int_array, hipHostMalloc_r4_5_c_size_t, hipHostMalloc_r4_5_c_size_t_array,hipHostMalloc_r4_6_c_int, hipHostMalloc_r4_6_c_int_array, hipHostMalloc_r4_6_c_size_t, hipHostMalloc_r4_6_c_size_t_array,hipHostMalloc_r4_7_c_int, hipHostMalloc_r4_7_c_int_array, hipHostMalloc_r4_7_c_size_t, hipHostMalloc_r4_7_c_size_t_array,hipHostMalloc_r8_1_c_int, hipHostMalloc_r8_1_c_int_array, hipHostMalloc_r8_1_c_size_t, hipHostMalloc_r8_1_c_size_t_array,hipHostMalloc_r8_2_c_int, hipHostMalloc_r8_2_c_int_array, hipHostMalloc_r8_2_c_size_t, hipHostMalloc_r8_2_c_size_t_array,hipHostMalloc_r8_3_c_int, hipHostMalloc_r8_3_c_int_array, hipHostMalloc_r8_3_c_size_t, hipHostMalloc_r8_3_c_size_t_array,hipHostMalloc_r8_4_c_int, hipHostMalloc_r8_4_c_int_array, hipHostMalloc_r8_4_c_size_t, hipHostMalloc_r8_4_c_size_t_array,hipHostMalloc_r8_5_c_int, hipHostMalloc_r8_5_c_int_array, hipHostMalloc_r8_5_c_size_t, hipHostMalloc_r8_5_c_size_t_array,hipHostMalloc_r8_6_c_int, hipHostMalloc_r8_6_c_int_array, hipHostMalloc_r8_6_c_size_t, hipHostMalloc_r8_6_c_size_t_array,hipHostMalloc_r8_7_c_int, hipHostMalloc_r8_7_c_int_array, hipHostMalloc_r8_7_c_size_t, hipHostMalloc_r8_7_c_size_t_array,hipHostMalloc_c4_1_c_int, hipHostMalloc_c4_1_c_int_array, hipHostMalloc_c4_1_c_size_t, hipHostMalloc_c4_1_c_size_t_array,hipHostMalloc_c4_2_c_int, hipHostMalloc_c4_2_c_int_array, hipHostMalloc_c4_2_c_size_t, hipHostMalloc_c4_2_c_size_t_array,hipHostMalloc_c4_3_c_int, hipHostMalloc_c4_3_c_int_array, hipHostMalloc_c4_3_c_size_t, hipHostMalloc_c4_3_c_size_t_array,hipHostMalloc_c4_4_c_int, hipHostMalloc_c4_4_c_int_array, hipHostMalloc_c4_4_c_size_t, hipHostMalloc_c4_4_c_size_t_array,hipHostMalloc_c4_5_c_int, hipHostMalloc_c4_5_c_int_array, hipHostMalloc_c4_5_c_size_t, hipHostMalloc_c4_5_c_size_t_array,hipHostMalloc_c4_6_c_int, hipHostMalloc_c4_6_c_int_array, hipHostMalloc_c4_6_c_size_t, hipHostMalloc_c4_6_c_size_t_array,hipHostMalloc_c4_7_c_int, hipHostMalloc_c4_7_c_int_array, hipHostMalloc_c4_7_c_size_t, hipHostMalloc_c4_7_c_size_t_array,hipHostMalloc_c8_1_c_int, hipHostMalloc_c8_1_c_int_array, hipHostMalloc_c8_1_c_size_t, hipHostMalloc_c8_1_c_size_t_array,hipHostMalloc_c8_2_c_int, hipHostMalloc_c8_2_c_int_array, hipHostMalloc_c8_2_c_size_t, hipHostMalloc_c8_2_c_size_t_array,hipHostMalloc_c8_3_c_int, hipHostMalloc_c8_3_c_int_array, hipHostMalloc_c8_3_c_size_t, hipHostMalloc_c8_3_c_size_t_array,hipHostMalloc_c8_4_c_int, hipHostMalloc_c8_4_c_int_array, hipHostMalloc_c8_4_c_size_t, hipHostMalloc_c8_4_c_size_t_array,hipHostMalloc_c8_5_c_int, hipHostMalloc_c8_5_c_int_array, hipHostMalloc_c8_5_c_size_t, hipHostMalloc_c8_5_c_size_t_array,hipHostMalloc_c8_6_c_int, hipHostMalloc_c8_6_c_int_array, hipHostMalloc_c8_6_c_size_t, hipHostMalloc_c8_6_c_size_t_array,hipHostMalloc_c8_7_c_int, hipHostMalloc_c8_7_c_int_array, hipHostMalloc_c8_7_c_size_t, hipHostMalloc_c8_7_c_size_t_array 
  end interface
  
  interface hipFree
    !> 
    !>    @brief Free memory allocated by the hcc hip memory allocation API.
    !>    This API performs an implicit hipDeviceSynchronize() call.
    !>    If pointer is NULL, the hip runtime is initialized and hipSuccess is returned.
    !>  
    !>    @param[in] ptr Pointer to memory to be freed
    !>    @return #hipSuccess
    !>    @return #hipErrorInvalidDevicePointer (if pointer is invalid, including host pointers allocated
    !>   with hipHostMalloc)
    !>  
    !>    @see hipMalloc, hipMallocPitch, hipMallocArray, hipFreeArray, hipHostFree, hipMalloc3D,
    !>   hipMalloc3DArray, hipHostMalloc
    !>  
#ifdef USE_CUDA_NAMES
    function hipFree_b(ptr) bind(c, name="cudaFree")
#else
    function hipFree_b(ptr) bind(c, name="hipFree")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_b
#else
      integer(kind(hipSuccess)) :: hipFree_b
#endif
      type(c_ptr),value :: ptr
    end function

    module procedure hipFree_i4_1, hipFree_i4_2, hipFree_i4_3, hipFree_i4_4, hipFree_i4_5, hipFree_i4_6, hipFree_i4_7,hipFree_i8_1, hipFree_i8_2, hipFree_i8_3, hipFree_i8_4, hipFree_i8_5, hipFree_i8_6, hipFree_i8_7,hipFree_r4_1, hipFree_r4_2, hipFree_r4_3, hipFree_r4_4, hipFree_r4_5, hipFree_r4_6, hipFree_r4_7,hipFree_r8_1, hipFree_r8_2, hipFree_r8_3, hipFree_r8_4, hipFree_r8_5, hipFree_r8_6, hipFree_r8_7,hipFree_c4_1, hipFree_c4_2, hipFree_c4_3, hipFree_c4_4, hipFree_c4_5, hipFree_c4_6, hipFree_c4_7,hipFree_c8_1, hipFree_c8_2, hipFree_c8_3, hipFree_c8_4, hipFree_c8_5, hipFree_c8_6, hipFree_c8_7 
  end interface

  interface hipHostFree
    !> 
    !>    @brief Free memory allocated by the hcc hip host memory allocation API
    !>    This API performs an implicit hipDeviceSynchronize() call.
    !>    If pointer is NULL, the hip runtime is initialized and hipSuccess is returned.
    !>  
    !>    @param[in] ptr Pointer to memory to be freed
    !>    @return #hipSuccess,
    !>            #hipErrorInvalidValue (if pointer is invalid, including device pointers allocated with
    !>   hipMalloc)
    !>  
    !>    @see hipMalloc, hipMallocPitch, hipFree, hipMallocArray, hipFreeArray, hipMalloc3D,
    !>   hipMalloc3DArray, hipHostMalloc
    !>  
#ifdef USE_CUDA_NAMES
    function hipHostFree_b(ptr) bind(c, name="cudaHostFree")
#else
    function hipHostFree_b(ptr) bind(c, name="hipHostFree")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_b
#else
      integer(kind(hipSuccess)) :: hipHostFree_b
#endif
      type(c_ptr),value :: ptr
    end function

    module procedure hipHostFree_i4_1, hipHostFree_i4_2, hipHostFree_i4_3, hipHostFree_i4_4, hipHostFree_i4_5, hipHostFree_i4_6, hipHostFree_i4_7,hipHostFree_i8_1, hipHostFree_i8_2, hipHostFree_i8_3, hipHostFree_i8_4, hipHostFree_i8_5, hipHostFree_i8_6, hipHostFree_i8_7,hipHostFree_r4_1, hipHostFree_r4_2, hipHostFree_r4_3, hipHostFree_r4_4, hipHostFree_r4_5, hipHostFree_r4_6, hipHostFree_r4_7,hipHostFree_r8_1, hipHostFree_r8_2, hipHostFree_r8_3, hipHostFree_r8_4, hipHostFree_r8_5, hipHostFree_r8_6, hipHostFree_r8_7,hipHostFree_c4_1, hipHostFree_c4_2, hipHostFree_c4_3, hipHostFree_c4_4, hipHostFree_c4_5, hipHostFree_c4_6, hipHostFree_c4_7,hipHostFree_c8_1, hipHostFree_c8_2, hipHostFree_c8_3, hipHostFree_c8_4, hipHostFree_c8_5, hipHostFree_c8_6, hipHostFree_c8_7 
  end interface

  contains

                                                              
    function hipMalloc_i4_1_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:), intent(inout) :: ptr
      integer(c_int) :: shape(1)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i4_1_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_i4_1_c_int_array
#endif
      !
      hipMalloc_i4_1_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_i4_1_c_int(ptr,length1)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:), intent(inout) :: ptr
      integer(c_int) :: length1 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i4_1_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_i4_1_c_int
#endif
      !
      hipMalloc_i4_1_c_int = hipMalloc_b(cptr,length1*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1])
    end function

                                                              
    function hipMalloc_i4_1_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:), intent(inout) :: ptr
      integer(c_size_t) :: shape(1)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i4_1_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_i4_1_c_size_t_array
#endif
      !
      hipMalloc_i4_1_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_i4_1_c_size_t(ptr,length1)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:), intent(inout) :: ptr
      integer(c_size_t) :: length1 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i4_1_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_i4_1_c_size_t
#endif
      !
      hipMalloc_i4_1_c_size_t = hipMalloc_b(cptr,length1*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1])
    end function

                                                              
    function hipMalloc_i4_2_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:), intent(inout) :: ptr
      integer(c_int) :: shape(2)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i4_2_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_i4_2_c_int_array
#endif
      !
      hipMalloc_i4_2_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_i4_2_c_int(ptr,length1,length2)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:), intent(inout) :: ptr
      integer(c_int) :: length1,length2 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i4_2_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_i4_2_c_int
#endif
      !
      hipMalloc_i4_2_c_int = hipMalloc_b(cptr,length1*length2*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2])
    end function

                                                              
    function hipMalloc_i4_2_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:), intent(inout) :: ptr
      integer(c_size_t) :: shape(2)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i4_2_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_i4_2_c_size_t_array
#endif
      !
      hipMalloc_i4_2_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_i4_2_c_size_t(ptr,length1,length2)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:), intent(inout) :: ptr
      integer(c_size_t) :: length1,length2 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i4_2_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_i4_2_c_size_t
#endif
      !
      hipMalloc_i4_2_c_size_t = hipMalloc_b(cptr,length1*length2*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2])
    end function

                                                              
    function hipMalloc_i4_3_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:), intent(inout) :: ptr
      integer(c_int) :: shape(3)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i4_3_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_i4_3_c_int_array
#endif
      !
      hipMalloc_i4_3_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_i4_3_c_int(ptr,length1,length2,length3)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:), intent(inout) :: ptr
      integer(c_int) :: length1,length2,length3 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i4_3_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_i4_3_c_int
#endif
      !
      hipMalloc_i4_3_c_int = hipMalloc_b(cptr,length1*length2*length3*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3])
    end function

                                                              
    function hipMalloc_i4_3_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: shape(3)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i4_3_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_i4_3_c_size_t_array
#endif
      !
      hipMalloc_i4_3_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_i4_3_c_size_t(ptr,length1,length2,length3)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: length1,length2,length3 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i4_3_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_i4_3_c_size_t
#endif
      !
      hipMalloc_i4_3_c_size_t = hipMalloc_b(cptr,length1*length2*length3*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3])
    end function

                                                              
    function hipMalloc_i4_4_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: shape(4)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i4_4_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_i4_4_c_int_array
#endif
      !
      hipMalloc_i4_4_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_i4_4_c_int(ptr,length1,length2,length3,length4)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: length1,length2,length3,length4 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i4_4_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_i4_4_c_int
#endif
      !
      hipMalloc_i4_4_c_int = hipMalloc_b(cptr,length1*length2*length3*length4*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4])
    end function

                                                              
    function hipMalloc_i4_4_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: shape(4)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i4_4_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_i4_4_c_size_t_array
#endif
      !
      hipMalloc_i4_4_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_i4_4_c_size_t(ptr,length1,length2,length3,length4)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: length1,length2,length3,length4 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i4_4_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_i4_4_c_size_t
#endif
      !
      hipMalloc_i4_4_c_size_t = hipMalloc_b(cptr,length1*length2*length3*length4*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4])
    end function

                                                              
    function hipMalloc_i4_5_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: shape(5)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i4_5_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_i4_5_c_int_array
#endif
      !
      hipMalloc_i4_5_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_i4_5_c_int(ptr,length1,length2,length3,length4,length5)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: length1,length2,length3,length4,length5 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i4_5_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_i4_5_c_int
#endif
      !
      hipMalloc_i4_5_c_int = hipMalloc_b(cptr,length1*length2*length3*length4*length5*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5])
    end function

                                                              
    function hipMalloc_i4_5_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: shape(5)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i4_5_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_i4_5_c_size_t_array
#endif
      !
      hipMalloc_i4_5_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_i4_5_c_size_t(ptr,length1,length2,length3,length4,length5)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: length1,length2,length3,length4,length5 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i4_5_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_i4_5_c_size_t
#endif
      !
      hipMalloc_i4_5_c_size_t = hipMalloc_b(cptr,length1*length2*length3*length4*length5*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5])
    end function

                                                              
    function hipMalloc_i4_6_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: shape(6)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i4_6_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_i4_6_c_int_array
#endif
      !
      hipMalloc_i4_6_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_i4_6_c_int(ptr,length1,length2,length3,length4,length5,length6)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: length1,length2,length3,length4,length5,length6 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i4_6_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_i4_6_c_int
#endif
      !
      hipMalloc_i4_6_c_int = hipMalloc_b(cptr,length1*length2*length3*length4*length5*length6*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6])
    end function

                                                              
    function hipMalloc_i4_6_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: shape(6)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i4_6_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_i4_6_c_size_t_array
#endif
      !
      hipMalloc_i4_6_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_i4_6_c_size_t(ptr,length1,length2,length3,length4,length5,length6)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: length1,length2,length3,length4,length5,length6 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i4_6_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_i4_6_c_size_t
#endif
      !
      hipMalloc_i4_6_c_size_t = hipMalloc_b(cptr,length1*length2*length3*length4*length5*length6*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6])
    end function

                                                              
    function hipMalloc_i4_7_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: shape(7)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i4_7_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_i4_7_c_int_array
#endif
      !
      hipMalloc_i4_7_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_i4_7_c_int(ptr,length1,length2,length3,length4,length5,length6,length7)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: length1,length2,length3,length4,length5,length6,length7 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i4_7_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_i4_7_c_int
#endif
      !
      hipMalloc_i4_7_c_int = hipMalloc_b(cptr,length1*length2*length3*length4*length5*length6*length7*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6,length7])
    end function

                                                              
    function hipMalloc_i4_7_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: shape(7)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i4_7_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_i4_7_c_size_t_array
#endif
      !
      hipMalloc_i4_7_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_i4_7_c_size_t(ptr,length1,length2,length3,length4,length5,length6,length7)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: length1,length2,length3,length4,length5,length6,length7 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i4_7_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_i4_7_c_size_t
#endif
      !
      hipMalloc_i4_7_c_size_t = hipMalloc_b(cptr,length1*length2*length3*length4*length5*length6*length7*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6,length7])
    end function

                                                              
    function hipMalloc_i8_1_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:), intent(inout) :: ptr
      integer(c_int) :: shape(1)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i8_1_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_i8_1_c_int_array
#endif
      !
      hipMalloc_i8_1_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_i8_1_c_int(ptr,length1)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:), intent(inout) :: ptr
      integer(c_int) :: length1 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i8_1_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_i8_1_c_int
#endif
      !
      hipMalloc_i8_1_c_int = hipMalloc_b(cptr,length1*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1])
    end function

                                                              
    function hipMalloc_i8_1_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:), intent(inout) :: ptr
      integer(c_size_t) :: shape(1)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i8_1_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_i8_1_c_size_t_array
#endif
      !
      hipMalloc_i8_1_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_i8_1_c_size_t(ptr,length1)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:), intent(inout) :: ptr
      integer(c_size_t) :: length1 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i8_1_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_i8_1_c_size_t
#endif
      !
      hipMalloc_i8_1_c_size_t = hipMalloc_b(cptr,length1*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1])
    end function

                                                              
    function hipMalloc_i8_2_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:), intent(inout) :: ptr
      integer(c_int) :: shape(2)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i8_2_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_i8_2_c_int_array
#endif
      !
      hipMalloc_i8_2_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_i8_2_c_int(ptr,length1,length2)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:), intent(inout) :: ptr
      integer(c_int) :: length1,length2 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i8_2_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_i8_2_c_int
#endif
      !
      hipMalloc_i8_2_c_int = hipMalloc_b(cptr,length1*length2*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2])
    end function

                                                              
    function hipMalloc_i8_2_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:), intent(inout) :: ptr
      integer(c_size_t) :: shape(2)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i8_2_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_i8_2_c_size_t_array
#endif
      !
      hipMalloc_i8_2_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_i8_2_c_size_t(ptr,length1,length2)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:), intent(inout) :: ptr
      integer(c_size_t) :: length1,length2 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i8_2_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_i8_2_c_size_t
#endif
      !
      hipMalloc_i8_2_c_size_t = hipMalloc_b(cptr,length1*length2*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2])
    end function

                                                              
    function hipMalloc_i8_3_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:), intent(inout) :: ptr
      integer(c_int) :: shape(3)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i8_3_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_i8_3_c_int_array
#endif
      !
      hipMalloc_i8_3_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_i8_3_c_int(ptr,length1,length2,length3)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:), intent(inout) :: ptr
      integer(c_int) :: length1,length2,length3 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i8_3_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_i8_3_c_int
#endif
      !
      hipMalloc_i8_3_c_int = hipMalloc_b(cptr,length1*length2*length3*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3])
    end function

                                                              
    function hipMalloc_i8_3_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: shape(3)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i8_3_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_i8_3_c_size_t_array
#endif
      !
      hipMalloc_i8_3_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_i8_3_c_size_t(ptr,length1,length2,length3)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: length1,length2,length3 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i8_3_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_i8_3_c_size_t
#endif
      !
      hipMalloc_i8_3_c_size_t = hipMalloc_b(cptr,length1*length2*length3*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3])
    end function

                                                              
    function hipMalloc_i8_4_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: shape(4)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i8_4_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_i8_4_c_int_array
#endif
      !
      hipMalloc_i8_4_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_i8_4_c_int(ptr,length1,length2,length3,length4)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: length1,length2,length3,length4 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i8_4_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_i8_4_c_int
#endif
      !
      hipMalloc_i8_4_c_int = hipMalloc_b(cptr,length1*length2*length3*length4*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4])
    end function

                                                              
    function hipMalloc_i8_4_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: shape(4)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i8_4_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_i8_4_c_size_t_array
#endif
      !
      hipMalloc_i8_4_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_i8_4_c_size_t(ptr,length1,length2,length3,length4)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: length1,length2,length3,length4 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i8_4_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_i8_4_c_size_t
#endif
      !
      hipMalloc_i8_4_c_size_t = hipMalloc_b(cptr,length1*length2*length3*length4*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4])
    end function

                                                              
    function hipMalloc_i8_5_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: shape(5)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i8_5_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_i8_5_c_int_array
#endif
      !
      hipMalloc_i8_5_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_i8_5_c_int(ptr,length1,length2,length3,length4,length5)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: length1,length2,length3,length4,length5 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i8_5_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_i8_5_c_int
#endif
      !
      hipMalloc_i8_5_c_int = hipMalloc_b(cptr,length1*length2*length3*length4*length5*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5])
    end function

                                                              
    function hipMalloc_i8_5_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: shape(5)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i8_5_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_i8_5_c_size_t_array
#endif
      !
      hipMalloc_i8_5_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_i8_5_c_size_t(ptr,length1,length2,length3,length4,length5)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: length1,length2,length3,length4,length5 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i8_5_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_i8_5_c_size_t
#endif
      !
      hipMalloc_i8_5_c_size_t = hipMalloc_b(cptr,length1*length2*length3*length4*length5*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5])
    end function

                                                              
    function hipMalloc_i8_6_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: shape(6)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i8_6_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_i8_6_c_int_array
#endif
      !
      hipMalloc_i8_6_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_i8_6_c_int(ptr,length1,length2,length3,length4,length5,length6)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: length1,length2,length3,length4,length5,length6 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i8_6_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_i8_6_c_int
#endif
      !
      hipMalloc_i8_6_c_int = hipMalloc_b(cptr,length1*length2*length3*length4*length5*length6*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6])
    end function

                                                              
    function hipMalloc_i8_6_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: shape(6)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i8_6_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_i8_6_c_size_t_array
#endif
      !
      hipMalloc_i8_6_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_i8_6_c_size_t(ptr,length1,length2,length3,length4,length5,length6)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: length1,length2,length3,length4,length5,length6 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i8_6_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_i8_6_c_size_t
#endif
      !
      hipMalloc_i8_6_c_size_t = hipMalloc_b(cptr,length1*length2*length3*length4*length5*length6*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6])
    end function

                                                              
    function hipMalloc_i8_7_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: shape(7)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i8_7_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_i8_7_c_int_array
#endif
      !
      hipMalloc_i8_7_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_i8_7_c_int(ptr,length1,length2,length3,length4,length5,length6,length7)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: length1,length2,length3,length4,length5,length6,length7 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i8_7_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_i8_7_c_int
#endif
      !
      hipMalloc_i8_7_c_int = hipMalloc_b(cptr,length1*length2*length3*length4*length5*length6*length7*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6,length7])
    end function

                                                              
    function hipMalloc_i8_7_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: shape(7)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i8_7_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_i8_7_c_size_t_array
#endif
      !
      hipMalloc_i8_7_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_i8_7_c_size_t(ptr,length1,length2,length3,length4,length5,length6,length7)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: length1,length2,length3,length4,length5,length6,length7 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_i8_7_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_i8_7_c_size_t
#endif
      !
      hipMalloc_i8_7_c_size_t = hipMalloc_b(cptr,length1*length2*length3*length4*length5*length6*length7*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6,length7])
    end function

                                                              
    function hipMalloc_r4_1_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:), intent(inout) :: ptr
      integer(c_int) :: shape(1)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r4_1_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_r4_1_c_int_array
#endif
      !
      hipMalloc_r4_1_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_r4_1_c_int(ptr,length1)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:), intent(inout) :: ptr
      integer(c_int) :: length1 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r4_1_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_r4_1_c_int
#endif
      !
      hipMalloc_r4_1_c_int = hipMalloc_b(cptr,length1*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1])
    end function

                                                              
    function hipMalloc_r4_1_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:), intent(inout) :: ptr
      integer(c_size_t) :: shape(1)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r4_1_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_r4_1_c_size_t_array
#endif
      !
      hipMalloc_r4_1_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_r4_1_c_size_t(ptr,length1)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:), intent(inout) :: ptr
      integer(c_size_t) :: length1 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r4_1_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_r4_1_c_size_t
#endif
      !
      hipMalloc_r4_1_c_size_t = hipMalloc_b(cptr,length1*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1])
    end function

                                                              
    function hipMalloc_r4_2_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:), intent(inout) :: ptr
      integer(c_int) :: shape(2)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r4_2_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_r4_2_c_int_array
#endif
      !
      hipMalloc_r4_2_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_r4_2_c_int(ptr,length1,length2)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:), intent(inout) :: ptr
      integer(c_int) :: length1,length2 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r4_2_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_r4_2_c_int
#endif
      !
      hipMalloc_r4_2_c_int = hipMalloc_b(cptr,length1*length2*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2])
    end function

                                                              
    function hipMalloc_r4_2_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:), intent(inout) :: ptr
      integer(c_size_t) :: shape(2)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r4_2_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_r4_2_c_size_t_array
#endif
      !
      hipMalloc_r4_2_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_r4_2_c_size_t(ptr,length1,length2)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:), intent(inout) :: ptr
      integer(c_size_t) :: length1,length2 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r4_2_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_r4_2_c_size_t
#endif
      !
      hipMalloc_r4_2_c_size_t = hipMalloc_b(cptr,length1*length2*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2])
    end function

                                                              
    function hipMalloc_r4_3_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:), intent(inout) :: ptr
      integer(c_int) :: shape(3)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r4_3_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_r4_3_c_int_array
#endif
      !
      hipMalloc_r4_3_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_r4_3_c_int(ptr,length1,length2,length3)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:), intent(inout) :: ptr
      integer(c_int) :: length1,length2,length3 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r4_3_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_r4_3_c_int
#endif
      !
      hipMalloc_r4_3_c_int = hipMalloc_b(cptr,length1*length2*length3*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3])
    end function

                                                              
    function hipMalloc_r4_3_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: shape(3)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r4_3_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_r4_3_c_size_t_array
#endif
      !
      hipMalloc_r4_3_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_r4_3_c_size_t(ptr,length1,length2,length3)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: length1,length2,length3 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r4_3_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_r4_3_c_size_t
#endif
      !
      hipMalloc_r4_3_c_size_t = hipMalloc_b(cptr,length1*length2*length3*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3])
    end function

                                                              
    function hipMalloc_r4_4_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: shape(4)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r4_4_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_r4_4_c_int_array
#endif
      !
      hipMalloc_r4_4_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_r4_4_c_int(ptr,length1,length2,length3,length4)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: length1,length2,length3,length4 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r4_4_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_r4_4_c_int
#endif
      !
      hipMalloc_r4_4_c_int = hipMalloc_b(cptr,length1*length2*length3*length4*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4])
    end function

                                                              
    function hipMalloc_r4_4_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: shape(4)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r4_4_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_r4_4_c_size_t_array
#endif
      !
      hipMalloc_r4_4_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_r4_4_c_size_t(ptr,length1,length2,length3,length4)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: length1,length2,length3,length4 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r4_4_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_r4_4_c_size_t
#endif
      !
      hipMalloc_r4_4_c_size_t = hipMalloc_b(cptr,length1*length2*length3*length4*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4])
    end function

                                                              
    function hipMalloc_r4_5_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: shape(5)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r4_5_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_r4_5_c_int_array
#endif
      !
      hipMalloc_r4_5_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_r4_5_c_int(ptr,length1,length2,length3,length4,length5)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: length1,length2,length3,length4,length5 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r4_5_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_r4_5_c_int
#endif
      !
      hipMalloc_r4_5_c_int = hipMalloc_b(cptr,length1*length2*length3*length4*length5*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5])
    end function

                                                              
    function hipMalloc_r4_5_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: shape(5)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r4_5_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_r4_5_c_size_t_array
#endif
      !
      hipMalloc_r4_5_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_r4_5_c_size_t(ptr,length1,length2,length3,length4,length5)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: length1,length2,length3,length4,length5 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r4_5_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_r4_5_c_size_t
#endif
      !
      hipMalloc_r4_5_c_size_t = hipMalloc_b(cptr,length1*length2*length3*length4*length5*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5])
    end function

                                                              
    function hipMalloc_r4_6_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: shape(6)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r4_6_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_r4_6_c_int_array
#endif
      !
      hipMalloc_r4_6_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_r4_6_c_int(ptr,length1,length2,length3,length4,length5,length6)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: length1,length2,length3,length4,length5,length6 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r4_6_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_r4_6_c_int
#endif
      !
      hipMalloc_r4_6_c_int = hipMalloc_b(cptr,length1*length2*length3*length4*length5*length6*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6])
    end function

                                                              
    function hipMalloc_r4_6_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: shape(6)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r4_6_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_r4_6_c_size_t_array
#endif
      !
      hipMalloc_r4_6_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_r4_6_c_size_t(ptr,length1,length2,length3,length4,length5,length6)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: length1,length2,length3,length4,length5,length6 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r4_6_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_r4_6_c_size_t
#endif
      !
      hipMalloc_r4_6_c_size_t = hipMalloc_b(cptr,length1*length2*length3*length4*length5*length6*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6])
    end function

                                                              
    function hipMalloc_r4_7_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: shape(7)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r4_7_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_r4_7_c_int_array
#endif
      !
      hipMalloc_r4_7_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_r4_7_c_int(ptr,length1,length2,length3,length4,length5,length6,length7)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: length1,length2,length3,length4,length5,length6,length7 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r4_7_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_r4_7_c_int
#endif
      !
      hipMalloc_r4_7_c_int = hipMalloc_b(cptr,length1*length2*length3*length4*length5*length6*length7*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6,length7])
    end function

                                                              
    function hipMalloc_r4_7_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: shape(7)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r4_7_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_r4_7_c_size_t_array
#endif
      !
      hipMalloc_r4_7_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_r4_7_c_size_t(ptr,length1,length2,length3,length4,length5,length6,length7)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: length1,length2,length3,length4,length5,length6,length7 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r4_7_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_r4_7_c_size_t
#endif
      !
      hipMalloc_r4_7_c_size_t = hipMalloc_b(cptr,length1*length2*length3*length4*length5*length6*length7*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6,length7])
    end function

                                                              
    function hipMalloc_r8_1_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:), intent(inout) :: ptr
      integer(c_int) :: shape(1)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r8_1_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_r8_1_c_int_array
#endif
      !
      hipMalloc_r8_1_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_r8_1_c_int(ptr,length1)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:), intent(inout) :: ptr
      integer(c_int) :: length1 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r8_1_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_r8_1_c_int
#endif
      !
      hipMalloc_r8_1_c_int = hipMalloc_b(cptr,length1*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1])
    end function

                                                              
    function hipMalloc_r8_1_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:), intent(inout) :: ptr
      integer(c_size_t) :: shape(1)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r8_1_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_r8_1_c_size_t_array
#endif
      !
      hipMalloc_r8_1_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_r8_1_c_size_t(ptr,length1)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:), intent(inout) :: ptr
      integer(c_size_t) :: length1 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r8_1_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_r8_1_c_size_t
#endif
      !
      hipMalloc_r8_1_c_size_t = hipMalloc_b(cptr,length1*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1])
    end function

                                                              
    function hipMalloc_r8_2_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:), intent(inout) :: ptr
      integer(c_int) :: shape(2)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r8_2_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_r8_2_c_int_array
#endif
      !
      hipMalloc_r8_2_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_r8_2_c_int(ptr,length1,length2)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:), intent(inout) :: ptr
      integer(c_int) :: length1,length2 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r8_2_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_r8_2_c_int
#endif
      !
      hipMalloc_r8_2_c_int = hipMalloc_b(cptr,length1*length2*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2])
    end function

                                                              
    function hipMalloc_r8_2_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:), intent(inout) :: ptr
      integer(c_size_t) :: shape(2)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r8_2_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_r8_2_c_size_t_array
#endif
      !
      hipMalloc_r8_2_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_r8_2_c_size_t(ptr,length1,length2)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:), intent(inout) :: ptr
      integer(c_size_t) :: length1,length2 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r8_2_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_r8_2_c_size_t
#endif
      !
      hipMalloc_r8_2_c_size_t = hipMalloc_b(cptr,length1*length2*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2])
    end function

                                                              
    function hipMalloc_r8_3_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:), intent(inout) :: ptr
      integer(c_int) :: shape(3)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r8_3_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_r8_3_c_int_array
#endif
      !
      hipMalloc_r8_3_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_r8_3_c_int(ptr,length1,length2,length3)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:), intent(inout) :: ptr
      integer(c_int) :: length1,length2,length3 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r8_3_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_r8_3_c_int
#endif
      !
      hipMalloc_r8_3_c_int = hipMalloc_b(cptr,length1*length2*length3*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3])
    end function

                                                              
    function hipMalloc_r8_3_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: shape(3)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r8_3_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_r8_3_c_size_t_array
#endif
      !
      hipMalloc_r8_3_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_r8_3_c_size_t(ptr,length1,length2,length3)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: length1,length2,length3 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r8_3_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_r8_3_c_size_t
#endif
      !
      hipMalloc_r8_3_c_size_t = hipMalloc_b(cptr,length1*length2*length3*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3])
    end function

                                                              
    function hipMalloc_r8_4_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: shape(4)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r8_4_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_r8_4_c_int_array
#endif
      !
      hipMalloc_r8_4_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_r8_4_c_int(ptr,length1,length2,length3,length4)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: length1,length2,length3,length4 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r8_4_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_r8_4_c_int
#endif
      !
      hipMalloc_r8_4_c_int = hipMalloc_b(cptr,length1*length2*length3*length4*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4])
    end function

                                                              
    function hipMalloc_r8_4_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: shape(4)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r8_4_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_r8_4_c_size_t_array
#endif
      !
      hipMalloc_r8_4_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_r8_4_c_size_t(ptr,length1,length2,length3,length4)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: length1,length2,length3,length4 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r8_4_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_r8_4_c_size_t
#endif
      !
      hipMalloc_r8_4_c_size_t = hipMalloc_b(cptr,length1*length2*length3*length4*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4])
    end function

                                                              
    function hipMalloc_r8_5_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: shape(5)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r8_5_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_r8_5_c_int_array
#endif
      !
      hipMalloc_r8_5_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_r8_5_c_int(ptr,length1,length2,length3,length4,length5)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: length1,length2,length3,length4,length5 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r8_5_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_r8_5_c_int
#endif
      !
      hipMalloc_r8_5_c_int = hipMalloc_b(cptr,length1*length2*length3*length4*length5*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5])
    end function

                                                              
    function hipMalloc_r8_5_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: shape(5)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r8_5_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_r8_5_c_size_t_array
#endif
      !
      hipMalloc_r8_5_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_r8_5_c_size_t(ptr,length1,length2,length3,length4,length5)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: length1,length2,length3,length4,length5 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r8_5_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_r8_5_c_size_t
#endif
      !
      hipMalloc_r8_5_c_size_t = hipMalloc_b(cptr,length1*length2*length3*length4*length5*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5])
    end function

                                                              
    function hipMalloc_r8_6_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: shape(6)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r8_6_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_r8_6_c_int_array
#endif
      !
      hipMalloc_r8_6_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_r8_6_c_int(ptr,length1,length2,length3,length4,length5,length6)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: length1,length2,length3,length4,length5,length6 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r8_6_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_r8_6_c_int
#endif
      !
      hipMalloc_r8_6_c_int = hipMalloc_b(cptr,length1*length2*length3*length4*length5*length6*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6])
    end function

                                                              
    function hipMalloc_r8_6_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: shape(6)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r8_6_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_r8_6_c_size_t_array
#endif
      !
      hipMalloc_r8_6_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_r8_6_c_size_t(ptr,length1,length2,length3,length4,length5,length6)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: length1,length2,length3,length4,length5,length6 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r8_6_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_r8_6_c_size_t
#endif
      !
      hipMalloc_r8_6_c_size_t = hipMalloc_b(cptr,length1*length2*length3*length4*length5*length6*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6])
    end function

                                                              
    function hipMalloc_r8_7_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: shape(7)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r8_7_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_r8_7_c_int_array
#endif
      !
      hipMalloc_r8_7_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_r8_7_c_int(ptr,length1,length2,length3,length4,length5,length6,length7)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: length1,length2,length3,length4,length5,length6,length7 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r8_7_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_r8_7_c_int
#endif
      !
      hipMalloc_r8_7_c_int = hipMalloc_b(cptr,length1*length2*length3*length4*length5*length6*length7*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6,length7])
    end function

                                                              
    function hipMalloc_r8_7_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: shape(7)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r8_7_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_r8_7_c_size_t_array
#endif
      !
      hipMalloc_r8_7_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_r8_7_c_size_t(ptr,length1,length2,length3,length4,length5,length6,length7)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: length1,length2,length3,length4,length5,length6,length7 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_r8_7_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_r8_7_c_size_t
#endif
      !
      hipMalloc_r8_7_c_size_t = hipMalloc_b(cptr,length1*length2*length3*length4*length5*length6*length7*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6,length7])
    end function

                                                              
    function hipMalloc_c4_1_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:), intent(inout) :: ptr
      integer(c_int) :: shape(1)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c4_1_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_c4_1_c_int_array
#endif
      !
      hipMalloc_c4_1_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*2*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_c4_1_c_int(ptr,length1)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:), intent(inout) :: ptr
      integer(c_int) :: length1 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c4_1_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_c4_1_c_int
#endif
      !
      hipMalloc_c4_1_c_int = hipMalloc_b(cptr,length1*2*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1])
    end function

                                                              
    function hipMalloc_c4_1_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:), intent(inout) :: ptr
      integer(c_size_t) :: shape(1)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c4_1_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_c4_1_c_size_t_array
#endif
      !
      hipMalloc_c4_1_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*2*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_c4_1_c_size_t(ptr,length1)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:), intent(inout) :: ptr
      integer(c_size_t) :: length1 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c4_1_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_c4_1_c_size_t
#endif
      !
      hipMalloc_c4_1_c_size_t = hipMalloc_b(cptr,length1*2*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1])
    end function

                                                              
    function hipMalloc_c4_2_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:), intent(inout) :: ptr
      integer(c_int) :: shape(2)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c4_2_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_c4_2_c_int_array
#endif
      !
      hipMalloc_c4_2_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*2*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_c4_2_c_int(ptr,length1,length2)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:), intent(inout) :: ptr
      integer(c_int) :: length1,length2 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c4_2_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_c4_2_c_int
#endif
      !
      hipMalloc_c4_2_c_int = hipMalloc_b(cptr,length1*length2*2*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2])
    end function

                                                              
    function hipMalloc_c4_2_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:), intent(inout) :: ptr
      integer(c_size_t) :: shape(2)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c4_2_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_c4_2_c_size_t_array
#endif
      !
      hipMalloc_c4_2_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*2*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_c4_2_c_size_t(ptr,length1,length2)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:), intent(inout) :: ptr
      integer(c_size_t) :: length1,length2 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c4_2_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_c4_2_c_size_t
#endif
      !
      hipMalloc_c4_2_c_size_t = hipMalloc_b(cptr,length1*length2*2*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2])
    end function

                                                              
    function hipMalloc_c4_3_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:), intent(inout) :: ptr
      integer(c_int) :: shape(3)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c4_3_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_c4_3_c_int_array
#endif
      !
      hipMalloc_c4_3_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*2*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_c4_3_c_int(ptr,length1,length2,length3)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:), intent(inout) :: ptr
      integer(c_int) :: length1,length2,length3 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c4_3_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_c4_3_c_int
#endif
      !
      hipMalloc_c4_3_c_int = hipMalloc_b(cptr,length1*length2*length3*2*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3])
    end function

                                                              
    function hipMalloc_c4_3_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: shape(3)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c4_3_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_c4_3_c_size_t_array
#endif
      !
      hipMalloc_c4_3_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*2*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_c4_3_c_size_t(ptr,length1,length2,length3)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: length1,length2,length3 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c4_3_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_c4_3_c_size_t
#endif
      !
      hipMalloc_c4_3_c_size_t = hipMalloc_b(cptr,length1*length2*length3*2*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3])
    end function

                                                              
    function hipMalloc_c4_4_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: shape(4)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c4_4_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_c4_4_c_int_array
#endif
      !
      hipMalloc_c4_4_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*2*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_c4_4_c_int(ptr,length1,length2,length3,length4)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: length1,length2,length3,length4 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c4_4_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_c4_4_c_int
#endif
      !
      hipMalloc_c4_4_c_int = hipMalloc_b(cptr,length1*length2*length3*length4*2*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4])
    end function

                                                              
    function hipMalloc_c4_4_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: shape(4)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c4_4_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_c4_4_c_size_t_array
#endif
      !
      hipMalloc_c4_4_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*2*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_c4_4_c_size_t(ptr,length1,length2,length3,length4)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: length1,length2,length3,length4 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c4_4_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_c4_4_c_size_t
#endif
      !
      hipMalloc_c4_4_c_size_t = hipMalloc_b(cptr,length1*length2*length3*length4*2*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4])
    end function

                                                              
    function hipMalloc_c4_5_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: shape(5)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c4_5_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_c4_5_c_int_array
#endif
      !
      hipMalloc_c4_5_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*2*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_c4_5_c_int(ptr,length1,length2,length3,length4,length5)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: length1,length2,length3,length4,length5 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c4_5_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_c4_5_c_int
#endif
      !
      hipMalloc_c4_5_c_int = hipMalloc_b(cptr,length1*length2*length3*length4*length5*2*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5])
    end function

                                                              
    function hipMalloc_c4_5_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: shape(5)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c4_5_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_c4_5_c_size_t_array
#endif
      !
      hipMalloc_c4_5_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*2*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_c4_5_c_size_t(ptr,length1,length2,length3,length4,length5)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: length1,length2,length3,length4,length5 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c4_5_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_c4_5_c_size_t
#endif
      !
      hipMalloc_c4_5_c_size_t = hipMalloc_b(cptr,length1*length2*length3*length4*length5*2*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5])
    end function

                                                              
    function hipMalloc_c4_6_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: shape(6)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c4_6_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_c4_6_c_int_array
#endif
      !
      hipMalloc_c4_6_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*2*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_c4_6_c_int(ptr,length1,length2,length3,length4,length5,length6)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: length1,length2,length3,length4,length5,length6 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c4_6_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_c4_6_c_int
#endif
      !
      hipMalloc_c4_6_c_int = hipMalloc_b(cptr,length1*length2*length3*length4*length5*length6*2*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6])
    end function

                                                              
    function hipMalloc_c4_6_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: shape(6)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c4_6_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_c4_6_c_size_t_array
#endif
      !
      hipMalloc_c4_6_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*2*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_c4_6_c_size_t(ptr,length1,length2,length3,length4,length5,length6)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: length1,length2,length3,length4,length5,length6 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c4_6_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_c4_6_c_size_t
#endif
      !
      hipMalloc_c4_6_c_size_t = hipMalloc_b(cptr,length1*length2*length3*length4*length5*length6*2*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6])
    end function

                                                              
    function hipMalloc_c4_7_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: shape(7)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c4_7_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_c4_7_c_int_array
#endif
      !
      hipMalloc_c4_7_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*2*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_c4_7_c_int(ptr,length1,length2,length3,length4,length5,length6,length7)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: length1,length2,length3,length4,length5,length6,length7 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c4_7_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_c4_7_c_int
#endif
      !
      hipMalloc_c4_7_c_int = hipMalloc_b(cptr,length1*length2*length3*length4*length5*length6*length7*2*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6,length7])
    end function

                                                              
    function hipMalloc_c4_7_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: shape(7)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c4_7_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_c4_7_c_size_t_array
#endif
      !
      hipMalloc_c4_7_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*2*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_c4_7_c_size_t(ptr,length1,length2,length3,length4,length5,length6,length7)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: length1,length2,length3,length4,length5,length6,length7 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c4_7_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_c4_7_c_size_t
#endif
      !
      hipMalloc_c4_7_c_size_t = hipMalloc_b(cptr,length1*length2*length3*length4*length5*length6*length7*2*4_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6,length7])
    end function

                                                              
    function hipMalloc_c8_1_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:), intent(inout) :: ptr
      integer(c_int) :: shape(1)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c8_1_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_c8_1_c_int_array
#endif
      !
      hipMalloc_c8_1_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*2*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_c8_1_c_int(ptr,length1)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:), intent(inout) :: ptr
      integer(c_int) :: length1 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c8_1_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_c8_1_c_int
#endif
      !
      hipMalloc_c8_1_c_int = hipMalloc_b(cptr,length1*2*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1])
    end function

                                                              
    function hipMalloc_c8_1_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:), intent(inout) :: ptr
      integer(c_size_t) :: shape(1)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c8_1_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_c8_1_c_size_t_array
#endif
      !
      hipMalloc_c8_1_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*2*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_c8_1_c_size_t(ptr,length1)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:), intent(inout) :: ptr
      integer(c_size_t) :: length1 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c8_1_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_c8_1_c_size_t
#endif
      !
      hipMalloc_c8_1_c_size_t = hipMalloc_b(cptr,length1*2*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1])
    end function

                                                              
    function hipMalloc_c8_2_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:), intent(inout) :: ptr
      integer(c_int) :: shape(2)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c8_2_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_c8_2_c_int_array
#endif
      !
      hipMalloc_c8_2_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*2*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_c8_2_c_int(ptr,length1,length2)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:), intent(inout) :: ptr
      integer(c_int) :: length1,length2 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c8_2_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_c8_2_c_int
#endif
      !
      hipMalloc_c8_2_c_int = hipMalloc_b(cptr,length1*length2*2*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2])
    end function

                                                              
    function hipMalloc_c8_2_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:), intent(inout) :: ptr
      integer(c_size_t) :: shape(2)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c8_2_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_c8_2_c_size_t_array
#endif
      !
      hipMalloc_c8_2_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*2*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_c8_2_c_size_t(ptr,length1,length2)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:), intent(inout) :: ptr
      integer(c_size_t) :: length1,length2 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c8_2_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_c8_2_c_size_t
#endif
      !
      hipMalloc_c8_2_c_size_t = hipMalloc_b(cptr,length1*length2*2*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2])
    end function

                                                              
    function hipMalloc_c8_3_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:), intent(inout) :: ptr
      integer(c_int) :: shape(3)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c8_3_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_c8_3_c_int_array
#endif
      !
      hipMalloc_c8_3_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*2*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_c8_3_c_int(ptr,length1,length2,length3)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:), intent(inout) :: ptr
      integer(c_int) :: length1,length2,length3 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c8_3_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_c8_3_c_int
#endif
      !
      hipMalloc_c8_3_c_int = hipMalloc_b(cptr,length1*length2*length3*2*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3])
    end function

                                                              
    function hipMalloc_c8_3_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: shape(3)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c8_3_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_c8_3_c_size_t_array
#endif
      !
      hipMalloc_c8_3_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*2*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_c8_3_c_size_t(ptr,length1,length2,length3)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: length1,length2,length3 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c8_3_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_c8_3_c_size_t
#endif
      !
      hipMalloc_c8_3_c_size_t = hipMalloc_b(cptr,length1*length2*length3*2*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3])
    end function

                                                              
    function hipMalloc_c8_4_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: shape(4)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c8_4_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_c8_4_c_int_array
#endif
      !
      hipMalloc_c8_4_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*2*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_c8_4_c_int(ptr,length1,length2,length3,length4)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: length1,length2,length3,length4 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c8_4_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_c8_4_c_int
#endif
      !
      hipMalloc_c8_4_c_int = hipMalloc_b(cptr,length1*length2*length3*length4*2*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4])
    end function

                                                              
    function hipMalloc_c8_4_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: shape(4)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c8_4_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_c8_4_c_size_t_array
#endif
      !
      hipMalloc_c8_4_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*2*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_c8_4_c_size_t(ptr,length1,length2,length3,length4)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: length1,length2,length3,length4 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c8_4_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_c8_4_c_size_t
#endif
      !
      hipMalloc_c8_4_c_size_t = hipMalloc_b(cptr,length1*length2*length3*length4*2*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4])
    end function

                                                              
    function hipMalloc_c8_5_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: shape(5)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c8_5_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_c8_5_c_int_array
#endif
      !
      hipMalloc_c8_5_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*2*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_c8_5_c_int(ptr,length1,length2,length3,length4,length5)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: length1,length2,length3,length4,length5 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c8_5_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_c8_5_c_int
#endif
      !
      hipMalloc_c8_5_c_int = hipMalloc_b(cptr,length1*length2*length3*length4*length5*2*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5])
    end function

                                                              
    function hipMalloc_c8_5_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: shape(5)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c8_5_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_c8_5_c_size_t_array
#endif
      !
      hipMalloc_c8_5_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*2*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_c8_5_c_size_t(ptr,length1,length2,length3,length4,length5)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: length1,length2,length3,length4,length5 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c8_5_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_c8_5_c_size_t
#endif
      !
      hipMalloc_c8_5_c_size_t = hipMalloc_b(cptr,length1*length2*length3*length4*length5*2*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5])
    end function

                                                              
    function hipMalloc_c8_6_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: shape(6)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c8_6_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_c8_6_c_int_array
#endif
      !
      hipMalloc_c8_6_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*2*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_c8_6_c_int(ptr,length1,length2,length3,length4,length5,length6)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: length1,length2,length3,length4,length5,length6 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c8_6_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_c8_6_c_int
#endif
      !
      hipMalloc_c8_6_c_int = hipMalloc_b(cptr,length1*length2*length3*length4*length5*length6*2*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6])
    end function

                                                              
    function hipMalloc_c8_6_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: shape(6)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c8_6_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_c8_6_c_size_t_array
#endif
      !
      hipMalloc_c8_6_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*2*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_c8_6_c_size_t(ptr,length1,length2,length3,length4,length5,length6)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: length1,length2,length3,length4,length5,length6 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c8_6_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_c8_6_c_size_t
#endif
      !
      hipMalloc_c8_6_c_size_t = hipMalloc_b(cptr,length1*length2*length3*length4*length5*length6*2*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6])
    end function

                                                              
    function hipMalloc_c8_7_c_int_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: shape(7)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c8_7_c_int_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_c8_7_c_int_array
#endif
      !
      hipMalloc_c8_7_c_int_array = hipMalloc_b(cptr,PRODUCT(shape)*2*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_c8_7_c_int(ptr,length1,length2,length3,length4,length5,length6,length7)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_int) :: length1,length2,length3,length4,length5,length6,length7 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c8_7_c_int 
#else
      integer(kind(hipSuccess)) :: hipMalloc_c8_7_c_int
#endif
      !
      hipMalloc_c8_7_c_int = hipMalloc_b(cptr,length1*length2*length3*length4*length5*length6*length7*2*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6,length7])
    end function

                                                              
    function hipMalloc_c8_7_c_size_t_array(ptr,shape)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: shape(7)
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c8_7_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipMalloc_c8_7_c_size_t_array
#endif
      !
      hipMalloc_c8_7_c_size_t_array = hipMalloc_b(cptr,PRODUCT(shape)*2*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipMalloc_c8_7_c_size_t(ptr,length1,length2,length3,length4,length5,length6,length7)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
      integer(c_size_t) :: length1,length2,length3,length4,length5,length6,length7 
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipMalloc_c8_7_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipMalloc_c8_7_c_size_t
#endif
      !
      hipMalloc_c8_7_c_size_t = hipMalloc_b(cptr,length1*length2*length3*length4*length5*length6*length7*2*8_8)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6,length7])
    end function

  
                                                              
    function hipHostMalloc_i4_1_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:) :: ptr
      integer(c_int) :: shape(1)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i4_1_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i4_1_c_int_array
#endif
      !
      hipHostMalloc_i4_1_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_i4_1_c_int(ptr,length1,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:) :: ptr
      integer(c_int),intent(in) :: length1 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i4_1_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i4_1_c_int
#endif
      !
      hipHostMalloc_i4_1_c_int = hipHostMalloc_b(cptr,length1*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1])
    end function

                                                              
    function hipHostMalloc_i4_1_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:) :: ptr
      integer(c_size_t) :: shape(1)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i4_1_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i4_1_c_size_t_array
#endif
      !
      hipHostMalloc_i4_1_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_i4_1_c_size_t(ptr,length1,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:) :: ptr
      integer(c_size_t),intent(in) :: length1 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i4_1_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i4_1_c_size_t
#endif
      !
      hipHostMalloc_i4_1_c_size_t = hipHostMalloc_b(cptr,length1*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1])
    end function

                                                              
    function hipHostMalloc_i4_2_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:) :: ptr
      integer(c_int) :: shape(2)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i4_2_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i4_2_c_int_array
#endif
      !
      hipHostMalloc_i4_2_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_i4_2_c_int(ptr,length1,length2,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:) :: ptr
      integer(c_int),intent(in) :: length1,length2 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i4_2_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i4_2_c_int
#endif
      !
      hipHostMalloc_i4_2_c_int = hipHostMalloc_b(cptr,length1*length2*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2])
    end function

                                                              
    function hipHostMalloc_i4_2_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:) :: ptr
      integer(c_size_t) :: shape(2)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i4_2_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i4_2_c_size_t_array
#endif
      !
      hipHostMalloc_i4_2_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_i4_2_c_size_t(ptr,length1,length2,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:) :: ptr
      integer(c_size_t),intent(in) :: length1,length2 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i4_2_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i4_2_c_size_t
#endif
      !
      hipHostMalloc_i4_2_c_size_t = hipHostMalloc_b(cptr,length1*length2*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2])
    end function

                                                              
    function hipHostMalloc_i4_3_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:) :: ptr
      integer(c_int) :: shape(3)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i4_3_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i4_3_c_int_array
#endif
      !
      hipHostMalloc_i4_3_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_i4_3_c_int(ptr,length1,length2,length3,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:) :: ptr
      integer(c_int),intent(in) :: length1,length2,length3 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i4_3_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i4_3_c_int
#endif
      !
      hipHostMalloc_i4_3_c_int = hipHostMalloc_b(cptr,length1*length2*length3*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3])
    end function

                                                              
    function hipHostMalloc_i4_3_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:) :: ptr
      integer(c_size_t) :: shape(3)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i4_3_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i4_3_c_size_t_array
#endif
      !
      hipHostMalloc_i4_3_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_i4_3_c_size_t(ptr,length1,length2,length3,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:) :: ptr
      integer(c_size_t),intent(in) :: length1,length2,length3 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i4_3_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i4_3_c_size_t
#endif
      !
      hipHostMalloc_i4_3_c_size_t = hipHostMalloc_b(cptr,length1*length2*length3*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3])
    end function

                                                              
    function hipHostMalloc_i4_4_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:) :: ptr
      integer(c_int) :: shape(4)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i4_4_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i4_4_c_int_array
#endif
      !
      hipHostMalloc_i4_4_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_i4_4_c_int(ptr,length1,length2,length3,length4,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:) :: ptr
      integer(c_int),intent(in) :: length1,length2,length3,length4 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i4_4_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i4_4_c_int
#endif
      !
      hipHostMalloc_i4_4_c_int = hipHostMalloc_b(cptr,length1*length2*length3*length4*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4])
    end function

                                                              
    function hipHostMalloc_i4_4_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:) :: ptr
      integer(c_size_t) :: shape(4)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i4_4_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i4_4_c_size_t_array
#endif
      !
      hipHostMalloc_i4_4_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_i4_4_c_size_t(ptr,length1,length2,length3,length4,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:) :: ptr
      integer(c_size_t),intent(in) :: length1,length2,length3,length4 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i4_4_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i4_4_c_size_t
#endif
      !
      hipHostMalloc_i4_4_c_size_t = hipHostMalloc_b(cptr,length1*length2*length3*length4*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4])
    end function

                                                              
    function hipHostMalloc_i4_5_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:,:) :: ptr
      integer(c_int) :: shape(5)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i4_5_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i4_5_c_int_array
#endif
      !
      hipHostMalloc_i4_5_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_i4_5_c_int(ptr,length1,length2,length3,length4,length5,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:,:) :: ptr
      integer(c_int),intent(in) :: length1,length2,length3,length4,length5 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i4_5_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i4_5_c_int
#endif
      !
      hipHostMalloc_i4_5_c_int = hipHostMalloc_b(cptr,length1*length2*length3*length4*length5*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5])
    end function

                                                              
    function hipHostMalloc_i4_5_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:,:) :: ptr
      integer(c_size_t) :: shape(5)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i4_5_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i4_5_c_size_t_array
#endif
      !
      hipHostMalloc_i4_5_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_i4_5_c_size_t(ptr,length1,length2,length3,length4,length5,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:,:) :: ptr
      integer(c_size_t),intent(in) :: length1,length2,length3,length4,length5 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i4_5_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i4_5_c_size_t
#endif
      !
      hipHostMalloc_i4_5_c_size_t = hipHostMalloc_b(cptr,length1*length2*length3*length4*length5*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5])
    end function

                                                              
    function hipHostMalloc_i4_6_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:,:,:) :: ptr
      integer(c_int) :: shape(6)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i4_6_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i4_6_c_int_array
#endif
      !
      hipHostMalloc_i4_6_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_i4_6_c_int(ptr,length1,length2,length3,length4,length5,length6,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:,:,:) :: ptr
      integer(c_int),intent(in) :: length1,length2,length3,length4,length5,length6 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i4_6_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i4_6_c_int
#endif
      !
      hipHostMalloc_i4_6_c_int = hipHostMalloc_b(cptr,length1*length2*length3*length4*length5*length6*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6])
    end function

                                                              
    function hipHostMalloc_i4_6_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:,:,:) :: ptr
      integer(c_size_t) :: shape(6)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i4_6_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i4_6_c_size_t_array
#endif
      !
      hipHostMalloc_i4_6_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_i4_6_c_size_t(ptr,length1,length2,length3,length4,length5,length6,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:,:,:) :: ptr
      integer(c_size_t),intent(in) :: length1,length2,length3,length4,length5,length6 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i4_6_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i4_6_c_size_t
#endif
      !
      hipHostMalloc_i4_6_c_size_t = hipHostMalloc_b(cptr,length1*length2*length3*length4*length5*length6*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6])
    end function

                                                              
    function hipHostMalloc_i4_7_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:,:,:,:) :: ptr
      integer(c_int) :: shape(7)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i4_7_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i4_7_c_int_array
#endif
      !
      hipHostMalloc_i4_7_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_i4_7_c_int(ptr,length1,length2,length3,length4,length5,length6,length7,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:,:,:,:) :: ptr
      integer(c_int),intent(in) :: length1,length2,length3,length4,length5,length6,length7 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i4_7_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i4_7_c_int
#endif
      !
      hipHostMalloc_i4_7_c_int = hipHostMalloc_b(cptr,length1*length2*length3*length4*length5*length6*length7*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6,length7])
    end function

                                                              
    function hipHostMalloc_i4_7_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:,:,:,:) :: ptr
      integer(c_size_t) :: shape(7)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i4_7_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i4_7_c_size_t_array
#endif
      !
      hipHostMalloc_i4_7_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_i4_7_c_size_t(ptr,length1,length2,length3,length4,length5,length6,length7,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:,:,:,:) :: ptr
      integer(c_size_t),intent(in) :: length1,length2,length3,length4,length5,length6,length7 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i4_7_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i4_7_c_size_t
#endif
      !
      hipHostMalloc_i4_7_c_size_t = hipHostMalloc_b(cptr,length1*length2*length3*length4*length5*length6*length7*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6,length7])
    end function

                                                              
    function hipHostMalloc_i8_1_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:) :: ptr
      integer(c_int) :: shape(1)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i8_1_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i8_1_c_int_array
#endif
      !
      hipHostMalloc_i8_1_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_i8_1_c_int(ptr,length1,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:) :: ptr
      integer(c_int),intent(in) :: length1 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i8_1_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i8_1_c_int
#endif
      !
      hipHostMalloc_i8_1_c_int = hipHostMalloc_b(cptr,length1*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1])
    end function

                                                              
    function hipHostMalloc_i8_1_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:) :: ptr
      integer(c_size_t) :: shape(1)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i8_1_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i8_1_c_size_t_array
#endif
      !
      hipHostMalloc_i8_1_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_i8_1_c_size_t(ptr,length1,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:) :: ptr
      integer(c_size_t),intent(in) :: length1 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i8_1_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i8_1_c_size_t
#endif
      !
      hipHostMalloc_i8_1_c_size_t = hipHostMalloc_b(cptr,length1*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1])
    end function

                                                              
    function hipHostMalloc_i8_2_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:) :: ptr
      integer(c_int) :: shape(2)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i8_2_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i8_2_c_int_array
#endif
      !
      hipHostMalloc_i8_2_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_i8_2_c_int(ptr,length1,length2,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:) :: ptr
      integer(c_int),intent(in) :: length1,length2 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i8_2_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i8_2_c_int
#endif
      !
      hipHostMalloc_i8_2_c_int = hipHostMalloc_b(cptr,length1*length2*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2])
    end function

                                                              
    function hipHostMalloc_i8_2_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:) :: ptr
      integer(c_size_t) :: shape(2)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i8_2_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i8_2_c_size_t_array
#endif
      !
      hipHostMalloc_i8_2_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_i8_2_c_size_t(ptr,length1,length2,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:) :: ptr
      integer(c_size_t),intent(in) :: length1,length2 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i8_2_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i8_2_c_size_t
#endif
      !
      hipHostMalloc_i8_2_c_size_t = hipHostMalloc_b(cptr,length1*length2*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2])
    end function

                                                              
    function hipHostMalloc_i8_3_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:) :: ptr
      integer(c_int) :: shape(3)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i8_3_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i8_3_c_int_array
#endif
      !
      hipHostMalloc_i8_3_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_i8_3_c_int(ptr,length1,length2,length3,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:) :: ptr
      integer(c_int),intent(in) :: length1,length2,length3 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i8_3_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i8_3_c_int
#endif
      !
      hipHostMalloc_i8_3_c_int = hipHostMalloc_b(cptr,length1*length2*length3*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3])
    end function

                                                              
    function hipHostMalloc_i8_3_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:) :: ptr
      integer(c_size_t) :: shape(3)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i8_3_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i8_3_c_size_t_array
#endif
      !
      hipHostMalloc_i8_3_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_i8_3_c_size_t(ptr,length1,length2,length3,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:) :: ptr
      integer(c_size_t),intent(in) :: length1,length2,length3 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i8_3_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i8_3_c_size_t
#endif
      !
      hipHostMalloc_i8_3_c_size_t = hipHostMalloc_b(cptr,length1*length2*length3*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3])
    end function

                                                              
    function hipHostMalloc_i8_4_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:) :: ptr
      integer(c_int) :: shape(4)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i8_4_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i8_4_c_int_array
#endif
      !
      hipHostMalloc_i8_4_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_i8_4_c_int(ptr,length1,length2,length3,length4,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:) :: ptr
      integer(c_int),intent(in) :: length1,length2,length3,length4 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i8_4_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i8_4_c_int
#endif
      !
      hipHostMalloc_i8_4_c_int = hipHostMalloc_b(cptr,length1*length2*length3*length4*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4])
    end function

                                                              
    function hipHostMalloc_i8_4_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:) :: ptr
      integer(c_size_t) :: shape(4)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i8_4_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i8_4_c_size_t_array
#endif
      !
      hipHostMalloc_i8_4_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_i8_4_c_size_t(ptr,length1,length2,length3,length4,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:) :: ptr
      integer(c_size_t),intent(in) :: length1,length2,length3,length4 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i8_4_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i8_4_c_size_t
#endif
      !
      hipHostMalloc_i8_4_c_size_t = hipHostMalloc_b(cptr,length1*length2*length3*length4*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4])
    end function

                                                              
    function hipHostMalloc_i8_5_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:,:) :: ptr
      integer(c_int) :: shape(5)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i8_5_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i8_5_c_int_array
#endif
      !
      hipHostMalloc_i8_5_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_i8_5_c_int(ptr,length1,length2,length3,length4,length5,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:,:) :: ptr
      integer(c_int),intent(in) :: length1,length2,length3,length4,length5 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i8_5_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i8_5_c_int
#endif
      !
      hipHostMalloc_i8_5_c_int = hipHostMalloc_b(cptr,length1*length2*length3*length4*length5*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5])
    end function

                                                              
    function hipHostMalloc_i8_5_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:,:) :: ptr
      integer(c_size_t) :: shape(5)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i8_5_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i8_5_c_size_t_array
#endif
      !
      hipHostMalloc_i8_5_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_i8_5_c_size_t(ptr,length1,length2,length3,length4,length5,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:,:) :: ptr
      integer(c_size_t),intent(in) :: length1,length2,length3,length4,length5 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i8_5_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i8_5_c_size_t
#endif
      !
      hipHostMalloc_i8_5_c_size_t = hipHostMalloc_b(cptr,length1*length2*length3*length4*length5*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5])
    end function

                                                              
    function hipHostMalloc_i8_6_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:,:,:) :: ptr
      integer(c_int) :: shape(6)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i8_6_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i8_6_c_int_array
#endif
      !
      hipHostMalloc_i8_6_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_i8_6_c_int(ptr,length1,length2,length3,length4,length5,length6,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:,:,:) :: ptr
      integer(c_int),intent(in) :: length1,length2,length3,length4,length5,length6 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i8_6_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i8_6_c_int
#endif
      !
      hipHostMalloc_i8_6_c_int = hipHostMalloc_b(cptr,length1*length2*length3*length4*length5*length6*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6])
    end function

                                                              
    function hipHostMalloc_i8_6_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:,:,:) :: ptr
      integer(c_size_t) :: shape(6)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i8_6_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i8_6_c_size_t_array
#endif
      !
      hipHostMalloc_i8_6_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_i8_6_c_size_t(ptr,length1,length2,length3,length4,length5,length6,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:,:,:) :: ptr
      integer(c_size_t),intent(in) :: length1,length2,length3,length4,length5,length6 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i8_6_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i8_6_c_size_t
#endif
      !
      hipHostMalloc_i8_6_c_size_t = hipHostMalloc_b(cptr,length1*length2*length3*length4*length5*length6*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6])
    end function

                                                              
    function hipHostMalloc_i8_7_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:,:,:,:) :: ptr
      integer(c_int) :: shape(7)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i8_7_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i8_7_c_int_array
#endif
      !
      hipHostMalloc_i8_7_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_i8_7_c_int(ptr,length1,length2,length3,length4,length5,length6,length7,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:,:,:,:) :: ptr
      integer(c_int),intent(in) :: length1,length2,length3,length4,length5,length6,length7 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i8_7_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i8_7_c_int
#endif
      !
      hipHostMalloc_i8_7_c_int = hipHostMalloc_b(cptr,length1*length2*length3*length4*length5*length6*length7*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6,length7])
    end function

                                                              
    function hipHostMalloc_i8_7_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:,:,:,:) :: ptr
      integer(c_size_t) :: shape(7)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i8_7_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i8_7_c_size_t_array
#endif
      !
      hipHostMalloc_i8_7_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_i8_7_c_size_t(ptr,length1,length2,length3,length4,length5,length6,length7,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:,:,:,:) :: ptr
      integer(c_size_t),intent(in) :: length1,length2,length3,length4,length5,length6,length7 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_i8_7_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_i8_7_c_size_t
#endif
      !
      hipHostMalloc_i8_7_c_size_t = hipHostMalloc_b(cptr,length1*length2*length3*length4*length5*length6*length7*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6,length7])
    end function

                                                              
    function hipHostMalloc_r4_1_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:) :: ptr
      integer(c_int) :: shape(1)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r4_1_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r4_1_c_int_array
#endif
      !
      hipHostMalloc_r4_1_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_r4_1_c_int(ptr,length1,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:) :: ptr
      integer(c_int),intent(in) :: length1 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r4_1_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r4_1_c_int
#endif
      !
      hipHostMalloc_r4_1_c_int = hipHostMalloc_b(cptr,length1*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1])
    end function

                                                              
    function hipHostMalloc_r4_1_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:) :: ptr
      integer(c_size_t) :: shape(1)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r4_1_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r4_1_c_size_t_array
#endif
      !
      hipHostMalloc_r4_1_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_r4_1_c_size_t(ptr,length1,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:) :: ptr
      integer(c_size_t),intent(in) :: length1 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r4_1_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r4_1_c_size_t
#endif
      !
      hipHostMalloc_r4_1_c_size_t = hipHostMalloc_b(cptr,length1*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1])
    end function

                                                              
    function hipHostMalloc_r4_2_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:) :: ptr
      integer(c_int) :: shape(2)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r4_2_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r4_2_c_int_array
#endif
      !
      hipHostMalloc_r4_2_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_r4_2_c_int(ptr,length1,length2,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:) :: ptr
      integer(c_int),intent(in) :: length1,length2 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r4_2_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r4_2_c_int
#endif
      !
      hipHostMalloc_r4_2_c_int = hipHostMalloc_b(cptr,length1*length2*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2])
    end function

                                                              
    function hipHostMalloc_r4_2_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:) :: ptr
      integer(c_size_t) :: shape(2)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r4_2_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r4_2_c_size_t_array
#endif
      !
      hipHostMalloc_r4_2_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_r4_2_c_size_t(ptr,length1,length2,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:) :: ptr
      integer(c_size_t),intent(in) :: length1,length2 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r4_2_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r4_2_c_size_t
#endif
      !
      hipHostMalloc_r4_2_c_size_t = hipHostMalloc_b(cptr,length1*length2*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2])
    end function

                                                              
    function hipHostMalloc_r4_3_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:) :: ptr
      integer(c_int) :: shape(3)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r4_3_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r4_3_c_int_array
#endif
      !
      hipHostMalloc_r4_3_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_r4_3_c_int(ptr,length1,length2,length3,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:) :: ptr
      integer(c_int),intent(in) :: length1,length2,length3 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r4_3_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r4_3_c_int
#endif
      !
      hipHostMalloc_r4_3_c_int = hipHostMalloc_b(cptr,length1*length2*length3*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3])
    end function

                                                              
    function hipHostMalloc_r4_3_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:) :: ptr
      integer(c_size_t) :: shape(3)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r4_3_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r4_3_c_size_t_array
#endif
      !
      hipHostMalloc_r4_3_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_r4_3_c_size_t(ptr,length1,length2,length3,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:) :: ptr
      integer(c_size_t),intent(in) :: length1,length2,length3 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r4_3_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r4_3_c_size_t
#endif
      !
      hipHostMalloc_r4_3_c_size_t = hipHostMalloc_b(cptr,length1*length2*length3*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3])
    end function

                                                              
    function hipHostMalloc_r4_4_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:) :: ptr
      integer(c_int) :: shape(4)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r4_4_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r4_4_c_int_array
#endif
      !
      hipHostMalloc_r4_4_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_r4_4_c_int(ptr,length1,length2,length3,length4,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:) :: ptr
      integer(c_int),intent(in) :: length1,length2,length3,length4 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r4_4_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r4_4_c_int
#endif
      !
      hipHostMalloc_r4_4_c_int = hipHostMalloc_b(cptr,length1*length2*length3*length4*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4])
    end function

                                                              
    function hipHostMalloc_r4_4_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:) :: ptr
      integer(c_size_t) :: shape(4)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r4_4_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r4_4_c_size_t_array
#endif
      !
      hipHostMalloc_r4_4_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_r4_4_c_size_t(ptr,length1,length2,length3,length4,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:) :: ptr
      integer(c_size_t),intent(in) :: length1,length2,length3,length4 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r4_4_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r4_4_c_size_t
#endif
      !
      hipHostMalloc_r4_4_c_size_t = hipHostMalloc_b(cptr,length1*length2*length3*length4*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4])
    end function

                                                              
    function hipHostMalloc_r4_5_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:,:) :: ptr
      integer(c_int) :: shape(5)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r4_5_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r4_5_c_int_array
#endif
      !
      hipHostMalloc_r4_5_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_r4_5_c_int(ptr,length1,length2,length3,length4,length5,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:,:) :: ptr
      integer(c_int),intent(in) :: length1,length2,length3,length4,length5 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r4_5_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r4_5_c_int
#endif
      !
      hipHostMalloc_r4_5_c_int = hipHostMalloc_b(cptr,length1*length2*length3*length4*length5*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5])
    end function

                                                              
    function hipHostMalloc_r4_5_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:,:) :: ptr
      integer(c_size_t) :: shape(5)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r4_5_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r4_5_c_size_t_array
#endif
      !
      hipHostMalloc_r4_5_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_r4_5_c_size_t(ptr,length1,length2,length3,length4,length5,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:,:) :: ptr
      integer(c_size_t),intent(in) :: length1,length2,length3,length4,length5 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r4_5_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r4_5_c_size_t
#endif
      !
      hipHostMalloc_r4_5_c_size_t = hipHostMalloc_b(cptr,length1*length2*length3*length4*length5*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5])
    end function

                                                              
    function hipHostMalloc_r4_6_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:,:,:) :: ptr
      integer(c_int) :: shape(6)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r4_6_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r4_6_c_int_array
#endif
      !
      hipHostMalloc_r4_6_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_r4_6_c_int(ptr,length1,length2,length3,length4,length5,length6,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:,:,:) :: ptr
      integer(c_int),intent(in) :: length1,length2,length3,length4,length5,length6 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r4_6_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r4_6_c_int
#endif
      !
      hipHostMalloc_r4_6_c_int = hipHostMalloc_b(cptr,length1*length2*length3*length4*length5*length6*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6])
    end function

                                                              
    function hipHostMalloc_r4_6_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:,:,:) :: ptr
      integer(c_size_t) :: shape(6)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r4_6_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r4_6_c_size_t_array
#endif
      !
      hipHostMalloc_r4_6_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_r4_6_c_size_t(ptr,length1,length2,length3,length4,length5,length6,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:,:,:) :: ptr
      integer(c_size_t),intent(in) :: length1,length2,length3,length4,length5,length6 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r4_6_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r4_6_c_size_t
#endif
      !
      hipHostMalloc_r4_6_c_size_t = hipHostMalloc_b(cptr,length1*length2*length3*length4*length5*length6*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6])
    end function

                                                              
    function hipHostMalloc_r4_7_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:,:,:,:) :: ptr
      integer(c_int) :: shape(7)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r4_7_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r4_7_c_int_array
#endif
      !
      hipHostMalloc_r4_7_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_r4_7_c_int(ptr,length1,length2,length3,length4,length5,length6,length7,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:,:,:,:) :: ptr
      integer(c_int),intent(in) :: length1,length2,length3,length4,length5,length6,length7 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r4_7_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r4_7_c_int
#endif
      !
      hipHostMalloc_r4_7_c_int = hipHostMalloc_b(cptr,length1*length2*length3*length4*length5*length6*length7*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6,length7])
    end function

                                                              
    function hipHostMalloc_r4_7_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:,:,:,:) :: ptr
      integer(c_size_t) :: shape(7)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r4_7_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r4_7_c_size_t_array
#endif
      !
      hipHostMalloc_r4_7_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_r4_7_c_size_t(ptr,length1,length2,length3,length4,length5,length6,length7,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:,:,:,:) :: ptr
      integer(c_size_t),intent(in) :: length1,length2,length3,length4,length5,length6,length7 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r4_7_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r4_7_c_size_t
#endif
      !
      hipHostMalloc_r4_7_c_size_t = hipHostMalloc_b(cptr,length1*length2*length3*length4*length5*length6*length7*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6,length7])
    end function

                                                              
    function hipHostMalloc_r8_1_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:) :: ptr
      integer(c_int) :: shape(1)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r8_1_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r8_1_c_int_array
#endif
      !
      hipHostMalloc_r8_1_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_r8_1_c_int(ptr,length1,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:) :: ptr
      integer(c_int),intent(in) :: length1 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r8_1_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r8_1_c_int
#endif
      !
      hipHostMalloc_r8_1_c_int = hipHostMalloc_b(cptr,length1*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1])
    end function

                                                              
    function hipHostMalloc_r8_1_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:) :: ptr
      integer(c_size_t) :: shape(1)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r8_1_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r8_1_c_size_t_array
#endif
      !
      hipHostMalloc_r8_1_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_r8_1_c_size_t(ptr,length1,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:) :: ptr
      integer(c_size_t),intent(in) :: length1 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r8_1_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r8_1_c_size_t
#endif
      !
      hipHostMalloc_r8_1_c_size_t = hipHostMalloc_b(cptr,length1*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1])
    end function

                                                              
    function hipHostMalloc_r8_2_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:) :: ptr
      integer(c_int) :: shape(2)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r8_2_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r8_2_c_int_array
#endif
      !
      hipHostMalloc_r8_2_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_r8_2_c_int(ptr,length1,length2,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:) :: ptr
      integer(c_int),intent(in) :: length1,length2 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r8_2_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r8_2_c_int
#endif
      !
      hipHostMalloc_r8_2_c_int = hipHostMalloc_b(cptr,length1*length2*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2])
    end function

                                                              
    function hipHostMalloc_r8_2_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:) :: ptr
      integer(c_size_t) :: shape(2)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r8_2_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r8_2_c_size_t_array
#endif
      !
      hipHostMalloc_r8_2_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_r8_2_c_size_t(ptr,length1,length2,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:) :: ptr
      integer(c_size_t),intent(in) :: length1,length2 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r8_2_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r8_2_c_size_t
#endif
      !
      hipHostMalloc_r8_2_c_size_t = hipHostMalloc_b(cptr,length1*length2*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2])
    end function

                                                              
    function hipHostMalloc_r8_3_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:) :: ptr
      integer(c_int) :: shape(3)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r8_3_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r8_3_c_int_array
#endif
      !
      hipHostMalloc_r8_3_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_r8_3_c_int(ptr,length1,length2,length3,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:) :: ptr
      integer(c_int),intent(in) :: length1,length2,length3 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r8_3_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r8_3_c_int
#endif
      !
      hipHostMalloc_r8_3_c_int = hipHostMalloc_b(cptr,length1*length2*length3*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3])
    end function

                                                              
    function hipHostMalloc_r8_3_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:) :: ptr
      integer(c_size_t) :: shape(3)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r8_3_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r8_3_c_size_t_array
#endif
      !
      hipHostMalloc_r8_3_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_r8_3_c_size_t(ptr,length1,length2,length3,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:) :: ptr
      integer(c_size_t),intent(in) :: length1,length2,length3 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r8_3_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r8_3_c_size_t
#endif
      !
      hipHostMalloc_r8_3_c_size_t = hipHostMalloc_b(cptr,length1*length2*length3*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3])
    end function

                                                              
    function hipHostMalloc_r8_4_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:) :: ptr
      integer(c_int) :: shape(4)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r8_4_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r8_4_c_int_array
#endif
      !
      hipHostMalloc_r8_4_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_r8_4_c_int(ptr,length1,length2,length3,length4,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:) :: ptr
      integer(c_int),intent(in) :: length1,length2,length3,length4 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r8_4_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r8_4_c_int
#endif
      !
      hipHostMalloc_r8_4_c_int = hipHostMalloc_b(cptr,length1*length2*length3*length4*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4])
    end function

                                                              
    function hipHostMalloc_r8_4_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:) :: ptr
      integer(c_size_t) :: shape(4)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r8_4_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r8_4_c_size_t_array
#endif
      !
      hipHostMalloc_r8_4_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_r8_4_c_size_t(ptr,length1,length2,length3,length4,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:) :: ptr
      integer(c_size_t),intent(in) :: length1,length2,length3,length4 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r8_4_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r8_4_c_size_t
#endif
      !
      hipHostMalloc_r8_4_c_size_t = hipHostMalloc_b(cptr,length1*length2*length3*length4*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4])
    end function

                                                              
    function hipHostMalloc_r8_5_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:,:) :: ptr
      integer(c_int) :: shape(5)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r8_5_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r8_5_c_int_array
#endif
      !
      hipHostMalloc_r8_5_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_r8_5_c_int(ptr,length1,length2,length3,length4,length5,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:,:) :: ptr
      integer(c_int),intent(in) :: length1,length2,length3,length4,length5 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r8_5_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r8_5_c_int
#endif
      !
      hipHostMalloc_r8_5_c_int = hipHostMalloc_b(cptr,length1*length2*length3*length4*length5*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5])
    end function

                                                              
    function hipHostMalloc_r8_5_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:,:) :: ptr
      integer(c_size_t) :: shape(5)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r8_5_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r8_5_c_size_t_array
#endif
      !
      hipHostMalloc_r8_5_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_r8_5_c_size_t(ptr,length1,length2,length3,length4,length5,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:,:) :: ptr
      integer(c_size_t),intent(in) :: length1,length2,length3,length4,length5 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r8_5_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r8_5_c_size_t
#endif
      !
      hipHostMalloc_r8_5_c_size_t = hipHostMalloc_b(cptr,length1*length2*length3*length4*length5*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5])
    end function

                                                              
    function hipHostMalloc_r8_6_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:,:,:) :: ptr
      integer(c_int) :: shape(6)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r8_6_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r8_6_c_int_array
#endif
      !
      hipHostMalloc_r8_6_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_r8_6_c_int(ptr,length1,length2,length3,length4,length5,length6,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:,:,:) :: ptr
      integer(c_int),intent(in) :: length1,length2,length3,length4,length5,length6 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r8_6_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r8_6_c_int
#endif
      !
      hipHostMalloc_r8_6_c_int = hipHostMalloc_b(cptr,length1*length2*length3*length4*length5*length6*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6])
    end function

                                                              
    function hipHostMalloc_r8_6_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:,:,:) :: ptr
      integer(c_size_t) :: shape(6)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r8_6_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r8_6_c_size_t_array
#endif
      !
      hipHostMalloc_r8_6_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_r8_6_c_size_t(ptr,length1,length2,length3,length4,length5,length6,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:,:,:) :: ptr
      integer(c_size_t),intent(in) :: length1,length2,length3,length4,length5,length6 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r8_6_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r8_6_c_size_t
#endif
      !
      hipHostMalloc_r8_6_c_size_t = hipHostMalloc_b(cptr,length1*length2*length3*length4*length5*length6*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6])
    end function

                                                              
    function hipHostMalloc_r8_7_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:,:,:,:) :: ptr
      integer(c_int) :: shape(7)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r8_7_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r8_7_c_int_array
#endif
      !
      hipHostMalloc_r8_7_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_r8_7_c_int(ptr,length1,length2,length3,length4,length5,length6,length7,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:,:,:,:) :: ptr
      integer(c_int),intent(in) :: length1,length2,length3,length4,length5,length6,length7 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r8_7_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r8_7_c_int
#endif
      !
      hipHostMalloc_r8_7_c_int = hipHostMalloc_b(cptr,length1*length2*length3*length4*length5*length6*length7*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6,length7])
    end function

                                                              
    function hipHostMalloc_r8_7_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:,:,:,:) :: ptr
      integer(c_size_t) :: shape(7)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r8_7_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r8_7_c_size_t_array
#endif
      !
      hipHostMalloc_r8_7_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_r8_7_c_size_t(ptr,length1,length2,length3,length4,length5,length6,length7,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:,:,:,:) :: ptr
      integer(c_size_t),intent(in) :: length1,length2,length3,length4,length5,length6,length7 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_r8_7_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_r8_7_c_size_t
#endif
      !
      hipHostMalloc_r8_7_c_size_t = hipHostMalloc_b(cptr,length1*length2*length3*length4*length5*length6*length7*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6,length7])
    end function

                                                              
    function hipHostMalloc_c4_1_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:) :: ptr
      integer(c_int) :: shape(1)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c4_1_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c4_1_c_int_array
#endif
      !
      hipHostMalloc_c4_1_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*2*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_c4_1_c_int(ptr,length1,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:) :: ptr
      integer(c_int),intent(in) :: length1 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c4_1_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c4_1_c_int
#endif
      !
      hipHostMalloc_c4_1_c_int = hipHostMalloc_b(cptr,length1*2*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1])
    end function

                                                              
    function hipHostMalloc_c4_1_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:) :: ptr
      integer(c_size_t) :: shape(1)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c4_1_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c4_1_c_size_t_array
#endif
      !
      hipHostMalloc_c4_1_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*2*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_c4_1_c_size_t(ptr,length1,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:) :: ptr
      integer(c_size_t),intent(in) :: length1 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c4_1_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c4_1_c_size_t
#endif
      !
      hipHostMalloc_c4_1_c_size_t = hipHostMalloc_b(cptr,length1*2*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1])
    end function

                                                              
    function hipHostMalloc_c4_2_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:) :: ptr
      integer(c_int) :: shape(2)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c4_2_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c4_2_c_int_array
#endif
      !
      hipHostMalloc_c4_2_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*2*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_c4_2_c_int(ptr,length1,length2,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:) :: ptr
      integer(c_int),intent(in) :: length1,length2 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c4_2_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c4_2_c_int
#endif
      !
      hipHostMalloc_c4_2_c_int = hipHostMalloc_b(cptr,length1*length2*2*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2])
    end function

                                                              
    function hipHostMalloc_c4_2_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:) :: ptr
      integer(c_size_t) :: shape(2)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c4_2_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c4_2_c_size_t_array
#endif
      !
      hipHostMalloc_c4_2_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*2*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_c4_2_c_size_t(ptr,length1,length2,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:) :: ptr
      integer(c_size_t),intent(in) :: length1,length2 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c4_2_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c4_2_c_size_t
#endif
      !
      hipHostMalloc_c4_2_c_size_t = hipHostMalloc_b(cptr,length1*length2*2*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2])
    end function

                                                              
    function hipHostMalloc_c4_3_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:) :: ptr
      integer(c_int) :: shape(3)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c4_3_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c4_3_c_int_array
#endif
      !
      hipHostMalloc_c4_3_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*2*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_c4_3_c_int(ptr,length1,length2,length3,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:) :: ptr
      integer(c_int),intent(in) :: length1,length2,length3 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c4_3_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c4_3_c_int
#endif
      !
      hipHostMalloc_c4_3_c_int = hipHostMalloc_b(cptr,length1*length2*length3*2*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3])
    end function

                                                              
    function hipHostMalloc_c4_3_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:) :: ptr
      integer(c_size_t) :: shape(3)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c4_3_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c4_3_c_size_t_array
#endif
      !
      hipHostMalloc_c4_3_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*2*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_c4_3_c_size_t(ptr,length1,length2,length3,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:) :: ptr
      integer(c_size_t),intent(in) :: length1,length2,length3 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c4_3_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c4_3_c_size_t
#endif
      !
      hipHostMalloc_c4_3_c_size_t = hipHostMalloc_b(cptr,length1*length2*length3*2*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3])
    end function

                                                              
    function hipHostMalloc_c4_4_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:) :: ptr
      integer(c_int) :: shape(4)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c4_4_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c4_4_c_int_array
#endif
      !
      hipHostMalloc_c4_4_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*2*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_c4_4_c_int(ptr,length1,length2,length3,length4,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:) :: ptr
      integer(c_int),intent(in) :: length1,length2,length3,length4 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c4_4_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c4_4_c_int
#endif
      !
      hipHostMalloc_c4_4_c_int = hipHostMalloc_b(cptr,length1*length2*length3*length4*2*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4])
    end function

                                                              
    function hipHostMalloc_c4_4_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:) :: ptr
      integer(c_size_t) :: shape(4)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c4_4_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c4_4_c_size_t_array
#endif
      !
      hipHostMalloc_c4_4_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*2*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_c4_4_c_size_t(ptr,length1,length2,length3,length4,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:) :: ptr
      integer(c_size_t),intent(in) :: length1,length2,length3,length4 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c4_4_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c4_4_c_size_t
#endif
      !
      hipHostMalloc_c4_4_c_size_t = hipHostMalloc_b(cptr,length1*length2*length3*length4*2*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4])
    end function

                                                              
    function hipHostMalloc_c4_5_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:,:) :: ptr
      integer(c_int) :: shape(5)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c4_5_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c4_5_c_int_array
#endif
      !
      hipHostMalloc_c4_5_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*2*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_c4_5_c_int(ptr,length1,length2,length3,length4,length5,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:,:) :: ptr
      integer(c_int),intent(in) :: length1,length2,length3,length4,length5 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c4_5_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c4_5_c_int
#endif
      !
      hipHostMalloc_c4_5_c_int = hipHostMalloc_b(cptr,length1*length2*length3*length4*length5*2*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5])
    end function

                                                              
    function hipHostMalloc_c4_5_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:,:) :: ptr
      integer(c_size_t) :: shape(5)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c4_5_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c4_5_c_size_t_array
#endif
      !
      hipHostMalloc_c4_5_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*2*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_c4_5_c_size_t(ptr,length1,length2,length3,length4,length5,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:,:) :: ptr
      integer(c_size_t),intent(in) :: length1,length2,length3,length4,length5 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c4_5_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c4_5_c_size_t
#endif
      !
      hipHostMalloc_c4_5_c_size_t = hipHostMalloc_b(cptr,length1*length2*length3*length4*length5*2*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5])
    end function

                                                              
    function hipHostMalloc_c4_6_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:,:,:) :: ptr
      integer(c_int) :: shape(6)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c4_6_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c4_6_c_int_array
#endif
      !
      hipHostMalloc_c4_6_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*2*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_c4_6_c_int(ptr,length1,length2,length3,length4,length5,length6,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:,:,:) :: ptr
      integer(c_int),intent(in) :: length1,length2,length3,length4,length5,length6 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c4_6_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c4_6_c_int
#endif
      !
      hipHostMalloc_c4_6_c_int = hipHostMalloc_b(cptr,length1*length2*length3*length4*length5*length6*2*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6])
    end function

                                                              
    function hipHostMalloc_c4_6_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:,:,:) :: ptr
      integer(c_size_t) :: shape(6)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c4_6_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c4_6_c_size_t_array
#endif
      !
      hipHostMalloc_c4_6_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*2*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_c4_6_c_size_t(ptr,length1,length2,length3,length4,length5,length6,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:,:,:) :: ptr
      integer(c_size_t),intent(in) :: length1,length2,length3,length4,length5,length6 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c4_6_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c4_6_c_size_t
#endif
      !
      hipHostMalloc_c4_6_c_size_t = hipHostMalloc_b(cptr,length1*length2*length3*length4*length5*length6*2*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6])
    end function

                                                              
    function hipHostMalloc_c4_7_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:,:,:,:) :: ptr
      integer(c_int) :: shape(7)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c4_7_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c4_7_c_int_array
#endif
      !
      hipHostMalloc_c4_7_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*2*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_c4_7_c_int(ptr,length1,length2,length3,length4,length5,length6,length7,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:,:,:,:) :: ptr
      integer(c_int),intent(in) :: length1,length2,length3,length4,length5,length6,length7 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c4_7_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c4_7_c_int
#endif
      !
      hipHostMalloc_c4_7_c_int = hipHostMalloc_b(cptr,length1*length2*length3*length4*length5*length6*length7*2*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6,length7])
    end function

                                                              
    function hipHostMalloc_c4_7_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:,:,:,:) :: ptr
      integer(c_size_t) :: shape(7)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c4_7_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c4_7_c_size_t_array
#endif
      !
      hipHostMalloc_c4_7_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*2*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_c4_7_c_size_t(ptr,length1,length2,length3,length4,length5,length6,length7,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:,:,:,:) :: ptr
      integer(c_size_t),intent(in) :: length1,length2,length3,length4,length5,length6,length7 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c4_7_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c4_7_c_size_t
#endif
      !
      hipHostMalloc_c4_7_c_size_t = hipHostMalloc_b(cptr,length1*length2*length3*length4*length5*length6*length7*2*4_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6,length7])
    end function

                                                              
    function hipHostMalloc_c8_1_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:) :: ptr
      integer(c_int) :: shape(1)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c8_1_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c8_1_c_int_array
#endif
      !
      hipHostMalloc_c8_1_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*2*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_c8_1_c_int(ptr,length1,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:) :: ptr
      integer(c_int),intent(in) :: length1 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c8_1_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c8_1_c_int
#endif
      !
      hipHostMalloc_c8_1_c_int = hipHostMalloc_b(cptr,length1*2*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1])
    end function

                                                              
    function hipHostMalloc_c8_1_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:) :: ptr
      integer(c_size_t) :: shape(1)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c8_1_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c8_1_c_size_t_array
#endif
      !
      hipHostMalloc_c8_1_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*2*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_c8_1_c_size_t(ptr,length1,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:) :: ptr
      integer(c_size_t),intent(in) :: length1 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c8_1_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c8_1_c_size_t
#endif
      !
      hipHostMalloc_c8_1_c_size_t = hipHostMalloc_b(cptr,length1*2*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1])
    end function

                                                              
    function hipHostMalloc_c8_2_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:) :: ptr
      integer(c_int) :: shape(2)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c8_2_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c8_2_c_int_array
#endif
      !
      hipHostMalloc_c8_2_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*2*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_c8_2_c_int(ptr,length1,length2,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:) :: ptr
      integer(c_int),intent(in) :: length1,length2 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c8_2_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c8_2_c_int
#endif
      !
      hipHostMalloc_c8_2_c_int = hipHostMalloc_b(cptr,length1*length2*2*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2])
    end function

                                                              
    function hipHostMalloc_c8_2_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:) :: ptr
      integer(c_size_t) :: shape(2)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c8_2_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c8_2_c_size_t_array
#endif
      !
      hipHostMalloc_c8_2_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*2*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_c8_2_c_size_t(ptr,length1,length2,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:) :: ptr
      integer(c_size_t),intent(in) :: length1,length2 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c8_2_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c8_2_c_size_t
#endif
      !
      hipHostMalloc_c8_2_c_size_t = hipHostMalloc_b(cptr,length1*length2*2*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2])
    end function

                                                              
    function hipHostMalloc_c8_3_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:) :: ptr
      integer(c_int) :: shape(3)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c8_3_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c8_3_c_int_array
#endif
      !
      hipHostMalloc_c8_3_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*2*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_c8_3_c_int(ptr,length1,length2,length3,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:) :: ptr
      integer(c_int),intent(in) :: length1,length2,length3 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c8_3_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c8_3_c_int
#endif
      !
      hipHostMalloc_c8_3_c_int = hipHostMalloc_b(cptr,length1*length2*length3*2*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3])
    end function

                                                              
    function hipHostMalloc_c8_3_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:) :: ptr
      integer(c_size_t) :: shape(3)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c8_3_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c8_3_c_size_t_array
#endif
      !
      hipHostMalloc_c8_3_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*2*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_c8_3_c_size_t(ptr,length1,length2,length3,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:) :: ptr
      integer(c_size_t),intent(in) :: length1,length2,length3 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c8_3_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c8_3_c_size_t
#endif
      !
      hipHostMalloc_c8_3_c_size_t = hipHostMalloc_b(cptr,length1*length2*length3*2*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3])
    end function

                                                              
    function hipHostMalloc_c8_4_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:) :: ptr
      integer(c_int) :: shape(4)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c8_4_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c8_4_c_int_array
#endif
      !
      hipHostMalloc_c8_4_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*2*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_c8_4_c_int(ptr,length1,length2,length3,length4,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:) :: ptr
      integer(c_int),intent(in) :: length1,length2,length3,length4 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c8_4_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c8_4_c_int
#endif
      !
      hipHostMalloc_c8_4_c_int = hipHostMalloc_b(cptr,length1*length2*length3*length4*2*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4])
    end function

                                                              
    function hipHostMalloc_c8_4_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:) :: ptr
      integer(c_size_t) :: shape(4)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c8_4_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c8_4_c_size_t_array
#endif
      !
      hipHostMalloc_c8_4_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*2*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_c8_4_c_size_t(ptr,length1,length2,length3,length4,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:) :: ptr
      integer(c_size_t),intent(in) :: length1,length2,length3,length4 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c8_4_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c8_4_c_size_t
#endif
      !
      hipHostMalloc_c8_4_c_size_t = hipHostMalloc_b(cptr,length1*length2*length3*length4*2*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4])
    end function

                                                              
    function hipHostMalloc_c8_5_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:,:) :: ptr
      integer(c_int) :: shape(5)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c8_5_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c8_5_c_int_array
#endif
      !
      hipHostMalloc_c8_5_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*2*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_c8_5_c_int(ptr,length1,length2,length3,length4,length5,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:,:) :: ptr
      integer(c_int),intent(in) :: length1,length2,length3,length4,length5 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c8_5_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c8_5_c_int
#endif
      !
      hipHostMalloc_c8_5_c_int = hipHostMalloc_b(cptr,length1*length2*length3*length4*length5*2*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5])
    end function

                                                              
    function hipHostMalloc_c8_5_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:,:) :: ptr
      integer(c_size_t) :: shape(5)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c8_5_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c8_5_c_size_t_array
#endif
      !
      hipHostMalloc_c8_5_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*2*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_c8_5_c_size_t(ptr,length1,length2,length3,length4,length5,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:,:) :: ptr
      integer(c_size_t),intent(in) :: length1,length2,length3,length4,length5 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c8_5_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c8_5_c_size_t
#endif
      !
      hipHostMalloc_c8_5_c_size_t = hipHostMalloc_b(cptr,length1*length2*length3*length4*length5*2*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5])
    end function

                                                              
    function hipHostMalloc_c8_6_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:,:,:) :: ptr
      integer(c_int) :: shape(6)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c8_6_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c8_6_c_int_array
#endif
      !
      hipHostMalloc_c8_6_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*2*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_c8_6_c_int(ptr,length1,length2,length3,length4,length5,length6,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:,:,:) :: ptr
      integer(c_int),intent(in) :: length1,length2,length3,length4,length5,length6 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c8_6_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c8_6_c_int
#endif
      !
      hipHostMalloc_c8_6_c_int = hipHostMalloc_b(cptr,length1*length2*length3*length4*length5*length6*2*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6])
    end function

                                                              
    function hipHostMalloc_c8_6_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:,:,:) :: ptr
      integer(c_size_t) :: shape(6)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c8_6_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c8_6_c_size_t_array
#endif
      !
      hipHostMalloc_c8_6_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*2*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_c8_6_c_size_t(ptr,length1,length2,length3,length4,length5,length6,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:,:,:) :: ptr
      integer(c_size_t),intent(in) :: length1,length2,length3,length4,length5,length6 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c8_6_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c8_6_c_size_t
#endif
      !
      hipHostMalloc_c8_6_c_size_t = hipHostMalloc_b(cptr,length1*length2*length3*length4*length5*length6*2*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6])
    end function

                                                              
    function hipHostMalloc_c8_7_c_int_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:,:,:,:) :: ptr
      integer(c_int) :: shape(7)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c8_7_c_int_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c8_7_c_int_array
#endif
      !
      hipHostMalloc_c8_7_c_int_array = hipHostMalloc_b(cptr,PRODUCT(shape)*2*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_c8_7_c_int(ptr,length1,length2,length3,length4,length5,length6,length7,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:,:,:,:) :: ptr
      integer(c_int),intent(in) :: length1,length2,length3,length4,length5,length6,length7 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c8_7_c_int 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c8_7_c_int
#endif
      !
      hipHostMalloc_c8_7_c_int = hipHostMalloc_b(cptr,length1*length2*length3*length4*length5*length6*length7*2*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6,length7])
    end function

                                                              
    function hipHostMalloc_c8_7_c_size_t_array(ptr,shape,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:,:,:,:) :: ptr
      integer(c_size_t) :: shape(7)
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c8_7_c_size_t_array
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c8_7_c_size_t_array
#endif
      !
      hipHostMalloc_c8_7_c_size_t_array = hipHostMalloc_b(cptr,PRODUCT(shape)*2*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=shape)
    end function
    
    function hipHostMalloc_c8_7_c_size_t(ptr,length1,length2,length3,length4,length5,length6,length7,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:,:,:,:) :: ptr
      integer(c_size_t),intent(in) :: length1,length2,length3,length4,length5,length6,length7 
      integer(kind=4) :: flags
      type(c_ptr) :: cptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostMalloc_c8_7_c_size_t 
#else
      integer(kind(hipSuccess)) :: hipHostMalloc_c8_7_c_size_t
#endif
      !
      hipHostMalloc_c8_7_c_size_t = hipHostMalloc_b(cptr,length1*length2*length3*length4*length5*length6*length7*2*8_8,flags)
      call c_f_pointer(cptr,ptr,SHAPE=[length1,length2,length3,length4,length5,length6,length7])
    end function


                                        
    function hipFree_i4_1(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_i4_1 
#else
      integer(kind(hipSuccess)) :: hipFree_i4_1
#endif
      !
      hipFree_i4_1 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_i4_2(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_i4_2 
#else
      integer(kind(hipSuccess)) :: hipFree_i4_2
#endif
      !
      hipFree_i4_2 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_i4_3(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_i4_3 
#else
      integer(kind(hipSuccess)) :: hipFree_i4_3
#endif
      !
      hipFree_i4_3 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_i4_4(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_i4_4 
#else
      integer(kind(hipSuccess)) :: hipFree_i4_4
#endif
      !
      hipFree_i4_4 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_i4_5(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_i4_5 
#else
      integer(kind(hipSuccess)) :: hipFree_i4_5
#endif
      !
      hipFree_i4_5 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_i4_6(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_i4_6 
#else
      integer(kind(hipSuccess)) :: hipFree_i4_6
#endif
      !
      hipFree_i4_6 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_i4_7(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_i4_7 
#else
      integer(kind(hipSuccess)) :: hipFree_i4_7
#endif
      !
      hipFree_i4_7 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_i8_1(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_i8_1 
#else
      integer(kind(hipSuccess)) :: hipFree_i8_1
#endif
      !
      hipFree_i8_1 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_i8_2(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_i8_2 
#else
      integer(kind(hipSuccess)) :: hipFree_i8_2
#endif
      !
      hipFree_i8_2 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_i8_3(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_i8_3 
#else
      integer(kind(hipSuccess)) :: hipFree_i8_3
#endif
      !
      hipFree_i8_3 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_i8_4(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_i8_4 
#else
      integer(kind(hipSuccess)) :: hipFree_i8_4
#endif
      !
      hipFree_i8_4 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_i8_5(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_i8_5 
#else
      integer(kind(hipSuccess)) :: hipFree_i8_5
#endif
      !
      hipFree_i8_5 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_i8_6(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_i8_6 
#else
      integer(kind(hipSuccess)) :: hipFree_i8_6
#endif
      !
      hipFree_i8_6 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_i8_7(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_i8_7 
#else
      integer(kind(hipSuccess)) :: hipFree_i8_7
#endif
      !
      hipFree_i8_7 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_r4_1(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_r4_1 
#else
      integer(kind(hipSuccess)) :: hipFree_r4_1
#endif
      !
      hipFree_r4_1 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_r4_2(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_r4_2 
#else
      integer(kind(hipSuccess)) :: hipFree_r4_2
#endif
      !
      hipFree_r4_2 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_r4_3(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_r4_3 
#else
      integer(kind(hipSuccess)) :: hipFree_r4_3
#endif
      !
      hipFree_r4_3 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_r4_4(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_r4_4 
#else
      integer(kind(hipSuccess)) :: hipFree_r4_4
#endif
      !
      hipFree_r4_4 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_r4_5(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_r4_5 
#else
      integer(kind(hipSuccess)) :: hipFree_r4_5
#endif
      !
      hipFree_r4_5 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_r4_6(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_r4_6 
#else
      integer(kind(hipSuccess)) :: hipFree_r4_6
#endif
      !
      hipFree_r4_6 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_r4_7(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_r4_7 
#else
      integer(kind(hipSuccess)) :: hipFree_r4_7
#endif
      !
      hipFree_r4_7 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_r8_1(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_r8_1 
#else
      integer(kind(hipSuccess)) :: hipFree_r8_1
#endif
      !
      hipFree_r8_1 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_r8_2(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_r8_2 
#else
      integer(kind(hipSuccess)) :: hipFree_r8_2
#endif
      !
      hipFree_r8_2 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_r8_3(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_r8_3 
#else
      integer(kind(hipSuccess)) :: hipFree_r8_3
#endif
      !
      hipFree_r8_3 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_r8_4(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_r8_4 
#else
      integer(kind(hipSuccess)) :: hipFree_r8_4
#endif
      !
      hipFree_r8_4 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_r8_5(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_r8_5 
#else
      integer(kind(hipSuccess)) :: hipFree_r8_5
#endif
      !
      hipFree_r8_5 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_r8_6(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_r8_6 
#else
      integer(kind(hipSuccess)) :: hipFree_r8_6
#endif
      !
      hipFree_r8_6 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_r8_7(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_r8_7 
#else
      integer(kind(hipSuccess)) :: hipFree_r8_7
#endif
      !
      hipFree_r8_7 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_c4_1(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_c4_1 
#else
      integer(kind(hipSuccess)) :: hipFree_c4_1
#endif
      !
      hipFree_c4_1 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_c4_2(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_c4_2 
#else
      integer(kind(hipSuccess)) :: hipFree_c4_2
#endif
      !
      hipFree_c4_2 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_c4_3(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_c4_3 
#else
      integer(kind(hipSuccess)) :: hipFree_c4_3
#endif
      !
      hipFree_c4_3 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_c4_4(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_c4_4 
#else
      integer(kind(hipSuccess)) :: hipFree_c4_4
#endif
      !
      hipFree_c4_4 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_c4_5(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_c4_5 
#else
      integer(kind(hipSuccess)) :: hipFree_c4_5
#endif
      !
      hipFree_c4_5 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_c4_6(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_c4_6 
#else
      integer(kind(hipSuccess)) :: hipFree_c4_6
#endif
      !
      hipFree_c4_6 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_c4_7(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_c4_7 
#else
      integer(kind(hipSuccess)) :: hipFree_c4_7
#endif
      !
      hipFree_c4_7 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_c8_1(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_c8_1 
#else
      integer(kind(hipSuccess)) :: hipFree_c8_1
#endif
      !
      hipFree_c8_1 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_c8_2(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_c8_2 
#else
      integer(kind(hipSuccess)) :: hipFree_c8_2
#endif
      !
      hipFree_c8_2 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_c8_3(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_c8_3 
#else
      integer(kind(hipSuccess)) :: hipFree_c8_3
#endif
      !
      hipFree_c8_3 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_c8_4(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_c8_4 
#else
      integer(kind(hipSuccess)) :: hipFree_c8_4
#endif
      !
      hipFree_c8_4 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_c8_5(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_c8_5 
#else
      integer(kind(hipSuccess)) :: hipFree_c8_5
#endif
      !
      hipFree_c8_5 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_c8_6(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_c8_6 
#else
      integer(kind(hipSuccess)) :: hipFree_c8_6
#endif
      !
      hipFree_c8_6 = hipFree_b(c_loc(ptr))
    end function
                                        
    function hipFree_c8_7(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipFree_c8_7 
#else
      integer(kind(hipSuccess)) :: hipFree_c8_7
#endif
      !
      hipFree_c8_7 = hipFree_b(c_loc(ptr))
    end function
    
                                        
    function hipHostFree_i4_1(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_i4_1 
#else
      integer(kind(hipSuccess)) :: hipHostFree_i4_1
#endif
      !
      hipHostFree_i4_1 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_i4_2(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_i4_2 
#else
      integer(kind(hipSuccess)) :: hipHostFree_i4_2
#endif
      !
      hipHostFree_i4_2 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_i4_3(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_i4_3 
#else
      integer(kind(hipSuccess)) :: hipHostFree_i4_3
#endif
      !
      hipHostFree_i4_3 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_i4_4(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_i4_4 
#else
      integer(kind(hipSuccess)) :: hipHostFree_i4_4
#endif
      !
      hipHostFree_i4_4 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_i4_5(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_i4_5 
#else
      integer(kind(hipSuccess)) :: hipHostFree_i4_5
#endif
      !
      hipHostFree_i4_5 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_i4_6(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_i4_6 
#else
      integer(kind(hipSuccess)) :: hipHostFree_i4_6
#endif
      !
      hipHostFree_i4_6 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_i4_7(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_i4_7 
#else
      integer(kind(hipSuccess)) :: hipHostFree_i4_7
#endif
      !
      hipHostFree_i4_7 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_i8_1(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_i8_1 
#else
      integer(kind(hipSuccess)) :: hipHostFree_i8_1
#endif
      !
      hipHostFree_i8_1 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_i8_2(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_i8_2 
#else
      integer(kind(hipSuccess)) :: hipHostFree_i8_2
#endif
      !
      hipHostFree_i8_2 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_i8_3(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_i8_3 
#else
      integer(kind(hipSuccess)) :: hipHostFree_i8_3
#endif
      !
      hipHostFree_i8_3 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_i8_4(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_i8_4 
#else
      integer(kind(hipSuccess)) :: hipHostFree_i8_4
#endif
      !
      hipHostFree_i8_4 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_i8_5(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_i8_5 
#else
      integer(kind(hipSuccess)) :: hipHostFree_i8_5
#endif
      !
      hipHostFree_i8_5 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_i8_6(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_i8_6 
#else
      integer(kind(hipSuccess)) :: hipHostFree_i8_6
#endif
      !
      hipHostFree_i8_6 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_i8_7(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_i8_7 
#else
      integer(kind(hipSuccess)) :: hipHostFree_i8_7
#endif
      !
      hipHostFree_i8_7 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_r4_1(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_r4_1 
#else
      integer(kind(hipSuccess)) :: hipHostFree_r4_1
#endif
      !
      hipHostFree_r4_1 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_r4_2(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_r4_2 
#else
      integer(kind(hipSuccess)) :: hipHostFree_r4_2
#endif
      !
      hipHostFree_r4_2 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_r4_3(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_r4_3 
#else
      integer(kind(hipSuccess)) :: hipHostFree_r4_3
#endif
      !
      hipHostFree_r4_3 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_r4_4(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_r4_4 
#else
      integer(kind(hipSuccess)) :: hipHostFree_r4_4
#endif
      !
      hipHostFree_r4_4 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_r4_5(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_r4_5 
#else
      integer(kind(hipSuccess)) :: hipHostFree_r4_5
#endif
      !
      hipHostFree_r4_5 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_r4_6(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_r4_6 
#else
      integer(kind(hipSuccess)) :: hipHostFree_r4_6
#endif
      !
      hipHostFree_r4_6 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_r4_7(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_r4_7 
#else
      integer(kind(hipSuccess)) :: hipHostFree_r4_7
#endif
      !
      hipHostFree_r4_7 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_r8_1(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_r8_1 
#else
      integer(kind(hipSuccess)) :: hipHostFree_r8_1
#endif
      !
      hipHostFree_r8_1 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_r8_2(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_r8_2 
#else
      integer(kind(hipSuccess)) :: hipHostFree_r8_2
#endif
      !
      hipHostFree_r8_2 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_r8_3(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_r8_3 
#else
      integer(kind(hipSuccess)) :: hipHostFree_r8_3
#endif
      !
      hipHostFree_r8_3 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_r8_4(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_r8_4 
#else
      integer(kind(hipSuccess)) :: hipHostFree_r8_4
#endif
      !
      hipHostFree_r8_4 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_r8_5(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_r8_5 
#else
      integer(kind(hipSuccess)) :: hipHostFree_r8_5
#endif
      !
      hipHostFree_r8_5 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_r8_6(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_r8_6 
#else
      integer(kind(hipSuccess)) :: hipHostFree_r8_6
#endif
      !
      hipHostFree_r8_6 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_r8_7(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_r8_7 
#else
      integer(kind(hipSuccess)) :: hipHostFree_r8_7
#endif
      !
      hipHostFree_r8_7 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_c4_1(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_c4_1 
#else
      integer(kind(hipSuccess)) :: hipHostFree_c4_1
#endif
      !
      hipHostFree_c4_1 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_c4_2(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_c4_2 
#else
      integer(kind(hipSuccess)) :: hipHostFree_c4_2
#endif
      !
      hipHostFree_c4_2 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_c4_3(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_c4_3 
#else
      integer(kind(hipSuccess)) :: hipHostFree_c4_3
#endif
      !
      hipHostFree_c4_3 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_c4_4(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_c4_4 
#else
      integer(kind(hipSuccess)) :: hipHostFree_c4_4
#endif
      !
      hipHostFree_c4_4 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_c4_5(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_c4_5 
#else
      integer(kind(hipSuccess)) :: hipHostFree_c4_5
#endif
      !
      hipHostFree_c4_5 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_c4_6(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_c4_6 
#else
      integer(kind(hipSuccess)) :: hipHostFree_c4_6
#endif
      !
      hipHostFree_c4_6 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_c4_7(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_c4_7 
#else
      integer(kind(hipSuccess)) :: hipHostFree_c4_7
#endif
      !
      hipHostFree_c4_7 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_c8_1(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_c8_1 
#else
      integer(kind(hipSuccess)) :: hipHostFree_c8_1
#endif
      !
      hipHostFree_c8_1 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_c8_2(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_c8_2 
#else
      integer(kind(hipSuccess)) :: hipHostFree_c8_2
#endif
      !
      hipHostFree_c8_2 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_c8_3(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_c8_3 
#else
      integer(kind(hipSuccess)) :: hipHostFree_c8_3
#endif
      !
      hipHostFree_c8_3 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_c8_4(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_c8_4 
#else
      integer(kind(hipSuccess)) :: hipHostFree_c8_4
#endif
      !
      hipHostFree_c8_4 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_c8_5(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_c8_5 
#else
      integer(kind(hipSuccess)) :: hipHostFree_c8_5
#endif
      !
      hipHostFree_c8_5 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_c8_6(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_c8_6 
#else
      integer(kind(hipSuccess)) :: hipHostFree_c8_6
#endif
      !
      hipHostFree_c8_6 = hipHostFree_b(c_loc(ptr))
    end function
                                        
    function hipHostFree_c8_7(ptr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:,:,:,:) :: ptr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostFree_c8_7 
#else
      integer(kind(hipSuccess)) :: hipHostFree_c8_7
#endif
      !
      hipHostFree_c8_7 = hipHostFree_b(c_loc(ptr))
    end function

end module