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

! Usage:
!   #include "hipfort_hiprand_interfaces.f90"  ! directly in any program unit (needs cpp:
!                                     ! the #ifdef guards below must be honoured)
!   use hipfort_hiprand                         ! via the pre-built module

  use, intrinsic :: iso_c_binding
  implicit none

  interface

    !---------------------------------------------
    ! hiprandGetVersion
    !---------------------------------------------
    !>  \brief Returns the version number of the cuRAND or rocRAND library.
    !>
    !>  Returns in \p version the version number of the underlying cuRAND or
    !>  rocRAND library.
    !>
    !>  \param version - Version of the library
    !>
    !>  \return
    !>  - HIPRAND_STATUS_OUT_OF_RANGE if \p version is NULL
    !>  - HIPRAND_STATUS_SUCCESS if the version number was successfully returned
    function hiprandGetVersion(version) &
       result(GetVersion) &
       bind(C, name="hiprandGetVersion")
       import :: c_int, HIPRAND_STATUS_SUCCESS
       integer(c_int) :: version
       integer(kind(HIPRAND_STATUS_SUCCESS)) :: GetVersion
    end function hiprandGetVersion

    !---------------------------------------------
    ! hiprandGetDirectionVectors32
    !---------------------------------------------
    !>  \brief Retrieves the Sobol 32 direction vector array specified by \p set.
    !>
    !>  \param vectors - Pointer to the Sobol 32 direction vector array.
    !>  \param set - Specifies which hipRAND vector set for quasirandom generators to retrieve.
    !>
    !>  \return
    !>  - HIPRAND_STATUS_OUT_OF_RANGE if \p set is invalid
    !>  - HIPRAND_STATUS_SUCCESS if \p vectors was set successfully
    function hiprandGetDirectionVectors32(vectors, set) &
       result(GetDirectionVectors32) &
       bind(C, name="hiprandGetDirectionVectors32")
       import :: c_ptr, HIPRAND_DIRECTION_VECTORS_32_JOEKUO6, HIPRAND_STATUS_SUCCESS
       type(c_ptr) :: vectors
       integer(kind(HIPRAND_DIRECTION_VECTORS_32_JOEKUO6)), value :: set
       integer(kind(HIPRAND_STATUS_SUCCESS)) :: GetDirectionVectors32
    end function hiprandGetDirectionVectors32

    !---------------------------------------------
    ! hiprandGetDirectionVectors64
    !---------------------------------------------
    !>  \brief Retrieves the Sobol 64 direction vector array specified by \p set.
    !>
    !>  \param vectors - Pointer to the Sobol 64 direction vector array.
    !>  \param set - Specifies which hipRAND vector set for quasirandom generators to retrieve.
    !>
    !>  \return
    !>  - HIPRAND_STATUS_OUT_OF_RANGE if \p set is invalid
    !>  - HIPRAND_STATUS_SUCCESS if \p vectors was set successfully
    function hiprandGetDirectionVectors64(vectors, set) &
       result(GetDirectionVectors64) &
       bind(C, name="hiprandGetDirectionVectors64")
       import :: c_ptr, HIPRAND_DIRECTION_VECTORS_32_JOEKUO6, HIPRAND_STATUS_SUCCESS
       type(c_ptr) :: vectors
       integer(kind(HIPRAND_DIRECTION_VECTORS_32_JOEKUO6)), value :: set
       integer(kind(HIPRAND_STATUS_SUCCESS)) :: GetDirectionVectors64
    end function hiprandGetDirectionVectors64

    !---------------------------------------------
    ! hiprandGetScrambleConstants32
    !---------------------------------------------
    !>  \brief Retrieves the scramble constants for 32-bit scrambled Sobol generation.
    !>
    !>  \param constants - Pointer to the constants pointer.
    !>
    !>  \return
    !>  - HIPRAND_STATUS_SUCCESS if the pointer was set successfully
    function hiprandGetScrambleConstants32(constants) &
       result(GetScrambleConstants32) &
       bind(C, name="hiprandGetScrambleConstants32")
       import :: c_ptr, HIPRAND_STATUS_SUCCESS
       type(c_ptr) :: constants
       integer(kind(HIPRAND_STATUS_SUCCESS)) :: GetScrambleConstants32
    end function hiprandGetScrambleConstants32

    !---------------------------------------------
    ! hiprandGetScrambleConstants64
    !---------------------------------------------
    !>  \brief Retrieves the scramble constants for 64-bit scrambled Sobol generation.
    !>
    !>  \param constants - Pointer to the constants pointer.
    !>
    !>  \return
    !>  - HIPRAND_STATUS_SUCCESS if the pointer was set successfully
    function hiprandGetScrambleConstants64(constants) &
       result(GetScrambleConstants64) &
       bind(C, name="hiprandGetScrambleConstants64")
       import :: c_ptr, HIPRAND_STATUS_SUCCESS
       type(c_ptr) :: constants
       integer(kind(HIPRAND_STATUS_SUCCESS)) :: GetScrambleConstants64
    end function hiprandGetScrambleConstants64

  end interface

  !>  \brief Creates a new random number generator.
  !>
  !>  Creates a new random number generator of type \p rng_type,
  !>  and returns it in \p generator. That generator will use
  !>  GPU to create random numbers.
  !>
  !>  Values for \p rng_type are:
  !>  - HIPRAND_RNG_PSEUDO_DEFAULT
  !>  - HIPRAND_RNG_PSEUDO_XORWOW
  !>  - HIPRAND_RNG_PSEUDO_MRG32K3A
  !>  - HIPRAND_RNG_PSEUDO_MTGP32
  !>  - HIPRAND_RNG_PSEUDO_MT19937
  !>  - HIPRAND_RNG_PSEUDO_PHILOX4_32_10
  !>  - HIPRAND_RNG_QUASI_DEFAULT
  !>  - HIPRAND_RNG_QUASI_SOBOL32
  !>  - HIPRAND_RNG_QUASI_SCRAMBLED_SOBOL32
  !>  - HIPRAND_RNG_QUASI_SOBOL64
  !>  - HIPRAND_RNG_QUASI_SCRAMBLED_SOBOL64
  !>
  !>  \param generator - Pointer to generator
  !>  \param rng_type - Type of random number generator to create
  !>
  !>  \return
  !>  - HIPRAND_STATUS_ALLOCATION_FAILED, if memory allocation failed
  !>  - HIPRAND_STATUS_INITIALIZATION_FAILED if there was a problem setting up the GPU
  !>  - HIPRAND_STATUS_VERSION_MISMATCH if the header file version does not match the
  !>    dynamically linked library version
  !>  - HIPRAND_STATUS_TYPE_ERROR if the value for \p rng_type is invalid
  !>  - HIPRAND_STATUS_NOT_IMPLEMENTED if generator of type \p rng_type is not implemented yet
  !>  - HIPRAND_STATUS_SUCCESS if generator was created successfully
  interface hiprandCreateGenerator
    function hiprandCreateGenerator_(generator,rng_type) bind(c, name="hiprandCreateGenerator")
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandCreateGenerator_
      type(c_ptr) :: generator
      integer(kind(HIPRAND_RNG_TEST)),value :: rng_type
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hiprandCreateGenerator_typed
#endif
  end interface

  !>  \brief Creates a new random number generator on host.
  !>
  !>  Creates a new host random number generator of type \p rng_type
  !>  and returns it in \p generator. Created generator will use
  !>  host CPU to generate random numbers.
  !>
  !>  Values for \p rng_type are:
  !>  - HIPRAND_RNG_PSEUDO_DEFAULT
  !>  - HIPRAND_RNG_PSEUDO_XORWOW
  !>  - HIPRAND_RNG_PSEUDO_MRG32K3A
  !>  - HIPRAND_RNG_PSEUDO_MTGP32
  !>  - HIPRAND_RNG_PSEUDO_MT19937
  !>  - HIPRAND_RNG_PSEUDO_PHILOX4_32_10
  !>  - HIPRAND_RNG_QUASI_DEFAULT
  !>  - HIPRAND_RNG_QUASI_SOBOL32
  !>  - HIPRAND_RNG_QUASI_SCRAMBLED_SOBOL32
  !>  - HIPRAND_RNG_QUASI_SOBOL64
  !>  - HIPRAND_RNG_QUASI_SCRAMBLED_SOBOL64
  !>
  !>  \param generator - Pointer to generator
  !>  \param rng_type - Type of random number generator to create
  !>
  !>  \return
  !>  - HIPRAND_STATUS_ALLOCATION_FAILED, if memory allocation failed
  !>  - HIPRAND_STATUS_VERSION_MISMATCH if the header file version does not match the
  !>    dynamically linked library version
  !>  - HIPRAND_STATUS_TYPE_ERROR if the value for \p rng_type is invalid
  !>  - HIPRAND_STATUS_NOT_IMPLEMENTED if host generator of type \p rng_type is not implemented yet
  !>  - HIPRAND_STATUS_SUCCESS if generator was created successfully
  interface hiprandCreateGeneratorHost
    function hiprandCreateGeneratorHost_(generator,rng_type) &
        bind(c, name="hiprandCreateGeneratorHost")
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandCreateGeneratorHost_
      type(c_ptr) :: generator
      integer(kind(HIPRAND_RNG_TEST)),value :: rng_type
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hiprandCreateGeneratorHost_typed
#endif
  end interface

  !>  \brief Destroys random number generator.
  !>
  !>  Destroys random number generator and frees related memory.
  !>
  !>  \param generator - Generator to be destroyed
  !>
  !>  \return
  !>  - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized
  !>  - HIPRAND_STATUS_SUCCESS if generator was destroyed successfully
  interface hiprandDestroyGenerator
    function hiprandDestroyGenerator_(generator) bind(c, name="hiprandDestroyGenerator")
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandDestroyGenerator_
      type(c_ptr),value :: generator
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hiprandDestroyGenerator_typed
#endif
  end interface

  !>  \brief Generates uniformly distributed 32-bit unsigned integers.
  !>
  !>  Generates \p n uniformly distributed 32-bit unsigned integers and
  !>  saves them to \p output_data.
  !>
  !>  Generated numbers are between \p 0 and \p 2^32, including \p 0 and
  !>  excluding \p 2^32.
  !>
  !>  \param generator - Generator to use
  !>  \param output_data - Pointer to memory to store generated numbers
  !>  \param n - Number of 32-bit unsigned integers to generate
  !>
  !>  Note: \p generator must be not be of type \p HIPRAND_RNG_QUASI_SOBOL64
  !>  or \p HIPRAND_RNG_QUASI_SCRAMBLED_SOBOL64.
  !>
  !>  \return
  !>  - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized
  !>  - HIPRAND_STATUS_LAUNCH_FAILURE if generator failed to launch kernel
  !>  - HIPRAND_STATUS_SUCCESS if random numbers were successfully generated
  interface hiprandGenerate
    function hiprandGenerate_(generator,output_data,n) bind(c, name="hiprandGenerate")
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerate_
      type(c_ptr),value :: generator
      type(c_ptr),value :: output_data
      integer(c_size_t),value :: n
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hiprandGenerate_assumed_rank,&
      hiprandGenerate_assumed_rank_cptr,&
      hiprandGenerate_typed
