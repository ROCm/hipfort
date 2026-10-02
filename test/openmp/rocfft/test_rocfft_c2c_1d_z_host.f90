! Host-buffer 1-D complex-to-complex double FFT: plain Fortran allocatable
! handed to rocFFT with no OpenMP mapping. Requires USM / XNACK=1.
program test_rocfft_c2c_1d_z_host

        use iso_fortran_env,  only: i32=>int32, r64=>real64
        use iso_c_binding
        use hipfort
        use hipfort_rocfft
        use hipfort_rocfft_enums

        implicit none

        integer(c_size_t), parameter :: N = 8
        real(r64),         parameter :: tol = 1.0e-10_r64

        complex(r64), allocatable, target :: x(:)
        integer(c_size_t),         target :: len_n
        type(c_ptr)                       :: plan  = c_null_ptr
        type(c_ptr)                       :: x_ptr
        integer(i32)                      :: cerr, i
        character(len=8)                  :: xnack

        call get_environment_variable("HSA_XNACK", xnack)
        write(*,*) "HSA_XNACK = ", trim(xnack)

        ! Constant input: FFT[0] = N*(1,0), FFT[k>0] = (0,0)
        allocate(x(N))
        x = cmplx(1.0_r64, 0.0_r64, kind=r64)

        cerr = rocfft_setup()
        if (cerr /= rocfft_status_success) error stop "rocfft_setup failed"

        len_n = N
        cerr = rocfft_plan_create(plan, rocfft_placement_inplace, &
                                  rocfft_transform_type_complex_forward, &
                                  rocfft_precision_double, &
                                  1_c_size_t, c_loc(len_n), 1_c_size_t, c_null_ptr)
        if (cerr /= rocfft_status_success) error stop "rocfft_plan_create failed"

        x_ptr = c_loc(x(1))
        cerr = rocfft_execute(plan, x_ptr, c_null_ptr, c_null_ptr)
        if (cerr /= rocfft_status_success) then
                write(*,*) "rocfft_execute on host buffer returned status ", cerr
                error stop "FAILED"
        end if

        cerr = hipDeviceSynchronize()
        if (cerr /= 0) error stop "hipDeviceSynchronize failed"

        cerr = rocfft_plan_destroy(plan)
        if (cerr /= rocfft_status_success) error stop "rocfft_plan_destroy failed"

        cerr = rocfft_cleanup()
        if (cerr /= rocfft_status_success) error stop "rocfft_cleanup failed"

        write(*,*) "FFT bin 0:", x(1)
        do i = 2, N
                write(*,*) "FFT bin", i-1, ":", x(i)
        end do

        ! bin 0 should be (N, 0); all others (0, 0)
        if (abs(x(1) - cmplx(real(N, r64), 0.0_r64, kind=r64)) > tol) then
                write(*,*) "bin 0 wrong:", x(1)
                error stop "FAILED"
        end if
        do i = 2, N
                if (abs(x(i)) > tol) then
                        write(*,*) "bin", i-1, "nonzero:", x(i)
                        error stop "FAILED"
                end if
        end do

        deallocate(x)
        write(*,*) "PASSED!"

end program test_rocfft_c2c_1d_z_host
