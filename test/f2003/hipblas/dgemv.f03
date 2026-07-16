program hip_dgemv

  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipblas

  implicit none

  integer(kind(HIPBLAS_OP_N)), parameter :: trans = HIPBLAS_OP_N
  double precision, parameter :: alpha = 1.1d0, beta = 0.9d0

  integer, parameter :: m = 1024, n = 1024

  double precision, allocatable, target, dimension(:) :: hA, hx, hy
  double precision :: y_exact

  type(c_ptr) :: dA = c_null_ptr, dx = c_null_ptr, dy = c_null_ptr
  type(c_ptr) :: handle = c_null_ptr

  integer, parameter :: bytes_per_element = 8 !double precision
  integer(c_size_t) :: NAbytes, Nxbytes, Nybytes

  integer :: i
  double precision :: error
  double precision, parameter :: error_max = 10*epsilon(error)

  write(*,"(a)",advance="no") "-- Running test 'DGEMV' (Fortran 2003 interfaces) - "

  call hipblasCheck(hipblasCreate(handle))

  NAbytes = int(m*n, c_size_t) * bytes_per_element
  Nxbytes = int(n,   c_size_t) * bytes_per_element
  Nybytes = int(m,   c_size_t) * bytes_per_element

  allocate(hA(m*n), hx(n), hy(m))

  ! Use these constant matrix/vectors so the exact answer is also a
  ! constant vector and therefore easy to check
  hA(:) = 1.d0
  hx(:) = 1.d0
  hy(:) = 1.d0
  y_exact = alpha * n + beta   ! = 1.1*1024 + 0.9 = 1127.3

  ! Allocate device memory
  call hipCheck(hipMalloc(dA, NAbytes))
  call hipCheck(hipMalloc(dx, Nxbytes))
  call hipCheck(hipMalloc(dy, Nybytes))

  ! Transfer from host to device
  call hipCheck(hipMemcpy(dA, c_loc(hA(1)), NAbytes, hipMemcpyHostToDevice))
  call hipCheck(hipMemcpy(dx, c_loc(hx(1)), Nxbytes, hipMemcpyHostToDevice))
  call hipCheck(hipMemcpy(dy, c_loc(hy(1)), Nybytes, hipMemcpyHostToDevice))

  call hipblasCheck(hipblasDgemv(handle, trans, m, n, alpha, dA, m, dx, 1, beta, dy, 1))

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

end program hip_dgemv
