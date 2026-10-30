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

    module procedure hipfftMakePlan1d_typed
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

    module procedure hipfftMakePlan2d_typed
  end interface

  !>  @brief Initialize a new two-dimensional FFT plan.
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

    module procedure hipfftMakePlan3d_typed
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

    module procedure hipfftMakePlanMany_typed

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

    module procedure hipfftMakePlanMany64_typed

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

    module procedure hipfftGetSize1d_typed
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

    module procedure hipfftGetSize2d_typed
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

    module procedure hipfftGetSize3d_typed
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

    module procedure hipfftGetSizeMany_typed

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

    module procedure hipfftGetSizeMany64_typed

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

  !>  @brief Return size of the work area size required for a rank-dimensional plan.
  !>
  !>   @param[in] plan - Pointer to the FFT plan.
  !>   @param[out] workSize - Pointer to work area size (returned value).
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

    module procedure hipfftGetSize_typed
  end interface

  !>  @brief Set the plan's auto-allocation flag.  The plan will allocate its own workarea.
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
  !>
  !>   @param[in] plan - Pointer to the FFT plan.
  !>   @param[in] workArea - Pointer to the work area (on device).
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

  !>  @brief Set a callback on a plan
  !>
  !>  @details Set either a load or store callback to run with a plan.
  !>  The type of callback is specified with the 'cbtype' parameter.
  !>  An array ofcallback and callback data pointers must be given -
  !>  one per device executing the plan.
  !>
  !>  @param[in] plan - The FFT plan.
  !>  @param[in] callbacks - Array of callback function pointers.
  !>  @param[in] cbtype - Type of callback being set.
  !>  @param[in] callbackData - Array of callback function data pointers
  interface hipfftXtSetCallback
#ifdef USE_CUDA_NAMES
    function hipfftXtSetCallback_(plan,callbacks,cbtype,callbackData) &
        bind(c, name="cufftXtSetCallback")
#else
    function hipfftXtSetCallback_(plan,callbacks,cbtype,callbackData) &
        bind(c, name="hipfftXtSetCallback")
#endif
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

  !>  @brief Remove a callback from a plan
  !>
  !>  @details Remove a previously-set callback from a plan.
  !>
  !>  @param[in] plan - The FFT plan.
  !>  @param[in] cbtype - Type of callback being removed.
  interface hipfftXtClearCallback
#ifdef USE_CUDA_NAMES
    function hipfftXtClearCallback_(plan,cbtype) bind(c, name="cufftXtClearCallback")
#else
    function hipfftXtClearCallback_(plan,cbtype) bind(c, name="hipfftXtClearCallback")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftXtClearCallback_
      type(c_ptr),value :: plan
      integer(c_int),value :: cbtype
    end function
  end interface

  !>  @brief Set shared memory size for callback.
  !>
  !>  @details Set shared memory required for a callback.  The
  !>  callback of the specified type must have already been set on the
  !>  plan.
  !>
  !>  @param[in] plan - The FFT plan.
  !>  @param[in] cbtype - Type of callback being modified.
  !>  @param[in] sharedSize - Amount of shared memory required, in bytes.
  interface hipfftXtSetCallbackSharedSize
#ifdef USE_CUDA_NAMES
    function hipfftXtSetCallbackSharedSize_(plan,cbtype,sharedSize) &
        bind(c, name="cufftXtSetCallbackSharedSize")
#else
    function hipfftXtSetCallbackSharedSize_(plan,cbtype,sharedSize) &
        bind(c, name="hipfftXtSetCallbackSharedSize")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftXtSetCallbackSharedSize_
      type(c_ptr),value :: plan
      integer(c_int),value :: cbtype
      integer(c_size_t),value :: sharedSize
    end function
  end interface

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
  interface hipfftXtMakePlanMany
#ifdef USE_CUDA_NAMES
    function hipfftXtMakePlanMany_(plan,rank,n,inembed,istride,idist,inputType,onembed,ostride, &
        odist,outputType,batch,workSize,executionType) &
        bind(c, name="cufftXtMakePlanMany")
#else
    function hipfftXtMakePlanMany_(plan,rank,n,inembed,istride,idist,inputType,onembed,ostride, &
        odist,outputType,batch,workSize,executionType) &
        bind(c, name="hipfftXtMakePlanMany")
