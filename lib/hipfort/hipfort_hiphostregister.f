!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! ==============================================================================
! hipfort: FORTRAN Interfaces for GPU kernels
! ==============================================================================
! Copyright (c) 2021 Advanced Micro Devices, Inc. All rights reserved.
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
  
  !> 
  !>    @brief Register host memory so it can be accessed from the current device.
  !>  
  !>    @param[out] hostPtr Pointer to host memory to be registered.
  !>    @param[in] sizeBytes size of the host memory
  !>    @param[in] flags.  See below.
  !>  
  !>    Flags:
  !>    - #hipHostRegisterDefault   Memory is Mapped and Portable
  !>    - #hipHostRegisterPortable  Memory is considered registered by all contexts.  HIP only supports
  !>   one context so this is always assumed true.
  !>    - #hipHostRegisterMapped    Map the allocation into the address space for the current device.
  !>   The device pointer can be obtained with #hipHostGetDevicePointer.
  !>  
  !>  
  !>    After registering the memory, use #hipHostGetDevicePointer to obtain the mapped device pointer.
  !>    On many systems, the mapped device pointer will have a different value than the mapped host
  !>   pointer.  Applications must use the device pointer in device code, and the host pointer in device
  !>   code.
  !>  
  !>    On some systems, registered memory is pinned.  On some systems, registered memory may not be
  !>   actually be pinned but uses OS or hardware facilities to all GPU access to the host memory.
  !>  
  !>    Developers are strongly encouraged to register memory blocks which are aligned to the host
  !>   cache-line size. (typically 64-bytes but can be obtains from the CPUID instruction).
  !>  
  !>    If registering non-aligned pointers, the application must take care when register pointers from
  !>   the same cache line on different devices.  HIP's coarse-grained synchronization model does not
  !>   guarantee correct results if different devices write to different parts of the same cache block -
  !>   typically one of the writes will "win" and overwrite data from the other registered memory
  !>   region.
  !>  
  !>    @return #hipSuccess, #hipErrorOutOfMemory
  !>  
  !>    @see hipHostUnregister, hipHostGetFlags, hipHostGetDevicePointer
  !>  
  interface hipHostRegister
#ifdef USE_CUDA_NAMES
    function hipHostRegister_b(hostPtr,sizeBytes,flags) bind(c, name="cudaHostRegister")
#else
    function hipHostRegister_b(hostPtr,sizeBytes,flags) bind(c, name="hipHostRegister")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_b
#else
      integer(kind(hipSuccess)) :: hipHostRegister_b
#endif
      type(c_ptr),value :: hostPtr
      integer(c_size_t),value :: sizeBytes
      integer(kind=4),value :: flags
    end function
#ifdef USE_FPOINTER_INTERFACES
    module procedure hipHostRegister_l_0,hipHostRegister_l_1,hipHostRegister_l_2,hipHostRegister_l_3,hipHostRegister_l_4,hipHostRegister_l_5,hipHostRegister_l_6,hipHostRegister_l_7,hipHostRegister_i4_0,hipHostRegister_i4_1,hipHostRegister_i4_2,hipHostRegister_i4_3,hipHostRegister_i4_4,hipHostRegister_i4_5,hipHostRegister_i4_6,hipHostRegister_i4_7,hipHostRegister_i8_0,hipHostRegister_i8_1,hipHostRegister_i8_2,hipHostRegister_i8_3,hipHostRegister_i8_4,hipHostRegister_i8_5,hipHostRegister_i8_6,hipHostRegister_i8_7,hipHostRegister_r4_0,hipHostRegister_r4_1,hipHostRegister_r4_2,hipHostRegister_r4_3,hipHostRegister_r4_4,hipHostRegister_r4_5,hipHostRegister_r4_6,hipHostRegister_r4_7,hipHostRegister_r8_0,hipHostRegister_r8_1,hipHostRegister_r8_2,hipHostRegister_r8_3,hipHostRegister_r8_4,hipHostRegister_r8_5,hipHostRegister_r8_6,hipHostRegister_r8_7,hipHostRegister_c4_0,hipHostRegister_c4_1,hipHostRegister_c4_2,hipHostRegister_c4_3,hipHostRegister_c4_4,hipHostRegister_c4_5,hipHostRegister_c4_6,hipHostRegister_c4_7,hipHostRegister_c8_0,hipHostRegister_c8_1,hipHostRegister_c8_2,hipHostRegister_c8_3,hipHostRegister_c8_4,hipHostRegister_c8_5,hipHostRegister_c8_6,hipHostRegister_c8_7 
#endif
  end interface

  !> 
  !>    @brief Un-register host pointer
  !>  
  !>    @param[in] hostPtr Host pointer previously registered with #hipHostRegister
  !>    @return Error code
  !>  
  !>    @see hipHostRegister
  !>  
  interface hipHostUnregister
#ifdef USE_CUDA_NAMES
    function hipHostUnregister_b(hostPtr) bind(c, name="cudaHostUnregister")
#else
    function hipHostUnregister_b(hostPtr) bind(c, name="hipHostUnregister")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_b
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_b
#endif
      type(c_ptr),value :: hostPtr
    end function
#ifdef USE_FPOINTER_INTERFACES
    module procedure hipHostUnregister_l_0,hipHostUnregister_l_1,hipHostUnregister_l_2,hipHostUnregister_l_3,hipHostUnregister_l_4,hipHostUnregister_l_5,hipHostUnregister_l_6,hipHostUnregister_l_7,hipHostUnregister_i4_0,hipHostUnregister_i4_1,hipHostUnregister_i4_2,hipHostUnregister_i4_3,hipHostUnregister_i4_4,hipHostUnregister_i4_5,hipHostUnregister_i4_6,hipHostUnregister_i4_7,hipHostUnregister_i8_0,hipHostUnregister_i8_1,hipHostUnregister_i8_2,hipHostUnregister_i8_3,hipHostUnregister_i8_4,hipHostUnregister_i8_5,hipHostUnregister_i8_6,hipHostUnregister_i8_7,hipHostUnregister_r4_0,hipHostUnregister_r4_1,hipHostUnregister_r4_2,hipHostUnregister_r4_3,hipHostUnregister_r4_4,hipHostUnregister_r4_5,hipHostUnregister_r4_6,hipHostUnregister_r4_7,hipHostUnregister_r8_0,hipHostUnregister_r8_1,hipHostUnregister_r8_2,hipHostUnregister_r8_3,hipHostUnregister_r8_4,hipHostUnregister_r8_5,hipHostUnregister_r8_6,hipHostUnregister_r8_7,hipHostUnregister_c4_0,hipHostUnregister_c4_1,hipHostUnregister_c4_2,hipHostUnregister_c4_3,hipHostUnregister_c4_4,hipHostUnregister_c4_5,hipHostUnregister_c4_6,hipHostUnregister_c4_7,hipHostUnregister_c8_0,hipHostUnregister_c8_1,hipHostUnregister_c8_2,hipHostUnregister_c8_3,hipHostUnregister_c8_4,hipHostUnregister_c8_5,hipHostUnregister_c8_6,hipHostUnregister_c8_7 
#endif
  end interface

  !> 
  !>    @brief Get Device pointer from Host Pointer allocated through hipHostMalloc
  !>  
  !>    @param[out] dstPtr Device Pointer mapped to passed host pointer
  !>    @param[in]  hstPtr Host Pointer allocated through hipHostMalloc
  !>    @param[in]  flags Flags to be passed for extension
  !>  
  !>    @return #hipSuccess, #hipErrorInvalidValue, #hipErrorOutOfMemory
  !>  
  !>    @see hipSetDeviceFlags, hipHostMalloc
  !>  
  interface hipHostGetDevicePointer
#ifdef USE_CUDA_NAMES
    function hipHostGetDevicePointer_b(devPtr,hstPtr,flags) bind(c, name="cudaHostGetDevicePointer")
#else
    function hipHostGetDevicePointer_b(devPtr,hstPtr,flags) bind(c, name="hipHostGetDevicePointer")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_b
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_b
#endif
      type(c_ptr) :: devPtr
      type(c_ptr),value :: hstPtr
      integer(kind=4),value :: flags
    end function
