!!!!!!!!!!!!!/
! hipsolverSgesvdj example (single-precision Jacobi SVD)
! see: https:!rocm.docs.amd.com/projects/hipSOLVER/en/latest/
!
! Self-verifying: compute the singular value decomposition A = U*S*V**T with the
! Jacobi method and confirm the factors reconstruct the original matrix. Using
! the reconstruction avoids sign/order ambiguity in the singular vectors.
!
! gesvdj has no generated array-pointer overload, so the matrix/vector arguments
! are passed to the generic interface via c_loc of their device pointers.
!!!!!!!!!!!!!!/
!
program sgesvdj
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipsolver
  use hipfort_hipsolver_enums

  implicit none
  integer :: i, j ! indices for iterating over results

  integer(c_int), parameter :: M = 3
  integer(c_int), parameter :: N = 3
  integer(c_int), parameter :: lda = 3
  integer(c_int), parameter :: ldu = 3
  integer(c_int), parameter :: ldv = 3
  integer(c_int), parameter :: econ = 0

  ! Nonsingular input matrix (column-major)
  real(c_float) :: hA(3,3) = reshape((/1, 4, 7, 2, 5, 8, 3, 6, 10/), (/3, 3/))
  real(c_float) :: hA0(3,3)          ! original kept for verification
  real(c_float) :: hS(3)             ! singular values
  real(c_float) :: hU(3,3)           ! left singular vectors
  real(c_float) :: hV(3,3)           ! right singular vectors
  real(c_float) :: recon(3,3)

  type(c_ptr) :: handle = c_null_ptr
  type(c_ptr) :: params = c_null_ptr
  real(c_float), pointer :: dA(:,:), dU(:,:), dV(:,:)
  real(c_float), pointer :: dS(:)
  integer(c_int), pointer :: dInfo(:)
  type(c_ptr) :: dWork
  integer(c_int) :: lwork

  real(c_float) :: error
  real(c_float), parameter :: error_max = 1.0e-4
  !
  write(*,"(a)",advance="no") "-- Running test 'hipsolverSgesvdj' (Fortran 2008 interfaces) - "

  hA0 = hA ! keep original for the reconstruction check

  call hipsolverCheck(hipsolverCreate(handle))
  call hipsolverCheck(hipsolverCreateGesvdjInfo(params))

  ! Allocate device-side memory & copy memory from host to device
  call hipCheck(hipMalloc(dA, source=hA))
  call hipCheck(hipMalloc(dS, mold=hS))
  call hipCheck(hipMalloc(dU, mold=hU))
  call hipCheck(hipMalloc(dV, mold=hV))
  call hipCheck(hipMalloc(dInfo, 1))

  ! Query workspace size and allocate it
  call hipsolverCheck(hipsolverSgesvdj_bufferSize(handle, HIPSOLVER_EIG_MODE_VECTOR, econ, &
       M, N, c_loc(dA(1,1)), lda, c_loc(dS(1)), c_loc(dU(1,1)), ldu, c_loc(dV(1,1)), ldv, lwork, params))
  call hipCheck(hipMalloc(dWork, int(lwork,c_size_t) * 4))

  ! Compute the singular value decomposition
  call hipsolverCheck(hipsolverSgesvdj(handle, HIPSOLVER_EIG_MODE_VECTOR, econ, &
       M, N, c_loc(dA(1,1)), lda, c_loc(dS(1)), c_loc(dU(1,1)), ldu, c_loc(dV(1,1)), ldv, &
       dWork, lwork, dInfo(1), params))

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
  call hipCheck(hipFree(dWork))
  call hipCheck(hipFree(dA))
  call hipCheck(hipFree(dS))
  call hipCheck(hipFree(dU))
  call hipCheck(hipFree(dV))
  call hipCheck(hipFree(dInfo))
  call hipsolverCheck(hipsolverDestroyGesvdjInfo(params))
  call hipsolverCheck(hipsolverDestroy(handle))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"

end program sgesvdj