#endif
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

    module procedure hipfftXtMakePlanMany_typed
  end interface

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
  interface hipfftXtGetSizeMany
#ifdef USE_CUDA_NAMES
    function hipfftXtGetSizeMany_(plan,rank,n,inembed,istride,idist,inputType,onembed,ostride, &
        odist,outputType,batch,workSize,executionType) &
        bind(c, name="cufftXtGetSizeMany")
#else
    function hipfftXtGetSizeMany_(plan,rank,n,inembed,istride,idist,inputType,onembed,ostride, &
        odist,outputType,batch,workSize,executionType) &
        bind(c, name="hipfftXtGetSizeMany")
#endif
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

    module procedure hipfftXtGetSizeMany_typed
  end interface

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
  interface hipfftXtExec
#ifdef USE_CUDA_NAMES
    function hipfftXtExec_(plan,input,output,direction) bind(c, name="cufftXtExec")
#else
    function hipfftXtExec_(plan,input,output,direction) bind(c, name="hipfftXtExec")
#endif
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

  !>  @brief Set multiple GPUs on a plan.
  !>
  !>   Instructs hipFFT to use multiple GPUs for a plan.
  !>
  !>   This function must be called after the plan is allocated using
  !>   `hipfftCreate`, but before the plan is initialized by any of the
  !>   "MakePlan" functions.  Therefore, API functions that combine
  !>   creation and initialization (`hipfftPlan1d`, `hipfftPlan2d`,
  !>   `hipfftPlan3d`, and `hipfftPlanMany`) cannot use multiple GPUs.
  !>
  !>  @param[in, out] plan
  !>  @param[in] count - : length gpus array
  !>  @param[in] gpus - : array of ints specifying deviceIDs
  !>
  !>  @warning Experimental
  interface hipfftXtSetGPUs
#ifdef USE_CUDA_NAMES
    function hipfftXtSetGPUs_(plan,count,gpus) bind(c, name="cufftXtSetGPUs")
#else
    function hipfftXtSetGPUs_(plan,count,gpus) bind(c, name="hipfftXtSetGPUs")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftXtSetGPUs_
      type(c_ptr),value :: plan
      integer(c_int),value :: count
      type(c_ptr),value :: gpus
    end function
  end interface

  !>  @brief Allocate memory on multiple devices.
  !>
  !>   Allocate memory on multiple devices for the specified plan.
  !>   Returns a `hipLibXtDesc` descriptor which includes pointers
  !>   to the allocated memory, devices that memory resides on, and
  !>   sizes allocated.
  !>
  !>   The subformat indicates whether the memory will be used for FFT
  !>   input or output.
  !>
  !>   The memory must be freed by calling `hipfftXtFree`.
  !>
  !>  @param[in] plan - FFT plan to allocate descriptor memory for.
  !>  @param[out] desc - Pointer to descriptors for allocated memory, the devices used, and sizes.
  !>  @param[in] myFormat - Subformat determines whether memory is used for FFT input or output.
  !>
  !>  @warning Experimental
  interface hipfftXtMalloc
#ifdef USE_CUDA_NAMES
    function hipfftXtMalloc_(plan,desc,myFormat) bind(c, name="cufftXtMalloc")
#else
    function hipfftXtMalloc_(plan,desc,myFormat) bind(c, name="hipfftXtMalloc")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(c_int) :: hipfftXtMalloc_
      type(c_ptr),value :: plan
      type(c_ptr) :: desc
      integer(c_int),value :: myFormat
    end function
  end interface

  !>  @brief Copy data to/from `hipLibXtDesc` descriptors.
  !>
  !>   Copy data according to the hipfftXtCopyType
  !>
  !>   - `HIPFFT_COPY_HOST_TO_DEVICE`: dest points to a `hipLibXtDesc` structure that describes
  !>   multi-device memory layout. src points to a host memory buffer.
  !>   - `HIPFFT_COPY_DEVICE_TO_HOST`: src points to a `hipLibXtDesc` structure that describes
  !>   multi-device memory layout. dest points to a host memory buffer.
  !>   - `HIPFFT_COPY_DEVICE_TO_DEVICE`: Both dest and src point to a `hipLibXtDesc` structure that
  !>   describes multi-device memory layout. The two structures must describe memory with the same
  !>   number of devices and memory sizes.
  !>
  !>  @param[in] plan - Plan which has the descriptor.
  !>  @param[out] dest - Buffer that will be populated.
  !>  @param[in] src - Buffer that will be copied from.
  !>  @param[in] myType - Type of copy operation to perform.
  !>
  !>  @warning Experimental
  interface hipfftXtMemcpy
