!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! ==============================================================================
! hipfort: FORTRAN Interfaces for GPU kernels
! ==============================================================================
! Copyright (c) 2020-2026 Advanced Micro Devices, Inc. All rights reserved.
! [MITx11 License]
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
! FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
! AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
! LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
! OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
! THE SOFTWARE.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

module hipfort_hipmalloc
  use, intrinsic :: iso_c_binding
  use hipfort_hipmemcpy   ! hipMemcpy_b for the source=/dsource= hipMalloc forms
  implicit none

  interface hipMalloc
#ifdef USE_CUDA_NAMES
    function hipMalloc_b(ptr, sizeBytes) bind(c, name="cudaMalloc")
#else
    function hipMalloc_b(ptr, sizeBytes) bind(c, name="hipMalloc")
#endif
      use iso_c_binding
      implicit none
      integer(c_int) :: hipMalloc_b
      type(c_ptr) :: ptr
      integer(c_size_t), value :: sizeBytes
    end function hipMalloc_b
    module procedure hipMalloc_i4_0_opt
    module procedure hipMalloc_i4_1
    module procedure hipMalloc_i4_1_opt
    module procedure hipMalloc_i4_2
    module procedure hipMalloc_i4_2_opt
    module procedure hipMalloc_i4_3
    module procedure hipMalloc_i4_3_opt
    module procedure hipMalloc_i4_4
    module procedure hipMalloc_i4_4_opt
    module procedure hipMalloc_i4_5
    module procedure hipMalloc_i4_5_opt
    module procedure hipMalloc_i4_6
    module procedure hipMalloc_i4_6_opt
    module procedure hipMalloc_i4_7
    module procedure hipMalloc_i4_7_opt
    module procedure hipMalloc_i8_0_opt
    module procedure hipMalloc_i8_1
    module procedure hipMalloc_i8_1_opt
    module procedure hipMalloc_i8_2
    module procedure hipMalloc_i8_2_opt
    module procedure hipMalloc_i8_3
    module procedure hipMalloc_i8_3_opt
    module procedure hipMalloc_i8_4
    module procedure hipMalloc_i8_4_opt
    module procedure hipMalloc_i8_5
    module procedure hipMalloc_i8_5_opt
    module procedure hipMalloc_i8_6
    module procedure hipMalloc_i8_6_opt
    module procedure hipMalloc_i8_7
    module procedure hipMalloc_i8_7_opt
    module procedure hipMalloc_r4_0_opt
    module procedure hipMalloc_r4_1
    module procedure hipMalloc_r4_1_opt
    module procedure hipMalloc_r4_2
    module procedure hipMalloc_r4_2_opt
    module procedure hipMalloc_r4_3
    module procedure hipMalloc_r4_3_opt
    module procedure hipMalloc_r4_4
    module procedure hipMalloc_r4_4_opt
    module procedure hipMalloc_r4_5
    module procedure hipMalloc_r4_5_opt
    module procedure hipMalloc_r4_6
    module procedure hipMalloc_r4_6_opt
    module procedure hipMalloc_r4_7
    module procedure hipMalloc_r4_7_opt
    module procedure hipMalloc_r8_0_opt
    module procedure hipMalloc_r8_1
    module procedure hipMalloc_r8_1_opt
    module procedure hipMalloc_r8_2
    module procedure hipMalloc_r8_2_opt
    module procedure hipMalloc_r8_3
    module procedure hipMalloc_r8_3_opt
    module procedure hipMalloc_r8_4
    module procedure hipMalloc_r8_4_opt
    module procedure hipMalloc_r8_5
    module procedure hipMalloc_r8_5_opt
    module procedure hipMalloc_r8_6
    module procedure hipMalloc_r8_6_opt
    module procedure hipMalloc_r8_7
    module procedure hipMalloc_r8_7_opt
    module procedure hipMalloc_c4_0_opt
    module procedure hipMalloc_c4_1
    module procedure hipMalloc_c4_1_opt
    module procedure hipMalloc_c4_2
    module procedure hipMalloc_c4_2_opt
    module procedure hipMalloc_c4_3
    module procedure hipMalloc_c4_3_opt
    module procedure hipMalloc_c4_4
    module procedure hipMalloc_c4_4_opt
    module procedure hipMalloc_c4_5
    module procedure hipMalloc_c4_5_opt
    module procedure hipMalloc_c4_6
    module procedure hipMalloc_c4_6_opt
    module procedure hipMalloc_c4_7
    module procedure hipMalloc_c4_7_opt
    module procedure hipMalloc_c8_0_opt
    module procedure hipMalloc_c8_1
    module procedure hipMalloc_c8_1_opt
    module procedure hipMalloc_c8_2
    module procedure hipMalloc_c8_2_opt
    module procedure hipMalloc_c8_3
    module procedure hipMalloc_c8_3_opt
    module procedure hipMalloc_c8_4
    module procedure hipMalloc_c8_4_opt
    module procedure hipMalloc_c8_5
    module procedure hipMalloc_c8_5_opt
    module procedure hipMalloc_c8_6
    module procedure hipMalloc_c8_6_opt
    module procedure hipMalloc_c8_7
    module procedure hipMalloc_c8_7_opt
    module procedure hipMalloc_l_0_opt
    module procedure hipMalloc_l_1
    module procedure hipMalloc_l_1_opt
    module procedure hipMalloc_l_2
    module procedure hipMalloc_l_2_opt
    module procedure hipMalloc_l_3
    module procedure hipMalloc_l_3_opt
    module procedure hipMalloc_l_4
    module procedure hipMalloc_l_4_opt
    module procedure hipMalloc_l_5
    module procedure hipMalloc_l_5_opt
    module procedure hipMalloc_l_6
    module procedure hipMalloc_l_6_opt
    module procedure hipMalloc_l_7
    module procedure hipMalloc_l_7_opt
  end interface hipMalloc

  interface hipFree
