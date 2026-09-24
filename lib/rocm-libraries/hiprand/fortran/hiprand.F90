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

module hiprand
  use, intrinsic :: iso_c_binding
  implicit none

  ! hiprandStatus
  enum, bind(c)
    enumerator :: HIPRAND_STATUS_SUCCESS = 0
    enumerator :: HIPRAND_STATUS_VERSION_MISMATCH = 100
    enumerator :: HIPRAND_STATUS_NOT_INITIALIZED = 101
    enumerator :: HIPRAND_STATUS_ALLOCATION_FAILED = 102
    enumerator :: HIPRAND_STATUS_TYPE_ERROR = 103
    enumerator :: HIPRAND_STATUS_OUT_OF_RANGE = 104
    enumerator :: HIPRAND_STATUS_LENGTH_NOT_MULTIPLE = 105
    enumerator :: HIPRAND_STATUS_DOUBLE_PRECISION_REQUIRED = 106
    enumerator :: HIPRAND_STATUS_LAUNCH_FAILURE = 201
    enumerator :: HIPRAND_STATUS_PREEXISTING_FAILURE = 202
    enumerator :: HIPRAND_STATUS_INITIALIZATION_FAILED = 203
    enumerator :: HIPRAND_STATUS_ARCH_MISMATCH = 204
    enumerator :: HIPRAND_STATUS_INTERNAL_ERROR = 999
    enumerator :: HIPRAND_STATUS_NOT_IMPLEMENTED = 1000
  end enum

  ! hiprandRngType
  enum, bind(c)
    enumerator :: HIPRAND_RNG_TEST = 0
    enumerator :: HIPRAND_RNG_PSEUDO_DEFAULT = 400
    enumerator :: HIPRAND_RNG_PSEUDO_XORWOW = 401
    enumerator :: HIPRAND_RNG_PSEUDO_MRG32K3A = 402
    enumerator :: HIPRAND_RNG_PSEUDO_MTGP32 = 403
    enumerator :: HIPRAND_RNG_PSEUDO_MT19937 = 404
    enumerator :: HIPRAND_RNG_PSEUDO_PHILOX4_32_10 = 405
    enumerator :: HIPRAND_RNG_QUASI_DEFAULT = 500
    enumerator :: HIPRAND_RNG_QUASI_SOBOL32 = 501
    enumerator :: HIPRAND_RNG_QUASI_SCRAMBLED_SOBOL32 = 502
    enumerator :: HIPRAND_RNG_QUASI_SOBOL64 = 503
    enumerator :: HIPRAND_RNG_QUASI_SCRAMBLED_SOBOL64 = 504
  end enum

  ! hiprandOrdering
  enum, bind(c)
    enumerator :: HIPRAND_ORDERING_PSEUDO_BEST = 100
    enumerator :: HIPRAND_ORDERING_PSEUDO_DEFAULT = 101
    enumerator :: HIPRAND_ORDERING_PSEUDO_SEEDED = 102
    enumerator :: HIPRAND_ORDERING_PSEUDO_LEGACY = 103
    enumerator :: HIPRAND_ORDERING_PSEUDO_DYNAMIC = 104
    enumerator :: HIPRAND_ORDERING_QUASI_DEFAULT = 201
  end enum

  ! hiprandDirectionVectorSet
  enum, bind(c)
    enumerator :: HIPRAND_DIRECTION_VECTORS_32_JOEKUO6 = 101
    enumerator :: HIPRAND_SCRAMBLED_DIRECTION_VECTORS_32_JOEKUO6 = 102
    enumerator :: HIPRAND_DIRECTION_VECTORS_64_JOEKUO6 = 103
    enumerator :: HIPRAND_SCRAMBLED_DIRECTION_VECTORS_64_JOEKUO6 = 104
  end enum

  integer(c_int), parameter :: HIPRAND_VERSION = 300400
  integer(c_int), parameter :: HIPRAND_DEFAULT_MAX_BLOCK_SIZE = 256
  integer(c_int), parameter :: HIPRAND_DEFAULT_MIN_WARPS_PER_EU = 1


  interface

    !---------------------------------------------
    ! hiprandCreateGenerator
    !---------------------------------------------
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
    function hiprandCreateGenerator(generator, rng_type) &
       result(CreateGenerator) &
       bind(C, name="hiprandCreateGenerator")
       import :: c_ptr, HIPRAND_RNG_TEST, HIPRAND_STATUS_SUCCESS
       type(c_ptr) :: generator
       integer(kind(HIPRAND_RNG_TEST)), value :: rng_type
       integer(kind(HIPRAND_STATUS_SUCCESS)) :: CreateGenerator
    end function hiprandCreateGenerator

    !---------------------------------------------
    ! hiprandCreateGeneratorHost
    !---------------------------------------------
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
    !>  - HIPRAND_STATUS_NOT_IMPLEMENTED if host generator of type \p rng_type is not implemented
    !>  yet
    !>  - HIPRAND_STATUS_SUCCESS if generator was created successfully
    function hiprandCreateGeneratorHost(generator, rng_type) &
       result(CreateGeneratorHost) &
       bind(C, name="hiprandCreateGeneratorHost")
       import :: c_ptr, HIPRAND_RNG_TEST, HIPRAND_STATUS_SUCCESS
       type(c_ptr) :: generator
       integer(kind(HIPRAND_RNG_TEST)), value :: rng_type
       integer(kind(HIPRAND_STATUS_SUCCESS)) :: CreateGeneratorHost
    end function hiprandCreateGeneratorHost

    !---------------------------------------------
    ! hiprandDestroyGenerator
    !---------------------------------------------
    !>  \brief Destroys random number generator.
    !>
    !>  Destroys random number generator and frees related memory.
    !>
    !>  \param generator - Generator to be destroyed
    !>
    !>  \return
    !>  - HIPRAND_STATUS_NOT_INITIALIZED if the generator was not initialized
    !>  - HIPRAND_STATUS_SUCCESS if generator was destroyed successfully
    function hiprandDestroyGenerator(generator) &
       result(DestroyGenerator) &
       bind(C, name="hiprandDestroyGenerator")
       import :: c_ptr, HIPRAND_STATUS_SUCCESS
       type(c_ptr), value :: generator
       integer(kind(HIPRAND_STATUS_SUCCESS)) :: DestroyGenerator
    end function hiprandDestroyGenerator

    !---------------------------------------------
    ! hiprandGenerateChar
    !---------------------------------------------
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
    function hiprandGenerateChar(generator, output_data, n) &
       result(GenerateChar) &
       bind(C, name="hiprandGenerateChar")
       import :: c_ptr, c_size_t, HIPRAND_STATUS_SUCCESS
       type(c_ptr), value :: generator
       type(c_ptr), value :: output_data
       integer(c_size_t), value :: n
       integer(kind(HIPRAND_STATUS_SUCCESS)) :: GenerateChar
    end function hiprandGenerateChar

    !---------------------------------------------
    ! hiprandGenerateShort
    !---------------------------------------------
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
    function hiprandGenerateShort(generator, output_data, n) &
       result(GenerateShort) &
       bind(C, name="hiprandGenerateShort")
       import :: c_ptr, c_size_t, HIPRAND_STATUS_SUCCESS
       type(c_ptr), value :: generator
       type(c_ptr), value :: output_data
       integer(c_size_t), value :: n
       integer(kind(HIPRAND_STATUS_SUCCESS)) :: GenerateShort
    end function hiprandGenerateShort

    !---------------------------------------------
    ! hiprandGenerateUniformHalf
    !---------------------------------------------
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
    function hiprandGenerateUniformHalf(generator, output_data, n) &
       result(GenerateUniformHalf) &
       bind(C, name="hiprandGenerateUniformHalf")
       import :: c_ptr, c_size_t, HIPRAND_STATUS_SUCCESS
       type(c_ptr), value :: generator
       type(c_ptr), value :: output_data
       integer(c_size_t), value :: n
       integer(kind(HIPRAND_STATUS_SUCCESS)) :: GenerateUniformHalf
    end function hiprandGenerateUniformHalf

    !---------------------------------------------
    ! hiprandGenerateNormalHalf
    !---------------------------------------------
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
    function hiprandGenerateNormalHalf(generator, output_data, n, mean, stddev) &
       result(GenerateNormalHalf) &
       bind(C, name="hiprandGenerateNormalHalf")
       import :: c_ptr, c_size_t, c_short, HIPRAND_STATUS_SUCCESS
       type(c_ptr), value :: generator
       type(c_ptr), value :: output_data
       integer(c_size_t), value :: n
       integer(c_short), value :: mean
       integer(c_short), value :: stddev
       integer(kind(HIPRAND_STATUS_SUCCESS)) :: GenerateNormalHalf
    end function hiprandGenerateNormalHalf

    !---------------------------------------------
    ! hiprandGenerateLogNormalHalf
    !---------------------------------------------
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
    function hiprandGenerateLogNormalHalf(generator, output_data, n, mean, stddev) &
       result(GenerateLogNormalHalf) &
       bind(C, name="hiprandGenerateLogNormalHalf")
       import :: c_ptr, c_size_t, c_short, HIPRAND_STATUS_SUCCESS
       type(c_ptr), value :: generator
       type(c_ptr), value :: output_data
       integer(c_size_t), value :: n
       integer(c_short), value :: mean
       integer(c_short), value :: stddev
       integer(kind(HIPRAND_STATUS_SUCCESS)) :: GenerateLogNormalHalf
    end function hiprandGenerateLogNormalHalf

    !---------------------------------------------
    ! hiprandGenerateSeeds
    !---------------------------------------------
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
    function hiprandGenerateSeeds(generator) &
       result(GenerateSeeds) &
       bind(C, name="hiprandGenerateSeeds")
       import :: c_ptr, HIPRAND_STATUS_SUCCESS
       type(c_ptr), value :: generator
       integer(kind(HIPRAND_STATUS_SUCCESS)) :: GenerateSeeds
    end function hiprandGenerateSeeds

    !---------------------------------------------
    ! hiprandSetStream
    !---------------------------------------------
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
    function hiprandSetStream(generator, stream) &
       result(SetStream) &
       bind(C, name="hiprandSetStream")
       import :: c_ptr, HIPRAND_STATUS_SUCCESS
       type(c_ptr), value :: generator
       type(c_ptr), value :: stream
       integer(kind(HIPRAND_STATUS_SUCCESS)) :: SetStream
    end function hiprandSetStream

    !---------------------------------------------
    ! hiprandSetPseudoRandomGeneratorSeed
    !---------------------------------------------
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
    function hiprandSetPseudoRandomGeneratorSeed(generator, seed) &
       result(SetPseudoRandomGeneratorSeed) &
       bind(C, name="hiprandSetPseudoRandomGeneratorSeed")
       import :: c_ptr, c_int64_t, HIPRAND_STATUS_SUCCESS
       type(c_ptr), value :: generator
       integer(c_int64_t), value :: seed
       integer(kind(HIPRAND_STATUS_SUCCESS)) :: SetPseudoRandomGeneratorSeed
    end function hiprandSetPseudoRandomGeneratorSeed

    !---------------------------------------------
    ! hiprandSetGeneratorOffset
    !---------------------------------------------
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
    function hiprandSetGeneratorOffset(generator, offset) &
       result(SetGeneratorOffset) &
       bind(C, name="hiprandSetGeneratorOffset")
       import :: c_ptr, c_int64_t, HIPRAND_STATUS_SUCCESS
       type(c_ptr), value :: generator
       integer(c_int64_t), value :: offset
       integer(kind(HIPRAND_STATUS_SUCCESS)) :: SetGeneratorOffset
    end function hiprandSetGeneratorOffset

    !---------------------------------------------
    ! hiprandSetGeneratorOrdering
    !---------------------------------------------
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
    function hiprandSetGeneratorOrdering(generator, order) &
       result(SetGeneratorOrdering) &
       bind(C, name="hiprandSetGeneratorOrdering")
       import :: c_ptr, HIPRAND_ORDERING_PSEUDO_BEST, HIPRAND_STATUS_SUCCESS
       type(c_ptr), value :: generator
       integer(kind(HIPRAND_ORDERING_PSEUDO_BEST)), value :: order
       integer(kind(HIPRAND_STATUS_SUCCESS)) :: SetGeneratorOrdering
    end function hiprandSetGeneratorOrdering

    !---------------------------------------------
    ! hiprandSetQuasiRandomGeneratorDimensions
    !---------------------------------------------
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
    function hiprandSetQuasiRandomGeneratorDimensions(generator, dimensions) &
       result(SetQuasiRandomGeneratorDimensions) &
       bind(C, name="hiprandSetQuasiRandomGeneratorDimensions")
       import :: c_ptr, c_int, HIPRAND_STATUS_SUCCESS
       type(c_ptr), value :: generator
       integer(c_int), value :: dimensions
       integer(kind(HIPRAND_STATUS_SUCCESS)) :: SetQuasiRandomGeneratorDimensions
    end function hiprandSetQuasiRandomGeneratorDimensions

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
    ! hiprandCreatePoissonDistribution
    !---------------------------------------------
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
    function hiprandCreatePoissonDistribution(lambda, discrete_distribution) &
       result(CreatePoissonDistribution) &
       bind(C, name="hiprandCreatePoissonDistribution")
       import :: c_double, c_ptr, HIPRAND_STATUS_SUCCESS
       real(c_double), value :: lambda
       type(c_ptr) :: discrete_distribution
       integer(kind(HIPRAND_STATUS_SUCCESS)) :: CreatePoissonDistribution
    end function hiprandCreatePoissonDistribution

    !---------------------------------------------
    ! hiprandDestroyDistribution
    !---------------------------------------------
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
    function hiprandDestroyDistribution(discrete_distribution) &
       result(DestroyDistribution) &
       bind(C, name="hiprandDestroyDistribution")
       import :: c_ptr, HIPRAND_STATUS_SUCCESS
       type(c_ptr), value :: discrete_distribution
       integer(kind(HIPRAND_STATUS_SUCCESS)) :: DestroyDistribution
    end function hiprandDestroyDistribution

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
      import
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerate_
      type(c_ptr),value :: generator
      type(c_ptr),value :: output_data
      integer(c_size_t),value :: n
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hiprandGenerate_assumed_rank
#else
    module procedure &
      hiprandGenerate_rank_0,&
      hiprandGenerate_rank_1
