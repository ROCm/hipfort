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

module hipfort_hipfftxt_enums
  use, intrinsic :: iso_c_binding
  implicit none

  ! hiplibFormat_t
  enum, bind(c)
    enumerator :: HIPLIB_FORMAT_HIPFFT = 0
    enumerator :: HIPLIB_FORMAT_UNDEFINED = 1
  end enum

  ! hipfftXtCopyType_t
  enum, bind(c)
    enumerator :: HIPFFT_COPY_HOST_TO_DEVICE = 0
    enumerator :: HIPFFT_COPY_DEVICE_TO_HOST = 1
    enumerator :: HIPFFT_COPY_DEVICE_TO_DEVICE = 2
    enumerator :: HIPFFT_COPY_UNDEFINED = 3
  end enum

  ! hipfftXtCallbackType_t
  enum, bind(c)
    enumerator :: HIPFFT_CB_LD_COMPLEX = 0
    enumerator :: HIPFFT_CB_LD_COMPLEX_DOUBLE = 1
    enumerator :: HIPFFT_CB_LD_REAL = 2
    enumerator :: HIPFFT_CB_LD_REAL_DOUBLE = 3
    enumerator :: HIPFFT_CB_ST_COMPLEX = 4
    enumerator :: HIPFFT_CB_ST_COMPLEX_DOUBLE = 5
    enumerator :: HIPFFT_CB_ST_REAL = 6
    enumerator :: HIPFFT_CB_ST_REAL_DOUBLE = 7
    enumerator :: HIPFFT_CB_UNDEFINED = 8
  end enum

  ! hipfftXtSubFormat_t
  enum, bind(c)
    enumerator :: HIPFFT_XT_FORMAT_INPUT = 0
    enumerator :: HIPFFT_XT_FORMAT_OUTPUT = 1
    enumerator :: HIPFFT_XT_FORMAT_INPLACE = 2
    enumerator :: HIPFFT_XT_FORMAT_INPLACE_SHUFFLED = 3
    enumerator :: HIPFFT_XT_FORMAT_1D_INPUT_SHUFFLED = 4
#ifdef USE_CUDA_NAMES
    enumerator :: HIPFFT_FORMAT_UNDEFINED = 7
#else
    enumerator :: HIPFFT_FORMAT_UNDEFINED = 5
#endif
  end enum

  ! hipfftMpCommType_t
  enum, bind(c)
    enumerator :: HIPFFT_COMM_MPI = 0
    enumerator :: HIPFFT_COMM_NONE = 1
  end enum

  integer(c_int), parameter :: MAX_HIP_DESCRIPTOR_GPUS = 64

end module hipfort_hipfftxt_enums
