program test_rocsolver_zhegvdx

        use iso_fortran_env,  only: i32=>int32, r32=>real32, r64=>real64
        use iso_c_binding
        use hipfort
        use hipfort_rocblas_enums
        use hipfort_rocsolver_enums
        use hipfort_rocsolver
        use omp_lib

        !> The size in bytes of double precision complex
        integer(c_size_t), parameter :: bytes_double_complex  =  2_c_size_t * c_sizeof(1.0_c_double)

        complex(r64), allocatable :: A_lapack(:,:), B_lapack(:,:)
        type(c_ptr) :: A_rocsolver_cptr, B_rocsolver_cptr
        complex(r64), pointer, contiguous :: A_rocsolver(:,:), B_rocsolver(:,:)
        type(c_ptr)               :: handle = c_null_ptr
        integer(i32), parameter   :: n = 3
        real(r64), parameter      :: abstol = 1.0e-8_r64
        real(r64), parameter      :: vl = 0.0_r64, vu = 0.0_r64
        integer(i32), parameter   :: il = 1
        integer(i32), parameter   :: iu = 2
        integer(i32), parameter   :: expected_m = iu - il + 1
        integer(i32)              :: lwork, liwork, lrwork, lwork_gpu
        complex(r64), allocatable, target :: work(:)
        real(r64), allocatable    :: rwork(:)
        integer(r64), allocatable :: iwork(:), ifail(:)
        integer(i32) :: info, m
        integer(i32) :: i, j

        complex(r64), allocatable :: Z(:,:)
        real(r64),    allocatable :: W(:)

        ! For the rocsolver
        integer(i32) :: device_id
        type(c_ptr)  :: dA, dB, dW, dZ

        ! Get device id
        device_id = omp_get_default_device()
        write(*,*) "Device ID : ", device_id

        ! Fill the matrices
        allocate(A_lapack(n,n), B_lapack(n,n))

        ! Now fill the ones for rocsolver
        ! NOTE: We allocate device memory only, as they are never used in the host
        call allocate_device_memory(A_rocsolver_cptr, size(A_lapack) * bytes_double_complex, device_id)
        call allocate_device_memory(B_rocsolver_cptr, size(B_lapack) * bytes_double_complex, device_id)

        ! Note that by default the bounds are lost, use lower of Fortran 2023 if supported
        ! Otherwise remap the pointer, i.e. a(n:m) => a(:)
        call c_f_pointer(A_rocsolver_cptr, A_rocsolver, [n,n])
        call c_f_pointer(B_rocsolver_cptr, B_rocsolver, [n,n])

        !$omp target map(to: A_lapack, B_lapack) has_device_addr(A_rocsolver, B_rocsolver)
        !$omp teams distribute parallel do collapse(2) private(i,j) shared(A_lapack, B_lapack, A_rocsolver, B_rocsolver)
        do i = 1, n; do j = 1, n
            A_lapack(j,i) = A_rocsolver(j,i)
            B_lapack(j,i) = B_rocsolver(j,i)
        end do; end do
        !$omp end teams distribute parallel do
        !$omp end target

        nullify(A_rocsolver, B_rocsolver)

        !!! LAPACK

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

        ! First create the LAPACK reference
        lwork  = 2*n+n**2
        lrwork = 1 + 5*N + 2*N**2
        liwork = 3 + 5*N
        allocate(work(lwork), rwork(lrwork), iwork(liwork))
        allocate(W(n))
        call zhegvd(1, 'V', 'U', n, A_lapack, n, B_lapack, n, W, work, lwork, rwork, lrwork, iwork, liwork, info)
        if (info /= 0) error stop "LAPACK fail"
        deallocate(work, rwork, iwork)

        write(*,*) "Eigenvalues :",  W(:)
        write(*,*) "Eigenvector 0 ", A_lapack(:,1)
        write(*,*) "Eigenvector 1 ", A_lapack(:,2)
        write(*,*) "Eigenvector 3 ", A_lapack(:,3)

        deallocate(W, A_lapack, B_lapack)

        !!! ROCSOLVER

        allocate(W(n), Z(n,expected_m))

        call rocblas_create_handle(handle)

        !$omp target data map(from: m, info, W, Z)
        dW     = get_device_pointer(W, device_id)
        dZ     = get_device_pointer(Z, device_id)
        !$omp target data use_device_addr(m, info)
        call rocsolver_zhegvdx(handle, rocblas_eform_ax, rocblas_evect_original, rocblas_erange_index, rocblas_fill_upper, n, A_rocsolver_cptr, n, &
                        B_rocsolver_cptr, n, vl, vu, il, iu, m, dW, dZ, n, info)
        call hipDeviceSynchronize()
        !$omp end target data
        !$omp end target data

        if (info /= 0) write(*,*) "zhegvdx failed with info", info

        write(*,*) "Eigenvalues :", W(1:2)
        write(*,*) "Eigenvector 0 ", Z(:,1)
        write(*,*) "Eigenvector 1 ", Z(:,2)

        call rocblas_destroy_handle(handle)

        call deallocate_device_memory(A_rocsolver_cptr, device_id)
        call deallocate_device_memory(B_rocsolver_cptr, device_id)


contains

        subroutine allocate_device_memory(memory, memsize, device_id)
            type(c_ptr), intent(out) :: memory
            integer(c_size_t), intent(in) :: memsize
            integer, intent(in) :: device_id
            memory = omp_target_alloc(memsize, device_id)
            if (.not. c_associated(memory)) error stop "Error(allocate_device_memory) : returned null pointer"
        end subroutine allocate_device_memory

        subroutine deallocate_device_memory(memory, device_id)
            type(c_ptr), intent(inout) :: memory
            integer, intent(in) :: device_id
            if (.not. c_associated(memory)) error stop "Error(deallocate_device_memory) : cannot free a null pointer"
            call omp_target_free(memory, device_id)
        end subroutine deallocate_device_memory

        type(c_ptr) function get_device_pointer(host_data, device_id)
          type(*), target, intent(in) :: host_data(..)
          integer, intent(in) :: device_id
          get_device_pointer = omp_get_mapped_ptr(c_loc(host_data), device_id)
          if (.not. c_associated(get_device_pointer)) error stop "Error(get_device_pointer) : returned null pointer"
        end function get_device_pointer

end program test_rocsolver_zhegvdx

