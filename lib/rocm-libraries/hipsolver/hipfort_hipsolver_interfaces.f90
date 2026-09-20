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

! Usage:
!   #include "hipfort_hipsolver_interfaces.f90"  ! directly in any program unit (needs cpp:
!                                     ! the #ifdef guards below must be honoured)
!   use hipfort_hipsolver                         ! via the pre-built module

  use, intrinsic :: iso_c_binding
  implicit none

  interface

    !---------------------------------------------
    ! hipsolverDnCreateParams
    !---------------------------------------------
    function hipsolverDnCreateParams(params) &
       result(DnCreateParams) &
       bind(C, name="hipsolverDnCreateParams")
       import :: c_ptr, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr) :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnCreateParams
    end function hipsolverDnCreateParams

    !---------------------------------------------
    ! hipsolverDnDestroyParams
    !---------------------------------------------
    function hipsolverDnDestroyParams(params) &
       result(DnDestroyParams) &
       bind(C, name="hipsolverDnDestroyParams")
       import :: c_ptr, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: params
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnDestroyParams
    end function hipsolverDnDestroyParams

    !---------------------------------------------
    ! hipsolverDnSetAdvOptions
    !---------------------------------------------
    function hipsolverDnSetAdvOptions(params, func, alg) &
       result(DnSetAdvOptions) &
       bind(C, name="hipsolverDnSetAdvOptions")
       import :: c_ptr, HIPSOLVERDN_GETRF, HIPSOLVER_ALG_0, HIPSOLVER_STATUS_SUCCESS
       type(c_ptr), value :: params
       integer(kind(HIPSOLVERDN_GETRF)), value :: func
       integer(kind(HIPSOLVER_ALG_0)), value :: alg
       integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: DnSetAdvOptions
    end function hipsolverDnSetAdvOptions

  end interface

  interface hipsolverCreate
    function hipsolverCreate_(handle) bind(c, name="hipsolverCreate")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCreate_
      type(c_ptr) :: handle
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverCreate_typed
#endif
  end interface

  interface hipsolverDestroy
    function hipsolverDestroy_(handle) bind(c, name="hipsolverDestroy")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDestroy_
      type(c_ptr),value :: handle
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDestroy_typed
#endif
  end interface

  interface hipsolverSetStream
    function hipsolverSetStream_(handle,streamId) bind(c, name="hipsolverSetStream")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSetStream_
      type(c_ptr),value :: handle
      type(c_ptr),value :: streamId
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverSetStream_typed
#endif
  end interface

  interface hipsolverGetStream
    function hipsolverGetStream_(handle,streamId) bind(c, name="hipsolverGetStream")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverGetStream_
      type(c_ptr),value :: handle
      type(c_ptr) :: streamId
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverGetStream_typed
#endif
  end interface

  interface hipsolverSetDeterministicMode
    function hipsolverSetDeterministicMode_(handle,mode) &
        bind(c, name="hipsolverSetDeterministicMode")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSetDeterministicMode_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_DETERMINISTIC_RESULTS)),value :: mode
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverSetDeterministicMode_typed
#endif
  end interface

  interface hipsolverGetDeterministicMode
    function hipsolverGetDeterministicMode_(handle,mode) &
        bind(c, name="hipsolverGetDeterministicMode")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverGetDeterministicMode_
      type(c_ptr),value :: handle
      type(c_ptr),value :: mode
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverGetDeterministicMode_assumed_rank,&
      hipsolverGetDeterministicMode_assumed_rank_cptr,&
      hipsolverGetDeterministicMode_typed
#else
    module procedure &
      hipsolverGetDeterministicMode_rank_0,&
      hipsolverGetDeterministicMode_rank_0_cptr,&
      hipsolverGetDeterministicMode_rank_1,&
      hipsolverGetDeterministicMode_rank_1_cptr,&
      hipsolverGetDeterministicMode_typed
#endif
#endif
  end interface

  interface hipsolverCreateGesvdjInfo
    function hipsolverCreateGesvdjInfo_(myInfo) bind(c, name="hipsolverCreateGesvdjInfo")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCreateGesvdjInfo_
      type(c_ptr) :: myInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverCreateGesvdjInfo_typed
#endif
  end interface

  interface hipsolverDestroyGesvdjInfo
    function hipsolverDestroyGesvdjInfo_(myInfo) bind(c, name="hipsolverDestroyGesvdjInfo")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDestroyGesvdjInfo_
      type(c_ptr),value :: myInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDestroyGesvdjInfo_typed
#endif
  end interface

  interface hipsolverXgesvdjSetMaxSweeps
    function hipsolverXgesvdjSetMaxSweeps_(myInfo,max_sweeps) &
        bind(c, name="hipsolverXgesvdjSetMaxSweeps")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverXgesvdjSetMaxSweeps_
      type(c_ptr),value :: myInfo
      integer(c_int),value :: max_sweeps
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverXgesvdjSetMaxSweeps_typed
#endif
  end interface

  interface hipsolverXgesvdjSetSortEig
    function hipsolverXgesvdjSetSortEig_(myInfo,sort_eig) bind(c, name="hipsolverXgesvdjSetSortEig")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverXgesvdjSetSortEig_
      type(c_ptr),value :: myInfo
      integer(c_int),value :: sort_eig
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverXgesvdjSetSortEig_typed
#endif
  end interface

  interface hipsolverXgesvdjSetTolerance
    function hipsolverXgesvdjSetTolerance_(myInfo,tolerance) &
        bind(c, name="hipsolverXgesvdjSetTolerance")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverXgesvdjSetTolerance_
      type(c_ptr),value :: myInfo
      real(c_double),value :: tolerance
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverXgesvdjSetTolerance_typed
#endif
  end interface

  interface hipsolverXgesvdjGetResidual
    function hipsolverXgesvdjGetResidual_(handle,myInfo,residual) &
        bind(c, name="hipsolverXgesvdjGetResidual")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverXgesvdjGetResidual_
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      real(c_double) :: residual
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverXgesvdjGetResidual_typed
#endif
  end interface

  interface hipsolverXgesvdjGetSweeps
    function hipsolverXgesvdjGetSweeps_(handle,myInfo,executed_sweeps) &
        bind(c, name="hipsolverXgesvdjGetSweeps")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverXgesvdjGetSweeps_
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      integer(c_int) :: executed_sweeps
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverXgesvdjGetSweeps_typed
#endif
  end interface

  interface hipsolverCreateSyevjInfo
    function hipsolverCreateSyevjInfo_(myInfo) bind(c, name="hipsolverCreateSyevjInfo")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCreateSyevjInfo_
      type(c_ptr) :: myInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverCreateSyevjInfo_typed
#endif
  end interface

  interface hipsolverDestroySyevjInfo
    function hipsolverDestroySyevjInfo_(myInfo) bind(c, name="hipsolverDestroySyevjInfo")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDestroySyevjInfo_
      type(c_ptr),value :: myInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDestroySyevjInfo_typed
#endif
  end interface

  interface hipsolverXsyevjSetMaxSweeps
    function hipsolverXsyevjSetMaxSweeps_(myInfo,max_sweeps) &
        bind(c, name="hipsolverXsyevjSetMaxSweeps")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverXsyevjSetMaxSweeps_
      type(c_ptr),value :: myInfo
      integer(c_int),value :: max_sweeps
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverXsyevjSetMaxSweeps_typed
#endif
  end interface

  interface hipsolverXsyevjSetSortEig
    function hipsolverXsyevjSetSortEig_(myInfo,sort_eig) bind(c, name="hipsolverXsyevjSetSortEig")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverXsyevjSetSortEig_
      type(c_ptr),value :: myInfo
      integer(c_int),value :: sort_eig
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverXsyevjSetSortEig_typed
#endif
  end interface

  interface hipsolverXsyevjSetTolerance
    function hipsolverXsyevjSetTolerance_(myInfo,tolerance) &
        bind(c, name="hipsolverXsyevjSetTolerance")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverXsyevjSetTolerance_
      type(c_ptr),value :: myInfo
      real(c_double),value :: tolerance
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverXsyevjSetTolerance_typed
#endif
  end interface

  interface hipsolverXsyevjGetResidual
    function hipsolverXsyevjGetResidual_(handle,myInfo,residual) &
        bind(c, name="hipsolverXsyevjGetResidual")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverXsyevjGetResidual_
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      real(c_double) :: residual
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverXsyevjGetResidual_typed
#endif
  end interface

  interface hipsolverXsyevjGetSweeps
    function hipsolverXsyevjGetSweeps_(handle,myInfo,executed_sweeps) &
        bind(c, name="hipsolverXsyevjGetSweeps")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverXsyevjGetSweeps_
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      integer(c_int) :: executed_sweeps
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverXsyevjGetSweeps_typed
#endif
  end interface

  interface hipsolverSorgbr_bufferSize
    function hipsolverSorgbr_bufferSize_(handle,side,m,n,k,A,lda,tau,lwork) &
        bind(c, name="hipsolverSorgbr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgbr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float) :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSorgbr_bufferSize_assumed_rank,&
      hipsolverSorgbr_bufferSize_assumed_rank_cptr,&
      hipsolverSorgbr_bufferSize_typed
#else
    module procedure &
      hipsolverSorgbr_bufferSize_rank_0,&
      hipsolverSorgbr_bufferSize_rank_0_cptr,&
      hipsolverSorgbr_bufferSize_rank_1,&
      hipsolverSorgbr_bufferSize_rank_1_cptr,&
      hipsolverSorgbr_bufferSize_full_rank,&
      hipsolverSorgbr_bufferSize_full_rank_cptr,&
      hipsolverSorgbr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDorgbr_bufferSize
    function hipsolverDorgbr_bufferSize_(handle,side,m,n,k,A,lda,tau,lwork) &
        bind(c, name="hipsolverDorgbr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgbr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double) :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDorgbr_bufferSize_assumed_rank,&
      hipsolverDorgbr_bufferSize_assumed_rank_cptr,&
      hipsolverDorgbr_bufferSize_typed
#else
    module procedure &
      hipsolverDorgbr_bufferSize_rank_0,&
      hipsolverDorgbr_bufferSize_rank_0_cptr,&
      hipsolverDorgbr_bufferSize_rank_1,&
      hipsolverDorgbr_bufferSize_rank_1_cptr,&
      hipsolverDorgbr_bufferSize_full_rank,&
      hipsolverDorgbr_bufferSize_full_rank_cptr,&
      hipsolverDorgbr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverCungbr_bufferSize
    function hipsolverCungbr_bufferSize_(handle,side,m,n,k,A,lda,tau,lwork) &
        bind(c, name="hipsolverCungbr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungbr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_float_complex) :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCungbr_bufferSize_assumed_rank,&
      hipsolverCungbr_bufferSize_assumed_rank_cptr,&
      hipsolverCungbr_bufferSize_typed
#else
    module procedure &
      hipsolverCungbr_bufferSize_rank_0,&
      hipsolverCungbr_bufferSize_rank_0_cptr,&
      hipsolverCungbr_bufferSize_rank_1,&
      hipsolverCungbr_bufferSize_rank_1_cptr,&
      hipsolverCungbr_bufferSize_full_rank,&
      hipsolverCungbr_bufferSize_full_rank_cptr,&
      hipsolverCungbr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverZungbr_bufferSize
    function hipsolverZungbr_bufferSize_(handle,side,m,n,k,A,lda,tau,lwork) &
        bind(c, name="hipsolverZungbr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungbr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_double_complex) :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZungbr_bufferSize_assumed_rank,&
      hipsolverZungbr_bufferSize_assumed_rank_cptr,&
      hipsolverZungbr_bufferSize_typed
#else
    module procedure &
      hipsolverZungbr_bufferSize_rank_0,&
      hipsolverZungbr_bufferSize_rank_0_cptr,&
      hipsolverZungbr_bufferSize_rank_1,&
      hipsolverZungbr_bufferSize_rank_1_cptr,&
      hipsolverZungbr_bufferSize_full_rank,&
      hipsolverZungbr_bufferSize_full_rank_cptr,&
      hipsolverZungbr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverSorgbr
    function hipsolverSorgbr_(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverSorgbr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgbr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSorgbr_assumed_rank,&
      hipsolverSorgbr_assumed_rank_cptr,&
      hipsolverSorgbr_typed
#else
    module procedure &
      hipsolverSorgbr_rank_0,&
      hipsolverSorgbr_rank_0_cptr,&
      hipsolverSorgbr_rank_1,&
      hipsolverSorgbr_rank_1_cptr,&
      hipsolverSorgbr_full_rank,&
      hipsolverSorgbr_full_rank_cptr,&
      hipsolverSorgbr_typed
#endif
#endif
  end interface

  interface hipsolverDorgbr
    function hipsolverDorgbr_(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDorgbr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgbr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDorgbr_assumed_rank,&
      hipsolverDorgbr_assumed_rank_cptr,&
      hipsolverDorgbr_typed
#else
    module procedure &
      hipsolverDorgbr_rank_0,&
      hipsolverDorgbr_rank_0_cptr,&
      hipsolverDorgbr_rank_1,&
      hipsolverDorgbr_rank_1_cptr,&
      hipsolverDorgbr_full_rank,&
      hipsolverDorgbr_full_rank_cptr,&
      hipsolverDorgbr_typed
#endif
#endif
  end interface

  interface hipsolverCungbr
    function hipsolverCungbr_(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverCungbr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungbr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_float_complex) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCungbr_assumed_rank,&
      hipsolverCungbr_assumed_rank_cptr,&
      hipsolverCungbr_typed
#else
    module procedure &
      hipsolverCungbr_rank_0,&
      hipsolverCungbr_rank_0_cptr,&
      hipsolverCungbr_rank_1,&
      hipsolverCungbr_rank_1_cptr,&
      hipsolverCungbr_full_rank,&
      hipsolverCungbr_full_rank_cptr,&
      hipsolverCungbr_typed
#endif
#endif
  end interface

  interface hipsolverZungbr
    function hipsolverZungbr_(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverZungbr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungbr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_double_complex) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZungbr_assumed_rank,&
      hipsolverZungbr_assumed_rank_cptr,&
      hipsolverZungbr_typed
#else
    module procedure &
      hipsolverZungbr_rank_0,&
      hipsolverZungbr_rank_0_cptr,&
      hipsolverZungbr_rank_1,&
      hipsolverZungbr_rank_1_cptr,&
      hipsolverZungbr_full_rank,&
      hipsolverZungbr_full_rank_cptr,&
      hipsolverZungbr_typed
#endif
#endif
  end interface

  interface hipsolverSorgqr_bufferSize
    function hipsolverSorgqr_bufferSize_(handle,m,n,k,A,lda,tau,lwork) &
        bind(c, name="hipsolverSorgqr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgqr_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float) :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSorgqr_bufferSize_assumed_rank,&
      hipsolverSorgqr_bufferSize_assumed_rank_cptr,&
      hipsolverSorgqr_bufferSize_typed
#else
    module procedure &
      hipsolverSorgqr_bufferSize_rank_0,&
      hipsolverSorgqr_bufferSize_rank_0_cptr,&
      hipsolverSorgqr_bufferSize_rank_1,&
      hipsolverSorgqr_bufferSize_rank_1_cptr,&
      hipsolverSorgqr_bufferSize_full_rank,&
      hipsolverSorgqr_bufferSize_full_rank_cptr,&
      hipsolverSorgqr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDorgqr_bufferSize
    function hipsolverDorgqr_bufferSize_(handle,m,n,k,A,lda,tau,lwork) &
        bind(c, name="hipsolverDorgqr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgqr_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double) :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDorgqr_bufferSize_assumed_rank,&
      hipsolverDorgqr_bufferSize_assumed_rank_cptr,&
      hipsolverDorgqr_bufferSize_typed
#else
    module procedure &
      hipsolverDorgqr_bufferSize_rank_0,&
      hipsolverDorgqr_bufferSize_rank_0_cptr,&
      hipsolverDorgqr_bufferSize_rank_1,&
      hipsolverDorgqr_bufferSize_rank_1_cptr,&
      hipsolverDorgqr_bufferSize_full_rank,&
      hipsolverDorgqr_bufferSize_full_rank_cptr,&
      hipsolverDorgqr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverCungqr_bufferSize
    function hipsolverCungqr_bufferSize_(handle,m,n,k,A,lda,tau,lwork) &
        bind(c, name="hipsolverCungqr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungqr_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_float_complex) :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCungqr_bufferSize_assumed_rank,&
      hipsolverCungqr_bufferSize_assumed_rank_cptr,&
      hipsolverCungqr_bufferSize_typed
#else
    module procedure &
      hipsolverCungqr_bufferSize_rank_0,&
      hipsolverCungqr_bufferSize_rank_0_cptr,&
      hipsolverCungqr_bufferSize_rank_1,&
      hipsolverCungqr_bufferSize_rank_1_cptr,&
      hipsolverCungqr_bufferSize_full_rank,&
      hipsolverCungqr_bufferSize_full_rank_cptr,&
      hipsolverCungqr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverZungqr_bufferSize
    function hipsolverZungqr_bufferSize_(handle,m,n,k,A,lda,tau,lwork) &
        bind(c, name="hipsolverZungqr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungqr_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_double_complex) :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZungqr_bufferSize_assumed_rank,&
      hipsolverZungqr_bufferSize_assumed_rank_cptr,&
      hipsolverZungqr_bufferSize_typed
#else
    module procedure &
      hipsolverZungqr_bufferSize_rank_0,&
      hipsolverZungqr_bufferSize_rank_0_cptr,&
      hipsolverZungqr_bufferSize_rank_1,&
      hipsolverZungqr_bufferSize_rank_1_cptr,&
      hipsolverZungqr_bufferSize_full_rank,&
      hipsolverZungqr_bufferSize_full_rank_cptr,&
      hipsolverZungqr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverSorgqr
    function hipsolverSorgqr_(handle,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverSorgqr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgqr_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSorgqr_assumed_rank,&
      hipsolverSorgqr_assumed_rank_cptr,&
      hipsolverSorgqr_typed
#else
    module procedure &
      hipsolverSorgqr_rank_0,&
      hipsolverSorgqr_rank_0_cptr,&
      hipsolverSorgqr_rank_1,&
      hipsolverSorgqr_rank_1_cptr,&
      hipsolverSorgqr_full_rank,&
      hipsolverSorgqr_full_rank_cptr,&
      hipsolverSorgqr_typed
#endif
#endif
  end interface

  interface hipsolverDorgqr
    function hipsolverDorgqr_(handle,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDorgqr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgqr_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDorgqr_assumed_rank,&
      hipsolverDorgqr_assumed_rank_cptr,&
      hipsolverDorgqr_typed
#else
    module procedure &
      hipsolverDorgqr_rank_0,&
      hipsolverDorgqr_rank_0_cptr,&
      hipsolverDorgqr_rank_1,&
      hipsolverDorgqr_rank_1_cptr,&
      hipsolverDorgqr_full_rank,&
      hipsolverDorgqr_full_rank_cptr,&
      hipsolverDorgqr_typed
#endif
#endif
  end interface

  interface hipsolverCungqr
    function hipsolverCungqr_(handle,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverCungqr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungqr_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_float_complex) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCungqr_assumed_rank,&
      hipsolverCungqr_assumed_rank_cptr,&
      hipsolverCungqr_typed
#else
    module procedure &
      hipsolverCungqr_rank_0,&
      hipsolverCungqr_rank_0_cptr,&
      hipsolverCungqr_rank_1,&
      hipsolverCungqr_rank_1_cptr,&
      hipsolverCungqr_full_rank,&
      hipsolverCungqr_full_rank_cptr,&
      hipsolverCungqr_typed
#endif
#endif
  end interface

  interface hipsolverZungqr
    function hipsolverZungqr_(handle,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverZungqr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungqr_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_double_complex) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZungqr_assumed_rank,&
      hipsolverZungqr_assumed_rank_cptr,&
      hipsolverZungqr_typed
#else
    module procedure &
      hipsolverZungqr_rank_0,&
      hipsolverZungqr_rank_0_cptr,&
      hipsolverZungqr_rank_1,&
      hipsolverZungqr_rank_1_cptr,&
      hipsolverZungqr_full_rank,&
      hipsolverZungqr_full_rank_cptr,&
      hipsolverZungqr_typed
#endif
#endif
  end interface

  interface hipsolverSorgtr_bufferSize
    function hipsolverSorgtr_bufferSize_(handle,uplo,n,A,lda,tau,lwork) &
        bind(c, name="hipsolverSorgtr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgtr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float) :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSorgtr_bufferSize_assumed_rank,&
      hipsolverSorgtr_bufferSize_assumed_rank_cptr,&
      hipsolverSorgtr_bufferSize_typed
#else
    module procedure &
      hipsolverSorgtr_bufferSize_rank_0,&
      hipsolverSorgtr_bufferSize_rank_0_cptr,&
      hipsolverSorgtr_bufferSize_rank_1,&
      hipsolverSorgtr_bufferSize_rank_1_cptr,&
      hipsolverSorgtr_bufferSize_full_rank,&
      hipsolverSorgtr_bufferSize_full_rank_cptr,&
      hipsolverSorgtr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDorgtr_bufferSize
    function hipsolverDorgtr_bufferSize_(handle,uplo,n,A,lda,tau,lwork) &
        bind(c, name="hipsolverDorgtr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgtr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double) :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDorgtr_bufferSize_assumed_rank,&
      hipsolverDorgtr_bufferSize_assumed_rank_cptr,&
      hipsolverDorgtr_bufferSize_typed
#else
    module procedure &
      hipsolverDorgtr_bufferSize_rank_0,&
      hipsolverDorgtr_bufferSize_rank_0_cptr,&
      hipsolverDorgtr_bufferSize_rank_1,&
      hipsolverDorgtr_bufferSize_rank_1_cptr,&
      hipsolverDorgtr_bufferSize_full_rank,&
      hipsolverDorgtr_bufferSize_full_rank_cptr,&
      hipsolverDorgtr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverCungtr_bufferSize
    function hipsolverCungtr_bufferSize_(handle,uplo,n,A,lda,tau,lwork) &
        bind(c, name="hipsolverCungtr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungtr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_float_complex) :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCungtr_bufferSize_assumed_rank,&
      hipsolverCungtr_bufferSize_assumed_rank_cptr,&
      hipsolverCungtr_bufferSize_typed
#else
    module procedure &
      hipsolverCungtr_bufferSize_rank_0,&
      hipsolverCungtr_bufferSize_rank_0_cptr,&
      hipsolverCungtr_bufferSize_rank_1,&
      hipsolverCungtr_bufferSize_rank_1_cptr,&
      hipsolverCungtr_bufferSize_full_rank,&
      hipsolverCungtr_bufferSize_full_rank_cptr,&
      hipsolverCungtr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverZungtr_bufferSize
    function hipsolverZungtr_bufferSize_(handle,uplo,n,A,lda,tau,lwork) &
        bind(c, name="hipsolverZungtr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungtr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_double_complex) :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZungtr_bufferSize_assumed_rank,&
      hipsolverZungtr_bufferSize_assumed_rank_cptr,&
      hipsolverZungtr_bufferSize_typed
#else
    module procedure &
      hipsolverZungtr_bufferSize_rank_0,&
      hipsolverZungtr_bufferSize_rank_0_cptr,&
      hipsolverZungtr_bufferSize_rank_1,&
      hipsolverZungtr_bufferSize_rank_1_cptr,&
      hipsolverZungtr_bufferSize_full_rank,&
      hipsolverZungtr_bufferSize_full_rank_cptr,&
      hipsolverZungtr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverSorgtr
    function hipsolverSorgtr_(handle,uplo,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverSorgtr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgtr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSorgtr_assumed_rank,&
      hipsolverSorgtr_assumed_rank_cptr,&
      hipsolverSorgtr_typed
#else
    module procedure &
      hipsolverSorgtr_rank_0,&
      hipsolverSorgtr_rank_0_cptr,&
      hipsolverSorgtr_rank_1,&
      hipsolverSorgtr_rank_1_cptr,&
      hipsolverSorgtr_full_rank,&
      hipsolverSorgtr_full_rank_cptr,&
      hipsolverSorgtr_typed
#endif
#endif
  end interface

  interface hipsolverDorgtr
    function hipsolverDorgtr_(handle,uplo,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDorgtr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgtr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDorgtr_assumed_rank,&
      hipsolverDorgtr_assumed_rank_cptr,&
      hipsolverDorgtr_typed
#else
    module procedure &
      hipsolverDorgtr_rank_0,&
      hipsolverDorgtr_rank_0_cptr,&
      hipsolverDorgtr_rank_1,&
      hipsolverDorgtr_rank_1_cptr,&
      hipsolverDorgtr_full_rank,&
      hipsolverDorgtr_full_rank_cptr,&
      hipsolverDorgtr_typed
#endif
#endif
  end interface

  interface hipsolverCungtr
    function hipsolverCungtr_(handle,uplo,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverCungtr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungtr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_float_complex) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCungtr_assumed_rank,&
      hipsolverCungtr_assumed_rank_cptr,&
      hipsolverCungtr_typed
#else
    module procedure &
      hipsolverCungtr_rank_0,&
      hipsolverCungtr_rank_0_cptr,&
      hipsolverCungtr_rank_1,&
      hipsolverCungtr_rank_1_cptr,&
      hipsolverCungtr_full_rank,&
      hipsolverCungtr_full_rank_cptr,&
      hipsolverCungtr_typed
#endif
#endif
  end interface

  interface hipsolverZungtr
    function hipsolverZungtr_(handle,uplo,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverZungtr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungtr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_double_complex) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZungtr_assumed_rank,&
      hipsolverZungtr_assumed_rank_cptr,&
      hipsolverZungtr_typed
#else
    module procedure &
      hipsolverZungtr_rank_0,&
      hipsolverZungtr_rank_0_cptr,&
      hipsolverZungtr_rank_1,&
      hipsolverZungtr_rank_1_cptr,&
      hipsolverZungtr_full_rank,&
      hipsolverZungtr_full_rank_cptr,&
      hipsolverZungtr_typed
#endif
#endif
  end interface

  interface hipsolverSormqr_bufferSize
    function hipsolverSormqr_bufferSize_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork) &
        bind(c, name="hipsolverSormqr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormqr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float) :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSormqr_bufferSize_assumed_rank,&
      hipsolverSormqr_bufferSize_assumed_rank_cptr,&
      hipsolverSormqr_bufferSize_typed
#else
    module procedure &
      hipsolverSormqr_bufferSize_rank_0,&
      hipsolverSormqr_bufferSize_rank_0_cptr,&
      hipsolverSormqr_bufferSize_rank_1,&
      hipsolverSormqr_bufferSize_rank_1_cptr,&
      hipsolverSormqr_bufferSize_full_rank,&
      hipsolverSormqr_bufferSize_full_rank_cptr,&
      hipsolverSormqr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDormqr_bufferSize
    function hipsolverDormqr_bufferSize_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork) &
        bind(c, name="hipsolverDormqr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormqr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double) :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDormqr_bufferSize_assumed_rank,&
      hipsolverDormqr_bufferSize_assumed_rank_cptr,&
      hipsolverDormqr_bufferSize_typed
#else
    module procedure &
      hipsolverDormqr_bufferSize_rank_0,&
      hipsolverDormqr_bufferSize_rank_0_cptr,&
      hipsolverDormqr_bufferSize_rank_1,&
      hipsolverDormqr_bufferSize_rank_1_cptr,&
      hipsolverDormqr_bufferSize_full_rank,&
      hipsolverDormqr_bufferSize_full_rank_cptr,&
      hipsolverDormqr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverCunmqr_bufferSize
    function hipsolverCunmqr_bufferSize_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork) &
        bind(c, name="hipsolverCunmqr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmqr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_float_complex) :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCunmqr_bufferSize_assumed_rank,&
      hipsolverCunmqr_bufferSize_assumed_rank_cptr,&
      hipsolverCunmqr_bufferSize_typed
#else
    module procedure &
      hipsolverCunmqr_bufferSize_rank_0,&
      hipsolverCunmqr_bufferSize_rank_0_cptr,&
      hipsolverCunmqr_bufferSize_rank_1,&
      hipsolverCunmqr_bufferSize_rank_1_cptr,&
      hipsolverCunmqr_bufferSize_full_rank,&
      hipsolverCunmqr_bufferSize_full_rank_cptr,&
      hipsolverCunmqr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverZunmqr_bufferSize
    function hipsolverZunmqr_bufferSize_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork) &
        bind(c, name="hipsolverZunmqr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmqr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_double_complex) :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZunmqr_bufferSize_assumed_rank,&
      hipsolverZunmqr_bufferSize_assumed_rank_cptr,&
      hipsolverZunmqr_bufferSize_typed
#else
    module procedure &
      hipsolverZunmqr_bufferSize_rank_0,&
      hipsolverZunmqr_bufferSize_rank_0_cptr,&
      hipsolverZunmqr_bufferSize_rank_1,&
      hipsolverZunmqr_bufferSize_rank_1_cptr,&
      hipsolverZunmqr_bufferSize_full_rank,&
      hipsolverZunmqr_bufferSize_full_rank_cptr,&
      hipsolverZunmqr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverSormqr
    function hipsolverSormqr_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="hipsolverSormqr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormqr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float) :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSormqr_assumed_rank,&
      hipsolverSormqr_assumed_rank_cptr,&
      hipsolverSormqr_typed
#else
    module procedure &
      hipsolverSormqr_rank_0,&
      hipsolverSormqr_rank_0_cptr,&
      hipsolverSormqr_rank_1,&
      hipsolverSormqr_rank_1_cptr,&
      hipsolverSormqr_full_rank,&
      hipsolverSormqr_full_rank_cptr,&
      hipsolverSormqr_typed
#endif
#endif
  end interface

  interface hipsolverDormqr
    function hipsolverDormqr_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="hipsolverDormqr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormqr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double) :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDormqr_assumed_rank,&
      hipsolverDormqr_assumed_rank_cptr,&
      hipsolverDormqr_typed
#else
    module procedure &
      hipsolverDormqr_rank_0,&
      hipsolverDormqr_rank_0_cptr,&
      hipsolverDormqr_rank_1,&
      hipsolverDormqr_rank_1_cptr,&
      hipsolverDormqr_full_rank,&
      hipsolverDormqr_full_rank_cptr,&
      hipsolverDormqr_typed
#endif
#endif
  end interface

  interface hipsolverCunmqr
    function hipsolverCunmqr_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="hipsolverCunmqr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmqr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_float_complex) :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCunmqr_assumed_rank,&
      hipsolverCunmqr_assumed_rank_cptr,&
      hipsolverCunmqr_typed
#else
    module procedure &
      hipsolverCunmqr_rank_0,&
      hipsolverCunmqr_rank_0_cptr,&
      hipsolverCunmqr_rank_1,&
      hipsolverCunmqr_rank_1_cptr,&
      hipsolverCunmqr_full_rank,&
      hipsolverCunmqr_full_rank_cptr,&
      hipsolverCunmqr_typed
#endif
#endif
  end interface

  interface hipsolverZunmqr
    function hipsolverZunmqr_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="hipsolverZunmqr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmqr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_double_complex) :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZunmqr_assumed_rank,&
      hipsolverZunmqr_assumed_rank_cptr,&
      hipsolverZunmqr_typed
#else
    module procedure &
      hipsolverZunmqr_rank_0,&
      hipsolverZunmqr_rank_0_cptr,&
      hipsolverZunmqr_rank_1,&
      hipsolverZunmqr_rank_1_cptr,&
      hipsolverZunmqr_full_rank,&
      hipsolverZunmqr_full_rank_cptr,&
      hipsolverZunmqr_typed
#endif
#endif
  end interface

  interface hipsolverSormtr_bufferSize
    function hipsolverSormtr_bufferSize_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork) &
        bind(c, name="hipsolverSormtr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormtr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float) :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSormtr_bufferSize_assumed_rank,&
      hipsolverSormtr_bufferSize_assumed_rank_cptr,&
      hipsolverSormtr_bufferSize_typed
#else
    module procedure &
      hipsolverSormtr_bufferSize_rank_0,&
      hipsolverSormtr_bufferSize_rank_0_cptr,&
      hipsolverSormtr_bufferSize_rank_1,&
      hipsolverSormtr_bufferSize_rank_1_cptr,&
      hipsolverSormtr_bufferSize_full_rank,&
      hipsolverSormtr_bufferSize_full_rank_cptr,&
      hipsolverSormtr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDormtr_bufferSize
    function hipsolverDormtr_bufferSize_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork) &
        bind(c, name="hipsolverDormtr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormtr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double) :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDormtr_bufferSize_assumed_rank,&
      hipsolverDormtr_bufferSize_assumed_rank_cptr,&
      hipsolverDormtr_bufferSize_typed
#else
    module procedure &
      hipsolverDormtr_bufferSize_rank_0,&
      hipsolverDormtr_bufferSize_rank_0_cptr,&
      hipsolverDormtr_bufferSize_rank_1,&
      hipsolverDormtr_bufferSize_rank_1_cptr,&
      hipsolverDormtr_bufferSize_full_rank,&
      hipsolverDormtr_bufferSize_full_rank_cptr,&
      hipsolverDormtr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverCunmtr_bufferSize
    function hipsolverCunmtr_bufferSize_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork) &
        bind(c, name="hipsolverCunmtr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmtr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_float_complex) :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCunmtr_bufferSize_assumed_rank,&
      hipsolverCunmtr_bufferSize_assumed_rank_cptr,&
      hipsolverCunmtr_bufferSize_typed
#else
    module procedure &
      hipsolverCunmtr_bufferSize_rank_0,&
      hipsolverCunmtr_bufferSize_rank_0_cptr,&
      hipsolverCunmtr_bufferSize_rank_1,&
      hipsolverCunmtr_bufferSize_rank_1_cptr,&
      hipsolverCunmtr_bufferSize_full_rank,&
      hipsolverCunmtr_bufferSize_full_rank_cptr,&
      hipsolverCunmtr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverZunmtr_bufferSize
    function hipsolverZunmtr_bufferSize_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork) &
        bind(c, name="hipsolverZunmtr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmtr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_double_complex) :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZunmtr_bufferSize_assumed_rank,&
      hipsolverZunmtr_bufferSize_assumed_rank_cptr,&
      hipsolverZunmtr_bufferSize_typed
#else
    module procedure &
      hipsolverZunmtr_bufferSize_rank_0,&
      hipsolverZunmtr_bufferSize_rank_0_cptr,&
      hipsolverZunmtr_bufferSize_rank_1,&
      hipsolverZunmtr_bufferSize_rank_1_cptr,&
      hipsolverZunmtr_bufferSize_full_rank,&
      hipsolverZunmtr_bufferSize_full_rank_cptr,&
      hipsolverZunmtr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverSormtr
    function hipsolverSormtr_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="hipsolverSormtr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormtr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float) :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSormtr_assumed_rank,&
      hipsolverSormtr_assumed_rank_cptr,&
      hipsolverSormtr_typed
#else
    module procedure &
      hipsolverSormtr_rank_0,&
      hipsolverSormtr_rank_0_cptr,&
      hipsolverSormtr_rank_1,&
      hipsolverSormtr_rank_1_cptr,&
      hipsolverSormtr_full_rank,&
      hipsolverSormtr_full_rank_cptr,&
      hipsolverSormtr_typed
#endif
#endif
  end interface

  interface hipsolverDormtr
    function hipsolverDormtr_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="hipsolverDormtr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormtr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double) :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDormtr_assumed_rank,&
      hipsolverDormtr_assumed_rank_cptr,&
      hipsolverDormtr_typed
#else
    module procedure &
      hipsolverDormtr_rank_0,&
      hipsolverDormtr_rank_0_cptr,&
      hipsolverDormtr_rank_1,&
      hipsolverDormtr_rank_1_cptr,&
      hipsolverDormtr_full_rank,&
      hipsolverDormtr_full_rank_cptr,&
      hipsolverDormtr_typed
#endif
#endif
  end interface

  interface hipsolverCunmtr
    function hipsolverCunmtr_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="hipsolverCunmtr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmtr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_float_complex) :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCunmtr_assumed_rank,&
      hipsolverCunmtr_assumed_rank_cptr,&
      hipsolverCunmtr_typed
#else
    module procedure &
      hipsolverCunmtr_rank_0,&
      hipsolverCunmtr_rank_0_cptr,&
      hipsolverCunmtr_rank_1,&
      hipsolverCunmtr_rank_1_cptr,&
      hipsolverCunmtr_full_rank,&
      hipsolverCunmtr_full_rank_cptr,&
      hipsolverCunmtr_typed
#endif
#endif
  end interface

  interface hipsolverZunmtr
    function hipsolverZunmtr_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="hipsolverZunmtr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmtr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_double_complex) :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZunmtr_assumed_rank,&
      hipsolverZunmtr_assumed_rank_cptr,&
      hipsolverZunmtr_typed
#else
    module procedure &
      hipsolverZunmtr_rank_0,&
      hipsolverZunmtr_rank_0_cptr,&
      hipsolverZunmtr_rank_1,&
      hipsolverZunmtr_rank_1_cptr,&
      hipsolverZunmtr_full_rank,&
      hipsolverZunmtr_full_rank_cptr,&
      hipsolverZunmtr_typed
#endif
#endif
  end interface

  interface hipsolverSgebrd_bufferSize
    function hipsolverSgebrd_bufferSize_(handle,m,n,lwork) &
        bind(c, name="hipsolverSgebrd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgebrd_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverSgebrd_bufferSize_typed
#endif
  end interface

  interface hipsolverDgebrd_bufferSize
    function hipsolverDgebrd_bufferSize_(handle,m,n,lwork) &
        bind(c, name="hipsolverDgebrd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgebrd_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDgebrd_bufferSize_typed
#endif
  end interface

  interface hipsolverCgebrd_bufferSize
    function hipsolverCgebrd_bufferSize_(handle,m,n,lwork) &
        bind(c, name="hipsolverCgebrd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgebrd_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverCgebrd_bufferSize_typed
#endif
  end interface

  interface hipsolverZgebrd_bufferSize
    function hipsolverZgebrd_bufferSize_(handle,m,n,lwork) &
        bind(c, name="hipsolverZgebrd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgebrd_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverZgebrd_bufferSize_typed
#endif
  end interface

  interface hipsolverSgebrd
    function hipsolverSgebrd_(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo) &
        bind(c, name="hipsolverSgebrd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgebrd_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      type(c_ptr),value :: tauq
      type(c_ptr),value :: taup
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSgebrd_assumed_rank,&
      hipsolverSgebrd_assumed_rank_cptr,&
      hipsolverSgebrd_typed
#else
    module procedure &
      hipsolverSgebrd_rank_0,&
      hipsolverSgebrd_rank_0_cptr,&
      hipsolverSgebrd_rank_1,&
      hipsolverSgebrd_rank_1_cptr,&
      hipsolverSgebrd_full_rank,&
      hipsolverSgebrd_full_rank_cptr,&
      hipsolverSgebrd_typed
#endif
#endif
  end interface

  interface hipsolverDgebrd
    function hipsolverDgebrd_(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo) &
        bind(c, name="hipsolverDgebrd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgebrd_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      type(c_ptr),value :: tauq
      type(c_ptr),value :: taup
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDgebrd_assumed_rank,&
      hipsolverDgebrd_assumed_rank_cptr,&
      hipsolverDgebrd_typed
#else
    module procedure &
      hipsolverDgebrd_rank_0,&
      hipsolverDgebrd_rank_0_cptr,&
      hipsolverDgebrd_rank_1,&
      hipsolverDgebrd_rank_1_cptr,&
      hipsolverDgebrd_full_rank,&
      hipsolverDgebrd_full_rank_cptr,&
      hipsolverDgebrd_typed
#endif
#endif
  end interface

  interface hipsolverCgebrd
    function hipsolverCgebrd_(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo) &
        bind(c, name="hipsolverCgebrd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgebrd_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      type(c_ptr),value :: tauq
      type(c_ptr),value :: taup
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCgebrd_assumed_rank,&
      hipsolverCgebrd_assumed_rank_cptr,&
      hipsolverCgebrd_typed
#else
    module procedure &
      hipsolverCgebrd_rank_0,&
      hipsolverCgebrd_rank_0_cptr,&
      hipsolverCgebrd_rank_1,&
      hipsolverCgebrd_rank_1_cptr,&
      hipsolverCgebrd_full_rank,&
      hipsolverCgebrd_full_rank_cptr,&
      hipsolverCgebrd_typed
#endif
#endif
  end interface

  interface hipsolverZgebrd
    function hipsolverZgebrd_(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo) &
        bind(c, name="hipsolverZgebrd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgebrd_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      type(c_ptr),value :: tauq
      type(c_ptr),value :: taup
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZgebrd_assumed_rank,&
      hipsolverZgebrd_assumed_rank_cptr,&
      hipsolverZgebrd_typed
#else
    module procedure &
      hipsolverZgebrd_rank_0,&
      hipsolverZgebrd_rank_0_cptr,&
      hipsolverZgebrd_rank_1,&
      hipsolverZgebrd_rank_1_cptr,&
      hipsolverZgebrd_full_rank,&
      hipsolverZgebrd_full_rank_cptr,&
      hipsolverZgebrd_typed
#endif
#endif
  end interface

  interface hipsolverSSgels_bufferSize
    function hipsolverSSgels_bufferSize_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,lwork) &
        bind(c, name="hipsolverSSgels_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSSgels_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      integer(c_size_t) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSSgels_bufferSize_assumed_rank,&
      hipsolverSSgels_bufferSize_assumed_rank_cptr,&
      hipsolverSSgels_bufferSize_typed
#else
    module procedure &
      hipsolverSSgels_bufferSize_rank_0,&
      hipsolverSSgels_bufferSize_rank_0_cptr,&
      hipsolverSSgels_bufferSize_rank_1,&
      hipsolverSSgels_bufferSize_rank_1_cptr,&
      hipsolverSSgels_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDDgels_bufferSize
    function hipsolverDDgels_bufferSize_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,lwork) &
        bind(c, name="hipsolverDDgels_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDDgels_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      integer(c_size_t) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDDgels_bufferSize_assumed_rank,&
      hipsolverDDgels_bufferSize_assumed_rank_cptr,&
      hipsolverDDgels_bufferSize_typed
#else
    module procedure &
      hipsolverDDgels_bufferSize_rank_0,&
      hipsolverDDgels_bufferSize_rank_0_cptr,&
      hipsolverDDgels_bufferSize_rank_1,&
      hipsolverDDgels_bufferSize_rank_1_cptr,&
      hipsolverDDgels_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverCCgels_bufferSize
    function hipsolverCCgels_bufferSize_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,lwork) &
        bind(c, name="hipsolverCCgels_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCCgels_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      integer(c_size_t) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCCgels_bufferSize_assumed_rank,&
      hipsolverCCgels_bufferSize_assumed_rank_cptr,&
      hipsolverCCgels_bufferSize_typed
#else
    module procedure &
      hipsolverCCgels_bufferSize_rank_0,&
      hipsolverCCgels_bufferSize_rank_0_cptr,&
      hipsolverCCgels_bufferSize_rank_1,&
      hipsolverCCgels_bufferSize_rank_1_cptr,&
      hipsolverCCgels_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverZZgels_bufferSize
    function hipsolverZZgels_bufferSize_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,lwork) &
        bind(c, name="hipsolverZZgels_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZZgels_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      integer(c_size_t) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZZgels_bufferSize_assumed_rank,&
      hipsolverZZgels_bufferSize_assumed_rank_cptr,&
      hipsolverZZgels_bufferSize_typed
#else
    module procedure &
      hipsolverZZgels_bufferSize_rank_0,&
      hipsolverZZgels_bufferSize_rank_0_cptr,&
      hipsolverZZgels_bufferSize_rank_1,&
      hipsolverZZgels_bufferSize_rank_1_cptr,&
      hipsolverZZgels_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverSSgels
    function hipsolverSSgels_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="hipsolverSSgels")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSSgels_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      type(c_ptr),value :: work
      integer(c_size_t),value :: lwork
      type(c_ptr),value :: niters
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSSgels_assumed_rank,&
      hipsolverSSgels_assumed_rank_cptr,&
      hipsolverSSgels_typed
#else
    module procedure &
      hipsolverSSgels_rank_0,&
      hipsolverSSgels_rank_0_cptr,&
      hipsolverSSgels_rank_1,&
      hipsolverSSgels_rank_1_cptr,&
      hipsolverSSgels_typed
#endif
#endif
  end interface

  interface hipsolverDDgels
    function hipsolverDDgels_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="hipsolverDDgels")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDDgels_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      type(c_ptr),value :: work
      integer(c_size_t),value :: lwork
      type(c_ptr),value :: niters
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDDgels_assumed_rank,&
      hipsolverDDgels_assumed_rank_cptr,&
      hipsolverDDgels_typed
#else
    module procedure &
      hipsolverDDgels_rank_0,&
      hipsolverDDgels_rank_0_cptr,&
      hipsolverDDgels_rank_1,&
      hipsolverDDgels_rank_1_cptr,&
      hipsolverDDgels_typed
#endif
#endif
  end interface

  interface hipsolverCCgels
    function hipsolverCCgels_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="hipsolverCCgels")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCCgels_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      type(c_ptr),value :: work
      integer(c_size_t),value :: lwork
      type(c_ptr),value :: niters
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCCgels_assumed_rank,&
      hipsolverCCgels_assumed_rank_cptr,&
      hipsolverCCgels_typed
#else
    module procedure &
      hipsolverCCgels_rank_0,&
      hipsolverCCgels_rank_0_cptr,&
      hipsolverCCgels_rank_1,&
      hipsolverCCgels_rank_1_cptr,&
      hipsolverCCgels_typed
#endif
#endif
  end interface

  interface hipsolverZZgels
    function hipsolverZZgels_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="hipsolverZZgels")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZZgels_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      type(c_ptr),value :: work
      integer(c_size_t),value :: lwork
      type(c_ptr),value :: niters
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZZgels_assumed_rank,&
      hipsolverZZgels_assumed_rank_cptr,&
      hipsolverZZgels_typed
#else
    module procedure &
      hipsolverZZgels_rank_0,&
      hipsolverZZgels_rank_0_cptr,&
      hipsolverZZgels_rank_1,&
      hipsolverZZgels_rank_1_cptr,&
      hipsolverZZgels_typed
#endif
#endif
  end interface

  interface hipsolverSgeqrf_bufferSize
    function hipsolverSgeqrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="hipsolverSgeqrf_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgeqrf_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSgeqrf_bufferSize_assumed_rank,&
      hipsolverSgeqrf_bufferSize_assumed_rank_cptr,&
      hipsolverSgeqrf_bufferSize_typed
#else
    module procedure &
      hipsolverSgeqrf_bufferSize_rank_0,&
      hipsolverSgeqrf_bufferSize_rank_0_cptr,&
      hipsolverSgeqrf_bufferSize_rank_1,&
      hipsolverSgeqrf_bufferSize_rank_1_cptr,&
      hipsolverSgeqrf_bufferSize_full_rank,&
      hipsolverSgeqrf_bufferSize_full_rank_cptr,&
      hipsolverSgeqrf_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDgeqrf_bufferSize
    function hipsolverDgeqrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="hipsolverDgeqrf_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgeqrf_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDgeqrf_bufferSize_assumed_rank,&
      hipsolverDgeqrf_bufferSize_assumed_rank_cptr,&
      hipsolverDgeqrf_bufferSize_typed
#else
    module procedure &
      hipsolverDgeqrf_bufferSize_rank_0,&
      hipsolverDgeqrf_bufferSize_rank_0_cptr,&
      hipsolverDgeqrf_bufferSize_rank_1,&
      hipsolverDgeqrf_bufferSize_rank_1_cptr,&
      hipsolverDgeqrf_bufferSize_full_rank,&
      hipsolverDgeqrf_bufferSize_full_rank_cptr,&
      hipsolverDgeqrf_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverCgeqrf_bufferSize
    function hipsolverCgeqrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="hipsolverCgeqrf_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgeqrf_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCgeqrf_bufferSize_assumed_rank,&
      hipsolverCgeqrf_bufferSize_assumed_rank_cptr,&
      hipsolverCgeqrf_bufferSize_typed
#else
    module procedure &
      hipsolverCgeqrf_bufferSize_rank_0,&
      hipsolverCgeqrf_bufferSize_rank_0_cptr,&
      hipsolverCgeqrf_bufferSize_rank_1,&
      hipsolverCgeqrf_bufferSize_rank_1_cptr,&
      hipsolverCgeqrf_bufferSize_full_rank,&
      hipsolverCgeqrf_bufferSize_full_rank_cptr,&
      hipsolverCgeqrf_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverZgeqrf_bufferSize
    function hipsolverZgeqrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="hipsolverZgeqrf_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgeqrf_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZgeqrf_bufferSize_assumed_rank,&
      hipsolverZgeqrf_bufferSize_assumed_rank_cptr,&
      hipsolverZgeqrf_bufferSize_typed
#else
    module procedure &
      hipsolverZgeqrf_bufferSize_rank_0,&
      hipsolverZgeqrf_bufferSize_rank_0_cptr,&
      hipsolverZgeqrf_bufferSize_rank_1,&
      hipsolverZgeqrf_bufferSize_rank_1_cptr,&
      hipsolverZgeqrf_bufferSize_full_rank,&
      hipsolverZgeqrf_bufferSize_full_rank_cptr,&
      hipsolverZgeqrf_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverSgeqrf
    function hipsolverSgeqrf_(handle,m,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverSgeqrf")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgeqrf_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSgeqrf_assumed_rank,&
      hipsolverSgeqrf_assumed_rank_cptr,&
      hipsolverSgeqrf_typed
#else
    module procedure &
      hipsolverSgeqrf_rank_0,&
      hipsolverSgeqrf_rank_0_cptr,&
      hipsolverSgeqrf_rank_1,&
      hipsolverSgeqrf_rank_1_cptr,&
      hipsolverSgeqrf_full_rank,&
      hipsolverSgeqrf_full_rank_cptr,&
      hipsolverSgeqrf_typed
#endif
#endif
  end interface

  interface hipsolverDgeqrf
    function hipsolverDgeqrf_(handle,m,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDgeqrf")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgeqrf_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDgeqrf_assumed_rank,&
      hipsolverDgeqrf_assumed_rank_cptr,&
      hipsolverDgeqrf_typed
#else
    module procedure &
      hipsolverDgeqrf_rank_0,&
      hipsolverDgeqrf_rank_0_cptr,&
      hipsolverDgeqrf_rank_1,&
      hipsolverDgeqrf_rank_1_cptr,&
      hipsolverDgeqrf_full_rank,&
      hipsolverDgeqrf_full_rank_cptr,&
      hipsolverDgeqrf_typed
#endif
#endif
  end interface

  interface hipsolverCgeqrf
    function hipsolverCgeqrf_(handle,m,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverCgeqrf")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgeqrf_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_float_complex) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCgeqrf_assumed_rank,&
      hipsolverCgeqrf_assumed_rank_cptr,&
      hipsolverCgeqrf_typed
#else
    module procedure &
      hipsolverCgeqrf_rank_0,&
      hipsolverCgeqrf_rank_0_cptr,&
      hipsolverCgeqrf_rank_1,&
      hipsolverCgeqrf_rank_1_cptr,&
      hipsolverCgeqrf_full_rank,&
      hipsolverCgeqrf_full_rank_cptr,&
      hipsolverCgeqrf_typed
#endif
#endif
  end interface

  interface hipsolverZgeqrf
    function hipsolverZgeqrf_(handle,m,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverZgeqrf")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgeqrf_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_double_complex) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZgeqrf_assumed_rank,&
      hipsolverZgeqrf_assumed_rank_cptr,&
      hipsolverZgeqrf_typed
#else
    module procedure &
      hipsolverZgeqrf_rank_0,&
      hipsolverZgeqrf_rank_0_cptr,&
      hipsolverZgeqrf_rank_1,&
      hipsolverZgeqrf_rank_1_cptr,&
      hipsolverZgeqrf_full_rank,&
      hipsolverZgeqrf_full_rank_cptr,&
      hipsolverZgeqrf_typed
#endif
#endif
  end interface

  interface hipsolverSSgesv_bufferSize
    function hipsolverSSgesv_bufferSize_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,lwork) &
        bind(c, name="hipsolverSSgesv_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSSgesv_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      integer(c_size_t) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSSgesv_bufferSize_assumed_rank,&
      hipsolverSSgesv_bufferSize_assumed_rank_cptr,&
      hipsolverSSgesv_bufferSize_typed
#else
    module procedure &
      hipsolverSSgesv_bufferSize_rank_0,&
      hipsolverSSgesv_bufferSize_rank_0_cptr,&
      hipsolverSSgesv_bufferSize_rank_1,&
      hipsolverSSgesv_bufferSize_rank_1_cptr,&
      hipsolverSSgesv_bufferSize_full_rank,&
      hipsolverSSgesv_bufferSize_full_rank_cptr,&
      hipsolverSSgesv_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDDgesv_bufferSize
    function hipsolverDDgesv_bufferSize_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,lwork) &
        bind(c, name="hipsolverDDgesv_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDDgesv_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      integer(c_size_t) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDDgesv_bufferSize_assumed_rank,&
      hipsolverDDgesv_bufferSize_assumed_rank_cptr,&
      hipsolverDDgesv_bufferSize_typed
#else
    module procedure &
      hipsolverDDgesv_bufferSize_rank_0,&
      hipsolverDDgesv_bufferSize_rank_0_cptr,&
      hipsolverDDgesv_bufferSize_rank_1,&
      hipsolverDDgesv_bufferSize_rank_1_cptr,&
      hipsolverDDgesv_bufferSize_full_rank,&
      hipsolverDDgesv_bufferSize_full_rank_cptr,&
      hipsolverDDgesv_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverCCgesv_bufferSize
    function hipsolverCCgesv_bufferSize_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,lwork) &
        bind(c, name="hipsolverCCgesv_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCCgesv_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      integer(c_size_t) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCCgesv_bufferSize_assumed_rank,&
      hipsolverCCgesv_bufferSize_assumed_rank_cptr,&
      hipsolverCCgesv_bufferSize_typed
#else
    module procedure &
      hipsolverCCgesv_bufferSize_rank_0,&
      hipsolverCCgesv_bufferSize_rank_0_cptr,&
      hipsolverCCgesv_bufferSize_rank_1,&
      hipsolverCCgesv_bufferSize_rank_1_cptr,&
      hipsolverCCgesv_bufferSize_full_rank,&
      hipsolverCCgesv_bufferSize_full_rank_cptr,&
      hipsolverCCgesv_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverZZgesv_bufferSize
    function hipsolverZZgesv_bufferSize_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,lwork) &
        bind(c, name="hipsolverZZgesv_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZZgesv_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      integer(c_size_t) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZZgesv_bufferSize_assumed_rank,&
      hipsolverZZgesv_bufferSize_assumed_rank_cptr,&
      hipsolverZZgesv_bufferSize_typed
#else
    module procedure &
      hipsolverZZgesv_bufferSize_rank_0,&
      hipsolverZZgesv_bufferSize_rank_0_cptr,&
      hipsolverZZgesv_bufferSize_rank_1,&
      hipsolverZZgesv_bufferSize_rank_1_cptr,&
      hipsolverZZgesv_bufferSize_full_rank,&
      hipsolverZZgesv_bufferSize_full_rank_cptr,&
      hipsolverZZgesv_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverSSgesv
    function hipsolverSSgesv_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="hipsolverSSgesv")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSSgesv_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      type(c_ptr),value :: work
      integer(c_size_t),value :: lwork
      type(c_ptr),value :: niters
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSSgesv_assumed_rank,&
      hipsolverSSgesv_assumed_rank_cptr,&
      hipsolverSSgesv_typed
#else
    module procedure &
      hipsolverSSgesv_rank_0,&
      hipsolverSSgesv_rank_0_cptr,&
      hipsolverSSgesv_rank_1,&
      hipsolverSSgesv_rank_1_cptr,&
      hipsolverSSgesv_full_rank,&
      hipsolverSSgesv_full_rank_cptr,&
      hipsolverSSgesv_typed
#endif
#endif
  end interface

  interface hipsolverDDgesv
    function hipsolverDDgesv_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="hipsolverDDgesv")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDDgesv_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      type(c_ptr),value :: work
      integer(c_size_t),value :: lwork
      type(c_ptr),value :: niters
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDDgesv_assumed_rank,&
      hipsolverDDgesv_assumed_rank_cptr,&
      hipsolverDDgesv_typed
#else
    module procedure &
      hipsolverDDgesv_rank_0,&
      hipsolverDDgesv_rank_0_cptr,&
      hipsolverDDgesv_rank_1,&
      hipsolverDDgesv_rank_1_cptr,&
      hipsolverDDgesv_full_rank,&
      hipsolverDDgesv_full_rank_cptr,&
      hipsolverDDgesv_typed
#endif
#endif
  end interface

  interface hipsolverCCgesv
    function hipsolverCCgesv_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="hipsolverCCgesv")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCCgesv_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      type(c_ptr),value :: work
      integer(c_size_t),value :: lwork
      type(c_ptr),value :: niters
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCCgesv_assumed_rank,&
      hipsolverCCgesv_assumed_rank_cptr,&
      hipsolverCCgesv_typed
#else
    module procedure &
      hipsolverCCgesv_rank_0,&
      hipsolverCCgesv_rank_0_cptr,&
      hipsolverCCgesv_rank_1,&
      hipsolverCCgesv_rank_1_cptr,&
      hipsolverCCgesv_full_rank,&
      hipsolverCCgesv_full_rank_cptr,&
      hipsolverCCgesv_typed
#endif
#endif
  end interface

  interface hipsolverZZgesv
    function hipsolverZZgesv_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="hipsolverZZgesv")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZZgesv_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      type(c_ptr),value :: work
      integer(c_size_t),value :: lwork
      type(c_ptr),value :: niters
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZZgesv_assumed_rank,&
      hipsolverZZgesv_assumed_rank_cptr,&
      hipsolverZZgesv_typed
#else
    module procedure &
      hipsolverZZgesv_rank_0,&
      hipsolverZZgesv_rank_0_cptr,&
      hipsolverZZgesv_rank_1,&
      hipsolverZZgesv_rank_1_cptr,&
      hipsolverZZgesv_full_rank,&
      hipsolverZZgesv_full_rank_cptr,&
      hipsolverZZgesv_typed
#endif
#endif
  end interface

  interface hipsolverSgesvd_bufferSize
    function hipsolverSgesvd_bufferSize_(handle,jobu,jobv,m,n,lwork) &
        bind(c, name="hipsolverSgesvd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgesvd_bufferSize_
      type(c_ptr),value :: handle
      character(c_char),value :: jobu
      character(c_char),value :: jobv
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverSgesvd_bufferSize_typed
#endif
  end interface

  interface hipsolverDgesvd_bufferSize
    function hipsolverDgesvd_bufferSize_(handle,jobu,jobv,m,n,lwork) &
        bind(c, name="hipsolverDgesvd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgesvd_bufferSize_
      type(c_ptr),value :: handle
      character(c_char),value :: jobu
      character(c_char),value :: jobv
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDgesvd_bufferSize_typed
#endif
  end interface

  interface hipsolverCgesvd_bufferSize
    function hipsolverCgesvd_bufferSize_(handle,jobu,jobv,m,n,lwork) &
        bind(c, name="hipsolverCgesvd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgesvd_bufferSize_
      type(c_ptr),value :: handle
      character(c_char),value :: jobu
      character(c_char),value :: jobv
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverCgesvd_bufferSize_typed
#endif
  end interface

  interface hipsolverZgesvd_bufferSize
    function hipsolverZgesvd_bufferSize_(handle,jobu,jobv,m,n,lwork) &
        bind(c, name="hipsolverZgesvd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgesvd_bufferSize_
      type(c_ptr),value :: handle
      character(c_char),value :: jobu
      character(c_char),value :: jobv
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverZgesvd_bufferSize_typed
#endif
  end interface

  interface hipsolverSgesvd
    function hipsolverSgesvd_(handle,jobu,jobv,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,rwork,devInfo) &
        bind(c, name="hipsolverSgesvd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgesvd_
      type(c_ptr),value :: handle
      character(c_char),value :: jobu
      character(c_char),value :: jobv
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: rwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSgesvd_assumed_rank,&
      hipsolverSgesvd_assumed_rank_cptr,&
      hipsolverSgesvd_typed
#else
    module procedure &
      hipsolverSgesvd_rank_0,&
      hipsolverSgesvd_rank_0_cptr,&
      hipsolverSgesvd_rank_1,&
      hipsolverSgesvd_rank_1_cptr,&
      hipsolverSgesvd_typed
#endif
#endif
  end interface

  interface hipsolverDgesvd
    function hipsolverDgesvd_(handle,jobu,jobv,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,rwork,devInfo) &
        bind(c, name="hipsolverDgesvd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgesvd_
      type(c_ptr),value :: handle
      character(c_char),value :: jobu
      character(c_char),value :: jobv
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: rwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDgesvd_assumed_rank,&
      hipsolverDgesvd_assumed_rank_cptr,&
      hipsolverDgesvd_typed
#else
    module procedure &
      hipsolverDgesvd_rank_0,&
      hipsolverDgesvd_rank_0_cptr,&
      hipsolverDgesvd_rank_1,&
      hipsolverDgesvd_rank_1_cptr,&
      hipsolverDgesvd_typed
#endif
#endif
  end interface

  interface hipsolverCgesvd
    function hipsolverCgesvd_(handle,jobu,jobv,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,rwork,devInfo) &
        bind(c, name="hipsolverCgesvd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgesvd_
      type(c_ptr),value :: handle
      character(c_char),value :: jobu
      character(c_char),value :: jobv
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: rwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCgesvd_assumed_rank,&
      hipsolverCgesvd_assumed_rank_cptr,&
      hipsolverCgesvd_typed
#else
    module procedure &
      hipsolverCgesvd_rank_0,&
      hipsolverCgesvd_rank_0_cptr,&
      hipsolverCgesvd_rank_1,&
      hipsolverCgesvd_rank_1_cptr,&
      hipsolverCgesvd_typed
#endif
#endif
  end interface

  interface hipsolverZgesvd
    function hipsolverZgesvd_(handle,jobu,jobv,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,rwork,devInfo) &
        bind(c, name="hipsolverZgesvd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgesvd_
      type(c_ptr),value :: handle
      character(c_char),value :: jobu
      character(c_char),value :: jobv
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: rwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZgesvd_assumed_rank,&
      hipsolverZgesvd_assumed_rank_cptr,&
      hipsolverZgesvd_typed
#else
    module procedure &
      hipsolverZgesvd_rank_0,&
      hipsolverZgesvd_rank_0_cptr,&
      hipsolverZgesvd_rank_1,&
      hipsolverZgesvd_rank_1_cptr,&
      hipsolverZgesvd_typed
#endif
#endif
  end interface

  interface hipsolverSgesvdj_bufferSize
    function hipsolverSgesvdj_bufferSize_(handle,jobz,econ,m,n,A,lda,S,U,ldu,V,ldv,lwork,params) &
        bind(c, name="hipsolverSgesvdj_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgesvdj_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: econ
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      integer(c_int) :: lwork
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSgesvdj_bufferSize_assumed_rank,&
      hipsolverSgesvdj_bufferSize_assumed_rank_cptr,&
      hipsolverSgesvdj_bufferSize_typed
#else
    module procedure &
      hipsolverSgesvdj_bufferSize_rank_0,&
      hipsolverSgesvdj_bufferSize_rank_0_cptr,&
      hipsolverSgesvdj_bufferSize_rank_1,&
      hipsolverSgesvdj_bufferSize_rank_1_cptr,&
      hipsolverSgesvdj_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDgesvdj_bufferSize
    function hipsolverDgesvdj_bufferSize_(handle,jobz,econ,m,n,A,lda,S,U,ldu,V,ldv,lwork,params) &
        bind(c, name="hipsolverDgesvdj_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgesvdj_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: econ
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      integer(c_int) :: lwork
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDgesvdj_bufferSize_assumed_rank,&
      hipsolverDgesvdj_bufferSize_assumed_rank_cptr,&
      hipsolverDgesvdj_bufferSize_typed
#else
    module procedure &
      hipsolverDgesvdj_bufferSize_rank_0,&
      hipsolverDgesvdj_bufferSize_rank_0_cptr,&
      hipsolverDgesvdj_bufferSize_rank_1,&
      hipsolverDgesvdj_bufferSize_rank_1_cptr,&
      hipsolverDgesvdj_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverCgesvdj_bufferSize
    function hipsolverCgesvdj_bufferSize_(handle,jobz,econ,m,n,A,lda,S,U,ldu,V,ldv,lwork,params) &
        bind(c, name="hipsolverCgesvdj_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgesvdj_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: econ
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      integer(c_int) :: lwork
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCgesvdj_bufferSize_assumed_rank,&
      hipsolverCgesvdj_bufferSize_assumed_rank_cptr,&
      hipsolverCgesvdj_bufferSize_typed
#else
    module procedure &
      hipsolverCgesvdj_bufferSize_rank_0,&
      hipsolverCgesvdj_bufferSize_rank_0_cptr,&
      hipsolverCgesvdj_bufferSize_rank_1,&
      hipsolverCgesvdj_bufferSize_rank_1_cptr,&
      hipsolverCgesvdj_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverZgesvdj_bufferSize
    function hipsolverZgesvdj_bufferSize_(handle,jobz,econ,m,n,A,lda,S,U,ldu,V,ldv,lwork,params) &
        bind(c, name="hipsolverZgesvdj_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgesvdj_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: econ
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      integer(c_int) :: lwork
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZgesvdj_bufferSize_assumed_rank,&
      hipsolverZgesvdj_bufferSize_assumed_rank_cptr,&
      hipsolverZgesvdj_bufferSize_typed
#else
    module procedure &
      hipsolverZgesvdj_bufferSize_rank_0,&
      hipsolverZgesvdj_bufferSize_rank_0_cptr,&
      hipsolverZgesvdj_bufferSize_rank_1,&
      hipsolverZgesvdj_bufferSize_rank_1_cptr,&
      hipsolverZgesvdj_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverSgesvdj
    function hipsolverSgesvdj_(handle,jobz,econ,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,devInfo,params) &
        bind(c, name="hipsolverSgesvdj")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgesvdj_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: econ
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSgesvdj_assumed_rank,&
      hipsolverSgesvdj_assumed_rank_cptr,&
      hipsolverSgesvdj_typed
#else
    module procedure &
      hipsolverSgesvdj_rank_0,&
      hipsolverSgesvdj_rank_0_cptr,&
      hipsolverSgesvdj_rank_1,&
      hipsolverSgesvdj_rank_1_cptr,&
      hipsolverSgesvdj_typed
#endif
#endif
  end interface

  interface hipsolverDgesvdj
    function hipsolverDgesvdj_(handle,jobz,econ,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,devInfo,params) &
        bind(c, name="hipsolverDgesvdj")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgesvdj_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: econ
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDgesvdj_assumed_rank,&
      hipsolverDgesvdj_assumed_rank_cptr,&
      hipsolverDgesvdj_typed
#else
    module procedure &
      hipsolverDgesvdj_rank_0,&
      hipsolverDgesvdj_rank_0_cptr,&
      hipsolverDgesvdj_rank_1,&
      hipsolverDgesvdj_rank_1_cptr,&
      hipsolverDgesvdj_typed
#endif
#endif
  end interface

  interface hipsolverCgesvdj
    function hipsolverCgesvdj_(handle,jobz,econ,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,devInfo,params) &
        bind(c, name="hipsolverCgesvdj")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgesvdj_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: econ
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCgesvdj_assumed_rank,&
      hipsolverCgesvdj_assumed_rank_cptr,&
      hipsolverCgesvdj_typed
#else
    module procedure &
      hipsolverCgesvdj_rank_0,&
      hipsolverCgesvdj_rank_0_cptr,&
      hipsolverCgesvdj_rank_1,&
      hipsolverCgesvdj_rank_1_cptr,&
      hipsolverCgesvdj_typed
#endif
#endif
  end interface

  interface hipsolverZgesvdj
    function hipsolverZgesvdj_(handle,jobz,econ,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,devInfo,params) &
        bind(c, name="hipsolverZgesvdj")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgesvdj_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: econ
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZgesvdj_assumed_rank,&
      hipsolverZgesvdj_assumed_rank_cptr,&
      hipsolverZgesvdj_typed
#else
    module procedure &
      hipsolverZgesvdj_rank_0,&
      hipsolverZgesvdj_rank_0_cptr,&
      hipsolverZgesvdj_rank_1,&
      hipsolverZgesvdj_rank_1_cptr,&
      hipsolverZgesvdj_typed
#endif
#endif
  end interface

  interface hipsolverSgesvdjBatched_bufferSize
    function hipsolverSgesvdjBatched_bufferSize_(handle,jobz,m,n,A,lda,S,U,ldu,V,ldv,lwork,params, &
        batch_count) &
        bind(c, name="hipsolverSgesvdjBatched_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgesvdjBatched_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      integer(c_int) :: lwork
      type(c_ptr),value :: params
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSgesvdjBatched_bufferSize_assumed_rank,&
      hipsolverSgesvdjBatched_bufferSize_assumed_rank_cptr,&
      hipsolverSgesvdjBatched_bufferSize_typed
#else
    module procedure &
      hipsolverSgesvdjBatched_bufferSize_rank_0,&
      hipsolverSgesvdjBatched_bufferSize_rank_0_cptr,&
      hipsolverSgesvdjBatched_bufferSize_rank_1,&
      hipsolverSgesvdjBatched_bufferSize_rank_1_cptr,&
      hipsolverSgesvdjBatched_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDgesvdjBatched_bufferSize
    function hipsolverDgesvdjBatched_bufferSize_(handle,jobz,m,n,A,lda,S,U,ldu,V,ldv,lwork,params, &
        batch_count) &
        bind(c, name="hipsolverDgesvdjBatched_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgesvdjBatched_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      integer(c_int) :: lwork
      type(c_ptr),value :: params
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDgesvdjBatched_bufferSize_assumed_rank,&
      hipsolverDgesvdjBatched_bufferSize_assumed_rank_cptr,&
      hipsolverDgesvdjBatched_bufferSize_typed
#else
    module procedure &
      hipsolverDgesvdjBatched_bufferSize_rank_0,&
      hipsolverDgesvdjBatched_bufferSize_rank_0_cptr,&
      hipsolverDgesvdjBatched_bufferSize_rank_1,&
      hipsolverDgesvdjBatched_bufferSize_rank_1_cptr,&
      hipsolverDgesvdjBatched_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverCgesvdjBatched_bufferSize
    function hipsolverCgesvdjBatched_bufferSize_(handle,jobz,m,n,A,lda,S,U,ldu,V,ldv,lwork,params, &
        batch_count) &
        bind(c, name="hipsolverCgesvdjBatched_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgesvdjBatched_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      integer(c_int) :: lwork
      type(c_ptr),value :: params
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCgesvdjBatched_bufferSize_assumed_rank,&
      hipsolverCgesvdjBatched_bufferSize_assumed_rank_cptr,&
      hipsolverCgesvdjBatched_bufferSize_typed
#else
    module procedure &
      hipsolverCgesvdjBatched_bufferSize_rank_0,&
      hipsolverCgesvdjBatched_bufferSize_rank_0_cptr,&
      hipsolverCgesvdjBatched_bufferSize_rank_1,&
      hipsolverCgesvdjBatched_bufferSize_rank_1_cptr,&
      hipsolverCgesvdjBatched_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverZgesvdjBatched_bufferSize
    function hipsolverZgesvdjBatched_bufferSize_(handle,jobz,m,n,A,lda,S,U,ldu,V,ldv,lwork,params, &
        batch_count) &
        bind(c, name="hipsolverZgesvdjBatched_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgesvdjBatched_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      integer(c_int) :: lwork
      type(c_ptr),value :: params
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZgesvdjBatched_bufferSize_assumed_rank,&
      hipsolverZgesvdjBatched_bufferSize_assumed_rank_cptr,&
      hipsolverZgesvdjBatched_bufferSize_typed
#else
    module procedure &
      hipsolverZgesvdjBatched_bufferSize_rank_0,&
      hipsolverZgesvdjBatched_bufferSize_rank_0_cptr,&
      hipsolverZgesvdjBatched_bufferSize_rank_1,&
      hipsolverZgesvdjBatched_bufferSize_rank_1_cptr,&
      hipsolverZgesvdjBatched_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverSgesvdjBatched
    function hipsolverSgesvdjBatched_(handle,jobz,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,devInfo, &
        params,batch_count) &
        bind(c, name="hipsolverSgesvdjBatched")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgesvdjBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
      type(c_ptr),value :: params
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSgesvdjBatched_assumed_rank,&
      hipsolverSgesvdjBatched_assumed_rank_cptr,&
      hipsolverSgesvdjBatched_typed
#else
    module procedure &
      hipsolverSgesvdjBatched_rank_0,&
      hipsolverSgesvdjBatched_rank_0_cptr,&
      hipsolverSgesvdjBatched_rank_1,&
      hipsolverSgesvdjBatched_rank_1_cptr,&
      hipsolverSgesvdjBatched_typed
#endif
#endif
  end interface

  interface hipsolverDgesvdjBatched
    function hipsolverDgesvdjBatched_(handle,jobz,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,devInfo, &
        params,batch_count) &
        bind(c, name="hipsolverDgesvdjBatched")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgesvdjBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
      type(c_ptr),value :: params
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDgesvdjBatched_assumed_rank,&
      hipsolverDgesvdjBatched_assumed_rank_cptr,&
      hipsolverDgesvdjBatched_typed
#else
    module procedure &
      hipsolverDgesvdjBatched_rank_0,&
      hipsolverDgesvdjBatched_rank_0_cptr,&
      hipsolverDgesvdjBatched_rank_1,&
      hipsolverDgesvdjBatched_rank_1_cptr,&
      hipsolverDgesvdjBatched_typed
#endif
#endif
  end interface

  interface hipsolverCgesvdjBatched
    function hipsolverCgesvdjBatched_(handle,jobz,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,devInfo, &
        params,batch_count) &
        bind(c, name="hipsolverCgesvdjBatched")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgesvdjBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
      type(c_ptr),value :: params
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCgesvdjBatched_assumed_rank,&
      hipsolverCgesvdjBatched_assumed_rank_cptr,&
      hipsolverCgesvdjBatched_typed
#else
    module procedure &
      hipsolverCgesvdjBatched_rank_0,&
      hipsolverCgesvdjBatched_rank_0_cptr,&
      hipsolverCgesvdjBatched_rank_1,&
      hipsolverCgesvdjBatched_rank_1_cptr,&
      hipsolverCgesvdjBatched_typed
#endif
#endif
  end interface

  interface hipsolverZgesvdjBatched
    function hipsolverZgesvdjBatched_(handle,jobz,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,devInfo, &
        params,batch_count) &
        bind(c, name="hipsolverZgesvdjBatched")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgesvdjBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
      type(c_ptr),value :: params
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZgesvdjBatched_assumed_rank,&
      hipsolverZgesvdjBatched_assumed_rank_cptr,&
      hipsolverZgesvdjBatched_typed
#else
    module procedure &
      hipsolverZgesvdjBatched_rank_0,&
      hipsolverZgesvdjBatched_rank_0_cptr,&
      hipsolverZgesvdjBatched_rank_1,&
      hipsolverZgesvdjBatched_rank_1_cptr,&
      hipsolverZgesvdjBatched_typed
#endif
#endif
  end interface

  interface hipsolverSgetrf_bufferSize
    function hipsolverSgetrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="hipsolverSgetrf_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrf_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSgetrf_bufferSize_assumed_rank,&
      hipsolverSgetrf_bufferSize_assumed_rank_cptr,&
      hipsolverSgetrf_bufferSize_typed
#else
    module procedure &
      hipsolverSgetrf_bufferSize_rank_0,&
      hipsolverSgetrf_bufferSize_rank_0_cptr,&
      hipsolverSgetrf_bufferSize_rank_1,&
      hipsolverSgetrf_bufferSize_rank_1_cptr,&
      hipsolverSgetrf_bufferSize_full_rank,&
      hipsolverSgetrf_bufferSize_full_rank_cptr,&
      hipsolverSgetrf_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDgetrf_bufferSize
    function hipsolverDgetrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="hipsolverDgetrf_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrf_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDgetrf_bufferSize_assumed_rank,&
      hipsolverDgetrf_bufferSize_assumed_rank_cptr,&
      hipsolverDgetrf_bufferSize_typed
#else
    module procedure &
      hipsolverDgetrf_bufferSize_rank_0,&
      hipsolverDgetrf_bufferSize_rank_0_cptr,&
      hipsolverDgetrf_bufferSize_rank_1,&
      hipsolverDgetrf_bufferSize_rank_1_cptr,&
      hipsolverDgetrf_bufferSize_full_rank,&
      hipsolverDgetrf_bufferSize_full_rank_cptr,&
      hipsolverDgetrf_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverCgetrf_bufferSize
    function hipsolverCgetrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="hipsolverCgetrf_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrf_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCgetrf_bufferSize_assumed_rank,&
      hipsolverCgetrf_bufferSize_assumed_rank_cptr,&
      hipsolverCgetrf_bufferSize_typed
#else
    module procedure &
      hipsolverCgetrf_bufferSize_rank_0,&
      hipsolverCgetrf_bufferSize_rank_0_cptr,&
      hipsolverCgetrf_bufferSize_rank_1,&
      hipsolverCgetrf_bufferSize_rank_1_cptr,&
      hipsolverCgetrf_bufferSize_full_rank,&
      hipsolverCgetrf_bufferSize_full_rank_cptr,&
      hipsolverCgetrf_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverZgetrf_bufferSize
    function hipsolverZgetrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="hipsolverZgetrf_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrf_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZgetrf_bufferSize_assumed_rank,&
      hipsolverZgetrf_bufferSize_assumed_rank_cptr,&
      hipsolverZgetrf_bufferSize_typed
#else
    module procedure &
      hipsolverZgetrf_bufferSize_rank_0,&
      hipsolverZgetrf_bufferSize_rank_0_cptr,&
      hipsolverZgetrf_bufferSize_rank_1,&
      hipsolverZgetrf_bufferSize_rank_1_cptr,&
      hipsolverZgetrf_bufferSize_full_rank,&
      hipsolverZgetrf_bufferSize_full_rank_cptr,&
      hipsolverZgetrf_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverSgetrf
    function hipsolverSgetrf_(handle,m,n,A,lda,work,lwork,devIpiv,devInfo) &
        bind(c, name="hipsolverSgetrf")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrf_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devIpiv
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSgetrf_assumed_rank,&
      hipsolverSgetrf_assumed_rank_cptr,&
      hipsolverSgetrf_typed
#else
    module procedure &
      hipsolverSgetrf_rank_0,&
      hipsolverSgetrf_rank_0_cptr,&
      hipsolverSgetrf_rank_1,&
      hipsolverSgetrf_rank_1_cptr,&
      hipsolverSgetrf_full_rank,&
      hipsolverSgetrf_full_rank_cptr,&
      hipsolverSgetrf_typed
#endif
#endif
  end interface

  interface hipsolverDgetrf
    function hipsolverDgetrf_(handle,m,n,A,lda,work,lwork,devIpiv,devInfo) &
        bind(c, name="hipsolverDgetrf")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrf_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devIpiv
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDgetrf_assumed_rank,&
      hipsolverDgetrf_assumed_rank_cptr,&
      hipsolverDgetrf_typed
#else
    module procedure &
      hipsolverDgetrf_rank_0,&
      hipsolverDgetrf_rank_0_cptr,&
      hipsolverDgetrf_rank_1,&
      hipsolverDgetrf_rank_1_cptr,&
      hipsolverDgetrf_full_rank,&
      hipsolverDgetrf_full_rank_cptr,&
      hipsolverDgetrf_typed
#endif
#endif
  end interface

  interface hipsolverCgetrf
    function hipsolverCgetrf_(handle,m,n,A,lda,work,lwork,devIpiv,devInfo) &
        bind(c, name="hipsolverCgetrf")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrf_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devIpiv
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCgetrf_assumed_rank,&
      hipsolverCgetrf_assumed_rank_cptr,&
      hipsolverCgetrf_typed
#else
    module procedure &
      hipsolverCgetrf_rank_0,&
      hipsolverCgetrf_rank_0_cptr,&
      hipsolverCgetrf_rank_1,&
      hipsolverCgetrf_rank_1_cptr,&
      hipsolverCgetrf_full_rank,&
      hipsolverCgetrf_full_rank_cptr,&
      hipsolverCgetrf_typed
#endif
#endif
  end interface

  interface hipsolverZgetrf
    function hipsolverZgetrf_(handle,m,n,A,lda,work,lwork,devIpiv,devInfo) &
        bind(c, name="hipsolverZgetrf")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrf_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devIpiv
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZgetrf_assumed_rank,&
      hipsolverZgetrf_assumed_rank_cptr,&
      hipsolverZgetrf_typed
#else
    module procedure &
      hipsolverZgetrf_rank_0,&
      hipsolverZgetrf_rank_0_cptr,&
      hipsolverZgetrf_rank_1,&
      hipsolverZgetrf_rank_1_cptr,&
      hipsolverZgetrf_full_rank,&
      hipsolverZgetrf_full_rank_cptr,&
      hipsolverZgetrf_typed
#endif
#endif
  end interface

  interface hipsolverSgetrs_bufferSize
    function hipsolverSgetrs_bufferSize_(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork) &
        bind(c, name="hipsolverSgetrs_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrs_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSgetrs_bufferSize_assumed_rank,&
      hipsolverSgetrs_bufferSize_assumed_rank_cptr,&
      hipsolverSgetrs_bufferSize_typed
#else
    module procedure &
      hipsolverSgetrs_bufferSize_rank_0,&
      hipsolverSgetrs_bufferSize_rank_0_cptr,&
      hipsolverSgetrs_bufferSize_rank_1,&
      hipsolverSgetrs_bufferSize_rank_1_cptr,&
      hipsolverSgetrs_bufferSize_full_rank,&
      hipsolverSgetrs_bufferSize_full_rank_cptr,&
      hipsolverSgetrs_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDgetrs_bufferSize
    function hipsolverDgetrs_bufferSize_(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork) &
        bind(c, name="hipsolverDgetrs_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrs_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDgetrs_bufferSize_assumed_rank,&
      hipsolverDgetrs_bufferSize_assumed_rank_cptr,&
      hipsolverDgetrs_bufferSize_typed
#else
    module procedure &
      hipsolverDgetrs_bufferSize_rank_0,&
      hipsolverDgetrs_bufferSize_rank_0_cptr,&
      hipsolverDgetrs_bufferSize_rank_1,&
      hipsolverDgetrs_bufferSize_rank_1_cptr,&
      hipsolverDgetrs_bufferSize_full_rank,&
      hipsolverDgetrs_bufferSize_full_rank_cptr,&
      hipsolverDgetrs_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverCgetrs_bufferSize
    function hipsolverCgetrs_bufferSize_(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork) &
        bind(c, name="hipsolverCgetrs_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrs_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCgetrs_bufferSize_assumed_rank,&
      hipsolverCgetrs_bufferSize_assumed_rank_cptr,&
      hipsolverCgetrs_bufferSize_typed
#else
    module procedure &
      hipsolverCgetrs_bufferSize_rank_0,&
      hipsolverCgetrs_bufferSize_rank_0_cptr,&
      hipsolverCgetrs_bufferSize_rank_1,&
      hipsolverCgetrs_bufferSize_rank_1_cptr,&
      hipsolverCgetrs_bufferSize_full_rank,&
      hipsolverCgetrs_bufferSize_full_rank_cptr,&
      hipsolverCgetrs_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverZgetrs_bufferSize
    function hipsolverZgetrs_bufferSize_(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork) &
        bind(c, name="hipsolverZgetrs_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrs_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZgetrs_bufferSize_assumed_rank,&
      hipsolverZgetrs_bufferSize_assumed_rank_cptr,&
      hipsolverZgetrs_bufferSize_typed
#else
    module procedure &
      hipsolverZgetrs_bufferSize_rank_0,&
      hipsolverZgetrs_bufferSize_rank_0_cptr,&
      hipsolverZgetrs_bufferSize_rank_1,&
      hipsolverZgetrs_bufferSize_rank_1_cptr,&
      hipsolverZgetrs_bufferSize_full_rank,&
      hipsolverZgetrs_bufferSize_full_rank_cptr,&
      hipsolverZgetrs_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverSgetrs
    function hipsolverSgetrs_(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo) &
        bind(c, name="hipsolverSgetrs")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrs_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSgetrs_assumed_rank,&
      hipsolverSgetrs_assumed_rank_cptr,&
      hipsolverSgetrs_typed
#else
    module procedure &
      hipsolverSgetrs_rank_0,&
      hipsolverSgetrs_rank_0_cptr,&
      hipsolverSgetrs_rank_1,&
      hipsolverSgetrs_rank_1_cptr,&
      hipsolverSgetrs_full_rank,&
      hipsolverSgetrs_full_rank_cptr,&
      hipsolverSgetrs_typed
#endif
#endif
  end interface

  interface hipsolverDgetrs
    function hipsolverDgetrs_(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo) &
        bind(c, name="hipsolverDgetrs")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrs_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDgetrs_assumed_rank,&
      hipsolverDgetrs_assumed_rank_cptr,&
      hipsolverDgetrs_typed
#else
    module procedure &
      hipsolverDgetrs_rank_0,&
      hipsolverDgetrs_rank_0_cptr,&
      hipsolverDgetrs_rank_1,&
      hipsolverDgetrs_rank_1_cptr,&
      hipsolverDgetrs_full_rank,&
      hipsolverDgetrs_full_rank_cptr,&
      hipsolverDgetrs_typed
#endif
#endif
  end interface

  interface hipsolverCgetrs
    function hipsolverCgetrs_(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo) &
        bind(c, name="hipsolverCgetrs")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrs_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCgetrs_assumed_rank,&
      hipsolverCgetrs_assumed_rank_cptr,&
      hipsolverCgetrs_typed
#else
    module procedure &
      hipsolverCgetrs_rank_0,&
      hipsolverCgetrs_rank_0_cptr,&
      hipsolverCgetrs_rank_1,&
      hipsolverCgetrs_rank_1_cptr,&
      hipsolverCgetrs_full_rank,&
      hipsolverCgetrs_full_rank_cptr,&
      hipsolverCgetrs_typed
#endif
#endif
  end interface

  interface hipsolverZgetrs
    function hipsolverZgetrs_(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo) &
        bind(c, name="hipsolverZgetrs")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrs_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZgetrs_assumed_rank,&
      hipsolverZgetrs_assumed_rank_cptr,&
      hipsolverZgetrs_typed
#else
    module procedure &
      hipsolverZgetrs_rank_0,&
      hipsolverZgetrs_rank_0_cptr,&
      hipsolverZgetrs_rank_1,&
      hipsolverZgetrs_rank_1_cptr,&
      hipsolverZgetrs_full_rank,&
      hipsolverZgetrs_full_rank_cptr,&
      hipsolverZgetrs_typed
#endif
#endif
  end interface

  interface hipsolverSpotrf_bufferSize
    function hipsolverSpotrf_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="hipsolverSpotrf_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrf_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSpotrf_bufferSize_assumed_rank,&
      hipsolverSpotrf_bufferSize_assumed_rank_cptr,&
      hipsolverSpotrf_bufferSize_typed
#else
    module procedure &
      hipsolverSpotrf_bufferSize_rank_0,&
      hipsolverSpotrf_bufferSize_rank_0_cptr,&
      hipsolverSpotrf_bufferSize_rank_1,&
      hipsolverSpotrf_bufferSize_rank_1_cptr,&
      hipsolverSpotrf_bufferSize_full_rank,&
      hipsolverSpotrf_bufferSize_full_rank_cptr,&
      hipsolverSpotrf_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDpotrf_bufferSize
    function hipsolverDpotrf_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="hipsolverDpotrf_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrf_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDpotrf_bufferSize_assumed_rank,&
      hipsolverDpotrf_bufferSize_assumed_rank_cptr,&
      hipsolverDpotrf_bufferSize_typed
#else
    module procedure &
      hipsolverDpotrf_bufferSize_rank_0,&
      hipsolverDpotrf_bufferSize_rank_0_cptr,&
      hipsolverDpotrf_bufferSize_rank_1,&
      hipsolverDpotrf_bufferSize_rank_1_cptr,&
      hipsolverDpotrf_bufferSize_full_rank,&
      hipsolverDpotrf_bufferSize_full_rank_cptr,&
      hipsolverDpotrf_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverCpotrf_bufferSize
    function hipsolverCpotrf_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="hipsolverCpotrf_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrf_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCpotrf_bufferSize_assumed_rank,&
      hipsolverCpotrf_bufferSize_assumed_rank_cptr,&
      hipsolverCpotrf_bufferSize_typed
#else
    module procedure &
      hipsolverCpotrf_bufferSize_rank_0,&
      hipsolverCpotrf_bufferSize_rank_0_cptr,&
      hipsolverCpotrf_bufferSize_rank_1,&
      hipsolverCpotrf_bufferSize_rank_1_cptr,&
      hipsolverCpotrf_bufferSize_full_rank,&
      hipsolverCpotrf_bufferSize_full_rank_cptr,&
      hipsolverCpotrf_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverZpotrf_bufferSize
    function hipsolverZpotrf_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="hipsolverZpotrf_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrf_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZpotrf_bufferSize_assumed_rank,&
      hipsolverZpotrf_bufferSize_assumed_rank_cptr,&
      hipsolverZpotrf_bufferSize_typed
#else
    module procedure &
      hipsolverZpotrf_bufferSize_rank_0,&
      hipsolverZpotrf_bufferSize_rank_0_cptr,&
      hipsolverZpotrf_bufferSize_rank_1,&
      hipsolverZpotrf_bufferSize_rank_1_cptr,&
      hipsolverZpotrf_bufferSize_full_rank,&
      hipsolverZpotrf_bufferSize_full_rank_cptr,&
      hipsolverZpotrf_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverSpotrf
    function hipsolverSpotrf_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="hipsolverSpotrf")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrf_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSpotrf_assumed_rank,&
      hipsolverSpotrf_assumed_rank_cptr,&
      hipsolverSpotrf_typed
#else
    module procedure &
      hipsolverSpotrf_rank_0,&
      hipsolverSpotrf_rank_0_cptr,&
      hipsolverSpotrf_rank_1,&
      hipsolverSpotrf_rank_1_cptr,&
      hipsolverSpotrf_full_rank,&
      hipsolverSpotrf_full_rank_cptr,&
      hipsolverSpotrf_typed
#endif
#endif
  end interface

  interface hipsolverDpotrf
    function hipsolverDpotrf_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="hipsolverDpotrf")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrf_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDpotrf_assumed_rank,&
      hipsolverDpotrf_assumed_rank_cptr,&
      hipsolverDpotrf_typed
#else
    module procedure &
      hipsolverDpotrf_rank_0,&
      hipsolverDpotrf_rank_0_cptr,&
      hipsolverDpotrf_rank_1,&
      hipsolverDpotrf_rank_1_cptr,&
      hipsolverDpotrf_full_rank,&
      hipsolverDpotrf_full_rank_cptr,&
      hipsolverDpotrf_typed
#endif
#endif
  end interface

  interface hipsolverCpotrf
    function hipsolverCpotrf_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="hipsolverCpotrf")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrf_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCpotrf_assumed_rank,&
      hipsolverCpotrf_assumed_rank_cptr,&
      hipsolverCpotrf_typed
#else
    module procedure &
      hipsolverCpotrf_rank_0,&
      hipsolverCpotrf_rank_0_cptr,&
      hipsolverCpotrf_rank_1,&
      hipsolverCpotrf_rank_1_cptr,&
      hipsolverCpotrf_full_rank,&
      hipsolverCpotrf_full_rank_cptr,&
      hipsolverCpotrf_typed
#endif
#endif
  end interface

  interface hipsolverZpotrf
    function hipsolverZpotrf_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="hipsolverZpotrf")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrf_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZpotrf_assumed_rank,&
      hipsolverZpotrf_assumed_rank_cptr,&
      hipsolverZpotrf_typed
#else
    module procedure &
      hipsolverZpotrf_rank_0,&
      hipsolverZpotrf_rank_0_cptr,&
      hipsolverZpotrf_rank_1,&
      hipsolverZpotrf_rank_1_cptr,&
      hipsolverZpotrf_full_rank,&
      hipsolverZpotrf_full_rank_cptr,&
      hipsolverZpotrf_typed
#endif
#endif
  end interface

  interface hipsolverSpotrfBatched_bufferSize
    function hipsolverSpotrfBatched_bufferSize_(handle,uplo,n,A,lda,lwork,batch_count) &
        bind(c, name="hipsolverSpotrfBatched_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrfBatched_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverSpotrfBatched_bufferSize_typed
#endif
  end interface

  interface hipsolverDpotrfBatched_bufferSize
    function hipsolverDpotrfBatched_bufferSize_(handle,uplo,n,A,lda,lwork,batch_count) &
        bind(c, name="hipsolverDpotrfBatched_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrfBatched_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDpotrfBatched_bufferSize_typed
#endif
  end interface

  interface hipsolverCpotrfBatched_bufferSize
    function hipsolverCpotrfBatched_bufferSize_(handle,uplo,n,A,lda,lwork,batch_count) &
        bind(c, name="hipsolverCpotrfBatched_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrfBatched_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverCpotrfBatched_bufferSize_typed
#endif
  end interface

  interface hipsolverZpotrfBatched_bufferSize
    function hipsolverZpotrfBatched_bufferSize_(handle,uplo,n,A,lda,lwork,batch_count) &
        bind(c, name="hipsolverZpotrfBatched_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrfBatched_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverZpotrfBatched_bufferSize_typed
#endif
  end interface

  interface hipsolverSpotrfBatched
    function hipsolverSpotrfBatched_(handle,uplo,n,A,lda,work,lwork,devInfo,batch_count) &
        bind(c, name="hipsolverSpotrfBatched")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrfBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverSpotrfBatched_typed
#endif
  end interface

  interface hipsolverDpotrfBatched
    function hipsolverDpotrfBatched_(handle,uplo,n,A,lda,work,lwork,devInfo,batch_count) &
        bind(c, name="hipsolverDpotrfBatched")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrfBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDpotrfBatched_typed
#endif
  end interface

  interface hipsolverCpotrfBatched
    function hipsolverCpotrfBatched_(handle,uplo,n,A,lda,work,lwork,devInfo,batch_count) &
        bind(c, name="hipsolverCpotrfBatched")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrfBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverCpotrfBatched_typed
#endif
  end interface

  interface hipsolverZpotrfBatched
    function hipsolverZpotrfBatched_(handle,uplo,n,A,lda,work,lwork,devInfo,batch_count) &
        bind(c, name="hipsolverZpotrfBatched")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrfBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverZpotrfBatched_typed
#endif
  end interface

  interface hipsolverSpotri_bufferSize
    function hipsolverSpotri_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="hipsolverSpotri_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotri_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSpotri_bufferSize_assumed_rank,&
      hipsolverSpotri_bufferSize_assumed_rank_cptr,&
      hipsolverSpotri_bufferSize_typed
#else
    module procedure &
      hipsolverSpotri_bufferSize_rank_0,&
      hipsolverSpotri_bufferSize_rank_0_cptr,&
      hipsolverSpotri_bufferSize_rank_1,&
      hipsolverSpotri_bufferSize_rank_1_cptr,&
      hipsolverSpotri_bufferSize_full_rank,&
      hipsolverSpotri_bufferSize_full_rank_cptr,&
      hipsolverSpotri_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDpotri_bufferSize
    function hipsolverDpotri_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="hipsolverDpotri_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotri_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDpotri_bufferSize_assumed_rank,&
      hipsolverDpotri_bufferSize_assumed_rank_cptr,&
      hipsolverDpotri_bufferSize_typed
#else
    module procedure &
      hipsolverDpotri_bufferSize_rank_0,&
      hipsolverDpotri_bufferSize_rank_0_cptr,&
      hipsolverDpotri_bufferSize_rank_1,&
      hipsolverDpotri_bufferSize_rank_1_cptr,&
      hipsolverDpotri_bufferSize_full_rank,&
      hipsolverDpotri_bufferSize_full_rank_cptr,&
      hipsolverDpotri_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverCpotri_bufferSize
    function hipsolverCpotri_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="hipsolverCpotri_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotri_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCpotri_bufferSize_assumed_rank,&
      hipsolverCpotri_bufferSize_assumed_rank_cptr,&
      hipsolverCpotri_bufferSize_typed
#else
    module procedure &
      hipsolverCpotri_bufferSize_rank_0,&
      hipsolverCpotri_bufferSize_rank_0_cptr,&
      hipsolverCpotri_bufferSize_rank_1,&
      hipsolverCpotri_bufferSize_rank_1_cptr,&
      hipsolverCpotri_bufferSize_full_rank,&
      hipsolverCpotri_bufferSize_full_rank_cptr,&
      hipsolverCpotri_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverZpotri_bufferSize
    function hipsolverZpotri_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="hipsolverZpotri_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotri_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZpotri_bufferSize_assumed_rank,&
      hipsolverZpotri_bufferSize_assumed_rank_cptr,&
      hipsolverZpotri_bufferSize_typed
#else
    module procedure &
      hipsolverZpotri_bufferSize_rank_0,&
      hipsolverZpotri_bufferSize_rank_0_cptr,&
      hipsolverZpotri_bufferSize_rank_1,&
      hipsolverZpotri_bufferSize_rank_1_cptr,&
      hipsolverZpotri_bufferSize_full_rank,&
      hipsolverZpotri_bufferSize_full_rank_cptr,&
      hipsolverZpotri_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverSpotri
    function hipsolverSpotri_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="hipsolverSpotri")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotri_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSpotri_assumed_rank,&
      hipsolverSpotri_assumed_rank_cptr,&
      hipsolverSpotri_typed
#else
    module procedure &
      hipsolverSpotri_rank_0,&
      hipsolverSpotri_rank_0_cptr,&
      hipsolverSpotri_rank_1,&
      hipsolverSpotri_rank_1_cptr,&
      hipsolverSpotri_full_rank,&
      hipsolverSpotri_full_rank_cptr,&
      hipsolverSpotri_typed
#endif
#endif
  end interface

  interface hipsolverDpotri
    function hipsolverDpotri_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="hipsolverDpotri")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotri_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDpotri_assumed_rank,&
      hipsolverDpotri_assumed_rank_cptr,&
      hipsolverDpotri_typed
#else
    module procedure &
      hipsolverDpotri_rank_0,&
      hipsolverDpotri_rank_0_cptr,&
      hipsolverDpotri_rank_1,&
      hipsolverDpotri_rank_1_cptr,&
      hipsolverDpotri_full_rank,&
      hipsolverDpotri_full_rank_cptr,&
      hipsolverDpotri_typed
#endif
#endif
  end interface

  interface hipsolverCpotri
    function hipsolverCpotri_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="hipsolverCpotri")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotri_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCpotri_assumed_rank,&
      hipsolverCpotri_assumed_rank_cptr,&
      hipsolverCpotri_typed
#else
    module procedure &
      hipsolverCpotri_rank_0,&
      hipsolverCpotri_rank_0_cptr,&
      hipsolverCpotri_rank_1,&
      hipsolverCpotri_rank_1_cptr,&
      hipsolverCpotri_full_rank,&
      hipsolverCpotri_full_rank_cptr,&
      hipsolverCpotri_typed
#endif
#endif
  end interface

  interface hipsolverZpotri
    function hipsolverZpotri_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="hipsolverZpotri")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotri_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZpotri_assumed_rank,&
      hipsolverZpotri_assumed_rank_cptr,&
      hipsolverZpotri_typed
#else
    module procedure &
      hipsolverZpotri_rank_0,&
      hipsolverZpotri_rank_0_cptr,&
      hipsolverZpotri_rank_1,&
      hipsolverZpotri_rank_1_cptr,&
      hipsolverZpotri_full_rank,&
      hipsolverZpotri_full_rank_cptr,&
      hipsolverZpotri_typed
#endif
#endif
  end interface

  interface hipsolverSpotrs_bufferSize
    function hipsolverSpotrs_bufferSize_(handle,uplo,n,nrhs,A,lda,B,ldb,lwork) &
        bind(c, name="hipsolverSpotrs_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrs_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSpotrs_bufferSize_assumed_rank,&
      hipsolverSpotrs_bufferSize_assumed_rank_cptr,&
      hipsolverSpotrs_bufferSize_typed
#else
    module procedure &
      hipsolverSpotrs_bufferSize_rank_0,&
      hipsolverSpotrs_bufferSize_rank_0_cptr,&
      hipsolverSpotrs_bufferSize_rank_1,&
      hipsolverSpotrs_bufferSize_rank_1_cptr,&
      hipsolverSpotrs_bufferSize_full_rank,&
      hipsolverSpotrs_bufferSize_full_rank_cptr,&
      hipsolverSpotrs_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDpotrs_bufferSize
    function hipsolverDpotrs_bufferSize_(handle,uplo,n,nrhs,A,lda,B,ldb,lwork) &
        bind(c, name="hipsolverDpotrs_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrs_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDpotrs_bufferSize_assumed_rank,&
      hipsolverDpotrs_bufferSize_assumed_rank_cptr,&
      hipsolverDpotrs_bufferSize_typed
#else
    module procedure &
      hipsolverDpotrs_bufferSize_rank_0,&
      hipsolverDpotrs_bufferSize_rank_0_cptr,&
      hipsolverDpotrs_bufferSize_rank_1,&
      hipsolverDpotrs_bufferSize_rank_1_cptr,&
      hipsolverDpotrs_bufferSize_full_rank,&
      hipsolverDpotrs_bufferSize_full_rank_cptr,&
      hipsolverDpotrs_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverCpotrs_bufferSize
    function hipsolverCpotrs_bufferSize_(handle,uplo,n,nrhs,A,lda,B,ldb,lwork) &
        bind(c, name="hipsolverCpotrs_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrs_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCpotrs_bufferSize_assumed_rank,&
      hipsolverCpotrs_bufferSize_assumed_rank_cptr,&
      hipsolverCpotrs_bufferSize_typed
#else
    module procedure &
      hipsolverCpotrs_bufferSize_rank_0,&
      hipsolverCpotrs_bufferSize_rank_0_cptr,&
      hipsolverCpotrs_bufferSize_rank_1,&
      hipsolverCpotrs_bufferSize_rank_1_cptr,&
      hipsolverCpotrs_bufferSize_full_rank,&
      hipsolverCpotrs_bufferSize_full_rank_cptr,&
      hipsolverCpotrs_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverZpotrs_bufferSize
    function hipsolverZpotrs_bufferSize_(handle,uplo,n,nrhs,A,lda,B,ldb,lwork) &
        bind(c, name="hipsolverZpotrs_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrs_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZpotrs_bufferSize_assumed_rank,&
      hipsolverZpotrs_bufferSize_assumed_rank_cptr,&
      hipsolverZpotrs_bufferSize_typed
#else
    module procedure &
      hipsolverZpotrs_bufferSize_rank_0,&
      hipsolverZpotrs_bufferSize_rank_0_cptr,&
      hipsolverZpotrs_bufferSize_rank_1,&
      hipsolverZpotrs_bufferSize_rank_1_cptr,&
      hipsolverZpotrs_bufferSize_full_rank,&
      hipsolverZpotrs_bufferSize_full_rank_cptr,&
      hipsolverZpotrs_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverSpotrs
    function hipsolverSpotrs_(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo) &
        bind(c, name="hipsolverSpotrs")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrs_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSpotrs_assumed_rank,&
      hipsolverSpotrs_assumed_rank_cptr,&
      hipsolverSpotrs_typed
#else
    module procedure &
      hipsolverSpotrs_rank_0,&
      hipsolverSpotrs_rank_0_cptr,&
      hipsolverSpotrs_rank_1,&
      hipsolverSpotrs_rank_1_cptr,&
      hipsolverSpotrs_full_rank,&
      hipsolverSpotrs_full_rank_cptr,&
      hipsolverSpotrs_typed
#endif
#endif
  end interface

  interface hipsolverDpotrs
    function hipsolverDpotrs_(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo) &
        bind(c, name="hipsolverDpotrs")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrs_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDpotrs_assumed_rank,&
      hipsolverDpotrs_assumed_rank_cptr,&
      hipsolverDpotrs_typed
#else
    module procedure &
      hipsolverDpotrs_rank_0,&
      hipsolverDpotrs_rank_0_cptr,&
      hipsolverDpotrs_rank_1,&
      hipsolverDpotrs_rank_1_cptr,&
      hipsolverDpotrs_full_rank,&
      hipsolverDpotrs_full_rank_cptr,&
      hipsolverDpotrs_typed
#endif
#endif
  end interface

  interface hipsolverCpotrs
    function hipsolverCpotrs_(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo) &
        bind(c, name="hipsolverCpotrs")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrs_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCpotrs_assumed_rank,&
      hipsolverCpotrs_assumed_rank_cptr,&
      hipsolverCpotrs_typed
#else
    module procedure &
      hipsolverCpotrs_rank_0,&
      hipsolverCpotrs_rank_0_cptr,&
      hipsolverCpotrs_rank_1,&
      hipsolverCpotrs_rank_1_cptr,&
      hipsolverCpotrs_full_rank,&
      hipsolverCpotrs_full_rank_cptr,&
      hipsolverCpotrs_typed
#endif
#endif
  end interface

  interface hipsolverZpotrs
    function hipsolverZpotrs_(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo) &
        bind(c, name="hipsolverZpotrs")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrs_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZpotrs_assumed_rank,&
      hipsolverZpotrs_assumed_rank_cptr,&
      hipsolverZpotrs_typed
#else
    module procedure &
      hipsolverZpotrs_rank_0,&
      hipsolverZpotrs_rank_0_cptr,&
      hipsolverZpotrs_rank_1,&
      hipsolverZpotrs_rank_1_cptr,&
      hipsolverZpotrs_full_rank,&
      hipsolverZpotrs_full_rank_cptr,&
      hipsolverZpotrs_typed
#endif
#endif
  end interface

  interface hipsolverSpotrsBatched_bufferSize
    function hipsolverSpotrsBatched_bufferSize_(handle,uplo,n,nrhs,A,lda,B,ldb,lwork,batch_count) &
        bind(c, name="hipsolverSpotrsBatched_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrsBatched_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int) :: lwork
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverSpotrsBatched_bufferSize_typed
#endif
  end interface

  interface hipsolverDpotrsBatched_bufferSize
    function hipsolverDpotrsBatched_bufferSize_(handle,uplo,n,nrhs,A,lda,B,ldb,lwork,batch_count) &
        bind(c, name="hipsolverDpotrsBatched_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrsBatched_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int) :: lwork
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDpotrsBatched_bufferSize_typed
#endif
  end interface

  interface hipsolverCpotrsBatched_bufferSize
    function hipsolverCpotrsBatched_bufferSize_(handle,uplo,n,nrhs,A,lda,B,ldb,lwork,batch_count) &
        bind(c, name="hipsolverCpotrsBatched_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrsBatched_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int) :: lwork
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverCpotrsBatched_bufferSize_typed
#endif
  end interface

  interface hipsolverZpotrsBatched_bufferSize
    function hipsolverZpotrsBatched_bufferSize_(handle,uplo,n,nrhs,A,lda,B,ldb,lwork,batch_count) &
        bind(c, name="hipsolverZpotrsBatched_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrsBatched_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int) :: lwork
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverZpotrsBatched_bufferSize_typed
#endif
  end interface

  interface hipsolverSpotrsBatched
    function hipsolverSpotrsBatched_(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo, &
        batch_count) &
        bind(c, name="hipsolverSpotrsBatched")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrsBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverSpotrsBatched_typed
#endif
  end interface

  interface hipsolverDpotrsBatched
    function hipsolverDpotrsBatched_(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo, &
        batch_count) &
        bind(c, name="hipsolverDpotrsBatched")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrsBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDpotrsBatched_typed
#endif
  end interface

  interface hipsolverCpotrsBatched
    function hipsolverCpotrsBatched_(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo, &
        batch_count) &
        bind(c, name="hipsolverCpotrsBatched")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrsBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverCpotrsBatched_typed
#endif
  end interface

  interface hipsolverZpotrsBatched
    function hipsolverZpotrsBatched_(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo, &
        batch_count) &
        bind(c, name="hipsolverZpotrsBatched")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrsBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverZpotrsBatched_typed
#endif
  end interface

  interface hipsolverSsyevd_bufferSize
    function hipsolverSsyevd_bufferSize_(handle,jobz,uplo,n,A,lda,D,lwork) &
        bind(c, name="hipsolverSsyevd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsyevd_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSsyevd_bufferSize_assumed_rank,&
      hipsolverSsyevd_bufferSize_assumed_rank_cptr,&
      hipsolverSsyevd_bufferSize_typed
#else
    module procedure &
      hipsolverSsyevd_bufferSize_rank_0,&
      hipsolverSsyevd_bufferSize_rank_0_cptr,&
      hipsolverSsyevd_bufferSize_rank_1,&
      hipsolverSsyevd_bufferSize_rank_1_cptr,&
      hipsolverSsyevd_bufferSize_full_rank,&
      hipsolverSsyevd_bufferSize_full_rank_cptr,&
      hipsolverSsyevd_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDsyevd_bufferSize
    function hipsolverDsyevd_bufferSize_(handle,jobz,uplo,n,A,lda,D,lwork) &
        bind(c, name="hipsolverDsyevd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsyevd_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDsyevd_bufferSize_assumed_rank,&
      hipsolverDsyevd_bufferSize_assumed_rank_cptr,&
      hipsolverDsyevd_bufferSize_typed
#else
    module procedure &
      hipsolverDsyevd_bufferSize_rank_0,&
      hipsolverDsyevd_bufferSize_rank_0_cptr,&
      hipsolverDsyevd_bufferSize_rank_1,&
      hipsolverDsyevd_bufferSize_rank_1_cptr,&
      hipsolverDsyevd_bufferSize_full_rank,&
      hipsolverDsyevd_bufferSize_full_rank_cptr,&
      hipsolverDsyevd_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverCheevd_bufferSize
    function hipsolverCheevd_bufferSize_(handle,jobz,uplo,n,A,lda,D,lwork) &
        bind(c, name="hipsolverCheevd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCheevd_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCheevd_bufferSize_assumed_rank,&
      hipsolverCheevd_bufferSize_assumed_rank_cptr,&
      hipsolverCheevd_bufferSize_typed
#else
    module procedure &
      hipsolverCheevd_bufferSize_rank_0,&
      hipsolverCheevd_bufferSize_rank_0_cptr,&
      hipsolverCheevd_bufferSize_rank_1,&
      hipsolverCheevd_bufferSize_rank_1_cptr,&
      hipsolverCheevd_bufferSize_full_rank,&
      hipsolverCheevd_bufferSize_full_rank_cptr,&
      hipsolverCheevd_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverZheevd_bufferSize
    function hipsolverZheevd_bufferSize_(handle,jobz,uplo,n,A,lda,D,lwork) &
        bind(c, name="hipsolverZheevd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZheevd_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZheevd_bufferSize_assumed_rank,&
      hipsolverZheevd_bufferSize_assumed_rank_cptr,&
      hipsolverZheevd_bufferSize_typed
#else
    module procedure &
      hipsolverZheevd_bufferSize_rank_0,&
      hipsolverZheevd_bufferSize_rank_0_cptr,&
      hipsolverZheevd_bufferSize_rank_1,&
      hipsolverZheevd_bufferSize_rank_1_cptr,&
      hipsolverZheevd_bufferSize_full_rank,&
      hipsolverZheevd_bufferSize_full_rank_cptr,&
      hipsolverZheevd_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverSsyevd
    function hipsolverSsyevd_(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo) &
        bind(c, name="hipsolverSsyevd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsyevd_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSsyevd_assumed_rank,&
      hipsolverSsyevd_assumed_rank_cptr,&
      hipsolverSsyevd_typed
#else
    module procedure &
      hipsolverSsyevd_rank_0,&
      hipsolverSsyevd_rank_0_cptr,&
      hipsolverSsyevd_rank_1,&
      hipsolverSsyevd_rank_1_cptr,&
      hipsolverSsyevd_full_rank,&
      hipsolverSsyevd_full_rank_cptr,&
      hipsolverSsyevd_typed
#endif
#endif
  end interface

  interface hipsolverDsyevd
    function hipsolverDsyevd_(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo) &
        bind(c, name="hipsolverDsyevd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsyevd_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDsyevd_assumed_rank,&
      hipsolverDsyevd_assumed_rank_cptr,&
      hipsolverDsyevd_typed
#else
    module procedure &
      hipsolverDsyevd_rank_0,&
      hipsolverDsyevd_rank_0_cptr,&
      hipsolverDsyevd_rank_1,&
      hipsolverDsyevd_rank_1_cptr,&
      hipsolverDsyevd_full_rank,&
      hipsolverDsyevd_full_rank_cptr,&
      hipsolverDsyevd_typed
#endif
#endif
  end interface

  interface hipsolverCheevd
    function hipsolverCheevd_(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo) &
        bind(c, name="hipsolverCheevd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCheevd_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCheevd_assumed_rank,&
      hipsolverCheevd_assumed_rank_cptr,&
      hipsolverCheevd_typed
#else
    module procedure &
      hipsolverCheevd_rank_0,&
      hipsolverCheevd_rank_0_cptr,&
      hipsolverCheevd_rank_1,&
      hipsolverCheevd_rank_1_cptr,&
      hipsolverCheevd_full_rank,&
      hipsolverCheevd_full_rank_cptr,&
      hipsolverCheevd_typed
#endif
#endif
  end interface

  interface hipsolverZheevd
    function hipsolverZheevd_(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo) &
        bind(c, name="hipsolverZheevd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZheevd_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZheevd_assumed_rank,&
      hipsolverZheevd_assumed_rank_cptr,&
      hipsolverZheevd_typed
#else
    module procedure &
      hipsolverZheevd_rank_0,&
      hipsolverZheevd_rank_0_cptr,&
      hipsolverZheevd_rank_1,&
      hipsolverZheevd_rank_1_cptr,&
      hipsolverZheevd_full_rank,&
      hipsolverZheevd_full_rank_cptr,&
      hipsolverZheevd_typed
#endif
#endif
  end interface

  interface hipsolverSsyevdx_bufferSize
    function hipsolverSsyevdx_bufferSize_(handle,jobz,range,uplo,n,A,lda,vl,vu,il,iu,nev,W,lwork) &
        bind(c, name="hipsolverSsyevdx_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsyevdx_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_EIG_RANGE_ALL)),value :: range
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float),value :: vl
      real(c_float),value :: vu
      integer(c_int),value :: il
      integer(c_int),value :: iu
      integer(c_int) :: nev
      type(c_ptr),value :: W
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSsyevdx_bufferSize_assumed_rank,&
      hipsolverSsyevdx_bufferSize_assumed_rank_cptr,&
      hipsolverSsyevdx_bufferSize_typed
#else
    module procedure &
      hipsolverSsyevdx_bufferSize_rank_0,&
      hipsolverSsyevdx_bufferSize_rank_0_cptr,&
      hipsolverSsyevdx_bufferSize_rank_1,&
      hipsolverSsyevdx_bufferSize_rank_1_cptr,&
      hipsolverSsyevdx_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDsyevdx_bufferSize
    function hipsolverDsyevdx_bufferSize_(handle,jobz,range,uplo,n,A,lda,vl,vu,il,iu,nev,W,lwork) &
        bind(c, name="hipsolverDsyevdx_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsyevdx_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_EIG_RANGE_ALL)),value :: range
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double),value :: vl
      real(c_double),value :: vu
      integer(c_int),value :: il
      integer(c_int),value :: iu
      type(c_ptr),value :: nev
      type(c_ptr),value :: W
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDsyevdx_bufferSize_assumed_rank,&
      hipsolverDsyevdx_bufferSize_assumed_rank_cptr,&
      hipsolverDsyevdx_bufferSize_typed
#else
    module procedure &
      hipsolverDsyevdx_bufferSize_rank_0,&
      hipsolverDsyevdx_bufferSize_rank_0_cptr,&
      hipsolverDsyevdx_bufferSize_rank_1,&
      hipsolverDsyevdx_bufferSize_rank_1_cptr,&
      hipsolverDsyevdx_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverCheevdx_bufferSize
    function hipsolverCheevdx_bufferSize_(handle,jobz,range,uplo,n,A,lda,vl,vu,il,iu,nev,W,lwork) &
        bind(c, name="hipsolverCheevdx_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCheevdx_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_EIG_RANGE_ALL)),value :: range
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float),value :: vl
      real(c_float),value :: vu
      integer(c_int),value :: il
      integer(c_int),value :: iu
      integer(c_int) :: nev
      type(c_ptr),value :: W
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCheevdx_bufferSize_assumed_rank,&
      hipsolverCheevdx_bufferSize_assumed_rank_cptr,&
      hipsolverCheevdx_bufferSize_typed
#else
    module procedure &
      hipsolverCheevdx_bufferSize_rank_0,&
      hipsolverCheevdx_bufferSize_rank_0_cptr,&
      hipsolverCheevdx_bufferSize_rank_1,&
      hipsolverCheevdx_bufferSize_rank_1_cptr,&
      hipsolverCheevdx_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverZheevdx_bufferSize
    function hipsolverZheevdx_bufferSize_(handle,jobz,range,uplo,n,A,lda,vl,vu,il,iu,nev,W,lwork) &
        bind(c, name="hipsolverZheevdx_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZheevdx_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_EIG_RANGE_ALL)),value :: range
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double),value :: vl
      real(c_double),value :: vu
      integer(c_int),value :: il
      integer(c_int),value :: iu
      integer(c_int) :: nev
      type(c_ptr),value :: W
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZheevdx_bufferSize_assumed_rank,&
      hipsolverZheevdx_bufferSize_assumed_rank_cptr,&
      hipsolverZheevdx_bufferSize_typed
#else
    module procedure &
      hipsolverZheevdx_bufferSize_rank_0,&
      hipsolverZheevdx_bufferSize_rank_0_cptr,&
      hipsolverZheevdx_bufferSize_rank_1,&
      hipsolverZheevdx_bufferSize_rank_1_cptr,&
      hipsolverZheevdx_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverSsyevdx
    function hipsolverSsyevdx_(handle,jobz,range,uplo,n,A,lda,vl,vu,il,iu,nev,W,work,lwork, &
        devInfo) &
        bind(c, name="hipsolverSsyevdx")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsyevdx_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_EIG_RANGE_ALL)),value :: range
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float),value :: vl
      real(c_float),value :: vu
      integer(c_int),value :: il
      integer(c_int),value :: iu
      type(c_ptr),value :: nev
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSsyevdx_assumed_rank,&
      hipsolverSsyevdx_assumed_rank_cptr,&
      hipsolverSsyevdx_typed
#else
    module procedure &
      hipsolverSsyevdx_rank_0,&
      hipsolverSsyevdx_rank_0_cptr,&
      hipsolverSsyevdx_rank_1,&
      hipsolverSsyevdx_rank_1_cptr,&
      hipsolverSsyevdx_typed
#endif
#endif
  end interface

  interface hipsolverDsyevdx
    function hipsolverDsyevdx_(handle,jobz,range,uplo,n,A,lda,vl,vu,il,iu,nev,W,work,lwork, &
        devInfo) &
        bind(c, name="hipsolverDsyevdx")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsyevdx_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_EIG_RANGE_ALL)),value :: range
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double),value :: vl
      real(c_double),value :: vu
      integer(c_int),value :: il
      integer(c_int),value :: iu
      type(c_ptr),value :: nev
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDsyevdx_assumed_rank,&
      hipsolverDsyevdx_assumed_rank_cptr,&
      hipsolverDsyevdx_typed
#else
    module procedure &
      hipsolverDsyevdx_rank_0,&
      hipsolverDsyevdx_rank_0_cptr,&
      hipsolverDsyevdx_rank_1,&
      hipsolverDsyevdx_rank_1_cptr,&
      hipsolverDsyevdx_typed
#endif
#endif
  end interface

  interface hipsolverCheevdx
    function hipsolverCheevdx_(handle,jobz,range,uplo,n,A,lda,vl,vu,il,iu,nev,W,work,lwork, &
        devInfo) &
        bind(c, name="hipsolverCheevdx")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCheevdx_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_EIG_RANGE_ALL)),value :: range
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float),value :: vl
      real(c_float),value :: vu
      integer(c_int),value :: il
      integer(c_int),value :: iu
      integer(c_int) :: nev
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCheevdx_assumed_rank,&
      hipsolverCheevdx_assumed_rank_cptr,&
      hipsolverCheevdx_typed
#else
    module procedure &
      hipsolverCheevdx_rank_0,&
      hipsolverCheevdx_rank_0_cptr,&
      hipsolverCheevdx_rank_1,&
      hipsolverCheevdx_rank_1_cptr,&
      hipsolverCheevdx_typed
#endif
#endif
  end interface

  interface hipsolverZheevdx
    function hipsolverZheevdx_(handle,jobz,range,uplo,n,A,lda,vl,vu,il,iu,nev,W,work,lwork, &
        devInfo) &
        bind(c, name="hipsolverZheevdx")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZheevdx_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_EIG_RANGE_ALL)),value :: range
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double),value :: vl
      real(c_double),value :: vu
      integer(c_int),value :: il
      integer(c_int),value :: iu
      integer(c_int) :: nev
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZheevdx_assumed_rank,&
      hipsolverZheevdx_assumed_rank_cptr,&
      hipsolverZheevdx_typed
#else
    module procedure &
      hipsolverZheevdx_rank_0,&
      hipsolverZheevdx_rank_0_cptr,&
      hipsolverZheevdx_rank_1,&
      hipsolverZheevdx_rank_1_cptr,&
      hipsolverZheevdx_typed
#endif
#endif
  end interface

  interface hipsolverSsyevj_bufferSize
    function hipsolverSsyevj_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork,params) &
        bind(c, name="hipsolverSsyevj_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsyevj_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      integer(c_int) :: lwork
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSsyevj_bufferSize_assumed_rank,&
      hipsolverSsyevj_bufferSize_assumed_rank_cptr,&
      hipsolverSsyevj_bufferSize_typed
#else
    module procedure &
      hipsolverSsyevj_bufferSize_rank_0,&
      hipsolverSsyevj_bufferSize_rank_0_cptr,&
      hipsolverSsyevj_bufferSize_rank_1,&
      hipsolverSsyevj_bufferSize_rank_1_cptr,&
      hipsolverSsyevj_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDsyevj_bufferSize
    function hipsolverDsyevj_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork,params) &
        bind(c, name="hipsolverDsyevj_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsyevj_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      integer(c_int) :: lwork
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDsyevj_bufferSize_assumed_rank,&
      hipsolverDsyevj_bufferSize_assumed_rank_cptr,&
      hipsolverDsyevj_bufferSize_typed
#else
    module procedure &
      hipsolverDsyevj_bufferSize_rank_0,&
      hipsolverDsyevj_bufferSize_rank_0_cptr,&
      hipsolverDsyevj_bufferSize_rank_1,&
      hipsolverDsyevj_bufferSize_rank_1_cptr,&
      hipsolverDsyevj_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverCheevj_bufferSize
    function hipsolverCheevj_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork,params) &
        bind(c, name="hipsolverCheevj_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCheevj_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      integer(c_int) :: lwork
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCheevj_bufferSize_assumed_rank,&
      hipsolverCheevj_bufferSize_assumed_rank_cptr,&
      hipsolverCheevj_bufferSize_typed
#else
    module procedure &
      hipsolverCheevj_bufferSize_rank_0,&
      hipsolverCheevj_bufferSize_rank_0_cptr,&
      hipsolverCheevj_bufferSize_rank_1,&
      hipsolverCheevj_bufferSize_rank_1_cptr,&
      hipsolverCheevj_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverZheevj_bufferSize
    function hipsolverZheevj_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork,params) &
        bind(c, name="hipsolverZheevj_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZheevj_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      integer(c_int) :: lwork
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZheevj_bufferSize_assumed_rank,&
      hipsolverZheevj_bufferSize_assumed_rank_cptr,&
      hipsolverZheevj_bufferSize_typed
#else
    module procedure &
      hipsolverZheevj_bufferSize_rank_0,&
      hipsolverZheevj_bufferSize_rank_0_cptr,&
      hipsolverZheevj_bufferSize_rank_1,&
      hipsolverZheevj_bufferSize_rank_1_cptr,&
      hipsolverZheevj_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverSsyevj
    function hipsolverSsyevj_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo,params) &
        bind(c, name="hipsolverSsyevj")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsyevj_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSsyevj_assumed_rank,&
      hipsolverSsyevj_assumed_rank_cptr,&
      hipsolverSsyevj_typed
#else
    module procedure &
      hipsolverSsyevj_rank_0,&
      hipsolverSsyevj_rank_0_cptr,&
      hipsolverSsyevj_rank_1,&
      hipsolverSsyevj_rank_1_cptr,&
      hipsolverSsyevj_typed
#endif
#endif
  end interface

  interface hipsolverDsyevj
    function hipsolverDsyevj_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo,params) &
        bind(c, name="hipsolverDsyevj")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsyevj_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDsyevj_assumed_rank,&
      hipsolverDsyevj_assumed_rank_cptr,&
      hipsolverDsyevj_typed
#else
    module procedure &
      hipsolverDsyevj_rank_0,&
      hipsolverDsyevj_rank_0_cptr,&
      hipsolverDsyevj_rank_1,&
      hipsolverDsyevj_rank_1_cptr,&
      hipsolverDsyevj_typed
#endif
#endif
  end interface

  interface hipsolverCheevj
    function hipsolverCheevj_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo,params) &
        bind(c, name="hipsolverCheevj")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCheevj_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCheevj_assumed_rank,&
      hipsolverCheevj_assumed_rank_cptr,&
      hipsolverCheevj_typed
#else
    module procedure &
      hipsolverCheevj_rank_0,&
      hipsolverCheevj_rank_0_cptr,&
      hipsolverCheevj_rank_1,&
      hipsolverCheevj_rank_1_cptr,&
      hipsolverCheevj_typed
#endif
#endif
  end interface

  interface hipsolverZheevj
    function hipsolverZheevj_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo,params) &
        bind(c, name="hipsolverZheevj")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZheevj_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZheevj_assumed_rank,&
      hipsolverZheevj_assumed_rank_cptr,&
      hipsolverZheevj_typed
#else
    module procedure &
      hipsolverZheevj_rank_0,&
      hipsolverZheevj_rank_0_cptr,&
      hipsolverZheevj_rank_1,&
      hipsolverZheevj_rank_1_cptr,&
      hipsolverZheevj_typed
#endif
#endif
  end interface

  interface hipsolverSsyevjBatched_bufferSize
    function hipsolverSsyevjBatched_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork,params, &
        batch_count) &
        bind(c, name="hipsolverSsyevjBatched_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsyevjBatched_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      integer(c_int) :: lwork
      type(c_ptr),value :: params
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSsyevjBatched_bufferSize_assumed_rank,&
      hipsolverSsyevjBatched_bufferSize_assumed_rank_cptr,&
      hipsolverSsyevjBatched_bufferSize_typed
#else
    module procedure &
      hipsolverSsyevjBatched_bufferSize_rank_0,&
      hipsolverSsyevjBatched_bufferSize_rank_0_cptr,&
      hipsolverSsyevjBatched_bufferSize_rank_1,&
      hipsolverSsyevjBatched_bufferSize_rank_1_cptr,&
      hipsolverSsyevjBatched_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDsyevjBatched_bufferSize
    function hipsolverDsyevjBatched_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork,params, &
        batch_count) &
        bind(c, name="hipsolverDsyevjBatched_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsyevjBatched_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      integer(c_int) :: lwork
      type(c_ptr),value :: params
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDsyevjBatched_bufferSize_assumed_rank,&
      hipsolverDsyevjBatched_bufferSize_assumed_rank_cptr,&
      hipsolverDsyevjBatched_bufferSize_typed
#else
    module procedure &
      hipsolverDsyevjBatched_bufferSize_rank_0,&
      hipsolverDsyevjBatched_bufferSize_rank_0_cptr,&
      hipsolverDsyevjBatched_bufferSize_rank_1,&
      hipsolverDsyevjBatched_bufferSize_rank_1_cptr,&
      hipsolverDsyevjBatched_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverCheevjBatched_bufferSize
    function hipsolverCheevjBatched_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork,params, &
        batch_count) &
        bind(c, name="hipsolverCheevjBatched_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCheevjBatched_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      integer(c_int) :: lwork
      type(c_ptr),value :: params
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCheevjBatched_bufferSize_assumed_rank,&
      hipsolverCheevjBatched_bufferSize_assumed_rank_cptr,&
      hipsolverCheevjBatched_bufferSize_typed
#else
    module procedure &
      hipsolverCheevjBatched_bufferSize_rank_0,&
      hipsolverCheevjBatched_bufferSize_rank_0_cptr,&
      hipsolverCheevjBatched_bufferSize_rank_1,&
      hipsolverCheevjBatched_bufferSize_rank_1_cptr,&
      hipsolverCheevjBatched_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverZheevjBatched_bufferSize
    function hipsolverZheevjBatched_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork,params, &
        batch_count) &
        bind(c, name="hipsolverZheevjBatched_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZheevjBatched_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      integer(c_int) :: lwork
      type(c_ptr),value :: params
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZheevjBatched_bufferSize_assumed_rank,&
      hipsolverZheevjBatched_bufferSize_assumed_rank_cptr,&
      hipsolverZheevjBatched_bufferSize_typed
#else
    module procedure &
      hipsolverZheevjBatched_bufferSize_rank_0,&
      hipsolverZheevjBatched_bufferSize_rank_0_cptr,&
      hipsolverZheevjBatched_bufferSize_rank_1,&
      hipsolverZheevjBatched_bufferSize_rank_1_cptr,&
      hipsolverZheevjBatched_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverSsyevjBatched
    function hipsolverSsyevjBatched_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo,params, &
        batch_count) &
        bind(c, name="hipsolverSsyevjBatched")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsyevjBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
      type(c_ptr),value :: params
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSsyevjBatched_assumed_rank,&
      hipsolverSsyevjBatched_assumed_rank_cptr,&
      hipsolverSsyevjBatched_typed
#else
    module procedure &
      hipsolverSsyevjBatched_rank_0,&
      hipsolverSsyevjBatched_rank_0_cptr,&
      hipsolverSsyevjBatched_rank_1,&
      hipsolverSsyevjBatched_rank_1_cptr,&
      hipsolverSsyevjBatched_typed
#endif
#endif
  end interface

  interface hipsolverDsyevjBatched
    function hipsolverDsyevjBatched_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo,params, &
        batch_count) &
        bind(c, name="hipsolverDsyevjBatched")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsyevjBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
      type(c_ptr),value :: params
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDsyevjBatched_assumed_rank,&
      hipsolverDsyevjBatched_assumed_rank_cptr,&
      hipsolverDsyevjBatched_typed
#else
    module procedure &
      hipsolverDsyevjBatched_rank_0,&
      hipsolverDsyevjBatched_rank_0_cptr,&
      hipsolverDsyevjBatched_rank_1,&
      hipsolverDsyevjBatched_rank_1_cptr,&
      hipsolverDsyevjBatched_typed
#endif
#endif
  end interface

  interface hipsolverCheevjBatched
    function hipsolverCheevjBatched_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo,params, &
        batch_count) &
        bind(c, name="hipsolverCheevjBatched")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCheevjBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
      type(c_ptr),value :: params
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCheevjBatched_assumed_rank,&
      hipsolverCheevjBatched_assumed_rank_cptr,&
      hipsolverCheevjBatched_typed
#else
    module procedure &
      hipsolverCheevjBatched_rank_0,&
      hipsolverCheevjBatched_rank_0_cptr,&
      hipsolverCheevjBatched_rank_1,&
      hipsolverCheevjBatched_rank_1_cptr,&
      hipsolverCheevjBatched_typed
#endif
#endif
  end interface

  interface hipsolverZheevjBatched
    function hipsolverZheevjBatched_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo,params, &
        batch_count) &
        bind(c, name="hipsolverZheevjBatched")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZheevjBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
      type(c_ptr),value :: params
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZheevjBatched_assumed_rank,&
      hipsolverZheevjBatched_assumed_rank_cptr,&
      hipsolverZheevjBatched_typed
#else
    module procedure &
      hipsolverZheevjBatched_rank_0,&
      hipsolverZheevjBatched_rank_0_cptr,&
      hipsolverZheevjBatched_rank_1,&
      hipsolverZheevjBatched_rank_1_cptr,&
      hipsolverZheevjBatched_typed
#endif
#endif
  end interface

  interface hipsolverSsygvd_bufferSize
    function hipsolverSsygvd_bufferSize_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork) &
        bind(c, name="hipsolverSsygvd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsygvd_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSsygvd_bufferSize_assumed_rank,&
      hipsolverSsygvd_bufferSize_assumed_rank_cptr,&
      hipsolverSsygvd_bufferSize_typed
#else
    module procedure &
      hipsolverSsygvd_bufferSize_rank_0,&
      hipsolverSsygvd_bufferSize_rank_0_cptr,&
      hipsolverSsygvd_bufferSize_rank_1,&
      hipsolverSsygvd_bufferSize_rank_1_cptr,&
      hipsolverSsygvd_bufferSize_full_rank,&
      hipsolverSsygvd_bufferSize_full_rank_cptr,&
      hipsolverSsygvd_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDsygvd_bufferSize
    function hipsolverDsygvd_bufferSize_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork) &
        bind(c, name="hipsolverDsygvd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsygvd_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDsygvd_bufferSize_assumed_rank,&
      hipsolverDsygvd_bufferSize_assumed_rank_cptr,&
      hipsolverDsygvd_bufferSize_typed
#else
    module procedure &
      hipsolverDsygvd_bufferSize_rank_0,&
      hipsolverDsygvd_bufferSize_rank_0_cptr,&
      hipsolverDsygvd_bufferSize_rank_1,&
      hipsolverDsygvd_bufferSize_rank_1_cptr,&
      hipsolverDsygvd_bufferSize_full_rank,&
      hipsolverDsygvd_bufferSize_full_rank_cptr,&
      hipsolverDsygvd_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverChegvd_bufferSize
    function hipsolverChegvd_bufferSize_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork) &
        bind(c, name="hipsolverChegvd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChegvd_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverChegvd_bufferSize_assumed_rank,&
      hipsolverChegvd_bufferSize_assumed_rank_cptr,&
      hipsolverChegvd_bufferSize_typed
#else
    module procedure &
      hipsolverChegvd_bufferSize_rank_0,&
      hipsolverChegvd_bufferSize_rank_0_cptr,&
      hipsolverChegvd_bufferSize_rank_1,&
      hipsolverChegvd_bufferSize_rank_1_cptr,&
      hipsolverChegvd_bufferSize_full_rank,&
      hipsolverChegvd_bufferSize_full_rank_cptr,&
      hipsolverChegvd_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverZhegvd_bufferSize
    function hipsolverZhegvd_bufferSize_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork) &
        bind(c, name="hipsolverZhegvd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhegvd_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZhegvd_bufferSize_assumed_rank,&
      hipsolverZhegvd_bufferSize_assumed_rank_cptr,&
      hipsolverZhegvd_bufferSize_typed
#else
    module procedure &
      hipsolverZhegvd_bufferSize_rank_0,&
      hipsolverZhegvd_bufferSize_rank_0_cptr,&
      hipsolverZhegvd_bufferSize_rank_1,&
      hipsolverZhegvd_bufferSize_rank_1_cptr,&
      hipsolverZhegvd_bufferSize_full_rank,&
      hipsolverZhegvd_bufferSize_full_rank_cptr,&
      hipsolverZhegvd_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverSsygvd
    function hipsolverSsygvd_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo) &
        bind(c, name="hipsolverSsygvd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsygvd_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSsygvd_assumed_rank,&
      hipsolverSsygvd_assumed_rank_cptr,&
      hipsolverSsygvd_typed
#else
    module procedure &
      hipsolverSsygvd_rank_0,&
      hipsolverSsygvd_rank_0_cptr,&
      hipsolverSsygvd_rank_1,&
      hipsolverSsygvd_rank_1_cptr,&
      hipsolverSsygvd_full_rank,&
      hipsolverSsygvd_full_rank_cptr,&
      hipsolverSsygvd_typed
#endif
#endif
  end interface

  interface hipsolverDsygvd
    function hipsolverDsygvd_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo) &
        bind(c, name="hipsolverDsygvd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsygvd_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDsygvd_assumed_rank,&
      hipsolverDsygvd_assumed_rank_cptr,&
      hipsolverDsygvd_typed
#else
    module procedure &
      hipsolverDsygvd_rank_0,&
      hipsolverDsygvd_rank_0_cptr,&
      hipsolverDsygvd_rank_1,&
      hipsolverDsygvd_rank_1_cptr,&
      hipsolverDsygvd_full_rank,&
      hipsolverDsygvd_full_rank_cptr,&
      hipsolverDsygvd_typed
#endif
#endif
  end interface

  interface hipsolverChegvd
    function hipsolverChegvd_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo) &
        bind(c, name="hipsolverChegvd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChegvd_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverChegvd_assumed_rank,&
      hipsolverChegvd_assumed_rank_cptr,&
      hipsolverChegvd_typed
#else
    module procedure &
      hipsolverChegvd_rank_0,&
      hipsolverChegvd_rank_0_cptr,&
      hipsolverChegvd_rank_1,&
      hipsolverChegvd_rank_1_cptr,&
      hipsolverChegvd_full_rank,&
      hipsolverChegvd_full_rank_cptr,&
      hipsolverChegvd_typed
#endif
#endif
  end interface

  interface hipsolverZhegvd
    function hipsolverZhegvd_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo) &
        bind(c, name="hipsolverZhegvd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhegvd_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZhegvd_assumed_rank,&
      hipsolverZhegvd_assumed_rank_cptr,&
      hipsolverZhegvd_typed
#else
    module procedure &
      hipsolverZhegvd_rank_0,&
      hipsolverZhegvd_rank_0_cptr,&
      hipsolverZhegvd_rank_1,&
      hipsolverZhegvd_rank_1_cptr,&
      hipsolverZhegvd_full_rank,&
      hipsolverZhegvd_full_rank_cptr,&
      hipsolverZhegvd_typed
#endif
#endif
  end interface

  interface hipsolverSsygvdx_bufferSize
    function hipsolverSsygvdx_bufferSize_(handle,itype,jobz,range,uplo,n,A,lda,B,ldb,vl,vu,il,iu, &
        nev,W,lwork) &
        bind(c, name="hipsolverSsygvdx_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsygvdx_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_EIG_RANGE_ALL)),value :: range
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_float),value :: vl
      real(c_float),value :: vu
      integer(c_int),value :: il
      integer(c_int),value :: iu
      integer(c_int) :: nev
      type(c_ptr),value :: W
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSsygvdx_bufferSize_assumed_rank,&
      hipsolverSsygvdx_bufferSize_assumed_rank_cptr,&
      hipsolverSsygvdx_bufferSize_typed
#else
    module procedure &
      hipsolverSsygvdx_bufferSize_rank_0,&
      hipsolverSsygvdx_bufferSize_rank_0_cptr,&
      hipsolverSsygvdx_bufferSize_rank_1,&
      hipsolverSsygvdx_bufferSize_rank_1_cptr,&
      hipsolverSsygvdx_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDsygvdx_bufferSize
    function hipsolverDsygvdx_bufferSize_(handle,itype,jobz,range,uplo,n,A,lda,B,ldb,vl,vu,il,iu, &
        nev,W,lwork) &
        bind(c, name="hipsolverDsygvdx_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsygvdx_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_EIG_RANGE_ALL)),value :: range
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_double),value :: vl
      real(c_double),value :: vu
      integer(c_int),value :: il
      integer(c_int),value :: iu
      integer(c_int) :: nev
      type(c_ptr),value :: W
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDsygvdx_bufferSize_assumed_rank,&
      hipsolverDsygvdx_bufferSize_assumed_rank_cptr,&
      hipsolverDsygvdx_bufferSize_typed
#else
    module procedure &
      hipsolverDsygvdx_bufferSize_rank_0,&
      hipsolverDsygvdx_bufferSize_rank_0_cptr,&
      hipsolverDsygvdx_bufferSize_rank_1,&
      hipsolverDsygvdx_bufferSize_rank_1_cptr,&
      hipsolverDsygvdx_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverChegvdx_bufferSize
    function hipsolverChegvdx_bufferSize_(handle,itype,jobz,range,uplo,n,A,lda,B,ldb,vl,vu,il,iu, &
        nev,W,lwork) &
        bind(c, name="hipsolverChegvdx_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChegvdx_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_EIG_RANGE_ALL)),value :: range
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_float),value :: vl
      real(c_float),value :: vu
      integer(c_int),value :: il
      integer(c_int),value :: iu
      integer(c_int) :: nev
      type(c_ptr),value :: W
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverChegvdx_bufferSize_assumed_rank,&
      hipsolverChegvdx_bufferSize_assumed_rank_cptr,&
      hipsolverChegvdx_bufferSize_typed
#else
    module procedure &
      hipsolverChegvdx_bufferSize_rank_0,&
      hipsolverChegvdx_bufferSize_rank_0_cptr,&
      hipsolverChegvdx_bufferSize_rank_1,&
      hipsolverChegvdx_bufferSize_rank_1_cptr,&
      hipsolverChegvdx_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverZhegvdx_bufferSize
    function hipsolverZhegvdx_bufferSize_(handle,itype,jobz,range,uplo,n,A,lda,B,ldb,vl,vu,il,iu, &
        nev,W,lwork) &
        bind(c, name="hipsolverZhegvdx_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhegvdx_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_EIG_RANGE_ALL)),value :: range
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_double),value :: vl
      real(c_double),value :: vu
      integer(c_int),value :: il
      integer(c_int),value :: iu
      integer(c_int) :: nev
      type(c_ptr),value :: W
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZhegvdx_bufferSize_assumed_rank,&
      hipsolverZhegvdx_bufferSize_assumed_rank_cptr,&
      hipsolverZhegvdx_bufferSize_typed
#else
    module procedure &
      hipsolverZhegvdx_bufferSize_rank_0,&
      hipsolverZhegvdx_bufferSize_rank_0_cptr,&
      hipsolverZhegvdx_bufferSize_rank_1,&
      hipsolverZhegvdx_bufferSize_rank_1_cptr,&
      hipsolverZhegvdx_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverSsygvdx
    function hipsolverSsygvdx_(handle,itype,jobz,range,uplo,n,A,lda,B,ldb,vl,vu,il,iu,nev,W,work, &
        lwork,devInfo) &
        bind(c, name="hipsolverSsygvdx")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsygvdx_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_EIG_RANGE_ALL)),value :: range
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_float),value :: vl
      real(c_float),value :: vu
      integer(c_int),value :: il
      integer(c_int),value :: iu
      integer(c_int) :: nev
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSsygvdx_assumed_rank,&
      hipsolverSsygvdx_assumed_rank_cptr,&
      hipsolverSsygvdx_typed
#else
    module procedure &
      hipsolverSsygvdx_rank_0,&
      hipsolverSsygvdx_rank_0_cptr,&
      hipsolverSsygvdx_rank_1,&
      hipsolverSsygvdx_rank_1_cptr,&
      hipsolverSsygvdx_typed
#endif
#endif
  end interface

  interface hipsolverDsygvdx
    function hipsolverDsygvdx_(handle,itype,jobz,range,uplo,n,A,lda,B,ldb,vl,vu,il,iu,nev,W,work, &
        lwork,devInfo) &
        bind(c, name="hipsolverDsygvdx")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsygvdx_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_EIG_RANGE_ALL)),value :: range
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_double),value :: vl
      real(c_double),value :: vu
      integer(c_int),value :: il
      integer(c_int),value :: iu
      integer(c_int) :: nev
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDsygvdx_assumed_rank,&
      hipsolverDsygvdx_assumed_rank_cptr,&
      hipsolverDsygvdx_typed
#else
    module procedure &
      hipsolverDsygvdx_rank_0,&
      hipsolverDsygvdx_rank_0_cptr,&
      hipsolverDsygvdx_rank_1,&
      hipsolverDsygvdx_rank_1_cptr,&
      hipsolverDsygvdx_typed
#endif
#endif
  end interface

  interface hipsolverChegvdx
    function hipsolverChegvdx_(handle,itype,jobz,range,uplo,n,A,lda,B,ldb,vl,vu,il,iu,nev,W,work, &
        lwork,devInfo) &
        bind(c, name="hipsolverChegvdx")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChegvdx_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_EIG_RANGE_ALL)),value :: range
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_float),value :: vl
      real(c_float),value :: vu
      integer(c_int),value :: il
      integer(c_int),value :: iu
      integer(c_int) :: nev
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverChegvdx_assumed_rank,&
      hipsolverChegvdx_assumed_rank_cptr,&
      hipsolverChegvdx_typed
#else
    module procedure &
      hipsolverChegvdx_rank_0,&
      hipsolverChegvdx_rank_0_cptr,&
      hipsolverChegvdx_rank_1,&
      hipsolverChegvdx_rank_1_cptr,&
      hipsolverChegvdx_typed
#endif
#endif
  end interface

  interface hipsolverZhegvdx
    function hipsolverZhegvdx_(handle,itype,jobz,range,uplo,n,A,lda,B,ldb,vl,vu,il,iu,nev,W,work, &
        lwork,devInfo) &
        bind(c, name="hipsolverZhegvdx")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhegvdx_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_EIG_RANGE_ALL)),value :: range
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_double),value :: vl
      real(c_double),value :: vu
      integer(c_int),value :: il
      integer(c_int),value :: iu
      integer(c_int) :: nev
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZhegvdx_assumed_rank,&
      hipsolverZhegvdx_assumed_rank_cptr,&
      hipsolverZhegvdx_typed
#else
    module procedure &
      hipsolverZhegvdx_rank_0,&
      hipsolverZhegvdx_rank_0_cptr,&
      hipsolverZhegvdx_rank_1,&
      hipsolverZhegvdx_rank_1_cptr,&
      hipsolverZhegvdx_typed
#endif
#endif
  end interface

  interface hipsolverSsygvj_bufferSize
    function hipsolverSsygvj_bufferSize_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork,params) &
        bind(c, name="hipsolverSsygvj_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsygvj_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      integer(c_int) :: lwork
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSsygvj_bufferSize_assumed_rank,&
      hipsolverSsygvj_bufferSize_assumed_rank_cptr,&
      hipsolverSsygvj_bufferSize_typed
#else
    module procedure &
      hipsolverSsygvj_bufferSize_rank_0,&
      hipsolverSsygvj_bufferSize_rank_0_cptr,&
      hipsolverSsygvj_bufferSize_rank_1,&
      hipsolverSsygvj_bufferSize_rank_1_cptr,&
      hipsolverSsygvj_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDsygvj_bufferSize
    function hipsolverDsygvj_bufferSize_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork,params) &
        bind(c, name="hipsolverDsygvj_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsygvj_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      integer(c_int) :: lwork
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDsygvj_bufferSize_assumed_rank,&
      hipsolverDsygvj_bufferSize_assumed_rank_cptr,&
      hipsolverDsygvj_bufferSize_typed
#else
    module procedure &
      hipsolverDsygvj_bufferSize_rank_0,&
      hipsolverDsygvj_bufferSize_rank_0_cptr,&
      hipsolverDsygvj_bufferSize_rank_1,&
      hipsolverDsygvj_bufferSize_rank_1_cptr,&
      hipsolverDsygvj_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverChegvj_bufferSize
    function hipsolverChegvj_bufferSize_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork,params) &
        bind(c, name="hipsolverChegvj_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChegvj_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      integer(c_int) :: lwork
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverChegvj_bufferSize_assumed_rank,&
      hipsolverChegvj_bufferSize_assumed_rank_cptr,&
      hipsolverChegvj_bufferSize_typed
#else
    module procedure &
      hipsolverChegvj_bufferSize_rank_0,&
      hipsolverChegvj_bufferSize_rank_0_cptr,&
      hipsolverChegvj_bufferSize_rank_1,&
      hipsolverChegvj_bufferSize_rank_1_cptr,&
      hipsolverChegvj_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverZhegvj_bufferSize
    function hipsolverZhegvj_bufferSize_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork,params) &
        bind(c, name="hipsolverZhegvj_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhegvj_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      integer(c_int) :: lwork
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZhegvj_bufferSize_assumed_rank,&
      hipsolverZhegvj_bufferSize_assumed_rank_cptr,&
      hipsolverZhegvj_bufferSize_typed
#else
    module procedure &
      hipsolverZhegvj_bufferSize_rank_0,&
      hipsolverZhegvj_bufferSize_rank_0_cptr,&
      hipsolverZhegvj_bufferSize_rank_1,&
      hipsolverZhegvj_bufferSize_rank_1_cptr,&
      hipsolverZhegvj_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverSsygvj
    function hipsolverSsygvj_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo,params) &
        bind(c, name="hipsolverSsygvj")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsygvj_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSsygvj_assumed_rank,&
      hipsolverSsygvj_assumed_rank_cptr,&
      hipsolverSsygvj_typed
#else
    module procedure &
      hipsolverSsygvj_rank_0,&
      hipsolverSsygvj_rank_0_cptr,&
      hipsolverSsygvj_rank_1,&
      hipsolverSsygvj_rank_1_cptr,&
      hipsolverSsygvj_typed
#endif
#endif
  end interface

  interface hipsolverDsygvj
    function hipsolverDsygvj_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo,params) &
        bind(c, name="hipsolverDsygvj")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsygvj_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDsygvj_assumed_rank,&
      hipsolverDsygvj_assumed_rank_cptr,&
      hipsolverDsygvj_typed
#else
    module procedure &
      hipsolverDsygvj_rank_0,&
      hipsolverDsygvj_rank_0_cptr,&
      hipsolverDsygvj_rank_1,&
      hipsolverDsygvj_rank_1_cptr,&
      hipsolverDsygvj_typed
#endif
#endif
  end interface

  interface hipsolverChegvj
    function hipsolverChegvj_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo,params) &
        bind(c, name="hipsolverChegvj")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChegvj_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverChegvj_assumed_rank,&
      hipsolverChegvj_assumed_rank_cptr,&
      hipsolverChegvj_typed
#else
    module procedure &
      hipsolverChegvj_rank_0,&
      hipsolverChegvj_rank_0_cptr,&
      hipsolverChegvj_rank_1,&
      hipsolverChegvj_rank_1_cptr,&
      hipsolverChegvj_typed
#endif
#endif
  end interface

  interface hipsolverZhegvj
    function hipsolverZhegvj_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo,params) &
        bind(c, name="hipsolverZhegvj")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhegvj_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZhegvj_assumed_rank,&
      hipsolverZhegvj_assumed_rank_cptr,&
      hipsolverZhegvj_typed
#else
    module procedure &
      hipsolverZhegvj_rank_0,&
      hipsolverZhegvj_rank_0_cptr,&
      hipsolverZhegvj_rank_1,&
      hipsolverZhegvj_rank_1_cptr,&
      hipsolverZhegvj_typed
#endif
#endif
  end interface

  interface hipsolverSsytrd_bufferSize
    function hipsolverSsytrd_bufferSize_(handle,uplo,n,A,lda,D,E,tau,lwork) &
        bind(c, name="hipsolverSsytrd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsytrd_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      real(c_float) :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSsytrd_bufferSize_assumed_rank,&
      hipsolverSsytrd_bufferSize_assumed_rank_cptr,&
      hipsolverSsytrd_bufferSize_typed
#else
    module procedure &
      hipsolverSsytrd_bufferSize_rank_0,&
      hipsolverSsytrd_bufferSize_rank_0_cptr,&
      hipsolverSsytrd_bufferSize_rank_1,&
      hipsolverSsytrd_bufferSize_rank_1_cptr,&
      hipsolverSsytrd_bufferSize_full_rank,&
      hipsolverSsytrd_bufferSize_full_rank_cptr,&
      hipsolverSsytrd_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDsytrd_bufferSize
    function hipsolverDsytrd_bufferSize_(handle,uplo,n,A,lda,D,E,tau,lwork) &
        bind(c, name="hipsolverDsytrd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsytrd_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      real(c_double) :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDsytrd_bufferSize_assumed_rank,&
      hipsolverDsytrd_bufferSize_assumed_rank_cptr,&
      hipsolverDsytrd_bufferSize_typed
#else
    module procedure &
      hipsolverDsytrd_bufferSize_rank_0,&
      hipsolverDsytrd_bufferSize_rank_0_cptr,&
      hipsolverDsytrd_bufferSize_rank_1,&
      hipsolverDsytrd_bufferSize_rank_1_cptr,&
      hipsolverDsytrd_bufferSize_full_rank,&
      hipsolverDsytrd_bufferSize_full_rank_cptr,&
      hipsolverDsytrd_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverChetrd_bufferSize
    function hipsolverChetrd_bufferSize_(handle,uplo,n,A,lda,D,E,tau,lwork) &
        bind(c, name="hipsolverChetrd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChetrd_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      complex(c_float_complex) :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverChetrd_bufferSize_assumed_rank,&
      hipsolverChetrd_bufferSize_assumed_rank_cptr,&
      hipsolverChetrd_bufferSize_typed
#else
    module procedure &
      hipsolverChetrd_bufferSize_rank_0,&
      hipsolverChetrd_bufferSize_rank_0_cptr,&
      hipsolverChetrd_bufferSize_rank_1,&
      hipsolverChetrd_bufferSize_rank_1_cptr,&
      hipsolverChetrd_bufferSize_full_rank,&
      hipsolverChetrd_bufferSize_full_rank_cptr,&
      hipsolverChetrd_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverZhetrd_bufferSize
    function hipsolverZhetrd_bufferSize_(handle,uplo,n,A,lda,D,E,tau,lwork) &
        bind(c, name="hipsolverZhetrd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhetrd_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      complex(c_double_complex) :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZhetrd_bufferSize_assumed_rank,&
      hipsolverZhetrd_bufferSize_assumed_rank_cptr,&
      hipsolverZhetrd_bufferSize_typed
#else
    module procedure &
      hipsolverZhetrd_bufferSize_rank_0,&
      hipsolverZhetrd_bufferSize_rank_0_cptr,&
      hipsolverZhetrd_bufferSize_rank_1,&
      hipsolverZhetrd_bufferSize_rank_1_cptr,&
      hipsolverZhetrd_bufferSize_full_rank,&
      hipsolverZhetrd_bufferSize_full_rank_cptr,&
      hipsolverZhetrd_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverSsytrd
    function hipsolverSsytrd_(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverSsytrd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsytrd_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      real(c_float) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSsytrd_assumed_rank,&
      hipsolverSsytrd_assumed_rank_cptr,&
      hipsolverSsytrd_typed
#else
    module procedure &
      hipsolverSsytrd_rank_0,&
      hipsolverSsytrd_rank_0_cptr,&
      hipsolverSsytrd_rank_1,&
      hipsolverSsytrd_rank_1_cptr,&
      hipsolverSsytrd_full_rank,&
      hipsolverSsytrd_full_rank_cptr,&
      hipsolverSsytrd_typed
#endif
#endif
  end interface

  interface hipsolverDsytrd
    function hipsolverDsytrd_(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDsytrd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsytrd_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      real(c_double) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDsytrd_assumed_rank,&
      hipsolverDsytrd_assumed_rank_cptr,&
      hipsolverDsytrd_typed
#else
    module procedure &
      hipsolverDsytrd_rank_0,&
      hipsolverDsytrd_rank_0_cptr,&
      hipsolverDsytrd_rank_1,&
      hipsolverDsytrd_rank_1_cptr,&
      hipsolverDsytrd_full_rank,&
      hipsolverDsytrd_full_rank_cptr,&
      hipsolverDsytrd_typed
#endif
#endif
  end interface

  interface hipsolverChetrd
    function hipsolverChetrd_(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverChetrd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChetrd_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      complex(c_float_complex) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverChetrd_assumed_rank,&
      hipsolverChetrd_assumed_rank_cptr,&
      hipsolverChetrd_typed
#else
    module procedure &
      hipsolverChetrd_rank_0,&
      hipsolverChetrd_rank_0_cptr,&
      hipsolverChetrd_rank_1,&
      hipsolverChetrd_rank_1_cptr,&
      hipsolverChetrd_full_rank,&
      hipsolverChetrd_full_rank_cptr,&
      hipsolverChetrd_typed
#endif
#endif
  end interface

  interface hipsolverZhetrd
    function hipsolverZhetrd_(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverZhetrd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhetrd_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      complex(c_double_complex) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZhetrd_assumed_rank,&
      hipsolverZhetrd_assumed_rank_cptr,&
      hipsolverZhetrd_typed
#else
    module procedure &
      hipsolverZhetrd_rank_0,&
      hipsolverZhetrd_rank_0_cptr,&
      hipsolverZhetrd_rank_1,&
      hipsolverZhetrd_rank_1_cptr,&
      hipsolverZhetrd_full_rank,&
      hipsolverZhetrd_full_rank_cptr,&
      hipsolverZhetrd_typed
#endif
#endif
  end interface

  interface hipsolverSsytrf_bufferSize
    function hipsolverSsytrf_bufferSize_(handle,n,A,lda,lwork) &
        bind(c, name="hipsolverSsytrf_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsytrf_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSsytrf_bufferSize_assumed_rank,&
      hipsolverSsytrf_bufferSize_assumed_rank_cptr,&
      hipsolverSsytrf_bufferSize_typed
#else
    module procedure &
      hipsolverSsytrf_bufferSize_rank_0,&
      hipsolverSsytrf_bufferSize_rank_0_cptr,&
      hipsolverSsytrf_bufferSize_rank_1,&
      hipsolverSsytrf_bufferSize_rank_1_cptr,&
      hipsolverSsytrf_bufferSize_full_rank,&
      hipsolverSsytrf_bufferSize_full_rank_cptr,&
      hipsolverSsytrf_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDsytrf_bufferSize
    function hipsolverDsytrf_bufferSize_(handle,n,A,lda,lwork) &
        bind(c, name="hipsolverDsytrf_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsytrf_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDsytrf_bufferSize_assumed_rank,&
      hipsolverDsytrf_bufferSize_assumed_rank_cptr,&
      hipsolverDsytrf_bufferSize_typed
#else
    module procedure &
      hipsolverDsytrf_bufferSize_rank_0,&
      hipsolverDsytrf_bufferSize_rank_0_cptr,&
      hipsolverDsytrf_bufferSize_rank_1,&
      hipsolverDsytrf_bufferSize_rank_1_cptr,&
      hipsolverDsytrf_bufferSize_full_rank,&
      hipsolverDsytrf_bufferSize_full_rank_cptr,&
      hipsolverDsytrf_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverCsytrf_bufferSize
    function hipsolverCsytrf_bufferSize_(handle,n,A,lda,lwork) &
        bind(c, name="hipsolverCsytrf_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCsytrf_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCsytrf_bufferSize_assumed_rank,&
      hipsolverCsytrf_bufferSize_assumed_rank_cptr,&
      hipsolverCsytrf_bufferSize_typed
#else
    module procedure &
      hipsolverCsytrf_bufferSize_rank_0,&
      hipsolverCsytrf_bufferSize_rank_0_cptr,&
      hipsolverCsytrf_bufferSize_rank_1,&
      hipsolverCsytrf_bufferSize_rank_1_cptr,&
      hipsolverCsytrf_bufferSize_full_rank,&
      hipsolverCsytrf_bufferSize_full_rank_cptr,&
      hipsolverCsytrf_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverZsytrf_bufferSize
    function hipsolverZsytrf_bufferSize_(handle,n,A,lda,lwork) &
        bind(c, name="hipsolverZsytrf_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZsytrf_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZsytrf_bufferSize_assumed_rank,&
      hipsolverZsytrf_bufferSize_assumed_rank_cptr,&
      hipsolverZsytrf_bufferSize_typed
#else
    module procedure &
      hipsolverZsytrf_bufferSize_rank_0,&
      hipsolverZsytrf_bufferSize_rank_0_cptr,&
      hipsolverZsytrf_bufferSize_rank_1,&
      hipsolverZsytrf_bufferSize_rank_1_cptr,&
      hipsolverZsytrf_bufferSize_full_rank,&
      hipsolverZsytrf_bufferSize_full_rank_cptr,&
      hipsolverZsytrf_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverSsytrf
    function hipsolverSsytrf_(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo) &
        bind(c, name="hipsolverSsytrf")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsytrf_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSsytrf_assumed_rank,&
      hipsolverSsytrf_assumed_rank_cptr,&
      hipsolverSsytrf_typed
#else
    module procedure &
      hipsolverSsytrf_rank_0,&
      hipsolverSsytrf_rank_0_cptr,&
      hipsolverSsytrf_rank_1,&
      hipsolverSsytrf_rank_1_cptr,&
      hipsolverSsytrf_full_rank,&
      hipsolverSsytrf_full_rank_cptr,&
      hipsolverSsytrf_typed
#endif
#endif
  end interface

  interface hipsolverDsytrf
    function hipsolverDsytrf_(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo) &
        bind(c, name="hipsolverDsytrf")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsytrf_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDsytrf_assumed_rank,&
      hipsolverDsytrf_assumed_rank_cptr,&
      hipsolverDsytrf_typed
#else
    module procedure &
      hipsolverDsytrf_rank_0,&
      hipsolverDsytrf_rank_0_cptr,&
      hipsolverDsytrf_rank_1,&
      hipsolverDsytrf_rank_1_cptr,&
      hipsolverDsytrf_full_rank,&
      hipsolverDsytrf_full_rank_cptr,&
      hipsolverDsytrf_typed
#endif
#endif
  end interface

  interface hipsolverCsytrf
    function hipsolverCsytrf_(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo) &
        bind(c, name="hipsolverCsytrf")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCsytrf_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverCsytrf_assumed_rank,&
      hipsolverCsytrf_assumed_rank_cptr,&
      hipsolverCsytrf_typed
#else
    module procedure &
      hipsolverCsytrf_rank_0,&
      hipsolverCsytrf_rank_0_cptr,&
      hipsolverCsytrf_rank_1,&
      hipsolverCsytrf_rank_1_cptr,&
      hipsolverCsytrf_full_rank,&
      hipsolverCsytrf_full_rank_cptr,&
      hipsolverCsytrf_typed
#endif
#endif
  end interface

  interface hipsolverZsytrf
    function hipsolverZsytrf_(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo) &
        bind(c, name="hipsolverZsytrf")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZsytrf_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverZsytrf_assumed_rank,&
      hipsolverZsytrf_assumed_rank_cptr,&
      hipsolverZsytrf_typed
#else
    module procedure &
      hipsolverZsytrf_rank_0,&
      hipsolverZsytrf_rank_0_cptr,&
      hipsolverZsytrf_rank_1,&
      hipsolverZsytrf_rank_1_cptr,&
      hipsolverZsytrf_full_rank,&
      hipsolverZsytrf_full_rank_cptr,&
      hipsolverZsytrf_typed
#endif
#endif
  end interface

  !>  \brief An alias for `hipsolverCreate`.
  interface hipsolverDnCreate
    function hipsolverDnCreate_(handle) bind(c, name="hipsolverDnCreate")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCreate_
      type(c_ptr) :: handle
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDnCreate_typed
#endif
  end interface

  !>  \brief An alias for `hipsolverDestroy`.
  interface hipsolverDnDestroy
    function hipsolverDnDestroy_(handle) bind(c, name="hipsolverDnDestroy")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDestroy_
      type(c_ptr),value :: handle
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDnDestroy_typed
#endif
  end interface

  !>  \brief An alias for `hipsolverSetStream`.
  interface hipsolverDnSetStream
    function hipsolverDnSetStream_(handle,streamId) bind(c, name="hipsolverDnSetStream")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSetStream_
      type(c_ptr),value :: handle
      type(c_ptr),value :: streamId
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDnSetStream_typed
#endif
  end interface

  !>  \brief An alias for `hipsolverGetStream`.
  interface hipsolverDnGetStream
    function hipsolverDnGetStream_(handle,streamId) bind(c, name="hipsolverDnGetStream")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnGetStream_
      type(c_ptr),value :: handle
      type(c_ptr) :: streamId
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDnGetStream_typed
#endif
  end interface

  !>  \brief An alias for `hipsolverSetDeterministicMode`.
  interface hipsolverDnSetDeterministicMode
    function hipsolverDnSetDeterministicMode_(handle,mode) &
        bind(c, name="hipsolverDnSetDeterministicMode")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSetDeterministicMode_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_DETERMINISTIC_RESULTS)),value :: mode
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDnSetDeterministicMode_typed
#endif
  end interface

  !>  \brief An alias for `hipsolverGetDeterministicMode`.
  interface hipsolverDnGetDeterministicMode
    function hipsolverDnGetDeterministicMode_(handle,mode) &
        bind(c, name="hipsolverDnGetDeterministicMode")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnGetDeterministicMode_
      type(c_ptr),value :: handle
      type(c_ptr),value :: mode
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnGetDeterministicMode_assumed_rank,&
      hipsolverDnGetDeterministicMode_assumed_rank_cptr,&
      hipsolverDnGetDeterministicMode_typed
#else
    module procedure &
      hipsolverDnGetDeterministicMode_rank_0,&
      hipsolverDnGetDeterministicMode_rank_0_cptr,&
      hipsolverDnGetDeterministicMode_rank_1,&
      hipsolverDnGetDeterministicMode_rank_1_cptr,&
      hipsolverDnGetDeterministicMode_typed
#endif
#endif
  end interface

  interface hipsolverDnCreateGesvdjInfo
    function hipsolverDnCreateGesvdjInfo_(myInfo) bind(c, name="hipsolverDnCreateGesvdjInfo")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCreateGesvdjInfo_
      type(c_ptr) :: myInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDnCreateGesvdjInfo_typed
#endif
  end interface

  interface hipsolverDnDestroyGesvdjInfo
    function hipsolverDnDestroyGesvdjInfo_(myInfo) bind(c, name="hipsolverDnDestroyGesvdjInfo")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDestroyGesvdjInfo_
      type(c_ptr),value :: myInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDnDestroyGesvdjInfo_typed
#endif
  end interface

  interface hipsolverDnXgesvdjSetMaxSweeps
    function hipsolverDnXgesvdjSetMaxSweeps_(myInfo,max_sweeps) &
        bind(c, name="hipsolverDnXgesvdjSetMaxSweeps")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnXgesvdjSetMaxSweeps_
      type(c_ptr),value :: myInfo
      integer(c_int),value :: max_sweeps
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDnXgesvdjSetMaxSweeps_typed
#endif
  end interface

  interface hipsolverDnXgesvdjSetSortEig
    function hipsolverDnXgesvdjSetSortEig_(myInfo,sort_eig) &
        bind(c, name="hipsolverDnXgesvdjSetSortEig")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnXgesvdjSetSortEig_
      type(c_ptr),value :: myInfo
      integer(c_int),value :: sort_eig
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDnXgesvdjSetSortEig_typed
#endif
  end interface

  interface hipsolverDnXgesvdjSetTolerance
    function hipsolverDnXgesvdjSetTolerance_(myInfo,tolerance) &
        bind(c, name="hipsolverDnXgesvdjSetTolerance")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnXgesvdjSetTolerance_
      type(c_ptr),value :: myInfo
      real(c_double),value :: tolerance
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDnXgesvdjSetTolerance_typed
#endif
  end interface

  interface hipsolverDnXgesvdjGetResidual
    function hipsolverDnXgesvdjGetResidual_(handle,myInfo,residual) &
        bind(c, name="hipsolverDnXgesvdjGetResidual")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnXgesvdjGetResidual_
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      real(c_double) :: residual
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDnXgesvdjGetResidual_typed
#endif
  end interface

  interface hipsolverDnXgesvdjGetSweeps
    function hipsolverDnXgesvdjGetSweeps_(handle,myInfo,executed_sweeps) &
        bind(c, name="hipsolverDnXgesvdjGetSweeps")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnXgesvdjGetSweeps_
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      integer(c_int) :: executed_sweeps
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDnXgesvdjGetSweeps_typed
#endif
  end interface

  interface hipsolverDnCreateSyevjInfo
    function hipsolverDnCreateSyevjInfo_(myInfo) bind(c, name="hipsolverDnCreateSyevjInfo")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCreateSyevjInfo_
      type(c_ptr) :: myInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDnCreateSyevjInfo_typed
#endif
  end interface

  interface hipsolverDnDestroySyevjInfo
    function hipsolverDnDestroySyevjInfo_(myInfo) bind(c, name="hipsolverDnDestroySyevjInfo")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDestroySyevjInfo_
      type(c_ptr),value :: myInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDnDestroySyevjInfo_typed
#endif
  end interface

  interface hipsolverDnXsyevjSetMaxSweeps
    function hipsolverDnXsyevjSetMaxSweeps_(myInfo,max_sweeps) &
        bind(c, name="hipsolverDnXsyevjSetMaxSweeps")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnXsyevjSetMaxSweeps_
      type(c_ptr),value :: myInfo
      integer(c_int),value :: max_sweeps
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDnXsyevjSetMaxSweeps_typed
#endif
  end interface

  interface hipsolverDnXsyevjSetSortEig
    function hipsolverDnXsyevjSetSortEig_(myInfo,sort_eig) &
        bind(c, name="hipsolverDnXsyevjSetSortEig")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnXsyevjSetSortEig_
      type(c_ptr),value :: myInfo
      integer(c_int),value :: sort_eig
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDnXsyevjSetSortEig_typed
#endif
  end interface

  interface hipsolverDnXsyevjSetTolerance
    function hipsolverDnXsyevjSetTolerance_(myInfo,tolerance) &
        bind(c, name="hipsolverDnXsyevjSetTolerance")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnXsyevjSetTolerance_
      type(c_ptr),value :: myInfo
      real(c_double),value :: tolerance
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDnXsyevjSetTolerance_typed
#endif
  end interface

  interface hipsolverDnXsyevjGetResidual
    function hipsolverDnXsyevjGetResidual_(handle,myInfo,residual) &
        bind(c, name="hipsolverDnXsyevjGetResidual")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnXsyevjGetResidual_
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      real(c_double) :: residual
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDnXsyevjGetResidual_typed
#endif
  end interface

  interface hipsolverDnXsyevjGetSweeps
    function hipsolverDnXsyevjGetSweeps_(handle,myInfo,executed_sweeps) &
        bind(c, name="hipsolverDnXsyevjGetSweeps")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnXsyevjGetSweeps_
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      integer(c_int) :: executed_sweeps
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDnXsyevjGetSweeps_typed
#endif
  end interface

  interface hipsolverDnSorgbr_bufferSize
    function hipsolverDnSorgbr_bufferSize_(handle,side,m,n,k,A,lda,tau,lwork) &
        bind(c, name="hipsolverDnSorgbr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSorgbr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSorgbr_bufferSize_assumed_rank,&
      hipsolverDnSorgbr_bufferSize_assumed_rank_cptr,&
      hipsolverDnSorgbr_bufferSize_typed
#else
    module procedure &
      hipsolverDnSorgbr_bufferSize_rank_0,&
      hipsolverDnSorgbr_bufferSize_rank_0_cptr,&
      hipsolverDnSorgbr_bufferSize_rank_1,&
      hipsolverDnSorgbr_bufferSize_rank_1_cptr,&
      hipsolverDnSorgbr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnDorgbr_bufferSize
    function hipsolverDnDorgbr_bufferSize_(handle,side,m,n,k,A,lda,tau,lwork) &
        bind(c, name="hipsolverDnDorgbr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDorgbr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDorgbr_bufferSize_assumed_rank,&
      hipsolverDnDorgbr_bufferSize_assumed_rank_cptr,&
      hipsolverDnDorgbr_bufferSize_typed
#else
    module procedure &
      hipsolverDnDorgbr_bufferSize_rank_0,&
      hipsolverDnDorgbr_bufferSize_rank_0_cptr,&
      hipsolverDnDorgbr_bufferSize_rank_1,&
      hipsolverDnDorgbr_bufferSize_rank_1_cptr,&
      hipsolverDnDorgbr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnCungbr_bufferSize
    function hipsolverDnCungbr_bufferSize_(handle,side,m,n,k,A,lda,tau,lwork) &
        bind(c, name="hipsolverDnCungbr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCungbr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCungbr_bufferSize_assumed_rank,&
      hipsolverDnCungbr_bufferSize_assumed_rank_cptr,&
      hipsolverDnCungbr_bufferSize_typed
#else
    module procedure &
      hipsolverDnCungbr_bufferSize_rank_0,&
      hipsolverDnCungbr_bufferSize_rank_0_cptr,&
      hipsolverDnCungbr_bufferSize_rank_1,&
      hipsolverDnCungbr_bufferSize_rank_1_cptr,&
      hipsolverDnCungbr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnZungbr_bufferSize
    function hipsolverDnZungbr_bufferSize_(handle,side,m,n,k,A,lda,tau,lwork) &
        bind(c, name="hipsolverDnZungbr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZungbr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZungbr_bufferSize_assumed_rank,&
      hipsolverDnZungbr_bufferSize_assumed_rank_cptr,&
      hipsolverDnZungbr_bufferSize_typed
#else
    module procedure &
      hipsolverDnZungbr_bufferSize_rank_0,&
      hipsolverDnZungbr_bufferSize_rank_0_cptr,&
      hipsolverDnZungbr_bufferSize_rank_1,&
      hipsolverDnZungbr_bufferSize_rank_1_cptr,&
      hipsolverDnZungbr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnSorgbr
    function hipsolverDnSorgbr_(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnSorgbr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSorgbr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSorgbr_assumed_rank,&
      hipsolverDnSorgbr_assumed_rank_cptr,&
      hipsolverDnSorgbr_typed
#else
    module procedure &
      hipsolverDnSorgbr_rank_0,&
      hipsolverDnSorgbr_rank_0_cptr,&
      hipsolverDnSorgbr_rank_1,&
      hipsolverDnSorgbr_rank_1_cptr,&
      hipsolverDnSorgbr_typed
#endif
#endif
  end interface

  interface hipsolverDnDorgbr
    function hipsolverDnDorgbr_(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnDorgbr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDorgbr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDorgbr_assumed_rank,&
      hipsolverDnDorgbr_assumed_rank_cptr,&
      hipsolverDnDorgbr_typed
#else
    module procedure &
      hipsolverDnDorgbr_rank_0,&
      hipsolverDnDorgbr_rank_0_cptr,&
      hipsolverDnDorgbr_rank_1,&
      hipsolverDnDorgbr_rank_1_cptr,&
      hipsolverDnDorgbr_typed
#endif
#endif
  end interface

  interface hipsolverDnCungbr
    function hipsolverDnCungbr_(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnCungbr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCungbr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCungbr_assumed_rank,&
      hipsolverDnCungbr_assumed_rank_cptr,&
      hipsolverDnCungbr_typed
#else
    module procedure &
      hipsolverDnCungbr_rank_0,&
      hipsolverDnCungbr_rank_0_cptr,&
      hipsolverDnCungbr_rank_1,&
      hipsolverDnCungbr_rank_1_cptr,&
      hipsolverDnCungbr_typed
#endif
#endif
  end interface

  interface hipsolverDnZungbr
    function hipsolverDnZungbr_(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnZungbr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZungbr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZungbr_assumed_rank,&
      hipsolverDnZungbr_assumed_rank_cptr,&
      hipsolverDnZungbr_typed
#else
    module procedure &
      hipsolverDnZungbr_rank_0,&
      hipsolverDnZungbr_rank_0_cptr,&
      hipsolverDnZungbr_rank_1,&
      hipsolverDnZungbr_rank_1_cptr,&
      hipsolverDnZungbr_typed
#endif
#endif
  end interface

  interface hipsolverDnSorgqr_bufferSize
    function hipsolverDnSorgqr_bufferSize_(handle,m,n,k,A,lda,tau,lwork) &
        bind(c, name="hipsolverDnSorgqr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSorgqr_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSorgqr_bufferSize_assumed_rank,&
      hipsolverDnSorgqr_bufferSize_assumed_rank_cptr,&
      hipsolverDnSorgqr_bufferSize_typed
#else
    module procedure &
      hipsolverDnSorgqr_bufferSize_rank_0,&
      hipsolverDnSorgqr_bufferSize_rank_0_cptr,&
      hipsolverDnSorgqr_bufferSize_rank_1,&
      hipsolverDnSorgqr_bufferSize_rank_1_cptr,&
      hipsolverDnSorgqr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnDorgqr_bufferSize
    function hipsolverDnDorgqr_bufferSize_(handle,m,n,k,A,lda,tau,lwork) &
        bind(c, name="hipsolverDnDorgqr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDorgqr_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDorgqr_bufferSize_assumed_rank,&
      hipsolverDnDorgqr_bufferSize_assumed_rank_cptr,&
      hipsolverDnDorgqr_bufferSize_typed
#else
    module procedure &
      hipsolverDnDorgqr_bufferSize_rank_0,&
      hipsolverDnDorgqr_bufferSize_rank_0_cptr,&
      hipsolverDnDorgqr_bufferSize_rank_1,&
      hipsolverDnDorgqr_bufferSize_rank_1_cptr,&
      hipsolverDnDorgqr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnCungqr_bufferSize
    function hipsolverDnCungqr_bufferSize_(handle,m,n,k,A,lda,tau,lwork) &
        bind(c, name="hipsolverDnCungqr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCungqr_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCungqr_bufferSize_assumed_rank,&
      hipsolverDnCungqr_bufferSize_assumed_rank_cptr,&
      hipsolverDnCungqr_bufferSize_typed
#else
    module procedure &
      hipsolverDnCungqr_bufferSize_rank_0,&
      hipsolverDnCungqr_bufferSize_rank_0_cptr,&
      hipsolverDnCungqr_bufferSize_rank_1,&
      hipsolverDnCungqr_bufferSize_rank_1_cptr,&
      hipsolverDnCungqr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnZungqr_bufferSize
    function hipsolverDnZungqr_bufferSize_(handle,m,n,k,A,lda,tau,lwork) &
        bind(c, name="hipsolverDnZungqr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZungqr_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZungqr_bufferSize_assumed_rank,&
      hipsolverDnZungqr_bufferSize_assumed_rank_cptr,&
      hipsolverDnZungqr_bufferSize_typed
#else
    module procedure &
      hipsolverDnZungqr_bufferSize_rank_0,&
      hipsolverDnZungqr_bufferSize_rank_0_cptr,&
      hipsolverDnZungqr_bufferSize_rank_1,&
      hipsolverDnZungqr_bufferSize_rank_1_cptr,&
      hipsolverDnZungqr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnSorgqr
    function hipsolverDnSorgqr_(handle,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnSorgqr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSorgqr_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSorgqr_assumed_rank,&
      hipsolverDnSorgqr_assumed_rank_cptr,&
      hipsolverDnSorgqr_typed
#else
    module procedure &
      hipsolverDnSorgqr_rank_0,&
      hipsolverDnSorgqr_rank_0_cptr,&
      hipsolverDnSorgqr_rank_1,&
      hipsolverDnSorgqr_rank_1_cptr,&
      hipsolverDnSorgqr_typed
#endif
#endif
  end interface

  interface hipsolverDnDorgqr
    function hipsolverDnDorgqr_(handle,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnDorgqr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDorgqr_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDorgqr_assumed_rank,&
      hipsolverDnDorgqr_assumed_rank_cptr,&
      hipsolverDnDorgqr_typed
#else
    module procedure &
      hipsolverDnDorgqr_rank_0,&
      hipsolverDnDorgqr_rank_0_cptr,&
      hipsolverDnDorgqr_rank_1,&
      hipsolverDnDorgqr_rank_1_cptr,&
      hipsolverDnDorgqr_typed
#endif
#endif
  end interface

  interface hipsolverDnCungqr
    function hipsolverDnCungqr_(handle,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnCungqr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCungqr_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCungqr_assumed_rank,&
      hipsolverDnCungqr_assumed_rank_cptr,&
      hipsolverDnCungqr_typed
#else
    module procedure &
      hipsolverDnCungqr_rank_0,&
      hipsolverDnCungqr_rank_0_cptr,&
      hipsolverDnCungqr_rank_1,&
      hipsolverDnCungqr_rank_1_cptr,&
      hipsolverDnCungqr_typed
#endif
#endif
  end interface

  interface hipsolverDnZungqr
    function hipsolverDnZungqr_(handle,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnZungqr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZungqr_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZungqr_assumed_rank,&
      hipsolverDnZungqr_assumed_rank_cptr,&
      hipsolverDnZungqr_typed
#else
    module procedure &
      hipsolverDnZungqr_rank_0,&
      hipsolverDnZungqr_rank_0_cptr,&
      hipsolverDnZungqr_rank_1,&
      hipsolverDnZungqr_rank_1_cptr,&
      hipsolverDnZungqr_typed
#endif
#endif
  end interface

  interface hipsolverDnSorgtr_bufferSize
    function hipsolverDnSorgtr_bufferSize_(handle,uplo,n,A,lda,tau,lwork) &
        bind(c, name="hipsolverDnSorgtr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSorgtr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSorgtr_bufferSize_assumed_rank,&
      hipsolverDnSorgtr_bufferSize_assumed_rank_cptr,&
      hipsolverDnSorgtr_bufferSize_typed
#else
    module procedure &
      hipsolverDnSorgtr_bufferSize_rank_0,&
      hipsolverDnSorgtr_bufferSize_rank_0_cptr,&
      hipsolverDnSorgtr_bufferSize_rank_1,&
      hipsolverDnSorgtr_bufferSize_rank_1_cptr,&
      hipsolverDnSorgtr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnDorgtr_bufferSize
    function hipsolverDnDorgtr_bufferSize_(handle,uplo,n,A,lda,tau,lwork) &
        bind(c, name="hipsolverDnDorgtr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDorgtr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDorgtr_bufferSize_assumed_rank,&
      hipsolverDnDorgtr_bufferSize_assumed_rank_cptr,&
      hipsolverDnDorgtr_bufferSize_typed
#else
    module procedure &
      hipsolverDnDorgtr_bufferSize_rank_0,&
      hipsolverDnDorgtr_bufferSize_rank_0_cptr,&
      hipsolverDnDorgtr_bufferSize_rank_1,&
      hipsolverDnDorgtr_bufferSize_rank_1_cptr,&
      hipsolverDnDorgtr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnCungtr_bufferSize
    function hipsolverDnCungtr_bufferSize_(handle,uplo,n,A,lda,tau,lwork) &
        bind(c, name="hipsolverDnCungtr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCungtr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCungtr_bufferSize_assumed_rank,&
      hipsolverDnCungtr_bufferSize_assumed_rank_cptr,&
      hipsolverDnCungtr_bufferSize_typed
#else
    module procedure &
      hipsolverDnCungtr_bufferSize_rank_0,&
      hipsolverDnCungtr_bufferSize_rank_0_cptr,&
      hipsolverDnCungtr_bufferSize_rank_1,&
      hipsolverDnCungtr_bufferSize_rank_1_cptr,&
      hipsolverDnCungtr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnZungtr_bufferSize
    function hipsolverDnZungtr_bufferSize_(handle,uplo,n,A,lda,tau,lwork) &
        bind(c, name="hipsolverDnZungtr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZungtr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZungtr_bufferSize_assumed_rank,&
      hipsolverDnZungtr_bufferSize_assumed_rank_cptr,&
      hipsolverDnZungtr_bufferSize_typed
#else
    module procedure &
      hipsolverDnZungtr_bufferSize_rank_0,&
      hipsolverDnZungtr_bufferSize_rank_0_cptr,&
      hipsolverDnZungtr_bufferSize_rank_1,&
      hipsolverDnZungtr_bufferSize_rank_1_cptr,&
      hipsolverDnZungtr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnSorgtr
    function hipsolverDnSorgtr_(handle,uplo,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnSorgtr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSorgtr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSorgtr_assumed_rank,&
      hipsolverDnSorgtr_assumed_rank_cptr,&
      hipsolverDnSorgtr_typed
#else
    module procedure &
      hipsolverDnSorgtr_rank_0,&
      hipsolverDnSorgtr_rank_0_cptr,&
      hipsolverDnSorgtr_rank_1,&
      hipsolverDnSorgtr_rank_1_cptr,&
      hipsolverDnSorgtr_typed
#endif
#endif
  end interface

  interface hipsolverDnDorgtr
    function hipsolverDnDorgtr_(handle,uplo,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnDorgtr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDorgtr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDorgtr_assumed_rank,&
      hipsolverDnDorgtr_assumed_rank_cptr,&
      hipsolverDnDorgtr_typed
#else
    module procedure &
      hipsolverDnDorgtr_rank_0,&
      hipsolverDnDorgtr_rank_0_cptr,&
      hipsolverDnDorgtr_rank_1,&
      hipsolverDnDorgtr_rank_1_cptr,&
      hipsolverDnDorgtr_typed
#endif
#endif
  end interface

  interface hipsolverDnCungtr
    function hipsolverDnCungtr_(handle,uplo,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnCungtr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCungtr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCungtr_assumed_rank,&
      hipsolverDnCungtr_assumed_rank_cptr,&
      hipsolverDnCungtr_typed
#else
    module procedure &
      hipsolverDnCungtr_rank_0,&
      hipsolverDnCungtr_rank_0_cptr,&
      hipsolverDnCungtr_rank_1,&
      hipsolverDnCungtr_rank_1_cptr,&
      hipsolverDnCungtr_typed
#endif
#endif
  end interface

  interface hipsolverDnZungtr
    function hipsolverDnZungtr_(handle,uplo,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnZungtr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZungtr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZungtr_assumed_rank,&
      hipsolverDnZungtr_assumed_rank_cptr,&
      hipsolverDnZungtr_typed
#else
    module procedure &
      hipsolverDnZungtr_rank_0,&
      hipsolverDnZungtr_rank_0_cptr,&
      hipsolverDnZungtr_rank_1,&
      hipsolverDnZungtr_rank_1_cptr,&
      hipsolverDnZungtr_typed
#endif
#endif
  end interface

  interface hipsolverDnSormqr_bufferSize
    function hipsolverDnSormqr_bufferSize_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork) &
        bind(c, name="hipsolverDnSormqr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSormqr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSormqr_bufferSize_assumed_rank,&
      hipsolverDnSormqr_bufferSize_assumed_rank_cptr,&
      hipsolverDnSormqr_bufferSize_typed
#else
    module procedure &
      hipsolverDnSormqr_bufferSize_rank_0,&
      hipsolverDnSormqr_bufferSize_rank_0_cptr,&
      hipsolverDnSormqr_bufferSize_rank_1,&
      hipsolverDnSormqr_bufferSize_rank_1_cptr,&
      hipsolverDnSormqr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnDormqr_bufferSize
    function hipsolverDnDormqr_bufferSize_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork) &
        bind(c, name="hipsolverDnDormqr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDormqr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDormqr_bufferSize_assumed_rank,&
      hipsolverDnDormqr_bufferSize_assumed_rank_cptr,&
      hipsolverDnDormqr_bufferSize_typed
#else
    module procedure &
      hipsolverDnDormqr_bufferSize_rank_0,&
      hipsolverDnDormqr_bufferSize_rank_0_cptr,&
      hipsolverDnDormqr_bufferSize_rank_1,&
      hipsolverDnDormqr_bufferSize_rank_1_cptr,&
      hipsolverDnDormqr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnCunmqr_bufferSize
    function hipsolverDnCunmqr_bufferSize_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork) &
        bind(c, name="hipsolverDnCunmqr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCunmqr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCunmqr_bufferSize_assumed_rank,&
      hipsolverDnCunmqr_bufferSize_assumed_rank_cptr,&
      hipsolverDnCunmqr_bufferSize_typed
#else
    module procedure &
      hipsolverDnCunmqr_bufferSize_rank_0,&
      hipsolverDnCunmqr_bufferSize_rank_0_cptr,&
      hipsolverDnCunmqr_bufferSize_rank_1,&
      hipsolverDnCunmqr_bufferSize_rank_1_cptr,&
      hipsolverDnCunmqr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnZunmqr_bufferSize
    function hipsolverDnZunmqr_bufferSize_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork) &
        bind(c, name="hipsolverDnZunmqr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZunmqr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZunmqr_bufferSize_assumed_rank,&
      hipsolverDnZunmqr_bufferSize_assumed_rank_cptr,&
      hipsolverDnZunmqr_bufferSize_typed
#else
    module procedure &
      hipsolverDnZunmqr_bufferSize_rank_0,&
      hipsolverDnZunmqr_bufferSize_rank_0_cptr,&
      hipsolverDnZunmqr_bufferSize_rank_1,&
      hipsolverDnZunmqr_bufferSize_rank_1_cptr,&
      hipsolverDnZunmqr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnSormqr
    function hipsolverDnSormqr_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="hipsolverDnSormqr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSormqr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSormqr_assumed_rank,&
      hipsolverDnSormqr_assumed_rank_cptr,&
      hipsolverDnSormqr_typed
#else
    module procedure &
      hipsolverDnSormqr_rank_0,&
      hipsolverDnSormqr_rank_0_cptr,&
      hipsolverDnSormqr_rank_1,&
      hipsolverDnSormqr_rank_1_cptr,&
      hipsolverDnSormqr_typed
#endif
#endif
  end interface

  interface hipsolverDnDormqr
    function hipsolverDnDormqr_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="hipsolverDnDormqr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDormqr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDormqr_assumed_rank,&
      hipsolverDnDormqr_assumed_rank_cptr,&
      hipsolverDnDormqr_typed
#else
    module procedure &
      hipsolverDnDormqr_rank_0,&
      hipsolverDnDormqr_rank_0_cptr,&
      hipsolverDnDormqr_rank_1,&
      hipsolverDnDormqr_rank_1_cptr,&
      hipsolverDnDormqr_typed
#endif
#endif
  end interface

  interface hipsolverDnCunmqr
    function hipsolverDnCunmqr_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="hipsolverDnCunmqr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCunmqr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCunmqr_assumed_rank,&
      hipsolverDnCunmqr_assumed_rank_cptr,&
      hipsolverDnCunmqr_typed
#else
    module procedure &
      hipsolverDnCunmqr_rank_0,&
      hipsolverDnCunmqr_rank_0_cptr,&
      hipsolverDnCunmqr_rank_1,&
      hipsolverDnCunmqr_rank_1_cptr,&
      hipsolverDnCunmqr_typed
#endif
#endif
  end interface

  interface hipsolverDnZunmqr
    function hipsolverDnZunmqr_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="hipsolverDnZunmqr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZunmqr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZunmqr_assumed_rank,&
      hipsolverDnZunmqr_assumed_rank_cptr,&
      hipsolverDnZunmqr_typed
#else
    module procedure &
      hipsolverDnZunmqr_rank_0,&
      hipsolverDnZunmqr_rank_0_cptr,&
      hipsolverDnZunmqr_rank_1,&
      hipsolverDnZunmqr_rank_1_cptr,&
      hipsolverDnZunmqr_typed
#endif
#endif
  end interface

  interface hipsolverDnSormtr_bufferSize
    function hipsolverDnSormtr_bufferSize_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork) &
        bind(c, name="hipsolverDnSormtr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSormtr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSormtr_bufferSize_assumed_rank,&
      hipsolverDnSormtr_bufferSize_assumed_rank_cptr,&
      hipsolverDnSormtr_bufferSize_typed
#else
    module procedure &
      hipsolverDnSormtr_bufferSize_rank_0,&
      hipsolverDnSormtr_bufferSize_rank_0_cptr,&
      hipsolverDnSormtr_bufferSize_rank_1,&
      hipsolverDnSormtr_bufferSize_rank_1_cptr,&
      hipsolverDnSormtr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnDormtr_bufferSize
    function hipsolverDnDormtr_bufferSize_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork) &
        bind(c, name="hipsolverDnDormtr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDormtr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDormtr_bufferSize_assumed_rank,&
      hipsolverDnDormtr_bufferSize_assumed_rank_cptr,&
      hipsolverDnDormtr_bufferSize_typed
#else
    module procedure &
      hipsolverDnDormtr_bufferSize_rank_0,&
      hipsolverDnDormtr_bufferSize_rank_0_cptr,&
      hipsolverDnDormtr_bufferSize_rank_1,&
      hipsolverDnDormtr_bufferSize_rank_1_cptr,&
      hipsolverDnDormtr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnCunmtr_bufferSize
    function hipsolverDnCunmtr_bufferSize_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork) &
        bind(c, name="hipsolverDnCunmtr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCunmtr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCunmtr_bufferSize_assumed_rank,&
      hipsolverDnCunmtr_bufferSize_assumed_rank_cptr,&
      hipsolverDnCunmtr_bufferSize_typed
#else
    module procedure &
      hipsolverDnCunmtr_bufferSize_rank_0,&
      hipsolverDnCunmtr_bufferSize_rank_0_cptr,&
      hipsolverDnCunmtr_bufferSize_rank_1,&
      hipsolverDnCunmtr_bufferSize_rank_1_cptr,&
      hipsolverDnCunmtr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnZunmtr_bufferSize
    function hipsolverDnZunmtr_bufferSize_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork) &
        bind(c, name="hipsolverDnZunmtr_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZunmtr_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZunmtr_bufferSize_assumed_rank,&
      hipsolverDnZunmtr_bufferSize_assumed_rank_cptr,&
      hipsolverDnZunmtr_bufferSize_typed
#else
    module procedure &
      hipsolverDnZunmtr_bufferSize_rank_0,&
      hipsolverDnZunmtr_bufferSize_rank_0_cptr,&
      hipsolverDnZunmtr_bufferSize_rank_1,&
      hipsolverDnZunmtr_bufferSize_rank_1_cptr,&
      hipsolverDnZunmtr_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnSormtr
    function hipsolverDnSormtr_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="hipsolverDnSormtr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSormtr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSormtr_assumed_rank,&
      hipsolverDnSormtr_assumed_rank_cptr,&
      hipsolverDnSormtr_typed
#else
    module procedure &
      hipsolverDnSormtr_rank_0,&
      hipsolverDnSormtr_rank_0_cptr,&
      hipsolverDnSormtr_rank_1,&
      hipsolverDnSormtr_rank_1_cptr,&
      hipsolverDnSormtr_typed
#endif
#endif
  end interface

  interface hipsolverDnDormtr
    function hipsolverDnDormtr_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="hipsolverDnDormtr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDormtr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDormtr_assumed_rank,&
      hipsolverDnDormtr_assumed_rank_cptr,&
      hipsolverDnDormtr_typed
#else
    module procedure &
      hipsolverDnDormtr_rank_0,&
      hipsolverDnDormtr_rank_0_cptr,&
      hipsolverDnDormtr_rank_1,&
      hipsolverDnDormtr_rank_1_cptr,&
      hipsolverDnDormtr_typed
#endif
#endif
  end interface

  interface hipsolverDnCunmtr
    function hipsolverDnCunmtr_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="hipsolverDnCunmtr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCunmtr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCunmtr_assumed_rank,&
      hipsolverDnCunmtr_assumed_rank_cptr,&
      hipsolverDnCunmtr_typed
#else
    module procedure &
      hipsolverDnCunmtr_rank_0,&
      hipsolverDnCunmtr_rank_0_cptr,&
      hipsolverDnCunmtr_rank_1,&
      hipsolverDnCunmtr_rank_1_cptr,&
      hipsolverDnCunmtr_typed
#endif
#endif
  end interface

  interface hipsolverDnZunmtr
    function hipsolverDnZunmtr_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="hipsolverDnZunmtr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZunmtr_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZunmtr_assumed_rank,&
      hipsolverDnZunmtr_assumed_rank_cptr,&
      hipsolverDnZunmtr_typed
#else
    module procedure &
      hipsolverDnZunmtr_rank_0,&
      hipsolverDnZunmtr_rank_0_cptr,&
      hipsolverDnZunmtr_rank_1,&
      hipsolverDnZunmtr_rank_1_cptr,&
      hipsolverDnZunmtr_typed
#endif
#endif
  end interface

  interface hipsolverDnSgebrd_bufferSize
    function hipsolverDnSgebrd_bufferSize_(handle,m,n,lwork) &
        bind(c, name="hipsolverDnSgebrd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSgebrd_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDnSgebrd_bufferSize_typed
#endif
  end interface

  interface hipsolverDnDgebrd_bufferSize
    function hipsolverDnDgebrd_bufferSize_(handle,m,n,lwork) &
        bind(c, name="hipsolverDnDgebrd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDgebrd_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDnDgebrd_bufferSize_typed
#endif
  end interface

  interface hipsolverDnCgebrd_bufferSize
    function hipsolverDnCgebrd_bufferSize_(handle,m,n,lwork) &
        bind(c, name="hipsolverDnCgebrd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCgebrd_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDnCgebrd_bufferSize_typed
#endif
  end interface

  interface hipsolverDnZgebrd_bufferSize
    function hipsolverDnZgebrd_bufferSize_(handle,m,n,lwork) &
        bind(c, name="hipsolverDnZgebrd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZgebrd_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDnZgebrd_bufferSize_typed
#endif
  end interface

  interface hipsolverDnSgebrd
    function hipsolverDnSgebrd_(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo) &
        bind(c, name="hipsolverDnSgebrd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSgebrd_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      type(c_ptr),value :: tauq
      type(c_ptr),value :: taup
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSgebrd_assumed_rank,&
      hipsolverDnSgebrd_assumed_rank_cptr,&
      hipsolverDnSgebrd_typed
#else
    module procedure &
      hipsolverDnSgebrd_rank_0,&
      hipsolverDnSgebrd_rank_0_cptr,&
      hipsolverDnSgebrd_rank_1,&
      hipsolverDnSgebrd_rank_1_cptr,&
      hipsolverDnSgebrd_typed
#endif
#endif
  end interface

  interface hipsolverDnDgebrd
    function hipsolverDnDgebrd_(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo) &
        bind(c, name="hipsolverDnDgebrd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDgebrd_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      type(c_ptr),value :: tauq
      type(c_ptr),value :: taup
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDgebrd_assumed_rank,&
      hipsolverDnDgebrd_assumed_rank_cptr,&
      hipsolverDnDgebrd_typed
#else
    module procedure &
      hipsolverDnDgebrd_rank_0,&
      hipsolverDnDgebrd_rank_0_cptr,&
      hipsolverDnDgebrd_rank_1,&
      hipsolverDnDgebrd_rank_1_cptr,&
      hipsolverDnDgebrd_typed
#endif
#endif
  end interface

  interface hipsolverDnCgebrd
    function hipsolverDnCgebrd_(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo) &
        bind(c, name="hipsolverDnCgebrd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCgebrd_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      type(c_ptr),value :: tauq
      type(c_ptr),value :: taup
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCgebrd_assumed_rank,&
      hipsolverDnCgebrd_assumed_rank_cptr,&
      hipsolverDnCgebrd_typed
#else
    module procedure &
      hipsolverDnCgebrd_rank_0,&
      hipsolverDnCgebrd_rank_0_cptr,&
      hipsolverDnCgebrd_rank_1,&
      hipsolverDnCgebrd_rank_1_cptr,&
      hipsolverDnCgebrd_typed
#endif
#endif
  end interface

  interface hipsolverDnZgebrd
    function hipsolverDnZgebrd_(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo) &
        bind(c, name="hipsolverDnZgebrd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZgebrd_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      type(c_ptr),value :: tauq
      type(c_ptr),value :: taup
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZgebrd_assumed_rank,&
      hipsolverDnZgebrd_assumed_rank_cptr,&
      hipsolverDnZgebrd_typed
#else
    module procedure &
      hipsolverDnZgebrd_rank_0,&
      hipsolverDnZgebrd_rank_0_cptr,&
      hipsolverDnZgebrd_rank_1,&
      hipsolverDnZgebrd_rank_1_cptr,&
      hipsolverDnZgebrd_typed
#endif
#endif
  end interface

  interface hipsolverDnSSgels_bufferSize
    function hipsolverDnSSgels_bufferSize_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,work,lwork) &
        bind(c, name="hipsolverDnSSgels_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSSgels_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      type(c_ptr),value :: work
      integer(c_size_t) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSSgels_bufferSize_assumed_rank,&
      hipsolverDnSSgels_bufferSize_assumed_rank_cptr,&
      hipsolverDnSSgels_bufferSize_typed
#else
    module procedure &
      hipsolverDnSSgels_bufferSize_rank_0,&
      hipsolverDnSSgels_bufferSize_rank_0_cptr,&
      hipsolverDnSSgels_bufferSize_rank_1,&
      hipsolverDnSSgels_bufferSize_rank_1_cptr,&
      hipsolverDnSSgels_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnDDgels_bufferSize
    function hipsolverDnDDgels_bufferSize_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,work,lwork) &
        bind(c, name="hipsolverDnDDgels_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDDgels_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      type(c_ptr),value :: work
      integer(c_size_t) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDDgels_bufferSize_assumed_rank,&
      hipsolverDnDDgels_bufferSize_assumed_rank_cptr,&
      hipsolverDnDDgels_bufferSize_typed
#else
    module procedure &
      hipsolverDnDDgels_bufferSize_rank_0,&
      hipsolverDnDDgels_bufferSize_rank_0_cptr,&
      hipsolverDnDDgels_bufferSize_rank_1,&
      hipsolverDnDDgels_bufferSize_rank_1_cptr,&
      hipsolverDnDDgels_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnCCgels_bufferSize
    function hipsolverDnCCgels_bufferSize_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,work,lwork) &
        bind(c, name="hipsolverDnCCgels_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCCgels_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      type(c_ptr),value :: work
      integer(c_size_t) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCCgels_bufferSize_assumed_rank,&
      hipsolverDnCCgels_bufferSize_assumed_rank_cptr,&
      hipsolverDnCCgels_bufferSize_typed
#else
    module procedure &
      hipsolverDnCCgels_bufferSize_rank_0,&
      hipsolverDnCCgels_bufferSize_rank_0_cptr,&
      hipsolverDnCCgels_bufferSize_rank_1,&
      hipsolverDnCCgels_bufferSize_rank_1_cptr,&
      hipsolverDnCCgels_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnZZgels_bufferSize
    function hipsolverDnZZgels_bufferSize_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,work,lwork) &
        bind(c, name="hipsolverDnZZgels_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZZgels_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      type(c_ptr),value :: work
      integer(c_size_t) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZZgels_bufferSize_assumed_rank,&
      hipsolverDnZZgels_bufferSize_assumed_rank_cptr,&
      hipsolverDnZZgels_bufferSize_typed
#else
    module procedure &
      hipsolverDnZZgels_bufferSize_rank_0,&
      hipsolverDnZZgels_bufferSize_rank_0_cptr,&
      hipsolverDnZZgels_bufferSize_rank_1,&
      hipsolverDnZZgels_bufferSize_rank_1_cptr,&
      hipsolverDnZZgels_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnSSgels
    function hipsolverDnSSgels_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="hipsolverDnSSgels")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSSgels_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      type(c_ptr),value :: work
      integer(c_size_t),value :: lwork
      type(c_ptr),value :: niters
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSSgels_assumed_rank,&
      hipsolverDnSSgels_assumed_rank_cptr,&
      hipsolverDnSSgels_typed
#else
    module procedure &
      hipsolverDnSSgels_rank_0,&
      hipsolverDnSSgels_rank_0_cptr,&
      hipsolverDnSSgels_rank_1,&
      hipsolverDnSSgels_rank_1_cptr,&
      hipsolverDnSSgels_typed
#endif
#endif
  end interface

  interface hipsolverDnDDgels
    function hipsolverDnDDgels_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="hipsolverDnDDgels")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDDgels_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      type(c_ptr),value :: work
      integer(c_size_t),value :: lwork
      type(c_ptr),value :: niters
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDDgels_assumed_rank,&
      hipsolverDnDDgels_assumed_rank_cptr,&
      hipsolverDnDDgels_typed
#else
    module procedure &
      hipsolverDnDDgels_rank_0,&
      hipsolverDnDDgels_rank_0_cptr,&
      hipsolverDnDDgels_rank_1,&
      hipsolverDnDDgels_rank_1_cptr,&
      hipsolverDnDDgels_typed
#endif
#endif
  end interface

  interface hipsolverDnCCgels
    function hipsolverDnCCgels_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="hipsolverDnCCgels")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCCgels_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      type(c_ptr),value :: work
      integer(c_size_t),value :: lwork
      type(c_ptr),value :: niters
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCCgels_assumed_rank,&
      hipsolverDnCCgels_assumed_rank_cptr,&
      hipsolverDnCCgels_typed
#else
    module procedure &
      hipsolverDnCCgels_rank_0,&
      hipsolverDnCCgels_rank_0_cptr,&
      hipsolverDnCCgels_rank_1,&
      hipsolverDnCCgels_rank_1_cptr,&
      hipsolverDnCCgels_typed
#endif
#endif
  end interface

  interface hipsolverDnZZgels
    function hipsolverDnZZgels_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="hipsolverDnZZgels")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZZgels_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      type(c_ptr),value :: work
      integer(c_size_t),value :: lwork
      type(c_ptr),value :: niters
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZZgels_assumed_rank,&
      hipsolverDnZZgels_assumed_rank_cptr,&
      hipsolverDnZZgels_typed
#else
    module procedure &
      hipsolverDnZZgels_rank_0,&
      hipsolverDnZZgels_rank_0_cptr,&
      hipsolverDnZZgels_rank_1,&
      hipsolverDnZZgels_rank_1_cptr,&
      hipsolverDnZZgels_typed
#endif
#endif
  end interface

  interface hipsolverDnSgeqrf_bufferSize
    function hipsolverDnSgeqrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="hipsolverDnSgeqrf_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSgeqrf_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSgeqrf_bufferSize_assumed_rank,&
      hipsolverDnSgeqrf_bufferSize_assumed_rank_cptr,&
      hipsolverDnSgeqrf_bufferSize_typed
#else
    module procedure &
      hipsolverDnSgeqrf_bufferSize_rank_0,&
      hipsolverDnSgeqrf_bufferSize_rank_0_cptr,&
      hipsolverDnSgeqrf_bufferSize_rank_1,&
      hipsolverDnSgeqrf_bufferSize_rank_1_cptr,&
      hipsolverDnSgeqrf_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnDgeqrf_bufferSize
    function hipsolverDnDgeqrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="hipsolverDnDgeqrf_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDgeqrf_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDgeqrf_bufferSize_assumed_rank,&
      hipsolverDnDgeqrf_bufferSize_assumed_rank_cptr,&
      hipsolverDnDgeqrf_bufferSize_typed
#else
    module procedure &
      hipsolverDnDgeqrf_bufferSize_rank_0,&
      hipsolverDnDgeqrf_bufferSize_rank_0_cptr,&
      hipsolverDnDgeqrf_bufferSize_rank_1,&
      hipsolverDnDgeqrf_bufferSize_rank_1_cptr,&
      hipsolverDnDgeqrf_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnCgeqrf_bufferSize
    function hipsolverDnCgeqrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="hipsolverDnCgeqrf_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCgeqrf_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCgeqrf_bufferSize_assumed_rank,&
      hipsolverDnCgeqrf_bufferSize_assumed_rank_cptr,&
      hipsolverDnCgeqrf_bufferSize_typed
#else
    module procedure &
      hipsolverDnCgeqrf_bufferSize_rank_0,&
      hipsolverDnCgeqrf_bufferSize_rank_0_cptr,&
      hipsolverDnCgeqrf_bufferSize_rank_1,&
      hipsolverDnCgeqrf_bufferSize_rank_1_cptr,&
      hipsolverDnCgeqrf_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnZgeqrf_bufferSize
    function hipsolverDnZgeqrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="hipsolverDnZgeqrf_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZgeqrf_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZgeqrf_bufferSize_assumed_rank,&
      hipsolverDnZgeqrf_bufferSize_assumed_rank_cptr,&
      hipsolverDnZgeqrf_bufferSize_typed
#else
    module procedure &
      hipsolverDnZgeqrf_bufferSize_rank_0,&
      hipsolverDnZgeqrf_bufferSize_rank_0_cptr,&
      hipsolverDnZgeqrf_bufferSize_rank_1,&
      hipsolverDnZgeqrf_bufferSize_rank_1_cptr,&
      hipsolverDnZgeqrf_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnSgeqrf
    function hipsolverDnSgeqrf_(handle,m,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnSgeqrf")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSgeqrf_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSgeqrf_assumed_rank,&
      hipsolverDnSgeqrf_assumed_rank_cptr,&
      hipsolverDnSgeqrf_typed
#else
    module procedure &
      hipsolverDnSgeqrf_rank_0,&
      hipsolverDnSgeqrf_rank_0_cptr,&
      hipsolverDnSgeqrf_rank_1,&
      hipsolverDnSgeqrf_rank_1_cptr,&
      hipsolverDnSgeqrf_typed
#endif
#endif
  end interface

  interface hipsolverDnDgeqrf
    function hipsolverDnDgeqrf_(handle,m,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnDgeqrf")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDgeqrf_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDgeqrf_assumed_rank,&
      hipsolverDnDgeqrf_assumed_rank_cptr,&
      hipsolverDnDgeqrf_typed
#else
    module procedure &
      hipsolverDnDgeqrf_rank_0,&
      hipsolverDnDgeqrf_rank_0_cptr,&
      hipsolverDnDgeqrf_rank_1,&
      hipsolverDnDgeqrf_rank_1_cptr,&
      hipsolverDnDgeqrf_typed
#endif
#endif
  end interface

  interface hipsolverDnCgeqrf
    function hipsolverDnCgeqrf_(handle,m,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnCgeqrf")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCgeqrf_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCgeqrf_assumed_rank,&
      hipsolverDnCgeqrf_assumed_rank_cptr,&
      hipsolverDnCgeqrf_typed
#else
    module procedure &
      hipsolverDnCgeqrf_rank_0,&
      hipsolverDnCgeqrf_rank_0_cptr,&
      hipsolverDnCgeqrf_rank_1,&
      hipsolverDnCgeqrf_rank_1_cptr,&
      hipsolverDnCgeqrf_typed
#endif
#endif
  end interface

  interface hipsolverDnZgeqrf
    function hipsolverDnZgeqrf_(handle,m,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnZgeqrf")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZgeqrf_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZgeqrf_assumed_rank,&
      hipsolverDnZgeqrf_assumed_rank_cptr,&
      hipsolverDnZgeqrf_typed
#else
    module procedure &
      hipsolverDnZgeqrf_rank_0,&
      hipsolverDnZgeqrf_rank_0_cptr,&
      hipsolverDnZgeqrf_rank_1,&
      hipsolverDnZgeqrf_rank_1_cptr,&
      hipsolverDnZgeqrf_typed
#endif
#endif
  end interface

  interface hipsolverDnSSgesv_bufferSize
    function hipsolverDnSSgesv_bufferSize_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork) &
        bind(c, name="hipsolverDnSSgesv_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSSgesv_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      type(c_ptr),value :: work
      integer(c_size_t) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSSgesv_bufferSize_assumed_rank,&
      hipsolverDnSSgesv_bufferSize_assumed_rank_cptr,&
      hipsolverDnSSgesv_bufferSize_typed
#else
    module procedure &
      hipsolverDnSSgesv_bufferSize_rank_0,&
      hipsolverDnSSgesv_bufferSize_rank_0_cptr,&
      hipsolverDnSSgesv_bufferSize_rank_1,&
      hipsolverDnSSgesv_bufferSize_rank_1_cptr,&
      hipsolverDnSSgesv_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnDDgesv_bufferSize
    function hipsolverDnDDgesv_bufferSize_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork) &
        bind(c, name="hipsolverDnDDgesv_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDDgesv_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      type(c_ptr),value :: work
      integer(c_size_t) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDDgesv_bufferSize_assumed_rank,&
      hipsolverDnDDgesv_bufferSize_assumed_rank_cptr,&
      hipsolverDnDDgesv_bufferSize_typed
#else
    module procedure &
      hipsolverDnDDgesv_bufferSize_rank_0,&
      hipsolverDnDDgesv_bufferSize_rank_0_cptr,&
      hipsolverDnDDgesv_bufferSize_rank_1,&
      hipsolverDnDDgesv_bufferSize_rank_1_cptr,&
      hipsolverDnDDgesv_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnCCgesv_bufferSize
    function hipsolverDnCCgesv_bufferSize_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork) &
        bind(c, name="hipsolverDnCCgesv_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCCgesv_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      type(c_ptr),value :: work
      integer(c_size_t) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCCgesv_bufferSize_assumed_rank,&
      hipsolverDnCCgesv_bufferSize_assumed_rank_cptr,&
      hipsolverDnCCgesv_bufferSize_typed
#else
    module procedure &
      hipsolverDnCCgesv_bufferSize_rank_0,&
      hipsolverDnCCgesv_bufferSize_rank_0_cptr,&
      hipsolverDnCCgesv_bufferSize_rank_1,&
      hipsolverDnCCgesv_bufferSize_rank_1_cptr,&
      hipsolverDnCCgesv_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnZZgesv_bufferSize
    function hipsolverDnZZgesv_bufferSize_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork) &
        bind(c, name="hipsolverDnZZgesv_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZZgesv_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      type(c_ptr),value :: work
      integer(c_size_t) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZZgesv_bufferSize_assumed_rank,&
      hipsolverDnZZgesv_bufferSize_assumed_rank_cptr,&
      hipsolverDnZZgesv_bufferSize_typed
#else
    module procedure &
      hipsolverDnZZgesv_bufferSize_rank_0,&
      hipsolverDnZZgesv_bufferSize_rank_0_cptr,&
      hipsolverDnZZgesv_bufferSize_rank_1,&
      hipsolverDnZZgesv_bufferSize_rank_1_cptr,&
      hipsolverDnZZgesv_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnSSgesv
    function hipsolverDnSSgesv_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="hipsolverDnSSgesv")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSSgesv_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      type(c_ptr),value :: work
      integer(c_size_t),value :: lwork
      type(c_ptr),value :: niters
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSSgesv_assumed_rank,&
      hipsolverDnSSgesv_assumed_rank_cptr,&
      hipsolverDnSSgesv_typed
#else
    module procedure &
      hipsolverDnSSgesv_rank_0,&
      hipsolverDnSSgesv_rank_0_cptr,&
      hipsolverDnSSgesv_rank_1,&
      hipsolverDnSSgesv_rank_1_cptr,&
      hipsolverDnSSgesv_typed
#endif
#endif
  end interface

  interface hipsolverDnDDgesv
    function hipsolverDnDDgesv_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="hipsolverDnDDgesv")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDDgesv_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      type(c_ptr),value :: work
      integer(c_size_t),value :: lwork
      type(c_ptr),value :: niters
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDDgesv_assumed_rank,&
      hipsolverDnDDgesv_assumed_rank_cptr,&
      hipsolverDnDDgesv_typed
#else
    module procedure &
      hipsolverDnDDgesv_rank_0,&
      hipsolverDnDDgesv_rank_0_cptr,&
      hipsolverDnDDgesv_rank_1,&
      hipsolverDnDDgesv_rank_1_cptr,&
      hipsolverDnDDgesv_typed
#endif
#endif
  end interface

  interface hipsolverDnCCgesv
    function hipsolverDnCCgesv_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="hipsolverDnCCgesv")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCCgesv_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      type(c_ptr),value :: work
      integer(c_size_t),value :: lwork
      type(c_ptr),value :: niters
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCCgesv_assumed_rank,&
      hipsolverDnCCgesv_assumed_rank_cptr,&
      hipsolverDnCCgesv_typed
#else
    module procedure &
      hipsolverDnCCgesv_rank_0,&
      hipsolverDnCCgesv_rank_0_cptr,&
      hipsolverDnCCgesv_rank_1,&
      hipsolverDnCCgesv_rank_1_cptr,&
      hipsolverDnCCgesv_typed
#endif
#endif
  end interface

  interface hipsolverDnZZgesv
    function hipsolverDnZZgesv_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="hipsolverDnZZgesv")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZZgesv_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: X
      integer(c_int),value :: ldx
      type(c_ptr),value :: work
      integer(c_size_t),value :: lwork
      type(c_ptr),value :: niters
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZZgesv_assumed_rank,&
      hipsolverDnZZgesv_assumed_rank_cptr,&
      hipsolverDnZZgesv_typed
#else
    module procedure &
      hipsolverDnZZgesv_rank_0,&
      hipsolverDnZZgesv_rank_0_cptr,&
      hipsolverDnZZgesv_rank_1,&
      hipsolverDnZZgesv_rank_1_cptr,&
      hipsolverDnZZgesv_typed
#endif
#endif
  end interface

  interface hipsolverDnSgesvd_bufferSize
    function hipsolverDnSgesvd_bufferSize_(handle,m,n,lwork) &
        bind(c, name="hipsolverDnSgesvd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSgesvd_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDnSgesvd_bufferSize_typed
#endif
  end interface

  interface hipsolverDnDgesvd_bufferSize
    function hipsolverDnDgesvd_bufferSize_(handle,m,n,lwork) &
        bind(c, name="hipsolverDnDgesvd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDgesvd_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDnDgesvd_bufferSize_typed
#endif
  end interface

  interface hipsolverDnCgesvd_bufferSize
    function hipsolverDnCgesvd_bufferSize_(handle,m,n,lwork) &
        bind(c, name="hipsolverDnCgesvd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCgesvd_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDnCgesvd_bufferSize_typed
#endif
  end interface

  interface hipsolverDnZgesvd_bufferSize
    function hipsolverDnZgesvd_bufferSize_(handle,m,n,lwork) &
        bind(c, name="hipsolverDnZgesvd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZgesvd_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDnZgesvd_bufferSize_typed
#endif
  end interface

  interface hipsolverDnSgesvd
    function hipsolverDnSgesvd_(handle,jobu,jobv,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,rwork,devInfo) &
        bind(c, name="hipsolverDnSgesvd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSgesvd_
      type(c_ptr),value :: handle
      character(c_char),value :: jobu
      character(c_char),value :: jobv
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: rwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSgesvd_assumed_rank,&
      hipsolverDnSgesvd_assumed_rank_cptr,&
      hipsolverDnSgesvd_typed
#else
    module procedure &
      hipsolverDnSgesvd_rank_0,&
      hipsolverDnSgesvd_rank_0_cptr,&
      hipsolverDnSgesvd_rank_1,&
      hipsolverDnSgesvd_rank_1_cptr,&
      hipsolverDnSgesvd_typed
#endif
#endif
  end interface

  interface hipsolverDnDgesvd
    function hipsolverDnDgesvd_(handle,jobu,jobv,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,rwork,devInfo) &
        bind(c, name="hipsolverDnDgesvd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDgesvd_
      type(c_ptr),value :: handle
      character(c_char),value :: jobu
      character(c_char),value :: jobv
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: rwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDgesvd_assumed_rank,&
      hipsolverDnDgesvd_assumed_rank_cptr,&
      hipsolverDnDgesvd_typed
#else
    module procedure &
      hipsolverDnDgesvd_rank_0,&
      hipsolverDnDgesvd_rank_0_cptr,&
      hipsolverDnDgesvd_rank_1,&
      hipsolverDnDgesvd_rank_1_cptr,&
      hipsolverDnDgesvd_typed
#endif
#endif
  end interface

  interface hipsolverDnCgesvd
    function hipsolverDnCgesvd_(handle,jobu,jobv,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,rwork,devInfo) &
        bind(c, name="hipsolverDnCgesvd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCgesvd_
      type(c_ptr),value :: handle
      character(c_char),value :: jobu
      character(c_char),value :: jobv
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: rwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCgesvd_assumed_rank,&
      hipsolverDnCgesvd_assumed_rank_cptr,&
      hipsolverDnCgesvd_typed
#else
    module procedure &
      hipsolverDnCgesvd_rank_0,&
      hipsolverDnCgesvd_rank_0_cptr,&
      hipsolverDnCgesvd_rank_1,&
      hipsolverDnCgesvd_rank_1_cptr,&
      hipsolverDnCgesvd_typed
#endif
#endif
  end interface

  interface hipsolverDnZgesvd
    function hipsolverDnZgesvd_(handle,jobu,jobv,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,rwork,devInfo) &
        bind(c, name="hipsolverDnZgesvd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZgesvd_
      type(c_ptr),value :: handle
      character(c_char),value :: jobu
      character(c_char),value :: jobv
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: rwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZgesvd_assumed_rank,&
      hipsolverDnZgesvd_assumed_rank_cptr,&
      hipsolverDnZgesvd_typed
#else
    module procedure &
      hipsolverDnZgesvd_rank_0,&
      hipsolverDnZgesvd_rank_0_cptr,&
      hipsolverDnZgesvd_rank_1,&
      hipsolverDnZgesvd_rank_1_cptr,&
      hipsolverDnZgesvd_typed
#endif
#endif
  end interface

  interface hipsolverDnSgesvdj_bufferSize
    function hipsolverDnSgesvdj_bufferSize_(handle,jobz,econ,m,n,A,lda,S,U,ldu,V,ldv,lwork,params) &
        bind(c, name="hipsolverDnSgesvdj_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSgesvdj_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: econ
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      integer(c_int) :: lwork
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSgesvdj_bufferSize_assumed_rank,&
      hipsolverDnSgesvdj_bufferSize_assumed_rank_cptr,&
      hipsolverDnSgesvdj_bufferSize_typed
#else
    module procedure &
      hipsolverDnSgesvdj_bufferSize_rank_0,&
      hipsolverDnSgesvdj_bufferSize_rank_0_cptr,&
      hipsolverDnSgesvdj_bufferSize_rank_1,&
      hipsolverDnSgesvdj_bufferSize_rank_1_cptr,&
      hipsolverDnSgesvdj_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnDgesvdj_bufferSize
    function hipsolverDnDgesvdj_bufferSize_(handle,jobz,econ,m,n,A,lda,S,U,ldu,V,ldv,lwork,params) &
        bind(c, name="hipsolverDnDgesvdj_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDgesvdj_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: econ
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      integer(c_int) :: lwork
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDgesvdj_bufferSize_assumed_rank,&
      hipsolverDnDgesvdj_bufferSize_assumed_rank_cptr,&
      hipsolverDnDgesvdj_bufferSize_typed
#else
    module procedure &
      hipsolverDnDgesvdj_bufferSize_rank_0,&
      hipsolverDnDgesvdj_bufferSize_rank_0_cptr,&
      hipsolverDnDgesvdj_bufferSize_rank_1,&
      hipsolverDnDgesvdj_bufferSize_rank_1_cptr,&
      hipsolverDnDgesvdj_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnCgesvdj_bufferSize
    function hipsolverDnCgesvdj_bufferSize_(handle,jobz,econ,m,n,A,lda,S,U,ldu,V,ldv,lwork,params) &
        bind(c, name="hipsolverDnCgesvdj_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCgesvdj_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: econ
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      integer(c_int) :: lwork
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCgesvdj_bufferSize_assumed_rank,&
      hipsolverDnCgesvdj_bufferSize_assumed_rank_cptr,&
      hipsolverDnCgesvdj_bufferSize_typed
#else
    module procedure &
      hipsolverDnCgesvdj_bufferSize_rank_0,&
      hipsolverDnCgesvdj_bufferSize_rank_0_cptr,&
      hipsolverDnCgesvdj_bufferSize_rank_1,&
      hipsolverDnCgesvdj_bufferSize_rank_1_cptr,&
      hipsolverDnCgesvdj_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnZgesvdj_bufferSize
    function hipsolverDnZgesvdj_bufferSize_(handle,jobz,econ,m,n,A,lda,S,U,ldu,V,ldv,lwork,params) &
        bind(c, name="hipsolverDnZgesvdj_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZgesvdj_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: econ
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      integer(c_int) :: lwork
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZgesvdj_bufferSize_assumed_rank,&
      hipsolverDnZgesvdj_bufferSize_assumed_rank_cptr,&
      hipsolverDnZgesvdj_bufferSize_typed
#else
    module procedure &
      hipsolverDnZgesvdj_bufferSize_rank_0,&
      hipsolverDnZgesvdj_bufferSize_rank_0_cptr,&
      hipsolverDnZgesvdj_bufferSize_rank_1,&
      hipsolverDnZgesvdj_bufferSize_rank_1_cptr,&
      hipsolverDnZgesvdj_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnSgesvdj
    function hipsolverDnSgesvdj_(handle,jobz,econ,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,devInfo, &
        params) &
        bind(c, name="hipsolverDnSgesvdj")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSgesvdj_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: econ
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSgesvdj_assumed_rank,&
      hipsolverDnSgesvdj_assumed_rank_cptr,&
      hipsolverDnSgesvdj_typed
#else
    module procedure &
      hipsolverDnSgesvdj_rank_0,&
      hipsolverDnSgesvdj_rank_0_cptr,&
      hipsolverDnSgesvdj_rank_1,&
      hipsolverDnSgesvdj_rank_1_cptr,&
      hipsolverDnSgesvdj_typed
#endif
#endif
  end interface

  interface hipsolverDnDgesvdj
    function hipsolverDnDgesvdj_(handle,jobz,econ,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,devInfo, &
        params) &
        bind(c, name="hipsolverDnDgesvdj")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDgesvdj_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: econ
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDgesvdj_assumed_rank,&
      hipsolverDnDgesvdj_assumed_rank_cptr,&
      hipsolverDnDgesvdj_typed
#else
    module procedure &
      hipsolverDnDgesvdj_rank_0,&
      hipsolverDnDgesvdj_rank_0_cptr,&
      hipsolverDnDgesvdj_rank_1,&
      hipsolverDnDgesvdj_rank_1_cptr,&
      hipsolverDnDgesvdj_typed
#endif
#endif
  end interface

  interface hipsolverDnCgesvdj
    function hipsolverDnCgesvdj_(handle,jobz,econ,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,devInfo, &
        params) &
        bind(c, name="hipsolverDnCgesvdj")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCgesvdj_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: econ
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCgesvdj_assumed_rank,&
      hipsolverDnCgesvdj_assumed_rank_cptr,&
      hipsolverDnCgesvdj_typed
#else
    module procedure &
      hipsolverDnCgesvdj_rank_0,&
      hipsolverDnCgesvdj_rank_0_cptr,&
      hipsolverDnCgesvdj_rank_1,&
      hipsolverDnCgesvdj_rank_1_cptr,&
      hipsolverDnCgesvdj_typed
#endif
#endif
  end interface

  interface hipsolverDnZgesvdj
    function hipsolverDnZgesvdj_(handle,jobz,econ,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,devInfo, &
        params) &
        bind(c, name="hipsolverDnZgesvdj")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZgesvdj_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: econ
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZgesvdj_assumed_rank,&
      hipsolverDnZgesvdj_assumed_rank_cptr,&
      hipsolverDnZgesvdj_typed
#else
    module procedure &
      hipsolverDnZgesvdj_rank_0,&
      hipsolverDnZgesvdj_rank_0_cptr,&
      hipsolverDnZgesvdj_rank_1,&
      hipsolverDnZgesvdj_rank_1_cptr,&
      hipsolverDnZgesvdj_typed
#endif
#endif
  end interface

  interface hipsolverDnSgesvdjBatched_bufferSize
    function hipsolverDnSgesvdjBatched_bufferSize_(handle,jobz,m,n,A,lda,S,U,ldu,V,ldv,lwork, &
        params,batch_count) &
        bind(c, name="hipsolverDnSgesvdjBatched_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSgesvdjBatched_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      integer(c_int) :: lwork
      type(c_ptr),value :: params
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSgesvdjBatched_bufferSize_assumed_rank,&
      hipsolverDnSgesvdjBatched_bufferSize_assumed_rank_cptr,&
      hipsolverDnSgesvdjBatched_bufferSize_typed
#else
    module procedure &
      hipsolverDnSgesvdjBatched_bufferSize_rank_0,&
      hipsolverDnSgesvdjBatched_bufferSize_rank_0_cptr,&
      hipsolverDnSgesvdjBatched_bufferSize_rank_1,&
      hipsolverDnSgesvdjBatched_bufferSize_rank_1_cptr,&
      hipsolverDnSgesvdjBatched_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnDgesvdjBatched_bufferSize
    function hipsolverDnDgesvdjBatched_bufferSize_(handle,jobz,m,n,A,lda,S,U,ldu,V,ldv,lwork, &
        params,batch_count) &
        bind(c, name="hipsolverDnDgesvdjBatched_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDgesvdjBatched_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      integer(c_int) :: lwork
      type(c_ptr),value :: params
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDgesvdjBatched_bufferSize_assumed_rank,&
      hipsolverDnDgesvdjBatched_bufferSize_assumed_rank_cptr,&
      hipsolverDnDgesvdjBatched_bufferSize_typed
#else
    module procedure &
      hipsolverDnDgesvdjBatched_bufferSize_rank_0,&
      hipsolverDnDgesvdjBatched_bufferSize_rank_0_cptr,&
      hipsolverDnDgesvdjBatched_bufferSize_rank_1,&
      hipsolverDnDgesvdjBatched_bufferSize_rank_1_cptr,&
      hipsolverDnDgesvdjBatched_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnCgesvdjBatched_bufferSize
    function hipsolverDnCgesvdjBatched_bufferSize_(handle,jobz,m,n,A,lda,S,U,ldu,V,ldv,lwork, &
        params,batch_count) &
        bind(c, name="hipsolverDnCgesvdjBatched_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCgesvdjBatched_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      integer(c_int) :: lwork
      type(c_ptr),value :: params
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCgesvdjBatched_bufferSize_assumed_rank,&
      hipsolverDnCgesvdjBatched_bufferSize_assumed_rank_cptr,&
      hipsolverDnCgesvdjBatched_bufferSize_typed
#else
    module procedure &
      hipsolverDnCgesvdjBatched_bufferSize_rank_0,&
      hipsolverDnCgesvdjBatched_bufferSize_rank_0_cptr,&
      hipsolverDnCgesvdjBatched_bufferSize_rank_1,&
      hipsolverDnCgesvdjBatched_bufferSize_rank_1_cptr,&
      hipsolverDnCgesvdjBatched_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnZgesvdjBatched_bufferSize
    function hipsolverDnZgesvdjBatched_bufferSize_(handle,jobz,m,n,A,lda,S,U,ldu,V,ldv,lwork, &
        params,batch_count) &
        bind(c, name="hipsolverDnZgesvdjBatched_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZgesvdjBatched_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      integer(c_int) :: lwork
      type(c_ptr),value :: params
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZgesvdjBatched_bufferSize_assumed_rank,&
      hipsolverDnZgesvdjBatched_bufferSize_assumed_rank_cptr,&
      hipsolverDnZgesvdjBatched_bufferSize_typed
#else
    module procedure &
      hipsolverDnZgesvdjBatched_bufferSize_rank_0,&
      hipsolverDnZgesvdjBatched_bufferSize_rank_0_cptr,&
      hipsolverDnZgesvdjBatched_bufferSize_rank_1,&
      hipsolverDnZgesvdjBatched_bufferSize_rank_1_cptr,&
      hipsolverDnZgesvdjBatched_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnSgesvdjBatched
    function hipsolverDnSgesvdjBatched_(handle,jobz,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,devInfo, &
        params,batch_count) &
        bind(c, name="hipsolverDnSgesvdjBatched")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSgesvdjBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
      type(c_ptr),value :: params
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSgesvdjBatched_assumed_rank,&
      hipsolverDnSgesvdjBatched_assumed_rank_cptr,&
      hipsolverDnSgesvdjBatched_typed
#else
    module procedure &
      hipsolverDnSgesvdjBatched_rank_0,&
      hipsolverDnSgesvdjBatched_rank_0_cptr,&
      hipsolverDnSgesvdjBatched_rank_1,&
      hipsolverDnSgesvdjBatched_rank_1_cptr,&
      hipsolverDnSgesvdjBatched_typed
#endif
#endif
  end interface

  interface hipsolverDnDgesvdjBatched
    function hipsolverDnDgesvdjBatched_(handle,jobz,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,devInfo, &
        params,batch_count) &
        bind(c, name="hipsolverDnDgesvdjBatched")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDgesvdjBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
      type(c_ptr),value :: params
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDgesvdjBatched_assumed_rank,&
      hipsolverDnDgesvdjBatched_assumed_rank_cptr,&
      hipsolverDnDgesvdjBatched_typed
#else
    module procedure &
      hipsolverDnDgesvdjBatched_rank_0,&
      hipsolverDnDgesvdjBatched_rank_0_cptr,&
      hipsolverDnDgesvdjBatched_rank_1,&
      hipsolverDnDgesvdjBatched_rank_1_cptr,&
      hipsolverDnDgesvdjBatched_typed
#endif
#endif
  end interface

  interface hipsolverDnCgesvdjBatched
    function hipsolverDnCgesvdjBatched_(handle,jobz,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,devInfo, &
        params,batch_count) &
        bind(c, name="hipsolverDnCgesvdjBatched")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCgesvdjBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
      type(c_ptr),value :: params
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCgesvdjBatched_assumed_rank,&
      hipsolverDnCgesvdjBatched_assumed_rank_cptr,&
      hipsolverDnCgesvdjBatched_typed
#else
    module procedure &
      hipsolverDnCgesvdjBatched_rank_0,&
      hipsolverDnCgesvdjBatched_rank_0_cptr,&
      hipsolverDnCgesvdjBatched_rank_1,&
      hipsolverDnCgesvdjBatched_rank_1_cptr,&
      hipsolverDnCgesvdjBatched_typed
#endif
#endif
  end interface

  interface hipsolverDnZgesvdjBatched
    function hipsolverDnZgesvdjBatched_(handle,jobz,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,devInfo, &
        params,batch_count) &
        bind(c, name="hipsolverDnZgesvdjBatched")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZgesvdjBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: S
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
      type(c_ptr),value :: params
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZgesvdjBatched_assumed_rank,&
      hipsolverDnZgesvdjBatched_assumed_rank_cptr,&
      hipsolverDnZgesvdjBatched_typed
#else
    module procedure &
      hipsolverDnZgesvdjBatched_rank_0,&
      hipsolverDnZgesvdjBatched_rank_0_cptr,&
      hipsolverDnZgesvdjBatched_rank_1,&
      hipsolverDnZgesvdjBatched_rank_1_cptr,&
      hipsolverDnZgesvdjBatched_typed
#endif
#endif
  end interface

  interface hipsolverDnSgesvdaStridedBatched_bufferSize
    function hipsolverDnSgesvdaStridedBatched_bufferSize_(handle,jobz,rank,m,n,A,lda,strideA,S, &
        strideS,U,ldu,strideU,V,ldv,strideV,lwork,batch_count) &
        bind(c, name="hipsolverDnSgesvdaStridedBatched_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSgesvdaStridedBatched_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: rank
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: S
      integer(c_int64_t),value :: strideS
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      integer(c_int64_t),value :: strideU
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      integer(c_int64_t),value :: strideV
      integer(c_int) :: lwork
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSgesvdaStridedBatched_bufferSize_assumed_rank,&
      hipsolverDnSgesvdaStridedBatched_bufferSize_assumed_rank_cptr,&
      hipsolverDnSgesvdaStridedBatched_bufferSize_typed
#else
    module procedure &
      hipsolverDnSgesvdaStridedBatched_bufferSize_rank_0,&
      hipsolverDnSgesvdaStridedBatched_bufferSize_rank_0_cptr,&
      hipsolverDnSgesvdaStridedBatched_bufferSize_rank_1,&
      hipsolverDnSgesvdaStridedBatched_bufferSize_rank_1_cptr,&
      hipsolverDnSgesvdaStridedBatched_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnDgesvdaStridedBatched_bufferSize
    function hipsolverDnDgesvdaStridedBatched_bufferSize_(handle,jobz,rank,m,n,A,lda,strideA,S, &
        strideS,U,ldu,strideU,V,ldv,strideV,lwork,batch_count) &
        bind(c, name="hipsolverDnDgesvdaStridedBatched_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDgesvdaStridedBatched_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: rank
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: S
      integer(c_int64_t),value :: strideS
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      integer(c_int64_t),value :: strideU
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      integer(c_int64_t),value :: strideV
      integer(c_int) :: lwork
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDgesvdaStridedBatched_bufferSize_assumed_rank,&
      hipsolverDnDgesvdaStridedBatched_bufferSize_assumed_rank_cptr,&
      hipsolverDnDgesvdaStridedBatched_bufferSize_typed
#else
    module procedure &
      hipsolverDnDgesvdaStridedBatched_bufferSize_rank_0,&
      hipsolverDnDgesvdaStridedBatched_bufferSize_rank_0_cptr,&
      hipsolverDnDgesvdaStridedBatched_bufferSize_rank_1,&
      hipsolverDnDgesvdaStridedBatched_bufferSize_rank_1_cptr,&
      hipsolverDnDgesvdaStridedBatched_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnCgesvdaStridedBatched_bufferSize
    function hipsolverDnCgesvdaStridedBatched_bufferSize_(handle,jobz,rank,m,n,A,lda,strideA,S, &
        strideS,U,ldu,strideU,V,ldv,strideV,lwork,batch_count) &
        bind(c, name="hipsolverDnCgesvdaStridedBatched_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCgesvdaStridedBatched_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: rank
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: S
      integer(c_int64_t),value :: strideS
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      integer(c_int64_t),value :: strideU
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      integer(c_int64_t),value :: strideV
      integer(c_int) :: lwork
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCgesvdaStridedBatched_bufferSize_assumed_rank,&
      hipsolverDnCgesvdaStridedBatched_bufferSize_assumed_rank_cptr,&
      hipsolverDnCgesvdaStridedBatched_bufferSize_typed
#else
    module procedure &
      hipsolverDnCgesvdaStridedBatched_bufferSize_rank_0,&
      hipsolverDnCgesvdaStridedBatched_bufferSize_rank_0_cptr,&
      hipsolverDnCgesvdaStridedBatched_bufferSize_rank_1,&
      hipsolverDnCgesvdaStridedBatched_bufferSize_rank_1_cptr,&
      hipsolverDnCgesvdaStridedBatched_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnZgesvdaStridedBatched_bufferSize
    function hipsolverDnZgesvdaStridedBatched_bufferSize_(handle,jobz,rank,m,n,A,lda,strideA,S, &
        strideS,U,ldu,strideU,V,ldv,strideV,lwork,batch_count) &
        bind(c, name="hipsolverDnZgesvdaStridedBatched_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZgesvdaStridedBatched_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: rank
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: S
      integer(c_int64_t),value :: strideS
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      integer(c_int64_t),value :: strideU
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      integer(c_int64_t),value :: strideV
      integer(c_int) :: lwork
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZgesvdaStridedBatched_bufferSize_assumed_rank,&
      hipsolverDnZgesvdaStridedBatched_bufferSize_assumed_rank_cptr,&
      hipsolverDnZgesvdaStridedBatched_bufferSize_typed
#else
    module procedure &
      hipsolverDnZgesvdaStridedBatched_bufferSize_rank_0,&
      hipsolverDnZgesvdaStridedBatched_bufferSize_rank_0_cptr,&
      hipsolverDnZgesvdaStridedBatched_bufferSize_rank_1,&
      hipsolverDnZgesvdaStridedBatched_bufferSize_rank_1_cptr,&
      hipsolverDnZgesvdaStridedBatched_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnSgesvdaStridedBatched
    function hipsolverDnSgesvdaStridedBatched_(handle,jobz,rank,m,n,A,lda,strideA,S,strideS,U,ldu, &
        strideU,V,ldv,strideV,work,lwork,devInfo,hRnrmF,batch_count) &
        bind(c, name="hipsolverDnSgesvdaStridedBatched")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSgesvdaStridedBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: rank
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: S
      integer(c_int64_t),value :: strideS
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      integer(c_int64_t),value :: strideU
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      integer(c_int64_t),value :: strideV
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
      type(c_ptr),value :: hRnrmF
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSgesvdaStridedBatched_assumed_rank,&
      hipsolverDnSgesvdaStridedBatched_assumed_rank_cptr,&
      hipsolverDnSgesvdaStridedBatched_typed
#else
    module procedure &
      hipsolverDnSgesvdaStridedBatched_rank_0,&
      hipsolverDnSgesvdaStridedBatched_rank_0_cptr,&
      hipsolverDnSgesvdaStridedBatched_rank_1,&
      hipsolverDnSgesvdaStridedBatched_rank_1_cptr,&
      hipsolverDnSgesvdaStridedBatched_typed
#endif
#endif
  end interface

  interface hipsolverDnDgesvdaStridedBatched
    function hipsolverDnDgesvdaStridedBatched_(handle,jobz,rank,m,n,A,lda,strideA,S,strideS,U,ldu, &
        strideU,V,ldv,strideV,work,lwork,devInfo,hRnrmF,batch_count) &
        bind(c, name="hipsolverDnDgesvdaStridedBatched")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDgesvdaStridedBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: rank
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: S
      integer(c_int64_t),value :: strideS
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      integer(c_int64_t),value :: strideU
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      integer(c_int64_t),value :: strideV
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
      type(c_ptr),value :: hRnrmF
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDgesvdaStridedBatched_assumed_rank,&
      hipsolverDnDgesvdaStridedBatched_assumed_rank_cptr,&
      hipsolverDnDgesvdaStridedBatched_typed
#else
    module procedure &
      hipsolverDnDgesvdaStridedBatched_rank_0,&
      hipsolverDnDgesvdaStridedBatched_rank_0_cptr,&
      hipsolverDnDgesvdaStridedBatched_rank_1,&
      hipsolverDnDgesvdaStridedBatched_rank_1_cptr,&
      hipsolverDnDgesvdaStridedBatched_typed
#endif
#endif
  end interface

  interface hipsolverDnCgesvdaStridedBatched
    function hipsolverDnCgesvdaStridedBatched_(handle,jobz,rank,m,n,A,lda,strideA,S,strideS,U,ldu, &
        strideU,V,ldv,strideV,work,lwork,devInfo,hRnrmF,batch_count) &
        bind(c, name="hipsolverDnCgesvdaStridedBatched")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCgesvdaStridedBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: rank
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: S
      integer(c_int64_t),value :: strideS
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      integer(c_int64_t),value :: strideU
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      integer(c_int64_t),value :: strideV
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
      type(c_ptr),value :: hRnrmF
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCgesvdaStridedBatched_assumed_rank,&
      hipsolverDnCgesvdaStridedBatched_assumed_rank_cptr,&
      hipsolverDnCgesvdaStridedBatched_typed
#else
    module procedure &
      hipsolverDnCgesvdaStridedBatched_rank_0,&
      hipsolverDnCgesvdaStridedBatched_rank_0_cptr,&
      hipsolverDnCgesvdaStridedBatched_rank_1,&
      hipsolverDnCgesvdaStridedBatched_rank_1_cptr,&
      hipsolverDnCgesvdaStridedBatched_typed
#endif
#endif
  end interface

  interface hipsolverDnZgesvdaStridedBatched
    function hipsolverDnZgesvdaStridedBatched_(handle,jobz,rank,m,n,A,lda,strideA,S,strideS,U,ldu, &
        strideU,V,ldv,strideV,work,lwork,devInfo,hRnrmF,batch_count) &
        bind(c, name="hipsolverDnZgesvdaStridedBatched")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZgesvdaStridedBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(c_int),value :: rank
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: S
      integer(c_int64_t),value :: strideS
      type(c_ptr),value :: U
      integer(c_int),value :: ldu
      integer(c_int64_t),value :: strideU
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      integer(c_int64_t),value :: strideV
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
      type(c_ptr),value :: hRnrmF
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZgesvdaStridedBatched_assumed_rank,&
      hipsolverDnZgesvdaStridedBatched_assumed_rank_cptr,&
      hipsolverDnZgesvdaStridedBatched_typed
#else
    module procedure &
      hipsolverDnZgesvdaStridedBatched_rank_0,&
      hipsolverDnZgesvdaStridedBatched_rank_0_cptr,&
      hipsolverDnZgesvdaStridedBatched_rank_1,&
      hipsolverDnZgesvdaStridedBatched_rank_1_cptr,&
      hipsolverDnZgesvdaStridedBatched_typed
#endif
#endif
  end interface

  interface hipsolverDnSgetrf_bufferSize
    function hipsolverDnSgetrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="hipsolverDnSgetrf_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSgetrf_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSgetrf_bufferSize_assumed_rank,&
      hipsolverDnSgetrf_bufferSize_assumed_rank_cptr,&
      hipsolverDnSgetrf_bufferSize_typed
#else
    module procedure &
      hipsolverDnSgetrf_bufferSize_rank_0,&
      hipsolverDnSgetrf_bufferSize_rank_0_cptr,&
      hipsolverDnSgetrf_bufferSize_rank_1,&
      hipsolverDnSgetrf_bufferSize_rank_1_cptr,&
      hipsolverDnSgetrf_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnDgetrf_bufferSize
    function hipsolverDnDgetrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="hipsolverDnDgetrf_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDgetrf_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDgetrf_bufferSize_assumed_rank,&
      hipsolverDnDgetrf_bufferSize_assumed_rank_cptr,&
      hipsolverDnDgetrf_bufferSize_typed
#else
    module procedure &
      hipsolverDnDgetrf_bufferSize_rank_0,&
      hipsolverDnDgetrf_bufferSize_rank_0_cptr,&
      hipsolverDnDgetrf_bufferSize_rank_1,&
      hipsolverDnDgetrf_bufferSize_rank_1_cptr,&
      hipsolverDnDgetrf_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnCgetrf_bufferSize
    function hipsolverDnCgetrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="hipsolverDnCgetrf_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCgetrf_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCgetrf_bufferSize_assumed_rank,&
      hipsolverDnCgetrf_bufferSize_assumed_rank_cptr,&
      hipsolverDnCgetrf_bufferSize_typed
#else
    module procedure &
      hipsolverDnCgetrf_bufferSize_rank_0,&
      hipsolverDnCgetrf_bufferSize_rank_0_cptr,&
      hipsolverDnCgetrf_bufferSize_rank_1,&
      hipsolverDnCgetrf_bufferSize_rank_1_cptr,&
      hipsolverDnCgetrf_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnZgetrf_bufferSize
    function hipsolverDnZgetrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="hipsolverDnZgetrf_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZgetrf_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZgetrf_bufferSize_assumed_rank,&
      hipsolverDnZgetrf_bufferSize_assumed_rank_cptr,&
      hipsolverDnZgetrf_bufferSize_typed
#else
    module procedure &
      hipsolverDnZgetrf_bufferSize_rank_0,&
      hipsolverDnZgetrf_bufferSize_rank_0_cptr,&
      hipsolverDnZgetrf_bufferSize_rank_1,&
      hipsolverDnZgetrf_bufferSize_rank_1_cptr,&
      hipsolverDnZgetrf_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnSgetrf
    function hipsolverDnSgetrf_(handle,m,n,A,lda,work,devIpiv,devInfo) &
        bind(c, name="hipsolverDnSgetrf")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSgetrf_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSgetrf_assumed_rank,&
      hipsolverDnSgetrf_assumed_rank_cptr,&
      hipsolverDnSgetrf_typed
#else
    module procedure &
      hipsolverDnSgetrf_rank_0,&
      hipsolverDnSgetrf_rank_0_cptr,&
      hipsolverDnSgetrf_rank_1,&
      hipsolverDnSgetrf_rank_1_cptr,&
      hipsolverDnSgetrf_typed
#endif
#endif
  end interface

  interface hipsolverDnDgetrf
    function hipsolverDnDgetrf_(handle,m,n,A,lda,work,devIpiv,devInfo) &
        bind(c, name="hipsolverDnDgetrf")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDgetrf_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDgetrf_assumed_rank,&
      hipsolverDnDgetrf_assumed_rank_cptr,&
      hipsolverDnDgetrf_typed
#else
    module procedure &
      hipsolverDnDgetrf_rank_0,&
      hipsolverDnDgetrf_rank_0_cptr,&
      hipsolverDnDgetrf_rank_1,&
      hipsolverDnDgetrf_rank_1_cptr,&
      hipsolverDnDgetrf_typed
#endif
#endif
  end interface

  interface hipsolverDnCgetrf
    function hipsolverDnCgetrf_(handle,m,n,A,lda,work,devIpiv,devInfo) &
        bind(c, name="hipsolverDnCgetrf")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCgetrf_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCgetrf_assumed_rank,&
      hipsolverDnCgetrf_assumed_rank_cptr,&
      hipsolverDnCgetrf_typed
#else
    module procedure &
      hipsolverDnCgetrf_rank_0,&
      hipsolverDnCgetrf_rank_0_cptr,&
      hipsolverDnCgetrf_rank_1,&
      hipsolverDnCgetrf_rank_1_cptr,&
      hipsolverDnCgetrf_typed
#endif
#endif
  end interface

  interface hipsolverDnZgetrf
    function hipsolverDnZgetrf_(handle,m,n,A,lda,work,devIpiv,devInfo) &
        bind(c, name="hipsolverDnZgetrf")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZgetrf_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZgetrf_assumed_rank,&
      hipsolverDnZgetrf_assumed_rank_cptr,&
      hipsolverDnZgetrf_typed
#else
    module procedure &
      hipsolverDnZgetrf_rank_0,&
      hipsolverDnZgetrf_rank_0_cptr,&
      hipsolverDnZgetrf_rank_1,&
      hipsolverDnZgetrf_rank_1_cptr,&
      hipsolverDnZgetrf_typed
#endif
#endif
  end interface

  interface hipsolverDnSgetrs
    function hipsolverDnSgetrs_(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,devInfo) &
        bind(c, name="hipsolverDnSgetrs")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSgetrs_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSgetrs_assumed_rank,&
      hipsolverDnSgetrs_assumed_rank_cptr,&
      hipsolverDnSgetrs_typed
#else
    module procedure &
      hipsolverDnSgetrs_rank_0,&
      hipsolverDnSgetrs_rank_0_cptr,&
      hipsolverDnSgetrs_rank_1,&
      hipsolverDnSgetrs_rank_1_cptr,&
      hipsolverDnSgetrs_typed
#endif
#endif
  end interface

  interface hipsolverDnDgetrs
    function hipsolverDnDgetrs_(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,devInfo) &
        bind(c, name="hipsolverDnDgetrs")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDgetrs_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDgetrs_assumed_rank,&
      hipsolverDnDgetrs_assumed_rank_cptr,&
      hipsolverDnDgetrs_typed
#else
    module procedure &
      hipsolverDnDgetrs_rank_0,&
      hipsolverDnDgetrs_rank_0_cptr,&
      hipsolverDnDgetrs_rank_1,&
      hipsolverDnDgetrs_rank_1_cptr,&
      hipsolverDnDgetrs_typed
#endif
#endif
  end interface

  interface hipsolverDnCgetrs
    function hipsolverDnCgetrs_(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,devInfo) &
        bind(c, name="hipsolverDnCgetrs")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCgetrs_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCgetrs_assumed_rank,&
      hipsolverDnCgetrs_assumed_rank_cptr,&
      hipsolverDnCgetrs_typed
#else
    module procedure &
      hipsolverDnCgetrs_rank_0,&
      hipsolverDnCgetrs_rank_0_cptr,&
      hipsolverDnCgetrs_rank_1,&
      hipsolverDnCgetrs_rank_1_cptr,&
      hipsolverDnCgetrs_typed
#endif
#endif
  end interface

  interface hipsolverDnZgetrs
    function hipsolverDnZgetrs_(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,devInfo) &
        bind(c, name="hipsolverDnZgetrs")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZgetrs_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZgetrs_assumed_rank,&
      hipsolverDnZgetrs_assumed_rank_cptr,&
      hipsolverDnZgetrs_typed
#else
    module procedure &
      hipsolverDnZgetrs_rank_0,&
      hipsolverDnZgetrs_rank_0_cptr,&
      hipsolverDnZgetrs_rank_1,&
      hipsolverDnZgetrs_rank_1_cptr,&
      hipsolverDnZgetrs_typed
#endif
#endif
  end interface

  interface hipsolverDnSpotrf_bufferSize
    function hipsolverDnSpotrf_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="hipsolverDnSpotrf_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSpotrf_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSpotrf_bufferSize_assumed_rank,&
      hipsolverDnSpotrf_bufferSize_assumed_rank_cptr,&
      hipsolverDnSpotrf_bufferSize_typed
#else
    module procedure &
      hipsolverDnSpotrf_bufferSize_rank_0,&
      hipsolverDnSpotrf_bufferSize_rank_0_cptr,&
      hipsolverDnSpotrf_bufferSize_rank_1,&
      hipsolverDnSpotrf_bufferSize_rank_1_cptr,&
      hipsolverDnSpotrf_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnDpotrf_bufferSize
    function hipsolverDnDpotrf_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="hipsolverDnDpotrf_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDpotrf_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDpotrf_bufferSize_assumed_rank,&
      hipsolverDnDpotrf_bufferSize_assumed_rank_cptr,&
      hipsolverDnDpotrf_bufferSize_typed
#else
    module procedure &
      hipsolverDnDpotrf_bufferSize_rank_0,&
      hipsolverDnDpotrf_bufferSize_rank_0_cptr,&
      hipsolverDnDpotrf_bufferSize_rank_1,&
      hipsolverDnDpotrf_bufferSize_rank_1_cptr,&
      hipsolverDnDpotrf_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnCpotrf_bufferSize
    function hipsolverDnCpotrf_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="hipsolverDnCpotrf_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCpotrf_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCpotrf_bufferSize_assumed_rank,&
      hipsolverDnCpotrf_bufferSize_assumed_rank_cptr,&
      hipsolverDnCpotrf_bufferSize_typed
#else
    module procedure &
      hipsolverDnCpotrf_bufferSize_rank_0,&
      hipsolverDnCpotrf_bufferSize_rank_0_cptr,&
      hipsolverDnCpotrf_bufferSize_rank_1,&
      hipsolverDnCpotrf_bufferSize_rank_1_cptr,&
      hipsolverDnCpotrf_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnZpotrf_bufferSize
    function hipsolverDnZpotrf_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="hipsolverDnZpotrf_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZpotrf_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZpotrf_bufferSize_assumed_rank,&
      hipsolverDnZpotrf_bufferSize_assumed_rank_cptr,&
      hipsolverDnZpotrf_bufferSize_typed
#else
    module procedure &
      hipsolverDnZpotrf_bufferSize_rank_0,&
      hipsolverDnZpotrf_bufferSize_rank_0_cptr,&
      hipsolverDnZpotrf_bufferSize_rank_1,&
      hipsolverDnZpotrf_bufferSize_rank_1_cptr,&
      hipsolverDnZpotrf_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnSpotrf
    function hipsolverDnSpotrf_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="hipsolverDnSpotrf")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSpotrf_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSpotrf_assumed_rank,&
      hipsolverDnSpotrf_assumed_rank_cptr,&
      hipsolverDnSpotrf_typed
#else
    module procedure &
      hipsolverDnSpotrf_rank_0,&
      hipsolverDnSpotrf_rank_0_cptr,&
      hipsolverDnSpotrf_rank_1,&
      hipsolverDnSpotrf_rank_1_cptr,&
      hipsolverDnSpotrf_typed
#endif
#endif
  end interface

  interface hipsolverDnDpotrf
    function hipsolverDnDpotrf_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="hipsolverDnDpotrf")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDpotrf_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDpotrf_assumed_rank,&
      hipsolverDnDpotrf_assumed_rank_cptr,&
      hipsolverDnDpotrf_typed
#else
    module procedure &
      hipsolverDnDpotrf_rank_0,&
      hipsolverDnDpotrf_rank_0_cptr,&
      hipsolverDnDpotrf_rank_1,&
      hipsolverDnDpotrf_rank_1_cptr,&
      hipsolverDnDpotrf_typed
#endif
#endif
  end interface

  interface hipsolverDnCpotrf
    function hipsolverDnCpotrf_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="hipsolverDnCpotrf")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCpotrf_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCpotrf_assumed_rank,&
      hipsolverDnCpotrf_assumed_rank_cptr,&
      hipsolverDnCpotrf_typed
#else
    module procedure &
      hipsolverDnCpotrf_rank_0,&
      hipsolverDnCpotrf_rank_0_cptr,&
      hipsolverDnCpotrf_rank_1,&
      hipsolverDnCpotrf_rank_1_cptr,&
      hipsolverDnCpotrf_typed
#endif
#endif
  end interface

  interface hipsolverDnZpotrf
    function hipsolverDnZpotrf_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="hipsolverDnZpotrf")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZpotrf_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZpotrf_assumed_rank,&
      hipsolverDnZpotrf_assumed_rank_cptr,&
      hipsolverDnZpotrf_typed
#else
    module procedure &
      hipsolverDnZpotrf_rank_0,&
      hipsolverDnZpotrf_rank_0_cptr,&
      hipsolverDnZpotrf_rank_1,&
      hipsolverDnZpotrf_rank_1_cptr,&
      hipsolverDnZpotrf_typed
#endif
#endif
  end interface

  interface hipsolverDnSpotrfBatched
    function hipsolverDnSpotrfBatched_(handle,uplo,n,A,lda,devInfo,batch_count) &
        bind(c, name="hipsolverDnSpotrfBatched")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSpotrfBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devInfo
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSpotrfBatched_assumed_rank,&
      hipsolverDnSpotrfBatched_assumed_rank_cptr,&
      hipsolverDnSpotrfBatched_typed
#else
    module procedure &
      hipsolverDnSpotrfBatched_rank_0,&
      hipsolverDnSpotrfBatched_rank_0_cptr,&
      hipsolverDnSpotrfBatched_rank_1,&
      hipsolverDnSpotrfBatched_rank_1_cptr,&
      hipsolverDnSpotrfBatched_typed
#endif
#endif
  end interface

  interface hipsolverDnDpotrfBatched
    function hipsolverDnDpotrfBatched_(handle,uplo,n,A,lda,devInfo,batch_count) &
        bind(c, name="hipsolverDnDpotrfBatched")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDpotrfBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devInfo
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDpotrfBatched_assumed_rank,&
      hipsolverDnDpotrfBatched_assumed_rank_cptr,&
      hipsolverDnDpotrfBatched_typed
#else
    module procedure &
      hipsolverDnDpotrfBatched_rank_0,&
      hipsolverDnDpotrfBatched_rank_0_cptr,&
      hipsolverDnDpotrfBatched_rank_1,&
      hipsolverDnDpotrfBatched_rank_1_cptr,&
      hipsolverDnDpotrfBatched_typed
#endif
#endif
  end interface

  interface hipsolverDnCpotrfBatched
    function hipsolverDnCpotrfBatched_(handle,uplo,n,A,lda,devInfo,batch_count) &
        bind(c, name="hipsolverDnCpotrfBatched")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCpotrfBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devInfo
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCpotrfBatched_assumed_rank,&
      hipsolverDnCpotrfBatched_assumed_rank_cptr,&
      hipsolverDnCpotrfBatched_typed
#else
    module procedure &
      hipsolverDnCpotrfBatched_rank_0,&
      hipsolverDnCpotrfBatched_rank_0_cptr,&
      hipsolverDnCpotrfBatched_rank_1,&
      hipsolverDnCpotrfBatched_rank_1_cptr,&
      hipsolverDnCpotrfBatched_typed
#endif
#endif
  end interface

  interface hipsolverDnZpotrfBatched
    function hipsolverDnZpotrfBatched_(handle,uplo,n,A,lda,devInfo,batch_count) &
        bind(c, name="hipsolverDnZpotrfBatched")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZpotrfBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devInfo
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZpotrfBatched_assumed_rank,&
      hipsolverDnZpotrfBatched_assumed_rank_cptr,&
      hipsolverDnZpotrfBatched_typed
#else
    module procedure &
      hipsolverDnZpotrfBatched_rank_0,&
      hipsolverDnZpotrfBatched_rank_0_cptr,&
      hipsolverDnZpotrfBatched_rank_1,&
      hipsolverDnZpotrfBatched_rank_1_cptr,&
      hipsolverDnZpotrfBatched_typed
#endif
#endif
  end interface

  interface hipsolverDnSpotri_bufferSize
    function hipsolverDnSpotri_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="hipsolverDnSpotri_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSpotri_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSpotri_bufferSize_assumed_rank,&
      hipsolverDnSpotri_bufferSize_assumed_rank_cptr,&
      hipsolverDnSpotri_bufferSize_typed
#else
    module procedure &
      hipsolverDnSpotri_bufferSize_rank_0,&
      hipsolverDnSpotri_bufferSize_rank_0_cptr,&
      hipsolverDnSpotri_bufferSize_rank_1,&
      hipsolverDnSpotri_bufferSize_rank_1_cptr,&
      hipsolverDnSpotri_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnDpotri_bufferSize
    function hipsolverDnDpotri_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="hipsolverDnDpotri_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDpotri_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDpotri_bufferSize_assumed_rank,&
      hipsolverDnDpotri_bufferSize_assumed_rank_cptr,&
      hipsolverDnDpotri_bufferSize_typed
#else
    module procedure &
      hipsolverDnDpotri_bufferSize_rank_0,&
      hipsolverDnDpotri_bufferSize_rank_0_cptr,&
      hipsolverDnDpotri_bufferSize_rank_1,&
      hipsolverDnDpotri_bufferSize_rank_1_cptr,&
      hipsolverDnDpotri_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnCpotri_bufferSize
    function hipsolverDnCpotri_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="hipsolverDnCpotri_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCpotri_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCpotri_bufferSize_assumed_rank,&
      hipsolverDnCpotri_bufferSize_assumed_rank_cptr,&
      hipsolverDnCpotri_bufferSize_typed
#else
    module procedure &
      hipsolverDnCpotri_bufferSize_rank_0,&
      hipsolverDnCpotri_bufferSize_rank_0_cptr,&
      hipsolverDnCpotri_bufferSize_rank_1,&
      hipsolverDnCpotri_bufferSize_rank_1_cptr,&
      hipsolverDnCpotri_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnZpotri_bufferSize
    function hipsolverDnZpotri_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="hipsolverDnZpotri_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZpotri_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZpotri_bufferSize_assumed_rank,&
      hipsolverDnZpotri_bufferSize_assumed_rank_cptr,&
      hipsolverDnZpotri_bufferSize_typed
#else
    module procedure &
      hipsolverDnZpotri_bufferSize_rank_0,&
      hipsolverDnZpotri_bufferSize_rank_0_cptr,&
      hipsolverDnZpotri_bufferSize_rank_1,&
      hipsolverDnZpotri_bufferSize_rank_1_cptr,&
      hipsolverDnZpotri_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnSpotri
    function hipsolverDnSpotri_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="hipsolverDnSpotri")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSpotri_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSpotri_assumed_rank,&
      hipsolverDnSpotri_assumed_rank_cptr,&
      hipsolverDnSpotri_typed
#else
    module procedure &
      hipsolverDnSpotri_rank_0,&
      hipsolverDnSpotri_rank_0_cptr,&
      hipsolverDnSpotri_rank_1,&
      hipsolverDnSpotri_rank_1_cptr,&
      hipsolverDnSpotri_typed
#endif
#endif
  end interface

  interface hipsolverDnDpotri
    function hipsolverDnDpotri_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="hipsolverDnDpotri")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDpotri_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDpotri_assumed_rank,&
      hipsolverDnDpotri_assumed_rank_cptr,&
      hipsolverDnDpotri_typed
#else
    module procedure &
      hipsolverDnDpotri_rank_0,&
      hipsolverDnDpotri_rank_0_cptr,&
      hipsolverDnDpotri_rank_1,&
      hipsolverDnDpotri_rank_1_cptr,&
      hipsolverDnDpotri_typed
#endif
#endif
  end interface

  interface hipsolverDnCpotri
    function hipsolverDnCpotri_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="hipsolverDnCpotri")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCpotri_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCpotri_assumed_rank,&
      hipsolverDnCpotri_assumed_rank_cptr,&
      hipsolverDnCpotri_typed
#else
    module procedure &
      hipsolverDnCpotri_rank_0,&
      hipsolverDnCpotri_rank_0_cptr,&
      hipsolverDnCpotri_rank_1,&
      hipsolverDnCpotri_rank_1_cptr,&
      hipsolverDnCpotri_typed
#endif
#endif
  end interface

  interface hipsolverDnZpotri
    function hipsolverDnZpotri_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="hipsolverDnZpotri")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZpotri_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZpotri_assumed_rank,&
      hipsolverDnZpotri_assumed_rank_cptr,&
      hipsolverDnZpotri_typed
#else
    module procedure &
      hipsolverDnZpotri_rank_0,&
      hipsolverDnZpotri_rank_0_cptr,&
      hipsolverDnZpotri_rank_1,&
      hipsolverDnZpotri_rank_1_cptr,&
      hipsolverDnZpotri_typed
#endif
#endif
  end interface

  interface hipsolverDnSpotrs
    function hipsolverDnSpotrs_(handle,uplo,n,nrhs,A,lda,B,ldb,devInfo) &
        bind(c, name="hipsolverDnSpotrs")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSpotrs_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSpotrs_assumed_rank,&
      hipsolverDnSpotrs_assumed_rank_cptr,&
      hipsolverDnSpotrs_typed
#else
    module procedure &
      hipsolverDnSpotrs_rank_0,&
      hipsolverDnSpotrs_rank_0_cptr,&
      hipsolverDnSpotrs_rank_1,&
      hipsolverDnSpotrs_rank_1_cptr,&
      hipsolverDnSpotrs_typed
#endif
#endif
  end interface

  interface hipsolverDnDpotrs
    function hipsolverDnDpotrs_(handle,uplo,n,nrhs,A,lda,B,ldb,devInfo) &
        bind(c, name="hipsolverDnDpotrs")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDpotrs_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDpotrs_assumed_rank,&
      hipsolverDnDpotrs_assumed_rank_cptr,&
      hipsolverDnDpotrs_typed
#else
    module procedure &
      hipsolverDnDpotrs_rank_0,&
      hipsolverDnDpotrs_rank_0_cptr,&
      hipsolverDnDpotrs_rank_1,&
      hipsolverDnDpotrs_rank_1_cptr,&
      hipsolverDnDpotrs_typed
#endif
#endif
  end interface

  interface hipsolverDnCpotrs
    function hipsolverDnCpotrs_(handle,uplo,n,nrhs,A,lda,B,ldb,devInfo) &
        bind(c, name="hipsolverDnCpotrs")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCpotrs_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCpotrs_assumed_rank,&
      hipsolverDnCpotrs_assumed_rank_cptr,&
      hipsolverDnCpotrs_typed
#else
    module procedure &
      hipsolverDnCpotrs_rank_0,&
      hipsolverDnCpotrs_rank_0_cptr,&
      hipsolverDnCpotrs_rank_1,&
      hipsolverDnCpotrs_rank_1_cptr,&
      hipsolverDnCpotrs_typed
#endif
#endif
  end interface

  interface hipsolverDnZpotrs
    function hipsolverDnZpotrs_(handle,uplo,n,nrhs,A,lda,B,ldb,devInfo) &
        bind(c, name="hipsolverDnZpotrs")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZpotrs_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZpotrs_assumed_rank,&
      hipsolverDnZpotrs_assumed_rank_cptr,&
      hipsolverDnZpotrs_typed
#else
    module procedure &
      hipsolverDnZpotrs_rank_0,&
      hipsolverDnZpotrs_rank_0_cptr,&
      hipsolverDnZpotrs_rank_1,&
      hipsolverDnZpotrs_rank_1_cptr,&
      hipsolverDnZpotrs_typed
#endif
#endif
  end interface

  interface hipsolverDnSpotrsBatched
    function hipsolverDnSpotrsBatched_(handle,uplo,n,nrhs,A,lda,B,ldb,devInfo,batch_count) &
        bind(c, name="hipsolverDnSpotrsBatched")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSpotrsBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: devInfo
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSpotrsBatched_assumed_rank,&
      hipsolverDnSpotrsBatched_assumed_rank_cptr,&
      hipsolverDnSpotrsBatched_typed
#else
    module procedure &
      hipsolverDnSpotrsBatched_rank_0,&
      hipsolverDnSpotrsBatched_rank_0_cptr,&
      hipsolverDnSpotrsBatched_rank_1,&
      hipsolverDnSpotrsBatched_rank_1_cptr,&
      hipsolverDnSpotrsBatched_typed
#endif
#endif
  end interface

  interface hipsolverDnDpotrsBatched
    function hipsolverDnDpotrsBatched_(handle,uplo,n,nrhs,A,lda,B,ldb,devInfo,batch_count) &
        bind(c, name="hipsolverDnDpotrsBatched")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDpotrsBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: devInfo
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDpotrsBatched_assumed_rank,&
      hipsolverDnDpotrsBatched_assumed_rank_cptr,&
      hipsolverDnDpotrsBatched_typed
#else
    module procedure &
      hipsolverDnDpotrsBatched_rank_0,&
      hipsolverDnDpotrsBatched_rank_0_cptr,&
      hipsolverDnDpotrsBatched_rank_1,&
      hipsolverDnDpotrsBatched_rank_1_cptr,&
      hipsolverDnDpotrsBatched_typed
#endif
#endif
  end interface

  interface hipsolverDnCpotrsBatched
    function hipsolverDnCpotrsBatched_(handle,uplo,n,nrhs,A,lda,B,ldb,devInfo,batch_count) &
        bind(c, name="hipsolverDnCpotrsBatched")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCpotrsBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: devInfo
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCpotrsBatched_assumed_rank,&
      hipsolverDnCpotrsBatched_assumed_rank_cptr,&
      hipsolverDnCpotrsBatched_typed
#else
    module procedure &
      hipsolverDnCpotrsBatched_rank_0,&
      hipsolverDnCpotrsBatched_rank_0_cptr,&
      hipsolverDnCpotrsBatched_rank_1,&
      hipsolverDnCpotrsBatched_rank_1_cptr,&
      hipsolverDnCpotrsBatched_typed
#endif
#endif
  end interface

  interface hipsolverDnZpotrsBatched
    function hipsolverDnZpotrsBatched_(handle,uplo,n,nrhs,A,lda,B,ldb,devInfo,batch_count) &
        bind(c, name="hipsolverDnZpotrsBatched")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZpotrsBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: devInfo
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZpotrsBatched_assumed_rank,&
      hipsolverDnZpotrsBatched_assumed_rank_cptr,&
      hipsolverDnZpotrsBatched_typed
#else
    module procedure &
      hipsolverDnZpotrsBatched_rank_0,&
      hipsolverDnZpotrsBatched_rank_0_cptr,&
      hipsolverDnZpotrsBatched_rank_1,&
      hipsolverDnZpotrsBatched_rank_1_cptr,&
      hipsolverDnZpotrsBatched_typed
#endif
#endif
  end interface

  interface hipsolverDnSsyevd_bufferSize
    function hipsolverDnSsyevd_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork) &
        bind(c, name="hipsolverDnSsyevd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSsyevd_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSsyevd_bufferSize_assumed_rank,&
      hipsolverDnSsyevd_bufferSize_assumed_rank_cptr,&
      hipsolverDnSsyevd_bufferSize_typed
#else
    module procedure &
      hipsolverDnSsyevd_bufferSize_rank_0,&
      hipsolverDnSsyevd_bufferSize_rank_0_cptr,&
      hipsolverDnSsyevd_bufferSize_rank_1,&
      hipsolverDnSsyevd_bufferSize_rank_1_cptr,&
      hipsolverDnSsyevd_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnDsyevd_bufferSize
    function hipsolverDnDsyevd_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork) &
        bind(c, name="hipsolverDnDsyevd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDsyevd_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDsyevd_bufferSize_assumed_rank,&
      hipsolverDnDsyevd_bufferSize_assumed_rank_cptr,&
      hipsolverDnDsyevd_bufferSize_typed
#else
    module procedure &
      hipsolverDnDsyevd_bufferSize_rank_0,&
      hipsolverDnDsyevd_bufferSize_rank_0_cptr,&
      hipsolverDnDsyevd_bufferSize_rank_1,&
      hipsolverDnDsyevd_bufferSize_rank_1_cptr,&
      hipsolverDnDsyevd_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnCheevd_bufferSize
    function hipsolverDnCheevd_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork) &
        bind(c, name="hipsolverDnCheevd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCheevd_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCheevd_bufferSize_assumed_rank,&
      hipsolverDnCheevd_bufferSize_assumed_rank_cptr,&
      hipsolverDnCheevd_bufferSize_typed
#else
    module procedure &
      hipsolverDnCheevd_bufferSize_rank_0,&
      hipsolverDnCheevd_bufferSize_rank_0_cptr,&
      hipsolverDnCheevd_bufferSize_rank_1,&
      hipsolverDnCheevd_bufferSize_rank_1_cptr,&
      hipsolverDnCheevd_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnZheevd_bufferSize
    function hipsolverDnZheevd_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork) &
        bind(c, name="hipsolverDnZheevd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZheevd_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZheevd_bufferSize_assumed_rank,&
      hipsolverDnZheevd_bufferSize_assumed_rank_cptr,&
      hipsolverDnZheevd_bufferSize_typed
#else
    module procedure &
      hipsolverDnZheevd_bufferSize_rank_0,&
      hipsolverDnZheevd_bufferSize_rank_0_cptr,&
      hipsolverDnZheevd_bufferSize_rank_1,&
      hipsolverDnZheevd_bufferSize_rank_1_cptr,&
      hipsolverDnZheevd_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnSsyevd
    function hipsolverDnSsyevd_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo) &
        bind(c, name="hipsolverDnSsyevd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSsyevd_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSsyevd_assumed_rank,&
      hipsolverDnSsyevd_assumed_rank_cptr,&
      hipsolverDnSsyevd_typed
#else
    module procedure &
      hipsolverDnSsyevd_rank_0,&
      hipsolverDnSsyevd_rank_0_cptr,&
      hipsolverDnSsyevd_rank_1,&
      hipsolverDnSsyevd_rank_1_cptr,&
      hipsolverDnSsyevd_typed
#endif
#endif
  end interface

  interface hipsolverDnDsyevd
    function hipsolverDnDsyevd_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo) &
        bind(c, name="hipsolverDnDsyevd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDsyevd_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDsyevd_assumed_rank,&
      hipsolverDnDsyevd_assumed_rank_cptr,&
      hipsolverDnDsyevd_typed
#else
    module procedure &
      hipsolverDnDsyevd_rank_0,&
      hipsolverDnDsyevd_rank_0_cptr,&
      hipsolverDnDsyevd_rank_1,&
      hipsolverDnDsyevd_rank_1_cptr,&
      hipsolverDnDsyevd_typed
#endif
#endif
  end interface

  interface hipsolverDnCheevd
    function hipsolverDnCheevd_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo) &
        bind(c, name="hipsolverDnCheevd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCheevd_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCheevd_assumed_rank,&
      hipsolverDnCheevd_assumed_rank_cptr,&
      hipsolverDnCheevd_typed
#else
    module procedure &
      hipsolverDnCheevd_rank_0,&
      hipsolverDnCheevd_rank_0_cptr,&
      hipsolverDnCheevd_rank_1,&
      hipsolverDnCheevd_rank_1_cptr,&
      hipsolverDnCheevd_typed
#endif
#endif
  end interface

  interface hipsolverDnZheevd
    function hipsolverDnZheevd_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo) &
        bind(c, name="hipsolverDnZheevd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZheevd_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZheevd_assumed_rank,&
      hipsolverDnZheevd_assumed_rank_cptr,&
      hipsolverDnZheevd_typed
#else
    module procedure &
      hipsolverDnZheevd_rank_0,&
      hipsolverDnZheevd_rank_0_cptr,&
      hipsolverDnZheevd_rank_1,&
      hipsolverDnZheevd_rank_1_cptr,&
      hipsolverDnZheevd_typed
#endif
#endif
  end interface

  interface hipsolverDnSsyevdx_bufferSize
    function hipsolverDnSsyevdx_bufferSize_(handle,jobz,range,uplo,n,A,lda,vl,vu,il,iu,nev,W, &
        lwork) &
        bind(c, name="hipsolverDnSsyevdx_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSsyevdx_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_EIG_RANGE_ALL)),value :: range
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float),value :: vl
      real(c_float),value :: vu
      integer(c_int),value :: il
      integer(c_int),value :: iu
      type(c_ptr),value :: nev
      type(c_ptr),value :: W
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSsyevdx_bufferSize_assumed_rank,&
      hipsolverDnSsyevdx_bufferSize_assumed_rank_cptr,&
      hipsolverDnSsyevdx_bufferSize_typed
#else
    module procedure &
      hipsolverDnSsyevdx_bufferSize_rank_0,&
      hipsolverDnSsyevdx_bufferSize_rank_0_cptr,&
      hipsolverDnSsyevdx_bufferSize_rank_1,&
      hipsolverDnSsyevdx_bufferSize_rank_1_cptr,&
      hipsolverDnSsyevdx_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnDsyevdx_bufferSize
    function hipsolverDnDsyevdx_bufferSize_(handle,jobz,range,uplo,n,A,lda,vl,vu,il,iu,nev,W, &
        lwork) &
        bind(c, name="hipsolverDnDsyevdx_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDsyevdx_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_EIG_RANGE_ALL)),value :: range
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double),value :: vl
      real(c_double),value :: vu
      integer(c_int),value :: il
      integer(c_int),value :: iu
      type(c_ptr),value :: nev
      type(c_ptr),value :: W
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDsyevdx_bufferSize_assumed_rank,&
      hipsolverDnDsyevdx_bufferSize_assumed_rank_cptr,&
      hipsolverDnDsyevdx_bufferSize_typed
#else
    module procedure &
      hipsolverDnDsyevdx_bufferSize_rank_0,&
      hipsolverDnDsyevdx_bufferSize_rank_0_cptr,&
      hipsolverDnDsyevdx_bufferSize_rank_1,&
      hipsolverDnDsyevdx_bufferSize_rank_1_cptr,&
      hipsolverDnDsyevdx_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnCheevdx_bufferSize
    function hipsolverDnCheevdx_bufferSize_(handle,jobz,range,uplo,n,A,lda,vl,vu,il,iu,nev,W, &
        lwork) &
        bind(c, name="hipsolverDnCheevdx_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCheevdx_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_EIG_RANGE_ALL)),value :: range
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float),value :: vl
      real(c_float),value :: vu
      integer(c_int),value :: il
      integer(c_int),value :: iu
      type(c_ptr),value :: nev
      type(c_ptr),value :: W
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCheevdx_bufferSize_assumed_rank,&
      hipsolverDnCheevdx_bufferSize_assumed_rank_cptr,&
      hipsolverDnCheevdx_bufferSize_typed
#else
    module procedure &
      hipsolverDnCheevdx_bufferSize_rank_0,&
      hipsolverDnCheevdx_bufferSize_rank_0_cptr,&
      hipsolverDnCheevdx_bufferSize_rank_1,&
      hipsolverDnCheevdx_bufferSize_rank_1_cptr,&
      hipsolverDnCheevdx_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnZheevdx_bufferSize
    function hipsolverDnZheevdx_bufferSize_(handle,jobz,range,uplo,n,A,lda,vl,vu,il,iu,nev,W, &
        lwork) &
        bind(c, name="hipsolverDnZheevdx_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZheevdx_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_EIG_RANGE_ALL)),value :: range
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double),value :: vl
      real(c_double),value :: vu
      integer(c_int),value :: il
      integer(c_int),value :: iu
      type(c_ptr),value :: nev
      type(c_ptr),value :: W
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZheevdx_bufferSize_assumed_rank,&
      hipsolverDnZheevdx_bufferSize_assumed_rank_cptr,&
      hipsolverDnZheevdx_bufferSize_typed
#else
    module procedure &
      hipsolverDnZheevdx_bufferSize_rank_0,&
      hipsolverDnZheevdx_bufferSize_rank_0_cptr,&
      hipsolverDnZheevdx_bufferSize_rank_1,&
      hipsolverDnZheevdx_bufferSize_rank_1_cptr,&
      hipsolverDnZheevdx_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnSsyevdx
    function hipsolverDnSsyevdx_(handle,jobz,range,uplo,n,A,lda,vl,vu,il,iu,nev,W,work,lwork, &
        devInfo) &
        bind(c, name="hipsolverDnSsyevdx")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSsyevdx_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_EIG_RANGE_ALL)),value :: range
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float),value :: vl
      real(c_float),value :: vu
      integer(c_int),value :: il
      integer(c_int),value :: iu
      type(c_ptr),value :: nev
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSsyevdx_assumed_rank,&
      hipsolverDnSsyevdx_assumed_rank_cptr,&
      hipsolverDnSsyevdx_typed
#else
    module procedure &
      hipsolverDnSsyevdx_rank_0,&
      hipsolverDnSsyevdx_rank_0_cptr,&
      hipsolverDnSsyevdx_rank_1,&
      hipsolverDnSsyevdx_rank_1_cptr,&
      hipsolverDnSsyevdx_typed
#endif
#endif
  end interface

  interface hipsolverDnDsyevdx
    function hipsolverDnDsyevdx_(handle,jobz,range,uplo,n,A,lda,vl,vu,il,iu,nev,W,work,lwork, &
        devInfo) &
        bind(c, name="hipsolverDnDsyevdx")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDsyevdx_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_EIG_RANGE_ALL)),value :: range
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double),value :: vl
      real(c_double),value :: vu
      integer(c_int),value :: il
      integer(c_int),value :: iu
      type(c_ptr),value :: nev
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDsyevdx_assumed_rank,&
      hipsolverDnDsyevdx_assumed_rank_cptr,&
      hipsolverDnDsyevdx_typed
#else
    module procedure &
      hipsolverDnDsyevdx_rank_0,&
      hipsolverDnDsyevdx_rank_0_cptr,&
      hipsolverDnDsyevdx_rank_1,&
      hipsolverDnDsyevdx_rank_1_cptr,&
      hipsolverDnDsyevdx_typed
#endif
#endif
  end interface

  interface hipsolverDnCheevdx
    function hipsolverDnCheevdx_(handle,jobz,range,uplo,n,A,lda,vl,vu,il,iu,nev,W,work,lwork, &
        devInfo) &
        bind(c, name="hipsolverDnCheevdx")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCheevdx_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_EIG_RANGE_ALL)),value :: range
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float),value :: vl
      real(c_float),value :: vu
      integer(c_int),value :: il
      integer(c_int),value :: iu
      type(c_ptr),value :: nev
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCheevdx_assumed_rank,&
      hipsolverDnCheevdx_assumed_rank_cptr,&
      hipsolverDnCheevdx_typed
#else
    module procedure &
      hipsolverDnCheevdx_rank_0,&
      hipsolverDnCheevdx_rank_0_cptr,&
      hipsolverDnCheevdx_rank_1,&
      hipsolverDnCheevdx_rank_1_cptr,&
      hipsolverDnCheevdx_typed
#endif
#endif
  end interface

  interface hipsolverDnZheevdx
    function hipsolverDnZheevdx_(handle,jobz,range,uplo,n,A,lda,vl,vu,il,iu,nev,W,work,lwork, &
        devInfo) &
        bind(c, name="hipsolverDnZheevdx")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZheevdx_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_EIG_RANGE_ALL)),value :: range
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double),value :: vl
      real(c_double),value :: vu
      integer(c_int),value :: il
      integer(c_int),value :: iu
      type(c_ptr),value :: nev
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZheevdx_assumed_rank,&
      hipsolverDnZheevdx_assumed_rank_cptr,&
      hipsolverDnZheevdx_typed
#else
    module procedure &
      hipsolverDnZheevdx_rank_0,&
      hipsolverDnZheevdx_rank_0_cptr,&
      hipsolverDnZheevdx_rank_1,&
      hipsolverDnZheevdx_rank_1_cptr,&
      hipsolverDnZheevdx_typed
#endif
#endif
  end interface

  interface hipsolverDnSsyevj_bufferSize
    function hipsolverDnSsyevj_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork,params) &
        bind(c, name="hipsolverDnSsyevj_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSsyevj_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      integer(c_int) :: lwork
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSsyevj_bufferSize_assumed_rank,&
      hipsolverDnSsyevj_bufferSize_assumed_rank_cptr,&
      hipsolverDnSsyevj_bufferSize_typed
#else
    module procedure &
      hipsolverDnSsyevj_bufferSize_rank_0,&
      hipsolverDnSsyevj_bufferSize_rank_0_cptr,&
      hipsolverDnSsyevj_bufferSize_rank_1,&
      hipsolverDnSsyevj_bufferSize_rank_1_cptr,&
      hipsolverDnSsyevj_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnDsyevj_bufferSize
    function hipsolverDnDsyevj_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork,params) &
        bind(c, name="hipsolverDnDsyevj_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDsyevj_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      integer(c_int) :: lwork
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDsyevj_bufferSize_assumed_rank,&
      hipsolverDnDsyevj_bufferSize_assumed_rank_cptr,&
      hipsolverDnDsyevj_bufferSize_typed
#else
    module procedure &
      hipsolverDnDsyevj_bufferSize_rank_0,&
      hipsolverDnDsyevj_bufferSize_rank_0_cptr,&
      hipsolverDnDsyevj_bufferSize_rank_1,&
      hipsolverDnDsyevj_bufferSize_rank_1_cptr,&
      hipsolverDnDsyevj_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnCheevj_bufferSize
    function hipsolverDnCheevj_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork,params) &
        bind(c, name="hipsolverDnCheevj_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCheevj_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      integer(c_int) :: lwork
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCheevj_bufferSize_assumed_rank,&
      hipsolverDnCheevj_bufferSize_assumed_rank_cptr,&
      hipsolverDnCheevj_bufferSize_typed
#else
    module procedure &
      hipsolverDnCheevj_bufferSize_rank_0,&
      hipsolverDnCheevj_bufferSize_rank_0_cptr,&
      hipsolverDnCheevj_bufferSize_rank_1,&
      hipsolverDnCheevj_bufferSize_rank_1_cptr,&
      hipsolverDnCheevj_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnZheevj_bufferSize
    function hipsolverDnZheevj_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork,params) &
        bind(c, name="hipsolverDnZheevj_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZheevj_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      integer(c_int) :: lwork
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZheevj_bufferSize_assumed_rank,&
      hipsolverDnZheevj_bufferSize_assumed_rank_cptr,&
      hipsolverDnZheevj_bufferSize_typed
#else
    module procedure &
      hipsolverDnZheevj_bufferSize_rank_0,&
      hipsolverDnZheevj_bufferSize_rank_0_cptr,&
      hipsolverDnZheevj_bufferSize_rank_1,&
      hipsolverDnZheevj_bufferSize_rank_1_cptr,&
      hipsolverDnZheevj_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnSsyevj
    function hipsolverDnSsyevj_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo,params) &
        bind(c, name="hipsolverDnSsyevj")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSsyevj_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSsyevj_assumed_rank,&
      hipsolverDnSsyevj_assumed_rank_cptr,&
      hipsolverDnSsyevj_typed
#else
    module procedure &
      hipsolverDnSsyevj_rank_0,&
      hipsolverDnSsyevj_rank_0_cptr,&
      hipsolverDnSsyevj_rank_1,&
      hipsolverDnSsyevj_rank_1_cptr,&
      hipsolverDnSsyevj_typed
#endif
#endif
  end interface

  interface hipsolverDnDsyevj
    function hipsolverDnDsyevj_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo,params) &
        bind(c, name="hipsolverDnDsyevj")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDsyevj_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDsyevj_assumed_rank,&
      hipsolverDnDsyevj_assumed_rank_cptr,&
      hipsolverDnDsyevj_typed
#else
    module procedure &
      hipsolverDnDsyevj_rank_0,&
      hipsolverDnDsyevj_rank_0_cptr,&
      hipsolverDnDsyevj_rank_1,&
      hipsolverDnDsyevj_rank_1_cptr,&
      hipsolverDnDsyevj_typed
#endif
#endif
  end interface

  interface hipsolverDnCheevj
    function hipsolverDnCheevj_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo,params) &
        bind(c, name="hipsolverDnCheevj")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCheevj_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCheevj_assumed_rank,&
      hipsolverDnCheevj_assumed_rank_cptr,&
      hipsolverDnCheevj_typed
#else
    module procedure &
      hipsolverDnCheevj_rank_0,&
      hipsolverDnCheevj_rank_0_cptr,&
      hipsolverDnCheevj_rank_1,&
      hipsolverDnCheevj_rank_1_cptr,&
      hipsolverDnCheevj_typed
#endif
#endif
  end interface

  interface hipsolverDnZheevj
    function hipsolverDnZheevj_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo,params) &
        bind(c, name="hipsolverDnZheevj")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZheevj_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZheevj_assumed_rank,&
      hipsolverDnZheevj_assumed_rank_cptr,&
      hipsolverDnZheevj_typed
#else
    module procedure &
      hipsolverDnZheevj_rank_0,&
      hipsolverDnZheevj_rank_0_cptr,&
      hipsolverDnZheevj_rank_1,&
      hipsolverDnZheevj_rank_1_cptr,&
      hipsolverDnZheevj_typed
#endif
#endif
  end interface

  interface hipsolverDnSsyevjBatched_bufferSize
    function hipsolverDnSsyevjBatched_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork,params, &
        batch_count) &
        bind(c, name="hipsolverDnSsyevjBatched_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSsyevjBatched_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      integer(c_int) :: lwork
      type(c_ptr),value :: params
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSsyevjBatched_bufferSize_assumed_rank,&
      hipsolverDnSsyevjBatched_bufferSize_assumed_rank_cptr,&
      hipsolverDnSsyevjBatched_bufferSize_typed
#else
    module procedure &
      hipsolverDnSsyevjBatched_bufferSize_rank_0,&
      hipsolverDnSsyevjBatched_bufferSize_rank_0_cptr,&
      hipsolverDnSsyevjBatched_bufferSize_rank_1,&
      hipsolverDnSsyevjBatched_bufferSize_rank_1_cptr,&
      hipsolverDnSsyevjBatched_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnDsyevjBatched_bufferSize
    function hipsolverDnDsyevjBatched_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork,params, &
        batch_count) &
        bind(c, name="hipsolverDnDsyevjBatched_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDsyevjBatched_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      integer(c_int) :: lwork
      type(c_ptr),value :: params
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDsyevjBatched_bufferSize_assumed_rank,&
      hipsolverDnDsyevjBatched_bufferSize_assumed_rank_cptr,&
      hipsolverDnDsyevjBatched_bufferSize_typed
#else
    module procedure &
      hipsolverDnDsyevjBatched_bufferSize_rank_0,&
      hipsolverDnDsyevjBatched_bufferSize_rank_0_cptr,&
      hipsolverDnDsyevjBatched_bufferSize_rank_1,&
      hipsolverDnDsyevjBatched_bufferSize_rank_1_cptr,&
      hipsolverDnDsyevjBatched_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnCheevjBatched_bufferSize
    function hipsolverDnCheevjBatched_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork,params, &
        batch_count) &
        bind(c, name="hipsolverDnCheevjBatched_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCheevjBatched_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      integer(c_int) :: lwork
      type(c_ptr),value :: params
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCheevjBatched_bufferSize_assumed_rank,&
      hipsolverDnCheevjBatched_bufferSize_assumed_rank_cptr,&
      hipsolverDnCheevjBatched_bufferSize_typed
#else
    module procedure &
      hipsolverDnCheevjBatched_bufferSize_rank_0,&
      hipsolverDnCheevjBatched_bufferSize_rank_0_cptr,&
      hipsolverDnCheevjBatched_bufferSize_rank_1,&
      hipsolverDnCheevjBatched_bufferSize_rank_1_cptr,&
      hipsolverDnCheevjBatched_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnZheevjBatched_bufferSize
    function hipsolverDnZheevjBatched_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork,params, &
        batch_count) &
        bind(c, name="hipsolverDnZheevjBatched_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZheevjBatched_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      integer(c_int) :: lwork
      type(c_ptr),value :: params
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZheevjBatched_bufferSize_assumed_rank,&
      hipsolverDnZheevjBatched_bufferSize_assumed_rank_cptr,&
      hipsolverDnZheevjBatched_bufferSize_typed
#else
    module procedure &
      hipsolverDnZheevjBatched_bufferSize_rank_0,&
      hipsolverDnZheevjBatched_bufferSize_rank_0_cptr,&
      hipsolverDnZheevjBatched_bufferSize_rank_1,&
      hipsolverDnZheevjBatched_bufferSize_rank_1_cptr,&
      hipsolverDnZheevjBatched_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnSsyevjBatched
    function hipsolverDnSsyevjBatched_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo,params, &
        batch_count) &
        bind(c, name="hipsolverDnSsyevjBatched")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSsyevjBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
      type(c_ptr),value :: params
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSsyevjBatched_assumed_rank,&
      hipsolverDnSsyevjBatched_assumed_rank_cptr,&
      hipsolverDnSsyevjBatched_typed
#else
    module procedure &
      hipsolverDnSsyevjBatched_rank_0,&
      hipsolverDnSsyevjBatched_rank_0_cptr,&
      hipsolverDnSsyevjBatched_rank_1,&
      hipsolverDnSsyevjBatched_rank_1_cptr,&
      hipsolverDnSsyevjBatched_typed
#endif
#endif
  end interface

  interface hipsolverDnDsyevjBatched
    function hipsolverDnDsyevjBatched_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo,params, &
        batch_count) &
        bind(c, name="hipsolverDnDsyevjBatched")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDsyevjBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
      type(c_ptr),value :: params
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDsyevjBatched_assumed_rank,&
      hipsolverDnDsyevjBatched_assumed_rank_cptr,&
      hipsolverDnDsyevjBatched_typed
#else
    module procedure &
      hipsolverDnDsyevjBatched_rank_0,&
      hipsolverDnDsyevjBatched_rank_0_cptr,&
      hipsolverDnDsyevjBatched_rank_1,&
      hipsolverDnDsyevjBatched_rank_1_cptr,&
      hipsolverDnDsyevjBatched_typed
#endif
#endif
  end interface

  interface hipsolverDnCheevjBatched
    function hipsolverDnCheevjBatched_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo,params, &
        batch_count) &
        bind(c, name="hipsolverDnCheevjBatched")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCheevjBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
      type(c_ptr),value :: params
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCheevjBatched_assumed_rank,&
      hipsolverDnCheevjBatched_assumed_rank_cptr,&
      hipsolverDnCheevjBatched_typed
#else
    module procedure &
      hipsolverDnCheevjBatched_rank_0,&
      hipsolverDnCheevjBatched_rank_0_cptr,&
      hipsolverDnCheevjBatched_rank_1,&
      hipsolverDnCheevjBatched_rank_1_cptr,&
      hipsolverDnCheevjBatched_typed
#endif
#endif
  end interface

  interface hipsolverDnZheevjBatched
    function hipsolverDnZheevjBatched_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo,params, &
        batch_count) &
        bind(c, name="hipsolverDnZheevjBatched")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZheevjBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
      type(c_ptr),value :: params
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZheevjBatched_assumed_rank,&
      hipsolverDnZheevjBatched_assumed_rank_cptr,&
      hipsolverDnZheevjBatched_typed
#else
    module procedure &
      hipsolverDnZheevjBatched_rank_0,&
      hipsolverDnZheevjBatched_rank_0_cptr,&
      hipsolverDnZheevjBatched_rank_1,&
      hipsolverDnZheevjBatched_rank_1_cptr,&
      hipsolverDnZheevjBatched_typed
#endif
#endif
  end interface

  interface hipsolverDnSsygvd_bufferSize
    function hipsolverDnSsygvd_bufferSize_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork) &
        bind(c, name="hipsolverDnSsygvd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSsygvd_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSsygvd_bufferSize_assumed_rank,&
      hipsolverDnSsygvd_bufferSize_assumed_rank_cptr,&
      hipsolverDnSsygvd_bufferSize_typed
#else
    module procedure &
      hipsolverDnSsygvd_bufferSize_rank_0,&
      hipsolverDnSsygvd_bufferSize_rank_0_cptr,&
      hipsolverDnSsygvd_bufferSize_rank_1,&
      hipsolverDnSsygvd_bufferSize_rank_1_cptr,&
      hipsolverDnSsygvd_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnDsygvd_bufferSize
    function hipsolverDnDsygvd_bufferSize_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork) &
        bind(c, name="hipsolverDnDsygvd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDsygvd_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDsygvd_bufferSize_assumed_rank,&
      hipsolverDnDsygvd_bufferSize_assumed_rank_cptr,&
      hipsolverDnDsygvd_bufferSize_typed
#else
    module procedure &
      hipsolverDnDsygvd_bufferSize_rank_0,&
      hipsolverDnDsygvd_bufferSize_rank_0_cptr,&
      hipsolverDnDsygvd_bufferSize_rank_1,&
      hipsolverDnDsygvd_bufferSize_rank_1_cptr,&
      hipsolverDnDsygvd_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnChegvd_bufferSize
    function hipsolverDnChegvd_bufferSize_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork) &
        bind(c, name="hipsolverDnChegvd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnChegvd_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnChegvd_bufferSize_assumed_rank,&
      hipsolverDnChegvd_bufferSize_assumed_rank_cptr,&
      hipsolverDnChegvd_bufferSize_typed
#else
    module procedure &
      hipsolverDnChegvd_bufferSize_rank_0,&
      hipsolverDnChegvd_bufferSize_rank_0_cptr,&
      hipsolverDnChegvd_bufferSize_rank_1,&
      hipsolverDnChegvd_bufferSize_rank_1_cptr,&
      hipsolverDnChegvd_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnZhegvd_bufferSize
    function hipsolverDnZhegvd_bufferSize_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork) &
        bind(c, name="hipsolverDnZhegvd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZhegvd_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZhegvd_bufferSize_assumed_rank,&
      hipsolverDnZhegvd_bufferSize_assumed_rank_cptr,&
      hipsolverDnZhegvd_bufferSize_typed
#else
    module procedure &
      hipsolverDnZhegvd_bufferSize_rank_0,&
      hipsolverDnZhegvd_bufferSize_rank_0_cptr,&
      hipsolverDnZhegvd_bufferSize_rank_1,&
      hipsolverDnZhegvd_bufferSize_rank_1_cptr,&
      hipsolverDnZhegvd_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnSsygvd
    function hipsolverDnSsygvd_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo) &
        bind(c, name="hipsolverDnSsygvd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSsygvd_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSsygvd_assumed_rank,&
      hipsolverDnSsygvd_assumed_rank_cptr,&
      hipsolverDnSsygvd_typed
#else
    module procedure &
      hipsolverDnSsygvd_rank_0,&
      hipsolverDnSsygvd_rank_0_cptr,&
      hipsolverDnSsygvd_rank_1,&
      hipsolverDnSsygvd_rank_1_cptr,&
      hipsolverDnSsygvd_typed
#endif
#endif
  end interface

  interface hipsolverDnDsygvd
    function hipsolverDnDsygvd_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo) &
        bind(c, name="hipsolverDnDsygvd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDsygvd_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDsygvd_assumed_rank,&
      hipsolverDnDsygvd_assumed_rank_cptr,&
      hipsolverDnDsygvd_typed
#else
    module procedure &
      hipsolverDnDsygvd_rank_0,&
      hipsolverDnDsygvd_rank_0_cptr,&
      hipsolverDnDsygvd_rank_1,&
      hipsolverDnDsygvd_rank_1_cptr,&
      hipsolverDnDsygvd_typed
#endif
#endif
  end interface

  interface hipsolverDnChegvd
    function hipsolverDnChegvd_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo) &
        bind(c, name="hipsolverDnChegvd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnChegvd_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnChegvd_assumed_rank,&
      hipsolverDnChegvd_assumed_rank_cptr,&
      hipsolverDnChegvd_typed
#else
    module procedure &
      hipsolverDnChegvd_rank_0,&
      hipsolverDnChegvd_rank_0_cptr,&
      hipsolverDnChegvd_rank_1,&
      hipsolverDnChegvd_rank_1_cptr,&
      hipsolverDnChegvd_typed
#endif
#endif
  end interface

  interface hipsolverDnZhegvd
    function hipsolverDnZhegvd_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo) &
        bind(c, name="hipsolverDnZhegvd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZhegvd_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZhegvd_assumed_rank,&
      hipsolverDnZhegvd_assumed_rank_cptr,&
      hipsolverDnZhegvd_typed
#else
    module procedure &
      hipsolverDnZhegvd_rank_0,&
      hipsolverDnZhegvd_rank_0_cptr,&
      hipsolverDnZhegvd_rank_1,&
      hipsolverDnZhegvd_rank_1_cptr,&
      hipsolverDnZhegvd_typed
#endif
#endif
  end interface

  interface hipsolverDnSsygvdx_bufferSize
    function hipsolverDnSsygvdx_bufferSize_(handle,itype,jobz,range,uplo,n,A,lda,B,ldb,vl,vu,il, &
        iu,nev,W,lwork) &
        bind(c, name="hipsolverDnSsygvdx_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSsygvdx_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_EIG_RANGE_ALL)),value :: range
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_float),value :: vl
      real(c_float),value :: vu
      integer(c_int),value :: il
      integer(c_int),value :: iu
      type(c_ptr),value :: nev
      type(c_ptr),value :: W
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSsygvdx_bufferSize_assumed_rank,&
      hipsolverDnSsygvdx_bufferSize_assumed_rank_cptr,&
      hipsolverDnSsygvdx_bufferSize_typed
#else
    module procedure &
      hipsolverDnSsygvdx_bufferSize_rank_0,&
      hipsolverDnSsygvdx_bufferSize_rank_0_cptr,&
      hipsolverDnSsygvdx_bufferSize_rank_1,&
      hipsolverDnSsygvdx_bufferSize_rank_1_cptr,&
      hipsolverDnSsygvdx_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnDsygvdx_bufferSize
    function hipsolverDnDsygvdx_bufferSize_(handle,itype,jobz,range,uplo,n,A,lda,B,ldb,vl,vu,il, &
        iu,nev,W,lwork) &
        bind(c, name="hipsolverDnDsygvdx_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDsygvdx_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_EIG_RANGE_ALL)),value :: range
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_double),value :: vl
      real(c_double),value :: vu
      integer(c_int),value :: il
      integer(c_int),value :: iu
      type(c_ptr),value :: nev
      type(c_ptr),value :: W
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDsygvdx_bufferSize_assumed_rank,&
      hipsolverDnDsygvdx_bufferSize_assumed_rank_cptr,&
      hipsolverDnDsygvdx_bufferSize_typed
#else
    module procedure &
      hipsolverDnDsygvdx_bufferSize_rank_0,&
      hipsolverDnDsygvdx_bufferSize_rank_0_cptr,&
      hipsolverDnDsygvdx_bufferSize_rank_1,&
      hipsolverDnDsygvdx_bufferSize_rank_1_cptr,&
      hipsolverDnDsygvdx_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnChegvdx_bufferSize
    function hipsolverDnChegvdx_bufferSize_(handle,itype,jobz,range,uplo,n,A,lda,B,ldb,vl,vu,il, &
        iu,nev,W,lwork) &
        bind(c, name="hipsolverDnChegvdx_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnChegvdx_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_EIG_RANGE_ALL)),value :: range
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_float),value :: vl
      real(c_float),value :: vu
      integer(c_int),value :: il
      integer(c_int),value :: iu
      type(c_ptr),value :: nev
      type(c_ptr),value :: W
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnChegvdx_bufferSize_assumed_rank,&
      hipsolverDnChegvdx_bufferSize_assumed_rank_cptr,&
      hipsolverDnChegvdx_bufferSize_typed
#else
    module procedure &
      hipsolverDnChegvdx_bufferSize_rank_0,&
      hipsolverDnChegvdx_bufferSize_rank_0_cptr,&
      hipsolverDnChegvdx_bufferSize_rank_1,&
      hipsolverDnChegvdx_bufferSize_rank_1_cptr,&
      hipsolverDnChegvdx_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnZhegvdx_bufferSize
    function hipsolverDnZhegvdx_bufferSize_(handle,itype,jobz,range,uplo,n,A,lda,B,ldb,vl,vu,il, &
        iu,nev,W,lwork) &
        bind(c, name="hipsolverDnZhegvdx_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZhegvdx_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_EIG_RANGE_ALL)),value :: range
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_double),value :: vl
      real(c_double),value :: vu
      integer(c_int),value :: il
      integer(c_int),value :: iu
      type(c_ptr),value :: nev
      type(c_ptr),value :: W
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZhegvdx_bufferSize_assumed_rank,&
      hipsolverDnZhegvdx_bufferSize_assumed_rank_cptr,&
      hipsolverDnZhegvdx_bufferSize_typed
#else
    module procedure &
      hipsolverDnZhegvdx_bufferSize_rank_0,&
      hipsolverDnZhegvdx_bufferSize_rank_0_cptr,&
      hipsolverDnZhegvdx_bufferSize_rank_1,&
      hipsolverDnZhegvdx_bufferSize_rank_1_cptr,&
      hipsolverDnZhegvdx_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnSsygvdx
    function hipsolverDnSsygvdx_(handle,itype,jobz,range,uplo,n,A,lda,B,ldb,vl,vu,il,iu,nev,W, &
        work,lwork,devInfo) &
        bind(c, name="hipsolverDnSsygvdx")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSsygvdx_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_EIG_RANGE_ALL)),value :: range
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_float),value :: vl
      real(c_float),value :: vu
      integer(c_int),value :: il
      integer(c_int),value :: iu
      type(c_ptr),value :: nev
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSsygvdx_assumed_rank,&
      hipsolverDnSsygvdx_assumed_rank_cptr,&
      hipsolverDnSsygvdx_typed
#else
    module procedure &
      hipsolverDnSsygvdx_rank_0,&
      hipsolverDnSsygvdx_rank_0_cptr,&
      hipsolverDnSsygvdx_rank_1,&
      hipsolverDnSsygvdx_rank_1_cptr,&
      hipsolverDnSsygvdx_typed
#endif
#endif
  end interface

  interface hipsolverDnDsygvdx
    function hipsolverDnDsygvdx_(handle,itype,jobz,range,uplo,n,A,lda,B,ldb,vl,vu,il,iu,nev,W, &
        work,lwork,devInfo) &
        bind(c, name="hipsolverDnDsygvdx")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDsygvdx_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_EIG_RANGE_ALL)),value :: range
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_double),value :: vl
      real(c_double),value :: vu
      integer(c_int),value :: il
      integer(c_int),value :: iu
      type(c_ptr),value :: nev
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDsygvdx_assumed_rank,&
      hipsolverDnDsygvdx_assumed_rank_cptr,&
      hipsolverDnDsygvdx_typed
#else
    module procedure &
      hipsolverDnDsygvdx_rank_0,&
      hipsolverDnDsygvdx_rank_0_cptr,&
      hipsolverDnDsygvdx_rank_1,&
      hipsolverDnDsygvdx_rank_1_cptr,&
      hipsolverDnDsygvdx_typed
#endif
#endif
  end interface

  interface hipsolverDnChegvdx
    function hipsolverDnChegvdx_(handle,itype,jobz,range,uplo,n,A,lda,B,ldb,vl,vu,il,iu,nev,W, &
        work,lwork,devInfo) &
        bind(c, name="hipsolverDnChegvdx")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnChegvdx_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_EIG_RANGE_ALL)),value :: range
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_float),value :: vl
      real(c_float),value :: vu
      integer(c_int),value :: il
      integer(c_int),value :: iu
      type(c_ptr),value :: nev
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnChegvdx_assumed_rank,&
      hipsolverDnChegvdx_assumed_rank_cptr,&
      hipsolverDnChegvdx_typed
#else
    module procedure &
      hipsolverDnChegvdx_rank_0,&
      hipsolverDnChegvdx_rank_0_cptr,&
      hipsolverDnChegvdx_rank_1,&
      hipsolverDnChegvdx_rank_1_cptr,&
      hipsolverDnChegvdx_typed
#endif
#endif
  end interface

  interface hipsolverDnZhegvdx
    function hipsolverDnZhegvdx_(handle,itype,jobz,range,uplo,n,A,lda,B,ldb,vl,vu,il,iu,nev,W, &
        work,lwork,devInfo) &
        bind(c, name="hipsolverDnZhegvdx")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZhegvdx_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_EIG_RANGE_ALL)),value :: range
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_double),value :: vl
      real(c_double),value :: vu
      integer(c_int),value :: il
      integer(c_int),value :: iu
      type(c_ptr),value :: nev
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZhegvdx_assumed_rank,&
      hipsolverDnZhegvdx_assumed_rank_cptr,&
      hipsolverDnZhegvdx_typed
#else
    module procedure &
      hipsolverDnZhegvdx_rank_0,&
      hipsolverDnZhegvdx_rank_0_cptr,&
      hipsolverDnZhegvdx_rank_1,&
      hipsolverDnZhegvdx_rank_1_cptr,&
      hipsolverDnZhegvdx_typed
#endif
#endif
  end interface

  interface hipsolverDnSsygvj_bufferSize
    function hipsolverDnSsygvj_bufferSize_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork,params) &
        bind(c, name="hipsolverDnSsygvj_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSsygvj_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      integer(c_int) :: lwork
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSsygvj_bufferSize_assumed_rank,&
      hipsolverDnSsygvj_bufferSize_assumed_rank_cptr,&
      hipsolverDnSsygvj_bufferSize_typed
#else
    module procedure &
      hipsolverDnSsygvj_bufferSize_rank_0,&
      hipsolverDnSsygvj_bufferSize_rank_0_cptr,&
      hipsolverDnSsygvj_bufferSize_rank_1,&
      hipsolverDnSsygvj_bufferSize_rank_1_cptr,&
      hipsolverDnSsygvj_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnDsygvj_bufferSize
    function hipsolverDnDsygvj_bufferSize_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork,params) &
        bind(c, name="hipsolverDnDsygvj_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDsygvj_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      integer(c_int) :: lwork
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDsygvj_bufferSize_assumed_rank,&
      hipsolverDnDsygvj_bufferSize_assumed_rank_cptr,&
      hipsolverDnDsygvj_bufferSize_typed
#else
    module procedure &
      hipsolverDnDsygvj_bufferSize_rank_0,&
      hipsolverDnDsygvj_bufferSize_rank_0_cptr,&
      hipsolverDnDsygvj_bufferSize_rank_1,&
      hipsolverDnDsygvj_bufferSize_rank_1_cptr,&
      hipsolverDnDsygvj_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnChegvj_bufferSize
    function hipsolverDnChegvj_bufferSize_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork,params) &
        bind(c, name="hipsolverDnChegvj_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnChegvj_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      integer(c_int) :: lwork
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnChegvj_bufferSize_assumed_rank,&
      hipsolverDnChegvj_bufferSize_assumed_rank_cptr,&
      hipsolverDnChegvj_bufferSize_typed
#else
    module procedure &
      hipsolverDnChegvj_bufferSize_rank_0,&
      hipsolverDnChegvj_bufferSize_rank_0_cptr,&
      hipsolverDnChegvj_bufferSize_rank_1,&
      hipsolverDnChegvj_bufferSize_rank_1_cptr,&
      hipsolverDnChegvj_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnZhegvj_bufferSize
    function hipsolverDnZhegvj_bufferSize_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork,params) &
        bind(c, name="hipsolverDnZhegvj_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZhegvj_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      integer(c_int) :: lwork
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZhegvj_bufferSize_assumed_rank,&
      hipsolverDnZhegvj_bufferSize_assumed_rank_cptr,&
      hipsolverDnZhegvj_bufferSize_typed
#else
    module procedure &
      hipsolverDnZhegvj_bufferSize_rank_0,&
      hipsolverDnZhegvj_bufferSize_rank_0_cptr,&
      hipsolverDnZhegvj_bufferSize_rank_1,&
      hipsolverDnZhegvj_bufferSize_rank_1_cptr,&
      hipsolverDnZhegvj_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnSsygvj
    function hipsolverDnSsygvj_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo,params) &
        bind(c, name="hipsolverDnSsygvj")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSsygvj_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSsygvj_assumed_rank,&
      hipsolverDnSsygvj_assumed_rank_cptr,&
      hipsolverDnSsygvj_typed
#else
    module procedure &
      hipsolverDnSsygvj_rank_0,&
      hipsolverDnSsygvj_rank_0_cptr,&
      hipsolverDnSsygvj_rank_1,&
      hipsolverDnSsygvj_rank_1_cptr,&
      hipsolverDnSsygvj_typed
#endif
#endif
  end interface

  interface hipsolverDnDsygvj
    function hipsolverDnDsygvj_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo,params) &
        bind(c, name="hipsolverDnDsygvj")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDsygvj_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDsygvj_assumed_rank,&
      hipsolverDnDsygvj_assumed_rank_cptr,&
      hipsolverDnDsygvj_typed
#else
    module procedure &
      hipsolverDnDsygvj_rank_0,&
      hipsolverDnDsygvj_rank_0_cptr,&
      hipsolverDnDsygvj_rank_1,&
      hipsolverDnDsygvj_rank_1_cptr,&
      hipsolverDnDsygvj_typed
#endif
#endif
  end interface

  interface hipsolverDnChegvj
    function hipsolverDnChegvj_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo,params) &
        bind(c, name="hipsolverDnChegvj")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnChegvj_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnChegvj_assumed_rank,&
      hipsolverDnChegvj_assumed_rank_cptr,&
      hipsolverDnChegvj_typed
#else
    module procedure &
      hipsolverDnChegvj_rank_0,&
      hipsolverDnChegvj_rank_0_cptr,&
      hipsolverDnChegvj_rank_1,&
      hipsolverDnChegvj_rank_1_cptr,&
      hipsolverDnChegvj_typed
#endif
#endif
  end interface

  interface hipsolverDnZhegvj
    function hipsolverDnZhegvj_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo,params) &
        bind(c, name="hipsolverDnZhegvj")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZhegvj_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: W
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
      type(c_ptr),value :: params
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZhegvj_assumed_rank,&
      hipsolverDnZhegvj_assumed_rank_cptr,&
      hipsolverDnZhegvj_typed
#else
    module procedure &
      hipsolverDnZhegvj_rank_0,&
      hipsolverDnZhegvj_rank_0_cptr,&
      hipsolverDnZhegvj_rank_1,&
      hipsolverDnZhegvj_rank_1_cptr,&
      hipsolverDnZhegvj_typed
#endif
#endif
  end interface

  interface hipsolverDnSsytrd_bufferSize
    function hipsolverDnSsytrd_bufferSize_(handle,uplo,n,A,lda,D,E,tau,lwork) &
        bind(c, name="hipsolverDnSsytrd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSsytrd_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      type(c_ptr),value :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSsytrd_bufferSize_assumed_rank,&
      hipsolverDnSsytrd_bufferSize_assumed_rank_cptr,&
      hipsolverDnSsytrd_bufferSize_typed
#else
    module procedure &
      hipsolverDnSsytrd_bufferSize_rank_0,&
      hipsolverDnSsytrd_bufferSize_rank_0_cptr,&
      hipsolverDnSsytrd_bufferSize_rank_1,&
      hipsolverDnSsytrd_bufferSize_rank_1_cptr,&
      hipsolverDnSsytrd_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnDsytrd_bufferSize
    function hipsolverDnDsytrd_bufferSize_(handle,uplo,n,A,lda,D,E,tau,lwork) &
        bind(c, name="hipsolverDnDsytrd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDsytrd_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      type(c_ptr),value :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDsytrd_bufferSize_assumed_rank,&
      hipsolverDnDsytrd_bufferSize_assumed_rank_cptr,&
      hipsolverDnDsytrd_bufferSize_typed
#else
    module procedure &
      hipsolverDnDsytrd_bufferSize_rank_0,&
      hipsolverDnDsytrd_bufferSize_rank_0_cptr,&
      hipsolverDnDsytrd_bufferSize_rank_1,&
      hipsolverDnDsytrd_bufferSize_rank_1_cptr,&
      hipsolverDnDsytrd_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnChetrd_bufferSize
    function hipsolverDnChetrd_bufferSize_(handle,uplo,n,A,lda,D,E,tau,lwork) &
        bind(c, name="hipsolverDnChetrd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnChetrd_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      type(c_ptr),value :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnChetrd_bufferSize_assumed_rank,&
      hipsolverDnChetrd_bufferSize_assumed_rank_cptr,&
      hipsolverDnChetrd_bufferSize_typed
#else
    module procedure &
      hipsolverDnChetrd_bufferSize_rank_0,&
      hipsolverDnChetrd_bufferSize_rank_0_cptr,&
      hipsolverDnChetrd_bufferSize_rank_1,&
      hipsolverDnChetrd_bufferSize_rank_1_cptr,&
      hipsolverDnChetrd_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnZhetrd_bufferSize
    function hipsolverDnZhetrd_bufferSize_(handle,uplo,n,A,lda,D,E,tau,lwork) &
        bind(c, name="hipsolverDnZhetrd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZhetrd_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      type(c_ptr),value :: tau
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZhetrd_bufferSize_assumed_rank,&
      hipsolverDnZhetrd_bufferSize_assumed_rank_cptr,&
      hipsolverDnZhetrd_bufferSize_typed
#else
    module procedure &
      hipsolverDnZhetrd_bufferSize_rank_0,&
      hipsolverDnZhetrd_bufferSize_rank_0_cptr,&
      hipsolverDnZhetrd_bufferSize_rank_1,&
      hipsolverDnZhetrd_bufferSize_rank_1_cptr,&
      hipsolverDnZhetrd_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnSsytrd
    function hipsolverDnSsytrd_(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnSsytrd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSsytrd_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSsytrd_assumed_rank,&
      hipsolverDnSsytrd_assumed_rank_cptr,&
      hipsolverDnSsytrd_typed
#else
    module procedure &
      hipsolverDnSsytrd_rank_0,&
      hipsolverDnSsytrd_rank_0_cptr,&
      hipsolverDnSsytrd_rank_1,&
      hipsolverDnSsytrd_rank_1_cptr,&
      hipsolverDnSsytrd_typed
#endif
#endif
  end interface

  interface hipsolverDnDsytrd
    function hipsolverDnDsytrd_(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnDsytrd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDsytrd_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDsytrd_assumed_rank,&
      hipsolverDnDsytrd_assumed_rank_cptr,&
      hipsolverDnDsytrd_typed
#else
    module procedure &
      hipsolverDnDsytrd_rank_0,&
      hipsolverDnDsytrd_rank_0_cptr,&
      hipsolverDnDsytrd_rank_1,&
      hipsolverDnDsytrd_rank_1_cptr,&
      hipsolverDnDsytrd_typed
#endif
#endif
  end interface

  interface hipsolverDnChetrd
    function hipsolverDnChetrd_(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnChetrd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnChetrd_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnChetrd_assumed_rank,&
      hipsolverDnChetrd_assumed_rank_cptr,&
      hipsolverDnChetrd_typed
#else
    module procedure &
      hipsolverDnChetrd_rank_0,&
      hipsolverDnChetrd_rank_0_cptr,&
      hipsolverDnChetrd_rank_1,&
      hipsolverDnChetrd_rank_1_cptr,&
      hipsolverDnChetrd_typed
#endif
#endif
  end interface

  interface hipsolverDnZhetrd
    function hipsolverDnZhetrd_(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnZhetrd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZhetrd_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      type(c_ptr),value :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZhetrd_assumed_rank,&
      hipsolverDnZhetrd_assumed_rank_cptr,&
      hipsolverDnZhetrd_typed
#else
    module procedure &
      hipsolverDnZhetrd_rank_0,&
      hipsolverDnZhetrd_rank_0_cptr,&
      hipsolverDnZhetrd_rank_1,&
      hipsolverDnZhetrd_rank_1_cptr,&
      hipsolverDnZhetrd_typed
#endif
#endif
  end interface

  interface hipsolverDnSsytrf_bufferSize
    function hipsolverDnSsytrf_bufferSize_(handle,n,A,lda,lwork) &
        bind(c, name="hipsolverDnSsytrf_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSsytrf_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSsytrf_bufferSize_assumed_rank,&
      hipsolverDnSsytrf_bufferSize_assumed_rank_cptr,&
      hipsolverDnSsytrf_bufferSize_typed
#else
    module procedure &
      hipsolverDnSsytrf_bufferSize_rank_0,&
      hipsolverDnSsytrf_bufferSize_rank_0_cptr,&
      hipsolverDnSsytrf_bufferSize_rank_1,&
      hipsolverDnSsytrf_bufferSize_rank_1_cptr,&
      hipsolverDnSsytrf_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnDsytrf_bufferSize
    function hipsolverDnDsytrf_bufferSize_(handle,n,A,lda,lwork) &
        bind(c, name="hipsolverDnDsytrf_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDsytrf_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDsytrf_bufferSize_assumed_rank,&
      hipsolverDnDsytrf_bufferSize_assumed_rank_cptr,&
      hipsolverDnDsytrf_bufferSize_typed
#else
    module procedure &
      hipsolverDnDsytrf_bufferSize_rank_0,&
      hipsolverDnDsytrf_bufferSize_rank_0_cptr,&
      hipsolverDnDsytrf_bufferSize_rank_1,&
      hipsolverDnDsytrf_bufferSize_rank_1_cptr,&
      hipsolverDnDsytrf_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnCsytrf_bufferSize
    function hipsolverDnCsytrf_bufferSize_(handle,n,A,lda,lwork) &
        bind(c, name="hipsolverDnCsytrf_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCsytrf_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCsytrf_bufferSize_assumed_rank,&
      hipsolverDnCsytrf_bufferSize_assumed_rank_cptr,&
      hipsolverDnCsytrf_bufferSize_typed
#else
    module procedure &
      hipsolverDnCsytrf_bufferSize_rank_0,&
      hipsolverDnCsytrf_bufferSize_rank_0_cptr,&
      hipsolverDnCsytrf_bufferSize_rank_1,&
      hipsolverDnCsytrf_bufferSize_rank_1_cptr,&
      hipsolverDnCsytrf_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnZsytrf_bufferSize
    function hipsolverDnZsytrf_bufferSize_(handle,n,A,lda,lwork) &
        bind(c, name="hipsolverDnZsytrf_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZsytrf_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZsytrf_bufferSize_assumed_rank,&
      hipsolverDnZsytrf_bufferSize_assumed_rank_cptr,&
      hipsolverDnZsytrf_bufferSize_typed
#else
    module procedure &
      hipsolverDnZsytrf_bufferSize_rank_0,&
      hipsolverDnZsytrf_bufferSize_rank_0_cptr,&
      hipsolverDnZsytrf_bufferSize_rank_1,&
      hipsolverDnZsytrf_bufferSize_rank_1_cptr,&
      hipsolverDnZsytrf_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnSsytrf
    function hipsolverDnSsytrf_(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo) &
        bind(c, name="hipsolverDnSsytrf")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSsytrf_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnSsytrf_assumed_rank,&
      hipsolverDnSsytrf_assumed_rank_cptr,&
      hipsolverDnSsytrf_typed
#else
    module procedure &
      hipsolverDnSsytrf_rank_0,&
      hipsolverDnSsytrf_rank_0_cptr,&
      hipsolverDnSsytrf_rank_1,&
      hipsolverDnSsytrf_rank_1_cptr,&
      hipsolverDnSsytrf_typed
#endif
#endif
  end interface

  interface hipsolverDnDsytrf
    function hipsolverDnDsytrf_(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo) &
        bind(c, name="hipsolverDnDsytrf")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDsytrf_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnDsytrf_assumed_rank,&
      hipsolverDnDsytrf_assumed_rank_cptr,&
      hipsolverDnDsytrf_typed
#else
    module procedure &
      hipsolverDnDsytrf_rank_0,&
      hipsolverDnDsytrf_rank_0_cptr,&
      hipsolverDnDsytrf_rank_1,&
      hipsolverDnDsytrf_rank_1_cptr,&
      hipsolverDnDsytrf_typed
#endif
#endif
  end interface

  interface hipsolverDnCsytrf
    function hipsolverDnCsytrf_(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo) &
        bind(c, name="hipsolverDnCsytrf")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCsytrf_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnCsytrf_assumed_rank,&
      hipsolverDnCsytrf_assumed_rank_cptr,&
      hipsolverDnCsytrf_typed
#else
    module procedure &
      hipsolverDnCsytrf_rank_0,&
      hipsolverDnCsytrf_rank_0_cptr,&
      hipsolverDnCsytrf_rank_1,&
      hipsolverDnCsytrf_rank_1_cptr,&
      hipsolverDnCsytrf_typed
#endif
#endif
  end interface

  interface hipsolverDnZsytrf
    function hipsolverDnZsytrf_(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo) &
        bind(c, name="hipsolverDnZsytrf")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZsytrf_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnZsytrf_assumed_rank,&
      hipsolverDnZsytrf_assumed_rank_cptr,&
      hipsolverDnZsytrf_typed
#else
    module procedure &
      hipsolverDnZsytrf_rank_0,&
      hipsolverDnZsytrf_rank_0_cptr,&
      hipsolverDnZsytrf_rank_1,&
      hipsolverDnZsytrf_rank_1_cptr,&
      hipsolverDnZsytrf_typed
#endif
#endif
  end interface

  interface hipsolverDnXgeev_bufferSize
    function hipsolverDnXgeev_bufferSize_(handle,params,jobvl,jobvr,n,dataTypeA,A,lda,dataTypeW,W, &
        dataTypeVL,VL,ldvl,dataTypeVR,VR,ldvr,computeType,lworkOnDevice,lworkOnHost) &
        bind(c, name="hipsolverDnXgeev_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      use hipfort_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnXgeev_bufferSize_
      type(c_ptr),value :: handle
      type(c_ptr),value :: params
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobvl
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobvr
      integer(c_int64_t),value :: n
      integer(kind(HIP_R_32F)),value :: dataTypeA
      type(c_ptr),value :: A
      integer(c_int64_t),value :: lda
      integer(kind(HIP_R_32F)),value :: dataTypeW
      type(c_ptr),value :: W
      integer(kind(HIP_R_32F)),value :: dataTypeVL
      type(c_ptr),value :: VL
      integer(c_int64_t),value :: ldvl
      integer(kind(HIP_R_32F)),value :: dataTypeVR
      type(c_ptr),value :: VR
      integer(c_int64_t),value :: ldvr
      integer(kind(HIP_R_32F)),value :: computeType
      type(c_ptr),value :: lworkOnDevice
      type(c_ptr),value :: lworkOnHost
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnXgeev_bufferSize_assumed_rank,&
      hipsolverDnXgeev_bufferSize_assumed_rank_cptr,&
      hipsolverDnXgeev_bufferSize_typed
#else
    module procedure &
      hipsolverDnXgeev_bufferSize_rank_0,&
      hipsolverDnXgeev_bufferSize_rank_0_cptr,&
      hipsolverDnXgeev_bufferSize_rank_1,&
      hipsolverDnXgeev_bufferSize_rank_1_cptr,&
      hipsolverDnXgeev_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnXgeev
    function hipsolverDnXgeev_(handle,params,jobvl,jobvr,n,dataTypeA,A,lda,dataTypeW,W,dataTypeVL, &
        VL,ldvl,dataTypeVR,VR,ldvr,computeType,workOnDevice,lworkOnDevice,workOnHost,lworkOnHost, &
        devInfo) &
        bind(c, name="hipsolverDnXgeev")
      use iso_c_binding
      use hipfort_hipsolver_enums
      use hipfort_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnXgeev_
      type(c_ptr),value :: handle
      type(c_ptr),value :: params
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobvl
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobvr
      integer(c_int64_t),value :: n
      integer(kind(HIP_R_32F)),value :: dataTypeA
      type(c_ptr),value :: A
      integer(c_int64_t),value :: lda
      integer(kind(HIP_R_32F)),value :: dataTypeW
      type(c_ptr),value :: W
      integer(kind(HIP_R_32F)),value :: dataTypeVL
      type(c_ptr),value :: VL
      integer(c_int64_t),value :: ldvl
      integer(kind(HIP_R_32F)),value :: dataTypeVR
      type(c_ptr),value :: VR
      integer(c_int64_t),value :: ldvr
      integer(kind(HIP_R_32F)),value :: computeType
      type(c_ptr),value :: workOnDevice
      integer(c_size_t),value :: lworkOnDevice
      type(c_ptr),value :: workOnHost
      integer(c_size_t),value :: lworkOnHost
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnXgeev_assumed_rank,&
      hipsolverDnXgeev_assumed_rank_cptr,&
      hipsolverDnXgeev_typed
#else
    module procedure &
      hipsolverDnXgeev_rank_0,&
      hipsolverDnXgeev_rank_0_cptr,&
      hipsolverDnXgeev_rank_1,&
      hipsolverDnXgeev_rank_1_cptr,&
      hipsolverDnXgeev_typed
#endif
#endif
  end interface

  interface hipsolverDnXgeqrf_bufferSize
    function hipsolverDnXgeqrf_bufferSize_(handle,params,m,n,dataTypeA,A,lda,dataTypeTau,tau, &
        computeType,lworkOnDevice,lworkOnHost) &
        bind(c, name="hipsolverDnXgeqrf_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      use hipfort_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnXgeqrf_bufferSize_
      type(c_ptr),value :: handle
      type(c_ptr),value :: params
      integer(c_int64_t),value :: m
      integer(c_int64_t),value :: n
      integer(kind(HIP_R_32F)),value :: dataTypeA
      type(c_ptr),value :: A
      integer(c_int64_t),value :: lda
      integer(kind(HIP_R_32F)),value :: dataTypeTau
      type(c_ptr),value :: tau
      integer(kind(HIP_R_32F)),value :: computeType
      type(c_ptr),value :: lworkOnDevice
      type(c_ptr),value :: lworkOnHost
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnXgeqrf_bufferSize_assumed_rank,&
      hipsolverDnXgeqrf_bufferSize_assumed_rank_cptr,&
      hipsolverDnXgeqrf_bufferSize_typed
#else
    module procedure &
      hipsolverDnXgeqrf_bufferSize_rank_0,&
      hipsolverDnXgeqrf_bufferSize_rank_0_cptr,&
      hipsolverDnXgeqrf_bufferSize_rank_1,&
      hipsolverDnXgeqrf_bufferSize_rank_1_cptr,&
      hipsolverDnXgeqrf_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnXgeqrf
    function hipsolverDnXgeqrf_(handle,params,m,n,dataTypeA,A,lda,dataTypeTau,tau,computeType, &
        workOnDevice,lworkOnDevice,workOnHost,lworkOnHost,devInfo) &
        bind(c, name="hipsolverDnXgeqrf")
      use iso_c_binding
      use hipfort_hipsolver_enums
      use hipfort_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnXgeqrf_
      type(c_ptr),value :: handle
      type(c_ptr),value :: params
      integer(c_int64_t),value :: m
      integer(c_int64_t),value :: n
      integer(kind(HIP_R_32F)),value :: dataTypeA
      type(c_ptr),value :: A
      integer(c_int64_t),value :: lda
      integer(kind(HIP_R_32F)),value :: dataTypeTau
      type(c_ptr),value :: tau
      integer(kind(HIP_R_32F)),value :: computeType
      type(c_ptr),value :: workOnDevice
      integer(c_size_t),value :: lworkOnDevice
      type(c_ptr),value :: workOnHost
      integer(c_size_t),value :: lworkOnHost
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnXgeqrf_assumed_rank,&
      hipsolverDnXgeqrf_assumed_rank_cptr,&
      hipsolverDnXgeqrf_typed
#else
    module procedure &
      hipsolverDnXgeqrf_rank_0,&
      hipsolverDnXgeqrf_rank_0_cptr,&
      hipsolverDnXgeqrf_rank_1,&
      hipsolverDnXgeqrf_rank_1_cptr,&
      hipsolverDnXgeqrf_typed
#endif
#endif
  end interface

  interface hipsolverDnXgetrf_bufferSize
    function hipsolverDnXgetrf_bufferSize_(handle,params,m,n,dataTypeA,A,lda,computeType, &
        lworkOnDevice,lworkOnHost) &
        bind(c, name="hipsolverDnXgetrf_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      use hipfort_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnXgetrf_bufferSize_
      type(c_ptr),value :: handle
      type(c_ptr),value :: params
      integer(c_int64_t),value :: m
      integer(c_int64_t),value :: n
      integer(kind(HIP_R_32F)),value :: dataTypeA
      type(c_ptr),value :: A
      integer(c_int64_t),value :: lda
      integer(kind(HIP_R_32F)),value :: computeType
      integer(c_size_t) :: lworkOnDevice
      integer(c_size_t) :: lworkOnHost
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDnXgetrf_bufferSize_typed
#endif
  end interface

  interface hipsolverDnXgetrf
    function hipsolverDnXgetrf_(handle,params,m,n,dataTypeA,A,lda,devIpiv,computeType, &
        workOnDevice,lworkOnDevice,workOnHost,lworkOnHost,devInfo) &
        bind(c, name="hipsolverDnXgetrf")
      use iso_c_binding
      use hipfort_hipsolver_enums
      use hipfort_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnXgetrf_
      type(c_ptr),value :: handle
      type(c_ptr),value :: params
      integer(c_int64_t),value :: m
      integer(c_int64_t),value :: n
      integer(kind(HIP_R_32F)),value :: dataTypeA
      type(c_ptr),value :: A
      integer(c_int64_t),value :: lda
      type(c_ptr),value :: devIpiv
      integer(kind(HIP_R_32F)),value :: computeType
      type(c_ptr),value :: workOnDevice
      integer(c_size_t),value :: lworkOnDevice
      type(c_ptr),value :: workOnHost
      integer(c_size_t),value :: lworkOnHost
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnXgetrf_assumed_rank,&
      hipsolverDnXgetrf_assumed_rank_cptr,&
      hipsolverDnXgetrf_typed
#else
    module procedure &
      hipsolverDnXgetrf_rank_0,&
      hipsolverDnXgetrf_rank_0_cptr,&
      hipsolverDnXgetrf_rank_1,&
      hipsolverDnXgetrf_rank_1_cptr,&
      hipsolverDnXgetrf_typed
#endif
#endif
  end interface

  interface hipsolverDnXgetrs
    function hipsolverDnXgetrs_(handle,params,trans,n,nrhs,dataTypeA,A,lda,devIpiv,dataTypeB,B, &
        ldb,devInfo) &
        bind(c, name="hipsolverDnXgetrs")
      use iso_c_binding
      use hipfort_hipsolver_enums
      use hipfort_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnXgetrs_
      type(c_ptr),value :: handle
      type(c_ptr),value :: params
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int64_t),value :: n
      integer(c_int64_t),value :: nrhs
      integer(kind(HIP_R_32F)),value :: dataTypeA
      type(c_ptr),value :: A
      integer(c_int64_t),value :: lda
      type(c_ptr),value :: devIpiv
      integer(kind(HIP_R_32F)),value :: dataTypeB
      type(c_ptr),value :: B
      integer(c_int64_t),value :: ldb
      integer(c_int) :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnXgetrs_assumed_rank,&
      hipsolverDnXgetrs_assumed_rank_cptr,&
      hipsolverDnXgetrs_typed
#else
    module procedure &
      hipsolverDnXgetrs_rank_0,&
      hipsolverDnXgetrs_rank_0_cptr,&
      hipsolverDnXgetrs_rank_1,&
      hipsolverDnXgetrs_rank_1_cptr,&
      hipsolverDnXgetrs_typed
#endif
#endif
  end interface

  interface hipsolverDnXpotrf_bufferSize
    function hipsolverDnXpotrf_bufferSize_(handle,params,uplo,n,dataTypeA,A,lda,computeType, &
        lworkOnDevice,lworkOnHost) &
        bind(c, name="hipsolverDnXpotrf_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      use hipfort_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnXpotrf_bufferSize_
      type(c_ptr),value :: handle
      type(c_ptr),value :: params
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int64_t),value :: n
      integer(kind(HIP_R_32F)),value :: dataTypeA
      type(c_ptr),value :: A
      integer(c_int64_t),value :: lda
      integer(kind(HIP_R_32F)),value :: computeType
      type(c_ptr),value :: lworkOnDevice
      type(c_ptr),value :: lworkOnHost
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnXpotrf_bufferSize_assumed_rank,&
      hipsolverDnXpotrf_bufferSize_assumed_rank_cptr,&
      hipsolverDnXpotrf_bufferSize_typed
#else
    module procedure &
      hipsolverDnXpotrf_bufferSize_rank_0,&
      hipsolverDnXpotrf_bufferSize_rank_0_cptr,&
      hipsolverDnXpotrf_bufferSize_rank_1,&
      hipsolverDnXpotrf_bufferSize_rank_1_cptr,&
      hipsolverDnXpotrf_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnXpotrf
    function hipsolverDnXpotrf_(handle,params,uplo,n,dataTypeA,A,lda,computeType,workOnDevice, &
        lworkOnDevice,workOnHost,lworkOnHost,myInfo) &
        bind(c, name="hipsolverDnXpotrf")
      use iso_c_binding
      use hipfort_hipsolver_enums
      use hipfort_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnXpotrf_
      type(c_ptr),value :: handle
      type(c_ptr),value :: params
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int64_t),value :: n
      integer(kind(HIP_R_32F)),value :: dataTypeA
      type(c_ptr),value :: A
      integer(c_int64_t),value :: lda
      integer(kind(HIP_R_32F)),value :: computeType
      type(c_ptr),value :: workOnDevice
      integer(c_size_t),value :: lworkOnDevice
      type(c_ptr),value :: workOnHost
      integer(c_size_t),value :: lworkOnHost
      type(c_ptr),value :: myInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnXpotrf_assumed_rank,&
      hipsolverDnXpotrf_assumed_rank_cptr,&
      hipsolverDnXpotrf_typed
#else
    module procedure &
      hipsolverDnXpotrf_rank_0,&
      hipsolverDnXpotrf_rank_0_cptr,&
      hipsolverDnXpotrf_rank_1,&
      hipsolverDnXpotrf_rank_1_cptr,&
      hipsolverDnXpotrf_typed
#endif
#endif
  end interface

  interface hipsolverDnXpotrs
    function hipsolverDnXpotrs_(handle,params,uplo,n,nrhs,dataTypeA,A,lda,dataTypeB,B,ldb,myInfo) &
        bind(c, name="hipsolverDnXpotrs")
      use iso_c_binding
      use hipfort_hipsolver_enums
      use hipfort_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnXpotrs_
      type(c_ptr),value :: handle
      type(c_ptr),value :: params
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int64_t),value :: n
      integer(c_int64_t),value :: nrhs
      integer(kind(HIP_R_32F)),value :: dataTypeA
      type(c_ptr),value :: A
      integer(c_int64_t),value :: lda
      integer(kind(HIP_R_32F)),value :: dataTypeB
      type(c_ptr),value :: B
      integer(c_int64_t),value :: ldb
      type(c_ptr),value :: myInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnXpotrs_assumed_rank,&
      hipsolverDnXpotrs_assumed_rank_cptr,&
      hipsolverDnXpotrs_typed
#else
    module procedure &
      hipsolverDnXpotrs_rank_0,&
      hipsolverDnXpotrs_rank_0_cptr,&
      hipsolverDnXpotrs_rank_1,&
      hipsolverDnXpotrs_rank_1_cptr,&
      hipsolverDnXpotrs_typed
#endif
#endif
  end interface

  interface hipsolverDnXsyevd_bufferSize
    function hipsolverDnXsyevd_bufferSize_(handle,params,jobz,uplo,n,dataTypeA,A,lda,dataTypeW,W, &
        computeType,lworkOnDevice,lworkOnHost) &
        bind(c, name="hipsolverDnXsyevd_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      use hipfort_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnXsyevd_bufferSize_
      type(c_ptr),value :: handle
      type(c_ptr),value :: params
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int64_t),value :: n
      integer(kind(HIP_R_32F)),value :: dataTypeA
      type(c_ptr),value :: A
      integer(c_int64_t),value :: lda
      integer(kind(HIP_R_32F)),value :: dataTypeW
      type(c_ptr),value :: W
      integer(kind(HIP_R_32F)),value :: computeType
      type(c_ptr),value :: lworkOnDevice
      type(c_ptr),value :: lworkOnHost
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnXsyevd_bufferSize_assumed_rank,&
      hipsolverDnXsyevd_bufferSize_assumed_rank_cptr,&
      hipsolverDnXsyevd_bufferSize_typed
#else
    module procedure &
      hipsolverDnXsyevd_bufferSize_rank_0,&
      hipsolverDnXsyevd_bufferSize_rank_0_cptr,&
      hipsolverDnXsyevd_bufferSize_rank_1,&
      hipsolverDnXsyevd_bufferSize_rank_1_cptr,&
      hipsolverDnXsyevd_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnXsyevd
    function hipsolverDnXsyevd_(handle,params,jobz,uplo,n,dataTypeA,A,lda,dataTypeW,W,computeType, &
        workOnDevice,lworkOnDevice,workOnHost,lworkOnHost,devInfo) &
        bind(c, name="hipsolverDnXsyevd")
      use iso_c_binding
      use hipfort_hipsolver_enums
      use hipfort_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnXsyevd_
      type(c_ptr),value :: handle
      type(c_ptr),value :: params
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int64_t),value :: n
      integer(kind(HIP_R_32F)),value :: dataTypeA
      type(c_ptr),value :: A
      integer(c_int64_t),value :: lda
      integer(kind(HIP_R_32F)),value :: dataTypeW
      type(c_ptr),value :: W
      integer(kind(HIP_R_32F)),value :: computeType
      type(c_ptr),value :: workOnDevice
      integer(c_size_t),value :: lworkOnDevice
      type(c_ptr),value :: workOnHost
      integer(c_size_t),value :: lworkOnHost
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnXsyevd_assumed_rank,&
      hipsolverDnXsyevd_assumed_rank_cptr,&
      hipsolverDnXsyevd_typed
#else
    module procedure &
      hipsolverDnXsyevd_rank_0,&
      hipsolverDnXsyevd_rank_0_cptr,&
      hipsolverDnXsyevd_rank_1,&
      hipsolverDnXsyevd_rank_1_cptr,&
      hipsolverDnXsyevd_typed
#endif
#endif
  end interface

  interface hipsolverDnXsyevBatched_bufferSize
    function hipsolverDnXsyevBatched_bufferSize_(handle,params,jobz,uplo,n,dataTypeA,A,lda, &
        dataTypeW,W,computeType,lworkOnDevice,lworkOnHost,batchSize) &
        bind(c, name="hipsolverDnXsyevBatched_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      use hipfort_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnXsyevBatched_bufferSize_
      type(c_ptr),value :: handle
      type(c_ptr),value :: params
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int64_t),value :: n
      integer(kind(HIP_R_32F)),value :: dataTypeA
      type(c_ptr),value :: A
      integer(c_int64_t),value :: lda
      integer(kind(HIP_R_32F)),value :: dataTypeW
      type(c_ptr),value :: W
      integer(kind(HIP_R_32F)),value :: computeType
      type(c_ptr),value :: lworkOnDevice
      type(c_ptr),value :: lworkOnHost
      integer(c_int64_t),value :: batchSize
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnXsyevBatched_bufferSize_assumed_rank,&
      hipsolverDnXsyevBatched_bufferSize_assumed_rank_cptr,&
      hipsolverDnXsyevBatched_bufferSize_typed
#else
    module procedure &
      hipsolverDnXsyevBatched_bufferSize_rank_0,&
      hipsolverDnXsyevBatched_bufferSize_rank_0_cptr,&
      hipsolverDnXsyevBatched_bufferSize_rank_1,&
      hipsolverDnXsyevBatched_bufferSize_rank_1_cptr,&
      hipsolverDnXsyevBatched_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnXsyevBatched
    function hipsolverDnXsyevBatched_(handle,params,jobz,uplo,n,dataTypeA,A,lda,dataTypeW,W, &
        computeType,workOnDevice,lworkOnDevice,workOnHost,lworkOnHost,devInfo,batchSize) &
        bind(c, name="hipsolverDnXsyevBatched")
      use iso_c_binding
      use hipfort_hipsolver_enums
      use hipfort_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnXsyevBatched_
      type(c_ptr),value :: handle
      type(c_ptr),value :: params
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int64_t),value :: n
      integer(kind(HIP_R_32F)),value :: dataTypeA
      type(c_ptr),value :: A
      integer(c_int64_t),value :: lda
      integer(kind(HIP_R_32F)),value :: dataTypeW
      type(c_ptr),value :: W
      integer(kind(HIP_R_32F)),value :: computeType
      type(c_ptr),value :: workOnDevice
      integer(c_size_t),value :: lworkOnDevice
      type(c_ptr),value :: workOnHost
      integer(c_size_t),value :: lworkOnHost
      type(c_ptr),value :: devInfo
      integer(c_int64_t),value :: batchSize
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnXsyevBatched_assumed_rank,&
      hipsolverDnXsyevBatched_assumed_rank_cptr,&
      hipsolverDnXsyevBatched_typed
#else
    module procedure &
      hipsolverDnXsyevBatched_rank_0,&
      hipsolverDnXsyevBatched_rank_0_cptr,&
      hipsolverDnXsyevBatched_rank_1,&
      hipsolverDnXsyevBatched_rank_1_cptr,&
      hipsolverDnXsyevBatched_typed
#endif
#endif
  end interface

  interface hipsolverDnXsytrs_bufferSize
    function hipsolverDnXsytrs_bufferSize_(handle,uplo,n,nrhs,dataTypeA,A,lda,devIpiv,dataTypeB,B, &
        ldb,lworkOnDevice,lworkOnHost) &
        bind(c, name="hipsolverDnXsytrs_bufferSize")
      use iso_c_binding
      use hipfort_hipsolver_enums
      use hipfort_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnXsytrs_bufferSize_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int64_t),value :: n
      integer(c_int64_t),value :: nrhs
      integer(kind(HIP_R_32F)),value :: dataTypeA
      type(c_ptr),value :: A
      integer(c_int64_t),value :: lda
      type(c_ptr),value :: devIpiv
      integer(kind(HIP_R_32F)),value :: dataTypeB
      type(c_ptr),value :: B
      integer(c_int64_t),value :: ldb
      type(c_ptr),value :: lworkOnDevice
      type(c_ptr),value :: lworkOnHost
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnXsytrs_bufferSize_assumed_rank,&
      hipsolverDnXsytrs_bufferSize_assumed_rank_cptr,&
      hipsolverDnXsytrs_bufferSize_typed
#else
    module procedure &
      hipsolverDnXsytrs_bufferSize_rank_0,&
      hipsolverDnXsytrs_bufferSize_rank_0_cptr,&
      hipsolverDnXsytrs_bufferSize_rank_1,&
      hipsolverDnXsytrs_bufferSize_rank_1_cptr,&
      hipsolverDnXsytrs_bufferSize_typed
#endif
#endif
  end interface

  interface hipsolverDnXsytrs
    function hipsolverDnXsytrs_(handle,uplo,n,nrhs,dataTypeA,A,lda,devIpiv,dataTypeB,B,ldb, &
        workOnDevice,lworkOnDevice,workOnHost,lworkOnHost,devInfo) &
        bind(c, name="hipsolverDnXsytrs")
      use iso_c_binding
      use hipfort_hipsolver_enums
      use hipfort_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnXsytrs_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int64_t),value :: n
      integer(c_int64_t),value :: nrhs
      integer(kind(HIP_R_32F)),value :: dataTypeA
      type(c_ptr),value :: A
      integer(c_int64_t),value :: lda
      type(c_ptr),value :: devIpiv
      integer(kind(HIP_R_32F)),value :: dataTypeB
      type(c_ptr),value :: B
      integer(c_int64_t),value :: ldb
      type(c_ptr),value :: workOnDevice
      integer(c_size_t),value :: lworkOnDevice
      type(c_ptr),value :: workOnHost
      integer(c_size_t),value :: lworkOnHost
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverDnXsytrs_assumed_rank,&
      hipsolverDnXsytrs_assumed_rank_cptr,&
      hipsolverDnXsytrs_typed
#else
    module procedure &
      hipsolverDnXsytrs_rank_0,&
      hipsolverDnXsytrs_rank_0_cptr,&
      hipsolverDnXsytrs_rank_1,&
      hipsolverDnXsytrs_rank_1_cptr,&
      hipsolverDnXsytrs_typed
#endif
#endif
  end interface

  interface hipsolverRfCreate
    function hipsolverRfCreate_(handle) bind(c, name="hipsolverRfCreate")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfCreate_
      type(c_ptr) :: handle
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverRfCreate_typed
#endif
  end interface

  interface hipsolverRfDestroy
    function hipsolverRfDestroy_(handle) bind(c, name="hipsolverRfDestroy")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfDestroy_
      type(c_ptr),value :: handle
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverRfDestroy_typed
#endif
  end interface

  interface hipsolverRfSetupDevice
    function hipsolverRfSetupDevice_(n,nnzA,csrRowPtrA,csrColIndA,csrValA,nnzL,csrRowPtrL, &
        csrColIndL,csrValL,nnzU,csrRowPtrU,csrColIndU,csrValU,P,Q,handle) &
        bind(c, name="hipsolverRfSetupDevice")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfSetupDevice_
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: csrValA
      integer(c_int),value :: nnzL
      type(c_ptr),value :: csrRowPtrL
      type(c_ptr),value :: csrColIndL
      type(c_ptr),value :: csrValL
      integer(c_int),value :: nnzU
      type(c_ptr),value :: csrRowPtrU
      type(c_ptr),value :: csrColIndU
      type(c_ptr),value :: csrValU
      type(c_ptr),value :: P
      type(c_ptr),value :: Q
      type(c_ptr),value :: handle
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverRfSetupDevice_assumed_rank,&
      hipsolverRfSetupDevice_assumed_rank_cptr,&
      hipsolverRfSetupDevice_typed
#else
    module procedure &
      hipsolverRfSetupDevice_rank_0,&
      hipsolverRfSetupDevice_rank_0_cptr,&
      hipsolverRfSetupDevice_rank_1,&
      hipsolverRfSetupDevice_rank_1_cptr,&
      hipsolverRfSetupDevice_typed
#endif
#endif
  end interface

  interface hipsolverRfSetupHost
    function hipsolverRfSetupHost_(n,nnzA,h_csrRowPtrA,h_csrColIndA,h_csrValA,nnzL,h_csrRowPtrL, &
        h_csrColIndL,h_csrValL,nnzU,h_csrRowPtrU,h_csrColIndU,h_csrValU,h_P,h_Q,handle) &
        bind(c, name="hipsolverRfSetupHost")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfSetupHost_
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: h_csrRowPtrA
      type(c_ptr),value :: h_csrColIndA
      type(c_ptr),value :: h_csrValA
      integer(c_int),value :: nnzL
      type(c_ptr),value :: h_csrRowPtrL
      type(c_ptr),value :: h_csrColIndL
      type(c_ptr),value :: h_csrValL
      integer(c_int),value :: nnzU
      type(c_ptr),value :: h_csrRowPtrU
      type(c_ptr),value :: h_csrColIndU
      type(c_ptr),value :: h_csrValU
      type(c_ptr),value :: h_P
      type(c_ptr),value :: h_Q
      type(c_ptr),value :: handle
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverRfSetupHost_assumed_rank,&
      hipsolverRfSetupHost_assumed_rank_cptr,&
      hipsolverRfSetupHost_typed
#else
    module procedure &
      hipsolverRfSetupHost_rank_0,&
      hipsolverRfSetupHost_rank_0_cptr,&
      hipsolverRfSetupHost_rank_1,&
      hipsolverRfSetupHost_rank_1_cptr,&
      hipsolverRfSetupHost_typed
#endif
#endif
  end interface

  interface hipsolverRfAccessBundledFactorsDevice
    function hipsolverRfAccessBundledFactorsDevice_(handle,nnzM,Mp,Mi,Mx) &
        bind(c, name="hipsolverRfAccessBundledFactorsDevice")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfAccessBundledFactorsDevice_
      type(c_ptr),value :: handle
      integer(c_int) :: nnzM
      type(c_ptr) :: Mp
      type(c_ptr) :: Mi
      type(c_ptr) :: Mx
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverRfAccessBundledFactorsDevice_typed
#endif
  end interface

  interface hipsolverRfAnalyze
    function hipsolverRfAnalyze_(handle) bind(c, name="hipsolverRfAnalyze")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfAnalyze_
      type(c_ptr),value :: handle
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverRfAnalyze_typed
#endif
  end interface

  interface hipsolverRfExtractBundledFactorsHost
    function hipsolverRfExtractBundledFactorsHost_(handle,h_nnzM,h_Mp,h_Mi,h_Mx) &
        bind(c, name="hipsolverRfExtractBundledFactorsHost")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfExtractBundledFactorsHost_
      type(c_ptr),value :: handle
      integer(c_int) :: h_nnzM
      type(c_ptr) :: h_Mp
      type(c_ptr) :: h_Mi
      type(c_ptr) :: h_Mx
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverRfExtractBundledFactorsHost_typed
#endif
  end interface

  interface hipsolverRfExtractSplitFactorsHost
    function hipsolverRfExtractSplitFactorsHost_(handle,h_nnzL,h_Lp,h_Li,h_Lx,h_nnzU,h_Up,h_Ui, &
        h_Ux) &
        bind(c, name="hipsolverRfExtractSplitFactorsHost")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfExtractSplitFactorsHost_
      type(c_ptr),value :: handle
      integer(c_int) :: h_nnzL
      type(c_ptr) :: h_Lp
      type(c_ptr) :: h_Li
      type(c_ptr) :: h_Lx
      integer(c_int) :: h_nnzU
      type(c_ptr) :: h_Up
      type(c_ptr) :: h_Ui
      type(c_ptr) :: h_Ux
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverRfExtractSplitFactorsHost_typed
#endif
  end interface

  interface hipsolverRfGet_Algs
    function hipsolverRfGet_Algs_(handle,fact_alg,solve_alg) bind(c, name="hipsolverRfGet_Algs")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfGet_Algs_
      type(c_ptr),value :: handle
      type(c_ptr),value :: fact_alg
      type(c_ptr),value :: solve_alg
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverRfGet_Algs_assumed_rank,&
      hipsolverRfGet_Algs_assumed_rank_cptr,&
      hipsolverRfGet_Algs_typed
#else
    module procedure &
      hipsolverRfGet_Algs_rank_0,&
      hipsolverRfGet_Algs_rank_0_cptr,&
      hipsolverRfGet_Algs_rank_1,&
      hipsolverRfGet_Algs_rank_1_cptr,&
      hipsolverRfGet_Algs_typed
#endif
#endif
  end interface

  interface hipsolverRfGetMatrixFormat
    function hipsolverRfGetMatrixFormat_(handle,myFormat,diag) &
        bind(c, name="hipsolverRfGetMatrixFormat")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfGetMatrixFormat_
      type(c_ptr),value :: handle
      type(c_ptr),value :: myFormat
      type(c_ptr),value :: diag
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverRfGetMatrixFormat_assumed_rank,&
      hipsolverRfGetMatrixFormat_assumed_rank_cptr,&
      hipsolverRfGetMatrixFormat_typed
#else
    module procedure &
      hipsolverRfGetMatrixFormat_rank_0,&
      hipsolverRfGetMatrixFormat_rank_0_cptr,&
      hipsolverRfGetMatrixFormat_rank_1,&
      hipsolverRfGetMatrixFormat_rank_1_cptr,&
      hipsolverRfGetMatrixFormat_typed
#endif
#endif
  end interface

  interface hipsolverRfGetNumericBoostReport
    function hipsolverRfGetNumericBoostReport_(handle,report) &
        bind(c, name="hipsolverRfGetNumericBoostReport")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfGetNumericBoostReport_
      type(c_ptr),value :: handle
      type(c_ptr),value :: report
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverRfGetNumericBoostReport_assumed_rank,&
      hipsolverRfGetNumericBoostReport_assumed_rank_cptr,&
      hipsolverRfGetNumericBoostReport_typed
#else
    module procedure &
      hipsolverRfGetNumericBoostReport_rank_0,&
      hipsolverRfGetNumericBoostReport_rank_0_cptr,&
      hipsolverRfGetNumericBoostReport_rank_1,&
      hipsolverRfGetNumericBoostReport_rank_1_cptr,&
      hipsolverRfGetNumericBoostReport_typed
#endif
#endif
  end interface

  interface hipsolverRfGetNumericProperties
    function hipsolverRfGetNumericProperties_(handle,zero,boost) &
        bind(c, name="hipsolverRfGetNumericProperties")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfGetNumericProperties_
      type(c_ptr),value :: handle
      real(c_double) :: zero
      real(c_double) :: boost
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverRfGetNumericProperties_typed
#endif
  end interface

  interface hipsolverRfGetResetValuesFastMode
    function hipsolverRfGetResetValuesFastMode_(handle,fastMode) &
        bind(c, name="hipsolverRfGetResetValuesFastMode")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfGetResetValuesFastMode_
      type(c_ptr),value :: handle
      type(c_ptr),value :: fastMode
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverRfGetResetValuesFastMode_assumed_rank,&
      hipsolverRfGetResetValuesFastMode_assumed_rank_cptr,&
      hipsolverRfGetResetValuesFastMode_typed
#else
    module procedure &
      hipsolverRfGetResetValuesFastMode_rank_0,&
      hipsolverRfGetResetValuesFastMode_rank_0_cptr,&
      hipsolverRfGetResetValuesFastMode_rank_1,&
      hipsolverRfGetResetValuesFastMode_rank_1_cptr,&
      hipsolverRfGetResetValuesFastMode_typed
#endif
#endif
  end interface

  interface hipsolverRfRefactor
    function hipsolverRfRefactor_(handle) bind(c, name="hipsolverRfRefactor")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfRefactor_
      type(c_ptr),value :: handle
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverRfRefactor_typed
#endif
  end interface

  interface hipsolverRfResetValues
    function hipsolverRfResetValues_(n,nnzA,csrRowPtrA,csrColIndA,csrValA,P,Q,handle) &
        bind(c, name="hipsolverRfResetValues")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfResetValues_
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: P
      type(c_ptr),value :: Q
      type(c_ptr),value :: handle
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverRfResetValues_assumed_rank,&
      hipsolverRfResetValues_assumed_rank_cptr,&
      hipsolverRfResetValues_typed
#else
    module procedure &
      hipsolverRfResetValues_rank_0,&
      hipsolverRfResetValues_rank_0_cptr,&
      hipsolverRfResetValues_rank_1,&
      hipsolverRfResetValues_rank_1_cptr,&
      hipsolverRfResetValues_typed
#endif
#endif
  end interface

  interface hipsolverRfSetAlgs
    function hipsolverRfSetAlgs_(handle,fact_alg,solve_alg) bind(c, name="hipsolverRfSetAlgs")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfSetAlgs_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVERRF_FACTORIZATION_ALG0)),value :: fact_alg
      integer(kind(HIPSOLVERRF_TRIANGULAR_SOLVE_ALG1)),value :: solve_alg
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverRfSetAlgs_typed
#endif
  end interface

  interface hipsolverRfSetMatrixFormat
    function hipsolverRfSetMatrixFormat_(handle,myFormat,diag) &
        bind(c, name="hipsolverRfSetMatrixFormat")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfSetMatrixFormat_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVERRF_MATRIX_FORMAT_CSR)),value :: myFormat
      integer(kind(HIPSOLVERRF_UNIT_DIAGONAL_STORED_L)),value :: diag
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverRfSetMatrixFormat_typed
#endif
  end interface

  interface hipsolverRfSetNumericProperties
    function hipsolverRfSetNumericProperties_(handle,effective_zero,boost_val) &
        bind(c, name="hipsolverRfSetNumericProperties")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfSetNumericProperties_
      type(c_ptr),value :: handle
      real(c_double),value :: effective_zero
      real(c_double),value :: boost_val
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverRfSetNumericProperties_typed
#endif
  end interface

  interface hipsolverRfSetResetValuesFastMode
    function hipsolverRfSetResetValuesFastMode_(handle,fastMode) &
        bind(c, name="hipsolverRfSetResetValuesFastMode")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfSetResetValuesFastMode_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVERRF_RESET_VALUES_FAST_MODE_OFF)),value :: fastMode
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverRfSetResetValuesFastMode_typed
#endif
  end interface

  interface hipsolverRfSolve
    function hipsolverRfSolve_(handle,P,Q,nrhs,Temp,ldt,XF,ldxf) bind(c, name="hipsolverRfSolve")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfSolve_
      type(c_ptr),value :: handle
      type(c_ptr),value :: P
      type(c_ptr),value :: Q
      integer(c_int),value :: nrhs
      type(c_ptr),value :: Temp
      integer(c_int),value :: ldt
      type(c_ptr),value :: XF
      integer(c_int),value :: ldxf
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverRfSolve_assumed_rank,&
      hipsolverRfSolve_assumed_rank_cptr,&
      hipsolverRfSolve_typed
#else
    module procedure &
      hipsolverRfSolve_rank_0,&
      hipsolverRfSolve_rank_0_cptr,&
      hipsolverRfSolve_rank_1,&
      hipsolverRfSolve_rank_1_cptr,&
      hipsolverRfSolve_typed
#endif
#endif
  end interface

  interface hipsolverRfBatchSetupHost
    function hipsolverRfBatchSetupHost_(batchSize,n,nnzA,h_csrRowPtrA,h_csrColIndA, &
        h_csrValA_array,nnzL,h_csrRowPtrL,h_csrColIndL,h_csrValL,nnzU,h_csrRowPtrU,h_csrColIndU, &
        h_csrValU,h_P,h_Q,handle) &
        bind(c, name="hipsolverRfBatchSetupHost")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfBatchSetupHost_
      integer(c_int),value :: batchSize
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: h_csrRowPtrA
      type(c_ptr),value :: h_csrColIndA
      type(c_ptr) :: h_csrValA_array
      integer(c_int),value :: nnzL
      type(c_ptr),value :: h_csrRowPtrL
      type(c_ptr),value :: h_csrColIndL
      type(c_ptr),value :: h_csrValL
      integer(c_int),value :: nnzU
      type(c_ptr),value :: h_csrRowPtrU
      type(c_ptr),value :: h_csrColIndU
      type(c_ptr),value :: h_csrValU
      type(c_ptr),value :: h_P
      type(c_ptr),value :: h_Q
      type(c_ptr),value :: handle
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverRfBatchSetupHost_assumed_rank,&
      hipsolverRfBatchSetupHost_assumed_rank_cptr,&
      hipsolverRfBatchSetupHost_typed
#else
    module procedure &
      hipsolverRfBatchSetupHost_rank_0,&
      hipsolverRfBatchSetupHost_rank_0_cptr,&
      hipsolverRfBatchSetupHost_rank_1,&
      hipsolverRfBatchSetupHost_rank_1_cptr,&
      hipsolverRfBatchSetupHost_typed
#endif
#endif
  end interface

  interface hipsolverRfBatchAnalyze
    function hipsolverRfBatchAnalyze_(handle) bind(c, name="hipsolverRfBatchAnalyze")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfBatchAnalyze_
      type(c_ptr),value :: handle
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverRfBatchAnalyze_typed
#endif
  end interface

  interface hipsolverRfBatchRefactor
    function hipsolverRfBatchRefactor_(handle) bind(c, name="hipsolverRfBatchRefactor")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfBatchRefactor_
      type(c_ptr),value :: handle
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverRfBatchRefactor_typed
#endif
  end interface

  interface hipsolverRfBatchResetValues
    function hipsolverRfBatchResetValues_(batchSize,n,nnzA,csrRowPtrA,csrColIndA,csrValA_array,P, &
        Q,handle) &
        bind(c, name="hipsolverRfBatchResetValues")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfBatchResetValues_
      integer(c_int),value :: batchSize
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      type(c_ptr) :: csrValA_array
      type(c_ptr),value :: P
      type(c_ptr),value :: Q
      type(c_ptr),value :: handle
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverRfBatchResetValues_assumed_rank,&
      hipsolverRfBatchResetValues_assumed_rank_cptr,&
      hipsolverRfBatchResetValues_typed
#else
    module procedure &
      hipsolverRfBatchResetValues_rank_0,&
      hipsolverRfBatchResetValues_rank_0_cptr,&
      hipsolverRfBatchResetValues_rank_1,&
      hipsolverRfBatchResetValues_rank_1_cptr,&
      hipsolverRfBatchResetValues_typed
#endif
#endif
  end interface

  interface hipsolverRfBatchSolve
    function hipsolverRfBatchSolve_(handle,P,Q,nrhs,Temp,ldt,XF_array,ldxf) &
        bind(c, name="hipsolverRfBatchSolve")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfBatchSolve_
      type(c_ptr),value :: handle
      type(c_ptr),value :: P
      type(c_ptr),value :: Q
      integer(c_int),value :: nrhs
      type(c_ptr),value :: Temp
      integer(c_int),value :: ldt
      type(c_ptr) :: XF_array
      integer(c_int),value :: ldxf
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverRfBatchSolve_assumed_rank,&
      hipsolverRfBatchSolve_assumed_rank_cptr,&
      hipsolverRfBatchSolve_typed
#else
    module procedure &
      hipsolverRfBatchSolve_rank_0,&
      hipsolverRfBatchSolve_rank_0_cptr,&
      hipsolverRfBatchSolve_rank_1,&
      hipsolverRfBatchSolve_rank_1_cptr,&
      hipsolverRfBatchSolve_typed
#endif
#endif
  end interface

  interface hipsolverRfBatchZeroPivot
    function hipsolverRfBatchZeroPivot_(handle,position) bind(c, name="hipsolverRfBatchZeroPivot")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfBatchZeroPivot_
      type(c_ptr),value :: handle
      integer(c_int) :: position
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverRfBatchZeroPivot_typed
#endif
  end interface

  interface hipsolverSpCreate
    function hipsolverSpCreate_(handle) bind(c, name="hipsolverSpCreate")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpCreate_
      type(c_ptr) :: handle
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverSpCreate_typed
#endif
  end interface

  interface hipsolverSpDestroy
    function hipsolverSpDestroy_(handle) bind(c, name="hipsolverSpDestroy")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpDestroy_
      type(c_ptr),value :: handle
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverSpDestroy_typed
#endif
  end interface

  interface hipsolverSpSetStream
    function hipsolverSpSetStream_(handle,streamId) bind(c, name="hipsolverSpSetStream")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpSetStream_
      type(c_ptr),value :: handle
      type(c_ptr),value :: streamId
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverSpSetStream_typed
#endif
  end interface

  interface hipsolverSpScsrlsvchol
    function hipsolverSpScsrlsvchol_(handle,n,nnzA,descrA,csrVal,csrRowPtr,csrColInd,b,tolerance, &
        reorder,x,singularity) &
        bind(c, name="hipsolverSpScsrlsvchol")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpScsrlsvchol_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrVal
      type(c_ptr),value :: csrRowPtr
      type(c_ptr),value :: csrColInd
      type(c_ptr),value :: b
      real(c_float),value :: tolerance
      integer(c_int),value :: reorder
      type(c_ptr),value :: x
      integer(c_int) :: singularity
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSpScsrlsvchol_assumed_rank,&
      hipsolverSpScsrlsvchol_assumed_rank_cptr,&
      hipsolverSpScsrlsvchol_typed
#else
    module procedure &
      hipsolverSpScsrlsvchol_rank_0,&
      hipsolverSpScsrlsvchol_rank_0_cptr,&
      hipsolverSpScsrlsvchol_rank_1,&
      hipsolverSpScsrlsvchol_rank_1_cptr,&
      hipsolverSpScsrlsvchol_typed
#endif
#endif
  end interface

  interface hipsolverSpDcsrlsvchol
    function hipsolverSpDcsrlsvchol_(handle,n,nnzA,descrA,csrVal,csrRowPtr,csrColInd,b,tolerance, &
        reorder,x,singularity) &
        bind(c, name="hipsolverSpDcsrlsvchol")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpDcsrlsvchol_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrVal
      type(c_ptr),value :: csrRowPtr
      type(c_ptr),value :: csrColInd
      type(c_ptr),value :: b
      real(c_double),value :: tolerance
      integer(c_int),value :: reorder
      type(c_ptr),value :: x
      integer(c_int) :: singularity
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSpDcsrlsvchol_assumed_rank,&
      hipsolverSpDcsrlsvchol_assumed_rank_cptr,&
      hipsolverSpDcsrlsvchol_typed
#else
    module procedure &
      hipsolverSpDcsrlsvchol_rank_0,&
      hipsolverSpDcsrlsvchol_rank_0_cptr,&
      hipsolverSpDcsrlsvchol_rank_1,&
      hipsolverSpDcsrlsvchol_rank_1_cptr,&
      hipsolverSpDcsrlsvchol_typed
#endif
#endif
  end interface

  interface hipsolverSpScsrlsvcholHost
    function hipsolverSpScsrlsvcholHost_(handle,n,nnzA,descrA,csrVal,csrRowPtr,csrColInd,b, &
        tolerance,reorder,x,singularity) &
        bind(c, name="hipsolverSpScsrlsvcholHost")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpScsrlsvcholHost_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrVal
      type(c_ptr),value :: csrRowPtr
      type(c_ptr),value :: csrColInd
      type(c_ptr),value :: b
      real(c_float),value :: tolerance
      integer(c_int),value :: reorder
      type(c_ptr),value :: x
      integer(c_int) :: singularity
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSpScsrlsvcholHost_assumed_rank,&
      hipsolverSpScsrlsvcholHost_assumed_rank_cptr,&
      hipsolverSpScsrlsvcholHost_typed
#else
    module procedure &
      hipsolverSpScsrlsvcholHost_rank_0,&
      hipsolverSpScsrlsvcholHost_rank_0_cptr,&
      hipsolverSpScsrlsvcholHost_rank_1,&
      hipsolverSpScsrlsvcholHost_rank_1_cptr,&
      hipsolverSpScsrlsvcholHost_typed
#endif
#endif
  end interface

  interface hipsolverSpDcsrlsvcholHost
    function hipsolverSpDcsrlsvcholHost_(handle,n,nnzA,descrA,csrVal,csrRowPtr,csrColInd,b, &
        tolerance,reorder,x,singularity) &
        bind(c, name="hipsolverSpDcsrlsvcholHost")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpDcsrlsvcholHost_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: nnzA
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrVal
      type(c_ptr),value :: csrRowPtr
      type(c_ptr),value :: csrColInd
      type(c_ptr),value :: b
      real(c_double),value :: tolerance
      integer(c_int),value :: reorder
      type(c_ptr),value :: x
      type(c_ptr),value :: singularity
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSpDcsrlsvcholHost_assumed_rank,&
      hipsolverSpDcsrlsvcholHost_assumed_rank_cptr,&
      hipsolverSpDcsrlsvcholHost_typed
#else
    module procedure &
      hipsolverSpDcsrlsvcholHost_rank_0,&
      hipsolverSpDcsrlsvcholHost_rank_0_cptr,&
      hipsolverSpDcsrlsvcholHost_rank_1,&
      hipsolverSpDcsrlsvcholHost_rank_1_cptr,&
      hipsolverSpDcsrlsvcholHost_typed
#endif
#endif
  end interface

  interface hipsolverSpScsrlsvqr
    function hipsolverSpScsrlsvqr_(handle,n,nnz,descrA,csrVal,csrRowPts,csrColInd,b,tolerance, &
        reorder,x,singularity) &
        bind(c, name="hipsolverSpScsrlsvqr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpScsrlsvqr_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrVal
      type(c_ptr),value :: csrRowPts
      type(c_ptr),value :: csrColInd
      type(c_ptr),value :: b
      real(c_double),value :: tolerance
      integer(c_int),value :: reorder
      type(c_ptr),value :: x
      type(c_ptr),value :: singularity
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSpScsrlsvqr_assumed_rank,&
      hipsolverSpScsrlsvqr_assumed_rank_cptr,&
      hipsolverSpScsrlsvqr_typed
#else
    module procedure &
      hipsolverSpScsrlsvqr_rank_0,&
      hipsolverSpScsrlsvqr_rank_0_cptr,&
      hipsolverSpScsrlsvqr_rank_1,&
      hipsolverSpScsrlsvqr_rank_1_cptr,&
      hipsolverSpScsrlsvqr_typed
#endif
#endif
  end interface

  interface hipsolverSpDcsrlsvqr
    function hipsolverSpDcsrlsvqr_(handle,n,nnz,descrA,csrVal,csrRowPts,csrColInd,b,tolerance, &
        reorder,x,singularity) &
        bind(c, name="hipsolverSpDcsrlsvqr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpDcsrlsvqr_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrVal
      type(c_ptr),value :: csrRowPts
      type(c_ptr),value :: csrColInd
      type(c_ptr),value :: b
      real(c_double),value :: tolerance
      integer(c_int),value :: reorder
      type(c_ptr),value :: x
      type(c_ptr),value :: singularity
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSpDcsrlsvqr_assumed_rank,&
      hipsolverSpDcsrlsvqr_assumed_rank_cptr,&
      hipsolverSpDcsrlsvqr_typed
#else
    module procedure &
      hipsolverSpDcsrlsvqr_rank_0,&
      hipsolverSpDcsrlsvqr_rank_0_cptr,&
      hipsolverSpDcsrlsvqr_rank_1,&
      hipsolverSpDcsrlsvqr_rank_1_cptr,&
      hipsolverSpDcsrlsvqr_typed
#endif
#endif
  end interface

  interface hipsolverSpCcsrlsvqr
    function hipsolverSpCcsrlsvqr_(handle,n,nnz,descrA,csrVal,csrRowPts,csrColInd,b,tolerance, &
        reorder,x,singularity) &
        bind(c, name="hipsolverSpCcsrlsvqr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpCcsrlsvqr_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrVal
      type(c_ptr),value :: csrRowPts
      type(c_ptr),value :: csrColInd
      type(c_ptr),value :: b
      real(c_double),value :: tolerance
      integer(c_int),value :: reorder
      type(c_ptr),value :: x
      type(c_ptr),value :: singularity
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSpCcsrlsvqr_assumed_rank,&
      hipsolverSpCcsrlsvqr_assumed_rank_cptr,&
      hipsolverSpCcsrlsvqr_typed
#else
    module procedure &
      hipsolverSpCcsrlsvqr_rank_0,&
      hipsolverSpCcsrlsvqr_rank_0_cptr,&
      hipsolverSpCcsrlsvqr_rank_1,&
      hipsolverSpCcsrlsvqr_rank_1_cptr,&
      hipsolverSpCcsrlsvqr_typed
#endif
#endif
  end interface

  interface hipsolverSpZcsrlsvqr
    function hipsolverSpZcsrlsvqr_(handle,n,nnz,descrA,csrVal,csrRowPts,csrColInd,b,tolerance, &
        reorder,x,singularity) &
        bind(c, name="hipsolverSpZcsrlsvqr")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpZcsrlsvqr_
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrVal
      type(c_ptr),value :: csrRowPts
      type(c_ptr),value :: csrColInd
      type(c_ptr),value :: b
      real(c_double),value :: tolerance
      integer(c_int),value :: reorder
      type(c_ptr),value :: x
      type(c_ptr),value :: singularity
    end function

#ifdef USE_FPOINTER_INTERFACES
#ifdef USE_ASSUMED_RANK_INTERFACES
    module procedure &
      hipsolverSpZcsrlsvqr_assumed_rank,&
      hipsolverSpZcsrlsvqr_assumed_rank_cptr,&
      hipsolverSpZcsrlsvqr_typed
#else
    module procedure &
      hipsolverSpZcsrlsvqr_rank_0,&
      hipsolverSpZcsrlsvqr_rank_0_cptr,&
      hipsolverSpZcsrlsvqr_rank_1,&
      hipsolverSpZcsrlsvqr_rank_1_cptr,&
      hipsolverSpZcsrlsvqr_typed
#endif
#endif
  end interface

