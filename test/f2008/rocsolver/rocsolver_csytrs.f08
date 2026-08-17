!!!!!!!!!!!!!!
! csytrs example (solve A*X = B for a symmetric matrix, single complex)
! see: https:!rocm.docs.amd.com/projects/rocSOLVER/en/latest/
!
! Self-verifying: factorize a complex SYMMETRIC A (A = A^T) with sytrf, then solve
! A*x = b with sytrs for a right-hand side built from a known solution, and check
! that the recovered x matches. rocSOLVER writes info to DEVICE memory.
!
! sytrf has array overloads (exercised here via array pointers); sytrs is
! c_ptr-only, so the same device arrays are passed to it with c_loc.
!!!!!!!!!!!!!!
!
program csytrs
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocblas
  use hipfort_rocblas_enums
  use hipfort_rocsolver
  implicit none
  integer :: i
  integer(c_int), parameter :: N = 4, nrhs = 1, lda = 4, ldb = 4
  complex(c_float_complex) :: hA(N,N) = reshape((/ &
      (10.0,1.0), ( 2.0,0.0), ( 3.0,0.0), ( 6.0,0.0), &
      ( 2.0,0.0), (11.0,1.0), ( 1.0,0.0), ( 0.0,0.0), &
      ( 3.0,0.0), ( 1.0,0.0), (12.0,1.0), ( 2.0,0.0), &
      ( 6.0,0.0), ( 0.0,0.0), ( 2.0,0.0), (13.0,1.0)/), (/N,N/))
  complex(c_float_complex) :: hX(N) = (/(1.0,1.0), (2.0,-1.0), (3.0,0.0), (4.0,2.0)/)
  complex(c_float_complex) :: hB(N)
  integer(c_int), target :: hInfo(1)
  integer(c_int) :: hIpiv(N)
  complex(c_float_complex), pointer :: dA(:,:), dB(:)
  integer(c_int), pointer :: dIpiv(:)
  type(c_ptr) :: dInfo
  type(c_ptr) :: handle
  real(c_float), parameter :: error_max = 1.0e-4
  write(*,"(a)",advance="no") "-- Running test 'rocsolver_csytrs' (Fortran 2008 interfaces) - "

  hB = matmul(hA, hX)

  call hipCheck(hipMalloc(dA, source=hA))
  call hipCheck(hipMalloc(dB, source=hB))
  call hipCheck(hipMalloc(dIpiv, mold=hIpiv))
  call hipCheck(hipMalloc(dInfo, 4_c_size_t))

  call hipCheck(rocblas_create_handle(handle))
  call hipCheck(rocsolver_csytrf(handle, rocblas_fill_upper, N, dA, lda, dIpiv, dInfo))
  call hipCheck(rocsolver_csytrs(handle, rocblas_fill_upper, N, nrhs, &
       c_loc(dA), lda, c_loc(dIpiv), c_loc(dB), ldb))
  call hipCheck(hipMemcpy(c_loc(hInfo(1)), dInfo, 4_c_size_t, hipMemcpyDeviceToHost))
  call hipCheck(hipMemcpy(hB, dB, hipMemcpyDeviceToHost))

  if (hInfo(1) /= 0) then
     write(*,*) "FAILED! info = ", hInfo(1), " (expected 0)"; call exit(1)
  end if
  do i = 1, N
     if (abs(hB(i) - hX(i)) > error_max) then
        write(*,*) "FAILED! x(", i, ") = ", hB(i), " expected ", hX(i); call exit(1)
     end if
  end do

  call hipCheck(hipFree(dA)); call hipCheck(hipFree(dB))
  call hipCheck(hipFree(dIpiv)); call hipCheck(hipFree(dInfo))
  call hipCheck(rocblas_destroy_handle(handle)); call hipCheck(hipDeviceReset())
  write(*,*) "PASSED!"
end program csytrs
