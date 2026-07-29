program hipfft_r2c_c2r_1d_d
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipfft

  implicit none

  integer(c_int), parameter :: N = 16
  integer(c_int), parameter :: Ncomplex = N/2 + 1

  real(8), allocatable, target, dimension(:) :: hr, hr_input
  complex(8), allocatable, target, dimension(:) :: hc
  real(8), pointer, dimension(:) :: dr => null()
  complex(8), pointer, dimension(:) :: dc => null()
  type(c_ptr) :: plan_fwd = c_null_ptr
  type(c_ptr) :: plan_bwd = c_null_ptr
  integer :: i
  double precision :: error
  double precision, parameter :: error_max = 1.0d-8

  write(*,"(a)",advance="no") "-- Running test 'hipFFT R2C/C2R 1D double (d)' (Fortran 2008 interfaces) - "

  allocate(hr(N))
  allocate(hr_input(N))
  do i = 1, N
     hr(i) = dble(i) + dble(mod(i,3)) - dble(mod(i,7))
  end do
  hr_input(:) = hr(:)

  ! Device buffers: real input of length N, complex output of length N/2+1.
  ! The complex side holds N/2+1 elements due to Hermitian symmetry.
  call hipCheck(hipMalloc(dr, source=hr))
  allocate(hc(Ncomplex))
  call hipCheck(hipMalloc(dc, source=hc))

  ! Forward real-to-complex (out-of-place): dr -> dc.
  call hipfftCheck(hipfftPlan1d(plan_fwd, N, HIPFFT_D2Z, 1))
  call hipfftCheck(hipfftExecD2Z(plan_fwd, dr, dc))
  call hipCheck(hipDeviceSynchronize())
  call hipfftCheck(hipfftDestroy(plan_fwd))

  ! Inverse complex-to-real (out-of-place): dc -> dr. hipFFT unnormalized -> N*input.
  call hipfftCheck(hipfftPlan1d(plan_bwd, N, HIPFFT_Z2D, 1))
  call hipfftCheck(hipfftExecZ2D(plan_bwd, dc, dr))
  call hipCheck(hipDeviceSynchronize())
  call hipfftCheck(hipfftDestroy(plan_bwd))

  call hipCheck(hipMemcpy(hr, dr, hipMemcpyDeviceToHost))
  call hipCheck(hipFree(dr))
  call hipCheck(hipFree(dc))

  ! After forward+inverse the real data should equal N times the original input.
  do i = 1, N
     error = abs(hr(i) - N * hr_input(i))
     if (error > error_max * N) then
        write(*,*) "FAILED! i=", i, " error=", error, " got=", hr(i), " expected=", N * hr_input(i)
        STOP 1
     end if
  end do

  deallocate(hr)
  deallocate(hr_input)
  deallocate(hc)

  write(*,*) "PASSED!"

end program hipfft_r2c_c2r_1d_d
