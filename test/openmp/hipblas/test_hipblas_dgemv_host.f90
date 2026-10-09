! Calls hipBLAS dgemv on plain host allocatables with no OpenMP mapping.
! Under unified shared memory this must work; without it the call fails.
program test_hipblas_dgemv_host

        use iso_fortran_env,       only: i32=>int32, r64=>real64
        use iso_c_binding
        use hipfort
        use hipfort_hipblas_enums
        use hipfort_hipblas

        implicit none

        ! 4x4 problem: A(i,j)=i+j, x(j)=j, alpha=2, beta=0
        ! y(i) = 2 * sum_{j=1}^{4} (i+j)*j = 20*i + 60
        integer(i32), parameter :: n = 4
        real(r64) :: alpha = 2.0_r64, beta = 0.0_r64

        real(r64), allocatable, target :: A(:,:), x(:), y(:)
        type(c_ptr)  :: handle = c_null_ptr
        integer(kind(HIPBLAS_STATUS_SUCCESS)) :: herr
        integer(i32) :: cerr, i, j
        real(r64)    :: expected
        character(len=8) :: xnack

        call get_environment_variable("HSA_XNACK", xnack)
        write(*,*) "HSA_XNACK = ", trim(xnack)

        allocate(A(n,n), x(n), y(n))
        do j = 1, n
                x(j) = real(j, r64)
                do i = 1, n
                        A(i,j) = real(i + j, r64)
                end do
        end do
        y = 0.0_r64

        herr = hipblasCreate(handle)
        if (herr /= HIPBLAS_STATUS_SUCCESS) error stop "hipblasCreate failed"

        ! Host pointers straight into hipBLAS: no target data, no device copy.
        herr = hipblasDgemv(handle, HIPBLAS_OP_N, n, n, alpha, &
                            c_loc(A(1,1)), n, c_loc(x(1)), 1, beta, c_loc(y(1)), 1)
        if (herr /= HIPBLAS_STATUS_SUCCESS) then
                write(*,*) "hipblasDgemv on host buffers returned status ", herr
                write(*,*) "the GPU cannot reach pageable host memory in this configuration"
                error stop "FAILED"
        end if

        cerr = hipDeviceSynchronize()
        if (cerr /= 0) error stop "hipDeviceSynchronize failed"

        write(*,*) "y = ", y

        do i = 1, n
                expected = 20.0_r64 * real(i, r64) + 60.0_r64
                if (abs(y(i) - expected) > 1.0e-12_r64 * abs(expected)) then
                        write(*,*) "y(", i, ") = ", y(i), " expected ", expected
                        error stop "FAILED"
                end if
        end do

        herr = hipblasDestroy(handle)
        if (herr /= HIPBLAS_STATUS_SUCCESS) error stop "hipblasDestroy failed"
        deallocate(A, x, y)

        write(*,*) "PASSED!"

end program test_hipblas_dgemv_host
