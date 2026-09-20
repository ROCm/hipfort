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

! Typed-handle wrappers, included into the module contains section.

    function hipfftPlan1d_typed(plan, nx, myType, batch) result(Plan1d)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t) :: plan
      integer(c_int), value :: nx
      integer(kind(HIPFFT_R2C)), value :: myType
      integer(c_int), value :: batch
      integer(kind(HIPFFT_SUCCESS)) :: Plan1d
      Plan1d = hipfftPlan1d_(plan%ptr, nx, myType, batch)
    end function hipfftPlan1d_typed

    function hipfftPlan2d_typed(plan, nx, ny, myType) result(Plan2d)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t) :: plan
      integer(c_int), value :: nx
      integer(c_int), value :: ny
      integer(kind(HIPFFT_R2C)), value :: myType
      integer(kind(HIPFFT_SUCCESS)) :: Plan2d
      Plan2d = hipfftPlan2d_(plan%ptr, nx, ny, myType)
    end function hipfftPlan2d_typed

    function hipfftPlan3d_typed(plan, nx, ny, nz, myType) result(Plan3d)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t) :: plan
      integer(c_int), value :: nx
      integer(c_int), value :: ny
      integer(c_int), value :: nz
      integer(kind(HIPFFT_R2C)), value :: myType
      integer(kind(HIPFFT_SUCCESS)) :: Plan3d
      Plan3d = hipfftPlan3d_(plan%ptr, nx, ny, nz, myType)
    end function hipfftPlan3d_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipfftPlanMany_assumed_rank(plan,rank,n,inembed,istride,idist,onembed,ostride,odist, &
        myType,batch)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftPlanMany_assumed_rank
      type(hipfftHandle_t) :: plan
      integer(c_int) :: rank
      integer(c_int),target,contiguous,dimension(..) :: n
      integer(c_int),target,contiguous,dimension(..) :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      integer(c_int),target,contiguous,dimension(..) :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int) :: batch
      !
      hipfftPlanMany_assumed_rank = hipfftPlanMany_(plan%ptr,rank,c_loc(n),c_loc(inembed),istride, &
        idist,c_loc(onembed),ostride,odist,myType,batch)
    end function

    function hipfftPlanMany_assumed_rank_cptr(plan,rank,n,inembed,istride,idist,onembed,ostride, &
        odist,myType,batch)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftPlanMany_assumed_rank_cptr
      type(c_ptr) :: plan
      integer(c_int) :: rank
      integer(c_int),target,contiguous,dimension(..) :: n
      integer(c_int),target,contiguous,dimension(..) :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      integer(c_int),target,contiguous,dimension(..) :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int) :: batch
      !
      hipfftPlanMany_assumed_rank_cptr = hipfftPlanMany_(plan,rank,c_loc(n),c_loc(inembed), &
        istride,idist,c_loc(onembed),ostride,odist,myType,batch)
    end function

#else
    function hipfftPlanMany_rank_0(plan,rank,n,inembed,istride,idist,onembed,ostride,odist,myType, &
        batch)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftPlanMany_rank_0
      type(hipfftHandle_t) :: plan
      integer(c_int) :: rank
      integer(c_int),target :: n
      integer(c_int),target :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      integer(c_int),target :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int) :: batch
      !
      hipfftPlanMany_rank_0 = hipfftPlanMany_(plan%ptr,rank,c_loc(n),c_loc(inembed),istride,idist, &
        c_loc(onembed),ostride,odist,myType,batch)
    end function

    function hipfftPlanMany_rank_0_cptr(plan,rank,n,inembed,istride,idist,onembed,ostride,odist, &
        myType,batch)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftPlanMany_rank_0_cptr
      type(c_ptr) :: plan
      integer(c_int) :: rank
      integer(c_int),target :: n
      integer(c_int),target :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      integer(c_int),target :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int) :: batch
      !
      hipfftPlanMany_rank_0_cptr = hipfftPlanMany_(plan,rank,c_loc(n),c_loc(inembed),istride, &
        idist,c_loc(onembed),ostride,odist,myType,batch)
    end function

    function hipfftPlanMany_rank_1(plan,rank,n,inembed,istride,idist,onembed,ostride,odist,myType, &
        batch)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftPlanMany_rank_1
      type(hipfftHandle_t) :: plan
      integer(c_int) :: rank
      integer(c_int),target,dimension(:) :: n
      integer(c_int),target,dimension(:) :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      integer(c_int),target,dimension(:) :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int) :: batch
      !
      hipfftPlanMany_rank_1 = hipfftPlanMany_(plan%ptr,rank,c_loc(n),c_loc(inembed),istride,idist, &
        c_loc(onembed),ostride,odist,myType,batch)
    end function

    function hipfftPlanMany_rank_1_cptr(plan,rank,n,inembed,istride,idist,onembed,ostride,odist, &
        myType,batch)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftPlanMany_rank_1_cptr
      type(c_ptr) :: plan
      integer(c_int) :: rank
      integer(c_int),target,dimension(:) :: n
      integer(c_int),target,dimension(:) :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      integer(c_int),target,dimension(:) :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int) :: batch
      !
      hipfftPlanMany_rank_1_cptr = hipfftPlanMany_(plan,rank,c_loc(n),c_loc(inembed),istride, &
        idist,c_loc(onembed),ostride,odist,myType,batch)
    end function

#endif
    function hipfftPlanMany_typed(plan, rank, n, inembed, istride, idist, onembed, ostride, odist, &
        myType, batch) result(PlanMany)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t) :: plan
      integer(c_int), value :: rank
      type(c_ptr), value :: n
      type(c_ptr), value :: inembed
      integer(c_int), value :: istride
      integer(c_int), value :: idist
      type(c_ptr), value :: onembed
      integer(c_int), value :: ostride
      integer(c_int), value :: odist
      integer(kind(HIPFFT_R2C)), value :: myType
      integer(c_int), value :: batch
      integer(kind(HIPFFT_SUCCESS)) :: PlanMany
      PlanMany = hipfftPlanMany_(plan%ptr, rank, n, inembed, istride, idist, onembed, ostride, &
        odist, myType, batch)
    end function hipfftPlanMany_typed

    function hipfftCreate_typed(plan) result(Create)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t) :: plan
      integer(kind(HIPFFT_SUCCESS)) :: Create
      Create = hipfftCreate_(plan%ptr)
    end function hipfftCreate_typed

    function hipfftExtPlanScaleFactor_typed(plan, scalefactor) result(ExtPlanScaleFactor)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      real(c_double), value :: scalefactor
      integer(kind(HIPFFT_SUCCESS)) :: ExtPlanScaleFactor
      ExtPlanScaleFactor = hipfftExtPlanScaleFactor_(plan%ptr, scalefactor)
    end function hipfftExtPlanScaleFactor_typed

    function hipfftMakePlan1d_typed(plan, nx, myType, batch, workSize) result(MakePlan1d)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      integer(c_int), value :: nx
      integer(kind(HIPFFT_R2C)), value :: myType
      integer(c_int), value :: batch
      integer(c_size_t) :: workSize
      integer(kind(HIPFFT_SUCCESS)) :: MakePlan1d
      MakePlan1d = hipfftMakePlan1d_(plan%ptr, nx, myType, batch, workSize)
    end function hipfftMakePlan1d_typed

    function hipfftMakePlan2d_typed(plan, nx, ny, myType, workSize) result(MakePlan2d)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      integer(c_int), value :: nx
      integer(c_int), value :: ny
      integer(kind(HIPFFT_R2C)), value :: myType
      integer(c_size_t) :: workSize
      integer(kind(HIPFFT_SUCCESS)) :: MakePlan2d
      MakePlan2d = hipfftMakePlan2d_(plan%ptr, nx, ny, myType, workSize)
    end function hipfftMakePlan2d_typed

    function hipfftMakePlan3d_typed(plan, nx, ny, nz, myType, workSize) result(MakePlan3d)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      integer(c_int), value :: nx
      integer(c_int), value :: ny
      integer(c_int), value :: nz
      integer(kind(HIPFFT_R2C)), value :: myType
      integer(c_size_t) :: workSize
      integer(kind(HIPFFT_SUCCESS)) :: MakePlan3d
      MakePlan3d = hipfftMakePlan3d_(plan%ptr, nx, ny, nz, myType, workSize)
    end function hipfftMakePlan3d_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipfftMakePlanMany_assumed_rank(plan,rank,n,inembed,istride,idist,onembed,ostride, &
        odist,myType,batch,workSize)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftMakePlanMany_assumed_rank
      type(hipfftHandle_t) :: plan
      integer(c_int) :: rank
      integer(c_int),target,contiguous,dimension(..) :: n
      integer(c_int),target,contiguous,dimension(..) :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      integer(c_int),target,contiguous,dimension(..) :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int) :: batch
      integer(c_size_t) :: workSize
      !
      hipfftMakePlanMany_assumed_rank = hipfftMakePlanMany_(plan%ptr,rank,c_loc(n),c_loc(inembed), &
        istride,idist,c_loc(onembed),ostride,odist,myType,batch,workSize)
    end function

    function hipfftMakePlanMany_assumed_rank_cptr(plan,rank,n,inembed,istride,idist,onembed, &
        ostride,odist,myType,batch,workSize)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftMakePlanMany_assumed_rank_cptr
      type(c_ptr) :: plan
      integer(c_int) :: rank
      integer(c_int),target,contiguous,dimension(..) :: n
      integer(c_int),target,contiguous,dimension(..) :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      integer(c_int),target,contiguous,dimension(..) :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int) :: batch
      integer(c_size_t) :: workSize
      !
      hipfftMakePlanMany_assumed_rank_cptr = hipfftMakePlanMany_(plan,rank,c_loc(n), &
        c_loc(inembed),istride,idist,c_loc(onembed),ostride,odist,myType,batch,workSize)
    end function

