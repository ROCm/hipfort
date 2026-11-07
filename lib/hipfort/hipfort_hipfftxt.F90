!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
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

module hipfort_hipfftxt
  use hipfort_hipfft
  use hipfort_hipfftxt_enums
  use hipfort_hipfftxt_types
  implicit none

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
      import
      implicit none
      integer(c_int) :: hipfftXtSetWorkArea_
      type(c_ptr),value :: plan
      type(c_ptr) :: workArea
    end function
  end interface

  interface hipfftXtSetCallback
#ifdef USE_CUDA_NAMES
    function hipfftXtSetCallback_(plan,callbacks,cbtype,callbackData) &
        bind(c, name="cufftXtSetCallback")
#else
    function hipfftXtSetCallback_(plan,callbacks,cbtype,callbackData) &
        bind(c, name="hipfftXtSetCallback")
#endif
      import
      implicit none
      integer(c_int) :: hipfftXtSetCallback_
      type(c_ptr),value :: plan
      type(c_ptr) :: callbacks
      integer(c_int),value :: cbtype
      type(c_ptr) :: callbackData
    end function
  end interface

  interface hipfftXtClearCallback
#ifdef USE_CUDA_NAMES
    function hipfftXtClearCallback_(plan,cbtype) bind(c, name="cufftXtClearCallback")
#else
    function hipfftXtClearCallback_(plan,cbtype) bind(c, name="hipfftXtClearCallback")
#endif
      import
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
      import
      implicit none
      integer(c_int) :: hipfftXtSetCallbackSharedSize_
      type(c_ptr),value :: plan
      integer(c_int),value :: cbtype
      integer(c_size_t),value :: sharedSize
    end function
  end interface

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
  interface hipfftXtSetJITCallback
#ifdef USE_CUDA_NAMES
    function hipfftXtSetJITCallback_(plan,symbol_name,bitcode_data,bitcode_len_bytes,cbtype, &
        cbdata) &
        bind(c, name="cufftXtSetJITCallback")
#else
    function hipfftXtSetJITCallback_(plan,symbol_name,bitcode_data,bitcode_len_bytes,cbtype, &
        cbdata) &
        bind(c, name="hipfftXtSetJITCallback")
#endif
      import
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
      import
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

#ifdef USE_ASSUMED_RANK
    module procedure hipfftXtMakePlanMany_assumed_rank
#else
#ifdef USE_ASSUMED_SHAPE
    module procedure &
      hipfftXtMakePlanMany_rank_0,&
      hipfftXtMakePlanMany_rank_1
#endif
#endif
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
      import
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

#ifdef USE_ASSUMED_RANK
    module procedure hipfftXtGetSizeMany_assumed_rank
#else
#ifdef USE_ASSUMED_SHAPE
    module procedure &
      hipfftXtGetSizeMany_rank_0,&
      hipfftXtGetSizeMany_rank_1
#endif
#endif
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
      import
      implicit none
      integer(c_int) :: hipfftXtExec_
      type(c_ptr),value :: plan
      type(c_ptr),value :: input
      type(c_ptr),value :: output
      integer(c_int),value :: direction
    end function
  end interface

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
  interface hipfftXtSetGPUs
#ifdef USE_CUDA_NAMES
    function hipfftXtSetGPUs_(plan,count,gpus) bind(c, name="cufftXtSetGPUs")
#else
    function hipfftXtSetGPUs_(plan,count,gpus) bind(c, name="hipfftXtSetGPUs")
#endif
      import
      implicit none
      integer(c_int) :: hipfftXtSetGPUs_
      type(c_ptr),value :: plan
      integer(c_int),value :: count
      type(c_ptr),value :: gpus
    end function

#ifdef USE_ASSUMED_RANK
    module procedure hipfftXtSetGPUs_assumed_rank
#else
#ifdef USE_ASSUMED_SHAPE
    module procedure &
      hipfftXtSetGPUs_rank_0,&
      hipfftXtSetGPUs_rank_1
#endif
#endif
  end interface

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
  interface hipfftXtMalloc
#ifdef USE_CUDA_NAMES
    function hipfftXtMalloc_(plan,desc,myFormat) bind(c, name="cufftXtMalloc")
#else
    function hipfftXtMalloc_(plan,desc,myFormat) bind(c, name="hipfftXtMalloc")
#endif
      import
      implicit none
      integer(c_int) :: hipfftXtMalloc_
      type(c_ptr),value :: plan
      type(c_ptr) :: desc
      integer(c_int),value :: myFormat
    end function
  end interface

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
  interface hipfftXtMemcpy
