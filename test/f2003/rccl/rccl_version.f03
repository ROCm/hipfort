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
! RCCL version and error strings (Fortran 2003 interfaces)
! see: https://rocm.docs.amd.com/projects/rccl/en/latest/
!
! Checks that ncclGetVersion writes a plausible NCCL version code, the same on
! a second call, and that ncclGetErrorString gives ncclSuccess and an error code
! two different, non-empty texts. Needs no GPU communication: it only checks
! that the library is linked and answers.
!!!!!!!!!!!!!!
!
program rccl_version
  use iso_c_binding
  use hipfort_check
  use hipfort_rccl
  use hipfort_rccl_enums

  implicit none

  integer(c_int), parameter :: poison = -12345
  integer(c_int) :: version, version2, major

  write(*,"(a)",advance="no") "-- Running test 'RCCL version' (Fortran 2003 interfaces) - "

  version  = poison
  version2 = poison
  call ncclCheck(ncclGetVersion(version))
  call ncclCheck(ncclGetVersion(version2))

  if (version == poison) then
     write(*,*) "FAILED! ncclGetVersion did not write the version argument"
     call exit(1)
  end if
  if (version2 /= version) then
     write(*,*) "FAILED! ncclGetVersion is not stable: ", version, " then ", version2
     call exit(1)
  end if

  ! NCCL_VERSION_CODE is major*10000 + minor*100 + patch since NCCL 2.9.
  major = version / 10000
  if (major /= 2) then
     write(*,*) "FAILED! unexpected NCCL major version ", major, " (code ", version, ")"
     call exit(1)
  end if

  if (len(error_string(ncclSuccess)) == 0 .or. len(error_string(ncclInvalidArgument)) == 0) then
     write(*,*) "FAILED! ncclGetErrorString returned an empty string"
     call exit(1)
  end if
  if (error_string(ncclSuccess) == error_string(ncclInvalidArgument)) then
     write(*,*) "FAILED! ncclGetErrorString gives ncclSuccess and ncclInvalidArgument the same text"
     call exit(1)
  end if

  write(*,"(a,i0,a,i0,a,i0)") " PASSED! RCCL ", major, ".", mod(version / 100, 100), ".", &
      mod(version, 100)

contains

  ! The NUL-terminated string ncclGetErrorString returns, as a Fortran string.
  function error_string(code) result(s)
    integer(kind(ncclSuccess)), intent(in) :: code
    character(:), allocatable :: s
    character(kind=c_char), pointer :: chars(:)
    type(c_ptr) :: p
    integer :: n

    p = ncclGetErrorString(code)
    if (.not. c_associated(p)) then
       s = ""
       return
    end if
    call c_f_pointer(p, chars, [256])
    n = 0
    do while (n < 256)
       if (chars(n + 1) == c_null_char) exit
       n = n + 1
    end do
    allocate(character(n) :: s)
    s = transfer(chars(1:n), s)
  end function error_string

end program rccl_version
