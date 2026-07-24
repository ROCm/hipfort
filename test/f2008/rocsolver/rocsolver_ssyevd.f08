!!!!!!!!!!!!!/
! ssyevd example (single-precision symmetric eigensolver)
! see: https:!www.netlib.org/lapack/explore-html/d2/d8a/group__double_s_yeigen_ga694ddc6e5527b6223748e3462013d867.html
!
! Self-verifying: with evect=original, A is overwritten with the eigenvectors
! (as columns) and D holds the eigenvalues. We confirm A0*v_k = lambda_k*v_k.
!
! NOTE: syevd writes `info` to DEVICE memory, so info is backed by a device
! allocation and passed as c_loc(dInfo); passing a host scalar faults on the GPU.
!!!!!!!!!!!!!!/
!
program ssyevd
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

  ! Symmetric input (column-major); eigenvalues are 2-sqrt(2), 2, 2+sqrt(2)
  real(c_float) :: hA(3,3) = reshape((/2, -1, 0, -1, 2, -1, 0, -1, 2/), (/3, 3/))
  real(c_float) :: hA0(3,3)   ! original kept for verification
  real(c_float) :: hD(3)      ! eigenvalues
  real(c_float) :: hE(3)      ! workspace
  real(c_float) :: lhs(3), rhs(3)

  real(c_float), pointer :: dA(:,:)
  real(c_float), pointer :: dD(:)
  real(c_float), pointer :: dE(:)
  integer(c_int), pointer :: dInfo(:)

  type(c_ptr) :: handle ! rocblas_handle

  real :: error
  ! single precision: relative tolerance
  real, parameter :: error_max = 1.0e-4
  !
  write(*,"(a)",advance="no") "-- Running test 'rocsolver_ssyevd' (Fortran 2008 interfaces) - "

  hA0 = hA ! keep original for the A*v = lambda*v check

  ! Allocate device-side memory & copy memory from host to device
  call hipCheck(hipMalloc(dA, source=hA))
  call hipCheck(hipMalloc(dD, mold=hD))
  call hipCheck(hipMalloc(dE, mold=hE))
  call hipCheck(hipMalloc(dInfo, 1))

  ! Create rocBLAS handle
  call hipCheck(rocblas_create_handle(handle))

  ! Compute eigenvalues and eigenvectors (A overwritten with eigenvectors)
  call hipCheck(rocsolver_ssyevd(handle, rocblas_evect_original, rocblas_fill_upper, N, dA, lda, dD, dE, c_loc(dInfo)))

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

end program ssyevd
