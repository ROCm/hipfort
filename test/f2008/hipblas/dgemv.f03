program hip_dgemv

  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipblas

  implicit none

  integer(kind(HIPBLAS_OP_N)), parameter :: trans = HIPBLAS_OP_N
  double precision, parameter :: alpha = 1.1d0, beta = 0.9d0

  integer, parameter :: m = 1024, n = 1024

  double precision, allocatable, dimension(:,:) :: hA
  double precision, allocatable, dimension(:) :: hx, hy
  double precision :: y_exact

  double precision, pointer, dimension(:,:) :: dA
  double precision, pointer, dimension(:) :: dx, dy
  type(c_ptr) :: handle = c_null_ptr

  integer :: i
  double precision :: error
  double precision, parameter :: error_max = 10*epsilon(error)

  write(*,"(a)",advance="no") "-- Running test 'DGEMV' (Fortran 2008 interfaces) - "

  call hipblasCheck(hipblasCreate(handle))

  allocate(hA(m,n))
  allocate(hx(n))
  allocate(hy(m))

  ! Use these constant matrix/vectors so the exact answer is also a
  ! constant vector and therefore easy to check
  hA(:,:) = 1.d0
  hx(:) = 1.d0
  hy(:) = 1.d0
  y_exact = alpha * n + beta   ! = 1.1*1024 + 0.9 = 1127.3

  ! Allocate device memory
  call hipCheck(hipMalloc(dA,source=hA)) ! implies (blocking) memcpy
  call hipCheck(hipMalloc(dx,source=hx))
  call hipCheck(hipMalloc(dy,source=hy))

  call hipblasCheck(hipblasDgemv(handle, trans, m, n, alpha, dA, size(dA,1), dx, 1, beta, dy, 1))

  call hipCheck(hipDeviceSynchronize())

  ! Transfer data back to host memory
  call hipCheck(hipMemcpy(hy, dy, hipMemcpyDeviceToHost))

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
