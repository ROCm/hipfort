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
  implicit none

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
#ifdef USE_CUDA_NAMES
    function hiprandCreateGenerator_(generator,rng_type) bind(c, name="curandCreateGenerator")
#else
    function hiprandCreateGenerator_(generator,rng_type) bind(c, name="hiprandCreateGenerator")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandCreateGenerator_
      type(c_ptr) :: generator
      integer(kind(HIPRAND_RNG_TEST)),value :: rng_type
    end function
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
#ifdef USE_CUDA_NAMES
    function hiprandCreateGeneratorHost_(generator,rng_type) bind(c, name="curandCreateGeneratorHost")
#else
    function hiprandCreateGeneratorHost_(generator,rng_type) bind(c, name="hiprandCreateGeneratorHost")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandCreateGeneratorHost_
      type(c_ptr) :: generator
      integer(kind(HIPRAND_RNG_TEST)),value :: rng_type
    end function
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
#ifdef USE_CUDA_NAMES
    function hiprandDestroyGenerator_(generator) bind(c, name="curandDestroyGenerator")
#else
    function hiprandDestroyGenerator_(generator) bind(c, name="hiprandDestroyGenerator")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandDestroyGenerator_
      type(c_ptr),value :: generator
    end function
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
#ifdef USE_CUDA_NAMES
    function hiprandGenerate_(generator,output_data,n) bind(c, name="curandGenerate")
#else
    function hiprandGenerate_(generator,output_data,n) bind(c, name="hiprandGenerate")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerate_
      type(c_ptr),value :: generator
      type(c_ptr),value :: output_data
      integer(c_size_t),value :: n
    end function
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
#ifdef USE_CUDA_NAMES
    function hiprandGenerateChar_(generator,output_data,n) bind(c, name="curandGenerateChar")
#else
    function hiprandGenerateChar_(generator,output_data,n) bind(c, name="hiprandGenerateChar")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateChar_
      type(c_ptr),value :: generator
      type(c_ptr),value :: output_data
      integer(c_size_t),value :: n
    end function
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
#ifdef USE_CUDA_NAMES
    function hiprandGenerateShort_(generator,output_data,n) bind(c, name="curandGenerateShort")
#else
    function hiprandGenerateShort_(generator,output_data,n) bind(c, name="hiprandGenerateShort")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateShort_
      type(c_ptr),value :: generator
      type(c_ptr),value :: output_data
      integer(c_size_t),value :: n
    end function
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
#ifdef USE_CUDA_NAMES
    function hiprandGenerateUniform_(generator,output_data,n) bind(c, name="curandGenerateUniform")
#else
    function hiprandGenerateUniform_(generator,output_data,n) bind(c, name="hiprandGenerateUniform")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateUniform_
      type(c_ptr),value :: generator
      type(c_ptr),value :: output_data
      integer(c_size_t),value :: n
    end function
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
#ifdef USE_CUDA_NAMES
    function hiprandGenerateUniformDouble_(generator,output_data,n) bind(c, name="curandGenerateUniformDouble")
#else
    function hiprandGenerateUniformDouble_(generator,output_data,n) bind(c, name="hiprandGenerateUniformDouble")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateUniformDouble_
      type(c_ptr),value :: generator
      type(c_ptr),value :: output_data
      integer(c_size_t),value :: n
    end function
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
#ifdef USE_CUDA_NAMES
    function hiprandGenerateNormal_(generator,output_data,n,mean,stddev) bind(c, name="curandGenerateNormal")
#else
    function hiprandGenerateNormal_(generator,output_data,n,mean,stddev) bind(c, name="hiprandGenerateNormal")
#endif
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
#ifdef USE_CUDA_NAMES
    function hiprandGenerateNormalDouble_(generator,output_data,n,mean,stddev) bind(c, name="curandGenerateNormalDouble")
#else
    function hiprandGenerateNormalDouble_(generator,output_data,n,mean,stddev) bind(c, name="hiprandGenerateNormalDouble")
#endif
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
#ifdef USE_CUDA_NAMES
    function hiprandGenerateLogNormal_(generator,output_data,n,mean,stddev) bind(c, name="curandGenerateLogNormal")
#else
    function hiprandGenerateLogNormal_(generator,output_data,n,mean,stddev) bind(c, name="hiprandGenerateLogNormal")
#endif
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
#ifdef USE_CUDA_NAMES
    function hiprandGenerateLogNormalDouble_(generator,output_data,n,mean,stddev) bind(c, name="curandGenerateLogNormalDouble")
#else
    function hiprandGenerateLogNormalDouble_(generator,output_data,n,mean,stddev) bind(c, name="hiprandGenerateLogNormalDouble")
