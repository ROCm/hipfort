!!!!!!!!!!!!!!
! HIP runtime graphs via stream capture (Fortran 2003 interfaces)
! see: https:!rocm.docs.amd.com/projects/HIP/en/latest/
!
! Captures a device memset into a HIP graph, instantiates it, launches the
! executable graph and verifies the buffer was written. Exercises
! hipStreamBeginCapture / hipStreamEndCapture / hipGraphInstantiate /
! hipGraphLaunch / hipGraphExecDestroy / hipGraphDestroy.
!!!!!!!!!!!!!!
!
! Named test_graph: a program unit cannot share its name with a local variable.
program test_graph
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_enums

  implicit none

  integer(c_int), parameter :: n = 256
  integer(c_int8_t), target :: hbuf(n)
  type(c_ptr) :: stream = c_null_ptr
  type(c_ptr) :: graph  = c_null_ptr
  type(c_ptr) :: gexec  = c_null_ptr
  type(c_ptr) :: errnode = c_null_ptr
  type(c_ptr) :: dptr = c_null_ptr
  integer(c_size_t) :: nbytes
  integer :: i

  write(*,"(a)",advance="no") "-- Running test 'hip graph' (Fortran 2003 interfaces) - "

  nbytes = int(n, c_size_t)   ! one byte per element

  call hipCheck(hipSetDevice(0))
  call hipCheck(hipStreamCreate(stream))
  call hipCheck(hipMalloc(dptr, nbytes))

  ! Capture a device memset (value 5) into a graph.
  call hipCheck(hipStreamBeginCapture(stream, hipStreamCaptureModeGlobal))
  call hipCheck(hipMemsetAsync(dptr, 5, nbytes, stream))
  call hipCheck(hipStreamEndCapture(stream, graph))
  if (.not. c_associated(graph)) then
     write(*,*) "FAILED! captured graph is null"
     call exit(1)
  end if

  ! Instantiate and launch the executable graph.
  call hipCheck(hipGraphInstantiate(gexec, graph, errnode, c_null_ptr, 0_c_size_t))
  if (.not. c_associated(gexec)) then
     write(*,*) "FAILED! instantiated graph is null"
     call exit(1)
  end if
  call hipCheck(hipGraphLaunch(gexec, stream))
  call hipCheck(hipStreamSynchronize(stream))

  hbuf = 0
  call hipCheck(hipMemcpy(c_loc(hbuf(1)), dptr, nbytes, hipMemcpyDeviceToHost))
  do i = 1, n
     if (hbuf(i) /= 5_c_int8_t) then
        write(*,*) "FAILED! hbuf(", i, ") = ", hbuf(i), " (expected 5)"
        call exit(1)
     end if
  end do

  call hipCheck(hipGraphExecDestroy(gexec))
  call hipCheck(hipGraphDestroy(graph))
  call hipCheck(hipFree(dptr))
  call hipCheck(hipStreamDestroy(stream))

  write(*,*) "PASSED!"

end program test_graph