#endif
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
      import
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateLongLong_
      type(c_ptr),value :: generator
      type(c_ptr),value :: output_data
      integer(c_size_t),value :: n
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hiprandGenerateLongLong_assumed_rank
#else
    module procedure &
      hiprandGenerateLongLong_rank_0,&
      hiprandGenerateLongLong_rank_1
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
      import
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateUniform_
      type(c_ptr),value :: generator
      type(c_ptr),value :: output_data
      integer(c_size_t),value :: n
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hiprandGenerateUniform_assumed_rank
#else
    module procedure &
      hiprandGenerateUniform_rank_0,&
      hiprandGenerateUniform_rank_1
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
      import
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateUniformDouble_
      type(c_ptr),value :: generator
      type(c_ptr),value :: output_data
      integer(c_size_t),value :: n
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hiprandGenerateUniformDouble_assumed_rank
#else
    module procedure &
      hiprandGenerateUniformDouble_rank_0,&
      hiprandGenerateUniformDouble_rank_1
#endif
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
      import
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
    module procedure hiprandGenerateNormal_assumed_rank
#else
    module procedure &
      hiprandGenerateNormal_rank_0,&
      hiprandGenerateNormal_rank_1
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
      import
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
    module procedure hiprandGenerateNormalDouble_assumed_rank
