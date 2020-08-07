program rocfft_example
  use iso_c_binding
  use hip
  use rocfft

  implicit none

  integer(c_size_t), parameter :: N=16
  integer(c_size_t), parameter :: Nbytes = N*8*2

  type double2
     double precision :: x
     double precision :: y
  end type double2

  type(double2), allocatable, target, dimension(:) :: hx
  type(c_ptr) :: dx = c_null_ptr
  type(c_ptr) :: plan = c_null_ptr
  integer(c_size_t), allocatable, target, dimension(:) :: lengths
  integer(c_size_t), parameter :: one = 1
  integer :: i
  double precision :: error
  double precision, parameter :: error_max = epsilon(error)

  write(*,*) "Starting rocFFT test"

  call rocfftCheck(rocfft_setup())

  allocate(lengths(3))
  lengths(1) = N

  allocate(hx(N))
  hx(:)%x = 1
  hx(:)%y = -1

  call hipCheck(hipMalloc(dx,Nbytes))
  call hipCheck(hipMemcpy(dx,c_loc(hx),Nbytes,hipMemcpyHostToDevice))

  call rocfftCheck(rocfft_plan_create(plan,&
                                      rocfft_placement_inplace,&
                                      rocfft_transform_type_complex_forward,&
                                      rocfft_precision_double,&
                                      one,&
                                      c_loc(lengths),&
                                      one,&
                                      c_null_ptr))

  call rocfftCheck(rocfft_execute(plan,dx,c_null_ptr,c_null_ptr))

  call hipCheck(hipDeviceSynchronize())

  call rocfftCheck(rocfft_plan_destroy(plan))

  call hipCheck(hipMemcpy(c_loc(hx),dx,Nbytes,hipMemcpyDeviceToHost))
  call hipCheck(hipFree(dx))

  ! Using the C++ version of this as the "gold".
  ! first components were \pm 16 and the remaining componenents
  ! were zero, so the sum of each component pair should be zero
  do i = 1,N
     error = abs(hx(i)%x+hx(i)%y)
     if(error > error_max)then
        write(*,*) "rocFFT FAILED! Error = ", error, "hx(i)%x = ", hx(i)%x, "hx(i)%y = "
     end if
  end do

  deallocate(hx)
  deallocate(lengths)

  call rocfftCheck(rocfft_cleanup())

  write(*,*) "rocFFT PASSED!"

end program rocfft_example
