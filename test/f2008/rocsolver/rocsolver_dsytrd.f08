!!!!!!!!!!!!!!
! dsytrd example (rocSOLVER)
! see: https:!rocm.docs.amd.com/projects/rocSOLVER/en/latest/reference/lapack.html
!
! Reduces a real symmetric matrix A to symmetric tridiagonal form
! (A = Q T Q**T). This test passes A, D, E and tau as native Fortran device
! arrays; tau (the Householder scalar factors, dimension n-1) used to be
! declared as a scalar, which made this typed-array call impossible.
!!!!!!!!!!!!!!
!
program dsytrd
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocblas
  use hipfort_rocblas_enums
  use hipfort_rocsolver

  implicit none

  integer(c_int), parameter :: n = 4, lda = 4

  ! Symmetric 4x4 matrix (column-major); its trace is 10+11+12+13 = 46.
  real(c_double) :: hA(n,n) = reshape([ &
      10.0d0,  2.0d0,  3.0d0,  6.0d0, &
       2.0d0, 11.0d0,  1.0d0,  0.0d0, &
       3.0d0,  1.0d0, 12.0d0,  2.0d0, &
       6.0d0,  0.0d0,  2.0d0, 13.0d0], [n,n])
  real(c_double) :: hD(n)     = 0.0d0
  real(c_double) :: hE(n-1)   = 0.0d0
  real(c_double) :: htau(n-1) = 0.0d0

  real(c_double), pointer :: dA(:,:)   ! GPU buffer for A
  real(c_double), pointer :: dD(:)     ! GPU buffer for the diagonal D
  real(c_double), pointer :: dE(:)     ! GPU buffer for the off-diagonal E
  real(c_double), pointer :: dtau(:)   ! GPU buffer for the Householder scalars

  type(c_ptr) :: handle ! rocblas_handle

  real(c_double) :: trace_A, error
  real(c_double), parameter :: rtol = 1.0d-9

  write(*,"(a)",advance="no") "-- Running test 'rocsolver_dsytrd' (Fortran 2008 interfaces) - "

  trace_A = hA(1,1) + hA(2,2) + hA(3,3) + hA(4,4)   ! = 46

  call hipCheck(hipMalloc(dA,   source=hA))
  call hipCheck(hipMalloc(dD,   source=hD))
  call hipCheck(hipMalloc(dE,   source=hE))
  call hipCheck(hipMalloc(dtau, source=htau))

  call rocblasCheck(rocblas_create_handle(handle))

  ! A/D/E/tau passed as native Fortran device arrays (resolves to _full_rank).
  call rocsolverCheck(rocsolver_dsytrd(handle, rocblas_fill_lower, n, dA, lda, dD, dE, dtau))

  call hipCheck(hipDeviceSynchronize())
  call hipCheck(hipMemcpy(hD, dD, hipMemcpyDeviceToHost))

  ! The reduction is an orthogonal similarity, so trace(T) = trace(A), i.e.
  ! sum(D) = trace(A). This is convention-independent.
  error = abs(sum(hD) - trace_A) / abs(trace_A)
  if (error > rtol) then
     write(*,*) "FAILED! sum(D) = ", sum(hD), " expected trace(A) = ", trace_A
     call exit(1)
  end if

  call hipCheck(hipFree(dA))
  call hipCheck(hipFree(dD))
  call hipCheck(hipFree(dE))
  call hipCheck(hipFree(dtau))
  call rocblasCheck(rocblas_destroy_handle(handle))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"

end program dsytrd
