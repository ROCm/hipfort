!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Copyright (C) 2020-2026 Advanced Micro Devices, Inc. All rights reserved.
!
! SPDX-License-Identifier: MIT
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
  use hipfort_hipfft_types
  implicit none

  !>  @brief Create a new one-dimensional FFT plan.
  !>
  !>   @details Allocate and initialize a new one-dimensional FFT plan.
  !>
  !>   @param[out] plan - Pointer to the FFT plan handle.
  !>   @param[in] nx - FFT length.
  !>   @param[in] myType - FFT type.
  !>   @param[in] batch - Number of batched transforms to compute.
  interface hipfftPlan1d
#ifdef USE_CUDA_NAMES
    function hipfftPlan1d_(plan,nx,myType,batch) bind(c, name="cufftPlan1d")
#else
    function hipfftPlan1d_(plan,nx,myType,batch) bind(c, name="hipfftPlan1d")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftPlan1d_
      type(c_ptr) :: plan
      integer(c_int),value :: nx
      integer(c_int),value :: myType
      integer(c_int),value :: batch
    end function
  end interface

  !>  @brief Create a new two-dimensional FFT plan.
  !>
  !>   @details Allocate and initialize a new two-dimensional FFT plan.
  !>   Two-dimensional data should be stored in C ordering (row-major
  !>   format), so that indexes in y-direction (j index) vary the
  !>   fastest.
  !>
  !>   @param[out] plan - Pointer to the FFT plan handle.
  !>   @param[in] nx - Number of elements in the x-direction (slow index).
  !>   @param[in] ny - Number of elements in the y-direction (fast index).
  !>   @param[in] myType - FFT type.
  interface hipfftPlan2d
#ifdef USE_CUDA_NAMES
    function hipfftPlan2d_(plan,nx,ny,myType) bind(c, name="cufftPlan2d")
#else
    function hipfftPlan2d_(plan,nx,ny,myType) bind(c, name="hipfftPlan2d")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftPlan2d_
      type(c_ptr) :: plan
      integer(c_int),value :: nx
      integer(c_int),value :: ny
      integer(c_int),value :: myType
    end function
  end interface

  !>  @brief Create a new three-dimensional FFT plan.
  !>
  !>   @details Allocate and initialize a new three-dimensional FFT plan.
  !>   Three-dimensional data should be stored in C ordering (row-major
  !>   format), so that indexes in z-direction (k index) vary the
  !>   fastest.
  !>
  !>   @param[out] plan - Pointer to the FFT plan handle.
  !>   @param[in] nx - Number of elements in the x-direction (slowest index).
  !>   @param[in] ny - Number of elements in the y-direction.
  !>   @param[in] nz - Number of elements in the z-direction (fastest index).
  !>   @param[in] myType - FFT type.
  interface hipfftPlan3d
#ifdef USE_CUDA_NAMES
    function hipfftPlan3d_(plan,nx,ny,nz,myType) bind(c, name="cufftPlan3d")
#else
    function hipfftPlan3d_(plan,nx,ny,nz,myType) bind(c, name="hipfftPlan3d")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftPlan3d_
      type(c_ptr) :: plan
      integer(c_int),value :: nx
      integer(c_int),value :: ny
      integer(c_int),value :: nz
      integer(c_int),value :: myType
    end function
  end interface

  !>  @brief Create a new batched rank-dimensional FFT plan with advanced data layout.
  !>
  !>  @details Allocate and initialize a new batched rank-dimensional
  !>   FFT plan. The number of elements to transform in each direction of
  !>   the input data is specified in n.
  !>
  !>   The batch parameter tells hipFFT how many transforms to perform.
  !>   The distance between the first elements of two consecutive batches
  !>   of the input and output data are specified with the idist and odist
  !>   parameters.
  !>
  !>   The inembed and onembed parameters define the input and output data
  !>   layouts. The number of elements in the data is assumed to be larger
  !>   than the number of elements in the transform. Strided data layouts
  !>   are also supported. Strides along the fastest direction in the input
  !>   and output data are specified via the istride and ostride parameters.
  !>
  !>   If both inembed and onembed parameters are set to NULL, all the
  !>   advanced data layout parameters are ignored and reverted to default
  !>   values, i.e., the batched transform is performed with non-strided data
  !>   access and the number of data/transform elements are assumed to be
  !>   equivalent.
  !>
  !>   @param[out] plan - Pointer to the FFT plan handle.
  !>   @param[in] rank - Dimension of transform (1, 2, or 3).
  !>   @param[in] n - Number of elements to transform in the x/y/z directions.
  !>   @param[in] inembed - Number of elements in the input data in the x/y/z directions.
  !>   @param[in] istride - Distance between two successive elements in the input data.
  !>   @param[in] idist - Distance between input batches.
  !>   @param[in] onembed - Number of elements in the output data in the x/y/z directions.
  !>   @param[in] ostride - Distance between two successive elements in the output data.
  !>   @param[in] odist - Distance between output batches.
  !>   @param[in] myType - FFT type.
  !>   @param[in] batch - Number of batched transforms to perform.
  interface hipfftPlanMany
#ifdef USE_CUDA_NAMES
    function hipfftPlanMany_(plan,rank,n,inembed,istride,idist,onembed,ostride,odist,myType,batch) &
        bind(c, name="cufftPlanMany")
#else
    function hipfftPlanMany_(plan,rank,n,inembed,istride,idist,onembed,ostride,odist,myType,batch) &
        bind(c, name="hipfftPlanMany")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftPlanMany_
      type(c_ptr) :: plan
      integer(c_int),value :: rank
      type(c_ptr),value :: n
      type(c_ptr),value :: inembed
      integer(c_int),value :: istride
      integer(c_int),value :: idist
      type(c_ptr),value :: onembed
      integer(c_int),value :: ostride
      integer(c_int),value :: odist
      integer(c_int),value :: myType
      integer(c_int),value :: batch
    end function

#ifdef USE_ASSUMED_RANK
    module procedure hipfftPlanMany_assumed_rank
#else
#ifdef USE_ASSUMED_SHAPE
    module procedure &
      hipfftPlanMany_rank_0,&
      hipfftPlanMany_rank_1
#endif
#endif
  end interface

  !>  @brief Allocate a new plan.
  !>
  !>   @param[out] plan - Pointer to the FFT plan handle to be allocated.
  interface hipfftCreate
#ifdef USE_CUDA_NAMES
    function hipfftCreate_(plan) bind(c, name="cufftCreate")
#else
    function hipfftCreate_(plan) bind(c, name="hipfftCreate")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftCreate_
      type(c_ptr) :: plan
    end function
  end interface

  !>  @brief Set scaling factor.
  !>
  !>   @details hipFFT multiplies each element of the result by the given factor at the end of the
  !>   transform.
  !>
  !>   The supplied factor must be a finite number.  That is, it must neither be infinity nor NaN.
  !>
  !>   This function must be called after the plan is allocated using
  !>   `hipfftCreate`, but before the plan is initialized by any of the
  !>   "MakePlan" functions.  Therefore, API functions that combine
  !>   creation and initialization (`hipfftPlan1d`, `hipfftPlan2d`,
  !>   `hipfftPlan3d`, and `hipfftPlanMany`) cannot set a scale factor.
  !>
  !>   Note that the scale factor applies to both forward and
  !>   backward transforms executed with the specified plan handle.
#ifndef USE_CUDA_NAMES
  interface hipfftExtPlanScaleFactor
    function hipfftExtPlanScaleFactor_(plan,scalefactor) bind(c, name="hipfftExtPlanScaleFactor")
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftExtPlanScaleFactor_
      type(c_ptr),value :: plan
      real(c_double),value :: scalefactor
    end function
  end interface
#endif

  !>  @brief Initialize a new one-dimensional FFT plan.
  !>
  !>   @details Assumes that the plan has been created already, and
  !>   modifies the plan associated with the plan handle.
  !>
  !>   If the plan has been configured for multiple GPUs via `hipfftXtSetGPUs`,
  !>   this function returns `HIPFFT_NOT_IMPLEMENTED` when `batch` is `1`, with
  !>   rocFFT backend.
  !>
  !>   @param[in] plan - Handle of the FFT plan.
  !>   @param[in] nx - FFT length.
  !>   @param[in] myType - FFT type.
  !>   @param[in] batch - Number of batched transforms to compute.
  !>   @param[out] workSize - Pointer to work area size (returned value).
  interface hipfftMakePlan1d
#ifdef USE_CUDA_NAMES
    function hipfftMakePlan1d_(plan,nx,myType,batch,workSize) bind(c, name="cufftMakePlan1d")
#else
    function hipfftMakePlan1d_(plan,nx,myType,batch,workSize) bind(c, name="hipfftMakePlan1d")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftMakePlan1d_
      type(c_ptr),value :: plan
      integer(c_int),value :: nx
      integer(c_int),value :: myType
      integer(c_int),value :: batch
      type(c_ptr),value :: workSize
    end function

#ifdef USE_ASSUMED_RANK
    module procedure hipfftMakePlan1d_assumed_rank
#else
#ifdef USE_ASSUMED_SHAPE
    module procedure &
      hipfftMakePlan1d_rank_0,&
      hipfftMakePlan1d_rank_1
#endif
#endif
  end interface

  !>  @brief Initialize a new two-dimensional FFT plan.
  !>
  !>   @details Assumes that the plan has been created already, and
  !>   modifies the plan associated with the plan handle.
  !>   Two-dimensional data should be stored in C ordering (row-major
  !>   format), so that indexes in y-direction (j index) vary the
  !>   fastest.
  !>
  !>   @param[in] plan - Handle of the FFT plan.
  !>   @param[in] nx - Number of elements in the x-direction (slow index).
  !>   @param[in] ny - Number of elements in the y-direction (fast index).
  !>   @param[in] myType - FFT type.
  !>   @param[out] workSize - Pointer to work area size (returned value).
  interface hipfftMakePlan2d
#ifdef USE_CUDA_NAMES
    function hipfftMakePlan2d_(plan,nx,ny,myType,workSize) bind(c, name="cufftMakePlan2d")
#else
    function hipfftMakePlan2d_(plan,nx,ny,myType,workSize) bind(c, name="hipfftMakePlan2d")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftMakePlan2d_
      type(c_ptr),value :: plan
      integer(c_int),value :: nx
      integer(c_int),value :: ny
      integer(c_int),value :: myType
      type(c_ptr),value :: workSize
    end function

#ifdef USE_ASSUMED_RANK
    module procedure hipfftMakePlan2d_assumed_rank
#else
#ifdef USE_ASSUMED_SHAPE
    module procedure &
      hipfftMakePlan2d_rank_0,&
      hipfftMakePlan2d_rank_1
#endif
#endif
  end interface

  !>  @brief Initialize a new three-dimensional FFT plan.
  !>
  !>   @details Assumes that the plan has been created already, and
  !>   modifies the plan associated with the plan handle.
  !>   Three-dimensional data should be stored in C ordering (row-major
  !>   format), so that indexes in z-direction (k index) vary the
  !>   fastest.
  !>
  !>   @param[in] plan - Handle of the FFT plan.
  !>   @param[in] nx - Number of elements in the x-direction (slowest index).
  !>   @param[in] ny - Number of elements in the y-direction.
  !>   @param[in] nz - Number of elements in the z-direction (fastest index).
  !>   @param[in] myType - FFT type.
  !>   @param[out] workSize - Pointer to work area size (returned value).
  interface hipfftMakePlan3d
#ifdef USE_CUDA_NAMES
    function hipfftMakePlan3d_(plan,nx,ny,nz,myType,workSize) bind(c, name="cufftMakePlan3d")
#else
    function hipfftMakePlan3d_(plan,nx,ny,nz,myType,workSize) bind(c, name="hipfftMakePlan3d")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftMakePlan3d_
      type(c_ptr),value :: plan
      integer(c_int),value :: nx
      integer(c_int),value :: ny
      integer(c_int),value :: nz
      integer(c_int),value :: myType
      type(c_ptr),value :: workSize
    end function

#ifdef USE_ASSUMED_RANK
    module procedure hipfftMakePlan3d_assumed_rank
#else
#ifdef USE_ASSUMED_SHAPE
    module procedure &
      hipfftMakePlan3d_rank_0,&
      hipfftMakePlan3d_rank_1
