!!!!!!!!!!!!!!
! zheev example (double-precision complex Hermitian eigenvalues)
! see: https:!rocm.docs.amd.com/projects/rocSOLVER/en/latest/reference/lapack.html
!
! Computes the eigenvalues of a Hermitian matrix. rocSOLVER writes `info` to
! DEVICE memory (passed as c_loc(dInfo)). A Hermitian matrix has a real trace
! equal to the sum of its (real) eigenvalues, which is what we check.
!!!!!!!!!!!!!!
!
program zheev
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocblas
  use hipfort_rocblas_enums
  use hipfort_rocsolver
  use hipfort_rocsolver_enums

  implicit none

  integer(c_int), parameter :: N = 3, lda = 3

  ! Hermitian 3x3 (column-major); diagonal is real, trace = 4+3+5 = 12.
  complex(c_double_complex) :: hA(N,N) = reshape((/ &
    (4.0d0, 0.0d0), (1.0d0,-1.0d0), (0.0d0, 0.0d0), &
    (1.0d0, 1.0d0), (3.0d0, 0.0d0), (0.0d0,-2.0d0), &
    (0.0d0, 0.0d0), (0.0d0, 2.0d0), (5.0d0, 0.0d0) /), (/N, N/))
  real(c_double) :: hD(N) = 0.0d0   ! eigenvalues
  real(c_double) :: hE(N) = 0.0d0   ! workspace

  complex(c_double_complex), pointer :: dA(:,:)
  real(c_double), pointer :: dD(:)
  real(c_double), pointer :: dE(:)
  integer(c_int), pointer :: dInfo(:)

  type(c_ptr) :: handle

  real(c_double) :: trace_A, error
  real(c_double), parameter :: rtol = 1.0d-9

  write(*,"(a)",advance="no") "-- Running test 'rocsolver_zheev' (Fortran 2008 interfaces) - "

  trace_A = real(hA(1,1),c_double) + real(hA(2,2),c_double) + real(hA(3,3),c_double)   ! = 12

  call hipCheck(hipMalloc(dA,    source=hA))
  call hipCheck(hipMalloc(dD,    source=hD))
  call hipCheck(hipMalloc(dE,    source=hE))
  call hipCheck(hipMalloc(dInfo, 1))

  call hipCheck(rocblas_create_handle(handle))

  call hipCheck(rocsolver_zheev(handle, rocblas_evect_none, rocblas_fill_upper, N, dA, lda, &
                                dD, dE, c_loc(dInfo)))

  call hipCheck(hipMemcpy(hD, dD, hipMemcpyDeviceToHost))

  ! Sum of eigenvalues equals the (real) trace, independent of their order.
  error = abs(sum(hD) - trace_A) / abs(trace_A)
  if (error > rtol) then
     write(*,*) "FAILED! sum(eigenvalues) = ", sum(hD), " expected trace(A) = ", trace_A
     call exit(1)
  end if

  call hipCheck(hipFree(dA))
  call hipCheck(hipFree(dD))
  call hipCheck(hipFree(dE))
  call hipCheck(hipFree(dInfo))
  call hipCheck(rocblas_destroy_handle(handle))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"

end program zheev
