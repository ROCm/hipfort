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

#ifdef USE_ASSUMED_RANK_INTERFACES
    function rocfft_plan_create_assumed_rank(plan,placement,transform_type,myPrecision,dimensions, &
        lengths,number_of_transforms,description)
      use iso_c_binding
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_plan_create_assumed_rank
      type(rocfft_plan_t) :: plan
      integer(kind(rocfft_placement_inplace)) :: placement
      integer(kind(rocfft_transform_type_complex_forward)) :: transform_type
      integer(kind(rocfft_precision_single)) :: myPrecision
      integer(c_size_t) :: dimensions
      integer(c_size_t),target,contiguous,dimension(..) :: lengths
      integer(c_size_t) :: number_of_transforms
      type(rocfft_plan_description_t) :: description
      !
      rocfft_plan_create_assumed_rank = rocfft_plan_create_(plan%ptr,placement,transform_type, &
        myPrecision,dimensions,c_loc(lengths),number_of_transforms,description%ptr)
    end function

    function rocfft_plan_create_assumed_rank_cptr(plan,placement,transform_type,myPrecision, &
        dimensions,lengths,number_of_transforms,description)
      use iso_c_binding
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_plan_create_assumed_rank_cptr
      type(c_ptr) :: plan
      integer(kind(rocfft_placement_inplace)) :: placement
      integer(kind(rocfft_transform_type_complex_forward)) :: transform_type
      integer(kind(rocfft_precision_single)) :: myPrecision
      integer(c_size_t) :: dimensions
      integer(c_size_t),target,contiguous,dimension(..) :: lengths
      integer(c_size_t) :: number_of_transforms
      type(c_ptr) :: description
      !
      rocfft_plan_create_assumed_rank_cptr = rocfft_plan_create_(plan,placement,transform_type, &
        myPrecision,dimensions,c_loc(lengths),number_of_transforms,description)
    end function

#else
    function rocfft_plan_create_rank_0(plan,placement,transform_type,myPrecision,dimensions, &
        lengths,number_of_transforms,description)
      use iso_c_binding
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_plan_create_rank_0
      type(rocfft_plan_t) :: plan
      integer(kind(rocfft_placement_inplace)) :: placement
      integer(kind(rocfft_transform_type_complex_forward)) :: transform_type
      integer(kind(rocfft_precision_single)) :: myPrecision
      integer(c_size_t) :: dimensions
      integer(c_size_t),target :: lengths
      integer(c_size_t) :: number_of_transforms
      type(rocfft_plan_description_t) :: description
      !
      rocfft_plan_create_rank_0 = rocfft_plan_create_(plan%ptr,placement,transform_type, &
        myPrecision,dimensions,c_loc(lengths),number_of_transforms,description%ptr)
    end function

    function rocfft_plan_create_rank_0_cptr(plan,placement,transform_type,myPrecision,dimensions, &
        lengths,number_of_transforms,description)
      use iso_c_binding
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_plan_create_rank_0_cptr
      type(c_ptr) :: plan
      integer(kind(rocfft_placement_inplace)) :: placement
      integer(kind(rocfft_transform_type_complex_forward)) :: transform_type
      integer(kind(rocfft_precision_single)) :: myPrecision
      integer(c_size_t) :: dimensions
      integer(c_size_t),target :: lengths
      integer(c_size_t) :: number_of_transforms
      type(c_ptr) :: description
      !
      rocfft_plan_create_rank_0_cptr = rocfft_plan_create_(plan,placement,transform_type, &
        myPrecision,dimensions,c_loc(lengths),number_of_transforms,description)
    end function

    function rocfft_plan_create_rank_1(plan,placement,transform_type,myPrecision,dimensions, &
        lengths,number_of_transforms,description)
      use iso_c_binding
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_plan_create_rank_1
      type(rocfft_plan_t) :: plan
      integer(kind(rocfft_placement_inplace)) :: placement
      integer(kind(rocfft_transform_type_complex_forward)) :: transform_type
      integer(kind(rocfft_precision_single)) :: myPrecision
      integer(c_size_t) :: dimensions
      integer(c_size_t),target,dimension(:) :: lengths
      integer(c_size_t) :: number_of_transforms
      type(rocfft_plan_description_t) :: description
      !
      rocfft_plan_create_rank_1 = rocfft_plan_create_(plan%ptr,placement,transform_type, &
        myPrecision,dimensions,c_loc(lengths),number_of_transforms,description%ptr)
    end function

    function rocfft_plan_create_rank_1_cptr(plan,placement,transform_type,myPrecision,dimensions, &
        lengths,number_of_transforms,description)
      use iso_c_binding
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_plan_create_rank_1_cptr
      type(c_ptr) :: plan
      integer(kind(rocfft_placement_inplace)) :: placement
      integer(kind(rocfft_transform_type_complex_forward)) :: transform_type
      integer(kind(rocfft_precision_single)) :: myPrecision
      integer(c_size_t) :: dimensions
      integer(c_size_t),target,dimension(:) :: lengths
      integer(c_size_t) :: number_of_transforms
      type(c_ptr) :: description
      !
      rocfft_plan_create_rank_1_cptr = rocfft_plan_create_(plan,placement,transform_type, &
        myPrecision,dimensions,c_loc(lengths),number_of_transforms,description)
    end function