#endif
#endif
  end interface

  !>  @brief Initialize a new batched rank-dimensional FFT plan with advanced data layout.
  !>
  !>   @details Assumes that the plan has been created already, and
  !>   modifies the plan associated with the plan handle. The number
  !>   of elements to transform in each direction of the input data
  !>   in the FFT plan is specified in n.
  !>
  !>   The batch parameter tells hipFFT how many transforms to perform.
  !>   The distance between the first elements of two consecutive batches
  !>   of the input and output data are specified with the idist and odist
  !>   parameters.
  !>
  !>   The inembed and onembed parameters define the input and output data
  !>   layouts. The number of elements in the data is assumed to be larger
  !>   than the number of elements in the transform. Strided data layouts
  !>   are also supported. Strides along the fastest direction in the input
  !>   and output data are specified via the istride and ostride parameters.
  !>
  !>   If both inembed and onembed parameters are set to NULL, all the
  !>   advanced data layout parameters are ignored and reverted to default
  !>   values, i.e., the batched transform is performed with non-strided data
  !>   access and the number of data/transform elements are assumed to be
  !>   equivalent.
  !>
  !>   @param[out] plan - Pointer to the FFT plan handle.
  !>   @param[in] rank - Dimension of transform (1, 2, or 3).
  !>   @param[in] n - Number of elements to transform in the x/y/z directions.
  !>   @param[in] inembed - Number of elements in the input data in the x/y/z directions.
  !>   @param[in] istride - Distance between two successive elements in the input data.
  !>   @param[in] idist - Distance between input batches.
  !>   @param[in] onembed - Number of elements in the output data in the x/y/z directions.
  !>   @param[in] ostride - Distance between two successive elements in the output data.
  !>   @param[in] odist - Distance between output batches.
  !>   @param[in] myType - FFT type.
  !>   @param[in] batch - Number of batched transforms to perform.
  !>   @param[out] workSize - Pointer to work area size (returned value).
  interface hipfftMakePlanMany
#ifdef USE_CUDA_NAMES
    function hipfftMakePlanMany_(plan,rank,n,inembed,istride,idist,onembed,ostride,odist,myType, &
        batch,workSize) &
        bind(c, name="cufftMakePlanMany")
#else
    function hipfftMakePlanMany_(plan,rank,n,inembed,istride,idist,onembed,ostride,odist,myType, &
        batch,workSize) &
        bind(c, name="hipfftMakePlanMany")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftMakePlanMany_
      type(c_ptr),value :: plan
      integer(c_int),value :: rank
      type(c_ptr),value :: n
      type(c_ptr),value :: inembed
      integer(c_int),value :: istride
      integer(c_int),value :: idist
      type(c_ptr),value :: onembed
      integer(c_int),value :: ostride
      integer(c_int),value :: odist
      integer(c_int),value :: myType
      integer(c_int),value :: batch
      type(c_ptr),value :: workSize
    end function

#ifdef USE_ASSUMED_RANK
    module procedure hipfftMakePlanMany_assumed_rank
#else
#ifdef USE_ASSUMED_SHAPE
    module procedure &
      hipfftMakePlanMany_rank_0,&
      hipfftMakePlanMany_rank_1
#endif
#endif
  end interface

  interface hipfftMakePlanMany64
#ifdef USE_CUDA_NAMES
    function hipfftMakePlanMany64_(plan,rank,n,inembed,istride,idist,onembed,ostride,odist,myType, &
        batch,workSize) &
        bind(c, name="cufftMakePlanMany64")
#else
    function hipfftMakePlanMany64_(plan,rank,n,inembed,istride,idist,onembed,ostride,odist,myType, &
        batch,workSize) &
        bind(c, name="hipfftMakePlanMany64")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftMakePlanMany64_
      type(c_ptr),value :: plan
      integer(c_int),value :: rank
      type(c_ptr),value :: n
      type(c_ptr),value :: inembed
      integer(c_int64_t),value :: istride
      integer(c_int64_t),value :: idist
      type(c_ptr),value :: onembed
      integer(c_int64_t),value :: ostride
      integer(c_int64_t),value :: odist
      integer(c_int),value :: myType
      integer(c_int64_t),value :: batch
      type(c_ptr),value :: workSize
    end function

#ifdef USE_ASSUMED_RANK
    module procedure hipfftMakePlanMany64_assumed_rank
#else
#ifdef USE_ASSUMED_SHAPE
    module procedure &
      hipfftMakePlanMany64_rank_0,&
      hipfftMakePlanMany64_rank_1
#endif
#endif
  end interface

  !>  @brief Return an estimate of the work area size required for a 1D plan.
  !>
  !>   @param[in] nx - Number of elements in the x-direction.
  !>   @param[in] myType - FFT type.
  !>   @param[in] batch - Number of batched transforms to perform.
  !>   @param[out] workSize - Pointer to work area size (returned value).
  interface hipfftEstimate1d
#ifdef USE_CUDA_NAMES
    function hipfftEstimate1d_(nx,myType,batch,workSize) bind(c, name="cufftEstimate1d")
#else
    function hipfftEstimate1d_(nx,myType,batch,workSize) bind(c, name="hipfftEstimate1d")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftEstimate1d_
      integer(c_int),value :: nx
      integer(c_int),value :: myType
      integer(c_int),value :: batch
      type(c_ptr),value :: workSize
    end function

    module procedure hipfftEstimate1d_typed
  end interface

  !>  @brief Return an estimate of the work area size required for a 2D plan.
  !>
  !>   @param[in] nx - Number of elements in the x-direction.
  !>   @param[in] ny - Number of elements in the y-direction.
  !>   @param[in] myType - FFT type.
  !>   @param[out] workSize - Pointer to work area size (returned value).
  interface hipfftEstimate2d
#ifdef USE_CUDA_NAMES
    function hipfftEstimate2d_(nx,ny,myType,workSize) bind(c, name="cufftEstimate2d")
#else
    function hipfftEstimate2d_(nx,ny,myType,workSize) bind(c, name="hipfftEstimate2d")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftEstimate2d_
      integer(c_int),value :: nx
      integer(c_int),value :: ny
      integer(c_int),value :: myType
      type(c_ptr),value :: workSize
    end function

    module procedure hipfftEstimate2d_typed
  end interface

  !>  @brief Return an estimate of the work area size required for a 3D plan.
  !>
  !>   @param[in] nx - Number of elements in the x-direction.
  !>   @param[in] ny - Number of elements in the y-direction.
  !>   @param[in] nz - Number of elements in the z-direction.
  !>   @param[in] myType - FFT type.
  !>   @param[out] workSize - Pointer to work area size (returned value).
  interface hipfftEstimate3d
#ifdef USE_CUDA_NAMES
    function hipfftEstimate3d_(nx,ny,nz,myType,workSize) bind(c, name="cufftEstimate3d")
#else
    function hipfftEstimate3d_(nx,ny,nz,myType,workSize) bind(c, name="hipfftEstimate3d")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftEstimate3d_
      integer(c_int),value :: nx
      integer(c_int),value :: ny
      integer(c_int),value :: nz
      integer(c_int),value :: myType
      type(c_ptr),value :: workSize
    end function

    module procedure hipfftEstimate3d_typed
  end interface

  !>  @brief Return an estimate of the work area size required for a rank-dimensional plan.
  !>
  !>   @param[in] rank - Dimension of FFT transform (1, 2, or 3).
  !>   @param[in] n - Number of elements in the x/y/z directions.
  !>   @param[in] inembed
  !>   @param[in] istride
  !>   @param[in] idist - Distance between input batches.
  !>   @param[in] onembed
  !>   @param[in] ostride
  !>   @param[in] odist - Distance between output batches.
  !>   @param[in] myType - FFT type.
  !>   @param[in] batch - Number of batched transforms to perform.
  !>   @param[out] workSize - Pointer to work area size (returned value).
  interface hipfftEstimateMany
#ifdef USE_CUDA_NAMES
    function hipfftEstimateMany_(rank,n,inembed,istride,idist,onembed,ostride,odist,myType,batch, &
        workSize) &
        bind(c, name="cufftEstimateMany")
#else
    function hipfftEstimateMany_(rank,n,inembed,istride,idist,onembed,ostride,odist,myType,batch, &
        workSize) &
        bind(c, name="hipfftEstimateMany")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftEstimateMany_
      integer(c_int),value :: rank
      type(c_ptr),value :: n
      type(c_ptr),value :: inembed
      integer(c_int),value :: istride
      integer(c_int),value :: idist
      type(c_ptr),value :: onembed
      integer(c_int),value :: ostride
      integer(c_int),value :: odist
      integer(c_int),value :: myType
      integer(c_int),value :: batch
      type(c_ptr),value :: workSize
    end function

    module procedure hipfftEstimateMany_typed

#ifdef USE_ASSUMED_RANK
    module procedure hipfftEstimateMany_assumed_rank
#else
#ifdef USE_ASSUMED_SHAPE
    module procedure &
      hipfftEstimateMany_rank_0,&
      hipfftEstimateMany_rank_1
#endif
#endif
  end interface

  !>  @brief Return size of the work area size required for a 1D plan.
  !>
  !>   @param[in] plan - Pointer to the FFT plan.
  !>   @param[in] nx - Number of elements in the x-direction.
  !>   @param[in] myType - FFT type.
  !>   @param[in] batch - Number of batched transforms to perform.
  !>   @param[out] workSize - Pointer to work area size (returned value).
  interface hipfftGetSize1d
#ifdef USE_CUDA_NAMES
    function hipfftGetSize1d_(plan,nx,myType,batch,workSize) bind(c, name="cufftGetSize1d")
#else
    function hipfftGetSize1d_(plan,nx,myType,batch,workSize) bind(c, name="hipfftGetSize1d")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftGetSize1d_
      type(c_ptr),value :: plan
      integer(c_int),value :: nx
      integer(c_int),value :: myType
      integer(c_int),value :: batch
      type(c_ptr),value :: workSize
    end function

#ifdef USE_ASSUMED_RANK
    module procedure hipfftGetSize1d_assumed_rank
#else
#ifdef USE_ASSUMED_SHAPE
    module procedure &
      hipfftGetSize1d_rank_0,&
      hipfftGetSize1d_rank_1
#endif
#endif
  end interface

  !>  @brief Return size of the work area size required for a 2D plan.
  !>
  !>   @param[in] plan - Pointer to the FFT plan.
  !>   @param[in] nx - Number of elements in the x-direction.
  !>   @param[in] ny - Number of elements in the y-direction.
  !>   @param[in] myType - FFT type.
  !>   @param[out] workSize - Pointer to work area size (returned value).
  interface hipfftGetSize2d
#ifdef USE_CUDA_NAMES
    function hipfftGetSize2d_(plan,nx,ny,myType,workSize) bind(c, name="cufftGetSize2d")
#else
    function hipfftGetSize2d_(plan,nx,ny,myType,workSize) bind(c, name="hipfftGetSize2d")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftGetSize2d_
      type(c_ptr),value :: plan
      integer(c_int),value :: nx
      integer(c_int),value :: ny
      integer(c_int),value :: myType
      type(c_ptr),value :: workSize
    end function

#ifdef USE_ASSUMED_RANK
    module procedure hipfftGetSize2d_assumed_rank
#else
#ifdef USE_ASSUMED_SHAPE
    module procedure &
      hipfftGetSize2d_rank_0,&
      hipfftGetSize2d_rank_1
#endif
#endif
  end interface

  !>  @brief Return size of the work area size required for a 3D plan.
  !>
  !>   @param[in] plan - Pointer to the FFT plan.
  !>   @param[in] nx - Number of elements in the x-direction.
  !>   @param[in] ny - Number of elements in the y-direction.
  !>   @param[in] nz - Number of elements in the z-direction.
  !>   @param[in] myType - FFT type.
  !>   @param[out] workSize - Pointer to work area size (returned value).
  interface hipfftGetSize3d
#ifdef USE_CUDA_NAMES
    function hipfftGetSize3d_(plan,nx,ny,nz,myType,workSize) bind(c, name="cufftGetSize3d")
#else
    function hipfftGetSize3d_(plan,nx,ny,nz,myType,workSize) bind(c, name="hipfftGetSize3d")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftGetSize3d_
      type(c_ptr),value :: plan
      integer(c_int),value :: nx
      integer(c_int),value :: ny
      integer(c_int),value :: nz
      integer(c_int),value :: myType
      type(c_ptr),value :: workSize
    end function

#ifdef USE_ASSUMED_RANK
    module procedure hipfftGetSize3d_assumed_rank
#else
#ifdef USE_ASSUMED_SHAPE
    module procedure &
      hipfftGetSize3d_rank_0,&
      hipfftGetSize3d_rank_1
