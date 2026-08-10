!!!!!!!!!!!!!/
! zunmqr example (double-complex multiplication by Q from a QR factorization)
! see: https:!rocm.docs.amd.com/projects/rocSOLVER/en/latest/reference/lapack.html
!
! Self-verifying: factorize A with geqrf to obtain Q (as Householder vectors),
! then apply Q and Q**H successively to a matrix C. Since Q**H * Q = I, the
! result must recover the original C, so no reference matrix is needed.
!!!!!!!!!!!!!!/
!
program zunmqr
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocblas
  use hipfort_rocblas_enums
  use hipfort_rocsolver

  implicit none
  integer :: i, j ! indices for iterating over results

  integer(c_int), parameter :: M = 3
  integer(c_int), parameter :: N = 2
  integer(c_int), parameter :: K = 3
  integer(c_int), parameter :: lda = 3
  integer(c_int), parameter :: ldc = 3

  ! Matrix to factorize (column-major) and a separate C to multiply
  complex(c_double_complex) :: hA(3,3) = reshape((/ &
    (1.0d0,1.0d0), (4.0d0,0.0d0), (7.0d0,0.0d0), &
    (2.0d0,0.0d0), (5.0d0,1.0d0), (8.0d0,0.0d0), &
    (3.0d0,0.0d0), (6.0d0,0.0d0), (10.0d0,1.0d0)/), (/3, 3/))
  complex(c_double_complex) :: hC(3,2) = reshape((/ &
    (1.0d0,1.0d0), (2.0d0,0.0d0), (3.0d0,-1.0d0), &
    (4.0d0,0.0d0), (5.0d0,2.0d0), (6.0d0,0.0d0)/), (/3, 2/))
  complex(c_double_complex) :: hC0(3,2)   ! original C kept for verification
  complex(c_double_complex) :: hIpiv(3)

  complex(c_double_complex), pointer :: dA(:,:)
  complex(c_double_complex), pointer :: dC(:,:)
  complex(c_double_complex), pointer :: dIpiv(:)

  type(c_ptr) :: handle ! rocblas_handle

  real(c_double) :: error
  real(c_double), parameter :: error_max = 1.0d-9
  !
  write(*,"(a)",advance="no") "-- Running test 'rocsolver_zunmqr' (Fortran 2008 interfaces) - "

  hC0 = hC ! keep original C for the round-trip check

  ! Allocate device-side memory & copy memory from host to device
  call hipCheck(hipMalloc(dA,    source=hA))
  call hipCheck(hipMalloc(dC,    source=hC))
  call hipCheck(hipMalloc(dIpiv, mold=hIpiv))

  ! Create rocBLAS handle
  call hipCheck(rocblas_create_handle(handle))

  ! Factorize to get Q, then apply C <- Q*C followed by C <- Q**H*C
  call hipCheck(rocsolver_zgeqrf(handle, M, K, dA, lda, dIpiv))
  call hipCheck(rocsolver_zunmqr(handle, rocblas_side_left, rocblas_operation_none, &
       M, N, K, dA, lda, dIpiv, dC, ldc))
  call hipCheck(rocsolver_zunmqr(handle, rocblas_side_left, rocblas_operation_conjugate_transpose, &
       M, N, K, dA, lda, dIpiv, dC, ldc))

  ! Copy result back to host
  call hipCheck(hipMemcpy(hC, dC, hipMemcpyDeviceToHost))

  ! Verify Q**H * Q * C = C
  do j = 1,N
    do i = 1,M
      error = abs(hC(i,j) - hC0(i,j))
      if(error .gt. error_max) then
          write(*,*) "FAILED! Round trip mismatch! Error = ", error, " (", i, ",", j, ")"
          call exit
      end if
    end do
  end do

  ! Clean up
  call hipCheck(hipFree(dA))
  call hipCheck(hipFree(dC))
  call hipCheck(hipFree(dIpiv))
  call hipCheck(rocblas_destroy_handle(handle))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"

end program zunmqr