#endif
    function rocfft_plan_create_typed(plan, placement, transform_type, myPrecision, dimensions, &
        lengths, number_of_transforms, description) result(plan_create)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_plan_t) :: plan
      integer(kind(rocfft_placement_inplace)), value :: placement
      integer(kind(rocfft_transform_type_complex_forward)), value :: transform_type
      integer(kind(rocfft_precision_single)), value :: myPrecision
      integer(c_size_t), value :: dimensions
      type(c_ptr), value :: lengths
      integer(c_size_t), value :: number_of_transforms
      type(rocfft_plan_description_t), value :: description
      integer(kind(rocfft_status_success)) :: plan_create
      plan_create = rocfft_plan_create_(plan%ptr, placement, transform_type, myPrecision, &
        dimensions, lengths, number_of_transforms, description%ptr)
    end function rocfft_plan_create_typed

    function rocfft_execute_typed(plan, in_buffer, out_buffer, myInfo) result(execute)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_plan_t), value :: plan
      type(c_ptr) :: in_buffer
      type(c_ptr) :: out_buffer
      type(rocfft_execution_info_t), value :: myInfo
      integer(kind(rocfft_status_success)) :: execute
      execute = rocfft_execute_(plan%ptr, in_buffer, out_buffer, myInfo%ptr)
    end function rocfft_execute_typed

    function rocfft_plan_destroy_typed(plan) result(plan_destroy)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_plan_t), value :: plan
      integer(kind(rocfft_status_success)) :: plan_destroy
      plan_destroy = rocfft_plan_destroy_(plan%ptr)
    end function rocfft_plan_destroy_typed

    function rocfft_plan_description_set_scale_factor_typed(description, &
        scale_factor) result(plan_description_set_scale_factor)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_plan_description_t), value :: description
      real(c_double), value :: scale_factor
      integer(kind(rocfft_status_success)) :: plan_description_set_scale_factor
      plan_description_set_scale_factor = rocfft_plan_description_set_scale_factor_( &
        description%ptr, scale_factor)
    end function rocfft_plan_description_set_scale_factor_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function rocfft_plan_description_set_data_layout_assumed_rank(description,in_array_type, &
        out_array_type,in_offsets,out_offsets,in_strides_size,in_strides,in_distance, &
        out_strides_size,out_strides,out_distance)
      use iso_c_binding
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_plan_description_set_data_layout_assumed_rank
      type(rocfft_plan_description_t) :: description
      integer(kind(rocfft_array_type_complex_interleaved)) :: in_array_type
      integer(kind(rocfft_array_type_complex_interleaved)) :: out_array_type
      integer(c_size_t),target,contiguous,dimension(..) :: in_offsets
      integer(c_size_t),target,contiguous,dimension(..) :: out_offsets
      integer(c_size_t) :: in_strides_size
      integer(c_size_t),target,contiguous,dimension(..) :: in_strides
      integer(c_size_t) :: in_distance
      integer(c_size_t) :: out_strides_size
      integer(c_size_t),target,contiguous,dimension(..) :: out_strides
      integer(c_size_t) :: out_distance
      !
      rocfft_plan_description_set_data_layout_assumed_rank = &
        rocfft_plan_description_set_data_layout_(description%ptr,in_array_type,out_array_type, &
        c_loc(in_offsets),c_loc(out_offsets),in_strides_size,c_loc(in_strides),in_distance, &
        out_strides_size,c_loc(out_strides),out_distance)
    end function

    function rocfft_plan_description_set_data_layout_assumed_rank_cptr(description,in_array_type, &
        out_array_type,in_offsets,out_offsets,in_strides_size,in_strides,in_distance, &
        out_strides_size,out_strides,out_distance)
      use iso_c_binding
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_plan_description_set_data_layout_assumed_rank_cptr
      type(c_ptr) :: description
      integer(kind(rocfft_array_type_complex_interleaved)) :: in_array_type
      integer(kind(rocfft_array_type_complex_interleaved)) :: out_array_type
      integer(c_size_t),target,contiguous,dimension(..) :: in_offsets
      integer(c_size_t),target,contiguous,dimension(..) :: out_offsets
      integer(c_size_t) :: in_strides_size
      integer(c_size_t),target,contiguous,dimension(..) :: in_strides
      integer(c_size_t) :: in_distance
      integer(c_size_t) :: out_strides_size
      integer(c_size_t),target,contiguous,dimension(..) :: out_strides
      integer(c_size_t) :: out_distance
      !
      rocfft_plan_description_set_data_layout_assumed_rank_cptr = &
        rocfft_plan_description_set_data_layout_(description,in_array_type,out_array_type, &
        c_loc(in_offsets),c_loc(out_offsets),in_strides_size,c_loc(in_strides),in_distance, &
        out_strides_size,c_loc(out_strides),out_distance)
    end function

