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
          
           
module hipfort_hiprand
  use hipfort_hiprand_enums
  implicit none

 
  interface
  !> 
  !>   \brief Creates a new random number generator.
  !>  
  !>   Creates a new random number generator of type \p rng_type,
  !>   and returns it in \p generator. That generator will use
  !>   GPU to create random numbers.
  !>  
  !>   Values for \p rng_type are:
  !>   - HIPRAND_RNG_PSEUDO_DEFAULT
  !>   - HIPRAND_RNG_PSEUDO_XORWOW
  !>   - HIPRAND_RNG_PSEUDO_MRG32K3A
  !>   - HIPRAND_RNG_PSEUDO_MTGP32
  !>   - HIPRAND_RNG_PSEUDO_MT19937
  !>   - HIPRAND_RNG_PSEUDO_PHILOX4_32_10
  !>   - HIPRAND_RNG_QUASI_DEFAULT
  !>   - HIPRAND_RNG_QUASI_SOBOL32
  !>   - HIPRAND_RNG_QUASI_SCRAMBLED_SOBOL32
  !>   - HIPRAND_RNG_QUASI_SOBOL64
  !>   - HIPRAND_RNG_QUASI_SCRAMBLED_SOBOL64
  !>  
  !>   \param generator - Pointer to generator
  !>   \param rng_type - Type of random number generator to create
  !>  
  !>   \return
  !>   - HIPRAND_STATUS_ALLOCATION_FAILED, if memory allocation failed \n
  !>   - HIPRAND_STATUS_INITIALIZATION_FAILED if there was a problem setting up the GPU \n
  !>   - HIPRAND_STATUS_VERSION_MISMATCH if the header file version does not match the
  !>     dynamically linked library version \n
  !>   - HIPRAND_STATUS_TYPE_ERROR if the value for \p rng_type is invalid \n
  !>   - HIPRAND_STATUS_NOT_IMPLEMENTED if generator of type \p rng_type is not implemented yet \n
  !>   - HIPRAND_STATUS_SUCCESS if generator was created successfully \n
  !>  
  !>  
#ifdef USE_CUDA_NAMES
    function hiprandCreateGenerator(generator,rng_type) bind(c, name="curandCreateGenerator")
#else
    function hiprandCreateGenerator(generator,rng_type) bind(c, name="hiprandCreateGenerator")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandCreateGenerator
      type(c_ptr) :: generator
      integer(kind(HIPRAND_RNG_TEST)),value :: rng_type
    end function

  !> 
  !>   \brief Creates a new random number generator on host.
  !>  
  !>   Creates a new host random number generator of type \p rng_type
  !>   and returns it in \p generator. Created generator will use
  !>   host CPU to generate random numbers.
  !>  
  !>   Values for \p rng_type are:
  !>   - HIPRAND_RNG_PSEUDO_DEFAULT
  !>   - HIPRAND_RNG_PSEUDO_XORWOW
  !>   - HIPRAND_RNG_PSEUDO_MRG32K3A
  !>   - HIPRAND_RNG_PSEUDO_MTGP32
  !>   - HIPRAND_RNG_PSEUDO_MT19937
  !>   - HIPRAND_RNG_PSEUDO_PHILOX4_32_10
  !>   - HIPRAND_RNG_QUASI_DEFAULT
  !>   - HIPRAND_RNG_QUASI_SOBOL32
  !>   - HIPRAND_RNG_QUASI_SCRAMBLED_SOBOL32
  !>   - HIPRAND_RNG_QUASI_SOBOL64
  !>   - HIPRAND_RNG_QUASI_SCRAMBLED_SOBOL64
  !>  
  !>   \param generator - Pointer to generator
  !>   \param rng_type - Type of random number generator to create
  !>  
  !>   \return
  !>   - HIPRAND_STATUS_ALLOCATION_FAILED, if memory allocation failed \n
  !>   - HIPRAND_STATUS_VERSION_MISMATCH if the header file version does not match the
  !>     dynamically linked library version \n
  !>   - HIPRAND_STATUS_TYPE_ERROR if the value for \p rng_type is invalid \n
  !>   - HIPRAND_STATUS_NOT_IMPLEMENTED if host generator of type \p rng_type is not implemented yet \n
  !>   - HIPRAND_STATUS_SUCCESS if generator was created successfully \n
  !>  
