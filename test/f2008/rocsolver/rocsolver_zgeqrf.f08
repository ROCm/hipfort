!!!!!!!!!!!!!/
! zgeqrf example (double-precision complex QR factorization)
! see: http:!www.netlib.org/lapack/explore-html/df/dc5/group__variants_g_ecomputational_ga3766ea903391b5cf9008132f7440ec7b.html
!!!!!!!!!!!!!!/
!
program zgeqrf
  use iso_c_binding
  use hip
  use rocblas
  use rocsolver

  implicit none
  integer :: i, j ! indices for iterating over results

  ! Define our input data
  complex(c_double_complex) :: hA(3,3) = reshape((/ &
    (12.,1.),(6.,-2.),(-4.,3.), (-51.,2.),(167.,-1.),(24.,4.), (4.,-3.),(-68.,2.),(-41.,1.) /), (/3, 3/))
  ! Reference: packed QR output captured from rocSOLVER (Householder form)
  complex(c_double_complex) :: hResult(3,3) = reshape((/ &
    (-0.1449137674618944D+02,  0.0000000000000000D+00), &
    ( 0.2233207375686570D+00, -0.8392620583180764D-01), &
    (-0.1465090017185408D+00,  0.1187748387660200D+00), &
    (-0.2139203233961299D+02, -0.2173706511928417D+02), &
    (-0.1736573665364673D+03,  0.0000000000000000D+00), &
    ( 0.6425967392489010D-01,  0.3347730287711015D-01), &
    ( 0.1380131118684709D+02,  0.3105295017040593D+01), &
    ( 0.7016841351330208D+02, -0.2104307918039474D+01), &
    ( 0.3473969754608228D+02,  0.0000000000000000D+00) /), (/3, 3/))
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
            call exit(1)
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
