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
! HIP runtime error-handling and version queries
! see: https://rocm.docs.amd.com/projects/HIP/en/latest/
!
! Exercises hipGetLastError, hipPeekAtLastError, hipGetErrorName,
! hipGetErrorString, hipRuntimeGetVersion and hipDriverGetVersion. Deliberately
! provokes hipErrorInvalidDevice via an out-of-range hipSetDevice and validates
! the peek-vs-clear semantics.
!!!!!!!!!!!!!!
!
program error_version
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_enums

  implicit none

  integer(kind(hipSuccess)) :: stat, stat2
  integer(c_int)            :: ndev, rver, dver
  real(c_float), target     :: hval
  type(c_ptr)               :: dptr = c_null_ptr
  integer(c_size_t)         :: nbytes
  character(len=:), allocatable :: ename, estr

  write(*,"(a)",advance="no") "-- Running test 'hip error_version' (Fortran 2003 interfaces) - "

  call hipCheck(hipSetDevice(0))

  ! Clear any pre-existing sticky error (ignore its value).
  stat = hipGetLastError()

  ! Provoke a well-defined error: device index far past hipGetDeviceCount.
  call hipCheck(hipGetDeviceCount(ndev))
  stat = hipSetDevice(ndev + 999)
  if (stat /= hipErrorInvalidDevice) then
     write(*,*) "FAILED! hipSetDevice(bad) returned", stat, &
                " expected", int(hipErrorInvalidDevice)
     call exit(1)
  end if

  ! Peek must return the same error without clearing it.
  stat = hipPeekAtLastError()
  if (stat /= hipErrorInvalidDevice) then
     write(*,*) "FAILED! first hipPeekAtLastError returned", stat
     call exit(1)
  end if

  ! Second peek: error still set, peek never clears.
  stat2 = hipPeekAtLastError()
  if (stat2 /= hipErrorInvalidDevice) then
     write(*,*) "FAILED! second hipPeekAtLastError returned", stat2, &
                "(should still be set)"
     call exit(1)
  end if

  ! GetLastError must return the error and then clear it.
  stat = hipGetLastError()
  if (stat /= hipErrorInvalidDevice) then
     write(*,*) "FAILED! hipGetLastError returned", stat, &
                " expected", int(hipErrorInvalidDevice)
     call exit(1)
  end if

  ! State is now cleared: next GetLastError must return hipSuccess.
  stat2 = hipGetLastError()
  if (stat2 /= hipSuccess) then
     write(*,*) "FAILED! hipGetLastError after clear returned", stat2, &
                "(expected hipSuccess)"
     call exit(1)
  end if

  ! Version queries: both must return a positive integer.
  call hipCheck(hipRuntimeGetVersion(rver))
  if (rver <= 0) then
     write(*,*) "FAILED! hipRuntimeGetVersion =", rver
     call exit(1)
  end if

  call hipCheck(hipDriverGetVersion(dver))
  if (dver <= 0) then
     write(*,*) "FAILED! hipDriverGetVersion =", dver
     call exit(1)
  end if

  ! Both accessors describe the error the runtime just reported.
  ! They return a Fortran string, sized to the message.
  ename = hipGetErrorName(hipErrorInvalidDevice)
  if (ename /= "hipErrorInvalidDevice" .or. len(ename) /= len("hipErrorInvalidDevice")) then
     write(*,*) "FAILED! hipGetErrorName = '", ename, "'"
     call exit(1)
  end if

  estr = hipGetErrorString(hipErrorInvalidDevice)
  if (len(estr) == 0 .or. index(estr, "device") == 0) then
     write(*,*) "FAILED! hipGetErrorString = '", estr, "'"
     call exit(1)
  end if

  ! The raw bind(c) form still hands back the C pointer.
  if (.not. c_associated(hipGetErrorString_(hipErrorInvalidDevice))) then
     write(*,*) "FAILED! hipGetErrorString_ returned a null pointer"
     call exit(1)
  end if

  ! Confirm the runtime still accepts work after the error cycle.
  nbytes = int(4, c_size_t)   ! one real(c_float)
  call hipCheck(hipMalloc(dptr, nbytes))
  hval = 3.14
  call hipCheck(hipMemcpy(dptr, c_loc(hval), nbytes, hipMemcpyHostToDevice))
  hval = 0.0
  call hipCheck(hipMemcpy(c_loc(hval), dptr, nbytes, hipMemcpyDeviceToHost))
  if (abs(hval - 3.14) > 1.0e-6) then
     write(*,*) "FAILED! post-error memcpy roundtrip: got", hval
     call exit(1)
  end if
  call hipCheck(hipFree(dptr))

  write(*,*) "PASSED!"

end program error_version
