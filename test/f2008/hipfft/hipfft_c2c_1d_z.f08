program hipfft_c2c_1d_z
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipfft

  implicit none

  integer(c_int), parameter :: N = 16

  complex(8), allocatable, target, dimension(:) :: hx, hx_input
  complex(8), pointer, dimension(:) :: dx => null()
  type(c_ptr) :: plan = c_null_ptr
  integer(c_int) :: direction
  integer :: i
  double precision :: error
  double precision, parameter :: error_max = 1.0d-8

  write(*,"(a)",advance="no") "-- Running test 'hipFFT C2C 1D double (z)' (Fortran 2008 interfaces) - "

  allocate(hx(N))
  allocate(hx_input(N))
  do i = 1, N
     hx(i) = cmplx(dble(i), dble(N - i), kind=8)
  end do
  hx_input(:) = hx(:)

  call hipCheck(hipMalloc(dx, source=hx))

  ! A single hipFFT plan serves both directions: unlike rocFFT, the direction is
  ! an argument of hipfftExecZ2Z rather than a property of the plan.
  call hipfftCheck(hipfftPlan1d(plan, N, HIPFFT_Z2Z, 1))

  direction = HIPFFT_FORWARD
  call hipfftCheck(hipfftExecZ2Z(plan, dx, dx, direction))
  call hipCheck(hipDeviceSynchronize())

  direction = HIPFFT_BACKWARD
  call hipfftCheck(hipfftExecZ2Z(plan, dx, dx, direction))
  call hipCheck(hipDeviceSynchronize())

  call hipfftCheck(hipfftDestroy(plan))

  call hipCheck(hipMemcpy(hx, dx, hipMemcpyDeviceToHost))
  call hipCheck(hipFree(dx))

  ! hipFFT is unnormalized, so forward+inverse yields N times the original input.
  do i = 1, N
     error = abs(hx(i) - N * hx_input(i))
     if (error > error_max * N) then
        write(*,*) "FAILED! i=", i, " error=", error, " got=", hx(i), " expected=", N * hx_input(i)
        STOP 1
     end if
  end do

  deallocate(hx)
  deallocate(hx_input)

  write(*,*) "PASSED!"

end program hipfft_c2c_1d_z