#ifdef USE_CUDA_NAMES
    function hiprandCreateGeneratorHost(generator,rng_type) bind(c, name="curandCreateGeneratorHost")
#else
    function hiprandCreateGeneratorHost(generator,rng_type) bind(c, name="hiprandCreateGeneratorHost")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandCreateGeneratorHost
      type(c_ptr) :: generator
      integer(kind(HIPRAND_RNG_TEST)),value :: rng_type
    end function

  !> 
  !>   \brief Destroys random number generator.
  !>  
  !>   Destroys random number generator and frees related memory.
  !>  
  !>   \param generator - Generator to be destroyed
  !>  
  !>   \return
  !>   - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized \n
  !>   - HIPRAND_STATUS_SUCCESS if generator was destroyed successfully \n
  !>  
#ifdef USE_CUDA_NAMES
    function hiprandDestroyGenerator(generator) bind(c, name="curandDestroyGenerator")
#else
    function hiprandDestroyGenerator(generator) bind(c, name="hiprandDestroyGenerator")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandDestroyGenerator
      type(c_ptr),value :: generator
    end function

  !> 
  !>   \brief Generates uniformly distributed 32-bit unsigned integers.
  !>  
  !>   Generates \p n uniformly distributed 32-bit unsigned integers and
  !>   saves them to \p output_data.
  !>  
  !>   Generated numbers are between \p 0 and \p 2^32, including \p 0 and
  !>   excluding \p 2^32.
  !>  
  !>   \param generator - Generator to use
  !>   \param output_data - Pointer to memory to store generated numbers
  !>   \param n - Number of 32-bit unsigned integers to generate
  !>  
  !>   \return
  !>   - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized \n
  !>   - HIPRAND_STATUS_LAUNCH_FAILURE if generator failed to launch kernel \n
  !>   - HIPRAND_STATUS_SUCCESS if random numbers were successfully generated \n
  !>  
#ifdef USE_CUDA_NAMES
    function hiprandGenerate(generator,output_data,n) bind(c, name="curandGenerate")
#else
    function hiprandGenerate(generator,output_data,n) bind(c, name="hiprandGenerate")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerate
      type(c_ptr),value :: generator
      type(c_ptr),value :: output_data
      integer(c_size_t),value :: n
    end function

  !> 
  !>   \brief Generates uniformly distributed 8-bit unsigned integers.
  !>  
  !>   Generates \p n uniformly distributed 8-bit unsigned integers and
  !>   saves them to \p output_data.
  !>  
  !>   Generated numbers are between \p 0 and \p 2^8, including \p 0 and
  !>   excluding \p 2^8.
  !>  
  !>   \param generator - Generator to use
  !>   \param output_data - Pointer to memory to store generated numbers
  !>   \param n - Number of 8-bit unsigned integers to generate
  !>  
  !>   \return
  !>   - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized \n
  !>   - HIPRAND_STATUS_LAUNCH_FAILURE if generator failed to launch kernel \n
  !>   - HIPRAND_STATUS_SUCCESS if random numbers were successfully generated \n
  !>  
#ifdef USE_CUDA_NAMES
    function hiprandGenerateChar(generator,output_data,n) bind(c, name="curandGenerateChar")
