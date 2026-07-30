!!!!!!!!!!!!!!
! dgetf2_64 example (unblocked LU with the 64-bit integer API)
! Same result as dgetrf; dimensions, pivots and info are 64-bit. The device
! buffers (including int64 ipiv/info) are passed as type(c_ptr) - the _64
! routines have no native-array overloads. info lives on the DEVICE.
!!!!!!!!!!!!!!
!
program dgetf2_64
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocblas
  use hipfort_rocsolver
  implicit none
  integer(c_int64_t), parameter :: M = 3, N = 3, lda = 3
  real(c_double), target :: hA(3,3) = reshape((/12, 6, -4, -51, 167, 24, 4, -68, -41/), (/3, 3/))
  real(c_double), target :: hResult(3,3) = reshape((/&
    12.0000000000000000d0,   0.500000000000000000d0,  -0.333333333333333315d0,&
   -51.0000000000000000d0, 192.500000000000000d0,      0.363636363636363688d-01,&
     4.00000000000000000d0, -70.0000000000000000d0,   -37.1212121212121176d0/), shape(hResult), order=(/2,1/))
  integer(c_size_t) :: size_A = 9
  type(c_ptr) :: dA, dIpiv, dInfo, handle
  integer :: i, j
  real(c_double) :: error
  real(c_double), parameter :: error_max = 10 * epsilon(error_max)
  write(*,"(a)",advance="no") "-- Running test 'rocsolver_dgetf2_64' (Fortran 2008 interfaces) - "
  call hipCheck(hipMalloc(dA,    size_A * 8))
  call hipCheck(hipMalloc(dIpiv, 3_c_size_t * 8))   ! int64 pivots
  call hipCheck(hipMalloc(dInfo, 8_c_size_t))       ! int64 info
  call hipCheck(rocblas_create_handle(handle))
  call hipCheck(hipMemcpy(dA, c_loc(hA(1,1)), size_A * 8, hipMemcpyHostToDevice))
  call hipCheck(rocsolver_dgetf2_64(handle, M, N, dA, lda, dIpiv, dInfo))
  call hipCheck(hipMemcpy(c_loc(hA(1,1)), dA, size_A * 8, hipMemcpyDeviceToHost))
  do j = 1, 3
     do i = 1, 3
        error = abs(hA(i,j) - hResult(i,j)) / max(abs(hResult(i,j)), 1.0_c_double)
        if (error > error_max) then
           write(*,*) "FAILED! hA(", i, ",", j, ") = ", hA(i,j)
           call exit(1)
        end if
     end do
  end do
  call hipCheck(hipFree(dA)); call hipCheck(hipFree(dIpiv)); call hipCheck(hipFree(dInfo))
  call hipCheck(rocblas_destroy_handle(handle)); call hipCheck(hipDeviceReset())
  write(*,*) "PASSED!"
end program dgetf2_64
