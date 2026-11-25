!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
!
! SPDX-License-Identifier: MIT
!
! Permission is hereby granted, free of charge, to any person obtaining a copy
! of this software and associated documentation files (the "Software"), to deal
! in the Software without restriction, including without limitation the rights
! to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
! copies of the Software, and to permit persons to whom the Software is
! furnished to do so, subject to the following conditions:
!
! The above copyright notice and this permission notice shall be included in
! all copies or substantial portions of the Software.
!
! THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
! IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
! FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
! AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
! LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
! OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
! THE SOFTWARE.
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!
! RCCL collectives on a one-rank communicator (Fortran 2003 interfaces)
! see: https://rocm.docs.amd.com/projects/rccl/en/latest/
!
! Creates a communicator of one rank on GPU 0 the way an MPI code does, with
! ncclGetUniqueId and ncclCommInitRank, which takes the ncclUniqueId by value.
! Checks its size, rank and device, then runs ncclAllReduce (a sum over one
! rank leaves the data unchanged) and ncclBroadcast from rank 0 on a stream.
! Needs one GPU.
!!!!!!!!!!!!!!
!
program rccl_allreduce_single
  use iso_c_binding
  use hip
  use rccl

  implicit none

  integer, parameter :: N = 1024
  integer(c_size_t), parameter :: Nbytes = int(N, c_size_t) * 4

  real(c_float), target :: hx(N), hy(N)
  type(ncclUniqueId) :: id
  type(c_ptr) :: comm = c_null_ptr, stream = c_null_ptr
  type(c_ptr) :: dsend = c_null_ptr, drecv = c_null_ptr
  integer(c_int) :: nranks, rank, device
  integer :: i

  write(*,"(a)",advance="no") "-- Running test 'RCCL one-rank collectives' (Fortran 2003 interfaces) - "

  call hipCheck(hipSetDevice(0))
  call ncclCheck(ncclGetUniqueId(id))
  call ncclCheck(ncclCommInitRank(comm, 1, id, 0))

  call ncclCheck(ncclCommCount(comm, nranks))
  call ncclCheck(ncclCommUserRank(comm, rank))
  call ncclCheck(ncclCommCuDevice(comm, device))
  if (nranks /= 1 .or. rank /= 0 .or. device /= 0) then
     write(*,*) "FAILED! communicator: ", nranks, " ranks, rank ", rank, ", device ", device, &
                " (expected 1, 0, 0)"
     call exit(1)
  end if

  do i = 1, N
     hx(i) = real(i, c_float)
  end do
  call hipCheck(hipStreamCreate(stream))
  call hipCheck(hipMalloc(dsend, Nbytes))
  call hipCheck(hipMalloc(drecv, Nbytes))
  call hipCheck(hipMemcpy(dsend, c_loc(hx), Nbytes, hipMemcpyHostToDevice))

  ! A sum over one rank: the result is the input.
  call ncclCheck(ncclAllReduce(dsend, drecv, int(N, c_size_t), ncclFloat32, ncclSum, comm, stream))
  call hipCheck(hipStreamSynchronize(stream))
  hy = 0.0
  call hipCheck(hipMemcpy(c_loc(hy), drecv, Nbytes, hipMemcpyDeviceToHost))
  do i = 1, N
     if (hy(i) /= hx(i)) then
        write(*,*) "FAILED! ncclAllReduce: y(", i, ") = ", hy(i), " expected ", hx(i)
        call exit(1)
     end if
  end do

  ! Broadcast from rank 0 into a cleared buffer.
  call hipCheck(hipMemset(drecv, 0, Nbytes))
  call ncclCheck(ncclBroadcast(dsend, drecv, int(N, c_size_t), ncclFloat32, 0, comm, stream))
  call hipCheck(hipStreamSynchronize(stream))
  hy = 0.0
  call hipCheck(hipMemcpy(c_loc(hy), drecv, Nbytes, hipMemcpyDeviceToHost))
  do i = 1, N
     if (hy(i) /= hx(i)) then
        write(*,*) "FAILED! ncclBroadcast: y(", i, ") = ", hy(i), " expected ", hx(i)
        call exit(1)
     end if
  end do

  call ncclCheck(ncclCommDestroy(comm))
  call hipCheck(hipStreamDestroy(stream))
  call hipCheck(hipFree(dsend))
  call hipCheck(hipFree(drecv))

  write(*,*) "PASSED!"

end program rccl_allreduce_single
