!!!!!!!!!!!!!/
! hipsolverSormqr example (single-precision multiply by Q from a QR
! factorization)
! see: https:!rocm.docs.amd.com/projects/hipSOLVER/en/latest/
!
! Self-verifying: factorize A with geqrf to obtain Q (as Householder vectors),
! then form Q*C with ormqr. Q is orthogonal, so it preserves the Frobenius norm:
! ||Q*C||_F = ||C||_F. Norm preservation is sign-convention independent, so no
! reference matrix is needed.
!!!!!!!!!!!!!!/
!
program sormqr
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipsolver
  use hipfort_hipsolver_enums

  implicit none
  integer :: i, j

  integer(c_int), parameter :: M = 3
  integer(c_int), parameter :: N = 2
  integer(c_int), parameter :: K = 3
  integer(c_int), parameter :: lda = 3
  integer(c_int), parameter :: ldc = 3

  real(c_float) :: hA(3,3) = reshape((/1, 4, 7, 2, 5, 8, 3, 6, 10/), (/3, 3/))
  real(c_float) :: hC(3,2) = reshape((/1, 2, 3, 4, 5, 6/), (/3, 2/))
  real(c_float) :: hTau(3)
  real(c_float) :: norm_in, norm_out

  type(c_ptr) :: handle = c_null_ptr
  real(c_float), pointer :: dA(:,:)
  real(c_float), pointer :: dC(:,:)
  real(c_float), pointer :: dTau(:)
  integer(c_int), pointer :: dInfo(:)
  type(c_ptr) :: dWork
  integer(c_int) :: lwork_qr, lwork_mq, lwork

  real(c_float) :: error
  real(c_float), parameter :: error_max = 1.0e-5
  !
  write(*,"(a)",advance="no") "-- Running test 'hipsolverSormqr' (Fortran 2008 interfaces) - "

  norm_in = sqrt(sum(hC*hC))

  call hipsolverCheck(hipsolverCreate(handle))

  call hipCheck(hipMalloc(dA, source=hA))
  call hipCheck(hipMalloc(dC, source=hC))
  call hipCheck(hipMalloc(dTau, mold=hTau))
  call hipCheck(hipMalloc(dInfo, 1))

  call hipsolverCheck(hipsolverSgeqrf_bufferSize(handle, M, K, dA, lda, lwork_qr))
  call hipsolverCheck(hipsolverSormqr_bufferSize(handle, HIPSOLVER_SIDE_LEFT, HIPSOLVER_OP_N, &
       M, N, K, dA, lda, dTau(1), dC, ldc, lwork_mq))
  lwork = max(lwork_qr, lwork_mq)
  call hipCheck(hipMalloc(dWork, int(lwork,c_size_t) * 4))

  call hipsolverCheck(hipsolverSgeqrf(handle, M, K, dA, lda, dTau(1), dWork, lwork, dInfo(1)))
  call hipsolverCheck(hipsolverSormqr(handle, HIPSOLVER_SIDE_LEFT, HIPSOLVER_OP_N, &
       M, N, K, dA, lda, dTau(1), dC, ldc, dWork, lwork, dInfo(1)))

  call hipCheck(hipMemcpy(hC, dC, hipMemcpyDeviceToHost))

  norm_out = sqrt(sum(hC*hC))
  error = abs(norm_out - norm_in) / max(norm_in, 1.0_c_float)
  if(error .gt. error_max) then
      write(*,*) "FAILED! Norm not preserved! ||C|| = ", norm_in, " ||Q*C|| = ", norm_out
      call exit
  end if

  call hipCheck(hipFree(dWork))
  call hipCheck(hipFree(dA))
  call hipCheck(hipFree(dC))
  call hipCheck(hipFree(dTau))
  call hipCheck(hipFree(dInfo))
  call hipsolverCheck(hipsolverDestroy(handle))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"

end program sormqr
