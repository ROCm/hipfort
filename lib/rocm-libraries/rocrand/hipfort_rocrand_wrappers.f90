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

    function rocrand_create_generator_typed(generator, rng_type) result(create_generator)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t) :: generator
      integer(kind(ROCRAND_RNG_PSEUDO_DEFAULT)), value :: rng_type
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: create_generator
      create_generator = rocrand_create_generator_(generator%ptr, rng_type)
    end function rocrand_create_generator_typed

    function rocrand_create_generator_host_typed(generator, rng_type) result(create_generator_host)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t) :: generator
      integer(kind(ROCRAND_RNG_PSEUDO_DEFAULT)), value :: rng_type
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: create_generator_host
      create_generator_host = rocrand_create_generator_host_(generator%ptr, rng_type)
    end function rocrand_create_generator_host_typed

    function rocrand_create_generator_host_blocking_typed(generator, &
        rng_type) result(create_generator_host_blocking)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t) :: generator
      integer(kind(ROCRAND_RNG_PSEUDO_DEFAULT)), value :: rng_type
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: create_generator_host_blocking
      create_generator_host_blocking = rocrand_create_generator_host_blocking_(generator%ptr, &
        rng_type)
    end function rocrand_create_generator_host_blocking_typed

    function rocrand_destroy_generator_typed(generator) result(destroy_generator)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: destroy_generator
      destroy_generator = rocrand_destroy_generator_(generator%ptr)
    end function rocrand_destroy_generator_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function rocrand_generate_assumed_rank(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_assumed_rank
      type(rocrand_generator_t) :: generator
      integer(c_int),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      !
      rocrand_generate_assumed_rank = rocrand_generate_(generator%ptr,c_loc(output_data),n)
    end function

    function rocrand_generate_assumed_rank_cptr(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_assumed_rank_cptr
      type(c_ptr) :: generator
      integer(c_int),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      !
      rocrand_generate_assumed_rank_cptr = rocrand_generate_(generator,c_loc(output_data),n)
    end function

#else
    function rocrand_generate_rank_0(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_rank_0
      type(rocrand_generator_t) :: generator
      integer(c_int),target :: output_data
      integer(c_size_t) :: n
      !
      rocrand_generate_rank_0 = rocrand_generate_(generator%ptr,c_loc(output_data),n)
    end function

    function rocrand_generate_rank_0_cptr(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_rank_0_cptr
      type(c_ptr) :: generator
      integer(c_int),target :: output_data
      integer(c_size_t) :: n
      !
      rocrand_generate_rank_0_cptr = rocrand_generate_(generator,c_loc(output_data),n)
    end function

    function rocrand_generate_rank_1(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_rank_1
      type(rocrand_generator_t) :: generator
      integer(c_int),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      !
      rocrand_generate_rank_1 = rocrand_generate_(generator%ptr,c_loc(output_data),n)
    end function

    function rocrand_generate_rank_1_cptr(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_rank_1_cptr
      type(c_ptr) :: generator
      integer(c_int),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      !
      rocrand_generate_rank_1_cptr = rocrand_generate_(generator,c_loc(output_data),n)
    end function

#endif
    function rocrand_generate_typed(generator, output_data, n) result(generate)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_size_t), value :: n
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: generate
      generate = rocrand_generate_(generator%ptr, output_data, n)
    end function rocrand_generate_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function rocrand_generate_long_long_assumed_rank(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_long_long_assumed_rank
      type(rocrand_generator_t) :: generator
      integer(c_int64_t),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      !
      rocrand_generate_long_long_assumed_rank = rocrand_generate_long_long_(generator%ptr, &
        c_loc(output_data),n)
    end function

    function rocrand_generate_long_long_assumed_rank_cptr(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_long_long_assumed_rank_cptr
      type(c_ptr) :: generator
      integer(c_int64_t),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      !
      rocrand_generate_long_long_assumed_rank_cptr = rocrand_generate_long_long_(generator, &
        c_loc(output_data),n)
    end function

#else
    function rocrand_generate_long_long_rank_0(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_long_long_rank_0
      type(rocrand_generator_t) :: generator
      integer(c_int64_t),target :: output_data
      integer(c_size_t) :: n
      !
      rocrand_generate_long_long_rank_0 = rocrand_generate_long_long_(generator%ptr, &
        c_loc(output_data),n)
    end function

    function rocrand_generate_long_long_rank_0_cptr(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_long_long_rank_0_cptr
      type(c_ptr) :: generator
      integer(c_int64_t),target :: output_data
      integer(c_size_t) :: n
      !
      rocrand_generate_long_long_rank_0_cptr = rocrand_generate_long_long_(generator, &
        c_loc(output_data),n)
    end function

    function rocrand_generate_long_long_rank_1(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_long_long_rank_1
      type(rocrand_generator_t) :: generator
      integer(c_int64_t),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      !
      rocrand_generate_long_long_rank_1 = rocrand_generate_long_long_(generator%ptr, &
        c_loc(output_data),n)
    end function

    function rocrand_generate_long_long_rank_1_cptr(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_long_long_rank_1_cptr
      type(c_ptr) :: generator
      integer(c_int64_t),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      !
      rocrand_generate_long_long_rank_1_cptr = rocrand_generate_long_long_(generator, &
        c_loc(output_data),n)
    end function

#endif
    function rocrand_generate_long_long_typed(generator, output_data, n) result(generate_long_long)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_size_t), value :: n
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: generate_long_long
      generate_long_long = rocrand_generate_long_long_(generator%ptr, output_data, n)
    end function rocrand_generate_long_long_typed

    function rocrand_generate_char_typed(generator, output_data, n) result(generate_char)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_size_t), value :: n
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: generate_char
      generate_char = rocrand_generate_char_(generator%ptr, output_data, n)
    end function rocrand_generate_char_typed

    function rocrand_generate_short_typed(generator, output_data, n) result(generate_short)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_size_t), value :: n
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: generate_short
      generate_short = rocrand_generate_short_(generator%ptr, output_data, n)
    end function rocrand_generate_short_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function rocrand_generate_uniform_assumed_rank(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_uniform_assumed_rank
      type(rocrand_generator_t) :: generator
      real(c_float),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      !
      rocrand_generate_uniform_assumed_rank = rocrand_generate_uniform_(generator%ptr, &
        c_loc(output_data),n)
    end function

    function rocrand_generate_uniform_assumed_rank_cptr(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_uniform_assumed_rank_cptr
      type(c_ptr) :: generator
      real(c_float),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      !
      rocrand_generate_uniform_assumed_rank_cptr = rocrand_generate_uniform_(generator, &
        c_loc(output_data),n)
    end function

#else
    function rocrand_generate_uniform_rank_0(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_uniform_rank_0
      type(rocrand_generator_t) :: generator
      real(c_float),target :: output_data
      integer(c_size_t) :: n
      !
      rocrand_generate_uniform_rank_0 = rocrand_generate_uniform_(generator%ptr, &
        c_loc(output_data),n)
    end function

    function rocrand_generate_uniform_rank_0_cptr(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_uniform_rank_0_cptr
      type(c_ptr) :: generator
      real(c_float),target :: output_data
      integer(c_size_t) :: n
      !
      rocrand_generate_uniform_rank_0_cptr = rocrand_generate_uniform_(generator, &
        c_loc(output_data),n)
    end function

    function rocrand_generate_uniform_rank_1(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_uniform_rank_1
      type(rocrand_generator_t) :: generator
      real(c_float),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      !
      rocrand_generate_uniform_rank_1 = rocrand_generate_uniform_(generator%ptr, &
        c_loc(output_data),n)
    end function

    function rocrand_generate_uniform_rank_1_cptr(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_uniform_rank_1_cptr
      type(c_ptr) :: generator
      real(c_float),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      !
      rocrand_generate_uniform_rank_1_cptr = rocrand_generate_uniform_(generator, &
        c_loc(output_data),n)
    end function

#endif
    function rocrand_generate_uniform_typed(generator, output_data, n) result(generate_uniform)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_size_t), value :: n
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: generate_uniform
      generate_uniform = rocrand_generate_uniform_(generator%ptr, output_data, n)
    end function rocrand_generate_uniform_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function rocrand_generate_uniform_double_assumed_rank(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_uniform_double_assumed_rank
      type(rocrand_generator_t) :: generator
      real(c_double),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      !
      rocrand_generate_uniform_double_assumed_rank = rocrand_generate_uniform_double_( &
        generator%ptr,c_loc(output_data),n)
    end function

    function rocrand_generate_uniform_double_assumed_rank_cptr(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_uniform_double_assumed_rank_cptr
      type(c_ptr) :: generator
      real(c_double),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      !
      rocrand_generate_uniform_double_assumed_rank_cptr = rocrand_generate_uniform_double_( &
        generator,c_loc(output_data),n)
    end function

#else
    function rocrand_generate_uniform_double_rank_0(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_uniform_double_rank_0
      type(rocrand_generator_t) :: generator
      real(c_double),target :: output_data
      integer(c_size_t) :: n
      !
      rocrand_generate_uniform_double_rank_0 = rocrand_generate_uniform_double_(generator%ptr, &
        c_loc(output_data),n)
    end function

    function rocrand_generate_uniform_double_rank_0_cptr(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_uniform_double_rank_0_cptr
      type(c_ptr) :: generator
      real(c_double),target :: output_data
      integer(c_size_t) :: n
      !
      rocrand_generate_uniform_double_rank_0_cptr = rocrand_generate_uniform_double_(generator, &
        c_loc(output_data),n)
    end function

    function rocrand_generate_uniform_double_rank_1(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_uniform_double_rank_1
      type(rocrand_generator_t) :: generator
      real(c_double),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      !
      rocrand_generate_uniform_double_rank_1 = rocrand_generate_uniform_double_(generator%ptr, &
        c_loc(output_data),n)
    end function

    function rocrand_generate_uniform_double_rank_1_cptr(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_uniform_double_rank_1_cptr
      type(c_ptr) :: generator
      real(c_double),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      !
      rocrand_generate_uniform_double_rank_1_cptr = rocrand_generate_uniform_double_(generator, &
        c_loc(output_data),n)
    end function

#endif
    function rocrand_generate_uniform_double_typed(generator, output_data, &
        n) result(generate_uniform_double)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_size_t), value :: n
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: generate_uniform_double
      generate_uniform_double = rocrand_generate_uniform_double_(generator%ptr, output_data, n)
    end function rocrand_generate_uniform_double_typed

    function rocrand_generate_uniform_half_typed(generator, output_data, &
        n) result(generate_uniform_half)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_size_t), value :: n
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: generate_uniform_half
      generate_uniform_half = rocrand_generate_uniform_half_(generator%ptr, output_data, n)
    end function rocrand_generate_uniform_half_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function rocrand_generate_normal_assumed_rank(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_normal_assumed_rank
      type(rocrand_generator_t) :: generator
      real(c_float),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      real(c_float) :: mean
      real(c_float) :: stddev
      !
      rocrand_generate_normal_assumed_rank = rocrand_generate_normal_(generator%ptr, &
        c_loc(output_data),n,mean,stddev)
    end function

    function rocrand_generate_normal_assumed_rank_cptr(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_normal_assumed_rank_cptr
      type(c_ptr) :: generator
      real(c_float),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      real(c_float) :: mean
      real(c_float) :: stddev
      !
      rocrand_generate_normal_assumed_rank_cptr = rocrand_generate_normal_(generator, &
        c_loc(output_data),n,mean,stddev)
    end function

#else
    function rocrand_generate_normal_rank_0(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_normal_rank_0
      type(rocrand_generator_t) :: generator
      real(c_float),target :: output_data
      integer(c_size_t) :: n
      real(c_float) :: mean
      real(c_float) :: stddev
      !
      rocrand_generate_normal_rank_0 = rocrand_generate_normal_(generator%ptr,c_loc(output_data), &
        n,mean,stddev)
    end function

    function rocrand_generate_normal_rank_0_cptr(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_normal_rank_0_cptr
      type(c_ptr) :: generator
      real(c_float),target :: output_data
      integer(c_size_t) :: n
      real(c_float) :: mean
      real(c_float) :: stddev
      !
      rocrand_generate_normal_rank_0_cptr = rocrand_generate_normal_(generator,c_loc(output_data), &
        n,mean,stddev)
    end function

    function rocrand_generate_normal_rank_1(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_normal_rank_1
      type(rocrand_generator_t) :: generator
      real(c_float),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      real(c_float) :: mean
      real(c_float) :: stddev
      !
      rocrand_generate_normal_rank_1 = rocrand_generate_normal_(generator%ptr,c_loc(output_data), &
        n,mean,stddev)
    end function

    function rocrand_generate_normal_rank_1_cptr(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_normal_rank_1_cptr
      type(c_ptr) :: generator
      real(c_float),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      real(c_float) :: mean
      real(c_float) :: stddev
      !
      rocrand_generate_normal_rank_1_cptr = rocrand_generate_normal_(generator,c_loc(output_data), &
        n,mean,stddev)
    end function

#endif
    function rocrand_generate_normal_typed(generator, output_data, n, mean, &
        stddev) result(generate_normal)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_size_t), value :: n
      real(c_float), value :: mean
      real(c_float), value :: stddev
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: generate_normal
      generate_normal = rocrand_generate_normal_(generator%ptr, output_data, n, mean, stddev)
    end function rocrand_generate_normal_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function rocrand_generate_normal_double_assumed_rank(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_normal_double_assumed_rank
      type(rocrand_generator_t) :: generator
      real(c_double),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      real(c_double) :: mean
      real(c_double) :: stddev
      !
      rocrand_generate_normal_double_assumed_rank = rocrand_generate_normal_double_(generator%ptr, &
        c_loc(output_data),n,mean,stddev)
    end function

    function rocrand_generate_normal_double_assumed_rank_cptr(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_normal_double_assumed_rank_cptr
      type(c_ptr) :: generator
      real(c_double),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      real(c_double) :: mean
      real(c_double) :: stddev
      !
      rocrand_generate_normal_double_assumed_rank_cptr = rocrand_generate_normal_double_( &
        generator,c_loc(output_data),n,mean,stddev)
    end function

#else
    function rocrand_generate_normal_double_rank_0(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_normal_double_rank_0
      type(rocrand_generator_t) :: generator
      real(c_double),target :: output_data
      integer(c_size_t) :: n
      real(c_double) :: mean
      real(c_double) :: stddev
      !
      rocrand_generate_normal_double_rank_0 = rocrand_generate_normal_double_(generator%ptr, &
        c_loc(output_data),n,mean,stddev)
    end function

    function rocrand_generate_normal_double_rank_0_cptr(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_normal_double_rank_0_cptr
      type(c_ptr) :: generator
      real(c_double),target :: output_data
      integer(c_size_t) :: n
      real(c_double) :: mean
      real(c_double) :: stddev
      !
      rocrand_generate_normal_double_rank_0_cptr = rocrand_generate_normal_double_(generator, &
        c_loc(output_data),n,mean,stddev)
    end function

    function rocrand_generate_normal_double_rank_1(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_normal_double_rank_1
      type(rocrand_generator_t) :: generator
      real(c_double),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      real(c_double) :: mean
      real(c_double) :: stddev
      !
      rocrand_generate_normal_double_rank_1 = rocrand_generate_normal_double_(generator%ptr, &
        c_loc(output_data),n,mean,stddev)
    end function

    function rocrand_generate_normal_double_rank_1_cptr(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_normal_double_rank_1_cptr
      type(c_ptr) :: generator
      real(c_double),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      real(c_double) :: mean
      real(c_double) :: stddev
      !
      rocrand_generate_normal_double_rank_1_cptr = rocrand_generate_normal_double_(generator, &
        c_loc(output_data),n,mean,stddev)
    end function

#endif
    function rocrand_generate_normal_double_typed(generator, output_data, n, mean, &
        stddev) result(generate_normal_double)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_size_t), value :: n
      real(c_double), value :: mean
      real(c_double), value :: stddev
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: generate_normal_double
      generate_normal_double = rocrand_generate_normal_double_(generator%ptr, output_data, n, &
        mean, stddev)
    end function rocrand_generate_normal_double_typed

    function rocrand_generate_normal_half_typed(generator, output_data, n, mean, &
        stddev) result(generate_normal_half)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_size_t), value :: n
      integer(c_short), value :: mean
      integer(c_short), value :: stddev
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: generate_normal_half
      generate_normal_half = rocrand_generate_normal_half_(generator%ptr, output_data, n, mean, &
        stddev)
    end function rocrand_generate_normal_half_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function rocrand_generate_log_normal_assumed_rank(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_log_normal_assumed_rank
      type(rocrand_generator_t) :: generator
      real(c_float),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      real(c_float) :: mean
      real(c_float) :: stddev
      !
      rocrand_generate_log_normal_assumed_rank = rocrand_generate_log_normal_(generator%ptr, &
        c_loc(output_data),n,mean,stddev)
    end function

    function rocrand_generate_log_normal_assumed_rank_cptr(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_log_normal_assumed_rank_cptr
      type(c_ptr) :: generator
      real(c_float),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      real(c_float) :: mean
      real(c_float) :: stddev
      !
      rocrand_generate_log_normal_assumed_rank_cptr = rocrand_generate_log_normal_(generator, &
        c_loc(output_data),n,mean,stddev)
    end function

#else
    function rocrand_generate_log_normal_rank_0(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_log_normal_rank_0
      type(rocrand_generator_t) :: generator
      real(c_float),target :: output_data
      integer(c_size_t) :: n
      real(c_float) :: mean
      real(c_float) :: stddev
      !
      rocrand_generate_log_normal_rank_0 = rocrand_generate_log_normal_(generator%ptr, &
        c_loc(output_data),n,mean,stddev)
    end function

    function rocrand_generate_log_normal_rank_0_cptr(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_log_normal_rank_0_cptr
      type(c_ptr) :: generator
      real(c_float),target :: output_data
      integer(c_size_t) :: n
      real(c_float) :: mean
      real(c_float) :: stddev
      !
      rocrand_generate_log_normal_rank_0_cptr = rocrand_generate_log_normal_(generator, &
        c_loc(output_data),n,mean,stddev)
    end function

    function rocrand_generate_log_normal_rank_1(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_log_normal_rank_1
      type(rocrand_generator_t) :: generator
      real(c_float),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      real(c_float) :: mean
      real(c_float) :: stddev
      !
      rocrand_generate_log_normal_rank_1 = rocrand_generate_log_normal_(generator%ptr, &
        c_loc(output_data),n,mean,stddev)
    end function

    function rocrand_generate_log_normal_rank_1_cptr(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_log_normal_rank_1_cptr
      type(c_ptr) :: generator
      real(c_float),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      real(c_float) :: mean
      real(c_float) :: stddev
      !
      rocrand_generate_log_normal_rank_1_cptr = rocrand_generate_log_normal_(generator, &
        c_loc(output_data),n,mean,stddev)
    end function

#endif
    function rocrand_generate_log_normal_typed(generator, output_data, n, mean, &
        stddev) result(generate_log_normal)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_size_t), value :: n
      real(c_float), value :: mean
      real(c_float), value :: stddev
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: generate_log_normal
      generate_log_normal = rocrand_generate_log_normal_(generator%ptr, output_data, n, mean, &
        stddev)
    end function rocrand_generate_log_normal_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function rocrand_generate_log_normal_double_assumed_rank(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_log_normal_double_assumed_rank
      type(rocrand_generator_t) :: generator
      real(c_double),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      real(c_double) :: mean
      real(c_double) :: stddev
      !
      rocrand_generate_log_normal_double_assumed_rank = rocrand_generate_log_normal_double_( &
        generator%ptr,c_loc(output_data),n,mean,stddev)
    end function

    function rocrand_generate_log_normal_double_assumed_rank_cptr(generator,output_data,n,mean, &
        stddev)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_log_normal_double_assumed_rank_cptr
      type(c_ptr) :: generator
      real(c_double),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      real(c_double) :: mean
      real(c_double) :: stddev
      !
      rocrand_generate_log_normal_double_assumed_rank_cptr = rocrand_generate_log_normal_double_( &
        generator,c_loc(output_data),n,mean,stddev)
    end function

#else
    function rocrand_generate_log_normal_double_rank_0(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_log_normal_double_rank_0
      type(rocrand_generator_t) :: generator
      real(c_double),target :: output_data
      integer(c_size_t) :: n
      real(c_double) :: mean
      real(c_double) :: stddev
      !
      rocrand_generate_log_normal_double_rank_0 = rocrand_generate_log_normal_double_( &
        generator%ptr,c_loc(output_data),n,mean,stddev)
    end function

    function rocrand_generate_log_normal_double_rank_0_cptr(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_log_normal_double_rank_0_cptr
      type(c_ptr) :: generator
      real(c_double),target :: output_data
      integer(c_size_t) :: n
      real(c_double) :: mean
      real(c_double) :: stddev
      !
      rocrand_generate_log_normal_double_rank_0_cptr = rocrand_generate_log_normal_double_( &
        generator,c_loc(output_data),n,mean,stddev)
    end function

    function rocrand_generate_log_normal_double_rank_1(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_log_normal_double_rank_1
      type(rocrand_generator_t) :: generator
      real(c_double),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      real(c_double) :: mean
      real(c_double) :: stddev
      !
      rocrand_generate_log_normal_double_rank_1 = rocrand_generate_log_normal_double_( &
        generator%ptr,c_loc(output_data),n,mean,stddev)
    end function

    function rocrand_generate_log_normal_double_rank_1_cptr(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_log_normal_double_rank_1_cptr
      type(c_ptr) :: generator
      real(c_double),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      real(c_double) :: mean
      real(c_double) :: stddev
      !
      rocrand_generate_log_normal_double_rank_1_cptr = rocrand_generate_log_normal_double_( &
        generator,c_loc(output_data),n,mean,stddev)
    end function

#endif
    function rocrand_generate_log_normal_double_typed(generator, output_data, n, mean, &
        stddev) result(generate_log_normal_double)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_size_t), value :: n
      real(c_double), value :: mean
      real(c_double), value :: stddev
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: generate_log_normal_double
      generate_log_normal_double = rocrand_generate_log_normal_double_(generator%ptr, output_data, &
        n, mean, stddev)
    end function rocrand_generate_log_normal_double_typed

    function rocrand_generate_log_normal_half_typed(generator, output_data, n, mean, &
        stddev) result(generate_log_normal_half)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_size_t), value :: n
      integer(c_short), value :: mean
      integer(c_short), value :: stddev
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: generate_log_normal_half
      generate_log_normal_half = rocrand_generate_log_normal_half_(generator%ptr, output_data, n, &
        mean, stddev)
    end function rocrand_generate_log_normal_half_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function rocrand_generate_poisson_assumed_rank(generator,output_data,n,lambda)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_poisson_assumed_rank
      type(rocrand_generator_t) :: generator
      integer(c_int),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      real(c_double) :: lambda
      !
      rocrand_generate_poisson_assumed_rank = rocrand_generate_poisson_(generator%ptr, &
        c_loc(output_data),n,lambda)
    end function

    function rocrand_generate_poisson_assumed_rank_cptr(generator,output_data,n,lambda)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_poisson_assumed_rank_cptr
      type(c_ptr) :: generator
      integer(c_int),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      real(c_double) :: lambda
      !
      rocrand_generate_poisson_assumed_rank_cptr = rocrand_generate_poisson_(generator, &
        c_loc(output_data),n,lambda)
    end function

#else
    function rocrand_generate_poisson_rank_0(generator,output_data,n,lambda)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_poisson_rank_0
      type(rocrand_generator_t) :: generator
      integer(c_int),target :: output_data
      integer(c_size_t) :: n
      real(c_double) :: lambda
      !
      rocrand_generate_poisson_rank_0 = rocrand_generate_poisson_(generator%ptr, &
        c_loc(output_data),n,lambda)
    end function

    function rocrand_generate_poisson_rank_0_cptr(generator,output_data,n,lambda)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_poisson_rank_0_cptr
      type(c_ptr) :: generator
      integer(c_int),target :: output_data
      integer(c_size_t) :: n
      real(c_double) :: lambda
      !
      rocrand_generate_poisson_rank_0_cptr = rocrand_generate_poisson_(generator, &
        c_loc(output_data),n,lambda)
    end function

    function rocrand_generate_poisson_rank_1(generator,output_data,n,lambda)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_poisson_rank_1
      type(rocrand_generator_t) :: generator
      integer(c_int),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      real(c_double) :: lambda
      !
      rocrand_generate_poisson_rank_1 = rocrand_generate_poisson_(generator%ptr, &
        c_loc(output_data),n,lambda)
    end function

    function rocrand_generate_poisson_rank_1_cptr(generator,output_data,n,lambda)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_generate_poisson_rank_1_cptr
      type(c_ptr) :: generator
      integer(c_int),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      real(c_double) :: lambda
      !
      rocrand_generate_poisson_rank_1_cptr = rocrand_generate_poisson_(generator, &
        c_loc(output_data),n,lambda)
    end function

#endif
    function rocrand_generate_poisson_typed(generator, output_data, n, &
        lambda) result(generate_poisson)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_size_t), value :: n
      real(c_double), value :: lambda
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: generate_poisson
      generate_poisson = rocrand_generate_poisson_(generator%ptr, output_data, n, lambda)
    end function rocrand_generate_poisson_typed

    function rocrand_initialize_generator_typed(generator) result(initialize_generator)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: initialize_generator
      initialize_generator = rocrand_initialize_generator_(generator%ptr)
    end function rocrand_initialize_generator_typed

    function rocrand_set_stream_typed(generator, stream) result(set_stream)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      type(c_ptr), value :: stream
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: set_stream
      set_stream = rocrand_set_stream_(generator%ptr, stream)
    end function rocrand_set_stream_typed

    function rocrand_set_seed_typed(generator, seed) result(set_seed)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      integer(c_int64_t), value :: seed
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: set_seed
      set_seed = rocrand_set_seed_(generator%ptr, seed)
    end function rocrand_set_seed_typed

    function rocrand_set_seed_uint4_typed(generator, seed) result(set_seed_uint4)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      type(uint4), value :: seed
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: set_seed_uint4
      set_seed_uint4 = rocrand_set_seed_uint4_(generator%ptr, seed)
    end function rocrand_set_seed_uint4_typed

    function rocrand_set_offset_typed(generator, offset) result(set_offset)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      integer(c_int64_t), value :: offset
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: set_offset
      set_offset = rocrand_set_offset_(generator%ptr, offset)
    end function rocrand_set_offset_typed

    function rocrand_set_ordering_typed(generator, order) result(set_ordering)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      integer(kind(ROCRAND_ORDERING_PSEUDO_BEST)), value :: order
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: set_ordering
      set_ordering = rocrand_set_ordering_(generator%ptr, order)
    end function rocrand_set_ordering_typed

    function rocrand_set_quasi_random_generator_dimensions_typed(generator, &
        dimensions) result(set_quasi_random_generator_dimensions)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      integer(c_int), value :: dimensions
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: set_quasi_random_generator_dimensions
      set_quasi_random_generator_dimensions = rocrand_set_quasi_random_generator_dimensions_( &
        generator%ptr, dimensions)
    end function rocrand_set_quasi_random_generator_dimensions_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function rocrand_create_discrete_distribution_assumed_rank(probabilities,mySize,offset, &
        discrete_distribution)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_create_discrete_distribution_assumed_rank
      real(c_double),target,contiguous,dimension(..) :: probabilities
      integer(c_int) :: mySize
      integer(c_int) :: offset
      type(c_ptr) :: discrete_distribution
      !
      rocrand_create_discrete_distribution_assumed_rank = rocrand_create_discrete_distribution_( &
        c_loc(probabilities),mySize,offset,discrete_distribution)
    end function

#else
    function rocrand_create_discrete_distribution_rank_0(probabilities,mySize,offset, &
        discrete_distribution)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_create_discrete_distribution_rank_0
      real(c_double),target :: probabilities
      integer(c_int) :: mySize
      integer(c_int) :: offset
      type(c_ptr) :: discrete_distribution
      !
      rocrand_create_discrete_distribution_rank_0 = rocrand_create_discrete_distribution_(c_loc( &
        probabilities),mySize,offset,discrete_distribution)
    end function

    function rocrand_create_discrete_distribution_rank_1(probabilities,mySize,offset, &
        discrete_distribution)
      use iso_c_binding
      implicit none
      integer(kind(ROCRAND_STATUS_SUCCESS)) :: rocrand_create_discrete_distribution_rank_1
      real(c_double),target,dimension(:) :: probabilities
      integer(c_int) :: mySize
      integer(c_int) :: offset
      type(c_ptr) :: discrete_distribution
      !
      rocrand_create_discrete_distribution_rank_1 = rocrand_create_discrete_distribution_(c_loc( &
        probabilities),mySize,offset,discrete_distribution)
    end function

#endif
