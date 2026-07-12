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

module hipfort_rocrand
  use hipfort_rocrand_enums
  use hipfort_rocrand_types
  use hipfort_handles
  use, intrinsic :: iso_c_binding
  implicit none

  interface

    !---------------------------------------------
    ! rocrand_create_poisson_distribution
    !---------------------------------------------
    !> \brief Construct the histogram for a Poisson distribution.
    !>
    !> Construct the histogram for the Poisson distribution with lambda \p lambda.
    !>
    !> \param lambda lambda for the Poisson distribution
    !> \param discrete_distribution pointer to the histogram in device memory
    !>
    !> \return
    !> - ROCRAND_STATUS_ALLOCATION_FAILED if memory could not be allocated \n
    !> - ROCRAND_STATUS_OUT_OF_RANGE if \p discrete_distribution pointer was null \n
    !> - ROCRAND_STATUS_OUT_OF_RANGE if lambda is non-positive \n
    !> - ROCRAND_STATUS_SUCCESS if the histogram was constructed successfully \n
    function rocrand_create_poisson_distribution(lambda, discrete_distribution) &
       result(create_poisson_distribution) &
       bind(C, name="rocrand_create_poisson_distribution")
       import :: c_double, c_ptr, c_int
       real(c_double), value :: lambda
       type(c_ptr) :: discrete_distribution
       integer(c_int) :: create_poisson_distribution
    end function rocrand_create_poisson_distribution

    !---------------------------------------------
    ! rocrand_destroy_discrete_distribution
    !---------------------------------------------
    !> \brief Destroy the histogram array for a discrete distribution.
    !>
    !> Destroy the histogram array for a discrete distribution created by
    !> rocrand_create_poisson_distribution.
    !>
    !> \param discrete_distribution pointer to the histogram in device memory
    !>
    !> \return
    !> - ROCRAND_STATUS_OUT_OF_RANGE if \p discrete_distribution was null \n
    !> - ROCRAND_STATUS_SUCCESS if the histogram was destroyed successfully \n
    function rocrand_destroy_discrete_distribution(discrete_distribution) &
       result(destroy_discrete_distribution) &
       bind(C, name="rocrand_destroy_discrete_distribution")
       import :: c_ptr, c_int
       type(c_ptr), value :: discrete_distribution
       integer(c_int) :: destroy_discrete_distribution
    end function rocrand_destroy_discrete_distribution

    !---------------------------------------------
    ! rocrand_get_direction_vectors32
    !---------------------------------------------
    !> \brief Get the vector for 32-bit (scrambled-)sobol generation.
    !>
    !> \param vectors location where to write the vector pointer to
    !>
    !> \param set which direction vector set to use
    !>
    !> \return
    !> - ROCRAND_STATUS_OUT_OF_RANGE if \p set was invalid for this method \n
    !> - ROCRAND_STATUS_SUCCESS if the pointer was set succesfully \n
    function rocrand_get_direction_vectors32(vectors, set) &
       result(get_direction_vectors32) &
       bind(C, name="rocrand_get_direction_vectors32")
       import :: c_ptr, c_int
       type(c_ptr) :: vectors
       integer(c_int), value :: set
       integer(c_int) :: get_direction_vectors32
    end function rocrand_get_direction_vectors32

    !---------------------------------------------
    ! rocrand_get_direction_vectors64
    !---------------------------------------------
    !> \brief Get the vector for 64-bit (scrambled-)sobol generation.
    !>
    !> \param vectors location where to write the vector pointer to
    !>
    !> \param set which direction vector set to use
    !>
    !> \return
    !> - ROCRAND_STATUS_OUT_OF_RANGE if \p set was invalid for this method \n
    !> - ROCRAND_STATUS_SUCCESS if the pointer was set succesfully \n
    function rocrand_get_direction_vectors64(vectors, set) &
       result(get_direction_vectors64) &
       bind(C, name="rocrand_get_direction_vectors64")
       import :: c_ptr, c_int
       type(c_ptr) :: vectors
       integer(c_int), value :: set
       integer(c_int) :: get_direction_vectors64
    end function rocrand_get_direction_vectors64

    !---------------------------------------------
    ! rocrand_get_scramble_constants32
    !---------------------------------------------
    !> \brief Get the scramble constants for 32-bit scrambled sobol generation.
    !>
    !> \param constants location where to write the constants pointer to
    !>
    !> \return
    !> - ROCRAND_STATUS_SUCCESS if the pointer was set succesfully \n
    function rocrand_get_scramble_constants32(constants) &
       result(get_scramble_constants32) &
       bind(C, name="rocrand_get_scramble_constants32")
       import :: c_ptr, c_int
       type(c_ptr) :: constants
       integer(c_int) :: get_scramble_constants32
    end function rocrand_get_scramble_constants32

    !---------------------------------------------
    ! rocrand_get_scramble_constants64
    !---------------------------------------------
    !> \brief Get the scramble constants for 64-bit scrambled sobol generation.
    !>
    !> \param constants location where to write the constants pointer to
    !>
    !> \return
    !> - ROCRAND_STATUS_SUCCESS if the pointer was set succesfully \n
    function rocrand_get_scramble_constants64(constants) &
       result(get_scramble_constants64) &
       bind(C, name="rocrand_get_scramble_constants64")
       import :: c_ptr, c_int
       type(c_ptr) :: constants
       integer(c_int) :: get_scramble_constants64
    end function rocrand_get_scramble_constants64

  end interface

  interface rocrand_create_generator
    !---------------------------------------------
    ! rocrand_create_generator
    !---------------------------------------------
    !> \brief Creates a new random number generator.
    !>
    !> Creates a new pseudo random number generator of type \p rng_type
    !> and returns it in \p generator.
    !>
    !> Values for \p rng_type are:
    !> - ROCRAND_RNG_PSEUDO_XORWOW
    !> - ROCRAND_RNG_PSEUDO_MRG31K3P
    !> - ROCRAND_RNG_PSEUDO_MRG32K3A
    !> - ROCRAND_RNG_PSEUDO_MTGP32
    !> - ROCRAND_RNG_PSEUDO_PHILOX4_32_10
    !> - ROCRAND_RNG_PSEUDO_LFSR113
    !> - ROCRAND_RNG_PSEUDO_THREEFRY2_32_20
    !> - ROCRAND_RNG_PSEUDO_THREEFRY2_64_20
    !> - ROCRAND_RNG_PSEUDO_THREEFRY4_32_20
    !> - ROCRAND_RNG_PSEUDO_THREEFRY4_64_20
    !> - ROCRAND_RNG_QUASI_SOBOL32
    !> - ROCRAND_RNG_QUASI_SCRAMBLED_SOBOL32
    !> - ROCRAND_RNG_QUASI_SOBOL64
    !> - ROCRAND_RNG_QUASI_SCRAMBLED_SOBOL64
    !>
    !> \param generator Pointer to generator
    !> \param rng_type Type of generator to create
    !>
    !> \return
    !> - ROCRAND_STATUS_ALLOCATION_FAILED, if memory could not be allocated \n
    !> - ROCRAND_STATUS_VERSION_MISMATCH if the header file version does not match the
    !> dynamically linked library version \n
    !> - ROCRAND_STATUS_TYPE_ERROR if the value for \p rng_type is invalid \n
    !> - ROCRAND_STATUS_SUCCESS if generator was created successfully \n
    function rocrand_create_generator_raw(generator, rng_type) &
       result(create_generator_raw) &
       bind(C, name="rocrand_create_generator")
       import :: c_ptr, c_int
       type(c_ptr) :: generator
       integer(c_int), value :: rng_type
       integer(c_int) :: create_generator_raw
    end function rocrand_create_generator_raw

    module procedure rocrand_create_generator_typed
  end interface rocrand_create_generator

  interface rocrand_create_generator_host
    !---------------------------------------------
    ! rocrand_create_generator_host
    !---------------------------------------------
    !> \brief Creates a new host random number generator.
    !>
    !> Creates a new pseudo random number generator of type \p rng_type
    !> and returns it in \p generator. This generator is executed on the host rather than
    !> on a device, and it is enqueued on the stream associated with the generator.
    !>
    !> All generators are supported.
    !>
    !> \param generator Pointer to generator
    !> \param rng_type Type of generator to create
    !>
    !> \return
    !> - ROCRAND_STATUS_ALLOCATION_FAILED, if memory could not be allocated \n
    !> - ROCRAND_STATUS_VERSION_MISMATCH if the header file version does not match the
    !> dynamically linked library version \n
    !> - ROCRAND_STATUS_TYPE_ERROR if the value for \p rng_type is invalid \n
    !> - ROCRAND_STATUS_SUCCESS if generator was created successfully \n
    function rocrand_create_generator_host_raw(generator, rng_type) &
       result(create_generator_host_raw) &
       bind(C, name="rocrand_create_generator_host")
       import :: c_ptr, c_int
       type(c_ptr) :: generator
       integer(c_int), value :: rng_type
       integer(c_int) :: create_generator_host_raw
    end function rocrand_create_generator_host_raw

    module procedure rocrand_create_generator_host_typed
  end interface rocrand_create_generator_host

  interface rocrand_create_generator_host_blocking
    !---------------------------------------------
    ! rocrand_create_generator_host_blocking
    !---------------------------------------------
    !> \brief Creates a new host random number generator, similar to
    !> `rocrand_create_generator_host`.
    !> The exception is that, instead of enqueuing the host function in the stream,
    !> execution happens synchronously with respect to the calling thread and the stream is ignored.
    function rocrand_create_generator_host_blocking_raw(generator, rng_type) &
       result(create_generator_host_blocking_raw) &
       bind(C, name="rocrand_create_generator_host_blocking")
       import :: c_ptr, c_int
       type(c_ptr) :: generator
       integer(c_int), value :: rng_type
       integer(c_int) :: create_generator_host_blocking_raw
    end function rocrand_create_generator_host_blocking_raw

    module procedure rocrand_create_generator_host_blocking_typed
  end interface rocrand_create_generator_host_blocking

  interface rocrand_destroy_generator
    !---------------------------------------------
    ! rocrand_destroy_generator
    !---------------------------------------------
    !> \brief Destroys random number generator.
    !>
    !> Destroys random number generator and frees related memory.
    !>
    !> \param generator Generator to be destroyed
    !>
    !> \return
    !> - ROCRAND_STATUS_NOT_CREATED if the generator wasn't created \n
    !> - ROCRAND_STATUS_SUCCESS if generator was destroyed successfully \n
    function rocrand_destroy_generator_raw(generator) &
       result(destroy_generator_raw) &
       bind(C, name="rocrand_destroy_generator")
       import :: c_ptr, c_int
       type(c_ptr), value :: generator
       integer(c_int) :: destroy_generator_raw
    end function rocrand_destroy_generator_raw

    module procedure rocrand_destroy_generator_typed
  end interface rocrand_destroy_generator

  interface rocrand_generate
    !---------------------------------------------
    ! rocrand_generate
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
    !> \return
    !> - ROCRAND_STATUS_NOT_CREATED if the generator wasn't created \n
    !> - ROCRAND_STATUS_LAUNCH_FAILURE if a HIP kernel launch failed \n
    !> - ROCRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not a multiple of the dimension
    !> of used quasi-random generator \n
    !> - ROCRAND_STATUS_SUCCESS if random numbers were successfully generated \n
    function rocrand_generate_raw(generator, output_data, n) &
       result(generate_raw) &
       bind(C, name="rocrand_generate")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: generator
       type(c_ptr), value :: output_data
       integer(c_long), value :: n
       integer(c_int) :: generate_raw
    end function rocrand_generate_raw

    module procedure rocrand_generate_native
    module procedure rocrand_generate_typed
  end interface rocrand_generate

  interface rocrand_generate_long_long
    !---------------------------------------------
    ! rocrand_generate_long_long
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
    !> \return
    !> - ROCRAND_STATUS_NOT_CREATED if the generator wasn't created \n
    !> - ROCRAND_STATUS_LAUNCH_FAILURE if a HIP kernel launch failed \n
    !> - ROCRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not a multiple of the dimension
    !> of used quasi-random generator \n
    !> - ROCRAND_TYPE_ERROR if the generator can't natively generate 64-bit random numbers \n
    !> - ROCRAND_STATUS_SUCCESS if random numbers were successfully generated \n
    function rocrand_generate_long_long_raw(generator, output_data, n) &
       result(generate_long_long_raw) &
       bind(C, name="rocrand_generate_long_long")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: generator
       type(c_ptr), value :: output_data
       integer(c_long), value :: n
       integer(c_int) :: generate_long_long_raw
    end function rocrand_generate_long_long_raw

    module procedure rocrand_generate_long_long_native
    module procedure rocrand_generate_long_long_typed
  end interface rocrand_generate_long_long

  interface rocrand_generate_char
    !---------------------------------------------
    ! rocrand_generate_char
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
    !> - ROCRAND_STATUS_NOT_CREATED if the generator wasn't created \n
    !> - ROCRAND_STATUS_LAUNCH_FAILURE if a HIP kernel launch failed \n
    !> - ROCRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not a multiple of the dimension
    !> of used quasi-random generator \n
    !> - ROCRAND_STATUS_SUCCESS if random numbers were successfully generated \n
    function rocrand_generate_char_raw(generator, output_data, n) &
       result(generate_char_raw) &
       bind(C, name="rocrand_generate_char")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: generator
       type(c_ptr), value :: output_data
       integer(c_long), value :: n
       integer(c_int) :: generate_char_raw
    end function rocrand_generate_char_raw

    module procedure rocrand_generate_char_typed
  end interface rocrand_generate_char

  interface rocrand_generate_short
    !---------------------------------------------
    ! rocrand_generate_short
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
    !> - ROCRAND_STATUS_NOT_CREATED if the generator wasn't created \n
    !> - ROCRAND_STATUS_LAUNCH_FAILURE if a HIP kernel launch failed \n
    !> - ROCRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not a multiple of the dimension
    !> of used quasi-random generator \n
    !> - ROCRAND_STATUS_SUCCESS if random numbers were successfully generated \n
    function rocrand_generate_short_raw(generator, output_data, n) &
       result(generate_short_raw) &
       bind(C, name="rocrand_generate_short")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: generator
       type(c_ptr), value :: output_data
       integer(c_long), value :: n
       integer(c_int) :: generate_short_raw
    end function rocrand_generate_short_raw

    module procedure rocrand_generate_short_typed
  end interface rocrand_generate_short

  interface rocrand_generate_uniform
    !---------------------------------------------
    ! rocrand_generate_uniform
    !---------------------------------------------
    !> \brief Generates uniformly distributed \p float values.
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
    !> - ROCRAND_STATUS_NOT_CREATED if the generator wasn't created \n
    !> - ROCRAND_STATUS_LAUNCH_FAILURE if a HIP kernel launch failed \n
    !> - ROCRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not a multiple of the dimension
    !> of used quasi-random generator \n
    !> - ROCRAND_STATUS_SUCCESS if random numbers were successfully generated \n
    function rocrand_generate_uniform_raw(generator, output_data, n) &
       result(generate_uniform_raw) &
       bind(C, name="rocrand_generate_uniform")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: generator
       type(c_ptr), value :: output_data
       integer(c_long), value :: n
       integer(c_int) :: generate_uniform_raw
    end function rocrand_generate_uniform_raw

    module procedure rocrand_generate_uniform_native
    module procedure rocrand_generate_uniform_typed
  end interface rocrand_generate_uniform

  interface rocrand_generate_uniform_double
    !---------------------------------------------
    ! rocrand_generate_uniform_double
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
    !> \param n Number of doubles to generate
    !>
    !> \return
    !> - ROCRAND_STATUS_NOT_CREATED if the generator wasn't created \n
    !> - ROCRAND_STATUS_LAUNCH_FAILURE if a HIP kernel launch failed \n
    !> - ROCRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not a multiple of the dimension
    !> of used quasi-random generator \n
    !> - ROCRAND_STATUS_SUCCESS if random numbers were successfully generated \n
    function rocrand_generate_uniform_double_raw(generator, output_data, n) &
       result(generate_uniform_double_raw) &
       bind(C, name="rocrand_generate_uniform_double")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: generator
       type(c_ptr), value :: output_data
       integer(c_long), value :: n
       integer(c_int) :: generate_uniform_double_raw
    end function rocrand_generate_uniform_double_raw

    module procedure rocrand_generate_uniform_double_native
    module procedure rocrand_generate_uniform_double_typed
  end interface rocrand_generate_uniform_double

  interface rocrand_generate_uniform_half
    !---------------------------------------------
    ! rocrand_generate_uniform_half
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
    !> - ROCRAND_STATUS_NOT_CREATED if the generator wasn't created \n
    !> - ROCRAND_STATUS_LAUNCH_FAILURE if a HIP kernel launch failed \n
    !> - ROCRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not a multiple of the dimension
    !> of used quasi-random generator \n
    !> - ROCRAND_STATUS_SUCCESS if random numbers were successfully generated \n
    function rocrand_generate_uniform_half_raw(generator, output_data, n) &
       result(generate_uniform_half_raw) &
       bind(C, name="rocrand_generate_uniform_half")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: generator
       type(c_ptr), value :: output_data
       integer(c_long), value :: n
       integer(c_int) :: generate_uniform_half_raw
    end function rocrand_generate_uniform_half_raw

    module procedure rocrand_generate_uniform_half_typed
  end interface rocrand_generate_uniform_half

  interface rocrand_generate_normal
    !---------------------------------------------
    ! rocrand_generate_normal
    !---------------------------------------------
    !> \brief Generates normally distributed \p float values.
    !>
    !> Generates \p n normally distributed distributed 32-bit floating-point
    !> values and saves them to \p output_data.
    !>
    !> \param generator Generator to use
    !> \param output_data Pointer to memory to store generated numbers
    !> \param n Number of floats to generate
    !> \param mean Mean value of normal distribution
    !> \param stddev Standard deviation value of normal distribution
    !>
    !> \return
    !> - ROCRAND_STATUS_NOT_CREATED if the generator wasn't created \n
    !> - ROCRAND_STATUS_LAUNCH_FAILURE if a HIP kernel launch failed \n
    !> - ROCRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not a multiple of the dimension
    !> of used quasi-random generator \n
    !> - ROCRAND_STATUS_SUCCESS if random numbers were successfully generated \n
    function rocrand_generate_normal_raw(generator, output_data, n, mean, stddev) &
       result(generate_normal_raw) &
       bind(C, name="rocrand_generate_normal")
       import :: c_ptr, c_long, c_float, c_int
       type(c_ptr), value :: generator
       type(c_ptr), value :: output_data
       integer(c_long), value :: n
       real(c_float), value :: mean
       real(c_float), value :: stddev
       integer(c_int) :: generate_normal_raw
    end function rocrand_generate_normal_raw

    module procedure rocrand_generate_normal_native
    module procedure rocrand_generate_normal_typed
  end interface rocrand_generate_normal

  interface rocrand_generate_normal_double
    !---------------------------------------------
    ! rocrand_generate_normal_double
    !---------------------------------------------
    !> \brief Generates normally distributed \p double values.
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
    !> - ROCRAND_STATUS_NOT_CREATED if the generator wasn't created \n
    !> - ROCRAND_STATUS_LAUNCH_FAILURE if a HIP kernel launch failed \n
    !> - ROCRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not a multiple of the dimension
    !> of used quasi-random generator \n
    !> - ROCRAND_STATUS_SUCCESS if random numbers were successfully generated \n
    function rocrand_generate_normal_double_raw(generator, output_data, n, mean, stddev) &
       result(generate_normal_double_raw) &
       bind(C, name="rocrand_generate_normal_double")
       import :: c_ptr, c_long, c_double, c_int
       type(c_ptr), value :: generator
       type(c_ptr), value :: output_data
       integer(c_long), value :: n
       real(c_double), value :: mean
       real(c_double), value :: stddev
       integer(c_int) :: generate_normal_double_raw
    end function rocrand_generate_normal_double_raw

    module procedure rocrand_generate_normal_double_native
    module procedure rocrand_generate_normal_double_typed
  end interface rocrand_generate_normal_double

  interface rocrand_generate_normal_half
    !---------------------------------------------
    ! rocrand_generate_normal_half
    !---------------------------------------------
    !> \brief Generates normally distributed \p half values.
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
    !> - ROCRAND_STATUS_NOT_CREATED if the generator wasn't created \n
    !> - ROCRAND_STATUS_LAUNCH_FAILURE if a HIP kernel launch failed \n
    !> - ROCRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not a multiple of the dimension
    !> of used quasi-random generator \n
    !> - ROCRAND_STATUS_SUCCESS if random numbers were successfully generated \n
    function rocrand_generate_normal_half_raw(generator, output_data, n, mean, stddev) &
       result(generate_normal_half_raw) &
       bind(C, name="rocrand_generate_normal_half")
       import :: c_ptr, c_long, c_short, c_int
       type(c_ptr), value :: generator
       type(c_ptr), value :: output_data
       integer(c_long), value :: n
       integer(c_short), value :: mean
       integer(c_short), value :: stddev
       integer(c_int) :: generate_normal_half_raw
    end function rocrand_generate_normal_half_raw

    module procedure rocrand_generate_normal_half_typed
  end interface rocrand_generate_normal_half

  interface rocrand_generate_log_normal
    !---------------------------------------------
    ! rocrand_generate_log_normal
    !---------------------------------------------
    !> \brief Generates log-normally distributed \p float values.
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
    !> - ROCRAND_STATUS_NOT_CREATED if the generator wasn't created \n
    !> - ROCRAND_STATUS_LAUNCH_FAILURE if a HIP kernel launch failed \n
    !> - ROCRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not a multiple of the dimension
    !> of used quasi-random generator \n
    !> - ROCRAND_STATUS_SUCCESS if random numbers were successfully generated \n
    function rocrand_generate_log_normal_raw(generator, output_data, n, mean, stddev) &
       result(generate_log_normal_raw) &
       bind(C, name="rocrand_generate_log_normal")
       import :: c_ptr, c_long, c_float, c_int
       type(c_ptr), value :: generator
       type(c_ptr), value :: output_data
       integer(c_long), value :: n
       real(c_float), value :: mean
       real(c_float), value :: stddev
       integer(c_int) :: generate_log_normal_raw
    end function rocrand_generate_log_normal_raw

    module procedure rocrand_generate_log_normal_native
    module procedure rocrand_generate_log_normal_typed
  end interface rocrand_generate_log_normal

  interface rocrand_generate_log_normal_double
    !---------------------------------------------
    ! rocrand_generate_log_normal_double
    !---------------------------------------------
    !> \brief Generates log-normally distributed \p double values.
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
    !> - ROCRAND_STATUS_NOT_CREATED if the generator wasn't created \n
    !> - ROCRAND_STATUS_LAUNCH_FAILURE if a HIP kernel launch failed \n
    !> - ROCRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not a multiple of the dimension
    !> of used quasi-random generator \n
    !> - ROCRAND_STATUS_SUCCESS if random numbers were successfully generated \n
    function rocrand_generate_log_normal_double_raw(generator, output_data, n, mean, stddev) &
       result(generate_log_normal_double_raw) &
       bind(C, name="rocrand_generate_log_normal_double")
       import :: c_ptr, c_long, c_double, c_int
       type(c_ptr), value :: generator
       type(c_ptr), value :: output_data
       integer(c_long), value :: n
       real(c_double), value :: mean
       real(c_double), value :: stddev
       integer(c_int) :: generate_log_normal_double_raw
    end function rocrand_generate_log_normal_double_raw

    module procedure rocrand_generate_log_normal_double_native
    module procedure rocrand_generate_log_normal_double_typed
  end interface rocrand_generate_log_normal_double

  interface rocrand_generate_log_normal_half
    !---------------------------------------------
    ! rocrand_generate_log_normal_half
    !---------------------------------------------
    !> \brief Generates log-normally distributed \p half values.
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
    !> - ROCRAND_STATUS_NOT_CREATED if the generator wasn't created \n
    !> - ROCRAND_STATUS_LAUNCH_FAILURE if a HIP kernel launch failed \n
    !> - ROCRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not a multiple of the dimension
    !> of used quasi-random generator \n
    !> - ROCRAND_STATUS_SUCCESS if random numbers were successfully generated \n
    function rocrand_generate_log_normal_half_raw(generator, output_data, n, mean, stddev) &
       result(generate_log_normal_half_raw) &
       bind(C, name="rocrand_generate_log_normal_half")
       import :: c_ptr, c_long, c_short, c_int
       type(c_ptr), value :: generator
       type(c_ptr), value :: output_data
       integer(c_long), value :: n
       integer(c_short), value :: mean
       integer(c_short), value :: stddev
       integer(c_int) :: generate_log_normal_half_raw
    end function rocrand_generate_log_normal_half_raw

    module procedure rocrand_generate_log_normal_half_typed
  end interface rocrand_generate_log_normal_half

  interface rocrand_generate_poisson
    !---------------------------------------------
    ! rocrand_generate_poisson
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
    !> - ROCRAND_STATUS_NOT_CREATED if the generator wasn't created \n
    !> - ROCRAND_STATUS_LAUNCH_FAILURE if a HIP kernel launch failed \n
    !> - ROCRAND_STATUS_OUT_OF_RANGE if lambda is non-positive \n
    !> - ROCRAND_STATUS_LENGTH_NOT_MULTIPLE if \p n is not a multiple of the dimension
    !> of used quasi-random generator \n
    !> - ROCRAND_STATUS_SUCCESS if random numbers were successfully generated \n
    function rocrand_generate_poisson_raw(generator, output_data, n, lambda) &
       result(generate_poisson_raw) &
       bind(C, name="rocrand_generate_poisson")
       import :: c_ptr, c_long, c_double, c_int
       type(c_ptr), value :: generator
       type(c_ptr), value :: output_data
       integer(c_long), value :: n
       real(c_double), value :: lambda
       integer(c_int) :: generate_poisson_raw
    end function rocrand_generate_poisson_raw

    module procedure rocrand_generate_poisson_native
    module procedure rocrand_generate_poisson_typed
  end interface rocrand_generate_poisson

  interface rocrand_initialize_generator
    !---------------------------------------------
    ! rocrand_initialize_generator
    !---------------------------------------------
    !> \brief Initializes the generator's state on GPU or host.
    !>
    !> Initializes the generator's state on GPU or host. User it not
    !> required to call this function before using a generator.
    !>
    !> If rocrand_initialize() was not called for a generator, it will be
    !> automatically called by functions which generates random numbers like
    !> rocrand_generate(), rocrand_generate_uniform() etc.
    !>
    !> \param generator Generator to initialize
    !>
    !> \return
    !> - ROCRAND_STATUS_NOT_CREATED if the generator wasn't created \n
    !> - ROCRAND_STATUS_LAUNCH_FAILURE if a HIP kernel launch failed \n
    !> - ROCRAND_STATUS_SUCCESS if the seeds were generated successfully \n
    function rocrand_initialize_generator_raw(generator) &
       result(initialize_generator_raw) &
       bind(C, name="rocrand_initialize_generator")
       import :: c_ptr, c_int
       type(c_ptr), value :: generator
       integer(c_int) :: initialize_generator_raw
    end function rocrand_initialize_generator_raw

    module procedure rocrand_initialize_generator_typed
  end interface rocrand_initialize_generator

  interface rocrand_set_stream
    !---------------------------------------------
    ! rocrand_set_stream
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
    !> - ROCRAND_STATUS_NOT_CREATED if the generator wasn't created \n
    !> - ROCRAND_STATUS_SUCCESS if stream was set successfully \n
    function rocrand_set_stream_raw(generator, stream) &
       result(set_stream_raw) &
       bind(C, name="rocrand_set_stream")
       import :: c_ptr, c_int
       type(c_ptr), value :: generator
       type(c_ptr), value :: stream
       integer(c_int) :: set_stream_raw
    end function rocrand_set_stream_raw

    module procedure rocrand_set_stream_typed
  end interface rocrand_set_stream

  interface rocrand_set_seed
    !---------------------------------------------
    ! rocrand_set_seed
    !---------------------------------------------
    !> \brief Sets the seed of a pseudo-random number generator.
    !>
    !> Sets the seed of the pseudo-random number generator.
    !>
    !> - This operation resets the generator's internal state.
    !> - This operation does not change the generator's offset.
    !>
    !> For an MRG32K3a or MRG31K3p generator the seed value can't be zero. If \p seed is
    !> equal to zero and generator's type is ROCRAND_RNG_PSEUDO_MRG32K3A or
    !> ROCRAND_RNG_PSEUDO_MRG31K3P,
    !> value \p 12345 is used as seed instead.
    !>
    !> For a LFSR113 generator seed values must be larger than 1, 7, 15,
    !> 127. The \p seed upper and lower 32 bits used as first and
    !> second seed value. If those values smaller than 2 and/or 8, those
    !> are increased with 1 and/or 7.
    !>
    !> \param generator Pseudo-random number generator
    !> \param seed New seed value
    !>
    !> \return
    !> - ROCRAND_STATUS_NOT_CREATED if the generator wasn't created \n
    !> - ROCRAND_STATUS_TYPE_ERROR if the generator is a quasi-random number generator \n
    !> - ROCRAND_STATUS_SUCCESS if seed was set successfully \n
    function rocrand_set_seed_raw(generator, seed) &
       result(set_seed_raw) &
       bind(C, name="rocrand_set_seed")
       import :: c_ptr, c_int64_t, c_int
       type(c_ptr), value :: generator
       integer(c_int64_t), value :: seed
       integer(c_int) :: set_seed_raw
    end function rocrand_set_seed_raw

    module procedure rocrand_set_seed_typed
  end interface rocrand_set_seed

  interface rocrand_set_seed_uint4
    !---------------------------------------------
    ! rocrand_set_seed_uint4
    !---------------------------------------------
    !> \brief Sets the seeds of a pseudo-random number generator.
    !>
    !> Sets the seed of the pseudo-random number generator. Currently only for LFSR113
    !>
    !> - This operation resets the generator's internal state.
    !> - This operation does not change the generator's offset.
    !>
    !> Only usable for LFSR113.
    !>
    !> For a LFSR113 generator seed values must be bigger than 1, 7, 15,
    !> 127. If those values smaller, than the requested minimum values [2, 8, 16, 128], then
    !> it will be increased with the minimum values minus 1 [1, 7, 15, 127].
    !>
    !> \param generator Pseudo-random number generator
    !> \param seed New seed value
    !>
    !> \return
    !> - ROCRAND_STATUS_NOT_CREATED if the generator wasn't created \n
    !> - ROCRAND_STATUS_TYPE_ERROR if the generator is a quasi-random number generator \n
    !> - ROCRAND_STATUS_SUCCESS if seed was set successfully \n
    function rocrand_set_seed_uint4_raw(generator, seed) &
       result(set_seed_uint4_raw) &
       bind(C, name="rocrand_set_seed_uint4")
       import :: c_ptr, c_int
       type(c_ptr), value :: generator
       type(c_ptr), value :: seed
       integer(c_int) :: set_seed_uint4_raw
    end function rocrand_set_seed_uint4_raw

    module procedure rocrand_set_seed_uint4_typed
  end interface rocrand_set_seed_uint4

  interface rocrand_set_offset
    !---------------------------------------------
    ! rocrand_set_offset
    !---------------------------------------------
    !> \brief Sets the offset of a random number generator.
    !>
    !> Sets the absolute offset of the random number generator.
    !>
    !> - This operation resets the generator's internal state.
    !> - This operation does not change the generator's seed.
    !>
    !> Absolute offset cannot be set if generator's type is ROCRAND_RNG_PSEUDO_MTGP32 or
    !> ROCRAND_RNG_PSEUDO_LFSR113.
    !>
    !> \param generator Random number generator
    !> \param offset New absolute offset
    !>
    !> \return
    !> - ROCRAND_STATUS_NOT_CREATED if the generator wasn't created \n
    !> - ROCRAND_STATUS_SUCCESS if offset was successfully set \n
    !> - ROCRAND_STATUS_TYPE_ERROR if generator's type is ROCRAND_RNG_PSEUDO_MTGP32 or
    !> ROCRAND_RNG_PSEUDO_LFSR113
    function rocrand_set_offset_raw(generator, offset) &
       result(set_offset_raw) &
       bind(C, name="rocrand_set_offset")
       import :: c_ptr, c_int64_t, c_int
       type(c_ptr), value :: generator
       integer(c_int64_t), value :: offset
       integer(c_int) :: set_offset_raw
    end function rocrand_set_offset_raw

    module procedure rocrand_set_offset_typed
  end interface rocrand_set_offset

  interface rocrand_set_ordering
    !---------------------------------------------
    ! rocrand_set_ordering
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
    !> The ordering choices for pseudorandom sequences are the following.
    !> Note that not all generators support all orderings. For details, see
    !> the Programmer's Guide in the documentation.
    !> - ROCRAND_ORDERING_PSEUDO_DEFAULT
    !> - ROCRAND_ORDERING_PSEUDO_LEGACY
    !> - ROCRAND_ORDERING_PSEUDO_BEST
    !> - ROCRAND_ORDERING_PSEUDO_SEEDED
    !> - ROCRAND_ORDERING_PSEUDO_DYNAMIC
    !>
    !> For quasirandom sequences there is only one ordering, ROCRAND_ORDERING_QUASI_DEFAULT.
    !>
    !> \return
    !> - ROCRAND_STATUS_NOT_CREATED if the generator wasn't created \n
    !> - ROCRAND_STATUS_OUT_OF_RANGE if the ordering is not valid \n
    !> - ROCRAND_STATUS_SUCCESS if the ordering was successfully set \n
    !> - ROCRAND_STATUS_TYPE_ERROR if generator's type is not valid
    function rocrand_set_ordering_raw(generator, order) &
       result(set_ordering_raw) &
       bind(C, name="rocrand_set_ordering")
       import :: c_ptr, c_int
       type(c_ptr), value :: generator
       integer(c_int), value :: order
       integer(c_int) :: set_ordering_raw
    end function rocrand_set_ordering_raw

    module procedure rocrand_set_ordering_typed
  end interface rocrand_set_ordering

  interface rocrand_set_quasi_random_generator_dimensions
    !---------------------------------------------
    ! rocrand_set_quasi_random_generator_dimensions
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
    !> - ROCRAND_STATUS_NOT_CREATED if the generator wasn't created \n
    !> - ROCRAND_STATUS_TYPE_ERROR if the generator is not a quasi-random number generator \n
    !> - ROCRAND_STATUS_OUT_OF_RANGE if \p dimensions is out of range \n
    !> - ROCRAND_STATUS_SUCCESS if the number of dimensions was set successfully \n
    function rocrand_set_quasi_random_generator_dimensions_raw(generator, dimensions) &
       result(set_quasi_random_generator_dimensions_raw) &
       bind(C, name="rocrand_set_quasi_random_generator_dimensions")
       import :: c_ptr, c_int
       type(c_ptr), value :: generator
       integer(c_int), value :: dimensions
       integer(c_int) :: set_quasi_random_generator_dimensions_raw
    end function rocrand_set_quasi_random_generator_dimensions_raw

    module procedure rocrand_set_quasi_random_generator_dimensions_typed
  end interface rocrand_set_quasi_random_generator_dimensions

  interface rocrand_get_version
    !---------------------------------------------
    ! rocrand_get_version
    !---------------------------------------------
    !> \brief Returns the version number of the library.
    !>
    !> Returns in \p version the version number of the dynamically linked
    !> rocRAND library.
    !>
    !> \param version Version of the library
    !>
    !> \return
    !> - ROCRAND_STATUS_OUT_OF_RANGE if \p version is NULL \n
    !> - ROCRAND_STATUS_SUCCESS if the version number was successfully returned \n
    function rocrand_get_version_raw(version) &
       result(get_version_raw) &
       bind(C, name="rocrand_get_version")
       import :: c_ptr, c_int
       type(c_ptr), value :: version
       integer(c_int) :: get_version_raw
    end function rocrand_get_version_raw

    module procedure rocrand_get_version_native
  end interface rocrand_get_version

  interface rocrand_create_discrete_distribution
    !---------------------------------------------
    ! rocrand_create_discrete_distribution
    !---------------------------------------------
    !> \brief Construct the histogram for a custom discrete distribution.
    !>
    !> Construct the histogram for the discrete distribution of \p size
    !> 32-bit unsigned integers from the range [\p offset, \p offset + \p size)
    !> using \p probabilities as probabilities.
    !>
    !> \param probabilities probabilities of the the distribution in host memory
    !> \param size size of \p probabilities
    !> \param offset offset of values
    !> \param discrete_distribution pointer to the histogram in device memory
    !>
    !> \return
    !> - ROCRAND_STATUS_ALLOCATION_FAILED if memory could not be allocated \n
    !> - ROCRAND_STATUS_OUT_OF_RANGE if \p discrete_distribution pointer was null \n
    !> - ROCRAND_STATUS_OUT_OF_RANGE if \p size was zero \n
    !> - ROCRAND_STATUS_SUCCESS if the histogram was constructed successfully \n
    function rocrand_create_discrete_distribution_raw(probabilities, size, offset, &
                                                      discrete_distribution) &
       result(create_discrete_distribution_raw) &
       bind(C, name="rocrand_create_discrete_distribution")
       import :: c_ptr, c_int
       type(c_ptr), value :: probabilities
       integer(c_int), value :: size
       integer(c_int), value :: offset
       type(c_ptr) :: discrete_distribution
       integer(c_int) :: create_discrete_distribution_raw
    end function rocrand_create_discrete_distribution_raw

    module procedure rocrand_create_discrete_distribution_native
  end interface rocrand_create_discrete_distribution