#endif
#endif
  end interface

  !>  @brief Return size of the work area size required for a rank-dimensional plan.
  !>
  !>   @param[in] plan - Pointer to the FFT plan.
  !>   @param[in] rank - Dimension of FFT transform (1, 2, or 3).
  !>   @param[in] n - Number of elements in the x/y/z directions.
  !>   @param[in] inembed
  !>   @param[in] istride
  !>   @param[in] idist - Distance between input batches.
  !>   @param[in] onembed
  !>   @param[in] ostride
  !>   @param[in] odist - Distance between output batches.
  !>   @param[in] myType - FFT type.
  !>   @param[in] batch - Number of batched transforms to perform.
  !>   @param[out] workSize - Pointer to work area size (returned value).
  interface hipfftGetSizeMany
#ifdef USE_CUDA_NAMES
    function hipfftGetSizeMany_(plan,rank,n,inembed,istride,idist,onembed,ostride,odist,myType, &
        batch,workSize) &
        bind(c, name="cufftGetSizeMany")
#else
    function hipfftGetSizeMany_(plan,rank,n,inembed,istride,idist,onembed,ostride,odist,myType, &
        batch,workSize) &
        bind(c, name="hipfftGetSizeMany")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftGetSizeMany_
      type(c_ptr),value :: plan
      integer(c_int),value :: rank
      type(c_ptr),value :: n
      type(c_ptr),value :: inembed
      integer(c_int),value :: istride
      integer(c_int),value :: idist
      type(c_ptr),value :: onembed
      integer(c_int),value :: ostride
      integer(c_int),value :: odist
      integer(c_int),value :: myType
      integer(c_int),value :: batch
      type(c_ptr),value :: workSize
    end function

#ifdef USE_ASSUMED_RANK
    module procedure hipfftGetSizeMany_assumed_rank
#else
#ifdef USE_ASSUMED_SHAPE
    module procedure &
      hipfftGetSizeMany_rank_0,&
      hipfftGetSizeMany_rank_1
#endif
#endif
  end interface

  interface hipfftGetSizeMany64
#ifdef USE_CUDA_NAMES
    function hipfftGetSizeMany64_(plan,rank,n,inembed,istride,idist,onembed,ostride,odist,myType, &
        batch,workSize) &
        bind(c, name="cufftGetSizeMany64")
#else
    function hipfftGetSizeMany64_(plan,rank,n,inembed,istride,idist,onembed,ostride,odist,myType, &
        batch,workSize) &
        bind(c, name="hipfftGetSizeMany64")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftGetSizeMany64_
      type(c_ptr),value :: plan
      integer(c_int),value :: rank
      type(c_ptr),value :: n
      type(c_ptr),value :: inembed
      integer(c_int64_t),value :: istride
      integer(c_int64_t),value :: idist
      type(c_ptr),value :: onembed
      integer(c_int64_t),value :: ostride
      integer(c_int64_t),value :: odist
      integer(c_int),value :: myType
      integer(c_int64_t),value :: batch
      type(c_ptr),value :: workSize
    end function

#ifdef USE_ASSUMED_RANK
    module procedure hipfftGetSizeMany64_assumed_rank
#else
#ifdef USE_ASSUMED_SHAPE
    module procedure &
      hipfftGetSizeMany64_rank_0,&
      hipfftGetSizeMany64_rank_1
#endif
#endif
  end interface

  !>  @brief Return size(s) of the work area(s) required for an initialized plan.
  !>
  !>   @param[in] plan - Pointer to the initialized FFT plan.
  !>   @param[out] workSize - Pointer to work area size(s). As many values as the number
  !>   of (local) devices used by the plan are written (following the same order as
  !>   set via `hipfftXtSetGPUs` if more than one local device is used).
  interface hipfftGetSize
#ifdef USE_CUDA_NAMES
    function hipfftGetSize_(plan,workSize) bind(c, name="cufftGetSize")
#else
    function hipfftGetSize_(plan,workSize) bind(c, name="hipfftGetSize")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftGetSize_
      type(c_ptr),value :: plan
      type(c_ptr),value :: workSize
    end function

#ifdef USE_ASSUMED_RANK
    module procedure hipfftGetSize_assumed_rank
#else
#ifdef USE_ASSUMED_SHAPE
    module procedure &
      hipfftGetSize_rank_0,&
      hipfftGetSize_rank_1
#endif
#endif
  end interface

  !>  @brief Set the plan's auto-allocation flag.  The plan will allocate its own workarea(s).
  !>
  !>   @param[in] plan - Pointer to the FFT plan.
  !>   @param[in] autoAllocate - 0 to disable auto-allocation, non-zero to enable.
  interface hipfftSetAutoAllocation
#ifdef USE_CUDA_NAMES
    function hipfftSetAutoAllocation_(plan,autoAllocate) bind(c, name="cufftSetAutoAllocation")
#else
    function hipfftSetAutoAllocation_(plan,autoAllocate) bind(c, name="hipfftSetAutoAllocation")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftSetAutoAllocation_
      type(c_ptr),value :: plan
      integer(c_int),value :: autoAllocate
    end function
  end interface

  !>  @brief Set the plan's work area.
  !>   @note This function rejects multi-device plans. Use `hipfftXtSetWorkArea` instead.
  !>   @param[in] plan - Pointer to the FFT plan.
  !>   @param[in] workArea - Pointer to the work area (must be accessible by the device).
  interface hipfftSetWorkArea
#ifdef USE_CUDA_NAMES
    function hipfftSetWorkArea_(plan,workArea) bind(c, name="cufftSetWorkArea")
#else
    function hipfftSetWorkArea_(plan,workArea) bind(c, name="hipfftSetWorkArea")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftSetWorkArea_
      type(c_ptr),value :: plan
      type(c_ptr),value :: workArea
    end function
  end interface

  !>  @brief Generalized version of `hipfftSetWorkArea` accepting multi-device plans.
  !>
  !>   @param[in] plan - Pointer to the (possibly multi-device) FFT plan.
  !>   @param[in] workArea - Array of pointer(s) to the plan's work area(s), which must
  !>   be accessible by the plan's used device(s) (in the same order as communicated
  !>   via `hipfftXtSetGPUs`, if used prior).
  interface hipfftXtSetWorkArea
#ifdef USE_CUDA_NAMES
    function hipfftXtSetWorkArea_(plan,workArea) bind(c, name="cufftXtSetWorkArea")
#else
    function hipfftXtSetWorkArea_(plan,workArea) bind(c, name="hipfftXtSetWorkArea")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftXtSetWorkArea_
      type(c_ptr),value :: plan
      type(c_ptr) :: workArea
    end function
  end interface

  !>  @brief Execute a (float) complex-to-complex FFT.
  !>
  !>   @details If the input and output buffers are equal, an in-place
  !>   transform is performed.
  !>
  !>   @param[in] plan - The FFT plan.
  !>   @param[in] idata - Input data (on device).
  !>   @param[out] odata - Output data (on device).
  !>   @param[in] direction - Either `HIPFFT_FORWARD` or `HIPFFT_BACKWARD`.
  interface hipfftExecC2C
#ifdef USE_CUDA_NAMES
    function hipfftExecC2C_(plan,idata,odata,direction) bind(c, name="cufftExecC2C")
#else
    function hipfftExecC2C_(plan,idata,odata,direction) bind(c, name="hipfftExecC2C")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftExecC2C_
      type(c_ptr),value :: plan
      type(c_ptr),value :: idata
      type(c_ptr),value :: odata
      integer(c_int),value :: direction
    end function

#ifdef USE_ASSUMED_RANK
    module procedure hipfftExecC2C_assumed_rank
#else
#ifdef USE_ASSUMED_SHAPE
    module procedure &
      hipfftExecC2C_rank_0,&
      hipfftExecC2C_rank_1,&
      hipfftExecC2C_rank_2,&
      hipfftExecC2C_rank_3
#endif
#endif
  end interface

  !>  @brief Execute a (float) real-to-complex FFT.
  !>
  !>   @details If the input and output buffers are equal, an in-place
  !>   transform is performed.
  !>
  !>   @param[in] plan - The FFT plan.
  !>   @param[in] idata - Input data (on device).
  !>   @param[out] odata - Output data (on device).
  interface hipfftExecR2C
#ifdef USE_CUDA_NAMES
    function hipfftExecR2C_(plan,idata,odata) bind(c, name="cufftExecR2C")
#else
    function hipfftExecR2C_(plan,idata,odata) bind(c, name="hipfftExecR2C")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftExecR2C_
      type(c_ptr),value :: plan
      type(c_ptr),value :: idata
      type(c_ptr),value :: odata
    end function

#ifdef USE_ASSUMED_RANK
    module procedure hipfftExecR2C_assumed_rank
#else
#ifdef USE_ASSUMED_SHAPE
    module procedure &
      hipfftExecR2C_rank_0,&
      hipfftExecR2C_rank_1,&
      hipfftExecR2C_rank_2,&
      hipfftExecR2C_rank_3
#endif
#endif
  end interface

  !>  @brief Execute a (float) complex-to-real FFT.
  !>
  !>   @details If the input and output buffers are equal, an in-place
  !>   transform is performed.
  !>
  !>   @param[in] plan - The FFT plan.
  !>   @param[in] idata - Input data (on device).
  !>   @param[out] odata - Output data (on device).
  interface hipfftExecC2R
#ifdef USE_CUDA_NAMES
    function hipfftExecC2R_(plan,idata,odata) bind(c, name="cufftExecC2R")
#else
    function hipfftExecC2R_(plan,idata,odata) bind(c, name="hipfftExecC2R")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftExecC2R_
      type(c_ptr),value :: plan
      type(c_ptr),value :: idata
      type(c_ptr),value :: odata
    end function

#ifdef USE_ASSUMED_RANK
    module procedure hipfftExecC2R_assumed_rank
#else
#ifdef USE_ASSUMED_SHAPE
    module procedure &
      hipfftExecC2R_rank_0,&
      hipfftExecC2R_rank_1,&
      hipfftExecC2R_rank_2,&
      hipfftExecC2R_rank_3
#endif
#endif
  end interface

  !>  @brief Execute a (double) complex-to-complex FFT.
  !>
  !>   @details If the input and output buffers are equal, an in-place
  !>   transform is performed.
  !>
  !>   @param[in] plan - The FFT plan.
  !>   @param[in] idata - Input data (on device).
  !>   @param[out] odata - Output data (on device).
  !>   @param[in] direction - Either `HIPFFT_FORWARD` or `HIPFFT_BACKWARD`.
  interface hipfftExecZ2Z
#ifdef USE_CUDA_NAMES
    function hipfftExecZ2Z_(plan,idata,odata,direction) bind(c, name="cufftExecZ2Z")
#else
    function hipfftExecZ2Z_(plan,idata,odata,direction) bind(c, name="hipfftExecZ2Z")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftExecZ2Z_
      type(c_ptr),value :: plan
      type(c_ptr),value :: idata
      type(c_ptr),value :: odata
      integer(c_int),value :: direction
    end function

#ifdef USE_ASSUMED_RANK
    module procedure hipfftExecZ2Z_assumed_rank
#else
#ifdef USE_ASSUMED_SHAPE
    module procedure &
      hipfftExecZ2Z_rank_0,&
      hipfftExecZ2Z_rank_1,&
      hipfftExecZ2Z_rank_2,&
      hipfftExecZ2Z_rank_3
#endif
#endif
  end interface

  !>  @brief Execute a (double) real-to-complex FFT.
  !>
  !>   @details If the input and output buffers are equal, an in-place
  !>   transform is performed.
  !>
  !>   @param[in] plan - The FFT plan.
  !>   @param[in] idata - Input data (on device).
  !>   @param[out] odata - Output data (on device).
  interface hipfftExecD2Z
#ifdef USE_CUDA_NAMES
    function hipfftExecD2Z_(plan,idata,odata) bind(c, name="cufftExecD2Z")
#else
    function hipfftExecD2Z_(plan,idata,odata) bind(c, name="hipfftExecD2Z")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftExecD2Z_
      type(c_ptr),value :: plan
      type(c_ptr),value :: idata
      type(c_ptr),value :: odata
    end function

#ifdef USE_ASSUMED_RANK
    module procedure hipfftExecD2Z_assumed_rank
#else
#ifdef USE_ASSUMED_SHAPE
    module procedure &
      hipfftExecD2Z_rank_0,&
      hipfftExecD2Z_rank_1,&
      hipfftExecD2Z_rank_2,&
      hipfftExecD2Z_rank_3
