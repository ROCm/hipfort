! Auto-generated derived types for hipfort_hipsparse
! DO NOT EDIT — re-run the generator to update.

module hipfort_hipsparse_types
  use, intrinsic :: iso_c_binding
  implicit none

  type, bind(c) :: hipsparseBfloat16
    integer(c_short) :: data
  end type hipsparseBfloat16

  type, bind(c) :: hipsparseFloat16
    integer(c_short) :: data
  end type hipsparseFloat16

end module hipfort_hipsparse_types
