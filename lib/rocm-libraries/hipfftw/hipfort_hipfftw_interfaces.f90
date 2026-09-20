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

! Usage:
!   #include "hipfort_hipfftw_interfaces.f90"  ! directly in any program unit (needs cpp:
!                                     ! the #ifdef guards below must be honoured)
!   use hipfort_hipfftw                         ! via the pre-built module

  use, intrinsic :: iso_c_binding
  implicit none

  interface

    !---------------------------------------------
    ! fftw_malloc
    !---------------------------------------------
    !>  @brief Allocates a data buffer accessible by the host.
    !>  @param[in] n - number of bytes desired for the buffer.
    !>  @return a pointer to the base address of the allocated memory block upon success
    !>  (``nullptr`` otherwise).
    !>
    !>  @remark The returned base address is at least 64-bit aligned.
    function fftw_malloc(n) &
       result(malloc) &
       bind(C, name="fftw_malloc")
       import :: c_size_t, c_ptr
       integer(c_size_t), value :: n
       type(c_ptr) :: malloc
    end function fftw_malloc

    !---------------------------------------------
    ! fftwf_malloc
    !---------------------------------------------
    !>  @brief This function is strictly equivalent to \ref fftw_malloc
    function fftwf_malloc(n) &
       result(f_malloc) &
       bind(C, name="fftwf_malloc")
       import :: c_size_t, c_ptr
       integer(c_size_t), value :: n
       type(c_ptr) :: f_malloc
    end function fftwf_malloc

    !---------------------------------------------
    ! fftw_alloc_real
    !---------------------------------------------
    !>  @brief This function is strictly equivalent to ``(double*) fftw_malloc(n * sizeof(double))``
    function fftw_alloc_real(n) &
       result(alloc_real) &
       bind(C, name="fftw_alloc_real")
       import :: c_size_t, c_ptr
       integer(c_size_t), value :: n
       type(c_ptr) :: alloc_real
    end function fftw_alloc_real

    !---------------------------------------------
    ! fftwf_alloc_real
    !---------------------------------------------
    !>  @brief This function is strictly equivalent to ``(float*) fftw_malloc(n * sizeof(float))``
    function fftwf_alloc_real(n) &
       result(f_alloc_real) &
       bind(C, name="fftwf_alloc_real")
       import :: c_size_t, c_ptr
       integer(c_size_t), value :: n
       type(c_ptr) :: f_alloc_real
    end function fftwf_alloc_real

    !---------------------------------------------
    ! fftw_alloc_complex
    !---------------------------------------------
    !>  @brief This function is strictly equivalent to
    !>  ``(fftw_complex*) fftw_malloc(n * sizeof(fftw_complex))``
    function fftw_alloc_complex(n) &
       result(alloc_complex) &
       bind(C, name="fftw_alloc_complex")
       import :: c_size_t, c_ptr
       integer(c_size_t), value :: n
       type(c_ptr) :: alloc_complex
    end function fftw_alloc_complex

    !---------------------------------------------
    ! fftwf_alloc_complex
    !---------------------------------------------
    !>  @brief This function is strictly equivalent to
    !>  ``(fftwf_complex*) fftw_malloc(n * sizeof(fftwf_complex))``
    function fftwf_alloc_complex(n) &
       result(f_alloc_complex) &
       bind(C, name="fftwf_alloc_complex")
       import :: c_size_t, c_ptr
       integer(c_size_t), value :: n
       type(c_ptr) :: f_alloc_complex
    end function fftwf_alloc_complex

    !---------------------------------------------
    ! fftw_free
    !---------------------------------------------
    !>  @brief Frees a buffer previously allocated by any of the allocation functions above.
    !>
    !>  @param[in] p - pointer to the base address of the buffer to be freed.
    subroutine fftw_free(p) &
       bind(C, name="fftw_free")
       import :: c_ptr
       type(c_ptr), value :: p
    end subroutine fftw_free

    !---------------------------------------------
    ! fftwf_free
    !---------------------------------------------
    !>  @brief This function is strictly equivalent to \ref fftw_free
    subroutine fftwf_free(p) &
       bind(C, name="fftwf_free")
       import :: c_ptr
       type(c_ptr), value :: p
    end subroutine fftwf_free

    !---------------------------------------------
    ! fftw_plan_dft_1d
    !---------------------------------------------
    !>  @brief Creates a basic plan for a one-dimensional, double-precision, complex discrete
    !>  Fourier transform of length ``n``.
    !>
    !>  @param[in] n - strictly positive length of the transform;
    !>  @param[in] in - pointer to the input buffer for the transform;
    !>  @param[in] out - pointer to the output buffer for the transform;
    !>  @param[in] sign - exponent sign defining the desired complex transform (``FFTW_FORWARD`` or
    !>  ``FFTW_BACKWARD`` );
    !>  @param[in] flags - bitwise OR (|) combination of zero or more constant flag values.
    !>  @return a valid double-precision hipFFTW plan ready for execution upon success (``nullptr``
    !>  otherwise).
    function fftw_plan_dft_1d(n, in, out, sign, flags) &
       result(plan_dft_1d) &
       bind(C, name="fftw_plan_dft_1d")
       import :: c_int, c_ptr
       integer(c_int), value :: n
       type(c_ptr), value :: in
       type(c_ptr), value :: out
       integer(c_int), value :: sign
       integer(c_int), value :: flags
       type(c_ptr) :: plan_dft_1d
    end function fftw_plan_dft_1d

    !---------------------------------------------
    ! fftwf_plan_dft_1d
    !---------------------------------------------
    !>  @brief Single-precision equivalent of \ref fftw_plan_dft_1d.
    function fftwf_plan_dft_1d(n, in, out, sign, flags) &
       result(f_plan_dft_1d) &
       bind(C, name="fftwf_plan_dft_1d")
       import :: c_int, c_ptr
       integer(c_int), value :: n
       type(c_ptr), value :: in
       type(c_ptr), value :: out
       integer(c_int), value :: sign
       integer(c_int), value :: flags
       type(c_ptr) :: f_plan_dft_1d
    end function fftwf_plan_dft_1d

    !---------------------------------------------
    ! fftw_plan_dft_2d
    !---------------------------------------------
    !>  @brief Creates a basic plan for a two-dimensional, double-precision, complex discrete
    !>  Fourier transform of lengths ``n0 x n1``.
    !>
    !>  @param[in] n0 - , n1 strictly positive lengths of the transform;
    !>  @param[in] in - pointer to the input buffer for the transform;
    !>  @param[in] out - pointer to the output buffer for the transform;
    !>  @param[in] sign - exponent sign defining the desired complex transform (``FFTW_FORWARD`` or
    !>  ``FFTW_BACKWARD`` );
    !>  @param[in] flags - bitwise OR (|) combination of zero or more constant flag values.
    !>  @return a valid double-precision hipFFTW plan ready for execution upon success (``nullptr``
    !>  otherwise).
    function fftw_plan_dft_2d(n0, n1, in, out, sign, flags) &
       result(plan_dft_2d) &
       bind(C, name="fftw_plan_dft_2d")
       import :: c_int, c_ptr
       integer(c_int), value :: n0
       integer(c_int), value :: n1
       type(c_ptr), value :: in
       type(c_ptr), value :: out
       integer(c_int), value :: sign
       integer(c_int), value :: flags
       type(c_ptr) :: plan_dft_2d
    end function fftw_plan_dft_2d

    !---------------------------------------------
    ! fftwf_plan_dft_2d
    !---------------------------------------------
    !>  @brief Single-precision equivalent of \ref fftw_plan_dft_2d.
    function fftwf_plan_dft_2d(n0, n1, in, out, sign, flags) &
       result(f_plan_dft_2d) &
       bind(C, name="fftwf_plan_dft_2d")
       import :: c_int, c_ptr
       integer(c_int), value :: n0
       integer(c_int), value :: n1
       type(c_ptr), value :: in
       type(c_ptr), value :: out
       integer(c_int), value :: sign
       integer(c_int), value :: flags
       type(c_ptr) :: f_plan_dft_2d
    end function fftwf_plan_dft_2d

    !---------------------------------------------
    ! fftw_plan_dft_3d
    !---------------------------------------------
    !>  @brief Creates a basic plan for a three-dimensional, double-precision, complex discrete
    !>  Fourier transform of lengths ``n0 x n1 x n2``.
    !>
    !>  @param[in] n0 - , n1,n2 strictly positive lengths of the transform;
    !>  @param[in] in - pointer to the input buffer for the transform;
    !>  @param[in] out - pointer to the output buffer for the transform;
    !>  @param[in] sign - exponent sign defining the desired complex transform (``FFTW_FORWARD`` or
    !>  ``FFTW_BACKWARD`` );
    !>  @param[in] flags - bitwise OR (|) combination of zero or more constant flag values.
    !>  @return a valid double-precision hipFFTW plan ready for execution upon success (``nullptr``
    !>  otherwise).
    function fftw_plan_dft_3d(n0, n1, n2, in, out, sign, flags) &
       result(plan_dft_3d) &
       bind(C, name="fftw_plan_dft_3d")
       import :: c_int, c_ptr
       integer(c_int), value :: n0
       integer(c_int), value :: n1
       integer(c_int), value :: n2
       type(c_ptr), value :: in
       type(c_ptr), value :: out
       integer(c_int), value :: sign
       integer(c_int), value :: flags
       type(c_ptr) :: plan_dft_3d
    end function fftw_plan_dft_3d

    !---------------------------------------------
    ! fftwf_plan_dft_3d
    !---------------------------------------------
    !>  @brief Single-precision equivalent of \ref fftw_plan_dft_3d.
    function fftwf_plan_dft_3d(n0, n1, n2, in, out, sign, flags) &
       result(f_plan_dft_3d) &
       bind(C, name="fftwf_plan_dft_3d")
       import :: c_int, c_ptr
       integer(c_int), value :: n0
       integer(c_int), value :: n1
       integer(c_int), value :: n2
       type(c_ptr), value :: in
       type(c_ptr), value :: out
       integer(c_int), value :: sign
       integer(c_int), value :: flags
       type(c_ptr) :: f_plan_dft_3d
    end function fftwf_plan_dft_3d

    !---------------------------------------------
    ! fftw_plan_guru_dft
    !---------------------------------------------
    !>  @brief Creates an arbitrary plan for a multidimensional, double-precision, complex
    !>  discrete Fourier transform of lengths dims[0].n x dims[1].n x ... x dims[rank-1].n
    !>  and batch sizes howmany_dims[0].n x howmany_dims[1].n x ... x
    !>  howmany_dims[howmany_rank-1].n.
    !>
    !>  @param[in] rank - strictly positive rank of the transform;
    !>  @param[in] dims - array of ``rank`` ``fftw_iodim`` values;
    !>  @param[in] howmany_rank - strictly positive rank of the transform's batch sizes;
    !>  @param[in] howmany_dims - array of ``howmany_rank`` ``fftw_iodim`` values;
    !>  @param[in] in - pointer to the input buffer for the transform;
    !>  @param[in] out - pointer to the output buffer for the transform;
    !>  @param[in] sign - exponent sign defining the desired complex transform (``FFTW_FORWARD`` or
    !>  ``FFTW_BACKWARD`` );
    !>  @param[in] flags - bitwise OR (|) combination of zero or more constant flag values.
    !>  @return a valid double-precision hipFFTW plan ready for execution upon success (``nullptr``
    !>  otherwise).
    function fftw_plan_guru_dft(rank, dims, howmany_rank, howmany_dims, in, out, sign, flags) &
       result(plan_guru_dft) &
       bind(C, name="fftw_plan_guru_dft")
       import :: c_int, fftw_iodim, c_ptr
       integer(c_int), value :: rank
       type(fftw_iodim) :: dims
       integer(c_int), value :: howmany_rank
       type(fftw_iodim) :: howmany_dims
       type(c_ptr), value :: in
       type(c_ptr), value :: out
       integer(c_int), value :: sign
       integer(c_int), value :: flags
       type(c_ptr) :: plan_guru_dft
    end function fftw_plan_guru_dft

    !---------------------------------------------
    ! fftwf_plan_guru_dft
    !---------------------------------------------
    !>  @brief Single-precision equivalent of \ref fftw_plan_guru_dft.
    function fftwf_plan_guru_dft(rank, dims, howmany_rank, howmany_dims, in, out, sign, flags) &
       result(f_plan_guru_dft) &
       bind(C, name="fftwf_plan_guru_dft")
       import :: c_int, c_ptr
       integer(c_int), value :: rank
       type(c_ptr), value :: dims
       integer(c_int), value :: howmany_rank
       type(c_ptr), value :: howmany_dims
       type(c_ptr), value :: in
       type(c_ptr), value :: out
       integer(c_int), value :: sign
       integer(c_int), value :: flags
       type(c_ptr) :: f_plan_guru_dft
    end function fftwf_plan_guru_dft

    !---------------------------------------------
    ! fftw_plan_guru64_dft
    !---------------------------------------------
    !>  @brief Equivalent of \ref fftw_plan_guru_dft using layout-describing values of type
    !>  ``fftw_iodim64`` instead of ``fftw_iodim``.
    function fftw_plan_guru64_dft(rank, dims, howmany_rank, howmany_dims, in, out, sign, flags) &
       result(plan_guru64_dft) &
       bind(C, name="fftw_plan_guru64_dft")
       import :: c_int, fftw_iodim64, c_ptr
       integer(c_int), value :: rank
       type(fftw_iodim64) :: dims
       integer(c_int), value :: howmany_rank
       type(fftw_iodim64) :: howmany_dims
       type(c_ptr), value :: in
       type(c_ptr), value :: out
       integer(c_int), value :: sign
       integer(c_int), value :: flags
       type(c_ptr) :: plan_guru64_dft
    end function fftw_plan_guru64_dft

    !---------------------------------------------
    ! fftwf_plan_guru64_dft
    !---------------------------------------------
    !>  @brief Equivalent of \ref fftwf_plan_guru_dft using layout-describing values of type
    !>  ``fftwf_iodim64`` instead of ``fftwf_iodim``.
    function fftwf_plan_guru64_dft(rank, dims, howmany_rank, howmany_dims, in, out, sign, flags) &
       result(f_plan_guru64_dft) &
       bind(C, name="fftwf_plan_guru64_dft")
       import :: c_int, c_ptr
       integer(c_int), value :: rank
       type(c_ptr), value :: dims
       integer(c_int), value :: howmany_rank
       type(c_ptr), value :: howmany_dims
       type(c_ptr), value :: in
       type(c_ptr), value :: out
       integer(c_int), value :: sign
       integer(c_int), value :: flags
       type(c_ptr) :: f_plan_guru64_dft
    end function fftwf_plan_guru64_dft

    !---------------------------------------------
    ! fftw_set_timelimit
    !---------------------------------------------
    subroutine fftw_set_timelimit(arg1) &
       bind(C, name="fftw_set_timelimit")
       import :: c_double
       real(c_double), value :: arg1
    end subroutine fftw_set_timelimit

    !---------------------------------------------
    ! fftwf_set_timelimit
    !---------------------------------------------
    subroutine fftwf_set_timelimit(arg1) &
       bind(C, name="fftwf_set_timelimit")
       import :: c_double
       real(c_double), value :: arg1
    end subroutine fftwf_set_timelimit

    !---------------------------------------------
    ! fftw_cleanup
    !---------------------------------------------
    subroutine fftw_cleanup() &
       bind(C, name="fftw_cleanup")
    end subroutine fftw_cleanup

    !---------------------------------------------
    ! fftwf_cleanup
    !---------------------------------------------
    subroutine fftwf_cleanup() &
       bind(C, name="fftwf_cleanup")
    end subroutine fftwf_cleanup

  end interface

  !>  @brief Creates a basic plan for a multidimensional, double-precision, complex discrete Fourier
  !>  transform of lengths n[0] x n[1] x ... x n[rank-1].
  !>
  !>  @param[in] rank - strictly positive rank of the transform;
  !>  @param[in] n - array of strictly positive lengths of the transform (must be of size ``rank``);
  !>  @param[in] in - pointer to the input buffer for the transform;
  !>  @param[in] out - pointer to the output buffer for the transform;
  !>  @param[in] sign - exponent sign defining the desired complex transform (``FFTW_FORWARD`` or
  !>  ``FFTW_BACKWARD`` );
  !>  @param[in] flags - bitwise OR (|) combination of zero or more constant flag values.
  !>  @return a valid double-precision hipFFTW plan ready for execution upon success (``nullptr``
  !>  otherwise).
  interface fftw_plan_dft
    function fftw_plan_dft_(rank,n,in,out,sign,flags) bind(c, name="fftw_plan_dft")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr) :: fftw_plan_dft_
      integer(c_int),value :: rank
      type(c_ptr),value :: n
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: sign
      integer(c_int),value :: flags
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure fftw_plan_dft_assumed_rank
#else
    module procedure &
      fftw_plan_dft_rank_0,&
      fftw_plan_dft_rank_1
