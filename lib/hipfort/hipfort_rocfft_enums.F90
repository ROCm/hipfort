!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! ==============================================================================
! hipfort: FORTRAN Interfaces for GPU kernels
! ==============================================================================
! Copyright (c) 2020-2026 Advanced Micro Devices, Inc. All rights reserved.
! [MITx11 License]
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
! FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
! AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
! LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
! OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
! THE SOFTWARE.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

module hipfort_rocfft_enums
  use, intrinsic :: iso_c_binding
  implicit none

  ! rocfft_status_e
  enum, bind(c)
    enumerator :: rocfft_status_success = 0
    enumerator :: rocfft_status_failure = 1
    enumerator :: rocfft_status_invalid_arg_value = 2
    enumerator :: rocfft_status_invalid_dimensions = 3
    enumerator :: rocfft_status_invalid_array_type = 4
    enumerator :: rocfft_status_invalid_strides = 5
    enumerator :: rocfft_status_invalid_distance = 6
    enumerator :: rocfft_status_invalid_offset = 7
    enumerator :: rocfft_status_invalid_work_buffer = 8
  end enum

  ! rocfft_transform_type_e
  enum, bind(c)
    enumerator :: rocfft_transform_type_complex_forward = 0
    enumerator :: rocfft_transform_type_complex_inverse = 1
    enumerator :: rocfft_transform_type_real_forward = 2
    enumerator :: rocfft_transform_type_real_inverse = 3
  end enum

  ! rocfft_precision_e
  enum, bind(c)
    enumerator :: rocfft_precision_single = 0
    enumerator :: rocfft_precision_double = 1
    enumerator :: rocfft_precision_half = 2
  end enum

  ! rocfft_result_placement_e
  enum, bind(c)
    enumerator :: rocfft_placement_inplace = 0
    enumerator :: rocfft_placement_notinplace = 1
  end enum

  ! rocfft_array_type_e
  enum, bind(c)
    enumerator :: rocfft_array_type_complex_interleaved = 0
    enumerator :: rocfft_array_type_complex_planar = 1
    enumerator :: rocfft_array_type_real = 2
    enumerator :: rocfft_array_type_hermitian_interleaved = 3
    enumerator :: rocfft_array_type_hermitian_planar = 4
    enumerator :: rocfft_array_type_unset = 5
  end enum

  ! rocfft_comm_type_e
  enum, bind(c)
    enumerator :: rocfft_comm_none = 0
    enumerator :: rocfft_comm_mpi = 1
  end enum

end module hipfort_rocfft_enums
