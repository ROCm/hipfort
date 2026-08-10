!!!!!!!!!!!!!/
! cgels example (single-complex least-squares solve)
! see: https:!rocm.docs.amd.com/projects/rocSOLVER/en/latest/reference/lapack.html
!
! Self-verifying: pick a known solution x, form b = A*x for a square
! nonsingular A, solve the least-squares problem with gels, and confirm the
! overwritten B recovers x.
!
! NOTE: gels writes `info` to DEVICE memory, so info is backed by a device
! allocation and passed as c_loc(dInfo); passing a host scalar faults on the GPU.
!!!!!!!!!!!!!!/
!
program cgels
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocblas
  use hipfort_rocblas_enums
  use hipfort_rocsolver

  implicit none
  integer :: i ! index for iterating over results

  integer(c_int), parameter :: M = 3
  integer(c_int), parameter :: N = 3
  integer(c_int), parameter :: nrhs = 1
  integer(c_int), parameter :: lda = 3
  integer(c_int), parameter :: ldb = 3

  ! Nonsingular input matrix (column-major)
  complex(c_float_complex) :: hA(3,3) = reshape((/ &
    (1.0,1.0), (2.0,0.0), (1.0,0.0), &
    (2.0,0.0), (5.0,1.0), (0.0,0.0), &
    (3.0,0.0), (3.0,0.0), (8.0,1.0)/), (/3, 3/))
  complex(c_float_complex) :: hX(3,1) = reshape((/ &
    (1.0,1.0), (2.0,-1.0), (3.0,2.0)/), (/3, 1/))  ! known solution
  complex(c_float_complex) :: hB(3,1)                 ! RHS = A*x

  complex(c_float_complex), pointer :: dA(:,:)
  complex(c_float_complex), pointer :: dB(:,:)
  integer(c_int), pointer :: dInfo(:)

  type(c_ptr) :: handle ! rocblas_handle

  real(c_float) :: error
  real(c_float), parameter :: error_max = 100 * epsilon(error_max)
  !
  write(*,"(a)",advance="no") "-- Running test 'rocsolver_cgels' (Fortran 2008 interfaces) - "

  ! Build a consistent RHS so that A*x = b
  hB = matmul(hA, hX)

  ! Allocate device-side memory & copy memory from host to device
  call hipCheck(hipMalloc(dA,    source=hA))
  call hipCheck(hipMalloc(dB,    source=hB))
  call hipCheck(hipMalloc(dInfo, 1))

  ! Create rocBLAS handle
  call hipCheck(rocblas_create_handle(handle))

  ! Solve min || A*X - B || in place (B is overwritten with the solution)
  call hipCheck(rocsolver_cgels(handle, rocblas_operation_none, M, N, nrhs, dA, lda, dB, ldb, c_loc(dInfo)))

  ! Copy result from device to host
  call hipCheck(hipMemcpy(hB, dB, hipMemcpyDeviceToHost))

  ! Verify the recovered solution matches x
  do i = 1,N
    error = abs(hB(i,1) - hX(i,1)) / max(abs(hX(i,1)), 1.0_c_float)
    if(error .gt. error_max) then
        write(*,*) "FAILED! Error bigger than max! Error = ", error, " X(", i, ") = ", hB(i,1)
        call exit
    end if
  end do

  ! Clean up
  call hipCheck(hipFree(dA))
  call hipCheck(hipFree(dB))
  call hipCheck(hipFree(dInfo))
  call hipCheck(rocblas_destroy_handle(handle))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"

end program cgels
