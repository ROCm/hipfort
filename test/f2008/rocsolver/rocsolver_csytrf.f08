!!!!!!!!!!!!!!
! csytrf example (Bunch-Kaufman symmetric factorization, single complex)
! see: https:!rocm.docs.amd.com/projects/rocSOLVER/en/latest/
!
! Factorizes a complex SYMMETRIC matrix (A = A^T, not Hermitian) and checks the
! algorithm succeeded (info == 0). rocSOLVER writes info to DEVICE memory, so it
! is read back from a device allocation (this is what the test exercises).
!!!!!!!!!!!!!!
!
program csytrf
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocblas
  use hipfort_rocblas_enums
  use hipfort_rocsolver
  implicit none
  integer(c_int), parameter :: N = 4, lda = 4
  complex(c_float_complex) :: hA(N,N) = reshape((/ &
      (10.0,1.0), ( 2.0,0.0), ( 3.0,0.0), ( 6.0,0.0), &
      ( 2.0,0.0), (11.0,1.0), ( 1.0,0.0), ( 0.0,0.0), &
      ( 3.0,0.0), ( 1.0,0.0), (12.0,1.0), ( 2.0,0.0), &
      ( 6.0,0.0), ( 0.0,0.0), ( 2.0,0.0), (13.0,1.0)/), (/N,N/))
  integer(c_int), target :: hInfo(1)
  complex(c_float_complex), pointer :: dA(:,:)
  integer(c_int), pointer :: dIpiv(:)
  integer(c_int) :: hIpiv(N)
  type(c_ptr) :: dInfo
  type(c_ptr) :: handle
  write(*,"(a)",advance="no") "-- Running test 'rocsolver_csytrf' (Fortran 2008 interfaces) - "
  call hipCheck(hipMalloc(dA, source=hA))
  call hipCheck(hipMalloc(dIpiv, mold=hIpiv))
  call hipCheck(hipMalloc(dInfo, 4_c_size_t))
  call hipCheck(rocblas_create_handle(handle))
  call hipCheck(rocsolver_csytrf(handle, rocblas_fill_upper, N, dA, lda, dIpiv, dInfo))
  call hipCheck(hipMemcpy(c_loc(hInfo(1)), dInfo, 4_c_size_t, hipMemcpyDeviceToHost))
  if (hInfo(1) /= 0) then
     write(*,*) "FAILED! info = ", hInfo(1), " (expected 0)"; call exit(1)
  end if
  call hipCheck(hipFree(dA)); call hipCheck(hipFree(dIpiv)); call hipCheck(hipFree(dInfo))
  call hipCheck(rocblas_destroy_handle(handle)); call hipCheck(hipDeviceReset())
  write(*,*) "PASSED!"
end program csytrf
