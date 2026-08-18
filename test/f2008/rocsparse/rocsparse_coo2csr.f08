!!!!!!!!!!!!!!
! rocsparse coo2csr example (COO row indices -> CSR row pointers)
! see: https:!rocm.docs.amd.com/projects/rocSPARSE/en/latest/
!
! Compresses a per-nonzero COO row-index array into a CSR row-pointer array and
! checks the offsets. Inverse of csr2coo.
!!!!!!!!!!!!!!
!
program coo2csr
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocsparse
  implicit none
  integer :: i
  integer(c_int), parameter :: M = 3, nnz = 5
  integer(c_int) :: h_coo_row(5) = (/0, 0, 1, 2, 2/)
  integer(c_int) :: h_exp_csr_row_ptr(4) = (/0, 2, 3, 5/)
  integer(c_int) :: h_csr_row_ptr(4)
  integer(c_int), pointer :: d_coo_row(:), d_csr_row_ptr(:)
  type(c_ptr) :: handle = c_null_ptr
  write(*,"(a)",advance="no") "-- Running test 'rocsparse_coo2csr' (Fortran 2008 interfaces) - "
  call hipCheck(hipMalloc(d_coo_row,     source=h_coo_row))
  call hipCheck(hipMalloc(d_csr_row_ptr, mold=h_csr_row_ptr))
  call rocsparseCheck(rocsparse_create_handle(handle))
  call rocsparseCheck(rocsparse_coo2csr(handle, d_coo_row, nnz, M, d_csr_row_ptr, rocsparse_index_base_zero))
  call hipCheck(hipDeviceSynchronize())
  call hipCheck(hipMemcpy(h_csr_row_ptr, d_csr_row_ptr, hipMemcpyDeviceToHost))
  do i = 1, M + 1
     if (h_csr_row_ptr(i) /= h_exp_csr_row_ptr(i)) then
        write(*,*) "FAILED! csr_row_ptr(", i, ") = ", h_csr_row_ptr(i), " expected ", h_exp_csr_row_ptr(i); call exit(1)
     end if
  end do
  call rocsparseCheck(rocsparse_destroy_handle(handle))
  call hipCheck(hipFree(d_coo_row)); call hipCheck(hipFree(d_csr_row_ptr))
  write(*,*) "PASSED!"
end program coo2csr