#else
    module procedure &
      hiprandGenerate_rank_0,&
      hiprandGenerate_rank_0_cptr,&
      hiprandGenerate_rank_1,&
      hiprandGenerate_rank_1_cptr,&
      hiprandGenerate_typed
#endif
#endif
  end interface

  !>  \brief Generates uniformly distributed 8-bit unsigned integers.
  !>
  !>  Generates \p n uniformly distributed 8-bit unsigned integers and
  !>  saves them to \p output_data.
  !>
  !>  Generated numbers are between \p 0 and \p 2^8, including \p 0 and
  !>  excluding \p 2^8.
  !>
  !>  \param generator - Generator to use
  !>  \param output_data - Pointer to memory to store generated numbers
  !>  \param n - Number of 8-bit unsigned integers to generate
  !>
  !>  \return
  !>  - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized
  !>  - HIPRAND_STATUS_LAUNCH_FAILURE if generator failed to launch kernel
  !>  - HIPRAND_STATUS_SUCCESS if random numbers were successfully generated
  interface hiprandGenerateChar
    function hiprandGenerateChar_(generator,output_data,n) bind(c, name="hiprandGenerateChar")
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateChar_
      type(c_ptr),value :: generator
      type(c_ptr),value :: output_data
      integer(c_size_t),value :: n
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hiprandGenerateChar_typed
#endif
  end interface

  !>  \brief Generates uniformly distributed 16-bit unsigned integers.
  !>
  !>  Generates \p n uniformly distributed 16-bit unsigned integers and
  !>  saves them to \p output_data.
  !>
  !>  Generated numbers are between \p 0 and \p 2^16, including \p 0 and
  !>  excluding \p 2^16.
  !>
  !>  \param generator - Generator to use
  !>  \param output_data - Pointer to memory to store generated numbers
  !>  \param n - Number of 16-bit unsigned integers to generate
  !>
  !>  \return
  !>  - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized
  !>  - HIPRAND_STATUS_LAUNCH_FAILURE if generator failed to launch kernel
  !>  - HIPRAND_STATUS_SUCCESS if random numbers were successfully generated
  interface hiprandGenerateShort
    function hiprandGenerateShort_(generator,output_data,n) bind(c, name="hiprandGenerateShort")
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateShort_
      type(c_ptr),value :: generator
      type(c_ptr),value :: output_data
      integer(c_size_t),value :: n
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hiprandGenerateShort_typed
#endif
  end interface

  !>  \brief Generates uniformly distributed 64-bit unsigned integers.
  !>
  !>  Generates \p n uniformly distributed 64-bit unsigned integers and
  !>  saves them to \p output_data.
  !>
  !>  Generated numbers are between \p 0 and \p 2^64, including \p 0 and
  !>  excluding \p 2^64.
  !>
  !>  \param generator - Generator to use
  !>  \param output_data - Pointer to memory to store generated numbers
  !>  \param n - Number of 64-bit unsigned integers to generate
  !>
  !>  Note: \p generator must be of type \p HIPRAND_RNG_QUASI_SOBOL64
  !>  or \p HIPRAND_RNG_QUASI_SCRAMBLED_SOBOL64.
  !>
  !>  \return
  !>  - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized
  !>  - HIPRAND_STATUS_LAUNCH_FAILURE if generator failed to launch kernel
  !>  - HIPRAND_STATUS_SUCCESS if random numbers were successfully generated
  interface hiprandGenerateLongLong
    function hiprandGenerateLongLong_(generator,output_data,n) &
        bind(c, name="hiprandGenerateLongLong")
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateLongLong_
      type(c_ptr),value :: generator
      type(c_ptr),value :: output_data
      integer(c_size_t),value :: n
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hiprandGenerateLongLong_assumed_rank,&
      hiprandGenerateLongLong_assumed_rank_cptr,&
      hiprandGenerateLongLong_typed