#else
    function hipfftMakePlanMany_rank_0(plan,rank,n,inembed,istride,idist,onembed,ostride,odist, &
        myType,batch,workSize)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftMakePlanMany_rank_0
      type(hipfftHandle_t) :: plan
      integer(c_int) :: rank
      integer(c_int),target :: n
      integer(c_int),target :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      integer(c_int),target :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int) :: batch
      integer(c_size_t) :: workSize
      !
      hipfftMakePlanMany_rank_0 = hipfftMakePlanMany_(plan%ptr,rank,c_loc(n),c_loc(inembed), &
        istride,idist,c_loc(onembed),ostride,odist,myType,batch,workSize)
    end function

    function hipfftMakePlanMany_rank_0_cptr(plan,rank,n,inembed,istride,idist,onembed,ostride, &
        odist,myType,batch,workSize)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftMakePlanMany_rank_0_cptr
      type(c_ptr) :: plan
      integer(c_int) :: rank
      integer(c_int),target :: n
      integer(c_int),target :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      integer(c_int),target :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int) :: batch
      integer(c_size_t) :: workSize
      !
      hipfftMakePlanMany_rank_0_cptr = hipfftMakePlanMany_(plan,rank,c_loc(n),c_loc(inembed), &
        istride,idist,c_loc(onembed),ostride,odist,myType,batch,workSize)
    end function

    function hipfftMakePlanMany_rank_1(plan,rank,n,inembed,istride,idist,onembed,ostride,odist, &
        myType,batch,workSize)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftMakePlanMany_rank_1
      type(hipfftHandle_t) :: plan
      integer(c_int) :: rank
      integer(c_int),target,dimension(:) :: n
      integer(c_int),target,dimension(:) :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      integer(c_int),target,dimension(:) :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int) :: batch
      integer(c_size_t) :: workSize
      !
      hipfftMakePlanMany_rank_1 = hipfftMakePlanMany_(plan%ptr,rank,c_loc(n),c_loc(inembed), &
        istride,idist,c_loc(onembed),ostride,odist,myType,batch,workSize)
    end function

    function hipfftMakePlanMany_rank_1_cptr(plan,rank,n,inembed,istride,idist,onembed,ostride, &
        odist,myType,batch,workSize)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftMakePlanMany_rank_1_cptr
      type(c_ptr) :: plan
      integer(c_int) :: rank
      integer(c_int),target,dimension(:) :: n
      integer(c_int),target,dimension(:) :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      integer(c_int),target,dimension(:) :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int) :: batch
      integer(c_size_t) :: workSize
      !
      hipfftMakePlanMany_rank_1_cptr = hipfftMakePlanMany_(plan,rank,c_loc(n),c_loc(inembed), &
        istride,idist,c_loc(onembed),ostride,odist,myType,batch,workSize)
    end function

#endif
    function hipfftMakePlanMany_typed(plan, rank, n, inembed, istride, idist, onembed, ostride, &
        odist, myType, batch, workSize) result(MakePlanMany)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      integer(c_int), value :: rank
      type(c_ptr), value :: n
      type(c_ptr), value :: inembed
      integer(c_int), value :: istride
      integer(c_int), value :: idist
      type(c_ptr), value :: onembed
      integer(c_int), value :: ostride
      integer(c_int), value :: odist
      integer(kind(HIPFFT_R2C)), value :: myType
      integer(c_int), value :: batch
      integer(c_size_t) :: workSize
      integer(kind(HIPFFT_SUCCESS)) :: MakePlanMany
      MakePlanMany = hipfftMakePlanMany_(plan%ptr, rank, n, inembed, istride, idist, onembed, &
        ostride, odist, myType, batch, workSize)
    end function hipfftMakePlanMany_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipfftMakePlanMany64_assumed_rank(plan,rank,n,inembed,istride,idist,onembed,ostride, &
        odist,myType,batch,workSize)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftMakePlanMany64_assumed_rank
      type(hipfftHandle_t) :: plan
      integer(c_int) :: rank
      integer(c_int64_t),target,contiguous,dimension(..) :: n
      integer(c_int64_t),target,contiguous,dimension(..) :: inembed
      integer(c_int64_t) :: istride
      integer(c_int64_t) :: idist
      integer(c_int64_t),target,contiguous,dimension(..) :: onembed
      integer(c_int64_t) :: ostride
      integer(c_int64_t) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int64_t) :: batch
      integer(c_size_t) :: workSize
      !
      hipfftMakePlanMany64_assumed_rank = hipfftMakePlanMany64_(plan%ptr,rank,c_loc(n), &
        c_loc(inembed),istride,idist,c_loc(onembed),ostride,odist,myType,batch,workSize)
    end function

    function hipfftMakePlanMany64_assumed_rank_cptr(plan,rank,n,inembed,istride,idist,onembed, &
        ostride,odist,myType,batch,workSize)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftMakePlanMany64_assumed_rank_cptr
      type(c_ptr) :: plan
      integer(c_int) :: rank
      integer(c_int64_t),target,contiguous,dimension(..) :: n
      integer(c_int64_t),target,contiguous,dimension(..) :: inembed
      integer(c_int64_t) :: istride
      integer(c_int64_t) :: idist
      integer(c_int64_t),target,contiguous,dimension(..) :: onembed
      integer(c_int64_t) :: ostride
      integer(c_int64_t) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int64_t) :: batch
      integer(c_size_t) :: workSize
      !
      hipfftMakePlanMany64_assumed_rank_cptr = hipfftMakePlanMany64_(plan,rank,c_loc(n), &
        c_loc(inembed),istride,idist,c_loc(onembed),ostride,odist,myType,batch,workSize)
    end function

