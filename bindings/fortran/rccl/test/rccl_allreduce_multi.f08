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
! RCCL all-reduce over every visible GPU (Fortran 2008 interfaces)
! see: https://rocm.docs.amd.com/projects/rccl/en/latest/
!
! The Fortran 2008 version of rccl_allreduce_multi.f03: ncclCommInitAll takes
! the device list as a Fortran array, and each GPU's buffer is a Fortran array
! from the HIP binding's typed hipMalloc, passed to ncclAllReduce with c_loc. Needs two
! GPUs: with fewer it stops with 77, which CTest reports as skipped.
!!!!!!!!!!!!!!
!
program rccl_allreduce_multi
  use iso_c_binding
  use hip
  use rccl

  implicit none

  integer, parameter :: N = 1024

  ! A device buffer per GPU: Fortran has no array of pointers, so wrap each one.
  type :: device_buffer
     real(c_float), pointer :: x(:) => null()
  end type device_buffer

  real(c_float) :: hx(N)
  integer(c_int), allocatable :: devlist(:)
  type(c_ptr), allocatable :: comms(:), streams(:)
  type(device_buffer), allocatable :: d(:)
  integer(c_int) :: ndev, r
  real(c_float) :: expected

  write(*,"(a)",advance="no") "-- Running test 'RCCL all-reduce on every GPU' (Fortran 2008 interfaces) - "

  call hipCheck(hipGetDeviceCount(ndev))
  if (ndev < 2) then
     write(*,*) "SKIPPED (needs two GPUs, found ", ndev, ")"
     stop 77
  end if

  allocate(devlist(ndev), comms(ndev), streams(ndev), d(ndev))
  devlist = [(r, r = 0, ndev - 1)]
  comms = c_null_ptr
  call ncclCheck(ncclCommInitAll(comms, ndev, devlist))

  do r = 1, ndev
     call hipCheck(hipSetDevice(devlist(r)))
     call hipCheck(hipStreamCreate(streams(r)))
     call hipCheck(hipMalloc(d(r)%x, int(N, c_size_t)))
     hx = real(r, c_float)
     call hipCheck(hipMemcpy(d(r)%x, hx, hipMemcpyHostToDevice))
  end do

  call ncclCheck(ncclGroupStart())
  do r = 1, ndev
     call ncclCheck(ncclAllReduce(c_loc(d(r)%x), c_loc(d(r)%x), int(N, c_size_t), ncclFloat32, &
                                  ncclSum, comms(r), streams(r)))
  end do
  call ncclCheck(ncclGroupEnd())

  expected = real(ndev * (ndev + 1) / 2, c_float)
  do r = 1, ndev
     call hipCheck(hipSetDevice(devlist(r)))
     call hipCheck(hipStreamSynchronize(streams(r)))
     hx = 0.0
     call hipCheck(hipMemcpy(hx, d(r)%x, hipMemcpyDeviceToHost))
     if (any(hx /= expected)) then
        write(*,*) "FAILED! GPU ", devlist(r), ": got ", hx(1), "... expected ", expected
        call exit(1)
     end if
  end do

  do r = 1, ndev
     call ncclCheck(ncclCommDestroy(comms(r)))
     call hipCheck(hipSetDevice(devlist(r)))
     call hipCheck(hipStreamDestroy(streams(r)))
     call hipCheck(hipFree(d(r)%x))
  end do

  write(*,"(a,i0,a)") " PASSED! (", ndev, " GPUs)"

end program rccl_allreduce_multi
