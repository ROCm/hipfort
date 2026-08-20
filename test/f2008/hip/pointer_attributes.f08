!!!!!!!!!!!!!!
! HIP runtime hipPointerGetAttributes (Fortran 2008 interfaces)
! see: https:!rocm.docs.amd.com/projects/HIP/en/latest/
!
! Same checks as the Fortran 2003 test, but the buffers are allocated through
! the native-array interfaces, so this also confirms those hand back real
! device / managed / pinned host allocations.
!!!!!!!!!!!!!!
!
program pointer_attributes
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_enums
  use hipfort_types

  implicit none

  integer(c_int), parameter :: n = 256
  real(c_double), pointer :: dp(:), mp(:), hp(:)
  type(hipPointerAttribute_t) :: attr

  write(*,"(a)",advance="no") "-- Running test 'hip pointer_attributes' (Fortran 2008 interfaces) - "

  call hipCheck(hipSetDevice(0))

  call hipCheck(hipMalloc(dp, int(n,c_size_t)))
  call hipCheck(hipPointerGetAttributes(attr, c_loc(dp(1))))
  call expect_type(attr%type, hipMemoryTypeDevice, "hipMalloc")
  if (attr%device /= 0) then
     write(*,*) "FAILED! hipMalloc device = ", attr%device, " (expected 0)"
     call exit(1)
  end if
  if (.not. c_associated(attr%devicePointer, c_loc(dp(1)))) then
     write(*,*) "FAILED! hipMalloc devicePointer does not match the allocation"
     call exit(1)
  end if

  call hipCheck(hipMallocManaged(mp, int(n,c_size_t), hipMemAttachGlobal))
  call hipCheck(hipPointerGetAttributes(attr, c_loc(mp(1))))
  call expect_type(attr%type, hipMemoryTypeManaged, "hipMallocManaged")
  if (attr%isManaged /= 1) then
     write(*,*) "FAILED! hipMallocManaged isManaged = ", attr%isManaged, " (expected 1)"
     call exit(1)
  end if

  call hipCheck(hipHostMalloc(hp, int(n,c_size_t), hipHostMallocDefault))
  call hipCheck(hipPointerGetAttributes(attr, c_loc(hp(1))))
  call expect_type(attr%type, hipMemoryTypeHost, "hipHostMalloc")
  if (.not. c_associated(attr%devicePointer)) then
     write(*,*) "FAILED! hipHostMalloc devicePointer is null"
     call exit(1)
  end if

  call hipCheck(hipFree(dp))
  call hipCheck(hipFree(mp))
  call hipCheck(hipHostFree(hp))

  write(*,*) "PASSED!"

contains

  subroutine expect_type(got, want, what)
    integer(c_int), intent(in) :: got
    integer(kind(hipMemoryTypeDevice)), intent(in) :: want
    character(len=*), intent(in) :: what
    if (got /= int(want, c_int)) then
       write(*,*) "FAILED! ", what, " memory type = ", got, " (expected ", int(want, c_int), ")"
       call exit(1)
    end if
  end subroutine expect_type

end program pointer_attributes
