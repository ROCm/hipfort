program hip_daxpy
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipblas

  implicit none

  integer :: n = 6
  type(c_ptr) :: handle = c_null_ptr
  integer :: j
  double precision, allocatable, dimension(:) :: x, y, y_exact

  double precision, parameter :: alpha = 2.0d0
  double precision, pointer, dimension(:) :: dx, dy

  double precision :: error
  double precision, parameter :: error_max = 10*epsilon(error)

  allocate(x(n))
  allocate(y(n))
  allocate(y_exact(n))

  do j = 1, n
    x(j) = j
    y(j) = j
  end do

  do j = 1, n
    y_exact(j) = alpha*x(j) + y(j)
  end do

  write(*,"(a)",advance="no") "-- Running test 'DAXPY' (Fortran 2008 interfaces) - "

  call hipblasCheck(hipblasCreate(handle))

  call hipCheck(hipMalloc(dx, shape(x)))
  call hipCheck(hipMalloc(dy, shape(y)))

  call hipCheck(hipMemcpy(dx, x, hipMemcpyHostToDevice))
  call hipCheck(hipMemcpy(dy, y, hipMemcpyHostToDevice))

  call hipblasCheck(hipblasDaxpy(handle, n, alpha, dx, 1, dy, 1))

  call hipCheck(hipDeviceSynchronize())

  call hipCheck(hipMemcpy(y, dy, hipMemcpyDeviceToHost))

  do j = 1, n
    error = abs((y_exact(j) - y(j))/y_exact(j))
    if (error > error_max) then
      write(*,*) "FAILED! Error bigger than max! Error = ", error
      call exit(1)
    end if
  end do

  call hipCheck(hipFree(dx))
  call hipCheck(hipFree(dy))

  call hipblasCheck(hipblasDestroy(handle))

  deallocate(x, y)

  write(*,*) "PASSED!"

end program hip_daxpy
