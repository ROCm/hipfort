!!!!!!!!!!!!!!
! hipsolver sgetrf example (single-precision LU factorization, Fortran 2008 interfaces)
! see: https:!rocm.docs.amd.com/projects/hipSOLVER/en/latest/
!
! f2008 style: device buffers are native Fortran array pointers allocated with
! hipMalloc(source=/mold=); A and the pivots are passed as typed arrays. The
! workspace stays a bare type(c_ptr); devInfo is a device-backed scalar pointer.
!!!!!!!!!!!!!!
!
program hipsolver_sgetrf
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipsolver

  implicit none
  integer :: i, j

  integer(c_int), parameter :: M = 3, N = 3, lda = 3

  ! Input matrix (column-major) and the expected packed LU (same reference as
  ! the rocSOLVER sgetrf test; hipSOLVER wraps rocSOLVER)
  real(c_float) :: hA(3,3) = reshape((/12, 6, -4, -51, 167, 24, 4, -68, -41/), (/3, 3/))
  real(c_float) :: hResult(3,3) = reshape((/&
    12.0000000000000000d0,   0.500000000000000000d0,  -0.333333333333333315d0,&
   -51.0000000000000000d0, 192.500000000000000d0,      0.363636363636363688d-01,&
     4.00000000000000000d0, -70.0000000000000000d0,   -37.1212121212121176d0/), shape(hResult), order=(/2,1/))
  integer(c_int) :: hIpiv_ref(3) = (/1, 2, 3/)

  integer(c_int) :: hIpiv(3), hInfo

  real(c_float),  pointer :: dA(:,:)   ! GPU buffer for A (holds packed LU on output)
  integer(c_int), pointer :: dIpiv(:)  ! GPU buffer for pivots
  integer(c_int), pointer :: dInfo     ! GPU scalar for devInfo (written on device)
  type(c_ptr) :: dWork                 ! opaque workspace
  type(c_ptr) :: handle = c_null_ptr
  integer(c_int) :: lwork

  real :: error
  real, parameter :: error_max = 1.0e-4

  write(*,"(a)",advance="no") "-- Running test 'hipsolver_sgetrf' (Fortran 2008 interfaces) - "

  call hipsolverCheck(hipsolverCreate(handle))

  ! Allocate device memory as native arrays and copy A to device
  call hipCheck(hipMalloc(dA,    source=hA))
  call hipCheck(hipMalloc(dIpiv, mold=hIpiv))
  call hipCheck(hipMalloc(dInfo))

  ! Query and allocate the workspace
  call hipsolverCheck(hipsolverSgetrf_bufferSize(handle, M, N, dA, lda, lwork))
  call hipCheck(hipMalloc(dWork, max(int(lwork,c_size_t) * 4, 1_c_size_t)))

  ! Compute the LU factorization (A/pivots as native arrays, devInfo by reference)
  call hipsolverCheck(hipsolverSgetrf(handle, M, N, dA, lda, dWork, lwork, dIpiv, dInfo))

  ! Copy results back to host
  call hipCheck(hipMemcpy(hA,    dA,    hipMemcpyDeviceToHost))
  call hipCheck(hipMemcpy(hIpiv, dIpiv, hipMemcpyDeviceToHost))
  call hipCheck(hipMemcpy(hInfo, dInfo, hipMemcpyDeviceToHost))

  ! Check info
  if(hInfo /= 0) then
    write(*,*) "FAILED! info = ", hInfo, " (expected 0)"
    call exit
  end if

  ! Check factor values
  do j = 1,size(hA,2)
    do i = 1,size(hA,1)
        error = abs(hA(i,j) - hResult(i,j)) / max(abs(hResult(i,j)), 1.0)
        if(error .gt. error_max) then
            write(*,*) "FAILED! Error bigger than max! Error = ", error, " hA(", i, ",", j, ") = ", hA(i,j)
            call exit
        end if
    end do
  end do

  ! Check pivots
  do i = 1,3
    if(hIpiv(i) .ne. hIpiv_ref(i)) then
        write(*,*) "FAILED! Pivot mismatch at ", i, " got ", hIpiv(i), " expected ", hIpiv_ref(i)
        call exit
    end if
  end do

  ! Clean up
  call hipCheck(hipFree(dA))
  call hipCheck(hipFree(dIpiv))
  call hipCheck(hipFree(dInfo))
  call hipCheck(hipFree(dWork))
  call hipsolverCheck(hipsolverDestroy(handle))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"

end program hipsolver_sgetrf
