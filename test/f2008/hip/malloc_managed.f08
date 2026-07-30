!!!!!!!!!!!!!!
! HIP runtime hipMallocManaged (Fortran 2008 interfaces)
! see: https:!rocm.docs.amd.com/projects/HIP/en/latest/
!
! Allocates unified (managed) memory as a native Fortran array pointer, writes
! it from the host, overwrites it from the device (hipMemset), and checks the
! host sees the device's write.
!!!!!!!!!!!!!!
!
program malloc_managed
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_enums

  implicit none

  integer(c_int), parameter :: n = 256
  real(c_double), pointer :: mdata(:)
  integer(c_size_t) :: nbytes
  integer :: i

  write(*,"(a)",advance="no") "-- Running test 'hip malloc_managed' (Fortran 2008 interfaces) - "

  nbytes = int(n, c_size_t) * 8

  call hipCheck(hipSetDevice(0))
  ! Native-array managed allocation (flags is required by this overload).
  call hipCheck(hipMallocManaged(mdata, int(n,c_size_t), hipMemAttachGlobal))

  ! Host writes the managed buffer directly through the Fortran pointer.
  do i = 1, n
     mdata(i) = real(i, c_double)
  end do

  ! Device overwrites it with zero bytes.
  call hipCheck(hipMemset(c_loc(mdata(1)), 0, nbytes))
  call hipCheck(hipDeviceSynchronize())

  ! Host must observe the device's write.
  do i = 1, n
     if (mdata(i) /= 0.0d0) then
        write(*,*) "FAILED! mdata(", i, ") = ", mdata(i), " (expected 0)"
        call exit(1)
     end if
  end do

  call hipCheck(hipFree(mdata))

  write(*,*) "PASSED!"

end program malloc_managed
