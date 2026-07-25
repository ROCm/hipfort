!!!!!!!!!!!!!/
! dgetri example (double-precision inverse of a general matrix)
! Computes inv(A) from the LU factorization produced by getrf; inv(A)
! overwrites A.
!
! NOTE: rocSOLVER writes the `info` output to DEVICE memory. The hipfort
! binding types the info argument as a device pointer (type(c_ptr)), so it
! must be backed by a device allocation (dInfo below) and passed as
! c_loc(dInfo); passing a host scalar faults on the GPU.
!!!!!!!!!!!!!!/
!
program dgetri
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocblas
  use hipfort_rocsolver

  implicit none
  integer :: i, j

  ! A (column-major), chosen with det(A) = 1 so inv(A) is integer.
  real(c_double) :: hA(3,3) = reshape((/1, 0, 5,  2, 1, 6,  3, 4, 0/), (/3, 3/))
  ! Reference inverse (column-major)
  real(c_double) :: hResult(3,3) = reshape((/-24, 20, -5,  18, -15, 4,  5, -4, 1/), (/3, 3/))
  integer(c_int), parameter :: N = 3
  integer(c_int), parameter :: lda = 3

  real(c_double), pointer :: dA(:,:)   ! GPU buffer for A (holds inv(A) on output)
  integer(c_int), pointer :: dIpiv(:)  ! GPU buffer for pivots
  integer(c_int), pointer :: dInfo(:)  ! GPU buffer for info (rocSOLVER writes to device)

  type(c_ptr) :: handle ! rocblas_handle

  real(c_double) :: error
  real(c_double), parameter :: error_max = 100 * epsilon(error_max)
  !
  write(*,"(a)",advance="no") "-- Running test 'rocsolver_dgetri' (Fortran 2008 interfaces) - "

  ! Allocate device-side memory & copy memory from host to device
  call hipCheck(hipMalloc(dA,    source=hA))
  call hipCheck(hipMalloc(dIpiv, N))
  call hipCheck(hipMalloc(dInfo, 1))

  ! Create rocBLAS handle
  call hipCheck(rocblas_create_handle(handle))

  ! LU factorization, then invert in place
  call hipCheck(rocsolver_dgetrf(handle, N, N, dA, lda, dIpiv, c_loc(dInfo)))
  call hipCheck(rocsolver_dgetri(handle, N,    dA, lda, dIpiv, c_loc(dInfo)))

  ! Copy the inverse back to the host
  call hipCheck(hipMemcpy(hA, dA, hipMemcpyDeviceToHost))

  ! Check the inverse
  do j = 1,3
    do i = 1,3
        error = abs(hA(i,j) - hResult(i,j)) / max(abs(hResult(i,j)), 1.0_c_double)
        if(error .gt. error_max) then
            write(*,*) "FAILED! Error bigger than max! Error = ", error, " hA(", i, ",", j, ") = ", hA(i,j)
            call exit
        end if
    end do
  end do

  ! Clean up
  call hipCheck(hipFree(dA))
  call hipCheck(hipFree(dIpiv))
  call hipCheck(hipFree(dInfo))
  call hipCheck(rocblas_destroy_handle(handle))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"

end program dgetri