#endif
#endif
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_plan_dft.
  interface fftwf_plan_dft
    function fftwf_plan_dft_(rank,n,in,out,sign,flags) bind(c, name="fftwf_plan_dft")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr) :: fftwf_plan_dft_
      integer(c_int),value :: rank
      type(c_ptr),value :: n
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: sign
      integer(c_int),value :: flags
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure fftwf_plan_dft_assumed_rank
#else
    module procedure &
      fftwf_plan_dft_rank_0,&
      fftwf_plan_dft_rank_1
#endif
#endif
  end interface

  !>  @brief Creates a basic plan for a one-dimensional, double-precision, real forward discrete
  !>  Fourier transform of length ``n``.
  !>
  !>  @param[in] n - strictly positive length of the transform;
  !>  @param[in] in - pointer to the input buffer for the transform;
  !>  @param[in] out - pointer to the output buffer for the transform;
  !>  @param[in] flags - bitwise OR (|) combination of zero or more constant flag values.
  !>  @return a valid double-precision hipFFTW plan ready for execution upon success (``nullptr``
  !>  otherwise).
  interface fftw_plan_dft_r2c_1d
    function fftw_plan_dft_r2c_1d_(n,in,out,flags) bind(c, name="fftw_plan_dft_r2c_1d")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr) :: fftw_plan_dft_r2c_1d_
      integer(c_int),value :: n
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure fftw_plan_dft_r2c_1d_assumed_rank
#else
    module procedure &
      fftw_plan_dft_r2c_1d_rank_0,&
      fftw_plan_dft_r2c_1d_rank_1
