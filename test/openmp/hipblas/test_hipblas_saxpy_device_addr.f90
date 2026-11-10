!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
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

! Based on an example by Lynd Stringer.
program test_hipblas_saxpy_device_addr

  use iso_c_binding
  use hipfort
  use hipfort_hipblas
  use hipfort_check

  implicit none

  integer(c_int), parameter :: n = 1000
  real(c_float), target :: alpha = 2.0
  real(c_float), allocatable, target :: x(:), y(:)
  type(c_ptr) :: handle = c_null_ptr
  integer :: i

  allocate(x(n), y(n))
  x = [(real(i, c_float), i = 1, n)]
  y = 10.0

  call hipblasCheck(hipblasCreate(handle))
  call saxpy_twice(n, x, y)
  call saxpy_device_ptr()
  call hipblasCheck(hipblasDestroy(handle))

  ! After three saxpy calls, y = 3*alpha*x + 10.
  if (any(abs(y - (3*alpha*x + 10.0)) > 1.0e-5*abs(y))) stop 1
  print *, "PASS"

contains

  ! Explicit-shape dummies have no descriptor, so use_device_addr only
  ! replaces their base addresses.
  subroutine saxpy_twice(n, x, y)
    integer(c_int) :: n
    real(c_float), target :: x(n), y(n)

    ! Copy x and y to the device; y is copied back at the outer end.
    !$omp target data map(to: x) map(tofrom: y)
    ! In this region, x and y refer to their device copies.
    !$omp target data use_device_addr(x, y)
    ! Array overload: y = alpha*x + y.
    call hipblasCheck(hipblasSaxpy(handle, n, alpha, x, 1, y, 1))
    ! Raw interface (Fortran 2003): pass the addresses with c_loc.
    call hipblasCheck(hipblasSaxpy(handle, n, c_loc(alpha), c_loc(x), 1, &
                                   c_loc(y), 1))
    !$omp end target data
    ! hipBLAS is asynchronous: wait for it before y is copied back.
    call hipCheck(hipDeviceSynchronize())
    !$omp end target data
  end subroutine saxpy_twice

  ! The allocatables themselves, without use_device_addr: use_device_ptr
  ! replaces C pointers to the mapped arrays by their device addresses.
  subroutine saxpy_device_ptr()
    type(c_ptr) :: px, py

    px = c_loc(x)
    py = c_loc(y)
    !$omp target data map(to: x) map(tofrom: y)
    !$omp target data use_device_ptr(px, py)
    call hipblasCheck(hipblasSaxpy(handle, n, c_loc(alpha), px, 1, py, 1))
    !$omp end target data
    call hipCheck(hipDeviceSynchronize())
    !$omp end target data
  end subroutine saxpy_device_ptr

end program test_hipblas_saxpy_device_addr
