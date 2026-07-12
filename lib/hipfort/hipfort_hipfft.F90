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
  use hipfort_handles
  use, intrinsic :: iso_c_binding
  implicit none

  interface

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

  end interface

  interface hipfftPlan1d
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
    function hipfftPlan1d_raw(plan, nx, type, batch) &
       result(Plan1d_raw) &
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
       integer(c_int) :: Plan1d_raw
    end function hipfftPlan1d_raw

    module procedure hipfftPlan1d_typed
  end interface hipfftPlan1d

  interface hipfftPlan2d
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
    function hipfftPlan2d_raw(plan, nx, ny, type) &
       result(Plan2d_raw) &
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
       integer(c_int) :: Plan2d_raw
    end function hipfftPlan2d_raw

    module procedure hipfftPlan2d_typed
  end interface hipfftPlan2d

  interface hipfftPlan3d
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
    function hipfftPlan3d_raw(plan, nx, ny, nz, type) &
       result(Plan3d_raw) &
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
       integer(c_int) :: Plan3d_raw
    end function hipfftPlan3d_raw

    module procedure hipfftPlan3d_typed
  end interface hipfftPlan3d

  interface hipfftPlanMany
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
    function hipfftPlanMany_raw(plan, rank, n, inembed, istride, idist, onembed, ostride, odist, &
                                type, batch) &
       result(PlanMany_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftPlanMany")
#else
       bind(C, name="hipfftPlanMany")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: plan
       integer(c_int), value :: rank
       type(c_ptr), value :: n
       type(c_ptr), value :: inembed
       integer(c_int), value :: istride
       integer(c_int), value :: idist
       type(c_ptr), value :: onembed
       integer(c_int), value :: ostride
       integer(c_int), value :: odist
       integer(c_int), value :: type
       integer(c_int), value :: batch
       integer(c_int) :: PlanMany_raw
    end function hipfftPlanMany_raw

    module procedure hipfftPlanMany_native
    module procedure hipfftPlanMany_typed
  end interface hipfftPlanMany

  interface hipfftCreate
    !---------------------------------------------
    ! hipfftCreate
    !---------------------------------------------
    !> @brief Allocate a new plan.
    !>
    !> @param[out] plan Pointer to the FFT plan handle to be allocated.
    function hipfftCreate_raw(plan) &
       result(Create_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftCreate")
#else
       bind(C, name="hipfftCreate")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: plan
       integer(c_int) :: Create_raw
    end function hipfftCreate_raw

    module procedure hipfftCreate_typed
  end interface hipfftCreate

  interface hipfftExtPlanScaleFactor
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
    function hipfftExtPlanScaleFactor_raw(plan, scalefactor) &
       result(ExtPlanScaleFactor_raw) &
       bind(C, name="hipfftExtPlanScaleFactor")
       import :: c_ptr, c_double, c_int
       type(c_ptr), value :: plan
       real(c_double), value :: scalefactor
       integer(c_int) :: ExtPlanScaleFactor_raw
    end function hipfftExtPlanScaleFactor_raw

    module procedure hipfftExtPlanScaleFactor_typed
  end interface hipfftExtPlanScaleFactor

  interface hipfftMakePlan1d
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
    function hipfftMakePlan1d_raw(plan, nx, type, batch, workSize) &
       result(MakePlan1d_raw) &
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
       integer(c_int) :: MakePlan1d_raw
    end function hipfftMakePlan1d_raw

    module procedure hipfftMakePlan1d_typed
  end interface hipfftMakePlan1d

  interface hipfftMakePlan2d
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
    function hipfftMakePlan2d_raw(plan, nx, ny, type, workSize) &
       result(MakePlan2d_raw) &
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
       integer(c_int) :: MakePlan2d_raw
    end function hipfftMakePlan2d_raw

    module procedure hipfftMakePlan2d_typed
  end interface hipfftMakePlan2d

  interface hipfftMakePlan3d
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
    function hipfftMakePlan3d_raw(plan, nx, ny, nz, type, workSize) &
       result(MakePlan3d_raw) &
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
       integer(c_int) :: MakePlan3d_raw
    end function hipfftMakePlan3d_raw

    module procedure hipfftMakePlan3d_typed
  end interface hipfftMakePlan3d

  interface hipfftMakePlanMany
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
    function hipfftMakePlanMany_raw(plan, rank, n, inembed, istride, idist, onembed, ostride, &
                                    odist, type, batch, workSize) &
       result(MakePlanMany_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftMakePlanMany")
#else
       bind(C, name="hipfftMakePlanMany")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: plan
       integer(c_int), value :: rank
       type(c_ptr), value :: n
       type(c_ptr), value :: inembed
       integer(c_int), value :: istride
       integer(c_int), value :: idist
       type(c_ptr), value :: onembed
       integer(c_int), value :: ostride
       integer(c_int), value :: odist
       integer(c_int), value :: type
       integer(c_int), value :: batch
       type(c_ptr), value :: workSize
       integer(c_int) :: MakePlanMany_raw
    end function hipfftMakePlanMany_raw

    module procedure hipfftMakePlanMany_native
    module procedure hipfftMakePlanMany_typed
  end interface hipfftMakePlanMany

  interface hipfftMakePlanMany64
    !---------------------------------------------
    ! hipfftMakePlanMany64
    !---------------------------------------------
    function hipfftMakePlanMany64_raw(plan, rank, n, inembed, istride, idist, onembed, ostride, &
                                      odist, type, batch, workSize) &
       result(MakePlanMany64_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftMakePlanMany64")
#else
       bind(C, name="hipfftMakePlanMany64")
#endif
       import :: c_ptr, c_int, c_int64_t
       type(c_ptr), value :: plan
       integer(c_int), value :: rank
       type(c_ptr), value :: n
       type(c_ptr), value :: inembed
       integer(c_int64_t), value :: istride
       integer(c_int64_t), value :: idist
       type(c_ptr), value :: onembed
       integer(c_int64_t), value :: ostride
       integer(c_int64_t), value :: odist
       integer(c_int), value :: type
       integer(c_int64_t), value :: batch
       type(c_ptr), value :: workSize
       integer(c_int) :: MakePlanMany64_raw
    end function hipfftMakePlanMany64_raw

    module procedure hipfftMakePlanMany64_native
    module procedure hipfftMakePlanMany64_typed
  end interface hipfftMakePlanMany64

  interface hipfftEstimateMany
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
    function hipfftEstimateMany_raw(rank, n, inembed, istride, idist, onembed, ostride, odist, &
                                    type, batch, workSize) &
       result(EstimateMany_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftEstimateMany")
#else
       bind(C, name="hipfftEstimateMany")
#endif
       import :: c_int, c_ptr
       integer(c_int), value :: rank
       type(c_ptr), value :: n
       type(c_ptr), value :: inembed
       integer(c_int), value :: istride
       integer(c_int), value :: idist
       type(c_ptr), value :: onembed
       integer(c_int), value :: ostride
       integer(c_int), value :: odist
       integer(c_int), value :: type
       integer(c_int), value :: batch
       type(c_ptr), value :: workSize
       integer(c_int) :: EstimateMany_raw
    end function hipfftEstimateMany_raw

    module procedure hipfftEstimateMany_native
  end interface hipfftEstimateMany

  interface hipfftGetSize1d
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
    function hipfftGetSize1d_raw(plan, nx, type, batch, workSize) &
       result(GetSize1d_raw) &
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
       integer(c_int) :: GetSize1d_raw
    end function hipfftGetSize1d_raw

    module procedure hipfftGetSize1d_typed
  end interface hipfftGetSize1d

  interface hipfftGetSize2d
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
    function hipfftGetSize2d_raw(plan, nx, ny, type, workSize) &
       result(GetSize2d_raw) &
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
       integer(c_int) :: GetSize2d_raw
    end function hipfftGetSize2d_raw

    module procedure hipfftGetSize2d_typed
  end interface hipfftGetSize2d

  interface hipfftGetSize3d
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
    function hipfftGetSize3d_raw(plan, nx, ny, nz, type, workSize) &
       result(GetSize3d_raw) &
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
       integer(c_int) :: GetSize3d_raw
    end function hipfftGetSize3d_raw

    module procedure hipfftGetSize3d_typed
  end interface hipfftGetSize3d

  interface hipfftGetSizeMany
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
    function hipfftGetSizeMany_raw(plan, rank, n, inembed, istride, idist, onembed, ostride, &
                                   odist, type, batch, workSize) &
       result(GetSizeMany_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftGetSizeMany")
#else
       bind(C, name="hipfftGetSizeMany")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: plan
       integer(c_int), value :: rank
       type(c_ptr), value :: n
       type(c_ptr), value :: inembed
       integer(c_int), value :: istride
       integer(c_int), value :: idist
       type(c_ptr), value :: onembed
       integer(c_int), value :: ostride
       integer(c_int), value :: odist
       integer(c_int), value :: type
       integer(c_int), value :: batch
       type(c_ptr), value :: workSize
       integer(c_int) :: GetSizeMany_raw
    end function hipfftGetSizeMany_raw

    module procedure hipfftGetSizeMany_native
    module procedure hipfftGetSizeMany_typed
  end interface hipfftGetSizeMany

  interface hipfftGetSizeMany64
    !---------------------------------------------
    ! hipfftGetSizeMany64
    !---------------------------------------------
    function hipfftGetSizeMany64_raw(plan, rank, n, inembed, istride, idist, onembed, ostride, &
                                     odist, type, batch, workSize) &
       result(GetSizeMany64_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftGetSizeMany64")
#else
       bind(C, name="hipfftGetSizeMany64")
#endif
       import :: c_ptr, c_int, c_int64_t
       type(c_ptr), value :: plan
       integer(c_int), value :: rank
       type(c_ptr), value :: n
       type(c_ptr), value :: inembed
       integer(c_int64_t), value :: istride
       integer(c_int64_t), value :: idist
       type(c_ptr), value :: onembed
       integer(c_int64_t), value :: ostride
       integer(c_int64_t), value :: odist
       integer(c_int), value :: type
       integer(c_int64_t), value :: batch
       type(c_ptr), value :: workSize
       integer(c_int) :: GetSizeMany64_raw
    end function hipfftGetSizeMany64_raw

    module procedure hipfftGetSizeMany64_native
    module procedure hipfftGetSizeMany64_typed
  end interface hipfftGetSizeMany64

  interface hipfftGetSize
    !---------------------------------------------
    ! hipfftGetSize
    !---------------------------------------------
    !> @brief Return size of the work area size required for a rank-dimensional plan.
    !>
    !> @param[in] plan Pointer to the FFT plan.
    !> @param[out] workSize Pointer to work area size (returned value).
    function hipfftGetSize_raw(plan, workSize) &
       result(GetSize_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftGetSize")
#else
       bind(C, name="hipfftGetSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: plan
       type(c_ptr), value :: workSize
       integer(c_int) :: GetSize_raw
    end function hipfftGetSize_raw

    module procedure hipfftGetSize_typed
  end interface hipfftGetSize

  interface hipfftSetAutoAllocation
    !---------------------------------------------
    ! hipfftSetAutoAllocation
    !---------------------------------------------
    !> @brief Set the plan's auto-allocation flag.  The plan will allocate its own workarea.
    !>
    !> @param[in] plan Pointer to the FFT plan.
    !> @param[in] autoAllocate 0 to disable auto-allocation, non-zero to enable.
    function hipfftSetAutoAllocation_raw(plan, autoAllocate) &
       result(SetAutoAllocation_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftSetAutoAllocation")
#else
       bind(C, name="hipfftSetAutoAllocation")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: plan
       integer(c_int), value :: autoAllocate
       integer(c_int) :: SetAutoAllocation_raw
    end function hipfftSetAutoAllocation_raw

    module procedure hipfftSetAutoAllocation_typed
  end interface hipfftSetAutoAllocation

  interface hipfftSetWorkArea
    !---------------------------------------------
    ! hipfftSetWorkArea
    !---------------------------------------------
    !> @brief Set the plan's work area.
    !>
    !> @param[in] plan Pointer to the FFT plan.
    !> @param[in] workArea Pointer to the work area (on device).
    function hipfftSetWorkArea_raw(plan, workArea) &
       result(SetWorkArea_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftSetWorkArea")
#else
       bind(C, name="hipfftSetWorkArea")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: plan
       type(c_ptr), value :: workArea
       integer(c_int) :: SetWorkArea_raw
    end function hipfftSetWorkArea_raw

    module procedure hipfftSetWorkArea_typed
  end interface hipfftSetWorkArea

  interface hipfftExecC2C
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
    function hipfftExecC2C_raw(plan, idata, odata, direction) &
       result(ExecC2C_raw) &
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
       integer(c_int) :: ExecC2C_raw
    end function hipfftExecC2C_raw

    module procedure hipfftExecC2C_typed
  end interface hipfftExecC2C

  interface hipfftExecR2C
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
    function hipfftExecR2C_raw(plan, idata, odata) &
       result(ExecR2C_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftExecR2C")
#else
       bind(C, name="hipfftExecR2C")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: plan
       type(c_ptr), value :: idata
       type(c_ptr), value :: odata
       integer(c_int) :: ExecR2C_raw
    end function hipfftExecR2C_raw

    module procedure hipfftExecR2C_native
    module procedure hipfftExecR2C_typed
  end interface hipfftExecR2C

  interface hipfftExecC2R
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
    function hipfftExecC2R_raw(plan, idata, odata) &
       result(ExecC2R_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftExecC2R")
#else
       bind(C, name="hipfftExecC2R")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: plan
       type(c_ptr), value :: idata
       type(c_ptr), value :: odata
       integer(c_int) :: ExecC2R_raw
    end function hipfftExecC2R_raw

    module procedure hipfftExecC2R_native
    module procedure hipfftExecC2R_typed
  end interface hipfftExecC2R

  interface hipfftExecZ2Z
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
    function hipfftExecZ2Z_raw(plan, idata, odata, direction) &
       result(ExecZ2Z_raw) &
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
       integer(c_int) :: ExecZ2Z_raw
    end function hipfftExecZ2Z_raw

    module procedure hipfftExecZ2Z_typed
  end interface hipfftExecZ2Z

  interface hipfftExecD2Z
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
    function hipfftExecD2Z_raw(plan, idata, odata) &
       result(ExecD2Z_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftExecD2Z")
#else
       bind(C, name="hipfftExecD2Z")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: plan
       type(c_ptr), value :: idata
       type(c_ptr), value :: odata
       integer(c_int) :: ExecD2Z_raw
    end function hipfftExecD2Z_raw

    module procedure hipfftExecD2Z_native
    module procedure hipfftExecD2Z_typed
  end interface hipfftExecD2Z

  interface hipfftExecZ2D
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
    function hipfftExecZ2D_raw(plan, idata, odata) &
       result(ExecZ2D_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftExecZ2D")
#else
       bind(C, name="hipfftExecZ2D")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: plan
       type(c_ptr), value :: idata
       type(c_ptr), value :: odata
       integer(c_int) :: ExecZ2D_raw
    end function hipfftExecZ2D_raw

    module procedure hipfftExecZ2D_native
    module procedure hipfftExecZ2D_typed
  end interface hipfftExecZ2D

  interface hipfftSetStream
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
    function hipfftSetStream_raw(plan, stream) &
       result(SetStream_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftSetStream")
#else
       bind(C, name="hipfftSetStream")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: plan
       type(c_ptr), value :: stream
       integer(c_int) :: SetStream_raw
    end function hipfftSetStream_raw

    module procedure hipfftSetStream_typed
  end interface hipfftSetStream

  interface hipfftDestroy
    !---------------------------------------------
    ! hipfftDestroy
    !---------------------------------------------
    !> @brief Destroy and deallocate an existing plan.
    !>
    !> @param[in] plan Handle of the FFT plan to be destroyed.
    function hipfftDestroy_raw(plan) &
       result(Destroy_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftDestroy")
#else
       bind(C, name="hipfftDestroy")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: plan
       integer(c_int) :: Destroy_raw
    end function hipfftDestroy_raw

    module procedure hipfftDestroy_typed
  end interface hipfftDestroy

  interface hipfftGetVersion
    !---------------------------------------------
    ! hipfftGetVersion
    !---------------------------------------------
    !> @brief Get rocFFT/cuFFT version.
    !>
    !> @param[out] version cuFFT/rocFFT version (returned value).
    function hipfftGetVersion_raw(version) &
       result(GetVersion_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftGetVersion")
#else
       bind(C, name="hipfftGetVersion")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: version
       integer(c_int) :: GetVersion_raw
    end function hipfftGetVersion_raw

    module procedure hipfftGetVersion_native
  end interface hipfftGetVersion

  interface hipfftGetProperty
    !---------------------------------------------
    ! hipfftGetProperty
    !---------------------------------------------
    !> @brief Get library property.
    !>
    !> @param[in] type Property type.
    !> @param[out] value Returned value.
    function hipfftGetProperty_raw(type, value) &
       result(GetProperty_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cufftGetProperty")
#else
       bind(C, name="hipfftGetProperty")
#endif
       import :: c_int, c_ptr
       integer(c_int), value :: type
       type(c_ptr), value :: value
       integer(c_int) :: GetProperty_raw
    end function hipfftGetProperty_raw

    module procedure hipfftGetProperty_native
  end interface hipfftGetProperty


contains

    function hipfftPlan1d_typed(plan, nx, type, batch) result(Plan1d)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t) :: plan
      integer(c_int), value :: nx
      integer(c_int), value :: type
      integer(c_int), value :: batch
      integer(c_int) :: Plan1d
      Plan1d = hipfftPlan1d_raw(plan%ptr, nx, type, batch)
    end function hipfftPlan1d_typed

    function hipfftPlan2d_typed(plan, nx, ny, type) result(Plan2d)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t) :: plan
      integer(c_int), value :: nx
      integer(c_int), value :: ny
      integer(c_int), value :: type
      integer(c_int) :: Plan2d
      Plan2d = hipfftPlan2d_raw(plan%ptr, nx, ny, type)
    end function hipfftPlan2d_typed

    function hipfftPlan3d_typed(plan, nx, ny, nz, type) result(Plan3d)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t) :: plan
      integer(c_int), value :: nx
      integer(c_int), value :: ny
      integer(c_int), value :: nz
      integer(c_int), value :: type
      integer(c_int) :: Plan3d
      Plan3d = hipfftPlan3d_raw(plan%ptr, nx, ny, nz, type)
    end function hipfftPlan3d_typed

    function hipfftPlanMany_native(plan, rank, n, inembed, istride, idist, onembed, ostride, &
        odist, type, batch) result(PlanMany)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr) :: plan
      integer(c_int), value :: rank
      integer(c_int), target :: n(*)
      integer(c_int), target :: inembed(*)
      integer(c_int), value :: istride
      integer(c_int), value :: idist
      integer(c_int), target :: onembed(*)
      integer(c_int), value :: ostride
      integer(c_int), value :: odist
      integer(c_int), value :: type
      integer(c_int), value :: batch
      integer(c_int) :: PlanMany
      PlanMany = hipfftPlanMany_raw(plan, rank, c_loc(n(1)), c_loc(inembed(1)), istride, idist, &
        c_loc(onembed(1)), ostride, odist, type, batch)
    end function hipfftPlanMany_native

    function hipfftPlanMany_typed(plan, rank, n, inembed, istride, idist, onembed, ostride, odist, &
        type, batch) result(PlanMany)
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
      integer(c_int), value :: type
      integer(c_int), value :: batch
      integer(c_int) :: PlanMany
      PlanMany = hipfftPlanMany_raw(plan%ptr, rank, n, inembed, istride, idist, onembed, ostride, &
        odist, type, batch)
    end function hipfftPlanMany_typed

    function hipfftCreate_typed(plan) result(Create)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t) :: plan
      integer(c_int) :: Create
      Create = hipfftCreate_raw(plan%ptr)
    end function hipfftCreate_typed

    function hipfftExtPlanScaleFactor_typed(plan, scalefactor) result(ExtPlanScaleFactor)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      real(c_double), value :: scalefactor
      integer(c_int) :: ExtPlanScaleFactor
      ExtPlanScaleFactor = hipfftExtPlanScaleFactor_raw(plan%ptr, scalefactor)
    end function hipfftExtPlanScaleFactor_typed

    function hipfftMakePlan1d_typed(plan, nx, type, batch, workSize) result(MakePlan1d)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      integer(c_int), value :: nx
      integer(c_int), value :: type
      integer(c_int), value :: batch
      type(c_ptr), value :: workSize
      integer(c_int) :: MakePlan1d
      MakePlan1d = hipfftMakePlan1d_raw(plan%ptr, nx, type, batch, workSize)
    end function hipfftMakePlan1d_typed

    function hipfftMakePlan2d_typed(plan, nx, ny, type, workSize) result(MakePlan2d)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      integer(c_int), value :: nx
      integer(c_int), value :: ny
      integer(c_int), value :: type
      type(c_ptr), value :: workSize
      integer(c_int) :: MakePlan2d
      MakePlan2d = hipfftMakePlan2d_raw(plan%ptr, nx, ny, type, workSize)
    end function hipfftMakePlan2d_typed

    function hipfftMakePlan3d_typed(plan, nx, ny, nz, type, workSize) result(MakePlan3d)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      integer(c_int), value :: nx
      integer(c_int), value :: ny
      integer(c_int), value :: nz
      integer(c_int), value :: type
      type(c_ptr), value :: workSize
      integer(c_int) :: MakePlan3d
      MakePlan3d = hipfftMakePlan3d_raw(plan%ptr, nx, ny, nz, type, workSize)
    end function hipfftMakePlan3d_typed

    function hipfftMakePlanMany_native(plan, rank, n, inembed, istride, idist, onembed, ostride, &
        odist, type, batch, workSize) result(MakePlanMany)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: plan
      integer(c_int), value :: rank
      integer(c_int), target :: n(*)
      integer(c_int), target :: inembed(*)
      integer(c_int), value :: istride
      integer(c_int), value :: idist
      integer(c_int), target :: onembed(*)
      integer(c_int), value :: ostride
      integer(c_int), value :: odist
      integer(c_int), value :: type
      integer(c_int), value :: batch
      type(c_ptr), value :: workSize
      integer(c_int) :: MakePlanMany
      MakePlanMany = hipfftMakePlanMany_raw(plan, rank, c_loc(n(1)), c_loc(inembed(1)), istride, &
        idist, c_loc(onembed(1)), ostride, odist, type, batch, workSize)
    end function hipfftMakePlanMany_native

    function hipfftMakePlanMany_typed(plan, rank, n, inembed, istride, idist, onembed, ostride, &
        odist, type, batch, workSize) result(MakePlanMany)
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
      integer(c_int), value :: type
      integer(c_int), value :: batch
      type(c_ptr), value :: workSize
      integer(c_int) :: MakePlanMany
      MakePlanMany = hipfftMakePlanMany_raw(plan%ptr, rank, n, inembed, istride, idist, onembed, &
        ostride, odist, type, batch, workSize)
    end function hipfftMakePlanMany_typed

    function hipfftMakePlanMany64_native(plan, rank, n, inembed, istride, idist, onembed, ostride, &
        odist, type, batch, workSize) result(MakePlanMany64)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: plan
      integer(c_int), value :: rank
      integer(c_int64_t), target :: n(*)
      integer(c_int64_t), target :: inembed(*)
      integer(c_int64_t), value :: istride
      integer(c_int64_t), value :: idist
      integer(c_int64_t), target :: onembed(*)
      integer(c_int64_t), value :: ostride
      integer(c_int64_t), value :: odist
      integer(c_int), value :: type
      integer(c_int64_t), value :: batch
      type(c_ptr), value :: workSize
      integer(c_int) :: MakePlanMany64
      MakePlanMany64 = hipfftMakePlanMany64_raw(plan, rank, c_loc(n(1)), c_loc(inembed(1)), &
        istride, idist, c_loc(onembed(1)), ostride, odist, type, batch, workSize)
    end function hipfftMakePlanMany64_native

    function hipfftMakePlanMany64_typed(plan, rank, n, inembed, istride, idist, onembed, ostride, &
        odist, type, batch, workSize) result(MakePlanMany64)
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
      integer(c_int), value :: type
      integer(c_int64_t), value :: batch
      type(c_ptr), value :: workSize
      integer(c_int) :: MakePlanMany64
      MakePlanMany64 = hipfftMakePlanMany64_raw(plan%ptr, rank, n, inembed, istride, idist, &
        onembed, ostride, odist, type, batch, workSize)
    end function hipfftMakePlanMany64_typed

    function hipfftEstimateMany_native(rank, n, inembed, istride, idist, onembed, ostride, odist, &
        type, batch, workSize) result(EstimateMany)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), value :: rank
      integer(c_int), target :: n(*)
      integer(c_int), target :: inembed(*)
      integer(c_int), value :: istride
      integer(c_int), value :: idist
      integer(c_int), target :: onembed(*)
      integer(c_int), value :: ostride
      integer(c_int), value :: odist
      integer(c_int), value :: type
      integer(c_int), value :: batch
      type(c_ptr), value :: workSize
      integer(c_int) :: EstimateMany
      EstimateMany = hipfftEstimateMany_raw(rank, c_loc(n(1)), c_loc(inembed(1)), istride, idist, &
        c_loc(onembed(1)), ostride, odist, type, batch, workSize)
    end function hipfftEstimateMany_native

    function hipfftGetSize1d_typed(plan, nx, type, batch, workSize) result(GetSize1d)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      integer(c_int), value :: nx
      integer(c_int), value :: type
      integer(c_int), value :: batch
      type(c_ptr), value :: workSize
      integer(c_int) :: GetSize1d
      GetSize1d = hipfftGetSize1d_raw(plan%ptr, nx, type, batch, workSize)
    end function hipfftGetSize1d_typed

    function hipfftGetSize2d_typed(plan, nx, ny, type, workSize) result(GetSize2d)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      integer(c_int), value :: nx
      integer(c_int), value :: ny
      integer(c_int), value :: type
      type(c_ptr), value :: workSize
      integer(c_int) :: GetSize2d
      GetSize2d = hipfftGetSize2d_raw(plan%ptr, nx, ny, type, workSize)
    end function hipfftGetSize2d_typed

    function hipfftGetSize3d_typed(plan, nx, ny, nz, type, workSize) result(GetSize3d)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      integer(c_int), value :: nx
      integer(c_int), value :: ny
      integer(c_int), value :: nz
      integer(c_int), value :: type
      type(c_ptr), value :: workSize
      integer(c_int) :: GetSize3d
      GetSize3d = hipfftGetSize3d_raw(plan%ptr, nx, ny, nz, type, workSize)
    end function hipfftGetSize3d_typed

    function hipfftGetSizeMany_native(plan, rank, n, inembed, istride, idist, onembed, ostride, &
        odist, type, batch, workSize) result(GetSizeMany)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: plan
      integer(c_int), value :: rank
      integer(c_int), target :: n(*)
      integer(c_int), target :: inembed(*)
      integer(c_int), value :: istride
      integer(c_int), value :: idist
      integer(c_int), target :: onembed(*)
      integer(c_int), value :: ostride
      integer(c_int), value :: odist
      integer(c_int), value :: type
      integer(c_int), value :: batch
      type(c_ptr), value :: workSize
      integer(c_int) :: GetSizeMany
      GetSizeMany = hipfftGetSizeMany_raw(plan, rank, c_loc(n(1)), c_loc(inembed(1)), istride, &
        idist, c_loc(onembed(1)), ostride, odist, type, batch, workSize)
    end function hipfftGetSizeMany_native

    function hipfftGetSizeMany_typed(plan, rank, n, inembed, istride, idist, onembed, ostride, &
        odist, type, batch, workSize) result(GetSizeMany)
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
      integer(c_int), value :: type
      integer(c_int), value :: batch
      type(c_ptr), value :: workSize
      integer(c_int) :: GetSizeMany
      GetSizeMany = hipfftGetSizeMany_raw(plan%ptr, rank, n, inembed, istride, idist, onembed, &
        ostride, odist, type, batch, workSize)
    end function hipfftGetSizeMany_typed

    function hipfftGetSizeMany64_native(plan, rank, n, inembed, istride, idist, onembed, ostride, &
        odist, type, batch, workSize) result(GetSizeMany64)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: plan
      integer(c_int), value :: rank
      integer(c_int64_t), target :: n(*)
      integer(c_int64_t), target :: inembed(*)
      integer(c_int64_t), value :: istride
      integer(c_int64_t), value :: idist
      integer(c_int64_t), target :: onembed(*)
      integer(c_int64_t), value :: ostride
      integer(c_int64_t), value :: odist
      integer(c_int), value :: type
      integer(c_int64_t), value :: batch
      type(c_ptr), value :: workSize
      integer(c_int) :: GetSizeMany64
      GetSizeMany64 = hipfftGetSizeMany64_raw(plan, rank, c_loc(n(1)), c_loc(inembed(1)), istride, &
        idist, c_loc(onembed(1)), ostride, odist, type, batch, workSize)
    end function hipfftGetSizeMany64_native

    function hipfftGetSizeMany64_typed(plan, rank, n, inembed, istride, idist, onembed, ostride, &
        odist, type, batch, workSize) result(GetSizeMany64)
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
      integer(c_int), value :: type
      integer(c_int64_t), value :: batch
      type(c_ptr), value :: workSize
      integer(c_int) :: GetSizeMany64
      GetSizeMany64 = hipfftGetSizeMany64_raw(plan%ptr, rank, n, inembed, istride, idist, onembed, &
        ostride, odist, type, batch, workSize)
    end function hipfftGetSizeMany64_typed

    function hipfftGetSize_typed(plan, workSize) result(GetSize)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      type(c_ptr), value :: workSize
      integer(c_int) :: GetSize
      GetSize = hipfftGetSize_raw(plan%ptr, workSize)
    end function hipfftGetSize_typed

    function hipfftSetAutoAllocation_typed(plan, autoAllocate) result(SetAutoAllocation)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      integer(c_int), value :: autoAllocate
      integer(c_int) :: SetAutoAllocation
      SetAutoAllocation = hipfftSetAutoAllocation_raw(plan%ptr, autoAllocate)
    end function hipfftSetAutoAllocation_typed

    function hipfftSetWorkArea_typed(plan, workArea) result(SetWorkArea)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      type(c_ptr), value :: workArea
      integer(c_int) :: SetWorkArea
      SetWorkArea = hipfftSetWorkArea_raw(plan%ptr, workArea)
    end function hipfftSetWorkArea_typed

    function hipfftExecC2C_typed(plan, idata, odata, direction) result(ExecC2C)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      type(c_ptr), value :: idata
      type(c_ptr), value :: odata
      integer(c_int), value :: direction
      integer(c_int) :: ExecC2C
      ExecC2C = hipfftExecC2C_raw(plan%ptr, idata, odata, direction)
    end function hipfftExecC2C_typed

    function hipfftExecR2C_native(plan, idata, odata) result(ExecR2C)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: plan
      real(c_float), target :: idata(*)
      type(c_ptr), value :: odata
      integer(c_int) :: ExecR2C
      ExecR2C = hipfftExecR2C_raw(plan, c_loc(idata(1)), odata)
    end function hipfftExecR2C_native

    function hipfftExecR2C_typed(plan, idata, odata) result(ExecR2C)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      type(c_ptr), value :: idata
      type(c_ptr), value :: odata
      integer(c_int) :: ExecR2C
      ExecR2C = hipfftExecR2C_raw(plan%ptr, idata, odata)
    end function hipfftExecR2C_typed

    function hipfftExecC2R_native(plan, idata, odata) result(ExecC2R)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: plan
      type(c_ptr), value :: idata
      real(c_float), target :: odata(*)
      integer(c_int) :: ExecC2R
      ExecC2R = hipfftExecC2R_raw(plan, idata, c_loc(odata(1)))
    end function hipfftExecC2R_native

    function hipfftExecC2R_typed(plan, idata, odata) result(ExecC2R)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      type(c_ptr), value :: idata
      type(c_ptr), value :: odata
      integer(c_int) :: ExecC2R
      ExecC2R = hipfftExecC2R_raw(plan%ptr, idata, odata)
    end function hipfftExecC2R_typed

    function hipfftExecZ2Z_typed(plan, idata, odata, direction) result(ExecZ2Z)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      type(c_ptr), value :: idata
      type(c_ptr), value :: odata
      integer(c_int), value :: direction
      integer(c_int) :: ExecZ2Z
      ExecZ2Z = hipfftExecZ2Z_raw(plan%ptr, idata, odata, direction)
    end function hipfftExecZ2Z_typed

    function hipfftExecD2Z_native(plan, idata, odata) result(ExecD2Z)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: plan
      real(c_double), target :: idata(*)
      type(c_ptr), value :: odata
      integer(c_int) :: ExecD2Z
      ExecD2Z = hipfftExecD2Z_raw(plan, c_loc(idata(1)), odata)
    end function hipfftExecD2Z_native

    function hipfftExecD2Z_typed(plan, idata, odata) result(ExecD2Z)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      type(c_ptr), value :: idata
      type(c_ptr), value :: odata
      integer(c_int) :: ExecD2Z
      ExecD2Z = hipfftExecD2Z_raw(plan%ptr, idata, odata)
    end function hipfftExecD2Z_typed

    function hipfftExecZ2D_native(plan, idata, odata) result(ExecZ2D)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: plan
      type(c_ptr), value :: idata
      real(c_double), target :: odata(*)
      integer(c_int) :: ExecZ2D
      ExecZ2D = hipfftExecZ2D_raw(plan, idata, c_loc(odata(1)))
    end function hipfftExecZ2D_native

    function hipfftExecZ2D_typed(plan, idata, odata) result(ExecZ2D)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      type(c_ptr), value :: idata
      type(c_ptr), value :: odata
      integer(c_int) :: ExecZ2D
      ExecZ2D = hipfftExecZ2D_raw(plan%ptr, idata, odata)
    end function hipfftExecZ2D_typed

    function hipfftSetStream_typed(plan, stream) result(SetStream)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      type(c_ptr), value :: stream
      integer(c_int) :: SetStream
      SetStream = hipfftSetStream_raw(plan%ptr, stream)
    end function hipfftSetStream_typed

    function hipfftDestroy_typed(plan) result(Destroy)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hipfftHandle_t), value :: plan
      integer(c_int) :: Destroy
      Destroy = hipfftDestroy_raw(plan%ptr)
    end function hipfftDestroy_typed

    function hipfftGetVersion_native(version) result(GetVersion)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), target :: version(*)
      integer(c_int) :: GetVersion
      GetVersion = hipfftGetVersion_raw(c_loc(version(1)))
    end function hipfftGetVersion_native

    function hipfftGetProperty_native(type, value) result(GetProperty)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), value :: type
      integer(c_int), target :: value(*)
      integer(c_int) :: GetProperty
      GetProperty = hipfftGetProperty_raw(type, c_loc(value(1)))
    end function hipfftGetProperty_native

end module hipfort_hipfft
