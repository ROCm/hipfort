module hip

  ! If we use hipnums here, then the user doesn't have to,
  ! they can just 'use hip'
  use hip_enums

  character (len=*),parameter::hipfort_arch = _HIPFORT_ARCH

  interface

#ifdef USE_CUDA_NAMES
     function hipMalloc(ptr,sizeBytes) bind(c, name="cudaMalloc")
#else
     function hipMalloc(ptr,sizeBytes) bind(c, name="hipMalloc")
#endif
       use iso_c_binding
       use hip_enums
       implicit none
       integer(kind(hipSuccess)) :: hipMalloc
       type(c_ptr) :: ptr
       integer(c_size_t), value :: sizeBytes
     end function hipMalloc

#ifdef USE_CUDA_NAMES
     function hipFree(ptr) bind(c, name="cudaFree")
#else
     function hipFree(ptr) bind(c, name="hipFree")
#endif
       use iso_c_binding
       use hip_enums
       implicit none
       integer(kind(hipSuccess)) :: hipFree
       type(c_ptr),value :: ptr
     end function hipFree

#ifdef USE_CUDA_NAMES
     function hipMemcpy(dst,src,sizeBytes,cpykind) bind(c,name="cudaMemcpy")
#else
     function hipMemcpy(dst,src,sizeBytes,cpykind) bind(c,name="hipMemcpy")
#endif
       use iso_c_binding
       use hip_enums
       implicit none
       integer(kind(hipSuccess)) :: hipMemcpy
       type(c_ptr),value :: dst
       type(c_ptr),value :: src
       integer(c_size_t), value :: sizeBytes
       ! We want to make sure we get the right integer for the enum
       integer(kind(hipMemcpyHostToHost)), value :: cpykind

     end function hipMemcpy

#ifdef USE_CUDA_NAMES
     function hipDeviceSynchronize() bind(c, name="cudaDeviceSynchronize")
#else
     function hipDeviceSynchronize() bind(c, name="hipDeviceSynchronize")
#endif
       use iso_c_binding
       use hip_enums
       implicit none
       integer(kind(hipSuccess)) :: hipDeviceSynchronize
     end function hipDeviceSynchronize

#ifdef USE_CUDA_NAMES
    function hipStreamSynchronize(stream) bind(c, name="cudaStreamSynchronize")
#else
    function hipStreamSynchronize(stream) bind(c, name="hipStreamSynchronize")
#endif
      USE iso_c_binding
      USE hip_enums
      implicit none
      integer(KIND(hipSuccess)) :: stream
      integer(KIND(hipSuccess)) :: hipStreamSynchronize
    end function hipStreamSynchronize

    integer(c_int) function hipSetDevice(iDev) &
#ifdef USE_CUDA_NAMES
         BIND(C,NAME='cudaSetDevice')
#else
         BIND(C,NAME='hipSetDevice')
#endif
         use iso_c_binding
         implicit none
         integer(c_int) :: iDev
    end function hipSetDevice

    integer(c_int) function hipMemGetInfo(free,total) &
#ifdef USE_CUDA_NAMES
         BIND(C,NAME='cudaMemGetInfo')
#else
         BIND(C,NAME='hipMemGetInfo')
#endif
         use iso_c_binding
         implicit none
         integer(c_size_t) :: free, total
    end function hipMemGetInfo


  end interface

  contains 
    subroutine hipCheck(hipError_t)
      use hip_enums
      implicit none
      integer(kind(hipSuccess)) :: hipError_t
      if(hipError_t /= hipSuccess)then
         write(*,*) "HIP ERROR: Error code = ", hipError_t
         call exit(hipError_t)
      end if
    end subroutine hipCheck

end module hip
