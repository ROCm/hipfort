program hip_ztrsv

  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipblas

  implicit none

  integer(kind(HIPBLAS_FILL_MODE_UPPER)), parameter :: uplo   = HIPBLAS_FILL_MODE_LOWER
  integer(kind(HIPBLAS_OP_N)),            parameter :: transA = HIPBLAS_OP_N
  integer(kind(HIPBLAS_DIAG_NON_UNIT)),   parameter :: diag   = HIPBLAS_DIAG_NON_UNIT

  integer, parameter :: m = 512

  complex(kind=8), allocatable, target, dimension(:) :: hA, hx
  complex(kind=8), parameter :: x_exact = (1.d0, 0.d0)

  type(c_ptr) :: dA = c_null_ptr, dx = c_null_ptr
  type(c_ptr) :: handle = c_null_ptr

  integer, parameter :: bytes_per_element = 16 !double-complex (2x double)
  integer(c_size_t) :: NAbytes, Nxbytes

  integer :: i, j
  real(c_double) :: error
  real(c_double), parameter :: error_max = 10*epsilon(error)

  write(*,"(a)",advance="no") "-- Running test 'ZTRSV' (Fortran 2003 interfaces) - "

  call hipblasCheck(hipblasCreate(handle))

  NAbytes = int(m, c_size_t) * int(m, c_size_t) * bytes_per_element
  Nxbytes = int(m, c_size_t) * bytes_per_element

  allocate(hA(m*m), hx(m))

  ! Lower-triangular A with all ones on/below the diagonal; upper part zeroed
  hA(:) = (0.d0, 0.d0)
  do j = 1, m
    do i = j, m
      hA(i + (j-1)*m) = (1.d0, 0.d0)
    end do
  end do
  ! Right-hand side b(i) = i  ->  exact solution x(i) = 1
  do i = 1, m
    hx(i) = cmplx(i, 0., kind=8)
  end do

  ! Allocate device memory
  call hipCheck(hipMalloc(dA, NAbytes))
  call hipCheck(hipMalloc(dx, Nxbytes))

  ! Transfer from host to device
  call hipCheck(hipMemcpy(dA, c_loc(hA(1)), NAbytes, hipMemcpyHostToDevice))
  call hipCheck(hipMemcpy(dx, c_loc(hx(1)), Nxbytes, hipMemcpyHostToDevice))

  ! Solve A * x = b, in place: dx holds b on entry, x on exit
  call hipblasCheck(hipblasZtrsv(handle, uplo, transA, diag, m, dA, m, dx, 1))

  call hipCheck(hipDeviceSynchronize())

  ! Transfer data back to host memory
  call hipCheck(hipMemcpy(c_loc(hx(1)), dx, Nxbytes, hipMemcpyDeviceToHost))

  do i = 1, m
    error = abs((x_exact - hx(i))/x_exact)
    if( error > error_max )then
      write(*,*) "FAILED! Error bigger than max! Error = ", error, " hx(", i, ") = ", hx(i)
      call exit(1)
    end if
  end do

  call hipCheck(hipFree(dA))
  call hipCheck(hipFree(dx))

  call hipblasCheck(hipblasDestroy(handle))

  deallocate(hA, hx)

  write(*,*) "PASSED!"

end program hip_ztrsv
