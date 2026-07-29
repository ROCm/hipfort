! Fortran counterpart of the out-of-place path of the rocFFT sample
! clients/samples/rocfft/rocfft_example_complexcomplex.cpp (--outofplace).
program rocfft_c2c_1d_notinplace_z
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocfft

  implicit none

  integer(c_size_t), parameter :: N = 16

  complex(8), allocatable, target, dimension(:) :: hx, hx_input
  complex(8), pointer, dimension(:) :: dx => null()   ! device input
  complex(8), pointer, dimension(:) :: dy => null()   ! device output
  type(c_ptr) :: plan_fwd = c_null_ptr
  type(c_ptr) :: plan_bwd = c_null_ptr
  integer(c_size_t), allocatable, target, dimension(:) :: lengths
  integer(c_size_t), parameter :: one = 1
  integer :: i
  double precision :: error
  double precision, parameter :: error_max = 1.0d-8

  allocate(lengths(1))
  lengths(1) = N

  allocate(hx(N))
  allocate(hx_input(N))
  do i = 1, N
     hx(i) = cmplx(dble(i), dble(N - i), kind=8)
  end do
  hx_input(:) = hx(:)

  ! Out-of-place transforms need a separate output buffer of the same size.
  call hipCheck(hipMalloc(dx, source=hx))
  call hipCheck(hipMalloc(dy, N))

  write(*,"(a)",advance="no") "-- Running test 'rocFFT C2C 1D out-of-place double (z)' &
                              &(Fortran 2008 interfaces) - "

  call rocfftCheck(rocfft_setup())

  ! Forward transform, out-of-place: dx -> dy.
  call rocfftCheck(rocfft_plan_create(plan_fwd,&
                                      rocfft_placement_notinplace,&
                                      rocfft_transform_type_complex_forward,&
                                      rocfft_precision_double,&
                                      one,&
                                      c_loc(lengths),&
                                      one,&
                                      c_null_ptr))
  call rocfftCheck(rocfft_execute(plan_fwd, c_loc(dx), c_loc(dy), c_null_ptr))
  call hipCheck(hipDeviceSynchronize())
  call rocfftCheck(rocfft_plan_destroy(plan_fwd))

  ! Inverse transform, out-of-place: dy -> dx. rocFFT is unnormalized, so the
  ! round trip yields N*input. Note that rocFFT may overwrite the input buffer
  ! of an out-of-place transform, so dy must be treated as clobbered afterwards.
  call rocfftCheck(rocfft_plan_create(plan_bwd,&
                                      rocfft_placement_notinplace,&
                                      rocfft_transform_type_complex_inverse,&
                                      rocfft_precision_double,&
                                      one,&
                                      c_loc(lengths),&
                                      one,&
                                      c_null_ptr))
  call rocfftCheck(rocfft_execute(plan_bwd, c_loc(dy), c_loc(dx), c_null_ptr))
  call hipCheck(hipDeviceSynchronize())
  call rocfftCheck(rocfft_plan_destroy(plan_bwd))

  call hipCheck(hipMemcpy(hx, dx, hipMemcpyDeviceToHost))
  call hipCheck(hipFree(dx))
  call hipCheck(hipFree(dy))

  do i = 1, N
     error = abs(hx(i) - N * hx_input(i))
     if (error > error_max * N) then
        write(*,*) "FAILED! i=", i, " error=", error, " got=", hx(i), &
                   " expected=", N * hx_input(i)
        call rocfftCheck(rocfft_cleanup())
        STOP 1
     end if
  end do

  deallocate(hx)
  deallocate(hx_input)
  deallocate(lengths)

  call rocfftCheck(rocfft_cleanup())

  write(*,*) "PASSED!"

end program rocfft_c2c_1d_notinplace_z
