!!!!!!!!!!!!!!
! hipsparse Ssctr example (scatter xVal -> y[xInd], single)
! see: https:!rocm.docs.amd.com/projects/hipSPARSE/en/latest/
!
! Scatters the packed vector xVal into the dense vector y at the sparse index
! set xInd, then checks the resulting dense vector.
!!!!!!!!!!!!!!
!
program hipsparse_ssctr
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipsparse
  implicit none
  integer :: i
  integer(c_int), parameter :: n = 5, nnz = 3
  real(c_float) :: hXval(3) = (/100.0, 200.0, 300.0/)
  integer(c_int) :: hXind(3) = (/0, 2, 4/)
  real(c_float) :: hY(5) = (/0.0, 0.0, 0.0, 0.0, 0.0/)
  real(c_float) :: hExp(5) = (/100.0, 0.0, 200.0, 0.0, 300.0/)
  type(c_ptr) :: handle = c_null_ptr
  real(c_float), pointer :: dXval(:), dY(:)
  integer(c_int), pointer :: dXind(:)
  write(*,"(a)",advance="no") "-- Running test 'hipsparse_ssctr' (Fortran 2008 interfaces) - "
  call hipCheck(hipMalloc(dXval, source=hXval))
  call hipCheck(hipMalloc(dXind, source=hXind))
  call hipCheck(hipMalloc(dY,    source=hY))
  call hipsparseCheck(hipsparseCreate(handle))
  call hipsparseCheck(hipsparseSsctr(handle, nnz, dXval, dXind, dY, HIPSPARSE_INDEX_BASE_ZERO))
  call hipCheck(hipDeviceSynchronize())
  call hipCheck(hipMemcpy(hY, dY, hipMemcpyDeviceToHost))
  do i = 1, n
     if (abs(hY(i) - hExp(i)) > 1.0e-6) then
        write(*,*) "FAILED! y(", i, ") = ", hY(i), " expected ", hExp(i); call exit(1)
     end if
  end do
  call hipsparseCheck(hipsparseDestroy(handle))
  call hipCheck(hipFree(dXval)); call hipCheck(hipFree(dXind)); call hipCheck(hipFree(dY))
  write(*,*) "PASSED!"
end program hipsparse_ssctr
