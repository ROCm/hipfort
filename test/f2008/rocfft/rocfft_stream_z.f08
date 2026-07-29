! Fortran counterpart of the rocFFT sample
! clients/samples/rocfft/rocfft_example_set_stream.cpp: two independent in-place
! transforms, each queued on its own HIP stream.
program rocfft_stream_z
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocfft

  implicit none

  integer(c_size_t), parameter :: N = 16
  integer, parameter :: Nfft = 2

  ! One bundle of handles per transform, mirroring the fft_fixture_t struct
  ! used by the rocFFT sample.
  type fft_t
     complex(8), pointer :: buf(:) => null()
     type(c_ptr) :: stream = c_null_ptr
     type(c_ptr) :: info = c_null_ptr
     type(c_ptr) :: plan_fwd = c_null_ptr
     type(c_ptr) :: plan_bwd = c_null_ptr
  end type fft_t

  type(fft_t) :: ffts(Nfft)
  complex(8), allocatable, target, dimension(:,:) :: hx, hx_input
  integer(c_size_t), allocatable, target, dimension(:) :: lengths
  integer(c_size_t), parameter :: one = 1
  integer(c_size_t) :: work_size
  integer :: i, k
  double precision :: error
  double precision, parameter :: error_max = 1.0d-8

  allocate(lengths(1))
  lengths(1) = N

  allocate(hx(N,Nfft))
  allocate(hx_input(N,Nfft))
  do k = 1, Nfft
     do i = 1, N
        hx(i,k) = cmplx(dble(i*k), dble(N - i), kind=8)
     end do
  end do
  hx_input(:,:) = hx(:,:)

  write(*,"(a)",advance="no") "-- Running test 'rocFFT stream double (z)' &
                              &(Fortran 2008 interfaces) - "

  call rocfftCheck(rocfft_setup())

  ! Preparation: one buffer, one stream, one execution info and two plans per
  ! transform. The stream is carried by the execution info handle, which is
  ! then passed to every rocfft_execute call that should use that stream.
  do k = 1, Nfft
     call hipCheck(hipMalloc(ffts(k)%buf, N))
     call hipCheck(hipMemcpy(ffts(k)%buf, hx(:,k), hipMemcpyHostToDevice))

     call hipCheck(hipStreamCreate(ffts(k)%stream))
     call rocfftCheck(rocfft_execution_info_create(ffts(k)%info))
     ! The stream must be a hipStream_t value, not the address of one.
     call rocfftCheck(rocfft_execution_info_set_stream(ffts(k)%info, ffts(k)%stream))

     call rocfftCheck(rocfft_plan_create(ffts(k)%plan_fwd,&
                                         rocfft_placement_inplace,&
                                         rocfft_transform_type_complex_forward,&
                                         rocfft_precision_double,&
                                         one,&
                                         c_loc(lengths),&
                                         one,&
                                         c_null_ptr))
     call rocfftCheck(rocfft_plan_create(ffts(k)%plan_bwd,&
                                         rocfft_placement_inplace,&
                                         rocfft_transform_type_complex_inverse,&
                                         rocfft_precision_double,&
                                         one,&
                                         c_loc(lengths),&
                                         one,&
                                         c_null_ptr))

     ! A simple 1D in-place transform needs no extra work buffer.
     call rocfftCheck(rocfft_plan_get_work_buffer_size(ffts(k)%plan_fwd, work_size))
     if (work_size /= 0) then
        write(*,*) "FAILED! unexpected work buffer size ", work_size
        STOP 1
     end if
  end do

  ! Execution: the calls return as soon as the work is queued on the streams,
  ! so the two transforms can overlap.
  do k = 1, Nfft
     call rocfftCheck(rocfft_execute(ffts(k)%plan_fwd, c_loc(ffts(k)%buf), &
                                     c_null_ptr, ffts(k)%info))
     call rocfftCheck(rocfft_execute(ffts(k)%plan_bwd, c_loc(ffts(k)%buf), &
                                     c_null_ptr, ffts(k)%info))
  end do

  ! Wait for each stream before reading its results back.
  do k = 1, Nfft
     call hipCheck(hipStreamSynchronize(ffts(k)%stream))
     call hipCheck(hipMemcpy(hx(:,k), ffts(k)%buf, hipMemcpyDeviceToHost))
  end do

  do k = 1, Nfft
     call rocfftCheck(rocfft_plan_destroy(ffts(k)%plan_fwd))
     call rocfftCheck(rocfft_plan_destroy(ffts(k)%plan_bwd))
     call rocfftCheck(rocfft_execution_info_destroy(ffts(k)%info))
     call hipCheck(hipStreamDestroy(ffts(k)%stream))
     call hipCheck(hipFree(ffts(k)%buf))
  end do

  ! rocFFT is unnormalized, so each round trip yields N*input.
  do k = 1, Nfft
     do i = 1, N
        error = abs(hx(i,k) - N * hx_input(i,k))
        if (error > error_max * N) then
           write(*,*) "FAILED! k=", k, " i=", i, " error=", error, &
                      " got=", hx(i,k), " expected=", N * hx_input(i,k)
           call rocfftCheck(rocfft_cleanup())
           STOP 1
        end if
     end do
  end do

  deallocate(hx)
  deallocate(hx_input)
  deallocate(lengths)

  call rocfftCheck(rocfft_cleanup())

  write(*,*) "PASSED!"

end program rocfft_stream_z