#endif
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
#ifdef USE_CUDA_NAMES
    function hiprandGeneratePoisson_(generator,output_data,n,lambda) bind(c, name="curandGeneratePoisson")
#else
    function hiprandGeneratePoisson_(generator,output_data,n,lambda) bind(c, name="hiprandGeneratePoisson")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGeneratePoisson_
      type(c_ptr),value :: generator
      type(c_ptr),value :: output_data
      integer(c_size_t),value :: n
      real(c_double),value :: lambda
    end function
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
#ifdef USE_CUDA_NAMES
    function hiprandGenerateSeeds_(generator) bind(c, name="curandGenerateSeeds")
#else
    function hiprandGenerateSeeds_(generator) bind(c, name="hiprandGenerateSeeds")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateSeeds_
      type(c_ptr),value :: generator
    end function
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
#ifdef USE_CUDA_NAMES
    function hiprandSetStream_(generator,stream) bind(c, name="curandSetStream")
#else
    function hiprandSetStream_(generator,stream) bind(c, name="hiprandSetStream")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandSetStream_
      type(c_ptr),value :: generator
      type(c_ptr),value :: stream
    end function
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
#ifdef USE_CUDA_NAMES
    function hiprandSetPseudoRandomGeneratorSeed_(generator,seed) bind(c, name="curandSetPseudoRandomGeneratorSeed")
#else
    function hiprandSetPseudoRandomGeneratorSeed_(generator,seed) bind(c, name="hiprandSetPseudoRandomGeneratorSeed")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandSetPseudoRandomGeneratorSeed_
      type(c_ptr),value :: generator
      integer(c_int64_t),value :: seed
    end function
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
#ifdef USE_CUDA_NAMES
    function hiprandSetGeneratorOffset_(generator,offset) bind(c, name="curandSetGeneratorOffset")
#else
    function hiprandSetGeneratorOffset_(generator,offset) bind(c, name="hiprandSetGeneratorOffset")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandSetGeneratorOffset_
      type(c_ptr),value :: generator
      integer(c_int64_t),value :: offset
    end function
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
#ifdef USE_CUDA_NAMES
    function hiprandSetQuasiRandomGeneratorDimensions_(generator,dimensions) bind(c, name="curandSetQuasiRandomGeneratorDimensions")
#else
    function hiprandSetQuasiRandomGeneratorDimensions_(generator,dimensions) bind(c, name="hiprandSetQuasiRandomGeneratorDimensions")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandSetQuasiRandomGeneratorDimensions_
      type(c_ptr),value :: generator
      integer(c_int),value :: dimensions
    end function
  end interface

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
  interface hiprandGetVersion
#ifdef USE_CUDA_NAMES
    function hiprandGetVersion_(version) bind(c, name="curandGetVersion")
#else
    function hiprandGetVersion_(version) bind(c, name="hiprandGetVersion")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGetVersion_
      type(c_ptr),value :: version
    end function
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
#ifdef USE_CUDA_NAMES
    function hiprandCreatePoissonDistribution_(lambda,discrete_distribution) bind(c, name="curandCreatePoissonDistribution")
#else
    function hiprandCreatePoissonDistribution_(lambda,discrete_distribution) bind(c, name="hiprandCreatePoissonDistribution")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandCreatePoissonDistribution_
      real(c_double),value :: lambda
      type(c_ptr) :: discrete_distribution
    end function
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
#ifdef USE_CUDA_NAMES
    function hiprandDestroyDistribution_(discrete_distribution) bind(c, name="curandDestroyDistribution")
#else
    function hiprandDestroyDistribution_(discrete_distribution) bind(c, name="hiprandDestroyDistribution")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandDestroyDistribution_
      type(c_ptr),value :: discrete_distribution
    end function
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
#ifdef USE_CUDA_NAMES
    function hiprandGenerateLongLong_(generator,output_data,n) bind(c, name="curandGenerateLongLong")
#else
    function hiprandGenerateLongLong_(generator,output_data,n) bind(c, name="hiprandGenerateLongLong")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateLongLong_
      type(c_ptr),value :: generator
      type(c_ptr),value :: output_data
      integer(c_size_t),value :: n
    end function
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
#ifndef USE_CUDA_NAMES
  interface hiprandGenerateUniformHalf
    function hiprandGenerateUniformHalf_(generator,output_data,n) bind(c, name="hiprandGenerateUniformHalf")
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateUniformHalf_
      type(c_ptr),value :: generator
      type(c_ptr),value :: output_data
      integer(c_size_t),value :: n
    end function
  end interface
