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

program test_hipfftxt
  use iso_c_binding
  use hipfort_hipfftxt
  use hipfort_hipfft
  use hipfort_hipfftxt_enums
  use hipfort_hipfftxt_types
  implicit none
  logical :: never
  type(c_ptr) :: v0
  integer(c_int) :: v1
  integer(c_size_t) :: v2
  integer(c_int64_t) :: v3
  type(hipLibXtDesc) :: v4

  ! Always .false., but not foldable by the compiler, so every guarded
  ! call is compiled and linked yet never run (no null-pointer segfaults).
  never = command_argument_count() > 1000000

    if (never) v1 = hipfftXtSetWorkArea_(v0, v0)
    if (never) v1 = hipfftXtSetCallback_(v0, v0, v1, v0)
    if (never) v1 = hipfftXtClearCallback_(v0, v1)
    if (never) v1 = hipfftXtSetCallbackSharedSize_(v0, v1, v2)
    if (never) v1 = hipfftXtSetJITCallback_(v0, v0, v0, v2, v1, v0)
    if (never) v1 = hipfftXtMakePlanMany_(v0, v1, v0, v0, v3, v3, v1, v0, v3, v3, v1, v3, v0, v1)
    if (never) v1 = hipfftXtGetSizeMany_(v0, v1, v0, v0, v3, v3, v1, v0, v3, v3, v1, v3, v0, v1)
    if (never) v1 = hipfftXtExec_(v0, v0, v0, v1)
    if (never) v1 = hipfftXtSetGPUs_(v0, v1, v0)
    if (never) v1 = hipfftXtMalloc_(v0, v0, v1)
    if (never) v1 = hipfftXtMemcpy_(v0, v0, v0, v1)
    if (never) v1 = hipfftXtFree_(v4)
    if (never) v1 = hipfftXtExecDescriptorC2C_(v0, v4, v4, v1)
    if (never) v1 = hipfftXtExecDescriptorR2C_(v0, v4, v4)
    if (never) v1 = hipfftXtExecDescriptorC2R_(v0, v4, v4)
    if (never) v1 = hipfftXtExecDescriptorZ2Z_(v0, v4, v4, v1)
    if (never) v1 = hipfftXtExecDescriptorD2Z_(v0, v4, v4)
    if (never) v1 = hipfftXtExecDescriptorZ2D_(v0, v4, v4)
    if (never) v1 = hipfftXtExecDescriptor_(v0, v4, v4, v1)

  write(*,"(a)") "-- test_hipfftxt (bind(C) symbols): PASSED (compile+link only)!"
end program test_hipfftxt