#else
    function hiprandGenerateChar(generator,output_data,n) bind(c, name="hiprandGenerateChar")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateChar
      type(c_ptr),value :: generator
      type(c_ptr),value :: output_data
      integer(c_size_t),value :: n
    end function

  !> 
  !>   \brief Generates uniformly distributed 16-bit unsigned integers.
  !>  
  !>   Generates \p n uniformly distributed 16-bit unsigned integers and
  !>   saves them to \p output_data.
  !>  
  !>   Generated numbers are between \p 0 and \p 2^16, including \p 0 and
  !>   excluding \p 2^16.
  !>  
  !>   \param generator - Generator to use
  !>   \param output_data - Pointer to memory to store generated numbers
  !>   \param n - Number of 16-bit unsigned integers to generate
  !>  
  !>   \return
  !>   - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized \n
  !>   - HIPRAND_STATUS_LAUNCH_FAILURE if generator failed to launch kernel \n
  !>   - HIPRAND_STATUS_SUCCESS if random numbers were successfully generated \n
  !>  
#ifdef USE_CUDA_NAMES
    function hiprandGenerateShort(generator,output_data,n) bind(c, name="curandGenerateShort")
#else
    function hiprandGenerateShort(generator,output_data,n) bind(c, name="hiprandGenerateShort")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateShort
      type(c_ptr),value :: generator
      type(c_ptr),value :: output_data
      integer(c_size_t),value :: n
    end function

  !> 
  !>   \brief Generates uniformly distributed floats.
  !>  
  !>   Generates \p n uniformly distributed 32-bit floating-point values
  !>   and saves them to \p output_data.
  !>  
  !>   Generated numbers are between \p 0.0f and \p 1.0f, excluding \p 0.0f and
  !>   including \p 1.0f.
  !>  
  !>   \param generator - Generator to use
  !>   \param output_data - Pointer to memory to store generated numbers
  !>   \param n - Number of floats to generate
  !>  
  !>   \return
  !>   - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized \n
  !>   - HIPRAND_STATUS_LAUNCH_FAILURE if generator failed to launch kernel \n
  !>   - HIPRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not a multiple of the dimension
  !>   of used quasi-random generator \n
  !>   - HIPRAND_STATUS_SUCCESS if random numbers were successfully generated \n
  !>  
#ifdef USE_CUDA_NAMES
    function hiprandGenerateUniform(generator,output_data,n) bind(c, name="curandGenerateUniform")
#else
    function hiprandGenerateUniform(generator,output_data,n) bind(c, name="hiprandGenerateUniform")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateUniform
      type(c_ptr),value :: generator
      type(c_ptr),value :: output_data
      integer(c_size_t),value :: n
    end function

  !> 
  !>   \brief Generates uniformly distributed double-precision floating-point values.
  !>  
  !>   Generates \p n uniformly distributed 64-bit double-precision floating-point
  !>   values and saves them to \p output_data.
  !>  
  !>   Generated numbers are between \p 0.0 and \p 1.0, excluding \p 0.0 and
  !>   including \p 1.0.
  !>  
  !>   \param generator - Generator to use
  !>   \param output_data - Pointer to memory to store generated numbers
  !>   \param n - Number of floats to generate
  !>  
  !>   Note: When \p generator is of type: \p HIPRAND_RNG_PSEUDO_MRG32K3A,
  !>   \p HIPRAND_RNG_PSEUDO_MTGP32, or \p HIPRAND_RNG_QUASI_SOBOL32,
  !>   then the returned \p double values are generated from only 32 random bits
  !>   each (one <tt>unsigned int<tt> value per one generated \p double).
  !>  
  !>   \return
  !>   - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized \n
  !>   - HIPRAND_STATUS_LAUNCH_FAILURE if generator failed to launch kernel \n
  !>   - HIPRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not a multiple of the dimension
  !>   of used quasi-random generator \n
  !>   - HIPRAND_STATUS_SUCCESS if random numbers were successfully generated \n
  !>  
#ifdef USE_CUDA_NAMES
    function hiprandGenerateUniformDouble(generator,output_data,n) bind(c, name="curandGenerateUniformDouble")
