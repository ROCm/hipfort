!!!!!!!!!!!!!!
! sgtsv example (single-precision tridiagonal solve, rocSPARSE)
! see: https:!rocm.docs.amd.com/projects/rocSPARSE/en/latest/reference/precond.html
!
! Solves A x = b for a tridiagonal system. Here A is the identity tridiagonal
! (dl = du = 0, d = 1), so the exact solution of A x = b is x = b. dl/d/du/B are
! passed as Fortran arrays, exercising the generic array form of the diagonal
! arguments (they used to be declared type(c_ptr), SWDEV-485451).
!!!!!!!!!!!!!!
!
program rocsparse_sgtsv_test

  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocsparse

  implicit none

  integer, parameter :: m = 512   ! tridiagonal system size
  integer, parameter :: n = 1     ! single right-hand side

  ! Identity tridiagonal (dl = du = 0, d = 1) so the solution of A x = b is x = b.
  real(c_float), allocatable, dimension(:) :: hdl, hd, hdu, hB
  real(c_float), pointer, dimension(:) :: ddl => null(), dd => null(), &
                                          ddu => null(), dB => null()
  type(c_ptr) :: handle  = c_null_ptr
  type(c_ptr) :: dbuffer = c_null_ptr
  integer(c_size_t) :: buffer_size

  integer :: i
  real(c_float) :: error
  real(c_float), parameter :: error_max = 10*epsilon(error)

  write(*,"(a)",advance="no") "-- Running test 'SGTSV' (Fortran 2008 interfaces) - "

  call rocsparseCheck(rocsparse_create_handle(handle))

  allocate(hdl(m), hd(m), hdu(m), hB(m))

  hdl(:) = 0.0
  hd(:)  = 1.0
  hdu(:) = 0.0
  do i = 1, m
    hB(i) = real(i)   ! b(i) = i  ->  exact solution x(i) = i (identity system)
  end do

  call hipCheck(hipMalloc(ddl, source=hdl))
  call hipCheck(hipMalloc(dd,  source=hd))
  call hipCheck(hipMalloc(ddu, source=hdu))
  call hipCheck(hipMalloc(dB,  source=hB))

  ! Query the temporary buffer size. dl/d/du/B are passed as Fortran arrays —
  ! this is the generic array form that used to fail to compile because the
  ! diagonals were declared type(c_ptr) (SWDEV-485451).
  call rocsparseCheck(rocsparse_sgtsv_buffer_size(handle, m, n, ddl, dd, ddu, dB, m, buffer_size))

  call hipCheck(hipMalloc(dbuffer, buffer_size))

  ! Tridiagonal solve A x = b, in place; dl/d/du/B passed as Fortran arrays.
  call rocsparseCheck(rocsparse_sgtsv(handle, m, n, ddl, dd, ddu, dB, m, dbuffer))

  call hipCheck(hipDeviceSynchronize())

  call hipCheck(hipMemcpy(hB, dB, hipMemcpyDeviceToHost))

  do i = 1, m
    error = abs((real(i) - hB(i))/real(i))
    if( error > error_max )then
      write(*,*) "FAILED! Error bigger than max! Error = ", error, " hB(", i, ") = ", hB(i)
      call exit(1)
    end if
  end do

  call hipCheck(hipFree(ddl))
  call hipCheck(hipFree(dd))
  call hipCheck(hipFree(ddu))
  call hipCheck(hipFree(dB))
  call hipCheck(hipFree(dbuffer))

  call rocsparseCheck(rocsparse_destroy_handle(handle))

  deallocate(hdl, hd, hdu, hB)

  write(*,*) "PASSED!"

end program rocsparse_sgtsv_test
