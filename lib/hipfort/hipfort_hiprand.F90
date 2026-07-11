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
  use, intrinsic :: iso_c_binding
  implicit none

  !--- Opaque handles (all are typedef struct* → type(c_ptr)) ---
  !    hiprandDiscreteDistribution_t
  !    hiprandGenerator_t

  !--- 30 bind(C) interfaces ---
  interface

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
    function hiprandCreateGenerator(generator, rng_type) &
       result(CreateGenerator) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandCreateGenerator")
#else
       bind(C, name="hiprandCreateGenerator")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: generator
       integer(c_int), value :: rng_type
       integer(c_int) :: CreateGenerator
    end function hiprandCreateGenerator

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
    function hiprandCreateGeneratorHost(generator, rng_type) &
       result(CreateGeneratorHost) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandCreateGeneratorHost")
#else
       bind(C, name="hiprandCreateGeneratorHost")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: generator
       integer(c_int), value :: rng_type
       integer(c_int) :: CreateGeneratorHost
    end function hiprandCreateGeneratorHost

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
    function hiprandDestroyGenerator(generator) &
       result(DestroyGenerator) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandDestroyGenerator")
#else
       bind(C, name="hiprandDestroyGenerator")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: generator
       integer(c_int) :: DestroyGenerator
    end function hiprandDestroyGenerator

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
    function hiprandGenerate(generator, output_data, n) &
       result(Generate) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandGenerate")
#else
       bind(C, name="hiprandGenerate")
#endif
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: generator
       integer(c_int) :: output_data(*)
       integer(c_long), value :: n
       integer(c_int) :: Generate
    end function hiprandGenerate

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
    function hiprandGenerateChar(generator, output_data, n) &
       result(GenerateChar) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandGenerateChar")
#else
       bind(C, name="hiprandGenerateChar")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: generator
       type(c_ptr), value :: output_data
       integer(c_long), value :: n
       integer(c_int) :: GenerateChar
    end function hiprandGenerateChar

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
    function hiprandGenerateShort(generator, output_data, n) &
       result(GenerateShort) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandGenerateShort")
#else
       bind(C, name="hiprandGenerateShort")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: generator
       type(c_ptr), value :: output_data
       integer(c_long), value :: n
       integer(c_int) :: GenerateShort
    end function hiprandGenerateShort

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
    function hiprandGenerateLongLong(generator, output_data, n) &
       result(GenerateLongLong) &
       bind(C, name="hiprandGenerateLongLong")
       import :: c_ptr, c_int64_t, c_long, c_int
       type(c_ptr), value :: generator
       integer(c_int64_t) :: output_data(*)
       integer(c_long), value :: n
       integer(c_int) :: GenerateLongLong
    end function hiprandGenerateLongLong

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
    function hiprandGenerateUniform(generator, output_data, n) &
       result(GenerateUniform) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandGenerateUniform")
#else
       bind(C, name="hiprandGenerateUniform")
#endif
       import :: c_ptr, c_float, c_long, c_int
       type(c_ptr), value :: generator
       real(c_float) :: output_data(*)
       integer(c_long), value :: n
       integer(c_int) :: GenerateUniform
    end function hiprandGenerateUniform

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
    function hiprandGenerateUniformDouble(generator, output_data, n) &
       result(GenerateUniformDouble) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandGenerateUniformDouble")
#else
       bind(C, name="hiprandGenerateUniformDouble")
#endif
       import :: c_ptr, c_double, c_long, c_int
       type(c_ptr), value :: generator
       real(c_double) :: output_data(*)
       integer(c_long), value :: n
       integer(c_int) :: GenerateUniformDouble
    end function hiprandGenerateUniformDouble

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
    function hiprandGenerateUniformHalf(generator, output_data, n) &
       result(GenerateUniformHalf) &
       bind(C, name="hiprandGenerateUniformHalf")
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: generator
       integer(c_int) :: output_data(*)
       integer(c_long), value :: n
       integer(c_int) :: GenerateUniformHalf
    end function hiprandGenerateUniformHalf

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
    function hiprandGenerateNormal(generator, output_data, n, mean, stddev) &
       result(GenerateNormal) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandGenerateNormal")