contains

    function rocrand_create_generator_typed(generator, rng_type) result(create_generator)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t) :: generator
      integer(c_int), value :: rng_type
      integer(c_int) :: create_generator
      create_generator = rocrand_create_generator_raw(generator%ptr, rng_type)
    end function rocrand_create_generator_typed

    function rocrand_create_generator_host_typed(generator, rng_type) result(create_generator_host)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t) :: generator
      integer(c_int), value :: rng_type
      integer(c_int) :: create_generator_host
      create_generator_host = rocrand_create_generator_host_raw(generator%ptr, rng_type)
    end function rocrand_create_generator_host_typed

    function rocrand_create_generator_host_blocking_typed(generator, rng_type) result( &
        create_generator_host_blocking)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t) :: generator
      integer(c_int), value :: rng_type
      integer(c_int) :: create_generator_host_blocking
      create_generator_host_blocking = rocrand_create_generator_host_blocking_raw(generator%ptr, &
        rng_type)
    end function rocrand_create_generator_host_blocking_typed

    function rocrand_destroy_generator_typed(generator) result(destroy_generator)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      integer(c_int) :: destroy_generator
      destroy_generator = rocrand_destroy_generator_raw(generator%ptr)
    end function rocrand_destroy_generator_typed

    function rocrand_generate_native(generator, output_data, n) result(generate)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: generator
      integer(c_int), target :: output_data(*)
      integer(c_long), value :: n
      integer(c_int) :: generate
      generate = rocrand_generate_raw(generator, c_loc(output_data(1)), n)
    end function rocrand_generate_native

    function rocrand_generate_typed(generator, output_data, n) result(generate)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_long), value :: n
      integer(c_int) :: generate
      generate = rocrand_generate_raw(generator%ptr, output_data, n)
    end function rocrand_generate_typed

    function rocrand_generate_long_long_native(generator, output_data, n) result(generate_long_long)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: generator
      integer(c_int64_t), target :: output_data(*)
      integer(c_long), value :: n
      integer(c_int) :: generate_long_long
      generate_long_long = rocrand_generate_long_long_raw(generator, c_loc(output_data(1)), n)
    end function rocrand_generate_long_long_native

    function rocrand_generate_long_long_typed(generator, output_data, n) result(generate_long_long)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_long), value :: n
      integer(c_int) :: generate_long_long
      generate_long_long = rocrand_generate_long_long_raw(generator%ptr, output_data, n)
    end function rocrand_generate_long_long_typed

    function rocrand_generate_char_typed(generator, output_data, n) result(generate_char)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_long), value :: n
      integer(c_int) :: generate_char
      generate_char = rocrand_generate_char_raw(generator%ptr, output_data, n)
    end function rocrand_generate_char_typed

    function rocrand_generate_short_typed(generator, output_data, n) result(generate_short)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_long), value :: n
      integer(c_int) :: generate_short
      generate_short = rocrand_generate_short_raw(generator%ptr, output_data, n)
    end function rocrand_generate_short_typed

    function rocrand_generate_uniform_native(generator, output_data, n) result(generate_uniform)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: generator
      real(c_float), target :: output_data(*)
      integer(c_long), value :: n
      integer(c_int) :: generate_uniform
      generate_uniform = rocrand_generate_uniform_raw(generator, c_loc(output_data(1)), n)
    end function rocrand_generate_uniform_native

    function rocrand_generate_uniform_typed(generator, output_data, n) result(generate_uniform)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_long), value :: n
      integer(c_int) :: generate_uniform
      generate_uniform = rocrand_generate_uniform_raw(generator%ptr, output_data, n)
    end function rocrand_generate_uniform_typed

    function rocrand_generate_uniform_double_native(generator, output_data, n) result( &
        generate_uniform_double)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: generator
      real(c_double), target :: output_data(*)
      integer(c_long), value :: n
      integer(c_int) :: generate_uniform_double
      generate_uniform_double = rocrand_generate_uniform_double_raw(generator, c_loc(output_data( &
        1)), n)
    end function rocrand_generate_uniform_double_native

    function rocrand_generate_uniform_double_typed(generator, output_data, n) result( &
        generate_uniform_double)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_long), value :: n
      integer(c_int) :: generate_uniform_double
      generate_uniform_double = rocrand_generate_uniform_double_raw(generator%ptr, output_data, n)
    end function rocrand_generate_uniform_double_typed

    function rocrand_generate_uniform_half_typed(generator, output_data, n) result( &
        generate_uniform_half)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_long), value :: n
      integer(c_int) :: generate_uniform_half
      generate_uniform_half = rocrand_generate_uniform_half_raw(generator%ptr, output_data, n)
    end function rocrand_generate_uniform_half_typed

    function rocrand_generate_normal_native(generator, output_data, n, mean, stddev) result( &
        generate_normal)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: generator
      real(c_float), target :: output_data(*)
      integer(c_long), value :: n
      real(c_float), value :: mean
      real(c_float), value :: stddev
      integer(c_int) :: generate_normal
      generate_normal = rocrand_generate_normal_raw(generator, c_loc(output_data(1)), n, mean, &
        stddev)
    end function rocrand_generate_normal_native

    function rocrand_generate_normal_typed(generator, output_data, n, mean, stddev) result( &
        generate_normal)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_long), value :: n
      real(c_float), value :: mean
      real(c_float), value :: stddev
      integer(c_int) :: generate_normal
      generate_normal = rocrand_generate_normal_raw(generator%ptr, output_data, n, mean, stddev)
    end function rocrand_generate_normal_typed

    function rocrand_generate_normal_double_native(generator, output_data, n, mean, &
        stddev) result(generate_normal_double)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: generator
      real(c_double), target :: output_data(*)
      integer(c_long), value :: n
      real(c_double), value :: mean
      real(c_double), value :: stddev
      integer(c_int) :: generate_normal_double
      generate_normal_double = rocrand_generate_normal_double_raw(generator, c_loc(output_data( &
        1)), n, mean, stddev)
    end function rocrand_generate_normal_double_native

    function rocrand_generate_normal_double_typed(generator, output_data, n, mean, stddev) result( &
        generate_normal_double)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_long), value :: n
      real(c_double), value :: mean
      real(c_double), value :: stddev
      integer(c_int) :: generate_normal_double
      generate_normal_double = rocrand_generate_normal_double_raw(generator%ptr, output_data, n, &
        mean, stddev)
    end function rocrand_generate_normal_double_typed

    function rocrand_generate_normal_half_typed(generator, output_data, n, mean, stddev) result( &
        generate_normal_half)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_long), value :: n
      integer(c_short), value :: mean
      integer(c_short), value :: stddev
      integer(c_int) :: generate_normal_half
      generate_normal_half = rocrand_generate_normal_half_raw(generator%ptr, output_data, n, mean, &
        stddev)
    end function rocrand_generate_normal_half_typed

    function rocrand_generate_log_normal_native(generator, output_data, n, mean, stddev) result( &
        generate_log_normal)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: generator
      real(c_float), target :: output_data(*)
      integer(c_long), value :: n
      real(c_float), value :: mean
      real(c_float), value :: stddev
      integer(c_int) :: generate_log_normal
      generate_log_normal = rocrand_generate_log_normal_raw(generator, c_loc(output_data(1)), n, &
        mean, stddev)
    end function rocrand_generate_log_normal_native

    function rocrand_generate_log_normal_typed(generator, output_data, n, mean, stddev) result( &
        generate_log_normal)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_long), value :: n
      real(c_float), value :: mean
      real(c_float), value :: stddev
      integer(c_int) :: generate_log_normal
      generate_log_normal = rocrand_generate_log_normal_raw(generator%ptr, output_data, n, mean, &
        stddev)
    end function rocrand_generate_log_normal_typed

    function rocrand_generate_log_normal_double_native(generator, output_data, n, mean, &
        stddev) result(generate_log_normal_double)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: generator
      real(c_double), target :: output_data(*)
      integer(c_long), value :: n
      real(c_double), value :: mean
      real(c_double), value :: stddev
      integer(c_int) :: generate_log_normal_double
      generate_log_normal_double = rocrand_generate_log_normal_double_raw(generator, c_loc( &
        output_data(1)), n, mean, stddev)
    end function rocrand_generate_log_normal_double_native

    function rocrand_generate_log_normal_double_typed(generator, output_data, n, mean, &
        stddev) result(generate_log_normal_double)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_long), value :: n
      real(c_double), value :: mean
      real(c_double), value :: stddev
      integer(c_int) :: generate_log_normal_double
      generate_log_normal_double = rocrand_generate_log_normal_double_raw(generator%ptr, &
        output_data, n, mean, stddev)
    end function rocrand_generate_log_normal_double_typed

    function rocrand_generate_log_normal_half_typed(generator, output_data, n, mean, &
        stddev) result(generate_log_normal_half)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_long), value :: n
      integer(c_short), value :: mean
      integer(c_short), value :: stddev
      integer(c_int) :: generate_log_normal_half
      generate_log_normal_half = rocrand_generate_log_normal_half_raw(generator%ptr, output_data, &
        n, mean, stddev)
    end function rocrand_generate_log_normal_half_typed

    function rocrand_generate_poisson_native(generator, output_data, n, lambda) result( &
        generate_poisson)
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: generator
      integer(c_int), target :: output_data(*)
      integer(c_long), value :: n
      real(c_double), value :: lambda
      integer(c_int) :: generate_poisson
      generate_poisson = rocrand_generate_poisson_raw(generator, c_loc(output_data(1)), n, lambda)
    end function rocrand_generate_poisson_native

    function rocrand_generate_poisson_typed(generator, output_data, n, lambda) result( &
        generate_poisson)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      type(c_ptr), value :: output_data
      integer(c_long), value :: n
      real(c_double), value :: lambda
      integer(c_int) :: generate_poisson
      generate_poisson = rocrand_generate_poisson_raw(generator%ptr, output_data, n, lambda)
    end function rocrand_generate_poisson_typed

    function rocrand_initialize_generator_typed(generator) result(initialize_generator)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      integer(c_int) :: initialize_generator
      initialize_generator = rocrand_initialize_generator_raw(generator%ptr)
    end function rocrand_initialize_generator_typed

    function rocrand_set_stream_typed(generator, stream) result(set_stream)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      type(c_ptr), value :: stream
      integer(c_int) :: set_stream
      set_stream = rocrand_set_stream_raw(generator%ptr, stream)
    end function rocrand_set_stream_typed

    function rocrand_set_seed_typed(generator, seed) result(set_seed)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      integer(c_int64_t), value :: seed
      integer(c_int) :: set_seed
      set_seed = rocrand_set_seed_raw(generator%ptr, seed)
    end function rocrand_set_seed_typed

    function rocrand_set_seed_uint4_typed(generator, seed) result(set_seed_uint4)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      type(c_ptr), value :: seed
      integer(c_int) :: set_seed_uint4
      set_seed_uint4 = rocrand_set_seed_uint4_raw(generator%ptr, seed)
    end function rocrand_set_seed_uint4_typed

    function rocrand_set_offset_typed(generator, offset) result(set_offset)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      integer(c_int64_t), value :: offset
      integer(c_int) :: set_offset
      set_offset = rocrand_set_offset_raw(generator%ptr, offset)
    end function rocrand_set_offset_typed

    function rocrand_set_ordering_typed(generator, order) result(set_ordering)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      integer(c_int), value :: order
      integer(c_int) :: set_ordering
      set_ordering = rocrand_set_ordering_raw(generator%ptr, order)
    end function rocrand_set_ordering_typed

    function rocrand_set_quasi_random_generator_dimensions_typed(generator, dimensions) result( &
        set_quasi_random_generator_dimensions)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(rocrand_generator_t), value :: generator
      integer(c_int), value :: dimensions
      integer(c_int) :: set_quasi_random_generator_dimensions
      set_quasi_random_generator_dimensions = rocrand_set_quasi_random_generator_dimensions_raw( &
        generator%ptr, dimensions)
    end function rocrand_set_quasi_random_generator_dimensions_typed

    function rocrand_get_version_native(version) result(get_version)
      use, intrinsic :: iso_c_binding
      implicit none
      integer(c_int), target :: version(*)
      integer(c_int) :: get_version
      get_version = rocrand_get_version_raw(c_loc(version(1)))
    end function rocrand_get_version_native

    function rocrand_create_discrete_distribution_native(probabilities, size, offset, &
        discrete_distribution) result(create_discrete_distribution)
      use, intrinsic :: iso_c_binding
      implicit none
      real(c_double), target :: probabilities(*)
      integer(c_int), value :: size
      integer(c_int), value :: offset
      type(c_ptr) :: discrete_distribution
      integer(c_int) :: create_discrete_distribution
      create_discrete_distribution = rocrand_create_discrete_distribution_raw(c_loc(probabilities( &
        1)), size, offset, discrete_distribution)
    end function rocrand_create_discrete_distribution_native

end module hipfort_rocrand
