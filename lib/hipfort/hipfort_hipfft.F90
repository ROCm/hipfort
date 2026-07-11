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

module hipfort_hipfft
  use hipfort_hipfft_enums
  use, intrinsic :: iso_c_binding
  implicit none

  !--- Opaque handles (all are typedef struct* → type(c_ptr)) ---
  !    hipfftHandle

  !--- 33 bind(C) interfaces ---
  interface

    !---------------------------------------------
    ! hipfftPlan1d
    !---------------------------------------------
    !> @brief Create a new one-dimensional FFT plan.
    !>
    !> @details Allocate and initialize a new one-dimensional FFT plan.
    !>
    !> @param[out] plan Pointer to the FFT plan handle.
    !> @param[in] nx FFT length.
    !> @param[in] type FFT type.
    !> @param[in] batch Number of batched transforms to compute.
    function hipfftPlan1d(plan, nx, type, batch) &
       result(Plan1d) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftPlan1d")
#else
       bind(C, name="hipfftPlan1d")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: plan
       integer(c_int), value :: nx
       integer(c_int), value :: type
       integer(c_int), value :: batch
       integer(c_int) :: Plan1d
    end function hipfftPlan1d

    !---------------------------------------------
    ! hipfftPlan2d
    !---------------------------------------------
    !> @brief Create a new two-dimensional FFT plan.
    !>
    !> @details Allocate and initialize a new two-dimensional FFT plan.
    !> Two-dimensional data should be stored in C ordering (row-major
    !> format), so that indexes in y-direction (j index) vary the
    !> fastest.
    !>
    !> @param[out] plan Pointer to the FFT plan handle.
    !> @param[in] nx Number of elements in the x-direction (slow index).
    !> @param[in] ny Number of elements in the y-direction (fast index).
    !> @param[in] type FFT type.
    function hipfftPlan2d(plan, nx, ny, type) &
       result(Plan2d) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftPlan2d")
#else
       bind(C, name="hipfftPlan2d")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: plan
       integer(c_int), value :: nx
       integer(c_int), value :: ny
       integer(c_int), value :: type
       integer(c_int) :: Plan2d
    end function hipfftPlan2d

    !---------------------------------------------
    ! hipfftPlan3d
    !---------------------------------------------
    !> @brief Create a new three-dimensional FFT plan.
    !>
    !> @details Allocate and initialize a new three-dimensional FFT plan.
    !> Three-dimensional data should be stored in C ordering (row-major
    !> format), so that indexes in z-direction (k index) vary the
    !> fastest.
    !>
    !> @param[out] plan Pointer to the FFT plan handle.
    !> @param[in] nx Number of elements in the x-direction (slowest index).
    !> @param[in] ny Number of elements in the y-direction.
    !> @param[in] nz Number of elements in the z-direction (fastest index).
    !> @param[in] type FFT type.
    function hipfftPlan3d(plan, nx, ny, nz, type) &
       result(Plan3d) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftPlan3d")