#else
    module procedure &
      hiprandGenerateLongLong_rank_0,&
      hiprandGenerateLongLong_rank_0_cptr,&
      hiprandGenerateLongLong_rank_1,&
      hiprandGenerateLongLong_rank_1_cptr,&
      hiprandGenerateLongLong_typed
#endif
#endif
  end interface

  !>  \brief Generates uniformly distributed floats.
  !>
  !>  Generates \p n uniformly distributed 32-bit floating-point values
  !>  and saves them to \p output_data.
  !>
  !>  Generated numbers are between \p 0.0f and \p 1.0f, excluding \p 0.0f and
  !>  including \p 1.0f.
  !>
  !>  \param generator - Generator to use
  !>  \param output_data - Pointer to memory to store generated numbers
  !>  \param n - Number of floats to generate
  !>
  !>  \return
  !>  - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized
  !>  - HIPRAND_STATUS_LAUNCH_FAILURE if generator failed to launch kernel
  !>  - HIPRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not a multiple of the dimension
  !>  of used quasi-random generator
  !>  - HIPRAND_STATUS_SUCCESS if random numbers were successfully generated
  interface hiprandGenerateUniform
    function hiprandGenerateUniform_(generator,output_data,n) bind(c, name="hiprandGenerateUniform")
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateUniform_
      type(c_ptr),value :: generator
      type(c_ptr),value :: output_data
      integer(c_size_t),value :: n
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hiprandGenerateUniform_assumed_rank,&
      hiprandGenerateUniform_assumed_rank_cptr,&
      hiprandGenerateUniform_typed
