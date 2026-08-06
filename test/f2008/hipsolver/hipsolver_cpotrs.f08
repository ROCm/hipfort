!!!!!!!!!!!!!/
! hipsolverCpotrs example (single-complex Cholesky solve)
! see: https:!rocm.docs.amd.com/projects/hipSOLVER/en/latest/
!
! Self-verifying: pick a known solution x, form b = A*x for a Hermitian positive
! definite A, factorize with potrf, solve A*X = b with potrs, and confirm X
! recovers x.
!!!!!!!!!!!!!!/
!
program cpotrs
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipsolver
  use hipfort_hipsolver_enums

  implicit none
  integer :: i ! index for iterating over results

  integer(c_int), parameter :: N = 3
  integer(c_int), parameter :: nrhs = 1
  integer(c_int), parameter :: lda = 3
  integer(c_int), parameter :: ldb = 3

  ! Hermitian positive definite input (column-major)
  complex(c_float_complex) :: hA(3,3) = reshape((/ &
    (4.0,0.0), (1.0,1.0), (0.0,0.0), &
    (1.0,-1.0), (5.0,0.0), (0.0,-1.0), &
    (0.0,0.0), (0.0,1.0), (6.0,0.0)/), (/3, 3/))
  complex(c_float_complex) :: hX(3,1) = reshape((/ &
    (1.0,1.0), (2.0,-1.0), (3.0,2.0)/), (/3, 1/))  ! known solution
  complex(c_float_complex) :: hB(3,1)                 ! RHS = A*x

  type(c_ptr) :: handle = c_null_ptr
  complex(c_float_complex), pointer :: dA(:,:)
  complex(c_float_complex), pointer :: dB(:,:)
  integer(c_int), pointer :: dInfo(:)
  type(c_ptr) :: dWork
  integer(c_int) :: lwork_f, lwork_s, lwork

  real(c_float) :: error
  real(c_float), parameter :: error_max = 1.0e-4
  !
  write(*,"(a)",advance="no") "-- Running test 'hipsolverCpotrs' (Fortran 2008 interfaces) - "

  ! Build a consistent RHS so that A*x = b
  hB = matmul(hA, hX)

  call hipsolverCheck(hipsolverCreate(handle))

  ! Allocate device-side memory & copy memory from host to device
  call hipCheck(hipMalloc(dA, source=hA))
  call hipCheck(hipMalloc(dB, source=hB))
  call hipCheck(hipMalloc(dInfo, 1))

  ! Workspace big enough for both potrf and potrs
  call hipsolverCheck(hipsolverCpotrf_bufferSize(handle, HIPSOLVER_FILL_MODE_LOWER, N, dA, lda, lwork_f))
  call hipsolverCheck(hipsolverCpotrs_bufferSize(handle, HIPSOLVER_FILL_MODE_LOWER, N, nrhs, dA, lda, dB, ldb, lwork_s))
  lwork = max(lwork_f, lwork_s)
  call hipCheck(hipMalloc(dWork, int(lwork,c_size_t) * 8))

  ! Factorize A = L*L**H, then solve A*X = B in place
  call hipsolverCheck(hipsolverCpotrf(handle, HIPSOLVER_FILL_MODE_LOWER, N, dA, lda, dWork, lwork, dInfo(1)))
  call hipsolverCheck(hipsolverCpotrs(handle, HIPSOLVER_FILL_MODE_LOWER, N, nrhs, dA, lda, dB, ldb, dWork, lwork, dInfo(1)))

  ! Copy result from device to host
  call hipCheck(hipMemcpy(hB, dB, hipMemcpyDeviceToHost))

  ! Verify the recovered solution matches x
  do i = 1,N
    error = abs(hB(i,1) - hX(i,1)) / max(abs(hX(i,1)), 1.0_c_float)
    if(error .gt. error_max) then
        write(*,*) "FAILED! Error bigger than max! Error = ", error, " X(", i, ") = ", hB(i,1)
        call exit
    end if
  end do

  ! Clean up
  call hipCheck(hipFree(dWork))
  call hipCheck(hipFree(dA))
  call hipCheck(hipFree(dB))
  call hipCheck(hipFree(dInfo))
  call hipsolverCheck(hipsolverDestroy(handle))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"

end program cpotrs
