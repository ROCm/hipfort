! Host-buffer variant of test_rocsolver_zhegvdx: the arrays handed to rocSOLVER are
! plain Fortran allocatables with no OpenMP mapping and no device copy, so the
! library receives host addresses. Requires unified shared memory to be usable.
program test_rocsolver_zhegvdx_host

        use iso_fortran_env,  only: i32=>int32, r64=>real64
        use iso_c_binding
        use hipfort
        use hipfort_rocblas_enums
        use hipfort_rocblas
        use hipfort_rocsolver_enums
        use hipfort_rocsolver

        implicit none

        complex(r64), allocatable, target :: A_lapack(:,:), B_lapack(:,:)
        complex(r64), allocatable, target :: A_rocsolver(:,:), B_rocsolver(:,:)
        type(c_ptr)               :: handle = c_null_ptr
        integer(i32), parameter   :: n = 3
        real(r64), parameter      :: vl = 0.0_r64, vu = 0.0_r64
        integer(i32), parameter   :: il = 1
        integer(i32), parameter   :: iu = 2
        integer(i32), parameter   :: expected_m = iu - il + 1
        real(r64), parameter      :: rtol = 1.0e-6_r64
        integer(i32)              :: lwork, liwork, lrwork
        complex(r64), allocatable :: work(:)
        real(r64), allocatable    :: rwork(:)
        integer(r64), allocatable :: iwork(:)
        integer(i32), target      :: info, m
        integer(i32)              :: cerr
        complex(r64), allocatable, target :: Z(:,:)
        complex(r64), allocatable :: Zref(:,:)
        real(r64), allocatable, target    :: W(:)
        real(r64), allocatable    :: Wref(:)
        character(len=8)          :: xnack

        call get_environment_variable("HSA_XNACK", xnack)
        write(*,*) "HSA_XNACK = ", trim(xnack)

        allocate(A_lapack(n,n), B_lapack(n,n))

        A_lapack = reshape([ &
                (12.952260828249717, 0.0), (-0.8136520598298568, -1.207368113317406), (6.021437566362058, -1.530839969546172), &
                (-0.8136520598298568, 1.207368113317406), (4.084378436292846, 0.0), (0.862574753601529, -0.5636477131011359), &
                (6.021437566362058, 1.530839969546172), (0.862574753601529, 0.5636477131011359), (13.110316501843691, 0.0) &
                ], shape=[3,3], order=[2,1])

        B_lapack = reshape([ &
                (4.769034939442435, 0.0),       (2.9233910006323103, 2.248832817522154),     (2.3758726221976016, 0.4747827863735063), &
                (2.9233910006323103, -2.248832817522154), (13.323300302441238, 0.0),         (3.5288683548091355, -1.5600560529683896), &
                (2.3758726221976016, -0.4747827863735063), (3.5288683548091355, 1.5600560529683896), (13.826224543945107, 0.0) &
                ], shape=[3,3], order=[2,1])

        allocate(A_rocsolver(n,n), B_rocsolver(n,n))
        A_rocsolver = A_lapack
        B_rocsolver = B_lapack

        lwork  = 2*n+n**2
        lrwork = 1 + 5*N + 2*N**2
        liwork = 3 + 5*N
        allocate(work(lwork), rwork(lrwork), iwork(liwork))
        allocate(W(n))
        call zhegvd(1, 'V', 'U', n, A_lapack, n, B_lapack, n, W, work, lwork, rwork, lrwork, iwork, liwork, info)
        if (info /= 0) error stop "LAPACK fail"
        deallocate(work, rwork, iwork)

        call move_alloc(W, Wref)
        call move_alloc(A_lapack, Zref)

        allocate(W(n), Z(n,n))
        m    = -4
        info = -4

        cerr = rocblas_create_handle(handle)
        if (cerr /= rocblas_status_success) error stop "rocblas_create_handle failed"

        cerr = rocsolver_zhegvdx(handle, rocblas_eform_ax, rocblas_evect_original, rocblas_erange_index, rocblas_fill_upper, &
                                 n, c_loc(A_rocsolver(1,1)), n, c_loc(B_rocsolver(1,1)), n, vl, vu, il, iu, m, &
                                 c_loc(W(1)), c_loc(Z(1,1)), n, c_loc(info))
        if (cerr /= rocblas_status_success) then
            write(*,*) "rocsolver_zhegvdx on host buffers returned status ", cerr
            error stop "FAILED"
        end if

        cerr = hipDeviceSynchronize()
        if (cerr /= 0) error stop "hipDeviceSynchronize failed"

        if (info /= 0) then
            write(*,*) "zhegvdx failed with info", info
            error stop "FAILED"
        endif

        cerr = rocblas_destroy_handle(handle)
        if (cerr /= rocblas_status_success) error stop "rocblas_destroy_handle failed"

        deallocate(B_lapack)

        if (expected_m /= m) error stop "Error(wrong number of states)"
        if (norm2(W(1:m) - Wref(1:m)) / norm2(Wref(1:m)) > rtol) error stop "Error(wrong eigenvalues)"
        if (norm2(abs(Z(:,1:m)) - abs(Zref(:,1:m)))/norm2(abs(Zref(:,1:m))) > rtol) error stop "Error(wrong eigenvectors)"

        write(*,*) "PASSED!"

end program test_rocsolver_zhegvdx_host
