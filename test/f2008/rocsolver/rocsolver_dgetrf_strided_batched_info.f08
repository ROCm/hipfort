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
! rocsolver_dgetrf_strided_batched: per-batch `info` (Fortran 2008 interfaces)
!
! A strided-batched routine writes one info per batch entry: the array
! overloads take it as an integer array on the device, dInfo(batch), and
! their _devptr twins as a type(c_ptr). A is taken either packed in 2-D,
! dA(lda, n*batch) with ipiv(n*batch) (X_full_rank), or with the batch as a
! third dimension, dA(lda, n, batch) with ipiv(n, batch) (X_strided_rank).
! The four calls resolve to _full_rank, _full_rank_devptr, _strided_rank and
! _strided_rank_devptr. Entry 2 is singular: only its info is nonzero (= 2,
! the index of the zero pivot), and entries 1 and 3 hold the LU factors.
!!!!!!!!!!!!!!
!
program dgetrf_strided_batched_info
  use iso_c_binding
  use hip
  use rocblas
  use rocsolver

  implicit none
  integer :: i, j, k, form
  integer(c_int), parameter :: N = 3, lda = 3, batch = 3
  integer(c_int64_t), parameter :: strideA = lda*N, strideP = N
  real(c_double) :: hA0(N,N) = reshape((/12, 6, -4, -51, 167, 24, 4, -68, -41/), (/N, N/))
  real(c_double) :: hLU(N,N) = reshape((/&
    12.0000000000000000d0,   0.500000000000000000d0,  -0.333333333333333315d0,&
   -51.0000000000000000d0, 192.500000000000000d0,      0.363636363636363688d-01,&
     4.00000000000000000d0, -70.0000000000000000d0,   -37.1212121212121176d0/), (/N, N/))
  ! Singular: column 2 = 2 * column 1, exact elimination gives U(2,2) = 0
  real(c_double) :: hS(N,N) = reshape((/4, 2, 1, 8, 4, 2, 1, 0, 1/), (/N, N/))
  integer(c_int), parameter :: info_ref(batch) = (/0, 2, 0/)

  real(c_double) :: hA(N,N,batch)
  integer(c_int) :: hIpiv(N,batch), hInfo(batch)
  real(c_double), pointer :: dA2(:,:), dA3(:,:,:)
  integer(c_int), pointer :: dIpiv1(:), dIpiv2(:,:)
  integer(c_int), pointer :: dInfo(:)          ! one info per batch entry, on the device
  type(c_ptr) :: handle
  real(c_double), parameter :: tol = 10 * epsilon(1.0d0)

  write(*,"(a)",advance="no") "-- Running test 'rocsolver_dgetrf_strided_batched_info' (Fortran 2008 interfaces) - "

  hA(:,:,1) = hA0; hA(:,:,2) = hS; hA(:,:,3) = hA0

  call rocblasCheck(rocblas_create_handle(handle))
  call hipCheck(hipMalloc(dA2, lda, N*batch))
  call hipCheck(hipMalloc(dA3, lda, N, batch))
  call hipCheck(hipMalloc(dIpiv1, N*batch))
  call hipCheck(hipMalloc(dIpiv2, N, batch))
  call hipCheck(hipMalloc(dInfo, batch))

  do form = 1, 4
    hInfo = -1
    call hipCheck(hipMemcpy(dInfo, hInfo, hipMemcpyHostToDevice))
    select case (form)
    case (1) ! packed 2-D A, info as a device array -> _full_rank
      call hipCheck(hipMemcpy(dA2, reshape(hA, (/lda, N*batch/)), hipMemcpyHostToDevice))
      call rocsolverCheck(rocsolver_dgetrf_strided_batched(handle, N, N, dA2, lda, strideA, &
           dIpiv1, strideP, dInfo, batch))
    case (2) ! packed 2-D A, info as type(c_ptr) -> _full_rank_devptr
      call hipCheck(hipMemcpy(dA2, reshape(hA, (/lda, N*batch/)), hipMemcpyHostToDevice))
      call rocsolverCheck(rocsolver_dgetrf_strided_batched(handle, N, N, dA2, lda, strideA, &
           dIpiv1, strideP, c_loc(dInfo), batch))
    case (3) ! 3-D A, info as a device array -> _strided_rank
      call hipCheck(hipMemcpy(dA3, hA, hipMemcpyHostToDevice))
      call rocsolverCheck(rocsolver_dgetrf_strided_batched(handle, N, N, dA3, lda, strideA, &
           dIpiv2, strideP, dInfo, batch))
    case (4) ! 3-D A, info as type(c_ptr) -> _strided_rank_devptr
      call hipCheck(hipMemcpy(dA3, hA, hipMemcpyHostToDevice))
      call rocsolverCheck(rocsolver_dgetrf_strided_batched(handle, N, N, dA3, lda, strideA, &
           dIpiv2, strideP, c_loc(dInfo), batch))
    end select
    call hipCheck(hipMemcpy(hInfo, dInfo, hipMemcpyDeviceToHost))
    do k = 1, batch
      if (hInfo(k) /= info_ref(k)) then
        write(*,*) "FAILED! form ", form, " info(", k, ") = ", hInfo(k), " expected ", info_ref(k)
        call exit(1)
      end if
    end do
    ! Factors of the non-singular entries 1 and 3
    block
      real(c_double) :: hR(N,N,batch), hR2(lda,N*batch)
      integer(c_int) :: hP(N*batch)
      if (form <= 2) then
        call hipCheck(hipMemcpy(hR2, dA2, hipMemcpyDeviceToHost))
        hR = reshape(hR2, (/N, N, batch/))
        call hipCheck(hipMemcpy(hP, dIpiv1, hipMemcpyDeviceToHost))
        hIpiv = reshape(hP, (/N, batch/))
      else
        call hipCheck(hipMemcpy(hR, dA3, hipMemcpyDeviceToHost))
        call hipCheck(hipMemcpy(hIpiv, dIpiv2, hipMemcpyDeviceToHost))
      end if
      do k = 1, batch, 2
        do j = 1, N
          do i = 1, N
            if (abs(hR(i,j,k) - hLU(i,j)) > tol * max(abs(hLU(i,j)), 1.0d0)) then
              write(*,*) "FAILED! form ", form, " LU(", i, ",", j, ",", k, ") = ", hR(i,j,k)
              call exit(1)
            end if
          end do
          if (hIpiv(j,k) /= j) then
            write(*,*) "FAILED! form ", form, " ipiv(", j, ",", k, ") = ", hIpiv(j,k); call exit(1)
          end if
        end do
      end do
    end block
  end do

  call hipCheck(hipFree(dA2))
  call hipCheck(hipFree(dA3))
  call hipCheck(hipFree(dIpiv1))
  call hipCheck(hipFree(dIpiv2))
  call hipCheck(hipFree(dInfo))
  call rocblasCheck(rocblas_destroy_handle(handle))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"

end program dgetrf_strided_batched_info
