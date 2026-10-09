! Host-buffer 1-D complex-to-complex double FFT via hipFFT: plain Fortran allocatable
! handed directly to hipfftExecZ2Z with no OpenMP mapping. Requires USM / XNACK=1.
program test_hipfft_c2c_1d_z_host

        use iso_fortran_env,  only: i32=>int32, r64=>real64
        use iso_c_binding
        use hipfort
        use hipfort_hipfft
        use hipfort_hipfft_enums

        implicit none

        integer(c_int),  parameter :: N   = 8
        real(r64),       parameter :: tol = 1.0e-10_r64

        complex(r64), allocatable, target :: x(:)
        type(c_ptr)                       :: plan = c_null_ptr
        integer(i32)                      :: cerr, i
        character(len=8)                  :: xnack

        call get_environment_variable("HSA_XNACK", xnack)
        write(*,*) "HSA_XNACK = ", trim(xnack)

        ! Constant input: FFT[0] = N*(1,0), FFT[k>0] = (0,0)
        allocate(x(N))
        x = cmplx(1.0_r64, 0.0_r64, kind=r64)

        cerr = hipfftPlan1d(plan, N, HIPFFT_Z2Z, 1_c_int)
        if (cerr /= HIPFFT_SUCCESS) error stop "hipfftPlan1d failed"

        cerr = hipfftExecZ2Z(plan, c_loc(x(1)), c_loc(x(1)), HIPFFT_FORWARD)
        if (cerr /= HIPFFT_SUCCESS) then
                write(*,*) "hipfftExecZ2Z on host buffer returned status ", cerr
                error stop "FAILED"
        end if

        cerr = hipDeviceSynchronize()
        if (cerr /= 0) error stop "hipDeviceSynchronize failed"

        cerr = hipfftDestroy(plan)
        if (cerr /= HIPFFT_SUCCESS) error stop "hipfftDestroy failed"

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

end program test_hipfft_c2c_1d_z_host
