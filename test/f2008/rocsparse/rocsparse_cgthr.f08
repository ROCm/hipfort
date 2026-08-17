!!!!!!!!!!!!!!
! rocsparse sgthr example (gather y[x_ind] -> x_val, single)
! see: https:!rocm.docs.amd.com/projects/rocSPARSE/en/latest/
!
! Gathers the entries of a dense vector y at the sparse index set x_ind into the
! packed vector x_val, then checks the gathered values.
!!!!!!!!!!!!!!
!
program cgthr
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocsparse
  implicit none
  integer :: i
  integer(c_int), parameter :: n = 5, nnz = 3
  complex(c_float_complex) :: hY(5) = (/(10.0,1.0), (20.0,2.0), (30.0,3.0), (40.0,4.0), (50.0,5.0)/)
  integer(c_int) :: hXind(3) = (/0, 2, 4/)
  complex(c_float_complex) :: hXval(3)
  complex(c_float_complex) :: hExp(3) = (/(10.0,1.0), (30.0,3.0), (50.0,5.0)/)
  type(c_ptr) :: handle = c_null_ptr
  complex(c_float_complex), pointer :: dY(:), dXval(:)
  integer(c_int), pointer :: dXind(:)
  write(*,"(a)",advance="no") "-- Running test 'rocsparse_cgthr' (Fortran 2008 interfaces) - "
  call hipCheck(hipMalloc(dY,    source=hY))
  call hipCheck(hipMalloc(dXind, source=hXind))
  call hipCheck(hipMalloc(dXval, mold=hXval))
  call rocsparseCheck(rocsparse_create_handle(handle))
  call rocsparseCheck(rocsparse_cgthr(handle, nnz, dY, dXval, dXind, rocsparse_index_base_zero))
  call hipCheck(hipDeviceSynchronize())
  call hipCheck(hipMemcpy(hXval, dXval, hipMemcpyDeviceToHost))
  do i = 1, nnz
     if (abs(hXval(i) - hExp(i)) > 1.0e-6) then
        write(*,*) "FAILED! x_val(", i, ") = ", hXval(i), " expected ", hExp(i); call exit(1)
     end if
  end do
  call rocsparseCheck(rocsparse_destroy_handle(handle))
  call hipCheck(hipFree(dY)); call hipCheck(hipFree(dXind)); call hipCheck(hipFree(dXval))
  write(*,*) "PASSED!"
end program cgthr
