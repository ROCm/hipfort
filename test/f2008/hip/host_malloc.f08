!!!!!!!!!!!!!!
! HIP runtime hipHostMalloc (pinned host memory, Fortran 2008 interfaces)
! see: https:!rocm.docs.amd.com/projects/HIP/en/latest/
!
! Allocates pinned host memory as a native Fortran array pointer, uses it as the
! source of a host->device copy, copies back into a plain host array and
! verifies the round trip.
!!!!!!!!!!!!!!
!
program host_malloc
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_enums

  implicit none

  integer(c_int), parameter :: n = 256
  real(c_double), pointer :: hp(:)   ! pinned host memory
  real(c_double), pointer :: dp(:)   ! device memory
  real(c_double)          :: hcheck(n)
  integer :: i

  write(*,"(a)",advance="no") "-- Running test 'hip host_malloc' (Fortran 2008 interfaces) - "

  call hipCheck(hipSetDevice(0))
  call hipCheck(hipHostMalloc(hp, int(n,c_size_t), hipHostMallocDefault))

  do i = 1, n
     hp(i) = real(i, c_double)
  end do

  call hipCheck(hipMalloc(dp, int(n,c_size_t)))
  call hipCheck(hipMemcpy(dp, hp, hipMemcpyHostToDevice))

  hcheck = 0.0d0
  call hipCheck(hipMemcpy(hcheck, dp, hipMemcpyDeviceToHost))

  do i = 1, n
     if (hcheck(i) /= hp(i)) then
        write(*,*) "FAILED! hcheck(", i, ") = ", hcheck(i), " expected ", hp(i)
        call exit(1)
     end if
  end do

  call hipCheck(hipFree(dp))
  call hipCheck(hipHostFree(hp))

  write(*,*) "PASSED!"

end program host_malloc
