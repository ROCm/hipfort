program hip_zaxpy
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipblas


  implicit none

  integer :: n = 6
  type(c_ptr) :: handle = c_null_ptr
  integer :: j
  complex(kind=8), allocatable, dimension(:) :: x, y, y_exact

  complex(c_double_complex), parameter :: alpha = (2.0d0, 0.d0)
  complex(kind=8), pointer, dimension(:) :: dx, dy

  real(c_double) :: error
  real(c_double), parameter :: error_max = 10*epsilon(error)

  allocate(x(n))
  allocate(y(n))
  allocate(y_exact(n))

  do j = 1,n
    x(j) = cmplx(j, 0, kind=8)
    y(j) = cmplx(j, 0, kind=8)
  end do

  do j = 1,n
    y_exact(j) = alpha*x(j) + y(j)
  end do

  write(*,"(a)",advance="no") "-- Running test 'ZAXPY' (Fortran 2008 interfaces) - "

  call hipblasCheck(hipblasCreate(handle))

  call hipCheck(hipMalloc(dx,shape(x)))
  call hipCheck(hipMalloc(dy,shape(y)))

  call hipCheck(hipMemcpy(dx, x, hipMemcpyHostToDevice))
  call hipCheck(hipMemcpy(dy, y, hipMemcpyHostToDevice))

  call hipblasCheck(hipblasZaxpy(handle,n,alpha,dx,1,dy,1))

  call hipCheck(hipDeviceSynchronize())

  call hipCheck(hipMemcpy(y, dy, hipMemcpyDeviceToHost))

  do j = 1,n
    error = abs((y_exact(j) - y(j))/y_exact(j))
      if( error > error_max )then
        write(*,*) "FAILED! Error bigger than max! Error = ", error
        call exit(1)
      end if
  end do

  call hipCheck(hipFree(dx))
  call hipCheck(hipFree(dy))

  call hipblasCheck(hipblasDestroy(handle))

  deallocate(x,y)

  write(*,*) "PASSED!"

end program hip_zaxpy
