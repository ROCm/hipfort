!!!!!!!!!!!!!/
! zgeqrf example (double-precision complex QR factorization)
! see: http:!www.netlib.org/lapack/explore-html/df/dc5/group__variants_g_ecomputational_ga3766ea903391b5cf9008132f7440ec7b.html
!!!!!!!!!!!!!!/
!
program zgeqrf
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocblas
  use hipfort_rocsolver

  implicit none
  integer :: i, j ! indices for iterating over results

  ! Define our input data
  complex(c_double_complex) :: hA(3,3) = reshape((/ &
    (12.,1.),(6.,-2.),(-4.,3.), (-51.,2.),(167.,-1.),(24.,4.), (4.,-3.),(-68.,2.),(-41.,1.) /), (/3, 3/))
  ! Reference: packed QR output captured from rocSOLVER (Householder form)
  complex(c_double_complex) :: hResult(3,3) = reshape((/ &
    (-0.1449137674618944E+02,  0.0000000000000000E+00), &
    ( 0.2233207375686570E+00, -0.8392620583180764E-01), &
    (-0.1465090017185408E+00,  0.1187748387660200E+00), &
    (-0.2139203233961299E+02, -0.2173706511928417E+02), &
    (-0.1736573665364673E+03,  0.0000000000000000E+00), &
    ( 0.6425967392489010E-01,  0.3347730287711015E-01), &
    ( 0.1380131118684709E+02,  0.3105295017040593E+01), &
    ( 0.7016841351330208E+02, -0.2104307918039474E+01), &
    ( 0.3473969754608228E+02,  0.0000000000000000E+00) /), (/3, 3/))
  integer(c_int), parameter :: M = 3
  integer(c_int), parameter :: N = 3
  integer(c_int), parameter :: lda = 3

  complex(c_double_complex) :: hIpiv(3) ! CPU buffer for Householder scalars

  complex(c_double_complex), pointer :: dA(:,:)   ! GPU buffer for A
  complex(c_double_complex), pointer :: dIpiv(:)  ! GPU buffer for Householder scalars

  type(c_ptr) :: handle ! rocblas_handle

  real(c_double) :: error
  real(c_double), parameter :: error_max = 10 * epsilon(error_max)
  !
  write(*,"(a)",advance="no") "-- Running test 'rocsolver_zgeqrf' (Fortran 2008 interfaces) - "

  ! Allocate device-side memory & copy memory from host to device
  call hipCheck(hipMalloc(dA,    source=hA))
  call hipCheck(hipMalloc(dIpiv, source=hIpiv))

  ! Create rocBLAS handle
  call hipCheck(rocblas_create_handle(handle))

  ! Compute the QR factorization on the device
  call hipCheck(rocsolver_zgeqrf(handle, M, N, dA, lda, dIpiv))

  ! Copy result from device to host
  call hipCheck(hipMemcpy(hA,    dA,    hipMemcpyDeviceToHost))
  call hipCheck(hipMemcpy(hIpiv, dIpiv, hipMemcpyDeviceToHost))

  ! Output results
  do j = 1,size(hA,2)
    do i = 1,size(hA,1)
        error = abs(hA(i,j) - hResult(i,j)) / max(abs(hResult(i,j)), 1.0_c_double)
        if(error .gt. error_max) then
            write(*,*) "FAILED! Error bigger than max! Error = ", error, " hA(", i, ",", j, ") = ", hA(i,j)
            call exit
        end if
    end do
  end do

  ! Clean up
  call hipCheck(hipFree(dA))
  call hipCheck(hipFree(dIpiv))
  call hipCheck(rocblas_destroy_handle(handle))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"

end program zgeqrf
