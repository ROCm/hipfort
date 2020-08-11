module iso_c_binding_ext 
  implicit none 
  interface
    !
    ! \brief add an offset (in bytes) to a `type(c_ptr)`.
    !
    function inc_c_ptr(p, offset) bind(c,name='inc_c_ptr')
      use iso_c_binding
      implicit none 
      type(c_ptr) :: inc_c_ptr
      type(c_ptr), value :: p
      integer(c_ptrdiff_t), value :: offset
    end function
  end interface
end module iso_c_binding_ext