#endif
#endif
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_plan_dft_r2c_1d.
  interface fftwf_plan_dft_r2c_1d
    function fftwf_plan_dft_r2c_1d_(n,in,out,flags) bind(c, name="fftwf_plan_dft_r2c_1d")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr) :: fftwf_plan_dft_r2c_1d_
      integer(c_int),value :: n
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure fftwf_plan_dft_r2c_1d_assumed_rank
#else
    module procedure &
      fftwf_plan_dft_r2c_1d_rank_0,&
      fftwf_plan_dft_r2c_1d_rank_1
#endif
#endif
  end interface

  !>  @brief Creates a basic plan for a two-dimensional, double-precision, real forward discrete
  !>  Fourier transform of lengths ``n0 x n1``.
  !>
  !>  @param[in] n0 - , n1 strictly positive lengths of the transform;
  !>  @param[in] in - pointer to the input buffer for the transform;
  !>  @param[in] out - pointer to the output buffer for the transform;
  !>  @param[in] flags - bitwise OR (|) combination of zero or more constant flag values.
  !>  @return a valid double-precision hipFFTW plan ready for execution upon success (``nullptr``
  !>  otherwise).
  interface fftw_plan_dft_r2c_2d
    function fftw_plan_dft_r2c_2d_(n0,n1,in,out,flags) bind(c, name="fftw_plan_dft_r2c_2d")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr) :: fftw_plan_dft_r2c_2d_
      integer(c_int),value :: n0
      integer(c_int),value :: n1
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure fftw_plan_dft_r2c_2d_assumed_rank
#else
    module procedure &
      fftw_plan_dft_r2c_2d_rank_0,&
      fftw_plan_dft_r2c_2d_rank_1
#endif
#endif
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_plan_dft_r2c_2d.
  interface fftwf_plan_dft_r2c_2d
    function fftwf_plan_dft_r2c_2d_(n0,n1,in,out,flags) bind(c, name="fftwf_plan_dft_r2c_2d")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr) :: fftwf_plan_dft_r2c_2d_
      integer(c_int),value :: n0
      integer(c_int),value :: n1
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure fftwf_plan_dft_r2c_2d_assumed_rank
#else
    module procedure &
      fftwf_plan_dft_r2c_2d_rank_0,&
      fftwf_plan_dft_r2c_2d_rank_1
#endif
#endif
  end interface

  !>  @brief Creates a basic plan for a three-dimensional, double-precision, real forward discrete
  !>  Fourier transform of lengths ``n0 x n1 x n2``.
  !>
  !>  @param[in] n0 - , n1, n2 strictly positive lengths of the transform;
  !>  @param[in] in - pointer to the input buffer for the transform;
  !>  @param[in] out - pointer to the output buffer for the transform;
  !>  @param[in] flags - bitwise OR (|) combination of zero or more constant flag values.
  !>  @return a valid double-precision hipFFTW plan ready for execution upon success (``nullptr``
  !>  otherwise).
  interface fftw_plan_dft_r2c_3d
    function fftw_plan_dft_r2c_3d_(n0,n1,n2,in,out,flags) bind(c, name="fftw_plan_dft_r2c_3d")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr) :: fftw_plan_dft_r2c_3d_
      integer(c_int),value :: n0
      integer(c_int),value :: n1
      integer(c_int),value :: n2
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure fftw_plan_dft_r2c_3d_assumed_rank
#else
    module procedure &
      fftw_plan_dft_r2c_3d_rank_0,&
      fftw_plan_dft_r2c_3d_rank_1