#endif
#endif
  end interface

  !>  @brief Execute a (double) complex-to-real FFT.
  !>
  !>   @details If the input and output buffers are equal, an in-place
  !>   transform is performed.
  !>
  !>   @param[in] plan - The FFT plan.
  !>   @param[in] idata - Input data (on device).
  !>   @param[out] odata - Output data (on device).
  interface hipfftExecZ2D
#ifdef USE_CUDA_NAMES
    function hipfftExecZ2D_(plan,idata,odata) bind(c, name="cufftExecZ2D")
#else
    function hipfftExecZ2D_(plan,idata,odata) bind(c, name="hipfftExecZ2D")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftExecZ2D_
      type(c_ptr),value :: plan
      type(c_ptr),value :: idata
      type(c_ptr),value :: odata
    end function

#ifdef USE_ASSUMED_RANK
    module procedure hipfftExecZ2D_assumed_rank
#else
#ifdef USE_ASSUMED_SHAPE
    module procedure &
      hipfftExecZ2D_rank_0,&
      hipfftExecZ2D_rank_1,&
      hipfftExecZ2D_rank_2,&
      hipfftExecZ2D_rank_3
#endif
#endif
  end interface

  !>  @brief Set HIP stream to execute plan on.
  !>
  !>  @details Associates a HIP stream with a hipFFT plan.  All kernels
  !>  launched by this plan are associated with the provided stream.
  !>
  !>  @param[in] plan - The FFT plan.
  !>  @param[in] stream - The HIP stream.
  interface hipfftSetStream
#ifdef USE_CUDA_NAMES
    function hipfftSetStream_(plan,stream) bind(c, name="cufftSetStream")
#else
    function hipfftSetStream_(plan,stream) bind(c, name="hipfftSetStream")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftSetStream_
      type(c_ptr),value :: plan
      type(c_ptr),value :: stream
    end function
  end interface

  !>  @brief Destroy and deallocate an existing plan.
  !>
  !>   @param[in] plan - Handle of the FFT plan to be destroyed.
  interface hipfftDestroy
#ifdef USE_CUDA_NAMES
    function hipfftDestroy_(plan) bind(c, name="cufftDestroy")
#else
    function hipfftDestroy_(plan) bind(c, name="hipfftDestroy")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftDestroy_
      type(c_ptr),value :: plan
    end function
  end interface

  !>  @brief Get rocFFT/cuFFT version.
  !>
  !>   @param[out] version - cuFFT/rocFFT version (returned value).
  interface hipfftGetVersion
#ifdef USE_CUDA_NAMES
    function hipfftGetVersion_(version) bind(c, name="cufftGetVersion")
#else
    function hipfftGetVersion_(version) bind(c, name="hipfftGetVersion")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftGetVersion_
      type(c_ptr),value :: version
    end function

    module procedure hipfftGetVersion_typed
  end interface

  !>  @brief Get library property.
  !>
  !>   @param[in] myType - Property type.
  !>   @param[out] myValue - Returned value.
  interface hipfftGetProperty
#ifdef USE_CUDA_NAMES
    function hipfftGetProperty_(myType,myValue) bind(c, name="cufftGetProperty")
#else
    function hipfftGetProperty_(myType,myValue) bind(c, name="hipfftGetProperty")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftGetProperty_
      integer(c_int),value :: myType
      type(c_ptr),value :: myValue
    end function

    module procedure hipfftGetProperty_typed
  end interface

#ifndef USE_CUDA_NAMES
  interface hipfftXtSetCallback
    function hipfftXtSetCallback_(plan,callbacks,cbtype,callbackData) &
        bind(c, name="hipfftXtSetCallback")
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftXtSetCallback_
      type(c_ptr),value :: plan
      type(c_ptr) :: callbacks
      integer(c_int),value :: cbtype
      type(c_ptr) :: callbackData
    end function
  end interface
#endif

#ifndef USE_CUDA_NAMES
  interface hipfftXtClearCallback
    function hipfftXtClearCallback_(plan,cbtype) bind(c, name="hipfftXtClearCallback")
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftXtClearCallback_
      type(c_ptr),value :: plan
      integer(c_int),value :: cbtype
    end function
  end interface
#endif

  !>  @brief Set shared memory size for callback.
  !>
  !>  @details Set shared memory required for a callback.  The
  !>  callback of the specified type must have already been set on the
  !>  plan.
  !>
  !>  @param[in] plan - The FFT plan.
  !>  @param[in] cbtype - Type of callback being modified.
  !>  @param[in] sharedSize - Amount of shared memory required, in bytes.
#ifndef USE_CUDA_NAMES
  interface hipfftXtSetCallbackSharedSize
    function hipfftXtSetCallbackSharedSize_(plan,cbtype,sharedSize) &
        bind(c, name="hipfftXtSetCallbackSharedSize")
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftXtSetCallbackSharedSize_
      type(c_ptr),value :: plan
      integer(c_int),value :: cbtype
      integer(c_size_t),value :: sharedSize
    end function
  end interface
#endif

  !>  @brief Set a JIT callback on a plan
  !>
  !>  @details Set either a load or store callback to run with a plan.
  !>  The type of callback is specified with the `cbtype` parameter.
  !>  The callback is provided as SPIR-V on AMD platforms and as
  !>  LTO-IR fatbin on CUDA platforms.
  !>
  !>   Note: JIT callbacks cannot currently be used on multi-GPU transforms.
  !>   This support will be added in a future release of hipFFT.
  !>
  !>  JIT callbacks can be cleared from the plan by passing nullptr
  !>  for `symbol_name` and `bitcode_data`, and 0 for
  !>  `bitcode_len_bytes`.
  !>
  !>  `cbdata` is an optional array of pointers of data that is passed
  !>  to the callback function.  As JIT callbacks are currently only
  !>  supported for single-device transforms, this array must have one
  !>  pointer element in it if it is specified.  The pointer will be
  !>  passed to the callback function's `cbdata` parameter when it is
  !>  executed on that device.
  !>
  !>  If specified, the `cbdata` array must remain valid until either
  !>  the plan is destroyed or callbacks are cleared from the plan.
  !>
  !>  This function must be called after the plan is allocated using
  !>  `hipfftCreate`, but before the plan is initialized by any of the
  !>  "MakePlan" functions.  Therefore, API functions that combine
  !>  creation and initialization (`hipfftPlan1d`, `hipfftPlan2d`,
  !>  `hipfftPlan3d`, and `hipfftPlanMany`) cannot set a JIT callback.
  !>
  !>  @param[in] plan - The FFT plan.
  !>  @param[in] symbol_name - Name of the symbol in the compiled bitcode.
  !>  @param[in] bitcode_data - Pointer to bitcode data.
  !>  @param[in] bitcode_len_bytes - Number of bytes in the bitcode data.
  !>  @param[in] cbtype - Type of callback function.
  !>  @param[in] cbdata - Array of callback function data pointers.
#ifndef USE_CUDA_NAMES
  interface hipfftXtSetJITCallback
    function hipfftXtSetJITCallback_(plan,symbol_name,bitcode_data,bitcode_len_bytes,cbtype, &
        cbdata) &
        bind(c, name="hipfftXtSetJITCallback")
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftXtSetJITCallback_
      type(c_ptr),value :: plan
      type(c_ptr),value :: symbol_name
      type(c_ptr),value :: bitcode_data
      integer(c_size_t),value :: bitcode_len_bytes
      integer(c_int),value :: cbtype
      type(c_ptr) :: cbdata
    end function
  end interface
#endif

  !>  @brief Initialize a batched rank-dimensional FFT plan with
  !>     advanced data layout and specified input, output, execution data
  !>     types.
  !>
  !>   @details Assumes that the plan has been created already, and
  !>   modifies the plan associated with the plan handle. The number
  !>   of elements to transform in each direction of the input data
  !>   in the FFT plan is specified in n.
  !>
  !>   The batch parameter tells hipFFT how many transforms to perform.
  !>   The distance between the first elements of two consecutive batches
  !>   of the input and output data are specified with the idist and odist
  !>   parameters.
  !>
  !>   The inembed and onembed parameters define the input and output data
  !>   layouts. The number of elements in the data is assumed to be larger
  !>   than the number of elements in the transform. Strided data layouts
  !>   are also supported. Strides along the fastest direction in the input
  !>   and output data are specified via the istride and ostride parameters.
  !>
  !>   If both inembed and onembed parameters are set to NULL, all the
  !>   advanced data layout parameters are ignored and reverted to default
  !>   values, i.e., the batched transform is performed with non-strided data
  !>   access and the number of data/transform elements are assumed to be
  !>   equivalent.
  !>
  !>   The inputType, outputType, executionType parameters specify the
  !>   data types (precision, and whether the data is real-valued or
  !>   complex-valued) of the transform input, output, and internal
  !>   representation respectively.  Currently, the precision of all
  !>   three parameters must match, and the execution type must always
  !>   be complex-valued.  At least one of inputType and outputType
  !>   must be complex.  A half-precision transform can be requested
  !>   by using either the HIP_R_16F or HIP_C_16F types.
  !>
  !>   @param[out] plan - Pointer to the FFT plan handle.
  !>   @param[in] rank - Dimension of transform (1, 2, or 3).
  !>   @param[in] n - Number of elements to transform in the x/y/z directions.
  !>   @param[in] inembed - Number of elements in the input data in the x/y/z directions.
  !>   @param[in] istride - Distance between two successive elements in the input data.
  !>   @param[in] idist - Distance between input batches.
  !>   @param[in] inputType - Format of FFT input.
  !>   @param[in] onembed - Number of elements in the output data in the x/y/z directions.
  !>   @param[in] ostride - Distance between two successive elements in the output data.
  !>   @param[in] odist - Distance between output batches.
  !>   @param[in] outputType - Format of FFT output.
  !>   @param[in] batch - Number of batched transforms to perform.
  !>   @param[out] workSize - Pointer to work area size (returned value).
  !>   @param[in] executionType - Internal data format used by the library during computation.
#ifndef USE_CUDA_NAMES
  interface hipfftXtMakePlanMany
    function hipfftXtMakePlanMany_(plan,rank,n,inembed,istride,idist,inputType,onembed,ostride, &
        odist,outputType,batch,workSize,executionType) &
        bind(c, name="hipfftXtMakePlanMany")
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftXtMakePlanMany_
      type(c_ptr),value :: plan
      integer(c_int),value :: rank
      type(c_ptr),value :: n
      type(c_ptr),value :: inembed
      integer(c_int64_t),value :: istride
      integer(c_int64_t),value :: idist
      integer(c_int),value :: inputType
      type(c_ptr),value :: onembed
      integer(c_int64_t),value :: ostride
      integer(c_int64_t),value :: odist
      integer(c_int),value :: outputType
      integer(c_int64_t),value :: batch
      type(c_ptr),value :: workSize
      integer(c_int),value :: executionType
    end function
  end interface
#endif

  !>  @brief Return size of the work area size required for a
  !>     rank-dimensional plan, with specified input, output, execution
  !>     data types.
  !>
  !>  @details See `hipfftXtMakePlanMany` for restrictions on inputType,
  !>  outputType, executionType parameters.
  !>
  !>   @param[in] plan - Pointer to the FFT plan.
  !>   @param[in] rank - Dimension of FFT transform (1, 2, or 3).
  !>   @param[in] n - Number of elements in the x/y/z directions.
  !>   @param[in] inembed - Number of elements in the input data in the x/y/z directions.
  !>   @param[in] istride - Distance between two successive elements in the input data.
  !>   @param[in] idist - Distance between input batches.
  !>   @param[in] inputType - Format of FFT input.
  !>   @param[in] onembed - Number of elements in the output data in the x/y/z directions.
  !>   @param[in] ostride - Distance between two successive elements in the output data.
  !>   @param[in] odist - Distance between output batches.
  !>   @param[in] outputType - Format of FFT output.
  !>   @param[in] batch - Number of batched transforms to perform.
  !>   @param[out] workSize - Pointer to work area size (returned value).
  !>   @param[in] executionType - Internal data format used by the library during computation.
#ifndef USE_CUDA_NAMES
  interface hipfftXtGetSizeMany
    function hipfftXtGetSizeMany_(plan,rank,n,inembed,istride,idist,inputType,onembed,ostride, &
        odist,outputType,batch,workSize,executionType) &
        bind(c, name="hipfftXtGetSizeMany")
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftXtGetSizeMany_
      type(c_ptr),value :: plan
      integer(c_int),value :: rank
      type(c_ptr),value :: n
      type(c_ptr),value :: inembed
      integer(c_int64_t),value :: istride
      integer(c_int64_t),value :: idist
      integer(c_int),value :: inputType
      type(c_ptr),value :: onembed
      integer(c_int64_t),value :: ostride
      integer(c_int64_t),value :: odist
      integer(c_int),value :: outputType
      integer(c_int64_t),value :: batch
      type(c_ptr),value :: workSize
      integer(c_int),value :: executionType
    end function
  end interface
