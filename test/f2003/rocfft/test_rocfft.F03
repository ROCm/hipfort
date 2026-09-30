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

program test_rocfft
  use iso_c_binding
  use hipfort_rocfft
  use hipfort_rocfft_enums
  implicit none
  logical :: never
  integer(kind(rocfft_status_success)) :: v0
  type(c_ptr) :: v1
  integer(kind(rocfft_placement_inplace)) :: v2
  integer(kind(rocfft_transform_type_complex_forward)) :: v3
  integer(kind(rocfft_precision_single)) :: v4
  integer(c_size_t) :: v5
  real(c_double) :: v6
  integer(kind(rocfft_array_type_complex_interleaved)) :: v7
  integer(kind(rocfft_comm_none)) :: v8
  integer(c_int) :: v9

  ! Always .false., but not foldable by the compiler, so every guarded
  ! call is compiled and linked yet never run (no null-pointer segfaults).
  never = command_argument_count() > 1000000

    if (never) v0 = rocfft_setup_()
    if (never) v0 = rocfft_cleanup_()
    if (never) v0 = rocfft_plan_create_(v1, v2, v3, v4, v5, v1, v5, v1)
    if (never) v0 = rocfft_execute_(v1, v1, v1, v1)
    if (never) v0 = rocfft_plan_destroy_(v1)
    if (never) v0 = rocfft_plan_description_set_scale_factor_(v1, v6)
    if (never) v0 = rocfft_plan_description_set_data_layout_(v1, v7, v7, v1, v1, v5, v1, v5, v5, v1, v5)
    if (never) v0 = rocfft_field_create_(v1)
    if (never) v0 = rocfft_field_destroy_(v1)
    if (never) v0 = rocfft_get_version_string_(v1, v5)
    if (never) v0 = rocfft_plan_description_set_comm_(v1, v8, v1)
    if (never) v0 = rocfft_brick_create_(v1, v1, v1, v1, v5, v9)
    if (never) v0 = rocfft_brick_destroy_(v1)
    if (never) v0 = rocfft_field_add_brick_(v1, v1)
    if (never) v0 = rocfft_plan_description_add_infield_(v1, v1)
    if (never) v0 = rocfft_plan_description_add_outfield_(v1, v1)
    if (never) v0 = rocfft_plan_get_work_buffer_size_(v1, v5)
    if (never) v0 = rocfft_plan_get_print_(v1)
    if (never) v0 = rocfft_plan_description_create_(v1)
    if (never) v0 = rocfft_plan_description_destroy_(v1)
    if (never) v0 = rocfft_execution_info_create_(v1)
    if (never) v0 = rocfft_execution_info_destroy_(v1)
    if (never) v0 = rocfft_execution_info_set_work_buffer_(v1, v1, v5)
    if (never) v0 = rocfft_execution_info_set_stream_(v1, v1)
    if (never) v0 = rocfft_execution_info_set_load_callback_(v1, v1, v1, v5)
    if (never) v0 = rocfft_execution_info_set_store_callback_(v1, v1, v1, v5)
    if (never) v0 = rocfft_cache_serialize_(v1, v1)
    if (never) v0 = rocfft_cache_buffer_free_(v1)
    if (never) v0 = rocfft_cache_deserialize_(v1, v5)

  write(*,"(a)") "-- test_rocfft (bind(C) symbols): PASSED (compile+link only)!"
end program test_rocfft
