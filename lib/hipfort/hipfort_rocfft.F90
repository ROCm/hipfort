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

module hipfort_rocfft
  use hipfort_rocfft_enums
  use hipfort_handles
  use, intrinsic :: iso_c_binding
  implicit none

  interface

    !---------------------------------------------
    ! rocfft_setup
    !---------------------------------------------
    !> @brief Library setup function, called once in program before start of
    !> library use
    function rocfft_setup() &
       result(setup) &
       bind(C, name="rocfft_setup")
       import :: c_int
       integer(c_int) :: setup
    end function rocfft_setup

    !---------------------------------------------
    ! rocfft_cleanup
    !---------------------------------------------
    !> @brief Library cleanup function, called once in program after end of library
    !> use
    function rocfft_cleanup() &
       result(cleanup) &
       bind(C, name="rocfft_cleanup")
       import :: c_int
       integer(c_int) :: cleanup
    end function rocfft_cleanup

    !---------------------------------------------
    ! rocfft_cache_serialize
    !---------------------------------------------
    !> @brief Serialize compiled kernel cache
    !>
    !> @details Serialize rocFFT's cache of compiled kernels into a
    !> buffer.  This buffer is allocated by rocFFT and must be freed
    !> with a call to `rocfft_cache_buffer_free`.  The length of the
    !> buffer in bytes is written to 'buffer_len_bytes'.
    function rocfft_cache_serialize(buffer, buffer_len_bytes) &
       result(cache_serialize) &
       bind(C, name="rocfft_cache_serialize")
       import :: c_ptr, c_int
       type(c_ptr) :: buffer
       type(c_ptr), value :: buffer_len_bytes
       integer(c_int) :: cache_serialize
    end function rocfft_cache_serialize

    !---------------------------------------------
    ! rocfft_cache_buffer_free
    !---------------------------------------------
    !> @brief Free cache serialization buffer
    !>
    !> @details Deallocate a buffer allocated by `rocfft_cache_serialize`.
    function rocfft_cache_buffer_free(buffer) &
       result(cache_buffer_free) &
       bind(C, name="rocfft_cache_buffer_free")
       import :: c_ptr, c_int
       type(c_ptr), value :: buffer
       integer(c_int) :: cache_buffer_free
    end function rocfft_cache_buffer_free

    !---------------------------------------------
    ! rocfft_cache_deserialize
    !---------------------------------------------
    !> @brief Deserialize a buffer into the compiled kernel cache.
    !>
    !> @details Kernels in the buffer that match already-cached kernels
    !> will replace those kernels that are in the cache.  Already-cached
    !> kernels that do not match those in the buffer are unmodified by
    !> this operation.  The cache is unmodified if either a null buffer
    !> pointer or a zero length is passed.
    function rocfft_cache_deserialize(buffer, buffer_len_bytes) &
       result(cache_deserialize) &
       bind(C, name="rocfft_cache_deserialize")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: buffer
       integer(c_long), value :: buffer_len_bytes
       integer(c_int) :: cache_deserialize
    end function rocfft_cache_deserialize

  end interface

  interface rocfft_plan_create
    !---------------------------------------------
    ! rocfft_plan_create
    !---------------------------------------------
    !> @brief Create an FFT plan
    !>
    !> @details This API creates a plan, which the user can execute
    !> subsequently.  This function takes many of the fundamental
    !> parameters needed to specify a transform.
    !>
    !> The dimensions parameter can take a value of 1, 2, or 3. The
    !> 'lengths' array specifies the size of data in each dimension. Note
    !> that lengths[0] is the size of the innermost dimension, lengths[1]
    !> is the next higher dimension and so on (column-major ordering).
    !>
    !> The 'number_of_transforms' parameter specifies how many
    !> transforms (of the same kind) needs to be computed. By specifying
    !> a value greater than 1, a batch of transforms can be computed
    !> with a single API call.
    !>
    !> Additionally, a handle to a plan description can be passed for
    !> more detailed transforms. For simple transforms, this parameter
    !> can be set to NULL.
    !>
    !> The plan must be destroyed with a call to `rocfft_plan_destroy`.
    !>
    !> @param[out] plan plan handle
    !> @param[in] placement placement of result
    !> @param[in] transform_type type of transform
    !> @param[in] precision precision
    !> @param[in] dimensions dimensions
    !> @param[in] lengths dimensions-sized array of transform lengths
    !> @param[in] number_of_transforms number of transforms
    !> @param[in] description description handle created by
    !> rocfft_plan_description_create; can be
    !> NULL for simple transforms
    function rocfft_plan_create_raw(plan, placement, transform_type, precision, dimensions, &
                                    lengths, number_of_transforms, description) &
       result(plan_create_raw) &
       bind(C, name="rocfft_plan_create")
       import :: c_ptr, c_int, c_long
       type(c_ptr) :: plan
       integer(c_int), value :: placement
       integer(c_int), value :: transform_type
       integer(c_int), value :: precision
       integer(c_long), value :: dimensions
       type(c_ptr), value :: lengths
       integer(c_long), value :: number_of_transforms
       type(c_ptr), value :: description
       integer(c_int) :: plan_create_raw
    end function rocfft_plan_create_raw

    module procedure rocfft_plan_create_typed
  end interface rocfft_plan_create

  interface rocfft_execute
    !---------------------------------------------
    ! rocfft_execute
    !---------------------------------------------
    !> @brief Execute an FFT plan
    !>
    !> @details This API executes an FFT plan on buffers given by the user.
    !>
    !> If the transform is in-place, only the input buffer is needed and
    !> the output buffer parameter can be set to NULL. For not in-place
    !> transforms, output buffers have to be specified.
    !>
    !> Input and output buffers are arrays of pointers.  Interleaved
    !> array formats are the default, and require just one pointer per
    !> input or output buffer.  Planar array formats require two
    !> pointers per input or output buffer - real and imaginary
    !> pointers, in that order.
    !>
    !> If fields have been set for transform input or output, these
    !> arrays have one pointer per brick in the input or output field,
    !> provided in the order that the bricks were added to the field.
    !>
    !> Note that input buffers may still be overwritten during execution
    !> of a transform, even if the transform is not in-place.
    !>
    !> The final parameter in this function is a rocfft_execution_info
    !> handle. This optional parameter serves as a way for the user to control
    !> execution streams and work buffers.
    !>
    !> @param[in] plan plan handle
    !> @param[in,out] in_buffer array (of size 1 for interleaved data, of size 2
    !> for planar data, or one per brick if an input field is set) of input buffers
    !> @param[in,out] out_buffer array (of size 1 for interleaved data, of size 2
    !> for planar data, or one per brick if an output field is set) of output buffers,
    !> ignored for in-place transforms
    !> @param[in] info execution info handle created by
    !> rocfft_execution_info_create
    function rocfft_execute_raw(plan, in_buffer, out_buffer, info) &
       result(execute_raw) &
       bind(C, name="rocfft_execute")
       import :: c_ptr, c_int
       type(c_ptr), value :: plan
       type(c_ptr), value :: in_buffer
       type(c_ptr), value :: out_buffer
       type(c_ptr), value :: info
       integer(c_int) :: execute_raw
    end function rocfft_execute_raw

    module procedure rocfft_execute_typed
  end interface rocfft_execute

  interface rocfft_plan_destroy
    !---------------------------------------------
    ! rocfft_plan_destroy
    !---------------------------------------------
    !> @brief Destroy an FFT plan
    !> @details This API frees the plan after it is no longer needed.
    !> @param[in] plan plan handle
    function rocfft_plan_destroy_raw(plan) &
       result(plan_destroy_raw) &
       bind(C, name="rocfft_plan_destroy")
       import :: c_ptr, c_int
       type(c_ptr), value :: plan
       integer(c_int) :: plan_destroy_raw
    end function rocfft_plan_destroy_raw

    module procedure rocfft_plan_destroy_typed
  end interface rocfft_plan_destroy

  interface rocfft_plan_description_set_scale_factor
    !---------------------------------------------
    ! rocfft_plan_description_set_scale_factor
    !---------------------------------------------
    !> @brief Set scaling factor.
    !> @details rocFFT multiplies each element of the result by the given factor at the end of the
    !> transform.
    !>
    !> The supplied factor must be a finite number.  That is, it must neither be infinity nor NaN.
    !>
    !> @param[in] description description handle
    !> @param[in] scale_factor scaling factor
    function rocfft_plan_description_set_scale_factor_raw(description, scale_factor) &
       result(plan_description_set_scale_factor_raw) &
       bind(C, name="rocfft_plan_description_set_scale_factor")
       import :: c_ptr, c_double, c_int
       type(c_ptr), value :: description
       real(c_double), value :: scale_factor
       integer(c_int) :: plan_description_set_scale_factor_raw
    end function rocfft_plan_description_set_scale_factor_raw

    module procedure rocfft_plan_description_set_scale_factor_typed
  end interface rocfft_plan_description_set_scale_factor

  interface rocfft_plan_description_set_data_layout
    !---------------------------------------------
    ! rocfft_plan_description_set_data_layout
    !---------------------------------------------
    !> @brief Set advanced data layout parameters on a plan description
    !>
    !> @details This API specifies advanced layout of input/output
    !> buffers for a plan description.
    !>
    !> The following parameters are supported for inputs and outputs:
    !>
    !> * Array type (real, hermitian, or complex data, in either
    !> interleaved or planar format).
    !> * Real forward transforms require real input and hermitian output.
    !> * Real inverse transforms require hermitian input and real output.
    !> * Complex transforms require complex input and output.
    !> * Hermitian and complex data defaults to interleaved if a specific
    !> format is not specified.
    !> * Offset of first data element in the data buffer.  Defaults to 0 if unspecified.
    !> * Stride between consecutive elements in each dimension. Defaults to packed data
    !> layout consistent with the type of transform and its placement (requested at
    !> plan creation), if unspecified.
    !> * Distance between consecutive batches. Zero values are interpreted as defaults
    !> to be deduced from the corresponding length and stride along the last transform
    !> dimension.
    !>
    !> Not all combinations of array types are supported and error codes
    !> will be returned for unsupported cases.
    !>
    !> Offset, stride, and distance for either input or output provided
    !> here is ignored if a field is set for the corresponding input or
    !> output.
    !> @note Non-zero offsets are not supported yet.
    !>
    !> @param[in, out] description description handle
    !> @param[in] in_array_type array type of input buffer
    !> @param[in] out_array_type array type of output buffer
    !> @param[in] in_offsets offsets, in element units, to start of data in input buffer
    !> @param[in] out_offsets offsets, in element units, to start of data in output buffer
    !> @param[in] in_strides_size size of in_strides array (must be equal to transform dimensions)
    !> @param[in] in_strides array of strides, in each dimension, of
    !> input buffer; if set to null ptr library chooses defaults
    !> @param[in] in_distance distance between start of each data instance in input buffer
    !> @param[in] out_strides_size size of out_strides array (must be
    !> equal to transform dimensions)
    !> @param[in] out_strides array of strides, in each dimension, of
    !> output buffer; if set to null ptr library chooses defaults
    !> @param[in] out_distance distance between start of each data instance in output buffer
    function rocfft_plan_description_set_data_layout_raw(description, in_array_type, &
                                                         out_array_type, in_offsets, out_offsets, &
                                                         in_strides_size, in_strides, in_distance, &
                                                         out_strides_size, out_strides, &
                                                         out_distance) &
       result(plan_description_set_data_layout_raw) &
       bind(C, name="rocfft_plan_description_set_data_layout")
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: description
       integer(c_int), value :: in_array_type
       integer(c_int), value :: out_array_type
       type(c_ptr), value :: in_offsets
       type(c_ptr), value :: out_offsets
       integer(c_long), value :: in_strides_size
       type(c_ptr), value :: in_strides
       integer(c_long), value :: in_distance
       integer(c_long), value :: out_strides_size
       type(c_ptr), value :: out_strides
       integer(c_long), value :: out_distance
       integer(c_int) :: plan_description_set_data_layout_raw
    end function rocfft_plan_description_set_data_layout_raw

    module procedure rocfft_plan_description_set_data_layout_typed
  end interface rocfft_plan_description_set_data_layout

  interface rocfft_field_create
    !---------------------------------------------
    ! rocfft_field_create
    !---------------------------------------------
    !> @brief Create a rocfft field struct.
    !>
    !> @warning Experimental!  This feature is part of an experimental API preview.
    function rocfft_field_create_raw(field) &
       result(field_create_raw) &
       bind(C, name="rocfft_field_create")
       import :: c_ptr, c_int
       type(c_ptr) :: field
       integer(c_int) :: field_create_raw
    end function rocfft_field_create_raw

    module procedure rocfft_field_create_typed
  end interface rocfft_field_create

  interface rocfft_field_destroy
    !---------------------------------------------
    ! rocfft_field_destroy
    !---------------------------------------------
    !> @brief Destroy a rocfft field struct
    !>
    !> The field struct can be destroyed after being added to the plan description; it is not used
    !> for
    !> plan execution.
    !>
    !> @warning Experimental!  This feature is part of an experimental API preview.
    function rocfft_field_destroy_raw(field) &
       result(field_destroy_raw) &
       bind(C, name="rocfft_field_destroy")
       import :: c_ptr, c_int
       type(c_ptr), value :: field
       integer(c_int) :: field_destroy_raw
    end function rocfft_field_destroy_raw

    module procedure rocfft_field_destroy_typed
  end interface rocfft_field_destroy

  interface rocfft_plan_description_set_comm
    !---------------------------------------------
    ! rocfft_plan_description_set_comm
    !---------------------------------------------
    !> @brief Set the communication library for distributed transforms.
    !>
    !> @details Set the multi-processing communication library for a plan.
    !>
    !> Multi-processing communication libraries require library-specific
    !> handle to also be specified.  For MPI libraries, this is a
    !> pointer to an MPI communicator.
    !>
    !> @param[in] description description handle
    !> @param[in] comm_type communicator type
    !> @param[in] comm_handle handle to communication-library-specific state
    function rocfft_plan_description_set_comm_raw(description, comm_type, comm_handle) &
       result(plan_description_set_comm_raw) &
       bind(C, name="rocfft_plan_description_set_comm")
       import :: c_ptr, c_int
       type(c_ptr), value :: description
       integer(c_int), value :: comm_type
       type(c_ptr), value :: comm_handle
       integer(c_int) :: plan_description_set_comm_raw
    end function rocfft_plan_description_set_comm_raw

    module procedure rocfft_plan_description_set_comm_typed
  end interface rocfft_plan_description_set_comm

  interface rocfft_brick_create
    !---------------------------------------------
    ! rocfft_brick_create
    !---------------------------------------------
    !> @brief Define a brick as part of a decomposition of a field.
    !>
    !> Fields can contain a full-dimensional data distribution.  The
    !> decomposition is specified by providing a lower coordinate and an
    !> upper coordinate in the field's index space.  The lower coordinate
    !> is inclusive (contained within the brick) and the upper coordinate
    !> is exclusive (first index past the end of the brick).
    !>
    !> One must also provide a stride for the brick data which specifies
    !> how the brick's data is arranged in memory.
    !>
    !> All coordinates and strides must include batch dimensions, and are in
    !> column-major order (fastest-moving dimension first).
    !>
    !> A HIP device ID is also provided - each brick may reside on a
    !> different device.
    !>
    !> All arrays may be re-used or freed immediately after the function returns.
    !>
    !> @param[out] brick: brick structure
    !> @param[in] field_lower: array of length `dim_with_batch` specifying the lower index
    !> (inclusive) for the brick in the field's index space.
    !> @param[in] field_upper: array of length `dim_with_batch` specifying the upper index
    !> (exclusive) for the brick in the field's index space.
    !> @param[in] brick_stride: array of length `dim_with_batch` specifying the brick's stride in
    !> memory
    !> @param[in] dim_with_batch: length of the arrays; this must match the dimension of
    !> the FFT plus one for the batch dimension.
    !> @param[in] deviceID: HIP device ID for the device on which the brick's data is resident.
    !>
    !> @warning Experimental!  This feature is part of an experimental API preview.
    function rocfft_brick_create_raw(brick, field_lower, field_upper, brick_stride, &
                                     dim_with_batch, deviceID) &
       result(brick_create_raw) &
       bind(C, name="rocfft_brick_create")
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: brick
       type(c_ptr), value :: field_lower
       type(c_ptr), value :: field_upper
       type(c_ptr), value :: brick_stride
       integer(c_long), value :: dim_with_batch
       integer(c_int), value :: deviceID
       integer(c_int) :: brick_create_raw
    end function rocfft_brick_create_raw

    module procedure rocfft_brick_create_typed
  end interface rocfft_brick_create

  interface rocfft_brick_destroy
    !---------------------------------------------
    ! rocfft_brick_destroy
    !---------------------------------------------
    !> @brief Deallocate a brick created with rocfft_brick_create.
    !>
    !> @warning Experimental!  This feature is part of an experimental API preview.
    function rocfft_brick_destroy_raw(brick) &
       result(brick_destroy_raw) &
       bind(C, name="rocfft_brick_destroy")
       import :: c_ptr, c_int
       type(c_ptr), value :: brick
       integer(c_int) :: brick_destroy_raw
    end function rocfft_brick_destroy_raw

    module procedure rocfft_brick_destroy_typed
  end interface rocfft_brick_destroy

  interface rocfft_field_add_brick
    !---------------------------------------------
    ! rocfft_field_add_brick
    !---------------------------------------------
    !> @brief Add a brick to a field.
    !>
    !> Note that the order in which the bricks are added is significant;
    !> the pointers provided for each brick to `rocfft_execute` are in
    !> the same order that the bricks were added to the field.
    !>
    !> The brick may be added to another field or destroyed any time
    !> after this function returns.
    !>
    !> @param[in, out] field: `rocfft_field` struct which holds the brick decomposition.
    !> @param[in] brick: `rocfft_brick` struct to add to the field.
    !>
    !> @warning Experimental!  This feature is part of an experimental API preview.
    function rocfft_field_add_brick_raw(field, brick) &
       result(field_add_brick_raw) &
       bind(C, name="rocfft_field_add_brick")
       import :: c_ptr, c_int
       type(c_ptr), value :: field
       type(c_ptr), value :: brick
       integer(c_int) :: field_add_brick_raw
    end function rocfft_field_add_brick_raw

    module procedure rocfft_field_add_brick_typed
  end interface rocfft_field_add_brick

  interface rocfft_plan_description_add_infield
    !---------------------------------------------
    ! rocfft_plan_description_add_infield
    !---------------------------------------------
    !> @brief Add a `rocfft_field` to a `rocfft_plan_description` as an input.
    !>
    !> The field may be reused or freed immediately after the function returns.
    !>
    !> @param[in, out] description: `rocfft_plan_description` that will pass the field information
    !> to plan creation
    !> @param[in] field: `rocfft_field` struct added as an input field
    !>
    !> @warning Experimental!  This feature is part of an experimental API preview.
    function rocfft_plan_description_add_infield_raw(description, field) &
       result(plan_description_add_infield_raw) &
       bind(C, name="rocfft_plan_description_add_infield")
       import :: c_ptr, c_int
       type(c_ptr), value :: description
       type(c_ptr), value :: field
       integer(c_int) :: plan_description_add_infield_raw
    end function rocfft_plan_description_add_infield_raw

    module procedure rocfft_plan_description_add_infield_typed
  end interface rocfft_plan_description_add_infield

  interface rocfft_plan_description_add_outfield
    !---------------------------------------------
    ! rocfft_plan_description_add_outfield
    !---------------------------------------------
    !> @brief Add a `rocfft_field` to a `rocfft_plan_description` as an output.
    !>
    !> The field may be reused or freed immediately after the function returns.
    !>
    !> @param[in, out] description: `rocfft_plan_description` that will pass the field information
    !> to plan creation
    !> @param[in] field: `rocfft_field` struct added as an output field
    !>
    !> @warning Experimental!  This feature is part of an experimental API preview.
    function rocfft_plan_description_add_outfield_raw(description, field) &
       result(plan_description_add_outfield_raw) &
       bind(C, name="rocfft_plan_description_add_outfield")
       import :: c_ptr, c_int
       type(c_ptr), value :: description
       type(c_ptr), value :: field
       integer(c_int) :: plan_description_add_outfield_raw
    end function rocfft_plan_description_add_outfield_raw

    module procedure rocfft_plan_description_add_outfield_typed
  end interface rocfft_plan_description_add_outfield

  interface rocfft_plan_get_work_buffer_size
    !---------------------------------------------
    ! rocfft_plan_get_work_buffer_size
    !---------------------------------------------
    !> @brief Get work buffer size on current HIP device
    !> @details Get the work buffer size required for a plan on the current HIP device.
    !>
    !> Work memory may be required on any device(s) with input or output
    !> data for the transform, and also the current device when the plan
    !> was created.  If the FFT plan uses multiple devices then this
    !> function can be called repeatedly with each of those devices as
    !> the current HIP device, to know the complete work memory
    !> requirements for all devices.
    !>
    !> @param[in] plan plan handle
    !> @param[out] size_in_bytes size of needed work buffer in bytes
    function rocfft_plan_get_work_buffer_size_raw(plan, size_in_bytes) &
       result(plan_get_work_buffer_size_raw) &
       bind(C, name="rocfft_plan_get_work_buffer_size")
       import :: c_ptr, c_int
       type(c_ptr), value :: plan
       type(c_ptr), value :: size_in_bytes
       integer(c_int) :: plan_get_work_buffer_size_raw
    end function rocfft_plan_get_work_buffer_size_raw

    module procedure rocfft_plan_get_work_buffer_size_typed
  end interface rocfft_plan_get_work_buffer_size

  interface rocfft_plan_get_print
    !---------------------------------------------
    ! rocfft_plan_get_print
    !---------------------------------------------
    !> @brief Print all plan information
    !> @details Prints plan details to stdout, to aid debugging
    !> @param[in] plan plan handle
    function rocfft_plan_get_print_raw(plan) &
       result(plan_get_print_raw) &
       bind(C, name="rocfft_plan_get_print")
       import :: c_ptr, c_int
       type(c_ptr), value :: plan
       integer(c_int) :: plan_get_print_raw
    end function rocfft_plan_get_print_raw

    module procedure rocfft_plan_get_print_typed
  end interface rocfft_plan_get_print

  interface rocfft_plan_description_create
    !---------------------------------------------
    ! rocfft_plan_description_create
    !---------------------------------------------
    !> @brief Create plan description
    !> @details This API creates a plan description with which the user
    !> can set extra plan properties.  The plan description must be freed
    !> with a call to `rocfft_plan_description_destroy`.
    !> @param[out] description plan description handle
    function rocfft_plan_description_create_raw(description) &
       result(plan_description_create_raw) &
       bind(C, name="rocfft_plan_description_create")
       import :: c_ptr, c_int
       type(c_ptr) :: description
       integer(c_int) :: plan_description_create_raw
    end function rocfft_plan_description_create_raw

    module procedure rocfft_plan_description_create_typed
  end interface rocfft_plan_description_create

  interface rocfft_plan_description_destroy
    !---------------------------------------------
    ! rocfft_plan_description_destroy
    !---------------------------------------------
    !> @brief Destroy a plan description
    !> @details This API frees the plan description.  A plan description
    !> can be freed any time after it is passed to `rocfft_plan_create`.
    !> @param[in] description plan description handle
    function rocfft_plan_description_destroy_raw(description) &
       result(plan_description_destroy_raw) &
       bind(C, name="rocfft_plan_description_destroy")
       import :: c_ptr, c_int
       type(c_ptr), value :: description
       integer(c_int) :: plan_description_destroy_raw
    end function rocfft_plan_description_destroy_raw

    module procedure rocfft_plan_description_destroy_typed
  end interface rocfft_plan_description_destroy

  interface rocfft_execution_info_create
    !---------------------------------------------
    ! rocfft_execution_info_create
    !---------------------------------------------
    !> @brief Create execution info
    !> @details This API creates an execution info with which the user
    !> can control plan execution and work buffers.  The execution info must be freed
    !> with a call to `rocfft_execution_info_destroy`.
    !> @param[out] info execution info handle
    function rocfft_execution_info_create_raw(info) &
       result(execution_info_create_raw) &
       bind(C, name="rocfft_execution_info_create")
       import :: c_ptr, c_int
       type(c_ptr) :: info
       integer(c_int) :: execution_info_create_raw
    end function rocfft_execution_info_create_raw

    module procedure rocfft_execution_info_create_typed
  end interface rocfft_execution_info_create

  interface rocfft_execution_info_destroy
    !---------------------------------------------
    ! rocfft_execution_info_destroy
    !---------------------------------------------
    !> @brief Destroy an execution info
    !> @details This API frees the execution info.  An execution info
    !> object can be freed any time after it is passed to
    !> `rocfft_execute`.
    !> @param[in] info execution info handle
    function rocfft_execution_info_destroy_raw(info) &
       result(execution_info_destroy_raw) &
       bind(C, name="rocfft_execution_info_destroy")
       import :: c_ptr, c_int
       type(c_ptr), value :: info
       integer(c_int) :: execution_info_destroy_raw
    end function rocfft_execution_info_destroy_raw

    module procedure rocfft_execution_info_destroy_typed
  end interface rocfft_execution_info_destroy

  interface rocfft_execution_info_set_work_buffer
    !---------------------------------------------
    ! rocfft_execution_info_set_work_buffer
    !---------------------------------------------
    !> @brief Set work buffer in execution info for the current HIP device
    !>
    !> @details This is one of the execution info functions to specify
    !> optional additional information to control execution.  This API
    !> provides a work buffer for the transform. It must be called
    !> before `rocfft_execute`.
    !>
    !> Work memory may be required on any device(s) with input or output
    !> data for the transform, and also the current device when the plan
    !> was created.  If the FFT plan uses multiple devices then this
    !> function can be called repeatedly with each of those devices as
    !> the current HIP device, to set work memory for all devices.
    !>
    !> When a non-zero value is obtained from
    !> `rocfft_plan_get_work_buffer_size`, that means the library needs a
    !> work buffer to compute the transform. In this case, the user
    !> should allocate the work buffer and pass it to the library via
    !> this API.
    !>
    !> If a work buffer is required for the transform but is not
    !> specified using this function, `rocfft_execute` will automatically
    !> allocate the required buffer and free it when execution is
    !> finished.
    !>
    !> Users should allocate their own work buffers if they need precise
    !> control over the lifetimes of those buffers, or if multiple plans
    !> need to share the same buffer.
    !>
    !> @param[in] info execution info handle
    !> @param[in] work_buffer work buffer
    !> @param[in] size_in_bytes size of work buffer in bytes
    function rocfft_execution_info_set_work_buffer_raw(info, work_buffer, size_in_bytes) &
       result(execution_info_set_work_buffer_raw) &
       bind(C, name="rocfft_execution_info_set_work_buffer")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: info
       type(c_ptr), value :: work_buffer
       integer(c_long), value :: size_in_bytes
       integer(c_int) :: execution_info_set_work_buffer_raw
    end function rocfft_execution_info_set_work_buffer_raw

    module procedure rocfft_execution_info_set_work_buffer_typed
  end interface rocfft_execution_info_set_work_buffer

  interface rocfft_execution_info_set_stream
    !---------------------------------------------
    ! rocfft_execution_info_set_stream
    !---------------------------------------------
    !> @brief Set stream in execution info
    !> @details Associates an existing compute stream to a plan.  This
    !> must be called before the call to `rocfft_execute`.
    !>
    !> Once the association is made, execution of the FFT will run the
    !> computation through the specified stream.
    !>
    !> The stream must be of type hipStream_t. It is an error to pass
    !> the address of a hipStream_t object.
    !>
    !> @param[in] info execution info handle
    !> @param[in] stream underlying compute stream
    function rocfft_execution_info_set_stream_raw(info, stream) &
       result(execution_info_set_stream_raw) &
       bind(C, name="rocfft_execution_info_set_stream")
       import :: c_ptr, c_int
       type(c_ptr), value :: info
       type(c_ptr), value :: stream
       integer(c_int) :: execution_info_set_stream_raw
    end function rocfft_execution_info_set_stream_raw

    module procedure rocfft_execution_info_set_stream_typed
  end interface rocfft_execution_info_set_stream

  interface rocfft_execution_info_set_load_callback
    !---------------------------------------------
    ! rocfft_execution_info_set_load_callback
    !---------------------------------------------
    !> @brief Set a load callback for a plan execution (experimental)
    !> @details This function specifies a user-defined callback function
    !> that is run to load input from global memory at the start of the
    !> transform.  Callbacks are an experimental feature in rocFFT.
    !>
    !> Callback function pointers/data are given as arrays, with one
    !> function/data pointer per brick in the input field of the plan.
    !> Load callbacks require at least one brick in the input field to
    !> be assigned to the current device used at plan creation. A plan
    !> with no input field specified is considered to have one brick on
    !> the current device used at plan creation.
    !>
    !> All functions in the array must perform the same logical
    !> operation.  That is, any function in the array must be
    !> substitutable for any other function in the array if the data
    !> being loaded were moved to another brick.
    !>
    !> The provided function pointers replace any previously-specified
    !> load callback for this execution info handle.
    !>
    !> Load callbacks have the following signature:
    !>
    !> @code
    !> Tdata load_cb(Tdata* data, size_t offset, void* cbdata, void* sharedMem);
    !> @endcode
    !>
    !> 'Tdata' is the type of a single element of the input buffer.  It is
    !> the caller's responsibility to ensure that the function type is
    !> appropriate for the plan (for example, a single-precision
    !> real-to-complex transform would load single-precision real
    !> elements).
    !>
    !> A null value for 'cb_functions' may be specified to clear any
    !> previously registered load callback.  'cb_data' may be null if
    !> the functions require no additional pointer to be passed to them.
    !>
    !> Currently, 'shared_mem_bytes' must be 0.  Callbacks are not
    !> supported on transforms that use planar formats for either input
    !> or output.
    !>
    !> @param[in] info execution info handle
    !> @param[in] cb_functions callback function pointers
    !> @param[in] cb_data callback function data, passed to the function pointer when it is called
    !> @param[in] shared_mem_bytes amount of shared memory to allocate for the callback function to
    !> use
    function rocfft_execution_info_set_load_callback_raw(info, cb_functions, cb_data, &
                                                         shared_mem_bytes) &
       result(execution_info_set_load_callback_raw) &
       bind(C, name="rocfft_execution_info_set_load_callback")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: info
       type(c_ptr) :: cb_functions
       type(c_ptr) :: cb_data
       integer(c_long), value :: shared_mem_bytes
       integer(c_int) :: execution_info_set_load_callback_raw
    end function rocfft_execution_info_set_load_callback_raw

    module procedure rocfft_execution_info_set_load_callback_typed
  end interface rocfft_execution_info_set_load_callback

  interface rocfft_execution_info_set_store_callback
    !---------------------------------------------
    ! rocfft_execution_info_set_store_callback
    !---------------------------------------------
    !> @brief Set a store callback for a plan execution (experimental)
    !> @details This function specifies a user-defined callback function
    !> that is run to store output to global memory at the end of the
    !> transform.  Callbacks are an experimental feature in rocFFT.
    !>
    !> Callback function pointers/data are given as arrays, with one
    !> function/data pointer per brick in the output field of the plan.
    !> Store callbacks require at least one brick in the output field to
    !> be assigned to the current device used at plan creation. A plan
    !> with no output field specified is considered to have one brick on
    !> the current device used at plan creation.
    !>
    !> All functions in the array must perform the same logical
    !> operation.  That is, any function in the array must be
    !> substitutable for any other function in the array if the data
    !> being stored were moved to another brick.
    !>
    !> The provided function pointers replace any previously-specified
    !> store callback for this execution info handle.
    !>
    !> Store callbacks have the following signature:
    !>
    !> @code
    !> void store_cb(Tdata* data, size_t offset, Tdata element, void* cbdata, void* sharedMem);
    !> @endcode
    !>
    !> 'Tdata' is the type of a single element of the output buffer.  It is
    !> the caller's responsibility to ensure that the function type is
    !> appropriate for the plan (for example, a single-precision
    !> real-to-complex transform would store single-precision complex
    !> elements).
    !>
    !> A null value for 'cb_functions' may be specified to clear any
    !> previously registered load callback.  'cb_data' may be null if
    !> the functions require no additional pointer to be passed to them.
    !>
    !> Currently, 'shared_mem_bytes' must be 0.  Callbacks are not
    !> supported on transforms that use planar formats for either input
    !> or output.
    !>
    !> @param[in] info execution info handle
    !> @param[in] cb_functions callback function pointers
    !> @param[in] cb_data callback function data, passed to the function pointer when it is called
    !> @param[in] shared_mem_bytes amount of shared memory to allocate for the callback function to
    !> use
    function rocfft_execution_info_set_store_callback_raw(info, cb_functions, cb_data, &
                                                          shared_mem_bytes) &
       result(execution_info_set_store_callback_raw) &
       bind(C, name="rocfft_execution_info_set_store_callback")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: info
       type(c_ptr) :: cb_functions
       type(c_ptr) :: cb_data
       integer(c_long), value :: shared_mem_bytes
       integer(c_int) :: execution_info_set_store_callback_raw
    end function rocfft_execution_info_set_store_callback_raw

    module procedure rocfft_execution_info_set_store_callback_typed
  end interface rocfft_execution_info_set_store_callback