#ifdef USE_CUDA_NAMES
    function hipfftXtMemcpy_(plan,dest,src,myType) bind(c, name="cufftXtMemcpy")
#else
    function hipfftXtMemcpy_(plan,dest,src,myType) bind(c, name="hipfftXtMemcpy")
#endif
      import
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
      import
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
      import
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
      import
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
      import
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
      import
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
      import
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
      import
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
      import
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
      import
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
      import
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
      import
      implicit none
      integer(c_int) :: hipfftXtSetSubformatDefault_
      type(c_ptr),value :: plan
      integer(c_int),value :: subformat_forward
      integer(c_int),value :: subformat_inverse
    end function
  end interface
#endif


  contains

    function hipfftXtMakePlanMany_typed(plan,rank,n,inembed,istride,idist,inputType,onembed, &
        ostride,odist,outputType,batch,workSize,executionType)
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
    function hipfftXtMakePlanMany_assumed_rank(plan,rank,n,inembed,istride,idist,inputType, &
        onembed,ostride,odist,outputType,batch,workSize,executionType)
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftXtMakePlanMany_assumed_rank
      type(c_ptr), value :: plan
      integer(c_int) :: rank
      integer(c_int64_t),target,dimension(..) :: n
      integer(c_int64_t),target,dimension(..) :: inembed
      integer(c_int64_t) :: istride
      integer(c_int64_t) :: idist
      integer(c_int) :: inputType
      integer(c_int64_t),target,dimension(..) :: onembed
      integer(c_int64_t) :: ostride
      integer(c_int64_t) :: odist
      integer(c_int) :: outputType
      integer(c_int64_t) :: batch
      integer(c_size_t),target :: workSize
      integer(c_int) :: executionType
      !
      hipfftXtMakePlanMany_assumed_rank = hipfftXtMakePlanMany_(plan,rank,c_loc(n),c_loc(inembed), &
        istride,idist,inputType,c_loc(onembed),ostride,odist,outputType,batch,c_loc(workSize), &
        executionType)
    end function

#else
    function hipfftXtMakePlanMany_rank_0(plan,rank,n,inembed,istride,idist,inputType,onembed, &
        ostride,odist,outputType,batch,workSize,executionType)
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftXtMakePlanMany_rank_0
      type(c_ptr), value :: plan
      integer(c_int) :: rank
      integer(c_int64_t),target :: n
      integer(c_int64_t),target :: inembed
      integer(c_int64_t) :: istride
      integer(c_int64_t) :: idist
      integer(c_int) :: inputType
      integer(c_int64_t),target :: onembed
      integer(c_int64_t) :: ostride
      integer(c_int64_t) :: odist
      integer(c_int) :: outputType
      integer(c_int64_t) :: batch
      integer(c_size_t),target :: workSize
      integer(c_int) :: executionType
      !
      hipfftXtMakePlanMany_rank_0 = hipfftXtMakePlanMany_(plan,rank,c_loc(n),c_loc(inembed), &
        istride,idist,inputType,c_loc(onembed),ostride,odist,outputType,batch,c_loc(workSize), &
        executionType)
    end function

    function hipfftXtMakePlanMany_rank_1(plan,rank,n,inembed,istride,idist,inputType,onembed, &
        ostride,odist,outputType,batch,workSize,executionType)
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftXtMakePlanMany_rank_1
      type(c_ptr), value :: plan
      integer(c_int) :: rank
      integer(c_int64_t),target,dimension(:) :: n
      integer(c_int64_t),target,dimension(:) :: inembed
      integer(c_int64_t) :: istride
      integer(c_int64_t) :: idist
      integer(c_int) :: inputType
      integer(c_int64_t),target,dimension(:) :: onembed
      integer(c_int64_t) :: ostride
      integer(c_int64_t) :: odist
      integer(c_int) :: outputType
      integer(c_int64_t) :: batch
      integer(c_size_t),target :: workSize
      integer(c_int) :: executionType
      !
      hipfftXtMakePlanMany_rank_1 = hipfftXtMakePlanMany_(plan,rank,c_loc(n),c_loc(inembed), &
        istride,idist,inputType,c_loc(onembed),ostride,odist,outputType,batch,c_loc(workSize), &
        executionType)
    end function

