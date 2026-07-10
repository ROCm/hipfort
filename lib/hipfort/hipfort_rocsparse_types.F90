! Auto-generated derived types for hipfort_rocsparse
! DO NOT EDIT — re-run the generator to update.

module hipfort_rocsparse_types
  use, intrinsic :: iso_c_binding
  implicit none

  type, bind(c) :: rocsparse_float_complex
    real(c_float) :: x
    real(c_float) :: y
  end type rocsparse_float_complex

  type, bind(c) :: rocsparse_double_complex
    real(c_double) :: x
    real(c_double) :: y
  end type rocsparse_double_complex

  type, bind(c) :: rocsparse_bfloat16
    integer(c_short) :: data
  end type rocsparse_bfloat16

end module hipfort_rocsparse_types
