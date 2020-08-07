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
          
           
module hipfort_hipfft
  use hipfort_hipfft_enums
  use hipfort_hipfft_params
  implicit none

 
  interface
  
#ifdef USE_CUDA_NAMES
    function hipfftPlan1d(plan,nx,myType,batch) bind(c, name="cufftPlan1d")
#else
    function hipfftPlan1d(plan,nx,myType,batch) bind(c, name="hipfftPlan1d")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftPlan1d
      type(c_ptr),intent(INOUT) :: plan
      integer(c_int),value :: nx
      integer(kind(HIPFFT_R2C)),value :: myType
      integer(c_int),value :: batch
    end function

  
#ifdef USE_CUDA_NAMES
    function hipfftPlan2d(plan,nx,ny,myType) bind(c, name="cufftPlan2d")
#else
    function hipfftPlan2d(plan,nx,ny,myType) bind(c, name="hipfftPlan2d")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftPlan2d
      type(c_ptr),intent(INOUT) :: plan
      integer(c_int),value :: nx
      integer(c_int),value :: ny
      integer(kind(HIPFFT_R2C)),value :: myType
    end function

  
#ifdef USE_CUDA_NAMES
    function hipfftPlan3d(plan,nx,ny,nz,myType) bind(c, name="cufftPlan3d")
#else
    function hipfftPlan3d(plan,nx,ny,nz,myType) bind(c, name="hipfftPlan3d")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftPlan3d
      type(c_ptr),intent(INOUT) :: plan
      integer(c_int),value :: nx
      integer(c_int),value :: ny
      integer(c_int),value :: nz
      integer(kind(HIPFFT_R2C)),value :: myType
    end function

  
#ifdef USE_CUDA_NAMES
    function hipfftPlanMany(plan,rank,n,inembed,istride,idist,onembed,ostride,odist,myType,batch) bind(c, name="cufftPlanMany")
#else
    function hipfftPlanMany(plan,rank,n,inembed,istride,idist,onembed,ostride,odist,myType,batch) bind(c, name="hipfftPlanMany")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftPlanMany
      type(c_ptr),intent(INOUT) :: plan
      integer(c_int),value :: rank
      type(c_ptr),value :: n
      type(c_ptr),value :: inembed
      integer(c_int),value :: istride
      integer(c_int),value :: idist
      type(c_ptr),value :: onembed
      integer(c_int),value :: ostride
      integer(c_int),value :: odist
      integer(kind(HIPFFT_R2C)),value :: myType
      integer(c_int),value :: batch
    end function

  
#ifdef USE_CUDA_NAMES
    function hipfftMakePlan1d(plan,nx,myType,batch,workSize) bind(c, name="cufftMakePlan1d")
#else
    function hipfftMakePlan1d(plan,nx,myType,batch,workSize) bind(c, name="hipfftMakePlan1d")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftMakePlan1d
      type(c_ptr),value :: plan
      integer(c_int),value :: nx
      integer(kind(HIPFFT_R2C)),value :: myType
      integer(c_int),value :: batch
      type(c_ptr),value :: workSize
    end function

  
#ifdef USE_CUDA_NAMES
    function hipfftMakePlan2d(plan,nx,ny,myType,workSize) bind(c, name="cufftMakePlan2d")
#else
    function hipfftMakePlan2d(plan,nx,ny,myType,workSize) bind(c, name="hipfftMakePlan2d")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftMakePlan2d
      type(c_ptr),value :: plan
      integer(c_int),value :: nx
      integer(c_int),value :: ny
      integer(kind(HIPFFT_R2C)),value :: myType
      type(c_ptr),value :: workSize
    end function

  
#ifdef USE_CUDA_NAMES
    function hipfftMakePlan3d(plan,nx,ny,nz,myType,workSize) bind(c, name="cufftMakePlan3d")
#else
    function hipfftMakePlan3d(plan,nx,ny,nz,myType,workSize) bind(c, name="hipfftMakePlan3d")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftMakePlan3d
      type(c_ptr),value :: plan
      integer(c_int),value :: nx
      integer(c_int),value :: ny
      integer(c_int),value :: nz
      integer(kind(HIPFFT_R2C)),value :: myType
      type(c_ptr),value :: workSize
    end function

  
