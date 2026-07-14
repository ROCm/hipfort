!!!!!!!!!!!!!/
! zgetrf example (double-precision complex LU factorization)
! see: https:!www.netlib.org/lapack/explore-html/dd/d9a/group__double_g_ecomputational_ga0019443faea08275ca60a734d0593e60.html
!
! NOTE: rocSOLVER writes the `info` output to DEVICE memory. The hipfort
! binding types the info argument as a plain integer, so it must be backed
! by a device allocation (dInfo below) and passed as c_loc(dInfo); passing a
! host scalar faults on the GPU.
!!!!!!!!!!!!!!/
!
program zgetrf
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocblas
  use hipfort_rocsolver

  implicit none
  integer :: i, j ! indices for iterating over results

  ! Define our input data (column-major)
  complex(c_double_complex) :: hA(3,3) = reshape((/ &
    (12.,1.),(6.,-2.),(-4.,3.), (-51.,2.),(167.,-1.),(24.,4.), (4.,-3.),(-68.,2.),(-41.,1.) /), (/3, 3/))
  ! Reference: packed LU factors from rocSOLVER (column-major, matching hA layout)
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
  integer(c_int), parameter :: M = 3
  integer(c_int), parameter :: N = 3
  integer(c_int), parameter :: lda = 3

  integer(c_int) :: hIpiv(3) ! CPU buffer for pivot indices

  complex(c_double_complex), pointer :: dA(:,:)  ! GPU buffer for A
  integer(c_int), pointer :: dIpiv(:)   ! GPU buffer for pivots
  integer(c_int), pointer :: dInfo(:)   ! GPU buffer for info (rocSOLVER writes to device)

  type(c_ptr) :: handle ! rocblas_handle

  real(c_double) :: error
  real(c_double), parameter :: error_max = 10 * epsilon(error_max)
  !
  write(*,"(a)",advance="no") "-- Running test 'rocsolver_zgetrf' (Fortran 2008 interfaces) - "

  ! Allocate device-side memory & copy memory from host to device
  call hipCheck(hipMalloc(dA,    source=hA))
  call hipCheck(hipMalloc(dIpiv, mold=hIpiv))
  call hipCheck(hipMalloc(dInfo, 1))

  ! Create rocBLAS handle
  call hipCheck(rocblas_create_handle(handle))

  ! Compute the LU factorization on the device
  call hipCheck(rocsolver_zgetrf(handle, M, N, dA, lda, dIpiv, c_loc(dInfo)))

  ! Copy result from device to host
  call hipCheck(hipMemcpy(hA,    dA,    hipMemcpyDeviceToHost))
  call hipCheck(hipMemcpy(hIpiv, dIpiv, hipMemcpyDeviceToHost))

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
  call hipCheck(rocblas_destroy_handle(handle))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"

end program zgetrf
