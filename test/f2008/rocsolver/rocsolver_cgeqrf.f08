!!!!!!!!!!!!!/
! cgeqrf example (single-precision complex QR factorization)
! see: http:!www.netlib.org/lapack/explore-html/df/dc5/group__variants_g_ecomputational_ga3766ea903391b5cf9008132f7440ec7b.html
!!!!!!!!!!!!!!/
!
program cgeqrf
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocblas
  use hipfort_rocsolver

  implicit none
  integer :: i, j ! indices for iterating over results

  ! Define our input data
  complex(c_float_complex) :: hA(3,3) = reshape((/ &
    (12.,1.),(6.,-2.),(-4.,3.), (-51.,2.),(167.,-1.),(24.,4.), (4.,-3.),(-68.,2.),(-41.,1.) /), (/3, 3/))
  ! Reference: packed QR output captured from rocSOLVER (Householder form)
  complex(c_float_complex) :: hResult(3,3) = reshape((/ &
    (-0.1449137687683105E+02,  0.0000000000000000E+00), &
    ( 0.2233207374811172E+00, -0.8392620831727982E-01), &
    (-0.1465090066194534E+00,  0.1187748312950134E+00), &
    (-0.2139203453063965E+02, -0.2173706436157227E+02), &
    (-0.1736573486328125E+03,  0.0000000000000000E+00), &
    ( 0.6425967812538147E-01,  0.3347730636596680E-01), &
    ( 0.1380131053924561E+02,  0.3105296134948730E+01), &
    ( 0.7016841125488281E+02, -0.2104309082031250E+01), &
    ( 0.3473970031738281E+02,  0.0000000000000000E+00) /), (/3, 3/))
  integer(c_int), parameter :: M = 3
  integer(c_int), parameter :: N = 3
  integer(c_int), parameter :: lda = 3

  complex(c_float_complex) :: hIpiv(3) ! CPU buffer for Householder scalars

  complex(c_float_complex), pointer :: dA(:,:)   ! GPU buffer for A
  complex(c_float_complex), pointer :: dIpiv(:)  ! GPU buffer for Householder scalars

  type(c_ptr) :: handle ! rocblas_handle

  real :: error
  ! single precision complex: relative tolerance
  real, parameter :: error_max = 1.0e-4
  !
  write(*,"(a)",advance="no") "-- Running test 'rocsolver_cgeqrf' (Fortran 2008 interfaces) - "

  ! Allocate device-side memory & copy memory from host to device
  call hipCheck(hipMalloc(dA,    source=hA))
  call hipCheck(hipMalloc(dIpiv, source=hIpiv))

  ! Create rocBLAS handle
  call hipCheck(rocblas_create_handle(handle))

  ! Compute the QR factorization on the device
  call hipCheck(rocsolver_cgeqrf(handle, M, N, dA, lda, dIpiv))

  ! Copy result from device to host
  call hipCheck(hipMemcpy(hA,    dA,    hipMemcpyDeviceToHost))
  call hipCheck(hipMemcpy(hIpiv, dIpiv, hipMemcpyDeviceToHost))

  ! Output results
  do j = 1,size(hA,2)
    do i = 1,size(hA,1)
        error = abs(hA(i,j) - hResult(i,j)) / max(abs(hResult(i,j)), 1.0)
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

end program cgeqrf
