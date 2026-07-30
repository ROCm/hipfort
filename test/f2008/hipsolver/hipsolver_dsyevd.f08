!!!!!!!!!!!!!!
! hipsolver dsyevd example (symmetric eigenvalues, Fortran 2008 interfaces)
! see: https:!rocm.docs.amd.com/projects/hipSOLVER/en/latest/
!
! Checks sum(eigenvalues) == trace(A). Native-array f2008 form; workspace via
! hipsolverDsyevd_bufferSize; devInfo device-backed.
!!!!!!!!!!!!!!
!
program hipsolver_dsyevd
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipsolver
  implicit none
  integer(c_int), parameter :: N = 4, lda = 4
  real(c_double) :: hA(N,N) = reshape((/ &
      10.0d0,  2.0d0,  3.0d0,  6.0d0, &
       2.0d0, 11.0d0,  1.0d0,  0.0d0, &
       3.0d0,  1.0d0, 12.0d0,  2.0d0, &
       6.0d0,  0.0d0,  2.0d0, 13.0d0/), (/N,N/))
  real(c_double) :: hD(N) = 0.0d0
  real(c_double), pointer :: dA(:,:)
  real(c_double), pointer :: dD(:)
  integer(c_int), pointer :: dInfo
  type(c_ptr) :: dWork, handle = c_null_ptr
  integer(c_int) :: lwork
  real(c_double) :: trace_A, error
  real(c_double), parameter :: rtol = 1.0d-9
  write(*,"(a)",advance="no") "-- Running test 'hipsolver_dsyevd' (Fortran 2008 interfaces) - "
  trace_A = hA(1,1) + hA(2,2) + hA(3,3) + hA(4,4)
  call hipsolverCheck(hipsolverCreate(handle))
  call hipCheck(hipMalloc(dA, source=hA))
  call hipCheck(hipMalloc(dD, source=hD))
  call hipCheck(hipMalloc(dInfo))
  call hipsolverCheck(hipsolverDsyevd_bufferSize(handle, HIPSOLVER_EIG_MODE_NOVECTOR, &
                                                 HIPSOLVER_FILL_MODE_UPPER, N, dA, lda, dD, lwork))
  call hipCheck(hipMalloc(dWork, max(int(lwork,c_size_t) * 8, 1_c_size_t)))
  call hipsolverCheck(hipsolverDsyevd(handle, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, &
                                      N, dA, lda, dD, dWork, lwork, dInfo))
  call hipCheck(hipMemcpy(hD, dD, hipMemcpyDeviceToHost))
  error = abs(sum(hD) - trace_A) / abs(trace_A)
  if (error > rtol) then
     write(*,*) "FAILED! sum(eigenvalues) = ", sum(hD), " expected trace = ", trace_A
     call exit(1)
  end if
  call hipCheck(hipFree(dA)); call hipCheck(hipFree(dD)); call hipCheck(hipFree(dInfo)); call hipCheck(hipFree(dWork))
  call hipsolverCheck(hipsolverDestroy(handle))
  write(*,*) "PASSED!"
end program hipsolver_dsyevd
