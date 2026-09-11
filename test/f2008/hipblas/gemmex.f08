program hip_gemmex
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_hipblas
  use hipfort_hipblas_enums

  implicit none

  ! C := alpha*op(A)*op(B) + beta*C through the extended-precision entry point,
  ! with all buffers f32 and an f32 compute type. A = I and beta = 0, so C = B.
  integer, parameter :: ld = 2
  real(c_float), target :: alpha = 1.0, beta = 0.0

  real(c_float) :: hA(ld,ld) = reshape([1.0, 0.0, 0.0, 1.0], [ld,ld])
  real(c_float) :: hB(ld,ld) = reshape([1.0, 2.0, 3.0, 4.0], [ld,ld])
  real(c_float) :: hC(ld,ld)
  real(c_float) :: expected(ld,ld) = reshape([1.0, 2.0, 3.0, 4.0], [ld,ld])
  real(c_float), pointer, dimension(:,:) :: dA, dB, dC
  type(c_ptr) :: handle = c_null_ptr
  integer :: i, j
  real(c_float) :: error
  real(c_float), parameter :: error_max = 10*epsilon(error)

  write(*,"(a)",advance="no") "-- Running test 'gemmex' (Fortran 2008 interfaces) - "

  call hipblasCheck(hipblasCreate(handle))

  hC = 0.0

  call hipCheck(hipMalloc(dA, shape(hA)))
  call hipCheck(hipMemcpy(dA, hA, hipMemcpyHostToDevice))
  call hipCheck(hipMalloc(dB, shape(hB)))
  call hipCheck(hipMemcpy(dB, hB, hipMemcpyHostToDevice))
  call hipCheck(hipMalloc(dC, shape(hC)))
  call hipCheck(hipMemcpy(dC, hC, hipMemcpyHostToDevice))

  call hipblasCheck(hipblasGemmEx(handle, HIPBLAS_OP_N, HIPBLAS_OP_N, ld, ld, ld, &
       c_loc(alpha), c_loc(dA(1,1)), HIP_R_32F, ld, &
       c_loc(dB(1,1)), HIP_R_32F, ld, c_loc(beta), &
       c_loc(dC(1,1)), HIP_R_32F, ld, HIPBLAS_COMPUTE_32F, HIPBLAS_GEMM_DEFAULT))
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

end program hip_gemmex
