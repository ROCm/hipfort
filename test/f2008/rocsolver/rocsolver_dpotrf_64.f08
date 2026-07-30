!!!!!!!!!!!!!!
! dpotrf_64 example (Cholesky with the 64-bit integer API)
! Same result as dpotrf; n/lda/info are 64-bit. Device buffers are passed as
! type(c_ptr) (the _64 routines have no native-array overloads). info lives on
! the DEVICE. With rocblas_fill_upper the factor is written to the upper
! triangle; the lower triangle keeps the input values.
!!!!!!!!!!!!!!
!
program dpotrf_64
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocblas
  use hipfort_rocblas_enums
  use hipfort_rocsolver
  implicit none
  integer(c_int64_t), parameter :: N = 3, lda = 3
  real(c_double), target :: hA(3,3) = reshape((/4, 12, -16, 12, 37, -43, -16, -43, 98/), (/3, 3/))
  real(c_double), target :: hResult(3,3) = reshape((/&
     2.0000000000000000d0, 12.0000000000000000d0, -16.0000000000000000d0, &
     6.0000000000000000d0,  1.0000000000000000d0, -43.0000000000000000d0, &
    -8.0000000000000000d0,  5.0000000000000000d0,   3.0000000000000000d0/), (/3, 3/))
  integer(c_size_t) :: size_A = 9
  type(c_ptr) :: dA, dInfo, handle
  integer :: i, j
  real(c_double) :: error
  real(c_double), parameter :: error_max = 10 * epsilon(error_max)
  write(*,"(a)",advance="no") "-- Running test 'rocsolver_dpotrf_64' (Fortran 2008 interfaces) - "
  call hipCheck(hipMalloc(dA,    size_A * 8))
  call hipCheck(hipMalloc(dInfo, 8_c_size_t))   ! int64 info
  call hipCheck(rocblas_create_handle(handle))
  call hipCheck(hipMemcpy(dA, c_loc(hA(1,1)), size_A * 8, hipMemcpyHostToDevice))
  call hipCheck(rocsolver_dpotrf_64(handle, rocblas_fill_upper, N, dA, lda, dInfo))
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
  call hipCheck(hipFree(dA)); call hipCheck(hipFree(dInfo))
  call hipCheck(rocblas_destroy_handle(handle)); call hipCheck(hipDeviceReset())
  write(*,*) "PASSED!"
end program dpotrf_64
