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

module hipfort_hiprand
  use hipfort_hiprand_enums
  use hipfort_handles
  use, intrinsic :: iso_c_binding
  implicit none

  interface

    !---------------------------------------------
    ! hiprandGetDirectionVectors32
    !---------------------------------------------
    !> \brief Retrieves the Sobol 32 direction vector array specified by \p set.
    !>
    !> \param vectors Pointer to the Sobol 32 direction vector array.
    !> \param set Specifies which hipRAND vector set for quasirandom generators to retrieve.
    !>
    !> \return
    !> - HIPRAND_STATUS_OUT_OF_RANGE if \p set is invalid \n
    !> - HIPRAND_STATUS_SUCCESS if \p vectors was set successfully \n
    function hiprandGetDirectionVectors32(vectors, set) &
       result(GetDirectionVectors32) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandGetDirectionVectors32")
#else
       bind(C, name="hiprandGetDirectionVectors32")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: vectors
       integer(c_int), value :: set
       integer(c_int) :: GetDirectionVectors32
    end function hiprandGetDirectionVectors32

    !---------------------------------------------
    ! hiprandGetDirectionVectors64
    !---------------------------------------------
    !> \brief Retrieves the Sobol 64 direction vector array specified by \p set.
    !>
    !> \param vectors Pointer to the Sobol 64 direction vector array.
    !> \param set Specifies which hipRAND vector set for quasirandom generators to retrieve.
    !>
    !> \return
    !> - HIPRAND_STATUS_OUT_OF_RANGE if \p set is invalid \n
    !> - HIPRAND_STATUS_SUCCESS if \p vectors was set successfully \n
    function hiprandGetDirectionVectors64(vectors, set) &
       result(GetDirectionVectors64) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandGetDirectionVectors64")
#else
       bind(C, name="hiprandGetDirectionVectors64")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: vectors
       integer(c_int), value :: set
       integer(c_int) :: GetDirectionVectors64
    end function hiprandGetDirectionVectors64

    !---------------------------------------------
    ! hiprandGetScrambleConstants32
    !---------------------------------------------
    !> \brief Retrieves the scramble constants for 32-bit scrambled Sobol generation.
    !>
    !> \param constants Pointer to the constants pointer.
    !>
    !> \return
    !> - HIPRAND_STATUS_SUCCESS if the pointer was set successfully
    function hiprandGetScrambleConstants32(constants) &
       result(GetScrambleConstants32) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandGetScrambleConstants32")
#else
       bind(C, name="hiprandGetScrambleConstants32")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: constants
       integer(c_int) :: GetScrambleConstants32
    end function hiprandGetScrambleConstants32

    !---------------------------------------------
    ! hiprandGetScrambleConstants64
    !---------------------------------------------
    !> \brief Retrieves the scramble constants for 64-bit scrambled Sobol generation.
    !>
    !> \param constants Pointer to the constants pointer.
    !>
    !> \return
    !> - HIPRAND_STATUS_SUCCESS if the pointer was set successfully
    function hiprandGetScrambleConstants64(constants) &
       result(GetScrambleConstants64) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandGetScrambleConstants64")
