program hip_dsyrk
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipblas
  use hipfort_hipblas_enums

  implicit none

  ! C := alpha*A*A**T + beta*C, upper triangle. A = [1 0; 2 3] gives
  ! A*A**T = [1 2; 2 13], so the referenced upper triangle is 1, 2, 13.
  integer, parameter :: ld = 2
  real(c_double), parameter :: alpha = 1.0, beta = 0.0

  real(c_double) :: hA(ld,ld) = reshape([1.0, 2.0, 0.0, 3.0], [ld,ld])
  real(c_double) :: hC(ld,ld)
  real(c_double) :: expected(ld,ld) = reshape([1.0, 0.0, 2.0, 13.0], [ld,ld])
  real(c_double), pointer, dimension(:,:) :: dA, dC
  type(c_ptr) :: handle = c_null_ptr
  integer :: i, j
  real(c_double) :: error
  real(c_double), parameter :: error_max = 10*epsilon(error)

  write(*,"(a)",advance="no") "-- Running test 'dsyrk' (Fortran 2008 interfaces) - "

  call hipblasCheck(hipblasCreate(handle))

  hC = 0.0

  call hipCheck(hipMalloc(dA, shape(hA)))
  call hipCheck(hipMemcpy(dA, hA, hipMemcpyHostToDevice))
  call hipCheck(hipMalloc(dC, shape(hC)))
  call hipCheck(hipMemcpy(dC, hC, hipMemcpyHostToDevice))

  call hipblasCheck(hipblasDsyrk(handle, HIPBLAS_FILL_MODE_UPPER, HIPBLAS_OP_N, ld, ld, &
       alpha, dA, size(dA,1), beta, dC, size(dA,1)))
  call hipCheck(hipDeviceSynchronize())
  call hipCheck(hipMemcpy(hC, dC, hipMemcpyDeviceToHost))

  do j = 1, ld
    do i = 1, j
      error = abs(expected(i,j) - hC(i,j))
      if (error > error_max) then
        write(*,*) "FAILED! error = ", error, " at ", i, j
        call exit(1)
      end if
    end do
  end do

  call hipCheck(hipFree(dA))
  call hipCheck(hipFree(dC))
  call hipblasCheck(hipblasDestroy(handle))

  write(*,*) "PASSED!"

end program hip_dsyrk