#endif
#endif
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_plan_dft_r2c_3d.
  interface fftwf_plan_dft_r2c_3d
    function fftwf_plan_dft_r2c_3d_(n0,n1,n2,in,out,flags) bind(c, name="fftwf_plan_dft_r2c_3d")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr) :: fftwf_plan_dft_r2c_3d_
      integer(c_int),value :: n0
      integer(c_int),value :: n1
      integer(c_int),value :: n2
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure fftwf_plan_dft_r2c_3d_assumed_rank
#else
    module procedure &
      fftwf_plan_dft_r2c_3d_rank_0,&
      fftwf_plan_dft_r2c_3d_rank_1
#endif
#endif
  end interface

  !>  @brief Creates a basic plan for a multidimensional, double-precision, real forward discrete
  !>  Fourier transform of lengths n[0] x n[1] x ... x n[rank-1].
  !>
  !>  @param[in] rank - strictly positive rank of the transform;
  !>  @param[in] n - array of strictly positive lengths of the transform (must be of size ``rank``);
  !>  @param[in] in - pointer to the input buffer for the transform;
  !>  @param[in] out - pointer to the output buffer for the transform;
  !>  @param[in] flags - bitwise OR (|) combination of zero or more constant flag values.
  !>  @return a valid double-precision hipFFTW plan ready for execution upon success (``nullptr``
  !>  otherwise).
  interface fftw_plan_dft_r2c
    function fftw_plan_dft_r2c_(rank,n,in,out,flags) bind(c, name="fftw_plan_dft_r2c")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr) :: fftw_plan_dft_r2c_
      integer(c_int),value :: rank
      type(c_ptr),value :: n
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure fftw_plan_dft_r2c_assumed_rank
#else
    module procedure &
      fftw_plan_dft_r2c_rank_0,&
      fftw_plan_dft_r2c_rank_1
#endif
#endif
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_plan_dft_r2c.
  interface fftwf_plan_dft_r2c
    function fftwf_plan_dft_r2c_(rank,n,in,out,flags) bind(c, name="fftwf_plan_dft_r2c")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr) :: fftwf_plan_dft_r2c_
      integer(c_int),value :: rank
      type(c_ptr),value :: n
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure fftwf_plan_dft_r2c_assumed_rank
#else
    module procedure &
      fftwf_plan_dft_r2c_rank_0,&
      fftwf_plan_dft_r2c_rank_1
#endif
#endif
  end interface

  !>  @brief Creates a basic plan for a one-dimensional, double-precision, real backward (inverse)
  !>  discrete Fourier transform of length ``n``.
  !>
  !>  @param[in] n - strictly positive length of the transform;
  !>  @param[in] in - pointer to the input buffer for the transform;
  !>  @param[in] out - pointer to the output buffer for the transform;
  !>  @param[in] flags - bitwise OR (|) combination of zero or more constant flag values.
  !>  @return a valid double-precision hipFFTW plan ready for execution upon success (``nullptr``
  !>  otherwise).
  interface fftw_plan_dft_c2r_1d
    function fftw_plan_dft_c2r_1d_(n,in,out,flags) bind(c, name="fftw_plan_dft_c2r_1d")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr) :: fftw_plan_dft_c2r_1d_
      integer(c_int),value :: n
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure fftw_plan_dft_c2r_1d_assumed_rank
#else
    module procedure &
      fftw_plan_dft_c2r_1d_rank_0,&
      fftw_plan_dft_c2r_1d_rank_1
#endif
#endif
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_plan_dft_c2r_1d.
  interface fftwf_plan_dft_c2r_1d
    function fftwf_plan_dft_c2r_1d_(n,in,out,flags) bind(c, name="fftwf_plan_dft_c2r_1d")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr) :: fftwf_plan_dft_c2r_1d_
      integer(c_int),value :: n
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure fftwf_plan_dft_c2r_1d_assumed_rank
#else
    module procedure &
      fftwf_plan_dft_c2r_1d_rank_0,&
      fftwf_plan_dft_c2r_1d_rank_1
#endif
#endif
  end interface

  !>  @brief Creates a basic plan for a two-dimensional, double-precision, real backward (inverse)
  !>  discrete Fourier transform of lengths ``n0 x n1``.
  !>
  !>  @param[in] n0 - , n1 strictly positive lengths of the transform;
  !>  @param[in] in - pointer to the input buffer for the transform;
  !>  @param[in] out - pointer to the output buffer for the transform;
  !>  @param[in] flags - bitwise OR (|) combination of zero or more constant flag values.
  !>  @return a valid double-precision hipFFTW plan ready for execution upon success (``nullptr``
  !>  otherwise).
  interface fftw_plan_dft_c2r_2d
    function fftw_plan_dft_c2r_2d_(n0,n1,in,out,flags) bind(c, name="fftw_plan_dft_c2r_2d")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr) :: fftw_plan_dft_c2r_2d_
      integer(c_int),value :: n0
      integer(c_int),value :: n1
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure fftw_plan_dft_c2r_2d_assumed_rank
#else
    module procedure &
      fftw_plan_dft_c2r_2d_rank_0,&
      fftw_plan_dft_c2r_2d_rank_1
#endif
#endif
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_plan_dft_c2r_2d.
  interface fftwf_plan_dft_c2r_2d
    function fftwf_plan_dft_c2r_2d_(n0,n1,in,out,flags) bind(c, name="fftwf_plan_dft_c2r_2d")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr) :: fftwf_plan_dft_c2r_2d_
      integer(c_int),value :: n0
      integer(c_int),value :: n1
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure fftwf_plan_dft_c2r_2d_assumed_rank
#else
    module procedure &
      fftwf_plan_dft_c2r_2d_rank_0,&
      fftwf_plan_dft_c2r_2d_rank_1
#endif
#endif
  end interface

  !>  @brief Creates a basic plan for a three-dimensional, double-precision, real backward (inverse)
  !>  discrete Fourier transform of lengths ``n0 x n1 x n2``.
  !>
  !>  @param[in] n0 - , n1, n2 strictly positive lengths of the transform;
  !>  @param[in] in - pointer to the input buffer for the transform;
  !>  @param[in] out - pointer to the output buffer for the transform;
  !>  @param[in] flags - bitwise OR (|) combination of zero or more constant flag values.
  !>  @return a valid double-precision hipFFTW plan ready for execution upon success (``nullptr``
  !>  otherwise).
  interface fftw_plan_dft_c2r_3d
    function fftw_plan_dft_c2r_3d_(n0,n1,n2,in,out,flags) bind(c, name="fftw_plan_dft_c2r_3d")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr) :: fftw_plan_dft_c2r_3d_
      integer(c_int),value :: n0
      integer(c_int),value :: n1
      integer(c_int),value :: n2
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure fftw_plan_dft_c2r_3d_assumed_rank
#else
    module procedure &
      fftw_plan_dft_c2r_3d_rank_0,&
      fftw_plan_dft_c2r_3d_rank_1
#endif
#endif
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_plan_dft_c2r_3d.
  interface fftwf_plan_dft_c2r_3d
    function fftwf_plan_dft_c2r_3d_(n0,n1,n2,in,out,flags) bind(c, name="fftwf_plan_dft_c2r_3d")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr) :: fftwf_plan_dft_c2r_3d_
      integer(c_int),value :: n0
      integer(c_int),value :: n1
      integer(c_int),value :: n2
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure fftwf_plan_dft_c2r_3d_assumed_rank
#else
    module procedure &
      fftwf_plan_dft_c2r_3d_rank_0,&
      fftwf_plan_dft_c2r_3d_rank_1
