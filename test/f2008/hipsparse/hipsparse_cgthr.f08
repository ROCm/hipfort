!!!!!!!!!!!!!!
! hipsparse Cgthr example (gather y[xInd] -> xVal, single complex)
! see: https:!rocm.docs.amd.com/projects/hipSPARSE/en/latest/
!
! Gathers the entries of a dense vector y at the sparse index set xInd into the
! packed vector xVal, then checks the gathered values.
!!!!!!!!!!!!!!
!
program hipsparse_cgthr
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipsparse
  implicit none
  integer :: i
  integer(c_int), parameter :: n = 5, nnz = 3
  complex(c_float_complex) :: hY(5) = (/ &
    (10.0,1.0), (20.0,2.0), (30.0,3.0), (40.0,4.0), (50.0,5.0)/)
  integer(c_int) :: hXind(3) = (/0, 2, 4/)
  complex(c_float_complex) :: hXval(3)
  complex(c_float_complex) :: hExp(3) = (/(10.0,1.0), (30.0,3.0), (50.0,5.0)/)
  type(c_ptr) :: handle = c_null_ptr
  complex(c_float_complex), pointer :: dY(:), dXval(:)
  integer(c_int), pointer :: dXind(:)
  write(*,"(a)",advance="no") "-- Running test 'hipsparse_cgthr' (Fortran 2008 interfaces) - "
  call hipCheck(hipMalloc(dY,    source=hY))
  call hipCheck(hipMalloc(dXind, source=hXind))
  call hipCheck(hipMalloc(dXval, mold=hXval))
  call hipsparseCheck(hipsparseCreate(handle))
  call hipsparseCheck(hipsparseCgthr(handle, nnz, dY, dXval, dXind, HIPSPARSE_INDEX_BASE_ZERO))
  call hipCheck(hipDeviceSynchronize())
  call hipCheck(hipMemcpy(hXval, dXval, hipMemcpyDeviceToHost))
  do i = 1, nnz
     if (abs(hXval(i) - hExp(i)) > 1.0e-6) then
        write(*,*) "FAILED! xVal(", i, ") = ", hXval(i), " expected ", hExp(i); call exit(1)
     end if
  end do
  call hipsparseCheck(hipsparseDestroy(handle))
  call hipCheck(hipFree(dY)); call hipCheck(hipFree(dXind)); call hipCheck(hipFree(dXval))
  write(*,*) "PASSED!"
end program hipsparse_cgthr