#else
       bind(C, name="hipfftPlan3d")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: plan
       integer(c_int), value :: nx
       integer(c_int), value :: ny
       integer(c_int), value :: nz
       integer(c_int), value :: type
       integer(c_int) :: Plan3d
    end function hipfftPlan3d

    !---------------------------------------------
    ! hipfftPlanMany
    !---------------------------------------------
    !> @brief Create a new batched rank-dimensional FFT plan with advanced data layout.
    !>
    !> @details Allocate and initialize a new batched rank-dimensional
    !> FFT plan. The number of elements to transform in each direction of
    !> the input data is specified in n.
    !>
    !> The batch parameter tells hipFFT how many transforms to perform.
    !> The distance between the first elements of two consecutive batches
    !> of the input and output data are specified with the idist and odist
    !> parameters.
    !>
    !> The inembed and onembed parameters define the input and output data
    !> layouts. The number of elements in the data is assumed to be larger
    !> than the number of elements in the transform. Strided data layouts
    !> are also supported. Strides along the fastest direction in the input
    !> and output data are specified via the istride and ostride parameters.
    !>
    !> If both inembed and onembed parameters are set to NULL, all the
    !> advanced data layout parameters are ignored and reverted to default
    !> values, i.e., the batched transform is performed with non-strided data
    !> access and the number of data/transform elements are assumed to be
    !> equivalent.
    !>
    !> @param[out] plan Pointer to the FFT plan handle.
    !> @param[in] rank Dimension of transform (1, 2, or 3).
    !> @param[in] n Number of elements to transform in the x/y/z directions.
    !> @param[in] inembed Number of elements in the input data in the x/y/z directions.
    !> @param[in] istride Distance between two successive elements in the input data.
    !> @param[in] idist Distance between input batches.
    !> @param[in] onembed Number of elements in the output data in the x/y/z directions.
    !> @param[in] ostride Distance between two successive elements in the output data.
    !> @param[in] odist Distance between output batches.
    !> @param[in] type FFT type.
    !> @param[in] batch Number of batched transforms to perform.
    function hipfftPlanMany(plan, rank, n, inembed, istride, idist, onembed, ostride, odist, type, &
                            batch) &
       result(PlanMany) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftPlanMany")
#else
       bind(C, name="hipfftPlanMany")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: plan
       integer(c_int), value :: rank
       integer(c_int) :: n(*)
       integer(c_int) :: inembed(*)
       integer(c_int), value :: istride
       integer(c_int), value :: idist
       integer(c_int) :: onembed(*)
       integer(c_int), value :: ostride
       integer(c_int), value :: odist
       integer(c_int), value :: type
       integer(c_int), value :: batch
       integer(c_int) :: PlanMany
    end function hipfftPlanMany

    !---------------------------------------------
    ! hipfftCreate
    !---------------------------------------------
    !> @brief Allocate a new plan.
    !>
    !> @param[out] plan Pointer to the FFT plan handle to be allocated.
    function hipfftCreate(plan) &
       result(Create) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftCreate")
#else
       bind(C, name="hipfftCreate")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: plan
       integer(c_int) :: Create
    end function hipfftCreate

    !---------------------------------------------
    ! hipfftExtPlanScaleFactor
    !---------------------------------------------
    !> @brief Set scaling factor.
    !>
    !> @details hipFFT multiplies each element of the result by the given factor at the end of the
    !> transform.
    !>
    !> The supplied factor must be a finite number.  That is, it must neither be infinity nor NaN.
    !>
    !> This function must be called after the plan is allocated using
    !> `hipfftCreate`, but before the plan is initialized by any of the
    !> "MakePlan" functions.  Therefore, API functions that combine
    !> creation and initialization (`hipfftPlan1d`, `hipfftPlan2d`,
    !> `hipfftPlan3d`, and `hipfftPlanMany`) cannot set a scale factor.
    !>
    !> Note that the scale factor applies to both forward and
    !> backward transforms executed with the specified plan handle.
    function hipfftExtPlanScaleFactor(plan, scalefactor) &
       result(ExtPlanScaleFactor) &
       bind(C, name="hipfftExtPlanScaleFactor")
       import :: c_ptr, c_double, c_int
       type(c_ptr), value :: plan
       real(c_double), value :: scalefactor
       integer(c_int) :: ExtPlanScaleFactor
    end function hipfftExtPlanScaleFactor

    !---------------------------------------------
    ! hipfftMakePlan1d
    !---------------------------------------------
    !> @brief Initialize a new one-dimensional FFT plan.
    !>
    !> @details Assumes that the plan has been created already, and
    !> modifies the plan associated with the plan handle.
    !>
    !> @param[in] plan Handle of the FFT plan.
    !> @param[in] nx FFT length.
    !> @param[in] type FFT type.
    !> @param[in] batch Number of batched transforms to compute.
    !> @param[out] workSize Pointer to work area size (returned value).
    function hipfftMakePlan1d(plan, nx, type, batch, workSize) &
       result(MakePlan1d) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftMakePlan1d")
