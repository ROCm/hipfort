!!!!!!!!!!!!!/
! csr2coo example (CSR -> COO row-index conversion)
! see: https:!rocm.docs.amd.com/projects/rocSPARSE/en/latest/reference/conversion.html
!
! csr2coo expands the CSR row-pointer array into per-nonzero COO row indices.
! It is integer-only (no s/d/c/z variants).
!!!!!!!!!!!!!!/
!
program csr2coo
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocsparse

  implicit none
  integer :: i

  integer(c_int), parameter :: M = 3      ! number of rows
  integer(c_int), parameter :: nnz = 4    ! number of nonzeros

  ! CSR row-pointer for a 3x3 matrix with 2, 1, 1 nonzeros per row (0-based)
  integer(c_int) :: h_csr_row_ptr(4) = (/0, 2, 3, 4/)
  integer(c_int) :: h_coo_row_ind(4)
  integer(c_int) :: h_expected(4) = (/0, 0, 1, 2/)

  integer(c_int), pointer :: d_csr_row_ptr(:)
  integer(c_int), pointer :: d_coo_row_ind(:)

  type(c_ptr) :: handle

  write(*,"(a)",advance="no") "-- Running test 'rocsparse_csr2coo' (Fortran 2008 interfaces) - "

  ! Allocate device memory and copy the row-pointer to device
  call hipCheck(hipMalloc(d_csr_row_ptr, source=h_csr_row_ptr))
  call hipCheck(hipMalloc(d_coo_row_ind, mold=h_coo_row_ind))

  ! Create rocSPARSE handle
  call rocsparseCheck(rocsparse_create_handle(handle))

  ! Convert CSR row pointers to COO row indices
  call rocsparseCheck(rocsparse_csr2coo(handle, d_csr_row_ptr(1), nnz, M, &
                                        d_coo_row_ind(1), rocsparse_index_base_zero))

  ! Copy the result back to host
  call hipCheck(hipMemcpy(h_coo_row_ind, d_coo_row_ind, hipMemcpyDeviceToHost))

  ! Verify against the expected COO row indices
  do i = 1,nnz
    if(h_coo_row_ind(i) /= h_expected(i)) then
        write(*,*) "FAILED! coo_row_ind(", i, ") = ", h_coo_row_ind(i), " expected ", h_expected(i)
        call exit
    end if
  end do

  ! Clean up
  call rocsparseCheck(rocsparse_destroy_handle(handle))
  call hipCheck(hipFree(d_csr_row_ptr))
  call hipCheck(hipFree(d_coo_row_ind))

  write(*,*) "PASSED!"

end program csr2coo