#ifdef USE_FPOINTER_INTERFACES
    module procedure hipHostGetDevicePointer_l_0,hipHostGetDevicePointer_l_1,hipHostGetDevicePointer_l_2,hipHostGetDevicePointer_l_3,hipHostGetDevicePointer_l_4,hipHostGetDevicePointer_l_5,hipHostGetDevicePointer_l_6,hipHostGetDevicePointer_l_7,hipHostGetDevicePointer_i4_0,hipHostGetDevicePointer_i4_1,hipHostGetDevicePointer_i4_2,hipHostGetDevicePointer_i4_3,hipHostGetDevicePointer_i4_4,hipHostGetDevicePointer_i4_5,hipHostGetDevicePointer_i4_6,hipHostGetDevicePointer_i4_7,hipHostGetDevicePointer_i8_0,hipHostGetDevicePointer_i8_1,hipHostGetDevicePointer_i8_2,hipHostGetDevicePointer_i8_3,hipHostGetDevicePointer_i8_4,hipHostGetDevicePointer_i8_5,hipHostGetDevicePointer_i8_6,hipHostGetDevicePointer_i8_7,hipHostGetDevicePointer_r4_0,hipHostGetDevicePointer_r4_1,hipHostGetDevicePointer_r4_2,hipHostGetDevicePointer_r4_3,hipHostGetDevicePointer_r4_4,hipHostGetDevicePointer_r4_5,hipHostGetDevicePointer_r4_6,hipHostGetDevicePointer_r4_7,hipHostGetDevicePointer_r8_0,hipHostGetDevicePointer_r8_1,hipHostGetDevicePointer_r8_2,hipHostGetDevicePointer_r8_3,hipHostGetDevicePointer_r8_4,hipHostGetDevicePointer_r8_5,hipHostGetDevicePointer_r8_6,hipHostGetDevicePointer_r8_7,hipHostGetDevicePointer_c4_0,hipHostGetDevicePointer_c4_1,hipHostGetDevicePointer_c4_2,hipHostGetDevicePointer_c4_3,hipHostGetDevicePointer_c4_4,hipHostGetDevicePointer_c4_5,hipHostGetDevicePointer_c4_6,hipHostGetDevicePointer_c4_7,hipHostGetDevicePointer_c8_0,hipHostGetDevicePointer_c8_1,hipHostGetDevicePointer_c8_2,hipHostGetDevicePointer_c8_3,hipHostGetDevicePointer_c8_4,hipHostGetDevicePointer_c8_5,hipHostGetDevicePointer_c8_6,hipHostGetDevicePointer_c8_7 
#endif
  end interface