#ifdef USE_CUDA_NAMES
    function hipFree_b(ptr) bind(c, name="cudaFree")
#else
    function hipFree_b(ptr) bind(c, name="hipFree")
#endif
      use iso_c_binding
      implicit none
      integer(c_int) :: hipFree_b
      type(c_ptr), value :: ptr
    end function hipFree_b
    module procedure hipFree_i4_0
    module procedure hipFree_i4_1
    module procedure hipFree_i4_2
    module procedure hipFree_i4_3
    module procedure hipFree_i4_4
    module procedure hipFree_i4_5
    module procedure hipFree_i4_6
    module procedure hipFree_i4_7
    module procedure hipFree_i8_0
    module procedure hipFree_i8_1
    module procedure hipFree_i8_2
    module procedure hipFree_i8_3
    module procedure hipFree_i8_4
    module procedure hipFree_i8_5
    module procedure hipFree_i8_6
    module procedure hipFree_i8_7
    module procedure hipFree_r4_0
    module procedure hipFree_r4_1
    module procedure hipFree_r4_2
    module procedure hipFree_r4_3
    module procedure hipFree_r4_4
    module procedure hipFree_r4_5
    module procedure hipFree_r4_6
    module procedure hipFree_r4_7
    module procedure hipFree_r8_0
    module procedure hipFree_r8_1
    module procedure hipFree_r8_2
    module procedure hipFree_r8_3
    module procedure hipFree_r8_4
    module procedure hipFree_r8_5
    module procedure hipFree_r8_6
    module procedure hipFree_r8_7
    module procedure hipFree_c4_0
    module procedure hipFree_c4_1
    module procedure hipFree_c4_2
    module procedure hipFree_c4_3
    module procedure hipFree_c4_4
    module procedure hipFree_c4_5
    module procedure hipFree_c4_6
    module procedure hipFree_c4_7
    module procedure hipFree_c8_0
    module procedure hipFree_c8_1
    module procedure hipFree_c8_2
    module procedure hipFree_c8_3
    module procedure hipFree_c8_4
    module procedure hipFree_c8_5
    module procedure hipFree_c8_6
    module procedure hipFree_c8_7
    module procedure hipFree_l_0
    module procedure hipFree_l_1
    module procedure hipFree_l_2
    module procedure hipFree_l_3
    module procedure hipFree_l_4
    module procedure hipFree_l_5
    module procedure hipFree_l_6
    module procedure hipFree_l_7
  end interface hipFree

  interface hipHostFree
    function hipHostFree_b(ptr) bind(c, name="hipHostFree")
      use iso_c_binding
      implicit none
      integer(c_int) :: hipHostFree_b
      type(c_ptr), value :: ptr
    end function hipHostFree_b
    module procedure hipHostFree_i4_0
    module procedure hipHostFree_i4_1
    module procedure hipHostFree_i4_2
    module procedure hipHostFree_i4_3
    module procedure hipHostFree_i4_4
    module procedure hipHostFree_i4_5
    module procedure hipHostFree_i4_6
    module procedure hipHostFree_i4_7
    module procedure hipHostFree_i8_0
    module procedure hipHostFree_i8_1
    module procedure hipHostFree_i8_2
    module procedure hipHostFree_i8_3
    module procedure hipHostFree_i8_4
    module procedure hipHostFree_i8_5
    module procedure hipHostFree_i8_6
    module procedure hipHostFree_i8_7
    module procedure hipHostFree_r4_0
    module procedure hipHostFree_r4_1
    module procedure hipHostFree_r4_2
    module procedure hipHostFree_r4_3
    module procedure hipHostFree_r4_4
    module procedure hipHostFree_r4_5
    module procedure hipHostFree_r4_6
    module procedure hipHostFree_r4_7
    module procedure hipHostFree_r8_0
    module procedure hipHostFree_r8_1
    module procedure hipHostFree_r8_2
    module procedure hipHostFree_r8_3
    module procedure hipHostFree_r8_4
    module procedure hipHostFree_r8_5
    module procedure hipHostFree_r8_6
    module procedure hipHostFree_r8_7
    module procedure hipHostFree_c4_0
    module procedure hipHostFree_c4_1
    module procedure hipHostFree_c4_2
    module procedure hipHostFree_c4_3
    module procedure hipHostFree_c4_4
    module procedure hipHostFree_c4_5
    module procedure hipHostFree_c4_6
    module procedure hipHostFree_c4_7
    module procedure hipHostFree_c8_0
    module procedure hipHostFree_c8_1
    module procedure hipHostFree_c8_2
    module procedure hipHostFree_c8_3
    module procedure hipHostFree_c8_4
    module procedure hipHostFree_c8_5
    module procedure hipHostFree_c8_6
    module procedure hipHostFree_c8_7
    module procedure hipHostFree_l_0
    module procedure hipHostFree_l_1
    module procedure hipHostFree_l_2
    module procedure hipHostFree_l_3
    module procedure hipHostFree_l_4
    module procedure hipHostFree_l_5
    module procedure hipHostFree_l_6
    module procedure hipHostFree_l_7
  end interface hipHostFree