#else
       bind(C, name="hipfftMakePlan1d")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: plan
       integer(c_int), value :: nx
       integer(c_int), value :: type
       integer(c_int), value :: batch
       type(c_ptr), value :: workSize
       integer(c_int) :: MakePlan1d
    end function hipfftMakePlan1d

    !---------------------------------------------
    ! hipfftMakePlan2d
    !---------------------------------------------
    !> @brief Initialize a new two-dimensional FFT plan.
    !>
    !> @details Assumes that the plan has been created already, and
    !> modifies the plan associated with the plan handle.
    !> Two-dimensional data should be stored in C ordering (row-major
    !> format), so that indexes in y-direction (j index) vary the
    !> fastest.
    !>
    !> @param[in] plan Handle of the FFT plan.
    !> @param[in] nx Number of elements in the x-direction (slow index).
    !> @param[in] ny Number of elements in the y-direction (fast index).
    !> @param[in] type FFT type.
    !> @param[out] workSize Pointer to work area size (returned value).
    function hipfftMakePlan2d(plan, nx, ny, type, workSize) &
       result(MakePlan2d) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftMakePlan2d")
#else
       bind(C, name="hipfftMakePlan2d")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: plan
       integer(c_int), value :: nx
       integer(c_int), value :: ny
       integer(c_int), value :: type
       type(c_ptr), value :: workSize
       integer(c_int) :: MakePlan2d
    end function hipfftMakePlan2d

    !---------------------------------------------
    ! hipfftMakePlan3d
    !---------------------------------------------
    !> @brief Initialize a new two-dimensional FFT plan.
    !>
    !> @details Assumes that the plan has been created already, and
    !> modifies the plan associated with the plan handle.
    !> Three-dimensional data should be stored in C ordering (row-major
    !> format), so that indexes in z-direction (k index) vary the
    !> fastest.
    !>
    !> @param[in] plan Handle of the FFT plan.
    !> @param[in] nx Number of elements in the x-direction (slowest index).
    !> @param[in] ny Number of elements in the y-direction.
    !> @param[in] nz Number of elements in the z-direction (fastest index).
    !> @param[in] type FFT type.
    !> @param[out] workSize Pointer to work area size (returned value).
    function hipfftMakePlan3d(plan, nx, ny, nz, type, workSize) &
       result(MakePlan3d) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftMakePlan3d")
#else
       bind(C, name="hipfftMakePlan3d")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: plan
       integer(c_int), value :: nx
       integer(c_int), value :: ny
       integer(c_int), value :: nz
       integer(c_int), value :: type
       type(c_ptr), value :: workSize
       integer(c_int) :: MakePlan3d
    end function hipfftMakePlan3d

    !---------------------------------------------
    ! hipfftMakePlanMany
    !---------------------------------------------
    !> @brief Initialize a new batched rank-dimensional FFT plan with advanced data layout.
    !>
    !> @details Assumes that the plan has been created already, and
    !> modifies the plan associated with the plan handle. The number
    !> of elements to transform in each direction of the input data
    !> in the FFT plan is specified in n.
    !>
    !> The batch parameter tells hipFFT how many transforms to perform.
    !> The distance between the first elements of two consecutive batches
    !> of the input and output data are specified with the idist and odist
    !> parameters.
    !>
    !> The inembed and onembed parameters define the input and output data
    !> layouts. The number of elements in the data is assumed to be larger
    !> than the number of elements in the transform. Strided data layouts
    !> are also supported. Strides along the fastest direction in the input
    !> and output data are specified via the istride and ostride parameters.
    !>
    !> If both inembed and onembed parameters are set to NULL, all the
    !> advanced data layout parameters are ignored and reverted to default
    !> values, i.e., the batched transform is performed with non-strided data
    !> access and the number of data/transform elements are assumed to be
    !> equivalent.
    !>
    !> @param[out] plan Pointer to the FFT plan handle.
    !> @param[in] rank Dimension of transform (1, 2, or 3).
    !> @param[in] n Number of elements to transform in the x/y/z directions.
    !> @param[in] inembed Number of elements in the input data in the x/y/z directions.
    !> @param[in] istride Distance between two successive elements in the input data.
    !> @param[in] idist Distance between input batches.
    !> @param[in] onembed Number of elements in the output data in the x/y/z directions.
    !> @param[in] ostride Distance between two successive elements in the output data.
    !> @param[in] odist Distance between output batches.
    !> @param[in] type FFT type.
    !> @param[in] batch Number of batched transforms to perform.
    !> @param[out] workSize Pointer to work area size (returned value).
    function hipfftMakePlanMany(plan, rank, n, inembed, istride, idist, onembed, ostride, odist, &
                                type, batch, workSize) &
       result(MakePlanMany) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftMakePlanMany")
