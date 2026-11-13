! Host-buffer hipRAND test: Philox4_32_10 uniform floats generated directly into a
! plain Fortran allocatable, no device allocation and no OpenMP mapping.
program test_hiprand_philox_uniform_host

        use iso_fortran_env,       only: i32=>int32
        use iso_c_binding
        use hipfort
        use hipfort_hiprand
        use hipfort_hiprand_enums

        implicit none

        integer(c_size_t), parameter  :: N = 4096_c_size_t
        integer(c_int64_t), parameter :: seed = 12345_c_int64_t

        real(c_float), allocatable, target :: hx(:)
        type(c_ptr)  :: gen = c_null_ptr
        integer(i32) :: cerr
        real(c_float) :: sample_mean
        character(len=8) :: xnack

        call get_environment_variable("HSA_XNACK", xnack)
        write(*,*) "HSA_XNACK = ", trim(xnack)

        allocate(hx(N))
        hx = 0.0_c_float

        cerr = hiprandCreateGenerator(gen, HIPRAND_RNG_PSEUDO_PHILOX4_32_10)
        if (cerr /= HIPRAND_STATUS_SUCCESS) error stop "hiprandCreateGenerator failed"

        cerr = hiprandSetPseudoRandomGeneratorSeed(gen, seed)
        if (cerr /= HIPRAND_STATUS_SUCCESS) error stop "hiprandSetPseudoRandomGeneratorSeed failed"

        ! Host pointer straight into hipRAND: no device allocation, no OpenMP mapping.
        cerr = hiprandGenerateUniform(gen, c_loc(hx(1)), N)
        if (cerr /= HIPRAND_STATUS_SUCCESS) then
                write(*,*) "hiprandGenerateUniform on host buffer returned status ", cerr
                error stop "FAILED"
        end if

        cerr = hipDeviceSynchronize()
        if (cerr /= 0) error stop "hipDeviceSynchronize failed"

        ! Buffer must not still be zero (generator wrote to host memory)
        if (all(hx == 0.0_c_float)) error stop "FAILED: buffer still zero after generate"

        ! Values must lie in (0, 1]
        if (any(hx <= 0.0_c_float) .or. any(hx > 1.0_c_float)) &
                error stop "FAILED: values out of (0,1]"

        ! Non-degenerate: spread across range
        if (maxval(hx) - minval(hx) < 0.01_c_float) error stop "FAILED: all values near-identical"

        sample_mean = sum(hx) / real(N, c_float)
        write(*,*) "sample mean =", sample_mean
        if (abs(sample_mean - 0.5_c_float) > 0.05_c_float) then
                write(*,*) "mean out of tolerance:", sample_mean
                error stop "FAILED"
        end if

        cerr = hiprandDestroyGenerator(gen)
        if (cerr /= HIPRAND_STATUS_SUCCESS) error stop "hiprandDestroyGenerator failed"

        deallocate(hx)
        write(*,*) "PASSED!"

end program test_hiprand_philox_uniform_host