#ifdef USE_CUDA_NAMES
    function hipfftXtMemcpy_(plan,dest,src,myType) bind(c, name="cufftXtMemcpy")
#else
    function hipfftXtMemcpy_(plan,dest,src,myType) bind(c, name="hipfftXtMemcpy")
#endif
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

  !>  @brief Free memory allocated by `hipfftXtMalloc`.
  !>
  !>  @param[in] desc - Descriptor whose memory will be freed.
  !>
  !>  @warning Experimental
  interface hipfftXtFree
#ifdef USE_CUDA_NAMES
    function hipfftXtFree_(desc) bind(c, name="cufftXtFree")
#else
    function hipfftXtFree_(desc) bind(c, name="hipfftXtFree")
#endif
      use iso_c_binding
      use hipfort_hipfft_enums
      use hipfort_hipfft_types
      implicit none
      integer(c_int) :: hipfftXtFree_
      type(hipLibXtDesc) :: desc
    end function
  end interface

  !>  @ingroup hipfftXtExecDescriptor
  !>
  !>  @param[in] plan - The FFT plan.
  !>  @param[in] input - Input data.
  !>  @param[out] output - Output data.
  !>  @param[in] direction - Either `HIPFFT_FORWARD` or `HIPFFT_BACKWARD`.
  !>
  !>  @brief Execute single-precision complex-to-complex transform.
  interface hipfftXtExecDescriptorC2C
#ifdef USE_CUDA_NAMES
    function hipfftXtExecDescriptorC2C_(plan,input,output,direction) &
        bind(c, name="cufftXtExecDescriptorC2C")
#else
    function hipfftXtExecDescriptorC2C_(plan,input,output,direction) &
        bind(c, name="hipfftXtExecDescriptorC2C")
#endif
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

  !>  @ingroup hipfftXtExecDescriptor
  !>
  !>  @param[in] plan - The FFT plan.
  !>  @param[in] input - Input data.
  !>  @param[out] output - Output data.
  !>
  !>  @brief Execute single-precision real forward transform.
  interface hipfftXtExecDescriptorR2C
#ifdef USE_CUDA_NAMES
    function hipfftXtExecDescriptorR2C_(plan,input,output) bind(c, name="cufftXtExecDescriptorR2C")
#else
    function hipfftXtExecDescriptorR2C_(plan,input,output) bind(c, name="hipfftXtExecDescriptorR2C")
#endif
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

  !>  @ingroup hipfftXtExecDescriptor
  !>
  !>  @param[in] plan - The FFT plan.
  !>  @param[in] input - Input data.
  !>  @param[out] output - Output data.
  !>
  !>  @brief Execute single-precision real backward transform.
  interface hipfftXtExecDescriptorC2R
#ifdef USE_CUDA_NAMES
    function hipfftXtExecDescriptorC2R_(plan,input,output) bind(c, name="cufftXtExecDescriptorC2R")
#else
    function hipfftXtExecDescriptorC2R_(plan,input,output) bind(c, name="hipfftXtExecDescriptorC2R")
#endif
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

  !>  @ingroup hipfftXtExecDescriptor
  !>
  !>  @param[in] plan - The FFT plan.
  !>  @param[in] input - Input data.
  !>  @param[out] output - Output data.
  !>  @param[in] direction - Either `HIPFFT_FORWARD` or `HIPFFT_BACKWARD`.
  !>
  !>  @brief Execute double-precision complex-to-complex transform.
  interface hipfftXtExecDescriptorZ2Z
#ifdef USE_CUDA_NAMES
    function hipfftXtExecDescriptorZ2Z_(plan,input,output,direction) &
        bind(c, name="cufftXtExecDescriptorZ2Z")
#else
    function hipfftXtExecDescriptorZ2Z_(plan,input,output,direction) &
        bind(c, name="hipfftXtExecDescriptorZ2Z")
