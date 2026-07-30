!!!!!!!!!!!!!!
! dtrtri example (rocSOLVER)
! see: https:!rocm.docs.amd.com/projects/rocSOLVER/en/latest/reference/lapack.html
!
! Inverts an upper-triangular matrix in place and checks U * U^-1 == I.
! rocSOLVER writes `info` to DEVICE memory, so it is backed by a device
! allocation and passed as c_loc(dInfo).
!!!!!!!!!!!!!!
!
program dtrtri
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocblas
  use hipfort_rocblas_enums
  use hipfort_rocsolver

  implicit none

  integer(c_int), parameter :: n = 3, lda = 3

  ! Upper-triangular matrix (lower part zero), column-major:
  !   [2 1 1; 0 2 1; 0 0 2]
  real(c_double) :: hU(n,n) = reshape([ &
      2.0d0, 0.0d0, 0.0d0, &
      1.0d0, 2.0d0, 0.0d0, &
      1.0d0, 1.0d0, 2.0d0], [n,n])
  real(c_double) :: hUinv(n,n) = 0.0d0

  real(c_double), pointer :: dA(:,:)   ! GPU buffer for A (holds U^-1 on output)
  integer(c_int), pointer :: dInfo(:)  ! GPU buffer for info

  type(c_ptr) :: handle ! rocblas_handle

  integer :: i, j, l
  real(c_double) :: prod, error
  real(c_double), parameter :: error_max = 1.0d-10

  write(*,"(a)",advance="no") "-- Running test 'rocsolver_dtrtri' (Fortran 2008 interfaces) - "

  call hipCheck(hipMalloc(dA,    source=hU))
  call hipCheck(hipMalloc(dInfo, 1))

  call rocblasCheck(rocblas_create_handle(handle))

  call rocsolverCheck(rocsolver_dtrtri(handle, rocblas_fill_upper, rocblas_diagonal_non_unit, &
                                       n, dA, lda, c_loc(dInfo)))

  call hipCheck(hipDeviceSynchronize())
  call hipCheck(hipMemcpy(hUinv, dA, hipMemcpyDeviceToHost))

  ! U and U^-1 are both upper triangular (zero below), so U * U^-1 == I exactly.
  do j = 1, n
     do i = 1, n
        prod = 0.0d0
        do l = 1, n
           prod = prod + hU(i,l) * hUinv(l,j)
        end do
        error = abs(prod - merge(1.0d0, 0.0d0, i == j))
        if (error > error_max) then
           write(*,*) "FAILED! (U*Uinv)(", i, ",", j, ") = ", prod
           call exit(1)
        end if
     end do
  end do

  call hipCheck(hipFree(dA))
  call hipCheck(hipFree(dInfo))
  call rocblasCheck(rocblas_destroy_handle(handle))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"

end program dtrtri
