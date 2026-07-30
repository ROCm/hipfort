!!!!!!!!!!!!!!
! dpotri example (double-precision inverse of an SPD matrix via Cholesky)
! see: https:!rocm.docs.amd.com/projects/rocSOLVER/en/latest/reference/lapack.html
!
! Factorizes A = U**T U with potrf, then inverts it in place with potri, and
! checks A * A^-1 == I. rocSOLVER writes `info` to DEVICE memory (passed as
! c_loc(dInfo)). potri fills the requested triangle only, so the result is
! symmetrized before the product check.
!!!!!!!!!!!!!!
!
program dpotri
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocblas
  use hipfort_rocblas_enums
  use hipfort_rocsolver

  implicit none

  integer(c_int), parameter :: N = 3, lda = 3

  ! SPD matrix (column-major); hA keeps the original (device copy is overwritten).
  real(c_double) :: hA(N,N) = reshape((/2, 1, 0,  1, 2, 1,  0, 1, 2/), (/N, N/))
  real(c_double) :: hAinv(N,N)

  real(c_double), pointer :: dA(:,:)
  integer(c_int), pointer :: dInfo(:)

  type(c_ptr) :: handle

  integer :: i, j, k
  real(c_double) :: prod, error
  real(c_double), parameter :: error_max = 1.0d-9

  write(*,"(a)",advance="no") "-- Running test 'rocsolver_dpotri' (Fortran 2008 interfaces) - "

  call hipCheck(hipMalloc(dA,    source=hA))
  call hipCheck(hipMalloc(dInfo, 1))

  call hipCheck(rocblas_create_handle(handle))

  ! Cholesky factorization, then inverse (both on the upper triangle).
  call hipCheck(rocsolver_dpotrf(handle, rocblas_fill_upper, N, dA, lda, c_loc(dInfo)))
  call hipCheck(rocsolver_dpotri(handle, rocblas_fill_upper, N, dA, lda, c_loc(dInfo)))

  call hipCheck(hipMemcpy(hAinv, dA, hipMemcpyDeviceToHost))

  ! The inverse is symmetric; potri wrote only the upper triangle.
  do j = 1, N
     do i = 1, j-1
        hAinv(j,i) = hAinv(i,j)
     end do
  end do

  ! Check A * A^-1 == I (hA still holds the original matrix).
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

  call hipCheck(hipFree(dA))
  call hipCheck(hipFree(dInfo))
  call hipCheck(rocblas_destroy_handle(handle))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"

end program dpotri
