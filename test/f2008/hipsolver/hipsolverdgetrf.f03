! Example: Compute the LU Factorization of a matrix on the GPU
program main
  use hipfort
  use hipfort_check
  use hipfort_hipsolver
  implicit none
  integer(c_int),parameter    :: M   = 3,&
                                 N   = 3,&
                                 lda = 3
  integer(c_size_t),parameter :: size_piv = min(M, N) ! count of pivot indices
  real(c_double)              :: hA(lda,N)
  integer(c_int)              :: hInfo           ! provides information about algorithm completion
  integer(c_int)              :: hIpiv(size_piv) ! array for pivot indices on CPU
  !
  type(c_ptr)            :: handle = c_null_ptr
  integer(c_int),pointer :: dInfo
  integer(c_int),pointer :: dIpiv(:)
  real(c_double),pointer :: dA(:,:)
  real(c_double),pointer :: dWork(:)
  integer(c_int)         :: size_work ! size of workspace to pass to getrf
  !
  hA = reshape((/12,-51,4, 6,167,-68, -4,24,-41/),shape(hA))
  
  write(*,"(a)",advance="no") "-- Running test 'hipsolverDgetrf' (Fortran 2008 interfaces) - "

  ! let's print the input matrix, just to see it
  ! print *, hA
  
  ! initialization
  call hipsolverCheck(hipsolverCreate(handle))

  ! calculate the sizes of our arrays
  ! allocate memory on GPU & copy hA to device
  call hipCheck(hipMalloc(dInfo))
  call hipCheck(hipMalloc(dIpiv, mold=hIpiv))
  call hipCheck(hipMalloc(dA, source=hA))

  ! create the workspace
  !    type(c_ptr) :: handle
  !    integer(c_int) :: m
  !    integer(c_int) :: n
  !    real(c_double),target,dimension(:,:) :: A
  !    integer(c_int) :: lda
  !    integer(c_int) :: lwork
  call hipsolverCheck(hipsolverDgetrf_bufferSize(handle, M, N, dA, lda, size_work))
  call hipCheck(hipMalloc(dWork, size_work))

  ! compute the LU factorization on the GPU
  call hipsolverCheck(hipsolverDgetrf(handle, M, N, dA, lda, c_loc(dWork), size_work, dIpiv, dInfo))

  ! copy the results back to CPU
  call hipCheck(hipMemcpy(hInfo, dInfo, hipMemcpyDeviceToHost))
  call hipCheck(hipMemcpy(hIpiv, dIpiv, hipMemcpyDeviceToHost))
  call hipCheck(hipMemcpy(hA, dA, hipMemcpyDeviceToHost))

  ! the results are now in hA and hIpiv
  ! we can print some of the results if we want to see them
  ! print *, "hInfo=",hInfo
  ! print *, "hA=",hA
  ! print *, "hIpiv=",hA

  ! clean up
  call hipCheck(hipFree(dWork))
  call hipCheck(hipFree(dInfo))
  call hipCheck(hipFree(dIpiv))
  call hipCheck(hipFree(dA))
  call hipsolverCheck(hipsolverDestroy(handle))
 
  ! TODO: add correctness check 
  write(*,*) "PASSED!"
end program