#endif
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

  !>  @ingroup hipfftXtExecDescriptor
  !>
  !>  @param[in] plan - The FFT plan.
  !>  @param[in] input - Input data.
  !>  @param[out] output - Output data.
  !>
  !>  @brief Execute double-precision real forward transform.
  interface hipfftXtExecDescriptorD2Z
#ifdef USE_CUDA_NAMES
    function hipfftXtExecDescriptorD2Z_(plan,input,output) bind(c, name="cufftXtExecDescriptorD2Z")
#else
    function hipfftXtExecDescriptorD2Z_(plan,input,output) bind(c, name="hipfftXtExecDescriptorD2Z")
#endif
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

  !>  @ingroup hipfftXtExecDescriptor
  !>
  !>  @param[in] plan - The FFT plan.
  !>  @param[in] input - Input data.
  !>  @param[out] output - Output data.
  !>
  !>  @brief Execute double-precision real backward transform.
  interface hipfftXtExecDescriptorZ2D
#ifdef USE_CUDA_NAMES
    function hipfftXtExecDescriptorZ2D_(plan,input,output) bind(c, name="cufftXtExecDescriptorZ2D")
#else
    function hipfftXtExecDescriptorZ2D_(plan,input,output) bind(c, name="hipfftXtExecDescriptorZ2D")
#endif
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

  !>  @ingroup hipfftXtExecDescriptor
  !>
  !>  @param[in] plan - The FFT plan.
  !>  @param[in] input - Input data.
  !>  @param[out] output - Output data.
  !>  @param[in] direction - Either `HIPFFT_FORWARD` or `HIPFFT_BACKWARD`.
  !>
  !>  @brief Execute general transform - types of the descriptors must match the plan.
  interface hipfftXtExecDescriptor
#ifdef USE_CUDA_NAMES
    function hipfftXtExecDescriptor_(plan,input,output,direction) &
        bind(c, name="cufftXtExecDescriptor")
#else
    function hipfftXtExecDescriptor_(plan,input,output,direction) &
        bind(c, name="hipfftXtExecDescriptor")