#endif

  !>  @brief Execute an FFT plan for any precision and type.
  !>
  !>  @details An in-place transform is performed if the input and
  !>  output pointers have the same value.
  !>
  !>  The direction parameter is ignored if for real-to-complex and
  !>  complex-to-real transforms, as the direction is already implied by
  !>  the data types.
  !>
  !>   @param[in] plan - Pointer to the FFT plan.
  !>   @param[in] input - Pointer to input data for the transform.
  !>   @param[in] output - Pointer to output data for the transform.
  !>   @param[in] direction - Either `HIPFFT_FORWARD` or `HIPFFT_BACKWARD`.
#ifndef USE_CUDA_NAMES
  interface hipfftXtExec
    function hipfftXtExec_(plan,input,output,direction) bind(c, name="hipfftXtExec")
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftXtExec_
      type(c_ptr),value :: plan
      type(c_ptr),value :: input
      type(c_ptr),value :: output
      integer(c_int),value :: direction
    end function
  end interface
#endif

  !>  @brief Instructs hipFFT to use multiple GPUs for a plan.
  !>
  !>   This function must be called after the plan is allocated using
  !>   `hipfftCreate`, but before the plan is initialized by any of the
  !>   "MakePlan" functions.  Therefore, API functions that combine
  !>   creation and initialization (`hipfftPlan1d`, `hipfftPlan2d`,
  !>   `hipfftPlan3d`, and `hipfftPlanMany`) cannot use multiple GPUs.
  !>
  !>  @note The rocFFT backend currently requires all device IDs in
  !>   the `gpus` array to be distinct.
  !>
  !>  @param[in, out] plan - The FFT plan.
  !>  @param[in] count - Number of GPUs (length of the `gpus` array).
  !>  @param[in] gpus - Array of device IDs.
  !>
  !>  @warning Experimental
#ifndef USE_CUDA_NAMES
  interface hipfftXtSetGPUs
    function hipfftXtSetGPUs_(plan,count,gpus) bind(c, name="hipfftXtSetGPUs")
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftXtSetGPUs_
      type(c_ptr),value :: plan
      integer(c_int),value :: count
      type(c_ptr),value :: gpus
    end function
  end interface
#endif

  !>  @brief Allocates a multi-device descriptor (i.e., a `hipLibXtDesc` instance),
  !>   tailored to a specific multi-device plan's needs. The allocated descriptor
  !>   must be freed using `hipfftXtFree` when no longer needed.
  !>
  !>   @details The data set of interest that is considered for the definition of
  !>   the desired descriptor is the plan's expected input data set, unless
  !>   `format` is `HIPFFT_XT_FORMAT_OUTPUT`. For values of `format` consistent
  !>   with in-place operations (i.e., `HIPFFT_XT_FORMAT_INPLACE` or
  !>   `HIPFFT_XT_FORMAT_INPLACE_SHUFFLED`), the created descriptor is usable for
  !>   both the plan's input and output data sets.
  !>
  !>   @note Multi-device descriptors resulting in a division of real data sets
  !>     along their fastest dimension are not supported. As a result,
  !>     `hipfftXtMalloc` does not produce usable descriptors for requests to
  !>     create a multi-device descriptor of subformat value
  !>     `HIPFFT_XT_FORMAT_INPLACE_SHUFFLED` (resp. `HIPFFT_XT_FORMAT_INPLACE`)
  !>     given a plan initialized for an unbatched two-dimensional real forward
  !>     (resp. inverse) transform.
  !>
  !>  @param[in] plan - Multi-device FFT plan to allocate descriptor memory for.
  !>  @param[out] desc - Address of the pointer to the created descriptor.
  !>  @param[in] myFormat - Desired descriptor's subformat, identifying the plan's
  !>  I/O data set of interest (see `hipfftXtSubFormat` for more details).
  !>
  !>  @warning Experimental
#ifndef USE_CUDA_NAMES
  interface hipfftXtMalloc
    function hipfftXtMalloc_(plan,desc,myFormat) bind(c, name="hipfftXtMalloc")
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftXtMalloc_
      type(c_ptr),value :: plan
      type(c_ptr) :: desc
      integer(c_int),value :: myFormat
    end function
  end interface
#endif

  !>  @brief Copy data to/from `hipLibXtDesc` descriptors.
  !>
  !>  @details If `type` is `HIPFFT_COPY_HOST_TO_DEVICE` (resp.
  !>  `HIPFFT_COPY_DEVICE_TO_HOST`), `src` (resp. `dest`) must point to a
  !>  host-residing memory buffer and `dest` (resp. `src`) must point to a
  !>  `hipLibXtDesc` descriptor. That descriptor must be fit for storing the plan's
  !>  input (resp. output) data set assuming it's distributed consistently with the
  !>  descriptor's own `subFormat` value (see `hipfftXtSubFormat` for more details).
  !>  The host buffer must be large enough to hold the plan's input (resp. output)
  !>  data (accounting for possible padding in real domain for plans and descriptors
  !>  specific to data for in-place real transforms).
  !>  `HIPFFT_COPY_DEVICE_TO_DEVICE` copies are supported only from descriptors of
  !>  format `HIPFFT_XT_FORMAT_INPLACE_SHUFFLED` to descriptors of format
  !>  `HIPFFT_XT_FORMAT_INPLACE` along with plans that support both formats.
  !>
  !>  @param[in] plan - Multi-device FFT plan of interest, defining the data set of
  !>  relevance for the desired copy operation.
  !>  @param[out] dest - Opaque pointer to the copy destination.
  !>  @param[in] src - Opaque pointer to the copy source.
  !>  @param[in] myType - Type of copy operation to perform.
  !>
  !>  @warning Experimental
#ifndef USE_CUDA_NAMES
  interface hipfftXtMemcpy
    function hipfftXtMemcpy_(plan,dest,src,myType) bind(c, name="hipfftXtMemcpy")
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftXtMemcpy_
      type(c_ptr),value :: plan
      type(c_ptr),value :: dest
      type(c_ptr),value :: src
      integer(c_int),value :: myType
    end function
  end interface
#endif

  !>  @brief Free memory allocated by `hipfftXtMalloc`.
  !>
  !>  @param[in] desc - Descriptor whose memory will be freed.
  !>
  !>  @warning Experimental
#ifndef USE_CUDA_NAMES
  interface hipfftXtFree
    function hipfftXtFree_(desc) bind(c, name="hipfftXtFree")
      use iso_c_binding
      use hipfort_hipfft_enums
      use hipfort_hipfft_types
      implicit none
      integer(c_int) :: hipfftXtFree_
      type(hipLibXtDesc) :: desc
    end function
  end interface
#endif

  !>  @ingroup hipfftXtExecDescriptor
  !>
  !>  @param[in] plan - The FFT plan.
  !>  @param[in] input - Input data.
  !>  @param[out] output - Output data.
  !>  @param[in] direction - Either `HIPFFT_FORWARD` or `HIPFFT_BACKWARD`.
  !>
  !>  @brief Execute single-precision complex-to-complex transform.
#ifndef USE_CUDA_NAMES
  interface hipfftXtExecDescriptorC2C
    function hipfftXtExecDescriptorC2C_(plan,input,output,direction) &
        bind(c, name="hipfftXtExecDescriptorC2C")
      use iso_c_binding
      use hipfort_hipfft_enums
      use hipfort_hipfft_types
      implicit none
      integer(c_int) :: hipfftXtExecDescriptorC2C_
      type(c_ptr),value :: plan
      type(hipLibXtDesc) :: input
      type(hipLibXtDesc) :: output
      integer(c_int),value :: direction
    end function
  end interface
#endif

  !>  @ingroup hipfftXtExecDescriptor
  !>
  !>  @param[in] plan - The FFT plan.
  !>  @param[in] input - Input data.
  !>  @param[out] output - Output data.
  !>
  !>  @brief Execute single-precision real forward transform.
#ifndef USE_CUDA_NAMES
  interface hipfftXtExecDescriptorR2C
    function hipfftXtExecDescriptorR2C_(plan,input,output) bind(c, name="hipfftXtExecDescriptorR2C")
      use iso_c_binding
      use hipfort_hipfft_enums
      use hipfort_hipfft_types
      implicit none
      integer(c_int) :: hipfftXtExecDescriptorR2C_
      type(c_ptr),value :: plan
      type(hipLibXtDesc) :: input
      type(hipLibXtDesc) :: output
    end function
  end interface
#endif

  !>  @ingroup hipfftXtExecDescriptor
  !>
  !>  @param[in] plan - The FFT plan.
  !>  @param[in] input - Input data.
  !>  @param[out] output - Output data.
  !>
  !>  @brief Execute single-precision real backward transform.
#ifndef USE_CUDA_NAMES
  interface hipfftXtExecDescriptorC2R
    function hipfftXtExecDescriptorC2R_(plan,input,output) bind(c, name="hipfftXtExecDescriptorC2R")
      use iso_c_binding
      use hipfort_hipfft_enums
      use hipfort_hipfft_types
      implicit none
      integer(c_int) :: hipfftXtExecDescriptorC2R_
      type(c_ptr),value :: plan
      type(hipLibXtDesc) :: input
      type(hipLibXtDesc) :: output
    end function
  end interface
#endif

  !>  @ingroup hipfftXtExecDescriptor
  !>
  !>  @param[in] plan - The FFT plan.
  !>  @param[in] input - Input data.
  !>  @param[out] output - Output data.
  !>  @param[in] direction - Either `HIPFFT_FORWARD` or `HIPFFT_BACKWARD`.
  !>
  !>  @brief Execute double-precision complex-to-complex transform.
#ifndef USE_CUDA_NAMES
  interface hipfftXtExecDescriptorZ2Z
    function hipfftXtExecDescriptorZ2Z_(plan,input,output,direction) &
        bind(c, name="hipfftXtExecDescriptorZ2Z")
      use iso_c_binding
      use hipfort_hipfft_enums
      use hipfort_hipfft_types
      implicit none
      integer(c_int) :: hipfftXtExecDescriptorZ2Z_
      type(c_ptr),value :: plan
      type(hipLibXtDesc) :: input
      type(hipLibXtDesc) :: output
      integer(c_int),value :: direction
    end function
  end interface
#endif

  !>  @ingroup hipfftXtExecDescriptor
  !>
  !>  @param[in] plan - The FFT plan.
  !>  @param[in] input - Input data.
  !>  @param[out] output - Output data.
  !>
  !>  @brief Execute double-precision real forward transform.
#ifndef USE_CUDA_NAMES
  interface hipfftXtExecDescriptorD2Z
    function hipfftXtExecDescriptorD2Z_(plan,input,output) bind(c, name="hipfftXtExecDescriptorD2Z")
      use iso_c_binding
      use hipfort_hipfft_enums
      use hipfort_hipfft_types
      implicit none
      integer(c_int) :: hipfftXtExecDescriptorD2Z_
      type(c_ptr),value :: plan
      type(hipLibXtDesc) :: input
      type(hipLibXtDesc) :: output
    end function
  end interface
#endif

  !>  @ingroup hipfftXtExecDescriptor
  !>
  !>  @param[in] plan - The FFT plan.
  !>  @param[in] input - Input data.
  !>  @param[out] output - Output data.
  !>
  !>  @brief Execute double-precision real backward transform.
#ifndef USE_CUDA_NAMES
  interface hipfftXtExecDescriptorZ2D
    function hipfftXtExecDescriptorZ2D_(plan,input,output) bind(c, name="hipfftXtExecDescriptorZ2D")
      use iso_c_binding
      use hipfort_hipfft_enums
      use hipfort_hipfft_types
      implicit none
      integer(c_int) :: hipfftXtExecDescriptorZ2D_
      type(c_ptr),value :: plan
      type(hipLibXtDesc) :: input
      type(hipLibXtDesc) :: output
    end function
  end interface
#endif

  !>  @ingroup hipfftXtExecDescriptor
  !>
  !>  @param[in] plan - The FFT plan.
  !>  @param[in] input - Input data.
  !>  @param[out] output - Output data.
  !>  @param[in] direction - Either `HIPFFT_FORWARD` or `HIPFFT_BACKWARD`.
  !>
  !>  @brief Execute general transform - types of the descriptors must match the plan.
