! Calls rocBLAS on plain host allocatables, with no OpenMP mapping and no device
! copy, so the library receives host pointers directly. Under unified shared memory
! this must work; where the GPU cannot reach pageable host memory the call fails and
! the test reports that rather than asserting a result.
program test_rocblas_dgemv_host

        use iso_fortran_env,  only: i32=>int32, r64=>real64
        use iso_c_binding
        use hipfort
        use hipfort_rocblas_enums
        use hipfort_rocblas

        implicit none

        integer(i32), parameter :: n = 64
        real(r64), parameter    :: alpha = 2.0_r64, beta = 0.0_r64
        real(r64), parameter    :: rtol = 1.0e-12_r64

        real(r64), allocatable, target :: A(:,:), x(:), y(:)
        real(r64)    :: expected
        type(c_ptr)  :: handle = c_null_ptr
        integer(i32) :: cerr, i, j
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

        cerr = rocblas_create_handle(handle)
        if (cerr /= rocblas_status_success) error stop "rocblas_create_handle failed"

        ! Host pointers straight into rocBLAS: no target data, no device copy.
        cerr = rocblas_dgemv(handle, rocblas_operation_none, n, n, alpha, &
                             c_loc(A(1,1)), n, c_loc(x(1)), 1, beta, c_loc(y(1)), 1)
        if (cerr /= rocblas_status_success) then
           write(*,*) "rocblas_dgemv on host buffers returned status ", cerr
           write(*,*) "the GPU cannot reach pageable host memory in this configuration"
           error stop "FAILED"
        end if

        cerr = hipDeviceSynchronize()
        if (cerr /= 0) error stop "hipDeviceSynchronize failed"

        do i = 1, n
           expected = 0.0_r64
           do j = 1, n
              expected = expected + real(i + j, r64) * real(j, r64)
           end do
           expected = alpha * expected
           if (abs(y(i) - expected) > rtol * abs(expected)) then
              write(*,*) "y(", i, ") = ", y(i), " expected ", expected
              error stop "FAILED"
           end if
        end do

        cerr = rocblas_destroy_handle(handle)
        if (cerr /= rocblas_status_success) error stop "rocblas_destroy_handle failed"
        deallocate(A, x, y)

        write(*,*) "PASSED!"

end program test_rocblas_dgemv_host