#else
    function rocfft_plan_description_set_data_layout_rank_0(description,in_array_type, &
        out_array_type,in_offsets,out_offsets,in_strides_size,in_strides,in_distance, &
        out_strides_size,out_strides,out_distance)
      use iso_c_binding
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_plan_description_set_data_layout_rank_0
      type(rocfft_plan_description_t) :: description
      integer(kind(rocfft_array_type_complex_interleaved)) :: in_array_type
      integer(kind(rocfft_array_type_complex_interleaved)) :: out_array_type
      integer(c_size_t),target :: in_offsets
      integer(c_size_t),target :: out_offsets
      integer(c_size_t) :: in_strides_size
      integer(c_size_t),target :: in_strides
      integer(c_size_t) :: in_distance
      integer(c_size_t) :: out_strides_size
      integer(c_size_t),target :: out_strides
      integer(c_size_t) :: out_distance
      !
      rocfft_plan_description_set_data_layout_rank_0 = rocfft_plan_description_set_data_layout_( &
        description%ptr,in_array_type,out_array_type,c_loc(in_offsets),c_loc(out_offsets), &
        in_strides_size,c_loc(in_strides),in_distance,out_strides_size,c_loc(out_strides), &
        out_distance)
    end function

    function rocfft_plan_description_set_data_layout_rank_0_cptr(description,in_array_type, &
        out_array_type,in_offsets,out_offsets,in_strides_size,in_strides,in_distance, &
        out_strides_size,out_strides,out_distance)
      use iso_c_binding
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_plan_description_set_data_layout_rank_0_cptr
      type(c_ptr) :: description
      integer(kind(rocfft_array_type_complex_interleaved)) :: in_array_type
      integer(kind(rocfft_array_type_complex_interleaved)) :: out_array_type
      integer(c_size_t),target :: in_offsets
      integer(c_size_t),target :: out_offsets
      integer(c_size_t) :: in_strides_size
      integer(c_size_t),target :: in_strides
      integer(c_size_t) :: in_distance
      integer(c_size_t) :: out_strides_size
      integer(c_size_t),target :: out_strides
      integer(c_size_t) :: out_distance
      !
      rocfft_plan_description_set_data_layout_rank_0_cptr = &
        rocfft_plan_description_set_data_layout_(description,in_array_type,out_array_type, &
        c_loc(in_offsets),c_loc(out_offsets),in_strides_size,c_loc(in_strides),in_distance, &
        out_strides_size,c_loc(out_strides),out_distance)
    end function

    function rocfft_plan_description_set_data_layout_rank_1(description,in_array_type, &
        out_array_type,in_offsets,out_offsets,in_strides_size,in_strides,in_distance, &
        out_strides_size,out_strides,out_distance)
      use iso_c_binding
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_plan_description_set_data_layout_rank_1
      type(rocfft_plan_description_t) :: description
      integer(kind(rocfft_array_type_complex_interleaved)) :: in_array_type
      integer(kind(rocfft_array_type_complex_interleaved)) :: out_array_type
      integer(c_size_t),target,dimension(:) :: in_offsets
      integer(c_size_t),target,dimension(:) :: out_offsets
      integer(c_size_t) :: in_strides_size
      integer(c_size_t),target,dimension(:) :: in_strides
      integer(c_size_t) :: in_distance
      integer(c_size_t) :: out_strides_size
      integer(c_size_t),target,dimension(:) :: out_strides
      integer(c_size_t) :: out_distance
      !
      rocfft_plan_description_set_data_layout_rank_1 = rocfft_plan_description_set_data_layout_( &
        description%ptr,in_array_type,out_array_type,c_loc(in_offsets),c_loc(out_offsets), &
        in_strides_size,c_loc(in_strides),in_distance,out_strides_size,c_loc(out_strides), &
        out_distance)
    end function

    function rocfft_plan_description_set_data_layout_rank_1_cptr(description,in_array_type, &
        out_array_type,in_offsets,out_offsets,in_strides_size,in_strides,in_distance, &
        out_strides_size,out_strides,out_distance)
      use iso_c_binding
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_plan_description_set_data_layout_rank_1_cptr
      type(c_ptr) :: description
      integer(kind(rocfft_array_type_complex_interleaved)) :: in_array_type
      integer(kind(rocfft_array_type_complex_interleaved)) :: out_array_type
      integer(c_size_t),target,dimension(:) :: in_offsets
      integer(c_size_t),target,dimension(:) :: out_offsets
      integer(c_size_t) :: in_strides_size
      integer(c_size_t),target,dimension(:) :: in_strides
      integer(c_size_t) :: in_distance
      integer(c_size_t) :: out_strides_size
      integer(c_size_t),target,dimension(:) :: out_strides
      integer(c_size_t) :: out_distance
      !
      rocfft_plan_description_set_data_layout_rank_1_cptr = &
        rocfft_plan_description_set_data_layout_(description,in_array_type,out_array_type, &
        c_loc(in_offsets),c_loc(out_offsets),in_strides_size,c_loc(in_strides),in_distance, &
        out_strides_size,c_loc(out_strides),out_distance)
    end function