#endif
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

    function hipfftMakePlan1d_typed(plan,nx,myType,batch,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftMakePlan1d_typed
      type(c_ptr), value :: plan
      integer(c_int) :: nx
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int) :: batch
      integer(c_size_t),target :: workSize
      !
      hipfftMakePlan1d_typed = hipfftMakePlan1d_(plan,nx,myType,batch,c_loc(workSize))
    end function

    function hipfftMakePlan2d_typed(plan,nx,ny,myType,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftMakePlan2d_typed
      type(c_ptr), value :: plan
      integer(c_int) :: nx
      integer(c_int) :: ny
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_size_t),target :: workSize
      !
      hipfftMakePlan2d_typed = hipfftMakePlan2d_(plan,nx,ny,myType,c_loc(workSize))
    end function

    function hipfftMakePlan3d_typed(plan,nx,ny,nz,myType,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftMakePlan3d_typed
      type(c_ptr), value :: plan
      integer(c_int) :: nx
      integer(c_int) :: ny
      integer(c_int) :: nz
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_size_t),target :: workSize
      !
      hipfftMakePlan3d_typed = hipfftMakePlan3d_(plan,nx,ny,nz,myType,c_loc(workSize))
    end function

    function hipfftMakePlanMany_typed(plan,rank,n,inembed,istride,idist,onembed,ostride,odist, &
        myType,batch,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftMakePlanMany_typed
      type(c_ptr), value :: plan
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
      hipfftMakePlanMany_typed = hipfftMakePlanMany_(plan,rank,n,inembed,istride,idist,onembed, &
        ostride,odist,myType,batch,c_loc(workSize))
    end function

    function hipfftMakePlanMany64_typed(plan,rank,n,inembed,istride,idist,onembed,ostride,odist, &
        myType,batch,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftMakePlanMany64_typed
      type(c_ptr), value :: plan
      integer(c_int) :: rank
      type(c_ptr) :: n
      type(c_ptr) :: inembed
      integer(c_int64_t) :: istride
      integer(c_int64_t) :: idist
      type(c_ptr) :: onembed
      integer(c_int64_t) :: ostride
      integer(c_int64_t) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int64_t) :: batch
      integer(c_size_t),target :: workSize
      !
      hipfftMakePlanMany64_typed = hipfftMakePlanMany64_(plan,rank,n,inembed,istride,idist, &
        onembed,ostride,odist,myType,batch,c_loc(workSize))
    end function

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

    function hipfftGetSize1d_typed(plan,nx,myType,batch,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSize1d_typed
      type(c_ptr), value :: plan
      integer(c_int) :: nx
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int) :: batch
      integer(c_size_t),target :: workSize
      !
      hipfftGetSize1d_typed = hipfftGetSize1d_(plan,nx,myType,batch,c_loc(workSize))
    end function

    function hipfftGetSize2d_typed(plan,nx,ny,myType,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSize2d_typed
      type(c_ptr), value :: plan
      integer(c_int) :: nx
      integer(c_int) :: ny
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_size_t),target :: workSize
      !
      hipfftGetSize2d_typed = hipfftGetSize2d_(plan,nx,ny,myType,c_loc(workSize))
    end function

    function hipfftGetSize3d_typed(plan,nx,ny,nz,myType,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSize3d_typed
      type(c_ptr), value :: plan
      integer(c_int) :: nx
      integer(c_int) :: ny
      integer(c_int) :: nz
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_size_t),target :: workSize
      !
      hipfftGetSize3d_typed = hipfftGetSize3d_(plan,nx,ny,nz,myType,c_loc(workSize))
    end function

    function hipfftGetSizeMany_typed(plan,rank,n,inembed,istride,idist,onembed,ostride,odist, &
        myType,batch,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSizeMany_typed
      type(c_ptr), value :: plan
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
      hipfftGetSizeMany_typed = hipfftGetSizeMany_(plan,rank,n,inembed,istride,idist,onembed, &
        ostride,odist,myType,batch,c_loc(workSize))
    end function

    function hipfftGetSizeMany64_typed(plan,rank,n,inembed,istride,idist,onembed,ostride,odist, &
        myType,batch,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSizeMany64_typed
      type(c_ptr), value :: plan
      integer(c_int) :: rank
      type(c_ptr) :: n
      type(c_ptr) :: inembed
      integer(c_int64_t) :: istride
      integer(c_int64_t) :: idist
      type(c_ptr) :: onembed
      integer(c_int64_t) :: ostride
      integer(c_int64_t) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int64_t) :: batch
      integer(c_size_t),target :: workSize
      !
      hipfftGetSizeMany64_typed = hipfftGetSizeMany64_(plan,rank,n,inembed,istride,idist,onembed, &
        ostride,odist,myType,batch,c_loc(workSize))
    end function

    function hipfftGetSize_typed(plan,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSize_typed
      type(c_ptr), value :: plan
      integer(c_size_t),target :: workSize
      !
      hipfftGetSize_typed = hipfftGetSize_(plan,c_loc(workSize))
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

    function hipfftXtMakePlanMany_typed(plan,rank,n,inembed,istride,idist,inputType,onembed, &
        ostride,odist,outputType,batch,workSize,executionType)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftXtMakePlanMany_typed
      type(c_ptr), value :: plan
      integer(c_int) :: rank
      type(c_ptr) :: n
      type(c_ptr) :: inembed
      integer(c_int64_t) :: istride
      integer(c_int64_t) :: idist
      integer(c_int) :: inputType
      type(c_ptr) :: onembed
      integer(c_int64_t) :: ostride
      integer(c_int64_t) :: odist
      integer(c_int) :: outputType
      integer(c_int64_t) :: batch
      integer(c_size_t),target :: workSize
      integer(c_int) :: executionType
      !
      hipfftXtMakePlanMany_typed = hipfftXtMakePlanMany_(plan,rank,n,inembed,istride,idist, &
        inputType,onembed,ostride,odist,outputType,batch,c_loc(workSize),executionType)
    end function

    function hipfftXtGetSizeMany_typed(plan,rank,n,inembed,istride,idist,inputType,onembed, &
        ostride,odist,outputType,batch,workSize,executionType)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftXtGetSizeMany_typed
      type(c_ptr), value :: plan
      integer(c_int) :: rank
      type(c_ptr) :: n
      type(c_ptr) :: inembed
      integer(c_int64_t) :: istride
      integer(c_int64_t) :: idist
      integer(c_int) :: inputType
      type(c_ptr) :: onembed
      integer(c_int64_t) :: ostride
      integer(c_int64_t) :: odist
      integer(c_int) :: outputType
      integer(c_int64_t) :: batch
      integer(c_size_t),target :: workSize
      integer(c_int) :: executionType
      !
      hipfftXtGetSizeMany_typed = hipfftXtGetSizeMany_(plan,rank,n,inembed,istride,idist, &
        inputType,onembed,ostride,odist,outputType,batch,c_loc(workSize),executionType)
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
      integer(c_int),target,dimension(..) :: n
      integer(c_int),target,dimension(..) :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      integer(c_int),target,dimension(..) :: onembed
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
    function hipfftMakePlanMany_assumed_rank(plan,rank,n,inembed,istride,idist,onembed,ostride, &
        odist,myType,batch,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftMakePlanMany_assumed_rank
      type(c_ptr), value :: plan
      integer(c_int) :: rank
      integer(c_int),target,dimension(..) :: n
      integer(c_int),target,dimension(..) :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      integer(c_int),target,dimension(..) :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int) :: batch
      integer(c_size_t),target :: workSize
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
      integer(c_size_t),target :: workSize
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
      integer(c_int64_t),target,dimension(..) :: n
      integer(c_int64_t),target,dimension(..) :: inembed
      integer(c_int64_t) :: istride
      integer(c_int64_t) :: idist
      integer(c_int64_t),target,dimension(..) :: onembed
      integer(c_int64_t) :: ostride
      integer(c_int64_t) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int64_t) :: batch
      integer(c_size_t),target :: workSize
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
      integer(c_size_t),target :: workSize
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
      integer(c_int),target,dimension(..) :: n
      integer(c_int),target,dimension(..) :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      integer(c_int),target,dimension(..) :: onembed
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
    function hipfftGetSizeMany_assumed_rank(plan,rank,n,inembed,istride,idist,onembed,ostride, &
        odist,myType,batch,workSize)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftGetSizeMany_assumed_rank
      type(c_ptr), value :: plan
      integer(c_int) :: rank
      integer(c_int),target,dimension(..) :: n
      integer(c_int),target,dimension(..) :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      integer(c_int),target,dimension(..) :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int) :: batch
      integer(c_size_t),target :: workSize
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
      integer(c_size_t),target :: workSize
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
      integer(c_int64_t),target,dimension(..) :: n
      integer(c_int64_t),target,dimension(..) :: inembed
      integer(c_int64_t) :: istride
      integer(c_int64_t) :: idist
      integer(c_int64_t),target,dimension(..) :: onembed
      integer(c_int64_t) :: ostride
      integer(c_int64_t) :: odist
      integer(kind(HIPFFT_R2C)) :: myType
      integer(c_int64_t) :: batch
      integer(c_size_t),target :: workSize
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
      integer(c_size_t),target :: workSize
      !
      hipfftGetSizeMany64_rank_1 = hipfftGetSizeMany64_(plan,rank,c_loc(n),c_loc(inembed),istride, &
        idist,c_loc(onembed),ostride,odist,myType,batch,c_loc(workSize))
    end function

#endif
#ifdef USE_ASSUMED_RANK
    function hipfftExecC2C_assumed_rank(plan,idata,odata,direction)
      use iso_c_binding
      use hipfort_hipfft_enums
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftExecC2C_assumed_rank
      type(c_ptr), value :: plan
      complex(c_float_complex),target,dimension(..) :: idata
      complex(c_float_complex),target,dimension(..) :: odata
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
      real(c_float),target,dimension(..) :: idata
      complex(c_float_complex),target,dimension(..) :: odata
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
      complex(c_float_complex),target,dimension(..) :: idata
      real(c_float),target,dimension(..) :: odata
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
      complex(c_double_complex),target,dimension(..) :: idata
      complex(c_double_complex),target,dimension(..) :: odata
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
      real(c_double),target,dimension(..) :: idata
      complex(c_double_complex),target,dimension(..) :: odata
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
      complex(c_double_complex),target,dimension(..) :: idata
      real(c_double),target,dimension(..) :: odata
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