#else
    function hiprandGenerateUniformDouble(generator,output_data,n) bind(c, name="hiprandGenerateUniformDouble")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateUniformDouble
      type(c_ptr),value :: generator
      type(c_ptr),value :: output_data
      integer(c_size_t),value :: n
    end function

  !> 
  !>   \brief Generates normally distributed floats.
  !>  
  !>   Generates \p n normally distributed 32-bit floating-point
  !>   values and saves them to \p output_data.
  !>  
  !>   \param generator - Generator to use
  !>   \param output_data - Pointer to memory to store generated numbers
  !>   \param n - Number of floats to generate
  !>   \param mean - Mean value of normal distribution
  !>   \param stddev - Standard deviation value of normal distribution
  !>  
  !>   \return
  !>   - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized \n
  !>   - HIPRAND_STATUS_LAUNCH_FAILURE if generator failed to launch kernel \n
  !>   - HIPRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not even, \p output_data is not
  !>   aligned to \p sizeof(float2) bytes, or \p n is not a multiple of the dimension
  !>   of used quasi-random generator \n
  !>   - HIPRAND_STATUS_SUCCESS if random numbers were successfully generated \n
  !>  
#ifdef USE_CUDA_NAMES
    function hiprandGenerateNormal(generator,output_data,n,mean,stddev) bind(c, name="curandGenerateNormal")
#else
    function hiprandGenerateNormal(generator,output_data,n,mean,stddev) bind(c, name="hiprandGenerateNormal")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateNormal
      type(c_ptr),value :: generator
      type(c_ptr),value :: output_data
      integer(c_size_t),value :: n
      real(c_float),value :: mean
      real(c_float),value :: stddev
    end function

  !> 
  !>   \brief Generates normally distributed doubles.
  !>  
  !>   Generates \p n normally distributed 64-bit double-precision floating-point
  !>   numbers and saves them to \p output_data.
  !>  
  !>   \param generator - Generator to use
  !>   \param output_data - Pointer to memory to store generated numbers
  !>   \param n - Number of doubles to generate
  !>   \param mean - Mean value of normal distribution
  !>   \param stddev - Standard deviation value of normal distribution
  !>  
  !>   \return
  !>   - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized \n
  !>   - HIPRAND_STATUS_LAUNCH_FAILURE if generator failed to launch kernel \n
  !>   - HIPRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not even, \p output_data is not
  !>   aligned to \p sizeof(double2) bytes, or \p n is not a multiple of the dimension
  !>   of used quasi-random generator \n
  !>   - HIPRAND_STATUS_SUCCESS if random numbers were successfully generated \n
  !>  
#ifdef USE_CUDA_NAMES
    function hiprandGenerateNormalDouble(generator,output_data,n,mean,stddev) bind(c, name="curandGenerateNormalDouble")
#else
    function hiprandGenerateNormalDouble(generator,output_data,n,mean,stddev) bind(c, name="hiprandGenerateNormalDouble")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateNormalDouble
      type(c_ptr),value :: generator
      type(c_ptr),value :: output_data
      integer(c_size_t),value :: n
      real(c_double),value :: mean
      real(c_double),value :: stddev
    end function

  !> 
  !>   \brief Generates log-normally distributed floats.
  !>  
  !>   Generates \p n log-normally distributed 32-bit floating-point values
  !>   and saves them to \p output_data.
  !>  
  !>   \param generator - Generator to use
  !>   \param output_data - Pointer to memory to store generated numbers
  !>   \param n - Number of floats to generate
  !>   \param mean - Mean value of log normal distribution
  !>   \param stddev - Standard deviation value of log normal distribution
  !>  
  !>   \return
  !>   - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized \n
  !>   - HIPRAND_STATUS_LAUNCH_FAILURE if generator failed to launch kernel \n
  !>   - HIPRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not even, \p output_data is not
  !>   aligned to \p sizeof(float2) bytes, or \p n is not a multiple of the dimension
  !>   of used quasi-random generator \n
  !>   - HIPRAND_STATUS_SUCCESS if random numbers were successfully generated \n
  !>  
#ifdef USE_CUDA_NAMES
    function hiprandGenerateLogNormal(generator,output_data,n,mean,stddev) bind(c, name="curandGenerateLogNormal")
