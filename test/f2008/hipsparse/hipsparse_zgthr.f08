!!!!!!!!!!!!!!
! hipsparse Zgthr example (gather y[xInd] -> xVal, double complex)
! see: https:!rocm.docs.amd.com/projects/hipSPARSE/en/latest/
!
! Gathers the entries of a dense vector y at the sparse index set xInd into the
! packed vector xVal, then checks the gathered values.
!!!!!!!!!!!!!!
!
program hipsparse_zgthr
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipsparse
  implicit none
  integer :: i
  integer(c_int), parameter :: n = 5, nnz = 3
  complex(c_double_complex) :: hY(5) = (/ &
    (10.0d0,1.0d0), (20.0d0,2.0d0), (30.0d0,3.0d0), (40.0d0,4.0d0), (50.0d0,5.0d0)/)
  integer(c_int) :: hXind(3) = (/0, 2, 4/)
  complex(c_double_complex) :: hXval(3)
  complex(c_double_complex) :: hExp(3) = (/(10.0d0,1.0d0), (30.0d0,3.0d0), (50.0d0,5.0d0)/)
  type(c_ptr) :: handle = c_null_ptr
  complex(c_double_complex), pointer :: dY(:), dXval(:)
  integer(c_int), pointer :: dXind(:)
  write(*,"(a)",advance="no") "-- Running test 'hipsparse_zgthr' (Fortran 2008 interfaces) - "
  call hipCheck(hipMalloc(dY,    source=hY))
  call hipCheck(hipMalloc(dXind, source=hXind))
  call hipCheck(hipMalloc(dXval, mold=hXval))
  call hipsparseCheck(hipsparseCreate(handle))
  call hipsparseCheck(hipsparseZgthr(handle, nnz, dY, dXval, dXind, HIPSPARSE_INDEX_BASE_ZERO))
  call hipCheck(hipDeviceSynchronize())
  call hipCheck(hipMemcpy(hXval, dXval, hipMemcpyDeviceToHost))
  do i = 1, nnz
     if (abs(hXval(i) - hExp(i)) > 1.0d-12) then
        write(*,*) "FAILED! xVal(", i, ") = ", hXval(i), " expected ", hExp(i); call exit(1)
     end if
  end do
  call hipsparseCheck(hipsparseDestroy(handle))
  call hipCheck(hipFree(dY)); call hipCheck(hipFree(dXind)); call hipCheck(hipFree(dXval))
  write(*,*) "PASSED!"
end program hipsparse_zgthr
