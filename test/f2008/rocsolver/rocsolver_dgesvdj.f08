!!!!!!!!!!!!!/
! dgesvdj example (double-precision Jacobi SVD)
! see: https:!rocm.docs.amd.com/projects/rocSOLVER/en/latest/reference/lapack.html
!
! Self-verifying: compute the singular value decomposition A = U*S*V**T with the
! Jacobi method and confirm the factors reconstruct the original matrix. Using
! the reconstruction avoids sign/order ambiguity in the singular vectors.
!
! NOTE: gesvdj writes residual, n_sweeps and info to DEVICE memory, so those are
! backed by device allocations and passed as c_loc(...); host scalars fault.
! gesvdj has no generated array-pointer overload, so the matrix/vector arguments
! are passed to the raw interface via c_loc of their device pointers.
!!!!!!!!!!!!!!/
!
program dgesvdj
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocblas
  use hipfort_rocblas_enums
  use hipfort_rocsolver
  use hipfort_rocsolver_enums

  implicit none
  integer :: i, j ! indices for iterating over results

  integer(c_int), parameter :: M = 3
  integer(c_int), parameter :: N = 3
  integer(c_int), parameter :: lda = 3
  integer(c_int), parameter :: ldu = 3
  integer(c_int), parameter :: ldv = 3
  integer(c_int), parameter :: max_sweeps = 100
  real(c_double), parameter :: abstol = 0.0_c_double

  ! Nonsingular input matrix (column-major)
  real(c_double) :: hA(3,3) = reshape((/1, 4, 7, 2, 5, 8, 3, 6, 10/), (/3, 3/))
  real(c_double) :: hA0(3,3)          ! original kept for verification
  real(c_double) :: hS(3)             ! singular values
  real(c_double) :: hU(3,3)           ! left singular vectors
  real(c_double) :: hV(3,3)           ! right singular vectors
  real(c_double) :: recon(3,3)

  real(c_double), pointer :: dA(:,:), dU(:,:), dV(:,:)
  real(c_double), pointer :: dS(:)
  real(c_double), pointer :: dResidual(:)
  integer(c_int), pointer :: dNsweeps(:)
  integer(c_int), pointer :: dInfo(:)

  type(c_ptr) :: handle ! rocblas_handle

  real(c_double) :: error
  real(c_double), parameter :: error_max = 1.0d-9
  !
  write(*,"(a)",advance="no") "-- Running test 'rocsolver_dgesvdj' (Fortran 2008 interfaces) - "

  hA0 = hA ! keep original for the reconstruction check

  ! Allocate device-side memory & copy memory from host to device
  call hipCheck(hipMalloc(dA, source=hA))
  call hipCheck(hipMalloc(dS, mold=hS))
  call hipCheck(hipMalloc(dU, mold=hU))
  call hipCheck(hipMalloc(dV, mold=hV))
  call hipCheck(hipMalloc(dResidual, 1))
  call hipCheck(hipMalloc(dNsweeps, 1))
  call hipCheck(hipMalloc(dInfo, 1))

  ! Create rocBLAS handle
  call hipCheck(rocblas_create_handle(handle))

  ! Compute the singular value decomposition
  call hipCheck(rocsolver_dgesvdj(handle, rocblas_svect_singular, rocblas_svect_singular, &
       M, N, c_loc(dA(1,1)), lda, abstol, c_loc(dResidual(1)), max_sweeps, c_loc(dNsweeps(1)), &
       c_loc(dS(1)), c_loc(dU(1,1)), ldu, c_loc(dV(1,1)), ldv, c_loc(dInfo(1))))

  ! Copy results back to host
  call hipCheck(hipMemcpy(hS, dS, hipMemcpyDeviceToHost))
  call hipCheck(hipMemcpy(hU, dU, hipMemcpyDeviceToHost))
  call hipCheck(hipMemcpy(hV, dV, hipMemcpyDeviceToHost))

  ! Reconstruct A = U * diag(S) * V**T and compare with the original
  do j = 1,N
    do i = 1,M
      recon(i,j) = sum(hU(i,:) * hS(:) * hV(j,:))
    end do
  end do

  do j = 1,N
    do i = 1,M
      error = abs(recon(i,j) - hA0(i,j))
      if(error .gt. error_max) then
          write(*,*) "FAILED! Error bigger than max! Error = ", error, " (", i, ",", j, ")"
          call exit
      end if
    end do
  end do

  ! Clean up
  call hipCheck(hipFree(dA))
  call hipCheck(hipFree(dS))
  call hipCheck(hipFree(dU))
  call hipCheck(hipFree(dV))
  call hipCheck(hipFree(dResidual))
  call hipCheck(hipFree(dNsweeps))
  call hipCheck(hipFree(dInfo))
  call hipCheck(rocblas_destroy_handle(handle))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"

end program dgesvdj
