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

program test_hipfft
  use iso_c_binding
  use hipfort_hipfft
  use hipfort_hipfft_enums
  implicit none
  logical :: never
  type(c_ptr) :: v0
  integer(c_int) :: v1
  integer(kind(HIPFFT_R2C)) :: v2
  integer(kind(HIPFFT_SUCCESS)) :: v3
  real(c_double) :: v4
  integer(c_size_t) :: v5
  integer(c_int64_t) :: v6
  integer(kind(HIPFFT_MAJOR_VERSION)) :: v7

  ! Always .false., but not foldable by the compiler, so every guarded
  ! call is compiled and linked yet never run (no null-pointer segfaults).
  never = command_argument_count() > 1000000

    if (never) v3 = hipfftPlan1d_(v0, v1, v2, v1)
    if (never) v3 = hipfftPlan2d_(v0, v1, v1, v2)
    if (never) v3 = hipfftPlan3d_(v0, v1, v1, v1, v2)
    if (never) v3 = hipfftPlanMany_(v0, v1, v0, v0, v1, v1, v0, v1, v1, v2, v1)
    if (never) v3 = hipfftCreate_(v0)
#ifndef USE_CUDA_NAMES
    if (never) v3 = hipfftExtPlanScaleFactor_(v0, v4)
#endif
    if (never) v3 = hipfftMakePlan1d_(v0, v1, v2, v1, v5)
    if (never) v3 = hipfftMakePlan2d_(v0, v1, v1, v2, v5)
    if (never) v3 = hipfftMakePlan3d_(v0, v1, v1, v1, v2, v5)
    if (never) v3 = hipfftMakePlanMany_(v0, v1, v0, v0, v1, v1, v0, v1, v1, v2, v1, v5)
    if (never) v3 = hipfftMakePlanMany64_(v0, v1, v0, v0, v6, v6, v0, v6, v6, v2, v6, v5)
    if (never) v3 = hipfftEstimate1d_(v1, v2, v1, v5)
    if (never) v3 = hipfftEstimate2d_(v1, v1, v2, v5)
    if (never) v3 = hipfftEstimate3d_(v1, v1, v1, v2, v5)
    if (never) v3 = hipfftEstimateMany_(v1, v0, v0, v1, v1, v0, v1, v1, v2, v1, v5)
    if (never) v3 = hipfftGetSize1d_(v0, v1, v2, v1, v5)
    if (never) v3 = hipfftGetSize2d_(v0, v1, v1, v2, v5)
    if (never) v3 = hipfftGetSize3d_(v0, v1, v1, v1, v2, v5)
    if (never) v3 = hipfftGetSizeMany_(v0, v1, v0, v0, v1, v1, v0, v1, v1, v2, v1, v5)
    if (never) v3 = hipfftGetSizeMany64_(v0, v1, v0, v0, v6, v6, v0, v6, v6, v2, v6, v5)
    if (never) v3 = hipfftGetSize_(v0, v5)
    if (never) v3 = hipfftSetAutoAllocation_(v0, v1)
    if (never) v3 = hipfftSetWorkArea_(v0, v0)
    if (never) v3 = hipfftExecC2C_(v0, v0, v0, v1)
    if (never) v3 = hipfftExecR2C_(v0, v0, v0)
    if (never) v3 = hipfftExecC2R_(v0, v0, v0)
    if (never) v3 = hipfftExecZ2Z_(v0, v0, v0, v1)
    if (never) v3 = hipfftExecD2Z_(v0, v0, v0)
    if (never) v3 = hipfftExecZ2D_(v0, v0, v0)
    if (never) v3 = hipfftSetStream_(v0, v0)
    if (never) v3 = hipfftDestroy_(v0)
    if (never) v3 = hipfftGetVersion_(v1)
    if (never) v3 = hipfftGetProperty_(v7, v0)

  write(*,"(a)") "-- test_hipfft (bind(C) symbols): PASSED (compile+link only)!"
end program test_hipfft
