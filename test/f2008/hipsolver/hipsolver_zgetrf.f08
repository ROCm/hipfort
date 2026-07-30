!!!!!!!!!!!!!!
! hipsolver zgetrf example (double-precision complex LU factorization, Fortran 2008 interfaces)
! see: https:!rocm.docs.amd.com/projects/hipSOLVER/en/latest/
!
! f2008 style: device buffers are native Fortran array pointers allocated with
! hipMalloc(source=/mold=); A and the pivots are passed as typed arrays. The
! workspace stays a bare type(c_ptr); devInfo is a device-backed scalar pointer.
!!!!!!!!!!!!!!
!
program hipsolver_zgetrf
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipsolver

  implicit none
  integer :: i, j

  integer(c_int), parameter :: M = 3, N = 3, lda = 3

  ! Input (column-major); expected packed LU from hipSOLVER (== rocSOLVER zgetrf)
  complex(c_double_complex) :: hA(3,3) = reshape((/ &
    (12.,1.),(6.,-2.),(-4.,3.), (-51.,2.),(167.,-1.),(24.,4.), (4.,-3.),(-68.,2.),(-41.,1.) /), (/3, 3/))
  complex(c_double_complex) :: hResult(3,3) = reshape((/ &
    ( 0.120000000000000000E+02,  0.100000000000000000E+01), &
    ( 0.482758620689655138E+00, -0.206896551724137928E+00), &
    (-0.310344827586206906E+00,  0.275862068965517238E+00), &
    (-0.510000000000000000E+02,  0.200000000000000000E+01), &
    ( 0.191206896551724128E+03, -0.125172413793103452E+02), &
    ( 0.390604309222698232E-01,  0.100302783845768059E+00), &
    ( 0.400000000000000000E+01, -0.300000000000000000E+01), &
    (-0.693103448275862064E+02,  0.427586206896551690E+01), &
    (-0.374500340913573240E+02,  0.575052076191835670E+01) /), (/3, 3/))
  integer(c_int) :: hIpiv_ref(3) = (/1, 2, 3/)

  integer(c_int) :: hIpiv(3), hInfo

  complex(c_double_complex), pointer :: dA(:,:)   ! GPU buffer for A (holds packed LU on output)
  integer(c_int),            pointer :: dIpiv(:)  ! GPU buffer for pivots
  integer(c_int),            pointer :: dInfo     ! GPU scalar for devInfo (written on device)
  type(c_ptr) :: dWork                            ! opaque workspace
  type(c_ptr) :: handle = c_null_ptr
  integer(c_int) :: lwork

  real(c_double) :: error
  real(c_double), parameter :: error_max = 10 * epsilon(error_max)

  write(*,"(a)",advance="no") "-- Running test 'hipsolver_zgetrf' (Fortran 2008 interfaces) - "

  call hipsolverCheck(hipsolverCreate(handle))

  ! Allocate device memory as native arrays and copy A to device
  call hipCheck(hipMalloc(dA,    source=hA))
  call hipCheck(hipMalloc(dIpiv, mold=hIpiv))
  call hipCheck(hipMalloc(dInfo))

  ! Query and allocate the workspace
  call hipsolverCheck(hipsolverZgetrf_bufferSize(handle, M, N, dA, lda, lwork))
  call hipCheck(hipMalloc(dWork, max(int(lwork,c_size_t) * 16, 1_c_size_t)))

  ! Compute the LU factorization (A/pivots as native arrays, devInfo by reference)
  call hipsolverCheck(hipsolverZgetrf(handle, M, N, dA, lda, dWork, lwork, dIpiv, dInfo))

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
        error = abs(hA(i,j) - hResult(i,j)) / max(abs(hResult(i,j)), 1.0_c_double)
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

end program hipsolver_zgetrf
