!!!!!!!!!!!!!!
! dposv example (rocSOLVER)
! see: https:!rocm.docs.amd.com/projects/rocSOLVER/en/latest/reference/lapack.html
!
! Solves the symmetric positive-definite system A*X = B (X overwrites B).
! rocSOLVER writes `info` to DEVICE memory, so it is backed by a device
! allocation and passed as c_loc(dInfo).
!!!!!!!!!!!!!!
!
program dposv
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocblas
  use hipfort_rocblas_enums
  use hipfort_rocsolver

  implicit none

  integer(c_int), parameter :: n = 3, nrhs = 1, lda = 3, ldb = 3

  ! SPD matrix A (column-major) and RHS B chosen so the solution is X = [1,1,1].
  real(c_double) :: hA(n,n) = reshape([ &
      2.0d0, 1.0d0, 0.0d0, &
      1.0d0, 2.0d0, 1.0d0, &
      0.0d0, 1.0d0, 2.0d0], [n,n])
  real(c_double) :: hB(n,nrhs) = reshape([3.0d0, 4.0d0, 3.0d0], [n,nrhs])
  real(c_double) :: hX_ref(n) = [1.0d0, 1.0d0, 1.0d0]

  real(c_double), pointer :: dA(:,:)   ! GPU buffer for A
  real(c_double), pointer :: dB(:,:)   ! GPU buffer for B (holds X on output)
  integer(c_int), pointer :: dInfo(:)  ! GPU buffer for info

  type(c_ptr) :: handle ! rocblas_handle

  integer :: i
  real(c_double) :: error
  real(c_double), parameter :: error_max = 100 * epsilon(error_max)

  write(*,"(a)",advance="no") "-- Running test 'rocsolver_dposv' (Fortran 2008 interfaces) - "

  call hipCheck(hipMalloc(dA,    source=hA))
  call hipCheck(hipMalloc(dB,    source=hB))
  call hipCheck(hipMalloc(dInfo, 1))

  call rocblasCheck(rocblas_create_handle(handle))

  ! A/B passed as native Fortran device arrays; info as a device pointer.
  call rocsolverCheck(rocsolver_dposv(handle, rocblas_fill_upper, n, nrhs, dA, lda, dB, ldb, &
                                      c_loc(dInfo)))

  call hipCheck(hipDeviceSynchronize())
  call hipCheck(hipMemcpy(hB, dB, hipMemcpyDeviceToHost))

  do i = 1, n
     error = abs(hB(i,1) - hX_ref(i)) / max(abs(hX_ref(i)), 1.0d0)
     if (error > error_max) then
        write(*,*) "FAILED! X(", i, ") = ", hB(i,1), " expected ", hX_ref(i)
        call exit(1)
     end if
  end do

  call hipCheck(hipFree(dA))
  call hipCheck(hipFree(dB))
  call hipCheck(hipFree(dInfo))
  call rocblasCheck(rocblas_destroy_handle(handle))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"

end program dposv
