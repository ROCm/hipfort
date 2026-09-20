!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! ==============================================================================
! hipfort: FORTRAN Interfaces for GPU kernels
! ==============================================================================
! Copyright (c) 2026 Advanced Micro Devices, Inc. All rights reserved.
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

! Typed-handle wrappers, included into the module contains section.

#ifdef USE_ASSUMED_RANK_INTERFACES
    function fftw_plan_dft_assumed_rank(rank,n,in,out,sign,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_dft_assumed_rank
      integer(c_int) :: rank
      integer(c_int),target,contiguous,dimension(..) :: n
      type(c_ptr) :: in
      type(c_ptr) :: out
      integer(c_int) :: sign
      integer(c_int) :: flags
      !
      fftw_plan_dft_assumed_rank = fftw_plan_dft_(rank,c_loc(n),in,out,sign,flags)
    end function

#else
    function fftw_plan_dft_rank_0(rank,n,in,out,sign,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_dft_rank_0
      integer(c_int) :: rank
      integer(c_int),target :: n
      type(c_ptr) :: in
      type(c_ptr) :: out
      integer(c_int) :: sign
      integer(c_int) :: flags
      !
      fftw_plan_dft_rank_0 = fftw_plan_dft_(rank,c_loc(n),in,out,sign,flags)
    end function

    function fftw_plan_dft_rank_1(rank,n,in,out,sign,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_dft_rank_1
      integer(c_int) :: rank
      integer(c_int),target,dimension(:) :: n
      type(c_ptr) :: in
      type(c_ptr) :: out
      integer(c_int) :: sign
      integer(c_int) :: flags
      !
      fftw_plan_dft_rank_1 = fftw_plan_dft_(rank,c_loc(n),in,out,sign,flags)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function fftwf_plan_dft_assumed_rank(rank,n,in,out,sign,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_dft_assumed_rank
      integer(c_int) :: rank
      integer(c_int),target,contiguous,dimension(..) :: n
      type(c_ptr) :: in
      type(c_ptr) :: out
      integer(c_int) :: sign
      integer(c_int) :: flags
      !
      fftwf_plan_dft_assumed_rank = fftwf_plan_dft_(rank,c_loc(n),in,out,sign,flags)
    end function

#else
    function fftwf_plan_dft_rank_0(rank,n,in,out,sign,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_dft_rank_0
      integer(c_int) :: rank
      integer(c_int),target :: n
      type(c_ptr) :: in
      type(c_ptr) :: out
      integer(c_int) :: sign
      integer(c_int) :: flags
      !
      fftwf_plan_dft_rank_0 = fftwf_plan_dft_(rank,c_loc(n),in,out,sign,flags)
    end function

    function fftwf_plan_dft_rank_1(rank,n,in,out,sign,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_dft_rank_1
      integer(c_int) :: rank
      integer(c_int),target,dimension(:) :: n
      type(c_ptr) :: in
      type(c_ptr) :: out
      integer(c_int) :: sign
      integer(c_int) :: flags
      !
      fftwf_plan_dft_rank_1 = fftwf_plan_dft_(rank,c_loc(n),in,out,sign,flags)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function fftw_plan_dft_r2c_1d_assumed_rank(n,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_dft_r2c_1d_assumed_rank
      integer(c_int) :: n
      real(c_double),target,contiguous,dimension(..) :: in
      type(c_ptr) :: out
      integer(c_int) :: flags
      !
      fftw_plan_dft_r2c_1d_assumed_rank = fftw_plan_dft_r2c_1d_(n,c_loc(in),out,flags)
    end function

#else
    function fftw_plan_dft_r2c_1d_rank_0(n,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_dft_r2c_1d_rank_0
      integer(c_int) :: n
      real(c_double),target :: in
      type(c_ptr) :: out
      integer(c_int) :: flags
      !
      fftw_plan_dft_r2c_1d_rank_0 = fftw_plan_dft_r2c_1d_(n,c_loc(in),out,flags)
    end function

    function fftw_plan_dft_r2c_1d_rank_1(n,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_dft_r2c_1d_rank_1
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: in
      type(c_ptr) :: out
      integer(c_int) :: flags
      !
      fftw_plan_dft_r2c_1d_rank_1 = fftw_plan_dft_r2c_1d_(n,c_loc(in),out,flags)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function fftwf_plan_dft_r2c_1d_assumed_rank(n,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_dft_r2c_1d_assumed_rank
      integer(c_int) :: n
      real(c_float),target,contiguous,dimension(..) :: in
      type(c_ptr) :: out
      integer(c_int) :: flags
      !
      fftwf_plan_dft_r2c_1d_assumed_rank = fftwf_plan_dft_r2c_1d_(n,c_loc(in),out,flags)
    end function

#else
    function fftwf_plan_dft_r2c_1d_rank_0(n,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_dft_r2c_1d_rank_0
      integer(c_int) :: n
      real(c_float),target :: in
      type(c_ptr) :: out
      integer(c_int) :: flags
      !
      fftwf_plan_dft_r2c_1d_rank_0 = fftwf_plan_dft_r2c_1d_(n,c_loc(in),out,flags)
    end function

    function fftwf_plan_dft_r2c_1d_rank_1(n,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_dft_r2c_1d_rank_1
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: in
      type(c_ptr) :: out
      integer(c_int) :: flags
      !
      fftwf_plan_dft_r2c_1d_rank_1 = fftwf_plan_dft_r2c_1d_(n,c_loc(in),out,flags)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function fftw_plan_dft_r2c_2d_assumed_rank(n0,n1,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_dft_r2c_2d_assumed_rank
      integer(c_int) :: n0
      integer(c_int) :: n1
      real(c_double),target,contiguous,dimension(..) :: in
      type(c_ptr) :: out
      integer(c_int) :: flags
      !
      fftw_plan_dft_r2c_2d_assumed_rank = fftw_plan_dft_r2c_2d_(n0,n1,c_loc(in),out,flags)
    end function

#else
    function fftw_plan_dft_r2c_2d_rank_0(n0,n1,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_dft_r2c_2d_rank_0
      integer(c_int) :: n0
      integer(c_int) :: n1
      real(c_double),target :: in
      type(c_ptr) :: out
      integer(c_int) :: flags
      !
      fftw_plan_dft_r2c_2d_rank_0 = fftw_plan_dft_r2c_2d_(n0,n1,c_loc(in),out,flags)
    end function

    function fftw_plan_dft_r2c_2d_rank_1(n0,n1,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_dft_r2c_2d_rank_1
      integer(c_int) :: n0
      integer(c_int) :: n1
      real(c_double),target,dimension(:) :: in
      type(c_ptr) :: out
      integer(c_int) :: flags
      !
      fftw_plan_dft_r2c_2d_rank_1 = fftw_plan_dft_r2c_2d_(n0,n1,c_loc(in),out,flags)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function fftwf_plan_dft_r2c_2d_assumed_rank(n0,n1,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_dft_r2c_2d_assumed_rank
      integer(c_int) :: n0
      integer(c_int) :: n1
      real(c_float),target,contiguous,dimension(..) :: in
      type(c_ptr) :: out
      integer(c_int) :: flags
      !
      fftwf_plan_dft_r2c_2d_assumed_rank = fftwf_plan_dft_r2c_2d_(n0,n1,c_loc(in),out,flags)
    end function

#else
    function fftwf_plan_dft_r2c_2d_rank_0(n0,n1,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_dft_r2c_2d_rank_0
      integer(c_int) :: n0
      integer(c_int) :: n1
      real(c_float),target :: in
      type(c_ptr) :: out
      integer(c_int) :: flags
      !
      fftwf_plan_dft_r2c_2d_rank_0 = fftwf_plan_dft_r2c_2d_(n0,n1,c_loc(in),out,flags)
    end function

    function fftwf_plan_dft_r2c_2d_rank_1(n0,n1,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_dft_r2c_2d_rank_1
      integer(c_int) :: n0
      integer(c_int) :: n1
      real(c_float),target,dimension(:) :: in
      type(c_ptr) :: out
      integer(c_int) :: flags
      !
      fftwf_plan_dft_r2c_2d_rank_1 = fftwf_plan_dft_r2c_2d_(n0,n1,c_loc(in),out,flags)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function fftw_plan_dft_r2c_3d_assumed_rank(n0,n1,n2,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_dft_r2c_3d_assumed_rank
      integer(c_int) :: n0
      integer(c_int) :: n1
      integer(c_int) :: n2
      real(c_double),target,contiguous,dimension(..) :: in
      type(c_ptr) :: out
      integer(c_int) :: flags
      !
      fftw_plan_dft_r2c_3d_assumed_rank = fftw_plan_dft_r2c_3d_(n0,n1,n2,c_loc(in),out,flags)
    end function

#else
    function fftw_plan_dft_r2c_3d_rank_0(n0,n1,n2,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_dft_r2c_3d_rank_0
      integer(c_int) :: n0
      integer(c_int) :: n1
      integer(c_int) :: n2
      real(c_double),target :: in
      type(c_ptr) :: out
      integer(c_int) :: flags
      !
      fftw_plan_dft_r2c_3d_rank_0 = fftw_plan_dft_r2c_3d_(n0,n1,n2,c_loc(in),out,flags)
    end function

    function fftw_plan_dft_r2c_3d_rank_1(n0,n1,n2,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_dft_r2c_3d_rank_1
      integer(c_int) :: n0
      integer(c_int) :: n1
      integer(c_int) :: n2
      real(c_double),target,dimension(:) :: in
      type(c_ptr) :: out
      integer(c_int) :: flags
      !
      fftw_plan_dft_r2c_3d_rank_1 = fftw_plan_dft_r2c_3d_(n0,n1,n2,c_loc(in),out,flags)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function fftwf_plan_dft_r2c_3d_assumed_rank(n0,n1,n2,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_dft_r2c_3d_assumed_rank
      integer(c_int) :: n0
      integer(c_int) :: n1
      integer(c_int) :: n2
      real(c_float),target,contiguous,dimension(..) :: in
      type(c_ptr) :: out
      integer(c_int) :: flags
      !
      fftwf_plan_dft_r2c_3d_assumed_rank = fftwf_plan_dft_r2c_3d_(n0,n1,n2,c_loc(in),out,flags)
    end function

#else
    function fftwf_plan_dft_r2c_3d_rank_0(n0,n1,n2,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_dft_r2c_3d_rank_0
      integer(c_int) :: n0
      integer(c_int) :: n1
      integer(c_int) :: n2
      real(c_float),target :: in
      type(c_ptr) :: out
      integer(c_int) :: flags
      !
      fftwf_plan_dft_r2c_3d_rank_0 = fftwf_plan_dft_r2c_3d_(n0,n1,n2,c_loc(in),out,flags)
    end function

    function fftwf_plan_dft_r2c_3d_rank_1(n0,n1,n2,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_dft_r2c_3d_rank_1
      integer(c_int) :: n0
      integer(c_int) :: n1
      integer(c_int) :: n2
      real(c_float),target,dimension(:) :: in
      type(c_ptr) :: out
      integer(c_int) :: flags
      !
      fftwf_plan_dft_r2c_3d_rank_1 = fftwf_plan_dft_r2c_3d_(n0,n1,n2,c_loc(in),out,flags)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function fftw_plan_dft_r2c_assumed_rank(rank,n,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_dft_r2c_assumed_rank
      integer(c_int) :: rank
      integer(c_int),target,contiguous,dimension(..) :: n
      real(c_double),target,contiguous,dimension(..) :: in
      type(c_ptr) :: out
      integer(c_int) :: flags
      !
      fftw_plan_dft_r2c_assumed_rank = fftw_plan_dft_r2c_(rank,c_loc(n),c_loc(in),out,flags)
    end function

#else
    function fftw_plan_dft_r2c_rank_0(rank,n,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_dft_r2c_rank_0
      integer(c_int) :: rank
      integer(c_int),target :: n
      real(c_double),target :: in
      type(c_ptr) :: out
      integer(c_int) :: flags
      !
      fftw_plan_dft_r2c_rank_0 = fftw_plan_dft_r2c_(rank,c_loc(n),c_loc(in),out,flags)
    end function

    function fftw_plan_dft_r2c_rank_1(rank,n,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_dft_r2c_rank_1
      integer(c_int) :: rank
      integer(c_int),target,dimension(:) :: n
      real(c_double),target,dimension(:) :: in
      type(c_ptr) :: out
      integer(c_int) :: flags
      !
      fftw_plan_dft_r2c_rank_1 = fftw_plan_dft_r2c_(rank,c_loc(n),c_loc(in),out,flags)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function fftwf_plan_dft_r2c_assumed_rank(rank,n,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_dft_r2c_assumed_rank
      integer(c_int) :: rank
      integer(c_int),target,contiguous,dimension(..) :: n
      real(c_float),target,contiguous,dimension(..) :: in
      type(c_ptr) :: out
      integer(c_int) :: flags
      !
      fftwf_plan_dft_r2c_assumed_rank = fftwf_plan_dft_r2c_(rank,c_loc(n),c_loc(in),out,flags)
    end function

#else
    function fftwf_plan_dft_r2c_rank_0(rank,n,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_dft_r2c_rank_0
      integer(c_int) :: rank
      integer(c_int),target :: n
      real(c_float),target :: in
      type(c_ptr) :: out
      integer(c_int) :: flags
      !
      fftwf_plan_dft_r2c_rank_0 = fftwf_plan_dft_r2c_(rank,c_loc(n),c_loc(in),out,flags)
    end function

    function fftwf_plan_dft_r2c_rank_1(rank,n,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_dft_r2c_rank_1
      integer(c_int) :: rank
      integer(c_int),target,dimension(:) :: n
      real(c_float),target,dimension(:) :: in
      type(c_ptr) :: out
      integer(c_int) :: flags
      !
      fftwf_plan_dft_r2c_rank_1 = fftwf_plan_dft_r2c_(rank,c_loc(n),c_loc(in),out,flags)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function fftw_plan_dft_c2r_1d_assumed_rank(n,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_dft_c2r_1d_assumed_rank
      integer(c_int) :: n
      type(c_ptr) :: in
      real(c_double),target,contiguous,dimension(..) :: out
      integer(c_int) :: flags
      !
      fftw_plan_dft_c2r_1d_assumed_rank = fftw_plan_dft_c2r_1d_(n,in,c_loc(out),flags)
    end function

#else
    function fftw_plan_dft_c2r_1d_rank_0(n,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_dft_c2r_1d_rank_0
      integer(c_int) :: n
      type(c_ptr) :: in
      real(c_double),target :: out
      integer(c_int) :: flags
      !
      fftw_plan_dft_c2r_1d_rank_0 = fftw_plan_dft_c2r_1d_(n,in,c_loc(out),flags)
    end function

    function fftw_plan_dft_c2r_1d_rank_1(n,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_dft_c2r_1d_rank_1
      integer(c_int) :: n
      type(c_ptr) :: in
      real(c_double),target,dimension(:) :: out
      integer(c_int) :: flags
      !
      fftw_plan_dft_c2r_1d_rank_1 = fftw_plan_dft_c2r_1d_(n,in,c_loc(out),flags)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function fftwf_plan_dft_c2r_1d_assumed_rank(n,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_dft_c2r_1d_assumed_rank
      integer(c_int) :: n
      type(c_ptr) :: in
      real(c_float),target,contiguous,dimension(..) :: out
      integer(c_int) :: flags
      !
      fftwf_plan_dft_c2r_1d_assumed_rank = fftwf_plan_dft_c2r_1d_(n,in,c_loc(out),flags)
    end function

#else
    function fftwf_plan_dft_c2r_1d_rank_0(n,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_dft_c2r_1d_rank_0
      integer(c_int) :: n
      type(c_ptr) :: in
      real(c_float),target :: out
      integer(c_int) :: flags
      !
      fftwf_plan_dft_c2r_1d_rank_0 = fftwf_plan_dft_c2r_1d_(n,in,c_loc(out),flags)
    end function

    function fftwf_plan_dft_c2r_1d_rank_1(n,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_dft_c2r_1d_rank_1
      integer(c_int) :: n
      type(c_ptr) :: in
      real(c_float),target,dimension(:) :: out
      integer(c_int) :: flags
      !
      fftwf_plan_dft_c2r_1d_rank_1 = fftwf_plan_dft_c2r_1d_(n,in,c_loc(out),flags)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function fftw_plan_dft_c2r_2d_assumed_rank(n0,n1,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_dft_c2r_2d_assumed_rank
      integer(c_int) :: n0
      integer(c_int) :: n1
      type(c_ptr) :: in
      real(c_double),target,contiguous,dimension(..) :: out
      integer(c_int) :: flags
      !
      fftw_plan_dft_c2r_2d_assumed_rank = fftw_plan_dft_c2r_2d_(n0,n1,in,c_loc(out),flags)
    end function

#else
    function fftw_plan_dft_c2r_2d_rank_0(n0,n1,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_dft_c2r_2d_rank_0
      integer(c_int) :: n0
      integer(c_int) :: n1
      type(c_ptr) :: in
      real(c_double),target :: out
      integer(c_int) :: flags
      !
      fftw_plan_dft_c2r_2d_rank_0 = fftw_plan_dft_c2r_2d_(n0,n1,in,c_loc(out),flags)
    end function

    function fftw_plan_dft_c2r_2d_rank_1(n0,n1,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_dft_c2r_2d_rank_1
      integer(c_int) :: n0
      integer(c_int) :: n1
      type(c_ptr) :: in
      real(c_double),target,dimension(:) :: out
      integer(c_int) :: flags
      !
      fftw_plan_dft_c2r_2d_rank_1 = fftw_plan_dft_c2r_2d_(n0,n1,in,c_loc(out),flags)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function fftwf_plan_dft_c2r_2d_assumed_rank(n0,n1,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_dft_c2r_2d_assumed_rank
      integer(c_int) :: n0
      integer(c_int) :: n1
      type(c_ptr) :: in
      real(c_float),target,contiguous,dimension(..) :: out
      integer(c_int) :: flags
      !
      fftwf_plan_dft_c2r_2d_assumed_rank = fftwf_plan_dft_c2r_2d_(n0,n1,in,c_loc(out),flags)
    end function

#else
    function fftwf_plan_dft_c2r_2d_rank_0(n0,n1,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_dft_c2r_2d_rank_0
      integer(c_int) :: n0
      integer(c_int) :: n1
      type(c_ptr) :: in
      real(c_float),target :: out
      integer(c_int) :: flags
      !
      fftwf_plan_dft_c2r_2d_rank_0 = fftwf_plan_dft_c2r_2d_(n0,n1,in,c_loc(out),flags)
    end function

    function fftwf_plan_dft_c2r_2d_rank_1(n0,n1,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_dft_c2r_2d_rank_1
      integer(c_int) :: n0
      integer(c_int) :: n1
      type(c_ptr) :: in
      real(c_float),target,dimension(:) :: out
      integer(c_int) :: flags
      !
      fftwf_plan_dft_c2r_2d_rank_1 = fftwf_plan_dft_c2r_2d_(n0,n1,in,c_loc(out),flags)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function fftw_plan_dft_c2r_3d_assumed_rank(n0,n1,n2,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_dft_c2r_3d_assumed_rank
      integer(c_int) :: n0
      integer(c_int) :: n1
      integer(c_int) :: n2
      type(c_ptr) :: in
      real(c_double),target,contiguous,dimension(..) :: out
      integer(c_int) :: flags
      !
      fftw_plan_dft_c2r_3d_assumed_rank = fftw_plan_dft_c2r_3d_(n0,n1,n2,in,c_loc(out),flags)
    end function

#else
    function fftw_plan_dft_c2r_3d_rank_0(n0,n1,n2,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_dft_c2r_3d_rank_0
      integer(c_int) :: n0
      integer(c_int) :: n1
      integer(c_int) :: n2
      type(c_ptr) :: in
      real(c_double),target :: out
      integer(c_int) :: flags
      !
      fftw_plan_dft_c2r_3d_rank_0 = fftw_plan_dft_c2r_3d_(n0,n1,n2,in,c_loc(out),flags)
    end function

    function fftw_plan_dft_c2r_3d_rank_1(n0,n1,n2,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_dft_c2r_3d_rank_1
      integer(c_int) :: n0
      integer(c_int) :: n1
      integer(c_int) :: n2
      type(c_ptr) :: in
      real(c_double),target,dimension(:) :: out
      integer(c_int) :: flags
      !
      fftw_plan_dft_c2r_3d_rank_1 = fftw_plan_dft_c2r_3d_(n0,n1,n2,in,c_loc(out),flags)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function fftwf_plan_dft_c2r_3d_assumed_rank(n0,n1,n2,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_dft_c2r_3d_assumed_rank
      integer(c_int) :: n0
      integer(c_int) :: n1
      integer(c_int) :: n2
      type(c_ptr) :: in
      real(c_float),target,contiguous,dimension(..) :: out
      integer(c_int) :: flags
      !
      fftwf_plan_dft_c2r_3d_assumed_rank = fftwf_plan_dft_c2r_3d_(n0,n1,n2,in,c_loc(out),flags)
    end function

#else
    function fftwf_plan_dft_c2r_3d_rank_0(n0,n1,n2,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_dft_c2r_3d_rank_0
      integer(c_int) :: n0
      integer(c_int) :: n1
      integer(c_int) :: n2
      type(c_ptr) :: in
      real(c_float),target :: out
      integer(c_int) :: flags
      !
      fftwf_plan_dft_c2r_3d_rank_0 = fftwf_plan_dft_c2r_3d_(n0,n1,n2,in,c_loc(out),flags)
    end function

    function fftwf_plan_dft_c2r_3d_rank_1(n0,n1,n2,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_dft_c2r_3d_rank_1
      integer(c_int) :: n0
      integer(c_int) :: n1
      integer(c_int) :: n2
      type(c_ptr) :: in
      real(c_float),target,dimension(:) :: out
      integer(c_int) :: flags
      !
      fftwf_plan_dft_c2r_3d_rank_1 = fftwf_plan_dft_c2r_3d_(n0,n1,n2,in,c_loc(out),flags)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function fftw_plan_dft_c2r_assumed_rank(rank,n,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_dft_c2r_assumed_rank
      integer(c_int) :: rank
      integer(c_int),target,contiguous,dimension(..) :: n
      type(c_ptr) :: in
      real(c_double),target,contiguous,dimension(..) :: out
      integer(c_int) :: flags
      !
      fftw_plan_dft_c2r_assumed_rank = fftw_plan_dft_c2r_(rank,c_loc(n),in,c_loc(out),flags)
    end function

#else
    function fftw_plan_dft_c2r_rank_0(rank,n,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_dft_c2r_rank_0
      integer(c_int) :: rank
      integer(c_int),target :: n
      type(c_ptr) :: in
      real(c_double),target :: out
      integer(c_int) :: flags
      !
      fftw_plan_dft_c2r_rank_0 = fftw_plan_dft_c2r_(rank,c_loc(n),in,c_loc(out),flags)
    end function

    function fftw_plan_dft_c2r_rank_1(rank,n,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_dft_c2r_rank_1
      integer(c_int) :: rank
      integer(c_int),target,dimension(:) :: n
      type(c_ptr) :: in
      real(c_double),target,dimension(:) :: out
      integer(c_int) :: flags
      !
      fftw_plan_dft_c2r_rank_1 = fftw_plan_dft_c2r_(rank,c_loc(n),in,c_loc(out),flags)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function fftwf_plan_dft_c2r_assumed_rank(rank,n,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_dft_c2r_assumed_rank
      integer(c_int) :: rank
      integer(c_int),target,contiguous,dimension(..) :: n
      type(c_ptr) :: in
      real(c_float),target,contiguous,dimension(..) :: out
      integer(c_int) :: flags
      !
      fftwf_plan_dft_c2r_assumed_rank = fftwf_plan_dft_c2r_(rank,c_loc(n),in,c_loc(out),flags)
    end function

#else
    function fftwf_plan_dft_c2r_rank_0(rank,n,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_dft_c2r_rank_0
      integer(c_int) :: rank
      integer(c_int),target :: n
      type(c_ptr) :: in
      real(c_float),target :: out
      integer(c_int) :: flags
      !
      fftwf_plan_dft_c2r_rank_0 = fftwf_plan_dft_c2r_(rank,c_loc(n),in,c_loc(out),flags)
    end function

    function fftwf_plan_dft_c2r_rank_1(rank,n,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_dft_c2r_rank_1
      integer(c_int) :: rank
      integer(c_int),target,dimension(:) :: n
      type(c_ptr) :: in
      real(c_float),target,dimension(:) :: out
      integer(c_int) :: flags
      !
      fftwf_plan_dft_c2r_rank_1 = fftwf_plan_dft_c2r_(rank,c_loc(n),in,c_loc(out),flags)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function fftw_plan_many_dft_assumed_rank(rank,n,howmany,in,inembed,istride,idist,out,onembed, &
        ostride,odist,sign,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_many_dft_assumed_rank
      integer(c_int) :: rank
      integer(c_int),target,contiguous,dimension(..) :: n
      integer(c_int) :: howmany
      type(c_ptr) :: in
      integer(c_int),target,contiguous,dimension(..) :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      type(c_ptr) :: out
      integer(c_int),target,contiguous,dimension(..) :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(c_int) :: sign
      integer(c_int) :: flags
      !
      fftw_plan_many_dft_assumed_rank = fftw_plan_many_dft_(rank,c_loc(n),howmany,in, &
        c_loc(inembed),istride,idist,out,c_loc(onembed),ostride,odist,sign,flags)
    end function

#else
    function fftw_plan_many_dft_rank_0(rank,n,howmany,in,inembed,istride,idist,out,onembed, &
        ostride,odist,sign,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_many_dft_rank_0
      integer(c_int) :: rank
      integer(c_int),target :: n
      integer(c_int) :: howmany
      type(c_ptr) :: in
      integer(c_int),target :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      type(c_ptr) :: out
      integer(c_int),target :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(c_int) :: sign
      integer(c_int) :: flags
      !
      fftw_plan_many_dft_rank_0 = fftw_plan_many_dft_(rank,c_loc(n),howmany,in,c_loc(inembed), &
        istride,idist,out,c_loc(onembed),ostride,odist,sign,flags)
    end function

    function fftw_plan_many_dft_rank_1(rank,n,howmany,in,inembed,istride,idist,out,onembed, &
        ostride,odist,sign,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_many_dft_rank_1
      integer(c_int) :: rank
      integer(c_int),target,dimension(:) :: n
      integer(c_int) :: howmany
      type(c_ptr) :: in
      integer(c_int),target,dimension(:) :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      type(c_ptr) :: out
      integer(c_int),target,dimension(:) :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(c_int) :: sign
      integer(c_int) :: flags
      !
      fftw_plan_many_dft_rank_1 = fftw_plan_many_dft_(rank,c_loc(n),howmany,in,c_loc(inembed), &
        istride,idist,out,c_loc(onembed),ostride,odist,sign,flags)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function fftwf_plan_many_dft_assumed_rank(rank,n,howmany,in,inembed,istride,idist,out,onembed, &
        ostride,odist,sign,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_many_dft_assumed_rank
      integer(c_int) :: rank
      integer(c_int),target,contiguous,dimension(..) :: n
      integer(c_int) :: howmany
      type(c_ptr) :: in
      integer(c_int),target,contiguous,dimension(..) :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      type(c_ptr) :: out
      integer(c_int),target,contiguous,dimension(..) :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(c_int) :: sign
      integer(c_int) :: flags
      !
      fftwf_plan_many_dft_assumed_rank = fftwf_plan_many_dft_(rank,c_loc(n),howmany,in, &
        c_loc(inembed),istride,idist,out,c_loc(onembed),ostride,odist,sign,flags)
    end function

#else
    function fftwf_plan_many_dft_rank_0(rank,n,howmany,in,inembed,istride,idist,out,onembed, &
        ostride,odist,sign,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_many_dft_rank_0
      integer(c_int) :: rank
      integer(c_int),target :: n
      integer(c_int) :: howmany
      type(c_ptr) :: in
      integer(c_int),target :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      type(c_ptr) :: out
      integer(c_int),target :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(c_int) :: sign
      integer(c_int) :: flags
      !
      fftwf_plan_many_dft_rank_0 = fftwf_plan_many_dft_(rank,c_loc(n),howmany,in,c_loc(inembed), &
        istride,idist,out,c_loc(onembed),ostride,odist,sign,flags)
    end function

    function fftwf_plan_many_dft_rank_1(rank,n,howmany,in,inembed,istride,idist,out,onembed, &
        ostride,odist,sign,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_many_dft_rank_1
      integer(c_int) :: rank
      integer(c_int),target,dimension(:) :: n
      integer(c_int) :: howmany
      type(c_ptr) :: in
      integer(c_int),target,dimension(:) :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      type(c_ptr) :: out
      integer(c_int),target,dimension(:) :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(c_int) :: sign
      integer(c_int) :: flags
      !
      fftwf_plan_many_dft_rank_1 = fftwf_plan_many_dft_(rank,c_loc(n),howmany,in,c_loc(inembed), &
        istride,idist,out,c_loc(onembed),ostride,odist,sign,flags)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function fftw_plan_many_dft_r2c_assumed_rank(rank,n,howmany,in,inembed,istride,idist,out, &
        onembed,ostride,odist,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_many_dft_r2c_assumed_rank
      integer(c_int) :: rank
      integer(c_int),target,contiguous,dimension(..) :: n
      integer(c_int) :: howmany
      real(c_double),target,contiguous,dimension(..) :: in
      integer(c_int),target,contiguous,dimension(..) :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      type(c_ptr) :: out
      integer(c_int),target,contiguous,dimension(..) :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(c_int) :: flags
      !
      fftw_plan_many_dft_r2c_assumed_rank = fftw_plan_many_dft_r2c_(rank,c_loc(n),howmany, &
        c_loc(in),c_loc(inembed),istride,idist,out,c_loc(onembed),ostride,odist,flags)
    end function

#else
    function fftw_plan_many_dft_r2c_rank_0(rank,n,howmany,in,inembed,istride,idist,out,onembed, &
        ostride,odist,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_many_dft_r2c_rank_0
      integer(c_int) :: rank
      integer(c_int),target :: n
      integer(c_int) :: howmany
      real(c_double),target :: in
      integer(c_int),target :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      type(c_ptr) :: out
      integer(c_int),target :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(c_int) :: flags
      !
      fftw_plan_many_dft_r2c_rank_0 = fftw_plan_many_dft_r2c_(rank,c_loc(n),howmany,c_loc(in), &
        c_loc(inembed),istride,idist,out,c_loc(onembed),ostride,odist,flags)
    end function

    function fftw_plan_many_dft_r2c_rank_1(rank,n,howmany,in,inembed,istride,idist,out,onembed, &
        ostride,odist,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_many_dft_r2c_rank_1
      integer(c_int) :: rank
      integer(c_int),target,dimension(:) :: n
      integer(c_int) :: howmany
      real(c_double),target,dimension(:) :: in
      integer(c_int),target,dimension(:) :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      type(c_ptr) :: out
      integer(c_int),target,dimension(:) :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(c_int) :: flags
      !
      fftw_plan_many_dft_r2c_rank_1 = fftw_plan_many_dft_r2c_(rank,c_loc(n),howmany,c_loc(in), &
        c_loc(inembed),istride,idist,out,c_loc(onembed),ostride,odist,flags)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function fftwf_plan_many_dft_r2c_assumed_rank(rank,n,howmany,in,inembed,istride,idist,out, &
        onembed,ostride,odist,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_many_dft_r2c_assumed_rank
      integer(c_int) :: rank
      integer(c_int),target,contiguous,dimension(..) :: n
      integer(c_int) :: howmany
      real(c_float),target,contiguous,dimension(..) :: in
      integer(c_int),target,contiguous,dimension(..) :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      type(c_ptr) :: out
      integer(c_int),target,contiguous,dimension(..) :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(c_int) :: flags
      !
      fftwf_plan_many_dft_r2c_assumed_rank = fftwf_plan_many_dft_r2c_(rank,c_loc(n),howmany, &
        c_loc(in),c_loc(inembed),istride,idist,out,c_loc(onembed),ostride,odist,flags)
    end function

#else
    function fftwf_plan_many_dft_r2c_rank_0(rank,n,howmany,in,inembed,istride,idist,out,onembed, &
        ostride,odist,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_many_dft_r2c_rank_0
      integer(c_int) :: rank
      integer(c_int),target :: n
      integer(c_int) :: howmany
      real(c_float),target :: in
      integer(c_int),target :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      type(c_ptr) :: out
      integer(c_int),target :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(c_int) :: flags
      !
      fftwf_plan_many_dft_r2c_rank_0 = fftwf_plan_many_dft_r2c_(rank,c_loc(n),howmany,c_loc(in), &
        c_loc(inembed),istride,idist,out,c_loc(onembed),ostride,odist,flags)
    end function

    function fftwf_plan_many_dft_r2c_rank_1(rank,n,howmany,in,inembed,istride,idist,out,onembed, &
        ostride,odist,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_many_dft_r2c_rank_1
      integer(c_int) :: rank
      integer(c_int),target,dimension(:) :: n
      integer(c_int) :: howmany
      real(c_float),target,dimension(:) :: in
      integer(c_int),target,dimension(:) :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      type(c_ptr) :: out
      integer(c_int),target,dimension(:) :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(c_int) :: flags
      !
      fftwf_plan_many_dft_r2c_rank_1 = fftwf_plan_many_dft_r2c_(rank,c_loc(n),howmany,c_loc(in), &
        c_loc(inembed),istride,idist,out,c_loc(onembed),ostride,odist,flags)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function fftw_plan_many_dft_c2r_assumed_rank(rank,n,howmany,in,inembed,istride,idist,out, &
        onembed,ostride,odist,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_many_dft_c2r_assumed_rank
      integer(c_int) :: rank
      integer(c_int),target,contiguous,dimension(..) :: n
      integer(c_int) :: howmany
      type(c_ptr) :: in
      integer(c_int),target,contiguous,dimension(..) :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      real(c_double),target,contiguous,dimension(..) :: out
      integer(c_int),target,contiguous,dimension(..) :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(c_int) :: flags
      !
      fftw_plan_many_dft_c2r_assumed_rank = fftw_plan_many_dft_c2r_(rank,c_loc(n),howmany,in, &
        c_loc(inembed),istride,idist,c_loc(out),c_loc(onembed),ostride,odist,flags)
    end function

#else
    function fftw_plan_many_dft_c2r_rank_0(rank,n,howmany,in,inembed,istride,idist,out,onembed, &
        ostride,odist,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_many_dft_c2r_rank_0
      integer(c_int) :: rank
      integer(c_int),target :: n
      integer(c_int) :: howmany
      type(c_ptr) :: in
      integer(c_int),target :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      real(c_double),target :: out
      integer(c_int),target :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(c_int) :: flags
      !
      fftw_plan_many_dft_c2r_rank_0 = fftw_plan_many_dft_c2r_(rank,c_loc(n),howmany,in, &
        c_loc(inembed),istride,idist,c_loc(out),c_loc(onembed),ostride,odist,flags)
    end function

    function fftw_plan_many_dft_c2r_rank_1(rank,n,howmany,in,inembed,istride,idist,out,onembed, &
        ostride,odist,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_many_dft_c2r_rank_1
      integer(c_int) :: rank
      integer(c_int),target,dimension(:) :: n
      integer(c_int) :: howmany
      type(c_ptr) :: in
      integer(c_int),target,dimension(:) :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      real(c_double),target,dimension(:) :: out
      integer(c_int),target,dimension(:) :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(c_int) :: flags
      !
      fftw_plan_many_dft_c2r_rank_1 = fftw_plan_many_dft_c2r_(rank,c_loc(n),howmany,in, &
        c_loc(inembed),istride,idist,c_loc(out),c_loc(onembed),ostride,odist,flags)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function fftwf_plan_many_dft_c2r_assumed_rank(rank,n,howmany,in,inembed,istride,idist,out, &
        onembed,ostride,odist,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_many_dft_c2r_assumed_rank
      integer(c_int) :: rank
      integer(c_int),target,contiguous,dimension(..) :: n
      integer(c_int) :: howmany
      type(c_ptr) :: in
      integer(c_int),target,contiguous,dimension(..) :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      real(c_float),target,contiguous,dimension(..) :: out
      integer(c_int),target,contiguous,dimension(..) :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(c_int) :: flags
      !
      fftwf_plan_many_dft_c2r_assumed_rank = fftwf_plan_many_dft_c2r_(rank,c_loc(n),howmany,in, &
        c_loc(inembed),istride,idist,c_loc(out),c_loc(onembed),ostride,odist,flags)
    end function

#else
    function fftwf_plan_many_dft_c2r_rank_0(rank,n,howmany,in,inembed,istride,idist,out,onembed, &
        ostride,odist,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_many_dft_c2r_rank_0
      integer(c_int) :: rank
      integer(c_int),target :: n
      integer(c_int) :: howmany
      type(c_ptr) :: in
      integer(c_int),target :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      real(c_float),target :: out
      integer(c_int),target :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(c_int) :: flags
      !
      fftwf_plan_many_dft_c2r_rank_0 = fftwf_plan_many_dft_c2r_(rank,c_loc(n),howmany,in, &
        c_loc(inembed),istride,idist,c_loc(out),c_loc(onembed),ostride,odist,flags)
    end function

    function fftwf_plan_many_dft_c2r_rank_1(rank,n,howmany,in,inembed,istride,idist,out,onembed, &
        ostride,odist,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_many_dft_c2r_rank_1
      integer(c_int) :: rank
      integer(c_int),target,dimension(:) :: n
      integer(c_int) :: howmany
      type(c_ptr) :: in
      integer(c_int),target,dimension(:) :: inembed
      integer(c_int) :: istride
      integer(c_int) :: idist
      real(c_float),target,dimension(:) :: out
      integer(c_int),target,dimension(:) :: onembed
      integer(c_int) :: ostride
      integer(c_int) :: odist
      integer(c_int) :: flags
      !
      fftwf_plan_many_dft_c2r_rank_1 = fftwf_plan_many_dft_c2r_(rank,c_loc(n),howmany,in, &
        c_loc(inembed),istride,idist,c_loc(out),c_loc(onembed),ostride,odist,flags)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function fftw_plan_guru_dft_r2c_assumed_rank(rank,dims,howmany_rank,howmany_dims,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_guru_dft_r2c_assumed_rank
      integer(c_int) :: rank
      type(fftw_iodim) :: dims
      integer(c_int) :: howmany_rank
      type(fftw_iodim) :: howmany_dims
      real(c_double),target,contiguous,dimension(..) :: in
      type(c_ptr) :: out
      integer(c_int) :: flags
      !
      fftw_plan_guru_dft_r2c_assumed_rank = fftw_plan_guru_dft_r2c_(rank,dims,howmany_rank, &
        howmany_dims,c_loc(in),out,flags)
    end function

#else
    function fftw_plan_guru_dft_r2c_rank_0(rank,dims,howmany_rank,howmany_dims,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_guru_dft_r2c_rank_0
      integer(c_int) :: rank
      type(fftw_iodim) :: dims
      integer(c_int) :: howmany_rank
      type(fftw_iodim) :: howmany_dims
      real(c_double),target :: in
      type(c_ptr) :: out
      integer(c_int) :: flags
      !
      fftw_plan_guru_dft_r2c_rank_0 = fftw_plan_guru_dft_r2c_(rank,dims,howmany_rank,howmany_dims, &
        c_loc(in),out,flags)
    end function

    function fftw_plan_guru_dft_r2c_rank_1(rank,dims,howmany_rank,howmany_dims,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_guru_dft_r2c_rank_1
      integer(c_int) :: rank
      type(fftw_iodim) :: dims
      integer(c_int) :: howmany_rank
      type(fftw_iodim) :: howmany_dims
      real(c_double),target,dimension(:) :: in
      type(c_ptr) :: out
      integer(c_int) :: flags
      !
      fftw_plan_guru_dft_r2c_rank_1 = fftw_plan_guru_dft_r2c_(rank,dims,howmany_rank,howmany_dims, &
        c_loc(in),out,flags)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function fftwf_plan_guru_dft_r2c_assumed_rank(rank,dims,howmany_rank,howmany_dims,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_guru_dft_r2c_assumed_rank
      integer(c_int) :: rank
      type(c_ptr) :: dims
      integer(c_int) :: howmany_rank
      type(c_ptr) :: howmany_dims
      real(c_float),target,contiguous,dimension(..) :: in
      type(c_ptr) :: out
      integer(c_int) :: flags
      !
      fftwf_plan_guru_dft_r2c_assumed_rank = fftwf_plan_guru_dft_r2c_(rank,dims,howmany_rank, &
        howmany_dims,c_loc(in),out,flags)
    end function

#else
    function fftwf_plan_guru_dft_r2c_rank_0(rank,dims,howmany_rank,howmany_dims,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_guru_dft_r2c_rank_0
      integer(c_int) :: rank
      type(c_ptr) :: dims
      integer(c_int) :: howmany_rank
      type(c_ptr) :: howmany_dims
      real(c_float),target :: in
      type(c_ptr) :: out
      integer(c_int) :: flags
      !
      fftwf_plan_guru_dft_r2c_rank_0 = fftwf_plan_guru_dft_r2c_(rank,dims,howmany_rank, &
        howmany_dims,c_loc(in),out,flags)
    end function

    function fftwf_plan_guru_dft_r2c_rank_1(rank,dims,howmany_rank,howmany_dims,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_guru_dft_r2c_rank_1
      integer(c_int) :: rank
      type(c_ptr) :: dims
      integer(c_int) :: howmany_rank
      type(c_ptr) :: howmany_dims
      real(c_float),target,dimension(:) :: in
      type(c_ptr) :: out
      integer(c_int) :: flags
      !
      fftwf_plan_guru_dft_r2c_rank_1 = fftwf_plan_guru_dft_r2c_(rank,dims,howmany_rank, &
        howmany_dims,c_loc(in),out,flags)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function fftw_plan_guru_dft_c2r_assumed_rank(rank,dims,howmany_rank,howmany_dims,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_guru_dft_c2r_assumed_rank
      integer(c_int) :: rank
      type(fftw_iodim) :: dims
      integer(c_int) :: howmany_rank
      type(fftw_iodim) :: howmany_dims
      type(c_ptr) :: in
      real(c_double),target,contiguous,dimension(..) :: out
      integer(c_int) :: flags
      !
      fftw_plan_guru_dft_c2r_assumed_rank = fftw_plan_guru_dft_c2r_(rank,dims,howmany_rank, &
        howmany_dims,in,c_loc(out),flags)
    end function

#else
    function fftw_plan_guru_dft_c2r_rank_0(rank,dims,howmany_rank,howmany_dims,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_guru_dft_c2r_rank_0
      integer(c_int) :: rank
      type(fftw_iodim) :: dims
      integer(c_int) :: howmany_rank
      type(fftw_iodim) :: howmany_dims
      type(c_ptr) :: in
      real(c_double),target :: out
      integer(c_int) :: flags
      !
      fftw_plan_guru_dft_c2r_rank_0 = fftw_plan_guru_dft_c2r_(rank,dims,howmany_rank,howmany_dims, &
        in,c_loc(out),flags)
    end function

    function fftw_plan_guru_dft_c2r_rank_1(rank,dims,howmany_rank,howmany_dims,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_guru_dft_c2r_rank_1
      integer(c_int) :: rank
      type(fftw_iodim) :: dims
      integer(c_int) :: howmany_rank
      type(fftw_iodim) :: howmany_dims
      type(c_ptr) :: in
      real(c_double),target,dimension(:) :: out
      integer(c_int) :: flags
      !
      fftw_plan_guru_dft_c2r_rank_1 = fftw_plan_guru_dft_c2r_(rank,dims,howmany_rank,howmany_dims, &
        in,c_loc(out),flags)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function fftwf_plan_guru_dft_c2r_assumed_rank(rank,dims,howmany_rank,howmany_dims,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_guru_dft_c2r_assumed_rank
      integer(c_int) :: rank
      type(c_ptr) :: dims
      integer(c_int) :: howmany_rank
      type(c_ptr) :: howmany_dims
      type(c_ptr) :: in
      real(c_float),target,contiguous,dimension(..) :: out
      integer(c_int) :: flags
      !
      fftwf_plan_guru_dft_c2r_assumed_rank = fftwf_plan_guru_dft_c2r_(rank,dims,howmany_rank, &
        howmany_dims,in,c_loc(out),flags)
    end function

#else
    function fftwf_plan_guru_dft_c2r_rank_0(rank,dims,howmany_rank,howmany_dims,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_guru_dft_c2r_rank_0
      integer(c_int) :: rank
      type(c_ptr) :: dims
      integer(c_int) :: howmany_rank
      type(c_ptr) :: howmany_dims
      type(c_ptr) :: in
      real(c_float),target :: out
      integer(c_int) :: flags
      !
      fftwf_plan_guru_dft_c2r_rank_0 = fftwf_plan_guru_dft_c2r_(rank,dims,howmany_rank, &
        howmany_dims,in,c_loc(out),flags)
    end function

    function fftwf_plan_guru_dft_c2r_rank_1(rank,dims,howmany_rank,howmany_dims,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_guru_dft_c2r_rank_1
      integer(c_int) :: rank
      type(c_ptr) :: dims
      integer(c_int) :: howmany_rank
      type(c_ptr) :: howmany_dims
      type(c_ptr) :: in
      real(c_float),target,dimension(:) :: out
      integer(c_int) :: flags
      !
      fftwf_plan_guru_dft_c2r_rank_1 = fftwf_plan_guru_dft_c2r_(rank,dims,howmany_rank, &
        howmany_dims,in,c_loc(out),flags)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function fftw_plan_guru64_dft_r2c_assumed_rank(rank,dims,howmany_rank,howmany_dims,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_guru64_dft_r2c_assumed_rank
      integer(c_int) :: rank
      type(fftw_iodim64) :: dims
      integer(c_int) :: howmany_rank
      type(fftw_iodim64) :: howmany_dims
      real(c_double),target,contiguous,dimension(..) :: in
      type(c_ptr) :: out
      integer(c_int) :: flags
      !
      fftw_plan_guru64_dft_r2c_assumed_rank = fftw_plan_guru64_dft_r2c_(rank,dims,howmany_rank, &
        howmany_dims,c_loc(in),out,flags)
    end function

#else
    function fftw_plan_guru64_dft_r2c_rank_0(rank,dims,howmany_rank,howmany_dims,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_guru64_dft_r2c_rank_0
      integer(c_int) :: rank
      type(fftw_iodim64) :: dims
      integer(c_int) :: howmany_rank
      type(fftw_iodim64) :: howmany_dims
      real(c_double),target :: in
      type(c_ptr) :: out
      integer(c_int) :: flags
      !
      fftw_plan_guru64_dft_r2c_rank_0 = fftw_plan_guru64_dft_r2c_(rank,dims,howmany_rank, &
        howmany_dims,c_loc(in),out,flags)
    end function

    function fftw_plan_guru64_dft_r2c_rank_1(rank,dims,howmany_rank,howmany_dims,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_guru64_dft_r2c_rank_1
      integer(c_int) :: rank
      type(fftw_iodim64) :: dims
      integer(c_int) :: howmany_rank
      type(fftw_iodim64) :: howmany_dims
      real(c_double),target,dimension(:) :: in
      type(c_ptr) :: out
      integer(c_int) :: flags
      !
      fftw_plan_guru64_dft_r2c_rank_1 = fftw_plan_guru64_dft_r2c_(rank,dims,howmany_rank, &
        howmany_dims,c_loc(in),out,flags)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function fftwf_plan_guru64_dft_r2c_assumed_rank(rank,dims,howmany_rank,howmany_dims,in,out, &
        flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_guru64_dft_r2c_assumed_rank
      integer(c_int) :: rank
      type(c_ptr) :: dims
      integer(c_int) :: howmany_rank
      type(c_ptr) :: howmany_dims
      real(c_float),target,contiguous,dimension(..) :: in
      type(c_ptr) :: out
      integer(c_int) :: flags
      !
      fftwf_plan_guru64_dft_r2c_assumed_rank = fftwf_plan_guru64_dft_r2c_(rank,dims,howmany_rank, &
        howmany_dims,c_loc(in),out,flags)
    end function

#else
    function fftwf_plan_guru64_dft_r2c_rank_0(rank,dims,howmany_rank,howmany_dims,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_guru64_dft_r2c_rank_0
      integer(c_int) :: rank
      type(c_ptr) :: dims
      integer(c_int) :: howmany_rank
      type(c_ptr) :: howmany_dims
      real(c_float),target :: in
      type(c_ptr) :: out
      integer(c_int) :: flags
      !
      fftwf_plan_guru64_dft_r2c_rank_0 = fftwf_plan_guru64_dft_r2c_(rank,dims,howmany_rank, &
        howmany_dims,c_loc(in),out,flags)
    end function

    function fftwf_plan_guru64_dft_r2c_rank_1(rank,dims,howmany_rank,howmany_dims,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_guru64_dft_r2c_rank_1
      integer(c_int) :: rank
      type(c_ptr) :: dims
      integer(c_int) :: howmany_rank
      type(c_ptr) :: howmany_dims
      real(c_float),target,dimension(:) :: in
      type(c_ptr) :: out
      integer(c_int) :: flags
      !
      fftwf_plan_guru64_dft_r2c_rank_1 = fftwf_plan_guru64_dft_r2c_(rank,dims,howmany_rank, &
        howmany_dims,c_loc(in),out,flags)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function fftw_plan_guru64_dft_c2r_assumed_rank(rank,dims,howmany_rank,howmany_dims,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_guru64_dft_c2r_assumed_rank
      integer(c_int) :: rank
      type(fftw_iodim64) :: dims
      integer(c_int) :: howmany_rank
      type(fftw_iodim64) :: howmany_dims
      type(c_ptr) :: in
      real(c_double),target,contiguous,dimension(..) :: out
      integer(c_int) :: flags
      !
      fftw_plan_guru64_dft_c2r_assumed_rank = fftw_plan_guru64_dft_c2r_(rank,dims,howmany_rank, &
        howmany_dims,in,c_loc(out),flags)
    end function

#else
    function fftw_plan_guru64_dft_c2r_rank_0(rank,dims,howmany_rank,howmany_dims,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_guru64_dft_c2r_rank_0
      integer(c_int) :: rank
      type(fftw_iodim64) :: dims
      integer(c_int) :: howmany_rank
      type(fftw_iodim64) :: howmany_dims
      type(c_ptr) :: in
      real(c_double),target :: out
      integer(c_int) :: flags
      !
      fftw_plan_guru64_dft_c2r_rank_0 = fftw_plan_guru64_dft_c2r_(rank,dims,howmany_rank, &
        howmany_dims,in,c_loc(out),flags)
    end function

    function fftw_plan_guru64_dft_c2r_rank_1(rank,dims,howmany_rank,howmany_dims,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_guru64_dft_c2r_rank_1
      integer(c_int) :: rank
      type(fftw_iodim64) :: dims
      integer(c_int) :: howmany_rank
      type(fftw_iodim64) :: howmany_dims
      type(c_ptr) :: in
      real(c_double),target,dimension(:) :: out
      integer(c_int) :: flags
      !
      fftw_plan_guru64_dft_c2r_rank_1 = fftw_plan_guru64_dft_c2r_(rank,dims,howmany_rank, &
        howmany_dims,in,c_loc(out),flags)
    end function

#endif
#ifdef USE_ASSUMED_RANK_INTERFACES
    function fftwf_plan_guru64_dft_c2r_assumed_rank(rank,dims,howmany_rank,howmany_dims,in,out, &
        flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_guru64_dft_c2r_assumed_rank
      integer(c_int) :: rank
      type(c_ptr) :: dims
      integer(c_int) :: howmany_rank
      type(c_ptr) :: howmany_dims
      type(c_ptr) :: in
      real(c_float),target,contiguous,dimension(..) :: out
      integer(c_int) :: flags
      !
      fftwf_plan_guru64_dft_c2r_assumed_rank = fftwf_plan_guru64_dft_c2r_(rank,dims,howmany_rank, &
        howmany_dims,in,c_loc(out),flags)
    end function

#else
    function fftwf_plan_guru64_dft_c2r_rank_0(rank,dims,howmany_rank,howmany_dims,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_guru64_dft_c2r_rank_0
      integer(c_int) :: rank
      type(c_ptr) :: dims
      integer(c_int) :: howmany_rank
      type(c_ptr) :: howmany_dims
      type(c_ptr) :: in
      real(c_float),target :: out
      integer(c_int) :: flags
      !
      fftwf_plan_guru64_dft_c2r_rank_0 = fftwf_plan_guru64_dft_c2r_(rank,dims,howmany_rank, &
        howmany_dims,in,c_loc(out),flags)
    end function

    function fftwf_plan_guru64_dft_c2r_rank_1(rank,dims,howmany_rank,howmany_dims,in,out,flags)
      use iso_c_binding
      implicit none
      type(c_ptr) :: fftwf_plan_guru64_dft_c2r_rank_1
      integer(c_int) :: rank
      type(c_ptr) :: dims
      integer(c_int) :: howmany_rank
      type(c_ptr) :: howmany_dims
      type(c_ptr) :: in
      real(c_float),target,dimension(:) :: out
      integer(c_int) :: flags
      !
      fftwf_plan_guru64_dft_c2r_rank_1 = fftwf_plan_guru64_dft_c2r_(rank,dims,howmany_rank, &
        howmany_dims,in,c_loc(out),flags)
    end function

#endif
    subroutine fftw_execute_typed(plan)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(fftw_plan_t), value :: plan
      call fftw_execute_(plan%ptr)
    end subroutine fftw_execute_typed

    subroutine fftwf_execute_typed(plan)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(fftwf_plan_t), value :: plan
      call fftwf_execute_(plan%ptr)
    end subroutine fftwf_execute_typed

    subroutine fftw_execute_dft_typed(plan, in, out)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(fftw_plan_t), value :: plan
      type(c_ptr), value :: in
      type(c_ptr), value :: out
      call fftw_execute_dft_(plan%ptr, in, out)
    end subroutine fftw_execute_dft_typed

    subroutine fftwf_execute_dft_typed(plan, in, out)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(fftwf_plan_t), value :: plan
      type(c_ptr), value :: in
      type(c_ptr), value :: out
      call fftwf_execute_dft_(plan%ptr, in, out)
    end subroutine fftwf_execute_dft_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    subroutine fftw_execute_dft_r2c_assumed_rank(plan,in,out)
      use iso_c_binding
      implicit none
      type(fftw_plan_t) :: plan
      real(c_double),target,contiguous,dimension(..) :: in
      type(c_ptr) :: out
      !
      call fftw_execute_dft_r2c_(plan%ptr,c_loc(in),out)
    end subroutine

    subroutine fftw_execute_dft_r2c_assumed_rank_cptr(plan,in,out)
      use iso_c_binding
      implicit none
      type(c_ptr) :: plan
      real(c_double),target,contiguous,dimension(..) :: in
      type(c_ptr) :: out
      !
      call fftw_execute_dft_r2c_(plan,c_loc(in),out)
    end subroutine

#else
    subroutine fftw_execute_dft_r2c_rank_0(plan,in,out)
      use iso_c_binding
      implicit none
      type(fftw_plan_t) :: plan
      real(c_double),target :: in
      type(c_ptr) :: out
      !
      call fftw_execute_dft_r2c_(plan%ptr,c_loc(in),out)
    end subroutine

    subroutine fftw_execute_dft_r2c_rank_0_cptr(plan,in,out)
      use iso_c_binding
      implicit none
      type(c_ptr) :: plan
      real(c_double),target :: in
      type(c_ptr) :: out
      !
      call fftw_execute_dft_r2c_(plan,c_loc(in),out)
    end subroutine

    subroutine fftw_execute_dft_r2c_rank_1(plan,in,out)
      use iso_c_binding
      implicit none
      type(fftw_plan_t) :: plan
      real(c_double),target,dimension(:) :: in
      type(c_ptr) :: out
      !
      call fftw_execute_dft_r2c_(plan%ptr,c_loc(in),out)
    end subroutine

    subroutine fftw_execute_dft_r2c_rank_1_cptr(plan,in,out)
      use iso_c_binding
      implicit none
      type(c_ptr) :: plan
      real(c_double),target,dimension(:) :: in
      type(c_ptr) :: out
      !
      call fftw_execute_dft_r2c_(plan,c_loc(in),out)
    end subroutine

#endif
    subroutine fftw_execute_dft_r2c_typed(plan, in, out)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(fftw_plan_t), value :: plan
      type(c_ptr), value :: in
      type(c_ptr), value :: out
      call fftw_execute_dft_r2c_(plan%ptr, in, out)
    end subroutine fftw_execute_dft_r2c_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    subroutine fftwf_execute_dft_r2c_assumed_rank(plan,in,out)
      use iso_c_binding
      implicit none
      type(fftwf_plan_t) :: plan
      real(c_float),target,contiguous,dimension(..) :: in
      type(c_ptr) :: out
      !
      call fftwf_execute_dft_r2c_(plan%ptr,c_loc(in),out)
    end subroutine

    subroutine fftwf_execute_dft_r2c_assumed_rank_cptr(plan,in,out)
      use iso_c_binding
      implicit none
      type(c_ptr) :: plan
      real(c_float),target,contiguous,dimension(..) :: in
      type(c_ptr) :: out
      !
      call fftwf_execute_dft_r2c_(plan,c_loc(in),out)
    end subroutine

#else
    subroutine fftwf_execute_dft_r2c_rank_0(plan,in,out)
      use iso_c_binding
      implicit none
      type(fftwf_plan_t) :: plan
      real(c_float),target :: in
      type(c_ptr) :: out
      !
      call fftwf_execute_dft_r2c_(plan%ptr,c_loc(in),out)
    end subroutine

    subroutine fftwf_execute_dft_r2c_rank_0_cptr(plan,in,out)
      use iso_c_binding
      implicit none
      type(c_ptr) :: plan
      real(c_float),target :: in
      type(c_ptr) :: out
      !
      call fftwf_execute_dft_r2c_(plan,c_loc(in),out)
    end subroutine

    subroutine fftwf_execute_dft_r2c_rank_1(plan,in,out)
      use iso_c_binding
      implicit none
      type(fftwf_plan_t) :: plan
      real(c_float),target,dimension(:) :: in
      type(c_ptr) :: out
      !
      call fftwf_execute_dft_r2c_(plan%ptr,c_loc(in),out)
    end subroutine

    subroutine fftwf_execute_dft_r2c_rank_1_cptr(plan,in,out)
      use iso_c_binding
      implicit none
      type(c_ptr) :: plan
      real(c_float),target,dimension(:) :: in
      type(c_ptr) :: out
      !
      call fftwf_execute_dft_r2c_(plan,c_loc(in),out)
    end subroutine

#endif
    subroutine fftwf_execute_dft_r2c_typed(plan, in, out)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(fftwf_plan_t), value :: plan
      type(c_ptr), value :: in
      type(c_ptr), value :: out
      call fftwf_execute_dft_r2c_(plan%ptr, in, out)
    end subroutine fftwf_execute_dft_r2c_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    subroutine fftw_execute_dft_c2r_assumed_rank(plan,in,out)
      use iso_c_binding
      implicit none
      type(fftw_plan_t) :: plan
      type(c_ptr) :: in
      real(c_double),target,contiguous,dimension(..) :: out
      !
      call fftw_execute_dft_c2r_(plan%ptr,in,c_loc(out))
    end subroutine

    subroutine fftw_execute_dft_c2r_assumed_rank_cptr(plan,in,out)
      use iso_c_binding
      implicit none
      type(c_ptr) :: plan
      type(c_ptr) :: in
      real(c_double),target,contiguous,dimension(..) :: out
      !
      call fftw_execute_dft_c2r_(plan,in,c_loc(out))
    end subroutine

#else
    subroutine fftw_execute_dft_c2r_rank_0(plan,in,out)
      use iso_c_binding
      implicit none
      type(fftw_plan_t) :: plan
      type(c_ptr) :: in
      real(c_double),target :: out
      !
      call fftw_execute_dft_c2r_(plan%ptr,in,c_loc(out))
    end subroutine

    subroutine fftw_execute_dft_c2r_rank_0_cptr(plan,in,out)
      use iso_c_binding
      implicit none
      type(c_ptr) :: plan
      type(c_ptr) :: in
      real(c_double),target :: out
      !
      call fftw_execute_dft_c2r_(plan,in,c_loc(out))
    end subroutine

    subroutine fftw_execute_dft_c2r_rank_1(plan,in,out)
      use iso_c_binding
      implicit none
      type(fftw_plan_t) :: plan
      type(c_ptr) :: in
      real(c_double),target,dimension(:) :: out
      !
      call fftw_execute_dft_c2r_(plan%ptr,in,c_loc(out))
    end subroutine

    subroutine fftw_execute_dft_c2r_rank_1_cptr(plan,in,out)
      use iso_c_binding
      implicit none
      type(c_ptr) :: plan
      type(c_ptr) :: in
      real(c_double),target,dimension(:) :: out
      !
      call fftw_execute_dft_c2r_(plan,in,c_loc(out))
    end subroutine

#endif
    subroutine fftw_execute_dft_c2r_typed(plan, in, out)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(fftw_plan_t), value :: plan
      type(c_ptr), value :: in
      type(c_ptr), value :: out
      call fftw_execute_dft_c2r_(plan%ptr, in, out)
    end subroutine fftw_execute_dft_c2r_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    subroutine fftwf_execute_dft_c2r_assumed_rank(plan,in,out)
      use iso_c_binding
      implicit none
      type(fftwf_plan_t) :: plan
      type(c_ptr) :: in
      real(c_float),target,contiguous,dimension(..) :: out
      !
      call fftwf_execute_dft_c2r_(plan%ptr,in,c_loc(out))
    end subroutine

    subroutine fftwf_execute_dft_c2r_assumed_rank_cptr(plan,in,out)
      use iso_c_binding
      implicit none
      type(c_ptr) :: plan
      type(c_ptr) :: in
      real(c_float),target,contiguous,dimension(..) :: out
      !
      call fftwf_execute_dft_c2r_(plan,in,c_loc(out))
    end subroutine

#else
    subroutine fftwf_execute_dft_c2r_rank_0(plan,in,out)
      use iso_c_binding
      implicit none
      type(fftwf_plan_t) :: plan
      type(c_ptr) :: in
      real(c_float),target :: out
      !
      call fftwf_execute_dft_c2r_(plan%ptr,in,c_loc(out))
    end subroutine

    subroutine fftwf_execute_dft_c2r_rank_0_cptr(plan,in,out)
      use iso_c_binding
      implicit none
      type(c_ptr) :: plan
      type(c_ptr) :: in
      real(c_float),target :: out
      !
      call fftwf_execute_dft_c2r_(plan,in,c_loc(out))
    end subroutine

    subroutine fftwf_execute_dft_c2r_rank_1(plan,in,out)
      use iso_c_binding
      implicit none
      type(fftwf_plan_t) :: plan
      type(c_ptr) :: in
      real(c_float),target,dimension(:) :: out
      !
      call fftwf_execute_dft_c2r_(plan%ptr,in,c_loc(out))
    end subroutine

    subroutine fftwf_execute_dft_c2r_rank_1_cptr(plan,in,out)
      use iso_c_binding
      implicit none
      type(c_ptr) :: plan
      type(c_ptr) :: in
      real(c_float),target,dimension(:) :: out
      !
      call fftwf_execute_dft_c2r_(plan,in,c_loc(out))
    end subroutine

#endif
    subroutine fftwf_execute_dft_c2r_typed(plan, in, out)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(fftwf_plan_t), value :: plan
      type(c_ptr), value :: in
      type(c_ptr), value :: out
      call fftwf_execute_dft_c2r_(plan%ptr, in, out)
    end subroutine fftwf_execute_dft_c2r_typed

    subroutine fftw_destroy_plan_typed(plan)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(fftw_plan_t), value :: plan
      call fftw_destroy_plan_(plan%ptr)
    end subroutine fftw_destroy_plan_typed

    subroutine fftwf_destroy_plan_typed(plan)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(fftwf_plan_t), value :: plan
      call fftwf_destroy_plan_(plan%ptr)
    end subroutine fftwf_destroy_plan_typed

    subroutine fftw_print_plan_typed(arg1)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(fftw_plan_t), value :: arg1
      call fftw_print_plan_(arg1%ptr)
    end subroutine fftw_print_plan_typed

    subroutine fftwf_print_plan_typed(arg1)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(fftwf_plan_t), value :: arg1
      call fftwf_print_plan_(arg1%ptr)
    end subroutine fftwf_print_plan_typed

    function fftw_cost_typed(arg1) result(cost)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(fftw_plan_t), value :: arg1
      real(c_double) :: cost
      cost = fftw_cost_(arg1%ptr)
    end function fftw_cost_typed

    function fftwf_cost_typed(arg1) result(f_cost)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(fftw_plan_t), value :: arg1
      real(c_double) :: f_cost
      f_cost = fftwf_cost_(arg1%ptr)
    end function fftwf_cost_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    subroutine fftw_flops_assumed_rank(arg1,arg2,arg3,arg4)
      use iso_c_binding
      implicit none
      type(fftw_plan_t) :: arg1
      real(c_double),target,contiguous,dimension(..) :: arg2
      real(c_double),target,contiguous,dimension(..) :: arg3
      real(c_double),target,contiguous,dimension(..) :: arg4
      !
      call fftw_flops_(arg1%ptr,c_loc(arg2),c_loc(arg3),c_loc(arg4))
    end subroutine

    subroutine fftw_flops_assumed_rank_cptr(arg1,arg2,arg3,arg4)
      use iso_c_binding
      implicit none
      type(c_ptr) :: arg1
      real(c_double),target,contiguous,dimension(..) :: arg2
      real(c_double),target,contiguous,dimension(..) :: arg3
      real(c_double),target,contiguous,dimension(..) :: arg4
      !
      call fftw_flops_(arg1,c_loc(arg2),c_loc(arg3),c_loc(arg4))
    end subroutine

#else
    subroutine fftw_flops_rank_0(arg1,arg2,arg3,arg4)
      use iso_c_binding
      implicit none
      type(fftw_plan_t) :: arg1
      real(c_double),target :: arg2
      real(c_double),target :: arg3
      real(c_double),target :: arg4
      !
      call fftw_flops_(arg1%ptr,c_loc(arg2),c_loc(arg3),c_loc(arg4))
    end subroutine

    subroutine fftw_flops_rank_0_cptr(arg1,arg2,arg3,arg4)
      use iso_c_binding
      implicit none
      type(c_ptr) :: arg1
      real(c_double),target :: arg2
      real(c_double),target :: arg3
      real(c_double),target :: arg4
      !
      call fftw_flops_(arg1,c_loc(arg2),c_loc(arg3),c_loc(arg4))
    end subroutine

    subroutine fftw_flops_rank_1(arg1,arg2,arg3,arg4)
      use iso_c_binding
      implicit none
      type(fftw_plan_t) :: arg1
      real(c_double),target,dimension(:) :: arg2
      real(c_double),target,dimension(:) :: arg3
      real(c_double),target,dimension(:) :: arg4
      !
      call fftw_flops_(arg1%ptr,c_loc(arg2),c_loc(arg3),c_loc(arg4))
    end subroutine

    subroutine fftw_flops_rank_1_cptr(arg1,arg2,arg3,arg4)
      use iso_c_binding
      implicit none
      type(c_ptr) :: arg1
      real(c_double),target,dimension(:) :: arg2
      real(c_double),target,dimension(:) :: arg3
      real(c_double),target,dimension(:) :: arg4
      !
      call fftw_flops_(arg1,c_loc(arg2),c_loc(arg3),c_loc(arg4))
    end subroutine

#endif
    subroutine fftw_flops_typed(arg1, arg2, arg3, arg4)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(fftw_plan_t), value :: arg1
      type(c_ptr), value :: arg2
      type(c_ptr), value :: arg3
      type(c_ptr), value :: arg4
      call fftw_flops_(arg1%ptr, arg2, arg3, arg4)
    end subroutine fftw_flops_typed

#ifdef USE_ASSUMED_RANK_INTERFACES
    subroutine fftwf_flops_assumed_rank(arg1,arg2,arg3,arg4)
      use iso_c_binding
      implicit none
      type(fftw_plan_t) :: arg1
      real(c_double),target,contiguous,dimension(..) :: arg2
      real(c_double),target,contiguous,dimension(..) :: arg3
      real(c_double),target,contiguous,dimension(..) :: arg4
      !
      call fftwf_flops_(arg1%ptr,c_loc(arg2),c_loc(arg3),c_loc(arg4))
    end subroutine

    subroutine fftwf_flops_assumed_rank_cptr(arg1,arg2,arg3,arg4)
      use iso_c_binding
      implicit none
      type(c_ptr) :: arg1
      real(c_double),target,contiguous,dimension(..) :: arg2
      real(c_double),target,contiguous,dimension(..) :: arg3
      real(c_double),target,contiguous,dimension(..) :: arg4
      !
      call fftwf_flops_(arg1,c_loc(arg2),c_loc(arg3),c_loc(arg4))
    end subroutine

#else
    subroutine fftwf_flops_rank_0(arg1,arg2,arg3,arg4)
      use iso_c_binding
      implicit none
      type(fftw_plan_t) :: arg1
      real(c_double),target :: arg2
      real(c_double),target :: arg3
      real(c_double),target :: arg4
      !
      call fftwf_flops_(arg1%ptr,c_loc(arg2),c_loc(arg3),c_loc(arg4))
    end subroutine

    subroutine fftwf_flops_rank_0_cptr(arg1,arg2,arg3,arg4)
      use iso_c_binding
      implicit none
      type(c_ptr) :: arg1
      real(c_double),target :: arg2
      real(c_double),target :: arg3
      real(c_double),target :: arg4
      !
      call fftwf_flops_(arg1,c_loc(arg2),c_loc(arg3),c_loc(arg4))
    end subroutine

    subroutine fftwf_flops_rank_1(arg1,arg2,arg3,arg4)
      use iso_c_binding
      implicit none
      type(fftw_plan_t) :: arg1
      real(c_double),target,dimension(:) :: arg2
      real(c_double),target,dimension(:) :: arg3
      real(c_double),target,dimension(:) :: arg4
      !
      call fftwf_flops_(arg1%ptr,c_loc(arg2),c_loc(arg3),c_loc(arg4))
    end subroutine

    subroutine fftwf_flops_rank_1_cptr(arg1,arg2,arg3,arg4)
      use iso_c_binding
      implicit none
      type(c_ptr) :: arg1
      real(c_double),target,dimension(:) :: arg2
      real(c_double),target,dimension(:) :: arg3
      real(c_double),target,dimension(:) :: arg4
      !
      call fftwf_flops_(arg1,c_loc(arg2),c_loc(arg3),c_loc(arg4))
    end subroutine

#endif
    subroutine fftwf_flops_typed(arg1, arg2, arg3, arg4)
      use, intrinsic :: iso_c_binding
      use hipfort_handles
      implicit none
      type(fftw_plan_t), value :: arg1
      type(c_ptr), value :: arg2
      type(c_ptr), value :: arg3
      type(c_ptr), value :: arg4
      call fftwf_flops_(arg1%ptr, arg2, arg3, arg4)
    end subroutine fftwf_flops_typed

