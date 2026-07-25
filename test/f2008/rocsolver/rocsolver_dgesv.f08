!!!!!!!!!!!!!/
! dgesv example (double-precision general linear solver, A*X = B)
! Solves A*X = B by LU factorization with partial pivoting; X overwrites B.
!
! NOTE: rocSOLVER writes the `info` output to DEVICE memory. The hipfort
! binding types the info argument as a device pointer (type(c_ptr)), so it
! must be backed by a device allocation (dInfo below) and passed as
! c_loc(dInfo); passing a host scalar faults on the GPU.
!!!!!!!!!!!!!!/
!
program dgesv
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocblas
  use hipfort_rocsolver

  implicit none
  integer :: i

  ! A (column-major) and right-hand side B chosen so the solution is X = [1,1,1].
  real(c_double) :: hA(3,3) = reshape((/2, 1, 0,  1, 2, 1,  0, 1, 2/), (/3, 3/))
  real(c_double) :: hB(3,1) = reshape((/3, 4, 3/), (/3, 1/))
  real(c_double) :: hX_ref(3) = (/1, 1, 1/)
  integer(c_int), parameter :: N = 3
  integer(c_int), parameter :: nrhs = 1
  integer(c_int), parameter :: lda = 3
  integer(c_int), parameter :: ldb = 3

  real(c_double), pointer :: dA(:,:)   ! GPU buffer for A
  real(c_double), pointer :: dB(:,:)   ! GPU buffer for B (holds X on output)
  integer(c_int), pointer :: dIpiv(:)  ! GPU buffer for pivots
  integer(c_int), pointer :: dInfo(:)  ! GPU buffer for info (rocSOLVER writes to device)

  type(c_ptr) :: handle ! rocblas_handle

  real(c_double) :: error
  real(c_double), parameter :: error_max = 100 * epsilon(error_max)
  !
  write(*,"(a)",advance="no") "-- Running test 'rocsolver_dgesv' (Fortran 2008 interfaces) - "

  ! Allocate device-side memory & copy memory from host to device
  call hipCheck(hipMalloc(dA,    source=hA))
  call hipCheck(hipMalloc(dB,    source=hB))
  call hipCheck(hipMalloc(dIpiv, N))
  call hipCheck(hipMalloc(dInfo, 1))

  ! Create rocBLAS handle
  call hipCheck(rocblas_create_handle(handle))

  ! Solve A*X = B on the device (X overwrites B)
  call hipCheck(rocsolver_dgesv(handle, N, nrhs, dA, lda, dIpiv, dB, ldb, c_loc(dInfo)))

  ! Copy the solution back to the host
  call hipCheck(hipMemcpy(hB, dB, hipMemcpyDeviceToHost))

  ! Check the solution
  do i = 1,3
    error = abs(hB(i,1) - hX_ref(i)) / max(abs(hX_ref(i)), 1.0_c_double)
    if(error .gt. error_max) then
        write(*,*) "FAILED! Error bigger than max! Error = ", error, " hB(", i, ",1) = ", hB(i,1)
        call exit
    end if
  end do

  ! Clean up
  call hipCheck(hipFree(dA))
  call hipCheck(hipFree(dB))
  call hipCheck(hipFree(dIpiv))
  call hipCheck(hipFree(dInfo))
  call hipCheck(rocblas_destroy_handle(handle))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"

end program dgesv