#endif

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
#ifndef USE_CUDA_NAMES
  interface hiprandGenerateNormalHalf
    function hiprandGenerateNormalHalf_(generator,output_data,n,mean,stddev) bind(c, name="hiprandGenerateNormalHalf")
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateNormalHalf_
      type(c_ptr),value :: generator
      type(c_ptr),value :: output_data
      integer(c_size_t),value :: n
      integer(c_int),value :: mean
      integer(c_int),value :: stddev
    end function
  end interface
#endif

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
#ifndef USE_CUDA_NAMES
  interface hiprandGenerateLogNormalHalf
    function hiprandGenerateLogNormalHalf_(generator,output_data,n,mean,stddev) bind(c, name="hiprandGenerateLogNormalHalf")
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateLogNormalHalf_
      type(c_ptr),value :: generator
      type(c_ptr),value :: output_data
      integer(c_size_t),value :: n
      integer(c_int),value :: mean
      integer(c_int),value :: stddev
    end function
  end interface
#endif

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
#ifdef USE_CUDA_NAMES
    function hiprandSetGeneratorOrdering_(generator,order) bind(c, name="curandSetGeneratorOrdering")
#else
    function hiprandSetGeneratorOrdering_(generator,order) bind(c, name="hiprandSetGeneratorOrdering")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandSetGeneratorOrdering_
      type(c_ptr),value :: generator
      integer(kind(HIPRAND_ORDERING_PSEUDO_BEST)),value :: order
    end function
  end interface

  !>  \brief Retrieves the Sobol 32 direction vector array specified by \p set.
  !>
  !>  \param vectors - Pointer to the Sobol 32 direction vector array.
  !>  \param set - Specifies which hipRAND vector set for quasirandom generators to retrieve.
  !>
  !>  \return
  !>  - HIPRAND_STATUS_OUT_OF_RANGE if \p set is invalid
  !>  - HIPRAND_STATUS_SUCCESS if \p vectors was set successfully
  interface hiprandGetDirectionVectors32
#ifdef USE_CUDA_NAMES
    function hiprandGetDirectionVectors32_(vectors,set) bind(c, name="curandGetDirectionVectors32")
#else
    function hiprandGetDirectionVectors32_(vectors,set) bind(c, name="hiprandGetDirectionVectors32")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGetDirectionVectors32_
      type(c_ptr) :: vectors
      integer(kind(HIPRAND_DIRECTION_VECTORS_32_JOEKUO6)),value :: set
    end function
  end interface

  !>  \brief Retrieves the Sobol 64 direction vector array specified by \p set.
  !>
  !>  \param vectors - Pointer to the Sobol 64 direction vector array.
  !>  \param set - Specifies which hipRAND vector set for quasirandom generators to retrieve.
  !>
  !>  \return
  !>  - HIPRAND_STATUS_OUT_OF_RANGE if \p set is invalid
  !>  - HIPRAND_STATUS_SUCCESS if \p vectors was set successfully
  interface hiprandGetDirectionVectors64
#ifdef USE_CUDA_NAMES
    function hiprandGetDirectionVectors64_(vectors,set) bind(c, name="curandGetDirectionVectors64")
#else
    function hiprandGetDirectionVectors64_(vectors,set) bind(c, name="hiprandGetDirectionVectors64")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGetDirectionVectors64_
      type(c_ptr) :: vectors
      integer(kind(HIPRAND_DIRECTION_VECTORS_32_JOEKUO6)),value :: set
    end function
  end interface

  !>  \brief Retrieves the scramble constants for 32-bit scrambled Sobol generation.
  !>
  !>  \param constants - Pointer to the constants pointer.
  !>
  !>  \return
  !>  - HIPRAND_STATUS_SUCCESS if the pointer was set successfully
  interface hiprandGetScrambleConstants32
#ifdef USE_CUDA_NAMES
    function hiprandGetScrambleConstants32_(constants) bind(c, name="curandGetScrambleConstants32")
#else
    function hiprandGetScrambleConstants32_(constants) bind(c, name="hiprandGetScrambleConstants32")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGetScrambleConstants32_
      type(c_ptr) :: constants
    end function
  end interface

  !>  \brief Retrieves the scramble constants for 64-bit scrambled Sobol generation.
  !>
  !>  \param constants - Pointer to the constants pointer.
  !>
  !>  \return
  !>  - HIPRAND_STATUS_SUCCESS if the pointer was set successfully
  interface hiprandGetScrambleConstants64
#ifdef USE_CUDA_NAMES
    function hiprandGetScrambleConstants64_(constants) bind(c, name="curandGetScrambleConstants64")
#else
    function hiprandGetScrambleConstants64_(constants) bind(c, name="hiprandGetScrambleConstants64")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGetScrambleConstants64_
      type(c_ptr) :: constants
    end function
  end interface

end module hipfort_hiprand