#else
    function hiprandGenerateLogNormal(generator,output_data,n,mean,stddev) bind(c, name="hiprandGenerateLogNormal")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateLogNormal
      type(c_ptr),value :: generator
      type(c_ptr),value :: output_data
      integer(c_size_t),value :: n
      real(c_float),value :: mean
      real(c_float),value :: stddev
    end function

  !> 
  !>   \brief Generates log-normally distributed doubles.
  !>  
  !>   Generates \p n log-normally distributed 64-bit double-precision floating-point
  !>   values and saves them to \p output_data.
  !>  
  !>   \param generator - Generator to use
  !>   \param output_data - Pointer to memory to store generated numbers
  !>   \param n - Number of doubles to generate
  !>   \param mean - Mean value of log normal distribution
  !>   \param stddev - Standard deviation value of log normal distribution
  !>  
  !>   \return
  !>   - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized \n
  !>   - HIPRAND_STATUS_LAUNCH_FAILURE if generator failed to launch kernel \n
  !>   - HIPRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not even, \p output_data is not
  !>   aligned to \p sizeof(double2) bytes, or \p n is not a multiple of the dimension
  !>   of used quasi-random generator \n
  !>   - HIPRAND_STATUS_SUCCESS if random numbers were successfully generated \n
  !>  
#ifdef USE_CUDA_NAMES
    function hiprandGenerateLogNormalDouble(generator,output_data,n,mean,stddev) bind(c, name="curandGenerateLogNormalDouble")
#else
    function hiprandGenerateLogNormalDouble(generator,output_data,n,mean,stddev) bind(c, name="hiprandGenerateLogNormalDouble")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateLogNormalDouble
      type(c_ptr),value :: generator
      type(c_ptr),value :: output_data
      integer(c_size_t),value :: n
      real(c_double),value :: mean
      real(c_double),value :: stddev
    end function

  !> 
  !>   \brief Generates Poisson-distributed 32-bit unsigned integers.
  !>  
  !>   Generates \p n Poisson-distributed 32-bit unsigned integers and
  !>   saves them to \p output_data.
  !>  
  !>   \param generator - Generator to use
  !>   \param output_data - Pointer to memory to store generated numbers
  !>   \param n - Number of 32-bit unsigned integers to generate
  !>   \param lambda - lambda for the Poisson distribution
  !>  
  !>   \return
  !>   - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized \n
  !>   - HIPRAND_STATUS_LAUNCH_FAILURE if generator failed to launch kernel \n
  !>   - HIPRAND_STATUS_OUT_OF_RANGE if lambda is non-positive \n
  !>   - HIPRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not a multiple of the dimension
  !>   of used quasi-random generator \n
  !>   - HIPRAND_STATUS_SUCCESS if random numbers were successfully generated \n
  !>  
#ifdef USE_CUDA_NAMES
    function hiprandGeneratePoisson(generator,output_data,n,lambda) bind(c, name="curandGeneratePoisson")
#else
    function hiprandGeneratePoisson(generator,output_data,n,lambda) bind(c, name="hiprandGeneratePoisson")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGeneratePoisson
      type(c_ptr),value :: generator
      type(c_ptr),value :: output_data
      integer(c_size_t),value :: n
      real(c_double),value :: lambda
    end function

  !> 
  !>   \brief Initializes the generator's state on GPU or host.
  !>  
  !>   Initializes the generator's state on GPU or host.
  !>  
  !>   If hiprandGenerateSeeds() was not called for a generator, it will be
  !>   automatically called by functions which generates random numbers like
  !>   hiprandGenerate(), hiprandGenerateUniform(), hiprandGenerateNormal() etc.
  !>  
  !>   \param generator - Generator to initialize
  !>  
  !>   \return
  !>   - HIPRAND_STATUS_NOT_INITIALIZED if the generator was never created \n
  !>   - HIPRAND_STATUS_PREEXISTING_FAILURE if there was an existing error from
  !>     a previous kernel launch \n
  !>   - HIPRAND_STATUS_LAUNCH_FAILURE if the kernel launch failed for any reason \n
  !>   - HIPRAND_STATUS_SUCCESS if the seeds were generated successfully \n
  !>  
