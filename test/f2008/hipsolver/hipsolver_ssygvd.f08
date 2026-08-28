!!!!!!!!!!!!!!
! ssygvd example (generalized symmetric-definite eigensolver, Fortran 2008)
! see: https:!rocm.docs.amd.com/projects/hipSOLVER/en/latest/
!
! sygvd solves A*x = lambda*B*x (itype=1) for symmetric A and
! positive-definite B. jobz=vector overwrites A with the
! eigenvectors. Native-array f2008 form; workspace via bufferSize.
! Self-verifying: A0*v_k = lambda_k * B0*v_k.
!!!!!!!!!!!!!!
!
program hipsolver_ssygvd
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipsolver
  use hipfort_hipsolver_enums
  implicit none
  integer :: i, k

  integer(c_int), parameter :: N = 3, lda = 3, ldb = 3

  real(c_float) :: hA(3,3) = reshape((/2, -1, 0, -1, 2, -1, 0, -1, 2/), (/3, 3/))
  real(c_float) :: hB(3,3) = reshape((/2, 0, 0, 0, 2, 0, 0, 0, 2/), (/3, 3/))
  real(c_float) :: hA0(3,3), hB0(3,3)
  real(c_float) :: hW(3)
  real(c_float) :: lhs(3), rhs(3)

  real(c_float), pointer :: dA(:,:), dB(:,:)
  real(c_float), pointer :: dW(:)
  integer(c_int), pointer :: dInfo
  type(c_ptr) :: dWork, handle = c_null_ptr
  integer(c_int) :: lwork

  real(c_float) :: error
  real(c_float), parameter :: error_max = 1.0e-5

  write(*,"(a)",advance="no") "-- Running test 'hipsolver_ssygvd' (Fortran 2008 interfaces) - "

  hA0 = hA
  hB0 = hB

  call hipCheck(hipMalloc(dA, source=hA))
  call hipCheck(hipMalloc(dB, source=hB))
  call hipCheck(hipMalloc(dW, mold=hW))
  call hipCheck(hipMalloc(dInfo))

  call hipsolverCheck(hipsolverCreate(handle))

  call hipsolverCheck(hipsolverSsygvd_bufferSize(handle, HIPSOLVER_EIG_TYPE_1, &
       HIPSOLVER_EIG_MODE_VECTOR, HIPSOLVER_FILL_MODE_UPPER, N, dA, lda, dB, ldb, dW, lwork))
  call hipCheck(hipMalloc(dWork, max(int(lwork,c_size_t) * 4, 1_c_size_t)))

  call hipsolverCheck(hipsolverSsygvd(handle, HIPSOLVER_EIG_TYPE_1, HIPSOLVER_EIG_MODE_VECTOR, &
       HIPSOLVER_FILL_MODE_UPPER, N, dA, lda, dB, ldb, dW, dWork, lwork, dInfo))

  call hipCheck(hipMemcpy(hA, dA, hipMemcpyDeviceToHost))
  call hipCheck(hipMemcpy(hW, dW, hipMemcpyDeviceToHost))

  do k = 1,N
    lhs = matmul(hA0, hA(:,k))
    rhs = hW(k) * matmul(hB0, hA(:,k))
    do i = 1,N
        error = abs(lhs(i) - rhs(i))
        if(error .gt. error_max) then
            write(*,*) "FAILED! Error bigger than max! Error = ", error, " eigenpair ", k; call exit(1)
        end if
    end do
  end do

  call hipCheck(hipFree(dA)); call hipCheck(hipFree(dB)); call hipCheck(hipFree(dW))
  call hipCheck(hipFree(dInfo)); call hipCheck(hipFree(dWork))
  call hipsolverCheck(hipsolverDestroy(handle))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"

end program hipsolver_ssygvd
