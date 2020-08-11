module hipfort_types
  use iso_c_binding
  implicit none
  
  type,bind(c) :: dim3
     integer(c_int) :: x,y,z 
  end type dim3

end module hipfort_types
