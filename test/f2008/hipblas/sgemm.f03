program hip_sgemm

  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipblas

  implicit none

  integer(kind(HIPBLAS_OP_N)), parameter :: transa = HIPBLAS_OP_N, transb = HIPBLAS_OP_N;
  real(c_float), parameter ::  alpha = 1.1, beta = 0.9;

  integer, parameter ::  m = 1024, n = 1024, k = 1024;

  real(c_float), allocatable, dimension(:,:) :: ha, hb, hc, hc_exact

  real(c_float), pointer, dimension(:,:) :: da, db, dc
  type(c_ptr) :: handle = c_null_ptr

  integer :: i,j
  real :: error
  real, parameter :: error_max = 10*epsilon(error)

  write(*,"(a)",advance="no") "-- Running test 'SGEMM' (Fortran 2008 interfaces) - "

  call hipblasCheck(hipblasCreate(handle))

  allocate(ha(m,k))
  allocate(hb(k,n))
  allocate(hc(m,n))
  allocate(hc_exact(m,n))

  ! Use these constant matrices so the exact answer is also a
  ! constant matrix and therefore easy to check
  ha(:,:) = 1.
  hb(:,:) = 2.
  hc(:,:) = 3.
  hc_exact = alpha*k*2. + beta*3.

  ! Allocate device memory
  call hipCheck(hipMalloc(da,source=ha)) ! implies (blocking) memcpy
  call hipCheck(hipMalloc(db,source=hb))
  call hipCheck(hipMalloc(dc,source=hc))

  call hipblasCheck(hipblasSgemm(handle,transa,transb,m,n,k,alpha,da,size(da,1),db,size(db,1),beta,dc,size(dc,1)))

  call hipCheck(hipDeviceSynchronize())

  ! Transfer data back to host memory
  call hipCheck(hipMemcpy(hc, dc, hipMemcpyDeviceToHost))

  do j = 1,n
    do i = 1,m
       error = abs((hc_exact(i,j) - hc(i,j))/hc_exact(i,j))
       if( error > error_max )then
          write(*,*) "FAILED! Error bigger than max! Error = ", error
          call exit(1)
       end if
    end do
  end do

  call hipCheck(hipFree(da))
  call hipCheck(hipFree(db))
  call hipCheck(hipFree(dc))

  call hipblasCheck(hipblasDestroy(handle))

  deallocate(ha,hb,hc,hc_exact)

  write(*,*) "PASSED!"

end program hip_sgemm
