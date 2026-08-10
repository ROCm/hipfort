!!!!!!!!!!!!!/
! dgebrd example (double-precision bidiagonal reduction)
! see: https:!rocm.docs.amd.com/projects/rocSOLVER/en/latest/reference/lapack.html
!
! gebrd reduces A to bidiagonal form B = Q**T * A * P. We check the diagonal D
! and superdiagonal E of B against reference values, and confirm the reduction
! preserves the Frobenius norm (sum(D**2)+sum(E**2) = ||A||_F**2), which holds
! because Q and P are orthogonal.
!!!!!!!!!!!!!!/
!
program dgebrd
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocblas
  use hipfort_rocsolver

  implicit none
  integer :: i ! index for iterating over results

  integer(c_int), parameter :: M = 3
  integer(c_int), parameter :: N = 3
  integer(c_int), parameter :: lda = 3

  ! Input matrix (column-major)
  real(c_double) :: hA(3,3) = reshape((/1, 4, 7, 2, 5, 8, 3, 6, 10/), (/3, 3/))
  real(c_double) :: hD(3)      ! diagonal of B
  real(c_double) :: hE(2)      ! superdiagonal of B
  real(c_double) :: hTauq(3)   ! Householder scalars (Q)
  real(c_double) :: hTaup(3)   ! Householder scalars (P)

  ! Reference bidiagonal entries (from rocSOLVER)
  real(c_double), parameter :: refD(3) = &
    (/-8.1240384046359608_c_double, -1.7704849623785914_c_double, 0.2085724989394371_c_double/)
  real(c_double), parameter :: refE(2) = &
    (/15.3213062185449527_c_double, 0.2818798826684673_c_double/)
  real(c_double), parameter :: normA2 = 304.0_c_double

  real(c_double), pointer :: dA(:,:)
  real(c_double), pointer :: dD(:)
  real(c_double), pointer :: dE(:)
  real(c_double), pointer :: dTauq(:)
  real(c_double), pointer :: dTaup(:)

  type(c_ptr) :: handle ! rocblas_handle

  real(c_double) :: error
  real(c_double), parameter :: error_max = 1.0d-9
  !
  write(*,"(a)",advance="no") "-- Running test 'rocsolver_dgebrd' (Fortran 2008 interfaces) - "

  ! Allocate device-side memory & copy memory from host to device
  call hipCheck(hipMalloc(dA,    source=hA))
  call hipCheck(hipMalloc(dD,    mold=hD))
  call hipCheck(hipMalloc(dE,    mold=hE))
  call hipCheck(hipMalloc(dTauq, mold=hTauq))
  call hipCheck(hipMalloc(dTaup, mold=hTaup))

  ! Create rocBLAS handle
  call hipCheck(rocblas_create_handle(handle))

  ! Reduce A to bidiagonal form
  call hipCheck(rocsolver_dgebrd(handle, M, N, dA, lda, dD, dE, dTauq, dTaup))

  ! Copy results back to host
  call hipCheck(hipMemcpy(hD, dD, hipMemcpyDeviceToHost))
  call hipCheck(hipMemcpy(hE, dE, hipMemcpyDeviceToHost))

  ! Verify the bidiagonal entries against the reference
  do i = 1,3
    error = abs(hD(i) - refD(i))
    if(error .gt. error_max) then
        write(*,*) "FAILED! Error bigger than max! Error = ", error, " D(", i, ") = ", hD(i)
        call exit
    end if
  end do
  do i = 1,2
    error = abs(hE(i) - refE(i))
    if(error .gt. error_max) then
        write(*,*) "FAILED! Error bigger than max! Error = ", error, " E(", i, ") = ", hE(i)
        call exit
    end if
  end do

  ! Cross-check the norm-preserving invariant
  error = abs(sum(hD*hD) + sum(hE*hE) - normA2)
  if(error .gt. 1.0d-6) then
      write(*,*) "FAILED! Norm not preserved! Error = ", error
      call exit
  end if

  ! Clean up
  call hipCheck(hipFree(dA))
  call hipCheck(hipFree(dD))
  call hipCheck(hipFree(dE))
  call hipCheck(hipFree(dTauq))
  call hipCheck(hipFree(dTaup))
  call hipCheck(rocblas_destroy_handle(handle))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"

end program dgebrd
