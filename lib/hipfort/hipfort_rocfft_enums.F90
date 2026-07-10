! Auto-generated enums for hipfort_rocfft
! DO NOT EDIT — re-run the generator to update.

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
