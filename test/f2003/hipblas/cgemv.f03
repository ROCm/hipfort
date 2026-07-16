program hip_cgemv

  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipblas

  implicit none

  integer(kind(HIPBLAS_OP_N)), parameter :: trans = HIPBLAS_OP_N
  complex(c_float_complex), parameter :: alpha = (1.1, 0.), beta = (0.9, 0.)

  integer, parameter :: m = 512, n = 512

  complex(kind=4), allocatable, target, dimension(:) :: hA, hx, hy
  complex(kind=4) :: y_exact

  type(c_ptr) :: dA = c_null_ptr, dx = c_null_ptr, dy = c_null_ptr
  type(c_ptr) :: handle = c_null_ptr

  integer, parameter :: bytes_per_element = 8 !2x single
  integer(c_size_t) :: NAbytes, Nxbytes, Nybytes

  integer :: i
  real(c_float) :: error
  real(c_float), parameter :: error_max = 10*epsilon(0.0_c_float)

  write(*,"(a)",advance="no") "-- Running test 'CGEMV' (Fortran 2003 interfaces) - "

  call hipblasCheck(hipblasCreate(handle))

  NAbytes = int(m*n, c_size_t) * bytes_per_element
  Nxbytes = int(n,   c_size_t) * bytes_per_element
  Nybytes = int(m,   c_size_t) * bytes_per_element

  allocate(hA(m*n), hx(n), hy(m))

  ! Use these constant matrix/vectors so the exact answer is also a
  ! constant vector and therefore easy to check
  hA(:) = (1., 0.)
  hx(:) = (1., 0.)
  hy(:) = (1., 0.)
  y_exact = alpha * n + beta   ! = (1.1*512 + 0.9, 0.0) = (564.1, 0.0)

  ! Allocate device memory
  call hipCheck(hipMalloc(dA, NAbytes))
  call hipCheck(hipMalloc(dx, Nxbytes))
  call hipCheck(hipMalloc(dy, Nybytes))

  ! Transfer from host to device
  call hipCheck(hipMemcpy(dA, c_loc(hA(1)), NAbytes, hipMemcpyHostToDevice))
  call hipCheck(hipMemcpy(dx, c_loc(hx(1)), Nxbytes, hipMemcpyHostToDevice))
  call hipCheck(hipMemcpy(dy, c_loc(hy(1)), Nybytes, hipMemcpyHostToDevice))

  call hipblasCheck(hipblasCgemv(handle, trans, m, n, alpha, dA, m, dx, 1, beta, dy, 1))

  call hipCheck(hipDeviceSynchronize())

  ! Transfer data back to host memory
  call hipCheck(hipMemcpy(c_loc(hy(1)), dy, Nybytes, hipMemcpyDeviceToHost))

  do i = 1,m
     error = abs((y_exact - hy(i))/y_exact)
     if( error > error_max )then
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

end program hip_cgemv