#ifdef USE_CUDA_NAMES
    function hiprandGenerateSeeds(generator) bind(c, name="curandGenerateSeeds")
#else
    function hiprandGenerateSeeds(generator) bind(c, name="hiprandGenerateSeeds")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateSeeds
      type(c_ptr),value :: generator
    end function

  !> 
  !>   \brief Sets the current stream for kernel launches.
  !>  
  !>   Sets the current stream for all kernel launches of the generator.
  !>   All functions will use this stream.
  !>  
  !>   \param generator - Generator to modify
  !>   \param stream - Stream to use or NULL for default stream
  !>  
  !>   \return
  !>   - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized \n
  !>   - HIPRAND_STATUS_SUCCESS if stream was set successfully \n
  !>  
#ifdef USE_CUDA_NAMES
    function hiprandSetStream(generator,stream) bind(c, name="curandSetStream")
#else
    function hiprandSetStream(generator,stream) bind(c, name="hiprandSetStream")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandSetStream
      type(c_ptr),value :: generator
      type(c_ptr),value :: stream
    end function

  !> 
  !>   \brief Sets the seed of a pseudo-random number generator.
  !>  
  !>   Sets the seed of the pseudo-random number generator.
  !>  
  !>   - This operation resets the generator's internal state.
  !>   - This operation does not change the generator's offset.
  !>  
  !>   \param generator - Pseudo-random number generator
  !>   \param seed - New seed value
  !>  
  !>   \return
  !>   - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized \n
  !>   - HIPRAND_STATUS_TYPE_ERROR if the generator is a quasi random number generator \n
  !>   - HIPRAND_STATUS_SUCCESS if seed was set successfully \n
  !>  
#ifdef USE_CUDA_NAMES
    function hiprandSetPseudoRandomGeneratorSeed(generator,seed) bind(c, name="curandSetPseudoRandomGeneratorSeed")
#else
    function hiprandSetPseudoRandomGeneratorSeed(generator,seed) bind(c, name="hiprandSetPseudoRandomGeneratorSeed")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandSetPseudoRandomGeneratorSeed
      type(c_ptr),value :: generator
      integer(c_long_long),value :: seed
    end function

  !> 
  !>   \brief Sets the offset of a random number generator.
  !>  
  !>   Sets the absolute offset of the random number generator.
  !>  
  !>   - This operation resets the generator's internal state.
  !>   - This operation does not change the generator's seed.
  !>  
  !>   Absolute offset cannot be set if generator's type is
  !>   HIPRAND_RNG_PSEUDO_MTGP32 or HIPRAND_RNG_PSEUDO_MT19937.
  !>  
  !>   \param generator - Random number generator
  !>   \param offset - New absolute offset
  !>  
  !>   \return
  !>   - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized \n
  !>   - HIPRAND_STATUS_SUCCESS if offset was successfully set \n
  !>   - HIPRAND_STATUS_TYPE_ERROR if generator's type is HIPRAND_RNG_PSEUDO_MTGP32
  !>   or HIPRAND_RNG_PSEUDO_MT19937 \n
  !>  
#ifdef USE_CUDA_NAMES
    function hiprandSetGeneratorOffset(generator,offset) bind(c, name="curandSetGeneratorOffset")
#else
    function hiprandSetGeneratorOffset(generator,offset) bind(c, name="hiprandSetGeneratorOffset")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandSetGeneratorOffset
      type(c_ptr),value :: generator
      integer(c_long_long),value :: offset
    end function

  !> 
  !>   \brief Set the number of dimensions of a quasi-random number generator.
  !>  
  !>   Set the number of dimensions of a quasi-random number generator.
  !>   Supported values of \p dimensions are 1 to 20000.
  !>  
  !>   - This operation resets the generator's internal state.
  !>   - This operation does not change the generator's offset.
  !>  
  !>   \param generator - Quasi-random number generator
  !>   \param dimensions - Number of dimensions
  !>  
  !>   \return
  !>   - HIPRAND_STATUS_NOT_CREATED if the generator wasn't created \n
  !>   - HIPRAND_STATUS_TYPE_ERROR if the generator is not a quasi-random number generator \n
  !>   - HIPRAND_STATUS_OUT_OF_RANGE if \p dimensions is out of range \n
  !>   - HIPRAND_STATUS_SUCCESS if the number of dimensions was set successfully \n
  !>  
