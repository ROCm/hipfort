!!!!!!!!!!!!!/
! dsddmm_batched example (double-precision batched sampled dense-dense matmul)
! see: https:!rocm.docs.amd.com/projects/rocSPARSE/en/latest/reference/generic.html
!
! Batched SDDMM: for each batch b, C_b = alpha * (A_b * B_b) .* spy(C) + beta*C_b.
! The dense matrices A and B are strided-batched (rocsparse_dnmat_set_strided_batch);
! the sparse C shares one CSR sparsity pattern across the batch
! (offsets_batch_stride = 0) with per-batch values (columns_values_batch_stride
! = nnz), set with rocsparse_csr_set_strided_batch. Each batch's sampled values
! are checked against matmul(A_b, B_b).
!
! NOTE: the descriptor constructors are c_ptr-only (no array overloads), so
! device buffers are passed via c_loc(...).
!!!!!!!!!!!!!!/
!
program dsddmm_batched
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocsparse

  implicit none
  integer :: b, i

  integer(c_int), parameter :: M = 3, N = 2, K = 3, nnz = 4, batch = 2

  ! Two dense A matrices (M x K each), column-major, stored back-to-back.
  ! A_1 = [[1,2,3],[4,5,6],[7,8,10]]   A_2 = 2 * A_1
  real(c_double) :: h_A(3,3,2) = reshape((/ &
       1, 4, 7, 2, 5, 8, 3, 6, 10, &
       2, 8, 14, 4, 10, 16, 6, 12, 20/), (/3,3,2/))
  ! Two dense B matrices (K x N each), column-major.
  ! B_1 = [[1,2],[3,4],[5,6]]          B_2 = B_1 + 1
  real(c_double) :: h_B(3,2,2) = reshape((/ &
       1, 3, 5, 2, 4, 6, &
       2, 4, 6, 3, 5, 7/), (/3,2,2/))

  ! Shared sparse C pattern (0-based CSR), nonzeros at (0,0),(1,1),(2,0),(2,1).
  integer(c_int) :: h_csr_row_ptr(4) = (/0, 1, 2, 4/)
  integer(c_int) :: h_csr_col_ind(4) = (/0, 1, 0, 1/)
  real(c_double) :: h_csr_val(nnz*batch) = 0    ! batch-major: [b1 nnz | b2 nnz]

  real(c_double) :: h_AB(3,2), h_expected(nnz,batch)
  real(c_double), target :: alpha = 1.0_c_double, beta = 0.0_c_double

  integer(c_int), pointer :: d_csr_row_ptr(:), d_csr_col_ind(:)
  real(c_double), pointer :: d_csr_val(:)
  real(c_double), pointer :: d_A(:,:,:), d_B(:,:,:)

  type(c_ptr) :: handle, matA, matB, matC, d_buffer
  integer(c_size_t) :: buffer_size

  real(c_double) :: error
  real(c_double), parameter :: error_max = 10 * epsilon(error_max)

  write(*,"(a)",advance="no") "-- Running test 'rocsparse_dsddmm_batched' (Fortran 2008 interfaces) - "

  ! Host reference per batch: sample matmul(A_b, B_b) at C's pattern.
  do b = 1, batch
    h_AB = matmul(h_A(:,:,b), h_B(:,:,b))
    h_expected(1,b) = h_AB(1,1)   ! (0,0)
    h_expected(2,b) = h_AB(2,2)   ! (1,1)
    h_expected(3,b) = h_AB(3,1)   ! (2,0)
    h_expected(4,b) = h_AB(3,2)   ! (2,1)
  end do

  call hipCheck(hipMalloc(d_csr_row_ptr, source=h_csr_row_ptr))
  call hipCheck(hipMalloc(d_csr_col_ind, source=h_csr_col_ind))
  call hipCheck(hipMalloc(d_csr_val,     source=h_csr_val))
  call hipCheck(hipMalloc(d_A,           source=h_A))
  call hipCheck(hipMalloc(d_B,           source=h_B))

  call rocsparseCheck(rocsparse_create_handle(handle))

  ! Dense descriptors on the first batch slice, then attach the batch stride.
  call rocsparseCheck(rocsparse_create_dnmat_descr(matA, int(M,c_int64_t), int(K,c_int64_t), int(M,c_int64_t), &
                          c_loc(d_A), rocsparse_datatype_f64_r, rocsparse_order_column))
  call rocsparseCheck(rocsparse_create_dnmat_descr(matB, int(K,c_int64_t), int(N,c_int64_t), int(K,c_int64_t), &
                          c_loc(d_B), rocsparse_datatype_f64_r, rocsparse_order_column))
  call rocsparseCheck(rocsparse_create_csr_descr(matC, int(M,c_int64_t), int(N,c_int64_t), int(nnz,c_int64_t), &
                          c_loc(d_csr_row_ptr), c_loc(d_csr_col_ind), c_loc(d_csr_val), &
                          rocsparse_indextype_i32, rocsparse_indextype_i32, &
                          rocsparse_index_base_zero, rocsparse_datatype_f64_r))

  ! Batch config: dense strides are the per-matrix element counts; the sparse C
  ! reuses one pattern (offsets stride 0) with per-batch values (stride nnz).
  call rocsparseCheck(rocsparse_dnmat_set_strided_batch(matA, batch, int(M*K,c_int64_t)))
  call rocsparseCheck(rocsparse_dnmat_set_strided_batch(matB, batch, int(K*N,c_int64_t)))
  call rocsparseCheck(rocsparse_csr_set_strided_batch(matC, batch, 0_c_int64_t, int(nnz,c_int64_t)))

  ! Stage 1: query workspace size
  call rocsparseCheck(rocsparse_sddmm_buffer_size(handle, rocsparse_operation_none, rocsparse_operation_none, &
                          c_loc(alpha), matA, matB, c_loc(beta), matC, rocsparse_datatype_f64_r, &
                          rocsparse_sddmm_alg_default, buffer_size))
  call hipCheck(hipMalloc(d_buffer, max(buffer_size, 1_c_size_t)))

  ! Stage 2: preprocess
  call rocsparseCheck(rocsparse_sddmm_preprocess(handle, rocsparse_operation_none, rocsparse_operation_none, &
                          c_loc(alpha), matA, matB, c_loc(beta), matC, rocsparse_datatype_f64_r, &
                          rocsparse_sddmm_alg_default, d_buffer))

  ! Stage 3: compute
  call rocsparseCheck(rocsparse_sddmm(handle, rocsparse_operation_none, rocsparse_operation_none, &
                          c_loc(alpha), matA, matB, c_loc(beta), matC, rocsparse_datatype_f64_r, &
                          rocsparse_sddmm_alg_default, d_buffer))

  call hipCheck(hipMemcpy(h_csr_val, d_csr_val, hipMemcpyDeviceToHost))

  do b = 1, batch
    do i = 1, nnz
      error = abs(h_csr_val((b-1)*nnz+i) - h_expected(i,b)) / max(abs(h_expected(i,b)), 1.0_c_double)
      if(error .gt. error_max) then
          write(*,*) "FAILED! Error bigger than max! Error = ", error, " at batch ", b, " nnz ", i, &
                     " got ", h_csr_val((b-1)*nnz+i), " expected ", h_expected(i,b)
          call exit
      end if
    end do
  end do

  call rocsparseCheck(rocsparse_destroy_handle(handle))
  call hipCheck(hipFree(d_csr_row_ptr))
  call hipCheck(hipFree(d_csr_col_ind))
  call hipCheck(hipFree(d_csr_val))
  call hipCheck(hipFree(d_A))
  call hipCheck(hipFree(d_B))
  call hipCheck(hipFree(d_buffer))

  write(*,*) "PASSED!"

end program dsddmm_batched
