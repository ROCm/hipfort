program hip_icamax
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipblas
  use hipfort_hipblas_enums

  implicit none

  ! The largest |x| sits at index 5, and hipBLAS returns a 1-based index.
  integer, parameter :: n = 8
  complex(c_float_complex), allocatable, dimension(:) :: hx
  integer(c_int), target :: res
  integer(c_int), parameter :: res_exact = 5
  complex(c_float_complex), pointer, dimension(:) :: dx
  type(c_ptr) :: handle = c_null_ptr

  write(*,"(a)",advance="no") "-- Running test 'icamax' (Fortran 2008 interfaces) - "

  call hipblasCheck(hipblasCreate(handle))

  allocate(hx(n))
  hx = (1.0, 0.0)
  hx(5) = (10.0, 0.0)

  call hipCheck(hipMalloc(dx, shape(hx)))
  call hipCheck(hipMemcpy(dx, hx, hipMemcpyHostToDevice))

  res = 0
  call hipblasCheck(hipblasIcamax(handle, n, dx, 1, c_loc(res)))
  call hipCheck(hipDeviceSynchronize())

  if (res /= res_exact) then
    write(*,*) "FAILED! wrong index: result = ", res, " expected ", res_exact
    call exit(1)
  end if

  call hipCheck(hipFree(dx))
  call hipblasCheck(hipblasDestroy(handle))

  write(*,*) "PASSED!"

end program hip_icamax
