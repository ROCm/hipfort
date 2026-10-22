!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Copyright (C) 2020-2026 Advanced Micro Devices, Inc. All rights reserved.
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

program test_roctx
  use iso_c_binding
  use hipfort_roctx
  implicit none
  logical :: never
  type(c_ptr) :: v0
  integer(c_int) :: v1
  integer(c_int64_t) :: v2

  ! Always .false., but not foldable by the compiler, so every guarded
  ! call is compiled and linked yet never run (no null-pointer segfaults).
  never = command_argument_count() > 1000000

    if (never) call roctxMark_(v0)
    if (never) v1 = roctxRangePush_(v0)
    if (never) v1 = roctxRangePop_()
    if (never) v2 = roctxRangeStart_(v0)
    if (never) call roctxRangeStop_(v2)
    if (never) v1 = roctxProfilerPause_(v2)
    if (never) v1 = roctxProfilerResume_(v2)
    if (never) v1 = roctxNameOsThread_(v0)
    if (never) v1 = roctxNameHsaAgent_(v0, v0)
    if (never) v1 = roctxNameHipDevice_(v0, v1)
    if (never) v1 = roctxNameHipStream_(v0, v0)
    if (never) v1 = roctxGetThreadId_(v0)

  write(*,"(a)") "-- test_roctx (bind(C) symbols): PASSED (compile+link only)!"
end program test_roctx
