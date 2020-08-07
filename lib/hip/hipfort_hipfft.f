!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Copyright (c) 2020 Advanced Micro Devices, Inc.
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
! FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
! AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
! LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
! OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
! THE SOFTWARE.
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          
           
module hipfort_hipfft
  use hipfort_hipfft_enums
  implicit none

 
  interface
  
    function hipfftPlan1d(plan,nx,myType,batch) bind(c, name="hipfftPlan1d")
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftPlan1d
      type(c_ptr),intent(INOUT) :: plan
      integer(c_int),value :: nx
      integer(kind(HIPFFT_R2C)),value :: myType
      integer(c_int),value :: batch
    end function

  
    function hipfftPlan2d(plan,nx,ny,myType) bind(c, name="hipfftPlan2d")
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftPlan2d
      type(c_ptr),intent(INOUT) :: plan
      integer(c_int),value :: nx
      integer(c_int),value :: ny
      integer(kind(HIPFFT_R2C)),value :: myType
    end function

  
    function hipfftPlan3d(plan,nx,ny,nz,myType) bind(c, name="hipfftPlan3d")
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

  
    function hipfftPlanMany(plan,rank,n,inembed,istride,idist,onembed,ostride,odist,myType,batch) bind(c, name="hipfftPlanMany")
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

  
    function hipfftMakePlan1d(plan,nx,myType,batch,workSize) bind(c, name="hipfftMakePlan1d")
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

  
    function hipfftMakePlan2d(plan,nx,ny,myType,workSize) bind(c, name="hipfftMakePlan2d")
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

  
    function hipfftMakePlan3d(plan,nx,ny,nz,myType,workSize) bind(c, name="hipfftMakePlan3d")
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

  
    function hipfftMakePlanMany(plan,rank,n,inembed,istride,idist,onembed,ostride,odist,myType,batch,workSize) bind(c, name="hipfftMakePlanMany")
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

  
    function hipfftMakePlanMany64(plan,rank,n,inembed,istride,idist,onembed,ostride,odist,myType,batch,workSize) bind(c, name="hipfftMakePlanMany64")
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

  
    function hipfftGetSizeMany64(plan,rank,n,inembed,istride,idist,onembed,ostride,odist,myType,batch,workSize) bind(c, name="hipfftGetSizeMany64")
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

  
    function hipfftEstimate1d(nx,myType,batch,workSize) bind(c, name="hipfftEstimate1d")
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftEstimate1d
      integer(c_int),value :: nx
      integer(kind(HIPFFT_R2C)),value :: myType
      integer(c_int),value :: batch
      type(c_ptr),value :: workSize
    end function

  
    function hipfftEstimate2d(nx,ny,myType,workSize) bind(c, name="hipfftEstimate2d")
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftEstimate2d
      integer(c_int),value :: nx
      integer(c_int),value :: ny
      integer(kind(HIPFFT_R2C)),value :: myType
      type(c_ptr),value :: workSize
    end function

  
    function hipfftEstimate3d(nx,ny,nz,myType,workSize) bind(c, name="hipfftEstimate3d")
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

  
    function hipfftEstimateMany(rank,n,inembed,istride,idist,onembed,ostride,odist,myType,batch,workSize) bind(c, name="hipfftEstimateMany")
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

  
    function hipfftCreate(plan) bind(c, name="hipfftCreate")
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftCreate
      type(c_ptr),intent(INOUT) :: plan
    end function

  
    function hipfftGetSize1d(plan,nx,myType,batch,workSize) bind(c, name="hipfftGetSize1d")
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

  
    function hipfftGetSize2d(plan,nx,ny,myType,workSize) bind(c, name="hipfftGetSize2d")
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

  
    function hipfftGetSize3d(plan,nx,ny,nz,myType,workSize) bind(c, name="hipfftGetSize3d")
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

  
    function hipfftGetSizeMany(plan,rank,n,inembed,istride,idist,onembed,ostride,odist,myType,batch,workSize) bind(c, name="hipfftGetSizeMany")
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

  
    function hipfftGetSize(plan,workSize) bind(c, name="hipfftGetSize")
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSize
      type(c_ptr),value :: plan
      type(c_ptr),value :: workSize
    end function

  
    function hipfftSetWorkArea(plan,workArea) bind(c, name="hipfftSetWorkArea")
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftSetWorkArea
      type(c_ptr),value :: plan
      type(c_ptr),value :: workArea
    end function

  
    function hipfftSetAutoAllocation(plan,autoAllocate) bind(c, name="hipfftSetAutoAllocation")
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftSetAutoAllocation
      type(c_ptr),value :: plan
      integer(c_int),value :: autoAllocate
    end function

  
    function hipfftExecC2C(plan,idata,odata,direction) bind(c, name="hipfftExecC2C")
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecC2C
      type(c_ptr),value :: plan
      type(c_ptr),value :: idata
      type(c_ptr),value :: odata
      integer(c_int),value :: direction
    end function

  
    function hipfftExecR2C(plan,idata,odata) bind(c, name="hipfftExecR2C")
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecR2C
      type(c_ptr),value :: plan
      type(c_ptr),value :: idata
      type(c_ptr),value :: odata
    end function

  
    function hipfftExecC2R(plan,idata,odata) bind(c, name="hipfftExecC2R")
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecC2R
      type(c_ptr),value :: plan
      type(c_ptr),value :: idata
      type(c_ptr),value :: odata
    end function

  
    function hipfftExecZ2Z(plan,idata,odata,direction) bind(c, name="hipfftExecZ2Z")
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecZ2Z
      type(c_ptr),value :: plan
      type(c_ptr),value :: idata
      type(c_ptr),value :: odata
      integer(c_int),value :: direction
    end function

  
    function hipfftExecD2Z(plan,idata,odata) bind(c, name="hipfftExecD2Z")
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecD2Z
      type(c_ptr),value :: plan
      type(c_ptr),value :: idata
      type(c_ptr),value :: odata
    end function

  
    function hipfftExecZ2D(plan,idata,odata) bind(c, name="hipfftExecZ2D")
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecZ2D
      type(c_ptr),value :: plan
      type(c_ptr),value :: idata
      type(c_ptr),value :: odata
    end function

  
    function hipfftSetStream(plan,stream) bind(c, name="hipfftSetStream")
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
    function hipfftDestroy(plan) bind(c, name="hipfftDestroy")
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftDestroy
      type(c_ptr),value :: plan
    end function

  
    function hipfftGetVersion(version) bind(c, name="hipfftGetVersion")
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetVersion
      type(c_ptr),value :: version
    end function

  
    function hipfftGetProperty(myType,myValue) bind(c, name="hipfftGetProperty")
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetProperty
      integer(kind(HIPFFT_MAJOR_VERSION)),value :: myType
      type(c_ptr),value :: myValue
    end function

  end interface
  
end module hipfort_hipfft