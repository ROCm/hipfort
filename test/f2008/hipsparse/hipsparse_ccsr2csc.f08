!!!!!!!!!!!!!/
! ccsr2csc example (single-complex CSR -> CSC conversion / sparse transpose)
! see: https:!rocm.docs.amd.com/projects/hipSPARSE/en/latest/
!
! Converting A from CSR to CSC is equivalent to producing the CSR of A**T
! (structural transpose; values are permuted, not conjugated). We check the
! resulting csc_col_ptr / csc_row_ind / csc_val against the known transpose.
!
! NOTE: csr2csc args are c_ptr-only, so device buffers are passed via c_loc(...).
!!!!!!!!!!!!!!/
!
program ccsr2csc
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipsparse
  use hipfort_hipsparse_enums

  implicit none
  integer :: i

  ! 3x3 sparse matrix in CSR (0-based); complex values.
  ! A = [[a11,0,a13],[0,a22,0],[a31,0,a33]]
  integer(c_int), parameter :: M = 3, N = 3, nnz = 5

  integer(c_int) :: h_csr_row_ptr(4) = (/0, 2, 3, 5/)
  integer(c_int) :: h_csr_col_ind(5) = (/0, 2, 1, 0, 2/)
  complex(c_float_complex) :: h_csr_val(5) = (/ (1.,1.),(2.,-1.),(3.,0.),(4.,2.),(5.,-1.) /)

  ! Expected CSC (= CSR of the transpose; values permuted, not conjugated)
  integer(c_int) :: h_exp_col_ptr(4) = (/0, 2, 3, 5/)
  integer(c_int) :: h_exp_row_ind(5) = (/0, 2, 1, 0, 2/)
  complex(c_float_complex) :: h_exp_val(5) = (/ (1.,1.),(4.,2.),(3.,0.),(2.,-1.),(5.,-1.) /)

  integer(c_int) :: h_csc_col_ptr(4)
  integer(c_int) :: h_csc_row_ind(5)
  complex(c_float_complex) :: h_csc_val(5)

  integer(c_int), pointer :: d_csr_row_ptr(:), d_csr_col_ind(:)
  complex(c_float_complex), pointer :: d_csr_val(:)
  integer(c_int), pointer :: d_csc_col_ptr(:), d_csc_row_ind(:)
  complex(c_float_complex), pointer :: d_csc_val(:)

  type(c_ptr) :: handle = c_null_ptr

  real(c_float) :: error
  real(c_float), parameter :: error_max = 10 * epsilon(error_max)

  write(*,"(a)",advance="no") "-- Running test 'hipsparse_ccsr2csc' (Fortran 2008 interfaces) - "

  ! Allocate device memory and copy the CSR matrix to device
  call hipCheck(hipMalloc(d_csr_row_ptr, source=h_csr_row_ptr))
  call hipCheck(hipMalloc(d_csr_col_ind, source=h_csr_col_ind))
  call hipCheck(hipMalloc(d_csr_val,     source=h_csr_val))
  call hipCheck(hipMalloc(d_csc_col_ptr, mold=h_csc_col_ptr))
  call hipCheck(hipMalloc(d_csc_row_ind, mold=h_csc_row_ind))
  call hipCheck(hipMalloc(d_csc_val,     mold=h_csc_val))

  ! Create handle and convert CSR -> CSC (numeric: also permute values)
  call hipsparseCheck(hipsparseCreate(handle))
  call hipsparseCheck(hipsparseCcsr2csc(handle, M, N, nnz, &
                          c_loc(d_csr_val(1)), c_loc(d_csr_row_ptr(1)), c_loc(d_csr_col_ind(1)), &
                          c_loc(d_csc_val(1)), c_loc(d_csc_row_ind(1)), c_loc(d_csc_col_ptr(1)), &
                          HIPSPARSE_ACTION_NUMERIC, HIPSPARSE_INDEX_BASE_ZERO))
  call hipCheck(hipDeviceSynchronize())

  ! Copy the result back to host
  call hipCheck(hipMemcpy(h_csc_col_ptr, d_csc_col_ptr, hipMemcpyDeviceToHost))
  call hipCheck(hipMemcpy(h_csc_row_ind, d_csc_row_ind, hipMemcpyDeviceToHost))
  call hipCheck(hipMemcpy(h_csc_val,     d_csc_val,     hipMemcpyDeviceToHost))

  ! Verify structure and values
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
  call hipsparseCheck(hipsparseDestroy(handle))
  call hipCheck(hipFree(d_csr_row_ptr))
  call hipCheck(hipFree(d_csr_col_ind))
  call hipCheck(hipFree(d_csr_val))
  call hipCheck(hipFree(d_csc_col_ptr))
  call hipCheck(hipFree(d_csc_row_ind))
  call hipCheck(hipFree(d_csc_val))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"

end program ccsr2csc
