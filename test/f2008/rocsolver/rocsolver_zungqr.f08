!!!!!!!!!!!!!/
! zungqr example (double-complex generation of Q from a QR factorization)
! see: https:!rocm.docs.amd.com/projects/rocSOLVER/en/latest/reference/lapack.html
!
! Self-verifying: factorize A with geqrf, generate the unitary factor Q with
! ungqr, and confirm Q**H * Q = I. Unitarity is phase-convention independent,
! so no reference matrix is needed.
!!!!!!!!!!!!!!/
!
program zungqr
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocblas
  use hipfort_rocsolver

  implicit none
  integer :: i, j ! indices for iterating over results

  integer(c_int), parameter :: M = 3
  integer(c_int), parameter :: N = 3
  integer(c_int), parameter :: K = 3
  integer(c_int), parameter :: lda = 3

  ! Input matrix (column-major)
  complex(c_double_complex) :: hA(3,3) = reshape((/ &
    (1.0d0,1.0d0), (4.0d0,0.0d0), (7.0d0,0.0d0), &
    (2.0d0,0.0d0), (5.0d0,1.0d0), (8.0d0,0.0d0), &
    (3.0d0,0.0d0), (6.0d0,0.0d0), (10.0d0,1.0d0)/), (/3, 3/))
  complex(c_double_complex) :: hIpiv(3)   ! Householder scalars
  complex(c_double_complex) :: gram       ! entry of Q**H * Q

  complex(c_double_complex), pointer :: dA(:,:)
  complex(c_double_complex), pointer :: dIpiv(:)

  type(c_ptr) :: handle ! rocblas_handle

  real(c_double) :: error
  real(c_double), parameter :: error_max = 1.0d-9
  !
  write(*,"(a)",advance="no") "-- Running test 'rocsolver_zungqr' (Fortran 2008 interfaces) - "

  ! Allocate device-side memory & copy memory from host to device
  call hipCheck(hipMalloc(dA,    source=hA))
  call hipCheck(hipMalloc(dIpiv, mold=hIpiv))

  ! Create rocBLAS handle
  call hipCheck(rocblas_create_handle(handle))

  ! Factorize A = Q*R, then form the explicit Q in place
  call hipCheck(rocsolver_zgeqrf(handle, M, N, dA, lda, dIpiv))
  call hipCheck(rocsolver_zungqr(handle, M, N, K, dA, lda, dIpiv))

  ! Copy Q back to host
  call hipCheck(hipMemcpy(hA, dA, hipMemcpyDeviceToHost))

  ! Verify Q**H * Q = I
  do j = 1,N
    do i = 1,N
      gram = sum(conjg(hA(:,i)) * hA(:,j))
      if(i .eq. j) then
        error = abs(gram - (1.0_c_double, 0.0_c_double))
      else
        error = abs(gram)
      end if
      if(error .gt. error_max) then
          write(*,*) "FAILED! Q not unitary! Error = ", error, " (", i, ",", j, ")"
          call exit
      end if
    end do
  end do

  ! Clean up
  call hipCheck(hipFree(dA))
  call hipCheck(hipFree(dIpiv))
  call hipCheck(rocblas_destroy_handle(handle))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"

end program zungqr