#else
    module procedure &
      hiprandGenerateNormalDouble_rank_0,&
      hiprandGenerateNormalDouble_rank_1
#endif
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
      import
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
    module procedure hiprandGenerateLogNormal_assumed_rank
#else
    module procedure &
      hiprandGenerateLogNormal_rank_0,&
      hiprandGenerateLogNormal_rank_1
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
      import
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
    module procedure hiprandGenerateLogNormalDouble_assumed_rank
#else
    module procedure &
      hiprandGenerateLogNormalDouble_rank_0,&
      hiprandGenerateLogNormalDouble_rank_1
#endif
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
      import
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGeneratePoisson_
      type(c_ptr),value :: generator
      type(c_ptr),value :: output_data
      integer(c_size_t),value :: n
      real(c_double),value :: lambda
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure hiprandGeneratePoisson_assumed_rank
#else
    module procedure &
      hiprandGeneratePoisson_rank_0,&
      hiprandGeneratePoisson_rank_1
#endif
#endif
  end interface


  contains

    subroutine hiprandCheck(status)
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: status
      if (status /= HIPRAND_STATUS_SUCCESS) then
        write (*, *) "HIPRAND ERROR: code = ", status
        stop 1
      end if
    end subroutine hiprandCheck

#ifdef USE_FPOINTER_INTERFACES