#else
    module procedure &
      hiprandGenerateUniform_rank_0,&
      hiprandGenerateUniform_rank_0_cptr,&
      hiprandGenerateUniform_rank_1,&
      hiprandGenerateUniform_rank_1_cptr,&
      hiprandGenerateUniform_typed
#endif
#endif
  end interface

  !>  \brief Generates uniformly distributed double-precision floating-point values.
  !>
  !>  Generates \p n uniformly distributed 64-bit double-precision floating-point
  !>  values and saves them to \p output_data.
  !>
  !>  Generated numbers are between \p 0.0 and \p 1.0, excluding \p 0.0 and
  !>  including \p 1.0.
  !>
  !>  \param generator - Generator to use
  !>  \param output_data - Pointer to memory to store generated numbers
  !>  \param n - Number of floats to generate
  !>
  !>  Note: When \p generator is of type: \p HIPRAND_RNG_PSEUDO_MRG32K3A,
  !>  \p HIPRAND_RNG_PSEUDO_MTGP32, \p HIPRAND_RNG_QUASI_SOBOL32, or
  !>  \p HIPRAND_RNG_QUASI_SCRAMBLED_SOBOL32 then the returned \p double
  !>  values are generated from only 32 random bits
  !>  each (one unsigned int value per one generated \p double).
  !>
  !>  \return
  !>  - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized
  !>  - HIPRAND_STATUS_LAUNCH_FAILURE if generator failed to launch kernel
  !>  - HIPRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not a multiple of the dimension
  !>  of used quasi-random generator
  !>  - HIPRAND_STATUS_SUCCESS if random numbers were successfully generated
  interface hiprandGenerateUniformDouble
    function hiprandGenerateUniformDouble_(generator,output_data,n) &
        bind(c, name="hiprandGenerateUniformDouble")
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateUniformDouble_
      type(c_ptr),value :: generator
      type(c_ptr),value :: output_data
      integer(c_size_t),value :: n
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hiprandGenerateUniformDouble_assumed_rank,&
      hiprandGenerateUniformDouble_assumed_rank_cptr,&
      hiprandGenerateUniformDouble_typed
#else
    module procedure &
      hiprandGenerateUniformDouble_rank_0,&
      hiprandGenerateUniformDouble_rank_0_cptr,&
      hiprandGenerateUniformDouble_rank_1,&
      hiprandGenerateUniformDouble_rank_1_cptr,&
      hiprandGenerateUniformDouble_typed
