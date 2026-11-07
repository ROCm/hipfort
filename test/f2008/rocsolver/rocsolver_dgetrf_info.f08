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

!!!!!!!!!!!!!!
! rocsolver_dgetrf: `info` as a device-only scalar (Fortran 2008 interfaces)
!
! rocSOLVER writes `info` on the GPU, so the array overloads take it as one
! integer that lives on the device. This test checks that:
!  (a) an `integer(c_int), pointer` allocated with hipMalloc (rank 0), passed
!      with A as dA(:,:), resolves to rocsolver_dgetrf_full_rank and receives
!      info = 0, with the correct LU factors and pivots;
!  (b) the same call with info as a type(c_ptr) resolves to
!      rocsolver_dgetrf_full_rank_devptr;
!  (c) a singular matrix gives info > 0, the index of the first zero pivot.
!!!!!!!!!!!!!!
!
program dgetrf_info
  use iso_c_binding
  use hip
  use rocblas
  use rocsolver

  implicit none
  integer :: i, j
  integer(c_int), parameter :: N = 3, lda = 3
  real(c_double) :: hA0(N,N) = reshape((/12, 6, -4, -51, 167, 24, 4, -68, -41/), (/N, N/))
  ! Packed LU factors of hA0 (L below the diagonal, U on and above)
  real(c_double) :: hLU(N,N) = reshape((/&
    12.0000000000000000d0,   0.500000000000000000d0,  -0.333333333333333315d0,&
   -51.0000000000000000d0, 192.500000000000000d0,      0.363636363636363688d-01,&
     4.00000000000000000d0, -70.0000000000000000d0,   -37.1212121212121176d0/), (/N, N/))
  integer(c_int) :: hIpiv_ref(N) = (/1, 2, 3/)
  ! Singular: column 2 = 2 * column 1 (powers of two, exact elimination),
  ! so U(2,2) = 0 exactly and info = 2
  real(c_double) :: hS(N,N) = reshape((/4, 2, 1, 8, 4, 2, 1, 0, 1/), (/N, N/))

  real(c_double) :: hA(N,N)
  integer(c_int) :: hIpiv(N)
  integer(c_int), target :: hInfo
  real(c_double), pointer :: dA(:,:)
  integer(c_int), pointer :: dIpiv(:)
  integer(c_int), pointer :: dInfo        ! device scalar (rank 0)
  type(c_ptr) :: dInfoPtr                 ! the same, as a type(c_ptr)
  type(c_ptr) :: handle
  real(c_double), parameter :: tol = 10 * epsilon(1.0d0)

  write(*,"(a)",advance="no") "-- Running test 'rocsolver_dgetrf_info' (Fortran 2008 interfaces) - "

  call rocblasCheck(rocblas_create_handle(handle))
  call hipCheck(hipMalloc(dA, source=hA0))
  call hipCheck(hipMalloc(dIpiv, N))
  call hipCheck(hipMalloc(dInfo))
  call hipCheck(hipMalloc(dInfoPtr, 4_c_size_t))

  ! (a) info as a Fortran integer on the device -> rocsolver_dgetrf_full_rank
  hInfo = -1
  call hipCheck(hipMemcpy(dInfo, hInfo, hipMemcpyHostToDevice))
  call rocsolverCheck(rocsolver_dgetrf(handle, N, N, dA, lda, dIpiv, dInfo))
  call hipCheck(hipMemcpy(hInfo, dInfo, hipMemcpyDeviceToHost))
  if (hInfo /= 0) then
    write(*,*) "FAILED! (a) info = ", hInfo, " (expected 0)"; call exit(1)
  end if
  call check_lu("(a)")

  ! (b) info as type(c_ptr) -> rocsolver_dgetrf_full_rank_devptr
  call hipCheck(hipMemcpy(dA, hA0, hipMemcpyHostToDevice))
  hInfo = -1
  call hipCheck(hipMemcpy(dInfoPtr, c_loc(hInfo), 4_c_size_t, hipMemcpyHostToDevice))
  call rocsolverCheck(rocsolver_dgetrf(handle, N, N, dA, lda, dIpiv, dInfoPtr))
  call hipCheck(hipMemcpy(c_loc(hInfo), dInfoPtr, 4_c_size_t, hipMemcpyDeviceToHost))
  if (hInfo /= 0) then
    write(*,*) "FAILED! (b) info = ", hInfo, " (expected 0)"; call exit(1)
  end if
  call check_lu("(b)")

  ! (c) singular matrix: info is the index of the zero pivot
  call hipCheck(hipMemcpy(dA, hS, hipMemcpyHostToDevice))
  call rocsolverCheck(rocsolver_dgetrf(handle, N, N, dA, lda, dIpiv, dInfo))
  call hipCheck(hipMemcpy(hInfo, dInfo, hipMemcpyDeviceToHost))
  if (hInfo /= 2) then
    write(*,*) "FAILED! (c) singular info = ", hInfo, " (expected 2)"; call exit(1)
  end if

  call hipCheck(hipFree(dA))
  call hipCheck(hipFree(dIpiv))
  call hipCheck(hipFree(dInfo))
  call hipCheck(hipFree(dInfoPtr))
  call rocblasCheck(rocblas_destroy_handle(handle))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"

contains

  subroutine check_lu(tag)
    character(*), intent(in) :: tag
    call hipCheck(hipMemcpy(hA, dA, hipMemcpyDeviceToHost))
    call hipCheck(hipMemcpy(hIpiv, dIpiv, hipMemcpyDeviceToHost))
    do j = 1, N
      do i = 1, N
        if (abs(hA(i,j) - hLU(i,j)) > tol * max(abs(hLU(i,j)), 1.0d0)) then
          write(*,*) "FAILED! ", tag, " LU(", i, ",", j, ") = ", hA(i,j), " expected ", hLU(i,j)
          call exit(1)
        end if
      end do
      if (hIpiv(j) /= hIpiv_ref(j)) then
        write(*,*) "FAILED! ", tag, " ipiv(", j, ") = ", hIpiv(j); call exit(1)
      end if
    end do
  end subroutine check_lu

end program dgetrf_info
