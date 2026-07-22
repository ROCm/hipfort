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

module hipfort_hipfftw
  use hipfort_hipfftw_enums
  use hipfort_hipfftw_types
  implicit none

  !>  @brief Allocates a data buffer accessible by the host.
  !>  @param[in] n - number of bytes desired for the buffer.
  !>  @return a pointer to the base address of the allocated memory block upon success (``nullptr``
  !>  otherwise).
  !>
  !>  @remark The returned base address is at least 64-bit aligned.
  interface fftw_malloc
    function fftw_malloc_(n) bind(c, name="fftw_malloc")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr) :: fftw_malloc_
      integer(c_size_t),value :: n
    end function
  end interface

  !>  @brief This function is strictly equivalent to \ref fftw_malloc
  interface fftwf_malloc
    function fftwf_malloc_(n) bind(c, name="fftwf_malloc")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr) :: fftwf_malloc_
      integer(c_size_t),value :: n
    end function
  end interface

  !>  @brief This function is strictly equivalent to ``(double*) fftw_malloc(n * sizeof(double))``
  interface fftw_alloc_real
    function fftw_alloc_real_(n) bind(c, name="fftw_alloc_real")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      real(c_double) :: fftw_alloc_real_
      integer(c_size_t),value :: n
    end function
  end interface

  !>  @brief This function is strictly equivalent to ``(float*) fftw_malloc(n * sizeof(float))``
  interface fftwf_alloc_real
    function fftwf_alloc_real_(n) bind(c, name="fftwf_alloc_real")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      real(c_float) :: fftwf_alloc_real_
      integer(c_size_t),value :: n
    end function
  end interface

  !>  @brief This function is strictly equivalent to
  !>  ``(fftw_complex*) fftw_malloc(n * sizeof(fftw_complex))``
  interface fftw_alloc_complex
    function fftw_alloc_complex_(n) bind(c, name="fftw_alloc_complex")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr) :: fftw_alloc_complex_
      integer(c_size_t),value :: n
    end function
  end interface

  !>  @brief This function is strictly equivalent to
  !>  ``(fftwf_complex*) fftw_malloc(n * sizeof(fftwf_complex))``
  interface fftwf_alloc_complex
    function fftwf_alloc_complex_(n) bind(c, name="fftwf_alloc_complex")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr) :: fftwf_alloc_complex_
      integer(c_size_t),value :: n
    end function
  end interface

  !>  @brief Frees a buffer previously allocated by any of the allocation functions above.
  !>
  !>  @param[in] p - pointer to the base address of the buffer to be freed.
  interface fftw_free
    subroutine fftw_free_(p) bind(c, name="fftw_free")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr),value :: p
    end subroutine
  end interface

  !>  @brief This function is strictly equivalent to \ref fftw_free
  interface fftwf_free
    subroutine fftwf_free_(p) bind(c, name="fftwf_free")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr),value :: p
    end subroutine
  end interface

  !>  @brief Creates a basic plan for a one-dimensional, double-precision, complex discrete Fourier
  !>  transform of length ``n``.
  !>
  !>  @param[in] n - strictly positive length of the transform;
  !>  @param[in] in - pointer to the input buffer for the transform;
  !>  @param[in] out - pointer to the output buffer for the transform;
  !>  @param[in] sign - exponent sign defining the desired complex transform (``FFTW_FORWARD`` or
  !>  ``FFTW_BACKWARD`` );
  !>  @param[in] flags - bitwise OR (``|``) combination of zero or more constant flag values.
  !>  @return a valid double-precision hipFFTW plan ready for execution upon success (``nullptr``
  !>  otherwise).
  interface fftw_plan_dft_1d
    function fftw_plan_dft_1d_(n,in,out,sign,flags) bind(c, name="fftw_plan_dft_1d")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr) :: fftw_plan_dft_1d_
      integer(c_int),value :: n
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: sign
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_plan_dft_1d.
  interface fftwf_plan_dft_1d
    function fftwf_plan_dft_1d_(n,in,out,sign,flags) bind(c, name="fftwf_plan_dft_1d")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr) :: fftwf_plan_dft_1d_
      integer(c_int),value :: n
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: sign
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Creates a basic plan for a two-dimensional, double-precision, complex discrete Fourier
  !>  transform of lengths ``n0 x n1``.
  !>
  !>  @param[in] n0 - , n1 strictly positive lengths of the transform;
  !>  @param[in] in - pointer to the input buffer for the transform;
  !>  @param[in] out - pointer to the output buffer for the transform;
  !>  @param[in] sign - exponent sign defining the desired complex transform (``FFTW_FORWARD`` or
  !>  ``FFTW_BACKWARD`` );
  !>  @param[in] flags - bitwise OR (``|``) combination of zero or more constant flag values.
  !>  @return a valid double-precision hipFFTW plan ready for execution upon success (``nullptr``
  !>  otherwise).
  interface fftw_plan_dft_2d
    function fftw_plan_dft_2d_(n0,n1,in,out,sign,flags) bind(c, name="fftw_plan_dft_2d")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr) :: fftw_plan_dft_2d_
      integer(c_int),value :: n0
      integer(c_int),value :: n1
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: sign
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_plan_dft_2d.
  interface fftwf_plan_dft_2d
    function fftwf_plan_dft_2d_(n0,n1,in,out,sign,flags) bind(c, name="fftwf_plan_dft_2d")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr) :: fftwf_plan_dft_2d_
      integer(c_int),value :: n0
      integer(c_int),value :: n1
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: sign
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Creates a basic plan for a three-dimensional, double-precision, complex discrete
  !>  Fourier transform of lengths ``n0 x n1 x n2``.
  !>
  !>  @param[in] n0 - , n1,n2 strictly positive lengths of the transform;
  !>  @param[in] in - pointer to the input buffer for the transform;
  !>  @param[in] out - pointer to the output buffer for the transform;
  !>  @param[in] sign - exponent sign defining the desired complex transform (``FFTW_FORWARD`` or
  !>  ``FFTW_BACKWARD`` );
  !>  @param[in] flags - bitwise OR (``|``) combination of zero or more constant flag values.
  !>  @return a valid double-precision hipFFTW plan ready for execution upon success (``nullptr``
  !>  otherwise).
  interface fftw_plan_dft_3d
    function fftw_plan_dft_3d_(n0,n1,n2,in,out,sign,flags) bind(c, name="fftw_plan_dft_3d")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr) :: fftw_plan_dft_3d_
      integer(c_int),value :: n0
      integer(c_int),value :: n1
      integer(c_int),value :: n2
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: sign
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_plan_dft_3d.
  interface fftwf_plan_dft_3d
    function fftwf_plan_dft_3d_(n0,n1,n2,in,out,sign,flags) bind(c, name="fftwf_plan_dft_3d")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr) :: fftwf_plan_dft_3d_
      integer(c_int),value :: n0
      integer(c_int),value :: n1
      integer(c_int),value :: n2
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: sign
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Creates a basic plan for a multidimensional, double-precision, complex discrete Fourier
  !>  transform of lengths ``n[0] x n[1] x ... x n[rank-1]``.
  !>
  !>  @param[in] rank - strictly positive rank of the transform;
  !>  @param[in] n - array of strictly positive lengths of the transform (must be of size ``rank``);
  !>  @param[in] in - pointer to the input buffer for the transform;
  !>  @param[in] out - pointer to the output buffer for the transform;
  !>  @param[in] sign - exponent sign defining the desired complex transform (``FFTW_FORWARD`` or
  !>  ``FFTW_BACKWARD`` );
  !>  @param[in] flags - bitwise OR (``|``) combination of zero or more constant flag values.
  !>  @return a valid double-precision hipFFTW plan ready for execution upon success (``nullptr``
  !>  otherwise).
  interface fftw_plan_dft
    function fftw_plan_dft_(rank,n,in,out,sign,flags) bind(c, name="fftw_plan_dft")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr) :: fftw_plan_dft_
      integer(c_int),value :: rank
      type(c_ptr),value :: n
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: sign
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_plan_dft.
  interface fftwf_plan_dft
    function fftwf_plan_dft_(rank,n,in,out,sign,flags) bind(c, name="fftwf_plan_dft")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr) :: fftwf_plan_dft_
      integer(c_int),value :: rank
      type(c_ptr),value :: n
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: sign
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Creates a basic plan for a one-dimensional, double-precision, real forward discrete
  !>  Fourier transform of length ``n``.
  !>
  !>  @param[in] n - strictly positive length of the transform;
  !>  @param[in] in - pointer to the input buffer for the transform;
  !>  @param[in] out - pointer to the output buffer for the transform;
  !>  @param[in] flags - bitwise OR (``|``) combination of zero or more constant flag values.
  !>  @return a valid double-precision hipFFTW plan ready for execution upon success (``nullptr``
  !>  otherwise).
  interface fftw_plan_dft_r2c_1d
    function fftw_plan_dft_r2c_1d_(n,in,out,flags) bind(c, name="fftw_plan_dft_r2c_1d")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr) :: fftw_plan_dft_r2c_1d_
      integer(c_int),value :: n
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_plan_dft_r2c_1d.
  interface fftwf_plan_dft_r2c_1d
    function fftwf_plan_dft_r2c_1d_(n,in,out,flags) bind(c, name="fftwf_plan_dft_r2c_1d")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr) :: fftwf_plan_dft_r2c_1d_
      integer(c_int),value :: n
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Creates a basic plan for a two-dimensional, double-precision, real forward discrete
  !>  Fourier transform of lengths ``n0 x n1``.
  !>
  !>  @param[in] n0 - , n1 strictly positive lengths of the transform;
  !>  @param[in] in - pointer to the input buffer for the transform;
  !>  @param[in] out - pointer to the output buffer for the transform;
  !>  @param[in] flags - bitwise OR (``|``) combination of zero or more constant flag values.
  !>  @return a valid double-precision hipFFTW plan ready for execution upon success (``nullptr``
  !>  otherwise).
  interface fftw_plan_dft_r2c_2d
    function fftw_plan_dft_r2c_2d_(n0,n1,in,out,flags) bind(c, name="fftw_plan_dft_r2c_2d")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr) :: fftw_plan_dft_r2c_2d_
      integer(c_int),value :: n0
      integer(c_int),value :: n1
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_plan_dft_r2c_2d.
  interface fftwf_plan_dft_r2c_2d
    function fftwf_plan_dft_r2c_2d_(n0,n1,in,out,flags) bind(c, name="fftwf_plan_dft_r2c_2d")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr) :: fftwf_plan_dft_r2c_2d_
      integer(c_int),value :: n0
      integer(c_int),value :: n1
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Creates a basic plan for a three-dimensional, double-precision, real forward discrete
  !>  Fourier transform of lengths ``n0 x n1 x n2``.
  !>
  !>  @param[in] n0 - , n1, n2 strictly positive lengths of the transform;
  !>  @param[in] in - pointer to the input buffer for the transform;
  !>  @param[in] out - pointer to the output buffer for the transform;
  !>  @param[in] flags - bitwise OR (``|``) combination of zero or more constant flag values.
  !>  @return a valid double-precision hipFFTW plan ready for execution upon success (``nullptr``
  !>  otherwise).
  interface fftw_plan_dft_r2c_3d
    function fftw_plan_dft_r2c_3d_(n0,n1,n2,in,out,flags) bind(c, name="fftw_plan_dft_r2c_3d")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr) :: fftw_plan_dft_r2c_3d_
      integer(c_int),value :: n0
      integer(c_int),value :: n1
      integer(c_int),value :: n2
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_plan_dft_r2c_3d.
  interface fftwf_plan_dft_r2c_3d
    function fftwf_plan_dft_r2c_3d_(n0,n1,n2,in,out,flags) bind(c, name="fftwf_plan_dft_r2c_3d")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr) :: fftwf_plan_dft_r2c_3d_
      integer(c_int),value :: n0
      integer(c_int),value :: n1
      integer(c_int),value :: n2
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Creates a basic plan for a multidimensional, double-precision, real forward discrete
  !>  Fourier transform of lengths ``n[0] x n[1] x ... x n[rank-1]``.
  !>
  !>  @param[in] rank - strictly positive rank of the transform;
  !>  @param[in] n - array of strictly positive lengths of the transform (must be of size ``rank``);
  !>  @param[in] in - pointer to the input buffer for the transform;
  !>  @param[in] out - pointer to the output buffer for the transform;
  !>  @param[in] flags - bitwise OR (``|``) combination of zero or more constant flag values.
  !>  @return a valid double-precision hipFFTW plan ready for execution upon success (``nullptr``
  !>  otherwise).
  interface fftw_plan_dft_r2c
    function fftw_plan_dft_r2c_(rank,n,in,out,flags) bind(c, name="fftw_plan_dft_r2c")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr) :: fftw_plan_dft_r2c_
      integer(c_int),value :: rank
      type(c_ptr),value :: n
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_plan_dft_r2c.
  interface fftwf_plan_dft_r2c
    function fftwf_plan_dft_r2c_(rank,n,in,out,flags) bind(c, name="fftwf_plan_dft_r2c")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr) :: fftwf_plan_dft_r2c_
      integer(c_int),value :: rank
      type(c_ptr),value :: n
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Creates a basic plan for a one-dimensional, double-precision, real backward (inverse)
  !>  discrete Fourier transform of length ``n``.
  !>
  !>  @param[in] n - strictly positive length of the transform;
  !>  @param[in] in - pointer to the input buffer for the transform;
  !>  @param[in] out - pointer to the output buffer for the transform;
  !>  @param[in] flags - bitwise OR (``|``) combination of zero or more constant flag values.
  !>  @return a valid double-precision hipFFTW plan ready for execution upon success (``nullptr``
  !>  otherwise).
  interface fftw_plan_dft_c2r_1d
    function fftw_plan_dft_c2r_1d_(n,in,out,flags) bind(c, name="fftw_plan_dft_c2r_1d")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr) :: fftw_plan_dft_c2r_1d_
      integer(c_int),value :: n
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_plan_dft_c2r_1d.
  interface fftwf_plan_dft_c2r_1d
    function fftwf_plan_dft_c2r_1d_(n,in,out,flags) bind(c, name="fftwf_plan_dft_c2r_1d")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr) :: fftwf_plan_dft_c2r_1d_
      integer(c_int),value :: n
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Creates a basic plan for a two-dimensional, double-precision, real backward (inverse)
  !>  discrete Fourier transform of lengths ``n0 x n1``.
  !>
  !>  @param[in] n0 - , n1 strictly positive lengths of the transform;
  !>  @param[in] in - pointer to the input buffer for the transform;
  !>  @param[in] out - pointer to the output buffer for the transform;
  !>  @param[in] flags - bitwise OR (``|``) combination of zero or more constant flag values.
  !>  @return a valid double-precision hipFFTW plan ready for execution upon success (``nullptr``
  !>  otherwise).
  interface fftw_plan_dft_c2r_2d
    function fftw_plan_dft_c2r_2d_(n0,n1,in,out,flags) bind(c, name="fftw_plan_dft_c2r_2d")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr) :: fftw_plan_dft_c2r_2d_
      integer(c_int),value :: n0
      integer(c_int),value :: n1
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_plan_dft_c2r_2d.
  interface fftwf_plan_dft_c2r_2d
    function fftwf_plan_dft_c2r_2d_(n0,n1,in,out,flags) bind(c, name="fftwf_plan_dft_c2r_2d")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr) :: fftwf_plan_dft_c2r_2d_
      integer(c_int),value :: n0
      integer(c_int),value :: n1
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Creates a basic plan for a three-dimensional, double-precision, real backward (inverse)
  !>  discrete Fourier transform of lengths ``n0 x n1 x n2``.
  !>
  !>  @param[in] n0 - , n1, n2 strictly positive lengths of the transform;
  !>  @param[in] in - pointer to the input buffer for the transform;
  !>  @param[in] out - pointer to the output buffer for the transform;
  !>  @param[in] flags - bitwise OR (``|``) combination of zero or more constant flag values.
  !>  @return a valid double-precision hipFFTW plan ready for execution upon success (``nullptr``
  !>  otherwise).
  interface fftw_plan_dft_c2r_3d
    function fftw_plan_dft_c2r_3d_(n0,n1,n2,in,out,flags) bind(c, name="fftw_plan_dft_c2r_3d")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr) :: fftw_plan_dft_c2r_3d_
      integer(c_int),value :: n0
      integer(c_int),value :: n1
      integer(c_int),value :: n2
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_plan_dft_c2r_3d.
  interface fftwf_plan_dft_c2r_3d
    function fftwf_plan_dft_c2r_3d_(n0,n1,n2,in,out,flags) bind(c, name="fftwf_plan_dft_c2r_3d")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr) :: fftwf_plan_dft_c2r_3d_
      integer(c_int),value :: n0
      integer(c_int),value :: n1
      integer(c_int),value :: n2
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Creates a basic plan for a multidimensional, double-precision, real backward (inverse)
  !>  discrete Fourier transform of lengths ``n[0] x n[1] x ... x n[rank-1]``.
  !>
  !>  @param[in] rank - strictly positive rank of the transform;
  !>  @param[in] n - array of strictly positive lengths of the transform (must be of size ``rank``);
  !>  @param[in] in - pointer to the input buffer for the transform;
  !>  @param[in] out - pointer to the output buffer for the transform;
  !>  @param[in] flags - bitwise OR (``|``) combination of zero or more constant flag values.
  !>  @return a valid double-precision hipFFTW plan ready for execution upon success (``nullptr``
  !>  otherwise).
  interface fftw_plan_dft_c2r
    function fftw_plan_dft_c2r_(rank,n,in,out,flags) bind(c, name="fftw_plan_dft_c2r")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr) :: fftw_plan_dft_c2r_
      integer(c_int),value :: rank
      type(c_ptr),value :: n
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_plan_dft_c2r.
  interface fftwf_plan_dft_c2r
    function fftwf_plan_dft_c2r_(rank,n,in,out,flags) bind(c, name="fftwf_plan_dft_c2r")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr) :: fftwf_plan_dft_c2r_
      integer(c_int),value :: rank
      type(c_ptr),value :: n
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Creates an advanced plan for a multidimensional, double-precision, complex discrete
  !>  Fourier transform
  !>  of lengths ``n[0] x n[1] x ... x n[rank-1]`` and batch size ``howmany``.
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
  !>  @param[in] flags - bitwise OR (``|``) combination of zero or more constant flag values.
  !>  @return a valid double-precision hipFFTW plan ready for execution upon success (``nullptr``
  !>  otherwise).
  interface fftw_plan_many_dft
    function fftw_plan_many_dft_(rank,n,howmany,in,inembed,istride,idist,out,onembed,ostride,odist,sign,flags) bind(c, name="fftw_plan_many_dft")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
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
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_plan_many_dft.
  interface fftwf_plan_many_dft
    function fftwf_plan_many_dft_(rank,n,howmany,in,inembed,istride,idist,out,onembed,ostride,odist,sign,flags) bind(c, name="fftwf_plan_many_dft")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
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
  end interface

  !>  @brief Creates an advanced plan for a multidimensional, double-precision, real forward
  !>  discrete Fourier
  !>  transform of lengths ``n[0] x n[1] x ... x n[rank-1]`` and batch size ``howmany``.
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
  !>  @param[in] flags - bitwise OR (``|``) combination of zero or more constant flag values.
  !>  @return a valid double-precision hipFFTW plan ready for execution upon success (``nullptr``
  !>  otherwise).
  interface fftw_plan_many_dft_r2c
    function fftw_plan_many_dft_r2c_(rank,n,howmany,in,inembed,istride,idist,out,onembed,ostride,odist,flags) bind(c, name="fftw_plan_many_dft_r2c")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
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
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_plan_many_dft_r2c.
  interface fftwf_plan_many_dft_r2c
    function fftwf_plan_many_dft_r2c_(rank,n,howmany,in,inembed,istride,idist,out,onembed,ostride,odist,flags) bind(c, name="fftwf_plan_many_dft_r2c")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
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
  end interface

  !>  @brief Creates an advanced plan for a multidimensional, double-precision, real backward
  !>  (inverse)
  !>  discrete Fourier transform of lengths ``n[0] x n[1] x ... x n[rank-1]`` and batch size
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
  !>  @param[in] flags - bitwise OR (``|``) combination of zero or more constant flag values.
  !>  @return a valid double-precision hipFFTW plan ready for execution upon success (``nullptr``
  !>  otherwise).
  interface fftw_plan_many_dft_c2r
    function fftw_plan_many_dft_c2r_(rank,n,howmany,in,inembed,istride,idist,out,onembed,ostride,odist,flags) bind(c, name="fftw_plan_many_dft_c2r")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
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
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_plan_many_dft_c2r.
  interface fftwf_plan_many_dft_c2r
    function fftwf_plan_many_dft_c2r_(rank,n,howmany,in,inembed,istride,idist,out,onembed,ostride,odist,flags) bind(c, name="fftwf_plan_many_dft_c2r")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
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
  end interface

  !>  @brief Creates an arbitrary plan for a multidimensional, double-precision, complex
  !>  discrete Fourier transform of lengths ``dims[0].n x dims[1].n x ... x dims[rank-1].n``
  !>  and batch sizes
  !>  ``howmany_dims[0].n x howmany_dims[1].n x ... x howmany_dims[howmany_rank-1].n``.
  !>
  !>  @param[in] rank - strictly positive rank of the transform;
  !>  @param[in] dims - array of ``rank`` ``fftw_iodim`` values;
  !>  @param[in] howmany_rank - strictly positive rank of the transform's batch sizes;
  !>  @param[in] howmany_dims - array of ``howmany_rank`` ``fftw_iodim`` values;
  !>  @param[in] in - pointer to the input buffer for the transform;
  !>  @param[in] out - pointer to the output buffer for the transform;
  !>  @param[in] sign - exponent sign defining the desired complex transform (``FFTW_FORWARD`` or
  !>  ``FFTW_BACKWARD`` );
  !>  @param[in] flags - bitwise OR (``|``) combination of zero or more constant flag values.
  !>  @return a valid double-precision hipFFTW plan ready for execution upon success (``nullptr``
  !>  otherwise).
  interface fftw_plan_guru_dft
    function fftw_plan_guru_dft_(rank,dims,howmany_rank,howmany_dims,in,out,sign,flags) bind(c, name="fftw_plan_guru_dft")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr) :: fftw_plan_guru_dft_
      integer(c_int),value :: rank
      type(fftw_iodim) :: dims
      integer(c_int),value :: howmany_rank
      type(fftw_iodim) :: howmany_dims
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: sign
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_plan_guru_dft.
  interface fftwf_plan_guru_dft
    function fftwf_plan_guru_dft_(rank,dims,howmany_rank,howmany_dims,in,out,sign,flags) bind(c, name="fftwf_plan_guru_dft")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr) :: fftwf_plan_guru_dft_
      integer(c_int),value :: rank
      type(c_ptr),value :: dims
      integer(c_int),value :: howmany_rank
      type(c_ptr),value :: howmany_dims
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: sign
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Creates an arbitrary plan for a multidimensional, double-precision, real forward
  !>  discrete Fourier transform of lengths ``dims[0].n x dims[1].n x ... x dims[rank-1].n``
  !>  and batch sizes
  !>  ``howmany_dims[0].n x howmany_dims[1].n x ... x howmany_dims[howmany_rank-1].n``.
  !>
  !>  @param[in] rank - strictly positive rank of the transform;
  !>  @param[in] dims - array of ``rank`` ``fftw_iodim`` values;
  !>  @param[in] howmany_rank - strictly positive rank of the transform's batch sizes;
  !>  @param[in] howmany_dims - array of ``howmany_rank`` ``fftw_iodim`` values;
  !>  @param[in] in - pointer to the input buffer for the transform;
  !>  @param[in] out - pointer to the output buffer for the transform;
  !>  @param[in] flags - bitwise OR (``|``) combination of zero or more constant flag values.
  !>  @return a valid double-precision hipFFTW plan ready for execution upon success (``nullptr``
  !>  otherwise).
  interface fftw_plan_guru_dft_r2c
    function fftw_plan_guru_dft_r2c_(rank,dims,howmany_rank,howmany_dims,in,out,flags) bind(c, name="fftw_plan_guru_dft_r2c")
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
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_plan_guru_dft_r2c.
  interface fftwf_plan_guru_dft_r2c
    function fftwf_plan_guru_dft_r2c_(rank,dims,howmany_rank,howmany_dims,in,out,flags) bind(c, name="fftwf_plan_guru_dft_r2c")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
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
  end interface

  !>  @brief Creates an arbitrary plan for a multidimensional, double-precision, real backward
  !>  (inverse) discrete Fourier transform of lengths
  !>  ``dims[0].n x dims[1].n x ... x dims[rank-1].n``
  !>  and batch sizes
  !>  ``howmany_dims[0].n x howmany_dims[1].n x ... x howmany_dims[howmany_rank-1].n``.
  !>
  !>  @param[in] rank - strictly positive rank of the transform;
  !>  @param[in] dims - array of ``rank`` ``fftw_iodim`` values;
  !>  @param[in] howmany_rank - strictly positive rank of the transform's batch sizes;
  !>  @param[in] howmany_dims - array of ``howmany_rank`` ``fftw_iodim`` values;
  !>  @param[in] in - pointer to the input buffer for the transform;
  !>  @param[in] out - pointer to the output buffer for the transform;
  !>  @param[in] flags - bitwise OR (``|``) combination of zero or more constant flag values.
  !>  @return a valid double-precision hipFFTW plan ready for execution upon success (``nullptr``
  !>  otherwise).
  interface fftw_plan_guru_dft_c2r
    function fftw_plan_guru_dft_c2r_(rank,dims,howmany_rank,howmany_dims,in,out,flags) bind(c, name="fftw_plan_guru_dft_c2r")
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
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_plan_guru_dft_c2r.
  interface fftwf_plan_guru_dft_c2r
    function fftwf_plan_guru_dft_c2r_(rank,dims,howmany_rank,howmany_dims,in,out,flags) bind(c, name="fftwf_plan_guru_dft_c2r")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
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
  end interface

  !>  @brief Equivalent of \ref fftw_plan_guru_dft using layout-describing values of type
  !>  ``fftw_iodim64`` instead of ``fftw_iodim``.
  interface fftw_plan_guru64_dft
    function fftw_plan_guru64_dft_(rank,dims,howmany_rank,howmany_dims,in,out,sign,flags) bind(c, name="fftw_plan_guru64_dft")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr) :: fftw_plan_guru64_dft_
      integer(c_int),value :: rank
      type(fftw_iodim64) :: dims
      integer(c_int),value :: howmany_rank
      type(fftw_iodim64) :: howmany_dims
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: sign
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Equivalent of \ref fftwf_plan_guru_dft using layout-describing values of type
  !>  ``fftwf_iodim64`` instead of ``fftwf_iodim``.
  interface fftwf_plan_guru64_dft
    function fftwf_plan_guru64_dft_(rank,dims,howmany_rank,howmany_dims,in,out,sign,flags) bind(c, name="fftwf_plan_guru64_dft")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr) :: fftwf_plan_guru64_dft_
      integer(c_int),value :: rank
      type(c_ptr),value :: dims
      integer(c_int),value :: howmany_rank
      type(c_ptr),value :: howmany_dims
      type(c_ptr),value :: in
      type(c_ptr),value :: out
      integer(c_int),value :: sign
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief Equivalent of \ref fftw_plan_guru_dft_r2c using layout-describing values of type
  !>  ``fftw_iodim64`` instead of ``fftw_iodim``.
  interface fftw_plan_guru64_dft_r2c
    function fftw_plan_guru64_dft_r2c_(rank,dims,howmany_rank,howmany_dims,in,out,flags) bind(c, name="fftw_plan_guru64_dft_r2c")
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
  end interface

  !>  @brief Equivalent of \ref fftwf_plan_guru_dft_r2c using layout-describing values of type
  !>  ``fftwf_iodim64`` instead of ``fftwf_iodim``.
  interface fftwf_plan_guru64_dft_r2c
    function fftwf_plan_guru64_dft_r2c_(rank,dims,howmany_rank,howmany_dims,in,out,flags) bind(c, name="fftwf_plan_guru64_dft_r2c")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
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
  end interface

  !>  @brief Equivalent of \ref fftw_plan_guru_dft_c2r using layout-describing values of type
  !>  ``fftw_iodim64`` instead of ``fftw_iodim``.
  interface fftw_plan_guru64_dft_c2r
    function fftw_plan_guru64_dft_c2r_(rank,dims,howmany_rank,howmany_dims,in,out,flags) bind(c, name="fftw_plan_guru64_dft_c2r")
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
  end interface

  !>  @brief Equivalent of \ref fftwf_plan_guru_dft_c2r using layout-describing values of type
  !>  ``fftwf_iodim64`` instead of ``fftwf_iodim``.
  interface fftwf_plan_guru64_dft_c2r
    function fftwf_plan_guru64_dft_c2r_(rank,dims,howmany_rank,howmany_dims,in,out,flags) bind(c, name="fftwf_plan_guru64_dft_c2r")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
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
  end interface

  !>  @brief Computes the discrete Fourier transform that a double-precision plan captures using
  !>  the input and output data buffers that were communicated at plan's creation.
  !>
  !>  @param[in] plan - the double-precision plan capturing the transform to compute.
  interface fftw_execute
    subroutine fftw_execute_(plan) bind(c, name="fftw_execute")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr),value :: plan
    end subroutine
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_execute
  interface fftwf_execute
    subroutine fftwf_execute_(plan) bind(c, name="fftwf_execute")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr),value :: plan
    end subroutine
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
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr),value :: plan
      type(c_ptr),value :: in
      type(c_ptr),value :: out
    end subroutine
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_execute_dft.
  interface fftwf_execute_dft
    subroutine fftwf_execute_dft_(plan,in,out) bind(c, name="fftwf_execute_dft")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr),value :: plan
      type(c_ptr),value :: in
      type(c_ptr),value :: out
    end subroutine
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
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr),value :: plan
      type(c_ptr),value :: in
      type(c_ptr),value :: out
    end subroutine
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_execute_dft_r2c.
  interface fftwf_execute_dft_r2c
    subroutine fftwf_execute_dft_r2c_(plan,in,out) bind(c, name="fftwf_execute_dft_r2c")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr),value :: plan
      type(c_ptr),value :: in
      type(c_ptr),value :: out
    end subroutine
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
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr),value :: plan
      type(c_ptr),value :: in
      type(c_ptr),value :: out
    end subroutine
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_execute_dft_c2r.
  interface fftwf_execute_dft_c2r
    subroutine fftwf_execute_dft_c2r_(plan,in,out) bind(c, name="fftwf_execute_dft_c2r")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr),value :: plan
      type(c_ptr),value :: in
      type(c_ptr),value :: out
    end subroutine
  end interface

  !>  @brief Deallocates a double-precision plan and frees all its resources.
  !>
  !>  @param[in] plan - plan to be destroyed.
  interface fftw_destroy_plan
    subroutine fftw_destroy_plan_(plan) bind(c, name="fftw_destroy_plan")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr),value :: plan
    end subroutine
  end interface

  !>  @brief Single-precision equivalent of \ref fftw_destroy_plan.
  interface fftwf_destroy_plan
    subroutine fftwf_destroy_plan_(plan) bind(c, name="fftwf_destroy_plan")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr),value :: plan
    end subroutine
  end interface

  interface fftw_print_plan
    subroutine fftw_print_plan_(arg1) bind(c, name="fftw_print_plan")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr),value :: arg1
    end subroutine
  end interface

  interface fftwf_print_plan
    subroutine fftwf_print_plan_(arg1) bind(c, name="fftwf_print_plan")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr),value :: arg1
    end subroutine
  end interface

  interface fftw_set_timelimit
    subroutine fftw_set_timelimit_(arg1) bind(c, name="fftw_set_timelimit")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      real(c_double),value :: arg1
    end subroutine
  end interface

  interface fftwf_set_timelimit
    subroutine fftwf_set_timelimit_(arg1) bind(c, name="fftwf_set_timelimit")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      real(c_double),value :: arg1
    end subroutine
  end interface

  interface fftw_cost
    function fftw_cost_(arg1) bind(c, name="fftw_cost")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      real(c_double) :: fftw_cost_
      type(c_ptr),value :: arg1
    end function
  end interface

  interface fftwf_cost
    function fftwf_cost_(arg1) bind(c, name="fftwf_cost")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      real(c_double) :: fftwf_cost_
      type(c_ptr),value :: arg1
    end function
  end interface

  interface fftw_flops
    subroutine fftw_flops_(arg1,arg2,arg3,arg4) bind(c, name="fftw_flops")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr),value :: arg1
      type(c_ptr),value :: arg2
      type(c_ptr),value :: arg3
      type(c_ptr),value :: arg4
    end subroutine
  end interface

  interface fftwf_flops
    subroutine fftwf_flops_(arg1,arg2,arg3,arg4) bind(c, name="fftwf_flops")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
      type(c_ptr),value :: arg1
      type(c_ptr),value :: arg2
      type(c_ptr),value :: arg3
      type(c_ptr),value :: arg4
    end subroutine
  end interface

  interface fftw_cleanup
    subroutine fftw_cleanup_() bind(c, name="fftw_cleanup")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
    end subroutine
  end interface

  interface fftwf_cleanup
    subroutine fftwf_cleanup_() bind(c, name="fftwf_cleanup")
      use iso_c_binding
      use hipfort_hipfftw_enums
      use hipfort_hipfftw_types
      implicit none
    end subroutine
  end interface

end module hipfort_hipfftw
