!!!!!!!!!!!!!!
! rocsparse ssctr example (scatter x_val -> y[x_ind], single)
! see: https:!rocm.docs.amd.com/projects/rocSPARSE/en/latest/
!
! Scatters the packed vector x_val into the dense vector y at the sparse index
! set x_ind, then checks the resulting dense vector.
!!!!!!!!!!!!!!
!
program dsctr
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocsparse
  implicit none
  integer :: i
  integer(c_int), parameter :: n = 5, nnz = 3
  real(c_double) :: hXval(3) = (/100.0d0, 200.0d0, 300.0d0/)
  integer(c_int) :: hXind(3) = (/0, 2, 4/)
  real(c_double) :: hY(5) = (/0.0d0, 0.0d0, 0.0d0, 0.0d0, 0.0d0/)
  real(c_double) :: hExp(5) = (/100.0d0, 0.0d0, 200.0d0, 0.0d0, 300.0d0/)
  type(c_ptr) :: handle = c_null_ptr
  real(c_double), pointer :: dXval(:), dY(:)
  integer(c_int), pointer :: dXind(:)
  write(*,"(a)",advance="no") "-- Running test 'rocsparse_dsctr' (Fortran 2008 interfaces) - "
  call hipCheck(hipMalloc(dXval, source=hXval))
  call hipCheck(hipMalloc(dXind, source=hXind))
  call hipCheck(hipMalloc(dY,    source=hY))
  call rocsparseCheck(rocsparse_create_handle(handle))
  call rocsparseCheck(rocsparse_dsctr(handle, nnz, dXval, dXind, dY, rocsparse_index_base_zero))
  call hipCheck(hipDeviceSynchronize())
  call hipCheck(hipMemcpy(hY, dY, hipMemcpyDeviceToHost))
  do i = 1, n
     if (abs(hY(i) - hExp(i)) > 1.0d-12) then
        write(*,*) "FAILED! y(", i, ") = ", hY(i), " expected ", hExp(i); call exit(1)
     end if
  end do
  call rocsparseCheck(rocsparse_destroy_handle(handle))
  call hipCheck(hipFree(dXval)); call hipCheck(hipFree(dXind)); call hipCheck(hipFree(dY))
  write(*,*) "PASSED!"
end program dsctr
