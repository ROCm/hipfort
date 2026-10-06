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

program test_rocrand
  use iso_c_binding
  use hipfort_rocrand
  use hipfort_rocrand_enums
  use hipfort_rocrand_types
  implicit none
  logical :: never
  type(c_ptr) :: v0
  integer(kind(ROCRAND_RNG_PSEUDO_DEFAULT)) :: v1
  integer(kind(ROCRAND_STATUS_SUCCESS)) :: v2
  integer(c_size_t) :: v3
  real(c_float) :: v4
  real(c_double) :: v5
  integer(c_short) :: v6
  integer(c_int64_t) :: v7
  type(uint4) :: v8
  integer(kind(ROCRAND_ORDERING_PSEUDO_BEST)) :: v9
  integer(c_int) :: v10
  integer(kind(ROCRAND_DIRECTION_VECTORS_32_JOEKUO6)) :: v11

  ! Always .false., but not foldable by the compiler, so every guarded
  ! call is compiled and linked yet never run (no null-pointer segfaults).
  never = command_argument_count() > 1000000

    if (never) v2 = rocrand_create_generator_(v0, v1)
    if (never) v2 = rocrand_create_generator_host_(v0, v1)
    if (never) v2 = rocrand_create_generator_host_blocking_(v0, v1)
    if (never) v2 = rocrand_destroy_generator_(v0)
    if (never) v2 = rocrand_generate_(v0, v0, v3)
    if (never) v2 = rocrand_generate_long_long_(v0, v0, v3)
    if (never) v2 = rocrand_generate_char_(v0, v0, v3)
    if (never) v2 = rocrand_generate_short_(v0, v0, v3)
    if (never) v2 = rocrand_generate_uniform_(v0, v0, v3)
    if (never) v2 = rocrand_generate_uniform_double_(v0, v0, v3)
    if (never) v2 = rocrand_generate_uniform_half_(v0, v0, v3)
    if (never) v2 = rocrand_generate_normal_(v0, v0, v3, v4, v4)
    if (never) v2 = rocrand_generate_normal_double_(v0, v0, v3, v5, v5)
    if (never) v2 = rocrand_generate_normal_half_(v0, v0, v3, v6, v6)
    if (never) v2 = rocrand_generate_log_normal_(v0, v0, v3, v4, v4)
    if (never) v2 = rocrand_generate_log_normal_double_(v0, v0, v3, v5, v5)
    if (never) v2 = rocrand_generate_log_normal_half_(v0, v0, v3, v6, v6)
    if (never) v2 = rocrand_generate_poisson_(v0, v0, v3, v5)
    if (never) v2 = rocrand_initialize_generator_(v0)
    if (never) v2 = rocrand_set_stream_(v0, v0)
    if (never) v2 = rocrand_set_seed_(v0, v7)
    if (never) v2 = rocrand_set_seed_uint4_(v0, v8)
    if (never) v2 = rocrand_set_offset_(v0, v7)
    if (never) v2 = rocrand_set_ordering_(v0, v9)
    if (never) v2 = rocrand_set_quasi_random_generator_dimensions_(v0, v10)
    if (never) v2 = rocrand_get_version_(v0)
    if (never) v2 = rocrand_create_poisson_distribution_(v5, v0)
    if (never) v2 = rocrand_create_discrete_distribution_(v0, v10, v10, v0)
    if (never) v2 = rocrand_destroy_discrete_distribution_(v0)
    if (never) v2 = rocrand_get_direction_vectors32_(v0, v11)
    if (never) v2 = rocrand_get_direction_vectors64_(v0, v11)
    if (never) v2 = rocrand_get_scramble_constants32_(v0)
    if (never) v2 = rocrand_get_scramble_constants64_(v0)

  write(*,"(a)") "-- test_rocrand (bind(C) symbols): PASSED (compile+link only)!"
end program test_rocrand
