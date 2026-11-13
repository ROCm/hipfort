! Host-buffer variant: A and W are plain Fortran allocatables accessed by the
! GPU via XNACK-1 page-fault recovery.  The workspace is hipHostMalloc'd
! (host-pinned) because hipSOLVER validates the work pointer for GPU
! reachability before launching the kernel.  No OpenMP mapping, no hipMalloc.
program test_hipsolver_dsyevd_host

        use iso_fortran_env,       only: i32=>int32, r64=>real64
        use iso_c_binding
        use hipfort
        use hipfort_hipsolver_enums
        use hipfort_hipsolver

        implicit none

        integer(i32), parameter        :: n = 2
        real(r64), parameter           :: rtol = 1.0e-10_r64
        real(r64), allocatable, target :: A(:,:), W(:)
        type(c_ptr)                    :: work = c_null_ptr
        integer(i32), target           :: info
        integer(i32)                   :: lwork, cerr
        type(c_ptr)                    :: handle = c_null_ptr
        character(len=8)               :: xnack

        call get_environment_variable("HSA_XNACK", xnack)
        write(*,*) "HSA_XNACK = ", trim(xnack)

        ! [[2,1],[1,2]] has exact eigenvalues 1 and 3
        allocate(A(n,n), W(n))
        A = reshape([2.0_r64, 1.0_r64, 1.0_r64, 2.0_r64], [n,n])

        cerr = hipsolverCreate(handle)
        if (cerr /= HIPSOLVER_STATUS_SUCCESS) error stop "hipsolverCreate failed"

        ! Workspace query: lwork is an OUTPUT here
        lwork = 0
        cerr = hipsolverDsyevd_bufferSize(handle, HIPSOLVER_EIG_MODE_VECTOR, HIPSOLVER_FILL_MODE_UPPER, &
               n, c_loc(A(1,1)), n, c_loc(W(1)), lwork)
        if (cerr /= HIPSOLVER_STATUS_SUCCESS) error stop "bufferSize failed"

        ! Host-pinned workspace: physically on host, GPU-reachable via DMA
        cerr = hipHostMalloc(work, int(lwork, c_size_t) * 8, 0)
        if (cerr /= 0) error stop "hipHostMalloc failed"

        info = -1
        cerr = hipsolverDsyevd(handle, HIPSOLVER_EIG_MODE_VECTOR, HIPSOLVER_FILL_MODE_UPPER, &
               n, c_loc(A(1,1)), n, c_loc(W(1)), work, lwork, info)
        if (cerr /= HIPSOLVER_STATUS_SUCCESS) then
                write(*,*) "hipsolverDsyevd on host buffers returned status ", cerr
                error stop "FAILED"
        end if

        cerr = hipDeviceSynchronize()
        if (cerr /= 0) error stop "hipDeviceSynchronize failed"

        if (info /= 0) then
                write(*,*) "dsyevd info =", info
                error stop "FAILED"
        end if

        cerr = hipsolverDestroy(handle)
        if (cerr /= HIPSOLVER_STATUS_SUCCESS) error stop "hipsolverDestroy failed"

        write(*,*) "eigenvalues:", W(1), W(2)
        if (abs(W(1) - 1.0_r64) > rtol) error stop "eigenvalue 1 wrong"
        if (abs(W(2) - 3.0_r64) > rtol) error stop "eigenvalue 2 wrong"

        cerr = hipHostFree(work)
        deallocate(A, W)
        write(*,*) "PASSED!"

end program test_hipsolver_dsyevd_host
