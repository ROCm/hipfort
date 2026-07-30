!!!!!!!!!!!!!!
! dgetri_npvt example (inverse from a no-pivoting LU)
! Factorizes with getrf_npvt then inverts with getri_npvt and checks
! A * A^-1 == I. rocSOLVER writes info to DEVICE memory (c_loc(dInfo)).
!!!!!!!!!!!!!!
!
program dgetri_npvt
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocblas
  use hipfort_rocsolver
  implicit none
  integer(c_int), parameter :: N = 3, lda = 3
  real(c_double) :: hA(3,3)   = reshape((/4, 1, 1,  1, 4, 1,  1, 1, 4/), (/3,3/))  ! SPD, no pivoting
  real(c_double) :: hAinv(3,3)
  real(c_double), pointer :: dA(:,:)
  integer(c_int), pointer :: dInfo(:)
  type(c_ptr) :: handle
  integer :: i, j, k
  real(c_double) :: prod, error
  real(c_double), parameter :: error_max = 1.0d-9
  write(*,"(a)",advance="no") "-- Running test 'rocsolver_dgetri_npvt' (Fortran 2008 interfaces) - "
  call hipCheck(hipMalloc(dA, source=hA))
  call hipCheck(hipMalloc(dInfo, 1))
  call hipCheck(rocblas_create_handle(handle))
  call hipCheck(rocsolver_dgetrf_npvt(handle, N, N, dA, lda, c_loc(dInfo)))
  call hipCheck(rocsolver_dgetri_npvt(handle, N, dA, lda, c_loc(dInfo)))
  call hipCheck(hipMemcpy(hAinv, dA, hipMemcpyDeviceToHost))
  do j = 1, N
     do i = 1, N
        prod = 0.0d0
        do k = 1, N
           prod = prod + hA(i,k) * hAinv(k,j)
        end do
        error = abs(prod - merge(1.0d0, 0.0d0, i == j))
        if (error > error_max) then
           write(*,*) "FAILED! (A*Ainv)(", i, ",", j, ") = ", prod
           call exit(1)
        end if
     end do
  end do
  call hipCheck(hipFree(dA)); call hipCheck(hipFree(dInfo))
  call hipCheck(rocblas_destroy_handle(handle)); call hipCheck(hipDeviceReset())
  write(*,*) "PASSED!"
end program dgetri_npvt
