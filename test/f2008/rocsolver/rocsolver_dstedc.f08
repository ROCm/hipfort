!!!!!!!!!!!!!!
! dstedc example (eigenvalues of a symmetric tridiagonal matrix, divide-and-conquer)
! The sum of the eigenvalues equals the trace (sum of the input diagonal D).
! rocSOLVER writes info to DEVICE memory (passed as c_loc(dInfo)).
!!!!!!!!!!!!!!
!
program dstedc
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocblas
  use hipfort_rocblas_enums
  use hipfort_rocsolver
  use hipfort_rocsolver_enums
  implicit none
  integer(c_int), parameter :: N = 4, ldc = 4
  real(c_double) :: hD(N)   = (/2.0d0, 2.0d0, 2.0d0, 2.0d0/)   ! diagonal
  real(c_double) :: hE(N-1) = (/1.0d0, 1.0d0, 1.0d0/)          ! off-diagonal
  real(c_double), pointer :: dD(:), dE(:), dC(:,:)
  integer(c_int), pointer :: dInfo(:)
  type(c_ptr) :: handle
  real(c_double) :: trace, error
  real(c_double), parameter :: rtol = 1.0d-9
  write(*,"(a)",advance="no") "-- Running test 'rocsolver_dstedc' (Fortran 2008 interfaces) - "
  trace = sum(hD)   ! = 8
  call hipCheck(hipMalloc(dD, source=hD))
  call hipCheck(hipMalloc(dE, source=hE))
  call hipCheck(hipMalloc(dC, int(N,c_size_t), int(N,c_size_t)))
  call hipCheck(hipMalloc(dInfo, 1))
  call hipCheck(rocblas_create_handle(handle))
  call hipCheck(rocsolver_dstedc(handle, rocblas_evect_none, N, dD, dE, dC, ldc, c_loc(dInfo)))
  call hipCheck(hipMemcpy(hD, dD, hipMemcpyDeviceToHost))
  error = abs(sum(hD) - trace) / abs(trace)
  if (error > rtol) then
     write(*,*) "FAILED! sum(eigenvalues) = ", sum(hD), " expected trace = ", trace
     call exit(1)
  end if
  call hipCheck(hipFree(dD)); call hipCheck(hipFree(dE)); call hipCheck(hipFree(dC)); call hipCheck(hipFree(dInfo))
  call hipCheck(rocblas_destroy_handle(handle)); call hipCheck(hipDeviceReset())
  write(*,*) "PASSED!"
end program dstedc