#endif
    function rocfft_plan_description_set_data_layout_typed(description, in_array_type, &
        out_array_type, in_offsets, out_offsets, in_strides_size, in_strides, in_distance, &
        out_strides_size, out_strides, out_distance) result(plan_description_set_data_layout)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_plan_description_t), value :: description
      integer(kind(rocfft_array_type_complex_interleaved)), value :: in_array_type
      integer(kind(rocfft_array_type_complex_interleaved)), value :: out_array_type
      type(c_ptr), value :: in_offsets
      type(c_ptr), value :: out_offsets
      integer(c_size_t), value :: in_strides_size
      type(c_ptr), value :: in_strides
      integer(c_size_t), value :: in_distance
      integer(c_size_t), value :: out_strides_size
      type(c_ptr), value :: out_strides
      integer(c_size_t), value :: out_distance
      integer(kind(rocfft_status_success)) :: plan_description_set_data_layout
      plan_description_set_data_layout = rocfft_plan_description_set_data_layout_(description%ptr, &
        in_array_type, out_array_type, in_offsets, out_offsets, in_strides_size, in_strides, &
        in_distance, out_strides_size, out_strides, out_distance)
    end function rocfft_plan_description_set_data_layout_typed

    function rocfft_field_create_typed(field) result(field_create)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_field_t) :: field
      integer(kind(rocfft_status_success)) :: field_create
      field_create = rocfft_field_create_(field%ptr)
    end function rocfft_field_create_typed

    function rocfft_field_destroy_typed(field) result(field_destroy)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_field_t), value :: field
      integer(kind(rocfft_status_success)) :: field_destroy
      field_destroy = rocfft_field_destroy_(field%ptr)
    end function rocfft_field_destroy_typed

    function rocfft_get_version_string_cstr(buf, len_) result(get_version_string)
      use, intrinsic :: iso_c_binding
      implicit none
      character(len=*), intent(out) :: buf
      integer(c_size_t), value :: len_
      integer(kind(rocfft_status_success)) :: get_version_string
      character(len=len(buf)+1, kind=c_char), target :: buf__c
      integer :: i__c
      buf__c = repeat(c_null_char, len(buf)+1)
      get_version_string = rocfft_get_version_string_(c_loc(buf__c), len_)
      buf = ""
      do i__c = 1, len(buf)
        if (buf__c(i__c:i__c) == c_null_char) exit
        buf(i__c:i__c) = buf__c(i__c:i__c)
      end do
    end function rocfft_get_version_string_cstr

    function rocfft_plan_description_set_comm_typed(description, comm_type, &
        comm_handle) result(plan_description_set_comm)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_plan_description_t), value :: description
      integer(kind(rocfft_comm_none)), value :: comm_type
      type(c_ptr), value :: comm_handle
      integer(kind(rocfft_status_success)) :: plan_description_set_comm
      plan_description_set_comm = rocfft_plan_description_set_comm_(description%ptr, comm_type, &
        comm_handle)
    end function rocfft_plan_description_set_comm_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function rocfft_brick_create_assumed_rank(brick,field_lower,field_upper,brick_stride, &
        dim_with_batch,deviceID)
      use iso_c_binding
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_brick_create_assumed_rank
      type(rocfft_brick_t) :: brick
      integer(c_size_t),target,contiguous,dimension(..) :: field_lower
      integer(c_size_t),target,contiguous,dimension(..) :: field_upper
      integer(c_size_t),target,contiguous,dimension(..) :: brick_stride
      integer(c_size_t) :: dim_with_batch
      integer(c_int) :: deviceID
      !
      rocfft_brick_create_assumed_rank = rocfft_brick_create_(brick%ptr,c_loc(field_lower), &
        c_loc(field_upper),c_loc(brick_stride),dim_with_batch,deviceID)
    end function

    function rocfft_brick_create_assumed_rank_cptr(brick,field_lower,field_upper,brick_stride, &
        dim_with_batch,deviceID)
      use iso_c_binding
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_brick_create_assumed_rank_cptr
      type(c_ptr) :: brick
      integer(c_size_t),target,contiguous,dimension(..) :: field_lower
      integer(c_size_t),target,contiguous,dimension(..) :: field_upper
      integer(c_size_t),target,contiguous,dimension(..) :: brick_stride
      integer(c_size_t) :: dim_with_batch
      integer(c_int) :: deviceID
      !
      rocfft_brick_create_assumed_rank_cptr = rocfft_brick_create_(brick,c_loc(field_lower), &
        c_loc(field_upper),c_loc(brick_stride),dim_with_batch,deviceID)
    end function

