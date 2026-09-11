program hip_dzasum
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipblas
  use hipfort_hipblas_enums

  implicit none

  ! asum(x) with x = 1 over n elements, so the result is n.
  integer, parameter :: n = 1024
  complex(c_double_complex), allocatable, dimension(:) :: hx
  real(c_double), target :: res
  real(c_double) :: res_exact, error
  real(c_double), parameter :: error_max = 10*epsilon(error)
  complex(c_double_complex), pointer, dimension(:) :: dx
  type(c_ptr) :: handle = c_null_ptr

  write(*,"(a)",advance="no") "-- Running test 'dzasum' (Fortran 2008 interfaces) - "

  call hipblasCheck(hipblasCreate(handle))

  allocate(hx(n))
  hx = (1.0, 0.0)
  res_exact = real(n, kind=kind(res_exact))

  call hipCheck(hipMalloc(dx, shape(hx)))
  call hipCheck(hipMemcpy(dx, hx, hipMemcpyHostToDevice))

  res = 0.0
  call hipblasCheck(hipblasDzasum(handle, n, dx, 1, c_loc(res)))
  call hipCheck(hipDeviceSynchronize())

  error = abs((res_exact - res) / res_exact)
  if (error > error_max) then
    write(*,*) "FAILED! error = ", error, " result = ", res
    call exit(1)
  end if

  call hipCheck(hipFree(dx))
  call hipblasCheck(hipblasDestroy(handle))

  write(*,*) "PASSED!"

end program hip_dzasum
  