#else
       bind(C, name="hiprandGetScrambleConstants64")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: constants
       integer(c_int) :: GetScrambleConstants64
    end function hiprandGetScrambleConstants64

  end interface

  interface hiprandCreateGenerator
    !---------------------------------------------
    ! hiprandCreateGenerator
    !---------------------------------------------
    !> \brief Creates a new random number generator.
    !>
    !> Creates a new random number generator of type \p rng_type,
    !> and returns it in \p generator. That generator will use
    !> GPU to create random numbers.
    !>
    !> Values for \p rng_type are:
    !> - HIPRAND_RNG_PSEUDO_DEFAULT
    !> - HIPRAND_RNG_PSEUDO_XORWOW
    !> - HIPRAND_RNG_PSEUDO_MRG32K3A
    !> - HIPRAND_RNG_PSEUDO_MTGP32
    !> - HIPRAND_RNG_PSEUDO_MT19937
    !> - HIPRAND_RNG_PSEUDO_PHILOX4_32_10
    !> - HIPRAND_RNG_QUASI_DEFAULT
    !> - HIPRAND_RNG_QUASI_SOBOL32
    !> - HIPRAND_RNG_QUASI_SCRAMBLED_SOBOL32
    !> - HIPRAND_RNG_QUASI_SOBOL64
    !> - HIPRAND_RNG_QUASI_SCRAMBLED_SOBOL64
    !>
    !> \param generator Pointer to generator
    !> \param rng_type Type of random number generator to create
    !>
    !> \return
    !> - HIPRAND_STATUS_ALLOCATION_FAILED, if memory allocation failed \n
    !> - HIPRAND_STATUS_INITIALIZATION_FAILED if there was a problem setting up the GPU \n
    !> - HIPRAND_STATUS_VERSION_MISMATCH if the header file version does not match the
    !> dynamically linked library version \n
    !> - HIPRAND_STATUS_TYPE_ERROR if the value for \p rng_type is invalid \n
    !> - HIPRAND_STATUS_NOT_IMPLEMENTED if generator of type \p rng_type is not implemented yet \n
    !> - HIPRAND_STATUS_SUCCESS if generator was created successfully \n
    function hiprandCreateGenerator_raw(generator, rng_type) &
       result(CreateGenerator_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandCreateGenerator")
#else
       bind(C, name="hiprandCreateGenerator")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: generator
       integer(c_int), value :: rng_type
       integer(c_int) :: CreateGenerator_raw
    end function hiprandCreateGenerator_raw

    module procedure hiprandCreateGenerator_typed
  end interface hiprandCreateGenerator

  interface hiprandCreateGeneratorHost
    !---------------------------------------------
    ! hiprandCreateGeneratorHost
    !---------------------------------------------
    !> \brief Creates a new random number generator on host.
    !>
    !> Creates a new host random number generator of type \p rng_type
    !> and returns it in \p generator. Created generator will use
    !> host CPU to generate random numbers.
    !>
    !> Values for \p rng_type are:
    !> - HIPRAND_RNG_PSEUDO_DEFAULT
    !> - HIPRAND_RNG_PSEUDO_XORWOW
    !> - HIPRAND_RNG_PSEUDO_MRG32K3A
    !> - HIPRAND_RNG_PSEUDO_MTGP32
    !> - HIPRAND_RNG_PSEUDO_MT19937
    !> - HIPRAND_RNG_PSEUDO_PHILOX4_32_10
    !> - HIPRAND_RNG_QUASI_DEFAULT
    !> - HIPRAND_RNG_QUASI_SOBOL32
    !> - HIPRAND_RNG_QUASI_SCRAMBLED_SOBOL32
    !> - HIPRAND_RNG_QUASI_SOBOL64
    !> - HIPRAND_RNG_QUASI_SCRAMBLED_SOBOL64
    !>
    !> \param generator Pointer to generator
    !> \param rng_type Type of random number generator to create
    !>
    !> \return
    !> - HIPRAND_STATUS_ALLOCATION_FAILED, if memory allocation failed \n
    !> - HIPRAND_STATUS_VERSION_MISMATCH if the header file version does not match the
    !> dynamically linked library version \n
    !> - HIPRAND_STATUS_TYPE_ERROR if the value for \p rng_type is invalid \n
    !> - HIPRAND_STATUS_NOT_IMPLEMENTED if host generator of type \p rng_type is not implemented yet
    !> \n
    !> - HIPRAND_STATUS_SUCCESS if generator was created successfully \n
    function hiprandCreateGeneratorHost_raw(generator, rng_type) &
       result(CreateGeneratorHost_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandCreateGeneratorHost")
#else
       bind(C, name="hiprandCreateGeneratorHost")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: generator
       integer(c_int), value :: rng_type
       integer(c_int) :: CreateGeneratorHost_raw
    end function hiprandCreateGeneratorHost_raw

    module procedure hiprandCreateGeneratorHost_typed
  end interface hiprandCreateGeneratorHost

  interface hiprandDestroyGenerator
    !---------------------------------------------
    ! hiprandDestroyGenerator
    !---------------------------------------------
    !> \brief Destroys random number generator.
    !>
    !> Destroys random number generator and frees related memory.
    !>
    !> \param generator Generator to be destroyed
    !>
    !> \return
    !> - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized \n
    !> - HIPRAND_STATUS_SUCCESS if generator was destroyed successfully \n
    function hiprandDestroyGenerator_raw(generator) &
       result(DestroyGenerator_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandDestroyGenerator")
#else
       bind(C, name="hiprandDestroyGenerator")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: generator
       integer(c_int) :: DestroyGenerator_raw
    end function hiprandDestroyGenerator_raw

    module procedure hiprandDestroyGenerator_typed
  end interface hiprandDestroyGenerator

  interface hiprandGenerate
    !---------------------------------------------
    ! hiprandGenerate
    !---------------------------------------------
    !> \brief Generates uniformly distributed 32-bit unsigned integers.
    !>
    !> Generates \p n uniformly distributed 32-bit unsigned integers and
    !> saves them to \p output_data.
    !>
    !> Generated numbers are between \p 0 and \p 2^32, including \p 0 and
    !> excluding \p 2^32.
    !>
    !> \param generator Generator to use
    !> \param output_data Pointer to memory to store generated numbers
    !> \param n Number of 32-bit unsigned integers to generate
    !>
    !> Note: \p generator must be not be of type \p HIPRAND_RNG_QUASI_SOBOL64
    !> or \p HIPRAND_RNG_QUASI_SCRAMBLED_SOBOL64.
    !>
    !> \return
    !> - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized \n
    !> - HIPRAND_STATUS_LAUNCH_FAILURE if generator failed to launch kernel \n
    !> - HIPRAND_STATUS_SUCCESS if random numbers were successfully generated \n
    function hiprandGenerate_raw(generator, output_data, n) &
       result(Generate_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandGenerate")
#else
       bind(C, name="hiprandGenerate")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: generator
       type(c_ptr), value :: output_data
       integer(c_long), value :: n
       integer(c_int) :: Generate_raw
    end function hiprandGenerate_raw

    module procedure hiprandGenerate_native
    module procedure hiprandGenerate_typed
  end interface hiprandGenerate

  interface hiprandGenerateChar
    !---------------------------------------------
    ! hiprandGenerateChar
    !---------------------------------------------
    !> \brief Generates uniformly distributed 8-bit unsigned integers.
    !>
    !> Generates \p n uniformly distributed 8-bit unsigned integers and
    !> saves them to \p output_data.
    !>
    !> Generated numbers are between \p 0 and \p 2^8, including \p 0 and
    !> excluding \p 2^8.
    !>
    !> \param generator Generator to use
    !> \param output_data Pointer to memory to store generated numbers
    !> \param n Number of 8-bit unsigned integers to generate
    !>
    !> \return
    !> - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized \n
    !> - HIPRAND_STATUS_LAUNCH_FAILURE if generator failed to launch kernel \n
    !> - HIPRAND_STATUS_SUCCESS if random numbers were successfully generated \n
    function hiprandGenerateChar_raw(generator, output_data, n) &
       result(GenerateChar_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandGenerateChar")
#else
       bind(C, name="hiprandGenerateChar")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: generator
       type(c_ptr), value :: output_data
       integer(c_long), value :: n
       integer(c_int) :: GenerateChar_raw
    end function hiprandGenerateChar_raw

    module procedure hiprandGenerateChar_typed
  end interface hiprandGenerateChar

  interface hiprandGenerateShort
    !---------------------------------------------
    ! hiprandGenerateShort
    !---------------------------------------------
    !> \brief Generates uniformly distributed 16-bit unsigned integers.
    !>
    !> Generates \p n uniformly distributed 16-bit unsigned integers and
    !> saves them to \p output_data.
    !>
    !> Generated numbers are between \p 0 and \p 2^16, including \p 0 and
    !> excluding \p 2^16.
    !>
    !> \param generator Generator to use
    !> \param output_data Pointer to memory to store generated numbers
    !> \param n Number of 16-bit unsigned integers to generate
    !>
    !> \return
    !> - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized \n
    !> - HIPRAND_STATUS_LAUNCH_FAILURE if generator failed to launch kernel \n
    !> - HIPRAND_STATUS_SUCCESS if random numbers were successfully generated \n
    function hiprandGenerateShort_raw(generator, output_data, n) &
       result(GenerateShort_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandGenerateShort")
#else
       bind(C, name="hiprandGenerateShort")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: generator
       type(c_ptr), value :: output_data
       integer(c_long), value :: n
       integer(c_int) :: GenerateShort_raw
    end function hiprandGenerateShort_raw

    module procedure hiprandGenerateShort_typed
  end interface hiprandGenerateShort

  interface hiprandGenerateLongLong
    !---------------------------------------------
    ! hiprandGenerateLongLong
    !---------------------------------------------
    !> \brief Generates uniformly distributed 64-bit unsigned integers.
    !>
    !> Generates \p n uniformly distributed 64-bit unsigned integers and
    !> saves them to \p output_data.
    !>
    !> Generated numbers are between \p 0 and \p 2^64, including \p 0 and
    !> excluding \p 2^64.
    !>
    !> \param generator Generator to use
    !> \param output_data Pointer to memory to store generated numbers
    !> \param n Number of 64-bit unsigned integers to generate
    !>
    !> Note: \p generator must be of type \p HIPRAND_RNG_QUASI_SOBOL64
    !> or \p HIPRAND_RNG_QUASI_SCRAMBLED_SOBOL64.
    !>
    !> \return
    !> - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized \n
    !> - HIPRAND_STATUS_LAUNCH_FAILURE if generator failed to launch kernel \n
    !> - HIPRAND_STATUS_SUCCESS if random numbers were successfully generated \n
    function hiprandGenerateLongLong_raw(generator, output_data, n) &
       result(GenerateLongLong_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandGenerateLongLong")
#else
       bind(C, name="hiprandGenerateLongLong")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: generator
       type(c_ptr), value :: output_data
       integer(c_long), value :: n
       integer(c_int) :: GenerateLongLong_raw
    end function hiprandGenerateLongLong_raw

    module procedure hiprandGenerateLongLong_native
    module procedure hiprandGenerateLongLong_typed
  end interface hiprandGenerateLongLong

  interface hiprandGenerateUniform
    !---------------------------------------------
    ! hiprandGenerateUniform
    !---------------------------------------------
    !> \brief Generates uniformly distributed floats.
    !>
    !> Generates \p n uniformly distributed 32-bit floating-point values
    !> and saves them to \p output_data.
    !>
    !> Generated numbers are between \p 0.0f and \p 1.0f, excluding \p 0.0f and
    !> including \p 1.0f.
    !>
    !> \param generator Generator to use
    !> \param output_data Pointer to memory to store generated numbers
    !> \param n Number of floats to generate
    !>
    !> \return
    !> - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized \n
    !> - HIPRAND_STATUS_LAUNCH_FAILURE if generator failed to launch kernel \n
    !> - HIPRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not a multiple of the dimension
    !> of used quasi-random generator \n
    !> - HIPRAND_STATUS_SUCCESS if random numbers were successfully generated \n
    function hiprandGenerateUniform_raw(generator, output_data, n) &
       result(GenerateUniform_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandGenerateUniform")
#else
       bind(C, name="hiprandGenerateUniform")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: generator
       type(c_ptr), value :: output_data
       integer(c_long), value :: n
       integer(c_int) :: GenerateUniform_raw
    end function hiprandGenerateUniform_raw

    module procedure hiprandGenerateUniform_native
    module procedure hiprandGenerateUniform_typed
  end interface hiprandGenerateUniform

  interface hiprandGenerateUniformDouble
    !---------------------------------------------
    ! hiprandGenerateUniformDouble
    !---------------------------------------------
    !> \brief Generates uniformly distributed double-precision floating-point values.
    !>
    !> Generates \p n uniformly distributed 64-bit double-precision floating-point
    !> values and saves them to \p output_data.
    !>
    !> Generated numbers are between \p 0.0 and \p 1.0, excluding \p 0.0 and
    !> including \p 1.0.
    !>
    !> \param generator Generator to use
    !> \param output_data Pointer to memory to store generated numbers
    !> \param n Number of floats to generate
    !>
    !> Note: When \p generator is of type: \p HIPRAND_RNG_PSEUDO_MRG32K3A,
    !> \p HIPRAND_RNG_PSEUDO_MTGP32, \p HIPRAND_RNG_QUASI_SOBOL32, or
    !> \p HIPRAND_RNG_QUASI_SCRAMBLED_SOBOL32 then the returned \p double
    !> values are generated from only 32 random bits
    !> each (one unsigned int value per one generated \p double).
    !>
    !> \return
    !> - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized \n
    !> - HIPRAND_STATUS_LAUNCH_FAILURE if generator failed to launch kernel \n
    !> - HIPRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not a multiple of the dimension
    !> of used quasi-random generator \n
    !> - HIPRAND_STATUS_SUCCESS if random numbers were successfully generated \n
    function hiprandGenerateUniformDouble_raw(generator, output_data, n) &
       result(GenerateUniformDouble_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandGenerateUniformDouble")
#else
       bind(C, name="hiprandGenerateUniformDouble")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: generator
       type(c_ptr), value :: output_data
       integer(c_long), value :: n
       integer(c_int) :: GenerateUniformDouble_raw
    end function hiprandGenerateUniformDouble_raw

    module procedure hiprandGenerateUniformDouble_native
    module procedure hiprandGenerateUniformDouble_typed
  end interface hiprandGenerateUniformDouble

  interface hiprandGenerateUniformHalf
    !---------------------------------------------
    ! hiprandGenerateUniformHalf
    !---------------------------------------------
    !> \brief Generates uniformly distributed half-precision floating-point values.
    !>
    !> Generates \p n uniformly distributed 16-bit half-precision floating-point
    !> values and saves them to \p output_data.
    !>
    !> Generated numbers are between \p 0.0 and \p 1.0, excluding \p 0.0 and
    !> including \p 1.0.
    !>
    !> \param generator Generator to use
    !> \param output_data Pointer to memory to store generated numbers
    !> \param n Number of halfs to generate
    !>
    !> \return
    !> - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized \n
    !> - HIPRAND_STATUS_LAUNCH_FAILURE if generator failed to launch kernel \n
    !> - HIPRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not a multiple of the dimension
    !> of used quasi-random generator \n
    !> - HIPRAND_STATUS_SUCCESS if random numbers were successfully generated \n
    function hiprandGenerateUniformHalf_raw(generator, output_data, n) &
       result(GenerateUniformHalf_raw) &
       bind(C, name="hiprandGenerateUniformHalf")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: generator
       type(c_ptr), value :: output_data
       integer(c_long), value :: n
       integer(c_int) :: GenerateUniformHalf_raw
    end function hiprandGenerateUniformHalf_raw

    module procedure hiprandGenerateUniformHalf_native
    module procedure hiprandGenerateUniformHalf_typed
  end interface hiprandGenerateUniformHalf

  interface hiprandGenerateNormal
    !---------------------------------------------
    ! hiprandGenerateNormal
    !---------------------------------------------
    !> \brief Generates normally distributed floats.
    !>
    !> Generates \p n normally distributed 32-bit floating-point
    !> values and saves them to \p output_data.
    !>
    !> \param generator Generator to use
    !> \param output_data Pointer to memory to store generated numbers
    !> \param n Number of floats to generate
    !> \param mean Mean value of normal distribution
    !> \param stddev Standard deviation value of normal distribution
    !>
    !> \return
    !> - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized \n
    !> - HIPRAND_STATUS_LAUNCH_FAILURE if generator failed to launch kernel \n
    !> - HIPRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not even, \p output_data is not
    !> aligned to \p sizeof(float2) bytes, or \p n is not a multiple of the dimension
    !> of used quasi-random generator \n
    !> - HIPRAND_STATUS_SUCCESS if random numbers were successfully generated \n
    function hiprandGenerateNormal_raw(generator, output_data, n, mean, stddev) &
       result(GenerateNormal_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandGenerateNormal")
#else
       bind(C, name="hiprandGenerateNormal")
#endif
       import :: c_ptr, c_long, c_float, c_int
       type(c_ptr), value :: generator
       type(c_ptr), value :: output_data
       integer(c_long), value :: n
       real(c_float), value :: mean
       real(c_float), value :: stddev
       integer(c_int) :: GenerateNormal_raw
    end function hiprandGenerateNormal_raw

    module procedure hiprandGenerateNormal_native
    module procedure hiprandGenerateNormal_typed
  end interface hiprandGenerateNormal

  interface hiprandGenerateNormalDouble
    !---------------------------------------------
    ! hiprandGenerateNormalDouble
    !---------------------------------------------
    !> \brief Generates normally distributed doubles.
    !>
    !> Generates \p n normally distributed 64-bit double-precision floating-point
    !> numbers and saves them to \p output_data.
    !>
    !> \param generator Generator to use
    !> \param output_data Pointer to memory to store generated numbers
    !> \param n Number of doubles to generate
    !> \param mean Mean value of normal distribution
    !> \param stddev Standard deviation value of normal distribution
    !>
    !> \return
    !> - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized \n
    !> - HIPRAND_STATUS_LAUNCH_FAILURE if generator failed to launch kernel \n
    !> - HIPRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not even, \p output_data is not
    !> aligned to \p sizeof(double2) bytes, or \p n is not a multiple of the dimension
    !> of used quasi-random generator \n
    !> - HIPRAND_STATUS_SUCCESS if random numbers were successfully generated \n
    function hiprandGenerateNormalDouble_raw(generator, output_data, n, mean, stddev) &
       result(GenerateNormalDouble_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandGenerateNormalDouble")
#else
       bind(C, name="hiprandGenerateNormalDouble")
#endif
       import :: c_ptr, c_long, c_double, c_int
       type(c_ptr), value :: generator
       type(c_ptr), value :: output_data
       integer(c_long), value :: n
       real(c_double), value :: mean
       real(c_double), value :: stddev
       integer(c_int) :: GenerateNormalDouble_raw
    end function hiprandGenerateNormalDouble_raw

    module procedure hiprandGenerateNormalDouble_native
    module procedure hiprandGenerateNormalDouble_typed
  end interface hiprandGenerateNormalDouble

  interface hiprandGenerateNormalHalf
    !---------------------------------------------
    ! hiprandGenerateNormalHalf
    !---------------------------------------------
    !> \brief Generates normally distributed halfs.
    !>
    !> Generates \p n normally distributed 16-bit half-precision floating-point
    !> numbers and saves them to \p output_data.
    !>
    !> \param generator Generator to use
    !> \param output_data Pointer to memory to store generated numbers
    !> \param n Number of halfs to generate
    !> \param mean Mean value of normal distribution
    !> \param stddev Standard deviation value of normal distribution
    !>
    !> \return
    !> - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized \n
    !> - HIPRAND_STATUS_LAUNCH_FAILURE if generator failed to launch kernel \n
    !> - HIPRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not even, \p output_data is not
    !> aligned to \p sizeof(half2) bytes, or \p n is not a multiple of the dimension
    !> of used quasi-random generator \n
    !> - HIPRAND_STATUS_SUCCESS if random numbers were successfully generated \n
    function hiprandGenerateNormalHalf_raw(generator, output_data, n, mean, stddev) &
       result(GenerateNormalHalf_raw) &
       bind(C, name="hiprandGenerateNormalHalf")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: generator
       type(c_ptr), value :: output_data
       integer(c_long), value :: n
       integer(c_int), value :: mean
       integer(c_int), value :: stddev
       integer(c_int) :: GenerateNormalHalf_raw
    end function hiprandGenerateNormalHalf_raw

    module procedure hiprandGenerateNormalHalf_native
    module procedure hiprandGenerateNormalHalf_typed
  end interface hiprandGenerateNormalHalf

  interface hiprandGenerateLogNormal
    !---------------------------------------------
    ! hiprandGenerateLogNormal
    !---------------------------------------------
    !> \brief Generates log-normally distributed floats.
    !>
    !> Generates \p n log-normally distributed 32-bit floating-point values
    !> and saves them to \p output_data.
    !>
    !> \param generator Generator to use
    !> \param output_data Pointer to memory to store generated numbers
    !> \param n Number of floats to generate
    !> \param mean Mean value of log normal distribution
    !> \param stddev Standard deviation value of log normal distribution
    !>
    !> \return
    !> - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized \n
    !> - HIPRAND_STATUS_LAUNCH_FAILURE if generator failed to launch kernel \n
    !> - HIPRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not even, \p output_data is not
    !> aligned to \p sizeof(float2) bytes, or \p n is not a multiple of the dimension
    !> of used quasi-random generator \n
    !> - HIPRAND_STATUS_SUCCESS if random numbers were successfully generated \n
    function hiprandGenerateLogNormal_raw(generator, output_data, n, mean, stddev) &
       result(GenerateLogNormal_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandGenerateLogNormal")
#else
       bind(C, name="hiprandGenerateLogNormal")
#endif
       import :: c_ptr, c_long, c_float, c_int
       type(c_ptr), value :: generator
       type(c_ptr), value :: output_data
       integer(c_long), value :: n
       real(c_float), value :: mean
       real(c_float), value :: stddev
       integer(c_int) :: GenerateLogNormal_raw
    end function hiprandGenerateLogNormal_raw

    module procedure hiprandGenerateLogNormal_native
    module procedure hiprandGenerateLogNormal_typed
  end interface hiprandGenerateLogNormal

  interface hiprandGenerateLogNormalDouble
    !---------------------------------------------
    ! hiprandGenerateLogNormalDouble
    !---------------------------------------------
    !> \brief Generates log-normally distributed doubles.
    !>
    !> Generates \p n log-normally distributed 64-bit double-precision floating-point
    !> values and saves them to \p output_data.
    !>
    !> \param generator Generator to use
    !> \param output_data Pointer to memory to store generated numbers
    !> \param n Number of doubles to generate
    !> \param mean Mean value of log normal distribution
    !> \param stddev Standard deviation value of log normal distribution
    !>
    !> \return
    !> - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized \n
    !> - HIPRAND_STATUS_LAUNCH_FAILURE if generator failed to launch kernel \n
    !> - HIPRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not even, \p output_data is not
    !> aligned to \p sizeof(double2) bytes, or \p n is not a multiple of the dimension
    !> of used quasi-random generator \n
    !> - HIPRAND_STATUS_SUCCESS if random numbers were successfully generated \n
    function hiprandGenerateLogNormalDouble_raw(generator, output_data, n, mean, stddev) &
       result(GenerateLogNormalDouble_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandGenerateLogNormalDouble")
#else
       bind(C, name="hiprandGenerateLogNormalDouble")
#endif
       import :: c_ptr, c_long, c_double, c_int
       type(c_ptr), value :: generator
       type(c_ptr), value :: output_data
       integer(c_long), value :: n
       real(c_double), value :: mean
       real(c_double), value :: stddev
       integer(c_int) :: GenerateLogNormalDouble_raw
    end function hiprandGenerateLogNormalDouble_raw

    module procedure hiprandGenerateLogNormalDouble_native
    module procedure hiprandGenerateLogNormalDouble_typed
  end interface hiprandGenerateLogNormalDouble

  interface hiprandGenerateLogNormalHalf
    !---------------------------------------------
    ! hiprandGenerateLogNormalHalf
    !---------------------------------------------
    !> \brief Generates log-normally distributed halfs.
    !>
    !> Generates \p n log-normally distributed 16-bit half-precision floating-point
    !> values and saves them to \p output_data.
    !>
    !> \param generator Generator to use
    !> \param output_data Pointer to memory to store generated numbers
    !> \param n Number of halfs to generate
    !> \param mean Mean value of log normal distribution
    !> \param stddev Standard deviation value of log normal distribution
    !>
    !> \return
    !> - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized \n
    !> - HIPRAND_STATUS_LAUNCH_FAILURE if generator failed to launch kernel \n
    !> - HIPRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not even, \p output_data is not
    !> aligned to \p sizeof(half2) bytes, or \p n is not a multiple of the dimension
    !> of used quasi-random generator \n
    !> - HIPRAND_STATUS_SUCCESS if random numbers were successfully generated \n
    function hiprandGenerateLogNormalHalf_raw(generator, output_data, n, mean, stddev) &
       result(GenerateLogNormalHalf_raw) &
       bind(C, name="hiprandGenerateLogNormalHalf")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: generator
       type(c_ptr), value :: output_data
       integer(c_long), value :: n
       integer(c_int), value :: mean
       integer(c_int), value :: stddev
       integer(c_int) :: GenerateLogNormalHalf_raw
    end function hiprandGenerateLogNormalHalf_raw

    module procedure hiprandGenerateLogNormalHalf_native
    module procedure hiprandGenerateLogNormalHalf_typed
  end interface hiprandGenerateLogNormalHalf

  interface hiprandGeneratePoisson
    !---------------------------------------------
    ! hiprandGeneratePoisson
    !---------------------------------------------
    !> \brief Generates Poisson-distributed 32-bit unsigned integers.
    !>
    !> Generates \p n Poisson-distributed 32-bit unsigned integers and
    !> saves them to \p output_data.
    !>
    !> \param generator Generator to use
    !> \param output_data Pointer to memory to store generated numbers
    !> \param n Number of 32-bit unsigned integers to generate
    !> \param lambda lambda for the Poisson distribution
    !>
    !> \return
    !> - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized \n
    !> - HIPRAND_STATUS_LAUNCH_FAILURE if generator failed to launch kernel \n
    !> - HIPRAND_STATUS_OUT_OF_RANGE if lambda is non-positive \n
    !> - HIPRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not a multiple of the dimension
    !> of used quasi-random generator \n
    !> - HIPRAND_STATUS_SUCCESS if random numbers were successfully generated \n
    function hiprandGeneratePoisson_raw(generator, output_data, n, lambda) &
       result(GeneratePoisson_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandGeneratePoisson")
#else
       bind(C, name="hiprandGeneratePoisson")
#endif
       import :: c_ptr, c_long, c_double, c_int
       type(c_ptr), value :: generator
       type(c_ptr), value :: output_data
       integer(c_long), value :: n
       real(c_double), value :: lambda
       integer(c_int) :: GeneratePoisson_raw
    end function hiprandGeneratePoisson_raw

    module procedure hiprandGeneratePoisson_native
    module procedure hiprandGeneratePoisson_typed
  end interface hiprandGeneratePoisson

  interface hiprandGenerateSeeds
    !---------------------------------------------
    ! hiprandGenerateSeeds
    !---------------------------------------------
    !> \brief Initializes the generator's state on GPU or host.
    !>
    !> Initializes the generator's state on GPU or host.
    !>
    !> If hiprandGenerateSeeds() was not called for a generator, it will be
    !> automatically called by functions which generates random numbers like
    !> hiprandGenerate(), hiprandGenerateUniform(), hiprandGenerateNormal() etc.
    !>
    !> \param generator Generator to initialize
    !>
    !> \return
    !> - HIPRAND_STATUS_NOT_INITIALIZED if the generator was never created \n
    !> - HIPRAND_STATUS_PREEXISTING_FAILURE if there was an existing error from
    !> a previous kernel launch \n
    !> - HIPRAND_STATUS_LAUNCH_FAILURE if the kernel launch failed for any reason \n
    !> - HIPRAND_STATUS_SUCCESS if the seeds were generated successfully \n
    function hiprandGenerateSeeds_raw(generator) &
       result(GenerateSeeds_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandGenerateSeeds")
#else
       bind(C, name="hiprandGenerateSeeds")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: generator
       integer(c_int) :: GenerateSeeds_raw
    end function hiprandGenerateSeeds_raw

    module procedure hiprandGenerateSeeds_typed
  end interface hiprandGenerateSeeds

  interface hiprandSetStream
    !---------------------------------------------
    ! hiprandSetStream
    !---------------------------------------------
    !> \brief Sets the current stream for kernel launches.
    !>
    !> Sets the current stream for all kernel launches of the generator.
    !> All functions will use this stream.
    !>
    !> \param generator Generator to modify
    !> \param stream Stream to use or NULL for default stream
    !>
    !> \return
    !> - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized \n
    !> - HIPRAND_STATUS_SUCCESS if stream was set successfully \n
    function hiprandSetStream_raw(generator, stream) &
       result(SetStream_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandSetStream")
#else
       bind(C, name="hiprandSetStream")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: generator
       type(c_ptr), value :: stream
       integer(c_int) :: SetStream_raw
    end function hiprandSetStream_raw

    module procedure hiprandSetStream_typed
  end interface hiprandSetStream

  interface hiprandSetPseudoRandomGeneratorSeed
    !---------------------------------------------
    ! hiprandSetPseudoRandomGeneratorSeed
    !---------------------------------------------
    !> \brief Sets the seed of a pseudo-random number generator.
    !>
    !> Sets the seed of the pseudo-random number generator.
    !>
    !> - This operation resets the generator's internal state.
    !> - This operation does not change the generator's offset.
    !>
    !> \param generator Pseudo-random number generator
    !> \param seed New seed value
    !>
    !> \return
    !> - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized \n
    !> - HIPRAND_STATUS_TYPE_ERROR if the generator is a quasi random number generator \n
    !> - HIPRAND_STATUS_SUCCESS if seed was set successfully \n
    function hiprandSetPseudoRandomGeneratorSeed_raw(generator, seed) &
       result(SetPseudoRandomGeneratorSeed_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandSetPseudoRandomGeneratorSeed")
#else
       bind(C, name="hiprandSetPseudoRandomGeneratorSeed")
#endif
       import :: c_ptr, c_int64_t, c_int
       type(c_ptr), value :: generator
       integer(c_int64_t), value :: seed
       integer(c_int) :: SetPseudoRandomGeneratorSeed_raw
    end function hiprandSetPseudoRandomGeneratorSeed_raw

    module procedure hiprandSetPseudoRandomGeneratorSeed_typed
  end interface hiprandSetPseudoRandomGeneratorSeed

  interface hiprandSetGeneratorOffset
    !---------------------------------------------
    ! hiprandSetGeneratorOffset
    !---------------------------------------------
    !> \brief Sets the offset of a random number generator.
    !>
    !> Sets the absolute offset of the random number generator.
    !>
    !> - This operation resets the generator's internal state.
    !> - This operation does not change the generator's seed.
    !>
    !> Absolute offset cannot be set if generator's type is
    !> HIPRAND_RNG_PSEUDO_MTGP32 or HIPRAND_RNG_PSEUDO_MT19937.
    !>
    !> \param generator Random number generator
    !> \param offset New absolute offset
    !>
    !> \return
    !> - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized \n
    !> - HIPRAND_STATUS_SUCCESS if offset was successfully set \n
    !> - HIPRAND_STATUS_TYPE_ERROR if generator's type is HIPRAND_RNG_PSEUDO_MTGP32
    !> or HIPRAND_RNG_PSEUDO_MT19937 \n
    function hiprandSetGeneratorOffset_raw(generator, offset) &
       result(SetGeneratorOffset_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandSetGeneratorOffset")
#else
       bind(C, name="hiprandSetGeneratorOffset")
#endif
       import :: c_ptr, c_int64_t, c_int
       type(c_ptr), value :: generator
       integer(c_int64_t), value :: offset
       integer(c_int) :: SetGeneratorOffset_raw
    end function hiprandSetGeneratorOffset_raw

    module procedure hiprandSetGeneratorOffset_typed
  end interface hiprandSetGeneratorOffset

  interface hiprandSetGeneratorOrdering
    !---------------------------------------------
    ! hiprandSetGeneratorOrdering
    !---------------------------------------------
    !> \brief Sets the ordering of a random number generator.
    !>
    !> Sets the ordering of the results of a random number generator.
    !>
    !> - This operation resets the generator's internal state.
    !> - This operation does not change the generator's seed.
    !>
    !> \param generator Random number generator
    !> \param order New ordering of results
    !>
    !> The ordering choices for pseudorandom sequences are
    !> HIPRAND_ORDERING_PSEUDO_DEFAULT and
    !> HIPRAND_ORDERING_PSEUDO_LEGACY.
    !> The default ordering is HIPRAND_ORDERING_PSEUDO_DEFAULT, which is equal to
    !> HIPRAND_ORDERING_PSEUDO_LEGACY for now.
    !>
    !> For quasirandom sequences there is only one ordering, HIPRAND_ORDERING_QUASI_DEFAULT.
    !>
    !> \return
    !> - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized \n
    !> - HIPRAND_STATUS_OUT_OF_RANGE if the ordering is not valid \n
    !> - HIPRAND_STATUS_SUCCESS if the ordering was successfully set \n
    !> - HIPRAND_STATUS_TYPE_ERROR if generator's type is not valid
    function hiprandSetGeneratorOrdering_raw(generator, order) &
       result(SetGeneratorOrdering_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandSetGeneratorOrdering")
#else
       bind(C, name="hiprandSetGeneratorOrdering")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: generator
       integer(c_int), value :: order
       integer(c_int) :: SetGeneratorOrdering_raw
    end function hiprandSetGeneratorOrdering_raw

    module procedure hiprandSetGeneratorOrdering_typed
  end interface hiprandSetGeneratorOrdering

  interface hiprandSetQuasiRandomGeneratorDimensions
    !---------------------------------------------
    ! hiprandSetQuasiRandomGeneratorDimensions
    !---------------------------------------------
    !> \brief Set the number of dimensions of a quasi-random number generator.
    !>
    !> Set the number of dimensions of a quasi-random number generator.
    !> Supported values of \p dimensions are 1 to 20000.
    !>
    !> - This operation resets the generator's internal state.
    !> - This operation does not change the generator's offset.
    !>
    !> \param generator Quasi-random number generator
    !> \param dimensions Number of dimensions
    !>
    !> \return
    !> - HIPRAND_STATUS_NOT_CREATED if the generator wasn't created \n
    !> - HIPRAND_STATUS_TYPE_ERROR if the generator is not a quasi-random number generator \n
    !> - HIPRAND_STATUS_OUT_OF_RANGE if \p dimensions is out of range \n
    !> - HIPRAND_STATUS_SUCCESS if the number of dimensions was set successfully \n
    function hiprandSetQuasiRandomGeneratorDimensions_raw(generator, dimensions) &
       result(SetQuasiRandomGeneratorDimensions_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandSetQuasiRandomGeneratorDimensions")
#else
       bind(C, name="hiprandSetQuasiRandomGeneratorDimensions")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: generator
       integer(c_int), value :: dimensions
       integer(c_int) :: SetQuasiRandomGeneratorDimensions_raw
    end function hiprandSetQuasiRandomGeneratorDimensions_raw

    module procedure hiprandSetQuasiRandomGeneratorDimensions_typed
  end interface hiprandSetQuasiRandomGeneratorDimensions

  interface hiprandGetVersion
    !---------------------------------------------
    ! hiprandGetVersion
    !---------------------------------------------
    !> \brief Returns the version number of the cuRAND or rocRAND library.
    !>
    !> Returns in \p version the version number of the underlying cuRAND or
    !> rocRAND library.
    !>
    !> \param version Version of the library
    !>
    !> \return
    !> - HIPRAND_STATUS_OUT_OF_RANGE if \p version is NULL \n
    !> - HIPRAND_STATUS_SUCCESS if the version number was successfully returned \n
    function hiprandGetVersion_raw(version) &
       result(GetVersion_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandGetVersion")
#else
       bind(C, name="hiprandGetVersion")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: version
       integer(c_int) :: GetVersion_raw
    end function hiprandGetVersion_raw

    module procedure hiprandGetVersion_native
  end interface hiprandGetVersion

  interface hiprandCreatePoissonDistribution
    !---------------------------------------------
    ! hiprandCreatePoissonDistribution
    !---------------------------------------------
    !> \brief Construct the histogram for a Poisson distribution.
    !>
    !> Construct the histogram for the Poisson distribution with lambda \p lambda.
    !>
    !> \param lambda lambda for the Poisson distribution
    !> \param discrete_distribution pointer to the histogram in device memory
    !>
    !> \return
    !> - HIPRAND_STATUS_ALLOCATION_FAILED if memory could not be allocated \n
    !> - HIPRAND_STATUS_OUT_OF_RANGE if \p discrete_distribution pointer was null \n
    !> - HIPRAND_STATUS_OUT_OF_RANGE if lambda is non-positive \n
    !> - HIPRAND_STATUS_SUCCESS if the histogram was constructed successfully \n
    function hiprandCreatePoissonDistribution_raw(lambda, discrete_distribution) &
       result(CreatePoissonDistribution_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandCreatePoissonDistribution")
#else
       bind(C, name="hiprandCreatePoissonDistribution")
#endif
       import :: c_double, c_ptr, c_int
       real(c_double), value :: lambda
       type(c_ptr) :: discrete_distribution
       integer(c_int) :: CreatePoissonDistribution_raw
    end function hiprandCreatePoissonDistribution_raw

    module procedure hiprandCreatePoissonDistribution_typed
  end interface hiprandCreatePoissonDistribution

  interface hiprandDestroyDistribution
    !---------------------------------------------
    ! hiprandDestroyDistribution
    !---------------------------------------------
    !> \brief Destroy the histogram array for a discrete distribution.
    !>
    !> Destroy the histogram array for a discrete distribution created by
    !> hiprandCreatePoissonDistribution.
    !>
    !> \param discrete_distribution pointer to the histogram in device memory
    !>
    !> \return
    !> - HIPRAND_STATUS_OUT_OF_RANGE if \p discrete_distribution was null \n
    !> - HIPRAND_STATUS_SUCCESS if the histogram was destroyed successfully \n
    function hiprandDestroyDistribution_raw(discrete_distribution) &
       result(DestroyDistribution_raw) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandDestroyDistribution")
#else
       bind(C, name="hiprandDestroyDistribution")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: discrete_distribution
       integer(c_int) :: DestroyDistribution_raw
    end function hiprandDestroyDistribution_raw

    module procedure hiprandDestroyDistribution_typed
  end interface hiprandDestroyDistribution


contains

    function hiprandCreateGenerator_typed(generator, rng_type) result(CreateGenerator)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t) :: generator
      integer(c_int), value :: rng_type
      integer(c_int) :: CreateGenerator
      CreateGenerator = hiprandCreateGenerator_raw(generator%ptr, rng_type)
    end function hiprandCreateGenerator_typed

    function hiprandCreateGeneratorHost_typed(generator, rng_type) result(CreateGeneratorHost)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t) :: generator
      integer(c_int), value :: rng_type
      integer(c_int) :: CreateGeneratorHost
      CreateGeneratorHost = hiprandCreateGeneratorHost_raw(generator%ptr, rng_type)
    end function hiprandCreateGeneratorHost_typed

    function hiprandDestroyGenerator_typed(generator) result(DestroyGenerator)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      integer(c_int) :: DestroyGenerator
      DestroyGenerator = hiprandDestroyGenerator_raw(generator%ptr)
    end function hiprandDestroyGenerator_typed

    function hiprandGenerate_native(generator, output_data, n) result(Generate)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: generator
      integer(c_int), target :: output_data(*)
      integer(c_long), value :: n
      integer(c_int) :: Generate
      Generate = hiprandGenerate_raw(generator, c_loc(output_data(1)), n)
    end function hiprandGenerate_native

    function hiprandGenerate_typed(generator, output_data, n) result(Generate)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_long), value :: n
      integer(c_int) :: Generate
      Generate = hiprandGenerate_raw(generator%ptr, output_data, n)
    end function hiprandGenerate_typed

    function hiprandGenerateChar_typed(generator, output_data, n) result(GenerateChar)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_long), value :: n
      integer(c_int) :: GenerateChar
      GenerateChar = hiprandGenerateChar_raw(generator%ptr, output_data, n)
    end function hiprandGenerateChar_typed

    function hiprandGenerateShort_typed(generator, output_data, n) result(GenerateShort)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_long), value :: n
      integer(c_int) :: GenerateShort
      GenerateShort = hiprandGenerateShort_raw(generator%ptr, output_data, n)
    end function hiprandGenerateShort_typed

    function hiprandGenerateLongLong_native(generator, output_data, n) result(GenerateLongLong)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: generator
      integer(c_int64_t), target :: output_data(*)
      integer(c_long), value :: n
      integer(c_int) :: GenerateLongLong
      GenerateLongLong = hiprandGenerateLongLong_raw(generator, c_loc(output_data(1)), n)
    end function hiprandGenerateLongLong_native

    function hiprandGenerateLongLong_typed(generator, output_data, n) result(GenerateLongLong)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_long), value :: n
      integer(c_int) :: GenerateLongLong
      GenerateLongLong = hiprandGenerateLongLong_raw(generator%ptr, output_data, n)
    end function hiprandGenerateLongLong_typed

    function hiprandGenerateUniform_native(generator, output_data, n) result(GenerateUniform)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: generator
      real(c_float), target :: output_data(*)
      integer(c_long), value :: n
      integer(c_int) :: GenerateUniform
      GenerateUniform = hiprandGenerateUniform_raw(generator, c_loc(output_data(1)), n)
    end function hiprandGenerateUniform_native

    function hiprandGenerateUniform_typed(generator, output_data, n) result(GenerateUniform)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_long), value :: n
      integer(c_int) :: GenerateUniform
      GenerateUniform = hiprandGenerateUniform_raw(generator%ptr, output_data, n)
    end function hiprandGenerateUniform_typed

    function hiprandGenerateUniformDouble_native(generator, output_data, n) result( &
        GenerateUniformDouble)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: generator
      real(c_double), target :: output_data(*)
      integer(c_long), value :: n
      integer(c_int) :: GenerateUniformDouble
      GenerateUniformDouble = hiprandGenerateUniformDouble_raw(generator, c_loc(output_data(1)), n)
    end function hiprandGenerateUniformDouble_native

    function hiprandGenerateUniformDouble_typed(generator, output_data, n) result( &
        GenerateUniformDouble)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_long), value :: n
      integer(c_int) :: GenerateUniformDouble
      GenerateUniformDouble = hiprandGenerateUniformDouble_raw(generator%ptr, output_data, n)
    end function hiprandGenerateUniformDouble_typed

    function hiprandGenerateUniformHalf_native(generator, output_data, n) result( &
        GenerateUniformHalf)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: generator
      integer(c_int), target :: output_data(*)
      integer(c_long), value :: n
      integer(c_int) :: GenerateUniformHalf
      GenerateUniformHalf = hiprandGenerateUniformHalf_raw(generator, c_loc(output_data(1)), n)
    end function hiprandGenerateUniformHalf_native

    function hiprandGenerateUniformHalf_typed(generator, output_data, n) result(GenerateUniformHalf)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_long), value :: n
      integer(c_int) :: GenerateUniformHalf
      GenerateUniformHalf = hiprandGenerateUniformHalf_raw(generator%ptr, output_data, n)
    end function hiprandGenerateUniformHalf_typed

    function hiprandGenerateNormal_native(generator, output_data, n, mean, stddev) result( &
        GenerateNormal)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: generator
      real(c_float), target :: output_data(*)
      integer(c_long), value :: n
      real(c_float), value :: mean
      real(c_float), value :: stddev
      integer(c_int) :: GenerateNormal
      GenerateNormal = hiprandGenerateNormal_raw(generator, c_loc(output_data(1)), n, mean, stddev)
    end function hiprandGenerateNormal_native

    function hiprandGenerateNormal_typed(generator, output_data, n, mean, stddev) result( &
        GenerateNormal)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_long), value :: n
      real(c_float), value :: mean
      real(c_float), value :: stddev
      integer(c_int) :: GenerateNormal
      GenerateNormal = hiprandGenerateNormal_raw(generator%ptr, output_data, n, mean, stddev)
    end function hiprandGenerateNormal_typed

    function hiprandGenerateNormalDouble_native(generator, output_data, n, mean, stddev) result( &
        GenerateNormalDouble)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: generator
      real(c_double), target :: output_data(*)
      integer(c_long), value :: n
      real(c_double), value :: mean
      real(c_double), value :: stddev
      integer(c_int) :: GenerateNormalDouble
      GenerateNormalDouble = hiprandGenerateNormalDouble_raw(generator, c_loc(output_data(1)), n, &
        mean, stddev)
    end function hiprandGenerateNormalDouble_native

    function hiprandGenerateNormalDouble_typed(generator, output_data, n, mean, stddev) result( &
        GenerateNormalDouble)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_long), value :: n
      real(c_double), value :: mean
      real(c_double), value :: stddev
      integer(c_int) :: GenerateNormalDouble
      GenerateNormalDouble = hiprandGenerateNormalDouble_raw(generator%ptr, output_data, n, mean, &
        stddev)
    end function hiprandGenerateNormalDouble_typed

    function hiprandGenerateNormalHalf_native(generator, output_data, n, mean, stddev) result( &
        GenerateNormalHalf)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: generator
      integer(c_int), target :: output_data(*)
      integer(c_long), value :: n
      integer(c_int), value :: mean
      integer(c_int), value :: stddev
      integer(c_int) :: GenerateNormalHalf
      GenerateNormalHalf = hiprandGenerateNormalHalf_raw(generator, c_loc(output_data(1)), n, &
        mean, stddev)
    end function hiprandGenerateNormalHalf_native

    function hiprandGenerateNormalHalf_typed(generator, output_data, n, mean, stddev) result( &
        GenerateNormalHalf)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_long), value :: n
      integer(c_int), value :: mean
      integer(c_int), value :: stddev
      integer(c_int) :: GenerateNormalHalf
      GenerateNormalHalf = hiprandGenerateNormalHalf_raw(generator%ptr, output_data, n, mean, &
        stddev)
    end function hiprandGenerateNormalHalf_typed

    function hiprandGenerateLogNormal_native(generator, output_data, n, mean, stddev) result( &
        GenerateLogNormal)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: generator
      real(c_float), target :: output_data(*)
      integer(c_long), value :: n
      real(c_float), value :: mean
      real(c_float), value :: stddev
      integer(c_int) :: GenerateLogNormal
      GenerateLogNormal = hiprandGenerateLogNormal_raw(generator, c_loc(output_data(1)), n, mean, &
        stddev)
    end function hiprandGenerateLogNormal_native

    function hiprandGenerateLogNormal_typed(generator, output_data, n, mean, stddev) result( &
        GenerateLogNormal)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_long), value :: n
      real(c_float), value :: mean
      real(c_float), value :: stddev
      integer(c_int) :: GenerateLogNormal
      GenerateLogNormal = hiprandGenerateLogNormal_raw(generator%ptr, output_data, n, mean, stddev)
    end function hiprandGenerateLogNormal_typed

    function hiprandGenerateLogNormalDouble_native(generator, output_data, n, mean, &
        stddev) result(GenerateLogNormalDouble)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: generator
      real(c_double), target :: output_data(*)
      integer(c_long), value :: n
      real(c_double), value :: mean
      real(c_double), value :: stddev
      integer(c_int) :: GenerateLogNormalDouble
      GenerateLogNormalDouble = hiprandGenerateLogNormalDouble_raw(generator, c_loc(output_data( &
        1)), n, mean, stddev)
    end function hiprandGenerateLogNormalDouble_native

    function hiprandGenerateLogNormalDouble_typed(generator, output_data, n, mean, stddev) result( &
        GenerateLogNormalDouble)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_long), value :: n
      real(c_double), value :: mean
      real(c_double), value :: stddev
      integer(c_int) :: GenerateLogNormalDouble
      GenerateLogNormalDouble = hiprandGenerateLogNormalDouble_raw(generator%ptr, output_data, n, &
        mean, stddev)
    end function hiprandGenerateLogNormalDouble_typed

    function hiprandGenerateLogNormalHalf_native(generator, output_data, n, mean, stddev) result( &
        GenerateLogNormalHalf)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: generator
      integer(c_int), target :: output_data(*)
      integer(c_long), value :: n
      integer(c_int), value :: mean
      integer(c_int), value :: stddev
      integer(c_int) :: GenerateLogNormalHalf
      GenerateLogNormalHalf = hiprandGenerateLogNormalHalf_raw(generator, c_loc(output_data(1)), &
        n, mean, stddev)
    end function hiprandGenerateLogNormalHalf_native

    function hiprandGenerateLogNormalHalf_typed(generator, output_data, n, mean, stddev) result( &
        GenerateLogNormalHalf)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_long), value :: n
      integer(c_int), value :: mean
      integer(c_int), value :: stddev
      integer(c_int) :: GenerateLogNormalHalf
      GenerateLogNormalHalf = hiprandGenerateLogNormalHalf_raw(generator%ptr, output_data, n, &
        mean, stddev)
    end function hiprandGenerateLogNormalHalf_typed

    function hiprandGeneratePoisson_native(generator, output_data, n, lambda) result( &
        GeneratePoisson)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: generator
      integer(c_int), target :: output_data(*)
      integer(c_long), value :: n
      real(c_double), value :: lambda
      integer(c_int) :: GeneratePoisson
      GeneratePoisson = hiprandGeneratePoisson_raw(generator, c_loc(output_data(1)), n, lambda)
    end function hiprandGeneratePoisson_native

    function hiprandGeneratePoisson_typed(generator, output_data, n, lambda) result(GeneratePoisson)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_long), value :: n
      real(c_double), value :: lambda
      integer(c_int) :: GeneratePoisson
      GeneratePoisson = hiprandGeneratePoisson_raw(generator%ptr, output_data, n, lambda)
    end function hiprandGeneratePoisson_typed

    function hiprandGenerateSeeds_typed(generator) result(GenerateSeeds)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      integer(c_int) :: GenerateSeeds
      GenerateSeeds = hiprandGenerateSeeds_raw(generator%ptr)
    end function hiprandGenerateSeeds_typed

    function hiprandSetStream_typed(generator, stream) result(SetStream)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      type(c_ptr), value :: stream
      integer(c_int) :: SetStream
      SetStream = hiprandSetStream_raw(generator%ptr, stream)
    end function hiprandSetStream_typed

    function hiprandSetPseudoRandomGeneratorSeed_typed(generator, seed) result( &
        SetPseudoRandomGeneratorSeed)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      integer(c_int64_t), value :: seed
      integer(c_int) :: SetPseudoRandomGeneratorSeed
      SetPseudoRandomGeneratorSeed = hiprandSetPseudoRandomGeneratorSeed_raw(generator%ptr, seed)
    end function hiprandSetPseudoRandomGeneratorSeed_typed

    function hiprandSetGeneratorOffset_typed(generator, offset) result(SetGeneratorOffset)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      integer(c_int64_t), value :: offset
      integer(c_int) :: SetGeneratorOffset
      SetGeneratorOffset = hiprandSetGeneratorOffset_raw(generator%ptr, offset)
    end function hiprandSetGeneratorOffset_typed

    function hiprandSetGeneratorOrdering_typed(generator, order) result(SetGeneratorOrdering)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      integer(c_int), value :: order
      integer(c_int) :: SetGeneratorOrdering
      SetGeneratorOrdering = hiprandSetGeneratorOrdering_raw(generator%ptr, order)
    end function hiprandSetGeneratorOrdering_typed

    function hiprandSetQuasiRandomGeneratorDimensions_typed(generator, dimensions) result( &
        SetQuasiRandomGeneratorDimensions)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandGenerator_t), value :: generator
      integer(c_int), value :: dimensions
      integer(c_int) :: SetQuasiRandomGeneratorDimensions
      SetQuasiRandomGeneratorDimensions = hiprandSetQuasiRandomGeneratorDimensions_raw( &
        generator%ptr, dimensions)
    end function hiprandSetQuasiRandomGeneratorDimensions_typed

    function hiprandGetVersion_native(version) result(GetVersion)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), target :: version(*)
      integer(c_int) :: GetVersion
      GetVersion = hiprandGetVersion_raw(c_loc(version(1)))
    end function hiprandGetVersion_native

    function hiprandCreatePoissonDistribution_typed(lambda, discrete_distribution) result( &
        CreatePoissonDistribution)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      real(c_double), value :: lambda
      type(hiprandDiscreteDistribution_t) :: discrete_distribution
      integer(c_int) :: CreatePoissonDistribution
      CreatePoissonDistribution = hiprandCreatePoissonDistribution_raw(lambda, &
        discrete_distribution%ptr)
    end function hiprandCreatePoissonDistribution_typed

    function hiprandDestroyDistribution_typed(discrete_distribution) result(DestroyDistribution)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(hiprandDiscreteDistribution_t), value :: discrete_distribution
      integer(c_int) :: DestroyDistribution
      DestroyDistribution = hiprandDestroyDistribution_raw(discrete_distribution%ptr)
    end function hiprandDestroyDistribution_typed

end module hipfort_hiprand
