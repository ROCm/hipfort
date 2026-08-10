!!!!!!!!!!!!!/
! zheevj example (double-complex Hermitian Jacobi eigensolver)
! see: https:!rocm.docs.amd.com/projects/rocSOLVER/en/latest/reference/lapack.html
!
! Self-verifying: with evect=original, A is overwritten with the (complex)
! eigenvectors and the real vector W holds the eigenvalues. We confirm
! A0*v_k = lambda_k*v_k.
!
! NOTE: heevj writes residual, n_sweeps and info to DEVICE memory, so those are
! backed by device allocations and passed as c_loc(...); host scalars fault.
! heevj has no generated array-pointer overload, so A and W are passed to the
! raw interface via c_loc of their device pointers.
!!!!!!!!!!!!!!/
!
program zheevj
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocblas
  use hipfort_rocblas_enums
  use hipfort_rocsolver
  use hipfort_rocsolver_enums

  implicit none
  integer :: i, k ! indices for iterating over results

  integer(c_int), parameter :: N = 3
  integer(c_int), parameter :: lda = 3
  integer(c_int), parameter :: max_sweeps = 100
  real(c_double), parameter :: abstol = 0.0_c_double

  ! Hermitian input (column-major)
  complex(c_double_complex) :: hA(3,3) = reshape((/ &
    (2.0d0,0.0d0), (1.0d0,-1.0d0), (0.0d0,0.0d0), &
    (1.0d0,1.0d0), (3.0d0,0.0d0), (0.0d0,-1.0d0), &
    (0.0d0,0.0d0), (0.0d0,1.0d0), (4.0d0,0.0d0)/), (/3, 3/))
  complex(c_double_complex) :: hA0(3,3)   ! original kept for verification
  real(c_double) :: hW(3)                 ! eigenvalues (real)
  complex(c_double_complex) :: lhs(3), rhs(3)

  complex(c_double_complex), pointer :: dA(:,:)
  real(c_double), pointer :: dW(:)
  real(c_double), pointer :: dResidual(:)
  integer(c_int), pointer :: dNsweeps(:)
  integer(c_int), pointer :: dInfo(:)

  type(c_ptr) :: handle ! rocblas_handle

  real(c_double) :: error
  real(c_double), parameter :: error_max = 1.0d-9
  !
  write(*,"(a)",advance="no") "-- Running test 'rocsolver_zheevj' (Fortran 2008 interfaces) - "

  hA0 = hA ! keep original for the A*v = lambda*v check

  ! Allocate device-side memory & copy memory from host to device
  call hipCheck(hipMalloc(dA, source=hA))
  call hipCheck(hipMalloc(dW, mold=hW))
  call hipCheck(hipMalloc(dResidual, 1))
  call hipCheck(hipMalloc(dNsweeps, 1))
  call hipCheck(hipMalloc(dInfo, 1))

  ! Create rocBLAS handle
  call hipCheck(rocblas_create_handle(handle))

  ! Compute eigenvalues and eigenvectors (A overwritten with eigenvectors)
  call hipCheck(rocsolver_zheevj(handle, rocblas_esort_ascending, rocblas_evect_original, &
       rocblas_fill_upper, N, c_loc(dA(1,1)), lda, abstol, c_loc(dResidual(1)), max_sweeps, &
       c_loc(dNsweeps(1)), c_loc(dW(1)), c_loc(dInfo(1))))

  ! Copy results back to host
  call hipCheck(hipMemcpy(hA, dA, hipMemcpyDeviceToHost))
  call hipCheck(hipMemcpy(hW, dW, hipMemcpyDeviceToHost))

  ! Verify A0 * v_k = lambda_k * v_k for each eigenpair
  do k = 1,N
    lhs = matmul(hA0, hA(:,k))
    rhs = hW(k) * hA(:,k)
    do i = 1,N
        error = abs(lhs(i) - rhs(i))
        if(error .gt. error_max) then
            write(*,*) "FAILED! Error bigger than max! Error = ", error, " eigenpair ", k
            call exit
        end if
    end do
  end do

  ! Clean up
  call hipCheck(hipFree(dA))
  call hipCheck(hipFree(dW))
  call hipCheck(hipFree(dResidual))
  call hipCheck(hipFree(dNsweeps))
  call hipCheck(hipFree(dInfo))
  call hipCheck(rocblas_destroy_handle(handle))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"

end program zheevj