#else
    function rocfft_brick_create_rank_0(brick,field_lower,field_upper,brick_stride,dim_with_batch, &
        deviceID)
      use iso_c_binding
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_brick_create_rank_0
      type(rocfft_brick_t) :: brick
      integer(c_size_t),target :: field_lower
      integer(c_size_t),target :: field_upper
      integer(c_size_t),target :: brick_stride
      integer(c_size_t) :: dim_with_batch
      integer(c_int) :: deviceID
      !
      rocfft_brick_create_rank_0 = rocfft_brick_create_(brick%ptr,c_loc(field_lower), &
        c_loc(field_upper),c_loc(brick_stride),dim_with_batch,deviceID)
    end function

    function rocfft_brick_create_rank_0_cptr(brick,field_lower,field_upper,brick_stride, &
        dim_with_batch,deviceID)
      use iso_c_binding
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_brick_create_rank_0_cptr
      type(c_ptr) :: brick
      integer(c_size_t),target :: field_lower
      integer(c_size_t),target :: field_upper
      integer(c_size_t),target :: brick_stride
      integer(c_size_t) :: dim_with_batch
      integer(c_int) :: deviceID
      !
      rocfft_brick_create_rank_0_cptr = rocfft_brick_create_(brick,c_loc(field_lower), &
        c_loc(field_upper),c_loc(brick_stride),dim_with_batch,deviceID)
    end function

    function rocfft_brick_create_rank_1(brick,field_lower,field_upper,brick_stride,dim_with_batch, &
        deviceID)
      use iso_c_binding
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_brick_create_rank_1
      type(rocfft_brick_t) :: brick
      integer(c_size_t),target,dimension(:) :: field_lower
      integer(c_size_t),target,dimension(:) :: field_upper
      integer(c_size_t),target,dimension(:) :: brick_stride
      integer(c_size_t) :: dim_with_batch
      integer(c_int) :: deviceID
      !
      rocfft_brick_create_rank_1 = rocfft_brick_create_(brick%ptr,c_loc(field_lower), &
        c_loc(field_upper),c_loc(brick_stride),dim_with_batch,deviceID)
    end function

    function rocfft_brick_create_rank_1_cptr(brick,field_lower,field_upper,brick_stride, &
        dim_with_batch,deviceID)
      use iso_c_binding
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_brick_create_rank_1_cptr
      type(c_ptr) :: brick
      integer(c_size_t),target,dimension(:) :: field_lower
      integer(c_size_t),target,dimension(:) :: field_upper
      integer(c_size_t),target,dimension(:) :: brick_stride
      integer(c_size_t) :: dim_with_batch
      integer(c_int) :: deviceID
      !
      rocfft_brick_create_rank_1_cptr = rocfft_brick_create_(brick,c_loc(field_lower), &
        c_loc(field_upper),c_loc(brick_stride),dim_with_batch,deviceID)
    end function

