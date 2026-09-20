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

module hipfort
  use hipfort_enums
  use hipfort_types
  use hipfort_handles
  use hipfort_hipmalloc
  use hipfort_hipmemcpy
  use hipfort_hiphostregister
  use hipfort_auxiliary
#include "hipfort_interfaces.f90"
contains
#include "hipfort_wrappers.f90"

  !>   @defgroup API HIP API
  !>
  !>   Defines the HIP API. See the individual sections for more information.
  !>

  !>   @defgroup Driver Initialization and Version
  !>
  !>   This section describes the initialization and version functions of HIP runtime API.
  !>

  !>   @defgroup Device Device Management
  !>
  !>   This section describes the device management functions of HIP runtime API.
  !>

  !>   @defgroup Execution Execution Control
  !>
  !>   This section describes the execution control functions of HIP runtime API.
  !>

  !>   @defgroup Error Error Handling
  !>
  !>   This section describes the error handling functions of HIP runtime API.
  !>

  !>   @defgroup Event Event Management
  !>
  !>   This section describes the event management functions of HIP runtime API.
  !>

  !>   @defgroup External External Resource Interoperability
  !>
  !>   @ingroup API
  !>
  !>   This section describes the external resource interoperability functions of HIP runtime API.
  !>

  !>   @defgroup PeerToPeer PeerToPeer Device Memory Access
  !>
  !>   @ingroup API
  !>
  !>   This section describes the PeerToPeer device memory access functions of HIP runtime API.
  !>

  !>   @defgroup ExecutionContext Execution Context Management
  !>
  !>   This section describes execution context management functions of HIP runtime API.
  !>

  !>   @defgroup Module Module Management
  !>
  !>   @ingroup API
  !>
  !>   This section describes the module management functions of HIP runtime API.
  !>

  !>   @defgroup Occupancy Occupancy
  !>
  !>   This section describes the occupancy functions of HIP runtime API.
  !>

  !>   @defgroup Clang Launch API to support the triple-chevron syntax
  !>
  !>   This section describes the API to support the triple-chevron syntax.
  !>

  !>   @defgroup Callback Callback Activity APIs
  !>
  !>   This section describes the callback/Activity of HIP runtime API.
  !>

  !>   @defgroup Memory Memory Management
  !>
  !>   @ingroup API
  !>
  !>   Memory management functions of the HIP runtime API.
  !>

  !>   @defgroup MemoryD Memory Management [Deprecated]
  !>
  !>   @ingroup Memory
  !>
  !>   Deprecated memory management functions of the HIP runtime API.
  !>

  !>   @defgroup MemoryM Managed Memory
  !>
  !>   @ingroup Memory
  !>
  !>   This section describes the managed memory management functions of HIP runtime API.
  !>
  !>   @note  The managed memory management APIs are implemented on Linux, under development on Windows.
  !>
end module hipfort