#else
       bind(C, name="hipfftMakePlanMany")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: plan
       integer(c_int), value :: rank
       integer(c_int) :: n(*)
       integer(c_int) :: inembed(*)
       integer(c_int), value :: istride
       integer(c_int), value :: idist
       integer(c_int) :: onembed(*)
       integer(c_int), value :: ostride
       integer(c_int), value :: odist
       integer(c_int), value :: type
       integer(c_int), value :: batch
       type(c_ptr), value :: workSize
       integer(c_int) :: MakePlanMany
    end function hipfftMakePlanMany

    !---------------------------------------------
    ! hipfftMakePlanMany64
    !---------------------------------------------
    function hipfftMakePlanMany64(plan, rank, n, inembed, istride, idist, onembed, ostride, odist, &
                                  type, batch, workSize) &
       result(MakePlanMany64) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftMakePlanMany64")
#else
       bind(C, name="hipfftMakePlanMany64")
#endif
       import :: c_ptr, c_int, c_int64_t
       type(c_ptr), value :: plan
       integer(c_int), value :: rank
       integer(c_int64_t) :: n(*)
       integer(c_int64_t) :: inembed(*)
       integer(c_int64_t), value :: istride
       integer(c_int64_t), value :: idist
       integer(c_int64_t) :: onembed(*)
       integer(c_int64_t), value :: ostride
       integer(c_int64_t), value :: odist
       integer(c_int), value :: type
       integer(c_int64_t), value :: batch
       type(c_ptr), value :: workSize
       integer(c_int) :: MakePlanMany64
    end function hipfftMakePlanMany64

    !---------------------------------------------
    ! hipfftEstimate1d
    !---------------------------------------------
    !> @brief Return an estimate of the work area size required for a 1D plan.
    !>
    !> @param[in] nx Number of elements in the x-direction.
    !> @param[in] type FFT type.
    !> @param[in] batch Number of batched transforms to perform.
    !> @param[out] workSize Pointer to work area size (returned value).
    function hipfftEstimate1d(nx, type, batch, workSize) &
       result(Estimate1d) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftEstimate1d")
#else
       bind(C, name="hipfftEstimate1d")
#endif
       import :: c_int, c_ptr
       integer(c_int), value :: nx
       integer(c_int), value :: type
       integer(c_int), value :: batch
       type(c_ptr), value :: workSize
       integer(c_int) :: Estimate1d
    end function hipfftEstimate1d

    !---------------------------------------------
    ! hipfftEstimate2d
    !---------------------------------------------
    !> @brief Return an estimate of the work area size required for a 2D plan.
    !>
    !> @param[in] nx Number of elements in the x-direction.
    !> @param[in] ny Number of elements in the y-direction.
    !> @param[in] type FFT type.
    !> @param[out] workSize Pointer to work area size (returned value).
    function hipfftEstimate2d(nx, ny, type, workSize) &
       result(Estimate2d) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftEstimate2d")
#else
       bind(C, name="hipfftEstimate2d")
#endif
       import :: c_int, c_ptr
       integer(c_int), value :: nx
       integer(c_int), value :: ny
       integer(c_int), value :: type
       type(c_ptr), value :: workSize
       integer(c_int) :: Estimate2d
    end function hipfftEstimate2d

    !---------------------------------------------
    ! hipfftEstimate3d
    !---------------------------------------------
    !> @brief Return an estimate of the work area size required for a 3D plan.
    !>
    !> @param[in] nx Number of elements in the x-direction.
    !> @param[in] ny Number of elements in the y-direction.
    !> @param[in] nz Number of elements in the z-direction.
    !> @param[in] type FFT type.
    !> @param[out] workSize Pointer to work area size (returned value).
    function hipfftEstimate3d(nx, ny, nz, type, workSize) &
       result(Estimate3d) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftEstimate3d")
