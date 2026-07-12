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
  use, intrinsic :: iso_c_binding
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

  ! rocblas_operation_
  enum, bind(c)
    enumerator :: rocblas_operation_none = 111
    enumerator :: rocblas_operation_transpose = 112
    enumerator :: rocblas_operation_conjugate_transpose = 113
  end enum

  ! rocblas_fill_
  enum, bind(c)
    enumerator :: rocblas_fill_upper = 121
    enumerator :: rocblas_fill_lower = 122
    enumerator :: rocblas_fill_full = 123
  end enum

  ! rocblas_diagonal_
  enum, bind(c)
    enumerator :: rocblas_diagonal_non_unit = 131
    enumerator :: rocblas_diagonal_unit = 132
  end enum

  ! rocblas_side_
  enum, bind(c)
    enumerator :: rocblas_side_left = 141
    enumerator :: rocblas_side_right = 142
    enumerator :: rocblas_side_both = 143
  end enum

  ! rocblas_datatype_
  enum, bind(c)
    enumerator :: rocblas_datatype_f16_r = 150
    enumerator :: rocblas_datatype_f32_r = 151
    enumerator :: rocblas_datatype_f64_r = 152
    enumerator :: rocblas_datatype_f16_c = 153
    enumerator :: rocblas_datatype_f32_c = 154
    enumerator :: rocblas_datatype_f64_c = 155
    enumerator :: rocblas_datatype_i8_r = 160
    enumerator :: rocblas_datatype_u8_r = 161
    enumerator :: rocblas_datatype_i32_r = 162
    enumerator :: rocblas_datatype_u32_r = 163
    enumerator :: rocblas_datatype_i8_c = 164
    enumerator :: rocblas_datatype_u8_c = 165
    enumerator :: rocblas_datatype_i32_c = 166
    enumerator :: rocblas_datatype_u32_c = 167
    enumerator :: rocblas_datatype_bf16_r = 168
    enumerator :: rocblas_datatype_bf16_c = 169
    enumerator :: rocblas_datatype_invalid = 255
  end enum

  ! rocblas_status_
  enum, bind(c)
    enumerator :: rocblas_status_success = 0
    enumerator :: rocblas_status_invalid_handle = 1
    enumerator :: rocblas_status_not_implemented = 2
    enumerator :: rocblas_status_invalid_pointer = 3
    enumerator :: rocblas_status_invalid_size = 4
    enumerator :: rocblas_status_memory_error = 5
    enumerator :: rocblas_status_internal_error = 6
    enumerator :: rocblas_status_perf_degraded = 7
    enumerator :: rocblas_status_size_query_mismatch = 8
    enumerator :: rocblas_status_size_increased = 9
    enumerator :: rocblas_status_size_unchanged = 10
    enumerator :: rocblas_status_invalid_value = 11
    enumerator :: rocblas_status_continue = 12
    enumerator :: rocblas_status_check_numerics_fail = 13
    enumerator :: rocblas_status_excluded_from_build = 14
    enumerator :: rocblas_status_arch_mismatch = 15
  end enum

  ! rocblas_pointer_mode_
  enum, bind(c)
    enumerator :: rocblas_pointer_mode_host = 0
    enumerator :: rocblas_pointer_mode_device = 1
  end enum

  ! rocblas_atomics_mode_
  enum, bind(c)
    enumerator :: rocblas_atomics_not_allowed = 0
    enumerator :: rocblas_atomics_allowed = 1
  end enum

  ! rocblas_performance_metric_
  enum, bind(c)
    enumerator :: rocblas_default_performance_metric = 0
    enumerator :: rocblas_device_efficiency_performance_metric = 1
    enumerator :: rocblas_cu_efficiency_performance_metric = 2
  end enum

  ! rocblas_layer_mode_
  enum, bind(c)
    enumerator :: rocblas_layer_mode_none = 0
    enumerator :: rocblas_layer_mode_log_trace = 1
    enumerator :: rocblas_layer_mode_log_bench = 2
    enumerator :: rocblas_layer_mode_log_profile = 4
    enumerator :: rocblas_layer_mode_log_internal = 8
  end enum

  ! rocblas_gemm_algo_
  enum, bind(c)
    enumerator :: rocblas_gemm_algo_standard = 0
    enumerator :: rocblas_gemm_algo_solution_index = 1
  end enum

  ! rocblas_geam_ex_operation_
  enum, bind(c)
    enumerator :: rocblas_geam_ex_operation_min_plus = 0
    enumerator :: rocblas_geam_ex_operation_plus_min = 1
  end enum

  ! rocblas_gemm_flags_
  enum, bind(c)
    enumerator :: rocblas_gemm_flags_none = 0
    enumerator :: rocblas_gemm_flags_use_cu_efficiency = 2
    enumerator :: rocblas_gemm_flags_fp16_alt_impl = 4
    enumerator :: rocblas_gemm_flags_check_solution_index = 8
    enumerator :: rocblas_gemm_flags_fp16_alt_impl_rnz = 16
    enumerator :: rocblas_gemm_flags_stochastic_rounding = 32
  end enum

  ! rocblas_check_numerics_mode_
  enum, bind(c)
    enumerator :: rocblas_check_numerics_mode_no_check = 0
    enumerator :: rocblas_check_numerics_mode_info = 1
    enumerator :: rocblas_check_numerics_mode_warn = 2
    enumerator :: rocblas_check_numerics_mode_fail = 4
    enumerator :: rocblas_check_numerics_mode_only_nan_inf = 8
  end enum

  ! rocblas_math_mode_
  enum, bind(c)
    enumerator :: rocblas_default_math = 0
    enumerator :: rocblas_xf32_xdl_math_op = 1
  end enum

  integer(c_int), parameter :: ROCBLAS_VERSION_MAJOR = 5
  integer(c_int), parameter :: ROCBLAS_VERSION_MINOR = 2
  integer(c_int), parameter :: ROCBLAS_VERSION_PATCH = 0

end module hipfort_rocsolver_enums