#ifdef USE_CUDA_NAMES
    function hiprandSetQuasiRandomGeneratorDimensions(generator,dimensions) bind(c, name="curandSetQuasiRandomGeneratorDimensions")
#else
    function hiprandSetQuasiRandomGeneratorDimensions(generator,dimensions) bind(c, name="hiprandSetQuasiRandomGeneratorDimensions")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandSetQuasiRandomGeneratorDimensions
      type(c_ptr),value :: generator
      integer(kind=4),value :: dimensions
    end function

  !> 
  !>   \brief Returns the version number of the cuRAND or rocRAND library.
  !>  
  !>   Returns in \p version the version number of the underlying cuRAND or
  !>   rocRAND library.
  !>  
  !>   \param version - Version of the library
  !>  
  !>   \return
  !>   - HIPRAND_STATUS_OUT_OF_RANGE if \p version is NULL \n
  !>   - HIPRAND_STATUS_SUCCESS if the version number was successfully returned \n
  !>  
#ifdef USE_CUDA_NAMES
    function hiprandGetVersion(version) bind(c, name="curandGetVersion")
#else
    function hiprandGetVersion(version) bind(c, name="hiprandGetVersion")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGetVersion
      type(c_ptr),value :: version
    end function

  !> 
  !>   \brief Construct the histogram for a Poisson distribution.
  !>  
  !>   Construct the histogram for the Poisson distribution with lambda \p lambda.
  !>  
  !>   \param lambda - lambda for the Poisson distribution
  !>   \param discrete_distribution - pointer to the histogram in device memory
  !>  
  !>   \return
  !>   - HIPRAND_STATUS_ALLOCATION_FAILED if memory could not be allocated \n
  !>   - HIPRAND_STATUS_OUT_OF_RANGE if \p discrete_distribution pointer was null \n
  !>   - HIPRAND_STATUS_OUT_OF_RANGE if lambda is non-positive \n
  !>   - HIPRAND_STATUS_SUCCESS if the histogram was ructed successfully \n
  !>  
#ifdef USE_CUDA_NAMES
    function hiprandCreatePoissonDistribution(lambda,discrete_distribution) bind(c, name="curandCreatePoissonDistribution")
#else
    function hiprandCreatePoissonDistribution(lambda,discrete_distribution) bind(c, name="hiprandCreatePoissonDistribution")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandCreatePoissonDistribution
      real(c_double),value :: lambda
      type(c_ptr) :: discrete_distribution
    end function

  !> 
  !>   \brief Destroy the histogram array for a discrete distribution.
  !>  
  !>   Destroy the histogram array for a discrete distribution created by
  !>   hiprandCreatePoissonDistribution.
  !>  
  !>   \param discrete_distribution - pointer to the histogram in device memory
  !>  
  !>   \return
  !>   - HIPRAND_STATUS_OUT_OF_RANGE if \p discrete_distribution was null \n
  !>   - HIPRAND_STATUS_SUCCESS if the histogram was destroyed successfully \n
  !>  
#ifdef USE_CUDA_NAMES
    function hiprandDestroyDistribution(discrete_distribution) bind(c, name="curandDestroyDistribution")
#else
    function hiprandDestroyDistribution(discrete_distribution) bind(c, name="hiprandDestroyDistribution")
#endif
      use iso_c_binding
      use hipfort_hiprand_enums
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandDestroyDistribution
      type(c_ptr),value :: discrete_distribution
    end function

  end interface
  
end module hipfort_hiprand