#else
    function hipfftMakePlanMany64_rank_0(plan,rank,n,inembed,istride,idist,onembed,ostride,odist, &
        myType,batch,workSize)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftMakePlanMany64_rank_0
      type(hipfftHandle_t) :: plan
      integer(c_int) :: rank
      integer(c_int64_t),target :: n
      integer(c_int64_t),target :: inembed
      integer(c_int64_t) :: istride
      integer(c_int64_t) :: idist
      integer(c_int64_t),target :: onembed
      integer(c_int64_t) :: ostride
      integer(c_int64_t) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int64_t) :: batch
      integer(c_size_t) :: workSize
      !
      hipfftMakePlanMany64_rank_0 = hipfftMakePlanMany64_(plan%ptr,rank,c_loc(n),c_loc(inembed), &
        istride,idist,c_loc(onembed),ostride,odist,myType,batch,workSize)
    end function

    function hipfftMakePlanMany64_rank_0_cptr(plan,rank,n,inembed,istride,idist,onembed,ostride, &
        odist,myType,batch,workSize)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftMakePlanMany64_rank_0_cptr
      type(c_ptr) :: plan
      integer(c_int) :: rank
      integer(c_int64_t),target :: n
      integer(c_int64_t),target :: inembed
      integer(c_int64_t) :: istride
      integer(c_int64_t) :: idist
      integer(c_int64_t),target :: onembed
      integer(c_int64_t) :: ostride
      integer(c_int64_t) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int64_t) :: batch
      integer(c_size_t) :: workSize
      !
      hipfftMakePlanMany64_rank_0_cptr = hipfftMakePlanMany64_(plan,rank,c_loc(n),c_loc(inembed), &
        istride,idist,c_loc(onembed),ostride,odist,myType,batch,workSize)
    end function

    function hipfftMakePlanMany64_rank_1(plan,rank,n,inembed,istride,idist,onembed,ostride,odist, &
        myType,batch,workSize)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftMakePlanMany64_rank_1
      type(hipfftHandle_t) :: plan
      integer(c_int) :: rank
      integer(c_int64_t),target,dimension(:) :: n
      integer(c_int64_t),target,dimension(:) :: inembed
      integer(c_int64_t) :: istride
      integer(c_int64_t) :: idist
      integer(c_int64_t),target,dimension(:) :: onembed
      integer(c_int64_t) :: ostride
      integer(c_int64_t) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int64_t) :: batch
      integer(c_size_t) :: workSize
      !
      hipfftMakePlanMany64_rank_1 = hipfftMakePlanMany64_(plan%ptr,rank,c_loc(n),c_loc(inembed), &
        istride,idist,c_loc(onembed),ostride,odist,myType,batch,workSize)
    end function

    function hipfftMakePlanMany64_rank_1_cptr(plan,rank,n,inembed,istride,idist,onembed,ostride, &
        odist,myType,batch,workSize)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftMakePlanMany64_rank_1_cptr
      type(c_ptr) :: plan
      integer(c_int) :: rank
      integer(c_int64_t),target,dimension(:) :: n
      integer(c_int64_t),target,dimension(:) :: inembed
      integer(c_int64_t) :: istride
      integer(c_int64_t) :: idist
      integer(c_int64_t),target,dimension(:) :: onembed
      integer(c_int64_t) :: ostride
      integer(c_int64_t) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int64_t) :: batch
      integer(c_size_t) :: workSize
      !
      hipfftMakePlanMany64_rank_1_cptr = hipfftMakePlanMany64_(plan,rank,c_loc(n),c_loc(inembed), &
        istride,idist,c_loc(onembed),ostride,odist,myType,batch,workSize)
    end function

#endif
    function hipfftMakePlanMany64_typed(plan, rank, n, inembed, istride, idist, onembed, ostride, &
        odist, myType, batch, workSize) result(MakePlanMany64)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      integer(c_int), value :: rank
      type(c_ptr), value :: n
      type(c_ptr), value :: inembed
      integer(c_int64_t), value :: istride
      integer(c_int64_t), value :: idist
      type(c_ptr), value :: onembed
      integer(c_int64_t), value :: ostride
      integer(c_int64_t), value :: odist
      integer(kind(HIPFFT_R2C)), value :: myType
      integer(c_int64_t), value :: batch
      integer(c_size_t) :: workSize
      integer(kind(HIPFFT_SUCCESS)) :: MakePlanMany64
      MakePlanMany64 = hipfftMakePlanMany64_(plan%ptr, rank, n, inembed, istride, idist, onembed, &
        ostride, odist, myType, batch, workSize)
    end function hipfftMakePlanMany64_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipfftEstimateMany_assumed_rank(rank,n,inembed,istride,idist,onembed,ostride,odist, &
        myType,batch,workSize)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftEstimateMany_assumed_rank
      integer(c_int) :: rank
      integer(c_int),target,contiguous,dimension(..) :: n
      integer(c_int),target,contiguous,dimension(..) :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      integer(c_int),target,contiguous,dimension(..) :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int) :: batch
      integer(c_size_t) :: workSize
      !
      hipfftEstimateMany_assumed_rank = hipfftEstimateMany_(rank,c_loc(n),c_loc(inembed),istride, &
        idist,c_loc(onembed),ostride,odist,myType,batch,workSize)
    end function

#else
    function hipfftEstimateMany_rank_0(rank,n,inembed,istride,idist,onembed,ostride,odist,myType, &
        batch,workSize)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftEstimateMany_rank_0
      integer(c_int) :: rank
      integer(c_int),target :: n
      integer(c_int),target :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      integer(c_int),target :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int) :: batch
      integer(c_size_t) :: workSize
      !
      hipfftEstimateMany_rank_0 = hipfftEstimateMany_(rank,c_loc(n),c_loc(inembed),istride,idist, &
        c_loc(onembed),ostride,odist,myType,batch,workSize)
    end function

    function hipfftEstimateMany_rank_1(rank,n,inembed,istride,idist,onembed,ostride,odist,myType, &
        batch,workSize)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftEstimateMany_rank_1
      integer(c_int) :: rank
      integer(c_int),target,dimension(:) :: n
      integer(c_int),target,dimension(:) :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      integer(c_int),target,dimension(:) :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int) :: batch
      integer(c_size_t) :: workSize
      !
      hipfftEstimateMany_rank_1 = hipfftEstimateMany_(rank,c_loc(n),c_loc(inembed),istride,idist, &
        c_loc(onembed),ostride,odist,myType,batch,workSize)
    end function

#endif
    function hipfftGetSize1d_typed(plan, nx, myType, batch, workSize) result(GetSize1d)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      integer(c_int), value :: nx
      integer(kind(HIPFFT_R2C)), value :: myType
      integer(c_int), value :: batch
      integer(c_size_t) :: workSize
      integer(kind(HIPFFT_SUCCESS)) :: GetSize1d
      GetSize1d = hipfftGetSize1d_(plan%ptr, nx, myType, batch, workSize)
    end function hipfftGetSize1d_typed

    function hipfftGetSize2d_typed(plan, nx, ny, myType, workSize) result(GetSize2d)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      integer(c_int), value :: nx
      integer(c_int), value :: ny
      integer(kind(HIPFFT_R2C)), value :: myType
      integer(c_size_t) :: workSize
      integer(kind(HIPFFT_SUCCESS)) :: GetSize2d
      GetSize2d = hipfftGetSize2d_(plan%ptr, nx, ny, myType, workSize)
    end function hipfftGetSize2d_typed

    function hipfftGetSize3d_typed(plan, nx, ny, nz, myType, workSize) result(GetSize3d)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      integer(c_int), value :: nx
      integer(c_int), value :: ny
      integer(c_int), value :: nz
      integer(kind(HIPFFT_R2C)), value :: myType
      integer(c_size_t) :: workSize
      integer(kind(HIPFFT_SUCCESS)) :: GetSize3d
      GetSize3d = hipfftGetSize3d_(plan%ptr, nx, ny, nz, myType, workSize)
    end function hipfftGetSize3d_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipfftGetSizeMany_assumed_rank(plan,rank,n,inembed,istride,idist,onembed,ostride, &
        odist,myType,batch,workSize)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSizeMany_assumed_rank
      type(hipfftHandle_t) :: plan
      integer(c_int) :: rank
      integer(c_int),target,contiguous,dimension(..) :: n
      integer(c_int),target,contiguous,dimension(..) :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      integer(c_int),target,contiguous,dimension(..) :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int) :: batch
      integer(c_size_t) :: workSize
      !
      hipfftGetSizeMany_assumed_rank = hipfftGetSizeMany_(plan%ptr,rank,c_loc(n),c_loc(inembed), &
        istride,idist,c_loc(onembed),ostride,odist,myType,batch,workSize)
    end function

    function hipfftGetSizeMany_assumed_rank_cptr(plan,rank,n,inembed,istride,idist,onembed, &
        ostride,odist,myType,batch,workSize)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSizeMany_assumed_rank_cptr
      type(c_ptr) :: plan
      integer(c_int) :: rank
      integer(c_int),target,contiguous,dimension(..) :: n
      integer(c_int),target,contiguous,dimension(..) :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      integer(c_int),target,contiguous,dimension(..) :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int) :: batch
      integer(c_size_t) :: workSize
      !
      hipfftGetSizeMany_assumed_rank_cptr = hipfftGetSizeMany_(plan,rank,c_loc(n),c_loc(inembed), &
        istride,idist,c_loc(onembed),ostride,odist,myType,batch,workSize)
    end function

