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
! rocsparse dgebsr2gebsc with a host buffer size (Fortran 2008 interfaces)
! see: https://rocm.docs.amd.com/projects/rocSPARSE/en/latest/
!
! Binding behaviour checked: the p_buffer_size of
! rocsparse_dgebsr2gebsc_buffer_size is a size_t the library writes on the host
! (it has no device-pointer form any more). The generic resolves to
! rocsparse_dgebsr2gebsc_buffer_size_rank_1 with device arrays for the matrix
! and a plain host integer(c_size_t) variable for the size. The size is then
! used for rocsparse_dgebsr2gebsc (rank_1 form, buffer as a type(c_ptr)).
!
! A has mb=2 block rows, nb=3 block columns, 2x3 blocks (row_block_dim=2,
! col_block_dim=3) and the block pattern
!   [ B1  .   B2 ]
!   [ B3  B4  .  ]
! so the BSC form has col_ptr = (0,2,3,4), row_ind = (0,1,1,0) and the blocks
! in the order B1, B3, B4, B2 (each block's values are copied unchanged).
!!!!!!!!!!!!!!
!
program rocsparse_dgebsr2gebsc_buffer_size_host
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocsparse
  implicit none
  integer :: i, k
  integer(c_int), parameter :: mb = 2, nb = 3, nnzb = 4, rbd = 2, cbd = 3
  integer(c_int), parameter :: bs = rbd*cbd
  integer(c_int) :: hRowPtr(mb+1) = (/0, 2, 4/)
  integer(c_int) :: hColInd(nnzb) = (/0, 2, 0, 1/)
  real(c_double) :: hVal(nnzb*bs)
  integer(c_int) :: hColPtr(nb+1), hRowInd(nnzb)
  real(c_double) :: hBscVal(nnzb*bs)
  integer(c_int) :: expColPtr(nb+1) = (/0, 2, 3, 4/)
  integer(c_int) :: expRowInd(nnzb) = (/0, 1, 1, 0/)
  integer :: expOrder(nnzb) = (/1, 3, 4, 2/)   ! BSR block feeding each BSC block
  type(c_ptr) :: handle = c_null_ptr
  type(c_ptr) :: dBuf = c_null_ptr
  real(c_double), pointer :: dVal(:), dBscVal(:)
  integer(c_int), pointer :: dRowPtr(:), dColInd(:), dColPtr(:), dRowInd(:)
  integer(c_size_t) :: buffer_size
  write(*,"(a)",advance="no") "-- Running test 'rocsparse_dgebsr2gebsc_buffer_size_host' (Fortran 2008 interfaces) - "

  do i = 1, nnzb*bs
     hVal(i) = real(10*((i-1)/bs + 1) + mod(i-1, bs), c_double)   ! block k: 10k, 10k+1, ...
  end do

  call hipCheck(hipMalloc(dVal,    source=hVal))
  call hipCheck(hipMalloc(dRowPtr, source=hRowPtr))
  call hipCheck(hipMalloc(dColInd, source=hColInd))
  call hipCheck(hipMalloc(dBscVal, mold=hBscVal))
  call hipCheck(hipMalloc(dColPtr, mold=hColPtr))
  call hipCheck(hipMalloc(dRowInd, mold=hRowInd))
  call rocsparseCheck(rocsparse_create_handle(handle))

  ! Host size_t output through the array overload.
  buffer_size = 0
  call rocsparseCheck(rocsparse_dgebsr2gebsc_buffer_size(handle, mb, nb, nnzb, &
       dVal, dRowPtr, dColInd, rbd, cbd, buffer_size))
  if (buffer_size <= 0) then
     write(*,*) "FAILED! buffer_size = ", buffer_size, " (expected > 0)"; call exit(1)
  end if

  call hipCheck(hipMalloc(dBuf, buffer_size))
  call rocsparseCheck(rocsparse_dgebsr2gebsc(handle, mb, nb, nnzb, dVal, dRowPtr, dColInd, &
       rbd, cbd, dBscVal, dRowInd, dColPtr, rocsparse_action_numeric, &
       rocsparse_index_base_zero, dBuf))
  call hipCheck(hipDeviceSynchronize())
  call hipCheck(hipMemcpy(hColPtr, dColPtr, hipMemcpyDeviceToHost))
  call hipCheck(hipMemcpy(hRowInd, dRowInd, hipMemcpyDeviceToHost))
  call hipCheck(hipMemcpy(hBscVal, dBscVal, hipMemcpyDeviceToHost))

  if (any(hColPtr /= expColPtr)) then
     write(*,*) "FAILED! bsc_col_ptr = ", hColPtr, " expected ", expColPtr; call exit(1)
  end if
  if (any(hRowInd /= expRowInd)) then
     write(*,*) "FAILED! bsc_row_ind = ", hRowInd, " expected ", expRowInd; call exit(1)
  end if
  do k = 1, nnzb
     do i = 1, bs
        if (hBscVal((k-1)*bs + i) /= hVal((expOrder(k)-1)*bs + i)) then
           write(*,*) "FAILED! bsc_val(", (k-1)*bs + i, ") = ", hBscVal((k-1)*bs + i), &
                      " expected ", hVal((expOrder(k)-1)*bs + i); call exit(1)
        end if
     end do
  end do

  call rocsparseCheck(rocsparse_destroy_handle(handle))
  call hipCheck(hipFree(dVal)); call hipCheck(hipFree(dRowPtr)); call hipCheck(hipFree(dColInd))
  call hipCheck(hipFree(dBscVal)); call hipCheck(hipFree(dColPtr)); call hipCheck(hipFree(dRowInd))
  call hipCheck(hipFree(dBuf))
  call hipCheck(hipDeviceReset())
  write(*,*) "PASSED!"
end program rocsparse_dgebsr2gebsc_buffer_size_host