#else
       bind(C, name="hipfftEstimate3d")
#endif
       import :: c_int, c_ptr
       integer(c_int), value :: nx
       integer(c_int), value :: ny
       integer(c_int), value :: nz
       integer(c_int), value :: type
       type(c_ptr), value :: workSize
       integer(c_int) :: Estimate3d
    end function hipfftEstimate3d

    !---------------------------------------------
    ! hipfftEstimateMany
    !---------------------------------------------
    !> @brief Return an estimate of the work area size required for a rank-dimensional plan.
    !>
    !> @param[in] rank Dimension of FFT transform (1, 2, or 3).
    !> @param[in] n Number of elements in the x/y/z directions.
    !> @param[in] inembed
    !> @param[in] istride
    !> @param[in] idist Distance between input batches.
    !> @param[in] onembed
    !> @param[in] ostride
    !> @param[in] odist Distance between output batches.
    !> @param[in] type FFT type.
    !> @param[in] batch Number of batched transforms to perform.
    !> @param[out] workSize Pointer to work area size (returned value).
    function hipfftEstimateMany(rank, n, inembed, istride, idist, onembed, ostride, odist, type, &
                                batch, workSize) &
       result(EstimateMany) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftEstimateMany")
#else
       bind(C, name="hipfftEstimateMany")
#endif
       import :: c_int, c_ptr
       integer(c_int), value :: rank
       integer(c_int) :: n(*)
       integer(c_int) :: inembed(*)
       integer(c_int), value :: istride
       integer(c_int), value :: idist
       integer(c_int) :: onembed(*)
       integer(c_int), value :: ostride
       integer(c_int), value :: odist
       integer(c_int), value :: type
       integer(c_int), value :: batch
       type(c_ptr), value :: workSize
       integer(c_int) :: EstimateMany
    end function hipfftEstimateMany

    !---------------------------------------------
    ! hipfftGetSize1d
    !---------------------------------------------
    !> @brief Return size of the work area size required for a 1D plan.
    !>
    !> @param[in] plan Pointer to the FFT plan.
    !> @param[in] nx Number of elements in the x-direction.
    !> @param[in] type FFT type.
    !> @param[in] batch Number of batched transforms to perform.
    !> @param[out] workSize Pointer to work area size (returned value).
    function hipfftGetSize1d(plan, nx, type, batch, workSize) &
       result(GetSize1d) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftGetSize1d")
#else
       bind(C, name="hipfftGetSize1d")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: plan
       integer(c_int), value :: nx
       integer(c_int), value :: type
       integer(c_int), value :: batch
       type(c_ptr), value :: workSize
       integer(c_int) :: GetSize1d
    end function hipfftGetSize1d

    !---------------------------------------------
    ! hipfftGetSize2d
    !---------------------------------------------
    !> @brief Return size of the work area size required for a 2D plan.
    !>
    !> @param[in] plan Pointer to the FFT plan.
    !> @param[in] nx Number of elements in the x-direction.
    !> @param[in] ny Number of elements in the y-direction.
    !> @param[in] type FFT type.
    !> @param[out] workSize Pointer to work area size (returned value).
    function hipfftGetSize2d(plan, nx, ny, type, workSize) &
       result(GetSize2d) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftGetSize2d")
#else
       bind(C, name="hipfftGetSize2d")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: plan
       integer(c_int), value :: nx
       integer(c_int), value :: ny
       integer(c_int), value :: type
       type(c_ptr), value :: workSize
       integer(c_int) :: GetSize2d
    end function hipfftGetSize2d

    !---------------------------------------------
    ! hipfftGetSize3d
    !---------------------------------------------
    !> @brief Return size of the work area size required for a 3D plan.
    !>
    !> @param[in] plan Pointer to the FFT plan.
    !> @param[in] nx Number of elements in the x-direction.
    !> @param[in] ny Number of elements in the y-direction.
    !> @param[in] nz Number of elements in the z-direction.
    !> @param[in] type FFT type.
    !> @param[out] workSize Pointer to work area size (returned value).
    function hipfftGetSize3d(plan, nx, ny, nz, type, workSize) &
       result(GetSize3d) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftGetSize3d")
