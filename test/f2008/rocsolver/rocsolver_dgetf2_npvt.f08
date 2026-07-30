!!!!!!!!!!!!!!
! dgetf2_npvt example (double-precision unblocked LU without pivoting)
! Reconstructs L*U and checks it equals the original A (which must have an LU
! without pivoting - here an SPD, diagonally dominant matrix). rocSOLVER writes
! info to DEVICE memory (passed as c_loc(dInfo)).
!!!!!!!!!!!!!!
!
program dgetf2_npvt
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocblas
  use hipfort_rocsolver
  implicit none
  integer(c_int), parameter :: M = 3, N = 3, lda = 3
  real(c_double) :: hA(3,3)  = reshape((/4, 1, 1,  1, 4, 1,  1, 1, 4/), (/3,3/))  ! SPD, no pivoting
  real(c_double) :: hLU(3,3)
  real(c_double), pointer :: dA(:,:)
  integer(c_int), pointer :: dInfo(:)
  type(c_ptr) :: handle
  integer :: i, j, k
  real(c_double) :: lij, ukj, recon, error
  real(c_double), parameter :: error_max = 1.0d-10
  write(*,"(a)",advance="no") "-- Running test 'rocsolver_dgetf2_npvt' (Fortran 2008 interfaces) - "
  call hipCheck(hipMalloc(dA, source=hA))
  call hipCheck(hipMalloc(dInfo, 1))
  call hipCheck(rocblas_create_handle(handle))
  call hipCheck(rocsolver_dgetf2_npvt(handle, M, N, dA, lda, c_loc(dInfo)))
  call hipCheck(hipMemcpy(hLU, dA, hipMemcpyDeviceToHost))
  ! Reconstruct A = L*U (L unit-lower from strictly-below, U on/above diagonal).
  do j = 1, N
     do i = 1, M
        recon = 0.0d0
        do k = 1, min(i,j)
           if (k == i) then
              lij = 1.0d0
           else
              lij = hLU(i,k)
           end if
           ukj = hLU(k,j)
           recon = recon + lij * ukj
        end do
        error = abs(recon - hA(i,j))
        if (error > error_max) then
           write(*,*) "FAILED! (L*U)(", i, ",", j, ") = ", recon, " expected ", hA(i,j)
           call exit(1)
        end if
     end do
  end do
  call hipCheck(hipFree(dA)); call hipCheck(hipFree(dInfo))
  call hipCheck(rocblas_destroy_handle(handle)); call hipCheck(hipDeviceReset())
  write(*,*) "PASSED!"
end program dgetf2_npvt