#endif
#endif
  end interface

  !>  \brief Generates uniformly distributed half-precision floating-point values.
  !>
  !>  Generates \p n uniformly distributed 16-bit half-precision floating-point
  !>  values and saves them to \p output_data.
  !>
  !>  Generated numbers are between \p 0.0 and \p 1.0, excluding \p 0.0 and
  !>  including \p 1.0.
  !>
  !>  \param generator - Generator to use
  !>  \param output_data - Pointer to memory to store generated numbers
  !>  \param n - Number of halfs to generate
  !>
  !>  \return
  !>  - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized
  !>  - HIPRAND_STATUS_LAUNCH_FAILURE if generator failed to launch kernel
  !>  - HIPRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not a multiple of the dimension
  !>  of used quasi-random generator
  !>  - HIPRAND_STATUS_SUCCESS if random numbers were successfully generated
  interface hiprandGenerateUniformHalf
    function hiprandGenerateUniformHalf_(generator,output_data,n) &
        bind(c, name="hiprandGenerateUniformHalf")
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateUniformHalf_
      type(c_ptr),value :: generator
      type(c_ptr),value :: output_data
      integer(c_size_t),value :: n
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hiprandGenerateUniformHalf_typed
#endif
  end interface

  !>  \brief Generates normally distributed floats.
  !>
  !>  Generates \p n normally distributed 32-bit floating-point
  !>  values and saves them to \p output_data.
  !>
  !>  \param generator - Generator to use
  !>  \param output_data - Pointer to memory to store generated numbers
  !>  \param n - Number of floats to generate
  !>  \param mean - Mean value of normal distribution
  !>  \param stddev - Standard deviation value of normal distribution
  !>
  !>  \return
  !>  - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized
  !>  - HIPRAND_STATUS_LAUNCH_FAILURE if generator failed to launch kernel
  !>  - HIPRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not even, \p output_data is not
  !>  aligned to \p sizeof(float2) bytes, or \p n is not a multiple of the dimension
  !>  of used quasi-random generator
  !>  - HIPRAND_STATUS_SUCCESS if random numbers were successfully generated
  interface hiprandGenerateNormal
    function hiprandGenerateNormal_(generator,output_data,n,mean,stddev) &
        bind(c, name="hiprandGenerateNormal")
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateNormal_
      type(c_ptr),value :: generator
      type(c_ptr),value :: output_data
      integer(c_size_t),value :: n
      real(c_float),value :: mean
      real(c_float),value :: stddev
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hiprandGenerateNormal_assumed_rank,&
      hiprandGenerateNormal_assumed_rank_cptr,&
      hiprandGenerateNormal_typed
#else
    module procedure &
      hiprandGenerateNormal_rank_0,&
      hiprandGenerateNormal_rank_0_cptr,&
      hiprandGenerateNormal_rank_1,&
      hiprandGenerateNormal_rank_1_cptr,&
      hiprandGenerateNormal_typed
#endif
#endif
  end interface

  !>  \brief Generates normally distributed doubles.
  !>
  !>  Generates \p n normally distributed 64-bit double-precision floating-point
  !>  numbers and saves them to \p output_data.
  !>
  !>  \param generator - Generator to use
  !>  \param output_data - Pointer to memory to store generated numbers
  !>  \param n - Number of doubles to generate
  !>  \param mean - Mean value of normal distribution
  !>  \param stddev - Standard deviation value of normal distribution
  !>
  !>  \return
  !>  - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized
  !>  - HIPRAND_STATUS_LAUNCH_FAILURE if generator failed to launch kernel
  !>  - HIPRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not even, \p output_data is not
  !>  aligned to \p sizeof(double2) bytes, or \p n is not a multiple of the dimension
  !>  of used quasi-random generator
  !>  - HIPRAND_STATUS_SUCCESS if random numbers were successfully generated
  interface hiprandGenerateNormalDouble
    function hiprandGenerateNormalDouble_(generator,output_data,n,mean,stddev) &
        bind(c, name="hiprandGenerateNormalDouble")
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateNormalDouble_
      type(c_ptr),value :: generator
      type(c_ptr),value :: output_data
      integer(c_size_t),value :: n
      real(c_double),value :: mean
      real(c_double),value :: stddev
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hiprandGenerateNormalDouble_assumed_rank,&
      hiprandGenerateNormalDouble_assumed_rank_cptr,&
      hiprandGenerateNormalDouble_typed
#else
    module procedure &
      hiprandGenerateNormalDouble_rank_0,&
      hiprandGenerateNormalDouble_rank_0_cptr,&
      hiprandGenerateNormalDouble_rank_1,&
      hiprandGenerateNormalDouble_rank_1_cptr,&
      hiprandGenerateNormalDouble_typed
#endif
#endif
  end interface

  !>  \brief Generates normally distributed halfs.
  !>
  !>  Generates \p n normally distributed 16-bit half-precision floating-point
  !>  numbers and saves them to \p output_data.
  !>
  !>  \param generator - Generator to use
  !>  \param output_data - Pointer to memory to store generated numbers
  !>  \param n - Number of halfs to generate
  !>  \param mean - Mean value of normal distribution
  !>  \param stddev - Standard deviation value of normal distribution
  !>
  !>  \return
  !>  - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized
  !>  - HIPRAND_STATUS_LAUNCH_FAILURE if generator failed to launch kernel
  !>  - HIPRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not even, \p output_data is not
  !>  aligned to \p sizeof(half2) bytes, or \p n is not a multiple of the dimension
  !>  of used quasi-random generator
  !>  - HIPRAND_STATUS_SUCCESS if random numbers were successfully generated
  interface hiprandGenerateNormalHalf
    function hiprandGenerateNormalHalf_(generator,output_data,n,mean,stddev) &
        bind(c, name="hiprandGenerateNormalHalf")
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateNormalHalf_
      type(c_ptr),value :: generator
      type(c_ptr),value :: output_data
      integer(c_size_t),value :: n
      integer(c_short),value :: mean
      integer(c_short),value :: stddev
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hiprandGenerateNormalHalf_typed
#endif
  end interface

  !>  \brief Generates log-normally distributed floats.
  !>
  !>  Generates \p n log-normally distributed 32-bit floating-point values
  !>  and saves them to \p output_data.
  !>
  !>  \param generator - Generator to use
  !>  \param output_data - Pointer to memory to store generated numbers
  !>  \param n - Number of floats to generate
  !>  \param mean - Mean value of log normal distribution
  !>  \param stddev - Standard deviation value of log normal distribution
  !>
  !>  \return
  !>  - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized
  !>  - HIPRAND_STATUS_LAUNCH_FAILURE if generator failed to launch kernel
  !>  - HIPRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not even, \p output_data is not
  !>  aligned to \p sizeof(float2) bytes, or \p n is not a multiple of the dimension
  !>  of used quasi-random generator
  !>  - HIPRAND_STATUS_SUCCESS if random numbers were successfully generated
  interface hiprandGenerateLogNormal
    function hiprandGenerateLogNormal_(generator,output_data,n,mean,stddev) &
        bind(c, name="hiprandGenerateLogNormal")
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateLogNormal_
      type(c_ptr),value :: generator
      type(c_ptr),value :: output_data
      integer(c_size_t),value :: n
      real(c_float),value :: mean
      real(c_float),value :: stddev
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hiprandGenerateLogNormal_assumed_rank,&
      hiprandGenerateLogNormal_assumed_rank_cptr,&
      hiprandGenerateLogNormal_typed
