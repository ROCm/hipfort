program hip_ctrsv
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipblas

  implicit none

  integer(kind(HIPBLAS_FILL_MODE_UPPER)), parameter :: uplo   = HIPBLAS_FILL_MODE_LOWER
  integer(kind(HIPBLAS_OP_N)),            parameter :: transA = HIPBLAS_OP_N
  integer(kind(HIPBLAS_DIAG_NON_UNIT)),   parameter :: diag   = HIPBLAS_DIAG_NON_UNIT
  integer, parameter :: m = 512
  complex(kind=4), allocatable, target, dimension(:,:) :: hA
  complex(kind=4), allocatable, target, dimension(:)   :: hx
  complex(kind=4), pointer, dimension(:,:) :: dA
  complex(kind=4), pointer, dimension(:)   :: dx
  type(c_ptr) :: handle = c_null_ptr
  complex(kind=4), parameter :: x_exact = (1., 0.)
  real(kind=4) :: error
  real(kind=4), parameter :: error_max = 10*epsilon(error)
  integer :: i, j

  write(*,"(a)",advance="no") "-- Running test 'CTRSV' (Fortran 2008 interfaces) - "

  call hipblasCheck(hipblasCreate(handle))

  allocate(hA(m,m), hx(m))

  hA = (0., 0.)
  do j = 1, m
    do i = j, m
      hA(i,j) = (1., 0.)
    end do
  end do
  do i = 1, m
    hx(i) = cmplx(i, 0.)
  end do

  call hipCheck(hipMalloc(dA, source=hA))
  call hipCheck(hipMalloc(dx, source=hx))

  call hipblasCheck(hipblasCtrsv(handle, uplo, transA, diag, m, dA, size(dA,1), dx, 1))
  call hipCheck(hipDeviceSynchronize())
  call hipCheck(hipMemcpy(hx, dx, hipMemcpyDeviceToHost))

  do i = 1, m
    error = abs((x_exact - hx(i)) / x_exact)
    if (error > error_max) then
      write(*,*) "FAILED! Error bigger than max! Error = ", error, " hx(", i, ") = ", hx(i)
      call exit(1)
    end if
  end do

  call hipCheck(hipFree(dA))
  call hipCheck(hipFree(dx))
  call hipblasCheck(hipblasDestroy(handle))
  deallocate(hA, hx)
  write(*,*) "PASSED!"

end program hip_ctrsv
