!!!!!!!!!!!!!!
! dlarft example (rocSOLVER)
! see: https:!rocm.docs.amd.com/projects/rocSOLVER/en/latest/reference/auxiliary.html
!
! Forms the triangular factor T of a block Householder reflector
! H = I - V T V**T from the reflectors V and their scalar factors tau. This test
! passes V (matrix), tau (vector) and T (matrix) as native Fortran device
! arrays; tau used to be declared as a scalar, blocking this typed-array call.
!!!!!!!!!!!!!!
!
program dlarft
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocblas
  use hipfort_rocblas_enums
  use hipfort_rocsolver

  implicit none

  integer(c_int), parameter :: order = 4, k = 3, ldv = 4, ldt = 3

  ! V holds the Householder vectors column-wise (unit diagonal implicit).
  real(c_double) :: hV(order,k) = reshape([ &
      1.0d0,  0.3d0,  0.2d0,  0.1d0, &
      0.0d0,  1.0d0,  0.4d0,  0.2d0, &
      0.0d0,  0.0d0,  1.0d0,  0.5d0], [order,k])
  real(c_double) :: htau(k) = [1.5d0, 1.2d0, 1.8d0]
  real(c_double) :: hT(k,k) = 0.0d0

  real(c_double), pointer :: dV(:,:)   ! GPU buffer for V
  real(c_double), pointer :: dtau(:)   ! GPU buffer for the Householder scalars
  real(c_double), pointer :: dT(:,:)   ! GPU buffer for the triangular factor T

  type(c_ptr) :: handle ! rocblas_handle

  integer :: i
  real(c_double) :: error
  real(c_double), parameter :: rtol = 1.0d-12

  write(*,"(a)",advance="no") "-- Running test 'rocsolver_dlarft' (Fortran 2008 interfaces) - "

  call hipCheck(hipMalloc(dV,   source=hV))
  call hipCheck(hipMalloc(dtau, source=htau))
  call hipCheck(hipMalloc(dT,   source=hT))

  call rocblasCheck(rocblas_create_handle(handle))

  ! V/tau/T passed as native Fortran device arrays (resolves to _full_rank).
  call rocsolverCheck(rocsolver_dlarft(handle, rocblas_forward_direction, rocblas_column_wise, &
                                       order, k, dV, ldv, dtau, dT, ldt))

  call hipCheck(hipDeviceSynchronize())
  call hipCheck(hipMemcpy(hT, dT, hipMemcpyDeviceToHost))

  ! For the forward, column-wise variant T is upper triangular with T(i,i)=tau(i).
  do i = 1, k
     error = abs(hT(i,i) - htau(i))
     if (error > rtol) then
        write(*,*) "FAILED! T(", i, ",", i, ") = ", hT(i,i), " expected tau(", i, ") = ", htau(i)
        call exit(1)
     end if
  end do

  call hipCheck(hipFree(dV))
  call hipCheck(hipFree(dtau))
  call hipCheck(hipFree(dT))
  call rocblasCheck(rocblas_destroy_handle(handle))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"

end program dlarft