#else
       bind(C, name="hiprandGenerateNormal")
#endif
       import :: c_ptr, c_float, c_long, c_int
       type(c_ptr), value :: generator
       real(c_float) :: output_data(*)
       integer(c_long), value :: n
       real(c_float), value :: mean
       real(c_float), value :: stddev
       integer(c_int) :: GenerateNormal
    end function hiprandGenerateNormal

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
    function hiprandGenerateNormalDouble(generator, output_data, n, mean, stddev) &
       result(GenerateNormalDouble) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandGenerateNormalDouble")
#else
       bind(C, name="hiprandGenerateNormalDouble")
#endif
       import :: c_ptr, c_double, c_long, c_int
       type(c_ptr), value :: generator
       real(c_double) :: output_data(*)
       integer(c_long), value :: n
       real(c_double), value :: mean
       real(c_double), value :: stddev
       integer(c_int) :: GenerateNormalDouble
    end function hiprandGenerateNormalDouble

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
    function hiprandGenerateNormalHalf(generator, output_data, n, mean, stddev) &
       result(GenerateNormalHalf) &
       bind(C, name="hiprandGenerateNormalHalf")
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: generator
       integer(c_int) :: output_data(*)
       integer(c_long), value :: n
       integer(c_int), value :: mean
       integer(c_int), value :: stddev
       integer(c_int) :: GenerateNormalHalf
    end function hiprandGenerateNormalHalf

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
    function hiprandGenerateLogNormal(generator, output_data, n, mean, stddev) &
       result(GenerateLogNormal) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandGenerateLogNormal")
#else
       bind(C, name="hiprandGenerateLogNormal")
#endif
       import :: c_ptr, c_float, c_long, c_int
       type(c_ptr), value :: generator
       real(c_float) :: output_data(*)
       integer(c_long), value :: n
       real(c_float), value :: mean
       real(c_float), value :: stddev
       integer(c_int) :: GenerateLogNormal
    end function hiprandGenerateLogNormal

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
    function hiprandGenerateLogNormalDouble(generator, output_data, n, mean, stddev) &
       result(GenerateLogNormalDouble) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandGenerateLogNormalDouble")
#else
       bind(C, name="hiprandGenerateLogNormalDouble")
#endif
       import :: c_ptr, c_double, c_long, c_int
       type(c_ptr), value :: generator
       real(c_double) :: output_data(*)
       integer(c_long), value :: n
       real(c_double), value :: mean
       real(c_double), value :: stddev
       integer(c_int) :: GenerateLogNormalDouble
    end function hiprandGenerateLogNormalDouble

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
    function hiprandGenerateLogNormalHalf(generator, output_data, n, mean, stddev) &
       result(GenerateLogNormalHalf) &
       bind(C, name="hiprandGenerateLogNormalHalf")
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: generator
       integer(c_int) :: output_data(*)
       integer(c_long), value :: n
       integer(c_int), value :: mean
       integer(c_int), value :: stddev
       integer(c_int) :: GenerateLogNormalHalf
    end function hiprandGenerateLogNormalHalf

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
    function hiprandGeneratePoisson(generator, output_data, n, lambda) &
       result(GeneratePoisson) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandGeneratePoisson")
#else
       bind(C, name="hiprandGeneratePoisson")
#endif
       import :: c_ptr, c_int, c_long, c_double
       type(c_ptr), value :: generator
       integer(c_int) :: output_data(*)
       integer(c_long), value :: n
       real(c_double), value :: lambda
       integer(c_int) :: GeneratePoisson
    end function hiprandGeneratePoisson

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
    function hiprandGenerateSeeds(generator) &
       result(GenerateSeeds) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandGenerateSeeds")