#else
    function hipfftGetSizeMany_rank_0(plan,rank,n,inembed,istride,idist,onembed,ostride,odist, &
        myType,batch,workSize)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSizeMany_rank_0
      type(hipfftHandle_t) :: plan
      integer(c_int) :: rank
      integer(c_int),target :: n
      integer(c_int),target :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      integer(c_int),target :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int) :: batch
      integer(c_size_t) :: workSize
      !
      hipfftGetSizeMany_rank_0 = hipfftGetSizeMany_(plan%ptr,rank,c_loc(n),c_loc(inembed),istride, &
        idist,c_loc(onembed),ostride,odist,myType,batch,workSize)
    end function

    function hipfftGetSizeMany_rank_0_cptr(plan,rank,n,inembed,istride,idist,onembed,ostride, &
        odist,myType,batch,workSize)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSizeMany_rank_0_cptr
      type(c_ptr) :: plan
      integer(c_int) :: rank
      integer(c_int),target :: n
      integer(c_int),target :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      integer(c_int),target :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int) :: batch
      integer(c_size_t) :: workSize
      !
      hipfftGetSizeMany_rank_0_cptr = hipfftGetSizeMany_(plan,rank,c_loc(n),c_loc(inembed), &
        istride,idist,c_loc(onembed),ostride,odist,myType,batch,workSize)
    end function

    function hipfftGetSizeMany_rank_1(plan,rank,n,inembed,istride,idist,onembed,ostride,odist, &
        myType,batch,workSize)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSizeMany_rank_1
      type(hipfftHandle_t) :: plan
      integer(c_int) :: rank
      integer(c_int),target,dimension(:) :: n
      integer(c_int),target,dimension(:) :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      integer(c_int),target,dimension(:) :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int) :: batch
      integer(c_size_t) :: workSize
      !
      hipfftGetSizeMany_rank_1 = hipfftGetSizeMany_(plan%ptr,rank,c_loc(n),c_loc(inembed),istride, &
        idist,c_loc(onembed),ostride,odist,myType,batch,workSize)
    end function

    function hipfftGetSizeMany_rank_1_cptr(plan,rank,n,inembed,istride,idist,onembed,ostride, &
        odist,myType,batch,workSize)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSizeMany_rank_1_cptr
      type(c_ptr) :: plan
      integer(c_int) :: rank
      integer(c_int),target,dimension(:) :: n
      integer(c_int),target,dimension(:) :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      integer(c_int),target,dimension(:) :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int) :: batch
      integer(c_size_t) :: workSize
      !
      hipfftGetSizeMany_rank_1_cptr = hipfftGetSizeMany_(plan,rank,c_loc(n),c_loc(inembed), &
        istride,idist,c_loc(onembed),ostride,odist,myType,batch,workSize)
    end function

#endif
    function hipfftGetSizeMany_typed(plan, rank, n, inembed, istride, idist, onembed, ostride, &
        odist, myType, batch, workSize) result(GetSizeMany)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      integer(c_int), value :: rank
      type(c_ptr), value :: n
      type(c_ptr), value :: inembed
      integer(c_int), value :: istride
      integer(c_int), value :: idist
      type(c_ptr), value :: onembed
      integer(c_int), value :: ostride
      integer(c_int), value :: odist
      integer(kind(HIPFFT_R2C)), value :: myType
      integer(c_int), value :: batch
      integer(c_size_t) :: workSize
      integer(kind(HIPFFT_SUCCESS)) :: GetSizeMany
      GetSizeMany = hipfftGetSizeMany_(plan%ptr, rank, n, inembed, istride, idist, onembed, &
        ostride, odist, myType, batch, workSize)
    end function hipfftGetSizeMany_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipfftGetSizeMany64_assumed_rank(plan,rank,n,inembed,istride,idist,onembed,ostride, &
        odist,myType,batch,workSize)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSizeMany64_assumed_rank
      type(hipfftHandle_t) :: plan
      integer(c_int) :: rank
      integer(c_int64_t),target,contiguous,dimension(..) :: n
      integer(c_int64_t),target,contiguous,dimension(..) :: inembed
      integer(c_int64_t) :: istride
      integer(c_int64_t) :: idist
      integer(c_int64_t),target,contiguous,dimension(..) :: onembed
      integer(c_int64_t) :: ostride
      integer(c_int64_t) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int64_t) :: batch
      integer(c_size_t) :: workSize
      !
      hipfftGetSizeMany64_assumed_rank = hipfftGetSizeMany64_(plan%ptr,rank,c_loc(n), &
        c_loc(inembed),istride,idist,c_loc(onembed),ostride,odist,myType,batch,workSize)
    end function

    function hipfftGetSizeMany64_assumed_rank_cptr(plan,rank,n,inembed,istride,idist,onembed, &
        ostride,odist,myType,batch,workSize)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSizeMany64_assumed_rank_cptr
      type(c_ptr) :: plan
      integer(c_int) :: rank
      integer(c_int64_t),target,contiguous,dimension(..) :: n
      integer(c_int64_t),target,contiguous,dimension(..) :: inembed
      integer(c_int64_t) :: istride
      integer(c_int64_t) :: idist
      integer(c_int64_t),target,contiguous,dimension(..) :: onembed
      integer(c_int64_t) :: ostride
      integer(c_int64_t) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int64_t) :: batch
      integer(c_size_t) :: workSize
      !
      hipfftGetSizeMany64_assumed_rank_cptr = hipfftGetSizeMany64_(plan,rank,c_loc(n), &
        c_loc(inembed),istride,idist,c_loc(onembed),ostride,odist,myType,batch,workSize)
    end function

