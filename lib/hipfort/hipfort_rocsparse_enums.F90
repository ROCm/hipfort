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

module hipfort_rocsparse_enums
  use, intrinsic :: iso_c_binding
  implicit none

  ! rocsparse_operation_
  enum, bind(c)
    enumerator :: rocsparse_operation_none = 111
    enumerator :: rocsparse_operation_transpose = 112
    enumerator :: rocsparse_operation_conjugate_transpose = 113
  end enum

  ! rocsparse_index_base_
  enum, bind(c)
    enumerator :: rocsparse_index_base_zero = 0
    enumerator :: rocsparse_index_base_one = 1
  end enum

  ! rocsparse_matrix_type_
  enum, bind(c)
    enumerator :: rocsparse_matrix_type_general = 0
    enumerator :: rocsparse_matrix_type_symmetric = 1
    enumerator :: rocsparse_matrix_type_hermitian = 2
    enumerator :: rocsparse_matrix_type_triangular = 3
  end enum

  ! rocsparse_diag_type_
  enum, bind(c)
    enumerator :: rocsparse_diag_type_non_unit = 0
    enumerator :: rocsparse_diag_type_unit = 1
  end enum

  ! rocsparse_fill_mode_
  enum, bind(c)
    enumerator :: rocsparse_fill_mode_lower = 0
    enumerator :: rocsparse_fill_mode_upper = 1
  end enum

  ! rocsparse_storage_mode_
  enum, bind(c)
    enumerator :: rocsparse_storage_mode_sorted = 0
    enumerator :: rocsparse_storage_mode_unsorted = 1
  end enum

  ! rocsparse_action_
  enum, bind(c)
    enumerator :: rocsparse_action_symbolic = 0
    enumerator :: rocsparse_action_numeric = 1
  end enum

  ! rocsparse_direction_
  enum, bind(c)
    enumerator :: rocsparse_direction_row = 0
    enumerator :: rocsparse_direction_column = 1
  end enum

  ! rocsparse_hyb_partition_
  enum, bind(c)
    enumerator :: rocsparse_hyb_partition_auto = 0
    enumerator :: rocsparse_hyb_partition_user = 1
    enumerator :: rocsparse_hyb_partition_max = 2
  end enum

  ! rocsparse_analysis_policy_
  enum, bind(c)
    enumerator :: rocsparse_analysis_policy_reuse = 0
    enumerator :: rocsparse_analysis_policy_force = 1
  end enum

  ! rocsparse_solve_policy_
  enum, bind(c)
    enumerator :: rocsparse_solve_policy_auto = 0
  end enum

  ! rocsparse_pointer_mode_
  enum, bind(c)
    enumerator :: rocsparse_pointer_mode_host = 0
    enumerator :: rocsparse_pointer_mode_device = 1
  end enum

  ! rocsparse_layer_mode
  enum, bind(c)
    enumerator :: rocsparse_layer_mode_none = 0
    enumerator :: rocsparse_layer_mode_log_trace = 1
    enumerator :: rocsparse_layer_mode_log_bench = 2
    enumerator :: rocsparse_layer_mode_log_debug = 4
  end enum

  ! rocsparse_status_
  enum, bind(c)
    enumerator :: rocsparse_status_success = 0
    enumerator :: rocsparse_status_invalid_handle = 1
    enumerator :: rocsparse_status_not_implemented = 2
    enumerator :: rocsparse_status_invalid_pointer = 3
    enumerator :: rocsparse_status_invalid_size = 4
    enumerator :: rocsparse_status_memory_error = 5
    enumerator :: rocsparse_status_internal_error = 6
    enumerator :: rocsparse_status_invalid_value = 7
    enumerator :: rocsparse_status_arch_mismatch = 8
    enumerator :: rocsparse_status_zero_pivot = 9
    enumerator :: rocsparse_status_not_initialized = 10
    enumerator :: rocsparse_status_type_mismatch = 11
    enumerator :: rocsparse_status_requires_sorted_storage = 12
    enumerator :: rocsparse_status_thrown_exception = 13
    enumerator :: rocsparse_status_continue = 14
  end enum

  ! rocsparse_data_status_
  enum, bind(c)
    enumerator :: rocsparse_data_status_success = 0
    enumerator :: rocsparse_data_status_inf = 1
    enumerator :: rocsparse_data_status_nan = 2
    enumerator :: rocsparse_data_status_invalid_offset_ptr = 3
    enumerator :: rocsparse_data_status_invalid_index = 4
    enumerator :: rocsparse_data_status_duplicate_entry = 5
    enumerator :: rocsparse_data_status_invalid_sorting = 6
    enumerator :: rocsparse_data_status_invalid_fill = 7
  end enum

  ! rocsparse_indextype_
  enum, bind(c)
    enumerator :: rocsparse_indextype_u16 = 1
    enumerator :: rocsparse_indextype_i32 = 2
    enumerator :: rocsparse_indextype_i64 = 3
  end enum

  ! rocsparse_datatype_
  enum, bind(c)
    enumerator :: rocsparse_datatype_f16_r = 150
    enumerator :: rocsparse_datatype_f32_r = 151
    enumerator :: rocsparse_datatype_f64_r = 152
    enumerator :: rocsparse_datatype_f32_c = 154
    enumerator :: rocsparse_datatype_f64_c = 155
    enumerator :: rocsparse_datatype_i8_r = 160
    enumerator :: rocsparse_datatype_u8_r = 161
    enumerator :: rocsparse_datatype_i32_r = 162
    enumerator :: rocsparse_datatype_u32_r = 163
    enumerator :: rocsparse_datatype_bf16_r = 168
  end enum

  ! rocsparse_format_
  enum, bind(c)
    enumerator :: rocsparse_format_coo = 0
    enumerator :: rocsparse_format_coo_aos = 1
    enumerator :: rocsparse_format_csr = 2
    enumerator :: rocsparse_format_csc = 3
    enumerator :: rocsparse_format_ell = 4
    enumerator :: rocsparse_format_bell = 5
    enumerator :: rocsparse_format_bsr = 6
    enumerator :: rocsparse_format_sell = 7
  end enum

  ! rocsparse_order_
  enum, bind(c)
    enumerator :: rocsparse_order_row = 0
    enumerator :: rocsparse_order_column = 1
  end enum

  ! rocsparse_spmat_attribute_
  enum, bind(c)
    enumerator :: rocsparse_spmat_fill_mode = 0
    enumerator :: rocsparse_spmat_diag_type = 1
    enumerator :: rocsparse_spmat_matrix_type = 2
    enumerator :: rocsparse_spmat_storage_mode = 3
  end enum

  ! rocsparse_sparse_to_sparse_alg_
  enum, bind(c)
    enumerator :: rocsparse_sparse_to_sparse_alg_default = 0
  end enum

  ! rocsparse_sparse_to_sparse_stage_
  enum, bind(c)
    enumerator :: rocsparse_sparse_to_sparse_stage_analysis = 0
    enumerator :: rocsparse_sparse_to_sparse_stage_compute = 1
  end enum

  ! rocsparse_extract_alg_
  enum, bind(c)
    enumerator :: rocsparse_extract_alg_default = 0
  end enum

  ! rocsparse_extract_stage_
  enum, bind(c)
    enumerator :: rocsparse_extract_stage_analysis = 0
    enumerator :: rocsparse_extract_stage_compute = 1
  end enum

  ! rocsparse_itilu0_alg_
  enum, bind(c)
    enumerator :: rocsparse_itilu0_alg_default = 0
    enumerator :: rocsparse_itilu0_alg_async_inplace = 1
    enumerator :: rocsparse_itilu0_alg_async_split = 2
    enumerator :: rocsparse_itilu0_alg_sync_split = 3
    enumerator :: rocsparse_itilu0_alg_sync_split_fusion = 4
  end enum

  ! rocsparse_itilu0_option_
  enum, bind(c)
    enumerator :: rocsparse_itilu0_option_verbose = 1
    enumerator :: rocsparse_itilu0_option_stopping_criteria = 2
    enumerator :: rocsparse_itilu0_option_compute_nrm_correction = 4
    enumerator :: rocsparse_itilu0_option_compute_nrm_residual = 8
    enumerator :: rocsparse_itilu0_option_convergence_history = 16
    enumerator :: rocsparse_itilu0_option_coo_format = 32
  end enum

  ! rocsparse_gtsv_interleaved_alg_
  enum, bind(c)
    enumerator :: rocsparse_gtsv_interleaved_alg_default = 0
    enumerator :: rocsparse_gtsv_interleaved_alg_thomas = 1
    enumerator :: rocsparse_gtsv_interleaved_alg_lu = 2
    enumerator :: rocsparse_gtsv_interleaved_alg_qr = 3
  end enum

  ! rocsparse_check_spmat_stage_
  enum, bind(c)
    enumerator :: rocsparse_check_spmat_stage_buffer_size = 0
    enumerator :: rocsparse_check_spmat_stage_compute = 1
  end enum

  ! rocsparse_spmv_input_
  enum, bind(c)
    enumerator :: rocsparse_spmv_input_alg = 0
    enumerator :: rocsparse_spmv_input_operation = 1
    enumerator :: rocsparse_spmv_input_scalar_datatype = 2
    enumerator :: rocsparse_spmv_input_compute_datatype = 3
    enumerator :: rocsparse_spmv_input_nnz_use_starting_block_ids = 4
    enumerator :: rocsparse_spmv_input_enable_extra = 5
  end enum

  ! rocsparse_v2_spmv_stage_
  enum, bind(c)
    enumerator :: rocsparse_v2_spmv_stage_analysis = 0
    enumerator :: rocsparse_v2_spmv_stage_compute = 1
  end enum

  ! rocsparse_spmv_stage_
  enum, bind(c)
    enumerator :: rocsparse_spmv_stage_buffer_size = 1
    enumerator :: rocsparse_spmv_stage_preprocess = 2
    enumerator :: rocsparse_spmv_stage_compute = 3
  end enum

  ! rocsparse_spmv_alg_
  enum, bind(c)
    enumerator :: rocsparse_spmv_alg_default = 0
    enumerator :: rocsparse_spmv_alg_coo = 1
    enumerator :: rocsparse_spmv_alg_csr_adaptive = 2
    enumerator :: rocsparse_spmv_alg_csr_rowsplit = 3
    enumerator :: rocsparse_spmv_alg_ell = 4
    enumerator :: rocsparse_spmv_alg_coo_atomic = 5
    enumerator :: rocsparse_spmv_alg_bsr = 6
    enumerator :: rocsparse_spmv_alg_csr_lrb = 7
    enumerator :: rocsparse_spmv_alg_csr_nnzsplit = 8
    enumerator :: rocsparse_spmv_alg_sell = 9
    enumerator :: rocsparse_spmv_alg_csr_stream = 3
  end enum

  ! rocsparse_spsv_alg_
  enum, bind(c)
    enumerator :: rocsparse_spsv_alg_default = 0
  end enum

  ! rocsparse_spsv_stage_
  enum, bind(c)
    enumerator :: rocsparse_spsv_stage_buffer_size = 1
    enumerator :: rocsparse_spsv_stage_preprocess = 2
    enumerator :: rocsparse_spsv_stage_compute = 3
  end enum

  ! rocsparse_spitsv_alg_
  enum, bind(c)
    enumerator :: rocsparse_spitsv_alg_default = 0
  end enum

  ! rocsparse_spitsv_stage_
  enum, bind(c)
    enumerator :: rocsparse_spitsv_stage_buffer_size = 1
    enumerator :: rocsparse_spitsv_stage_preprocess = 2
    enumerator :: rocsparse_spitsv_stage_compute = 3
  end enum

  ! rocsparse_spsm_alg_
  enum, bind(c)
    enumerator :: rocsparse_spsm_alg_default = 0
  end enum

  ! rocsparse_spsm_stage_
  enum, bind(c)
    enumerator :: rocsparse_spsm_stage_buffer_size = 1
    enumerator :: rocsparse_spsm_stage_preprocess = 2
    enumerator :: rocsparse_spsm_stage_compute = 3
  end enum

  ! rocsparse_spmm_alg_
  enum, bind(c)
    enumerator :: rocsparse_spmm_alg_default = 0
    enumerator :: rocsparse_spmm_alg_csr = 1
    enumerator :: rocsparse_spmm_alg_coo_segmented = 2
    enumerator :: rocsparse_spmm_alg_coo_atomic = 3
    enumerator :: rocsparse_spmm_alg_csr_row_split = 4
    enumerator :: rocsparse_spmm_alg_csr_merge = 5
    enumerator :: rocsparse_spmm_alg_coo_segmented_atomic = 6
    enumerator :: rocsparse_spmm_alg_bell = 7
    enumerator :: rocsparse_spmm_alg_bsr = 8
    enumerator :: rocsparse_spmm_alg_csr_merge_path = 9
    enumerator :: rocsparse_spmm_alg_csr_nnz_split = 5
  end enum

  ! rocsparse_sddmm_alg_
  enum, bind(c)
    enumerator :: rocsparse_sddmm_alg_default = 0
    enumerator :: rocsparse_sddmm_alg_dense = 1
  end enum

  ! rocsparse_sparse_to_dense_alg_
  enum, bind(c)
    enumerator :: rocsparse_sparse_to_dense_alg_default = 0
  end enum

  ! rocsparse_dense_to_sparse_alg_
  enum, bind(c)
    enumerator :: rocsparse_dense_to_sparse_alg_default = 0
  end enum

  ! rocsparse_spmm_stage_
  enum, bind(c)
    enumerator :: rocsparse_spmm_stage_buffer_size = 1
    enumerator :: rocsparse_spmm_stage_preprocess = 2
    enumerator :: rocsparse_spmm_stage_compute = 3
  end enum

  ! rocsparse_spgemm_stage_
  enum, bind(c)
    enumerator :: rocsparse_spgemm_stage_buffer_size = 1
    enumerator :: rocsparse_spgemm_stage_nnz = 2
    enumerator :: rocsparse_spgemm_stage_compute = 3
    enumerator :: rocsparse_spgemm_stage_symbolic = 4
    enumerator :: rocsparse_spgemm_stage_numeric = 5
  end enum

  ! rocsparse_spgemm_alg_
  enum, bind(c)
    enumerator :: rocsparse_spgemm_alg_default = 0
  end enum

  ! rocsparse_singularity_
  enum, bind(c)
    enumerator :: rocsparse_singularity_none = 0
    enumerator :: rocsparse_singularity_symbolic = 1
    enumerator :: rocsparse_singularity_numeric_exact = 2
    enumerator :: rocsparse_singularity_numeric_near = 3
  end enum

  ! rocsparse_sptrsv_alg_
  enum, bind(c)
    enumerator :: rocsparse_sptrsv_alg_default = 0
  end enum

  ! rocsparse_sptrsv_stage_
  enum, bind(c)
    enumerator :: rocsparse_sptrsv_stage_analysis = 0
    enumerator :: rocsparse_sptrsv_stage_compute = 1
  end enum

  ! rocsparse_sptrsv_input_
  enum, bind(c)
    enumerator :: rocsparse_sptrsv_input_alg = 0
    enumerator :: rocsparse_sptrsv_input_operation = 1
    enumerator :: rocsparse_sptrsv_input_scalar_datatype = 2
    enumerator :: rocsparse_sptrsv_input_compute_datatype = 3
    enumerator :: rocsparse_sptrsv_input_scalar_alpha = 4
    enumerator :: rocsparse_sptrsv_input_analysis_policy = 5
  end enum

  ! rocsparse_sptrsv_output_
  enum, bind(c)
    enumerator :: rocsparse_sptrsv_output_zero_pivot_position = 0
    enumerator :: rocsparse_sptrsv_output_singularity = 1
    enumerator :: rocsparse_sptrsv_output_singularity_position = 2
  end enum

  ! rocsparse_sptrsm_alg_
  enum, bind(c)
    enumerator :: rocsparse_sptrsm_alg_default = 0
  end enum

  ! rocsparse_sptrsm_stage_
  enum, bind(c)
    enumerator :: rocsparse_sptrsm_stage_analysis = 0
    enumerator :: rocsparse_sptrsm_stage_compute = 1
  end enum

  ! rocsparse_sptrsm_input_
  enum, bind(c)
    enumerator :: rocsparse_sptrsm_input_alg = 0
    enumerator :: rocsparse_sptrsm_input_operation_A = 1
    enumerator :: rocsparse_sptrsm_input_operation_X = 2
    enumerator :: rocsparse_sptrsm_input_compute_datatype = 3
    enumerator :: rocsparse_sptrsm_input_scalar_datatype = 4
    enumerator :: rocsparse_sptrsm_input_scalar_alpha = 5
    enumerator :: rocsparse_sptrsm_input_analysis_policy = 6
  end enum

  ! rocsparse_sptrsm_output_
  enum, bind(c)
    enumerator :: rocsparse_sptrsm_output_zero_pivot_position = 0
  end enum

  ! rocsparse_spic0_alg_
  enum, bind(c)
    enumerator :: rocsparse_spic0_alg_default = 0
  end enum

  ! rocsparse_spic0_stage_
  enum, bind(c)
    enumerator :: rocsparse_spic0_stage_analysis = 0
    enumerator :: rocsparse_spic0_stage_compute = 1
  end enum

  ! rocsparse_spic0_input_
  enum, bind(c)
    enumerator :: rocsparse_spic0_input_alg = 0
    enumerator :: rocsparse_spic0_input_analysis_policy = 1
    enumerator :: rocsparse_spic0_input_compute_datatype = 2
    enumerator :: rocsparse_spic0_input_boost_enable = 3
    enumerator :: rocsparse_spic0_input_boost_tolerance = 4
    enumerator :: rocsparse_spic0_input_boost_value = 5
    enumerator :: rocsparse_spic0_input_singularity_tolerance = 6
  end enum

  ! rocsparse_spic0_output_
  enum, bind(c)
    enumerator :: rocsparse_spic0_output_singularity = 0
    enumerator :: rocsparse_spic0_output_singularity_position = 1
  end enum

  ! rocsparse_spilu0_alg_
  enum, bind(c)
    enumerator :: rocsparse_spilu0_alg_default = 0
  end enum

  ! rocsparse_spilu0_stage_
  enum, bind(c)
    enumerator :: rocsparse_spilu0_stage_analysis = 0
    enumerator :: rocsparse_spilu0_stage_compute = 1
  end enum

  ! rocsparse_spilu0_input_
  enum, bind(c)
    enumerator :: rocsparse_spilu0_input_alg = 0
    enumerator :: rocsparse_spilu0_input_analysis_policy = 1
    enumerator :: rocsparse_spilu0_input_compute_datatype = 2
    enumerator :: rocsparse_spilu0_input_boost_enable = 3
    enumerator :: rocsparse_spilu0_input_boost_tolerance = 4
    enumerator :: rocsparse_spilu0_input_boost_value = 5
    enumerator :: rocsparse_spilu0_input_singularity_tolerance = 6
  end enum

  ! rocsparse_spilu0_output_
  enum, bind(c)
    enumerator :: rocsparse_spilu0_output_singularity = 0
    enumerator :: rocsparse_spilu0_output_singularity_position = 1
  end enum

  ! rocsparse_spildlt0_alg_
  enum, bind(c)
    enumerator :: rocsparse_spildlt0_alg_default = 0
  end enum

  ! rocsparse_spildlt0_stage_
  enum, bind(c)
    enumerator :: rocsparse_spildlt0_stage_analysis = 0
    enumerator :: rocsparse_spildlt0_stage_compute = 1
  end enum

  ! rocsparse_spildlt0_input_
  enum, bind(c)
    enumerator :: rocsparse_spildlt0_input_alg = 0
    enumerator :: rocsparse_spildlt0_input_analysis_policy = 1
    enumerator :: rocsparse_spildlt0_input_compute_datatype = 2
    enumerator :: rocsparse_spildlt0_input_boost_enable = 3
    enumerator :: rocsparse_spildlt0_input_boost_tolerance = 4
    enumerator :: rocsparse_spildlt0_input_boost_value = 5
    enumerator :: rocsparse_spildlt0_input_singularity_tolerance = 6
    enumerator :: rocsparse_spildlt0_input_diag = 7
  end enum

  ! rocsparse_spildlt0_output_
  enum, bind(c)
    enumerator :: rocsparse_spildlt0_output_singularity = 0
    enumerator :: rocsparse_spildlt0_output_singularity_position = 1
  end enum

  ! rocsparse_spgeam_stage_
  enum, bind(c)
    enumerator :: rocsparse_spgeam_stage_analysis = 1
    enumerator :: rocsparse_spgeam_stage_compute = 2
    enumerator :: rocsparse_spgeam_stage_symbolic_analysis = 3
    enumerator :: rocsparse_spgeam_stage_symbolic_compute = 4
    enumerator :: rocsparse_spgeam_stage_numeric_analysis = 5
    enumerator :: rocsparse_spgeam_stage_numeric_compute = 6
  end enum

  ! rocsparse_spgeam_input_
  enum, bind(c)
    enumerator :: rocsparse_spgeam_input_alg = 0
    enumerator :: rocsparse_spgeam_input_scalar_datatype = 1
    enumerator :: rocsparse_spgeam_input_compute_datatype = 2
    enumerator :: rocsparse_spgeam_input_operation_A = 3
    enumerator :: rocsparse_spgeam_input_operation_B = 4
    enumerator :: rocsparse_spgeam_input_scalar_alpha = 5
    enumerator :: rocsparse_spgeam_input_scalar_beta = 6
  end enum

  ! rocsparse_spgeam_output_
  enum, bind(c)
    enumerator :: rocsparse_spgeam_output_nnz = 0
  end enum

  ! rocsparse_spgeam_alg_
  enum, bind(c)
    enumerator :: rocsparse_spgeam_alg_default = 0
  end enum

  ! rocsparse_gpsv_interleaved_alg_
  enum, bind(c)
    enumerator :: rocsparse_gpsv_interleaved_alg_default = 0
    enumerator :: rocsparse_gpsv_interleaved_alg_qr = 1
  end enum

  integer(c_int), parameter :: ROCSPARSE_VERSION_MAJOR = 4
  integer(c_int), parameter :: ROCSPARSE_VERSION_MINOR = 2
  integer(c_int), parameter :: ROCSPARSE_VERSION_PATCH = 0

end module hipfort_rocsparse_enums
