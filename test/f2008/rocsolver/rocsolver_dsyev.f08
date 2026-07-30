!!!!!!!!!!!!!!
! dsyev example (rocSOLVER)
! see: https:!rocm.docs.amd.com/projects/rocSOLVER/en/latest/reference/lapack.html
!
! Computes the eigenvalues of a real symmetric matrix. rocSOLVER writes `info`
! to DEVICE memory, so it is backed by a device allocation and passed as
! c_loc(dInfo).
!!!!!!!!!!!!!!
!
program dsyev
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocblas
  use hipfort_rocblas_enums
  use hipfort_rocsolver
  use hipfort_rocsolver_enums

  implicit none

  integer(c_int), parameter :: n = 4, lda = 4

  ! Symmetric 4x4 matrix (column-major); its trace is 10+11+12+13 = 46.
  real(c_double) :: hA(n,n) = reshape([ &
      10.0d0,  2.0d0,  3.0d0,  6.0d0, &
       2.0d0, 11.0d0,  1.0d0,  0.0d0, &
       3.0d0,  1.0d0, 12.0d0,  2.0d0, &
       6.0d0,  0.0d0,  2.0d0, 13.0d0], [n,n])
  real(c_double) :: hD(n) = 0.0d0   ! eigenvalues
  real(c_double) :: hE(n) = 0.0d0   ! workspace

  real(c_double), pointer :: dA(:,:)   ! GPU buffer for A
  real(c_double), pointer :: dD(:)     ! GPU buffer for the eigenvalues
  real(c_double), pointer :: dE(:)     ! GPU workspace
  integer(c_int), pointer :: dInfo(:)  ! GPU buffer for info

  type(c_ptr) :: handle ! rocblas_handle

  real(c_double) :: trace_A, error
  real(c_double), parameter :: rtol = 1.0d-9

  write(*,"(a)",advance="no") "-- Running test 'rocsolver_dsyev' (Fortran 2008 interfaces) - "

  trace_A = hA(1,1) + hA(2,2) + hA(3,3) + hA(4,4)   ! = 46

  call hipCheck(hipMalloc(dA,    source=hA))
  call hipCheck(hipMalloc(dD,    source=hD))
  call hipCheck(hipMalloc(dE,    source=hE))
  call hipCheck(hipMalloc(dInfo, 1))

  call rocblasCheck(rocblas_create_handle(handle))

  ! Eigenvalues only (rocblas_evect_none); A/D/E as native arrays, info device.
  call rocsolverCheck(rocsolver_dsyev(handle, rocblas_evect_none, rocblas_fill_lower, n, dA, lda, &
                                      dD, dE, c_loc(dInfo)))

  call hipCheck(hipDeviceSynchronize())
  call hipCheck(hipMemcpy(hD, dD, hipMemcpyDeviceToHost))

  ! An orthogonal diagonalization preserves the trace: sum of eigenvalues =
  ! trace(A). This is convention-independent (order of eigenvalues irrelevant).
  error = abs(sum(hD) - trace_A) / abs(trace_A)
  if (error > rtol) then
     write(*,*) "FAILED! sum(eigenvalues) = ", sum(hD), " expected trace(A) = ", trace_A
     call exit(1)
  end if

  call hipCheck(hipFree(dA))
  call hipCheck(hipFree(dD))
  call hipCheck(hipFree(dE))
  call hipCheck(hipFree(dInfo))
  call rocblasCheck(rocblas_destroy_handle(handle))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"

end program dsyev