contains

    function rocfft_plan_create_typed(plan, placement, transform_type, precision, dimensions, &
        lengths, number_of_transforms, description) result(plan_create)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_plan_t) :: plan
      integer(c_int), value :: placement
      integer(c_int), value :: transform_type
      integer(c_int), value :: precision
      integer(c_long), value :: dimensions
      type(c_ptr), value :: lengths
      integer(c_long), value :: number_of_transforms
      type(rocfft_plan_description_t), value :: description
      integer(c_int) :: plan_create
      plan_create = rocfft_plan_create_raw(plan%ptr, placement, transform_type, precision, &
        dimensions, lengths, number_of_transforms, description%ptr)
    end function rocfft_plan_create_typed

    function rocfft_execute_typed(plan, in_buffer, out_buffer, info) result(execute)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_plan_t), value :: plan
      type(c_ptr), value :: in_buffer
      type(c_ptr), value :: out_buffer
      type(rocfft_execution_info_t), value :: info
      integer(c_int) :: execute
      execute = rocfft_execute_raw(plan%ptr, in_buffer, out_buffer, info%ptr)
    end function rocfft_execute_typed

    function rocfft_plan_destroy_typed(plan) result(plan_destroy)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_plan_t), value :: plan
      integer(c_int) :: plan_destroy
      plan_destroy = rocfft_plan_destroy_raw(plan%ptr)
    end function rocfft_plan_destroy_typed

    function rocfft_plan_description_set_scale_factor_typed(description, scale_factor) result( &
        plan_description_set_scale_factor)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_plan_description_t), value :: description
      real(c_double), value :: scale_factor
      integer(c_int) :: plan_description_set_scale_factor
      plan_description_set_scale_factor = rocfft_plan_description_set_scale_factor_raw( &
        description%ptr, scale_factor)
    end function rocfft_plan_description_set_scale_factor_typed

    function rocfft_plan_description_set_data_layout_typed(description, in_array_type, &
        out_array_type, in_offsets, out_offsets, in_strides_size, in_strides, in_distance, &
        out_strides_size, out_strides, out_distance) result(plan_description_set_data_layout)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_plan_description_t), value :: description
      integer(c_int), value :: in_array_type
      integer(c_int), value :: out_array_type
      type(c_ptr), value :: in_offsets
      type(c_ptr), value :: out_offsets
      integer(c_long), value :: in_strides_size
      type(c_ptr), value :: in_strides
      integer(c_long), value :: in_distance
      integer(c_long), value :: out_strides_size
      type(c_ptr), value :: out_strides
      integer(c_long), value :: out_distance
      integer(c_int) :: plan_description_set_data_layout
      plan_description_set_data_layout = rocfft_plan_description_set_data_layout_raw( &
        description%ptr, in_array_type, out_array_type, in_offsets, out_offsets, in_strides_size, &
        in_strides, in_distance, out_strides_size, out_strides, out_distance)
    end function rocfft_plan_description_set_data_layout_typed

    function rocfft_field_create_typed(field) result(field_create)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_field_t) :: field
      integer(c_int) :: field_create
      field_create = rocfft_field_create_raw(field%ptr)
    end function rocfft_field_create_typed

    function rocfft_field_destroy_typed(field) result(field_destroy)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_field_t), value :: field
      integer(c_int) :: field_destroy
      field_destroy = rocfft_field_destroy_raw(field%ptr)
    end function rocfft_field_destroy_typed

    function rocfft_plan_description_set_comm_typed(description, comm_type, comm_handle) result( &
        plan_description_set_comm)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_plan_description_t), value :: description
      integer(c_int), value :: comm_type
      type(c_ptr), value :: comm_handle
      integer(c_int) :: plan_description_set_comm
      plan_description_set_comm = rocfft_plan_description_set_comm_raw(description%ptr, comm_type, &
        comm_handle)
    end function rocfft_plan_description_set_comm_typed

    function rocfft_brick_create_typed(brick, field_lower, field_upper, brick_stride, &
        dim_with_batch, deviceID) result(brick_create)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_brick_t) :: brick
      type(c_ptr), value :: field_lower
      type(c_ptr), value :: field_upper
      type(c_ptr), value :: brick_stride
      integer(c_long), value :: dim_with_batch
      integer(c_int), value :: deviceID
      integer(c_int) :: brick_create
      brick_create = rocfft_brick_create_raw(brick%ptr, field_lower, field_upper, brick_stride, &
        dim_with_batch, deviceID)
    end function rocfft_brick_create_typed

    function rocfft_brick_destroy_typed(brick) result(brick_destroy)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_brick_t), value :: brick
      integer(c_int) :: brick_destroy
      brick_destroy = rocfft_brick_destroy_raw(brick%ptr)
    end function rocfft_brick_destroy_typed

    function rocfft_field_add_brick_typed(field, brick) result(field_add_brick)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_field_t), value :: field
      type(rocfft_brick_t), value :: brick
      integer(c_int) :: field_add_brick
      field_add_brick = rocfft_field_add_brick_raw(field%ptr, brick%ptr)
    end function rocfft_field_add_brick_typed

    function rocfft_plan_description_add_infield_typed(description, field) result( &
        plan_description_add_infield)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_plan_description_t), value :: description
      type(rocfft_field_t), value :: field
      integer(c_int) :: plan_description_add_infield
      plan_description_add_infield = rocfft_plan_description_add_infield_raw(description%ptr, &
        field%ptr)
    end function rocfft_plan_description_add_infield_typed

    function rocfft_plan_description_add_outfield_typed(description, field) result( &
        plan_description_add_outfield)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_plan_description_t), value :: description
      type(rocfft_field_t), value :: field
      integer(c_int) :: plan_description_add_outfield
      plan_description_add_outfield = rocfft_plan_description_add_outfield_raw(description%ptr, &
        field%ptr)
    end function rocfft_plan_description_add_outfield_typed

    function rocfft_plan_get_work_buffer_size_typed(plan, size_in_bytes) result( &
        plan_get_work_buffer_size)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_plan_t), value :: plan
      type(c_ptr), value :: size_in_bytes
      integer(c_int) :: plan_get_work_buffer_size
      plan_get_work_buffer_size = rocfft_plan_get_work_buffer_size_raw(plan%ptr, size_in_bytes)
    end function rocfft_plan_get_work_buffer_size_typed

    function rocfft_plan_get_print_typed(plan) result(plan_get_print)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_plan_t), value :: plan
      integer(c_int) :: plan_get_print
      plan_get_print = rocfft_plan_get_print_raw(plan%ptr)
    end function rocfft_plan_get_print_typed

    function rocfft_plan_description_create_typed(description) result(plan_description_create)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_plan_description_t) :: description
      integer(c_int) :: plan_description_create
      plan_description_create = rocfft_plan_description_create_raw(description%ptr)
    end function rocfft_plan_description_create_typed

    function rocfft_plan_description_destroy_typed(description) result(plan_description_destroy)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_plan_description_t), value :: description
      integer(c_int) :: plan_description_destroy
      plan_description_destroy = rocfft_plan_description_destroy_raw(description%ptr)
    end function rocfft_plan_description_destroy_typed

    function rocfft_execution_info_create_typed(info) result(execution_info_create)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_execution_info_t) :: info
      integer(c_int) :: execution_info_create
      execution_info_create = rocfft_execution_info_create_raw(info%ptr)
    end function rocfft_execution_info_create_typed

    function rocfft_execution_info_destroy_typed(info) result(execution_info_destroy)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_execution_info_t), value :: info
      integer(c_int) :: execution_info_destroy
      execution_info_destroy = rocfft_execution_info_destroy_raw(info%ptr)
    end function rocfft_execution_info_destroy_typed

    function rocfft_execution_info_set_work_buffer_typed(info, work_buffer, size_in_bytes) result( &
        execution_info_set_work_buffer)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_execution_info_t), value :: info
      type(c_ptr), value :: work_buffer
      integer(c_long), value :: size_in_bytes
      integer(c_int) :: execution_info_set_work_buffer
      execution_info_set_work_buffer = rocfft_execution_info_set_work_buffer_raw(info%ptr, &
        work_buffer, size_in_bytes)
    end function rocfft_execution_info_set_work_buffer_typed

    function rocfft_execution_info_set_stream_typed(info, stream) result(execution_info_set_stream)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_execution_info_t), value :: info
      type(c_ptr), value :: stream
      integer(c_int) :: execution_info_set_stream
      execution_info_set_stream = rocfft_execution_info_set_stream_raw(info%ptr, stream)
    end function rocfft_execution_info_set_stream_typed

    function rocfft_execution_info_set_load_callback_typed(info, cb_functions, cb_data, &
        shared_mem_bytes) result(execution_info_set_load_callback)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_execution_info_t), value :: info
      type(c_ptr) :: cb_functions
      type(c_ptr) :: cb_data
      integer(c_long), value :: shared_mem_bytes
      integer(c_int) :: execution_info_set_load_callback
      execution_info_set_load_callback = rocfft_execution_info_set_load_callback_raw(info%ptr, &
        cb_functions, cb_data, shared_mem_bytes)
    end function rocfft_execution_info_set_load_callback_typed

    function rocfft_execution_info_set_store_callback_typed(info, cb_functions, cb_data, &
        shared_mem_bytes) result(execution_info_set_store_callback)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_execution_info_t), value :: info
      type(c_ptr) :: cb_functions
      type(c_ptr) :: cb_data
      integer(c_long), value :: shared_mem_bytes
      integer(c_int) :: execution_info_set_store_callback
      execution_info_set_store_callback = rocfft_execution_info_set_store_callback_raw(info%ptr, &
        cb_functions, cb_data, shared_mem_bytes)
    end function rocfft_execution_info_set_store_callback_typed

end module hipfort_rocfft