#endif
    function rocfft_brick_create_typed(brick, field_lower, field_upper, brick_stride, &
        dim_with_batch, deviceID) result(brick_create)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_brick_t) :: brick
      type(c_ptr), value :: field_lower
      type(c_ptr), value :: field_upper
      type(c_ptr), value :: brick_stride
      integer(c_size_t), value :: dim_with_batch
      integer(c_int), value :: deviceID
      integer(kind(rocfft_status_success)) :: brick_create
      brick_create = rocfft_brick_create_(brick%ptr, field_lower, field_upper, brick_stride, &
        dim_with_batch, deviceID)
    end function rocfft_brick_create_typed

    function rocfft_brick_destroy_typed(brick) result(brick_destroy)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_brick_t), value :: brick
      integer(kind(rocfft_status_success)) :: brick_destroy
      brick_destroy = rocfft_brick_destroy_(brick%ptr)
    end function rocfft_brick_destroy_typed

    function rocfft_field_add_brick_typed(field, brick) result(field_add_brick)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_field_t), value :: field
      type(rocfft_brick_t), value :: brick
      integer(kind(rocfft_status_success)) :: field_add_brick
      field_add_brick = rocfft_field_add_brick_(field%ptr, brick%ptr)
    end function rocfft_field_add_brick_typed

    function rocfft_plan_description_add_infield_typed(description, &
        field) result(plan_description_add_infield)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_plan_description_t), value :: description
      type(rocfft_field_t), value :: field
      integer(kind(rocfft_status_success)) :: plan_description_add_infield
      plan_description_add_infield = rocfft_plan_description_add_infield_(description%ptr, &
        field%ptr)
    end function rocfft_plan_description_add_infield_typed

    function rocfft_plan_description_add_outfield_typed(description, &
        field) result(plan_description_add_outfield)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_plan_description_t), value :: description
      type(rocfft_field_t), value :: field
      integer(kind(rocfft_status_success)) :: plan_description_add_outfield
      plan_description_add_outfield = rocfft_plan_description_add_outfield_(description%ptr, &
        field%ptr)
    end function rocfft_plan_description_add_outfield_typed

    function rocfft_plan_get_work_buffer_size_typed(plan, &
        size_in_bytes) result(plan_get_work_buffer_size)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_plan_t), value :: plan
      integer(c_size_t) :: size_in_bytes
      integer(kind(rocfft_status_success)) :: plan_get_work_buffer_size
      plan_get_work_buffer_size = rocfft_plan_get_work_buffer_size_(plan%ptr, size_in_bytes)
    end function rocfft_plan_get_work_buffer_size_typed

    function rocfft_plan_get_print_typed(plan) result(plan_get_print)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_plan_t), value :: plan
      integer(kind(rocfft_status_success)) :: plan_get_print
      plan_get_print = rocfft_plan_get_print_(plan%ptr)
    end function rocfft_plan_get_print_typed

    function rocfft_plan_description_create_typed(description) result(plan_description_create)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_plan_description_t) :: description
      integer(kind(rocfft_status_success)) :: plan_description_create
      plan_description_create = rocfft_plan_description_create_(description%ptr)
    end function rocfft_plan_description_create_typed

    function rocfft_plan_description_destroy_typed(description) result(plan_description_destroy)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_plan_description_t), value :: description
      integer(kind(rocfft_status_success)) :: plan_description_destroy
      plan_description_destroy = rocfft_plan_description_destroy_(description%ptr)
    end function rocfft_plan_description_destroy_typed

    function rocfft_execution_info_create_typed(myInfo) result(execution_info_create)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_execution_info_t) :: myInfo
      integer(kind(rocfft_status_success)) :: execution_info_create
      execution_info_create = rocfft_execution_info_create_(myInfo%ptr)
    end function rocfft_execution_info_create_typed

    function rocfft_execution_info_destroy_typed(myInfo) result(execution_info_destroy)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_execution_info_t), value :: myInfo
      integer(kind(rocfft_status_success)) :: execution_info_destroy
      execution_info_destroy = rocfft_execution_info_destroy_(myInfo%ptr)
    end function rocfft_execution_info_destroy_typed

    function rocfft_execution_info_set_work_buffer_typed(myInfo, work_buffer, &
        size_in_bytes) result(execution_info_set_work_buffer)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_execution_info_t), value :: myInfo
      type(c_ptr), value :: work_buffer
      integer(c_size_t), value :: size_in_bytes
      integer(kind(rocfft_status_success)) :: execution_info_set_work_buffer
      execution_info_set_work_buffer = rocfft_execution_info_set_work_buffer_(myInfo%ptr, &
        work_buffer, size_in_bytes)
    end function rocfft_execution_info_set_work_buffer_typed

    function rocfft_execution_info_set_stream_typed(myInfo, &
        stream) result(execution_info_set_stream)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_execution_info_t), value :: myInfo
      type(c_ptr), value :: stream
      integer(kind(rocfft_status_success)) :: execution_info_set_stream
      execution_info_set_stream = rocfft_execution_info_set_stream_(myInfo%ptr, stream)
    end function rocfft_execution_info_set_stream_typed

    function rocfft_execution_info_set_load_callback_typed(myInfo, cb_functions, cb_data, &
        shared_mem_bytes) result(execution_info_set_load_callback)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_execution_info_t), value :: myInfo
      type(c_ptr), value :: cb_functions
      type(c_ptr), value :: cb_data
      integer(c_size_t), value :: shared_mem_bytes
      integer(kind(rocfft_status_success)) :: execution_info_set_load_callback
      execution_info_set_load_callback = rocfft_execution_info_set_load_callback_(myInfo%ptr, &
        cb_functions, cb_data, shared_mem_bytes)
    end function rocfft_execution_info_set_load_callback_typed

    function rocfft_execution_info_set_store_callback_typed(myInfo, cb_functions, cb_data, &
        shared_mem_bytes) result(execution_info_set_store_callback)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocfft_execution_info_t), value :: myInfo
      type(c_ptr), value :: cb_functions
      type(c_ptr), value :: cb_data
      integer(c_size_t), value :: shared_mem_bytes
      integer(kind(rocfft_status_success)) :: execution_info_set_store_callback
      execution_info_set_store_callback = rocfft_execution_info_set_store_callback_(myInfo%ptr, &
        cb_functions, cb_data, shared_mem_bytes)
    end function rocfft_execution_info_set_store_callback_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function rocfft_cache_serialize_assumed_rank(buffer,buffer_len_bytes)
      use iso_c_binding
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_cache_serialize_assumed_rank
      type(c_ptr) :: buffer
      integer(c_size_t),target,contiguous,dimension(..) :: buffer_len_bytes
      !
      rocfft_cache_serialize_assumed_rank = rocfft_cache_serialize_(buffer,c_loc(buffer_len_bytes))
    end function

#else
    function rocfft_cache_serialize_rank_0(buffer,buffer_len_bytes)
      use iso_c_binding
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_cache_serialize_rank_0
      type(c_ptr) :: buffer
      integer(c_size_t),target :: buffer_len_bytes
      !
      rocfft_cache_serialize_rank_0 = rocfft_cache_serialize_(buffer,c_loc(buffer_len_bytes))
    end function

    function rocfft_cache_serialize_rank_1(buffer,buffer_len_bytes)
      use iso_c_binding
      implicit none
      integer(kind(rocfft_status_success)) :: rocfft_cache_serialize_rank_1
      type(c_ptr) :: buffer
      integer(c_size_t),target,dimension(:) :: buffer_len_bytes
      !
      rocfft_cache_serialize_rank_1 = rocfft_cache_serialize_(buffer,c_loc(buffer_len_bytes))
    end function

#endif