#ifdef USE_FPOINTER_INTERFACES
  contains


                                        
    function hipHostUnregister_l_0(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      logical,target :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_l_0 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_l_0
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_l_0 = cudaSuccess
#else
      hipHostUnregister_l_0 = hipSuccess
#endif
      hipHostUnregister_l_0 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_l_0(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      logical,target :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_l_0 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_l_0
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_l_0 = cudaSuccess
#else
      hipHostRegister_l_0 = hipSuccess
#endif
      hipHostRegister_l_0 = hipHostRegister_b(c_loc(hostPtr),1_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_l_0(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      logical,pointer,intent(inout) :: devPtr
      logical,target                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_l_0 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_l_0
#endif
      !
      type(c_ptr) :: cptr
      logical,pointer :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_l_0 = cudaSuccess
#else
      hipHostGetDevicePointer_l_0 = hipSuccess
#endif
      hipHostGetDevicePointer_l_0 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,devPtr)
    end function


                                        
    function hipHostUnregister_l_1(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      logical,target,dimension(:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_l_1 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_l_1
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_l_1 = cudaSuccess
#else
      hipHostUnregister_l_1 = hipSuccess
#endif
      hipHostUnregister_l_1 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_l_1(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      logical,target,dimension(:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_l_1 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_l_1
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_l_1 = cudaSuccess
#else
      hipHostRegister_l_1 = hipSuccess
#endif
      hipHostRegister_l_1 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*1_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_l_1(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      logical,pointer,dimension(:),intent(inout) :: devPtr
      logical,target,dimension(:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_l_1 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_l_1
#endif
      !
      type(c_ptr) :: cptr
      logical,pointer,dimension(:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_l_1 = cudaSuccess
#else
      hipHostGetDevicePointer_l_1 = hipSuccess
#endif
      hipHostGetDevicePointer_l_1 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):) => tmp
    end function


                                        
    function hipHostUnregister_l_2(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      logical,target,dimension(:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_l_2 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_l_2
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_l_2 = cudaSuccess
#else
      hipHostUnregister_l_2 = hipSuccess
#endif
      hipHostUnregister_l_2 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_l_2(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      logical,target,dimension(:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_l_2 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_l_2
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_l_2 = cudaSuccess
#else
      hipHostRegister_l_2 = hipSuccess
#endif
      hipHostRegister_l_2 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*1_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_l_2(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      logical,pointer,dimension(:,:),intent(inout) :: devPtr
      logical,target,dimension(:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_l_2 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_l_2
#endif
      !
      type(c_ptr) :: cptr
      logical,pointer,dimension(:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_l_2 = cudaSuccess
#else
      hipHostGetDevicePointer_l_2 = hipSuccess
#endif
      hipHostGetDevicePointer_l_2 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):) => tmp
    end function


                                        
    function hipHostUnregister_l_3(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      logical,target,dimension(:,:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_l_3 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_l_3
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_l_3 = cudaSuccess
#else
      hipHostUnregister_l_3 = hipSuccess
#endif
      hipHostUnregister_l_3 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_l_3(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      logical,target,dimension(:,:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_l_3 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_l_3
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_l_3 = cudaSuccess
#else
      hipHostRegister_l_3 = hipSuccess
#endif
      hipHostRegister_l_3 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*1_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_l_3(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      logical,pointer,dimension(:,:,:),intent(inout) :: devPtr
      logical,target,dimension(:,:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_l_3 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_l_3
#endif
      !
      type(c_ptr) :: cptr
      logical,pointer,dimension(:,:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_l_3 = cudaSuccess
#else
      hipHostGetDevicePointer_l_3 = hipSuccess
#endif
      hipHostGetDevicePointer_l_3 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):,LBOUND(hstPtr,3):) => tmp
    end function


                                        
    function hipHostUnregister_l_4(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      logical,target,dimension(:,:,:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_l_4 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_l_4
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_l_4 = cudaSuccess
#else
      hipHostUnregister_l_4 = hipSuccess
#endif
      hipHostUnregister_l_4 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_l_4(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      logical,target,dimension(:,:,:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_l_4 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_l_4
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_l_4 = cudaSuccess
#else
      hipHostRegister_l_4 = hipSuccess
#endif
      hipHostRegister_l_4 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*1_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_l_4(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      logical,pointer,dimension(:,:,:,:),intent(inout) :: devPtr
      logical,target,dimension(:,:,:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_l_4 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_l_4
#endif
      !
      type(c_ptr) :: cptr
      logical,pointer,dimension(:,:,:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_l_4 = cudaSuccess
#else
      hipHostGetDevicePointer_l_4 = hipSuccess
#endif
      hipHostGetDevicePointer_l_4 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):,LBOUND(hstPtr,3):,LBOUND(hstPtr,4):) => tmp
    end function


                                        
    function hipHostUnregister_l_5(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      logical,target,dimension(:,:,:,:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_l_5 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_l_5
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_l_5 = cudaSuccess
#else
      hipHostUnregister_l_5 = hipSuccess
#endif
      hipHostUnregister_l_5 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_l_5(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      logical,target,dimension(:,:,:,:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_l_5 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_l_5
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_l_5 = cudaSuccess
#else
      hipHostRegister_l_5 = hipSuccess
#endif
      hipHostRegister_l_5 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*1_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_l_5(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      logical,pointer,dimension(:,:,:,:,:),intent(inout) :: devPtr
      logical,target,dimension(:,:,:,:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_l_5 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_l_5
#endif
      !
      type(c_ptr) :: cptr
      logical,pointer,dimension(:,:,:,:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_l_5 = cudaSuccess
#else
      hipHostGetDevicePointer_l_5 = hipSuccess
#endif
      hipHostGetDevicePointer_l_5 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):,LBOUND(hstPtr,3):,LBOUND(hstPtr,4):,LBOUND(hstPtr,5):) => tmp
    end function


                                        
    function hipHostUnregister_l_6(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      logical,target,dimension(:,:,:,:,:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_l_6 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_l_6
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_l_6 = cudaSuccess
#else
      hipHostUnregister_l_6 = hipSuccess
#endif
      hipHostUnregister_l_6 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_l_6(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      logical,target,dimension(:,:,:,:,:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_l_6 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_l_6
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_l_6 = cudaSuccess
#else
      hipHostRegister_l_6 = hipSuccess
#endif
      hipHostRegister_l_6 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*1_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_l_6(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      logical,pointer,dimension(:,:,:,:,:,:),intent(inout) :: devPtr
      logical,target,dimension(:,:,:,:,:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_l_6 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_l_6
#endif
      !
      type(c_ptr) :: cptr
      logical,pointer,dimension(:,:,:,:,:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_l_6 = cudaSuccess
#else
      hipHostGetDevicePointer_l_6 = hipSuccess
#endif
      hipHostGetDevicePointer_l_6 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):,LBOUND(hstPtr,3):,LBOUND(hstPtr,4):,LBOUND(hstPtr,5):,LBOUND(hstPtr,6):) => tmp
    end function


                                        
    function hipHostUnregister_l_7(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      logical,target,dimension(:,:,:,:,:,:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_l_7 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_l_7
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_l_7 = cudaSuccess
#else
      hipHostUnregister_l_7 = hipSuccess
#endif
      hipHostUnregister_l_7 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_l_7(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      logical,target,dimension(:,:,:,:,:,:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_l_7 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_l_7
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_l_7 = cudaSuccess
#else
      hipHostRegister_l_7 = hipSuccess
#endif
      hipHostRegister_l_7 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*1_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_l_7(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      logical,pointer,dimension(:,:,:,:,:,:,:),intent(inout) :: devPtr
      logical,target,dimension(:,:,:,:,:,:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_l_7 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_l_7
#endif
      !
      type(c_ptr) :: cptr
      logical,pointer,dimension(:,:,:,:,:,:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_l_7 = cudaSuccess
#else
      hipHostGetDevicePointer_l_7 = hipSuccess
#endif
      hipHostGetDevicePointer_l_7 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):,LBOUND(hstPtr,3):,LBOUND(hstPtr,4):,LBOUND(hstPtr,5):,LBOUND(hstPtr,6):,LBOUND(hstPtr,7):) => tmp
    end function


                                        
    function hipHostUnregister_i4_0(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),target :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_i4_0 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_i4_0
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_i4_0 = cudaSuccess
#else
      hipHostUnregister_i4_0 = hipSuccess
#endif
      hipHostUnregister_i4_0 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_i4_0(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),target :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_i4_0 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_i4_0
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_i4_0 = cudaSuccess
#else
      hipHostRegister_i4_0 = hipSuccess
#endif
      hipHostRegister_i4_0 = hipHostRegister_b(c_loc(hostPtr),4_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_i4_0(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,intent(inout) :: devPtr
      integer(4),target                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_i4_0 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_i4_0
#endif
      !
      type(c_ptr) :: cptr
      integer(4),pointer :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_i4_0 = cudaSuccess
#else
      hipHostGetDevicePointer_i4_0 = hipSuccess
#endif
      hipHostGetDevicePointer_i4_0 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,devPtr)
    end function


                                        
    function hipHostUnregister_i4_1(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),target,dimension(:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_i4_1 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_i4_1
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_i4_1 = cudaSuccess
#else
      hipHostUnregister_i4_1 = hipSuccess
#endif
      hipHostUnregister_i4_1 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_i4_1(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),target,dimension(:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_i4_1 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_i4_1
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_i4_1 = cudaSuccess
#else
      hipHostRegister_i4_1 = hipSuccess
#endif
      hipHostRegister_i4_1 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*4_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_i4_1(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:),intent(inout) :: devPtr
      integer(4),target,dimension(:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_i4_1 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_i4_1
#endif
      !
      type(c_ptr) :: cptr
      integer(4),pointer,dimension(:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_i4_1 = cudaSuccess
#else
      hipHostGetDevicePointer_i4_1 = hipSuccess
#endif
      hipHostGetDevicePointer_i4_1 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):) => tmp
    end function


                                        
    function hipHostUnregister_i4_2(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),target,dimension(:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_i4_2 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_i4_2
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_i4_2 = cudaSuccess
#else
      hipHostUnregister_i4_2 = hipSuccess
#endif
      hipHostUnregister_i4_2 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_i4_2(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),target,dimension(:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_i4_2 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_i4_2
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_i4_2 = cudaSuccess
#else
      hipHostRegister_i4_2 = hipSuccess
#endif
      hipHostRegister_i4_2 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*4_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_i4_2(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:),intent(inout) :: devPtr
      integer(4),target,dimension(:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_i4_2 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_i4_2
#endif
      !
      type(c_ptr) :: cptr
      integer(4),pointer,dimension(:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_i4_2 = cudaSuccess
#else
      hipHostGetDevicePointer_i4_2 = hipSuccess
#endif
      hipHostGetDevicePointer_i4_2 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):) => tmp
    end function


                                        
    function hipHostUnregister_i4_3(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),target,dimension(:,:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_i4_3 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_i4_3
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_i4_3 = cudaSuccess
#else
      hipHostUnregister_i4_3 = hipSuccess
#endif
      hipHostUnregister_i4_3 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_i4_3(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),target,dimension(:,:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_i4_3 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_i4_3
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_i4_3 = cudaSuccess
#else
      hipHostRegister_i4_3 = hipSuccess
#endif
      hipHostRegister_i4_3 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*4_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_i4_3(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:),intent(inout) :: devPtr
      integer(4),target,dimension(:,:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_i4_3 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_i4_3
#endif
      !
      type(c_ptr) :: cptr
      integer(4),pointer,dimension(:,:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_i4_3 = cudaSuccess
#else
      hipHostGetDevicePointer_i4_3 = hipSuccess
#endif
      hipHostGetDevicePointer_i4_3 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):,LBOUND(hstPtr,3):) => tmp
    end function


                                        
    function hipHostUnregister_i4_4(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),target,dimension(:,:,:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_i4_4 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_i4_4
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_i4_4 = cudaSuccess
#else
      hipHostUnregister_i4_4 = hipSuccess
#endif
      hipHostUnregister_i4_4 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_i4_4(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),target,dimension(:,:,:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_i4_4 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_i4_4
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_i4_4 = cudaSuccess
#else
      hipHostRegister_i4_4 = hipSuccess
#endif
      hipHostRegister_i4_4 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*4_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_i4_4(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:),intent(inout) :: devPtr
      integer(4),target,dimension(:,:,:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_i4_4 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_i4_4
#endif
      !
      type(c_ptr) :: cptr
      integer(4),pointer,dimension(:,:,:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_i4_4 = cudaSuccess
#else
      hipHostGetDevicePointer_i4_4 = hipSuccess
#endif
      hipHostGetDevicePointer_i4_4 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):,LBOUND(hstPtr,3):,LBOUND(hstPtr,4):) => tmp
    end function


                                        
    function hipHostUnregister_i4_5(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),target,dimension(:,:,:,:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_i4_5 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_i4_5
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_i4_5 = cudaSuccess
#else
      hipHostUnregister_i4_5 = hipSuccess
#endif
      hipHostUnregister_i4_5 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_i4_5(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),target,dimension(:,:,:,:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_i4_5 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_i4_5
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_i4_5 = cudaSuccess
#else
      hipHostRegister_i4_5 = hipSuccess
#endif
      hipHostRegister_i4_5 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*4_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_i4_5(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:,:),intent(inout) :: devPtr
      integer(4),target,dimension(:,:,:,:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_i4_5 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_i4_5
#endif
      !
      type(c_ptr) :: cptr
      integer(4),pointer,dimension(:,:,:,:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_i4_5 = cudaSuccess
#else
      hipHostGetDevicePointer_i4_5 = hipSuccess
#endif
      hipHostGetDevicePointer_i4_5 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):,LBOUND(hstPtr,3):,LBOUND(hstPtr,4):,LBOUND(hstPtr,5):) => tmp
    end function


                                        
    function hipHostUnregister_i4_6(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),target,dimension(:,:,:,:,:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_i4_6 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_i4_6
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_i4_6 = cudaSuccess
#else
      hipHostUnregister_i4_6 = hipSuccess
#endif
      hipHostUnregister_i4_6 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_i4_6(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),target,dimension(:,:,:,:,:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_i4_6 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_i4_6
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_i4_6 = cudaSuccess
#else
      hipHostRegister_i4_6 = hipSuccess
#endif
      hipHostRegister_i4_6 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*4_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_i4_6(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:,:,:),intent(inout) :: devPtr
      integer(4),target,dimension(:,:,:,:,:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_i4_6 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_i4_6
#endif
      !
      type(c_ptr) :: cptr
      integer(4),pointer,dimension(:,:,:,:,:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_i4_6 = cudaSuccess
#else
      hipHostGetDevicePointer_i4_6 = hipSuccess
#endif
      hipHostGetDevicePointer_i4_6 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):,LBOUND(hstPtr,3):,LBOUND(hstPtr,4):,LBOUND(hstPtr,5):,LBOUND(hstPtr,6):) => tmp
    end function


                                        
    function hipHostUnregister_i4_7(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),target,dimension(:,:,:,:,:,:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_i4_7 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_i4_7
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_i4_7 = cudaSuccess
#else
      hipHostUnregister_i4_7 = hipSuccess
#endif
      hipHostUnregister_i4_7 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_i4_7(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),target,dimension(:,:,:,:,:,:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_i4_7 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_i4_7
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_i4_7 = cudaSuccess
#else
      hipHostRegister_i4_7 = hipSuccess
#endif
      hipHostRegister_i4_7 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*4_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_i4_7(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(4),pointer,dimension(:,:,:,:,:,:,:),intent(inout) :: devPtr
      integer(4),target,dimension(:,:,:,:,:,:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_i4_7 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_i4_7
#endif
      !
      type(c_ptr) :: cptr
      integer(4),pointer,dimension(:,:,:,:,:,:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_i4_7 = cudaSuccess
#else
      hipHostGetDevicePointer_i4_7 = hipSuccess
#endif
      hipHostGetDevicePointer_i4_7 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):,LBOUND(hstPtr,3):,LBOUND(hstPtr,4):,LBOUND(hstPtr,5):,LBOUND(hstPtr,6):,LBOUND(hstPtr,7):) => tmp
    end function


                                        
    function hipHostUnregister_i8_0(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),target :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_i8_0 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_i8_0
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_i8_0 = cudaSuccess
#else
      hipHostUnregister_i8_0 = hipSuccess
#endif
      hipHostUnregister_i8_0 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_i8_0(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),target :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_i8_0 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_i8_0
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_i8_0 = cudaSuccess
#else
      hipHostRegister_i8_0 = hipSuccess
#endif
      hipHostRegister_i8_0 = hipHostRegister_b(c_loc(hostPtr),8_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_i8_0(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,intent(inout) :: devPtr
      integer(8),target                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_i8_0 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_i8_0
#endif
      !
      type(c_ptr) :: cptr
      integer(8),pointer :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_i8_0 = cudaSuccess
#else
      hipHostGetDevicePointer_i8_0 = hipSuccess
#endif
      hipHostGetDevicePointer_i8_0 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,devPtr)
    end function


                                        
    function hipHostUnregister_i8_1(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),target,dimension(:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_i8_1 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_i8_1
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_i8_1 = cudaSuccess
#else
      hipHostUnregister_i8_1 = hipSuccess
#endif
      hipHostUnregister_i8_1 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_i8_1(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),target,dimension(:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_i8_1 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_i8_1
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_i8_1 = cudaSuccess
#else
      hipHostRegister_i8_1 = hipSuccess
#endif
      hipHostRegister_i8_1 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*8_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_i8_1(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:),intent(inout) :: devPtr
      integer(8),target,dimension(:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_i8_1 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_i8_1
#endif
      !
      type(c_ptr) :: cptr
      integer(8),pointer,dimension(:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_i8_1 = cudaSuccess
#else
      hipHostGetDevicePointer_i8_1 = hipSuccess
#endif
      hipHostGetDevicePointer_i8_1 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):) => tmp
    end function


                                        
    function hipHostUnregister_i8_2(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),target,dimension(:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_i8_2 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_i8_2
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_i8_2 = cudaSuccess
#else
      hipHostUnregister_i8_2 = hipSuccess
#endif
      hipHostUnregister_i8_2 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_i8_2(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),target,dimension(:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_i8_2 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_i8_2
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_i8_2 = cudaSuccess
#else
      hipHostRegister_i8_2 = hipSuccess
#endif
      hipHostRegister_i8_2 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*8_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_i8_2(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:),intent(inout) :: devPtr
      integer(8),target,dimension(:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_i8_2 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_i8_2
#endif
      !
      type(c_ptr) :: cptr
      integer(8),pointer,dimension(:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_i8_2 = cudaSuccess
#else
      hipHostGetDevicePointer_i8_2 = hipSuccess
#endif
      hipHostGetDevicePointer_i8_2 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):) => tmp
    end function


                                        
    function hipHostUnregister_i8_3(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),target,dimension(:,:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_i8_3 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_i8_3
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_i8_3 = cudaSuccess
#else
      hipHostUnregister_i8_3 = hipSuccess
#endif
      hipHostUnregister_i8_3 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_i8_3(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),target,dimension(:,:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_i8_3 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_i8_3
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_i8_3 = cudaSuccess
#else
      hipHostRegister_i8_3 = hipSuccess
#endif
      hipHostRegister_i8_3 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*8_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_i8_3(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:),intent(inout) :: devPtr
      integer(8),target,dimension(:,:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_i8_3 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_i8_3
#endif
      !
      type(c_ptr) :: cptr
      integer(8),pointer,dimension(:,:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_i8_3 = cudaSuccess
#else
      hipHostGetDevicePointer_i8_3 = hipSuccess
#endif
      hipHostGetDevicePointer_i8_3 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):,LBOUND(hstPtr,3):) => tmp
    end function


                                        
    function hipHostUnregister_i8_4(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),target,dimension(:,:,:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_i8_4 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_i8_4
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_i8_4 = cudaSuccess
#else
      hipHostUnregister_i8_4 = hipSuccess
#endif
      hipHostUnregister_i8_4 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_i8_4(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),target,dimension(:,:,:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_i8_4 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_i8_4
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_i8_4 = cudaSuccess
#else
      hipHostRegister_i8_4 = hipSuccess
#endif
      hipHostRegister_i8_4 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*8_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_i8_4(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:),intent(inout) :: devPtr
      integer(8),target,dimension(:,:,:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_i8_4 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_i8_4
#endif
      !
      type(c_ptr) :: cptr
      integer(8),pointer,dimension(:,:,:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_i8_4 = cudaSuccess
#else
      hipHostGetDevicePointer_i8_4 = hipSuccess
#endif
      hipHostGetDevicePointer_i8_4 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):,LBOUND(hstPtr,3):,LBOUND(hstPtr,4):) => tmp
    end function


                                        
    function hipHostUnregister_i8_5(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),target,dimension(:,:,:,:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_i8_5 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_i8_5
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_i8_5 = cudaSuccess
#else
      hipHostUnregister_i8_5 = hipSuccess
#endif
      hipHostUnregister_i8_5 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_i8_5(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),target,dimension(:,:,:,:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_i8_5 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_i8_5
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_i8_5 = cudaSuccess
#else
      hipHostRegister_i8_5 = hipSuccess
#endif
      hipHostRegister_i8_5 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*8_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_i8_5(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:,:),intent(inout) :: devPtr
      integer(8),target,dimension(:,:,:,:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_i8_5 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_i8_5
#endif
      !
      type(c_ptr) :: cptr
      integer(8),pointer,dimension(:,:,:,:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_i8_5 = cudaSuccess
#else
      hipHostGetDevicePointer_i8_5 = hipSuccess
#endif
      hipHostGetDevicePointer_i8_5 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):,LBOUND(hstPtr,3):,LBOUND(hstPtr,4):,LBOUND(hstPtr,5):) => tmp
    end function


                                        
    function hipHostUnregister_i8_6(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),target,dimension(:,:,:,:,:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_i8_6 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_i8_6
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_i8_6 = cudaSuccess
#else
      hipHostUnregister_i8_6 = hipSuccess
#endif
      hipHostUnregister_i8_6 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_i8_6(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),target,dimension(:,:,:,:,:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_i8_6 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_i8_6
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_i8_6 = cudaSuccess
#else
      hipHostRegister_i8_6 = hipSuccess
#endif
      hipHostRegister_i8_6 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*8_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_i8_6(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:,:,:),intent(inout) :: devPtr
      integer(8),target,dimension(:,:,:,:,:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_i8_6 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_i8_6
#endif
      !
      type(c_ptr) :: cptr
      integer(8),pointer,dimension(:,:,:,:,:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_i8_6 = cudaSuccess
#else
      hipHostGetDevicePointer_i8_6 = hipSuccess
#endif
      hipHostGetDevicePointer_i8_6 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):,LBOUND(hstPtr,3):,LBOUND(hstPtr,4):,LBOUND(hstPtr,5):,LBOUND(hstPtr,6):) => tmp
    end function


                                        
    function hipHostUnregister_i8_7(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),target,dimension(:,:,:,:,:,:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_i8_7 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_i8_7
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_i8_7 = cudaSuccess
#else
      hipHostUnregister_i8_7 = hipSuccess
#endif
      hipHostUnregister_i8_7 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_i8_7(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),target,dimension(:,:,:,:,:,:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_i8_7 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_i8_7
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_i8_7 = cudaSuccess
#else
      hipHostRegister_i8_7 = hipSuccess
#endif
      hipHostRegister_i8_7 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*8_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_i8_7(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      integer(8),pointer,dimension(:,:,:,:,:,:,:),intent(inout) :: devPtr
      integer(8),target,dimension(:,:,:,:,:,:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_i8_7 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_i8_7
#endif
      !
      type(c_ptr) :: cptr
      integer(8),pointer,dimension(:,:,:,:,:,:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_i8_7 = cudaSuccess
#else
      hipHostGetDevicePointer_i8_7 = hipSuccess
#endif
      hipHostGetDevicePointer_i8_7 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):,LBOUND(hstPtr,3):,LBOUND(hstPtr,4):,LBOUND(hstPtr,5):,LBOUND(hstPtr,6):,LBOUND(hstPtr,7):) => tmp
    end function


                                        
    function hipHostUnregister_r4_0(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),target :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_r4_0 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_r4_0
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_r4_0 = cudaSuccess
#else
      hipHostUnregister_r4_0 = hipSuccess
#endif
      hipHostUnregister_r4_0 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_r4_0(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),target :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_r4_0 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_r4_0
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_r4_0 = cudaSuccess
#else
      hipHostRegister_r4_0 = hipSuccess
#endif
      hipHostRegister_r4_0 = hipHostRegister_b(c_loc(hostPtr),4_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_r4_0(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,intent(inout) :: devPtr
      real(4),target                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_r4_0 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_r4_0
#endif
      !
      type(c_ptr) :: cptr
      real(4),pointer :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_r4_0 = cudaSuccess
#else
      hipHostGetDevicePointer_r4_0 = hipSuccess
#endif
      hipHostGetDevicePointer_r4_0 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,devPtr)
    end function


                                        
    function hipHostUnregister_r4_1(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),target,dimension(:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_r4_1 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_r4_1
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_r4_1 = cudaSuccess
#else
      hipHostUnregister_r4_1 = hipSuccess
#endif
      hipHostUnregister_r4_1 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_r4_1(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),target,dimension(:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_r4_1 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_r4_1
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_r4_1 = cudaSuccess
#else
      hipHostRegister_r4_1 = hipSuccess
#endif
      hipHostRegister_r4_1 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*4_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_r4_1(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:),intent(inout) :: devPtr
      real(4),target,dimension(:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_r4_1 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_r4_1
#endif
      !
      type(c_ptr) :: cptr
      real(4),pointer,dimension(:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_r4_1 = cudaSuccess
#else
      hipHostGetDevicePointer_r4_1 = hipSuccess
#endif
      hipHostGetDevicePointer_r4_1 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):) => tmp
    end function


                                        
    function hipHostUnregister_r4_2(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),target,dimension(:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_r4_2 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_r4_2
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_r4_2 = cudaSuccess
#else
      hipHostUnregister_r4_2 = hipSuccess
#endif
      hipHostUnregister_r4_2 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_r4_2(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),target,dimension(:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_r4_2 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_r4_2
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_r4_2 = cudaSuccess
#else
      hipHostRegister_r4_2 = hipSuccess
#endif
      hipHostRegister_r4_2 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*4_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_r4_2(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:),intent(inout) :: devPtr
      real(4),target,dimension(:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_r4_2 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_r4_2
#endif
      !
      type(c_ptr) :: cptr
      real(4),pointer,dimension(:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_r4_2 = cudaSuccess
#else
      hipHostGetDevicePointer_r4_2 = hipSuccess
#endif
      hipHostGetDevicePointer_r4_2 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):) => tmp
    end function


                                        
    function hipHostUnregister_r4_3(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),target,dimension(:,:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_r4_3 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_r4_3
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_r4_3 = cudaSuccess
#else
      hipHostUnregister_r4_3 = hipSuccess
#endif
      hipHostUnregister_r4_3 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_r4_3(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),target,dimension(:,:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_r4_3 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_r4_3
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_r4_3 = cudaSuccess
#else
      hipHostRegister_r4_3 = hipSuccess
#endif
      hipHostRegister_r4_3 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*4_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_r4_3(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:),intent(inout) :: devPtr
      real(4),target,dimension(:,:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_r4_3 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_r4_3
#endif
      !
      type(c_ptr) :: cptr
      real(4),pointer,dimension(:,:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_r4_3 = cudaSuccess
#else
      hipHostGetDevicePointer_r4_3 = hipSuccess
#endif
      hipHostGetDevicePointer_r4_3 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):,LBOUND(hstPtr,3):) => tmp
    end function


                                        
    function hipHostUnregister_r4_4(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),target,dimension(:,:,:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_r4_4 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_r4_4
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_r4_4 = cudaSuccess
#else
      hipHostUnregister_r4_4 = hipSuccess
#endif
      hipHostUnregister_r4_4 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_r4_4(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),target,dimension(:,:,:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_r4_4 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_r4_4
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_r4_4 = cudaSuccess
#else
      hipHostRegister_r4_4 = hipSuccess
#endif
      hipHostRegister_r4_4 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*4_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_r4_4(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:),intent(inout) :: devPtr
      real(4),target,dimension(:,:,:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_r4_4 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_r4_4
#endif
      !
      type(c_ptr) :: cptr
      real(4),pointer,dimension(:,:,:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_r4_4 = cudaSuccess
#else
      hipHostGetDevicePointer_r4_4 = hipSuccess
#endif
      hipHostGetDevicePointer_r4_4 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):,LBOUND(hstPtr,3):,LBOUND(hstPtr,4):) => tmp
    end function


                                        
    function hipHostUnregister_r4_5(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),target,dimension(:,:,:,:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_r4_5 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_r4_5
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_r4_5 = cudaSuccess
#else
      hipHostUnregister_r4_5 = hipSuccess
#endif
      hipHostUnregister_r4_5 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_r4_5(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),target,dimension(:,:,:,:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_r4_5 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_r4_5
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_r4_5 = cudaSuccess
#else
      hipHostRegister_r4_5 = hipSuccess
#endif
      hipHostRegister_r4_5 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*4_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_r4_5(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:,:),intent(inout) :: devPtr
      real(4),target,dimension(:,:,:,:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_r4_5 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_r4_5
#endif
      !
      type(c_ptr) :: cptr
      real(4),pointer,dimension(:,:,:,:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_r4_5 = cudaSuccess
#else
      hipHostGetDevicePointer_r4_5 = hipSuccess
#endif
      hipHostGetDevicePointer_r4_5 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):,LBOUND(hstPtr,3):,LBOUND(hstPtr,4):,LBOUND(hstPtr,5):) => tmp
    end function


                                        
    function hipHostUnregister_r4_6(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),target,dimension(:,:,:,:,:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_r4_6 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_r4_6
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_r4_6 = cudaSuccess
#else
      hipHostUnregister_r4_6 = hipSuccess
#endif
      hipHostUnregister_r4_6 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_r4_6(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),target,dimension(:,:,:,:,:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_r4_6 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_r4_6
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_r4_6 = cudaSuccess
#else
      hipHostRegister_r4_6 = hipSuccess
#endif
      hipHostRegister_r4_6 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*4_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_r4_6(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:,:,:),intent(inout) :: devPtr
      real(4),target,dimension(:,:,:,:,:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_r4_6 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_r4_6
#endif
      !
      type(c_ptr) :: cptr
      real(4),pointer,dimension(:,:,:,:,:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_r4_6 = cudaSuccess
#else
      hipHostGetDevicePointer_r4_6 = hipSuccess
#endif
      hipHostGetDevicePointer_r4_6 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):,LBOUND(hstPtr,3):,LBOUND(hstPtr,4):,LBOUND(hstPtr,5):,LBOUND(hstPtr,6):) => tmp
    end function


                                        
    function hipHostUnregister_r4_7(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),target,dimension(:,:,:,:,:,:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_r4_7 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_r4_7
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_r4_7 = cudaSuccess
#else
      hipHostUnregister_r4_7 = hipSuccess
#endif
      hipHostUnregister_r4_7 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_r4_7(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),target,dimension(:,:,:,:,:,:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_r4_7 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_r4_7
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_r4_7 = cudaSuccess
#else
      hipHostRegister_r4_7 = hipSuccess
#endif
      hipHostRegister_r4_7 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*4_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_r4_7(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(4),pointer,dimension(:,:,:,:,:,:,:),intent(inout) :: devPtr
      real(4),target,dimension(:,:,:,:,:,:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_r4_7 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_r4_7
#endif
      !
      type(c_ptr) :: cptr
      real(4),pointer,dimension(:,:,:,:,:,:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_r4_7 = cudaSuccess
#else
      hipHostGetDevicePointer_r4_7 = hipSuccess
#endif
      hipHostGetDevicePointer_r4_7 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):,LBOUND(hstPtr,3):,LBOUND(hstPtr,4):,LBOUND(hstPtr,5):,LBOUND(hstPtr,6):,LBOUND(hstPtr,7):) => tmp
    end function


                                        
    function hipHostUnregister_r8_0(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),target :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_r8_0 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_r8_0
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_r8_0 = cudaSuccess
#else
      hipHostUnregister_r8_0 = hipSuccess
#endif
      hipHostUnregister_r8_0 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_r8_0(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),target :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_r8_0 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_r8_0
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_r8_0 = cudaSuccess
#else
      hipHostRegister_r8_0 = hipSuccess
#endif
      hipHostRegister_r8_0 = hipHostRegister_b(c_loc(hostPtr),8_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_r8_0(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,intent(inout) :: devPtr
      real(8),target                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_r8_0 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_r8_0
#endif
      !
      type(c_ptr) :: cptr
      real(8),pointer :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_r8_0 = cudaSuccess
#else
      hipHostGetDevicePointer_r8_0 = hipSuccess
#endif
      hipHostGetDevicePointer_r8_0 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,devPtr)
    end function


                                        
    function hipHostUnregister_r8_1(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),target,dimension(:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_r8_1 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_r8_1
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_r8_1 = cudaSuccess
#else
      hipHostUnregister_r8_1 = hipSuccess
#endif
      hipHostUnregister_r8_1 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_r8_1(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),target,dimension(:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_r8_1 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_r8_1
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_r8_1 = cudaSuccess
#else
      hipHostRegister_r8_1 = hipSuccess
#endif
      hipHostRegister_r8_1 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*8_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_r8_1(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:),intent(inout) :: devPtr
      real(8),target,dimension(:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_r8_1 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_r8_1
#endif
      !
      type(c_ptr) :: cptr
      real(8),pointer,dimension(:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_r8_1 = cudaSuccess
#else
      hipHostGetDevicePointer_r8_1 = hipSuccess
#endif
      hipHostGetDevicePointer_r8_1 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):) => tmp
    end function


                                        
    function hipHostUnregister_r8_2(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),target,dimension(:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_r8_2 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_r8_2
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_r8_2 = cudaSuccess
#else
      hipHostUnregister_r8_2 = hipSuccess
#endif
      hipHostUnregister_r8_2 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_r8_2(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),target,dimension(:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_r8_2 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_r8_2
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_r8_2 = cudaSuccess
#else
      hipHostRegister_r8_2 = hipSuccess
#endif
      hipHostRegister_r8_2 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*8_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_r8_2(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:),intent(inout) :: devPtr
      real(8),target,dimension(:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_r8_2 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_r8_2
#endif
      !
      type(c_ptr) :: cptr
      real(8),pointer,dimension(:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_r8_2 = cudaSuccess
#else
      hipHostGetDevicePointer_r8_2 = hipSuccess
#endif
      hipHostGetDevicePointer_r8_2 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):) => tmp
    end function


                                        
    function hipHostUnregister_r8_3(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),target,dimension(:,:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_r8_3 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_r8_3
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_r8_3 = cudaSuccess
#else
      hipHostUnregister_r8_3 = hipSuccess
#endif
      hipHostUnregister_r8_3 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_r8_3(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),target,dimension(:,:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_r8_3 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_r8_3
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_r8_3 = cudaSuccess
#else
      hipHostRegister_r8_3 = hipSuccess
#endif
      hipHostRegister_r8_3 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*8_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_r8_3(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:),intent(inout) :: devPtr
      real(8),target,dimension(:,:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_r8_3 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_r8_3
#endif
      !
      type(c_ptr) :: cptr
      real(8),pointer,dimension(:,:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_r8_3 = cudaSuccess
#else
      hipHostGetDevicePointer_r8_3 = hipSuccess
#endif
      hipHostGetDevicePointer_r8_3 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):,LBOUND(hstPtr,3):) => tmp
    end function


                                        
    function hipHostUnregister_r8_4(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),target,dimension(:,:,:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_r8_4 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_r8_4
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_r8_4 = cudaSuccess
#else
      hipHostUnregister_r8_4 = hipSuccess
#endif
      hipHostUnregister_r8_4 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_r8_4(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),target,dimension(:,:,:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_r8_4 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_r8_4
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_r8_4 = cudaSuccess
#else
      hipHostRegister_r8_4 = hipSuccess
#endif
      hipHostRegister_r8_4 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*8_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_r8_4(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:),intent(inout) :: devPtr
      real(8),target,dimension(:,:,:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_r8_4 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_r8_4
#endif
      !
      type(c_ptr) :: cptr
      real(8),pointer,dimension(:,:,:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_r8_4 = cudaSuccess
#else
      hipHostGetDevicePointer_r8_4 = hipSuccess
#endif
      hipHostGetDevicePointer_r8_4 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):,LBOUND(hstPtr,3):,LBOUND(hstPtr,4):) => tmp
    end function


                                        
    function hipHostUnregister_r8_5(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),target,dimension(:,:,:,:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_r8_5 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_r8_5
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_r8_5 = cudaSuccess
#else
      hipHostUnregister_r8_5 = hipSuccess
#endif
      hipHostUnregister_r8_5 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_r8_5(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),target,dimension(:,:,:,:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_r8_5 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_r8_5
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_r8_5 = cudaSuccess
#else
      hipHostRegister_r8_5 = hipSuccess
#endif
      hipHostRegister_r8_5 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*8_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_r8_5(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:,:),intent(inout) :: devPtr
      real(8),target,dimension(:,:,:,:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_r8_5 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_r8_5
#endif
      !
      type(c_ptr) :: cptr
      real(8),pointer,dimension(:,:,:,:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_r8_5 = cudaSuccess
#else
      hipHostGetDevicePointer_r8_5 = hipSuccess
#endif
      hipHostGetDevicePointer_r8_5 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):,LBOUND(hstPtr,3):,LBOUND(hstPtr,4):,LBOUND(hstPtr,5):) => tmp
    end function


                                        
    function hipHostUnregister_r8_6(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),target,dimension(:,:,:,:,:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_r8_6 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_r8_6
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_r8_6 = cudaSuccess
#else
      hipHostUnregister_r8_6 = hipSuccess
#endif
      hipHostUnregister_r8_6 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_r8_6(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),target,dimension(:,:,:,:,:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_r8_6 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_r8_6
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_r8_6 = cudaSuccess
#else
      hipHostRegister_r8_6 = hipSuccess
#endif
      hipHostRegister_r8_6 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*8_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_r8_6(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:,:,:),intent(inout) :: devPtr
      real(8),target,dimension(:,:,:,:,:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_r8_6 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_r8_6
#endif
      !
      type(c_ptr) :: cptr
      real(8),pointer,dimension(:,:,:,:,:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_r8_6 = cudaSuccess
#else
      hipHostGetDevicePointer_r8_6 = hipSuccess
#endif
      hipHostGetDevicePointer_r8_6 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):,LBOUND(hstPtr,3):,LBOUND(hstPtr,4):,LBOUND(hstPtr,5):,LBOUND(hstPtr,6):) => tmp
    end function


                                        
    function hipHostUnregister_r8_7(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),target,dimension(:,:,:,:,:,:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_r8_7 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_r8_7
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_r8_7 = cudaSuccess
#else
      hipHostUnregister_r8_7 = hipSuccess
#endif
      hipHostUnregister_r8_7 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_r8_7(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),target,dimension(:,:,:,:,:,:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_r8_7 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_r8_7
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_r8_7 = cudaSuccess
#else
      hipHostRegister_r8_7 = hipSuccess
#endif
      hipHostRegister_r8_7 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*8_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_r8_7(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      real(8),pointer,dimension(:,:,:,:,:,:,:),intent(inout) :: devPtr
      real(8),target,dimension(:,:,:,:,:,:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_r8_7 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_r8_7
#endif
      !
      type(c_ptr) :: cptr
      real(8),pointer,dimension(:,:,:,:,:,:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_r8_7 = cudaSuccess
#else
      hipHostGetDevicePointer_r8_7 = hipSuccess
#endif
      hipHostGetDevicePointer_r8_7 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):,LBOUND(hstPtr,3):,LBOUND(hstPtr,4):,LBOUND(hstPtr,5):,LBOUND(hstPtr,6):,LBOUND(hstPtr,7):) => tmp
    end function


                                        
    function hipHostUnregister_c4_0(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),target :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_c4_0 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_c4_0
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_c4_0 = cudaSuccess
#else
      hipHostUnregister_c4_0 = hipSuccess
#endif
      hipHostUnregister_c4_0 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_c4_0(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),target :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_c4_0 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_c4_0
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_c4_0 = cudaSuccess
#else
      hipHostRegister_c4_0 = hipSuccess
#endif
      hipHostRegister_c4_0 = hipHostRegister_b(c_loc(hostPtr),2*4_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_c4_0(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,intent(inout) :: devPtr
      complex(4),target                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_c4_0 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_c4_0
#endif
      !
      type(c_ptr) :: cptr
      complex(4),pointer :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_c4_0 = cudaSuccess
#else
      hipHostGetDevicePointer_c4_0 = hipSuccess
#endif
      hipHostGetDevicePointer_c4_0 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,devPtr)
    end function


                                        
    function hipHostUnregister_c4_1(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),target,dimension(:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_c4_1 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_c4_1
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_c4_1 = cudaSuccess
#else
      hipHostUnregister_c4_1 = hipSuccess
#endif
      hipHostUnregister_c4_1 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_c4_1(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),target,dimension(:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_c4_1 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_c4_1
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_c4_1 = cudaSuccess
#else
      hipHostRegister_c4_1 = hipSuccess
#endif
      hipHostRegister_c4_1 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*2*4_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_c4_1(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:),intent(inout) :: devPtr
      complex(4),target,dimension(:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_c4_1 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_c4_1
#endif
      !
      type(c_ptr) :: cptr
      complex(4),pointer,dimension(:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_c4_1 = cudaSuccess
#else
      hipHostGetDevicePointer_c4_1 = hipSuccess
#endif
      hipHostGetDevicePointer_c4_1 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):) => tmp
    end function


                                        
    function hipHostUnregister_c4_2(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),target,dimension(:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_c4_2 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_c4_2
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_c4_2 = cudaSuccess
#else
      hipHostUnregister_c4_2 = hipSuccess
#endif
      hipHostUnregister_c4_2 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_c4_2(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),target,dimension(:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_c4_2 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_c4_2
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_c4_2 = cudaSuccess
#else
      hipHostRegister_c4_2 = hipSuccess
#endif
      hipHostRegister_c4_2 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*2*4_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_c4_2(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:),intent(inout) :: devPtr
      complex(4),target,dimension(:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_c4_2 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_c4_2
#endif
      !
      type(c_ptr) :: cptr
      complex(4),pointer,dimension(:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_c4_2 = cudaSuccess
#else
      hipHostGetDevicePointer_c4_2 = hipSuccess
#endif
      hipHostGetDevicePointer_c4_2 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):) => tmp
    end function


                                        
    function hipHostUnregister_c4_3(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),target,dimension(:,:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_c4_3 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_c4_3
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_c4_3 = cudaSuccess
#else
      hipHostUnregister_c4_3 = hipSuccess
#endif
      hipHostUnregister_c4_3 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_c4_3(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),target,dimension(:,:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_c4_3 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_c4_3
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_c4_3 = cudaSuccess
#else
      hipHostRegister_c4_3 = hipSuccess
#endif
      hipHostRegister_c4_3 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*2*4_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_c4_3(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:),intent(inout) :: devPtr
      complex(4),target,dimension(:,:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_c4_3 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_c4_3
#endif
      !
      type(c_ptr) :: cptr
      complex(4),pointer,dimension(:,:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_c4_3 = cudaSuccess
#else
      hipHostGetDevicePointer_c4_3 = hipSuccess
#endif
      hipHostGetDevicePointer_c4_3 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):,LBOUND(hstPtr,3):) => tmp
    end function


                                        
    function hipHostUnregister_c4_4(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),target,dimension(:,:,:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_c4_4 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_c4_4
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_c4_4 = cudaSuccess
#else
      hipHostUnregister_c4_4 = hipSuccess
#endif
      hipHostUnregister_c4_4 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_c4_4(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),target,dimension(:,:,:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_c4_4 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_c4_4
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_c4_4 = cudaSuccess
#else
      hipHostRegister_c4_4 = hipSuccess
#endif
      hipHostRegister_c4_4 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*2*4_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_c4_4(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:),intent(inout) :: devPtr
      complex(4),target,dimension(:,:,:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_c4_4 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_c4_4
#endif
      !
      type(c_ptr) :: cptr
      complex(4),pointer,dimension(:,:,:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_c4_4 = cudaSuccess
#else
      hipHostGetDevicePointer_c4_4 = hipSuccess
#endif
      hipHostGetDevicePointer_c4_4 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):,LBOUND(hstPtr,3):,LBOUND(hstPtr,4):) => tmp
    end function


                                        
    function hipHostUnregister_c4_5(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),target,dimension(:,:,:,:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_c4_5 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_c4_5
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_c4_5 = cudaSuccess
#else
      hipHostUnregister_c4_5 = hipSuccess
#endif
      hipHostUnregister_c4_5 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_c4_5(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),target,dimension(:,:,:,:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_c4_5 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_c4_5
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_c4_5 = cudaSuccess
#else
      hipHostRegister_c4_5 = hipSuccess
#endif
      hipHostRegister_c4_5 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*2*4_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_c4_5(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:,:),intent(inout) :: devPtr
      complex(4),target,dimension(:,:,:,:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_c4_5 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_c4_5
#endif
      !
      type(c_ptr) :: cptr
      complex(4),pointer,dimension(:,:,:,:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_c4_5 = cudaSuccess
#else
      hipHostGetDevicePointer_c4_5 = hipSuccess
#endif
      hipHostGetDevicePointer_c4_5 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):,LBOUND(hstPtr,3):,LBOUND(hstPtr,4):,LBOUND(hstPtr,5):) => tmp
    end function


                                        
    function hipHostUnregister_c4_6(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),target,dimension(:,:,:,:,:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_c4_6 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_c4_6
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_c4_6 = cudaSuccess
#else
      hipHostUnregister_c4_6 = hipSuccess
#endif
      hipHostUnregister_c4_6 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_c4_6(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),target,dimension(:,:,:,:,:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_c4_6 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_c4_6
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_c4_6 = cudaSuccess
#else
      hipHostRegister_c4_6 = hipSuccess
#endif
      hipHostRegister_c4_6 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*2*4_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_c4_6(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:,:,:),intent(inout) :: devPtr
      complex(4),target,dimension(:,:,:,:,:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_c4_6 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_c4_6
#endif
      !
      type(c_ptr) :: cptr
      complex(4),pointer,dimension(:,:,:,:,:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_c4_6 = cudaSuccess
#else
      hipHostGetDevicePointer_c4_6 = hipSuccess
#endif
      hipHostGetDevicePointer_c4_6 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):,LBOUND(hstPtr,3):,LBOUND(hstPtr,4):,LBOUND(hstPtr,5):,LBOUND(hstPtr,6):) => tmp
    end function


                                        
    function hipHostUnregister_c4_7(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),target,dimension(:,:,:,:,:,:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_c4_7 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_c4_7
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_c4_7 = cudaSuccess
#else
      hipHostUnregister_c4_7 = hipSuccess
#endif
      hipHostUnregister_c4_7 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_c4_7(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),target,dimension(:,:,:,:,:,:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_c4_7 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_c4_7
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_c4_7 = cudaSuccess
#else
      hipHostRegister_c4_7 = hipSuccess
#endif
      hipHostRegister_c4_7 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*2*4_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_c4_7(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(4),pointer,dimension(:,:,:,:,:,:,:),intent(inout) :: devPtr
      complex(4),target,dimension(:,:,:,:,:,:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_c4_7 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_c4_7
#endif
      !
      type(c_ptr) :: cptr
      complex(4),pointer,dimension(:,:,:,:,:,:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_c4_7 = cudaSuccess
#else
      hipHostGetDevicePointer_c4_7 = hipSuccess
#endif
      hipHostGetDevicePointer_c4_7 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):,LBOUND(hstPtr,3):,LBOUND(hstPtr,4):,LBOUND(hstPtr,5):,LBOUND(hstPtr,6):,LBOUND(hstPtr,7):) => tmp
    end function


                                        
    function hipHostUnregister_c8_0(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),target :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_c8_0 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_c8_0
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_c8_0 = cudaSuccess
#else
      hipHostUnregister_c8_0 = hipSuccess
#endif
      hipHostUnregister_c8_0 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_c8_0(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),target :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_c8_0 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_c8_0
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_c8_0 = cudaSuccess
#else
      hipHostRegister_c8_0 = hipSuccess
#endif
      hipHostRegister_c8_0 = hipHostRegister_b(c_loc(hostPtr),2*8_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_c8_0(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,intent(inout) :: devPtr
      complex(8),target                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_c8_0 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_c8_0
#endif
      !
      type(c_ptr) :: cptr
      complex(8),pointer :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_c8_0 = cudaSuccess
#else
      hipHostGetDevicePointer_c8_0 = hipSuccess
#endif
      hipHostGetDevicePointer_c8_0 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,devPtr)
    end function


                                        
    function hipHostUnregister_c8_1(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),target,dimension(:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_c8_1 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_c8_1
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_c8_1 = cudaSuccess
#else
      hipHostUnregister_c8_1 = hipSuccess
#endif
      hipHostUnregister_c8_1 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_c8_1(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),target,dimension(:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_c8_1 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_c8_1
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_c8_1 = cudaSuccess
#else
      hipHostRegister_c8_1 = hipSuccess
#endif
      hipHostRegister_c8_1 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*2*8_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_c8_1(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:),intent(inout) :: devPtr
      complex(8),target,dimension(:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_c8_1 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_c8_1
#endif
      !
      type(c_ptr) :: cptr
      complex(8),pointer,dimension(:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_c8_1 = cudaSuccess
#else
      hipHostGetDevicePointer_c8_1 = hipSuccess
#endif
      hipHostGetDevicePointer_c8_1 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):) => tmp
    end function


                                        
    function hipHostUnregister_c8_2(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),target,dimension(:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_c8_2 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_c8_2
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_c8_2 = cudaSuccess
#else
      hipHostUnregister_c8_2 = hipSuccess
#endif
      hipHostUnregister_c8_2 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_c8_2(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),target,dimension(:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_c8_2 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_c8_2
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_c8_2 = cudaSuccess
#else
      hipHostRegister_c8_2 = hipSuccess
#endif
      hipHostRegister_c8_2 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*2*8_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_c8_2(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:),intent(inout) :: devPtr
      complex(8),target,dimension(:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_c8_2 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_c8_2
#endif
      !
      type(c_ptr) :: cptr
      complex(8),pointer,dimension(:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_c8_2 = cudaSuccess
#else
      hipHostGetDevicePointer_c8_2 = hipSuccess
#endif
      hipHostGetDevicePointer_c8_2 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):) => tmp
    end function


                                        
    function hipHostUnregister_c8_3(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),target,dimension(:,:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_c8_3 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_c8_3
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_c8_3 = cudaSuccess
#else
      hipHostUnregister_c8_3 = hipSuccess
#endif
      hipHostUnregister_c8_3 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_c8_3(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),target,dimension(:,:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_c8_3 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_c8_3
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_c8_3 = cudaSuccess
#else
      hipHostRegister_c8_3 = hipSuccess
#endif
      hipHostRegister_c8_3 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*2*8_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_c8_3(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:),intent(inout) :: devPtr
      complex(8),target,dimension(:,:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_c8_3 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_c8_3
#endif
      !
      type(c_ptr) :: cptr
      complex(8),pointer,dimension(:,:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_c8_3 = cudaSuccess
#else
      hipHostGetDevicePointer_c8_3 = hipSuccess
#endif
      hipHostGetDevicePointer_c8_3 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):,LBOUND(hstPtr,3):) => tmp
    end function


                                        
    function hipHostUnregister_c8_4(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),target,dimension(:,:,:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_c8_4 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_c8_4
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_c8_4 = cudaSuccess
#else
      hipHostUnregister_c8_4 = hipSuccess
#endif
      hipHostUnregister_c8_4 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_c8_4(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),target,dimension(:,:,:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_c8_4 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_c8_4
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_c8_4 = cudaSuccess
#else
      hipHostRegister_c8_4 = hipSuccess
#endif
      hipHostRegister_c8_4 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*2*8_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_c8_4(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:),intent(inout) :: devPtr
      complex(8),target,dimension(:,:,:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_c8_4 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_c8_4
#endif
      !
      type(c_ptr) :: cptr
      complex(8),pointer,dimension(:,:,:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_c8_4 = cudaSuccess
#else
      hipHostGetDevicePointer_c8_4 = hipSuccess
#endif
      hipHostGetDevicePointer_c8_4 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):,LBOUND(hstPtr,3):,LBOUND(hstPtr,4):) => tmp
    end function


                                        
    function hipHostUnregister_c8_5(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),target,dimension(:,:,:,:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_c8_5 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_c8_5
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_c8_5 = cudaSuccess
#else
      hipHostUnregister_c8_5 = hipSuccess
#endif
      hipHostUnregister_c8_5 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_c8_5(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),target,dimension(:,:,:,:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_c8_5 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_c8_5
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_c8_5 = cudaSuccess
#else
      hipHostRegister_c8_5 = hipSuccess
#endif
      hipHostRegister_c8_5 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*2*8_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_c8_5(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:,:),intent(inout) :: devPtr
      complex(8),target,dimension(:,:,:,:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_c8_5 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_c8_5
#endif
      !
      type(c_ptr) :: cptr
      complex(8),pointer,dimension(:,:,:,:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_c8_5 = cudaSuccess
#else
      hipHostGetDevicePointer_c8_5 = hipSuccess
#endif
      hipHostGetDevicePointer_c8_5 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):,LBOUND(hstPtr,3):,LBOUND(hstPtr,4):,LBOUND(hstPtr,5):) => tmp
    end function


                                        
    function hipHostUnregister_c8_6(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),target,dimension(:,:,:,:,:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_c8_6 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_c8_6
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_c8_6 = cudaSuccess
#else
      hipHostUnregister_c8_6 = hipSuccess
#endif
      hipHostUnregister_c8_6 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_c8_6(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),target,dimension(:,:,:,:,:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_c8_6 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_c8_6
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_c8_6 = cudaSuccess
#else
      hipHostRegister_c8_6 = hipSuccess
#endif
      hipHostRegister_c8_6 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*2*8_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_c8_6(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:,:,:),intent(inout) :: devPtr
      complex(8),target,dimension(:,:,:,:,:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_c8_6 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_c8_6
#endif
      !
      type(c_ptr) :: cptr
      complex(8),pointer,dimension(:,:,:,:,:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_c8_6 = cudaSuccess
#else
      hipHostGetDevicePointer_c8_6 = hipSuccess
#endif
      hipHostGetDevicePointer_c8_6 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):,LBOUND(hstPtr,3):,LBOUND(hstPtr,4):,LBOUND(hstPtr,5):,LBOUND(hstPtr,6):) => tmp
    end function


                                        
    function hipHostUnregister_c8_7(hostPtr)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),target,dimension(:,:,:,:,:,:,:) :: hostPtr
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostUnregister_c8_7 
#else
      integer(kind(hipSuccess)) :: hipHostUnregister_c8_7
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostUnregister_c8_7 = cudaSuccess
#else
      hipHostUnregister_c8_7 = hipSuccess
#endif
      hipHostUnregister_c8_7 = hipHostUnregister_b(c_loc(hostPtr))
    end function

                                        
    function hipHostRegister_c8_7(hostPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),target,dimension(:,:,:,:,:,:,:) :: hostPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostRegister_c8_7 
#else
      integer(kind(hipSuccess)) :: hipHostRegister_c8_7
#endif
      !
#ifdef USE_CUDA_NAMES
      hipHostRegister_c8_7 = cudaSuccess
#else
      hipHostRegister_c8_7 = hipSuccess
#endif
      hipHostRegister_c8_7 = hipHostRegister_b(c_loc(hostPtr),SIZE(hostptr)*2*8_8,flags)
    end function

                                        
    function hipHostGetDevicePointer_c8_7(devPtr,hstPtr,flags)
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
      complex(8),pointer,dimension(:,:,:,:,:,:,:),intent(inout) :: devPtr
      complex(8),target,dimension(:,:,:,:,:,:,:)                :: hstPtr
      integer(kind=4),value :: flags
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipHostGetDevicePointer_c8_7 
#else
      integer(kind(hipSuccess)) :: hipHostGetDevicePointer_c8_7
#endif
      !
      type(c_ptr) :: cptr
      complex(8),pointer,dimension(:,:,:,:,:,:,:) :: tmp
      !
#ifdef USE_CUDA_NAMES
      hipHostGetDevicePointer_c8_7 = cudaSuccess
#else
      hipHostGetDevicePointer_c8_7 = hipSuccess
#endif
      hipHostGetDevicePointer_c8_7 = hipHostGetDevicePointer_b(cptr,c_loc(hstPtr),flags)
      call C_F_POINTER(cptr,tmp,SHAPE=SHAPE(hstPtr))
      devPtr(LBOUND(hstPtr,1):,LBOUND(hstPtr,2):,LBOUND(hstPtr,3):,LBOUND(hstPtr,4):,LBOUND(hstPtr,5):,LBOUND(hstPtr,6):,LBOUND(hstPtr,7):) => tmp
    end function


#endif
end module