!!!!!!!!!!!!!!
! cheevdx example (complex partial Hermitian eigensolver, Fortran 2008 interfaces)
! see: https:!rocm.docs.amd.com/projects/hipSOLVER/en/latest/
!
! heevdx computes a selected subset of eigenvalues/eigenvectors. range=all requests
! the full spectrum, so nev returns N and A is overwritten with the eigenvectors.
! Workspace via hipsolverC... bufferSize; devInfo device-backed.
! Self-verifying: A0*v_k = lambda_k*v_k.
!!!!!!!!!!!!!!
!
program hipsolver_cheevdx
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipsolver
  use hipfort_hipsolver_enums
  implicit none
  integer :: i, k

  integer(c_int), parameter :: N = 3, lda = 3

  complex(c_float_complex) :: hA(3,3) = reshape((/ &
       (2.,0.),(-1.,0.),(0.,0.), (-1.,0.),(2.,0.),(-1.,0.), (0.,0.),(-1.,0.),(2.,0.) /), (/3,3/))
  complex(c_float_complex) :: hA0(3,3)
  real(c_float) :: hW(3)
  integer(c_int) :: hNev
  integer(c_int) :: nevBuf
  complex(c_float_complex) :: lhs(3), rhs(3)

  complex(c_float_complex), pointer :: dA(:,:)
  real(c_float), pointer :: dW(:)
  integer(c_int), pointer :: dNev(:), dInfo(:)
  type(c_ptr) :: dWork, handle = c_null_ptr
  integer(c_int) :: lwork

  real(c_float) :: error
  real(c_float), parameter :: error_max = 1.0e-5

  write(*,"(a)",advance="no") "-- Running test 'hipsolver_cheevdx' (Fortran 2008 interfaces) - "

  hA0 = hA

  call hipCheck(hipMalloc(dA, source=hA))
  call hipCheck(hipMalloc(dW, mold=hW))
  call hipCheck(hipMalloc(dNev, 1))
  call hipCheck(hipMalloc(dInfo, 1))

  call hipsolverCheck(hipsolverCreate(handle))

  call hipsolverCheck(hipsolverCheevdx_bufferSize(handle, HIPSOLVER_EIG_MODE_VECTOR, &
       HIPSOLVER_EIG_RANGE_ALL, HIPSOLVER_FILL_MODE_UPPER, N, c_loc(dA(1,1)), lda, &
       0.0, 0.0, 1, N, nevBuf, c_loc(dW(1)), lwork))
  call hipCheck(hipMalloc(dWork, max(int(lwork,c_size_t) * 8, 1_c_size_t)))

  call hipsolverCheck(hipsolverCheevdx(handle, HIPSOLVER_EIG_MODE_VECTOR, &
       HIPSOLVER_EIG_RANGE_ALL, HIPSOLVER_FILL_MODE_UPPER, N, c_loc(dA(1,1)), lda, &
       0.0, 0.0, 1, N, dNev(1), c_loc(dW(1)), dWork, lwork, dInfo(1)))

  call hipCheck(hipMemcpy(hNev, dNev(1), hipMemcpyDeviceToHost))
  call hipCheck(hipMemcpy(hA, dA, hipMemcpyDeviceToHost))
  call hipCheck(hipMemcpy(hW, dW, hipMemcpyDeviceToHost))

  if (hNev /= N) then
    write(*,*) "FAILED! nev = ", hNev, " expected ", N; call exit(1)
  end if

  do k = 1,N
    lhs = matmul(hA0, hA(:,k))
    rhs = hW(k) * hA(:,k)
    do i = 1,N
        error = abs(lhs(i) - rhs(i))
        if(error .gt. error_max) then
            write(*,*) "FAILED! Error bigger than max! Error = ", error, " eigenpair ", k; call exit(1)
        end if
    end do
  end do

  call hipCheck(hipFree(dA)); call hipCheck(hipFree(dW))
  call hipCheck(hipFree(dNev)); call hipCheck(hipFree(dInfo)); call hipCheck(hipFree(dWork))
  call hipsolverCheck(hipsolverDestroy(handle))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"

end program hipsolver_cheevdx
