!!!!!!!!!!!!!/
! zgetrs example (double-precision complex LU solve)
! see: https:!www.netlib.org/lapack/explore-html/d6/d49/group__double_g_ecomputational_gafa35ce1d7865b80563bbed6317050ad7.html
!
! Self-verifying: pick a known solution x, form b = A*x, factorize A with
! getrf, solve A*X = b with getrs, and confirm X recovers x.
!
! NOTE: getrf writes `info` to DEVICE memory, so info is backed by a device
! allocation and passed as c_loc(dInfo); passing a host scalar faults on the GPU.
!!!!!!!!!!!!!!/
!
program zgetrs
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocblas
  use hipfort_rocblas_enums
  use hipfort_rocsolver

  implicit none
  integer :: i ! index for iterating over results

  integer(c_int), parameter :: N = 3
  integer(c_int), parameter :: lda = 3
  integer(c_int), parameter :: ldb = 3
  integer(c_int), parameter :: nrhs = 1

  ! Nonsingular input matrix (column-major)
  complex(c_double_complex) :: hA(3,3) = reshape((/ &
    (12.,1.),(6.,-2.),(-4.,3.), (-51.,2.),(167.,-1.),(24.,4.), (4.,-3.),(-68.,2.),(-41.,1.) /), (/3, 3/))
  complex(c_double_complex) :: hX(3,1) = reshape((/ (1.,1.), (2.,-1.), (3.,2.) /), (/3, 1/))  ! known solution
  complex(c_double_complex) :: hB(3,1)                                                          ! RHS = A*x

  integer(c_int) :: hIpiv(3)

  complex(c_double_complex), pointer :: dA(:,:)
  complex(c_double_complex), pointer :: dB(:,:)
  integer(c_int), pointer :: dIpiv(:)
  integer(c_int), pointer :: dInfo(:)

  type(c_ptr) :: handle ! rocblas_handle

  real(c_double) :: error
  real(c_double), parameter :: error_max = 100 * epsilon(error_max)
  !
  write(*,"(a)",advance="no") "-- Running test 'rocsolver_zgetrs' (Fortran 2008 interfaces) - "

  ! Build a consistent RHS so that A*x = b
  hB = matmul(hA, hX)

  ! Allocate device-side memory & copy memory from host to device
  call hipCheck(hipMalloc(dA,    source=hA))
  call hipCheck(hipMalloc(dB,    source=hB))
  call hipCheck(hipMalloc(dIpiv, mold=hIpiv))
  call hipCheck(hipMalloc(dInfo, 1))

  ! Create rocBLAS handle
  call hipCheck(rocblas_create_handle(handle))

  ! Factorize, then solve A*X = B in place (B is overwritten with the solution)
  call hipCheck(rocsolver_zgetrf(handle, N, N, dA, lda, dIpiv, c_loc(dInfo)))
  call hipCheck(rocsolver_zgetrs(handle, rocblas_operation_none, N, nrhs, dA, lda, dIpiv, dB, ldb))

  ! Copy result from device to host
  call hipCheck(hipMemcpy(hB, dB, hipMemcpyDeviceToHost))

  ! Verify the recovered solution matches x
  do i = 1,N
    error = abs(hB(i,1) - hX(i,1)) / max(abs(hX(i,1)), 1.0_c_double)
    if(error .gt. error_max) then
        write(*,*) "FAILED! Error bigger than max! Error = ", error, " X(", i, ") = ", hB(i,1)
        call exit
    end if
  end do

  ! Clean up
  call hipCheck(hipFree(dA))
  call hipCheck(hipFree(dB))
  call hipCheck(hipFree(dIpiv))
  call hipCheck(hipFree(dInfo))
  call hipCheck(rocblas_destroy_handle(handle))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"

end program zgetrs
