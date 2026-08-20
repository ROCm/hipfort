!!!!!!!!!!!!!!
! HIP runtime occupancy queries (Fortran 2003 interfaces)
! see: https:!rocm.docs.amd.com/projects/HIP/en/latest/
!
! Exercises hipOccupancyMaxPotentialBlockSize and
! hipOccupancyMaxActiveBlocksPerMultiprocessor. Both take the host-side stub of
! a __global__ function, so this test links the vecadd kernel and names its stub.
!!!!!!!!!!!!!!
!
program occupancy
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_enums

  implicit none

  ! The occupancy calls want the address of the kernel stub; launch() is the
  ! wrapper that actually runs it, since a stub cannot be called directly.
  interface
    subroutine vector_add(out, a, b, n) bind(c, name="_Z10vector_addPdS_S_i")
      use iso_c_binding
      implicit none
      type(c_ptr), value :: out, a, b
      integer(c_int), value :: n
    end subroutine
    subroutine launch(out, a, b, n) bind(c)
      use iso_c_binding
      implicit none
      type(c_ptr) :: out, a, b
      integer, value :: n
    end subroutine
  end interface

  integer(c_int), parameter :: n = 1024
  real(c_double), target :: ha(n), hb(n), hout(n)
  type(c_ptr) :: da = c_null_ptr, db = c_null_ptr, dout = c_null_ptr
  type(c_ptr) :: fptr
  integer(c_int), target :: gridsize, blocksize, numblocks
  integer(c_int) :: nmp, maxthreads
  integer(c_size_t) :: nbytes
  integer :: i

  write(*,"(a)",advance="no") "-- Running test 'hip occupancy' (Fortran 2003 interfaces) - "

  nbytes = int(n, c_size_t) * 8
  do i = 1, n
     ha(i) = real(i, c_double)
     hb(i) = real(2*i, c_double)
  end do

  call hipCheck(hipSetDevice(0))
  call hipCheck(hipDeviceGetAttribute(nmp, hipDeviceAttributeMultiprocessorCount, 0))
  call hipCheck(hipDeviceGetAttribute(maxthreads, hipDeviceAttributeMaxThreadsPerBlock, 0))

  ! The binding types f as a data pointer; the C parameter is void* either way.
  fptr = transfer(c_funloc(vector_add), c_null_ptr)

  call hipCheck(hipOccupancyMaxPotentialBlockSize(c_loc(gridsize), c_loc(blocksize), fptr, 0_c_size_t, 0))
  if (blocksize <= 0 .or. blocksize > maxthreads) then
     write(*,*) "FAILED! block size = ", blocksize, " (device max ", maxthreads, ")"
     call exit(1)
  end if
  if (gridsize < nmp) then
     write(*,*) "FAILED! grid size ", gridsize, " below CU count ", nmp
     call exit(1)
  end if

  call hipCheck(hipOccupancyMaxActiveBlocksPerMultiprocessor(c_loc(numblocks), fptr, blocksize, 0_c_size_t))
  if (numblocks <= 0 .or. numblocks * blocksize > 2048) then
     write(*,*) "FAILED! ", numblocks, " blocks of ", blocksize, " threads per CU"
     call exit(1)
  end if

  ! Run the kernel to confirm the stub just queried is the one that executes.
  call hipCheck(hipMalloc(da, nbytes))
  call hipCheck(hipMalloc(db, nbytes))
  call hipCheck(hipMalloc(dout, nbytes))
  call hipCheck(hipMemcpy(da, c_loc(ha(1)), nbytes, hipMemcpyHostToDevice))
  call hipCheck(hipMemcpy(db, c_loc(hb(1)), nbytes, hipMemcpyHostToDevice))
  call hipCheck(hipMemset(dout, 0, nbytes))

  call launch(dout, da, db, n)
  call hipCheck(hipDeviceSynchronize())

  hout = 0.0d0
  call hipCheck(hipMemcpy(c_loc(hout(1)), dout, nbytes, hipMemcpyDeviceToHost))
  do i = 1, n
     if (hout(i) /= ha(i) + hb(i)) then
        write(*,*) "FAILED! out(", i, ") = ", hout(i), " expected ", ha(i) + hb(i)
        call exit(1)
     end if
  end do

  call hipCheck(hipFree(da))
  call hipCheck(hipFree(db))
  call hipCheck(hipFree(dout))

  write(*,*) "PASSED!"

end program occupancy