#else
    module procedure &
      hiprandGenerateLogNormal_rank_0,&
      hiprandGenerateLogNormal_rank_0_cptr,&
      hiprandGenerateLogNormal_rank_1,&
      hiprandGenerateLogNormal_rank_1_cptr,&
      hiprandGenerateLogNormal_typed
#endif
#endif
  end interface

  !>  \brief Generates log-normally distributed doubles.
  !>
  !>  Generates \p n log-normally distributed 64-bit double-precision floating-point
  !>  values and saves them to \p output_data.
  !>
  !>  \param generator - Generator to use
  !>  \param output_data - Pointer to memory to store generated numbers
  !>  \param n - Number of doubles to generate
  !>  \param mean - Mean value of log normal distribution
  !>  \param stddev - Standard deviation value of log normal distribution
  !>
  !>  \return
  !>  - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized
  !>  - HIPRAND_STATUS_LAUNCH_FAILURE if generator failed to launch kernel
  !>  - HIPRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not even, \p output_data is not
  !>  aligned to \p sizeof(double2) bytes, or \p n is not a multiple of the dimension
  !>  of used quasi-random generator
  !>  - HIPRAND_STATUS_SUCCESS if random numbers were successfully generated
  interface hiprandGenerateLogNormalDouble
    function hiprandGenerateLogNormalDouble_(generator,output_data,n,mean,stddev) &
        bind(c, name="hiprandGenerateLogNormalDouble")
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateLogNormalDouble_
      type(c_ptr),value :: generator
      type(c_ptr),value :: output_data
      integer(c_size_t),value :: n
      real(c_double),value :: mean
      real(c_double),value :: stddev
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hiprandGenerateLogNormalDouble_assumed_rank,&
      hiprandGenerateLogNormalDouble_assumed_rank_cptr,&
      hiprandGenerateLogNormalDouble_typed
#else
    module procedure &
      hiprandGenerateLogNormalDouble_rank_0,&
      hiprandGenerateLogNormalDouble_rank_0_cptr,&
      hiprandGenerateLogNormalDouble_rank_1,&
      hiprandGenerateLogNormalDouble_rank_1_cptr,&
      hiprandGenerateLogNormalDouble_typed
#endif
#endif
  end interface

  !>  \brief Generates log-normally distributed halfs.
  !>
  !>  Generates \p n log-normally distributed 16-bit half-precision floating-point
  !>  values and saves them to \p output_data.
  !>
  !>  \param generator - Generator to use
  !>  \param output_data - Pointer to memory to store generated numbers
  !>  \param n - Number of halfs to generate
  !>  \param mean - Mean value of log normal distribution
  !>  \param stddev - Standard deviation value of log normal distribution
  !>
  !>  \return
  !>  - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized
  !>  - HIPRAND_STATUS_LAUNCH_FAILURE if generator failed to launch kernel
  !>  - HIPRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not even, \p output_data is not
  !>  aligned to \p sizeof(half2) bytes, or \p n is not a multiple of the dimension
  !>  of used quasi-random generator
  !>  - HIPRAND_STATUS_SUCCESS if random numbers were successfully generated
  interface hiprandGenerateLogNormalHalf
    function hiprandGenerateLogNormalHalf_(generator,output_data,n,mean,stddev) &
        bind(c, name="hiprandGenerateLogNormalHalf")
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateLogNormalHalf_
      type(c_ptr),value :: generator
      type(c_ptr),value :: output_data
      integer(c_size_t),value :: n
      integer(c_short),value :: mean
      integer(c_short),value :: stddev
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hiprandGenerateLogNormalHalf_typed
#endif
  end interface

  !>  \brief Generates Poisson-distributed 32-bit unsigned integers.
  !>
  !>  Generates \p n Poisson-distributed 32-bit unsigned integers and
  !>  saves them to \p output_data.
  !>
  !>  \param generator - Generator to use
  !>  \param output_data - Pointer to memory to store generated numbers
  !>  \param n - Number of 32-bit unsigned integers to generate
  !>  \param lambda - lambda for the Poisson distribution
  !>
  !>  \return
  !>  - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized
  !>  - HIPRAND_STATUS_LAUNCH_FAILURE if generator failed to launch kernel
  !>  - HIPRAND_STATUS_OUT_OF_RANGE if lambda is non-positive
  !>  - HIPRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not a multiple of the dimension
  !>  of used quasi-random generator
  !>  - HIPRAND_STATUS_SUCCESS if random numbers were successfully generated
  interface hiprandGeneratePoisson
    function hiprandGeneratePoisson_(generator,output_data,n,lambda) &
        bind(c, name="hiprandGeneratePoisson")
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGeneratePoisson_
      type(c_ptr),value :: generator
      type(c_ptr),value :: output_data
      integer(c_size_t),value :: n
      real(c_double),value :: lambda
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hiprandGeneratePoisson_assumed_rank,&
      hiprandGeneratePoisson_assumed_rank_cptr,&
      hiprandGeneratePoisson_typed
