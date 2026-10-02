!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Copyright (C) 2021 Advanced Micro Devices, Inc. All rights reserved.
!
! SPDX-License-Identifier: MIT
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

program hipfft_example
  use iso_c_binding
  use hip
  use hipfft

  implicit none

  integer(c_size_t), parameter :: N = 16
  integer(c_size_t), parameter :: Nbytes = N * 8 * 2

  type double2
     double precision :: x
     double precision :: y
  end type double2

  type(double2), allocatable, target, dimension(:) :: hx
  integer(c_int) :: direction = HIPFFT_FORWARD
  type(c_ptr) :: dx = c_null_ptr
  type(c_ptr) :: plan = c_null_ptr
  integer(c_size_t), allocatable, target, dimension(:) :: lengths
  integer(c_size_t), parameter :: one = 1
  integer :: i
  integer(kind(HIPFFT_SUCCESS)) :: ierr
  double precision :: error
  double precision, parameter :: error_max = epsilon(error)

  write(*,"(a)",advance="no") "-- Running test 'hipFFT' (Fortran 2003 interfaces) - "

  allocate(lengths(3))
  lengths(1) = N

  allocate(hx(N))
  hx(:)%x = 1
  hx(:)%y = -1

  call hipCheck(hipMalloc(dx, Nbytes))
  call hipCheck(hipMemcpy(dx, c_loc(hx(1)), Nbytes, hipMemcpyHostToDevice))

  call hipfftCheck(hipfftPlan1d(plan, int(N, 4), HIPFFT_Z2Z, 1))

  call hipfftCheck(hipfftExecZ2Z(plan, dx, dx, direction))
  

  call hipCheck(hipDeviceSynchronize())


  call hipCheck(hipMemcpy(c_loc(hx(1)),dx,Nbytes,hipMemcpyDeviceToHost))
  call hipCheck(hipFree(dx))

  ! Using the C++ version of this as the "gold".
  ! first components were \pm 16 and the remaining componenents
  ! were zero, so the sum of each component pair should be zero
  do i = 1,N
     error = abs(hx(i) % x + hx(i) % y)
     if(error > error_max)then
        write(*,*) "FAILED! Error = ", error, "hx(i)%x = ", hx(i)%x, "hx(i)%y = "
     end if
  end do

  deallocate(hx)
  deallocate(lengths)

  
  call hipfftcheck( hipfftDestroy(plan))

  write(*,*) "PASSED!"

end program hipfft_example