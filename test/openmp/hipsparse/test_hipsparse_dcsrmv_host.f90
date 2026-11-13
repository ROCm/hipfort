! Host-buffer CSR SpMV via the hipSPARSE generic API: row pointers, column
! indices, values, x and y are plain Fortran allocatables with no OpenMP
! mapping. hipSPARSE receives host addresses under HSA_XNACK=1 (USM).
program test_hipsparse_dcsrmv_host

        use iso_fortran_env,       only: i32=>int32, r64=>real64
        use iso_c_binding
        use hipfort
        use hipfort_hipsparse
        use hipfort_hipsparse_enums
        use hipfort_enums

        implicit none

        ! 4x4 sparse matrix in CSR (0-based):
        !   A = [[2,0,0,1], [0,3,1,0], [0,0,4,2], [1,0,0,5]]
        !   x = [1,2,3,4]  =>  y = A*x = [6, 9, 20, 21]
        integer(i32), parameter :: m_dim = 4, n_dim = 4, nnz = 8

        integer(i32),    allocatable, target :: csr_row_ptr(:), csr_col_ind(:)
        real(r64),       allocatable, target :: csr_val(:), x(:), y(:)
        integer(c_int8_t), allocatable, target :: ext_buf(:)

        real(r64),     target :: alpha = 1.0_r64, beta = 0.0_r64
        real(r64)             :: expected(4)
        type(c_ptr)           :: handle = c_null_ptr
        type(c_ptr)           :: matA   = c_null_ptr
        type(c_ptr)           :: vecX   = c_null_ptr, vecY = c_null_ptr
        type(c_ptr)           :: buf_ptr
        integer(c_size_t)     :: buf_size
        integer(i32)          :: cerr, i
        character(len=8)      :: xnack

        call get_environment_variable("HSA_XNACK", xnack)
        write(*,*) "HSA_XNACK = ", trim(xnack)

        allocate(csr_row_ptr(m_dim+1), csr_col_ind(nnz), csr_val(nnz), x(n_dim), y(m_dim))

        csr_row_ptr = [0, 2, 4, 6, 8]
        csr_col_ind = [0, 3, 1, 2, 2, 3, 0, 3]
        csr_val     = [2.0_r64, 1.0_r64, 3.0_r64, 1.0_r64, 4.0_r64, 2.0_r64, 1.0_r64, 5.0_r64]
        x           = [1.0_r64, 2.0_r64, 3.0_r64, 4.0_r64]
        y           = 0.0_r64

        expected    = [6.0_r64, 9.0_r64, 20.0_r64, 21.0_r64]

        cerr = hipsparseCreate(handle)
        if (cerr /= HIPSPARSE_STATUS_SUCCESS) error stop "hipsparseCreate failed"

        ! Build CSR sparse-matrix descriptor; all three data pointers are host allocatables
        cerr = hipsparseCreateCsr(matA, int(m_dim,c_int64_t), int(n_dim,c_int64_t), int(nnz,c_int64_t), &
                c_loc(csr_row_ptr(1)), c_loc(csr_col_ind(1)), c_loc(csr_val(1)), &
                HIPSPARSE_INDEX_32I, HIPSPARSE_INDEX_32I, HIPSPARSE_INDEX_BASE_ZERO, HIP_R_64F)
        if (cerr /= HIPSPARSE_STATUS_SUCCESS) error stop "hipsparseCreateCsr failed"

        cerr = hipsparseCreateDnVec(vecX, int(n_dim,c_int64_t), c_loc(x(1)), HIP_R_64F)
        if (cerr /= HIPSPARSE_STATUS_SUCCESS) error stop "hipsparseCreateDnVec x failed"

        cerr = hipsparseCreateDnVec(vecY, int(m_dim,c_int64_t), c_loc(y(1)), HIP_R_64F)
        if (cerr /= HIPSPARSE_STATUS_SUCCESS) error stop "hipsparseCreateDnVec y failed"

        buf_size = 0_c_size_t
        cerr = hipsparseSpMV_bufferSize(handle, HIPSPARSE_OPERATION_NON_TRANSPOSE, &
                c_loc(alpha), matA, vecX, c_loc(beta), vecY, &
                HIP_R_64F, HIPSPARSE_SPMV_ALG_DEFAULT, buf_size)
        if (cerr /= HIPSPARSE_STATUS_SUCCESS) error stop "hipsparseSpMV_bufferSize failed"

        ! External workspace: host-allocated so the pointer path stays entirely on host
        buf_ptr = c_null_ptr
        if (buf_size > 0) then
                allocate(ext_buf(buf_size))
                buf_ptr = c_loc(ext_buf(1))
        end if

        ! y = alpha*A*x + beta*y; every pointer is a host allocatable
        cerr = hipsparseSpMV(handle, HIPSPARSE_OPERATION_NON_TRANSPOSE, &
                c_loc(alpha), matA, vecX, c_loc(beta), vecY, &
                HIP_R_64F, HIPSPARSE_SPMV_ALG_DEFAULT, buf_ptr)
        if (cerr /= HIPSPARSE_STATUS_SUCCESS) then
                write(*,*) "hipsparseSpMV on host buffers returned status ", cerr
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

        cerr = hipsparseDestroyDnVec(vecY)
        if (cerr /= HIPSPARSE_STATUS_SUCCESS) error stop "hipsparseDestroyDnVec y failed"
        cerr = hipsparseDestroyDnVec(vecX)
        if (cerr /= HIPSPARSE_STATUS_SUCCESS) error stop "hipsparseDestroyDnVec x failed"
        cerr = hipsparseDestroySpMat(matA)
        if (cerr /= HIPSPARSE_STATUS_SUCCESS) error stop "hipsparseDestroySpMat failed"
        cerr = hipsparseDestroy(handle)
        if (cerr /= HIPSPARSE_STATUS_SUCCESS) error stop "hipsparseDestroy failed"

        if (allocated(ext_buf)) deallocate(ext_buf)
        deallocate(csr_row_ptr, csr_col_ind, csr_val, x, y)

        write(*,*) "PASSED!"

end program test_hipsparse_dcsrmv_host
