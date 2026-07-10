! Auto-generated derived types for hipfort_rocrand
! DO NOT EDIT — re-run the generator to update.

module hipfort_rocrand_types
  use, intrinsic :: iso_c_binding
  implicit none

  type, bind(c) :: rocrand_discrete_distribution_st
    integer(c_int) :: size
    integer(c_int) :: offset
    type(c_ptr) :: alias
    type(c_ptr) :: probability
    type(c_ptr) :: cdf
  end type rocrand_discrete_distribution_st

  type, bind(c) :: uint4
    integer(c_int) :: x
    integer(c_int) :: y
    integer(c_int) :: z
    integer(c_int) :: w
  end type uint4

end module hipfort_rocrand_types
