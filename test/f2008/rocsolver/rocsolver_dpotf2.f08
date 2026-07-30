!!!!!!!!!!!!!!
! dpotf2 example (double-precision unblocked Cholesky factorization)
! see: https:!rocm.docs.amd.com/projects/rocSOLVER/en/latest/reference/lapack.html
!
! potf2 is the unblocked variant of potrf and produces the same factor.
! rocSOLVER writes `info` to DEVICE memory, so it is backed by a device
! allocation and passed as c_loc(dInfo). With rocblas_fill_upper the factor is
! written to the upper triangle; the lower triangle keeps the input values.
!!!!!!!!!!!!!!
!
program dpotf2
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocblas
  use hipfort_rocblas_enums
  use hipfort_rocsolver

  implicit none
  integer :: i, j

  real(c_double) :: hA(3,3) = reshape((/4, 12, -16, 12, 37, -43, -16, -43, 98/), (/3, 3/))
  real(c_double) :: hResult(3,3) = reshape((/&
     2.0000000000000000d0, 12.0000000000000000d0, -16.0000000000000000d0, &
     6.0000000000000000d0,  1.0000000000000000d0, -43.0000000000000000d0, &
    -8.0000000000000000d0,  5.0000000000000000d0,   3.0000000000000000d0/), (/3, 3/))
  integer(c_int), parameter :: N = 3, lda = 3

  real(c_double), pointer :: dA(:,:)
  integer(c_int), pointer :: dInfo(:)

  type(c_ptr) :: handle

  real(c_double) :: error
  real(c_double), parameter :: error_max = 10 * epsilon(error_max)

  write(*,"(a)",advance="no") "-- Running test 'rocsolver_dpotf2' (Fortran 2008 interfaces) - "

  call hipCheck(hipMalloc(dA,    source=hA))
  call hipCheck(hipMalloc(dInfo, 1))

  call hipCheck(rocblas_create_handle(handle))

  call hipCheck(rocsolver_dpotf2(handle, rocblas_fill_upper, N, dA, lda, c_loc(dInfo)))

  call hipCheck(hipMemcpy(hA, dA, hipMemcpyDeviceToHost))

  do j = 1,size(hA,2)
    do i = 1,size(hA,1)
        error = abs(hA(i,j) - hResult(i,j)) / max(abs(hResult(i,j)), 1.0_c_double)
        if(error .gt. error_max) then
            write(*,*) "FAILED! Error bigger than max! Error = ", error, " hA(", i, ",", j, ") = ", hA(i,j)
            call exit
        end if
    end do
  end do

  call hipCheck(hipFree(dA))
  call hipCheck(hipFree(dInfo))
  call hipCheck(rocblas_destroy_handle(handle))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"

end program dpotf2