#else
       bind(C, name="hipfftGetSize3d")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: plan
       integer(c_int), value :: nx
       integer(c_int), value :: ny
       integer(c_int), value :: nz
       integer(c_int), value :: type
       type(c_ptr), value :: workSize
       integer(c_int) :: GetSize3d
    end function hipfftGetSize3d

    !---------------------------------------------
    ! hipfftGetSizeMany
    !---------------------------------------------
    !> @brief Return size of the work area size required for a rank-dimensional plan.
    !>
    !> @param[in] plan Pointer to the FFT plan.
    !> @param[in] rank Dimension of FFT transform (1, 2, or 3).
    !> @param[in] n Number of elements in the x/y/z directions.
    !> @param[in] inembed
    !> @param[in] istride
    !> @param[in] idist Distance between input batches.
    !> @param[in] onembed
    !> @param[in] ostride
    !> @param[in] odist Distance between output batches.
    !> @param[in] type FFT type.
    !> @param[in] batch Number of batched transforms to perform.
    !> @param[out] workSize Pointer to work area size (returned value).
    function hipfftGetSizeMany(plan, rank, n, inembed, istride, idist, onembed, ostride, odist, &
                               type, batch, workSize) &
       result(GetSizeMany) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftGetSizeMany")
#else
       bind(C, name="hipfftGetSizeMany")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: plan
       integer(c_int), value :: rank
       integer(c_int) :: n(*)
       integer(c_int) :: inembed(*)
       integer(c_int), value :: istride
       integer(c_int), value :: idist
       integer(c_int) :: onembed(*)
       integer(c_int), value :: ostride
       integer(c_int), value :: odist
       integer(c_int), value :: type
       integer(c_int), value :: batch
       type(c_ptr), value :: workSize
       integer(c_int) :: GetSizeMany
    end function hipfftGetSizeMany

    !---------------------------------------------
    ! hipfftGetSizeMany64
    !---------------------------------------------
    function hipfftGetSizeMany64(plan, rank, n, inembed, istride, idist, onembed, ostride, odist, &
                                 type, batch, workSize) &
       result(GetSizeMany64) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftGetSizeMany64")
#else
       bind(C, name="hipfftGetSizeMany64")
