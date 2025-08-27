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

        interface

           subroutine rocsolver_zhegvdx2(handle, itype, evect, erange, uplo, n, dA, lda, dB, ldb, &
                                        vl, vu, il, iu, dnev, dW, dZ, ldz, dinfo) bind(C, name="rocsolver_zhegvdx")
               use, intrinsic :: iso_c_binding
               type(c_ptr), value :: handle, dA, dB, dW, dZ
               integer(c_int), intent(out) :: dnev, dinfo
               integer(c_int), value :: itype, evect, erange, uplo, n, lda, ldb, il, iu, ldz
               real(c_double), value :: vl, vu
           end subroutine rocsolver_zhegvdx2


        end interface


        complex(r64), allocatable, target :: A_lapack(:,:), B_lapack(:,:)
        complex(r64), allocatable, target :: A_rocsolver(:,:), B_rocsolver(:,:)
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
        integer(i32) :: info, m, cerr

        complex(r64), allocatable :: Z(:,:)
        real(r64),    allocatable, target :: W(:)

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


        allocate(A_rocsolver, source=A_lapack)
        allocate(B_rocsolver, source=B_lapack)

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

        deallocate(W)
        allocate(W(n), Z(n,n))

        m    = -4
        info = -4

        !$omp target enter data map(to: A_rocsolver, B_rocsolver, W, Z, m, info) 
        dA     = get_device_pointer(A_rocsolver, device_id)
        dB     = get_device_pointer(B_rocsolver, device_id)
        dW     = get_device_pointer(W, device_id)
        dZ     = get_device_pointer(Z, device_id)

        cerr = rocblas_create_handle(handle)
        if (cerr /= rocblas_status_success) error stop "rocblas_create_handle failed"

        !$omp target data use_device_addr(m, info)
        !call rocsolver_zhegvdx2(handle, rocblas_eform_ax, rocblas_evect_original, rocblas_erange_index, rocblas_fill_upper, n, dA, n, &
        !                dB, n, vl, vu, il, iu, m, dW, dZ, n, info)
        cerr = rocsolver_zhegvdx(handle, rocblas_eform_ax, rocblas_evect_original, rocblas_erange_index, rocblas_fill_upper, n, dA, n, &
                        dB, n, vl, vu, il, iu, m, dW, dZ, n, info)
        !$omp end target data
        if (cerr /= rocblas_status_success) error stop "rocsolver_zhegvdx failed"

        ! NOTE: it will be better to get the stream of the rocblas handler and sync that instead of the whole device
        cerr = hipDeviceSynchronize()
        if (cerr /= rocblas_status_success) error stop "hipDeviceSynchronize failed"
         !$omp target exit data map(from: A_rocsolver, B_rocsolver, W, Z, m, info)

        if (info /= 0) then
            write(*,*) "zhegvdx failed with info", info
            error stop "FAILED"
        endif

        write(*,*) "Eigenvalues :", W(1:m)
        write(*,*) "Eigenvector 0 ", Z(:,1)
        write(*,*) "Eigenvector 1 ", Z(:,2)

        !! We call our interface not the one provided
        cerr = rocblas_destroy_handle(handle)
        if (cerr /= rocblas_status_success) error stop "rocblas_destroy_handle failed"

        deallocate(A_lapack, B_lapack, A_rocsolver, B_rocsolver)

contains

        type(c_ptr) function get_device_pointer(host_data, device_id)
          type(*), target, intent(in) :: host_data(..)
          integer, intent(in) :: device_id
          get_device_pointer = omp_get_mapped_ptr(c_loc(host_data), device_id)
          if (.not. c_associated(get_device_pointer)) error stop "Error(get_device_pointer) : returned null pointer"
        end function get_device_pointer
      
end program test_rocsolver_zhegvdx
