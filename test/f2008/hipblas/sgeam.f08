program hip_sgeam
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipblas
  use hipfort_hipblas_enums

  implicit none

  ! C := alpha*op(A) + beta*op(B) with alpha = beta = 1 and no
  ! transposition, so C is the elementwise sum A + B.
  integer, parameter :: ld = 2
  real(c_float), parameter :: alpha = 1.0, beta = 1.0

  real(c_float) :: hA(ld,ld) = reshape([1.0, 2.0, 3.0, 4.0], [ld,ld])
  real(c_float) :: hB(ld,ld) = reshape([10.0, 20.0, 30.0, 40.0], [ld,ld])
  real(c_float) :: hC(ld,ld)
  real(c_float) :: expected(ld,ld) = reshape([11.0, 22.0, 33.0, 44.0], [ld,ld])
  real(c_float), pointer, dimension(:,:) :: dA, dB, dC
  type(c_ptr) :: handle = c_null_ptr
  integer :: i, j
  real(c_float) :: error
  real(c_float), parameter :: error_max = 10*epsilon(error)

  write(*,"(a)",advance="no") "-- Running test 'sgeam' (Fortran 2008 interfaces) - "

  call hipblasCheck(hipblasCreate(handle))

  hC = 0.0

  call hipCheck(hipMalloc(dA, shape(hA)))
  call hipCheck(hipMemcpy(dA, hA, hipMemcpyHostToDevice))
  call hipCheck(hipMalloc(dB, shape(hB)))
  call hipCheck(hipMemcpy(dB, hB, hipMemcpyHostToDevice))
  call hipCheck(hipMalloc(dC, shape(hC)))
  call hipCheck(hipMemcpy(dC, hC, hipMemcpyHostToDevice))

  call hipblasCheck(hipblasSgeam(handle, HIPBLAS_OP_N, HIPBLAS_OP_N, ld, ld, &
       alpha, dA, size(dA,1), beta, dB, size(dB,1), dC, size(dA,1)))
  call hipCheck(hipDeviceSynchronize())
  call hipCheck(hipMemcpy(hC, dC, hipMemcpyDeviceToHost))

  do j = 1, ld
    do i = 1, ld
      error = abs(expected(i,j) - hC(i,j))
      if (error > error_max) then
        write(*,*) "FAILED! error = ", error, " at ", i, j
        call exit(1)
      end if
    end do
  end do

  call hipCheck(hipFree(dA))
  call hipCheck(hipFree(dB))
  call hipCheck(hipFree(dC))
  call hipblasCheck(hipblasDestroy(handle))

  write(*,*) "PASSED!"

end program hip_sgeam
