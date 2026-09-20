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

    function hiprandCreateGenerator_typed(generator, rng_type) result(CreateGenerator)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t) :: generator
      integer(kind(HIPRAND_RNG_TEST)), value :: rng_type
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: CreateGenerator
      CreateGenerator = hiprandCreateGenerator_(generator%ptr, rng_type)
    end function hiprandCreateGenerator_typed

    function hiprandCreateGeneratorHost_typed(generator, rng_type) result(CreateGeneratorHost)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t) :: generator
      integer(kind(HIPRAND_RNG_TEST)), value :: rng_type
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: CreateGeneratorHost
      CreateGeneratorHost = hiprandCreateGeneratorHost_(generator%ptr, rng_type)
    end function hiprandCreateGeneratorHost_typed

    function hiprandDestroyGenerator_typed(generator) result(DestroyGenerator)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: DestroyGenerator
      DestroyGenerator = hiprandDestroyGenerator_(generator%ptr)
    end function hiprandDestroyGenerator_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hiprandGenerate_assumed_rank(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerate_assumed_rank
      type(hiprandGenerator_t) :: generator
      integer(c_int),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      !
      hiprandGenerate_assumed_rank = hiprandGenerate_(generator%ptr,c_loc(output_data),n)
    end function

    function hiprandGenerate_assumed_rank_cptr(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerate_assumed_rank_cptr
      type(c_ptr) :: generator
      integer(c_int),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      !
      hiprandGenerate_assumed_rank_cptr = hiprandGenerate_(generator,c_loc(output_data),n)
    end function

#else
    function hiprandGenerate_rank_0(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerate_rank_0
      type(hiprandGenerator_t) :: generator
      integer(c_int),target :: output_data
      integer(c_size_t) :: n
      !
      hiprandGenerate_rank_0 = hiprandGenerate_(generator%ptr,c_loc(output_data),n)
    end function

    function hiprandGenerate_rank_0_cptr(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerate_rank_0_cptr
      type(c_ptr) :: generator
      integer(c_int),target :: output_data
      integer(c_size_t) :: n
      !
      hiprandGenerate_rank_0_cptr = hiprandGenerate_(generator,c_loc(output_data),n)
    end function

    function hiprandGenerate_rank_1(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerate_rank_1
      type(hiprandGenerator_t) :: generator
      integer(c_int),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      !
      hiprandGenerate_rank_1 = hiprandGenerate_(generator%ptr,c_loc(output_data),n)
    end function

    function hiprandGenerate_rank_1_cptr(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerate_rank_1_cptr
      type(c_ptr) :: generator
      integer(c_int),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      !
      hiprandGenerate_rank_1_cptr = hiprandGenerate_(generator,c_loc(output_data),n)
    end function

#endif
    function hiprandGenerate_typed(generator, output_data, n) result(Generate)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_size_t), value :: n
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: Generate
      Generate = hiprandGenerate_(generator%ptr, output_data, n)
    end function hiprandGenerate_typed

    function hiprandGenerateChar_typed(generator, output_data, n) result(GenerateChar)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_size_t), value :: n
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: GenerateChar
      GenerateChar = hiprandGenerateChar_(generator%ptr, output_data, n)
    end function hiprandGenerateChar_typed

    function hiprandGenerateShort_typed(generator, output_data, n) result(GenerateShort)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_size_t), value :: n
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: GenerateShort
      GenerateShort = hiprandGenerateShort_(generator%ptr, output_data, n)
    end function hiprandGenerateShort_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hiprandGenerateLongLong_assumed_rank(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateLongLong_assumed_rank
      type(hiprandGenerator_t) :: generator
      integer(c_int64_t),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      !
      hiprandGenerateLongLong_assumed_rank = hiprandGenerateLongLong_(generator%ptr, &
        c_loc(output_data),n)
    end function

    function hiprandGenerateLongLong_assumed_rank_cptr(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateLongLong_assumed_rank_cptr
      type(c_ptr) :: generator
      integer(c_int64_t),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      !
      hiprandGenerateLongLong_assumed_rank_cptr = hiprandGenerateLongLong_(generator, &
        c_loc(output_data),n)
    end function

#else
    function hiprandGenerateLongLong_rank_0(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateLongLong_rank_0
      type(hiprandGenerator_t) :: generator
      integer(c_int64_t),target :: output_data
      integer(c_size_t) :: n
      !
      hiprandGenerateLongLong_rank_0 = hiprandGenerateLongLong_(generator%ptr,c_loc(output_data),n)
    end function

    function hiprandGenerateLongLong_rank_0_cptr(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateLongLong_rank_0_cptr
      type(c_ptr) :: generator
      integer(c_int64_t),target :: output_data
      integer(c_size_t) :: n
      !
      hiprandGenerateLongLong_rank_0_cptr = hiprandGenerateLongLong_(generator,c_loc(output_data),n)
    end function

    function hiprandGenerateLongLong_rank_1(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateLongLong_rank_1
      type(hiprandGenerator_t) :: generator
      integer(c_int64_t),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      !
      hiprandGenerateLongLong_rank_1 = hiprandGenerateLongLong_(generator%ptr,c_loc(output_data),n)
    end function

    function hiprandGenerateLongLong_rank_1_cptr(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateLongLong_rank_1_cptr
      type(c_ptr) :: generator
      integer(c_int64_t),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      !
      hiprandGenerateLongLong_rank_1_cptr = hiprandGenerateLongLong_(generator,c_loc(output_data),n)
    end function

#endif
    function hiprandGenerateLongLong_typed(generator, output_data, n) result(GenerateLongLong)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_size_t), value :: n
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: GenerateLongLong
      GenerateLongLong = hiprandGenerateLongLong_(generator%ptr, output_data, n)
    end function hiprandGenerateLongLong_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hiprandGenerateUniform_assumed_rank(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateUniform_assumed_rank
      type(hiprandGenerator_t) :: generator
      real(c_float),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      !
      hiprandGenerateUniform_assumed_rank = hiprandGenerateUniform_(generator%ptr, &
        c_loc(output_data),n)
    end function

    function hiprandGenerateUniform_assumed_rank_cptr(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateUniform_assumed_rank_cptr
      type(c_ptr) :: generator
      real(c_float),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      !
      hiprandGenerateUniform_assumed_rank_cptr = hiprandGenerateUniform_(generator, &
        c_loc(output_data),n)
    end function

#else
    function hiprandGenerateUniform_rank_0(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateUniform_rank_0
      type(hiprandGenerator_t) :: generator
      real(c_float),target :: output_data
      integer(c_size_t) :: n
      !
      hiprandGenerateUniform_rank_0 = hiprandGenerateUniform_(generator%ptr,c_loc(output_data),n)
    end function

    function hiprandGenerateUniform_rank_0_cptr(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateUniform_rank_0_cptr
      type(c_ptr) :: generator
      real(c_float),target :: output_data
      integer(c_size_t) :: n
      !
      hiprandGenerateUniform_rank_0_cptr = hiprandGenerateUniform_(generator,c_loc(output_data),n)
    end function

    function hiprandGenerateUniform_rank_1(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateUniform_rank_1
      type(hiprandGenerator_t) :: generator
      real(c_float),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      !
      hiprandGenerateUniform_rank_1 = hiprandGenerateUniform_(generator%ptr,c_loc(output_data),n)
    end function

    function hiprandGenerateUniform_rank_1_cptr(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateUniform_rank_1_cptr
      type(c_ptr) :: generator
      real(c_float),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      !
      hiprandGenerateUniform_rank_1_cptr = hiprandGenerateUniform_(generator,c_loc(output_data),n)
    end function

#endif
    function hiprandGenerateUniform_typed(generator, output_data, n) result(GenerateUniform)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_size_t), value :: n
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: GenerateUniform
      GenerateUniform = hiprandGenerateUniform_(generator%ptr, output_data, n)
    end function hiprandGenerateUniform_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hiprandGenerateUniformDouble_assumed_rank(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateUniformDouble_assumed_rank
      type(hiprandGenerator_t) :: generator
      real(c_double),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      !
      hiprandGenerateUniformDouble_assumed_rank = hiprandGenerateUniformDouble_(generator%ptr, &
        c_loc(output_data),n)
    end function

    function hiprandGenerateUniformDouble_assumed_rank_cptr(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateUniformDouble_assumed_rank_cptr
      type(c_ptr) :: generator
      real(c_double),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      !
      hiprandGenerateUniformDouble_assumed_rank_cptr = hiprandGenerateUniformDouble_(generator, &
        c_loc(output_data),n)
    end function

#else
    function hiprandGenerateUniformDouble_rank_0(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateUniformDouble_rank_0
      type(hiprandGenerator_t) :: generator
      real(c_double),target :: output_data
      integer(c_size_t) :: n
      !
      hiprandGenerateUniformDouble_rank_0 = hiprandGenerateUniformDouble_(generator%ptr, &
        c_loc(output_data),n)
    end function

    function hiprandGenerateUniformDouble_rank_0_cptr(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateUniformDouble_rank_0_cptr
      type(c_ptr) :: generator
      real(c_double),target :: output_data
      integer(c_size_t) :: n
      !
      hiprandGenerateUniformDouble_rank_0_cptr = hiprandGenerateUniformDouble_(generator, &
        c_loc(output_data),n)
    end function

    function hiprandGenerateUniformDouble_rank_1(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateUniformDouble_rank_1
      type(hiprandGenerator_t) :: generator
      real(c_double),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      !
      hiprandGenerateUniformDouble_rank_1 = hiprandGenerateUniformDouble_(generator%ptr, &
        c_loc(output_data),n)
    end function

    function hiprandGenerateUniformDouble_rank_1_cptr(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateUniformDouble_rank_1_cptr
      type(c_ptr) :: generator
      real(c_double),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      !
      hiprandGenerateUniformDouble_rank_1_cptr = hiprandGenerateUniformDouble_(generator, &
        c_loc(output_data),n)
    end function

#endif
    function hiprandGenerateUniformDouble_typed(generator, output_data, &
        n) result(GenerateUniformDouble)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_size_t), value :: n
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: GenerateUniformDouble
      GenerateUniformDouble = hiprandGenerateUniformDouble_(generator%ptr, output_data, n)
    end function hiprandGenerateUniformDouble_typed

    function hiprandGenerateUniformHalf_typed(generator, output_data, n) result(GenerateUniformHalf)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_size_t), value :: n
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: GenerateUniformHalf
      GenerateUniformHalf = hiprandGenerateUniformHalf_(generator%ptr, output_data, n)
    end function hiprandGenerateUniformHalf_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hiprandGenerateNormal_assumed_rank(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateNormal_assumed_rank
      type(hiprandGenerator_t) :: generator
      real(c_float),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      real(c_float) :: mean
      real(c_float) :: stddev
      !
      hiprandGenerateNormal_assumed_rank = hiprandGenerateNormal_(generator%ptr, &
        c_loc(output_data),n,mean,stddev)
    end function

    function hiprandGenerateNormal_assumed_rank_cptr(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateNormal_assumed_rank_cptr
      type(c_ptr) :: generator
      real(c_float),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      real(c_float) :: mean
      real(c_float) :: stddev
      !
      hiprandGenerateNormal_assumed_rank_cptr = hiprandGenerateNormal_(generator, &
        c_loc(output_data),n,mean,stddev)
    end function

#else
    function hiprandGenerateNormal_rank_0(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateNormal_rank_0
      type(hiprandGenerator_t) :: generator
      real(c_float),target :: output_data
      integer(c_size_t) :: n
      real(c_float) :: mean
      real(c_float) :: stddev
      !
      hiprandGenerateNormal_rank_0 = hiprandGenerateNormal_(generator%ptr,c_loc(output_data),n, &
        mean,stddev)
    end function

    function hiprandGenerateNormal_rank_0_cptr(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateNormal_rank_0_cptr
      type(c_ptr) :: generator
      real(c_float),target :: output_data
      integer(c_size_t) :: n
      real(c_float) :: mean
      real(c_float) :: stddev
      !
      hiprandGenerateNormal_rank_0_cptr = hiprandGenerateNormal_(generator,c_loc(output_data),n, &
        mean,stddev)
    end function

    function hiprandGenerateNormal_rank_1(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateNormal_rank_1
      type(hiprandGenerator_t) :: generator
      real(c_float),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      real(c_float) :: mean
      real(c_float) :: stddev
      !
      hiprandGenerateNormal_rank_1 = hiprandGenerateNormal_(generator%ptr,c_loc(output_data),n, &
        mean,stddev)
    end function

    function hiprandGenerateNormal_rank_1_cptr(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateNormal_rank_1_cptr
      type(c_ptr) :: generator
      real(c_float),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      real(c_float) :: mean
      real(c_float) :: stddev
      !
      hiprandGenerateNormal_rank_1_cptr = hiprandGenerateNormal_(generator,c_loc(output_data),n, &
        mean,stddev)
    end function

#endif
    function hiprandGenerateNormal_typed(generator, output_data, n, mean, &
        stddev) result(GenerateNormal)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_size_t), value :: n
      real(c_float), value :: mean
      real(c_float), value :: stddev
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: GenerateNormal
      GenerateNormal = hiprandGenerateNormal_(generator%ptr, output_data, n, mean, stddev)
    end function hiprandGenerateNormal_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hiprandGenerateNormalDouble_assumed_rank(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateNormalDouble_assumed_rank
      type(hiprandGenerator_t) :: generator
      real(c_double),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      real(c_double) :: mean
      real(c_double) :: stddev
      !
      hiprandGenerateNormalDouble_assumed_rank = hiprandGenerateNormalDouble_(generator%ptr, &
        c_loc(output_data),n,mean,stddev)
    end function

    function hiprandGenerateNormalDouble_assumed_rank_cptr(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateNormalDouble_assumed_rank_cptr
      type(c_ptr) :: generator
      real(c_double),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      real(c_double) :: mean
      real(c_double) :: stddev
      !
      hiprandGenerateNormalDouble_assumed_rank_cptr = hiprandGenerateNormalDouble_(generator, &
        c_loc(output_data),n,mean,stddev)
    end function

#else
    function hiprandGenerateNormalDouble_rank_0(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateNormalDouble_rank_0
      type(hiprandGenerator_t) :: generator
      real(c_double),target :: output_data
      integer(c_size_t) :: n
      real(c_double) :: mean
      real(c_double) :: stddev
      !
      hiprandGenerateNormalDouble_rank_0 = hiprandGenerateNormalDouble_(generator%ptr, &
        c_loc(output_data),n,mean,stddev)
    end function

    function hiprandGenerateNormalDouble_rank_0_cptr(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateNormalDouble_rank_0_cptr
      type(c_ptr) :: generator
      real(c_double),target :: output_data
      integer(c_size_t) :: n
      real(c_double) :: mean
      real(c_double) :: stddev
      !
      hiprandGenerateNormalDouble_rank_0_cptr = hiprandGenerateNormalDouble_(generator, &
        c_loc(output_data),n,mean,stddev)
    end function

    function hiprandGenerateNormalDouble_rank_1(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateNormalDouble_rank_1
      type(hiprandGenerator_t) :: generator
      real(c_double),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      real(c_double) :: mean
      real(c_double) :: stddev
      !
      hiprandGenerateNormalDouble_rank_1 = hiprandGenerateNormalDouble_(generator%ptr, &
        c_loc(output_data),n,mean,stddev)
    end function

    function hiprandGenerateNormalDouble_rank_1_cptr(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateNormalDouble_rank_1_cptr
      type(c_ptr) :: generator
      real(c_double),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      real(c_double) :: mean
      real(c_double) :: stddev
      !
      hiprandGenerateNormalDouble_rank_1_cptr = hiprandGenerateNormalDouble_(generator, &
        c_loc(output_data),n,mean,stddev)
    end function

#endif
    function hiprandGenerateNormalDouble_typed(generator, output_data, n, mean, &
        stddev) result(GenerateNormalDouble)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_size_t), value :: n
      real(c_double), value :: mean
      real(c_double), value :: stddev
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: GenerateNormalDouble
      GenerateNormalDouble = hiprandGenerateNormalDouble_(generator%ptr, output_data, n, mean, &
        stddev)
    end function hiprandGenerateNormalDouble_typed

    function hiprandGenerateNormalHalf_typed(generator, output_data, n, mean, &
        stddev) result(GenerateNormalHalf)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_size_t), value :: n
      integer(c_short), value :: mean
      integer(c_short), value :: stddev
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: GenerateNormalHalf
      GenerateNormalHalf = hiprandGenerateNormalHalf_(generator%ptr, output_data, n, mean, stddev)
    end function hiprandGenerateNormalHalf_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hiprandGenerateLogNormal_assumed_rank(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateLogNormal_assumed_rank
      type(hiprandGenerator_t) :: generator
      real(c_float),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      real(c_float) :: mean
      real(c_float) :: stddev
      !
      hiprandGenerateLogNormal_assumed_rank = hiprandGenerateLogNormal_(generator%ptr, &
        c_loc(output_data),n,mean,stddev)
    end function

    function hiprandGenerateLogNormal_assumed_rank_cptr(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateLogNormal_assumed_rank_cptr
      type(c_ptr) :: generator
      real(c_float),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      real(c_float) :: mean
      real(c_float) :: stddev
      !
      hiprandGenerateLogNormal_assumed_rank_cptr = hiprandGenerateLogNormal_(generator, &
        c_loc(output_data),n,mean,stddev)
    end function

#else
    function hiprandGenerateLogNormal_rank_0(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateLogNormal_rank_0
      type(hiprandGenerator_t) :: generator
      real(c_float),target :: output_data
      integer(c_size_t) :: n
      real(c_float) :: mean
      real(c_float) :: stddev
      !
      hiprandGenerateLogNormal_rank_0 = hiprandGenerateLogNormal_(generator%ptr, &
        c_loc(output_data),n,mean,stddev)
    end function

    function hiprandGenerateLogNormal_rank_0_cptr(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateLogNormal_rank_0_cptr
      type(c_ptr) :: generator
      real(c_float),target :: output_data
      integer(c_size_t) :: n
      real(c_float) :: mean
      real(c_float) :: stddev
      !
      hiprandGenerateLogNormal_rank_0_cptr = hiprandGenerateLogNormal_(generator, &
        c_loc(output_data),n,mean,stddev)
    end function

    function hiprandGenerateLogNormal_rank_1(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateLogNormal_rank_1
      type(hiprandGenerator_t) :: generator
      real(c_float),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      real(c_float) :: mean
      real(c_float) :: stddev
      !
      hiprandGenerateLogNormal_rank_1 = hiprandGenerateLogNormal_(generator%ptr, &
        c_loc(output_data),n,mean,stddev)
    end function

    function hiprandGenerateLogNormal_rank_1_cptr(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateLogNormal_rank_1_cptr
      type(c_ptr) :: generator
      real(c_float),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      real(c_float) :: mean
      real(c_float) :: stddev
      !
      hiprandGenerateLogNormal_rank_1_cptr = hiprandGenerateLogNormal_(generator, &
        c_loc(output_data),n,mean,stddev)
    end function

#endif
    function hiprandGenerateLogNormal_typed(generator, output_data, n, mean, &
        stddev) result(GenerateLogNormal)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_size_t), value :: n
      real(c_float), value :: mean
      real(c_float), value :: stddev
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: GenerateLogNormal
      GenerateLogNormal = hiprandGenerateLogNormal_(generator%ptr, output_data, n, mean, stddev)
    end function hiprandGenerateLogNormal_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hiprandGenerateLogNormalDouble_assumed_rank(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateLogNormalDouble_assumed_rank
      type(hiprandGenerator_t) :: generator
      real(c_double),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      real(c_double) :: mean
      real(c_double) :: stddev
      !
      hiprandGenerateLogNormalDouble_assumed_rank = hiprandGenerateLogNormalDouble_(generator%ptr, &
        c_loc(output_data),n,mean,stddev)
    end function

    function hiprandGenerateLogNormalDouble_assumed_rank_cptr(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateLogNormalDouble_assumed_rank_cptr
      type(c_ptr) :: generator
      real(c_double),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      real(c_double) :: mean
      real(c_double) :: stddev
      !
      hiprandGenerateLogNormalDouble_assumed_rank_cptr = hiprandGenerateLogNormalDouble_( &
        generator,c_loc(output_data),n,mean,stddev)
    end function

#else
    function hiprandGenerateLogNormalDouble_rank_0(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateLogNormalDouble_rank_0
      type(hiprandGenerator_t) :: generator
      real(c_double),target :: output_data
      integer(c_size_t) :: n
      real(c_double) :: mean
      real(c_double) :: stddev
      !
      hiprandGenerateLogNormalDouble_rank_0 = hiprandGenerateLogNormalDouble_(generator%ptr, &
        c_loc(output_data),n,mean,stddev)
    end function

    function hiprandGenerateLogNormalDouble_rank_0_cptr(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateLogNormalDouble_rank_0_cptr
      type(c_ptr) :: generator
      real(c_double),target :: output_data
      integer(c_size_t) :: n
      real(c_double) :: mean
      real(c_double) :: stddev
      !
      hiprandGenerateLogNormalDouble_rank_0_cptr = hiprandGenerateLogNormalDouble_(generator, &
        c_loc(output_data),n,mean,stddev)
    end function

    function hiprandGenerateLogNormalDouble_rank_1(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateLogNormalDouble_rank_1
      type(hiprandGenerator_t) :: generator
      real(c_double),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      real(c_double) :: mean
      real(c_double) :: stddev
      !
      hiprandGenerateLogNormalDouble_rank_1 = hiprandGenerateLogNormalDouble_(generator%ptr, &
        c_loc(output_data),n,mean,stddev)
    end function

    function hiprandGenerateLogNormalDouble_rank_1_cptr(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateLogNormalDouble_rank_1_cptr
      type(c_ptr) :: generator
      real(c_double),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      real(c_double) :: mean
      real(c_double) :: stddev
      !
      hiprandGenerateLogNormalDouble_rank_1_cptr = hiprandGenerateLogNormalDouble_(generator, &
        c_loc(output_data),n,mean,stddev)
    end function

#endif
    function hiprandGenerateLogNormalDouble_typed(generator, output_data, n, mean, &
        stddev) result(GenerateLogNormalDouble)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_size_t), value :: n
      real(c_double), value :: mean
      real(c_double), value :: stddev
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: GenerateLogNormalDouble
      GenerateLogNormalDouble = hiprandGenerateLogNormalDouble_(generator%ptr, output_data, n, &
        mean, stddev)
    end function hiprandGenerateLogNormalDouble_typed

    function hiprandGenerateLogNormalHalf_typed(generator, output_data, n, mean, &
        stddev) result(GenerateLogNormalHalf)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_size_t), value :: n
      integer(c_short), value :: mean
      integer(c_short), value :: stddev
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: GenerateLogNormalHalf
      GenerateLogNormalHalf = hiprandGenerateLogNormalHalf_(generator%ptr, output_data, n, mean, &
        stddev)
    end function hiprandGenerateLogNormalHalf_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hiprandGeneratePoisson_assumed_rank(generator,output_data,n,lambda)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGeneratePoisson_assumed_rank
      type(hiprandGenerator_t) :: generator
      integer(c_int),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      real(c_double) :: lambda
      !
      hiprandGeneratePoisson_assumed_rank = hiprandGeneratePoisson_(generator%ptr, &
        c_loc(output_data),n,lambda)
    end function

    function hiprandGeneratePoisson_assumed_rank_cptr(generator,output_data,n,lambda)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGeneratePoisson_assumed_rank_cptr
      type(c_ptr) :: generator
      integer(c_int),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      real(c_double) :: lambda
      !
      hiprandGeneratePoisson_assumed_rank_cptr = hiprandGeneratePoisson_(generator, &
        c_loc(output_data),n,lambda)
    end function

#else
    function hiprandGeneratePoisson_rank_0(generator,output_data,n,lambda)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGeneratePoisson_rank_0
      type(hiprandGenerator_t) :: generator
      integer(c_int),target :: output_data
      integer(c_size_t) :: n
      real(c_double) :: lambda
      !
      hiprandGeneratePoisson_rank_0 = hiprandGeneratePoisson_(generator%ptr,c_loc(output_data),n, &
        lambda)
    end function

    function hiprandGeneratePoisson_rank_0_cptr(generator,output_data,n,lambda)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGeneratePoisson_rank_0_cptr
      type(c_ptr) :: generator
      integer(c_int),target :: output_data
      integer(c_size_t) :: n
      real(c_double) :: lambda
      !
      hiprandGeneratePoisson_rank_0_cptr = hiprandGeneratePoisson_(generator,c_loc(output_data),n, &
        lambda)
    end function

    function hiprandGeneratePoisson_rank_1(generator,output_data,n,lambda)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGeneratePoisson_rank_1
      type(hiprandGenerator_t) :: generator
      integer(c_int),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      real(c_double) :: lambda
      !
      hiprandGeneratePoisson_rank_1 = hiprandGeneratePoisson_(generator%ptr,c_loc(output_data),n, &
        lambda)
    end function

    function hiprandGeneratePoisson_rank_1_cptr(generator,output_data,n,lambda)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGeneratePoisson_rank_1_cptr
      type(c_ptr) :: generator
      integer(c_int),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      real(c_double) :: lambda
      !
      hiprandGeneratePoisson_rank_1_cptr = hiprandGeneratePoisson_(generator,c_loc(output_data),n, &
        lambda)
    end function

#endif
    function hiprandGeneratePoisson_typed(generator, output_data, n, lambda) result(GeneratePoisson)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_size_t), value :: n
      real(c_double), value :: lambda
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: GeneratePoisson
      GeneratePoisson = hiprandGeneratePoisson_(generator%ptr, output_data, n, lambda)
    end function hiprandGeneratePoisson_typed

    function hiprandGenerateSeeds_typed(generator) result(GenerateSeeds)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: GenerateSeeds
      GenerateSeeds = hiprandGenerateSeeds_(generator%ptr)
    end function hiprandGenerateSeeds_typed

    function hiprandSetStream_typed(generator, stream) result(SetStream)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      type(c_ptr), value :: stream
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: SetStream
      SetStream = hiprandSetStream_(generator%ptr, stream)
    end function hiprandSetStream_typed

    function hiprandSetPseudoRandomGeneratorSeed_typed(generator, &
        seed) result(SetPseudoRandomGeneratorSeed)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      integer(c_int64_t), value :: seed
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: SetPseudoRandomGeneratorSeed
      SetPseudoRandomGeneratorSeed = hiprandSetPseudoRandomGeneratorSeed_(generator%ptr, seed)
    end function hiprandSetPseudoRandomGeneratorSeed_typed

    function hiprandSetGeneratorOffset_typed(generator, offset) result(SetGeneratorOffset)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      integer(c_int64_t), value :: offset
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: SetGeneratorOffset
      SetGeneratorOffset = hiprandSetGeneratorOffset_(generator%ptr, offset)
    end function hiprandSetGeneratorOffset_typed

    function hiprandSetGeneratorOrdering_typed(generator, order) result(SetGeneratorOrdering)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      integer(kind(HIPRAND_ORDERING_PSEUDO_BEST)), value :: order
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: SetGeneratorOrdering
      SetGeneratorOrdering = hiprandSetGeneratorOrdering_(generator%ptr, order)
    end function hiprandSetGeneratorOrdering_typed

    function hiprandSetQuasiRandomGeneratorDimensions_typed(generator, &
        dimensions) result(SetQuasiRandomGeneratorDimensions)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      integer(c_int), value :: dimensions
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: SetQuasiRandomGeneratorDimensions
      SetQuasiRandomGeneratorDimensions = hiprandSetQuasiRandomGeneratorDimensions_(generator%ptr, &
        dimensions)
    end function hiprandSetQuasiRandomGeneratorDimensions_typed

    function hiprandCreatePoissonDistribution_typed(lambda, &
        discrete_distribution) result(CreatePoissonDistribution)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      real(c_double), value :: lambda
      type(hiprandDiscreteDistribution_t) :: discrete_distribution
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: CreatePoissonDistribution
      CreatePoissonDistribution = hiprandCreatePoissonDistribution_(lambda, &
        discrete_distribution%ptr)
    end function hiprandCreatePoissonDistribution_typed

    function hiprandDestroyDistribution_typed(discrete_distribution) result(DestroyDistribution)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandDiscreteDistribution_t), value :: discrete_distribution
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: DestroyDistribution
      DestroyDistribution = hiprandDestroyDistribution_(discrete_distribution%ptr)
    end function hiprandDestroyDistribution_typed

