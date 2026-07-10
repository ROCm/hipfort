! Auto-generated derived types for hipfort_rocsolver
! DO NOT EDIT — re-run the generator to update.

module hipfort_rocsolver_types
  use, intrinsic :: iso_c_binding
  implicit none

  type, bind(c) :: rocblas_bfloat16
    integer(c_short) :: data
  end type rocblas_bfloat16

  type, bind(c) :: rocblas_half
    integer(c_short) :: data
  end type rocblas_half

  type, bind(c) :: rocblas_float_complex
    real(c_float) :: x
    real(c_float) :: y
  end type rocblas_float_complex

  type, bind(c) :: rocblas_double_complex
    real(c_double) :: x
    real(c_double) :: y
  end type rocblas_double_complex

end module hipfort_rocsolver_types
