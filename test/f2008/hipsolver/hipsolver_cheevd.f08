!!!!!!!!!!!!!!
! cheevd example (complex Hermitian eigenvalues, Fortran 2008 interfaces)
! see: https:!rocm.docs.amd.com/projects/hipSOLVER/en/latest/
!
! Checks sum(eigenvalues) == trace(A). Native-array f2008 form; workspace via
! hipsolverCheevd_bufferSize; devInfo device-backed.
!!!!!!!!!!!!!!
!
program hipsolver_cheevd
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipsolver
  implicit none
  integer(c_int), parameter :: N = 4, lda = 4
  complex(c_float_complex) :: hA(N,N) = reshape((/ &
      (10.,0.),(2.,0.),(3.,0.),(6.,0.), (2.,0.),(11.,0.),(1.,0.),(0.,0.), &
      (3.,0.),(1.,0.),(12.,0.),(2.,0.), (6.,0.),(0.,0.),(2.,0.),(13.,0.) /), (/N,N/))
  real(c_float) :: hD(N) = 0.0
  complex(c_float_complex), pointer :: dA(:,:)
  real(c_float), pointer :: dD(:)
  integer(c_int), pointer :: dInfo
  type(c_ptr) :: dWork, handle = c_null_ptr
  integer(c_int) :: lwork
  real(c_float) :: trace_A, error
  real(c_float), parameter :: rtol = 1.0e-5
  write(*,"(a)",advance="no") "-- Running test 'hipsolver_cheevd' (Fortran 2008 interfaces) - "
  trace_A = real(hA(1,1)) + real(hA(2,2)) + real(hA(3,3)) + real(hA(4,4))
  call hipsolverCheck(hipsolverCreate(handle))
  call hipCheck(hipMalloc(dA, source=hA))
  call hipCheck(hipMalloc(dD, source=hD))
  call hipCheck(hipMalloc(dInfo))
  call hipsolverCheck(hipsolverCheevd_bufferSize(handle, HIPSOLVER_EIG_MODE_NOVECTOR, &
                                                 HIPSOLVER_FILL_MODE_UPPER, N, dA, lda, dD, lwork))
  call hipCheck(hipMalloc(dWork, max(int(lwork,c_size_t) * 8, 1_c_size_t)))
  call hipsolverCheck(hipsolverCheevd(handle, HIPSOLVER_EIG_MODE_NOVECTOR, HIPSOLVER_FILL_MODE_UPPER, &
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
end program hipsolver_cheevd
