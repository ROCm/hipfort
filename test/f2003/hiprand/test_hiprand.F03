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

program test_hiprand
  use iso_c_binding
  use hipfort_hiprand
  use hipfort_hiprand_enums
  implicit none
  logical :: never
  type(c_ptr) :: v0
  integer(c_int) :: v1
  integer(c_size_t) :: v2
  real(c_float) :: v3
  real(c_double) :: v4
  integer(c_short) :: v5
  integer(c_int64_t) :: v6

  ! Always .false., but not foldable by the compiler, so every guarded
  ! call is compiled and linked yet never run (no null-pointer segfaults).
  never = command_argument_count() > 1000000

    if (never) v1 = hiprandCreateGenerator_(v0, v1)
    if (never) v1 = hiprandCreateGeneratorHost_(v0, v1)
    if (never) v1 = hiprandDestroyGenerator_(v0)
    if (never) v1 = hiprandGenerate_(v0, v0, v2)
#ifndef USE_CUDA_NAMES
    if (never) v1 = hiprandGenerateChar_(v0, v0, v2)
    if (never) v1 = hiprandGenerateShort_(v0, v0, v2)
#endif
    if (never) v1 = hiprandGenerateLongLong_(v0, v0, v2)
    if (never) v1 = hiprandGenerateUniform_(v0, v0, v2)
    if (never) v1 = hiprandGenerateUniformDouble_(v0, v0, v2)
#ifndef USE_CUDA_NAMES
    if (never) v1 = hiprandGenerateUniformHalf_(v0, v0, v2)
#endif
    if (never) v1 = hiprandGenerateNormal_(v0, v0, v2, v3, v3)
    if (never) v1 = hiprandGenerateNormalDouble_(v0, v0, v2, v4, v4)
#ifndef USE_CUDA_NAMES
    if (never) v1 = hiprandGenerateNormalHalf_(v0, v0, v2, v5, v5)
#endif
    if (never) v1 = hiprandGenerateLogNormal_(v0, v0, v2, v3, v3)
    if (never) v1 = hiprandGenerateLogNormalDouble_(v0, v0, v2, v4, v4)
#ifndef USE_CUDA_NAMES
    if (never) v1 = hiprandGenerateLogNormalHalf_(v0, v0, v2, v5, v5)
#endif
    if (never) v1 = hiprandGeneratePoisson_(v0, v0, v2, v4)
    if (never) v1 = hiprandGenerateSeeds_(v0)
    if (never) v1 = hiprandSetStream_(v0, v0)
    if (never) v1 = hiprandSetPseudoRandomGeneratorSeed_(v0, v6)
    if (never) v1 = hiprandSetGeneratorOffset_(v0, v6)
    if (never) v1 = hiprandSetGeneratorOrdering_(v0, v1)
    if (never) v1 = hiprandSetQuasiRandomGeneratorDimensions_(v0, v1)
    if (never) v1 = hiprandGetVersion_(v0)
    if (never) v1 = hiprandCreatePoissonDistribution_(v4, v0)
    if (never) v1 = hiprandDestroyDistribution_(v0)
    if (never) v1 = hiprandGetDirectionVectors32_(v0, v1)
    if (never) v1 = hiprandGetDirectionVectors64_(v0, v1)
    if (never) v1 = hiprandGetScrambleConstants32_(v0)
    if (never) v1 = hiprandGetScrambleConstants64_(v0)

  write(*,"(a)") "-- test_hiprand (bind(C) symbols): PASSED (compile+link only)!"
end program test_hiprand