#else
    module procedure &
      hiprandGeneratePoisson_rank_0,&
      hiprandGeneratePoisson_rank_0_cptr,&
      hiprandGeneratePoisson_rank_1,&
      hiprandGeneratePoisson_rank_1_cptr,&
      hiprandGeneratePoisson_typed
#endif
#endif
  end interface

  !>  \brief Initializes the generator's state on GPU or host.
  !>
  !>  Initializes the generator's state on GPU or host.
  !>
  !>  If hiprandGenerateSeeds() was not called for a generator, it will be
  !>  automatically called by functions which generates random numbers like
  !>  hiprandGenerate(), hiprandGenerateUniform(), hiprandGenerateNormal() etc.
  !>
  !>  \param generator - Generator to initialize
  !>
  !>  \return
  !>  - HIPRAND_STATUS_NOT_INITIALIZED if the generator was never created
  !>  - HIPRAND_STATUS_PREEXISTING_FAILURE if there was an existing error from
  !>    a previous kernel launch
  !>  - HIPRAND_STATUS_LAUNCH_FAILURE if the kernel launch failed for any reason
  !>  - HIPRAND_STATUS_SUCCESS if the seeds were generated successfully
  interface hiprandGenerateSeeds
    function hiprandGenerateSeeds_(generator) bind(c, name="hiprandGenerateSeeds")
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateSeeds_
      type(c_ptr),value :: generator
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hiprandGenerateSeeds_typed
#endif
  end interface

  !>  \brief Sets the current stream for kernel launches.
  !>
  !>  Sets the current stream for all kernel launches of the generator.
  !>  All functions will use this stream.
  !>
  !>  \param generator - Generator to modify
  !>  \param stream - Stream to use or NULL for default stream
  !>
  !>  \return
  !>  - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized
  !>  - HIPRAND_STATUS_SUCCESS if stream was set successfully
  interface hiprandSetStream
    function hiprandSetStream_(generator,stream) bind(c, name="hiprandSetStream")
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandSetStream_
      type(c_ptr),value :: generator
      type(c_ptr),value :: stream
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hiprandSetStream_typed
#endif
  end interface

  !>  \brief Sets the seed of a pseudo-random number generator.
  !>
  !>  Sets the seed of the pseudo-random number generator.
  !>
  !>  - This operation resets the generator's internal state.
  !>  - This operation does not change the generator's offset.
  !>
  !>  \param generator - Pseudo-random number generator
  !>  \param seed - New seed value
  !>
  !>  \return
  !>  - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized
  !>  - HIPRAND_STATUS_TYPE_ERROR if the generator is a quasi random number generator
  !>  - HIPRAND_STATUS_SUCCESS if seed was set successfully
  interface hiprandSetPseudoRandomGeneratorSeed
    function hiprandSetPseudoRandomGeneratorSeed_(generator,seed) &
        bind(c, name="hiprandSetPseudoRandomGeneratorSeed")
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandSetPseudoRandomGeneratorSeed_
      type(c_ptr),value :: generator
      integer(c_int64_t),value :: seed
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hiprandSetPseudoRandomGeneratorSeed_typed
#endif
  end interface

  !>  \brief Sets the offset of a random number generator.
  !>
  !>  Sets the absolute offset of the random number generator.
  !>
  !>  - This operation resets the generator's internal state.
  !>  - This operation does not change the generator's seed.
  !>
  !>  Absolute offset cannot be set if generator's type is
  !>  HIPRAND_RNG_PSEUDO_MTGP32 or HIPRAND_RNG_PSEUDO_MT19937.
  !>
  !>  \param generator - Random number generator
  !>  \param offset - New absolute offset
  !>
  !>  \return
  !>  - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized
  !>  - HIPRAND_STATUS_SUCCESS if offset was successfully set
  !>  - HIPRAND_STATUS_TYPE_ERROR if generator's type is HIPRAND_RNG_PSEUDO_MTGP32
  !>  or HIPRAND_RNG_PSEUDO_MT19937
  interface hiprandSetGeneratorOffset
    function hiprandSetGeneratorOffset_(generator,offset) bind(c, name="hiprandSetGeneratorOffset")
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandSetGeneratorOffset_
      type(c_ptr),value :: generator
      integer(c_int64_t),value :: offset
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hiprandSetGeneratorOffset_typed
#endif
  end interface

  !>  \brief Sets the ordering of a random number generator.
  !>
  !>  Sets the ordering of the results of a random number generator.
  !>
  !>  - This operation resets the generator's internal state.
  !>  - This operation does not change the generator's seed.
  !>
  !>  \param generator - Random number generator
  !>  \param order - New ordering of results
  !>
  !>  The ordering choices for pseudorandom sequences are
  !>  HIPRAND_ORDERING_PSEUDO_DEFAULT and
  !>  HIPRAND_ORDERING_PSEUDO_LEGACY.
  !>  The default ordering is HIPRAND_ORDERING_PSEUDO_DEFAULT, which is equal to
  !>  HIPRAND_ORDERING_PSEUDO_LEGACY for now.
  !>
  !>  For quasirandom sequences there is only one ordering, HIPRAND_ORDERING_QUASI_DEFAULT.
  !>
  !>  \return
  !>  - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized
  !>  - HIPRAND_STATUS_OUT_OF_RANGE if the ordering is not valid
  !>  - HIPRAND_STATUS_SUCCESS if the ordering was successfully set
  !>  - HIPRAND_STATUS_TYPE_ERROR if generator's type is not valid
  interface hiprandSetGeneratorOrdering
    function hiprandSetGeneratorOrdering_(generator,order) &
        bind(c, name="hiprandSetGeneratorOrdering")
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandSetGeneratorOrdering_
      type(c_ptr),value :: generator
      integer(kind(HIPRAND_ORDERING_PSEUDO_BEST)),value :: order
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hiprandSetGeneratorOrdering_typed
#endif
  end interface

  !>  \brief Set the number of dimensions of a quasi-random number generator.
  !>
  !>  Set the number of dimensions of a quasi-random number generator.
  !>  Supported values of \p dimensions are 1 to 20000.
  !>
  !>  - This operation resets the generator's internal state.
  !>  - This operation does not change the generator's offset.
  !>
  !>  \param generator - Quasi-random number generator
  !>  \param dimensions - Number of dimensions
  !>
  !>  \return
  !>  - HIPRAND_STATUS_NOT_CREATED if the generator wasn't created
  !>  - HIPRAND_STATUS_TYPE_ERROR if the generator is not a quasi-random number generator
  !>  - HIPRAND_STATUS_OUT_OF_RANGE if \p dimensions is out of range
  !>  - HIPRAND_STATUS_SUCCESS if the number of dimensions was set successfully
  interface hiprandSetQuasiRandomGeneratorDimensions
    function hiprandSetQuasiRandomGeneratorDimensions_(generator,dimensions) &
        bind(c, name="hiprandSetQuasiRandomGeneratorDimensions")
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandSetQuasiRandomGeneratorDimensions_
      type(c_ptr),value :: generator
      integer(c_int),value :: dimensions
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hiprandSetQuasiRandomGeneratorDimensions_typed
#endif
  end interface

  !>  \brief Construct the histogram for a Poisson distribution.
  !>
  !>  Construct the histogram for the Poisson distribution with lambda \p lambda.
  !>
  !>  \param lambda - lambda for the Poisson distribution
  !>  \param discrete_distribution - pointer to the histogram in device memory
  !>
  !>  \return
  !>  - HIPRAND_STATUS_ALLOCATION_FAILED if memory could not be allocated
  !>  - HIPRAND_STATUS_OUT_OF_RANGE if \p discrete_distribution pointer was null
  !>  - HIPRAND_STATUS_OUT_OF_RANGE if lambda is non-positive
  !>  - HIPRAND_STATUS_SUCCESS if the histogram was constructed successfully
  interface hiprandCreatePoissonDistribution
    function hiprandCreatePoissonDistribution_(lambda,discrete_distribution) &
        bind(c, name="hiprandCreatePoissonDistribution")
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandCreatePoissonDistribution_
      real(c_double),value :: lambda
      type(c_ptr) :: discrete_distribution
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hiprandCreatePoissonDistribution_typed
#endif
  end interface

  !>  \brief Destroy the histogram array for a discrete distribution.
  !>
  !>  Destroy the histogram array for a discrete distribution created by
  !>  hiprandCreatePoissonDistribution.
  !>
  !>  \param discrete_distribution - pointer to the histogram in device memory
  !>
  !>  \return
  !>  - HIPRAND_STATUS_OUT_OF_RANGE if \p discrete_distribution was null
  !>  - HIPRAND_STATUS_SUCCESS if the histogram was destroyed successfully
  interface hiprandDestroyDistribution
    function hiprandDestroyDistribution_(discrete_distribution) &
        bind(c, name="hiprandDestroyDistribution")
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandDestroyDistribution_
      type(c_ptr),value :: discrete_distribution
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hiprandDestroyDistribution_typed
#endif
  end interface