#ifdef USE_CUDA_NAMES
    function hipfftMakePlanMany(plan,rank,n,inembed,istride,idist,onembed,ostride,odist,myType,batch,workSize) bind(c, name="cufftMakePlanMany")
#else
    function hipfftMakePlanMany(plan,rank,n,inembed,istride,idist,onembed,ostride,odist,myType,batch,workSize) bind(c, name="hipfftMakePlanMany")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftMakePlanMany
      type(c_ptr),value :: plan
      integer(c_int),value :: rank
      type(c_ptr),value :: n
      type(c_ptr),value :: inembed
      integer(c_int),value :: istride
      integer(c_int),value :: idist
      type(c_ptr),value :: onembed
      integer(c_int),value :: ostride
      integer(c_int),value :: odist
      integer(kind(HIPFFT_R2C)),value :: myType
      integer(c_int),value :: batch
      type(c_ptr),value :: workSize
    end function

  
#ifdef USE_CUDA_NAMES
    function hipfftMakePlanMany64(plan,rank,n,inembed,istride,idist,onembed,ostride,odist,myType,batch,workSize) bind(c, name="cufftMakePlanMany64")
#else
    function hipfftMakePlanMany64(plan,rank,n,inembed,istride,idist,onembed,ostride,odist,myType,batch,workSize) bind(c, name="hipfftMakePlanMany64")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftMakePlanMany64
      type(c_ptr),value :: plan
      integer(c_int),value :: rank
      type(c_ptr),value :: n
      type(c_ptr),value :: inembed
      integer(c_long_long),value :: istride
      integer(c_long_long),value :: idist
      type(c_ptr),value :: onembed
      integer(c_long_long),value :: ostride
      integer(c_long_long),value :: odist
      integer(kind(HIPFFT_R2C)),value :: myType
      integer(c_long_long),value :: batch
      type(c_ptr),value :: workSize
    end function

  
#ifdef USE_CUDA_NAMES
    function hipfftGetSizeMany64(plan,rank,n,inembed,istride,idist,onembed,ostride,odist,myType,batch,workSize) bind(c, name="cufftGetSizeMany64")
#else
    function hipfftGetSizeMany64(plan,rank,n,inembed,istride,idist,onembed,ostride,odist,myType,batch,workSize) bind(c, name="hipfftGetSizeMany64")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSizeMany64
      type(c_ptr),value :: plan
      integer(c_int),value :: rank
      type(c_ptr),value :: n
      type(c_ptr),value :: inembed
      integer(c_long_long),value :: istride
      integer(c_long_long),value :: idist
      type(c_ptr),value :: onembed
      integer(c_long_long),value :: ostride
      integer(c_long_long),value :: odist
      integer(kind(HIPFFT_R2C)),value :: myType
      integer(c_long_long),value :: batch
      type(c_ptr),value :: workSize
    end function

  
#ifdef USE_CUDA_NAMES
    function hipfftEstimate1d(nx,myType,batch,workSize) bind(c, name="cufftEstimate1d")
#else
    function hipfftEstimate1d(nx,myType,batch,workSize) bind(c, name="hipfftEstimate1d")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftEstimate1d
      integer(c_int),value :: nx
      integer(kind(HIPFFT_R2C)),value :: myType
      integer(c_int),value :: batch
      type(c_ptr),value :: workSize
    end function

  
#ifdef USE_CUDA_NAMES
    function hipfftEstimate2d(nx,ny,myType,workSize) bind(c, name="cufftEstimate2d")
#else
    function hipfftEstimate2d(nx,ny,myType,workSize) bind(c, name="hipfftEstimate2d")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftEstimate2d
      integer(c_int),value :: nx
      integer(c_int),value :: ny
      integer(kind(HIPFFT_R2C)),value :: myType
      type(c_ptr),value :: workSize
    end function

  
#ifdef USE_CUDA_NAMES
    function hipfftEstimate3d(nx,ny,nz,myType,workSize) bind(c, name="cufftEstimate3d")
#else
    function hipfftEstimate3d(nx,ny,nz,myType,workSize) bind(c, name="hipfftEstimate3d")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftEstimate3d
      integer(c_int),value :: nx
      integer(c_int),value :: ny
      integer(c_int),value :: nz
      integer(kind(HIPFFT_R2C)),value :: myType
      type(c_ptr),value :: workSize
    end function

  
