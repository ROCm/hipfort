program test_rocsolver_zhegvdx

        use iso_fortran_env,  only: i32=>int32, r32=>real32, r64=>real64
        use iso_c_binding
        use hipfort
        use hipfort_rocblas_enums
        use hipfort_rocblas
        use hipfort_rocsolver_enums
        use hipfort_rocsolver
        use omp_lib

        implicit none

        complex(r64), allocatable :: A_lapack(:,:), B_lapack(:,:)
        complex(r64), pointer, contiguous :: A_rocsolver(:,:), B_rocsolver(:,:)
        type(c_ptr) :: A_rocsolver_cptr, B_rocsolver_cptr
        type(c_ptr)               :: handle = c_null_ptr
        integer(i32), parameter   :: n = 3
        real(r64), parameter      :: abstol = 1.0e-8_r64
        real(r64), parameter      :: vl = 0.0_r64, vu = 0.0_r64
        integer(i32), parameter   :: il = 1
        integer(i32), parameter   :: iu = 2
        integer(i32), parameter   :: expected_m = iu - il + 1
        integer(i32)              :: lwork, liwork, lrwork, lwork_gpu
        complex(r64), allocatable :: work(:)
        real(r64), allocatable    :: rwork(:)
        integer(r64), allocatable :: iwork(:), ifail(:)
        integer(i32) :: info, m, cerr
        real(r64), parameter      :: rtol = 1.0e-6_r64

        complex(r64), allocatable :: Z(:,:), Zref(:,:)
        real(r64),    allocatable :: W(:), Wref(:)

        ! For the rocsolver
        integer(i32) :: device_id
        type(c_ptr)  :: dA, dB, dW, dZ

        ! Get device id
        device_id = omp_get_default_device()
        write(*,*) "Device ID : ", device_id

        ! Fill the matrices
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

        A_rocsolver_cptr = omp_target_alloc(2 * size(A_lapack) * c_sizeof(1_r64), device_id)
        B_rocsolver_cptr = omp_target_alloc(2 * size(B_lapack) * c_sizeof(1_r64), device_id)

        call c_f_pointer(A_rocsolver_cptr, A_rocsolver, [n,n])
        call c_f_pointer(B_rocsolver_cptr, B_rocsolver, [n,n])
        
        !$omp target map(to: A_lapack, B_lapack) has_device_addr(A_rocsolver, B_rocsolver) 
        A_rocsolver(:,:) = A_lapack(:,:)
        B_rocsolver(:,:) = B_lapack(:,:)
        !$omp end target
        
        nullify(A_rocsolver,B_rocsolver)

        ! First create the LAPACK reference
        lwork  = 2*n+n**2
        lrwork = 1 + 5*N + 2*N**2
        liwork = 3 + 5*N
        allocate(work(lwork), rwork(lrwork), iwork(liwork))
        allocate(W(n))
        call zhegvd(1, 'V', 'U', n, A_lapack, n, B_lapack, n, W, work, lwork, rwork, lrwork, iwork, liwork, info)
        if (info /= 0) error stop "LAPACK fail"
        deallocate(work, rwork, iwork)

        write(*,*) "###LAPACK####"
        write(*,*) "Eigenvalues :",  W(:)
        write(*,*) "Eigenvector 0 ", A_lapack(:,1)
        write(*,*) "Eigenvector 1 ", A_lapack(:,2)
        write(*,*) "Eigenvector 3 ", A_lapack(:,3)

        call move_alloc(W, Wref)
        call move_alloc(A_lapack, Zref)

        allocate(W(n), Z(n,n))

        m    = -4
        info = -4

        cerr = rocblas_create_handle(handle)
        if (cerr /= rocblas_status_success) error stop "rocblas_create_handle failed"

        !$omp target data map(from: W, Z, m, info) 
        !$omp target data use_device_addr(m, info)
        dW     = get_device_pointer(W, device_id)
        dZ     = get_device_pointer(Z, device_id)
        cerr = rocsolver_zhegvdx(handle, rocblas_eform_ax, rocblas_evect_original, rocblas_erange_index, rocblas_fill_upper, &
                                 n, A_rocsolver_cptr, n, B_rocsolver_cptr, n, vl, vu, il, iu, m, dW, dZ, n, info)
        if (cerr /= rocblas_status_success) error stop "rocsolver_zhegvdx failed"

        ! NOTE: it will be better to get the stream of the rocblas handler and sync that instead of the whole device
        cerr = hipDeviceSynchronize()
        if (cerr /= rocblas_status_success) error stop "hipDeviceSynchronize failed"
        !$omp end target data
        !$omp end target data

        if (info /= 0) then
            write(*,*) "zhegvdx failed with info", info
            error stop "FAILED"
        endif

        write(*,*) "###ROCSOLVER####"
        write(*,*) "Eigenvalues :", W(1:m)
        write(*,*) "Eigenvector 0 ", Z(:,1)
        write(*,*) "Eigenvector 1 ", Z(:,2)

        !! We call our interface not the one provided
        cerr = rocblas_destroy_handle(handle)
        if (cerr /= rocblas_status_success) error stop "rocblas_destroy_handle failed"

        call omp_target_free(A_rocsolver_cptr, device_id)
        call omp_target_free(B_rocsolver_cptr, device_id)

        deallocate(A_lapack, B_lapack)

        write(*,*) "###CHECKS####"
        if (expected_m /= m) then
            error stop "Error(wrong number of states)"
        else
            write(*,*) "Correct:  number of states"
        end if

        if (norm2(W(1:m) - Wref(1:m)) / norm2(Wref(1:m)) > rtol) then
            error stop "Error(wrong eigenvalues)"
        else
            write(*,*) "Correct:  eigenvalues"
        end if

        if (norm2(abs(Z(:,1:m)) - abs(Zref(:,1:m)))/norm2(abs(Zref(:,1:m))) > rtol) then
            error stop "Error(wrong eigenvectors)"
        else
            write(*,*) "Correct: eigenvectors"
        end if

contains

        type(c_ptr) function get_device_pointer(host_data, device_id)
          type(*), target, intent(in) :: host_data(..)
          integer, intent(in) :: device_id
          get_device_pointer = omp_get_mapped_ptr(c_loc(host_data), device_id)
          if (.not. c_associated(get_device_pointer)) error stop "Error(get_device_pointer) : returned null pointer"
        end function get_device_pointer
      
end program test_rocsolver_zhegvdx
