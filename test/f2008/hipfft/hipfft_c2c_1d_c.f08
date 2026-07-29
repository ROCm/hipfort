program hipfft_c2c_1d_c
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipfft

  implicit none

  integer(c_int), parameter :: N = 16

  complex(4), allocatable, target, dimension(:) :: hx, hx_input
  complex(4), pointer, dimension(:) :: dx => null()
  type(c_ptr) :: plan = c_null_ptr
  integer(c_int) :: direction
  integer :: i
  real :: error
  real, parameter :: error_max = 1.0e-4

  write(*,"(a)",advance="no") "-- Running test 'hipFFT C2C 1D single (c)' (Fortran 2008 interfaces) - "

  allocate(hx(N))
  allocate(hx_input(N))
  do i = 1, N
     hx(i) = cmplx(real(i), real(N - i), kind=4)
  end do
  hx_input(:) = hx(:)

  call hipCheck(hipMalloc(dx, source=hx))

  ! A single hipFFT plan covers both directions: the transform direction is
  ! passed to hipfftExecC2C rather than baked into the plan.
  call hipfftCheck(hipfftPlan1d(plan, N, HIPFFT_C2C, 1))

  direction = HIPFFT_FORWARD
  call hipfftCheck(hipfftExecC2C(plan, dx, dx, direction))
  call hipCheck(hipDeviceSynchronize())

  direction = HIPFFT_BACKWARD
  call hipfftCheck(hipfftExecC2C(plan, dx, dx, direction))
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

end program hipfft_c2c_1d_c
