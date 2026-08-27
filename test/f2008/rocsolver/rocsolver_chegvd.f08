!!!!!!!!!!!!!/
! chegvd example (complex generalized Hermitian-definite eigensolver)
! see: https:!rocm.docs.amd.com/projects/rocSOLVER/en/latest/reference/lapack.html
!
! hegvd solves A*x = lambda*B*x (itype=eform_ax) for Hermitian A and
! Hermitian positive-definite B. With evect=original, A is overwritten with the
! eigenvectors. Self-verifying: A0*v_k = lambda_k * B0*v_k. info lives on the DEVICE.
!!!!!!!!!!!!!!/
!
program chegvd
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocblas
  use hipfort_rocblas_enums
  use hipfort_rocsolver
  use hipfort_rocsolver_enums

  implicit none
  integer :: i, k

  integer(c_int), parameter :: N = 3, lda = 3, ldb = 3

  complex(c_float_complex) :: hA(3,3) = reshape((/ &
       (2.,0.),(-1.,0.),(0.,0.), (-1.,0.),(2.,0.),(-1.,0.), (0.,0.),(-1.,0.),(2.,0.) /), (/3,3/))
  complex(c_float_complex) :: hB(3,3) = reshape((/ &
       (2.,0.),(0.,0.),(0.,0.), (0.,0.),(2.,0.),(0.,0.), (0.,0.),(0.,0.),(2.,0.) /), (/3,3/))
  complex(c_float_complex) :: hA0(3,3), hB0(3,3)
  real(c_float) :: hD(3)
  real(c_float) :: hE(3)
  complex(c_float_complex) :: lhs(3), rhs(3)

  complex(c_float_complex), pointer :: dA(:,:), dB(:,:)
  real(c_float), pointer :: dD(:), dE(:)
  integer(c_int), pointer :: dInfo(:)

  type(c_ptr) :: handle

  real(c_float) :: error
  real(c_float), parameter :: error_max = 1.0e-5
  !
  write(*,"(a)",advance="no") "-- Running test 'rocsolver_chegvd' (Fortran 2008 interfaces) - "

  hA0 = hA
  hB0 = hB

  call hipCheck(hipMalloc(dA, source=hA))
  call hipCheck(hipMalloc(dB, source=hB))
  call hipCheck(hipMalloc(dD, mold=hD))
  call hipCheck(hipMalloc(dE, mold=hE))
  call hipCheck(hipMalloc(dInfo, 1))

  call hipCheck(rocblas_create_handle(handle))

  call hipCheck(rocsolver_chegvd(handle, rocblas_eform_ax, rocblas_evect_original, &
       rocblas_fill_upper, N, c_loc(dA(1,1)), lda, c_loc(dB(1,1)), ldb, &
       c_loc(dD(1)), c_loc(dE(1)), c_loc(dInfo(1))))

  call hipCheck(hipMemcpy(hA, dA, hipMemcpyDeviceToHost))
  call hipCheck(hipMemcpy(hD, dD, hipMemcpyDeviceToHost))

  do k = 1,N
    lhs = matmul(hA0, hA(:,k))
    rhs = hD(k) * matmul(hB0, hA(:,k))
    do i = 1,N
        error = abs(lhs(i) - rhs(i))
        if(error .gt. error_max) then
            write(*,*) "FAILED! Error bigger than max! Error = ", error, " eigenpair ", k; call exit(1)
        end if
    end do
  end do

  call hipCheck(hipFree(dA)); call hipCheck(hipFree(dB))
  call hipCheck(hipFree(dD)); call hipCheck(hipFree(dE)); call hipCheck(hipFree(dInfo))
  call hipCheck(rocblas_destroy_handle(handle))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"

end program chegvd
