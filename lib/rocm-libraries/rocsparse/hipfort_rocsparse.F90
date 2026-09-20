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

module hipfort_rocsparse
  use hipfort_rocsparse_enums
  use hipfort_rocsparse_types
  use hipfort_handles
#include "hipfort_rocsparse_interfaces.f90"
contains
#include "hipfort_rocsparse_wrappers.f90"

  !>   @defgroup aux_module Sparse Auxiliary Functions
  !>
  !>   Auxiliary functions, such as handle, descriptor and info object management.
  !>

  !>   @defgroup level1_module Sparse Level 1 Functions
  !>
  !>   Operations between a vector in sparse format and a vector in dense format.
  !>

  !>   @defgroup level2_module Sparse Level 2 Functions
  !>
  !>   Operations between a matrix in sparse format and a vector in dense format.
  !>

  !>   @defgroup level3_module Sparse Level 3 Functions
  !>
  !>   Operations between a matrix in sparse format and multiple vectors in dense format.
  !>

  !>   @defgroup extra_module Sparse Extra Functions
  !>
  !>   Operations that manipulate sparse matrices, such as addition and multiplication.
  !>

  !>   @defgroup precond_module Preconditioner Functions
  !>
  !>   Manipulations on a matrix in sparse format to obtain a preconditioner.
  !>

  !>   @defgroup conv_module Sparse Conversion Functions
  !>
  !>   Conversions between different sparse matrix storage formats.
  !>

  !>   @defgroup reordering_module Sparse Reordering Functions
  !>
  !>   Reordering operations on a matrix in sparse format.
  !>

  !>   @defgroup utility_module Sparse Utility Functions
  !>
  !>   Checks on a matrix in sparse format.
  !>

  !>   @defgroup generic_module Sparse Generic Functions
  !>
  !>   Generic sparse API operating on the descriptor-based sparse and dense types.
  !>
end module hipfort_rocsparse