#ifndef USE_CUDA_NAMES
  interface hipfftXtExecDescriptor
    function hipfftXtExecDescriptor_(plan,input,output,direction) &
        bind(c, name="hipfftXtExecDescriptor")
      use iso_c_binding
      use hipfort_hipfft_enums
      use hipfort_hipfft_types
      implicit none
      integer(c_int) :: hipfftXtExecDescriptor_
      type(c_ptr),value :: plan
      type(hipLibXtDesc) :: input
      type(hipLibXtDesc) :: output
      integer(c_int),value :: direction
    end function
  end interface
#endif

  !>  @brief Set a multi-processing communicator on a plan.
  !>
  !>  @details Attach a multi-processing communication handle to a
  !>  hipFFT plan.  'comm_handle' points to the handle, whose type
  !>  depends on the multi-processing library being used.  With MPI
  !>  (Message Passing Interface) for example, 'comm_handle' points to
  !>  an MPI communicator.
  !>
  !>  This function must only be called on a plan that has already
  !>  been allocated by `hipfftCreate`, but before the plan is
  !>  initialized with any of the 'hipfftMakePlan' functions.
  !>
  !>  @param[in] plan - The FFT plan.
  !>  @param[in] comm_type - Type of communication handle.
  !>  @param[in] comm_handle - Pointer to the communication handle.
  !>
  !>  @warning Experimental
#ifndef USE_CUDA_NAMES
  interface hipfftMpAttachComm
    function hipfftMpAttachComm_(plan,comm_type,comm_handle) bind(c, name="hipfftMpAttachComm")
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftMpAttachComm_
      type(c_ptr),value :: plan
      integer(c_int),value :: comm_type
      type(c_ptr),value :: comm_handle
    end function
  end interface
#endif

  !>  @brief Describe the partial input and output for a distributed transform in the current
  !>  process.
  !>
  !>  @details For the given plan, describe the 'brick' of input and
  !>  output that is distributed to the current process.  A brick is
  !>  defined with the lower and upper coordinates of the that brick
  !>  in the global index space of the transform.
  !>
  !>  Strides for both the input and output bricks are also provided,
  !>  to describe how the brick is laid out in memory.
  !>
  !>  All coordinates and strides are in row-major order, with the
  !>  slowest-moving dimension specified first.
  !>
  !>  This function must only be called on a plan that has already
  !>  been allocated by `hipfftCreate`, but before the plan is
  !>  initialized with any of the 'hipfftMakePlan' functions.
  !>
  !>  @param[in] plan - The FFT plan.
  !>  @param[in] rank - Dimension of the transform
  !>  @param[in] input_lower - Array of length rank, specifying the lower index (inclusive) for the
  !>  brick in the FFT input.
  !>  @param[in] input_upper - Array of length rank, specifying the upper index (exclusive) for the
  !>  brick in the FFT input.
  !>  @param[in] output_lower - Array of length rank, specifying the lower index (inclusive) for the
  !>  brick in the FFT output.
  !>  @param[in] output_upper - Array of length rank, specifying the upper index (exclusive) for the
  !>  brick in the FFT output.
  !>  @param[in] input_stride - Array of length rank specifying the input brick's stride in memory
  !>  @param[in] output_stride - Array of length rank specifying the output brick's stride in memory
  !>
  !>  @warning Experimental
#ifndef USE_CUDA_NAMES
  interface hipfftXtSetDistribution
    function hipfftXtSetDistribution_(plan,rank,input_lower,input_upper,output_lower,output_upper, &
        input_stride,output_stride) &
        bind(c, name="hipfftXtSetDistribution")
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftXtSetDistribution_
      type(c_ptr),value :: plan
      integer(c_int),value :: rank
      type(c_ptr),value :: input_lower
      type(c_ptr),value :: input_upper
      type(c_ptr),value :: output_lower
      type(c_ptr),value :: output_upper
      type(c_ptr),value :: input_stride
      type(c_ptr),value :: output_stride
    end function
  end interface
#endif

  !>  @brief Set the input and output formats for a distributed transform.
  !>
  !>  @details Specifies the distribution of data for each side of a
  !>  distributed transform.  Forward transforms use 'subformat_forward'
  !>  to describe input and 'subformat_inverse' to describe output.
  !>  Inverse transforms use 'subformat_inverse' to describe input and
  !>  'subformat_forward' to describe output.
  !>
  !>  'subformat_forward' and 'subformat_inverse' must be set to
  !>  matching values.  One may be HIPFFT_XT_FORMAT_INPLACE and the
  !>  other HIPFFT_XT_FORMAT_INPLACE_SHUFFLED; Alternatively, one may be
  !>  HIPFFT_XT_FORMAT_DISTRIBUTED_INPUT and the other
  !>  HIPFFT_XT_FORMAT_DISTRIBUTED_OUTPUT.
  !>
  !>  This function must only be called on a plan that has already
  !>  been allocated by `hipfftCreate`, but before the plan is
  !>  initialized with any of the 'hipfftMakePlan' functions.
  !>
  !>  @param[in] plan - The FFT plan.
  !>  @param[in] subformat_forward - Format of the input for a forward transform.
  !>  @param[in] subformat_inverse - Format of the input for an inverse transform.
  !>
  !>  @warning Experimental
#ifndef USE_CUDA_NAMES
  interface hipfftXtSetSubformatDefault
    function hipfftXtSetSubformatDefault_(plan,subformat_forward,subformat_inverse) &
        bind(c, name="hipfftXtSetSubformatDefault")
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftXtSetSubformatDefault_
      type(c_ptr),value :: plan
      integer(c_int),value :: subformat_forward
      integer(c_int),value :: subformat_inverse
    end function
  end interface
#endif


  contains

    function hipfftEstimate1d_typed(nx,myType,batch,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftEstimate1d_typed
      integer(c_int) :: nx
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int) :: batch
      integer(c_size_t),target :: workSize
      !
      hipfftEstimate1d_typed = hipfftEstimate1d_(nx,myType,batch,c_loc(workSize))
    end function

    function hipfftEstimate2d_typed(nx,ny,myType,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftEstimate2d_typed
      integer(c_int) :: nx
      integer(c_int) :: ny
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_size_t),target :: workSize
      !
      hipfftEstimate2d_typed = hipfftEstimate2d_(nx,ny,myType,c_loc(workSize))
    end function

    function hipfftEstimate3d_typed(nx,ny,nz,myType,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftEstimate3d_typed
      integer(c_int) :: nx
      integer(c_int) :: ny
      integer(c_int) :: nz
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_size_t),target :: workSize
      !
      hipfftEstimate3d_typed = hipfftEstimate3d_(nx,ny,nz,myType,c_loc(workSize))
    end function

    function hipfftEstimateMany_typed(rank,n,inembed,istride,idist,onembed,ostride,odist,myType, &
        batch,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftEstimateMany_typed
      integer(c_int) :: rank
      type(c_ptr) :: n
      type(c_ptr) :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      type(c_ptr) :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int) :: batch
      integer(c_size_t),target :: workSize
      !
      hipfftEstimateMany_typed = hipfftEstimateMany_(rank,n,inembed,istride,idist,onembed,ostride, &
        odist,myType,batch,c_loc(workSize))
    end function

    function hipfftGetVersion_typed(version)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetVersion_typed
      integer(c_int),target :: version
      !
      hipfftGetVersion_typed = hipfftGetVersion_(c_loc(version))
    end function

    function hipfftGetProperty_typed(myType,myValue)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetProperty_typed
      integer(kind(HIPFFT_MAJOR_VERSION)) :: myType
      integer(c_int),target :: myValue
      !
      hipfftGetProperty_typed = hipfftGetProperty_(myType,c_loc(myValue))
    end function


#if defined(USE_ASSUMED_SHAPE) || defined(USE_ASSUMED_RANK)

#ifdef USE_ASSUMED_RANK
    function hipfftPlanMany_assumed_rank(plan,rank,n,inembed,istride,idist,onembed,ostride,odist, &
        myType,batch)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftPlanMany_assumed_rank
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
      hipfftPlanMany_assumed_rank = hipfftPlanMany_(plan,rank,c_loc(n),c_loc(inembed),istride, &
        idist,c_loc(onembed),ostride,odist,myType,batch)
    end function

#else
    function hipfftPlanMany_rank_0(plan,rank,n,inembed,istride,idist,onembed,ostride,odist,myType, &
        batch)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftPlanMany_rank_0
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
      hipfftPlanMany_rank_0 = hipfftPlanMany_(plan,rank,c_loc(n),c_loc(inembed),istride,idist, &
        c_loc(onembed),ostride,odist,myType,batch)
    end function

    function hipfftPlanMany_rank_1(plan,rank,n,inembed,istride,idist,onembed,ostride,odist,myType, &
        batch)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftPlanMany_rank_1
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
      hipfftPlanMany_rank_1 = hipfftPlanMany_(plan,rank,c_loc(n),c_loc(inembed),istride,idist, &
        c_loc(onembed),ostride,odist,myType,batch)
    end function

#endif
#ifdef USE_ASSUMED_RANK
    function hipfftMakePlan1d_assumed_rank(plan,nx,myType,batch,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftMakePlan1d_assumed_rank
      type(c_ptr), value :: plan
      integer(c_int) :: nx
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int) :: batch
      integer(c_size_t),target,contiguous,dimension(..) :: workSize
      !
      hipfftMakePlan1d_assumed_rank = hipfftMakePlan1d_(plan,nx,myType,batch,c_loc(workSize))
    end function

#else
    function hipfftMakePlan1d_rank_0(plan,nx,myType,batch,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftMakePlan1d_rank_0
      type(c_ptr), value :: plan
      integer(c_int) :: nx
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int) :: batch
      integer(c_size_t),target :: workSize
      !
      hipfftMakePlan1d_rank_0 = hipfftMakePlan1d_(plan,nx,myType,batch,c_loc(workSize))
    end function

    function hipfftMakePlan1d_rank_1(plan,nx,myType,batch,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftMakePlan1d_rank_1
      type(c_ptr), value :: plan
      integer(c_int) :: nx
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int) :: batch
      integer(c_size_t),target,dimension(:) :: workSize
      !
      hipfftMakePlan1d_rank_1 = hipfftMakePlan1d_(plan,nx,myType,batch,c_loc(workSize))
    end function

#endif
#ifdef USE_ASSUMED_RANK
    function hipfftMakePlan2d_assumed_rank(plan,nx,ny,myType,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftMakePlan2d_assumed_rank
      type(c_ptr), value :: plan
      integer(c_int) :: nx
      integer(c_int) :: ny
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_size_t),target,contiguous,dimension(..) :: workSize
      !
      hipfftMakePlan2d_assumed_rank = hipfftMakePlan2d_(plan,nx,ny,myType,c_loc(workSize))
    end function

#else
    function hipfftMakePlan2d_rank_0(plan,nx,ny,myType,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftMakePlan2d_rank_0
      type(c_ptr), value :: plan
      integer(c_int) :: nx
      integer(c_int) :: ny
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_size_t),target :: workSize
      !
      hipfftMakePlan2d_rank_0 = hipfftMakePlan2d_(plan,nx,ny,myType,c_loc(workSize))
    end function

    function hipfftMakePlan2d_rank_1(plan,nx,ny,myType,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftMakePlan2d_rank_1
      type(c_ptr), value :: plan
      integer(c_int) :: nx
      integer(c_int) :: ny
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_size_t),target,dimension(:) :: workSize
      !
      hipfftMakePlan2d_rank_1 = hipfftMakePlan2d_(plan,nx,ny,myType,c_loc(workSize))
    end function

#endif
#ifdef USE_ASSUMED_RANK
    function hipfftMakePlan3d_assumed_rank(plan,nx,ny,nz,myType,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftMakePlan3d_assumed_rank
      type(c_ptr), value :: plan
      integer(c_int) :: nx
      integer(c_int) :: ny
      integer(c_int) :: nz
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_size_t),target,contiguous,dimension(..) :: workSize
      !
      hipfftMakePlan3d_assumed_rank = hipfftMakePlan3d_(plan,nx,ny,nz,myType,c_loc(workSize))
    end function

#else
    function hipfftMakePlan3d_rank_0(plan,nx,ny,nz,myType,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftMakePlan3d_rank_0
      type(c_ptr), value :: plan
      integer(c_int) :: nx
      integer(c_int) :: ny
      integer(c_int) :: nz
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_size_t),target :: workSize
      !
      hipfftMakePlan3d_rank_0 = hipfftMakePlan3d_(plan,nx,ny,nz,myType,c_loc(workSize))
    end function

    function hipfftMakePlan3d_rank_1(plan,nx,ny,nz,myType,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftMakePlan3d_rank_1
      type(c_ptr), value :: plan
      integer(c_int) :: nx
      integer(c_int) :: ny
      integer(c_int) :: nz
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_size_t),target,dimension(:) :: workSize
      !
      hipfftMakePlan3d_rank_1 = hipfftMakePlan3d_(plan,nx,ny,nz,myType,c_loc(workSize))
    end function