#ifdef USE_CUDA_NAMES
    function hipfftEstimateMany(rank,n,inembed,istride,idist,onembed,ostride,odist,myType,batch,workSize) bind(c, name="cufftEstimateMany")
#else
    function hipfftEstimateMany(rank,n,inembed,istride,idist,onembed,ostride,odist,myType,batch,workSize) bind(c, name="hipfftEstimateMany")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftEstimateMany
      integer(c_int),value :: rank
      type(c_ptr),value :: n
      type(c_ptr),value :: inembed
      integer(c_int),value :: istride
      integer(c_int),value :: idist
      type(c_ptr),value :: onembed
      integer(c_int),value :: ostride
      integer(c_int),value :: odist
      integer(kind(HIPFFT_R2C)),value :: myType
      integer(c_int),value :: batch
      type(c_ptr),value :: workSize
    end function

  
#ifdef USE_CUDA_NAMES
    function hipfftCreate(plan) bind(c, name="cufftCreate")
#else
    function hipfftCreate(plan) bind(c, name="hipfftCreate")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftCreate
      type(c_ptr),intent(INOUT) :: plan
    end function

  
#ifdef USE_CUDA_NAMES
    function hipfftGetSize1d(plan,nx,myType,batch,workSize) bind(c, name="cufftGetSize1d")
#else
    function hipfftGetSize1d(plan,nx,myType,batch,workSize) bind(c, name="hipfftGetSize1d")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSize1d
      type(c_ptr),value :: plan
      integer(c_int),value :: nx
      integer(kind(HIPFFT_R2C)),value :: myType
      integer(c_int),value :: batch
      type(c_ptr),value :: workSize
    end function

  
#ifdef USE_CUDA_NAMES
    function hipfftGetSize2d(plan,nx,ny,myType,workSize) bind(c, name="cufftGetSize2d")
#else
    function hipfftGetSize2d(plan,nx,ny,myType,workSize) bind(c, name="hipfftGetSize2d")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSize2d
      type(c_ptr),value :: plan
      integer(c_int),value :: nx
      integer(c_int),value :: ny
      integer(kind(HIPFFT_R2C)),value :: myType
      type(c_ptr),value :: workSize
    end function

  
#ifdef USE_CUDA_NAMES
    function hipfftGetSize3d(plan,nx,ny,nz,myType,workSize) bind(c, name="cufftGetSize3d")
#else
    function hipfftGetSize3d(plan,nx,ny,nz,myType,workSize) bind(c, name="hipfftGetSize3d")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSize3d
      type(c_ptr),value :: plan
      integer(c_int),value :: nx
      integer(c_int),value :: ny
      integer(c_int),value :: nz
      integer(kind(HIPFFT_R2C)),value :: myType
      type(c_ptr),value :: workSize
    end function

  
#ifdef USE_CUDA_NAMES
    function hipfftGetSizeMany(plan,rank,n,inembed,istride,idist,onembed,ostride,odist,myType,batch,workSize) bind(c, name="cufftGetSizeMany")
#else
    function hipfftGetSizeMany(plan,rank,n,inembed,istride,idist,onembed,ostride,odist,myType,batch,workSize) bind(c, name="hipfftGetSizeMany")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSizeMany
      type(c_ptr),value :: plan
      integer(c_int),value :: rank
      type(c_ptr),value :: n
      type(c_ptr),value :: inembed
      integer(c_int),value :: istride
      integer(c_int),value :: idist
      type(c_ptr),value :: onembed
      integer(c_int),value :: ostride
      integer(c_int),value :: odist
      integer(kind(HIPFFT_R2C)),value :: myType
      integer(c_int),value :: batch
      type(c_ptr),value :: workSize
    end function

  
#ifdef USE_CUDA_NAMES
    function hipfftGetSize(plan,workSize) bind(c, name="cufftGetSize")
#else
    function hipfftGetSize(plan,workSize) bind(c, name="hipfftGetSize")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSize
      type(c_ptr),value :: plan
      type(c_ptr),value :: workSize
    end function

  
#ifdef USE_CUDA_NAMES
    function hipfftSetWorkArea(plan,workArea) bind(c, name="cufftSetWorkArea")
#else
    function hipfftSetWorkArea(plan,workArea) bind(c, name="hipfftSetWorkArea")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftSetWorkArea
      type(c_ptr),value :: plan
      type(c_ptr),value :: workArea
    end function

  