#else
       bind(C, name="hiprandGenerateSeeds")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: generator
       integer(c_int) :: GenerateSeeds
    end function hiprandGenerateSeeds

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
    function hiprandSetStream(generator, stream) &
       result(SetStream) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandSetStream")
#else
       bind(C, name="hiprandSetStream")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: generator
       type(c_ptr), value :: stream
       integer(c_int) :: SetStream
    end function hiprandSetStream

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
    function hiprandSetPseudoRandomGeneratorSeed(generator, seed) &
       result(SetPseudoRandomGeneratorSeed) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandSetPseudoRandomGeneratorSeed")
#else
       bind(C, name="hiprandSetPseudoRandomGeneratorSeed")
#endif
       import :: c_ptr, c_int64_t, c_int
       type(c_ptr), value :: generator
       integer(c_int64_t), value :: seed
       integer(c_int) :: SetPseudoRandomGeneratorSeed
    end function hiprandSetPseudoRandomGeneratorSeed

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
    function hiprandSetGeneratorOffset(generator, offset) &
       result(SetGeneratorOffset) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandSetGeneratorOffset")
#else
       bind(C, name="hiprandSetGeneratorOffset")
#endif
       import :: c_ptr, c_int64_t, c_int
       type(c_ptr), value :: generator
       integer(c_int64_t), value :: offset
       integer(c_int) :: SetGeneratorOffset
    end function hiprandSetGeneratorOffset

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
    function hiprandSetGeneratorOrdering(generator, order) &
       result(SetGeneratorOrdering) &
       bind(C, name="hiprandSetGeneratorOrdering")
       import :: c_ptr, c_int
       type(c_ptr), value :: generator
       integer(c_int), value :: order
       integer(c_int) :: SetGeneratorOrdering
    end function hiprandSetGeneratorOrdering

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
    function hiprandSetQuasiRandomGeneratorDimensions(generator, dimensions) &
       result(SetQuasiRandomGeneratorDimensions) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandSetQuasiRandomGeneratorDimensions")
#else
       bind(C, name="hiprandSetQuasiRandomGeneratorDimensions")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: generator
       integer(c_int), value :: dimensions
       integer(c_int) :: SetQuasiRandomGeneratorDimensions
    end function hiprandSetQuasiRandomGeneratorDimensions

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
    function hiprandGetVersion(version) &
       result(GetVersion) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandGetVersion")
#else
       bind(C, name="hiprandGetVersion")
#endif
       import :: c_int
       integer(c_int) :: version(*)
       integer(c_int) :: GetVersion
    end function hiprandGetVersion

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
    function hiprandCreatePoissonDistribution(lambda, discrete_distribution) &
       result(CreatePoissonDistribution) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandCreatePoissonDistribution")
#else
       bind(C, name="hiprandCreatePoissonDistribution")
#endif
       import :: c_double, c_ptr, c_int
       real(c_double), value :: lambda
       type(c_ptr) :: discrete_distribution
       integer(c_int) :: CreatePoissonDistribution
    end function hiprandCreatePoissonDistribution

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
    function hiprandDestroyDistribution(discrete_distribution) &
       result(DestroyDistribution) &
#ifdef USE_CUDA_NAMES
       bind(C, name="curandDestroyDistribution")
#else
       bind(C, name="hiprandDestroyDistribution")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: discrete_distribution
       integer(c_int) :: DestroyDistribution
    end function hiprandDestroyDistribution

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
       bind(C, name="hiprandGetDirectionVectors32")
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
       bind(C, name="hiprandGetDirectionVectors64")
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
       bind(C, name="hiprandGetScrambleConstants32")
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
       bind(C, name="hiprandGetScrambleConstants64")
       import :: c_ptr, c_int
       type(c_ptr) :: constants
       integer(c_int) :: GetScrambleConstants64
    end function hiprandGetScrambleConstants64

  end interface
end module hipfort_hiprand
