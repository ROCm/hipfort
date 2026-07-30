!!!!!!!!!!!!!!
! hipsolver dpotrf example (Cholesky factorization, Fortran 2008 interfaces)
! see: https:!rocm.docs.amd.com/projects/hipSOLVER/en/latest/
!
! Native-array f2008 form: A is a Fortran array pointer; the workspace is a
! type(c_ptr) sized by hipsolverDpotrf_bufferSize; devInfo is device-backed.
!!!!!!!!!!!!!!
!
program hipsolver_dpotrf
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipsolver
  implicit none
  integer :: i, j
  integer(c_int), parameter :: N = 3, lda = 3
  real(c_double) :: hA(3,3) = reshape((/4, 12, -16, 12, 37, -43, -16, -43, 98/), (/3, 3/))
  real(c_double) :: hResult(3,3) = reshape((/&
     2.0000000000000000d0, 12.0000000000000000d0, -16.0000000000000000d0, &
     6.0000000000000000d0,  1.0000000000000000d0, -43.0000000000000000d0, &
    -8.0000000000000000d0,  5.0000000000000000d0,   3.0000000000000000d0/), (/3, 3/))
  real(c_double), pointer :: dA(:,:)
  integer(c_int), pointer :: dInfo
  type(c_ptr) :: dWork, handle = c_null_ptr
  integer(c_int) :: lwork
  real(c_double) :: error
  real(c_double), parameter :: error_max = 10 * epsilon(error_max)
  write(*,"(a)",advance="no") "-- Running test 'hipsolver_dpotrf' (Fortran 2008 interfaces) - "
  call hipsolverCheck(hipsolverCreate(handle))
  call hipCheck(hipMalloc(dA, source=hA))
  call hipCheck(hipMalloc(dInfo))
  call hipsolverCheck(hipsolverDpotrf_bufferSize(handle, HIPSOLVER_FILL_MODE_UPPER, N, dA, lda, lwork))
  call hipCheck(hipMalloc(dWork, max(int(lwork,c_size_t) * 8, 1_c_size_t)))
  call hipsolverCheck(hipsolverDpotrf(handle, HIPSOLVER_FILL_MODE_UPPER, N, dA, lda, dWork, lwork, dInfo))
  call hipCheck(hipMemcpy(hA, dA, hipMemcpyDeviceToHost))
  do j = 1,3
    do i = 1,3
      error = abs(hA(i,j) - hResult(i,j)) / max(abs(hResult(i,j)), 1.0_c_double)
      if (error > error_max) then
        write(*,*) "FAILED! hA(", i, ",", j, ") = ", hA(i,j)
        call exit(1)
      end if
    end do
  end do
  call hipCheck(hipFree(dA)); call hipCheck(hipFree(dInfo)); call hipCheck(hipFree(dWork))
  call hipsolverCheck(hipsolverDestroy(handle))
  write(*,*) "PASSED!"
end program hipsolver_dpotrf
