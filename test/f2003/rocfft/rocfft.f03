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

program rocfft_example
  use iso_c_binding
  use hip
  use rocfft

  implicit none

  integer(c_size_t), parameter :: N=16
  integer(c_size_t), parameter :: Nbytes = N*8*2

  type double2
     double precision :: x
     double precision :: y
  end type double2

  type(double2), allocatable, target, dimension(:) :: hx
  type(c_ptr) :: dx = c_null_ptr
  type(c_ptr) :: plan = c_null_ptr
  integer(c_size_t), allocatable, target, dimension(:) :: lengths
  integer(c_size_t), parameter :: one = 1
  integer :: i
  double precision :: error
  double precision, parameter :: error_max = epsilon(error)

  write(*,"(a)",advance="no") "-- Running test 'rocFFT' (Fortran 2003 interfaces) - "

  call rocfftCheck(rocfft_setup())

  allocate(lengths(3))
  lengths(1) = N

  allocate(hx(N))
  hx(:)%x = 1
  hx(:)%y = -1

  call hipCheck(hipMalloc(dx,Nbytes))
  call hipCheck(hipMemcpy(dx,c_loc(hx(1)),Nbytes,hipMemcpyHostToDevice))

  call rocfftCheck(rocfft_plan_create(plan,&
                                      rocfft_placement_inplace,&
                                      rocfft_transform_type_complex_forward,&
                                      rocfft_precision_double,&
                                      one,&
                                      c_loc(lengths(1)),&
                                      one,&
                                      c_null_ptr))

  call rocfftCheck(rocfft_execute(plan,dx,c_null_ptr,c_null_ptr))

  call hipCheck(hipDeviceSynchronize())

  call rocfftCheck(rocfft_plan_destroy(plan))

  call hipCheck(hipMemcpy(c_loc(hx(1)),dx,Nbytes,hipMemcpyDeviceToHost))
  call hipCheck(hipFree(dx))

  ! Using the C++ version of this as the "gold".
  ! first components were \pm 16 and the remaining componenents
  ! were zero, so the sum of each component pair should be zero
  do i = 1,N
     error = abs(hx(i)%x+hx(i)%y)
     if(error > error_max)then
        write(*,*) "FAILED! Error = ", error, "hx(i)%x = ", hx(i)%x, "hx(i)%y = "
     end if
  end do

  deallocate(hx)
  deallocate(lengths)

  call rocfftCheck(rocfft_cleanup())

  write(*,*) "PASSED!"

end program rocfft_example