! ==============================================================================
! hipfort: FORTRAN Interfaces for GPU kernels
! ==============================================================================
! Copyright (c) 2020-2022 Advanced Micro Devices, Inc. All rights reserved.
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
  use, intrinsic :: iso_c_binding
  implicit none
  private
  
  ! ============================================================================
  ! Public API
  ! ============================================================================
  
  ! FFTW flags
  public :: FFTW_FORWARD, FFTW_BACKWARD
  public :: FFTW_MEASURE, FFTW_DESTROY_INPUT, FFTW_UNALIGNED, FFTW_CONSERVE_MEMORY
  public :: FFTW_EXHAUSTIVE, FFTW_PRESERVE_INPUT, FFTW_PATIENT, FFTW_ESTIMATE
  
  ! FFTW Legacy interface - Double Precision
  public :: dfftw_plan_dft_1d, dfftw_plan_dft_2d, dfftw_plan_dft_3d, dfftw_plan_dft
  public :: dfftw_plan_dft_r2c_1d, dfftw_plan_dft_r2c_2d, dfftw_plan_dft_r2c_3d, dfftw_plan_dft_r2c
  public :: dfftw_plan_dft_c2r_1d, dfftw_plan_dft_c2r_2d, dfftw_plan_dft_c2r_3d, dfftw_plan_dft_c2r
  public :: dfftw_execute, dfftw_execute_dft, dfftw_execute_dft_r2c, dfftw_execute_dft_c2r
  public :: dfftw_destroy_plan, dfftw_print_plan

  !============================================================================
  ! FFTW flags
  !============================================================================
  ! Direction of transformation
  integer(c_int), parameter :: FFTW_FORWARD = -1
  integer(c_int), parameter :: FFTW_BACKWARD = 1
  
  ! Planner flags set individual bits. Flags can be combined via a bitwise "OR", i.e. `IOR`.
  integer(c_int), parameter :: FFTW_MEASURE         =  0
  integer(c_int), parameter :: FFTW_DESTROY_INPUT   =  1
  integer(c_int), parameter :: FFTW_UNALIGNED       =  2
  integer(c_int), parameter :: FFTW_CONSERVE_MEMORY =  4
  integer(c_int), parameter :: FFTW_EXHAUSTIVE      =  8
  integer(c_int), parameter :: FFTW_PRESERVE_INPUT  = 16
  integer(c_int), parameter :: FFTW_PATIENT         = 32
  integer(c_int), parameter :: FFTW_ESTIMATE        = 64
  
  !============================================================================
  ! C2C: Complex-to-Complex Transforms
  !============================================================================

  !>  @brief C interface: Create a 1D complex-to-complex FFT plan.
  !>
  !>   @details Allocates and initializes a 1D complex-to-complex FFT plan.
  !>
  !>   @param[in] n Length of the transform.
  !>   @param[in] in Input array.
  !>   @param[in] out Output array.
  !>   @param[in] sign Sign of the exponent in the formula that defines the Fourier transform.
  !>   @param[in] flags FFTW planner flags.
  !>   @return Handle to the FFT plan.
  interface
    function fftw_plan_dft_1d_(n, in, out, sign, flags) bind(c, name="fftw_plan_dft_1d")
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_dft_1d_
      integer(c_int), value :: n
      type(c_ptr), value :: in
      type(c_ptr), value :: out
      integer(c_int), value :: sign
      integer(c_int), value :: flags
    end function fftw_plan_dft_1d_
  end interface

  !>  @brief C interface: Create a 2D complex-to-complex FFT plan.
  !>
  !>   @details Allocates and initializes a 2D complex-to-complex FFT plan.
  !>
  !>   @param[in] n0 Length of the transform in the first dimension.
  !>   @param[in] n1 Length of the transform in the second dimension.
  !>   @param[in] in Input array.
  !>   @param[in] out Output array.
  !>   @param[in] sign Sign of the exponent in the formula that defines the Fourier transform.
  !>   @param[in] flags FFTW planner flags.
  !>   @return Handle to the FFT plan.
  interface
    function fftw_plan_dft_2d_(n0, n1, in, out, sign, flags) bind(c, name="fftw_plan_dft_2d")
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_dft_2d_
      integer(c_int), value :: n0
      integer(c_int), value :: n1
      type(c_ptr), value :: in
      type(c_ptr), value :: out
      integer(c_int), value :: sign
      integer(c_int), value :: flags
    end function fftw_plan_dft_2d_
  end interface

  !>  @brief C interface: Create a 3D complex-to-complex FFT plan.
  !>
  !>   @details Allocates and initializes a 3D complex-to-complex FFT plan.
  !>
  !>   @param[in] n0 Length of the transform in the first dimension.
  !>   @param[in] n1 Length of the transform in the second dimension.
  !>   @param[in] n2 Length of the transform in the third dimension.
  !>   @param[in] in Input array.
  !>   @param[in] out Output array.
  !>   @param[in] sign Sign of the exponent in the formula that defines the Fourier transform.
  !>   @param[in] flags FFTW planner flags.
  !>   @return Handle to the FFT plan.
  interface
    function fftw_plan_dft_3d_(n0, n1, n2, in, out, sign, flags) bind(c, name="fftw_plan_dft_3d")
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_dft_3d_
      integer(c_int), value :: n0
      integer(c_int), value :: n1
      integer(c_int), value :: n2
      type(c_ptr), value :: in
      type(c_ptr), value :: out
      integer(c_int), value :: sign
      integer(c_int), value :: flags
    end function fftw_plan_dft_3d_
  end interface

  !>  @brief C interface: Create a general N-dimensional complex-to-complex FFT plan.
  !>
  !>   @details Allocates and initializes an N-dimensional complex-to-complex FFT plan.
  !>
  !>   @param[in] rank Number of dimensions.
  !>   @param[in] n Array of dimensions.
  !>   @param[in] in Input array.
  !>   @param[in] out Output array.
  !>   @param[in] sign Sign of the exponent in the formula that defines the Fourier transform.
  !>   @param[in] flags FFTW planner flags.
  !>   @return Handle to the FFT plan.
  interface
    function fftw_plan_dft_(rank, n, in, out, sign, flags) bind(c, name="fftw_plan_dft")
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_dft_
      integer(c_int), value :: rank
      type(c_ptr), value :: n
      type(c_ptr), value :: in
      type(c_ptr), value :: out
      integer(c_int), value :: sign
      integer(c_int), value :: flags
    end function fftw_plan_dft_
  end interface

  !============================================================================
  ! R2C: Real-to-Complex Transforms
  !============================================================================

  !>  @brief C interface: Create a 1D real-to-complex FFT plan.
  !>
  !>   @details Allocates and initializes a 1D real-to-complex FFT plan.
  !>
  !>   @param[in] n Length of the transform.
  !>   @param[in] in Real input array.
  !>   @param[in] out Complex output array.
  !>   @param[in] flags FFTW planner flags.
  !>   @return Handle to the FFT plan.
  interface
    function fftw_plan_dft_r2c_1d_(n, in, out, flags) bind(c, name="fftw_plan_dft_r2c_1d")
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_dft_r2c_1d_
      integer(c_int), value :: n
      type(c_ptr), value :: in
      type(c_ptr), value :: out
      integer(c_int), value :: flags
    end function fftw_plan_dft_r2c_1d_
  end interface

  !>  @brief C interface: Create a 2D real-to-complex FFT plan.
  !>
  !>   @details Allocates and initializes a 2D real-to-complex FFT plan.
  !>
  !>   @param[in] n0 Length of the transform in the first dimension.
  !>   @param[in] n1 Length of the transform in the second dimension.
  !>   @param[in] in Real input array.
  !>   @param[in] out Complex output array.
  !>   @param[in] flags FFTW planner flags.
  !>   @return Handle to the FFT plan.
  interface
    function fftw_plan_dft_r2c_2d_(n0, n1, in, out, flags) bind(c, name="fftw_plan_dft_r2c_2d")
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_dft_r2c_2d_
      integer(c_int), value :: n0
      integer(c_int), value :: n1
      type(c_ptr), value :: in
      type(c_ptr), value :: out
      integer(c_int), value :: flags
    end function fftw_plan_dft_r2c_2d_
  end interface

  !>  @brief C interface: Create a 3D real-to-complex FFT plan.
  !>
  !>   @details Allocates and initializes a 3D real-to-complex FFT plan.
  !>
  !>   @param[in] n0 Length of the transform in the first dimension.
  !>   @param[in] n1 Length of the transform in the second dimension.
  !>   @param[in] n2 Length of the transform in the third dimension.
  !>   @param[in] in Real input array.
  !>   @param[in] out Complex output array.
  !>   @param[in] flags FFTW planner flags.
  !>   @return Handle to the FFT plan.
  interface
    function fftw_plan_dft_r2c_3d_(n0, n1, n2, in, out, flags) bind(c, name="fftw_plan_dft_r2c_3d")
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_dft_r2c_3d_
      integer(c_int), value :: n0
      integer(c_int), value :: n1
      integer(c_int), value :: n2
      type(c_ptr), value :: in
      type(c_ptr), value :: out
      integer(c_int), value :: flags
    end function fftw_plan_dft_r2c_3d_
  end interface

  !>  @brief C interface: Create a general N-dimensional real-to-complex FFT plan.
  !>
  !>   @details Allocates and initializes an N-dimensional real-to-complex FFT plan.
  !>
  !>   @param[in] rank Number of dimensions.
  !>   @param[in] n Array of dimensions.
  !>   @param[in] in Real input array.
  !>   @param[in] out Complex output array.
  !>   @param[in] flags FFTW planner flags.
  !>   @return Handle to the FFT plan.
  interface
    function fftw_plan_dft_r2c_(rank, n, in, out, flags) bind(c, name="fftw_plan_dft_r2c")
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_dft_r2c_
      integer(c_int), value :: rank
      type(c_ptr), value :: n
      type(c_ptr), value :: in
      type(c_ptr), value :: out
      integer(c_int), value :: flags
    end function fftw_plan_dft_r2c_
  end interface

  !============================================================================
  ! C2R: Complex-to-Real Transforms
  !============================================================================

  !>  @brief C interface: Create a 1D complex-to-real FFT plan.
  !>
  !>   @details Allocates and initializes a 1D complex-to-real FFT plan.
  !>
  !>   @param[in] n Length of the transform.
  !>   @param[in] in Complex input array.
  !>   @param[in] out Real output array.
  !>   @param[in] flags FFTW planner flags.
  !>   @return Handle to the FFT plan.
  interface
    function fftw_plan_dft_c2r_1d_(n, in, out, flags) bind(c, name="fftw_plan_dft_c2r_1d")
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_dft_c2r_1d_
      integer(c_int), value :: n
      type(c_ptr), value :: in
      type(c_ptr), value :: out
      integer(c_int), value :: flags
    end function fftw_plan_dft_c2r_1d_
  end interface

  !>  @brief C interface: Create a 2D complex-to-real FFT plan.
  !>
  !>   @details Allocates and initializes a 2D complex-to-real FFT plan.
  !>
  !>   @param[in] n0 Length of the transform in the first dimension.
  !>   @param[in] n1 Length of the transform in the second dimension.
  !>   @param[in] in Complex input array.
  !>   @param[in] out Real output array.
  !>   @param[in] flags FFTW planner flags.
  !>   @return Handle to the FFT plan.
  interface
    function fftw_plan_dft_c2r_2d_(n0, n1, in, out, flags) bind(c, name="fftw_plan_dft_c2r_2d")
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_dft_c2r_2d_
      integer(c_int), value :: n0
      integer(c_int), value :: n1
      type(c_ptr), value :: in
      type(c_ptr), value :: out
      integer(c_int), value :: flags
    end function fftw_plan_dft_c2r_2d_
  end interface

  !>  @brief C interface: Create a 3D complex-to-real FFT plan.
  !>
  !>   @details Allocates and initializes a 3D complex-to-real FFT plan.
  !>
  !>   @param[in] n0 Length of the transform in the first dimension.
  !>   @param[in] n1 Length of the transform in the second dimension.
  !>   @param[in] n2 Length of the transform in the third dimension.
  !>   @param[in] in Complex input array.
  !>   @param[in] out Real output array.
  !>   @param[in] flags FFTW planner flags.
  !>   @return Handle to the FFT plan.
  interface
    function fftw_plan_dft_c2r_3d_(n0, n1, n2, in, out, flags) bind(c, name="fftw_plan_dft_c2r_3d")
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_dft_c2r_3d_
      integer(c_int), value :: n0
      integer(c_int), value :: n1
      integer(c_int), value :: n2
      type(c_ptr), value :: in
      type(c_ptr), value :: out
      integer(c_int), value :: flags
    end function fftw_plan_dft_c2r_3d_
  end interface

  !>  @brief C interface: Create a general N-dimensional complex-to-real FFT plan.
  !>
  !>   @details Allocates and initializes an N-dimensional complex-to-real FFT plan.
  !>
  !>   @param[in] rank Number of dimensions.
  !>   @param[in] n Array of dimensions.
  !>   @param[in] in Complex input array.
  !>   @param[in] out Real output array.
  !>   @param[in] flags FFTW planner flags.
  !>   @return Handle to the FFT plan.
  interface
    function fftw_plan_dft_c2r_(rank, n, in, out, flags) bind(c, name="fftw_plan_dft_c2r")
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr) :: fftw_plan_dft_c2r_
      integer(c_int), value :: rank
      type(c_ptr), value :: n
      type(c_ptr), value :: in
      type(c_ptr), value :: out
      integer(c_int), value :: flags
    end function fftw_plan_dft_c2r_
  end interface

  !============================================================================
  ! Plan Execution
  !============================================================================

  !>  @brief C interface: Execute an FFT plan.
  !>
  !>   @details Executes an FFT plan using the arrays with which the plan was created.
  !>
  !>   @param[in] plan Handle to the FFT plan.
  interface
    subroutine fftw_execute_(plan) bind(c, name="fftw_execute")
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: plan
    end subroutine fftw_execute_
  end interface

  !>  @brief C interface: Execute a complex-to-complex FFT plan with new arrays.
  !>
  !>   @details Executes a complex-to-complex FFT plan on the provided input and output arrays.
  !>
  !>   @param[in] plan Handle to the FFT plan.
  !>   @param[in] in Input array.
  !>   @param[out] out Output array.
  interface
    subroutine fftw_execute_dft_(plan, in, out) bind(c, name="fftw_execute_dft")
      use, intrinsic :: iso_c_binding
      implicit none
      type(c_ptr), value :: plan
      type(c_ptr), value :: in
      type(c_ptr), value :: out
    end subroutine fftw_execute_dft_
  end interface

  !>  @brief C interface: Execute a real-to-complex FFT plan with new arrays.
  !>
  !>   @details Executes a real-to-complex FFT plan on the provided input and output arrays.
  !>
  !>   @param[in] plan Handle to the FFT plan.
  !>   @param[in] in Real input array.
  !>   @param[out] out Complex output array.
  interface
    subroutine fftw_execute_dft_r2c_(plan, in, out) bind(c, name="fftw_execute_dft_r2c")
    use, intrinsic :: iso_c_binding
    implicit none
    type(c_ptr), value :: plan
    type(c_ptr), value :: in
    type(c_ptr), value :: out
    end subroutine fftw_execute_dft_r2c_
  end interface

  !>  @brief C interface: Execute a complex-to-real FFT plan with new arrays.
  !>
  !>   @details Executes a complex-to-real FFT plan on the provided input and output arrays.
  !>
  !>   @param[in] plan Handle to the FFT plan.
  !>   @param[in] in Complex input array.
  !>   @param[out] out Real output array.
  interface
    subroutine fftw_execute_dft_c2r_(plan, in, out) bind(c, name="fftw_execute_dft_c2r")
    use, intrinsic :: iso_c_binding
    implicit none
    type(c_ptr), value :: plan
    type(c_ptr), value :: in
    type(c_ptr), value :: out
    end subroutine fftw_execute_dft_c2r_
  end interface

  !============================================================================
  ! Plan Management
  !============================================================================

  !>  @brief C interface: Destroy an FFT plan.
  !>
  !>   @details Deallocates resources associated with an FFT plan.
  !>
  !>   @param[in] plan Handle to the FFT plan to destroy.
  interface
    subroutine fftw_destroy_plan_(plan) bind(c, name="fftw_destroy_plan")
    use, intrinsic :: iso_c_binding
    implicit none
    type(c_ptr), value :: plan
    end subroutine fftw_destroy_plan_
  end interface

  !============================================================================
  ! Utility Functions
  !============================================================================

  !>  @brief C interface: Print information about an FFT plan.
  !>
  !>   @details Prints detailed information about the specified FFT plan.
  !>            For compatibility only - no-op in this implementation.
  !>
  !>   @param[in] plan Handle to the FFT plan.
  interface
    subroutine fftw_print_plan_(plan) bind(c, name="fftw_print_plan")
    use, intrinsic :: iso_c_binding
    implicit none
    type(c_ptr), value :: plan
    end subroutine fftw_print_plan_
  end interface

  contains

  !============================================================================
  ! C2C: Complex-to-Complex Transforms
  !============================================================================

  !>  @brief Create a 1D complex-to-complex FFT plan (Legacy).
  !>
  !>   @details Allocates and initializes a 1D complex-to-complex FFT plan.
  !>
  !>   @param[out] plan Handle of the FFT plan.
  !>   @param[in] n Length of the transform.
  !>   @param[in] in Input array.
  !>   @param[in] out Output array.
  !>   @param[in] sign Sign of the exponent in the formula that defines the Fourier transform.
  !>   @param[in] flags FFTW planner flags.
  subroutine dfftw_plan_dft_1d(plan, n, in, out, sign, flags)
    use, intrinsic :: iso_c_binding
    implicit none
    integer(c_int64_t) :: plan
    integer(c_int) :: n
    complex(c_double_complex), dimension(:), target :: in
    complex(c_double_complex), dimension(:), target :: out
    integer(c_int) :: sign
    integer(c_int) :: flags
    !
    type(c_ptr) :: plan_c
    plan_c = fftw_plan_dft_1d_(n, c_loc(in), c_loc(out), sign, flags)
    plan = transfer(plan_c, plan)
  end subroutine dfftw_plan_dft_1d

  !>  @brief Create a 2D complex-to-complex FFT plan (Legacy).
  !>
  !>   @details Allocates and initializes a 2D complex-to-complex FFT plan.
  !>
  !>   @param[out] plan Handle of the FFT plan.
  !>   @param[in] n0 Length of the transform in the first dimension.
  !>   @param[in] n1 Length of the transform in the second dimension.
  !>   @param[in] in Input array.
  !>   @param[in] out Output array.
  !>   @param[in] sign Sign of the exponent in the formula that defines the Fourier transform.
  !>   @param[in] flags FFTW planner flags.
  subroutine dfftw_plan_dft_2d(plan, n0, n1, in, out, sign, flags)
    use, intrinsic :: iso_c_binding
    implicit none
    integer(c_int64_t) :: plan
    integer(c_int) :: n0
    integer(c_int) :: n1
    complex(c_double_complex), dimension(:,:), target :: in
    complex(c_double_complex), dimension(:,:), target :: out
    integer(c_int) :: sign
    integer(c_int) :: flags
    !
    type(c_ptr) :: plan_c
    plan_c = fftw_plan_dft_2d_(n1, n0, c_loc(in), c_loc(out), sign, flags)
    plan = transfer(plan_c, plan)
  end subroutine dfftw_plan_dft_2d

  !>  @brief Create a 3D complex-to-complex FFT plan (Legacy).
  !>
  !>   @details Allocates and initializes a 3D complex-to-complex FFT plan.
  !>
  !>   @param[out] plan Handle of the FFT plan.
  !>   @param[in] n0 Length of the transform in the first dimension.
  !>   @param[in] n1 Length of the transform in the second dimension.
  !>   @param[in] n2 Length of the transform in the third dimension.
  !>   @param[in] in Input array.
  !>   @param[in] out Output array.
  !>   @param[in] sign Sign of the exponent in the formula that defines the Fourier transform.
  !>   @param[in] flags FFTW planner flags.
  subroutine dfftw_plan_dft_3d(plan, n0, n1, n2, in, out, sign, flags)
    use, intrinsic :: iso_c_binding
    implicit none
    integer(c_int64_t) :: plan
    integer(c_int) :: n0
    integer(c_int) :: n1
    integer(c_int) :: n2
    complex(c_double_complex), dimension(:,:,:), target :: in
    complex(c_double_complex), dimension(:,:,:), target :: out
    integer(c_int) :: sign
    integer(c_int) :: flags
    !
    type(c_ptr) :: plan_c
    plan_c = fftw_plan_dft_3d_(n2, n1, n0, c_loc(in), c_loc(out), sign, flags)
    plan = transfer(plan_c, plan)
  end subroutine dfftw_plan_dft_3d

  !>  @brief Create a general N-dimensional complex-to-complex FFT plan (Legacy).
  !>
  !>   @details Allocates and initializes an N-dimensional complex-to-complex FFT plan.
  !>
  !>   @param[out] plan Handle of the FFT plan.
  !>   @param[in] rank Number of dimensions.
  !>   @param[in] n Array of dimensions.
  !>   @param[in] in Input array.
  !>   @param[in] out Output array.
  !>   @param[in] sign Sign of the exponent in the formula that defines the Fourier transform.
  !>   @param[in] flags FFTW planner flags.
  subroutine dfftw_plan_dft(plan, rank, n, in, out, sign, flags)
    use, intrinsic :: iso_c_binding
    implicit none
    integer(c_int64_t) :: plan
    integer(c_int) :: rank
    integer(c_int), dimension(rank), target :: n
    complex(c_double_complex), dimension(*), target :: in
    complex(c_double_complex), dimension(*), target :: out
    integer(c_int) :: sign
    integer(c_int) :: flags
    !
    type(c_ptr) :: plan_c
    integer(c_int), dimension(rank), target :: n_c
    n_c = n(rank:1:-1)  ! Move from Fortran to C layout
    plan_c = fftw_plan_dft_(rank, c_loc(n_c), c_loc(in), c_loc(out), sign, flags)
    plan = transfer(plan_c, plan)
  end subroutine dfftw_plan_dft

  !============================================================================
  ! R2C: Real-to-Complex Transforms
  !============================================================================

  !>  @brief Create a 1D real-to-complex FFT plan.
  !>
  !>   @details Allocates and initializes a 1D real-to-complex FFT plan.
  !>
  !>   @param[out] plan Handle of the FFT plan.
  !>   @param[in] n Length of the transform.
  !>   @param[in] in Real input array.
  !>   @param[in] out Complex output array.
  !>   @param[in] flags FFTW planner flags.
  subroutine dfftw_plan_dft_r2c_1d(plan, n, in, out, flags)
    use, intrinsic :: iso_c_binding
    implicit none
    integer(c_int64_t) :: plan
    integer(c_int) :: n
    real(c_double), dimension(:), target :: in
    complex(c_double_complex), dimension(:), target :: out
    integer(c_int) :: flags
    !
    type(c_ptr) :: plan_c
    plan_c = fftw_plan_dft_r2c_1d_(n, c_loc(in), c_loc(out), flags)
    plan = transfer(plan_c, plan)
  end subroutine dfftw_plan_dft_r2c_1d

  !>  @brief Create a 2D real-to-complex FFT plan.
  !>
  !>   @details Allocates and initializes a 2D real-to-complex FFT plan.
  !>
  !>   @param[out] plan Handle of the FFT plan.
  !>   @param[in] n0 Length of the transform in the first dimension.
  !>   @param[in] n1 Length of the transform in the second dimension.
  !>   @param[in] in Real input array.
  !>   @param[in] out Complex output array.
  !>   @param[in] flags FFTW planner flags.
  subroutine dfftw_plan_dft_r2c_2d(plan, n0, n1, in, out, flags)
    use, intrinsic :: iso_c_binding
    implicit none
    integer(c_int64_t) :: plan
    integer(c_int) :: n0
    integer(c_int) :: n1
    real(c_double), dimension(:,:), target :: in
    complex(c_double_complex), dimension(:,:), target :: out
    integer(c_int) :: flags
    !
    type(c_ptr) :: plan_c
    plan_c = fftw_plan_dft_r2c_2d_(n1, n0, c_loc(in), c_loc(out), flags)
    plan = transfer(plan_c, plan)
  end subroutine dfftw_plan_dft_r2c_2d

  !>  @brief Create a 3D real-to-complex FFT plan.
  !>
  !>   @details Allocates and initializes a 3D real-to-complex FFT plan.
  !>
  !>   @param[out] plan Handle of the FFT plan.
  !>   @param[in] n0 Length of the transform in the first dimension.
  !>   @param[in] n1 Length of the transform in the second dimension.
  !>   @param[in] n2 Length of the transform in the third dimension.
  !>   @param[in] in Real input array.
  !>   @param[in] out Complex output array.
  !>   @param[in] flags FFTW planner flags.
  subroutine dfftw_plan_dft_r2c_3d(plan, n0, n1, n2, in, out, flags)
    use, intrinsic :: iso_c_binding
    implicit none
    integer(c_int64_t) :: plan
    integer(c_int) :: n0
    integer(c_int) :: n1
    integer(c_int) :: n2
    real(c_double), dimension(:,:,:), target :: in
    complex(c_double_complex), dimension(:,:,:), target :: out
    integer(c_int) :: flags
    !
    type(c_ptr) :: plan_c
    plan_c = fftw_plan_dft_r2c_3d_(n2, n1, n0, c_loc(in), c_loc(out), flags)
    plan = transfer(plan_c, plan)
  end subroutine dfftw_plan_dft_r2c_3d

  !>  @brief Create a general N-dimensional real-to-complex FFT plan.
  !>
  !>   @details Allocates and initializes an N-dimensional real-to-complex FFT plan.
  !>
  !>   @param[out] plan Handle of the FFT plan.
  !>   @param[in] rank Number of dimensions.
  !>   @param[in] n Array of dimensions.
  !>   @param[in] in Real input array.
  !>   @param[in] out Complex output array.
  !>   @param[in] flags FFTW planner flags.
  subroutine dfftw_plan_dft_r2c(plan, rank, n, in, out, flags)
    use, intrinsic :: iso_c_binding
    implicit none
    integer(c_int64_t) :: plan
    integer(c_int) :: rank
    integer(c_int), dimension(rank), target :: n
    real(c_double), dimension(*), target :: in
    complex(c_double_complex), dimension(*), target :: out
    integer(c_int) :: flags
    !
    type(c_ptr) :: plan_c
    integer(c_int), dimension(rank), target :: n_c
    n_c = n(rank:1:-1)  ! Move from Fortran to C layout
    plan_c = fftw_plan_dft_r2c_(rank, c_loc(n_c), c_loc(in), c_loc(out), flags)
    plan = transfer(plan_c, plan)
  end subroutine dfftw_plan_dft_r2c

  !============================================================================
  ! C2R: Complex-to-Real Transforms
  !============================================================================

  !>  @brief Create a 1D complex-to-real FFT plan.
  !>
  !>   @details Allocates and initializes a 1D complex-to-real FFT plan.
  !>
  !>   @param[out] plan Handle of the FFT plan.
  !>   @param[in] n Length of the transform.
  !>   @param[in] in Complex input array.
  !>   @param[in] out Real output array.
  !>   @param[in] flags FFTW planner flags.
  subroutine dfftw_plan_dft_c2r_1d(plan, n, in, out, flags)
    use, intrinsic :: iso_c_binding
    implicit none
    integer(c_int64_t) :: plan
    integer(c_int) :: n
    complex(c_double_complex), dimension(:), target :: in
    real(c_double), dimension(:), target :: out
    integer(c_int) :: flags
    !
    type(c_ptr) :: plan_c
    plan_c = fftw_plan_dft_c2r_1d_(n, c_loc(in), c_loc(out), flags)
    plan = transfer(plan_c, plan)
  end subroutine dfftw_plan_dft_c2r_1d

  !>  @brief Create a 2D complex-to-real FFT plan.
  !>
  !>   @details Allocates and initializes a 2D complex-to-real FFT plan.
  !>
  !>   @param[out] plan Handle of the FFT plan.
  !>   @param[in] n0 Length of the transform in the first dimension.
  !>   @param[in] n1 Length of the transform in the second dimension.
  !>   @param[in] in Complex input array.
  !>   @param[in] out Real output array.
  !>   @param[in] flags FFTW planner flags.
  subroutine dfftw_plan_dft_c2r_2d(plan, n0, n1, in, out, flags)
    use, intrinsic :: iso_c_binding
    implicit none
    integer(c_int64_t) :: plan
    integer(c_int) :: n0
    integer(c_int) :: n1
    complex(c_double_complex), dimension(:,:), target :: in
    real(c_double), dimension(:,:), target :: out
    integer(c_int) :: flags
    !
    type(c_ptr) :: plan_c
    plan_c = fftw_plan_dft_c2r_2d_(n1, n0, c_loc(in), c_loc(out), flags)
    plan = transfer(plan_c, plan)
  end subroutine dfftw_plan_dft_c2r_2d

  !>  @brief Create a 3D complex-to-real FFT plan.
  !>
  !>   @details Allocates and initializes a 3D complex-to-real FFT plan.
  !>
  !>   @param[out] plan Handle of the FFT plan.
  !>   @param[in] n0 Length of the transform in the first dimension.
  !>   @param[in] n1 Length of the transform in the second dimension.
  !>   @param[in] n2 Length of the transform in the third dimension.
  !>   @param[in] in Complex input array.
  !>   @param[in] out Real output array.
  !>   @param[in] flags FFTW planner flags.
  subroutine dfftw_plan_dft_c2r_3d(plan, n0, n1, n2, in, out, flags)
    use, intrinsic :: iso_c_binding
    implicit none
    integer(c_int64_t) :: plan
    integer(c_int) :: n0
    integer(c_int) :: n1
    integer(c_int) :: n2
    complex(c_double_complex), dimension(:,:,:), target :: in
    real(c_double), dimension(:,:,:), target :: out
    integer(c_int) :: flags
    !
    type(c_ptr) :: plan_c
    plan_c = fftw_plan_dft_c2r_3d_(n2, n1, n0, c_loc(in), c_loc(out), flags)
    plan = transfer(plan_c, plan)
  end subroutine dfftw_plan_dft_c2r_3d

  !>  @brief Create a general N-dimensional complex-to-real FFT plan.
  !>
  !>   @details Allocates and initializes an N-dimensional complex-to-real FFT plan.
  !>
  !>   @param[out] plan Handle of the FFT plan.
  !>   @param[in] rank Number of dimensions.
  !>   @param[in] n Array of dimensions.
  !>   @param[in] in Complex input array.
  !>   @param[in] out Real output array.
  !>   @param[in] flags FFTW planner flags.
  subroutine dfftw_plan_dft_c2r(plan, rank, n, in, out, flags)
    use, intrinsic :: iso_c_binding
    implicit none
    integer(c_int64_t) :: plan
    integer(c_int) :: rank
    integer(c_int), dimension(rank), target :: n
    complex(c_double_complex), dimension(*), target :: in
    real(c_double), dimension(*), target :: out
    integer(c_int) :: flags
    !
    type(c_ptr) :: plan_c
    integer(c_int), dimension(rank), target :: n_c
    n_c = n(rank:1:-1)  ! Move from Fortran to C layout
    plan_c = fftw_plan_dft_c2r_(rank, c_loc(n_c), c_loc(in), c_loc(out), flags)
    plan = transfer(plan_c, plan)
  end subroutine dfftw_plan_dft_c2r

  !============================================================================
  ! Plan Execution
  !============================================================================

  !>  @brief Execute an FFT plan.
  !>
  !>   @details Executes an FFT plan using the arrays with which the plan was created.
  !>
  !>   @param[in] plan Handle of the FFT plan.
  subroutine dfftw_execute(plan)
    use, intrinsic :: iso_c_binding
    implicit none
    integer(c_int64_t) :: plan
    !
    type(c_ptr) :: plan_c
    plan_c = transfer(plan, plan_c)
    call fftw_execute_(plan_c)
  end subroutine dfftw_execute

  !>  @brief Execute a complex-to-complex FFT plan with new arrays.
  !>
  !>   @details Executes a complex-to-complex FFT plan on the provided input and output arrays.
  !>
  !>   @param[in] plan Handle of the FFT plan.
  !>   @param[in] in Input array.
  !>   @param[out] out Output array.
  subroutine dfftw_execute_dft(plan, in, out)
    use, intrinsic :: iso_c_binding
    implicit none
    integer(c_int64_t) :: plan
    complex(c_double_complex), dimension(*), target :: in
    complex(c_double_complex), dimension(*), target :: out
    !
    type(c_ptr) :: plan_c
    plan_c = transfer(plan, plan_c)
    call fftw_execute_dft_(plan_c, c_loc(in), c_loc(out))
  end subroutine dfftw_execute_dft

  !>  @brief Execute a real-to-complex FFT plan with new arrays.
  !>
  !>   @details Executes a real-to-complex FFT plan on the provided input and output arrays.
  !>
  !>   @param[in] plan Handle of the FFT plan.
  !>   @param[in] in Real input array.
  !>   @param[out] out Complex output array.
  subroutine dfftw_execute_dft_r2c(plan, in, out)
    use, intrinsic :: iso_c_binding
    implicit none
    integer(c_int64_t) :: plan
    real(c_double), dimension(*), target :: in
    complex(c_double_complex), dimension(*), target :: out
    !
    type(c_ptr) :: plan_c
    plan_c = transfer(plan, plan_c)
    call fftw_execute_dft_r2c_(plan_c, c_loc(in), c_loc(out))
  end subroutine dfftw_execute_dft_r2c

  !>  @brief Execute a complex-to-real FFT plan with new arrays.
  !>
  !>   @details Executes a complex-to-real FFT plan on the provided input and output arrays.
  !>
  !>   @param[in] plan Handle of the FFT plan.
  !>   @param[in] in Complex input array.
  !>   @param[out] out Real output array.
  subroutine dfftw_execute_dft_c2r(plan, in, out)
    use, intrinsic :: iso_c_binding
    implicit none
    integer(c_int64_t) :: plan
    complex(c_double_complex), dimension(*), target :: in
    real(c_double), dimension(*), target :: out
    !
    type(c_ptr) :: plan_c
    plan_c = transfer(plan, plan_c)
    call fftw_execute_dft_c2r_(plan_c, c_loc(in), c_loc(out))
  end subroutine dfftw_execute_dft_c2r

  !============================================================================
  ! Plan Management
  !============================================================================

  !>  @brief Print information about an FFT plan.
  !>
  !>   @details Prints detailed information about the specified FFT plan.
  !>            For compatibility only - no-op in this implementation.
  !>
  !>   @param[in] plan Handle of the FFT plan.
  subroutine dfftw_print_plan(plan)
    use, intrinsic :: iso_c_binding
    implicit none
    integer(c_int64_t) :: plan
    !
    type(c_ptr) :: plan_c
    plan_c = transfer(plan, plan_c)
    call fftw_print_plan_(plan_c)
  end subroutine dfftw_print_plan

  !>  @brief Destroy an FFT plan.
  !>
  !>   @details Deallocates resources associated with an FFT plan and nullifies the plan handle.
  !>
  !>   @param[inout] plan Handle of the FFT plan to destroy. Set to 1 after destruction.
  subroutine dfftw_destroy_plan(plan)
    use, intrinsic :: iso_c_binding
    implicit none
    integer(c_int64_t) :: plan
    !
    type(c_ptr) :: plan_c
    plan_c = transfer(plan, plan_c)
    call fftw_destroy_plan_(plan_c)
    plan = transfer(plan_c, plan)
  end subroutine dfftw_destroy_plan

end module hipfort_hipfftw
