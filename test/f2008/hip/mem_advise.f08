!!!!!!!!!!!!!!
! HIP runtime hipMemAdvise / hipMemPrefetchAsync (Fortran 2008 interfaces)
! see: https:!rocm.docs.amd.com/projects/HIP/en/latest/
!
! Applies unified-memory hints to a managed allocation obtained as a native
! Fortran array pointer, reads them back with hipMemRangeGetAttribute, then
! prefetches the range device-ward and back and checks the data migrated.
!!!!!!!!!!!!!!
!
program mem_advise
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_enums

  implicit none

  ! hipMemAdvise rounds to CPU pages, so use a page-aligned byte count.
  integer(c_int), parameter :: n = 4096
  integer(c_int), parameter :: cpu_device = -1   ! hipCpuDeviceId
  real(c_double), pointer :: mdata(:)
  type(c_ptr) :: stream = c_null_ptr
  integer(c_size_t) :: nbytes
  integer(c_int), target :: qattr
  integer :: i

  write(*,"(a)",advance="no") "-- Running test 'hip mem_advise' (Fortran 2008 interfaces) - "

  nbytes = int(n, c_size_t) * 8

  call hipCheck(hipSetDevice(0))
  call hipCheck(hipStreamCreate(stream))
  call hipCheck(hipMallocManaged(mdata, int(n,c_size_t), hipMemAttachGlobal))

  do i = 1, n
     mdata(i) = real(i, c_double)
  end do

  call hipCheck(hipMemAdvise(c_loc(mdata(1)), nbytes, hipMemAdviseSetReadMostly, 0))
  call check_range_attr(hipMemRangeAttributeReadMostly, 1, "ReadMostly after set")

  call hipCheck(hipMemAdvise(c_loc(mdata(1)), nbytes, hipMemAdviseUnsetReadMostly, 0))
  call check_range_attr(hipMemRangeAttributeReadMostly, 0, "ReadMostly after unset")

  call hipCheck(hipMemAdvise(c_loc(mdata(1)), nbytes, hipMemAdviseSetPreferredLocation, 0))
  call check_range_attr(hipMemRangeAttributePreferredLocation, 0, "PreferredLocation")

  call hipCheck(hipMemAdvise(c_loc(mdata(1)), nbytes, hipMemAdviseSetAccessedBy, 0))
  call check_range_attr(hipMemRangeAttributeAccessedBy, 0, "AccessedBy")

  call hipCheck(hipMemPrefetchAsync(c_loc(mdata(1)), nbytes, 0, stream))
  call hipCheck(hipStreamSynchronize(stream))
  call hipCheck(hipMemsetAsync(c_loc(mdata(1)), 0, nbytes, stream))
  call hipCheck(hipMemPrefetchAsync(c_loc(mdata(1)), nbytes, cpu_device, stream))
  call hipCheck(hipStreamSynchronize(stream))

  do i = 1, n
     if (mdata(i) /= 0.0d0) then
        write(*,*) "FAILED! mdata(", i, ") = ", mdata(i), " (expected 0)"
        call exit(1)
     end if
  end do

  call hipCheck(hipFree(mdata))
  call hipCheck(hipStreamDestroy(stream))

  write(*,*) "PASSED!"

contains

  subroutine check_range_attr(attribute, want, what)
    integer(kind(hipMemRangeAttributeReadMostly)), intent(in) :: attribute
    integer(c_int), intent(in) :: want
    character(len=*), intent(in) :: what
    qattr = -12345
    call hipCheck(hipMemRangeGetAttribute(c_loc(qattr), 4_c_size_t, attribute, &
                                          c_loc(mdata(1)), nbytes))
    if (qattr /= want) then
       write(*,*) "FAILED! ", what, " = ", qattr, " (expected ", want, ")"
       call exit(1)
    end if
  end subroutine check_range_attr

end program mem_advise
