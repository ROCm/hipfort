!!!!!!!!!!!!!/
! dsterf example
!!!!!!!!!!!!!!/
!
program dsterf
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocblas
  use hipfort_rocsolver

  implicit none
  integer :: i ! index for iterating over results

  ! Define our input data
  real(c_double) :: hD(3) = (/ 2, 2, 2 /)
  real(c_double) :: hE(2) = (/ -1, -1 /)
  real(c_double) :: hResult(3) = (/ 0.58578643762690495, 2.0000000000000000, 3.4142135627309505 /)
  integer(c_int) :: hInfo = -1

  integer(c_int), parameter :: n = 3

  real(c_double), pointer :: dD(:)   ! GPU buffer for D
  real(c_double), pointer :: dE(:)   ! GPU buffer for E
  integer(c_int), pointer :: dInfo   ! GPU buffer for myInfo

  type(c_ptr) :: handle ! rocblas_handle

  real :: error
  real, parameter :: error_max = 10 * epsilon(error_max)
  !
  write(*,"(a)",advance="no") "-- Running test 'rocsolver_dsterf' (Fortran 2008 interfaces) - "

  ! Allocate device-side memory & copy memory from host to device
  call hipCheck(hipMalloc(dD, source=hD))
  call hipCheck(hipMalloc(dE, source=hE))
  call hipCheck(hipMalloc(dInfo))

  ! Create rocBLAS handle
  call hipCheck(rocblas_create_handle(handle))

  ! Compute eigenvalues.
  ! `dInfo` is passed as a device pointer (c_loc), which is what the
  ! myInfo -> c_ptr binding fix enables.
  call hipCheck(rocsolver_dsterf(handle, n, dD, dE, c_loc(dInfo)))

  ! Copy result from device to host
  call hipCheck(hipMemcpy(hD,    dD,    hipMemcpyDeviceToHost))
  call hipCheck(hipMemcpy(hInfo, dInfo, hipMemcpyDeviceToHost))

  ! Check and output results
  if(hInfo .gt. 0) then
    write(*,*) "FAILED! ", n, " elements of E did not converge to 0."
    call exit(1)
  else
    do i = 1,n
      error = abs(hD(i) - hResult(i))
        if(error .gt. error_max) then
            write(*,*) "FAILED! Error bigger than max! Error = ", error, " hD(", i, ") = ", hD(i)
            call exit(1)
        end if
    end do
  end if

  ! Clean up
  call hipCheck(hipFree(dD))
  call hipCheck(hipFree(dE))
  call hipCheck(hipFree(dInfo))
  call hipCheck(rocblas_destroy_handle(handle))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"
  write(*,*) "Eigenvalues in increasing order:"
  do i = 1,n
    write(*,*) hD(i)
  end do

end program dsterf
