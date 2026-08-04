!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Copyright (c) 2026 Advanced Micro Devices, Inc.
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


! Exercises the experimental F2018 assumed-rank interfaces: a rank-3 array is
! passed to the rocblas_saxpy generic. The classic rank-specific overloads only
! cover up to rank 1, so this compiles/resolves ONLY with HIPFORT_ASSUMED_RANK
! (a single dimension(..) wrapper accepts any rank). Demonstrates the rank > 2
! support requested in https://github.com/ROCm/hipfort/issues/175.

program rocblas_saxpy_rank3_test

  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocblas

  implicit none

  integer, parameter :: nx = 2, ny = 3, nz = 4, n = nx*ny*nz

  real(c_float), allocatable, dimension(:,:,:) :: hx, hy
  real(c_float), pointer, dimension(:,:,:) :: dx => null(), dy => null()
  real(c_float) :: alpha = 2.0
  real(c_float), parameter :: y_exact = 5.0   ! alpha*1 + 3 = 5
  type(c_ptr) :: handle = c_null_ptr

  integer :: i, j, k
  real(c_float) :: error
  real(c_float), parameter :: error_max = 10*epsilon(error)

  write(*,"(a)",advance="no") "-- Running test 'SAXPY rank-3' (Fortran 2018 assumed-rank interfaces) - "

  call rocblasCheck(rocblas_create_handle(handle))

  allocate(hx(nx,ny,nz), hy(nx,ny,nz))
  hx = 1.0
  hy = 3.0

  call hipCheck(hipMalloc(dx, source=hx))
  call hipCheck(hipMalloc(dy, source=hy))

  ! Rank-3 dx/dy passed directly to the generic; n counts all elements. Resolves
  ! to the assumed-rank specific (rank > 1 is impossible with the classic form).
  call rocblasCheck(rocblas_saxpy(handle, n, alpha, dx, 1, dy, 1))

  call hipCheck(hipDeviceSynchronize())
  call hipCheck(hipMemcpy(hy, dy, hipMemcpyDeviceToHost))

  do k = 1, nz
    do j = 1, ny
      do i = 1, nx
        error = abs((y_exact - hy(i,j,k))/y_exact)
        if( error > error_max )then
          write(*,*) "FAILED! Error bigger than max! Error = ", error, " hy = ", hy(i,j,k)
          call exit(1)
        end if
      end do
    end do
  end do

  call hipCheck(hipFree(dx))
  call hipCheck(hipFree(dy))
  call rocblasCheck(rocblas_destroy_handle(handle))
  deallocate(hx, hy)

  write(*,*) "PASSED!"

end program rocblas_saxpy_rank3_test