#ifdef USE_ASSUMED_RANK_INTERFACES
    function hiprandGenerate_assumed_rank(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerate_assumed_rank
      type(c_ptr) :: generator
      integer(c_int),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      !
      hiprandGenerate_assumed_rank = hiprandGenerate_(generator,c_loc(output_data),n)
    end function

#else
    function hiprandGenerate_rank_0(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerate_rank_0
      type(c_ptr) :: generator
      integer(c_int),target :: output_data
      integer(c_size_t) :: n
      !
      hiprandGenerate_rank_0 = hiprandGenerate_(generator,c_loc(output_data),n)
    end function

    function hiprandGenerate_rank_1(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerate_rank_1
      type(c_ptr) :: generator
      integer(c_int),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      !
      hiprandGenerate_rank_1 = hiprandGenerate_(generator,c_loc(output_data),n)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hiprandGenerateLongLong_assumed_rank(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateLongLong_assumed_rank
      type(c_ptr) :: generator
      integer(c_int64_t),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      !
      hiprandGenerateLongLong_assumed_rank = hiprandGenerateLongLong_(generator, &
        c_loc(output_data),n)
    end function

#else
    function hiprandGenerateLongLong_rank_0(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateLongLong_rank_0
      type(c_ptr) :: generator
      integer(c_int64_t),target :: output_data
      integer(c_size_t) :: n
      !
      hiprandGenerateLongLong_rank_0 = hiprandGenerateLongLong_(generator,c_loc(output_data),n)
    end function

    function hiprandGenerateLongLong_rank_1(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateLongLong_rank_1
      type(c_ptr) :: generator
      integer(c_int64_t),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      !
      hiprandGenerateLongLong_rank_1 = hiprandGenerateLongLong_(generator,c_loc(output_data),n)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hiprandGenerateUniform_assumed_rank(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateUniform_assumed_rank
      type(c_ptr) :: generator
      real(c_float),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      !
      hiprandGenerateUniform_assumed_rank = hiprandGenerateUniform_(generator,c_loc(output_data),n)
    end function

#else
    function hiprandGenerateUniform_rank_0(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateUniform_rank_0
      type(c_ptr) :: generator
      real(c_float),target :: output_data
      integer(c_size_t) :: n
      !
      hiprandGenerateUniform_rank_0 = hiprandGenerateUniform_(generator,c_loc(output_data),n)
    end function

    function hiprandGenerateUniform_rank_1(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateUniform_rank_1
      type(c_ptr) :: generator
      real(c_float),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      !
      hiprandGenerateUniform_rank_1 = hiprandGenerateUniform_(generator,c_loc(output_data),n)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hiprandGenerateUniformDouble_assumed_rank(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateUniformDouble_assumed_rank
      type(c_ptr) :: generator
      real(c_double),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      !
      hiprandGenerateUniformDouble_assumed_rank = hiprandGenerateUniformDouble_(generator, &
        c_loc(output_data),n)
    end function

#else
    function hiprandGenerateUniformDouble_rank_0(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateUniformDouble_rank_0
      type(c_ptr) :: generator
      real(c_double),target :: output_data
      integer(c_size_t) :: n
      !
      hiprandGenerateUniformDouble_rank_0 = hiprandGenerateUniformDouble_(generator, &
        c_loc(output_data),n)
    end function

    function hiprandGenerateUniformDouble_rank_1(generator,output_data,n)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateUniformDouble_rank_1
      type(c_ptr) :: generator
      real(c_double),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      !
      hiprandGenerateUniformDouble_rank_1 = hiprandGenerateUniformDouble_(generator, &
        c_loc(output_data),n)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hiprandGenerateNormal_assumed_rank(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateNormal_assumed_rank
      type(c_ptr) :: generator
      real(c_float),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      real(c_float) :: mean
      real(c_float) :: stddev
      !
      hiprandGenerateNormal_assumed_rank = hiprandGenerateNormal_(generator,c_loc(output_data),n, &
        mean,stddev)
    end function

#else
    function hiprandGenerateNormal_rank_0(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateNormal_rank_0
      type(c_ptr) :: generator
      real(c_float),target :: output_data
      integer(c_size_t) :: n
      real(c_float) :: mean
      real(c_float) :: stddev
      !
      hiprandGenerateNormal_rank_0 = hiprandGenerateNormal_(generator,c_loc(output_data),n,mean, &
        stddev)
    end function

    function hiprandGenerateNormal_rank_1(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateNormal_rank_1
      type(c_ptr) :: generator
      real(c_float),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      real(c_float) :: mean
      real(c_float) :: stddev
      !
      hiprandGenerateNormal_rank_1 = hiprandGenerateNormal_(generator,c_loc(output_data),n,mean, &
        stddev)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hiprandGenerateNormalDouble_assumed_rank(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateNormalDouble_assumed_rank
      type(c_ptr) :: generator
      real(c_double),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      real(c_double) :: mean
      real(c_double) :: stddev
      !
      hiprandGenerateNormalDouble_assumed_rank = hiprandGenerateNormalDouble_(generator, &
        c_loc(output_data),n,mean,stddev)
    end function

#else
    function hiprandGenerateNormalDouble_rank_0(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateNormalDouble_rank_0
      type(c_ptr) :: generator
      real(c_double),target :: output_data
      integer(c_size_t) :: n
      real(c_double) :: mean
      real(c_double) :: stddev
      !
      hiprandGenerateNormalDouble_rank_0 = hiprandGenerateNormalDouble_(generator, &
        c_loc(output_data),n,mean,stddev)
    end function

    function hiprandGenerateNormalDouble_rank_1(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateNormalDouble_rank_1
      type(c_ptr) :: generator
      real(c_double),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      real(c_double) :: mean
      real(c_double) :: stddev
      !
      hiprandGenerateNormalDouble_rank_1 = hiprandGenerateNormalDouble_(generator, &
        c_loc(output_data),n,mean,stddev)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hiprandGenerateLogNormal_assumed_rank(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateLogNormal_assumed_rank
      type(c_ptr) :: generator
      real(c_float),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      real(c_float) :: mean
      real(c_float) :: stddev
      !
      hiprandGenerateLogNormal_assumed_rank = hiprandGenerateLogNormal_(generator, &
        c_loc(output_data),n,mean,stddev)
    end function

#else
    function hiprandGenerateLogNormal_rank_0(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateLogNormal_rank_0
      type(c_ptr) :: generator
      real(c_float),target :: output_data
      integer(c_size_t) :: n
      real(c_float) :: mean
      real(c_float) :: stddev
      !
      hiprandGenerateLogNormal_rank_0 = hiprandGenerateLogNormal_(generator,c_loc(output_data),n, &
        mean,stddev)
    end function

    function hiprandGenerateLogNormal_rank_1(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateLogNormal_rank_1
      type(c_ptr) :: generator
      real(c_float),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      real(c_float) :: mean
      real(c_float) :: stddev
      !
      hiprandGenerateLogNormal_rank_1 = hiprandGenerateLogNormal_(generator,c_loc(output_data),n, &
        mean,stddev)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hiprandGenerateLogNormalDouble_assumed_rank(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateLogNormalDouble_assumed_rank
      type(c_ptr) :: generator
      real(c_double),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      real(c_double) :: mean
      real(c_double) :: stddev
      !
      hiprandGenerateLogNormalDouble_assumed_rank = hiprandGenerateLogNormalDouble_(generator, &
        c_loc(output_data),n,mean,stddev)
    end function

#else
    function hiprandGenerateLogNormalDouble_rank_0(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateLogNormalDouble_rank_0
      type(c_ptr) :: generator
      real(c_double),target :: output_data
      integer(c_size_t) :: n
      real(c_double) :: mean
      real(c_double) :: stddev
      !
      hiprandGenerateLogNormalDouble_rank_0 = hiprandGenerateLogNormalDouble_(generator, &
        c_loc(output_data),n,mean,stddev)
    end function

    function hiprandGenerateLogNormalDouble_rank_1(generator,output_data,n,mean,stddev)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGenerateLogNormalDouble_rank_1
      type(c_ptr) :: generator
      real(c_double),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      real(c_double) :: mean
      real(c_double) :: stddev
      !
      hiprandGenerateLogNormalDouble_rank_1 = hiprandGenerateLogNormalDouble_(generator, &
        c_loc(output_data),n,mean,stddev)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function hiprandGeneratePoisson_assumed_rank(generator,output_data,n,lambda)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGeneratePoisson_assumed_rank
      type(c_ptr) :: generator
      integer(c_int),target,contiguous,dimension(..) :: output_data
      integer(c_size_t) :: n
      real(c_double) :: lambda
      !
      hiprandGeneratePoisson_assumed_rank = hiprandGeneratePoisson_(generator,c_loc(output_data), &
        n,lambda)
    end function

#else
    function hiprandGeneratePoisson_rank_0(generator,output_data,n,lambda)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGeneratePoisson_rank_0
      type(c_ptr) :: generator
      integer(c_int),target :: output_data
      integer(c_size_t) :: n
      real(c_double) :: lambda
      !
      hiprandGeneratePoisson_rank_0 = hiprandGeneratePoisson_(generator,c_loc(output_data),n,lambda)
    end function

    function hiprandGeneratePoisson_rank_1(generator,output_data,n,lambda)
      use iso_c_binding
      implicit none
      integer(kind(HIPRAND_STATUS_SUCCESS)) :: hiprandGeneratePoisson_rank_1
      type(c_ptr) :: generator
      integer(c_int),target,dimension(:) :: output_data
      integer(c_size_t) :: n
      real(c_double) :: lambda
      !
      hiprandGeneratePoisson_rank_1 = hiprandGeneratePoisson_(generator,c_loc(output_data),n,lambda)
    end function

#endif
#endif
end module hiprand