#endif
#endif
  end interface

  !>  @brief Creates a basic plan for a multidimensional, double-precision, real backward (inverse)
  !>  discrete Fourier transform of lengths n[0] x n[1] x ... x n[rank-1].
  !>
  !>  @param[in] rank - strictly positive rank of the transform;
  !>  @param[in] n - array of strictly positive lengths of the transform (must be of size ``rank``);
  !>  @param[in] in - pointer to the input buffer for the transform;
  !>  @param[in] out - pointer to the output buffer for the transform;
  !>  @param[in] flags - bitwise OR (|) combination of zero or more constant flag values.
  !>  @return a valid double-precision hipFFTW plan ready for execution upon success (``nullptr``
  !>  otherwise).
  interface fftw_plan_dft_c2r
    function fftw_plan_dft_c2r_(rank,n,in,out,flags) bind(c, name="fftw_plan_dft_c2r")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr) :: fftw_plan_dft_c2r_
      integer(c_int),value :: rank
      type(c_ptr),value :: n
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure fftw_plan_dft_c2r_assumed_rank
#else
    module procedure &
      fftw_plan_dft_c2r_rank_0,&
      fftw_plan_dft_c2r_rank_1
#endif
#endif
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_plan_dft_c2r.
  interface fftwf_plan_dft_c2r
    function fftwf_plan_dft_c2r_(rank,n,in,out,flags) bind(c, name="fftwf_plan_dft_c2r")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr) :: fftwf_plan_dft_c2r_
      integer(c_int),value :: rank
      type(c_ptr),value :: n
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure fftwf_plan_dft_c2r_assumed_rank
#else
    module procedure &
      fftwf_plan_dft_c2r_rank_0,&
      fftwf_plan_dft_c2r_rank_1
#endif
#endif
  end interface

  !>  @brief Creates an advanced plan for a multidimensional, double-precision, complex discrete
  !>  Fourier transform
  !>  of lengths n[0] x n[1] x ... x n[rank-1] and batch size ``howmany``.
  !>
  !>  @param[in] rank - strictly positive rank of the transform;
  !>  @param[in] n - array of strictly positive lengths of the transform (must be of size ``rank``);
  !>  @param[in] howmany - strictly positive batch size;
  !>  @param[in] in - pointer to the input buffer for the transform;
  !>  @param[in] inembed - array of strictly positive input-embedding lengths (must be of size
  !>  ``rank`` ). Default input-embedding is considered if set to ``NULL``;
  !>  @param[in] istride - strictly positive elementary stride in input data (along the last
  !>  dimension);
  !>  @param[in] idist - strictly positive distance between consecutive input data sequences in the
  !>  batch;
  !>  @param[in] out - pointer to the output buffer for the transform;
  !>  @param[in] onembed - array of strictly positive output-embedding lengths (must be of size
  !>  ``rank`` ). Default output-embedding is considered if set to ``NULL``;
  !>  @param[in] ostride - strictly positive elementary stride in output data (along the last
  !>  dimension);
  !>  @param[in] odist - strictly positive distance between consecutive output data sequences in the
  !>  batch;
  !>  @param[in] sign - exponent sign defining the desired complex transform (``FFTW_FORWARD`` or
  !>  ``FFTW_BACKWARD`` );
  !>  @param[in] flags - bitwise OR (|) combination of zero or more constant flag values.
  !>  @return a valid double-precision hipFFTW plan ready for execution upon success (``nullptr``
  !>  otherwise).
  interface fftw_plan_many_dft
    function fftw_plan_many_dft_(rank,n,howmany,in,inembed,istride,idist,out,onembed,ostride, &
        odist,sign,flags) &
        bind(c, name="fftw_plan_many_dft")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr) :: fftw_plan_many_dft_
      integer(c_int),value :: rank
      type(c_ptr),value :: n
      integer(c_int),value :: howmany
      type(c_ptr),value :: in
      type(c_ptr),value :: inembed
      integer(c_int),value :: istride
      integer(c_int),value :: idist
      type(c_ptr),value :: out
      type(c_ptr),value :: onembed
      integer(c_int),value :: ostride
      integer(c_int),value :: odist
      integer(c_int),value :: sign
      integer(c_int),value :: flags
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure fftw_plan_many_dft_assumed_rank
#else
    module procedure &
      fftw_plan_many_dft_rank_0,&
      fftw_plan_many_dft_rank_1
#endif
#endif
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_plan_many_dft.
  interface fftwf_plan_many_dft
    function fftwf_plan_many_dft_(rank,n,howmany,in,inembed,istride,idist,out,onembed,ostride, &
        odist,sign,flags) &
        bind(c, name="fftwf_plan_many_dft")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr) :: fftwf_plan_many_dft_
      integer(c_int),value :: rank
      type(c_ptr),value :: n
      integer(c_int),value :: howmany
      type(c_ptr),value :: in
      type(c_ptr),value :: inembed
      integer(c_int),value :: istride
      integer(c_int),value :: idist
      type(c_ptr),value :: out
      type(c_ptr),value :: onembed
      integer(c_int),value :: ostride
      integer(c_int),value :: odist
      integer(c_int),value :: sign
      integer(c_int),value :: flags
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure fftwf_plan_many_dft_assumed_rank
#else
    module procedure &
      fftwf_plan_many_dft_rank_0,&
      fftwf_plan_many_dft_rank_1
#endif
#endif
  end interface

  !>  @brief Creates an advanced plan for a multidimensional, double-precision, real forward
  !>  discrete Fourier
  !>  transform of lengths n[0] x n[1] x ... x n[rank-1] and batch size ``howmany``.
  !>
  !>  @param[in] rank - strictly positive rank of the transform;
  !>  @param[in] n - array of strictly positive lengths of the transform (must be of size ``rank``);
  !>  @param[in] howmany - strictly positive batch size;
  !>  @param[in] in - pointer to the input buffer for the transform;
  !>  @param[in] inembed - array of strictly positive input-embedding lengths (must be of size
  !>  ``rank`` ). Default input-embedding is considered if set to ``NULL``;
  !>  @param[in] istride - strictly positive elementary stride in input data (along the last
  !>  dimension);
  !>  @param[in] idist - strictly positive distance between consecutive input data sequences in the
  !>  batch;
  !>  @param[in] out - pointer to the output buffer for the transform;
  !>  @param[in] onembed - array of strictly positive output-embedding lengths (must be of size
  !>  ``rank`` ). Default output-embedding is considered if set to ``NULL``;
  !>  @param[in] ostride - strictly positive elementary stride in output data (along the last
  !>  dimension);
  !>  @param[in] odist - strictly positive distance between consecutive output data sequences in the
  !>  batch;
  !>  @param[in] flags - bitwise OR (|) combination of zero or more constant flag values.
  !>  @return a valid double-precision hipFFTW plan ready for execution upon success (``nullptr``
  !>  otherwise).
  interface fftw_plan_many_dft_r2c
    function fftw_plan_many_dft_r2c_(rank,n,howmany,in,inembed,istride,idist,out,onembed,ostride, &
        odist,flags) &
        bind(c, name="fftw_plan_many_dft_r2c")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr) :: fftw_plan_many_dft_r2c_
      integer(c_int),value :: rank
      type(c_ptr),value :: n
      integer(c_int),value :: howmany
      type(c_ptr),value :: in
      type(c_ptr),value :: inembed
      integer(c_int),value :: istride
      integer(c_int),value :: idist
      type(c_ptr),value :: out
      type(c_ptr),value :: onembed
      integer(c_int),value :: ostride
      integer(c_int),value :: odist
      integer(c_int),value :: flags
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure fftw_plan_many_dft_r2c_assumed_rank
#else
    module procedure &
      fftw_plan_many_dft_r2c_rank_0,&
      fftw_plan_many_dft_r2c_rank_1
