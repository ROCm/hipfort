program hipblas_cgemv_test
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipblas

  implicit none

  complex(kind=4), parameter :: alpha = (1.1, 0.0), beta = (0.9, 0.0)
  integer, parameter :: m = 512, n = 512

  complex(kind=4), allocatable, target, dimension(:) :: hA, hx, hy
  complex(kind=4), pointer, dimension(:,:) :: dA
  complex(kind=4), pointer, dimension(:)   :: dx, dy
  type(c_ptr) :: handle = c_null_ptr

  complex(kind=4) :: y_exact
  double precision :: error
  double precision, parameter :: error_max = 10*epsilon(error)
  integer :: i

  write(*,"(a)",advance="no") "-- Running test 'CGEMV' (Fortran 2008 interfaces) - "

  call hipblasCheck(hipblasCreate(handle))

  allocate(hA(m*n), hx(n), hy(m))
  hA = (1.0, 0.0);  hx = (1.0, 0.0);  hy = (1.0, 0.0)
  y_exact = alpha * n + beta

  call hipCheck(hipMalloc(dA, source=reshape(hA, [m, n])))
  call hipCheck(hipMalloc(dx, source=hx))
  call hipCheck(hipMalloc(dy, source=hy))

  call hipblasCheck(hipblasCgemv(handle, HIPBLAS_OP_N, m, n, alpha, dA, size(dA,1), dx, 1, beta, dy, 1))
  call hipCheck(hipDeviceSynchronize())
  call hipCheck(hipMemcpy(hy, dy, hipMemcpyDeviceToHost))

  do i = 1, m
    error = abs((y_exact - hy(i)) / y_exact)
    if (error > error_max) then
      write(*,*) "FAILED! Error bigger than max! Error = ", error
      call exit(1)
    end if
  end do

  call hipCheck(hipFree(dA))
  call hipCheck(hipFree(dx))
  call hipCheck(hipFree(dy))
  call hipblasCheck(hipblasDestroy(handle))
  deallocate(hA, hx, hy)
  write(*,*) "PASSED!"

end program hipblas_cgemv_test
