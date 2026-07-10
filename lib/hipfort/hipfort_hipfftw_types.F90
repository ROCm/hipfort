! Auto-generated derived types for hipfort_hipfftw
! DO NOT EDIT — re-run the generator to update.

module hipfort_hipfftw_types
  use, intrinsic :: iso_c_binding
  implicit none

  type, bind(c) :: fftw_iodim
    integer(c_int) :: n
    integer(c_int) :: is
    integer(c_int) :: os
  end type fftw_iodim

  type, bind(c) :: fftw_iodim64
    integer(c_long) :: n
    integer(c_long) :: is
    integer(c_long) :: os
  end type fftw_iodim64

end module hipfort_hipfftw_types
