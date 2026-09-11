!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Copyright (c) 2020-2026 Advanced Micro Devices, Inc.
!
! Permission is hereby granted, free of charge, to any person obtaining a copy
! of this software and associated documentation files (the "Software"), to deal
! in the Software without restriction, including without limitation the rights
! to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
! copies of the Software, and to permit persons to whom the Software is
! furnished to do so, subject to the following conditions:
!
! The above copyright notice and this permission notice shall be included in
! all copies or substantial portions of the Software.
!
! THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
! IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
! FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
! AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
! LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
! OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
! THE SOFTWARE.
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


program rocblas_gemm_ex_test

  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocblas

  implicit none

  ! D := alpha*op(A)*op(B) + beta*C through the extended-precision entry point.
  ! All buffers are f32_r and the compute type is f32_r. With A = I, alpha = 1
  ! and beta = 0 the result is D = B.
  integer, parameter :: m = 2, n = 2, k = 2
  real(c_float), target :: alpha = 1.0, beta = 0.0

  real(c_float) :: hA(m,k) = reshape([1.0, 0.0, 0.0, 1.0], [m,k])
  real(c_float) :: hB(k,n) = reshape([1.0, 2.0, 3.0, 4.0], [k,n])
  real(c_float) :: hC(m,n)
  real(c_float) :: hD(m,n)
  real(c_float) :: expected(m,n) = reshape([1.0, 2.0, 3.0, 4.0], [m,n])

  real(c_float), pointer, dimension(:,:) :: dA, dB, dC, dD
  type(c_ptr) :: handle = c_null_ptr
  integer :: i, j
  real(c_float) :: error
  real(c_float), parameter :: error_max = 10 * epsilon(error)

  write(*,"(a)",advance="no") "-- Running test 'gemm_ex' (Fortran 2008 interfaces) - "

  call rocblasCheck(rocblas_create_handle(handle))
  call rocblasCheck(rocblas_set_pointer_mode(handle, 0)) ! host pointer mode

  hC = 0.0
  hD = 0.0

  call hipCheck(hipMalloc(dA, source=hA))
  call hipCheck(hipMalloc(dB, source=hB))
  call hipCheck(hipMalloc(dC, source=hC))
  call hipCheck(hipMalloc(dD, source=hD))

  call rocblasCheck(rocblas_gemm_ex(handle, rocblas_operation_none, rocblas_operation_none, &
       m, n, k, c_loc(alpha), c_loc(dA(1,1)), rocblas_datatype_f32_r, m, &
       c_loc(dB(1,1)), rocblas_datatype_f32_r, k, c_loc(beta), &
       c_loc(dC(1,1)), rocblas_datatype_f32_r, m, &
       c_loc(dD(1,1)), rocblas_datatype_f32_r, m, &
       rocblas_datatype_f32_r, rocblas_gemm_algo_standard, 0, 0))
  call hipCheck(hipDeviceSynchronize())
  call hipCheck(hipMemcpy(hD, dD, hipMemcpyDeviceToHost))

  do j = 1, n
    do i = 1, m
      error = abs(expected(i,j) - hD(i,j))
      if (error .gt. error_max) then
        write(*,*) "FAILED! Error bigger than max! Error = ", error, " at ", i, j
        call exit(1)
      end if
    end do
  end do

  call hipCheck(hipFree(dA))
  call hipCheck(hipFree(dB))
  call hipCheck(hipFree(dC))
  call hipCheck(hipFree(dD))
  call rocblasCheck(rocblas_destroy_handle(handle))

  write(*,*) "PASSED!"

end program rocblas_gemm_ex_test
