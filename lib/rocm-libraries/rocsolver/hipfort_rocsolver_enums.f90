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

module hipfort_rocsolver_enums
  implicit none

  ! rocblas_layer_mode_ex_
  enum, bind(c)
    enumerator :: rocblas_layer_mode_ex_log_kernel = 16
  end enum

  ! rocblas_direct_
  enum, bind(c)
    enumerator :: rocblas_forward_direction = 171
    enumerator :: rocblas_backward_direction = 172
  end enum

  ! rocblas_storev_
  enum, bind(c)
    enumerator :: rocblas_column_wise = 181
    enumerator :: rocblas_row_wise = 182
  end enum

  ! rocblas_svect_
  enum, bind(c)
    enumerator :: rocblas_svect_all = 191
    enumerator :: rocblas_svect_singular = 192
    enumerator :: rocblas_svect_overwrite = 193
    enumerator :: rocblas_svect_none = 194
  end enum

  ! rocblas_workmode_
  enum, bind(c)
    enumerator :: rocblas_outofplace = 201
    enumerator :: rocblas_inplace = 202
  end enum

  ! rocblas_evect_
  enum, bind(c)
    enumerator :: rocblas_evect_original = 211
    enumerator :: rocblas_evect_tridiagonal = 212
    enumerator :: rocblas_evect_none = 213
  end enum

  ! rocblas_eform_
  enum, bind(c)
    enumerator :: rocblas_eform_ax = 221
    enumerator :: rocblas_eform_abx = 222
    enumerator :: rocblas_eform_bax = 223
  end enum

  ! rocblas_erange_
  enum, bind(c)
    enumerator :: rocblas_erange_all = 231
    enumerator :: rocblas_erange_value = 232
    enumerator :: rocblas_erange_index = 233
  end enum

  ! rocblas_eorder_
  enum, bind(c)
    enumerator :: rocblas_eorder_blocks = 241
    enumerator :: rocblas_eorder_entire = 242
  end enum

  ! rocblas_esort_
  enum, bind(c)
    enumerator :: rocblas_esort_none = 251
    enumerator :: rocblas_esort_ascending = 252
  end enum

  ! rocblas_srange_
  enum, bind(c)
    enumerator :: rocblas_srange_all = 261
    enumerator :: rocblas_srange_value = 262
    enumerator :: rocblas_srange_index = 263
  end enum

  ! rocsolver_rfinfo_mode_
  enum, bind(c)
    enumerator :: rocsolver_rfinfo_mode_lu = 271
    enumerator :: rocsolver_rfinfo_mode_cholesky = 272
  end enum

  ! rocblas_pivot_
  enum, bind(c)
    enumerator :: rocblas_pivot_variable = 281
    enumerator :: rocblas_pivot_top = 282
    enumerator :: rocblas_pivot_bottom = 283
  end enum

  ! rocsolver_alg_mode_
  enum, bind(c)
    enumerator :: rocsolver_alg_mode_gpu = 291
    enumerator :: rocsolver_alg_mode_hybrid = 292
    enumerator :: rocsolver_alg_mode_mixed = 293
  end enum

  ! rocsolver_norm_type_
  enum, bind(c)
    enumerator :: rocsolver_norm_type_one = 301
    enumerator :: rocsolver_norm_type_frobenius = 302
    enumerator :: rocsolver_norm_type_infinity = 303
    enumerator :: rocsolver_norm_type_max = 304
  end enum

  ! rocsolver_function_
  enum, bind(c)
    enumerator :: rocsolver_function_bdsqr = 401
    enumerator :: rocsolver_function_gesvd = 402
    enumerator :: rocsolver_function_sterf = 403
    enumerator :: rocsolver_function_steqr = 404
    enumerator :: rocsolver_function_syev_heev = 405
  end enum

end module hipfort_rocsolver_enums
