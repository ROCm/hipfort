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
          
           
module hipfort_rocfft
  use hipfort_rocfft_enums
  implicit none

 
  interface
  ! ! @brief Library setup function, called once in program before start of
  !   library use 
    function rocfft_setup() bind(c, name="rocfft_setup")
      use iso_c_binding
      use hipfort_rocfft_enums
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_setup
    end function

  ! ! @brief Library cleanup function, called once in program after end of library
  !   use 
    function rocfft_cleanup() bind(c, name="rocfft_cleanup")
      use iso_c_binding
      use hipfort_rocfft_enums
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_cleanup
    end function

  ! ! @brief Create an FFT plan
  !  
  !    @details This API creates a plan, which the user can execute subsequently.
  !   This function
  !    takes many of the fundamental parameters needed to specify a transform. The
  !   parameters are
  !    self explanatory. The dimensions parameter can take a value of 1,2 or 3. The
  !   'lengths' array specifies
  !    size of data in each dimension. Note that lengths[0] is the size of the
  !   innermost dimension, lengths[1]
  !    is the next higher dimension and so on. The 'number_of_transforms' parameter
  !   specifies how many transforms
  !    (of the same kind) needs to be computed. By specifying a value greater than
  !   1, a batch of transforms can
  !    be computed with a single api call. Additionally, a handle to a plan
  !   description can be passed for more
  !    detailed transforms. For simple transforms, this parameter can be set to
  !   null ptr.
  !  
  !    @param[out] plan plan handle
  !    @param[in] placement placement of result
  !    @param[in] transform_type type of transform
  !    @param[in] precision precision
  !    @param[in] dimensions dimensions
  !    @param[in] lengths dimensions sized array of transform lengths
  !    @param[in] number_of_transforms number of transforms
  !    @param[in] description description handle created by
  !   rocfft_plan_description_create; can be
  !    null ptr for simple transforms
  !    
    function rocfft_plan_create(plan,placement,transform_type,myPrecision,dimensions,lengths,number_of_transforms,description) bind(c, name="rocfft_plan_create")
      use iso_c_binding
      use hipfort_rocfft_enums
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_plan_create
      type(c_ptr) :: plan
      integer(kind(rocfft_placement_inplace)),value :: placement
      integer(kind(rocfft_transform_type_complex_forward)),value :: transform_type
      integer(kind(rocfft_precision_single)),value :: myPrecision
      integer(c_size_t),value :: dimensions
      type(c_ptr),value :: lengths
      integer(c_size_t),value :: number_of_transforms
      type(c_ptr),value :: description
    end function

  ! ! @brief Execute an FFT plan
  !  
  !    @details This API executes an FFT plan on buffers given by the user. If the
  !   transform is in-place,
  !    only the input buffer is needed and the output buffer parameter can be set
  !   to NULL. For not in-place
  !    transforms, output buffers have to be specified. Note that both input and
  !   output buffer are arrays of
  !    pointers, this is to facilitate passing planar buffers where real and
  !   imaginary parts are in 2 separate
  !    buffers. For the default interleaved format, just a unit sized array holding
  !   the pointer to inputoutput
  !    buffer need to be passed. The final parameter in this function is an
  !   execution_info handle. This parameter
  !    serves as a way for the user to control execution, as well as for the
  !   library to pass any execution
  !    related information back to the user.
  !  
  !    @param[in] plan plan handle
  !    @param[in,out] in_buffer array (of size 1 for interleaved data, of size 2
  !   for planar data) of input buffers
  !    @param[in,out] out_buffer array (of size 1 for interleaved data, of size 2
  !   for planar data) of output buffers, can be nullptr for inplace result
  !   placement
  !    @param[in] info execution info handle created by
  !   rocfft_execution_info_create
  !    
    function rocfft_execute(plan,in_buffer,out_buffer,myInfo) bind(c, name="rocfft_execute")
      use iso_c_binding
      use hipfort_rocfft_enums
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_execute
      type(c_ptr),value :: plan
      type(c_ptr) :: in_buffer
      type(c_ptr) :: out_buffer
      type(c_ptr),value :: myInfo
    end function

  ! ! @brief Destroy an FFT plan
  !    @details This API frees the plan. This function destructs a plan after it is
  !   no longer needed.
  !    @param[in] plan plan handle
  !    
    function rocfft_plan_destroy(plan) bind(c, name="rocfft_plan_destroy")
      use iso_c_binding
      use hipfort_rocfft_enums
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_plan_destroy
      type(c_ptr),value :: plan
    end function

  ! ! @brief Set scaling factor in single precision
  !    @details This is one of plan description functions to specify optional additional plan properties using the description handle. This API specifies scaling factor.
  !    @param[in] description description handle
  !    @param[in] scale scaling factor
  !    
    function rocfft_plan_description_set_scale_float(description,scale) bind(c, name="rocfft_plan_description_set_scale_float")
      use iso_c_binding
      use hipfort_rocfft_enums
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_plan_description_set_scale_float
      type(c_ptr),value :: description
      real(c_float),value :: scale
    end function

  ! ! @brief Set scaling factor in double precision
  !    @details This is one of plan description functions to specify optional additional plan properties using the description handle. This API specifies scaling factor.
  !    @param[in] description description handle
  !    @param[in] scale scaling factor
  !    
    function rocfft_plan_description_set_scale_double(description,scale) bind(c, name="rocfft_plan_description_set_scale_double")
      use iso_c_binding
      use hipfort_rocfft_enums
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_plan_description_set_scale_double
      type(c_ptr),value :: description
      real(c_double),value :: scale
    end function

  ! !
  !    @brief Set data layout
  !   
  !    @details This is one of plan description functions to specify
  !     optional additional plan properties using the description
  !     handle. This API specifies the layout of buffers.
  !   
  !    This function can be used to specify input and output array
  !    types. Not all combinations of array types are supported and error
  !    code will be returned for unsupported cases.  Additionally, input
  !    and output buffer offsets can be specified. The function can be
  !    used to specify custom layout of data, with the ability to specify
  !    stride between consecutive elements in all dimensions. Also,
  !    distance between transform data members can be specified. The
  !    library will choose appropriate defaults if offsetsstrides are
  !    set to null ptr andor distances set to 0.
  !   
  !    @param[in, out] description description handle
  !    @param[in] in_array_type array type of input buffer
  !    @param[in] out_array_type array type of output buffer
  !    @param[in] in_offsets offsets, in element units, to start of data in input buffer
  !    @param[in] out_offsets offsets, in element units, to start of data in output buffer
  !    @param[in] in_strides_size size of in_strides array (must be equal to transform dimensions)
  !    @param[in] in_strides array of strides, in each dimension, of
  !     input buffer; if set to null ptr library chooses defaults
  !    @param[in] in_distance distance between start of each data instance in input buffer
  !    @param[in] out_strides_size size of out_strides array (must be
  !    equal to transform dimensions)
  !    @param[in] out_strides array of strides, in each dimension, of
  !     output buffer; if set to null ptr library chooses defaults
  !    @param[in] out_distance distance between start of each data instance in output buffer
  !  
    function rocfft_plan_description_set_data_layout(description,in_array_type,out_array_type,in_offsets,out_offsets,in_strides_size,in_strides,in_distance,out_strides_size,out_strides,out_distance) bind(c, name="rocfft_plan_description_set_data_layout")
      use iso_c_binding
      use hipfort_rocfft_enums
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_plan_description_set_data_layout
      type(c_ptr),value :: description
      integer(kind(rocfft_array_type_complex_interleaved)),value :: in_array_type
      integer(kind(rocfft_array_type_complex_interleaved)),value :: out_array_type
      type(c_ptr),value :: in_offsets
      type(c_ptr),value :: out_offsets
      integer(c_size_t),value :: in_strides_size
      type(c_ptr),value :: in_strides
      integer(c_size_t),value :: in_distance
      integer(c_size_t),value :: out_strides_size
      type(c_ptr),value :: out_strides
      integer(c_size_t),value :: out_distance
    end function

  ! ! @brief Get library version string
  !  
  !   @param[in, out] buf buffer of version string
  !   @param[in] len the length of input string buffer, expecting minimum 30
  !  
    function rocfft_get_version_string(buf,len) bind(c, name="rocfft_get_version_string")
      use iso_c_binding
      use hipfort_rocfft_enums
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_get_version_string
      type(c_ptr),value :: buf
      integer(c_size_t),value :: len
    end function

  ! ! @brief Set devices in plan description
  !    @details This is one of plan description functions to specify optional additional plan properties using the description handle. This API specifies what compute devices to target.
  !    @param[in] description description handle
  !    @param[in] devices array of device identifiers
  !    @param[in] number_of_devices number of devices (size of devices array)
  !    
    function rocfft_plan_description_set_devices(description,devices,number_of_devices) bind(c, name="rocfft_plan_description_set_devices")
      use iso_c_binding
      use hipfort_rocfft_enums
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_plan_description_set_devices
      type(c_ptr),value :: description
      type(c_ptr),value :: devices
      integer(c_size_t),value :: number_of_devices
    end function

  ! ! @brief Get work buffer size
  !    @details This is one of plan query functions to obtain information regarding
  !   a plan. This API gets the work buffer size.
  !    @param[in] plan plan handle
  !    @param[out] size_in_bytes size of needed work buffer in bytes
  !    
    function rocfft_plan_get_work_buffer_size(plan,size_in_bytes) bind(c, name="rocfft_plan_get_work_buffer_size")
      use iso_c_binding
      use hipfort_rocfft_enums
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_plan_get_work_buffer_size
      type(c_ptr),value :: plan
      type(c_ptr),value :: size_in_bytes
    end function

  ! ! @brief Print all plan information
  !    @details This is one of plan query functions to obtain information regarding
  !   a plan. This API prints all plan info to stdout to help user verify plan
  !   specification.
  !    @param[in] plan plan handle
  !    
    function rocfft_plan_get_print(plan) bind(c, name="rocfft_plan_get_print")
      use iso_c_binding
      use hipfort_rocfft_enums
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_plan_get_print
      type(c_ptr),value :: plan
    end function

  ! ! @brief Create plan description
  !    @details This API creates a plan description with which the user can set
  !   more plan properties
  !    @param[out] description plan description handle
  !    
    function rocfft_plan_description_create(description) bind(c, name="rocfft_plan_description_create")
      use iso_c_binding
      use hipfort_rocfft_enums
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_plan_description_create
      type(c_ptr) :: description
    end function

  ! ! @brief Destroy a plan description
  !    @details This API frees the plan description
  !    @param[in] description plan description handle
  !    
    function rocfft_plan_description_destroy(description) bind(c, name="rocfft_plan_description_destroy")
      use iso_c_binding
      use hipfort_rocfft_enums
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_plan_description_destroy
      type(c_ptr),value :: description
    end function

  ! ! @brief Create execution info
  !    @details This API creates an execution info with which the user can control
  !   plan execution & retrieve execution information
  !    @param[out] info execution info handle
  !    
    function rocfft_execution_info_create(myInfo) bind(c, name="rocfft_execution_info_create")
      use iso_c_binding
      use hipfort_rocfft_enums
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_execution_info_create
      type(c_ptr) :: myInfo
    end function

  ! ! @brief Destroy an execution info
  !    @details This API frees the execution info
  !    @param[in] info execution info handle
  !    
    function rocfft_execution_info_destroy(myInfo) bind(c, name="rocfft_execution_info_destroy")
      use iso_c_binding
      use hipfort_rocfft_enums
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_execution_info_destroy
      type(c_ptr),value :: myInfo
    end function

  ! ! @brief Set work buffer in execution info
  !  
  !    @details This is one of the execution info functions to specify optional
  !   additional information to control execution.
  !    This API specifies work buffer needed. It has to be called before the call
  !   to rocfft_execute.
  !    When a non-zero value is obtained from rocfft_plan_get_work_buffer_size,
  !   that means the library needs a work buffer
  !    to compute the transform. In this case, the user has to allocate the work
  !   buffer and pass it to the library via this api.
  !  
  !    @param[in] info execution info handle
  !    @param[in] work_buffer work buffer
  !    @param[in] size_in_bytes size of work buffer in bytes
  !    
    function rocfft_execution_info_set_work_buffer(myInfo,work_buffer,size_in_bytes) bind(c, name="rocfft_execution_info_set_work_buffer")
      use iso_c_binding
      use hipfort_rocfft_enums
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_execution_info_set_work_buffer
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: work_buffer
      integer(c_size_t),value :: size_in_bytes
    end function

  ! ! @brief Set execution mode in execution info
  !    @details This is one of the execution info functions to specify optional additional information to control execution.
  !    This API specifies execution mode. It has to be called before the call to rocfft_execute.
  !    Appropriate enumeration value can be specified to control blockingnon-blocking behavior of the rocfft_execute call.
  !    @param[in] info execution info handle
  !    @param[in] mode execution mode
  !    
    function rocfft_execution_info_set_mode(myInfo,mode) bind(c, name="rocfft_execution_info_set_mode")
      use iso_c_binding
      use hipfort_rocfft_enums
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_execution_info_set_mode
      type(c_ptr),value :: myInfo
      integer(kind(rocfft_exec_mode_nonblocking)),value :: mode
    end function

  ! ! @brief Set stream in execution info
  !    @details This is one of the execution info functions to specify optional
  !   additional information to control execution.
  !    This API specifies compute stream. It has to be called before the call to
  !   rocfft_execute.
  !    It is the underlying device queuestream where the library computations
  !   would be inserted. The library assumes user
  !    has created such a stream in the program and merely assigns work to the
  !   stream.
  !    @param[in] info execution info handle
  !    @param[in] stream underlying compute stream
  !    
    function rocfft_execution_info_set_stream(myInfo,stream) bind(c, name="rocfft_execution_info_set_stream")
      use iso_c_binding
      use hipfort_rocfft_enums
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_execution_info_set_stream
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: stream
    end function

  ! ! @brief Get events from execution info
  !    @details This is one of the execution info functions to retrieve information from execution.
  !    This API obtains event information. It has to be called after the call to rocfft_execute.
  !    This gets handles to events that the library created around one or more kernel launches during execution.
  !    @param[in] info execution info handle
  !    @param[out] events array of events
  !    @param[out] number_of_events number of events (size of events array)
  !    
    function rocfft_execution_info_get_events(myInfo,events,number_of_events) bind(c, name="rocfft_execution_info_get_events")
      use iso_c_binding
      use hipfort_rocfft_enums
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_execution_info_get_events
      type(c_ptr),value :: myInfo
      type(c_ptr) :: events
      type(c_ptr),value :: number_of_events
    end function

  end interface
  
end module hipfort_rocfft