#else
    function hipfftGetSizeMany64_rank_0(plan,rank,n,inembed,istride,idist,onembed,ostride,odist, &
        myType,batch,workSize)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSizeMany64_rank_0
      type(hipfftHandle_t) :: plan
      integer(c_int) :: rank
      integer(c_int64_t),target :: n
      integer(c_int64_t),target :: inembed
      integer(c_int64_t) :: istride
      integer(c_int64_t) :: idist
      integer(c_int64_t),target :: onembed
      integer(c_int64_t) :: ostride
      integer(c_int64_t) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int64_t) :: batch
      integer(c_size_t) :: workSize
      !
      hipfftGetSizeMany64_rank_0 = hipfftGetSizeMany64_(plan%ptr,rank,c_loc(n),c_loc(inembed), &
        istride,idist,c_loc(onembed),ostride,odist,myType,batch,workSize)
    end function

    function hipfftGetSizeMany64_rank_0_cptr(plan,rank,n,inembed,istride,idist,onembed,ostride, &
        odist,myType,batch,workSize)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSizeMany64_rank_0_cptr
      type(c_ptr) :: plan
      integer(c_int) :: rank
      integer(c_int64_t),target :: n
      integer(c_int64_t),target :: inembed
      integer(c_int64_t) :: istride
      integer(c_int64_t) :: idist
      integer(c_int64_t),target :: onembed
      integer(c_int64_t) :: ostride
      integer(c_int64_t) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int64_t) :: batch
      integer(c_size_t) :: workSize
      !
      hipfftGetSizeMany64_rank_0_cptr = hipfftGetSizeMany64_(plan,rank,c_loc(n),c_loc(inembed), &
        istride,idist,c_loc(onembed),ostride,odist,myType,batch,workSize)
    end function

    function hipfftGetSizeMany64_rank_1(plan,rank,n,inembed,istride,idist,onembed,ostride,odist, &
        myType,batch,workSize)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSizeMany64_rank_1
      type(hipfftHandle_t) :: plan
      integer(c_int) :: rank
      integer(c_int64_t),target,dimension(:) :: n
      integer(c_int64_t),target,dimension(:) :: inembed
      integer(c_int64_t) :: istride
      integer(c_int64_t) :: idist
      integer(c_int64_t),target,dimension(:) :: onembed
      integer(c_int64_t) :: ostride
      integer(c_int64_t) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int64_t) :: batch
      integer(c_size_t) :: workSize
      !
      hipfftGetSizeMany64_rank_1 = hipfftGetSizeMany64_(plan%ptr,rank,c_loc(n),c_loc(inembed), &
        istride,idist,c_loc(onembed),ostride,odist,myType,batch,workSize)
    end function

    function hipfftGetSizeMany64_rank_1_cptr(plan,rank,n,inembed,istride,idist,onembed,ostride, &
        odist,myType,batch,workSize)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSizeMany64_rank_1_cptr
      type(c_ptr) :: plan
      integer(c_int) :: rank
      integer(c_int64_t),target,dimension(:) :: n
      integer(c_int64_t),target,dimension(:) :: inembed
      integer(c_int64_t) :: istride
      integer(c_int64_t) :: idist
      integer(c_int64_t),target,dimension(:) :: onembed
      integer(c_int64_t) :: ostride
      integer(c_int64_t) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int64_t) :: batch
      integer(c_size_t) :: workSize
      !
      hipfftGetSizeMany64_rank_1_cptr = hipfftGetSizeMany64_(plan,rank,c_loc(n),c_loc(inembed), &
        istride,idist,c_loc(onembed),ostride,odist,myType,batch,workSize)
    end function

#endif
    function hipfftGetSizeMany64_typed(plan, rank, n, inembed, istride, idist, onembed, ostride, &
        odist, myType, batch, workSize) result(GetSizeMany64)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      integer(c_int), value :: rank
      type(c_ptr), value :: n
      type(c_ptr), value :: inembed
      integer(c_int64_t), value :: istride
      integer(c_int64_t), value :: idist
      type(c_ptr), value :: onembed
      integer(c_int64_t), value :: ostride
      integer(c_int64_t), value :: odist
      integer(kind(HIPFFT_R2C)), value :: myType
      integer(c_int64_t), value :: batch
      integer(c_size_t) :: workSize
      integer(kind(HIPFFT_SUCCESS)) :: GetSizeMany64
      GetSizeMany64 = hipfftGetSizeMany64_(plan%ptr, rank, n, inembed, istride, idist, onembed, &
        ostride, odist, myType, batch, workSize)
    end function hipfftGetSizeMany64_typed

    function hipfftGetSize_typed(plan, workSize) result(GetSize)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      integer(c_size_t) :: workSize
      integer(kind(HIPFFT_SUCCESS)) :: GetSize
      GetSize = hipfftGetSize_(plan%ptr, workSize)
    end function hipfftGetSize_typed

    function hipfftSetAutoAllocation_typed(plan, autoAllocate) result(SetAutoAllocation)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      integer(c_int), value :: autoAllocate
      integer(kind(HIPFFT_SUCCESS)) :: SetAutoAllocation
      SetAutoAllocation = hipfftSetAutoAllocation_(plan%ptr, autoAllocate)
    end function hipfftSetAutoAllocation_typed

    function hipfftSetWorkArea_typed(plan, workArea) result(SetWorkArea)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      type(c_ptr), value :: workArea
      integer(kind(HIPFFT_SUCCESS)) :: SetWorkArea
      SetWorkArea = hipfftSetWorkArea_(plan%ptr, workArea)
    end function hipfftSetWorkArea_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipfftExecC2C_assumed_rank(plan,idata,odata,direction)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecC2C_assumed_rank
      type(hipfftHandle_t) :: plan
      complex(c_float_complex),target,contiguous,dimension(..) :: idata
      complex(c_float_complex),target,contiguous,dimension(..) :: odata
      integer(c_int) :: direction
      !
      hipfftExecC2C_assumed_rank = hipfftExecC2C_(plan%ptr,c_loc(idata),c_loc(odata),direction)
    end function

    function hipfftExecC2C_assumed_rank_cptr(plan,idata,odata,direction)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecC2C_assumed_rank_cptr
      type(c_ptr) :: plan
      complex(c_float_complex),target,contiguous,dimension(..) :: idata
      complex(c_float_complex),target,contiguous,dimension(..) :: odata
      integer(c_int) :: direction
      !
      hipfftExecC2C_assumed_rank_cptr = hipfftExecC2C_(plan,c_loc(idata),c_loc(odata),direction)
    end function

#else
    function hipfftExecC2C_rank_0(plan,idata,odata,direction)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecC2C_rank_0
      type(hipfftHandle_t) :: plan
      complex(c_float_complex),target :: idata
      complex(c_float_complex),target :: odata
      integer(c_int) :: direction
      !
      hipfftExecC2C_rank_0 = hipfftExecC2C_(plan%ptr,c_loc(idata),c_loc(odata),direction)
    end function

    function hipfftExecC2C_rank_0_cptr(plan,idata,odata,direction)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecC2C_rank_0_cptr
      type(c_ptr) :: plan
      complex(c_float_complex),target :: idata
      complex(c_float_complex),target :: odata
      integer(c_int) :: direction
      !
      hipfftExecC2C_rank_0_cptr = hipfftExecC2C_(plan,c_loc(idata),c_loc(odata),direction)
    end function

    function hipfftExecC2C_rank_1(plan,idata,odata,direction)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecC2C_rank_1
      type(hipfftHandle_t) :: plan
      complex(c_float_complex),target,dimension(:) :: idata
      complex(c_float_complex),target,dimension(:) :: odata
      integer(c_int) :: direction
      !
      hipfftExecC2C_rank_1 = hipfftExecC2C_(plan%ptr,c_loc(idata),c_loc(odata),direction)
    end function

    function hipfftExecC2C_rank_1_cptr(plan,idata,odata,direction)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecC2C_rank_1_cptr
      type(c_ptr) :: plan
      complex(c_float_complex),target,dimension(:) :: idata
      complex(c_float_complex),target,dimension(:) :: odata
      integer(c_int) :: direction
      !
      hipfftExecC2C_rank_1_cptr = hipfftExecC2C_(plan,c_loc(idata),c_loc(odata),direction)
    end function

    function hipfftExecC2C_rank_2(plan,idata,odata,direction)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecC2C_rank_2
      type(hipfftHandle_t) :: plan
      complex(c_float_complex),target,dimension(:,:) :: idata
      complex(c_float_complex),target,dimension(:,:) :: odata
      integer(c_int) :: direction
      !
      hipfftExecC2C_rank_2 = hipfftExecC2C_(plan%ptr,c_loc(idata),c_loc(odata),direction)
    end function

    function hipfftExecC2C_rank_2_cptr(plan,idata,odata,direction)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecC2C_rank_2_cptr
      type(c_ptr) :: plan
      complex(c_float_complex),target,dimension(:,:) :: idata
      complex(c_float_complex),target,dimension(:,:) :: odata
      integer(c_int) :: direction
      !
      hipfftExecC2C_rank_2_cptr = hipfftExecC2C_(plan,c_loc(idata),c_loc(odata),direction)
    end function

    function hipfftExecC2C_rank_3(plan,idata,odata,direction)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecC2C_rank_3
      type(hipfftHandle_t) :: plan
      complex(c_float_complex),target,dimension(:,:,:) :: idata
      complex(c_float_complex),target,dimension(:,:,:) :: odata
      integer(c_int) :: direction
      !
      hipfftExecC2C_rank_3 = hipfftExecC2C_(plan%ptr,c_loc(idata),c_loc(odata),direction)
    end function

    function hipfftExecC2C_rank_3_cptr(plan,idata,odata,direction)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecC2C_rank_3_cptr
      type(c_ptr) :: plan
      complex(c_float_complex),target,dimension(:,:,:) :: idata
      complex(c_float_complex),target,dimension(:,:,:) :: odata
      integer(c_int) :: direction
      !
      hipfftExecC2C_rank_3_cptr = hipfftExecC2C_(plan,c_loc(idata),c_loc(odata),direction)
    end function

