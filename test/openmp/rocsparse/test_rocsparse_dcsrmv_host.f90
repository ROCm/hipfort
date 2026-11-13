! Host-buffer CSR SpMV: row pointers, column indices, values, x and y are plain
! Fortran allocatables with no OpenMP mapping. rocSPARSE receives host addresses.
! Requires unified shared memory (HSA_XNACK=1) on MI300A.
program test_rocsparse_dcsrmv_host

        use iso_fortran_env,  only: i32=>int32, r64=>real64
        use iso_c_binding
        use hipfort
        use hipfort_rocsparse

        implicit none

        ! 4x4 sparse matrix in CSR (0-based):
        !   A = [[2,0,0,1], [0,3,1,0], [0,0,4,2], [1,0,0,5]]
        !   x = [1,2,3,4]  =>  y = A*x = [6, 9, 20, 21]
        integer(i32), parameter :: m_dim = 4, n_dim = 4, nnz = 8

        integer(i32), allocatable, target :: csr_row_ptr(:), csr_col_ind(:)
        real(r64),    allocatable, target :: csr_val(:), x(:), y(:)

        real(r64)    :: alpha = 1.0_r64, beta = 0.0_r64
        real(r64)    :: expected(4)
        type(c_ptr)  :: handle = c_null_ptr, descr = c_null_ptr, info = c_null_ptr
        integer(i32) :: cerr, i
        character(len=8) :: xnack

        call get_environment_variable("HSA_XNACK", xnack)
        write(*,*) "HSA_XNACK = ", trim(xnack)

        allocate(csr_row_ptr(m_dim+1), csr_col_ind(nnz), csr_val(nnz), x(n_dim), y(m_dim))

        csr_row_ptr = [0, 2, 4, 6, 8]
        csr_col_ind = [0, 3, 1, 2, 2, 3, 0, 3]
        csr_val     = [2.0_r64, 1.0_r64, 3.0_r64, 1.0_r64, 4.0_r64, 2.0_r64, 1.0_r64, 5.0_r64]
        x           = [1.0_r64, 2.0_r64, 3.0_r64, 4.0_r64]
        y           = 0.0_r64

        expected    = [6.0_r64, 9.0_r64, 20.0_r64, 21.0_r64]

        cerr = rocsparse_create_handle(handle)
        if (cerr /= rocsparse_status_success) error stop "rocsparse_create_handle failed"

        cerr = rocsparse_create_mat_descr(descr)
        if (cerr /= rocsparse_status_success) error stop "rocsparse_create_mat_descr failed"

        cerr = rocsparse_create_mat_info(info)
        if (cerr /= rocsparse_status_success) error stop "rocsparse_create_mat_info failed"

        ! Analyze sparsity structure (enables adaptive kernel selection)
        cerr = rocsparse_dcsrmv_analysis(handle, rocsparse_operation_none, &
                m_dim, n_dim, nnz, descr, &
                c_loc(csr_val(1)), c_loc(csr_row_ptr(1)), c_loc(csr_col_ind(1)), info)
        if (cerr /= rocsparse_status_success) then
                write(*,*) "rocsparse_dcsrmv_analysis on host buffers returned status ", cerr
                error stop "FAILED"
        end if

        ! y = alpha*A*x + beta*y; all buffers are host allocatables
        cerr = rocsparse_dcsrmv(handle, rocsparse_operation_none, &
                m_dim, n_dim, nnz, alpha, descr, &
                c_loc(csr_val(1)), c_loc(csr_row_ptr(1)), c_loc(csr_col_ind(1)), info, &
                c_loc(x(1)), beta, c_loc(y(1)))
        if (cerr /= rocsparse_status_success) then
                write(*,*) "rocsparse_dcsrmv on host buffers returned status ", cerr
                error stop "FAILED"
        end if

        cerr = hipDeviceSynchronize()
        if (cerr /= 0) error stop "hipDeviceSynchronize failed"

        write(*,*) "y =", y

        do i = 1, m_dim
                if (abs(y(i) - expected(i)) > 1.0e-12_r64) then
                        write(*,*) "y(", i, ") =", y(i), " expected", expected(i)
                        error stop "FAILED"
                end if
        end do

        cerr = rocsparse_csrmv_clear(handle, info)
        if (cerr /= rocsparse_status_success) error stop "rocsparse_csrmv_clear failed"

        cerr = rocsparse_destroy_mat_info(info)
        if (cerr /= rocsparse_status_success) error stop "rocsparse_destroy_mat_info failed"

        cerr = rocsparse_destroy_mat_descr(descr)
        if (cerr /= rocsparse_status_success) error stop "rocsparse_destroy_mat_descr failed"

        cerr = rocsparse_destroy_handle(handle)
        if (cerr /= rocsparse_status_success) error stop "rocsparse_destroy_handle failed"

        deallocate(csr_row_ptr, csr_col_ind, csr_val, x, y)

        write(*,*) "PASSED!"

end program test_rocsparse_dcsrmv_host