#endif
#endif
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_plan_many_dft_r2c.
  interface fftwf_plan_many_dft_r2c
    function fftwf_plan_many_dft_r2c_(rank,n,howmany,in,inembed,istride,idist,out,onembed,ostride, &
        odist,flags) &
        bind(c, name="fftwf_plan_many_dft_r2c")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr) :: fftwf_plan_many_dft_r2c_
      integer(c_int),value :: rank
      type(c_ptr),value :: n
      integer(c_int),value :: howmany
      type(c_ptr),value :: in
      type(c_ptr),value :: inembed
      integer(c_int),value :: istride
      integer(c_int),value :: idist
      type(c_ptr),value :: out
      type(c_ptr),value :: onembed
      integer(c_int),value :: ostride
      integer(c_int),value :: odist
      integer(c_int),value :: flags
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure fftwf_plan_many_dft_r2c_assumed_rank
#else
    module procedure &
      fftwf_plan_many_dft_r2c_rank_0,&
      fftwf_plan_many_dft_r2c_rank_1
#endif
#endif
  end interface

  !>  @brief Creates an advanced plan for a multidimensional, double-precision, real backward
  !>  (inverse)
  !>  discrete Fourier transform of lengths n[0] x n[1] x ... x n[rank-1] and batch size
  !>  ``howmany``.
  !>
  !>  @param[in] rank - strictly positive rank of the transform;
  !>  @param[in] n - array of strictly positive lengths of the transform (must be of size ``rank``);
  !>  @param[in] howmany - strictly positive batch size;
  !>  @param[in] in - pointer to the input buffer for the transform;
  !>  @param[in] inembed - array of strictly positive input-embedding lengths (must be of size
  !>  ``rank`` ). Default input-embedding is considered if set to ``NULL``;
  !>  @param[in] istride - strictly positive elementary stride in input data (along the last
  !>  dimension);
  !>  @param[in] idist - strictly positive distance between consecutive input data sequences in the
  !>  batch;
  !>  @param[in] out - pointer to the output buffer for the transform;
  !>  @param[in] onembed - array of strictly positive output-embedding lengths (must be of size
  !>  ``rank`` ). Default output-embedding is considered if set to ``NULL``;
  !>  @param[in] ostride - strictly positive elementary stride in output data (along the last
  !>  dimension);
  !>  @param[in] odist - strictly positive distance between consecutive output data sequences in the
  !>  batch;
  !>  @param[in] flags - bitwise OR (|) combination of zero or more constant flag values.
  !>  @return a valid double-precision hipFFTW plan ready for execution upon success (``nullptr``
  !>  otherwise).
  interface fftw_plan_many_dft_c2r
    function fftw_plan_many_dft_c2r_(rank,n,howmany,in,inembed,istride,idist,out,onembed,ostride, &
        odist,flags) &
        bind(c, name="fftw_plan_many_dft_c2r")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr) :: fftw_plan_many_dft_c2r_
      integer(c_int),value :: rank
      type(c_ptr),value :: n
      integer(c_int),value :: howmany
      type(c_ptr),value :: in
      type(c_ptr),value :: inembed
      integer(c_int),value :: istride
      integer(c_int),value :: idist
      type(c_ptr),value :: out
      type(c_ptr),value :: onembed
      integer(c_int),value :: ostride
      integer(c_int),value :: odist
      integer(c_int),value :: flags
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure fftw_plan_many_dft_c2r_assumed_rank
#else
    module procedure &
      fftw_plan_many_dft_c2r_rank_0,&
      fftw_plan_many_dft_c2r_rank_1
#endif
#endif
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_plan_many_dft_c2r.
  interface fftwf_plan_many_dft_c2r
    function fftwf_plan_many_dft_c2r_(rank,n,howmany,in,inembed,istride,idist,out,onembed,ostride, &
        odist,flags) &
        bind(c, name="fftwf_plan_many_dft_c2r")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr) :: fftwf_plan_many_dft_c2r_
      integer(c_int),value :: rank
      type(c_ptr),value :: n
      integer(c_int),value :: howmany
      type(c_ptr),value :: in
      type(c_ptr),value :: inembed
      integer(c_int),value :: istride
      integer(c_int),value :: idist
      type(c_ptr),value :: out
      type(c_ptr),value :: onembed
      integer(c_int),value :: ostride
      integer(c_int),value :: odist
      integer(c_int),value :: flags
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure fftwf_plan_many_dft_c2r_assumed_rank
#else
    module procedure &
      fftwf_plan_many_dft_c2r_rank_0,&
      fftwf_plan_many_dft_c2r_rank_1
#endif
#endif
  end interface

  !>  @brief Creates an arbitrary plan for a multidimensional, double-precision, real forward
  !>  discrete Fourier transform of lengths dims[0].n x dims[1].n x ... x dims[rank-1].n
  !>  and batch sizes howmany_dims[0].n x howmany_dims[1].n x ... x howmany_dims[howmany_rank-1].n.
  !>
  !>  @param[in] rank - strictly positive rank of the transform;
  !>  @param[in] dims - array of ``rank`` ``fftw_iodim`` values;
  !>  @param[in] howmany_rank - strictly positive rank of the transform's batch sizes;
  !>  @param[in] howmany_dims - array of ``howmany_rank`` ``fftw_iodim`` values;
  !>  @param[in] in - pointer to the input buffer for the transform;
  !>  @param[in] out - pointer to the output buffer for the transform;
  !>  @param[in] flags - bitwise OR (|) combination of zero or more constant flag values.
  !>  @return a valid double-precision hipFFTW plan ready for execution upon success (``nullptr``
  !>  otherwise).
  interface fftw_plan_guru_dft_r2c
    function fftw_plan_guru_dft_r2c_(rank,dims,howmany_rank,howmany_dims,in,out,flags) &
        bind(c, name="fftw_plan_guru_dft_r2c")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr) :: fftw_plan_guru_dft_r2c_
      integer(c_int),value :: rank
      type(fftw_iodim) :: dims
      integer(c_int),value :: howmany_rank
      type(fftw_iodim) :: howmany_dims
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure fftw_plan_guru_dft_r2c_assumed_rank
#else
    module procedure &
      fftw_plan_guru_dft_r2c_rank_0,&
      fftw_plan_guru_dft_r2c_rank_1
#endif
#endif
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_plan_guru_dft_r2c.
  interface fftwf_plan_guru_dft_r2c
    function fftwf_plan_guru_dft_r2c_(rank,dims,howmany_rank,howmany_dims,in,out,flags) &
        bind(c, name="fftwf_plan_guru_dft_r2c")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr) :: fftwf_plan_guru_dft_r2c_
      integer(c_int),value :: rank
      type(c_ptr),value :: dims
      integer(c_int),value :: howmany_rank
      type(c_ptr),value :: howmany_dims
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure fftwf_plan_guru_dft_r2c_assumed_rank
#else
    module procedure &
      fftwf_plan_guru_dft_r2c_rank_0,&
      fftwf_plan_guru_dft_r2c_rank_1
