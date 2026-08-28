!!!!!!!!!!!!!/
! ssygvdx example (partial generalized symmetric-definite eigensolver)
! see: https:!rocm.docs.amd.com/projects/rocSOLVER/en/latest/reference/lapack.html
!
! sygvdx solves a selected subset of A*x = lambda*B*x (itype=eform_ax). erange=index
! with il=1, iu=N requests the full spectrum; eigenvectors go to Z.
! Self-verifying: A0*v_k = lambda_k * B0*v_k. info and nev live on the DEVICE.
!!!!!!!!!!!!!!/
!
program ssygvdx
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocblas
  use hipfort_rocblas_enums
  use hipfort_rocsolver
  use hipfort_rocsolver_enums

  implicit none
  integer :: i, k

  integer(c_int), parameter :: N = 3, lda = 3, ldb = 3, ldz = 3

  real(c_float) :: hA(3,3) = reshape((/2, -1, 0, -1, 2, -1, 0, -1, 2/), (/3, 3/))
  real(c_float) :: hB(3,3) = reshape((/2, 0, 0, 0, 2, 0, 0, 0, 2/), (/3, 3/))
  real(c_float) :: hA0(3,3), hB0(3,3)
  real(c_float) :: hW(3)
  real(c_float) :: hZ(3,3)
  integer(c_int) :: hNev
  real(c_float) :: lhs(3), rhs(3)

  real(c_float), pointer :: dA(:,:), dB(:,:), dZ(:,:)
  real(c_float), pointer :: dW(:)
  integer(c_int), pointer :: dNev(:), dInfo(:)

  type(c_ptr) :: handle

  real(c_float) :: error
  real(c_float), parameter :: error_max = 1.0e-5
  !
  write(*,"(a)",advance="no") "-- Running test 'rocsolver_ssygvdx' (Fortran 2008 interfaces) - "

  hA0 = hA
  hB0 = hB

  call hipCheck(hipMalloc(dA, source=hA))
  call hipCheck(hipMalloc(dB, source=hB))
  call hipCheck(hipMalloc(dW, mold=hW))
  call hipCheck(hipMalloc(dZ, mold=hZ))
  call hipCheck(hipMalloc(dNev, 1))
  call hipCheck(hipMalloc(dInfo, 1))

  call hipCheck(rocblas_create_handle(handle))

  call hipCheck(rocsolver_ssygvdx(handle, rocblas_eform_ax, rocblas_evect_original, &
       rocblas_erange_index, rocblas_fill_upper, N, c_loc(dA(1,1)), lda, c_loc(dB(1,1)), ldb, &
       0.0, 0.0, 1, N, c_loc(dNev(1)), c_loc(dW(1)), c_loc(dZ(1,1)), ldz, c_loc(dInfo(1))))

  call hipCheck(hipMemcpy(hNev, dNev(1), hipMemcpyDeviceToHost))
  call hipCheck(hipMemcpy(hW, dW, hipMemcpyDeviceToHost))
  call hipCheck(hipMemcpy(hZ, dZ, hipMemcpyDeviceToHost))

  if (hNev /= N) then
    write(*,*) "FAILED! nev = ", hNev, " expected ", N; call exit(1)
  end if

  do k = 1,N
    lhs = matmul(hA0, hZ(:,k))
    rhs = hW(k) * matmul(hB0, hZ(:,k))
    do i = 1,N
        error = abs(lhs(i) - rhs(i))
        if(error .gt. error_max) then
            write(*,*) "FAILED! Error bigger than max! Error = ", error, " eigenpair ", k; call exit(1)
        end if
    end do
  end do

  call hipCheck(hipFree(dA)); call hipCheck(hipFree(dB)); call hipCheck(hipFree(dW))
  call hipCheck(hipFree(dZ)); call hipCheck(hipFree(dNev)); call hipCheck(hipFree(dInfo))
  call hipCheck(rocblas_destroy_handle(handle))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"

end program ssygvdx
