!!!!!!!!!!!!!/
! scsr2csc example (single-precision CSR -> CSC conversion / sparse transpose)
! see: https:!rocm.docs.amd.com/projects/rocSPARSE/en/latest/reference/conversion.html
!
! Converting A from CSR to CSC is equivalent to producing the CSR of A**T.
! We check the resulting csc_col_ptr / csc_row_ind / csc_val against the known
! transpose. csr2csc needs a workspace buffer sized by csr2csc_buffer_size.
!!!!!!!!!!!!!!/
!
program scsr2csc
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocsparse

  implicit none
  integer :: i

  ! 3x3 sparse matrix in CSR (0-based):
  !   row 0: (0,0)=1, (0,2)=2
  !   row 1: (1,1)=3
  !   row 2: (2,0)=4, (2,2)=5
  integer(c_int), parameter :: M = 3, N = 3, nnz = 5

  integer(c_int) :: h_csr_row_ptr(4) = (/0, 2, 3, 5/)
  integer(c_int) :: h_csr_col_ind(5) = (/0, 2, 1, 0, 2/)
  real(c_float) :: h_csr_val(5)     = (/1, 2, 3, 4, 5/)

  ! Expected CSC (= CSR of the transpose)
  integer(c_int) :: h_exp_col_ptr(4) = (/0, 2, 3, 5/)
  integer(c_int) :: h_exp_row_ind(5) = (/0, 2, 1, 0, 2/)
  real(c_float) :: h_exp_val(5)     = (/1, 4, 3, 2, 5/)

  integer(c_int) :: h_csc_col_ptr(4)
  integer(c_int) :: h_csc_row_ind(5)
  real(c_float) :: h_csc_val(5)

  integer(c_int), pointer :: d_csr_row_ptr(:), d_csr_col_ind(:)
  real(c_float), pointer :: d_csr_val(:)
  integer(c_int), pointer :: d_csc_col_ptr(:), d_csc_row_ind(:)
  real(c_float), pointer :: d_csc_val(:)

  type(c_ptr) :: handle, d_buffer
  integer(c_size_t) :: buffer_size

  real(c_float) :: error
  real(c_float), parameter :: error_max = 10 * epsilon(error_max)

  write(*,"(a)",advance="no") "-- Running test 'rocsparse_scsr2csc' (Fortran 2008 interfaces) - "

  ! Allocate device memory and copy the CSR matrix to device
  call hipCheck(hipMalloc(d_csr_row_ptr, source=h_csr_row_ptr))
  call hipCheck(hipMalloc(d_csr_col_ind, source=h_csr_col_ind))
  call hipCheck(hipMalloc(d_csr_val,     source=h_csr_val))
  call hipCheck(hipMalloc(d_csc_col_ptr, mold=h_csc_col_ptr))
  call hipCheck(hipMalloc(d_csc_row_ind, mold=h_csc_row_ind))
  call hipCheck(hipMalloc(d_csc_val,     mold=h_csc_val))

  ! Create rocSPARSE handle
  call rocsparseCheck(rocsparse_create_handle(handle))

  ! Query and allocate the required workspace
  call rocsparseCheck(rocsparse_csr2csc_buffer_size(handle, M, N, nnz, &
                          d_csr_row_ptr(1), d_csr_col_ind(1), rocsparse_action_numeric, buffer_size))
  call hipCheck(hipMalloc(d_buffer, buffer_size))

  ! Convert CSR -> CSC (numeric: also permute values)
  call rocsparseCheck(rocsparse_scsr2csc(handle, M, N, nnz, &
                          d_csr_val(1), d_csr_row_ptr(1), d_csr_col_ind(1), &
                          d_csc_val(1), d_csc_row_ind(1), d_csc_col_ptr(1), &
                          rocsparse_action_numeric, rocsparse_index_base_zero, d_buffer))

  ! Copy the result back to host
  call hipCheck(hipMemcpy(h_csc_col_ptr, d_csc_col_ptr, hipMemcpyDeviceToHost))
  call hipCheck(hipMemcpy(h_csc_row_ind, d_csc_row_ind, hipMemcpyDeviceToHost))
  call hipCheck(hipMemcpy(h_csc_val,     d_csc_val,     hipMemcpyDeviceToHost))

  ! Verify structure
  do i = 1,N+1
    if(h_csc_col_ptr(i) /= h_exp_col_ptr(i)) then
        write(*,*) "FAILED! csc_col_ptr(", i, ") = ", h_csc_col_ptr(i), " expected ", h_exp_col_ptr(i)
        call exit
    end if
  end do
  do i = 1,nnz
    if(h_csc_row_ind(i) /= h_exp_row_ind(i)) then
        write(*,*) "FAILED! csc_row_ind(", i, ") = ", h_csc_row_ind(i), " expected ", h_exp_row_ind(i)
        call exit
    end if
    error = abs(h_csc_val(i) - h_exp_val(i))
    if(error .gt. error_max) then
        write(*,*) "FAILED! csc_val(", i, ") = ", h_csc_val(i), " expected ", h_exp_val(i)
        call exit
    end if
  end do

  ! Clean up
  call rocsparseCheck(rocsparse_destroy_handle(handle))
  call hipCheck(hipFree(d_csr_row_ptr))
  call hipCheck(hipFree(d_csr_col_ind))
  call hipCheck(hipFree(d_csr_val))
  call hipCheck(hipFree(d_csc_col_ptr))
  call hipCheck(hipFree(d_csc_row_ind))
  call hipCheck(hipFree(d_csc_val))
  call hipCheck(hipFree(d_buffer))

  write(*,*) "PASSED!"

end program scsr2csc