#endif
    function hipfftExecC2C_typed(plan, idata, odata, direction) result(ExecC2C)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      type(c_ptr), value :: idata
      type(c_ptr), value :: odata
      integer(c_int), value :: direction
      integer(kind(HIPFFT_SUCCESS)) :: ExecC2C
      ExecC2C = hipfftExecC2C_(plan%ptr, idata, odata, direction)
    end function hipfftExecC2C_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipfftExecR2C_assumed_rank(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecR2C_assumed_rank
      type(hipfftHandle_t) :: plan
      real(c_float),target,contiguous,dimension(..) :: idata
      complex(c_float_complex),target,contiguous,dimension(..) :: odata
      !
      hipfftExecR2C_assumed_rank = hipfftExecR2C_(plan%ptr,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecR2C_assumed_rank_cptr(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecR2C_assumed_rank_cptr
      type(c_ptr) :: plan
      real(c_float),target,contiguous,dimension(..) :: idata
      complex(c_float_complex),target,contiguous,dimension(..) :: odata
      !
      hipfftExecR2C_assumed_rank_cptr = hipfftExecR2C_(plan,c_loc(idata),c_loc(odata))
    end function

#else
    function hipfftExecR2C_rank_0(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecR2C_rank_0
      type(hipfftHandle_t) :: plan
      real(c_float),target :: idata
      complex(c_float_complex),target :: odata
      !
      hipfftExecR2C_rank_0 = hipfftExecR2C_(plan%ptr,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecR2C_rank_0_cptr(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecR2C_rank_0_cptr
      type(c_ptr) :: plan
      real(c_float),target :: idata
      complex(c_float_complex),target :: odata
      !
      hipfftExecR2C_rank_0_cptr = hipfftExecR2C_(plan,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecR2C_rank_1(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecR2C_rank_1
      type(hipfftHandle_t) :: plan
      real(c_float),target,dimension(:) :: idata
      complex(c_float_complex),target,dimension(:) :: odata
      !
      hipfftExecR2C_rank_1 = hipfftExecR2C_(plan%ptr,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecR2C_rank_1_cptr(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecR2C_rank_1_cptr
      type(c_ptr) :: plan
      real(c_float),target,dimension(:) :: idata
      complex(c_float_complex),target,dimension(:) :: odata
      !
      hipfftExecR2C_rank_1_cptr = hipfftExecR2C_(plan,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecR2C_rank_2(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecR2C_rank_2
      type(hipfftHandle_t) :: plan
      real(c_float),target,dimension(:,:) :: idata
      complex(c_float_complex),target,dimension(:,:) :: odata
      !
      hipfftExecR2C_rank_2 = hipfftExecR2C_(plan%ptr,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecR2C_rank_2_cptr(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecR2C_rank_2_cptr
      type(c_ptr) :: plan
      real(c_float),target,dimension(:,:) :: idata
      complex(c_float_complex),target,dimension(:,:) :: odata
      !
      hipfftExecR2C_rank_2_cptr = hipfftExecR2C_(plan,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecR2C_rank_3(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecR2C_rank_3
      type(hipfftHandle_t) :: plan
      real(c_float),target,dimension(:,:,:) :: idata
      complex(c_float_complex),target,dimension(:,:,:) :: odata
      !
      hipfftExecR2C_rank_3 = hipfftExecR2C_(plan%ptr,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecR2C_rank_3_cptr(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecR2C_rank_3_cptr
      type(c_ptr) :: plan
      real(c_float),target,dimension(:,:,:) :: idata
      complex(c_float_complex),target,dimension(:,:,:) :: odata
      !
      hipfftExecR2C_rank_3_cptr = hipfftExecR2C_(plan,c_loc(idata),c_loc(odata))
    end function

#endif
    function hipfftExecR2C_typed(plan, idata, odata) result(ExecR2C)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      type(c_ptr), value :: idata
      type(c_ptr), value :: odata
      integer(kind(HIPFFT_SUCCESS)) :: ExecR2C
      ExecR2C = hipfftExecR2C_(plan%ptr, idata, odata)
    end function hipfftExecR2C_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipfftExecC2R_assumed_rank(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecC2R_assumed_rank
      type(hipfftHandle_t) :: plan
      complex(c_float_complex),target,contiguous,dimension(..) :: idata
      real(c_float),target,contiguous,dimension(..) :: odata
      !
      hipfftExecC2R_assumed_rank = hipfftExecC2R_(plan%ptr,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecC2R_assumed_rank_cptr(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecC2R_assumed_rank_cptr
      type(c_ptr) :: plan
      complex(c_float_complex),target,contiguous,dimension(..) :: idata
      real(c_float),target,contiguous,dimension(..) :: odata
      !
      hipfftExecC2R_assumed_rank_cptr = hipfftExecC2R_(plan,c_loc(idata),c_loc(odata))
    end function

#else
    function hipfftExecC2R_rank_0(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecC2R_rank_0
      type(hipfftHandle_t) :: plan
      complex(c_float_complex),target :: idata
      real(c_float),target :: odata
      !
      hipfftExecC2R_rank_0 = hipfftExecC2R_(plan%ptr,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecC2R_rank_0_cptr(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecC2R_rank_0_cptr
      type(c_ptr) :: plan
      complex(c_float_complex),target :: idata
      real(c_float),target :: odata
      !
      hipfftExecC2R_rank_0_cptr = hipfftExecC2R_(plan,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecC2R_rank_1(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecC2R_rank_1
      type(hipfftHandle_t) :: plan
      complex(c_float_complex),target,dimension(:) :: idata
      real(c_float),target,dimension(:) :: odata
      !
      hipfftExecC2R_rank_1 = hipfftExecC2R_(plan%ptr,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecC2R_rank_1_cptr(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecC2R_rank_1_cptr
      type(c_ptr) :: plan
      complex(c_float_complex),target,dimension(:) :: idata
      real(c_float),target,dimension(:) :: odata
      !
      hipfftExecC2R_rank_1_cptr = hipfftExecC2R_(plan,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecC2R_rank_2(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecC2R_rank_2
      type(hipfftHandle_t) :: plan
      complex(c_float_complex),target,dimension(:,:) :: idata
      real(c_float),target,dimension(:,:) :: odata
      !
      hipfftExecC2R_rank_2 = hipfftExecC2R_(plan%ptr,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecC2R_rank_2_cptr(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecC2R_rank_2_cptr
      type(c_ptr) :: plan
      complex(c_float_complex),target,dimension(:,:) :: idata
      real(c_float),target,dimension(:,:) :: odata
      !
      hipfftExecC2R_rank_2_cptr = hipfftExecC2R_(plan,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecC2R_rank_3(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecC2R_rank_3
      type(hipfftHandle_t) :: plan
      complex(c_float_complex),target,dimension(:,:,:) :: idata
      real(c_float),target,dimension(:,:,:) :: odata
      !
      hipfftExecC2R_rank_3 = hipfftExecC2R_(plan%ptr,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecC2R_rank_3_cptr(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecC2R_rank_3_cptr
      type(c_ptr) :: plan
      complex(c_float_complex),target,dimension(:,:,:) :: idata
      real(c_float),target,dimension(:,:,:) :: odata
      !
      hipfftExecC2R_rank_3_cptr = hipfftExecC2R_(plan,c_loc(idata),c_loc(odata))
    end function

#endif
    function hipfftExecC2R_typed(plan, idata, odata) result(ExecC2R)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      type(c_ptr), value :: idata
      type(c_ptr), value :: odata
      integer(kind(HIPFFT_SUCCESS)) :: ExecC2R
      ExecC2R = hipfftExecC2R_(plan%ptr, idata, odata)
    end function hipfftExecC2R_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipfftExecZ2Z_assumed_rank(plan,idata,odata,direction)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecZ2Z_assumed_rank
      type(hipfftHandle_t) :: plan
      complex(c_double_complex),target,contiguous,dimension(..) :: idata
      complex(c_double_complex),target,contiguous,dimension(..) :: odata
      integer(c_int) :: direction
      !
      hipfftExecZ2Z_assumed_rank = hipfftExecZ2Z_(plan%ptr,c_loc(idata),c_loc(odata),direction)
    end function

    function hipfftExecZ2Z_assumed_rank_cptr(plan,idata,odata,direction)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecZ2Z_assumed_rank_cptr
      type(c_ptr) :: plan
      complex(c_double_complex),target,contiguous,dimension(..) :: idata
      complex(c_double_complex),target,contiguous,dimension(..) :: odata
      integer(c_int) :: direction
      !
      hipfftExecZ2Z_assumed_rank_cptr = hipfftExecZ2Z_(plan,c_loc(idata),c_loc(odata),direction)
    end function

#else
    function hipfftExecZ2Z_rank_0(plan,idata,odata,direction)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecZ2Z_rank_0
      type(hipfftHandle_t) :: plan
      complex(c_double_complex),target :: idata
      complex(c_double_complex),target :: odata
      integer(c_int) :: direction
      !
      hipfftExecZ2Z_rank_0 = hipfftExecZ2Z_(plan%ptr,c_loc(idata),c_loc(odata),direction)
    end function

    function hipfftExecZ2Z_rank_0_cptr(plan,idata,odata,direction)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecZ2Z_rank_0_cptr
      type(c_ptr) :: plan
      complex(c_double_complex),target :: idata
      complex(c_double_complex),target :: odata
      integer(c_int) :: direction
      !
      hipfftExecZ2Z_rank_0_cptr = hipfftExecZ2Z_(plan,c_loc(idata),c_loc(odata),direction)
    end function

    function hipfftExecZ2Z_rank_1(plan,idata,odata,direction)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecZ2Z_rank_1
      type(hipfftHandle_t) :: plan
      complex(c_double_complex),target,dimension(:) :: idata
      complex(c_double_complex),target,dimension(:) :: odata
      integer(c_int) :: direction
      !
      hipfftExecZ2Z_rank_1 = hipfftExecZ2Z_(plan%ptr,c_loc(idata),c_loc(odata),direction)
    end function

    function hipfftExecZ2Z_rank_1_cptr(plan,idata,odata,direction)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecZ2Z_rank_1_cptr
      type(c_ptr) :: plan
      complex(c_double_complex),target,dimension(:) :: idata
      complex(c_double_complex),target,dimension(:) :: odata
      integer(c_int) :: direction
      !
      hipfftExecZ2Z_rank_1_cptr = hipfftExecZ2Z_(plan,c_loc(idata),c_loc(odata),direction)
    end function

    function hipfftExecZ2Z_rank_2(plan,idata,odata,direction)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecZ2Z_rank_2
      type(hipfftHandle_t) :: plan
      complex(c_double_complex),target,dimension(:,:) :: idata
      complex(c_double_complex),target,dimension(:,:) :: odata
      integer(c_int) :: direction
      !
      hipfftExecZ2Z_rank_2 = hipfftExecZ2Z_(plan%ptr,c_loc(idata),c_loc(odata),direction)
    end function

    function hipfftExecZ2Z_rank_2_cptr(plan,idata,odata,direction)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecZ2Z_rank_2_cptr
      type(c_ptr) :: plan
      complex(c_double_complex),target,dimension(:,:) :: idata
      complex(c_double_complex),target,dimension(:,:) :: odata
      integer(c_int) :: direction
      !
      hipfftExecZ2Z_rank_2_cptr = hipfftExecZ2Z_(plan,c_loc(idata),c_loc(odata),direction)
    end function

    function hipfftExecZ2Z_rank_3(plan,idata,odata,direction)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecZ2Z_rank_3
      type(hipfftHandle_t) :: plan
      complex(c_double_complex),target,dimension(:,:,:) :: idata
      complex(c_double_complex),target,dimension(:,:,:) :: odata
      integer(c_int) :: direction
      !
      hipfftExecZ2Z_rank_3 = hipfftExecZ2Z_(plan%ptr,c_loc(idata),c_loc(odata),direction)
    end function

    function hipfftExecZ2Z_rank_3_cptr(plan,idata,odata,direction)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecZ2Z_rank_3_cptr
      type(c_ptr) :: plan
      complex(c_double_complex),target,dimension(:,:,:) :: idata
      complex(c_double_complex),target,dimension(:,:,:) :: odata
      integer(c_int) :: direction
      !
      hipfftExecZ2Z_rank_3_cptr = hipfftExecZ2Z_(plan,c_loc(idata),c_loc(odata),direction)
    end function

#endif
    function hipfftExecZ2Z_typed(plan, idata, odata, direction) result(ExecZ2Z)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      type(c_ptr), value :: idata
      type(c_ptr), value :: odata
      integer(c_int), value :: direction
      integer(kind(HIPFFT_SUCCESS)) :: ExecZ2Z
      ExecZ2Z = hipfftExecZ2Z_(plan%ptr, idata, odata, direction)
    end function hipfftExecZ2Z_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipfftExecD2Z_assumed_rank(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecD2Z_assumed_rank
      type(hipfftHandle_t) :: plan
      real(c_double),target,contiguous,dimension(..) :: idata
      complex(c_double_complex),target,contiguous,dimension(..) :: odata
      !
      hipfftExecD2Z_assumed_rank = hipfftExecD2Z_(plan%ptr,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecD2Z_assumed_rank_cptr(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecD2Z_assumed_rank_cptr
      type(c_ptr) :: plan
      real(c_double),target,contiguous,dimension(..) :: idata
      complex(c_double_complex),target,contiguous,dimension(..) :: odata
      !
      hipfftExecD2Z_assumed_rank_cptr = hipfftExecD2Z_(plan,c_loc(idata),c_loc(odata))
    end function

#else
    function hipfftExecD2Z_rank_0(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecD2Z_rank_0
      type(hipfftHandle_t) :: plan
      real(c_double),target :: idata
      complex(c_double_complex),target :: odata
      !
      hipfftExecD2Z_rank_0 = hipfftExecD2Z_(plan%ptr,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecD2Z_rank_0_cptr(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecD2Z_rank_0_cptr
      type(c_ptr) :: plan
      real(c_double),target :: idata
      complex(c_double_complex),target :: odata
      !
      hipfftExecD2Z_rank_0_cptr = hipfftExecD2Z_(plan,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecD2Z_rank_1(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecD2Z_rank_1
      type(hipfftHandle_t) :: plan
      real(c_double),target,dimension(:) :: idata
      complex(c_double_complex),target,dimension(:) :: odata
      !
      hipfftExecD2Z_rank_1 = hipfftExecD2Z_(plan%ptr,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecD2Z_rank_1_cptr(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecD2Z_rank_1_cptr
      type(c_ptr) :: plan
      real(c_double),target,dimension(:) :: idata
      complex(c_double_complex),target,dimension(:) :: odata
      !
      hipfftExecD2Z_rank_1_cptr = hipfftExecD2Z_(plan,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecD2Z_rank_2(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecD2Z_rank_2
      type(hipfftHandle_t) :: plan
      real(c_double),target,dimension(:,:) :: idata
      complex(c_double_complex),target,dimension(:,:) :: odata
      !
      hipfftExecD2Z_rank_2 = hipfftExecD2Z_(plan%ptr,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecD2Z_rank_2_cptr(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecD2Z_rank_2_cptr
      type(c_ptr) :: plan
      real(c_double),target,dimension(:,:) :: idata
      complex(c_double_complex),target,dimension(:,:) :: odata
      !
      hipfftExecD2Z_rank_2_cptr = hipfftExecD2Z_(plan,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecD2Z_rank_3(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecD2Z_rank_3
      type(hipfftHandle_t) :: plan
      real(c_double),target,dimension(:,:,:) :: idata
      complex(c_double_complex),target,dimension(:,:,:) :: odata
      !
      hipfftExecD2Z_rank_3 = hipfftExecD2Z_(plan%ptr,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecD2Z_rank_3_cptr(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecD2Z_rank_3_cptr
      type(c_ptr) :: plan
      real(c_double),target,dimension(:,:,:) :: idata
      complex(c_double_complex),target,dimension(:,:,:) :: odata
      !
      hipfftExecD2Z_rank_3_cptr = hipfftExecD2Z_(plan,c_loc(idata),c_loc(odata))
    end function

#endif
    function hipfftExecD2Z_typed(plan, idata, odata) result(ExecD2Z)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      type(c_ptr), value :: idata
      type(c_ptr), value :: odata
      integer(kind(HIPFFT_SUCCESS)) :: ExecD2Z
      ExecD2Z = hipfftExecD2Z_(plan%ptr, idata, odata)
    end function hipfftExecD2Z_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipfftExecZ2D_assumed_rank(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecZ2D_assumed_rank
      type(hipfftHandle_t) :: plan
      complex(c_double_complex),target,contiguous,dimension(..) :: idata
      real(c_double),target,contiguous,dimension(..) :: odata
      !
      hipfftExecZ2D_assumed_rank = hipfftExecZ2D_(plan%ptr,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecZ2D_assumed_rank_cptr(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecZ2D_assumed_rank_cptr
      type(c_ptr) :: plan
      complex(c_double_complex),target,contiguous,dimension(..) :: idata
      real(c_double),target,contiguous,dimension(..) :: odata
      !
      hipfftExecZ2D_assumed_rank_cptr = hipfftExecZ2D_(plan,c_loc(idata),c_loc(odata))
    end function

#else
    function hipfftExecZ2D_rank_0(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecZ2D_rank_0
      type(hipfftHandle_t) :: plan
      complex(c_double_complex),target :: idata
      real(c_double),target :: odata
      !
      hipfftExecZ2D_rank_0 = hipfftExecZ2D_(plan%ptr,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecZ2D_rank_0_cptr(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecZ2D_rank_0_cptr
      type(c_ptr) :: plan
      complex(c_double_complex),target :: idata
      real(c_double),target :: odata
      !
      hipfftExecZ2D_rank_0_cptr = hipfftExecZ2D_(plan,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecZ2D_rank_1(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecZ2D_rank_1
      type(hipfftHandle_t) :: plan
      complex(c_double_complex),target,dimension(:) :: idata
      real(c_double),target,dimension(:) :: odata
      !
      hipfftExecZ2D_rank_1 = hipfftExecZ2D_(plan%ptr,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecZ2D_rank_1_cptr(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecZ2D_rank_1_cptr
      type(c_ptr) :: plan
      complex(c_double_complex),target,dimension(:) :: idata
      real(c_double),target,dimension(:) :: odata
      !
      hipfftExecZ2D_rank_1_cptr = hipfftExecZ2D_(plan,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecZ2D_rank_2(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecZ2D_rank_2
      type(hipfftHandle_t) :: plan
      complex(c_double_complex),target,dimension(:,:) :: idata
      real(c_double),target,dimension(:,:) :: odata
      !
      hipfftExecZ2D_rank_2 = hipfftExecZ2D_(plan%ptr,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecZ2D_rank_2_cptr(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecZ2D_rank_2_cptr
      type(c_ptr) :: plan
      complex(c_double_complex),target,dimension(:,:) :: idata
      real(c_double),target,dimension(:,:) :: odata
      !
      hipfftExecZ2D_rank_2_cptr = hipfftExecZ2D_(plan,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecZ2D_rank_3(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecZ2D_rank_3
      type(hipfftHandle_t) :: plan
      complex(c_double_complex),target,dimension(:,:,:) :: idata
      real(c_double),target,dimension(:,:,:) :: odata
      !
      hipfftExecZ2D_rank_3 = hipfftExecZ2D_(plan%ptr,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecZ2D_rank_3_cptr(plan,idata,odata)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecZ2D_rank_3_cptr
      type(c_ptr) :: plan
      complex(c_double_complex),target,dimension(:,:,:) :: idata
      real(c_double),target,dimension(:,:,:) :: odata
      !
      hipfftExecZ2D_rank_3_cptr = hipfftExecZ2D_(plan,c_loc(idata),c_loc(odata))
    end function

#endif
    function hipfftExecZ2D_typed(plan, idata, odata) result(ExecZ2D)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      type(c_ptr), value :: idata
      type(c_ptr), value :: odata
      integer(kind(HIPFFT_SUCCESS)) :: ExecZ2D
      ExecZ2D = hipfftExecZ2D_(plan%ptr, idata, odata)
    end function hipfftExecZ2D_typed

    function hipfftSetStream_typed(plan, stream) result(SetStream)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      type(c_ptr), value :: stream
      integer(kind(HIPFFT_SUCCESS)) :: SetStream
      SetStream = hipfftSetStream_(plan%ptr, stream)
    end function hipfftSetStream_typed

    function hipfftDestroy_typed(plan) result(Destroy)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      integer(kind(HIPFFT_SUCCESS)) :: Destroy
      Destroy = hipfftDestroy_(plan%ptr)
    end function hipfftDestroy_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hipfftGetProperty_assumed_rank(myType,myValue)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetProperty_assumed_rank
      integer(kind(HIPFFT_MAJOR_VERSION)) :: myType
      integer(c_int),target,contiguous,dimension(..) :: myValue
      !
      hipfftGetProperty_assumed_rank = hipfftGetProperty_(myType,c_loc(myValue))
    end function

#else
    function hipfftGetProperty_rank_0(myType,myValue)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetProperty_rank_0
      integer(kind(HIPFFT_MAJOR_VERSION)) :: myType
      integer(c_int),target :: myValue
      !
      hipfftGetProperty_rank_0 = hipfftGetProperty_(myType,c_loc(myValue))
    end function

    function hipfftGetProperty_rank_1(myType,myValue)
      use iso_c_binding
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetProperty_rank_1
      integer(kind(HIPFFT_MAJOR_VERSION)) :: myType
      integer(c_int),target,dimension(:) :: myValue
      !
      hipfftGetProperty_rank_1 = hipfftGetProperty_(myType,c_loc(myValue))
    end function

#endif
