program hip_dtrsv

  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipblas

  implicit none

  integer(kind(HIPBLAS_FILL_MODE_UPPER)), parameter :: uplo   = HIPBLAS_FILL_MODE_LOWER
  integer(kind(HIPBLAS_OP_N)),            parameter :: transA = HIPBLAS_OP_N
  integer(kind(HIPBLAS_DIAG_NON_UNIT)),   parameter :: diag   = HIPBLAS_DIAG_NON_UNIT

  integer, parameter :: m = 1024

  double precision, allocatable, dimension(:,:) :: hA
  double precision, allocatable, dimension(:) :: hx
  double precision, parameter :: x_exact = 1.d0

  double precision, pointer, dimension(:,:) :: dA
  double precision, pointer, dimension(:) :: dx
  type(c_ptr) :: handle = c_null_ptr

  integer :: i, j
  double precision :: error
  double precision, parameter :: error_max = 10*epsilon(error)

  write(*,"(a)",advance="no") "-- Running test 'DTRSV' (Fortran 2008 interfaces) - "

  call hipblasCheck(hipblasCreate(handle))

  allocate(hA(m,m), hx(m))

  ! Lower-triangular A with all ones on/below the diagonal; upper part zeroed
  hA(:,:) = 0.d0
  do j = 1, m
    do i = j, m
      hA(i,j) = 1.d0
    end do
  end do
  ! Right-hand side b(i) = i  ->  exact solution x(i) = 1
  do i = 1, m
    hx(i) = dble(i)
  end do

  ! Allocate device memory
  call hipCheck(hipMalloc(dA, source=hA)) ! implies (blocking) memcpy
  call hipCheck(hipMalloc(dx, source=hx))

  ! Solve A * x = b, in place: dx holds b on entry, x on exit
  call hipblasCheck(hipblasDtrsv(handle, uplo, transA, diag, m, dA, size(dA,1), dx, 1))

  call hipCheck(hipDeviceSynchronize())

  ! Transfer data back to host memory
  call hipCheck(hipMemcpy(hx, dx, hipMemcpyDeviceToHost))

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

end program hip_dtrsv