#ifdef USE_CUDA_NAMES
    function hipfftSetAutoAllocation(plan,autoAllocate) bind(c, name="cufftSetAutoAllocation")
#else
    function hipfftSetAutoAllocation(plan,autoAllocate) bind(c, name="hipfftSetAutoAllocation")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftSetAutoAllocation
      type(c_ptr),value :: plan
      integer(c_int),value :: autoAllocate
    end function

  
#ifdef USE_CUDA_NAMES
    function hipfftExecC2C(plan,idata,odata,direction) bind(c, name="cufftExecC2C")
#else
    function hipfftExecC2C(plan,idata,odata,direction) bind(c, name="hipfftExecC2C")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecC2C
      type(c_ptr),value :: plan
      type(c_ptr),value :: idata
      type(c_ptr),value :: odata
      integer(c_int),value :: direction
    end function

  
#ifdef USE_CUDA_NAMES
    function hipfftExecR2C(plan,idata,odata) bind(c, name="cufftExecR2C")
#else
    function hipfftExecR2C(plan,idata,odata) bind(c, name="hipfftExecR2C")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecR2C
      type(c_ptr),value :: plan
      type(c_ptr),value :: idata
      type(c_ptr),value :: odata
    end function

  
#ifdef USE_CUDA_NAMES
    function hipfftExecC2R(plan,idata,odata) bind(c, name="cufftExecC2R")
#else
    function hipfftExecC2R(plan,idata,odata) bind(c, name="hipfftExecC2R")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecC2R
      type(c_ptr),value :: plan
      type(c_ptr),value :: idata
      type(c_ptr),value :: odata
    end function

  
#ifdef USE_CUDA_NAMES
    function hipfftExecZ2Z(plan,idata,odata,direction) bind(c, name="cufftExecZ2Z")
#else
    function hipfftExecZ2Z(plan,idata,odata,direction) bind(c, name="hipfftExecZ2Z")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecZ2Z
      type(c_ptr),value :: plan
      type(c_ptr),value :: idata
      type(c_ptr),value :: odata
      integer(c_int),value :: direction
    end function

  
#ifdef USE_CUDA_NAMES
    function hipfftExecD2Z(plan,idata,odata) bind(c, name="cufftExecD2Z")
#else
    function hipfftExecD2Z(plan,idata,odata) bind(c, name="hipfftExecD2Z")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecD2Z
      type(c_ptr),value :: plan
      type(c_ptr),value :: idata
      type(c_ptr),value :: odata
    end function

  
#ifdef USE_CUDA_NAMES
    function hipfftExecZ2D(plan,idata,odata) bind(c, name="cufftExecZ2D")
#else
    function hipfftExecZ2D(plan,idata,odata) bind(c, name="hipfftExecZ2D")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecZ2D
      type(c_ptr),value :: plan
      type(c_ptr),value :: idata
      type(c_ptr),value :: odata
    end function

  
#ifdef USE_CUDA_NAMES
    function hipfftSetStream(plan,stream) bind(c, name="cufftSetStream")
#else
    function hipfftSetStream(plan,stream) bind(c, name="hipfftSetStream")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftSetStream
      type(c_ptr),value :: plan
      type(c_ptr),value :: stream
    end function

  ! 
  ! DLL_PUBLIC hipfftResult hipfftSetCompatibilityMode(hipfftHandle plan,
  !                                                hipfftCompatibility mode);
  ! 
#ifdef USE_CUDA_NAMES
    function hipfftDestroy(plan) bind(c, name="cufftDestroy")
#else
    function hipfftDestroy(plan) bind(c, name="hipfftDestroy")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftDestroy
      type(c_ptr),value :: plan
    end function

  
#ifdef USE_CUDA_NAMES
    function hipfftGetVersion(version) bind(c, name="cufftGetVersion")
#else
    function hipfftGetVersion(version) bind(c, name="hipfftGetVersion")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetVersion
      type(c_ptr),value :: version
    end function

  
#ifdef USE_CUDA_NAMES
    function hipfftGetProperty(myType,myValue) bind(c, name="cufftGetProperty")
#else
    function hipfftGetProperty(myType,myValue) bind(c, name="hipfftGetProperty")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetProperty
      integer(kind(HIPFFT_MAJOR_VERSION)),value :: myType
      type(c_ptr),value :: myValue
    end function

  end interface
  
end module hipfort_hipfft