#endif
       import :: c_ptr, c_int, c_int64_t
       type(c_ptr), value :: plan
       integer(c_int), value :: rank
       integer(c_int64_t) :: n(*)
       integer(c_int64_t) :: inembed(*)
       integer(c_int64_t), value :: istride
       integer(c_int64_t), value :: idist
       integer(c_int64_t) :: onembed(*)
       integer(c_int64_t), value :: ostride
       integer(c_int64_t), value :: odist
       integer(c_int), value :: type
       integer(c_int64_t), value :: batch
       type(c_ptr), value :: workSize
       integer(c_int) :: GetSizeMany64
    end function hipfftGetSizeMany64

    !---------------------------------------------
    ! hipfftGetSize
    !---------------------------------------------
    !> @brief Return size of the work area size required for a rank-dimensional plan.
    !>
    !> @param[in] plan Pointer to the FFT plan.
    !> @param[out] workSize Pointer to work area size (returned value).
    function hipfftGetSize(plan, workSize) &
       result(GetSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftGetSize")
#else
       bind(C, name="hipfftGetSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: plan
       type(c_ptr), value :: workSize
       integer(c_int) :: GetSize
    end function hipfftGetSize

    !---------------------------------------------
    ! hipfftSetAutoAllocation
    !---------------------------------------------
    !> @brief Set the plan's auto-allocation flag.  The plan will allocate its own workarea.
    !>
    !> @param[in] plan Pointer to the FFT plan.
    !> @param[in] autoAllocate 0 to disable auto-allocation, non-zero to enable.
    function hipfftSetAutoAllocation(plan, autoAllocate) &
       result(SetAutoAllocation) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftSetAutoAllocation")
#else
       bind(C, name="hipfftSetAutoAllocation")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: plan
       integer(c_int), value :: autoAllocate
       integer(c_int) :: SetAutoAllocation
    end function hipfftSetAutoAllocation

    !---------------------------------------------
    ! hipfftSetWorkArea
    !---------------------------------------------
    !> @brief Set the plan's work area.
    !>
    !> @param[in] plan Pointer to the FFT plan.
    !> @param[in] workArea Pointer to the work area (on device).
    function hipfftSetWorkArea(plan, workArea) &
       result(SetWorkArea) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftSetWorkArea")
#else
       bind(C, name="hipfftSetWorkArea")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: plan
       type(c_ptr), value :: workArea
       integer(c_int) :: SetWorkArea
    end function hipfftSetWorkArea

    !---------------------------------------------
    ! hipfftExecC2C
    !---------------------------------------------
    !> @brief Execute a (float) complex-to-complex FFT.
    !>
    !> @details If the input and output buffers are equal, an in-place
    !> transform is performed.
    !>
    !> @param[in] plan The FFT plan.
    !> @param[in] idata Input data (on device).
    !> @param[out] odata Output data (on device).
    !> @param[in] direction Either `HIPFFT_FORWARD` or `HIPFFT_BACKWARD`.
    function hipfftExecC2C(plan, idata, odata, direction) &
       result(ExecC2C) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftExecC2C")
#else
       bind(C, name="hipfftExecC2C")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: plan
       type(c_ptr), value :: idata
       type(c_ptr), value :: odata
       integer(c_int), value :: direction
       integer(c_int) :: ExecC2C
    end function hipfftExecC2C

    !---------------------------------------------
    ! hipfftExecR2C
    !---------------------------------------------
    !> @brief Execute a (float) real-to-complex FFT.
    !>
    !> @details If the input and output buffers are equal, an in-place
    !> transform is performed.
    !>
    !> @param[in] plan The FFT plan.
    !> @param[in] idata Input data (on device).
    !> @param[out] odata Output data (on device).
    function hipfftExecR2C(plan, idata, odata) &
       result(ExecR2C) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftExecR2C")
#else
       bind(C, name="hipfftExecR2C")
#endif
       import :: c_ptr, c_float, c_int
       type(c_ptr), value :: plan
       real(c_float) :: idata(*)
       type(c_ptr), value :: odata
       integer(c_int) :: ExecR2C
    end function hipfftExecR2C

    !---------------------------------------------
    ! hipfftExecC2R
    !---------------------------------------------
    !> @brief Execute a (float) complex-to-real FFT.
    !>
    !> @details If the input and output buffers are equal, an in-place
    !> transform is performed.
    !>
    !> @param[in] plan The FFT plan.
    !> @param[in] idata Input data (on device).
    !> @param[out] odata Output data (on device).
    function hipfftExecC2R(plan, idata, odata) &
       result(ExecC2R) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftExecC2R")
#else
       bind(C, name="hipfftExecC2R")
#endif
       import :: c_ptr, c_float, c_int
       type(c_ptr), value :: plan
       type(c_ptr), value :: idata
       real(c_float) :: odata(*)
       integer(c_int) :: ExecC2R
    end function hipfftExecC2R

    !---------------------------------------------
    ! hipfftExecZ2Z
    !---------------------------------------------
    !> @brief Execute a (double) complex-to-complex FFT.
    !>
    !> @details If the input and output buffers are equal, an in-place
    !> transform is performed.
    !>
    !> @param[in] plan The FFT plan.
    !> @param[in] idata Input data (on device).
    !> @param[out] odata Output data (on device).
    !> @param[in] direction Either `HIPFFT_FORWARD` or `HIPFFT_BACKWARD`.
    function hipfftExecZ2Z(plan, idata, odata, direction) &
       result(ExecZ2Z) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftExecZ2Z")
#else
       bind(C, name="hipfftExecZ2Z")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: plan
       type(c_ptr), value :: idata
       type(c_ptr), value :: odata
       integer(c_int), value :: direction
       integer(c_int) :: ExecZ2Z
    end function hipfftExecZ2Z

    !---------------------------------------------
    ! hipfftExecD2Z
    !---------------------------------------------
    !> @brief Execute a (double) real-to-complex FFT.
    !>
    !> @details If the input and output buffers are equal, an in-place
    !> transform is performed.
    !>
    !> @param[in] plan The FFT plan.
    !> @param[in] idata Input data (on device).
    !> @param[out] odata Output data (on device).
    function hipfftExecD2Z(plan, idata, odata) &
       result(ExecD2Z) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftExecD2Z")
#else
       bind(C, name="hipfftExecD2Z")
#endif
       import :: c_ptr, c_double, c_int
       type(c_ptr), value :: plan
       real(c_double) :: idata(*)
       type(c_ptr), value :: odata
       integer(c_int) :: ExecD2Z
    end function hipfftExecD2Z

    !---------------------------------------------
    ! hipfftExecZ2D
    !---------------------------------------------
    !> @brief Execute a (double) complex-to-real FFT.
    !>
    !> @details If the input and output buffers are equal, an in-place
    !> transform is performed.
    !>
    !> @param[in] plan The FFT plan.
    !> @param[in] idata Input data (on device).
    !> @param[out] odata Output data (on device).
    function hipfftExecZ2D(plan, idata, odata) &
       result(ExecZ2D) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftExecZ2D")
#else
       bind(C, name="hipfftExecZ2D")
#endif
       import :: c_ptr, c_double, c_int
       type(c_ptr), value :: plan
       type(c_ptr), value :: idata
       real(c_double) :: odata(*)
       integer(c_int) :: ExecZ2D
    end function hipfftExecZ2D

    !---------------------------------------------
    ! hipfftSetStream
    !---------------------------------------------
    !> @brief Set HIP stream to execute plan on.
    !>
    !> @details Associates a HIP stream with a hipFFT plan.  All kernels
    !> launched by this plan are associated with the provided stream.
    !>
    !> @param[in] plan The FFT plan.
    !> @param[in] stream The HIP stream.
    function hipfftSetStream(plan, stream) &
       result(SetStream) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftSetStream")
#else
       bind(C, name="hipfftSetStream")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: plan
       type(c_ptr), value :: stream
       integer(c_int) :: SetStream
    end function hipfftSetStream

    !---------------------------------------------
    ! hipfftDestroy
    !---------------------------------------------
    !> @brief Destroy and deallocate an existing plan.
    !>
    !> @param[in] plan Handle of the FFT plan to be destroyed.
    function hipfftDestroy(plan) &
       result(Destroy) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftDestroy")
#else
       bind(C, name="hipfftDestroy")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: plan
       integer(c_int) :: Destroy
    end function hipfftDestroy

    !---------------------------------------------
    ! hipfftGetVersion
    !---------------------------------------------
    !> @brief Get rocFFT/cuFFT version.
    !>
    !> @param[out] version cuFFT/rocFFT version (returned value).
    function hipfftGetVersion(version) &
       result(GetVersion) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftGetVersion")
#else
       bind(C, name="hipfftGetVersion")
#endif
       import :: c_int
       integer(c_int) :: version(*)
       integer(c_int) :: GetVersion
    end function hipfftGetVersion

    !---------------------------------------------
    ! hipfftGetProperty
    !---------------------------------------------
    !> @brief Get library property.
    !>
    !> @param[in] type Property type.
    !> @param[out] value Returned value.
    function hipfftGetProperty(type, value) &
       result(GetProperty) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftGetProperty")
#else
       bind(C, name="hipfftGetProperty")
#endif
       import :: c_int
       integer(c_int), value :: type
       integer(c_int) :: value(*)
       integer(c_int) :: GetProperty
    end function hipfftGetProperty

  end interface
end module hipfort_hipfft
