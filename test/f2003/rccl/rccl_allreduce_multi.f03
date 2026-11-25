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
! RCCL all-reduce over every visible GPU (Fortran 2003 interfaces)
! see: https://rocm.docs.amd.com/projects/rccl/en/latest/
!
! Creates one communicator per GPU from a single process with ncclCommInitAll,
! which fills an array of communicators. Each GPU holds a buffer filled with its
! rank plus one; an in-place ncclAllReduce sum, issued for every GPU between
! ncclGroupStart and ncclGroupEnd, leaves ndev*(ndev+1)/2 everywhere. Needs two
! GPUs: with fewer it stops with 77, which CTest reports as skipped.
!!!!!!!!!!!!!!
!
program rccl_allreduce_multi
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rccl
  use hipfort_rccl_enums

  implicit none

  integer, parameter :: N = 1024
  integer(c_size_t), parameter :: Nbytes = int(N, c_size_t) * 4

  real(c_float), target :: hx(N)
  integer(c_int), allocatable, target :: devlist(:)
  type(c_ptr), allocatable :: comms(:), streams(:), dbuf(:)
  integer(c_int) :: ndev, r
  real(c_float) :: expected
  integer :: i

  write(*,"(a)",advance="no") "-- Running test 'RCCL all-reduce on every GPU' (Fortran 2003 interfaces) - "

  call hipCheck(hipGetDeviceCount(ndev))
  if (ndev < 2) then
     write(*,*) "SKIPPED (needs two GPUs, found ", ndev, ")"
     stop 77
  end if

  allocate(devlist(ndev), comms(ndev), streams(ndev), dbuf(ndev))
  devlist = [(r, r = 0, ndev - 1)]
  comms = c_null_ptr
  call ncclCheck(ncclCommInitAll(comms, ndev, c_loc(devlist)))

  do r = 1, ndev
     call hipCheck(hipSetDevice(devlist(r)))
     call hipCheck(hipStreamCreate(streams(r)))
     call hipCheck(hipMalloc(dbuf(r), Nbytes))
     hx = real(r, c_float)
     call hipCheck(hipMemcpy(dbuf(r), c_loc(hx), Nbytes, hipMemcpyHostToDevice))
  end do

  ! One collective per device, grouped so that a single thread can issue them all.
  call ncclCheck(ncclGroupStart())
  do r = 1, ndev
     call ncclCheck(ncclAllReduce(dbuf(r), dbuf(r), int(N, c_size_t), ncclFloat32, ncclSum, &
                                  comms(r), streams(r)))
  end do
  call ncclCheck(ncclGroupEnd())

  expected = real(ndev * (ndev + 1) / 2, c_float)
  do r = 1, ndev
     call hipCheck(hipSetDevice(devlist(r)))
     call hipCheck(hipStreamSynchronize(streams(r)))
     hx = 0.0
     call hipCheck(hipMemcpy(c_loc(hx), dbuf(r), Nbytes, hipMemcpyDeviceToHost))
     do i = 1, N
        if (hx(i) /= expected) then
           write(*,*) "FAILED! GPU ", devlist(r), ": x(", i, ") = ", hx(i), " expected ", expected
           call exit(1)
        end if
     end do
  end do

  do r = 1, ndev
     call ncclCheck(ncclCommDestroy(comms(r)))
     call hipCheck(hipSetDevice(devlist(r)))
     call hipCheck(hipStreamDestroy(streams(r)))
     call hipCheck(hipFree(dbuf(r)))
  end do

  write(*,"(a,i0,a)") " PASSED! (", ndev, " GPUs)"

end program rccl_allreduce_multi
