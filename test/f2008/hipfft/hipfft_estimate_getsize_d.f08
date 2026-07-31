program hipfft_estimate_getsize_d
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipfft

  implicit none

  ! hipfftEstimate1d/2d/3d vs hipfftGetSize1d/2d/3d vs hipfftGetSize.
  ! Estimate is a pre-plan heuristic upper bound; GetSize* is accurate.
  ! (Fortran 2008 interfaces)

  ! Sizes for the three dimension tests.
  integer(c_int), parameter :: N1 = 32, Nx2 = 8, Ny2 = 4
  integer(c_int), parameter :: Nx3 = 4, Ny3 = 4, Nz3 = 2

  ! D2Z real input / complex output for the functional transform check.
  integer(c_int), parameter :: Ncomplex = N1 / 2 + 1

  double precision, parameter :: tol = 1.0d-8

  real(8), allocatable, target, dimension(:) :: hr
  complex(8), allocatable, target, dimension(:) :: hc
  real(8), pointer, dimension(:) :: dr => null()
  complex(8), pointer, dimension(:) :: dc => null()
  type(c_ptr) :: plan = c_null_ptr
  integer(c_size_t) :: estSz, mkSz, gsSz
  integer :: i
  double precision :: dc_sum, dc_expected

  write(*,"(a)",advance="no") &
    "-- Running test 'hipFFT Estimate/GetSize double (d)' (Fortran 2008 interfaces) - "

  ! -----------------------------------------------------------------------
  ! 1-D: HIPFFT_D2Z, N=32, batch=1
  ! -----------------------------------------------------------------------
  call hipfftCheck(hipfftEstimate1d(N1, HIPFFT_D2Z, 1, estSz))

  call hipfftCheck(hipfftCreate(plan))
  ! hipfftGetSize needs a made plan; hipfftGetSize1d does not configure the handle.
  call hipfftCheck(hipfftMakePlan1d(plan, N1, HIPFFT_D2Z, 1, mkSz))
  call hipfftCheck(hipfftGetSize1d(plan, N1, HIPFFT_D2Z, 1, gsSz))
  call hipfftCheck(hipfftGetSize(plan, mkSz))
  call hipfftCheck(hipfftDestroy(plan))

  ! Estimate is an upper bound; strict equality is never guaranteed.
  if (estSz < gsSz) then
     write(*,*) "FAILED! 1D: Estimate < GetSize1d:", estSz, "<", gsSz
     STOP 1
  end if

  ! -----------------------------------------------------------------------
  ! 2-D: HIPFFT_Z2Z, Nx=8, Ny=4
  ! -----------------------------------------------------------------------
  call hipfftCheck(hipfftEstimate2d(Nx2, Ny2, HIPFFT_Z2Z, estSz))

  call hipfftCheck(hipfftCreate(plan))
  call hipfftCheck(hipfftMakePlan2d(plan, Nx2, Ny2, HIPFFT_Z2Z, mkSz))
  call hipfftCheck(hipfftGetSize2d(plan, Nx2, Ny2, HIPFFT_Z2Z, gsSz))
  call hipfftCheck(hipfftGetSize(plan, mkSz))
  call hipfftCheck(hipfftDestroy(plan))

  if (estSz < gsSz) then
     write(*,*) "FAILED! 2D: Estimate < GetSize2d:", estSz, "<", gsSz
     STOP 1
  end if

  ! -----------------------------------------------------------------------
  ! 3-D: HIPFFT_Z2Z, Nx=4, Ny=4, Nz=2
  ! -----------------------------------------------------------------------
  call hipfftCheck(hipfftEstimate3d(Nx3, Ny3, Nz3, HIPFFT_Z2Z, estSz))

  call hipfftCheck(hipfftCreate(plan))
  call hipfftCheck(hipfftMakePlan3d(plan, Nx3, Ny3, Nz3, HIPFFT_Z2Z, mkSz))
  call hipfftCheck(hipfftGetSize3d(plan, Nx3, Ny3, Nz3, HIPFFT_Z2Z, gsSz))
  call hipfftCheck(hipfftGetSize(plan, mkSz))
  call hipfftCheck(hipfftDestroy(plan))

  if (estSz < gsSz) then
     write(*,*) "FAILED! 3D: Estimate < GetSize3d:", estSz, "<", gsSz
     STOP 1
  end if

  ! -----------------------------------------------------------------------
  ! Functional check: 1-D D2Z, N=32. DC bin must equal sum(input).
  ! -----------------------------------------------------------------------
  allocate(hr(N1))
  allocate(hc(Ncomplex))

  do i = 1, N1
     hr(i) = dble(i) + dble(mod(i, 5)) * 0.5d0
  end do

  dc_expected = sum(hr)

  call hipCheck(hipMalloc(dr, source=hr))
  call hipCheck(hipMalloc(dc, source=hc))

  call hipfftCheck(hipfftPlan1d(plan, N1, HIPFFT_D2Z, 1))
  call hipfftCheck(hipfftExecD2Z(plan, dr, dc))
  call hipCheck(hipDeviceSynchronize())
  call hipfftCheck(hipfftDestroy(plan))

  call hipCheck(hipMemcpy(hc, dc, hipMemcpyDeviceToHost))
  call hipCheck(hipFree(dr))
  call hipCheck(hipFree(dc))

  ! DC bin (Fortran index 1) = sum of all input values.
  dc_sum = dble(real(hc(1), kind=8))
  if (abs(dc_sum - dc_expected) > tol * N1 * abs(dc_expected)) then
     write(*,*) "FAILED! DC bin =", dc_sum, " expected =", dc_expected
     STOP 1
  end if
  if (abs(aimag(hc(1))) > tol * N1 * abs(dc_expected)) then
     write(*,*) "FAILED! DC imaginary part non-zero:", aimag(hc(1))
     STOP 1
  end if

  deallocate(hr)
  deallocate(hc)

  write(*,*) "PASSED!"

end program hipfft_estimate_getsize_d