contains

  function hipMalloc_i4_1(ptr, length1) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMalloc_i4_1

  function hipMalloc_i4_2(ptr, length1, length2) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMalloc_i4_2

  function hipMalloc_i4_3(ptr, length1, length2, length3) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMalloc_i4_3

  function hipMalloc_i4_4(ptr, length1, length2, length3, length4) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMalloc_i4_4

  function hipMalloc_i4_5(ptr, length1, length2, length3, length4, length5) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMalloc_i4_5

  function hipMalloc_i4_6(ptr, length1, length2, length3, length4, length5, length6) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMalloc_i4_6

  function hipMalloc_i4_7(ptr, length1, length2, length3, length4, length5, length6, length7) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMalloc_i4_7

  function hipMalloc_i8_1(ptr, length1) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMalloc_i8_1

  function hipMalloc_i8_2(ptr, length1, length2) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMalloc_i8_2

  function hipMalloc_i8_3(ptr, length1, length2, length3) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMalloc_i8_3

  function hipMalloc_i8_4(ptr, length1, length2, length3, length4) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMalloc_i8_4

  function hipMalloc_i8_5(ptr, length1, length2, length3, length4, length5) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMalloc_i8_5

  function hipMalloc_i8_6(ptr, length1, length2, length3, length4, length5, length6) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMalloc_i8_6

  function hipMalloc_i8_7(ptr, length1, length2, length3, length4, length5, length6, length7) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMalloc_i8_7

  function hipMalloc_r4_1(ptr, length1) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMalloc_r4_1

  function hipMalloc_r4_2(ptr, length1, length2) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMalloc_r4_2

  function hipMalloc_r4_3(ptr, length1, length2, length3) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMalloc_r4_3

  function hipMalloc_r4_4(ptr, length1, length2, length3, length4) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMalloc_r4_4

  function hipMalloc_r4_5(ptr, length1, length2, length3, length4, length5) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMalloc_r4_5

  function hipMalloc_r4_6(ptr, length1, length2, length3, length4, length5, length6) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMalloc_r4_6

  function hipMalloc_r4_7(ptr, length1, length2, length3, length4, length5, length6, length7) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 4_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMalloc_r4_7

  function hipMalloc_r8_1(ptr, length1) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMalloc_r8_1

  function hipMalloc_r8_2(ptr, length1, length2) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMalloc_r8_2

  function hipMalloc_r8_3(ptr, length1, length2, length3) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMalloc_r8_3

  function hipMalloc_r8_4(ptr, length1, length2, length3, length4) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMalloc_r8_4

  function hipMalloc_r8_5(ptr, length1, length2, length3, length4, length5) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMalloc_r8_5

  function hipMalloc_r8_6(ptr, length1, length2, length3, length4, length5, length6) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMalloc_r8_6

  function hipMalloc_r8_7(ptr, length1, length2, length3, length4, length5, length6, length7) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMalloc_r8_7

  function hipMalloc_c4_1(ptr, length1) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMalloc_c4_1

  function hipMalloc_c4_2(ptr, length1, length2) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMalloc_c4_2

  function hipMalloc_c4_3(ptr, length1, length2, length3) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMalloc_c4_3

  function hipMalloc_c4_4(ptr, length1, length2, length3, length4) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMalloc_c4_4

  function hipMalloc_c4_5(ptr, length1, length2, length3, length4, length5) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMalloc_c4_5

  function hipMalloc_c4_6(ptr, length1, length2, length3, length4, length5, length6) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMalloc_c4_6

  function hipMalloc_c4_7(ptr, length1, length2, length3, length4, length5, length6, length7) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 8_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMalloc_c4_7

  function hipMalloc_c8_1(ptr, length1) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMalloc_c8_1

  function hipMalloc_c8_2(ptr, length1, length2) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMalloc_c8_2

  function hipMalloc_c8_3(ptr, length1, length2, length3) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMalloc_c8_3

  function hipMalloc_c8_4(ptr, length1, length2, length3, length4) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMalloc_c8_4

  function hipMalloc_c8_5(ptr, length1, length2, length3, length4, length5) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMalloc_c8_5

  function hipMalloc_c8_6(ptr, length1, length2, length3, length4, length5, length6) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMalloc_c8_6

  function hipMalloc_c8_7(ptr, length1, length2, length3, length4, length5, length6, length7) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 16_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMalloc_c8_7

  function hipMalloc_l_1(ptr, length1) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1])
  end function hipMalloc_l_1

  function hipMalloc_l_2(ptr, length1, length2) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2])
  end function hipMalloc_l_2

  function hipMalloc_l_3(ptr, length1, length2, length3) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3])
  end function hipMalloc_l_3

  function hipMalloc_l_4(ptr, length1, length2, length3, length4) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4])
  end function hipMalloc_l_4

  function hipMalloc_l_5(ptr, length1, length2, length3, length4, length5) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5])
  end function hipMalloc_l_5

  function hipMalloc_l_6(ptr, length1, length2, length3, length4, length5, length6) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6])
  end function hipMalloc_l_6

  function hipMalloc_l_7(ptr, length1, length2, length3, length4, length5, length6, length7) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer(c_int), intent(in) :: length1, length2, length3, length4, length5, length6, length7
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    nbytes = 1_c_size_t
    nbytes = nbytes * int(length1, c_size_t)
    nbytes = nbytes * int(length2, c_size_t)
    nbytes = nbytes * int(length3, c_size_t)
    nbytes = nbytes * int(length4, c_size_t)
    nbytes = nbytes * int(length5, c_size_t)
    nbytes = nbytes * int(length6, c_size_t)
    nbytes = nbytes * int(length7, c_size_t)
    res = hipMalloc_b(cptr, nbytes)
    call c_f_pointer(cptr, ptr, shape=[length1,length2,length3,length4,length5,length6,length7])
  end function hipMalloc_l_7

  function hipMalloc_i4_0_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    integer(c_int), pointer, intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    integer(c_int), target, intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr)
    else if (present(source)) then
      nbytes = 4_c_size_t * int(1, c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr)
        res = hipMemcpy_b(cptr, c_loc(source), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 4_c_size_t * int(1, c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr)
        res = hipMemcpy_b(cptr, c_loc(dsource), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(1, c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr)
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_i4_0_opt

  function hipMalloc_i4_1_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    integer(c_int), pointer, dimension(:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    integer(c_int), target, dimension(:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 4_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 4_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_i4_1_opt

  function hipMalloc_i4_2_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    integer(c_int), pointer, dimension(:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    integer(c_int), target, dimension(:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 4_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 4_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_i4_2_opt

  function hipMalloc_i4_3_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    integer(c_int), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    integer(c_int), target, dimension(:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 4_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 4_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_i4_3_opt

  function hipMalloc_i4_4_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    integer(c_int), target, dimension(:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 4_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 4_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_i4_4_opt

  function hipMalloc_i4_5_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    integer(c_int), target, dimension(:,:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 4_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 4_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_i4_5_opt

  function hipMalloc_i4_6_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    integer(c_int), target, dimension(:,:,:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 4_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 4_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_i4_6_opt

  function hipMalloc_i4_7_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    integer(c_int), target, dimension(:,:,:,:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 4_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 4_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_i4_7_opt

  function hipMalloc_i8_0_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    integer(c_int64_t), pointer, intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    integer(c_int64_t), target, intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(1, c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr)
        res = hipMemcpy_b(cptr, c_loc(source), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(1, c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr)
        res = hipMemcpy_b(cptr, c_loc(dsource), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(1, c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr)
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_i8_0_opt

  function hipMalloc_i8_1_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    integer(c_int64_t), pointer, dimension(:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    integer(c_int64_t), target, dimension(:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_i8_1_opt

  function hipMalloc_i8_2_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    integer(c_int64_t), pointer, dimension(:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    integer(c_int64_t), target, dimension(:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_i8_2_opt

  function hipMalloc_i8_3_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    integer(c_int64_t), target, dimension(:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_i8_3_opt

  function hipMalloc_i8_4_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    integer(c_int64_t), target, dimension(:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_i8_4_opt

  function hipMalloc_i8_5_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    integer(c_int64_t), target, dimension(:,:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_i8_5_opt

  function hipMalloc_i8_6_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    integer(c_int64_t), target, dimension(:,:,:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_i8_6_opt

  function hipMalloc_i8_7_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    integer(c_int64_t), target, dimension(:,:,:,:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_i8_7_opt

  function hipMalloc_r4_0_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    real(c_float), pointer, intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    real(c_float), target, intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr)
    else if (present(source)) then
      nbytes = 4_c_size_t * int(1, c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr)
        res = hipMemcpy_b(cptr, c_loc(source), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 4_c_size_t * int(1, c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr)
        res = hipMemcpy_b(cptr, c_loc(dsource), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(1, c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr)
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_r4_0_opt

  function hipMalloc_r4_1_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    real(c_float), pointer, dimension(:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    real(c_float), target, dimension(:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 4_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 4_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_r4_1_opt

  function hipMalloc_r4_2_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    real(c_float), pointer, dimension(:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    real(c_float), target, dimension(:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 4_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 4_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_r4_2_opt

  function hipMalloc_r4_3_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    real(c_float), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    real(c_float), target, dimension(:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 4_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 4_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_r4_3_opt

  function hipMalloc_r4_4_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    real(c_float), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    real(c_float), target, dimension(:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 4_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 4_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_r4_4_opt

  function hipMalloc_r4_5_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    real(c_float), target, dimension(:,:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 4_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 4_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_r4_5_opt

  function hipMalloc_r4_6_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    real(c_float), target, dimension(:,:,:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 4_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 4_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_r4_6_opt

  function hipMalloc_r4_7_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    real(c_float), target, dimension(:,:,:,:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 4_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 4_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 4_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_r4_7_opt

  function hipMalloc_r8_0_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    real(c_double), pointer, intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    real(c_double), target, intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(1, c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr)
        res = hipMemcpy_b(cptr, c_loc(source), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(1, c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr)
        res = hipMemcpy_b(cptr, c_loc(dsource), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(1, c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr)
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_r8_0_opt

  function hipMalloc_r8_1_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    real(c_double), pointer, dimension(:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    real(c_double), target, dimension(:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_r8_1_opt

  function hipMalloc_r8_2_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    real(c_double), pointer, dimension(:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    real(c_double), target, dimension(:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_r8_2_opt

  function hipMalloc_r8_3_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    real(c_double), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    real(c_double), target, dimension(:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_r8_3_opt

  function hipMalloc_r8_4_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    real(c_double), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    real(c_double), target, dimension(:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_r8_4_opt

  function hipMalloc_r8_5_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    real(c_double), target, dimension(:,:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_r8_5_opt

  function hipMalloc_r8_6_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    real(c_double), target, dimension(:,:,:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_r8_6_opt

  function hipMalloc_r8_7_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    real(c_double), target, dimension(:,:,:,:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_r8_7_opt

  function hipMalloc_c4_0_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    complex(c_float_complex), pointer, intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    complex(c_float_complex), target, intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(1, c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr)
        res = hipMemcpy_b(cptr, c_loc(source), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(1, c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr)
        res = hipMemcpy_b(cptr, c_loc(dsource), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(1, c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr)
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_c4_0_opt

  function hipMalloc_c4_1_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    complex(c_float_complex), pointer, dimension(:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    complex(c_float_complex), target, dimension(:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_c4_1_opt

  function hipMalloc_c4_2_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    complex(c_float_complex), pointer, dimension(:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    complex(c_float_complex), target, dimension(:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_c4_2_opt

  function hipMalloc_c4_3_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    complex(c_float_complex), target, dimension(:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_c4_3_opt

  function hipMalloc_c4_4_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    complex(c_float_complex), target, dimension(:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_c4_4_opt

  function hipMalloc_c4_5_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    complex(c_float_complex), target, dimension(:,:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_c4_5_opt

  function hipMalloc_c4_6_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    complex(c_float_complex), target, dimension(:,:,:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_c4_6_opt

  function hipMalloc_c4_7_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    complex(c_float_complex), target, dimension(:,:,:,:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 8_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 8_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 8_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_c4_7_opt

  function hipMalloc_c8_0_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    complex(c_double_complex), pointer, intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    complex(c_double_complex), target, intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 16_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr)
    else if (present(source)) then
      nbytes = 16_c_size_t * int(1, c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr)
        res = hipMemcpy_b(cptr, c_loc(source), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 16_c_size_t * int(1, c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr)
        res = hipMemcpy_b(cptr, c_loc(dsource), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 16_c_size_t * int(1, c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr)
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_c8_0_opt

  function hipMalloc_c8_1_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    complex(c_double_complex), pointer, dimension(:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    complex(c_double_complex), target, dimension(:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 16_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 16_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 16_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 16_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_c8_1_opt

  function hipMalloc_c8_2_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    complex(c_double_complex), pointer, dimension(:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    complex(c_double_complex), target, dimension(:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 16_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 16_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 16_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 16_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_c8_2_opt

  function hipMalloc_c8_3_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    complex(c_double_complex), target, dimension(:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 16_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 16_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 16_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 16_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_c8_3_opt

  function hipMalloc_c8_4_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    complex(c_double_complex), target, dimension(:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 16_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 16_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 16_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 16_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_c8_4_opt

  function hipMalloc_c8_5_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    complex(c_double_complex), target, dimension(:,:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 16_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 16_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 16_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 16_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_c8_5_opt

  function hipMalloc_c8_6_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    complex(c_double_complex), target, dimension(:,:,:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 16_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 16_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 16_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 16_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_c8_6_opt

  function hipMalloc_c8_7_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    complex(c_double_complex), target, dimension(:,:,:,:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 16_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 16_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 16_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 16_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_c8_7_opt

  function hipMalloc_l_0_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    logical(c_bool), pointer, intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    logical(c_bool), target, intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 1_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr)
    else if (present(source)) then
      nbytes = 1_c_size_t * int(1, c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr)
        res = hipMemcpy_b(cptr, c_loc(source), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 1_c_size_t * int(1, c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr)
        res = hipMemcpy_b(cptr, c_loc(dsource), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 1_c_size_t * int(1, c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr)
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_l_0_opt

  function hipMalloc_l_1_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    logical(c_bool), pointer, dimension(:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    logical(c_bool), target, dimension(:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 1_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 1_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 1_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 1_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_l_1_opt

  function hipMalloc_l_2_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    logical(c_bool), pointer, dimension(:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    logical(c_bool), target, dimension(:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 1_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 1_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 1_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 1_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_l_2_opt

  function hipMalloc_l_3_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    logical(c_bool), pointer, dimension(:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    logical(c_bool), target, dimension(:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 1_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 1_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 1_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 1_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_l_3_opt

  function hipMalloc_l_4_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    logical(c_bool), target, dimension(:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 1_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 1_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 1_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 1_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_l_4_opt

  function hipMalloc_l_5_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    logical(c_bool), target, dimension(:,:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 1_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 1_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 1_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 1_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_l_5_opt

  function hipMalloc_l_6_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    logical(c_bool), target, dimension(:,:,:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 1_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 1_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 1_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 1_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_l_6_opt

  function hipMalloc_l_7_opt(ptr, dims, source, mold, dsource) result(res)
    use iso_c_binding
    use hipfort_enums, only: hipMemcpyHostToDevice, hipMemcpyDeviceToDevice
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    integer, dimension(:), intent(in), optional :: dims
    logical(c_bool), target, dimension(:,:,:,:,:,:,:), intent(in), optional :: source, mold, dsource
    integer(c_int) :: res
    integer(c_size_t) :: nbytes
    type(c_ptr) :: cptr
    if (present(dims)) then
      res = hipMalloc_b(cptr, 1_c_size_t * int(product(dims), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=dims)
    else if (present(source)) then
      nbytes = 1_c_size_t * int(size(source), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(source))
        res = hipMemcpy_b(cptr, c_loc(source(1,1,1,1,1,1,1)), nbytes, hipMemcpyHostToDevice)
      end if
    else if (present(dsource)) then
      nbytes = 1_c_size_t * int(size(dsource), c_size_t)
      res = hipMalloc_b(cptr, nbytes)
      if (res == 0) then
        call c_f_pointer(cptr, ptr, shape=shape(dsource))
        res = hipMemcpy_b(cptr, c_loc(dsource(1,1,1,1,1,1,1)), nbytes, hipMemcpyDeviceToDevice)
      end if
    else if (present(mold)) then
      res = hipMalloc_b(cptr, 1_c_size_t * int(size(mold), c_size_t))
      if (res == 0) call c_f_pointer(cptr, ptr, shape=shape(mold))
    else
      res = hipMalloc_b(cptr, 0_c_size_t)
    end if
  end function hipMalloc_l_7_opt

  function hipFree_i4_0(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr))
      ptr => null()
    end if
  end function hipFree_i4_0

  function hipFree_i4_1(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1)))
      ptr => null()
    end if
  end function hipFree_i4_1

  function hipFree_i4_2(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1)))
      ptr => null()
    end if
  end function hipFree_i4_2

  function hipFree_i4_3(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1,1)))
      ptr => null()
    end if
  end function hipFree_i4_3

  function hipFree_i4_4(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_i4_4

  function hipFree_i4_5(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_i4_5

  function hipFree_i4_6(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_i4_6

  function hipFree_i4_7(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_i4_7

  function hipFree_i8_0(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr))
      ptr => null()
    end if
  end function hipFree_i8_0

  function hipFree_i8_1(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1)))
      ptr => null()
    end if
  end function hipFree_i8_1

  function hipFree_i8_2(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1)))
      ptr => null()
    end if
  end function hipFree_i8_2

  function hipFree_i8_3(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1,1)))
      ptr => null()
    end if
  end function hipFree_i8_3

  function hipFree_i8_4(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_i8_4

  function hipFree_i8_5(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_i8_5

  function hipFree_i8_6(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_i8_6

  function hipFree_i8_7(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_i8_7

  function hipFree_r4_0(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr))
      ptr => null()
    end if
  end function hipFree_r4_0

  function hipFree_r4_1(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1)))
      ptr => null()
    end if
  end function hipFree_r4_1

  function hipFree_r4_2(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1)))
      ptr => null()
    end if
  end function hipFree_r4_2

  function hipFree_r4_3(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1,1)))
      ptr => null()
    end if
  end function hipFree_r4_3

  function hipFree_r4_4(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_r4_4

  function hipFree_r4_5(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_r4_5

  function hipFree_r4_6(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_r4_6

  function hipFree_r4_7(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_r4_7

  function hipFree_r8_0(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr))
      ptr => null()
    end if
  end function hipFree_r8_0

  function hipFree_r8_1(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1)))
      ptr => null()
    end if
  end function hipFree_r8_1

  function hipFree_r8_2(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1)))
      ptr => null()
    end if
  end function hipFree_r8_2

  function hipFree_r8_3(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1,1)))
      ptr => null()
    end if
  end function hipFree_r8_3

  function hipFree_r8_4(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_r8_4

  function hipFree_r8_5(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_r8_5

  function hipFree_r8_6(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_r8_6

  function hipFree_r8_7(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_r8_7

  function hipFree_c4_0(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr))
      ptr => null()
    end if
  end function hipFree_c4_0

  function hipFree_c4_1(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1)))
      ptr => null()
    end if
  end function hipFree_c4_1

  function hipFree_c4_2(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1)))
      ptr => null()
    end if
  end function hipFree_c4_2

  function hipFree_c4_3(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1,1)))
      ptr => null()
    end if
  end function hipFree_c4_3

  function hipFree_c4_4(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_c4_4

  function hipFree_c4_5(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_c4_5

  function hipFree_c4_6(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_c4_6

  function hipFree_c4_7(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_c4_7

  function hipFree_c8_0(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr))
      ptr => null()
    end if
  end function hipFree_c8_0

  function hipFree_c8_1(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1)))
      ptr => null()
    end if
  end function hipFree_c8_1

  function hipFree_c8_2(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1)))
      ptr => null()
    end if
  end function hipFree_c8_2

  function hipFree_c8_3(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1,1)))
      ptr => null()
    end if
  end function hipFree_c8_3

  function hipFree_c8_4(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_c8_4

  function hipFree_c8_5(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_c8_5

  function hipFree_c8_6(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_c8_6

  function hipFree_c8_7(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_c8_7

  function hipFree_l_0(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr))
      ptr => null()
    end if
  end function hipFree_l_0

  function hipFree_l_1(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1)))
      ptr => null()
    end if
  end function hipFree_l_1

  function hipFree_l_2(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1)))
      ptr => null()
    end if
  end function hipFree_l_2

  function hipFree_l_3(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1,1)))
      ptr => null()
    end if
  end function hipFree_l_3

  function hipFree_l_4(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_l_4

  function hipFree_l_5(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_l_5

  function hipFree_l_6(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_l_6

  function hipFree_l_7(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipFree_b(c_loc(ptr(1,1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipFree_l_7

  function hipHostFree_i4_0(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr))
      ptr => null()
    end if
  end function hipHostFree_i4_0

  function hipHostFree_i4_1(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1)))
      ptr => null()
    end if
  end function hipHostFree_i4_1

  function hipHostFree_i4_2(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1)))
      ptr => null()
    end if
  end function hipHostFree_i4_2

  function hipHostFree_i4_3(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_i4_3

  function hipHostFree_i4_4(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_i4_4

  function hipHostFree_i4_5(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_i4_5

  function hipHostFree_i4_6(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_i4_6

  function hipHostFree_i4_7(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_i4_7

  function hipHostFree_i8_0(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr))
      ptr => null()
    end if
  end function hipHostFree_i8_0

  function hipHostFree_i8_1(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1)))
      ptr => null()
    end if
  end function hipHostFree_i8_1

  function hipHostFree_i8_2(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1)))
      ptr => null()
    end if
  end function hipHostFree_i8_2

  function hipHostFree_i8_3(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_i8_3

  function hipHostFree_i8_4(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_i8_4

  function hipHostFree_i8_5(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_i8_5

  function hipHostFree_i8_6(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_i8_6

  function hipHostFree_i8_7(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    integer(c_int64_t), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_i8_7

  function hipHostFree_r4_0(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr))
      ptr => null()
    end if
  end function hipHostFree_r4_0

  function hipHostFree_r4_1(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1)))
      ptr => null()
    end if
  end function hipHostFree_r4_1

  function hipHostFree_r4_2(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1)))
      ptr => null()
    end if
  end function hipHostFree_r4_2

  function hipHostFree_r4_3(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_r4_3

  function hipHostFree_r4_4(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_r4_4

  function hipHostFree_r4_5(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_r4_5

  function hipHostFree_r4_6(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_r4_6

  function hipHostFree_r4_7(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_float), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_r4_7

  function hipHostFree_r8_0(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr))
      ptr => null()
    end if
  end function hipHostFree_r8_0

  function hipHostFree_r8_1(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1)))
      ptr => null()
    end if
  end function hipHostFree_r8_1

  function hipHostFree_r8_2(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1)))
      ptr => null()
    end if
  end function hipHostFree_r8_2

  function hipHostFree_r8_3(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_r8_3

  function hipHostFree_r8_4(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_r8_4

  function hipHostFree_r8_5(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_r8_5

  function hipHostFree_r8_6(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_r8_6

  function hipHostFree_r8_7(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    real(c_double), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_r8_7

  function hipHostFree_c4_0(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr))
      ptr => null()
    end if
  end function hipHostFree_c4_0

  function hipHostFree_c4_1(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1)))
      ptr => null()
    end if
  end function hipHostFree_c4_1

  function hipHostFree_c4_2(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1)))
      ptr => null()
    end if
  end function hipHostFree_c4_2

  function hipHostFree_c4_3(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_c4_3

  function hipHostFree_c4_4(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_c4_4

  function hipHostFree_c4_5(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_c4_5

  function hipHostFree_c4_6(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_c4_6

  function hipHostFree_c4_7(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_float_complex), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_c4_7

  function hipHostFree_c8_0(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr))
      ptr => null()
    end if
  end function hipHostFree_c8_0

  function hipHostFree_c8_1(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1)))
      ptr => null()
    end if
  end function hipHostFree_c8_1

  function hipHostFree_c8_2(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1)))
      ptr => null()
    end if
  end function hipHostFree_c8_2

  function hipHostFree_c8_3(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_c8_3

  function hipHostFree_c8_4(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_c8_4

  function hipHostFree_c8_5(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_c8_5

  function hipHostFree_c8_6(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_c8_6

  function hipHostFree_c8_7(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    complex(c_double_complex), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_c8_7

  function hipHostFree_l_0(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr))
      ptr => null()
    end if
  end function hipHostFree_l_0

  function hipHostFree_l_1(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1)))
      ptr => null()
    end if
  end function hipHostFree_l_1

  function hipHostFree_l_2(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1)))
      ptr => null()
    end if
  end function hipHostFree_l_2

  function hipHostFree_l_3(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_l_3

  function hipHostFree_l_4(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_l_4

  function hipHostFree_l_5(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_l_5

  function hipHostFree_l_6(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_l_6

  function hipHostFree_l_7(ptr, only_if_allocated) result(res)
    use iso_c_binding
    implicit none
    logical(c_bool), pointer, dimension(:,:,:,:,:,:,:), intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    integer(c_int) :: res
    logical :: guard
    guard = .false.
    if (present(only_if_allocated)) guard = only_if_allocated
    res = 0
    if (.not. guard .or. associated(ptr)) then
      res = hipHostFree_b(c_loc(ptr(1,1,1,1,1,1,1)))
      ptr => null()
    end if
  end function hipHostFree_l_7

end module hipfort_hipmalloc
