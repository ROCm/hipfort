!!!!!!!!!!!!!/
! zheevd example (double-precision Hermitian eigensolver)
! see: https:!www.netlib.org/lapack/explore-html/d9/de3/group__complex_h_eeigen.html
!
! Self-verifying: with evect=original, A is overwritten with the eigenvectors
! (as columns) and D holds the (real) eigenvalues. We confirm A0*v_k = lambda_k*v_k.
!
! NOTE: heevd writes `info` to DEVICE memory, so info is backed by a device
! allocation and passed as c_loc(dInfo); passing a host scalar faults on the GPU.
! For Hermitian matrices A is complex but the eigenvalues D (and workspace E)
! are REAL.
!!!!!!!!!!!!!!/
!
program zheevd
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

  ! Hermitian input (column-major)
  complex(c_double_complex) :: hA(3,3) = reshape((/ &
    (2.,0.),(0.,-1.),(0.,0.), (0.,1.),(2.,0.),(0.,-1.), (0.,0.),(0.,1.),(2.,0.) /), (/3, 3/))
  complex(c_double_complex) :: hA0(3,3)   ! original kept for verification
  real(c_double) :: hD(3)                  ! eigenvalues (real)
  real(c_double) :: hE(3)                  ! workspace (real)
  complex(c_double_complex) :: lhs(3), rhs(3)

  complex(c_double_complex), pointer :: dA(:,:)
  real(c_double), pointer :: dD(:)
  real(c_double), pointer :: dE(:)
  integer(c_int), pointer :: dInfo(:)

  type(c_ptr) :: handle ! rocblas_handle

  real(c_double) :: error
  real(c_double), parameter :: error_max = 1.0d-9
  !
  write(*,"(a)",advance="no") "-- Running test 'rocsolver_zheevd' (Fortran 2008 interfaces) - "

  hA0 = hA ! keep original for the A*v = lambda*v check

  ! Allocate device-side memory & copy memory from host to device
  call hipCheck(hipMalloc(dA, source=hA))
  call hipCheck(hipMalloc(dD, mold=hD))
  call hipCheck(hipMalloc(dE, mold=hE))
  call hipCheck(hipMalloc(dInfo, 1))

  ! Create rocBLAS handle
  call hipCheck(rocblas_create_handle(handle))

  ! Compute eigenvalues and eigenvectors (A overwritten with eigenvectors)
  call hipCheck(rocsolver_zheevd(handle, rocblas_evect_original, rocblas_fill_upper, N, dA, lda, dD, dE, c_loc(dInfo)))

  ! Copy results back to host
  call hipCheck(hipMemcpy(hA, dA, hipMemcpyDeviceToHost))
  call hipCheck(hipMemcpy(hD, dD, hipMemcpyDeviceToHost))

  ! Verify A0 * v_k = lambda_k * v_k for each eigenpair
  do k = 1,N
    lhs = matmul(hA0, hA(:,k))
    rhs = hD(k) * hA(:,k)
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
  call hipCheck(hipFree(dD))
  call hipCheck(hipFree(dE))
  call hipCheck(hipFree(dInfo))
  call hipCheck(rocblas_destroy_handle(handle))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"

end program zheevd