#endif
#endif
  end interface

  !>  @brief Creates an arbitrary plan for a multidimensional, double-precision, real backward
  !>  (inverse) discrete Fourier transform of lengths dims[0].n x dims[1].n x ... x dims[rank-1].n
  !>  and batch sizes howmany_dims[0].n x howmany_dims[1].n x ... x howmany_dims[howmany_rank-1].n.
  !>
  !>  @param[in] rank - strictly positive rank of the transform;
  !>  @param[in] dims - array of ``rank`` ``fftw_iodim`` values;
  !>  @param[in] howmany_rank - strictly positive rank of the transform's batch sizes;
  !>  @param[in] howmany_dims - array of ``howmany_rank`` ``fftw_iodim`` values;
  !>  @param[in] in - pointer to the input buffer for the transform;
  !>  @param[in] out - pointer to the output buffer for the transform;
  !>  @param[in] flags - bitwise OR (|) combination of zero or more constant flag values.
  !>  @return a valid double-precision hipFFTW plan ready for execution upon success (``nullptr``
  !>  otherwise).
  interface fftw_plan_guru_dft_c2r
    function fftw_plan_guru_dft_c2r_(rank,dims,howmany_rank,howmany_dims,in,out,flags) &
        bind(c, name="fftw_plan_guru_dft_c2r")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr) :: fftw_plan_guru_dft_c2r_
      integer(c_int),value :: rank
      type(fftw_iodim) :: dims
      integer(c_int),value :: howmany_rank
      type(fftw_iodim) :: howmany_dims
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure fftw_plan_guru_dft_c2r_assumed_rank
#else
    module procedure &
      fftw_plan_guru_dft_c2r_rank_0,&
      fftw_plan_guru_dft_c2r_rank_1
#endif
#endif
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_plan_guru_dft_c2r.
  interface fftwf_plan_guru_dft_c2r
    function fftwf_plan_guru_dft_c2r_(rank,dims,howmany_rank,howmany_dims,in,out,flags) &
        bind(c, name="fftwf_plan_guru_dft_c2r")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr) :: fftwf_plan_guru_dft_c2r_
      integer(c_int),value :: rank
      type(c_ptr),value :: dims
      integer(c_int),value :: howmany_rank
      type(c_ptr),value :: howmany_dims
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure fftwf_plan_guru_dft_c2r_assumed_rank
#else
    module procedure &
      fftwf_plan_guru_dft_c2r_rank_0,&
      fftwf_plan_guru_dft_c2r_rank_1
#endif
#endif
  end interface

  !>  @brief Equivalent of \ref fftw_plan_guru_dft_r2c using layout-describing values of type
  !>  ``fftw_iodim64`` instead of ``fftw_iodim``.
  interface fftw_plan_guru64_dft_r2c
    function fftw_plan_guru64_dft_r2c_(rank,dims,howmany_rank,howmany_dims,in,out,flags) &
        bind(c, name="fftw_plan_guru64_dft_r2c")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr) :: fftw_plan_guru64_dft_r2c_
      integer(c_int),value :: rank
      type(fftw_iodim64) :: dims
      integer(c_int),value :: howmany_rank
      type(fftw_iodim64) :: howmany_dims
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure fftw_plan_guru64_dft_r2c_assumed_rank
#else
    module procedure &
      fftw_plan_guru64_dft_r2c_rank_0,&
      fftw_plan_guru64_dft_r2c_rank_1
#endif
#endif
  end interface

  !>  @brief Equivalent of \ref fftwf_plan_guru_dft_r2c using layout-describing values of type
  !>  ``fftwf_iodim64`` instead of ``fftwf_iodim``.
  interface fftwf_plan_guru64_dft_r2c
    function fftwf_plan_guru64_dft_r2c_(rank,dims,howmany_rank,howmany_dims,in,out,flags) &
        bind(c, name="fftwf_plan_guru64_dft_r2c")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr) :: fftwf_plan_guru64_dft_r2c_
      integer(c_int),value :: rank
      type(c_ptr),value :: dims
      integer(c_int),value :: howmany_rank
      type(c_ptr),value :: howmany_dims
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure fftwf_plan_guru64_dft_r2c_assumed_rank
#else
    module procedure &
      fftwf_plan_guru64_dft_r2c_rank_0,&
      fftwf_plan_guru64_dft_r2c_rank_1
#endif
#endif
  end interface

  !>  @brief Equivalent of \ref fftw_plan_guru_dft_c2r using layout-describing values of type
  !>  ``fftw_iodim64`` instead of ``fftw_iodim``.
  interface fftw_plan_guru64_dft_c2r
    function fftw_plan_guru64_dft_c2r_(rank,dims,howmany_rank,howmany_dims,in,out,flags) &
        bind(c, name="fftw_plan_guru64_dft_c2r")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr) :: fftw_plan_guru64_dft_c2r_
      integer(c_int),value :: rank
      type(fftw_iodim64) :: dims
      integer(c_int),value :: howmany_rank
      type(fftw_iodim64) :: howmany_dims
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure fftw_plan_guru64_dft_c2r_assumed_rank
#else
    module procedure &
      fftw_plan_guru64_dft_c2r_rank_0,&
      fftw_plan_guru64_dft_c2r_rank_1
#endif
#endif
  end interface

  !>  @brief Equivalent of \ref fftwf_plan_guru_dft_c2r using layout-describing values of type
  !>  ``fftwf_iodim64`` instead of ``fftwf_iodim``.
  interface fftwf_plan_guru64_dft_c2r
    function fftwf_plan_guru64_dft_c2r_(rank,dims,howmany_rank,howmany_dims,in,out,flags) &
        bind(c, name="fftwf_plan_guru64_dft_c2r")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr) :: fftwf_plan_guru64_dft_c2r_
      integer(c_int),value :: rank
      type(c_ptr),value :: dims
      integer(c_int),value :: howmany_rank
      type(c_ptr),value :: howmany_dims
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure fftwf_plan_guru64_dft_c2r_assumed_rank
#else
    module procedure &
      fftwf_plan_guru64_dft_c2r_rank_0,&
      fftwf_plan_guru64_dft_c2r_rank_1
#endif
#endif
  end interface

  !>  @brief Computes the discrete Fourier transform that a double-precision plan captures using
  !>  the input and output data buffers that were communicated at plan's creation.
  !>
  !>  @param[in] plan - the double-precision plan capturing the transform to compute.
  interface fftw_execute
    subroutine fftw_execute_(plan) bind(c, name="fftw_execute")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr),value :: plan
    end subroutine

#ifdef USE_FPOINTER_INTERFACES
    module procedure fftw_execute_typed
#endif
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_execute
  interface fftwf_execute
    subroutine fftwf_execute_(plan) bind(c, name="fftwf_execute")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr),value :: plan
    end subroutine

#ifdef USE_FPOINTER_INTERFACES
    module procedure fftwf_execute_typed
#endif
  end interface

  !>  @brief Computes the discrete Fourier transform that a double-precision plan captures using new
  !>  input and output data buffers.
  !>  The plan must have been created for a complex transform.
  !>
  !>  @param[in] plan - the double-precision plan capturing the complex transform to compute;
  !>  @param[in] in - pointer to a new input buffer for the transform;
  !>  @param[out] out - pointer to a new output buffer for the transform.
  interface fftw_execute_dft
    subroutine fftw_execute_dft_(plan,in,out) bind(c, name="fftw_execute_dft")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr),value :: plan
      type(c_ptr),value :: in
      type(c_ptr),value :: out
    end subroutine

#ifdef USE_FPOINTER_INTERFACES
    module procedure fftw_execute_dft_typed
#endif
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_execute_dft.
  interface fftwf_execute_dft
    subroutine fftwf_execute_dft_(plan,in,out) bind(c, name="fftwf_execute_dft")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr),value :: plan
      type(c_ptr),value :: in
      type(c_ptr),value :: out
    end subroutine

