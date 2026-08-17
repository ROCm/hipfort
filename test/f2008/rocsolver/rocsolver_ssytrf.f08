!!!!!!!!!!!!!!
! ssytrf example (Bunch-Kaufman symmetric factorization)
! Factorizes a symmetric matrix and checks the algorithm succeeded (info == 0).
! rocSOLVER writes info to DEVICE memory, so it is read back from a device
! allocation (this is what the test primarily exercises).
!!!!!!!!!!!!!!
!
program ssytrf
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocblas
  use hipfort_rocblas_enums
  use hipfort_rocsolver
  implicit none
  integer(c_int), parameter :: N = 4, lda = 4
  real(c_float) :: hA(N,N) = reshape((/ &
      10.0,  2.0,  3.0,  6.0, &
       2.0, 11.0,  1.0,  0.0, &
       3.0,  1.0, 12.0,  2.0, &
       6.0,  0.0,  2.0, 13.0/), (/N,N/))
  integer(c_int) :: hIpiv(N), hInfo(1)
  real(c_float), pointer :: dA(:,:)
  integer(c_int), pointer :: dIpiv(:)
  integer(c_int), pointer :: dInfo(:)
  type(c_ptr) :: handle
  write(*,"(a)",advance="no") "-- Running test 'rocsolver_ssytrf' (Fortran 2008 interfaces) - "
  call hipCheck(hipMalloc(dA, source=hA))
  call hipCheck(hipMalloc(dIpiv, mold=hIpiv))
  call hipCheck(hipMalloc(dInfo, 1))
  call hipCheck(rocblas_create_handle(handle))
  call hipCheck(rocsolver_ssytrf(handle, rocblas_fill_upper, N, dA, lda, dIpiv, c_loc(dInfo)))
  call hipCheck(hipMemcpy(hInfo, dInfo, hipMemcpyDeviceToHost))
  call hipCheck(hipMemcpy(hIpiv, dIpiv, hipMemcpyDeviceToHost))
  if (hInfo(1) /= 0) then
     write(*,*) "FAILED! info = ", hInfo(1), " (expected 0)"
     call exit(1)
  end if
  call hipCheck(hipFree(dA)); call hipCheck(hipFree(dIpiv)); call hipCheck(hipFree(dInfo))
  call hipCheck(rocblas_destroy_handle(handle)); call hipCheck(hipDeviceReset())
  write(*,*) "PASSED!"
end program ssytrf
