program fortran_hip
  use iso_c_binding
  use hip

  implicit none

  interface
     subroutine launch(out,a,b,N) bind(c)
       use iso_c_binding
       implicit none
       type(c_ptr) :: a, b, out
       integer, value :: N
     end subroutine
  end interface

  type(c_ptr) :: da = c_null_ptr
  type(c_ptr) :: db = c_null_ptr
  type(c_ptr) :: dout = c_null_ptr

  integer, parameter :: N = 1000000
  integer, parameter :: bytes_per_element = 8 !double precision
  integer(c_size_t), parameter :: Nbytes = N*bytes_per_element

  ! Plain real should be equivalent to float
  double precision,allocatable,target,dimension(:) :: a, b, out
  double precision :: error
  double precision, parameter :: error_max = 1.0d-10

  integer :: i

  write(*,*) "Starting HIP vector addition test"
  write(*,*) "HIPFORT_ARCH = ", hipfort_arch

  ! Allocate host memory
  allocate(a(N))
  allocate(b(N))
  allocate(out(N))

  ! Initialize host arrays
  a(:) = 1.0
  b(:) = 2.0

  ! Allocate array space on the device
  call hipCheck(hipMalloc(da,Nbytes))
  call hipCheck(hipMalloc(db,Nbytes))
  call hipCheck(hipMalloc(dout,Nbytes))

  ! Transfer data from host to device memory
  call hipCheck(hipMemcpy(da, c_loc(a), Nbytes, hipMemcpyHostToDevice))
  call hipCheck(hipMemcpy(db, c_loc(b), Nbytes, hipMemcpyHostToDevice))

  call launch(dout,da,db,N)

  call hipCheck(hipDeviceSynchronize())

  ! Transfer data back to host memory
  call hipCheck(hipMemcpy(c_loc(out), dout, Nbytes, hipMemcpyDeviceToHost))

  ! Verification
  do i = 1,N
     error = abs(out(i) - (a(i)+b(i)) )
     if( error .gt. error_max ) then
        write(*,*) "HIP FAILED! Error bigger than max! Error = ", error, " Out = ", out(i)
        call exit
     endif
  end do

  call hipCheck(hipFree(da))
  call hipCheck(hipFree(db))
  call hipCheck(hipFree(dout))

  ! Deallocate host memory
  deallocate(a)
  deallocate(b)
  deallocate(out)

  write(*,*) "HIP test PASSED!"

end program fortran_hip