#ifdef USE_FPOINTER_INTERFACES
    module procedure fftwf_execute_dft_typed
#endif
  end interface

  !>  @brief Computes the discrete Fourier transform that a double-precision plan captures using new
  !>  input and output data buffers.
  !>  The plan must have been created for a real forward transform.
  !>
  !>  @param[in] plan - the double-precision plan capturing the real forward transform to compute;
  !>  @param[in] in - pointer to a new input buffer for the transform;
  !>  @param[out] out - pointer to a new output buffer for the transform.
  interface fftw_execute_dft_r2c
    subroutine fftw_execute_dft_r2c_(plan,in,out) bind(c, name="fftw_execute_dft_r2c")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr),value :: plan
      type(c_ptr),value :: in
      type(c_ptr),value :: out
    end subroutine

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      fftw_execute_dft_r2c_assumed_rank,&
      fftw_execute_dft_r2c_assumed_rank_cptr,&
      fftw_execute_dft_r2c_typed
#else
    module procedure &
      fftw_execute_dft_r2c_rank_0,&
      fftw_execute_dft_r2c_rank_0_cptr,&
      fftw_execute_dft_r2c_rank_1,&
      fftw_execute_dft_r2c_rank_1_cptr,&
      fftw_execute_dft_r2c_typed
#endif
#endif
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_execute_dft_r2c.
  interface fftwf_execute_dft_r2c
    subroutine fftwf_execute_dft_r2c_(plan,in,out) bind(c, name="fftwf_execute_dft_r2c")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr),value :: plan
      type(c_ptr),value :: in
      type(c_ptr),value :: out
    end subroutine

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      fftwf_execute_dft_r2c_assumed_rank,&
      fftwf_execute_dft_r2c_assumed_rank_cptr,&
      fftwf_execute_dft_r2c_typed
#else
    module procedure &
      fftwf_execute_dft_r2c_rank_0,&
      fftwf_execute_dft_r2c_rank_0_cptr,&
      fftwf_execute_dft_r2c_rank_1,&
      fftwf_execute_dft_r2c_rank_1_cptr,&
      fftwf_execute_dft_r2c_typed
#endif
#endif
  end interface

  !>  @brief Computes the discrete Fourier transform that a double-precision plan captures using new
  !>  input and output data buffers.
  !>  The plan must have been created for a real backward (inverse) transform.
  !>
  !>  @param[in] plan - the double-precision plan capturing the real backward (inverse) transform to
  !>  compute;
  !>  @param[in] in - pointer to a new input buffer for the transform;
  !>  @param[out] out - pointer to a new output buffer for the transform.
  interface fftw_execute_dft_c2r
    subroutine fftw_execute_dft_c2r_(plan,in,out) bind(c, name="fftw_execute_dft_c2r")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr),value :: plan
      type(c_ptr),value :: in
      type(c_ptr),value :: out
    end subroutine

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      fftw_execute_dft_c2r_assumed_rank,&
      fftw_execute_dft_c2r_assumed_rank_cptr,&
      fftw_execute_dft_c2r_typed
#else
    module procedure &
      fftw_execute_dft_c2r_rank_0,&
      fftw_execute_dft_c2r_rank_0_cptr,&
      fftw_execute_dft_c2r_rank_1,&
      fftw_execute_dft_c2r_rank_1_cptr,&
      fftw_execute_dft_c2r_typed
#endif
#endif
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_execute_dft_c2r.
  interface fftwf_execute_dft_c2r
    subroutine fftwf_execute_dft_c2r_(plan,in,out) bind(c, name="fftwf_execute_dft_c2r")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr),value :: plan
      type(c_ptr),value :: in
      type(c_ptr),value :: out
    end subroutine

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      fftwf_execute_dft_c2r_assumed_rank,&
      fftwf_execute_dft_c2r_assumed_rank_cptr,&
      fftwf_execute_dft_c2r_typed
#else
    module procedure &
      fftwf_execute_dft_c2r_rank_0,&
      fftwf_execute_dft_c2r_rank_0_cptr,&
      fftwf_execute_dft_c2r_rank_1,&
      fftwf_execute_dft_c2r_rank_1_cptr,&
      fftwf_execute_dft_c2r_typed
#endif
#endif
  end interface

  !>  @brief Deallocates a double-precision plan and frees all its resources.
  !>
  !>  @param[in] plan - plan to be destroyed.
  interface fftw_destroy_plan
    subroutine fftw_destroy_plan_(plan) bind(c, name="fftw_destroy_plan")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr),value :: plan
    end subroutine

#ifdef USE_FPOINTER_INTERFACES
    module procedure fftw_destroy_plan_typed
#endif
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_destroy_plan.
  interface fftwf_destroy_plan
    subroutine fftwf_destroy_plan_(plan) bind(c, name="fftwf_destroy_plan")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr),value :: plan
    end subroutine

#ifdef USE_FPOINTER_INTERFACES
    module procedure fftwf_destroy_plan_typed
#endif
  end interface

  interface fftw_print_plan
    subroutine fftw_print_plan_(arg1) bind(c, name="fftw_print_plan")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr),value :: arg1
    end subroutine

#ifdef USE_FPOINTER_INTERFACES
    module procedure fftw_print_plan_typed
#endif
  end interface

  interface fftwf_print_plan
    subroutine fftwf_print_plan_(arg1) bind(c, name="fftwf_print_plan")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr),value :: arg1
    end subroutine

#ifdef USE_FPOINTER_INTERFACES
    module procedure fftwf_print_plan_typed
#endif
  end interface

  interface fftw_cost
    function fftw_cost_(arg1) bind(c, name="fftw_cost")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      real(c_double) :: fftw_cost_
      type(c_ptr),value :: arg1
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure fftw_cost_typed
#endif
  end interface

  interface fftwf_cost
    function fftwf_cost_(arg1) bind(c, name="fftwf_cost")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      real(c_double) :: fftwf_cost_
      type(c_ptr),value :: arg1
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure fftwf_cost_typed
#endif
  end interface

  interface fftw_flops
    subroutine fftw_flops_(arg1,arg2,arg3,arg4) bind(c, name="fftw_flops")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr),value :: arg1
      type(c_ptr),value :: arg2
      type(c_ptr),value :: arg3
      type(c_ptr),value :: arg4
    end subroutine

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      fftw_flops_assumed_rank,&
      fftw_flops_assumed_rank_cptr,&
      fftw_flops_typed
#else
    module procedure &
      fftw_flops_rank_0,&
      fftw_flops_rank_0_cptr,&
      fftw_flops_rank_1,&
      fftw_flops_rank_1_cptr,&
      fftw_flops_typed
#endif
#endif
  end interface

  interface fftwf_flops
    subroutine fftwf_flops_(arg1,arg2,arg3,arg4) bind(c, name="fftwf_flops")
      use iso_c_binding
      use hipfort_hipfftw_enums
      implicit none
      type(c_ptr),value :: arg1
      type(c_ptr),value :: arg2
      type(c_ptr),value :: arg3
      type(c_ptr),value :: arg4
    end subroutine

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      fftwf_flops_assumed_rank,&
      fftwf_flops_assumed_rank_cptr,&
      fftwf_flops_typed
#else
    module procedure &
      fftwf_flops_rank_0,&
      fftwf_flops_rank_0_cptr,&
      fftwf_flops_rank_1,&
      fftwf_flops_rank_1_cptr,&
      fftwf_flops_typed
#endif
#endif
  end interface

