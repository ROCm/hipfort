!!!!!!!!!!!!!!
! dgetrf_64 example (LU with the 64-bit integer API)
! Same math as dgetrf; dimensions, pivots and info are 64-bit. Device buffers
! (int64 ipiv/info included) are passed as type(c_ptr) - the _64 routines have
! no native-array overloads. info lives on the DEVICE. The input is diagonally
! dominant so no pivoting occurs and L*U == A is checked by reconstruction
! (layout-agnostic).
!!!!!!!!!!!!!!
!
program dgetrf_64
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocblas
  use hipfort_rocsolver
  implicit none
  integer(c_int64_t), parameter :: M = 3, N = 3, lda = 3
  real(c_double), target :: hA(3,3)  = reshape((/4, 1, 1,  1, 4, 1,  1, 1, 4/), (/3, 3/))
  real(c_double), target :: hLU(3,3)
  integer(c_size_t) :: size_A = 9
  type(c_ptr) :: dA, dIpiv, dInfo, handle
  integer :: i, j, k
  real(c_double) :: lij, recon, error
  real(c_double), parameter :: error_max = 1.0d-10
  write(*,"(a)",advance="no") "-- Running test 'rocsolver_dgetrf_64' (Fortran 2008 interfaces) - "
  call hipCheck(hipMalloc(dA,    size_A * 8))
  call hipCheck(hipMalloc(dIpiv, 3_c_size_t * 8))   ! int64 pivots
  call hipCheck(hipMalloc(dInfo, 8_c_size_t))       ! int64 info
  call hipCheck(rocblas_create_handle(handle))
  call hipCheck(hipMemcpy(dA, c_loc(hA(1,1)), size_A * 8, hipMemcpyHostToDevice))
  call hipCheck(rocsolver_dgetrf_64(handle, M, N, dA, lda, dIpiv, dInfo))
  call hipCheck(hipMemcpy(c_loc(hLU(1,1)), dA, size_A * 8, hipMemcpyDeviceToHost))
  ! Reconstruct A = L*U (unit-lower L below the diagonal, U on/above).
  do j = 1, 3
     do i = 1, 3
        recon = 0.0d0
        do k = 1, min(i,j)
           if (k == i) then; lij = 1.0d0; else; lij = hLU(i,k); end if
           recon = recon + lij * hLU(k,j)
        end do
        error = abs(recon - hA(i,j))
        if (error > error_max) then
           write(*,*) "FAILED! (L*U)(", i, ",", j, ") = ", recon, " expected ", hA(i,j)
           call exit(1)
        end if
     end do
  end do
  call hipCheck(hipFree(dA)); call hipCheck(hipFree(dIpiv)); call hipCheck(hipFree(dInfo))
  call hipCheck(rocblas_destroy_handle(handle)); call hipCheck(hipDeviceReset())
  write(*,*) "PASSED!"
end program dgetrf_64