#endif
#ifdef USE_ASSUMED_RANK
    function hipfftMakePlanMany_assumed_rank(plan,rank,n,inembed,istride,idist,onembed,ostride, &
        odist,myType,batch,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftMakePlanMany_assumed_rank
      type(c_ptr), value :: plan
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
      integer(c_size_t),target,contiguous,dimension(..) :: workSize
      !
      hipfftMakePlanMany_assumed_rank = hipfftMakePlanMany_(plan,rank,c_loc(n),c_loc(inembed), &
        istride,idist,c_loc(onembed),ostride,odist,myType,batch,c_loc(workSize))
    end function

#else
    function hipfftMakePlanMany_rank_0(plan,rank,n,inembed,istride,idist,onembed,ostride,odist, &
        myType,batch,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftMakePlanMany_rank_0
      type(c_ptr), value :: plan
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
      integer(c_size_t),target :: workSize
      !
      hipfftMakePlanMany_rank_0 = hipfftMakePlanMany_(plan,rank,c_loc(n),c_loc(inembed),istride, &
        idist,c_loc(onembed),ostride,odist,myType,batch,c_loc(workSize))
    end function

    function hipfftMakePlanMany_rank_1(plan,rank,n,inembed,istride,idist,onembed,ostride,odist, &
        myType,batch,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftMakePlanMany_rank_1
      type(c_ptr), value :: plan
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
      integer(c_size_t),target,dimension(:) :: workSize
      !
      hipfftMakePlanMany_rank_1 = hipfftMakePlanMany_(plan,rank,c_loc(n),c_loc(inembed),istride, &
        idist,c_loc(onembed),ostride,odist,myType,batch,c_loc(workSize))
    end function

#endif
#ifdef USE_ASSUMED_RANK
    function hipfftMakePlanMany64_assumed_rank(plan,rank,n,inembed,istride,idist,onembed,ostride, &
        odist,myType,batch,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftMakePlanMany64_assumed_rank
      type(c_ptr), value :: plan
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
      integer(c_size_t),target,contiguous,dimension(..) :: workSize
      !
      hipfftMakePlanMany64_assumed_rank = hipfftMakePlanMany64_(plan,rank,c_loc(n),c_loc(inembed), &
        istride,idist,c_loc(onembed),ostride,odist,myType,batch,c_loc(workSize))
    end function

#else
    function hipfftMakePlanMany64_rank_0(plan,rank,n,inembed,istride,idist,onembed,ostride,odist, &
        myType,batch,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftMakePlanMany64_rank_0
      type(c_ptr), value :: plan
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
      integer(c_size_t),target :: workSize
      !
      hipfftMakePlanMany64_rank_0 = hipfftMakePlanMany64_(plan,rank,c_loc(n),c_loc(inembed), &
        istride,idist,c_loc(onembed),ostride,odist,myType,batch,c_loc(workSize))
    end function

    function hipfftMakePlanMany64_rank_1(plan,rank,n,inembed,istride,idist,onembed,ostride,odist, &
        myType,batch,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftMakePlanMany64_rank_1
      type(c_ptr), value :: plan
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
      integer(c_size_t),target,dimension(:) :: workSize
      !
      hipfftMakePlanMany64_rank_1 = hipfftMakePlanMany64_(plan,rank,c_loc(n),c_loc(inembed), &
        istride,idist,c_loc(onembed),ostride,odist,myType,batch,c_loc(workSize))
    end function

#endif
#ifdef USE_ASSUMED_RANK
    function hipfftEstimateMany_assumed_rank(rank,n,inembed,istride,idist,onembed,ostride,odist, &
        myType,batch,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
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
      integer(c_size_t),target :: workSize
      !
      hipfftEstimateMany_assumed_rank = hipfftEstimateMany_(rank,c_loc(n),c_loc(inembed),istride, &
        idist,c_loc(onembed),ostride,odist,myType,batch,c_loc(workSize))
    end function

#else
    function hipfftEstimateMany_rank_0(rank,n,inembed,istride,idist,onembed,ostride,odist,myType, &
        batch,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
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
      integer(c_size_t),target :: workSize
      !
      hipfftEstimateMany_rank_0 = hipfftEstimateMany_(rank,c_loc(n),c_loc(inembed),istride,idist, &
        c_loc(onembed),ostride,odist,myType,batch,c_loc(workSize))
    end function

    function hipfftEstimateMany_rank_1(rank,n,inembed,istride,idist,onembed,ostride,odist,myType, &
        batch,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
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
      integer(c_size_t),target :: workSize
      !
      hipfftEstimateMany_rank_1 = hipfftEstimateMany_(rank,c_loc(n),c_loc(inembed),istride,idist, &
        c_loc(onembed),ostride,odist,myType,batch,c_loc(workSize))
    end function

#endif
#ifdef USE_ASSUMED_RANK
    function hipfftGetSize1d_assumed_rank(plan,nx,myType,batch,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSize1d_assumed_rank
      type(c_ptr), value :: plan
      integer(c_int) :: nx
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int) :: batch
      integer(c_size_t),target,contiguous,dimension(..) :: workSize
      !
      hipfftGetSize1d_assumed_rank = hipfftGetSize1d_(plan,nx,myType,batch,c_loc(workSize))
    end function

#else
    function hipfftGetSize1d_rank_0(plan,nx,myType,batch,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSize1d_rank_0
      type(c_ptr), value :: plan
      integer(c_int) :: nx
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int) :: batch
      integer(c_size_t),target :: workSize
      !
      hipfftGetSize1d_rank_0 = hipfftGetSize1d_(plan,nx,myType,batch,c_loc(workSize))
    end function

    function hipfftGetSize1d_rank_1(plan,nx,myType,batch,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSize1d_rank_1
      type(c_ptr), value :: plan
      integer(c_int) :: nx
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int) :: batch
      integer(c_size_t),target,dimension(:) :: workSize
      !
      hipfftGetSize1d_rank_1 = hipfftGetSize1d_(plan,nx,myType,batch,c_loc(workSize))
    end function

#endif
#ifdef USE_ASSUMED_RANK
    function hipfftGetSize2d_assumed_rank(plan,nx,ny,myType,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSize2d_assumed_rank
      type(c_ptr), value :: plan
      integer(c_int) :: nx
      integer(c_int) :: ny
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_size_t),target,contiguous,dimension(..) :: workSize
      !
      hipfftGetSize2d_assumed_rank = hipfftGetSize2d_(plan,nx,ny,myType,c_loc(workSize))
    end function

#else
    function hipfftGetSize2d_rank_0(plan,nx,ny,myType,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSize2d_rank_0
      type(c_ptr), value :: plan
      integer(c_int) :: nx
      integer(c_int) :: ny
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_size_t),target :: workSize
      !
      hipfftGetSize2d_rank_0 = hipfftGetSize2d_(plan,nx,ny,myType,c_loc(workSize))
    end function

    function hipfftGetSize2d_rank_1(plan,nx,ny,myType,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSize2d_rank_1
      type(c_ptr), value :: plan
      integer(c_int) :: nx
      integer(c_int) :: ny
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_size_t),target,dimension(:) :: workSize
      !
      hipfftGetSize2d_rank_1 = hipfftGetSize2d_(plan,nx,ny,myType,c_loc(workSize))
    end function

#endif
#ifdef USE_ASSUMED_RANK
    function hipfftGetSize3d_assumed_rank(plan,nx,ny,nz,myType,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSize3d_assumed_rank
      type(c_ptr), value :: plan
      integer(c_int) :: nx
      integer(c_int) :: ny
      integer(c_int) :: nz
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_size_t),target,contiguous,dimension(..) :: workSize
      !
      hipfftGetSize3d_assumed_rank = hipfftGetSize3d_(plan,nx,ny,nz,myType,c_loc(workSize))
    end function

#else
    function hipfftGetSize3d_rank_0(plan,nx,ny,nz,myType,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSize3d_rank_0
      type(c_ptr), value :: plan
      integer(c_int) :: nx
      integer(c_int) :: ny
      integer(c_int) :: nz
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_size_t),target :: workSize
      !
      hipfftGetSize3d_rank_0 = hipfftGetSize3d_(plan,nx,ny,nz,myType,c_loc(workSize))
    end function

    function hipfftGetSize3d_rank_1(plan,nx,ny,nz,myType,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSize3d_rank_1
      type(c_ptr), value :: plan
      integer(c_int) :: nx
      integer(c_int) :: ny
      integer(c_int) :: nz
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_size_t),target,dimension(:) :: workSize
      !
      hipfftGetSize3d_rank_1 = hipfftGetSize3d_(plan,nx,ny,nz,myType,c_loc(workSize))
    end function

#endif
#ifdef USE_ASSUMED_RANK
    function hipfftGetSizeMany_assumed_rank(plan,rank,n,inembed,istride,idist,onembed,ostride, &
        odist,myType,batch,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSizeMany_assumed_rank
      type(c_ptr), value :: plan
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
      integer(c_size_t),target,contiguous,dimension(..) :: workSize
      !
      hipfftGetSizeMany_assumed_rank = hipfftGetSizeMany_(plan,rank,c_loc(n),c_loc(inembed), &
        istride,idist,c_loc(onembed),ostride,odist,myType,batch,c_loc(workSize))
    end function

#else
    function hipfftGetSizeMany_rank_0(plan,rank,n,inembed,istride,idist,onembed,ostride,odist, &
        myType,batch,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSizeMany_rank_0
      type(c_ptr), value :: plan
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
      integer(c_size_t),target :: workSize
      !
      hipfftGetSizeMany_rank_0 = hipfftGetSizeMany_(plan,rank,c_loc(n),c_loc(inembed),istride, &
        idist,c_loc(onembed),ostride,odist,myType,batch,c_loc(workSize))
    end function

    function hipfftGetSizeMany_rank_1(plan,rank,n,inembed,istride,idist,onembed,ostride,odist, &
        myType,batch,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSizeMany_rank_1
      type(c_ptr), value :: plan
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
      integer(c_size_t),target,dimension(:) :: workSize
      !
      hipfftGetSizeMany_rank_1 = hipfftGetSizeMany_(plan,rank,c_loc(n),c_loc(inembed),istride, &
        idist,c_loc(onembed),ostride,odist,myType,batch,c_loc(workSize))
    end function

#endif
#ifdef USE_ASSUMED_RANK
    function hipfftGetSizeMany64_assumed_rank(plan,rank,n,inembed,istride,idist,onembed,ostride, &
        odist,myType,batch,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSizeMany64_assumed_rank
      type(c_ptr), value :: plan
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
      integer(c_size_t),target,contiguous,dimension(..) :: workSize
      !
      hipfftGetSizeMany64_assumed_rank = hipfftGetSizeMany64_(plan,rank,c_loc(n),c_loc(inembed), &
        istride,idist,c_loc(onembed),ostride,odist,myType,batch,c_loc(workSize))
    end function

#else
    function hipfftGetSizeMany64_rank_0(plan,rank,n,inembed,istride,idist,onembed,ostride,odist, &
        myType,batch,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSizeMany64_rank_0
      type(c_ptr), value :: plan
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
      integer(c_size_t),target :: workSize
      !
      hipfftGetSizeMany64_rank_0 = hipfftGetSizeMany64_(plan,rank,c_loc(n),c_loc(inembed),istride, &
        idist,c_loc(onembed),ostride,odist,myType,batch,c_loc(workSize))
    end function

    function hipfftGetSizeMany64_rank_1(plan,rank,n,inembed,istride,idist,onembed,ostride,odist, &
        myType,batch,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSizeMany64_rank_1
      type(c_ptr), value :: plan
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
      integer(c_size_t),target,dimension(:) :: workSize
      !
      hipfftGetSizeMany64_rank_1 = hipfftGetSizeMany64_(plan,rank,c_loc(n),c_loc(inembed),istride, &
        idist,c_loc(onembed),ostride,odist,myType,batch,c_loc(workSize))
    end function

#endif
#ifdef USE_ASSUMED_RANK
    function hipfftGetSize_assumed_rank(plan,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSize_assumed_rank
      type(c_ptr), value :: plan
      integer(c_size_t),target,contiguous,dimension(..) :: workSize
      !
      hipfftGetSize_assumed_rank = hipfftGetSize_(plan,c_loc(workSize))
    end function

#else
    function hipfftGetSize_rank_0(plan,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSize_rank_0
      type(c_ptr), value :: plan
      integer(c_size_t),target :: workSize
      !
      hipfftGetSize_rank_0 = hipfftGetSize_(plan,c_loc(workSize))
    end function

    function hipfftGetSize_rank_1(plan,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSize_rank_1
      type(c_ptr), value :: plan
      integer(c_size_t),target,dimension(:) :: workSize
      !
      hipfftGetSize_rank_1 = hipfftGetSize_(plan,c_loc(workSize))
    end function

#endif
#ifdef USE_ASSUMED_RANK
    function hipfftExecC2C_assumed_rank(plan,idata,odata,direction)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecC2C_assumed_rank
      type(c_ptr), value :: plan
      complex(c_float_complex),target,contiguous,dimension(..) :: idata
      complex(c_float_complex),target,contiguous,dimension(..) :: odata
      integer(c_int) :: direction
      !
      hipfftExecC2C_assumed_rank = hipfftExecC2C_(plan,c_loc(idata),c_loc(odata),direction)
    end function

#else
    function hipfftExecC2C_rank_0(plan,idata,odata,direction)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecC2C_rank_0
      type(c_ptr), value :: plan
      complex(c_float_complex),target :: idata
      complex(c_float_complex),target :: odata
      integer(c_int) :: direction
      !
      hipfftExecC2C_rank_0 = hipfftExecC2C_(plan,c_loc(idata),c_loc(odata),direction)
    end function

    function hipfftExecC2C_rank_1(plan,idata,odata,direction)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecC2C_rank_1
      type(c_ptr), value :: plan
      complex(c_float_complex),target,dimension(:) :: idata
      complex(c_float_complex),target,dimension(:) :: odata
      integer(c_int) :: direction
      !
      hipfftExecC2C_rank_1 = hipfftExecC2C_(plan,c_loc(idata),c_loc(odata),direction)
    end function

    function hipfftExecC2C_rank_2(plan,idata,odata,direction)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecC2C_rank_2
      type(c_ptr), value :: plan
      complex(c_float_complex),target,dimension(:,:) :: idata
      complex(c_float_complex),target,dimension(:,:) :: odata
      integer(c_int) :: direction
      !
      hipfftExecC2C_rank_2 = hipfftExecC2C_(plan,c_loc(idata),c_loc(odata),direction)
    end function

    function hipfftExecC2C_rank_3(plan,idata,odata,direction)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecC2C_rank_3
      type(c_ptr), value :: plan
      complex(c_float_complex),target,dimension(:,:,:) :: idata
      complex(c_float_complex),target,dimension(:,:,:) :: odata
      integer(c_int) :: direction
      !
      hipfftExecC2C_rank_3 = hipfftExecC2C_(plan,c_loc(idata),c_loc(odata),direction)
    end function

#endif
#ifdef USE_ASSUMED_RANK
    function hipfftExecR2C_assumed_rank(plan,idata,odata)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecR2C_assumed_rank
      type(c_ptr), value :: plan
      real(c_float),target,contiguous,dimension(..) :: idata
      complex(c_float_complex),target,contiguous,dimension(..) :: odata
      !
      hipfftExecR2C_assumed_rank = hipfftExecR2C_(plan,c_loc(idata),c_loc(odata))
    end function

#else
    function hipfftExecR2C_rank_0(plan,idata,odata)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecR2C_rank_0
      type(c_ptr), value :: plan
      real(c_float),target :: idata
      complex(c_float_complex),target :: odata
      !
      hipfftExecR2C_rank_0 = hipfftExecR2C_(plan,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecR2C_rank_1(plan,idata,odata)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecR2C_rank_1
      type(c_ptr), value :: plan
      real(c_float),target,dimension(:) :: idata
      complex(c_float_complex),target,dimension(:) :: odata
      !
      hipfftExecR2C_rank_1 = hipfftExecR2C_(plan,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecR2C_rank_2(plan,idata,odata)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecR2C_rank_2
      type(c_ptr), value :: plan
      real(c_float),target,dimension(:,:) :: idata
      complex(c_float_complex),target,dimension(:,:) :: odata
      !
      hipfftExecR2C_rank_2 = hipfftExecR2C_(plan,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecR2C_rank_3(plan,idata,odata)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecR2C_rank_3
      type(c_ptr), value :: plan
      real(c_float),target,dimension(:,:,:) :: idata
      complex(c_float_complex),target,dimension(:,:,:) :: odata
      !
      hipfftExecR2C_rank_3 = hipfftExecR2C_(plan,c_loc(idata),c_loc(odata))
    end function

#endif
#ifdef USE_ASSUMED_RANK
    function hipfftExecC2R_assumed_rank(plan,idata,odata)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecC2R_assumed_rank
      type(c_ptr), value :: plan
      complex(c_float_complex),target,contiguous,dimension(..) :: idata
      real(c_float),target,contiguous,dimension(..) :: odata
      !
      hipfftExecC2R_assumed_rank = hipfftExecC2R_(plan,c_loc(idata),c_loc(odata))
    end function

#else
    function hipfftExecC2R_rank_0(plan,idata,odata)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecC2R_rank_0
      type(c_ptr), value :: plan
      complex(c_float_complex),target :: idata
      real(c_float),target :: odata
      !
      hipfftExecC2R_rank_0 = hipfftExecC2R_(plan,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecC2R_rank_1(plan,idata,odata)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecC2R_rank_1
      type(c_ptr), value :: plan
      complex(c_float_complex),target,dimension(:) :: idata
      real(c_float),target,dimension(:) :: odata
      !
      hipfftExecC2R_rank_1 = hipfftExecC2R_(plan,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecC2R_rank_2(plan,idata,odata)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecC2R_rank_2
      type(c_ptr), value :: plan
      complex(c_float_complex),target,dimension(:,:) :: idata
      real(c_float),target,dimension(:,:) :: odata
      !
      hipfftExecC2R_rank_2 = hipfftExecC2R_(plan,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecC2R_rank_3(plan,idata,odata)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecC2R_rank_3
      type(c_ptr), value :: plan
      complex(c_float_complex),target,dimension(:,:,:) :: idata
      real(c_float),target,dimension(:,:,:) :: odata
      !
      hipfftExecC2R_rank_3 = hipfftExecC2R_(plan,c_loc(idata),c_loc(odata))
    end function

#endif
#ifdef USE_ASSUMED_RANK
    function hipfftExecZ2Z_assumed_rank(plan,idata,odata,direction)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecZ2Z_assumed_rank
      type(c_ptr), value :: plan
      complex(c_double_complex),target,contiguous,dimension(..) :: idata
      complex(c_double_complex),target,contiguous,dimension(..) :: odata
      integer(c_int) :: direction
      !
      hipfftExecZ2Z_assumed_rank = hipfftExecZ2Z_(plan,c_loc(idata),c_loc(odata),direction)
    end function

#else
    function hipfftExecZ2Z_rank_0(plan,idata,odata,direction)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecZ2Z_rank_0
      type(c_ptr), value :: plan
      complex(c_double_complex),target :: idata
      complex(c_double_complex),target :: odata
      integer(c_int) :: direction
      !
      hipfftExecZ2Z_rank_0 = hipfftExecZ2Z_(plan,c_loc(idata),c_loc(odata),direction)
    end function

    function hipfftExecZ2Z_rank_1(plan,idata,odata,direction)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecZ2Z_rank_1
      type(c_ptr), value :: plan
      complex(c_double_complex),target,dimension(:) :: idata
      complex(c_double_complex),target,dimension(:) :: odata
      integer(c_int) :: direction
      !
      hipfftExecZ2Z_rank_1 = hipfftExecZ2Z_(plan,c_loc(idata),c_loc(odata),direction)
    end function

    function hipfftExecZ2Z_rank_2(plan,idata,odata,direction)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecZ2Z_rank_2
      type(c_ptr), value :: plan
      complex(c_double_complex),target,dimension(:,:) :: idata
      complex(c_double_complex),target,dimension(:,:) :: odata
      integer(c_int) :: direction
      !
      hipfftExecZ2Z_rank_2 = hipfftExecZ2Z_(plan,c_loc(idata),c_loc(odata),direction)
    end function

    function hipfftExecZ2Z_rank_3(plan,idata,odata,direction)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecZ2Z_rank_3
      type(c_ptr), value :: plan
      complex(c_double_complex),target,dimension(:,:,:) :: idata
      complex(c_double_complex),target,dimension(:,:,:) :: odata
      integer(c_int) :: direction
      !
      hipfftExecZ2Z_rank_3 = hipfftExecZ2Z_(plan,c_loc(idata),c_loc(odata),direction)
    end function

#endif
#ifdef USE_ASSUMED_RANK
    function hipfftExecD2Z_assumed_rank(plan,idata,odata)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecD2Z_assumed_rank
      type(c_ptr), value :: plan
      real(c_double),target,contiguous,dimension(..) :: idata
      complex(c_double_complex),target,contiguous,dimension(..) :: odata
      !
      hipfftExecD2Z_assumed_rank = hipfftExecD2Z_(plan,c_loc(idata),c_loc(odata))
    end function

#else
    function hipfftExecD2Z_rank_0(plan,idata,odata)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecD2Z_rank_0
      type(c_ptr), value :: plan
      real(c_double),target :: idata
      complex(c_double_complex),target :: odata
      !
      hipfftExecD2Z_rank_0 = hipfftExecD2Z_(plan,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecD2Z_rank_1(plan,idata,odata)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecD2Z_rank_1
      type(c_ptr), value :: plan
      real(c_double),target,dimension(:) :: idata
      complex(c_double_complex),target,dimension(:) :: odata
      !
      hipfftExecD2Z_rank_1 = hipfftExecD2Z_(plan,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecD2Z_rank_2(plan,idata,odata)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecD2Z_rank_2
      type(c_ptr), value :: plan
      real(c_double),target,dimension(:,:) :: idata
      complex(c_double_complex),target,dimension(:,:) :: odata
      !
      hipfftExecD2Z_rank_2 = hipfftExecD2Z_(plan,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecD2Z_rank_3(plan,idata,odata)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecD2Z_rank_3
      type(c_ptr), value :: plan
      real(c_double),target,dimension(:,:,:) :: idata
      complex(c_double_complex),target,dimension(:,:,:) :: odata
      !
      hipfftExecD2Z_rank_3 = hipfftExecD2Z_(plan,c_loc(idata),c_loc(odata))
    end function

#endif
#ifdef USE_ASSUMED_RANK
    function hipfftExecZ2D_assumed_rank(plan,idata,odata)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecZ2D_assumed_rank
      type(c_ptr), value :: plan
      complex(c_double_complex),target,contiguous,dimension(..) :: idata
      real(c_double),target,contiguous,dimension(..) :: odata
      !
      hipfftExecZ2D_assumed_rank = hipfftExecZ2D_(plan,c_loc(idata),c_loc(odata))
    end function

#else
    function hipfftExecZ2D_rank_0(plan,idata,odata)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecZ2D_rank_0
      type(c_ptr), value :: plan
      complex(c_double_complex),target :: idata
      real(c_double),target :: odata
      !
      hipfftExecZ2D_rank_0 = hipfftExecZ2D_(plan,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecZ2D_rank_1(plan,idata,odata)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecZ2D_rank_1
      type(c_ptr), value :: plan
      complex(c_double_complex),target,dimension(:) :: idata
      real(c_double),target,dimension(:) :: odata
      !
      hipfftExecZ2D_rank_1 = hipfftExecZ2D_(plan,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecZ2D_rank_2(plan,idata,odata)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecZ2D_rank_2
      type(c_ptr), value :: plan
      complex(c_double_complex),target,dimension(:,:) :: idata
      real(c_double),target,dimension(:,:) :: odata
      !
      hipfftExecZ2D_rank_2 = hipfftExecZ2D_(plan,c_loc(idata),c_loc(odata))
    end function

    function hipfftExecZ2D_rank_3(plan,idata,odata)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecZ2D_rank_3
      type(c_ptr), value :: plan
      complex(c_double_complex),target,dimension(:,:,:) :: idata
      real(c_double),target,dimension(:,:,:) :: odata
      !
      hipfftExecZ2D_rank_3 = hipfftExecZ2D_(plan,c_loc(idata),c_loc(odata))
    end function

#endif
#endif
end module hipfort_hipfft
