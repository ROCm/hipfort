!!!!!!!!!!!!!!
! hipsparse Dsctr example (scatter xVal -> y[xInd], double)
! see: https:!rocm.docs.amd.com/projects/hipSPARSE/en/latest/
!
! Scatters the packed vector xVal into the dense vector y at the sparse index
! set xInd, then checks the resulting dense vector.
!!!!!!!!!!!!!!
!
program hipsparse_dsctr
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipsparse
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
  write(*,"(a)",advance="no") "-- Running test 'hipsparse_dsctr' (Fortran 2008 interfaces) - "
  call hipCheck(hipMalloc(dXval, source=hXval))
  call hipCheck(hipMalloc(dXind, source=hXind))
  call hipCheck(hipMalloc(dY,    source=hY))
  call hipsparseCheck(hipsparseCreate(handle))
  call hipsparseCheck(hipsparseDsctr(handle, nnz, dXval, dXind, dY, HIPSPARSE_INDEX_BASE_ZERO))
  call hipCheck(hipDeviceSynchronize())
  call hipCheck(hipMemcpy(hY, dY, hipMemcpyDeviceToHost))
  do i = 1, n
     if (abs(hY(i) - hExp(i)) > 1.0d-12) then
        write(*,*) "FAILED! y(", i, ") = ", hY(i), " expected ", hExp(i); call exit(1)
     end if
  end do
  call hipsparseCheck(hipsparseDestroy(handle))
  call hipCheck(hipFree(dXval)); call hipCheck(hipFree(dXind)); call hipCheck(hipFree(dY))
  write(*,*) "PASSED!"
end program hipsparse_dsctr