#endif
#ifdef USE_ASSUMED_RANK
    function hipfftXtGetSizeMany_assumed_rank(plan,rank,n,inembed,istride,idist,inputType,onembed, &
        ostride,odist,outputType,batch,workSize,executionType)
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftXtGetSizeMany_assumed_rank
      type(c_ptr), value :: plan
      integer(c_int) :: rank
      integer(c_int64_t),target,dimension(..) :: n
      integer(c_int64_t),target,dimension(..) :: inembed
      integer(c_int64_t) :: istride
      integer(c_int64_t) :: idist
      integer(c_int) :: inputType
      integer(c_int64_t),target,dimension(..) :: onembed
      integer(c_int64_t) :: ostride
      integer(c_int64_t) :: odist
      integer(c_int) :: outputType
      integer(c_int64_t) :: batch
      integer(c_size_t),target :: workSize
      integer(c_int) :: executionType
      !
      hipfftXtGetSizeMany_assumed_rank = hipfftXtGetSizeMany_(plan,rank,c_loc(n),c_loc(inembed), &
        istride,idist,inputType,c_loc(onembed),ostride,odist,outputType,batch,c_loc(workSize), &
        executionType)
    end function

#else
    function hipfftXtGetSizeMany_rank_0(plan,rank,n,inembed,istride,idist,inputType,onembed, &
        ostride,odist,outputType,batch,workSize,executionType)
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftXtGetSizeMany_rank_0
      type(c_ptr), value :: plan
      integer(c_int) :: rank
      integer(c_int64_t),target :: n
      integer(c_int64_t),target :: inembed
      integer(c_int64_t) :: istride
      integer(c_int64_t) :: idist
      integer(c_int) :: inputType
      integer(c_int64_t),target :: onembed
      integer(c_int64_t) :: ostride
      integer(c_int64_t) :: odist
      integer(c_int) :: outputType
      integer(c_int64_t) :: batch
      integer(c_size_t),target :: workSize
      integer(c_int) :: executionType
      !
      hipfftXtGetSizeMany_rank_0 = hipfftXtGetSizeMany_(plan,rank,c_loc(n),c_loc(inembed),istride, &
        idist,inputType,c_loc(onembed),ostride,odist,outputType,batch,c_loc(workSize),executionType)
    end function

    function hipfftXtGetSizeMany_rank_1(plan,rank,n,inembed,istride,idist,inputType,onembed, &
        ostride,odist,outputType,batch,workSize,executionType)
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftXtGetSizeMany_rank_1
      type(c_ptr), value :: plan
      integer(c_int) :: rank
      integer(c_int64_t),target,dimension(:) :: n
      integer(c_int64_t),target,dimension(:) :: inembed
      integer(c_int64_t) :: istride
      integer(c_int64_t) :: idist
      integer(c_int) :: inputType
      integer(c_int64_t),target,dimension(:) :: onembed
      integer(c_int64_t) :: ostride
      integer(c_int64_t) :: odist
      integer(c_int) :: outputType
      integer(c_int64_t) :: batch
      integer(c_size_t),target :: workSize
      integer(c_int) :: executionType
      !
      hipfftXtGetSizeMany_rank_1 = hipfftXtGetSizeMany_(plan,rank,c_loc(n),c_loc(inembed),istride, &
        idist,inputType,c_loc(onembed),ostride,odist,outputType,batch,c_loc(workSize),executionType)
    end function

#endif
#ifdef USE_ASSUMED_RANK
    function hipfftXtSetGPUs_assumed_rank(plan,count,gpus)
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftXtSetGPUs_assumed_rank
      type(c_ptr), value :: plan
      integer(c_int) :: count
      integer(c_int),target,dimension(..) :: gpus
      !
      hipfftXtSetGPUs_assumed_rank = hipfftXtSetGPUs_(plan,count,c_loc(gpus))
    end function

#else
    function hipfftXtSetGPUs_rank_0(plan,count,gpus)
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftXtSetGPUs_rank_0
      type(c_ptr), value :: plan
      integer(c_int) :: count
      integer(c_int),target :: gpus
      !
      hipfftXtSetGPUs_rank_0 = hipfftXtSetGPUs_(plan,count,c_loc(gpus))
    end function

    function hipfftXtSetGPUs_rank_1(plan,count,gpus)
      implicit none
      integer(kind(HIPFFT_SUCCESS)) :: hipfftXtSetGPUs_rank_1
      type(c_ptr), value :: plan
      integer(c_int) :: count
      integer(c_int),target,dimension(:) :: gpus
      !
      hipfftXtSetGPUs_rank_1 = hipfftXtSetGPUs_(plan,count,c_loc(gpus))
    end function

#endif
#endif
end module hipfort_hipfftxt
