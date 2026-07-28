program hip_zdotu
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipblas

  implicit none

  integer, parameter :: n = 10240
  complex(kind=8), allocatable, dimension(:) :: hx, hy
  complex(kind=8), pointer, dimension(:) :: dx, dy
  complex(kind=8), target :: res
  complex(kind=8) :: res_exact
  double precision :: error
  double precision, parameter :: error_max = 10*epsilon(error)
  type(c_ptr) :: handle = c_null_ptr

  write(*,"(a)",advance="no") "-- Running test 'ZDOTU' (Fortran 2008 interfaces) - "

  call hipblasCheck(hipblasCreate(handle))

  allocate(hx(n), hy(n))
  hx = (1.d0, 1.d0)
  hy = (2.d0, 0.d0)
  res_exact = cmplx(2.d0*n, 2.d0*n, kind=8)

  call hipCheck(hipMalloc(dx, shape(hx)))
  call hipCheck(hipMalloc(dy, shape(hy)))
  call hipCheck(hipMemcpy(dx, hx, hipMemcpyHostToDevice))
  call hipCheck(hipMemcpy(dy, hy, hipMemcpyHostToDevice))

  res = (0.d0, 0.d0)
  call hipblasCheck(hipblasZdotu(handle, n, dx, 1, dy, 1, c_loc(res)))
  call hipCheck(hipDeviceSynchronize())

  error = abs((res_exact - res) / res_exact)
  if (error > error_max) then
    write(*,*) "FAILED! error = ", error, " result = ", res
    call exit(1)
  end if

  call hipCheck(hipFree(dx))
  call hipCheck(hipFree(dy))
  call hipblasCheck(hipblasDestroy(handle))
  deallocate(hx, hy)
  write(*,*) "PASSED!"

end program hip_zdotu
