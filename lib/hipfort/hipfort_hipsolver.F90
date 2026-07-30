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

module hipfort_hipsolver
  use hipfort_hipsolver_enums
  implicit none

#ifndef USE_CUDA_NAMES
  interface hipsolverCreate
    function hipsolverCreate_(handle) bind(c, name="hipsolverCreate")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCreate_
      type(c_ptr) :: handle
    end function
  end interface
#endif

#ifndef USE_CUDA_NAMES
  interface hipsolverDestroy
    function hipsolverDestroy_(handle) bind(c, name="hipsolverDestroy")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDestroy_
      type(c_ptr),value :: handle
    end function
  end interface
#endif

#ifndef USE_CUDA_NAMES
  interface hipsolverSetStream
    function hipsolverSetStream_(handle,streamId) bind(c, name="hipsolverSetStream")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSetStream_
      type(c_ptr),value :: handle
      type(c_ptr),value :: streamId
    end function
  end interface
#endif

#ifndef USE_CUDA_NAMES
  interface hipsolverGetStream
    function hipsolverGetStream_(handle,streamId) bind(c, name="hipsolverGetStream")
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverGetStream_
      type(c_ptr),value :: handle
      type(c_ptr) :: streamId
    end function
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

  interface hipsolverCreateGesvdjInfo
#ifdef USE_CUDA_NAMES
    function hipsolverCreateGesvdjInfo_(myInfo) bind(c, name="cusolverDnCreateGesvdjInfo")
#else
    function hipsolverCreateGesvdjInfo_(myInfo) bind(c, name="hipsolverCreateGesvdjInfo")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCreateGesvdjInfo_
      type(c_ptr) :: myInfo
    end function
  end interface

  interface hipsolverDestroyGesvdjInfo
#ifdef USE_CUDA_NAMES
    function hipsolverDestroyGesvdjInfo_(myInfo) bind(c, name="cusolverDnDestroyGesvdjInfo")
#else
    function hipsolverDestroyGesvdjInfo_(myInfo) bind(c, name="hipsolverDestroyGesvdjInfo")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDestroyGesvdjInfo_
      type(c_ptr),value :: myInfo
    end function
  end interface

  interface hipsolverXgesvdjSetMaxSweeps
#ifdef USE_CUDA_NAMES
    function hipsolverXgesvdjSetMaxSweeps_(myInfo,max_sweeps) &
        bind(c, name="cusolverDnXgesvdjSetMaxSweeps")
#else
    function hipsolverXgesvdjSetMaxSweeps_(myInfo,max_sweeps) &
        bind(c, name="hipsolverXgesvdjSetMaxSweeps")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverXgesvdjSetMaxSweeps_
      type(c_ptr),value :: myInfo
      integer(c_int),value :: max_sweeps
    end function
  end interface

  interface hipsolverXgesvdjSetSortEig
#ifdef USE_CUDA_NAMES
    function hipsolverXgesvdjSetSortEig_(myInfo,sort_eig) &
        bind(c, name="cusolverDnXgesvdjSetSortEig")
#else
    function hipsolverXgesvdjSetSortEig_(myInfo,sort_eig) bind(c, name="hipsolverXgesvdjSetSortEig")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverXgesvdjSetSortEig_
      type(c_ptr),value :: myInfo
      integer(c_int),value :: sort_eig
    end function
  end interface

  interface hipsolverXgesvdjSetTolerance
#ifdef USE_CUDA_NAMES
    function hipsolverXgesvdjSetTolerance_(myInfo,tolerance) &
        bind(c, name="cusolverDnXgesvdjSetTolerance")
#else
    function hipsolverXgesvdjSetTolerance_(myInfo,tolerance) &
        bind(c, name="hipsolverXgesvdjSetTolerance")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverXgesvdjSetTolerance_
      type(c_ptr),value :: myInfo
      real(c_double),value :: tolerance
    end function
  end interface

  interface hipsolverXgesvdjGetResidual
#ifdef USE_CUDA_NAMES
    function hipsolverXgesvdjGetResidual_(handle,myInfo,residual) &
        bind(c, name="cusolverDnXgesvdjGetResidual")
#else
    function hipsolverXgesvdjGetResidual_(handle,myInfo,residual) &
        bind(c, name="hipsolverXgesvdjGetResidual")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverXgesvdjGetResidual_
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      real(c_double) :: residual
    end function
  end interface

  interface hipsolverXgesvdjGetSweeps
#ifdef USE_CUDA_NAMES
    function hipsolverXgesvdjGetSweeps_(handle,myInfo,executed_sweeps) &
        bind(c, name="cusolverDnXgesvdjGetSweeps")
#else
    function hipsolverXgesvdjGetSweeps_(handle,myInfo,executed_sweeps) &
        bind(c, name="hipsolverXgesvdjGetSweeps")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverXgesvdjGetSweeps_
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      integer(c_int) :: executed_sweeps
    end function
  end interface

  interface hipsolverCreateSyevjInfo
#ifdef USE_CUDA_NAMES
    function hipsolverCreateSyevjInfo_(myInfo) bind(c, name="cusolverDnCreateSyevjInfo")
#else
    function hipsolverCreateSyevjInfo_(myInfo) bind(c, name="hipsolverCreateSyevjInfo")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCreateSyevjInfo_
      type(c_ptr) :: myInfo
    end function
  end interface

  interface hipsolverDestroySyevjInfo
#ifdef USE_CUDA_NAMES
    function hipsolverDestroySyevjInfo_(myInfo) bind(c, name="cusolverDnDestroySyevjInfo")
#else
    function hipsolverDestroySyevjInfo_(myInfo) bind(c, name="hipsolverDestroySyevjInfo")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDestroySyevjInfo_
      type(c_ptr),value :: myInfo
    end function
  end interface

  interface hipsolverXsyevjSetMaxSweeps
#ifdef USE_CUDA_NAMES
    function hipsolverXsyevjSetMaxSweeps_(myInfo,max_sweeps) &
        bind(c, name="cusolverDnXsyevjSetMaxSweeps")
#else
    function hipsolverXsyevjSetMaxSweeps_(myInfo,max_sweeps) &
        bind(c, name="hipsolverXsyevjSetMaxSweeps")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverXsyevjSetMaxSweeps_
      type(c_ptr),value :: myInfo
      integer(c_int),value :: max_sweeps
    end function
  end interface

  interface hipsolverXsyevjSetSortEig
#ifdef USE_CUDA_NAMES
    function hipsolverXsyevjSetSortEig_(myInfo,sort_eig) bind(c, name="cusolverDnXsyevjSetSortEig")
#else
    function hipsolverXsyevjSetSortEig_(myInfo,sort_eig) bind(c, name="hipsolverXsyevjSetSortEig")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverXsyevjSetSortEig_
      type(c_ptr),value :: myInfo
      integer(c_int),value :: sort_eig
    end function
  end interface

  interface hipsolverXsyevjSetTolerance
#ifdef USE_CUDA_NAMES
    function hipsolverXsyevjSetTolerance_(myInfo,tolerance) &
        bind(c, name="cusolverDnXsyevjSetTolerance")
#else
    function hipsolverXsyevjSetTolerance_(myInfo,tolerance) &
        bind(c, name="hipsolverXsyevjSetTolerance")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverXsyevjSetTolerance_
      type(c_ptr),value :: myInfo
      real(c_double),value :: tolerance
    end function
  end interface

  interface hipsolverXsyevjGetResidual
#ifdef USE_CUDA_NAMES
    function hipsolverXsyevjGetResidual_(handle,myInfo,residual) &
        bind(c, name="cusolverDnXsyevjGetResidual")
#else
    function hipsolverXsyevjGetResidual_(handle,myInfo,residual) &
        bind(c, name="hipsolverXsyevjGetResidual")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverXsyevjGetResidual_
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      real(c_double) :: residual
    end function
  end interface

  interface hipsolverXsyevjGetSweeps
#ifdef USE_CUDA_NAMES
    function hipsolverXsyevjGetSweeps_(handle,myInfo,executed_sweeps) &
        bind(c, name="cusolverDnXsyevjGetSweeps")
#else
    function hipsolverXsyevjGetSweeps_(handle,myInfo,executed_sweeps) &
        bind(c, name="hipsolverXsyevjGetSweeps")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverXsyevjGetSweeps_
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      integer(c_int) :: executed_sweeps
    end function
  end interface

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverSorgbr_bufferSize_rank_0,&
      hipsolverSorgbr_bufferSize_rank_1,&
      hipsolverSorgbr_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverDorgbr_bufferSize_rank_0,&
      hipsolverDorgbr_bufferSize_rank_1,&
      hipsolverDorgbr_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverCungbr_bufferSize_rank_0,&
      hipsolverCungbr_bufferSize_rank_1,&
      hipsolverCungbr_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverZungbr_bufferSize_rank_0,&
      hipsolverZungbr_bufferSize_rank_1,&
      hipsolverZungbr_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverSorgbr_rank_0,&
      hipsolverSorgbr_rank_1,&
      hipsolverSorgbr_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverDorgbr_rank_0,&
      hipsolverDorgbr_rank_1,&
      hipsolverDorgbr_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverCungbr_rank_0,&
      hipsolverCungbr_rank_1,&
      hipsolverCungbr_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverZungbr_rank_0,&
      hipsolverZungbr_rank_1,&
      hipsolverZungbr_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverSorgqr_bufferSize_rank_0,&
      hipsolverSorgqr_bufferSize_rank_1,&
      hipsolverSorgqr_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverDorgqr_bufferSize_rank_0,&
      hipsolverDorgqr_bufferSize_rank_1,&
      hipsolverDorgqr_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverCungqr_bufferSize_rank_0,&
      hipsolverCungqr_bufferSize_rank_1,&
      hipsolverCungqr_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverZungqr_bufferSize_rank_0,&
      hipsolverZungqr_bufferSize_rank_1,&
      hipsolverZungqr_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverSorgqr_rank_0,&
      hipsolverSorgqr_rank_1,&
      hipsolverSorgqr_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverDorgqr_rank_0,&
      hipsolverDorgqr_rank_1,&
      hipsolverDorgqr_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverCungqr_rank_0,&
      hipsolverCungqr_rank_1,&
      hipsolverCungqr_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverZungqr_rank_0,&
      hipsolverZungqr_rank_1,&
      hipsolverZungqr_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverSorgtr_bufferSize_rank_0,&
      hipsolverSorgtr_bufferSize_rank_1,&
      hipsolverSorgtr_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverDorgtr_bufferSize_rank_0,&
      hipsolverDorgtr_bufferSize_rank_1,&
      hipsolverDorgtr_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverCungtr_bufferSize_rank_0,&
      hipsolverCungtr_bufferSize_rank_1,&
      hipsolverCungtr_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverZungtr_bufferSize_rank_0,&
      hipsolverZungtr_bufferSize_rank_1,&
      hipsolverZungtr_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverSorgtr_rank_0,&
      hipsolverSorgtr_rank_1,&
      hipsolverSorgtr_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverDorgtr_rank_0,&
      hipsolverDorgtr_rank_1,&
      hipsolverDorgtr_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverCungtr_rank_0,&
      hipsolverCungtr_rank_1,&
      hipsolverCungtr_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverZungtr_rank_0,&
      hipsolverZungtr_rank_1,&
      hipsolverZungtr_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverSormqr_bufferSize_rank_0,&
      hipsolverSormqr_bufferSize_rank_1,&
      hipsolverSormqr_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverDormqr_bufferSize_rank_0,&
      hipsolverDormqr_bufferSize_rank_1,&
      hipsolverDormqr_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverCunmqr_bufferSize_rank_0,&
      hipsolverCunmqr_bufferSize_rank_1,&
      hipsolverCunmqr_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverZunmqr_bufferSize_rank_0,&
      hipsolverZunmqr_bufferSize_rank_1,&
      hipsolverZunmqr_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverSormqr_rank_0,&
      hipsolverSormqr_rank_1,&
      hipsolverSormqr_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverDormqr_rank_0,&
      hipsolverDormqr_rank_1,&
      hipsolverDormqr_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverCunmqr_rank_0,&
      hipsolverCunmqr_rank_1,&
      hipsolverCunmqr_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverZunmqr_rank_0,&
      hipsolverZunmqr_rank_1,&
      hipsolverZunmqr_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverSormtr_bufferSize_rank_0,&
      hipsolverSormtr_bufferSize_rank_1,&
      hipsolverSormtr_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverDormtr_bufferSize_rank_0,&
      hipsolverDormtr_bufferSize_rank_1,&
      hipsolverDormtr_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverCunmtr_bufferSize_rank_0,&
      hipsolverCunmtr_bufferSize_rank_1,&
      hipsolverCunmtr_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverZunmtr_bufferSize_rank_0,&
      hipsolverZunmtr_bufferSize_rank_1,&
      hipsolverZunmtr_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverSormtr_rank_0,&
      hipsolverSormtr_rank_1,&
      hipsolverSormtr_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverDormtr_rank_0,&
      hipsolverDormtr_rank_1,&
      hipsolverDormtr_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverCunmtr_rank_0,&
      hipsolverCunmtr_rank_1,&
      hipsolverCunmtr_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverZunmtr_rank_0,&
      hipsolverZunmtr_rank_1,&
      hipsolverZunmtr_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverSgebrd_rank_0,&
      hipsolverSgebrd_rank_1,&
      hipsolverSgebrd_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverDgebrd_rank_0,&
      hipsolverDgebrd_rank_1,&
      hipsolverDgebrd_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverCgebrd_rank_0,&
      hipsolverCgebrd_rank_1,&
      hipsolverCgebrd_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverZgebrd_rank_0,&
      hipsolverZgebrd_rank_1,&
      hipsolverZgebrd_full_rank
#endif
  end interface
#endif

  interface hipsolverSSgels_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverSSgels_bufferSize_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,lwork) &
        bind(c, name="cusolverDnSSgels_bufferSize")
#else
    function hipsolverSSgels_bufferSize_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,lwork) &
        bind(c, name="hipsolverSSgels_bufferSize")
#endif
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
  end interface

  interface hipsolverDDgels_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDDgels_bufferSize_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,lwork) &
        bind(c, name="cusolverDnDDgels_bufferSize")
#else
    function hipsolverDDgels_bufferSize_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,lwork) &
        bind(c, name="hipsolverDDgels_bufferSize")
#endif
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
  end interface

  interface hipsolverCCgels_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverCCgels_bufferSize_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,lwork) &
        bind(c, name="cusolverDnCCgels_bufferSize")
#else
    function hipsolverCCgels_bufferSize_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,lwork) &
        bind(c, name="hipsolverCCgels_bufferSize")
#endif
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
  end interface

  interface hipsolverZZgels_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverZZgels_bufferSize_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,lwork) &
        bind(c, name="cusolverDnZZgels_bufferSize")
#else
    function hipsolverZZgels_bufferSize_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,lwork) &
        bind(c, name="hipsolverZZgels_bufferSize")
#endif
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
  end interface

  interface hipsolverSSgels
#ifdef USE_CUDA_NAMES
    function hipsolverSSgels_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="cusolverDnSSgels")
#else
    function hipsolverSSgels_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="hipsolverSSgels")
#endif
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
  end interface

  interface hipsolverDDgels
#ifdef USE_CUDA_NAMES
    function hipsolverDDgels_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="cusolverDnDDgels")
#else
    function hipsolverDDgels_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="hipsolverDDgels")
#endif
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
  end interface

  interface hipsolverCCgels
#ifdef USE_CUDA_NAMES
    function hipsolverCCgels_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="cusolverDnCCgels")
#else
    function hipsolverCCgels_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="hipsolverCCgels")
#endif
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
  end interface

  interface hipsolverZZgels
#ifdef USE_CUDA_NAMES
    function hipsolverZZgels_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="cusolverDnZZgels")
#else
    function hipsolverZZgels_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="hipsolverZZgels")
#endif
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
  end interface

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverSgeqrf_bufferSize_rank_0,&
      hipsolverSgeqrf_bufferSize_rank_1,&
      hipsolverSgeqrf_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverDgeqrf_bufferSize_rank_0,&
      hipsolverDgeqrf_bufferSize_rank_1,&
      hipsolverDgeqrf_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverCgeqrf_bufferSize_rank_0,&
      hipsolverCgeqrf_bufferSize_rank_1,&
      hipsolverCgeqrf_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverZgeqrf_bufferSize_rank_0,&
      hipsolverZgeqrf_bufferSize_rank_1,&
      hipsolverZgeqrf_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverSgeqrf_rank_0,&
      hipsolverSgeqrf_rank_1,&
      hipsolverSgeqrf_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverDgeqrf_rank_0,&
      hipsolverDgeqrf_rank_1,&
      hipsolverDgeqrf_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverCgeqrf_rank_0,&
      hipsolverCgeqrf_rank_1,&
      hipsolverCgeqrf_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverZgeqrf_rank_0,&
      hipsolverZgeqrf_rank_1,&
      hipsolverZgeqrf_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverSSgesv_bufferSize_rank_0,&
      hipsolverSSgesv_bufferSize_rank_1,&
      hipsolverSSgesv_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverDDgesv_bufferSize_rank_0,&
      hipsolverDDgesv_bufferSize_rank_1,&
      hipsolverDDgesv_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverCCgesv_bufferSize_rank_0,&
      hipsolverCCgesv_bufferSize_rank_1,&
      hipsolverCCgesv_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverZZgesv_bufferSize_rank_0,&
      hipsolverZZgesv_bufferSize_rank_1,&
      hipsolverZZgesv_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverSSgesv_rank_0,&
      hipsolverSSgesv_rank_1,&
      hipsolverSSgesv_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverDDgesv_rank_0,&
      hipsolverDDgesv_rank_1,&
      hipsolverDDgesv_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverCCgesv_rank_0,&
      hipsolverCCgesv_rank_1,&
      hipsolverCCgesv_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverZZgesv_rank_0,&
      hipsolverZZgesv_rank_1,&
      hipsolverZZgesv_full_rank
#endif
  end interface
#endif

  interface hipsolverSgesvd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverSgesvd_bufferSize_(handle,jobu,jobv,m,n,lwork) &
        bind(c, name="cusolverDnSgesvd_bufferSize")
#else
    function hipsolverSgesvd_bufferSize_(handle,jobu,jobv,m,n,lwork) &
        bind(c, name="hipsolverSgesvd_bufferSize")
#endif
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
  end interface

  interface hipsolverDgesvd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDgesvd_bufferSize_(handle,jobu,jobv,m,n,lwork) &
        bind(c, name="cusolverDnDgesvd_bufferSize")
#else
    function hipsolverDgesvd_bufferSize_(handle,jobu,jobv,m,n,lwork) &
        bind(c, name="hipsolverDgesvd_bufferSize")
#endif
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
  end interface

  interface hipsolverCgesvd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverCgesvd_bufferSize_(handle,jobu,jobv,m,n,lwork) &
        bind(c, name="cusolverDnCgesvd_bufferSize")
#else
    function hipsolverCgesvd_bufferSize_(handle,jobu,jobv,m,n,lwork) &
        bind(c, name="hipsolverCgesvd_bufferSize")
#endif
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
  end interface

  interface hipsolverZgesvd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverZgesvd_bufferSize_(handle,jobu,jobv,m,n,lwork) &
        bind(c, name="cusolverDnZgesvd_bufferSize")
#else
    function hipsolverZgesvd_bufferSize_(handle,jobu,jobv,m,n,lwork) &
        bind(c, name="hipsolverZgesvd_bufferSize")
#endif
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
  end interface

  interface hipsolverSgesvd
#ifdef USE_CUDA_NAMES
    function hipsolverSgesvd_(handle,jobu,jobv,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,rwork,devInfo) &
        bind(c, name="cusolverDnSgesvd")
#else
    function hipsolverSgesvd_(handle,jobu,jobv,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,rwork,devInfo) &
        bind(c, name="hipsolverSgesvd")
#endif
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
  end interface

  interface hipsolverDgesvd
#ifdef USE_CUDA_NAMES
    function hipsolverDgesvd_(handle,jobu,jobv,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,rwork,devInfo) &
        bind(c, name="cusolverDnDgesvd")
#else
    function hipsolverDgesvd_(handle,jobu,jobv,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,rwork,devInfo) &
        bind(c, name="hipsolverDgesvd")
#endif
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
  end interface

  interface hipsolverCgesvd
#ifdef USE_CUDA_NAMES
    function hipsolverCgesvd_(handle,jobu,jobv,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,rwork,devInfo) &
        bind(c, name="cusolverDnCgesvd")
#else
    function hipsolverCgesvd_(handle,jobu,jobv,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,rwork,devInfo) &
        bind(c, name="hipsolverCgesvd")
#endif
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
  end interface

  interface hipsolverZgesvd
#ifdef USE_CUDA_NAMES
    function hipsolverZgesvd_(handle,jobu,jobv,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,rwork,devInfo) &
        bind(c, name="cusolverDnZgesvd")
#else
    function hipsolverZgesvd_(handle,jobu,jobv,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,rwork,devInfo) &
        bind(c, name="hipsolverZgesvd")
#endif
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
  end interface

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverSgetrf_bufferSize_rank_0,&
      hipsolverSgetrf_bufferSize_rank_1,&
      hipsolverSgetrf_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverDgetrf_bufferSize_rank_0,&
      hipsolverDgetrf_bufferSize_rank_1,&
      hipsolverDgetrf_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverCgetrf_bufferSize_rank_0,&
      hipsolverCgetrf_bufferSize_rank_1,&
      hipsolverCgetrf_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverZgetrf_bufferSize_rank_0,&
      hipsolverZgetrf_bufferSize_rank_1,&
      hipsolverZgetrf_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverSgetrf_rank_0,&
      hipsolverSgetrf_rank_1,&
      hipsolverSgetrf_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverDgetrf_rank_0,&
      hipsolverDgetrf_rank_1,&
      hipsolverDgetrf_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverCgetrf_rank_0,&
      hipsolverCgetrf_rank_1,&
      hipsolverCgetrf_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverZgetrf_rank_0,&
      hipsolverZgetrf_rank_1,&
      hipsolverZgetrf_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverSgetrs_bufferSize_rank_0,&
      hipsolverSgetrs_bufferSize_rank_1,&
      hipsolverSgetrs_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverDgetrs_bufferSize_rank_0,&
      hipsolverDgetrs_bufferSize_rank_1,&
      hipsolverDgetrs_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverCgetrs_bufferSize_rank_0,&
      hipsolverCgetrs_bufferSize_rank_1,&
      hipsolverCgetrs_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverZgetrs_bufferSize_rank_0,&
      hipsolverZgetrs_bufferSize_rank_1,&
      hipsolverZgetrs_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverSgetrs_rank_0,&
      hipsolverSgetrs_rank_1,&
      hipsolverSgetrs_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverDgetrs_rank_0,&
      hipsolverDgetrs_rank_1,&
      hipsolverDgetrs_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverCgetrs_rank_0,&
      hipsolverCgetrs_rank_1,&
      hipsolverCgetrs_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverZgetrs_rank_0,&
      hipsolverZgetrs_rank_1,&
      hipsolverZgetrs_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverSpotrf_bufferSize_rank_0,&
      hipsolverSpotrf_bufferSize_rank_1,&
      hipsolverSpotrf_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverDpotrf_bufferSize_rank_0,&
      hipsolverDpotrf_bufferSize_rank_1,&
      hipsolverDpotrf_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverCpotrf_bufferSize_rank_0,&
      hipsolverCpotrf_bufferSize_rank_1,&
      hipsolverCpotrf_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverZpotrf_bufferSize_rank_0,&
      hipsolverZpotrf_bufferSize_rank_1,&
      hipsolverZpotrf_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverSpotrf_rank_0,&
      hipsolverSpotrf_rank_1,&
      hipsolverSpotrf_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverDpotrf_rank_0,&
      hipsolverDpotrf_rank_1,&
      hipsolverDpotrf_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverCpotrf_rank_0,&
      hipsolverCpotrf_rank_1,&
      hipsolverCpotrf_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverZpotrf_rank_0,&
      hipsolverZpotrf_rank_1,&
      hipsolverZpotrf_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
      integer(c_int),value :: batch_count
    end function
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
      integer(c_int),value :: batch_count
    end function
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
      integer(c_int),value :: batch_count
    end function
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int) :: lwork
      integer(c_int),value :: batch_count
    end function
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
      integer(c_int),value :: batch_count
    end function
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
      integer(c_int),value :: batch_count
    end function
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
      integer(c_int),value :: batch_count
    end function
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
      integer(c_int),value :: batch_count
    end function
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverSpotri_bufferSize_rank_0,&
      hipsolverSpotri_bufferSize_rank_1,&
      hipsolverSpotri_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverDpotri_bufferSize_rank_0,&
      hipsolverDpotri_bufferSize_rank_1,&
      hipsolverDpotri_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverCpotri_bufferSize_rank_0,&
      hipsolverCpotri_bufferSize_rank_1,&
      hipsolverCpotri_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverZpotri_bufferSize_rank_0,&
      hipsolverZpotri_bufferSize_rank_1,&
      hipsolverZpotri_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverSpotri_rank_0,&
      hipsolverSpotri_rank_1,&
      hipsolverSpotri_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverDpotri_rank_0,&
      hipsolverDpotri_rank_1,&
      hipsolverDpotri_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverCpotri_rank_0,&
      hipsolverCpotri_rank_1,&
      hipsolverCpotri_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverZpotri_rank_0,&
      hipsolverZpotri_rank_1,&
      hipsolverZpotri_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverSpotrs_bufferSize_rank_0,&
      hipsolverSpotrs_bufferSize_rank_1,&
      hipsolverSpotrs_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverDpotrs_bufferSize_rank_0,&
      hipsolverDpotrs_bufferSize_rank_1,&
      hipsolverDpotrs_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverCpotrs_bufferSize_rank_0,&
      hipsolverCpotrs_bufferSize_rank_1,&
      hipsolverCpotrs_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverZpotrs_bufferSize_rank_0,&
      hipsolverZpotrs_bufferSize_rank_1,&
      hipsolverZpotrs_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverSpotrs_rank_0,&
      hipsolverSpotrs_rank_1,&
      hipsolverSpotrs_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverDpotrs_rank_0,&
      hipsolverDpotrs_rank_1,&
      hipsolverDpotrs_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverCpotrs_rank_0,&
      hipsolverCpotrs_rank_1,&
      hipsolverCpotrs_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverZpotrs_rank_0,&
      hipsolverZpotrs_rank_1,&
      hipsolverZpotrs_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      integer(c_int) :: lwork
      integer(c_int),value :: batch_count
    end function
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      integer(c_int) :: lwork
      integer(c_int),value :: batch_count
    end function
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      integer(c_int) :: lwork
      integer(c_int),value :: batch_count
    end function
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      integer(c_int) :: lwork
      integer(c_int),value :: batch_count
    end function
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
      integer(c_int),value :: batch_count
    end function
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
      integer(c_int),value :: batch_count
    end function
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
      integer(c_int),value :: batch_count
    end function
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      integer(c_int) :: devInfo
      integer(c_int),value :: batch_count
    end function
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverSsyevd_bufferSize_rank_0,&
      hipsolverSsyevd_bufferSize_rank_1,&
      hipsolverSsyevd_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverDsyevd_bufferSize_rank_0,&
      hipsolverDsyevd_bufferSize_rank_1,&
      hipsolverDsyevd_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverCheevd_bufferSize_rank_0,&
      hipsolverCheevd_bufferSize_rank_1,&
      hipsolverCheevd_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverZheevd_bufferSize_rank_0,&
      hipsolverZheevd_bufferSize_rank_1,&
      hipsolverZheevd_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverSsyevd_rank_0,&
      hipsolverSsyevd_rank_1,&
      hipsolverSsyevd_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverDsyevd_rank_0,&
      hipsolverDsyevd_rank_1,&
      hipsolverDsyevd_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverCheevd_rank_0,&
      hipsolverCheevd_rank_1,&
      hipsolverCheevd_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverZheevd_rank_0,&
      hipsolverZheevd_rank_1,&
      hipsolverZheevd_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

  interface hipsolverDsyevdx_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDsyevdx_bufferSize_(handle,jobz,range,uplo,n,A,lda,vl,vu,il,iu,nev,W,lwork) &
        bind(c, name="cusolverDnDsyevdx_bufferSize")
#else
    function hipsolverDsyevdx_bufferSize_(handle,jobz,range,uplo,n,A,lda,vl,vu,il,iu,nev,W,lwork) &
        bind(c, name="hipsolverDsyevdx_bufferSize")
#endif
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
  end interface

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

  interface hipsolverDsyevdx
#ifdef USE_CUDA_NAMES
    function hipsolverDsyevdx_(handle,jobz,range,uplo,n,A,lda,vl,vu,il,iu,nev,W,work,lwork, &
        devInfo) &
        bind(c, name="cusolverDnDsyevdx")
#else
    function hipsolverDsyevdx_(handle,jobz,range,uplo,n,A,lda,vl,vu,il,iu,nev,W,work,lwork, &
        devInfo) &
        bind(c, name="hipsolverDsyevdx")
#endif
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
  end interface

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

  interface hipsolverDsyevjBatched
#ifdef USE_CUDA_NAMES
    function hipsolverDsyevjBatched_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo,params, &
        batch_count) &
        bind(c, name="cusolverDnDsyevjBatched")
#else
    function hipsolverDsyevjBatched_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo,params, &
        batch_count) &
        bind(c, name="hipsolverDsyevjBatched")
#endif
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
  end interface

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverSsygvd_bufferSize_rank_0,&
      hipsolverSsygvd_bufferSize_rank_1,&
      hipsolverSsygvd_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverDsygvd_bufferSize_rank_0,&
      hipsolverDsygvd_bufferSize_rank_1,&
      hipsolverDsygvd_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverChegvd_bufferSize_rank_0,&
      hipsolverChegvd_bufferSize_rank_1,&
      hipsolverChegvd_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverZhegvd_bufferSize_rank_0,&
      hipsolverZhegvd_bufferSize_rank_1,&
      hipsolverZhegvd_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverSsygvd_rank_0,&
      hipsolverSsygvd_rank_1,&
      hipsolverSsygvd_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverDsygvd_rank_0,&
      hipsolverDsygvd_rank_1,&
      hipsolverDsygvd_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverChegvd_rank_0,&
      hipsolverChegvd_rank_1,&
      hipsolverChegvd_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverZhegvd_rank_0,&
      hipsolverZhegvd_rank_1,&
      hipsolverZhegvd_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverSsytrd_bufferSize_rank_0,&
      hipsolverSsytrd_bufferSize_rank_1,&
      hipsolverSsytrd_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverDsytrd_bufferSize_rank_0,&
      hipsolverDsytrd_bufferSize_rank_1,&
      hipsolverDsytrd_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverChetrd_bufferSize_rank_0,&
      hipsolverChetrd_bufferSize_rank_1,&
      hipsolverChetrd_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverZhetrd_bufferSize_rank_0,&
      hipsolverZhetrd_bufferSize_rank_1,&
      hipsolverZhetrd_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverSsytrd_rank_0,&
      hipsolverSsytrd_rank_1,&
      hipsolverSsytrd_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverDsytrd_rank_0,&
      hipsolverDsytrd_rank_1,&
      hipsolverDsytrd_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverChetrd_rank_0,&
      hipsolverChetrd_rank_1,&
      hipsolverChetrd_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverZhetrd_rank_0,&
      hipsolverZhetrd_rank_1,&
      hipsolverZhetrd_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverSsytrf_bufferSize_rank_0,&
      hipsolverSsytrf_bufferSize_rank_1,&
      hipsolverSsytrf_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverDsytrf_bufferSize_rank_0,&
      hipsolverDsytrf_bufferSize_rank_1,&
      hipsolverDsytrf_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverCsytrf_bufferSize_rank_0,&
      hipsolverCsytrf_bufferSize_rank_1,&
      hipsolverCsytrf_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverZsytrf_bufferSize_rank_0,&
      hipsolverZsytrf_bufferSize_rank_1,&
      hipsolverZsytrf_bufferSize_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverSsytrf_rank_0,&
      hipsolverSsytrf_rank_1,&
      hipsolverSsytrf_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverDsytrf_rank_0,&
      hipsolverDsytrf_rank_1,&
      hipsolverDsytrf_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverCsytrf_rank_0,&
      hipsolverCsytrf_rank_1,&
      hipsolverCsytrf_full_rank
#endif
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
    module procedure &
      hipsolverZsytrf_rank_0,&
      hipsolverZsytrf_rank_1,&
      hipsolverZsytrf_full_rank
#endif
  end interface
#endif

  !>  \brief An alias for `hipsolverCreate`.
  interface hipsolverDnCreate
#ifdef USE_CUDA_NAMES
    function hipsolverDnCreate_(handle) bind(c, name="cusolverDnCreate")
#else
    function hipsolverDnCreate_(handle) bind(c, name="hipsolverDnCreate")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCreate_
      type(c_ptr) :: handle
    end function
  end interface

  !>  \brief An alias for `hipsolverDestroy`.
  interface hipsolverDnDestroy
#ifdef USE_CUDA_NAMES
    function hipsolverDnDestroy_(handle) bind(c, name="cusolverDnDestroy")
#else
    function hipsolverDnDestroy_(handle) bind(c, name="hipsolverDnDestroy")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDestroy_
      type(c_ptr),value :: handle
    end function
  end interface

  !>  \brief An alias for `hipsolverSetStream`.
  interface hipsolverDnSetStream
#ifdef USE_CUDA_NAMES
    function hipsolverDnSetStream_(handle,streamId) bind(c, name="cusolverDnSetStream")
#else
    function hipsolverDnSetStream_(handle,streamId) bind(c, name="hipsolverDnSetStream")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSetStream_
      type(c_ptr),value :: handle
      type(c_ptr),value :: streamId
    end function
  end interface

  !>  \brief An alias for `hipsolverGetStream`.
  interface hipsolverDnGetStream
#ifdef USE_CUDA_NAMES
    function hipsolverDnGetStream_(handle,streamId) bind(c, name="cusolverDnGetStream")
#else
    function hipsolverDnGetStream_(handle,streamId) bind(c, name="hipsolverDnGetStream")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnGetStream_
      type(c_ptr),value :: handle
      type(c_ptr) :: streamId
    end function
  end interface

  !>  \brief An alias for `hipsolverSetDeterministicMode`.
  interface hipsolverDnSetDeterministicMode
#ifdef USE_CUDA_NAMES
    function hipsolverDnSetDeterministicMode_(handle,mode) &
        bind(c, name="cusolverDnSetDeterministicMode")
#else
    function hipsolverDnSetDeterministicMode_(handle,mode) &
        bind(c, name="hipsolverDnSetDeterministicMode")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSetDeterministicMode_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_DETERMINISTIC_RESULTS)),value :: mode
    end function
  end interface

  !>  \brief An alias for `hipsolverGetDeterministicMode`.
  interface hipsolverDnGetDeterministicMode
#ifdef USE_CUDA_NAMES
    function hipsolverDnGetDeterministicMode_(handle,mode) &
        bind(c, name="cusolverDnGetDeterministicMode")
#else
    function hipsolverDnGetDeterministicMode_(handle,mode) &
        bind(c, name="hipsolverDnGetDeterministicMode")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnGetDeterministicMode_
      type(c_ptr),value :: handle
      type(c_ptr),value :: mode
    end function
  end interface

  interface hipsolverDnCreateGesvdjInfo
#ifdef USE_CUDA_NAMES
    function hipsolverDnCreateGesvdjInfo_(myInfo) bind(c, name="cusolverDnCreateGesvdjInfo")
#else
    function hipsolverDnCreateGesvdjInfo_(myInfo) bind(c, name="hipsolverDnCreateGesvdjInfo")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCreateGesvdjInfo_
      type(c_ptr) :: myInfo
    end function
  end interface

  interface hipsolverDnDestroyGesvdjInfo
#ifdef USE_CUDA_NAMES
    function hipsolverDnDestroyGesvdjInfo_(myInfo) bind(c, name="cusolverDnDestroyGesvdjInfo")
#else
    function hipsolverDnDestroyGesvdjInfo_(myInfo) bind(c, name="hipsolverDnDestroyGesvdjInfo")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDestroyGesvdjInfo_
      type(c_ptr),value :: myInfo
    end function
  end interface

  interface hipsolverDnXgesvdjSetMaxSweeps
#ifdef USE_CUDA_NAMES
    function hipsolverDnXgesvdjSetMaxSweeps_(myInfo,max_sweeps) &
        bind(c, name="cusolverDnXgesvdjSetMaxSweeps")
#else
    function hipsolverDnXgesvdjSetMaxSweeps_(myInfo,max_sweeps) &
        bind(c, name="hipsolverDnXgesvdjSetMaxSweeps")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnXgesvdjSetMaxSweeps_
      type(c_ptr),value :: myInfo
      integer(c_int),value :: max_sweeps
    end function
  end interface

  interface hipsolverDnXgesvdjSetSortEig
#ifdef USE_CUDA_NAMES
    function hipsolverDnXgesvdjSetSortEig_(myInfo,sort_eig) &
        bind(c, name="cusolverDnXgesvdjSetSortEig")
#else
    function hipsolverDnXgesvdjSetSortEig_(myInfo,sort_eig) &
        bind(c, name="hipsolverDnXgesvdjSetSortEig")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnXgesvdjSetSortEig_
      type(c_ptr),value :: myInfo
      integer(c_int),value :: sort_eig
    end function
  end interface

  interface hipsolverDnXgesvdjSetTolerance
#ifdef USE_CUDA_NAMES
    function hipsolverDnXgesvdjSetTolerance_(myInfo,tolerance) &
        bind(c, name="cusolverDnXgesvdjSetTolerance")
#else
    function hipsolverDnXgesvdjSetTolerance_(myInfo,tolerance) &
        bind(c, name="hipsolverDnXgesvdjSetTolerance")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnXgesvdjSetTolerance_
      type(c_ptr),value :: myInfo
      real(c_double),value :: tolerance
    end function
  end interface

  interface hipsolverDnXgesvdjGetResidual
#ifdef USE_CUDA_NAMES
    function hipsolverDnXgesvdjGetResidual_(handle,myInfo,residual) &
        bind(c, name="cusolverDnXgesvdjGetResidual")
#else
    function hipsolverDnXgesvdjGetResidual_(handle,myInfo,residual) &
        bind(c, name="hipsolverDnXgesvdjGetResidual")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnXgesvdjGetResidual_
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      real(c_double) :: residual
    end function
  end interface

  interface hipsolverDnXgesvdjGetSweeps
#ifdef USE_CUDA_NAMES
    function hipsolverDnXgesvdjGetSweeps_(handle,myInfo,executed_sweeps) &
        bind(c, name="cusolverDnXgesvdjGetSweeps")
#else
    function hipsolverDnXgesvdjGetSweeps_(handle,myInfo,executed_sweeps) &
        bind(c, name="hipsolverDnXgesvdjGetSweeps")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnXgesvdjGetSweeps_
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      integer(c_int) :: executed_sweeps
    end function
  end interface

  interface hipsolverDnCreateSyevjInfo
#ifdef USE_CUDA_NAMES
    function hipsolverDnCreateSyevjInfo_(myInfo) bind(c, name="cusolverDnCreateSyevjInfo")
#else
    function hipsolverDnCreateSyevjInfo_(myInfo) bind(c, name="hipsolverDnCreateSyevjInfo")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCreateSyevjInfo_
      type(c_ptr) :: myInfo
    end function
  end interface

  interface hipsolverDnDestroySyevjInfo
#ifdef USE_CUDA_NAMES
    function hipsolverDnDestroySyevjInfo_(myInfo) bind(c, name="cusolverDnDestroySyevjInfo")
#else
    function hipsolverDnDestroySyevjInfo_(myInfo) bind(c, name="hipsolverDnDestroySyevjInfo")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDestroySyevjInfo_
      type(c_ptr),value :: myInfo
    end function
  end interface

  interface hipsolverDnXsyevjSetMaxSweeps
#ifdef USE_CUDA_NAMES
    function hipsolverDnXsyevjSetMaxSweeps_(myInfo,max_sweeps) &
        bind(c, name="cusolverDnXsyevjSetMaxSweeps")
#else
    function hipsolverDnXsyevjSetMaxSweeps_(myInfo,max_sweeps) &
        bind(c, name="hipsolverDnXsyevjSetMaxSweeps")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnXsyevjSetMaxSweeps_
      type(c_ptr),value :: myInfo
      integer(c_int),value :: max_sweeps
    end function
  end interface

  interface hipsolverDnXsyevjSetSortEig
#ifdef USE_CUDA_NAMES
    function hipsolverDnXsyevjSetSortEig_(myInfo,sort_eig) &
        bind(c, name="cusolverDnXsyevjSetSortEig")
#else
    function hipsolverDnXsyevjSetSortEig_(myInfo,sort_eig) &
        bind(c, name="hipsolverDnXsyevjSetSortEig")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnXsyevjSetSortEig_
      type(c_ptr),value :: myInfo
      integer(c_int),value :: sort_eig
    end function
  end interface

  interface hipsolverDnXsyevjSetTolerance
#ifdef USE_CUDA_NAMES
    function hipsolverDnXsyevjSetTolerance_(myInfo,tolerance) &
        bind(c, name="cusolverDnXsyevjSetTolerance")
#else
    function hipsolverDnXsyevjSetTolerance_(myInfo,tolerance) &
        bind(c, name="hipsolverDnXsyevjSetTolerance")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnXsyevjSetTolerance_
      type(c_ptr),value :: myInfo
      real(c_double),value :: tolerance
    end function
  end interface

  interface hipsolverDnXsyevjGetResidual
#ifdef USE_CUDA_NAMES
    function hipsolverDnXsyevjGetResidual_(handle,myInfo,residual) &
        bind(c, name="cusolverDnXsyevjGetResidual")
#else
    function hipsolverDnXsyevjGetResidual_(handle,myInfo,residual) &
        bind(c, name="hipsolverDnXsyevjGetResidual")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnXsyevjGetResidual_
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      real(c_double) :: residual
    end function
  end interface

  interface hipsolverDnXsyevjGetSweeps
#ifdef USE_CUDA_NAMES
    function hipsolverDnXsyevjGetSweeps_(handle,myInfo,executed_sweeps) &
        bind(c, name="cusolverDnXsyevjGetSweeps")
#else
    function hipsolverDnXsyevjGetSweeps_(handle,myInfo,executed_sweeps) &
        bind(c, name="hipsolverDnXsyevjGetSweeps")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnXsyevjGetSweeps_
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      integer(c_int) :: executed_sweeps
    end function
  end interface

  interface hipsolverDnSorgbr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnSorgbr_bufferSize_(handle,side,m,n,k,A,lda,tau,lwork) &
        bind(c, name="cusolverDnSorgbr_bufferSize")
#else
    function hipsolverDnSorgbr_bufferSize_(handle,side,m,n,k,A,lda,tau,lwork) &
        bind(c, name="hipsolverDnSorgbr_bufferSize")
#endif
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
  end interface

  interface hipsolverDnDorgbr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnDorgbr_bufferSize_(handle,side,m,n,k,A,lda,tau,lwork) &
        bind(c, name="cusolverDnDorgbr_bufferSize")
#else
    function hipsolverDnDorgbr_bufferSize_(handle,side,m,n,k,A,lda,tau,lwork) &
        bind(c, name="hipsolverDnDorgbr_bufferSize")
#endif
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
  end interface

  interface hipsolverDnCungbr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnCungbr_bufferSize_(handle,side,m,n,k,A,lda,tau,lwork) &
        bind(c, name="cusolverDnCungbr_bufferSize")
#else
    function hipsolverDnCungbr_bufferSize_(handle,side,m,n,k,A,lda,tau,lwork) &
        bind(c, name="hipsolverDnCungbr_bufferSize")
#endif
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
  end interface

  interface hipsolverDnZungbr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnZungbr_bufferSize_(handle,side,m,n,k,A,lda,tau,lwork) &
        bind(c, name="cusolverDnZungbr_bufferSize")
#else
    function hipsolverDnZungbr_bufferSize_(handle,side,m,n,k,A,lda,tau,lwork) &
        bind(c, name="hipsolverDnZungbr_bufferSize")
#endif
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
  end interface

  interface hipsolverDnSorgbr
#ifdef USE_CUDA_NAMES
    function hipsolverDnSorgbr_(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="cusolverDnSorgbr")
#else
    function hipsolverDnSorgbr_(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnSorgbr")
#endif
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
  end interface

  interface hipsolverDnDorgbr
#ifdef USE_CUDA_NAMES
    function hipsolverDnDorgbr_(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="cusolverDnDorgbr")
#else
    function hipsolverDnDorgbr_(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnDorgbr")
#endif
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
  end interface

  interface hipsolverDnCungbr
#ifdef USE_CUDA_NAMES
    function hipsolverDnCungbr_(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="cusolverDnCungbr")
#else
    function hipsolverDnCungbr_(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnCungbr")
#endif
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
  end interface

  interface hipsolverDnZungbr
#ifdef USE_CUDA_NAMES
    function hipsolverDnZungbr_(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="cusolverDnZungbr")
#else
    function hipsolverDnZungbr_(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnZungbr")
#endif
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
  end interface

  interface hipsolverDnSorgqr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnSorgqr_bufferSize_(handle,m,n,k,A,lda,tau,lwork) &
        bind(c, name="cusolverDnSorgqr_bufferSize")
#else
    function hipsolverDnSorgqr_bufferSize_(handle,m,n,k,A,lda,tau,lwork) &
        bind(c, name="hipsolverDnSorgqr_bufferSize")
#endif
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
  end interface

  interface hipsolverDnDorgqr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnDorgqr_bufferSize_(handle,m,n,k,A,lda,tau,lwork) &
        bind(c, name="cusolverDnDorgqr_bufferSize")
#else
    function hipsolverDnDorgqr_bufferSize_(handle,m,n,k,A,lda,tau,lwork) &
        bind(c, name="hipsolverDnDorgqr_bufferSize")
#endif
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
  end interface

  interface hipsolverDnCungqr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnCungqr_bufferSize_(handle,m,n,k,A,lda,tau,lwork) &
        bind(c, name="cusolverDnCungqr_bufferSize")
#else
    function hipsolverDnCungqr_bufferSize_(handle,m,n,k,A,lda,tau,lwork) &
        bind(c, name="hipsolverDnCungqr_bufferSize")
#endif
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
  end interface

  interface hipsolverDnZungqr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnZungqr_bufferSize_(handle,m,n,k,A,lda,tau,lwork) &
        bind(c, name="cusolverDnZungqr_bufferSize")
#else
    function hipsolverDnZungqr_bufferSize_(handle,m,n,k,A,lda,tau,lwork) &
        bind(c, name="hipsolverDnZungqr_bufferSize")
#endif
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
  end interface

  interface hipsolverDnSorgqr
#ifdef USE_CUDA_NAMES
    function hipsolverDnSorgqr_(handle,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="cusolverDnSorgqr")
#else
    function hipsolverDnSorgqr_(handle,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnSorgqr")
#endif
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
  end interface

  interface hipsolverDnDorgqr
#ifdef USE_CUDA_NAMES
    function hipsolverDnDorgqr_(handle,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="cusolverDnDorgqr")
#else
    function hipsolverDnDorgqr_(handle,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnDorgqr")
#endif
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
  end interface

  interface hipsolverDnCungqr
#ifdef USE_CUDA_NAMES
    function hipsolverDnCungqr_(handle,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="cusolverDnCungqr")
#else
    function hipsolverDnCungqr_(handle,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnCungqr")
#endif
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
  end interface

  interface hipsolverDnZungqr
#ifdef USE_CUDA_NAMES
    function hipsolverDnZungqr_(handle,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="cusolverDnZungqr")
#else
    function hipsolverDnZungqr_(handle,m,n,k,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnZungqr")
#endif
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
  end interface

  interface hipsolverDnSorgtr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnSorgtr_bufferSize_(handle,uplo,n,A,lda,tau,lwork) &
        bind(c, name="cusolverDnSorgtr_bufferSize")
#else
    function hipsolverDnSorgtr_bufferSize_(handle,uplo,n,A,lda,tau,lwork) &
        bind(c, name="hipsolverDnSorgtr_bufferSize")
#endif
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
  end interface

  interface hipsolverDnDorgtr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnDorgtr_bufferSize_(handle,uplo,n,A,lda,tau,lwork) &
        bind(c, name="cusolverDnDorgtr_bufferSize")
#else
    function hipsolverDnDorgtr_bufferSize_(handle,uplo,n,A,lda,tau,lwork) &
        bind(c, name="hipsolverDnDorgtr_bufferSize")
#endif
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
  end interface

  interface hipsolverDnCungtr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnCungtr_bufferSize_(handle,uplo,n,A,lda,tau,lwork) &
        bind(c, name="cusolverDnCungtr_bufferSize")
#else
    function hipsolverDnCungtr_bufferSize_(handle,uplo,n,A,lda,tau,lwork) &
        bind(c, name="hipsolverDnCungtr_bufferSize")
#endif
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
  end interface

  interface hipsolverDnZungtr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnZungtr_bufferSize_(handle,uplo,n,A,lda,tau,lwork) &
        bind(c, name="cusolverDnZungtr_bufferSize")
#else
    function hipsolverDnZungtr_bufferSize_(handle,uplo,n,A,lda,tau,lwork) &
        bind(c, name="hipsolverDnZungtr_bufferSize")
#endif
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
  end interface

  interface hipsolverDnSorgtr
#ifdef USE_CUDA_NAMES
    function hipsolverDnSorgtr_(handle,uplo,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="cusolverDnSorgtr")
#else
    function hipsolverDnSorgtr_(handle,uplo,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnSorgtr")
#endif
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
  end interface

  interface hipsolverDnDorgtr
#ifdef USE_CUDA_NAMES
    function hipsolverDnDorgtr_(handle,uplo,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="cusolverDnDorgtr")
#else
    function hipsolverDnDorgtr_(handle,uplo,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnDorgtr")
#endif
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
  end interface

  interface hipsolverDnCungtr
#ifdef USE_CUDA_NAMES
    function hipsolverDnCungtr_(handle,uplo,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="cusolverDnCungtr")
#else
    function hipsolverDnCungtr_(handle,uplo,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnCungtr")
#endif
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
  end interface

  interface hipsolverDnZungtr
#ifdef USE_CUDA_NAMES
    function hipsolverDnZungtr_(handle,uplo,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="cusolverDnZungtr")
#else
    function hipsolverDnZungtr_(handle,uplo,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnZungtr")
#endif
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
  end interface

  interface hipsolverDnSormqr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnSormqr_bufferSize_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork) &
        bind(c, name="cusolverDnSormqr_bufferSize")
#else
    function hipsolverDnSormqr_bufferSize_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork) &
        bind(c, name="hipsolverDnSormqr_bufferSize")
#endif
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
  end interface

  interface hipsolverDnDormqr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnDormqr_bufferSize_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork) &
        bind(c, name="cusolverDnDormqr_bufferSize")
#else
    function hipsolverDnDormqr_bufferSize_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork) &
        bind(c, name="hipsolverDnDormqr_bufferSize")
#endif
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
  end interface

  interface hipsolverDnCunmqr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnCunmqr_bufferSize_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork) &
        bind(c, name="cusolverDnCunmqr_bufferSize")
#else
    function hipsolverDnCunmqr_bufferSize_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork) &
        bind(c, name="hipsolverDnCunmqr_bufferSize")
#endif
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
  end interface

  interface hipsolverDnZunmqr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnZunmqr_bufferSize_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork) &
        bind(c, name="cusolverDnZunmqr_bufferSize")
#else
    function hipsolverDnZunmqr_bufferSize_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork) &
        bind(c, name="hipsolverDnZunmqr_bufferSize")
#endif
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
  end interface

  interface hipsolverDnSormqr
#ifdef USE_CUDA_NAMES
    function hipsolverDnSormqr_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="cusolverDnSormqr")
#else
    function hipsolverDnSormqr_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="hipsolverDnSormqr")
#endif
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
  end interface

  interface hipsolverDnDormqr
#ifdef USE_CUDA_NAMES
    function hipsolverDnDormqr_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="cusolverDnDormqr")
#else
    function hipsolverDnDormqr_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="hipsolverDnDormqr")
#endif
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
  end interface

  interface hipsolverDnCunmqr
#ifdef USE_CUDA_NAMES
    function hipsolverDnCunmqr_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="cusolverDnCunmqr")
#else
    function hipsolverDnCunmqr_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="hipsolverDnCunmqr")
#endif
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
  end interface

  interface hipsolverDnZunmqr
#ifdef USE_CUDA_NAMES
    function hipsolverDnZunmqr_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="cusolverDnZunmqr")
#else
    function hipsolverDnZunmqr_(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="hipsolverDnZunmqr")
#endif
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
  end interface

  interface hipsolverDnSormtr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnSormtr_bufferSize_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork) &
        bind(c, name="cusolverDnSormtr_bufferSize")
#else
    function hipsolverDnSormtr_bufferSize_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork) &
        bind(c, name="hipsolverDnSormtr_bufferSize")
#endif
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
  end interface

  interface hipsolverDnDormtr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnDormtr_bufferSize_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork) &
        bind(c, name="cusolverDnDormtr_bufferSize")
#else
    function hipsolverDnDormtr_bufferSize_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork) &
        bind(c, name="hipsolverDnDormtr_bufferSize")
#endif
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
  end interface

  interface hipsolverDnCunmtr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnCunmtr_bufferSize_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork) &
        bind(c, name="cusolverDnCunmtr_bufferSize")
#else
    function hipsolverDnCunmtr_bufferSize_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork) &
        bind(c, name="hipsolverDnCunmtr_bufferSize")
#endif
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
  end interface

  interface hipsolverDnZunmtr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnZunmtr_bufferSize_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork) &
        bind(c, name="cusolverDnZunmtr_bufferSize")
#else
    function hipsolverDnZunmtr_bufferSize_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork) &
        bind(c, name="hipsolverDnZunmtr_bufferSize")
#endif
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
  end interface

  interface hipsolverDnSormtr
#ifdef USE_CUDA_NAMES
    function hipsolverDnSormtr_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="cusolverDnSormtr")
#else
    function hipsolverDnSormtr_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="hipsolverDnSormtr")
#endif
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
  end interface

  interface hipsolverDnDormtr
#ifdef USE_CUDA_NAMES
    function hipsolverDnDormtr_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="cusolverDnDormtr")
#else
    function hipsolverDnDormtr_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="hipsolverDnDormtr")
#endif
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
  end interface

  interface hipsolverDnCunmtr
#ifdef USE_CUDA_NAMES
    function hipsolverDnCunmtr_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="cusolverDnCunmtr")
#else
    function hipsolverDnCunmtr_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="hipsolverDnCunmtr")
#endif
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
  end interface

  interface hipsolverDnZunmtr
#ifdef USE_CUDA_NAMES
    function hipsolverDnZunmtr_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="cusolverDnZunmtr")
#else
    function hipsolverDnZunmtr_(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo) &
        bind(c, name="hipsolverDnZunmtr")
#endif
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
  end interface

  interface hipsolverDnSgebrd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnSgebrd_bufferSize_(handle,m,n,lwork) &
        bind(c, name="cusolverDnSgebrd_bufferSize")
#else
    function hipsolverDnSgebrd_bufferSize_(handle,m,n,lwork) &
        bind(c, name="hipsolverDnSgebrd_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSgebrd_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverDnDgebrd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnDgebrd_bufferSize_(handle,m,n,lwork) &
        bind(c, name="cusolverDnDgebrd_bufferSize")
#else
    function hipsolverDnDgebrd_bufferSize_(handle,m,n,lwork) &
        bind(c, name="hipsolverDnDgebrd_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDgebrd_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverDnCgebrd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnCgebrd_bufferSize_(handle,m,n,lwork) &
        bind(c, name="cusolverDnCgebrd_bufferSize")
#else
    function hipsolverDnCgebrd_bufferSize_(handle,m,n,lwork) &
        bind(c, name="hipsolverDnCgebrd_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCgebrd_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverDnZgebrd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnZgebrd_bufferSize_(handle,m,n,lwork) &
        bind(c, name="cusolverDnZgebrd_bufferSize")
#else
    function hipsolverDnZgebrd_bufferSize_(handle,m,n,lwork) &
        bind(c, name="hipsolverDnZgebrd_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZgebrd_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverDnSgebrd
#ifdef USE_CUDA_NAMES
    function hipsolverDnSgebrd_(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo) &
        bind(c, name="cusolverDnSgebrd")
#else
    function hipsolverDnSgebrd_(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo) &
        bind(c, name="hipsolverDnSgebrd")
#endif
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
  end interface

  interface hipsolverDnDgebrd
#ifdef USE_CUDA_NAMES
    function hipsolverDnDgebrd_(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo) &
        bind(c, name="cusolverDnDgebrd")
#else
    function hipsolverDnDgebrd_(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo) &
        bind(c, name="hipsolverDnDgebrd")
#endif
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
  end interface

  interface hipsolverDnCgebrd
#ifdef USE_CUDA_NAMES
    function hipsolverDnCgebrd_(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo) &
        bind(c, name="cusolverDnCgebrd")
#else
    function hipsolverDnCgebrd_(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo) &
        bind(c, name="hipsolverDnCgebrd")
#endif
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
  end interface

  interface hipsolverDnZgebrd
#ifdef USE_CUDA_NAMES
    function hipsolverDnZgebrd_(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo) &
        bind(c, name="cusolverDnZgebrd")
#else
    function hipsolverDnZgebrd_(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo) &
        bind(c, name="hipsolverDnZgebrd")
#endif
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
  end interface

  interface hipsolverDnSSgels_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnSSgels_bufferSize_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,work,lwork) &
        bind(c, name="cusolverDnSSgels_bufferSize")
#else
    function hipsolverDnSSgels_bufferSize_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,work,lwork) &
        bind(c, name="hipsolverDnSSgels_bufferSize")
#endif
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
  end interface

  interface hipsolverDnDDgels_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnDDgels_bufferSize_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,work,lwork) &
        bind(c, name="cusolverDnDDgels_bufferSize")
#else
    function hipsolverDnDDgels_bufferSize_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,work,lwork) &
        bind(c, name="hipsolverDnDDgels_bufferSize")
#endif
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
  end interface

  interface hipsolverDnCCgels_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnCCgels_bufferSize_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,work,lwork) &
        bind(c, name="cusolverDnCCgels_bufferSize")
#else
    function hipsolverDnCCgels_bufferSize_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,work,lwork) &
        bind(c, name="hipsolverDnCCgels_bufferSize")
#endif
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
  end interface

  interface hipsolverDnZZgels_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnZZgels_bufferSize_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,work,lwork) &
        bind(c, name="cusolverDnZZgels_bufferSize")
#else
    function hipsolverDnZZgels_bufferSize_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,work,lwork) &
        bind(c, name="hipsolverDnZZgels_bufferSize")
#endif
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
  end interface

  interface hipsolverDnSSgels
#ifdef USE_CUDA_NAMES
    function hipsolverDnSSgels_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="cusolverDnSSgels")
#else
    function hipsolverDnSSgels_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="hipsolverDnSSgels")
#endif
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
  end interface

  interface hipsolverDnDDgels
#ifdef USE_CUDA_NAMES
    function hipsolverDnDDgels_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="cusolverDnDDgels")
#else
    function hipsolverDnDDgels_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="hipsolverDnDDgels")
#endif
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
  end interface

  interface hipsolverDnCCgels
#ifdef USE_CUDA_NAMES
    function hipsolverDnCCgels_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="cusolverDnCCgels")
#else
    function hipsolverDnCCgels_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="hipsolverDnCCgels")
#endif
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
  end interface

  interface hipsolverDnZZgels
#ifdef USE_CUDA_NAMES
    function hipsolverDnZZgels_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="cusolverDnZZgels")
#else
    function hipsolverDnZZgels_(handle,m,n,nrhs,A,lda,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="hipsolverDnZZgels")
#endif
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
  end interface

  interface hipsolverDnSgeqrf_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnSgeqrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="cusolverDnSgeqrf_bufferSize")
#else
    function hipsolverDnSgeqrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="hipsolverDnSgeqrf_bufferSize")
#endif
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
  end interface

  interface hipsolverDnDgeqrf_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnDgeqrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="cusolverDnDgeqrf_bufferSize")
#else
    function hipsolverDnDgeqrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="hipsolverDnDgeqrf_bufferSize")
#endif
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
  end interface

  interface hipsolverDnCgeqrf_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnCgeqrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="cusolverDnCgeqrf_bufferSize")
#else
    function hipsolverDnCgeqrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="hipsolverDnCgeqrf_bufferSize")
#endif
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
  end interface

  interface hipsolverDnZgeqrf_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnZgeqrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="cusolverDnZgeqrf_bufferSize")
#else
    function hipsolverDnZgeqrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="hipsolverDnZgeqrf_bufferSize")
#endif
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
  end interface

  interface hipsolverDnSgeqrf
#ifdef USE_CUDA_NAMES
    function hipsolverDnSgeqrf_(handle,m,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="cusolverDnSgeqrf")
#else
    function hipsolverDnSgeqrf_(handle,m,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnSgeqrf")
#endif
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
  end interface

  interface hipsolverDnDgeqrf
#ifdef USE_CUDA_NAMES
    function hipsolverDnDgeqrf_(handle,m,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="cusolverDnDgeqrf")
#else
    function hipsolverDnDgeqrf_(handle,m,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnDgeqrf")
#endif
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
  end interface

  interface hipsolverDnCgeqrf
#ifdef USE_CUDA_NAMES
    function hipsolverDnCgeqrf_(handle,m,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="cusolverDnCgeqrf")
#else
    function hipsolverDnCgeqrf_(handle,m,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnCgeqrf")
#endif
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
  end interface

  interface hipsolverDnZgeqrf
#ifdef USE_CUDA_NAMES
    function hipsolverDnZgeqrf_(handle,m,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="cusolverDnZgeqrf")
#else
    function hipsolverDnZgeqrf_(handle,m,n,A,lda,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnZgeqrf")
#endif
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
  end interface

  interface hipsolverDnSSgesv_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnSSgesv_bufferSize_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork) &
        bind(c, name="cusolverDnSSgesv_bufferSize")
#else
    function hipsolverDnSSgesv_bufferSize_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork) &
        bind(c, name="hipsolverDnSSgesv_bufferSize")
#endif
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
  end interface

  interface hipsolverDnDDgesv_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnDDgesv_bufferSize_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork) &
        bind(c, name="cusolverDnDDgesv_bufferSize")
#else
    function hipsolverDnDDgesv_bufferSize_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork) &
        bind(c, name="hipsolverDnDDgesv_bufferSize")
#endif
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
  end interface

  interface hipsolverDnCCgesv_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnCCgesv_bufferSize_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork) &
        bind(c, name="cusolverDnCCgesv_bufferSize")
#else
    function hipsolverDnCCgesv_bufferSize_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork) &
        bind(c, name="hipsolverDnCCgesv_bufferSize")
#endif
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
  end interface

  interface hipsolverDnZZgesv_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnZZgesv_bufferSize_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork) &
        bind(c, name="cusolverDnZZgesv_bufferSize")
#else
    function hipsolverDnZZgesv_bufferSize_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork) &
        bind(c, name="hipsolverDnZZgesv_bufferSize")
#endif
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
  end interface

  interface hipsolverDnSSgesv
#ifdef USE_CUDA_NAMES
    function hipsolverDnSSgesv_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="cusolverDnSSgesv")
#else
    function hipsolverDnSSgesv_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="hipsolverDnSSgesv")
#endif
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
  end interface

  interface hipsolverDnDDgesv
#ifdef USE_CUDA_NAMES
    function hipsolverDnDDgesv_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="cusolverDnDDgesv")
#else
    function hipsolverDnDDgesv_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="hipsolverDnDDgesv")
#endif
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
  end interface

  interface hipsolverDnCCgesv
#ifdef USE_CUDA_NAMES
    function hipsolverDnCCgesv_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="cusolverDnCCgesv")
#else
    function hipsolverDnCCgesv_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="hipsolverDnCCgesv")
#endif
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
  end interface

  interface hipsolverDnZZgesv
#ifdef USE_CUDA_NAMES
    function hipsolverDnZZgesv_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="cusolverDnZZgesv")
#else
    function hipsolverDnZZgesv_(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters,devInfo) &
        bind(c, name="hipsolverDnZZgesv")
#endif
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
  end interface

  interface hipsolverDnSgesvd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnSgesvd_bufferSize_(handle,m,n,lwork) &
        bind(c, name="cusolverDnSgesvd_bufferSize")
#else
    function hipsolverDnSgesvd_bufferSize_(handle,m,n,lwork) &
        bind(c, name="hipsolverDnSgesvd_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSgesvd_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverDnDgesvd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnDgesvd_bufferSize_(handle,m,n,lwork) &
        bind(c, name="cusolverDnDgesvd_bufferSize")
#else
    function hipsolverDnDgesvd_bufferSize_(handle,m,n,lwork) &
        bind(c, name="hipsolverDnDgesvd_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDgesvd_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverDnCgesvd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnCgesvd_bufferSize_(handle,m,n,lwork) &
        bind(c, name="cusolverDnCgesvd_bufferSize")
#else
    function hipsolverDnCgesvd_bufferSize_(handle,m,n,lwork) &
        bind(c, name="hipsolverDnCgesvd_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCgesvd_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverDnZgesvd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnZgesvd_bufferSize_(handle,m,n,lwork) &
        bind(c, name="cusolverDnZgesvd_bufferSize")
#else
    function hipsolverDnZgesvd_bufferSize_(handle,m,n,lwork) &
        bind(c, name="hipsolverDnZgesvd_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZgesvd_bufferSize_
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int) :: lwork
    end function
  end interface

  interface hipsolverDnSgesvd
#ifdef USE_CUDA_NAMES
    function hipsolverDnSgesvd_(handle,jobu,jobv,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,rwork,devInfo) &
        bind(c, name="cusolverDnSgesvd")
#else
    function hipsolverDnSgesvd_(handle,jobu,jobv,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,rwork,devInfo) &
        bind(c, name="hipsolverDnSgesvd")
#endif
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
  end interface

  interface hipsolverDnDgesvd
#ifdef USE_CUDA_NAMES
    function hipsolverDnDgesvd_(handle,jobu,jobv,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,rwork,devInfo) &
        bind(c, name="cusolverDnDgesvd")
#else
    function hipsolverDnDgesvd_(handle,jobu,jobv,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,rwork,devInfo) &
        bind(c, name="hipsolverDnDgesvd")
#endif
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
  end interface

  interface hipsolverDnCgesvd
#ifdef USE_CUDA_NAMES
    function hipsolverDnCgesvd_(handle,jobu,jobv,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,rwork,devInfo) &
        bind(c, name="cusolverDnCgesvd")
#else
    function hipsolverDnCgesvd_(handle,jobu,jobv,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,rwork,devInfo) &
        bind(c, name="hipsolverDnCgesvd")
#endif
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
  end interface

  interface hipsolverDnZgesvd
#ifdef USE_CUDA_NAMES
    function hipsolverDnZgesvd_(handle,jobu,jobv,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,rwork,devInfo) &
        bind(c, name="cusolverDnZgesvd")
#else
    function hipsolverDnZgesvd_(handle,jobu,jobv,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,rwork,devInfo) &
        bind(c, name="hipsolverDnZgesvd")
#endif
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
  end interface

  interface hipsolverDnSgesvdj_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnSgesvdj_bufferSize_(handle,jobz,econ,m,n,A,lda,S,U,ldu,V,ldv,lwork,params) &
        bind(c, name="cusolverDnSgesvdj_bufferSize")
#else
    function hipsolverDnSgesvdj_bufferSize_(handle,jobz,econ,m,n,A,lda,S,U,ldu,V,ldv,lwork,params) &
        bind(c, name="hipsolverDnSgesvdj_bufferSize")
#endif
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
  end interface

  interface hipsolverDnDgesvdj_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnDgesvdj_bufferSize_(handle,jobz,econ,m,n,A,lda,S,U,ldu,V,ldv,lwork,params) &
        bind(c, name="cusolverDnDgesvdj_bufferSize")
#else
    function hipsolverDnDgesvdj_bufferSize_(handle,jobz,econ,m,n,A,lda,S,U,ldu,V,ldv,lwork,params) &
        bind(c, name="hipsolverDnDgesvdj_bufferSize")
#endif
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
  end interface

  interface hipsolverDnCgesvdj_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnCgesvdj_bufferSize_(handle,jobz,econ,m,n,A,lda,S,U,ldu,V,ldv,lwork,params) &
        bind(c, name="cusolverDnCgesvdj_bufferSize")
#else
    function hipsolverDnCgesvdj_bufferSize_(handle,jobz,econ,m,n,A,lda,S,U,ldu,V,ldv,lwork,params) &
        bind(c, name="hipsolverDnCgesvdj_bufferSize")
#endif
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
  end interface

  interface hipsolverDnZgesvdj_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnZgesvdj_bufferSize_(handle,jobz,econ,m,n,A,lda,S,U,ldu,V,ldv,lwork,params) &
        bind(c, name="cusolverDnZgesvdj_bufferSize")
#else
    function hipsolverDnZgesvdj_bufferSize_(handle,jobz,econ,m,n,A,lda,S,U,ldu,V,ldv,lwork,params) &
        bind(c, name="hipsolverDnZgesvdj_bufferSize")
#endif
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
  end interface

  interface hipsolverDnSgesvdj
#ifdef USE_CUDA_NAMES
    function hipsolverDnSgesvdj_(handle,jobz,econ,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,devInfo, &
        params) &
        bind(c, name="cusolverDnSgesvdj")
#else
    function hipsolverDnSgesvdj_(handle,jobz,econ,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,devInfo, &
        params) &
        bind(c, name="hipsolverDnSgesvdj")
#endif
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
  end interface

  interface hipsolverDnDgesvdj
#ifdef USE_CUDA_NAMES
    function hipsolverDnDgesvdj_(handle,jobz,econ,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,devInfo, &
        params) &
        bind(c, name="cusolverDnDgesvdj")
#else
    function hipsolverDnDgesvdj_(handle,jobz,econ,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,devInfo, &
        params) &
        bind(c, name="hipsolverDnDgesvdj")
#endif
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
  end interface

  interface hipsolverDnCgesvdj
#ifdef USE_CUDA_NAMES
    function hipsolverDnCgesvdj_(handle,jobz,econ,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,devInfo, &
        params) &
        bind(c, name="cusolverDnCgesvdj")
#else
    function hipsolverDnCgesvdj_(handle,jobz,econ,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,devInfo, &
        params) &
        bind(c, name="hipsolverDnCgesvdj")
#endif
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
  end interface

  interface hipsolverDnZgesvdj
#ifdef USE_CUDA_NAMES
    function hipsolverDnZgesvdj_(handle,jobz,econ,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,devInfo, &
        params) &
        bind(c, name="cusolverDnZgesvdj")
#else
    function hipsolverDnZgesvdj_(handle,jobz,econ,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,devInfo, &
        params) &
        bind(c, name="hipsolverDnZgesvdj")
#endif
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
  end interface

  interface hipsolverDnSgesvdjBatched_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnSgesvdjBatched_bufferSize_(handle,jobz,m,n,A,lda,S,U,ldu,V,ldv,lwork, &
        params,batch_count) &
        bind(c, name="cusolverDnSgesvdjBatched_bufferSize")
#else
    function hipsolverDnSgesvdjBatched_bufferSize_(handle,jobz,m,n,A,lda,S,U,ldu,V,ldv,lwork, &
        params,batch_count) &
        bind(c, name="hipsolverDnSgesvdjBatched_bufferSize")
#endif
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
  end interface

  interface hipsolverDnDgesvdjBatched_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnDgesvdjBatched_bufferSize_(handle,jobz,m,n,A,lda,S,U,ldu,V,ldv,lwork, &
        params,batch_count) &
        bind(c, name="cusolverDnDgesvdjBatched_bufferSize")
#else
    function hipsolverDnDgesvdjBatched_bufferSize_(handle,jobz,m,n,A,lda,S,U,ldu,V,ldv,lwork, &
        params,batch_count) &
        bind(c, name="hipsolverDnDgesvdjBatched_bufferSize")
#endif
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
  end interface

  interface hipsolverDnCgesvdjBatched_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnCgesvdjBatched_bufferSize_(handle,jobz,m,n,A,lda,S,U,ldu,V,ldv,lwork, &
        params,batch_count) &
        bind(c, name="cusolverDnCgesvdjBatched_bufferSize")
#else
    function hipsolverDnCgesvdjBatched_bufferSize_(handle,jobz,m,n,A,lda,S,U,ldu,V,ldv,lwork, &
        params,batch_count) &
        bind(c, name="hipsolverDnCgesvdjBatched_bufferSize")
#endif
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
  end interface

  interface hipsolverDnZgesvdjBatched_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnZgesvdjBatched_bufferSize_(handle,jobz,m,n,A,lda,S,U,ldu,V,ldv,lwork, &
        params,batch_count) &
        bind(c, name="cusolverDnZgesvdjBatched_bufferSize")
#else
    function hipsolverDnZgesvdjBatched_bufferSize_(handle,jobz,m,n,A,lda,S,U,ldu,V,ldv,lwork, &
        params,batch_count) &
        bind(c, name="hipsolverDnZgesvdjBatched_bufferSize")
#endif
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
  end interface

  interface hipsolverDnSgesvdjBatched
#ifdef USE_CUDA_NAMES
    function hipsolverDnSgesvdjBatched_(handle,jobz,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,devInfo, &
        params,batch_count) &
        bind(c, name="cusolverDnSgesvdjBatched")
#else
    function hipsolverDnSgesvdjBatched_(handle,jobz,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,devInfo, &
        params,batch_count) &
        bind(c, name="hipsolverDnSgesvdjBatched")
#endif
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
  end interface

  interface hipsolverDnDgesvdjBatched
#ifdef USE_CUDA_NAMES
    function hipsolverDnDgesvdjBatched_(handle,jobz,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,devInfo, &
        params,batch_count) &
        bind(c, name="cusolverDnDgesvdjBatched")
#else
    function hipsolverDnDgesvdjBatched_(handle,jobz,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,devInfo, &
        params,batch_count) &
        bind(c, name="hipsolverDnDgesvdjBatched")
#endif
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
  end interface

  interface hipsolverDnCgesvdjBatched
#ifdef USE_CUDA_NAMES
    function hipsolverDnCgesvdjBatched_(handle,jobz,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,devInfo, &
        params,batch_count) &
        bind(c, name="cusolverDnCgesvdjBatched")
#else
    function hipsolverDnCgesvdjBatched_(handle,jobz,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,devInfo, &
        params,batch_count) &
        bind(c, name="hipsolverDnCgesvdjBatched")
#endif
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
  end interface

  interface hipsolverDnZgesvdjBatched
#ifdef USE_CUDA_NAMES
    function hipsolverDnZgesvdjBatched_(handle,jobz,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,devInfo, &
        params,batch_count) &
        bind(c, name="cusolverDnZgesvdjBatched")
#else
    function hipsolverDnZgesvdjBatched_(handle,jobz,m,n,A,lda,S,U,ldu,V,ldv,work,lwork,devInfo, &
        params,batch_count) &
        bind(c, name="hipsolverDnZgesvdjBatched")
#endif
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
  end interface

  interface hipsolverDnSgesvdaStridedBatched_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnSgesvdaStridedBatched_bufferSize_(handle,jobz,rank,m,n,A,lda,strideA,S, &
        strideS,U,ldu,strideU,V,ldv,strideV,lwork,batch_count) &
        bind(c, name="cusolverDnSgesvdaStridedBatched_bufferSize")
#else
    function hipsolverDnSgesvdaStridedBatched_bufferSize_(handle,jobz,rank,m,n,A,lda,strideA,S, &
        strideS,U,ldu,strideU,V,ldv,strideV,lwork,batch_count) &
        bind(c, name="hipsolverDnSgesvdaStridedBatched_bufferSize")
#endif
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
  end interface

  interface hipsolverDnDgesvdaStridedBatched_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnDgesvdaStridedBatched_bufferSize_(handle,jobz,rank,m,n,A,lda,strideA,S, &
        strideS,U,ldu,strideU,V,ldv,strideV,lwork,batch_count) &
        bind(c, name="cusolverDnDgesvdaStridedBatched_bufferSize")
#else
    function hipsolverDnDgesvdaStridedBatched_bufferSize_(handle,jobz,rank,m,n,A,lda,strideA,S, &
        strideS,U,ldu,strideU,V,ldv,strideV,lwork,batch_count) &
        bind(c, name="hipsolverDnDgesvdaStridedBatched_bufferSize")
#endif
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
  end interface

  interface hipsolverDnCgesvdaStridedBatched_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnCgesvdaStridedBatched_bufferSize_(handle,jobz,rank,m,n,A,lda,strideA,S, &
        strideS,U,ldu,strideU,V,ldv,strideV,lwork,batch_count) &
        bind(c, name="cusolverDnCgesvdaStridedBatched_bufferSize")
#else
    function hipsolverDnCgesvdaStridedBatched_bufferSize_(handle,jobz,rank,m,n,A,lda,strideA,S, &
        strideS,U,ldu,strideU,V,ldv,strideV,lwork,batch_count) &
        bind(c, name="hipsolverDnCgesvdaStridedBatched_bufferSize")
#endif
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
  end interface

  interface hipsolverDnZgesvdaStridedBatched_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnZgesvdaStridedBatched_bufferSize_(handle,jobz,rank,m,n,A,lda,strideA,S, &
        strideS,U,ldu,strideU,V,ldv,strideV,lwork,batch_count) &
        bind(c, name="cusolverDnZgesvdaStridedBatched_bufferSize")
#else
    function hipsolverDnZgesvdaStridedBatched_bufferSize_(handle,jobz,rank,m,n,A,lda,strideA,S, &
        strideS,U,ldu,strideU,V,ldv,strideV,lwork,batch_count) &
        bind(c, name="hipsolverDnZgesvdaStridedBatched_bufferSize")
#endif
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
  end interface

  interface hipsolverDnSgesvdaStridedBatched
#ifdef USE_CUDA_NAMES
    function hipsolverDnSgesvdaStridedBatched_(handle,jobz,rank,m,n,A,lda,strideA,S,strideS,U,ldu, &
        strideU,V,ldv,strideV,work,lwork,devInfo,hRnrmF,batch_count) &
        bind(c, name="cusolverDnSgesvdaStridedBatched")
#else
    function hipsolverDnSgesvdaStridedBatched_(handle,jobz,rank,m,n,A,lda,strideA,S,strideS,U,ldu, &
        strideU,V,ldv,strideV,work,lwork,devInfo,hRnrmF,batch_count) &
        bind(c, name="hipsolverDnSgesvdaStridedBatched")
#endif
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
  end interface

  interface hipsolverDnDgesvdaStridedBatched
#ifdef USE_CUDA_NAMES
    function hipsolverDnDgesvdaStridedBatched_(handle,jobz,rank,m,n,A,lda,strideA,S,strideS,U,ldu, &
        strideU,V,ldv,strideV,work,lwork,devInfo,hRnrmF,batch_count) &
        bind(c, name="cusolverDnDgesvdaStridedBatched")
#else
    function hipsolverDnDgesvdaStridedBatched_(handle,jobz,rank,m,n,A,lda,strideA,S,strideS,U,ldu, &
        strideU,V,ldv,strideV,work,lwork,devInfo,hRnrmF,batch_count) &
        bind(c, name="hipsolverDnDgesvdaStridedBatched")
#endif
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
  end interface

  interface hipsolverDnCgesvdaStridedBatched
#ifdef USE_CUDA_NAMES
    function hipsolverDnCgesvdaStridedBatched_(handle,jobz,rank,m,n,A,lda,strideA,S,strideS,U,ldu, &
        strideU,V,ldv,strideV,work,lwork,devInfo,hRnrmF,batch_count) &
        bind(c, name="cusolverDnCgesvdaStridedBatched")
#else
    function hipsolverDnCgesvdaStridedBatched_(handle,jobz,rank,m,n,A,lda,strideA,S,strideS,U,ldu, &
        strideU,V,ldv,strideV,work,lwork,devInfo,hRnrmF,batch_count) &
        bind(c, name="hipsolverDnCgesvdaStridedBatched")
#endif
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
  end interface

  interface hipsolverDnZgesvdaStridedBatched
#ifdef USE_CUDA_NAMES
    function hipsolverDnZgesvdaStridedBatched_(handle,jobz,rank,m,n,A,lda,strideA,S,strideS,U,ldu, &
        strideU,V,ldv,strideV,work,lwork,devInfo,hRnrmF,batch_count) &
        bind(c, name="cusolverDnZgesvdaStridedBatched")
#else
    function hipsolverDnZgesvdaStridedBatched_(handle,jobz,rank,m,n,A,lda,strideA,S,strideS,U,ldu, &
        strideU,V,ldv,strideV,work,lwork,devInfo,hRnrmF,batch_count) &
        bind(c, name="hipsolverDnZgesvdaStridedBatched")
#endif
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
  end interface

  interface hipsolverDnSgetrf_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnSgetrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="cusolverDnSgetrf_bufferSize")
#else
    function hipsolverDnSgetrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="hipsolverDnSgetrf_bufferSize")
#endif
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
  end interface

  interface hipsolverDnDgetrf_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnDgetrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="cusolverDnDgetrf_bufferSize")
#else
    function hipsolverDnDgetrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="hipsolverDnDgetrf_bufferSize")
#endif
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
  end interface

  interface hipsolverDnCgetrf_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnCgetrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="cusolverDnCgetrf_bufferSize")
#else
    function hipsolverDnCgetrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="hipsolverDnCgetrf_bufferSize")
#endif
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
  end interface

  interface hipsolverDnZgetrf_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnZgetrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="cusolverDnZgetrf_bufferSize")
#else
    function hipsolverDnZgetrf_bufferSize_(handle,m,n,A,lda,lwork) &
        bind(c, name="hipsolverDnZgetrf_bufferSize")
#endif
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
  end interface

  interface hipsolverDnSgetrf
#ifdef USE_CUDA_NAMES
    function hipsolverDnSgetrf_(handle,m,n,A,lda,work,devIpiv,devInfo) &
        bind(c, name="cusolverDnSgetrf")
#else
    function hipsolverDnSgetrf_(handle,m,n,A,lda,work,devIpiv,devInfo) &
        bind(c, name="hipsolverDnSgetrf")
#endif
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
  end interface

  interface hipsolverDnDgetrf
#ifdef USE_CUDA_NAMES
    function hipsolverDnDgetrf_(handle,m,n,A,lda,work,devIpiv,devInfo) &
        bind(c, name="cusolverDnDgetrf")
#else
    function hipsolverDnDgetrf_(handle,m,n,A,lda,work,devIpiv,devInfo) &
        bind(c, name="hipsolverDnDgetrf")
#endif
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
  end interface

  interface hipsolverDnCgetrf
#ifdef USE_CUDA_NAMES
    function hipsolverDnCgetrf_(handle,m,n,A,lda,work,devIpiv,devInfo) &
        bind(c, name="cusolverDnCgetrf")
#else
    function hipsolverDnCgetrf_(handle,m,n,A,lda,work,devIpiv,devInfo) &
        bind(c, name="hipsolverDnCgetrf")
#endif
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
  end interface

  interface hipsolverDnZgetrf
#ifdef USE_CUDA_NAMES
    function hipsolverDnZgetrf_(handle,m,n,A,lda,work,devIpiv,devInfo) &
        bind(c, name="cusolverDnZgetrf")
#else
    function hipsolverDnZgetrf_(handle,m,n,A,lda,work,devIpiv,devInfo) &
        bind(c, name="hipsolverDnZgetrf")
#endif
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
  end interface

  interface hipsolverDnSgetrs
#ifdef USE_CUDA_NAMES
    function hipsolverDnSgetrs_(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,devInfo) &
        bind(c, name="cusolverDnSgetrs")
#else
    function hipsolverDnSgetrs_(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,devInfo) &
        bind(c, name="hipsolverDnSgetrs")
#endif
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
  end interface

  interface hipsolverDnDgetrs
#ifdef USE_CUDA_NAMES
    function hipsolverDnDgetrs_(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,devInfo) &
        bind(c, name="cusolverDnDgetrs")
#else
    function hipsolverDnDgetrs_(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,devInfo) &
        bind(c, name="hipsolverDnDgetrs")
#endif
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
  end interface

  interface hipsolverDnCgetrs
#ifdef USE_CUDA_NAMES
    function hipsolverDnCgetrs_(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,devInfo) &
        bind(c, name="cusolverDnCgetrs")
#else
    function hipsolverDnCgetrs_(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,devInfo) &
        bind(c, name="hipsolverDnCgetrs")
#endif
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
  end interface

  interface hipsolverDnZgetrs
#ifdef USE_CUDA_NAMES
    function hipsolverDnZgetrs_(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,devInfo) &
        bind(c, name="cusolverDnZgetrs")
#else
    function hipsolverDnZgetrs_(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,devInfo) &
        bind(c, name="hipsolverDnZgetrs")
#endif
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
  end interface

  interface hipsolverDnSpotrf_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnSpotrf_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="cusolverDnSpotrf_bufferSize")
#else
    function hipsolverDnSpotrf_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="hipsolverDnSpotrf_bufferSize")
#endif
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
  end interface

  interface hipsolverDnDpotrf_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnDpotrf_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="cusolverDnDpotrf_bufferSize")
#else
    function hipsolverDnDpotrf_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="hipsolverDnDpotrf_bufferSize")
#endif
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
  end interface

  interface hipsolverDnCpotrf_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnCpotrf_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="cusolverDnCpotrf_bufferSize")
#else
    function hipsolverDnCpotrf_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="hipsolverDnCpotrf_bufferSize")
#endif
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
  end interface

  interface hipsolverDnZpotrf_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnZpotrf_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="cusolverDnZpotrf_bufferSize")
#else
    function hipsolverDnZpotrf_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="hipsolverDnZpotrf_bufferSize")
#endif
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
  end interface

  interface hipsolverDnSpotrf
#ifdef USE_CUDA_NAMES
    function hipsolverDnSpotrf_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="cusolverDnSpotrf")
#else
    function hipsolverDnSpotrf_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="hipsolverDnSpotrf")
#endif
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
  end interface

  interface hipsolverDnDpotrf
#ifdef USE_CUDA_NAMES
    function hipsolverDnDpotrf_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="cusolverDnDpotrf")
#else
    function hipsolverDnDpotrf_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="hipsolverDnDpotrf")
#endif
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
  end interface

  interface hipsolverDnCpotrf
#ifdef USE_CUDA_NAMES
    function hipsolverDnCpotrf_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="cusolverDnCpotrf")
#else
    function hipsolverDnCpotrf_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="hipsolverDnCpotrf")
#endif
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
  end interface

  interface hipsolverDnZpotrf
#ifdef USE_CUDA_NAMES
    function hipsolverDnZpotrf_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="cusolverDnZpotrf")
#else
    function hipsolverDnZpotrf_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="hipsolverDnZpotrf")
#endif
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
  end interface

  interface hipsolverDnSpotrfBatched
#ifdef USE_CUDA_NAMES
    function hipsolverDnSpotrfBatched_(handle,uplo,n,A,lda,devInfo,batch_count) &
        bind(c, name="cusolverDnSpotrfBatched")
#else
    function hipsolverDnSpotrfBatched_(handle,uplo,n,A,lda,devInfo,batch_count) &
        bind(c, name="hipsolverDnSpotrfBatched")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSpotrfBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devInfo
      integer(c_int),value :: batch_count
    end function
  end interface

  interface hipsolverDnDpotrfBatched
#ifdef USE_CUDA_NAMES
    function hipsolverDnDpotrfBatched_(handle,uplo,n,A,lda,devInfo,batch_count) &
        bind(c, name="cusolverDnDpotrfBatched")
#else
    function hipsolverDnDpotrfBatched_(handle,uplo,n,A,lda,devInfo,batch_count) &
        bind(c, name="hipsolverDnDpotrfBatched")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDpotrfBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devInfo
      integer(c_int),value :: batch_count
    end function
  end interface

  interface hipsolverDnCpotrfBatched
#ifdef USE_CUDA_NAMES
    function hipsolverDnCpotrfBatched_(handle,uplo,n,A,lda,devInfo,batch_count) &
        bind(c, name="cusolverDnCpotrfBatched")
#else
    function hipsolverDnCpotrfBatched_(handle,uplo,n,A,lda,devInfo,batch_count) &
        bind(c, name="hipsolverDnCpotrfBatched")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCpotrfBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devInfo
      integer(c_int),value :: batch_count
    end function
  end interface

  interface hipsolverDnZpotrfBatched
#ifdef USE_CUDA_NAMES
    function hipsolverDnZpotrfBatched_(handle,uplo,n,A,lda,devInfo,batch_count) &
        bind(c, name="cusolverDnZpotrfBatched")
#else
    function hipsolverDnZpotrfBatched_(handle,uplo,n,A,lda,devInfo,batch_count) &
        bind(c, name="hipsolverDnZpotrfBatched")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZpotrfBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devInfo
      integer(c_int),value :: batch_count
    end function
  end interface

  interface hipsolverDnSpotri_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnSpotri_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="cusolverDnSpotri_bufferSize")
#else
    function hipsolverDnSpotri_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="hipsolverDnSpotri_bufferSize")
#endif
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
  end interface

  interface hipsolverDnDpotri_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnDpotri_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="cusolverDnDpotri_bufferSize")
#else
    function hipsolverDnDpotri_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="hipsolverDnDpotri_bufferSize")
#endif
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
  end interface

  interface hipsolverDnCpotri_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnCpotri_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="cusolverDnCpotri_bufferSize")
#else
    function hipsolverDnCpotri_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="hipsolverDnCpotri_bufferSize")
#endif
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
  end interface

  interface hipsolverDnZpotri_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnZpotri_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="cusolverDnZpotri_bufferSize")
#else
    function hipsolverDnZpotri_bufferSize_(handle,uplo,n,A,lda,lwork) &
        bind(c, name="hipsolverDnZpotri_bufferSize")
#endif
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
  end interface

  interface hipsolverDnSpotri
#ifdef USE_CUDA_NAMES
    function hipsolverDnSpotri_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="cusolverDnSpotri")
#else
    function hipsolverDnSpotri_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="hipsolverDnSpotri")
#endif
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
  end interface

  interface hipsolverDnDpotri
#ifdef USE_CUDA_NAMES
    function hipsolverDnDpotri_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="cusolverDnDpotri")
#else
    function hipsolverDnDpotri_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="hipsolverDnDpotri")
#endif
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
  end interface

  interface hipsolverDnCpotri
#ifdef USE_CUDA_NAMES
    function hipsolverDnCpotri_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="cusolverDnCpotri")
#else
    function hipsolverDnCpotri_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="hipsolverDnCpotri")
#endif
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
  end interface

  interface hipsolverDnZpotri
#ifdef USE_CUDA_NAMES
    function hipsolverDnZpotri_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="cusolverDnZpotri")
#else
    function hipsolverDnZpotri_(handle,uplo,n,A,lda,work,lwork,devInfo) &
        bind(c, name="hipsolverDnZpotri")
#endif
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
  end interface

  interface hipsolverDnSpotrs
#ifdef USE_CUDA_NAMES
    function hipsolverDnSpotrs_(handle,uplo,n,nrhs,A,lda,B,ldb,devInfo) &
        bind(c, name="cusolverDnSpotrs")
#else
    function hipsolverDnSpotrs_(handle,uplo,n,nrhs,A,lda,B,ldb,devInfo) &
        bind(c, name="hipsolverDnSpotrs")
#endif
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
  end interface

  interface hipsolverDnDpotrs
#ifdef USE_CUDA_NAMES
    function hipsolverDnDpotrs_(handle,uplo,n,nrhs,A,lda,B,ldb,devInfo) &
        bind(c, name="cusolverDnDpotrs")
#else
    function hipsolverDnDpotrs_(handle,uplo,n,nrhs,A,lda,B,ldb,devInfo) &
        bind(c, name="hipsolverDnDpotrs")
#endif
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
  end interface

  interface hipsolverDnCpotrs
#ifdef USE_CUDA_NAMES
    function hipsolverDnCpotrs_(handle,uplo,n,nrhs,A,lda,B,ldb,devInfo) &
        bind(c, name="cusolverDnCpotrs")
#else
    function hipsolverDnCpotrs_(handle,uplo,n,nrhs,A,lda,B,ldb,devInfo) &
        bind(c, name="hipsolverDnCpotrs")
#endif
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
  end interface

  interface hipsolverDnZpotrs
#ifdef USE_CUDA_NAMES
    function hipsolverDnZpotrs_(handle,uplo,n,nrhs,A,lda,B,ldb,devInfo) &
        bind(c, name="cusolverDnZpotrs")
#else
    function hipsolverDnZpotrs_(handle,uplo,n,nrhs,A,lda,B,ldb,devInfo) &
        bind(c, name="hipsolverDnZpotrs")
#endif
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
  end interface

  interface hipsolverDnSpotrsBatched
#ifdef USE_CUDA_NAMES
    function hipsolverDnSpotrsBatched_(handle,uplo,n,nrhs,A,lda,B,ldb,devInfo,batch_count) &
        bind(c, name="cusolverDnSpotrsBatched")
#else
    function hipsolverDnSpotrsBatched_(handle,uplo,n,nrhs,A,lda,B,ldb,devInfo,batch_count) &
        bind(c, name="hipsolverDnSpotrsBatched")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSpotrsBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: devInfo
      integer(c_int),value :: batch_count
    end function
  end interface

  interface hipsolverDnDpotrsBatched
#ifdef USE_CUDA_NAMES
    function hipsolverDnDpotrsBatched_(handle,uplo,n,nrhs,A,lda,B,ldb,devInfo,batch_count) &
        bind(c, name="cusolverDnDpotrsBatched")
#else
    function hipsolverDnDpotrsBatched_(handle,uplo,n,nrhs,A,lda,B,ldb,devInfo,batch_count) &
        bind(c, name="hipsolverDnDpotrsBatched")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDpotrsBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: devInfo
      integer(c_int),value :: batch_count
    end function
  end interface

  interface hipsolverDnCpotrsBatched
#ifdef USE_CUDA_NAMES
    function hipsolverDnCpotrsBatched_(handle,uplo,n,nrhs,A,lda,B,ldb,devInfo,batch_count) &
        bind(c, name="cusolverDnCpotrsBatched")
#else
    function hipsolverDnCpotrsBatched_(handle,uplo,n,nrhs,A,lda,B,ldb,devInfo,batch_count) &
        bind(c, name="hipsolverDnCpotrsBatched")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCpotrsBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: devInfo
      integer(c_int),value :: batch_count
    end function
  end interface

  interface hipsolverDnZpotrsBatched
#ifdef USE_CUDA_NAMES
    function hipsolverDnZpotrsBatched_(handle,uplo,n,nrhs,A,lda,B,ldb,devInfo,batch_count) &
        bind(c, name="cusolverDnZpotrsBatched")
#else
    function hipsolverDnZpotrsBatched_(handle,uplo,n,nrhs,A,lda,B,ldb,devInfo,batch_count) &
        bind(c, name="hipsolverDnZpotrsBatched")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnZpotrsBatched_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: devInfo
      integer(c_int),value :: batch_count
    end function
  end interface

  interface hipsolverDnSsyevd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnSsyevd_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork) &
        bind(c, name="cusolverDnSsyevd_bufferSize")
#else
    function hipsolverDnSsyevd_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork) &
        bind(c, name="hipsolverDnSsyevd_bufferSize")
#endif
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
  end interface

  interface hipsolverDnDsyevd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnDsyevd_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork) &
        bind(c, name="cusolverDnDsyevd_bufferSize")
#else
    function hipsolverDnDsyevd_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork) &
        bind(c, name="hipsolverDnDsyevd_bufferSize")
#endif
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
  end interface

  interface hipsolverDnCheevd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnCheevd_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork) &
        bind(c, name="cusolverDnCheevd_bufferSize")
#else
    function hipsolverDnCheevd_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork) &
        bind(c, name="hipsolverDnCheevd_bufferSize")
#endif
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
  end interface

  interface hipsolverDnZheevd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnZheevd_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork) &
        bind(c, name="cusolverDnZheevd_bufferSize")
#else
    function hipsolverDnZheevd_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork) &
        bind(c, name="hipsolverDnZheevd_bufferSize")
#endif
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
  end interface

  interface hipsolverDnSsyevd
#ifdef USE_CUDA_NAMES
    function hipsolverDnSsyevd_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo) &
        bind(c, name="cusolverDnSsyevd")
#else
    function hipsolverDnSsyevd_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo) &
        bind(c, name="hipsolverDnSsyevd")
#endif
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
  end interface

  interface hipsolverDnDsyevd
#ifdef USE_CUDA_NAMES
    function hipsolverDnDsyevd_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo) &
        bind(c, name="cusolverDnDsyevd")
#else
    function hipsolverDnDsyevd_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo) &
        bind(c, name="hipsolverDnDsyevd")
#endif
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
  end interface

  interface hipsolverDnCheevd
#ifdef USE_CUDA_NAMES
    function hipsolverDnCheevd_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo) &
        bind(c, name="cusolverDnCheevd")
#else
    function hipsolverDnCheevd_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo) &
        bind(c, name="hipsolverDnCheevd")
#endif
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
  end interface

  interface hipsolverDnZheevd
#ifdef USE_CUDA_NAMES
    function hipsolverDnZheevd_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo) &
        bind(c, name="cusolverDnZheevd")
#else
    function hipsolverDnZheevd_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo) &
        bind(c, name="hipsolverDnZheevd")
#endif
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
  end interface

  interface hipsolverDnSsyevdx_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnSsyevdx_bufferSize_(handle,jobz,range,uplo,n,A,lda,vl,vu,il,iu,nev,W, &
        lwork) &
        bind(c, name="cusolverDnSsyevdx_bufferSize")
#else
    function hipsolverDnSsyevdx_bufferSize_(handle,jobz,range,uplo,n,A,lda,vl,vu,il,iu,nev,W, &
        lwork) &
        bind(c, name="hipsolverDnSsyevdx_bufferSize")
#endif
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
  end interface

  interface hipsolverDnDsyevdx_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnDsyevdx_bufferSize_(handle,jobz,range,uplo,n,A,lda,vl,vu,il,iu,nev,W, &
        lwork) &
        bind(c, name="cusolverDnDsyevdx_bufferSize")
#else
    function hipsolverDnDsyevdx_bufferSize_(handle,jobz,range,uplo,n,A,lda,vl,vu,il,iu,nev,W, &
        lwork) &
        bind(c, name="hipsolverDnDsyevdx_bufferSize")
#endif
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
  end interface

  interface hipsolverDnCheevdx_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnCheevdx_bufferSize_(handle,jobz,range,uplo,n,A,lda,vl,vu,il,iu,nev,W, &
        lwork) &
        bind(c, name="cusolverDnCheevdx_bufferSize")
#else
    function hipsolverDnCheevdx_bufferSize_(handle,jobz,range,uplo,n,A,lda,vl,vu,il,iu,nev,W, &
        lwork) &
        bind(c, name="hipsolverDnCheevdx_bufferSize")
#endif
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
  end interface

  interface hipsolverDnZheevdx_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnZheevdx_bufferSize_(handle,jobz,range,uplo,n,A,lda,vl,vu,il,iu,nev,W, &
        lwork) &
        bind(c, name="cusolverDnZheevdx_bufferSize")
#else
    function hipsolverDnZheevdx_bufferSize_(handle,jobz,range,uplo,n,A,lda,vl,vu,il,iu,nev,W, &
        lwork) &
        bind(c, name="hipsolverDnZheevdx_bufferSize")
#endif
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
  end interface

  interface hipsolverDnSsyevdx
#ifdef USE_CUDA_NAMES
    function hipsolverDnSsyevdx_(handle,jobz,range,uplo,n,A,lda,vl,vu,il,iu,nev,W,work,lwork, &
        devInfo) &
        bind(c, name="cusolverDnSsyevdx")
#else
    function hipsolverDnSsyevdx_(handle,jobz,range,uplo,n,A,lda,vl,vu,il,iu,nev,W,work,lwork, &
        devInfo) &
        bind(c, name="hipsolverDnSsyevdx")
#endif
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
  end interface

  interface hipsolverDnDsyevdx
#ifdef USE_CUDA_NAMES
    function hipsolverDnDsyevdx_(handle,jobz,range,uplo,n,A,lda,vl,vu,il,iu,nev,W,work,lwork, &
        devInfo) &
        bind(c, name="cusolverDnDsyevdx")
#else
    function hipsolverDnDsyevdx_(handle,jobz,range,uplo,n,A,lda,vl,vu,il,iu,nev,W,work,lwork, &
        devInfo) &
        bind(c, name="hipsolverDnDsyevdx")
#endif
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
  end interface

  interface hipsolverDnCheevdx
#ifdef USE_CUDA_NAMES
    function hipsolverDnCheevdx_(handle,jobz,range,uplo,n,A,lda,vl,vu,il,iu,nev,W,work,lwork, &
        devInfo) &
        bind(c, name="cusolverDnCheevdx")
#else
    function hipsolverDnCheevdx_(handle,jobz,range,uplo,n,A,lda,vl,vu,il,iu,nev,W,work,lwork, &
        devInfo) &
        bind(c, name="hipsolverDnCheevdx")
#endif
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
  end interface

  interface hipsolverDnZheevdx
#ifdef USE_CUDA_NAMES
    function hipsolverDnZheevdx_(handle,jobz,range,uplo,n,A,lda,vl,vu,il,iu,nev,W,work,lwork, &
        devInfo) &
        bind(c, name="cusolverDnZheevdx")
#else
    function hipsolverDnZheevdx_(handle,jobz,range,uplo,n,A,lda,vl,vu,il,iu,nev,W,work,lwork, &
        devInfo) &
        bind(c, name="hipsolverDnZheevdx")
#endif
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
  end interface

  interface hipsolverDnSsyevj_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnSsyevj_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork,params) &
        bind(c, name="cusolverDnSsyevj_bufferSize")
#else
    function hipsolverDnSsyevj_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork,params) &
        bind(c, name="hipsolverDnSsyevj_bufferSize")
#endif
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
  end interface

  interface hipsolverDnDsyevj_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnDsyevj_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork,params) &
        bind(c, name="cusolverDnDsyevj_bufferSize")
#else
    function hipsolverDnDsyevj_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork,params) &
        bind(c, name="hipsolverDnDsyevj_bufferSize")
#endif
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
  end interface

  interface hipsolverDnCheevj_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnCheevj_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork,params) &
        bind(c, name="cusolverDnCheevj_bufferSize")
#else
    function hipsolverDnCheevj_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork,params) &
        bind(c, name="hipsolverDnCheevj_bufferSize")
#endif
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
  end interface

  interface hipsolverDnZheevj_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnZheevj_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork,params) &
        bind(c, name="cusolverDnZheevj_bufferSize")
#else
    function hipsolverDnZheevj_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork,params) &
        bind(c, name="hipsolverDnZheevj_bufferSize")
#endif
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
  end interface

  interface hipsolverDnSsyevj
#ifdef USE_CUDA_NAMES
    function hipsolverDnSsyevj_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo,params) &
        bind(c, name="cusolverDnSsyevj")
#else
    function hipsolverDnSsyevj_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo,params) &
        bind(c, name="hipsolverDnSsyevj")
#endif
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
  end interface

  interface hipsolverDnDsyevj
#ifdef USE_CUDA_NAMES
    function hipsolverDnDsyevj_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo,params) &
        bind(c, name="cusolverDnDsyevj")
#else
    function hipsolverDnDsyevj_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo,params) &
        bind(c, name="hipsolverDnDsyevj")
#endif
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
  end interface

  interface hipsolverDnCheevj
#ifdef USE_CUDA_NAMES
    function hipsolverDnCheevj_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo,params) &
        bind(c, name="cusolverDnCheevj")
#else
    function hipsolverDnCheevj_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo,params) &
        bind(c, name="hipsolverDnCheevj")
#endif
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
  end interface

  interface hipsolverDnZheevj
#ifdef USE_CUDA_NAMES
    function hipsolverDnZheevj_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo,params) &
        bind(c, name="cusolverDnZheevj")
#else
    function hipsolverDnZheevj_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo,params) &
        bind(c, name="hipsolverDnZheevj")
#endif
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
  end interface

  interface hipsolverDnSsyevjBatched_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnSsyevjBatched_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork,params, &
        batch_count) &
        bind(c, name="cusolverDnSsyevjBatched_bufferSize")
#else
    function hipsolverDnSsyevjBatched_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork,params, &
        batch_count) &
        bind(c, name="hipsolverDnSsyevjBatched_bufferSize")
#endif
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
  end interface

  interface hipsolverDnDsyevjBatched_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnDsyevjBatched_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork,params, &
        batch_count) &
        bind(c, name="cusolverDnDsyevjBatched_bufferSize")
#else
    function hipsolverDnDsyevjBatched_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork,params, &
        batch_count) &
        bind(c, name="hipsolverDnDsyevjBatched_bufferSize")
#endif
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
  end interface

  interface hipsolverDnCheevjBatched_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnCheevjBatched_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork,params, &
        batch_count) &
        bind(c, name="cusolverDnCheevjBatched_bufferSize")
#else
    function hipsolverDnCheevjBatched_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork,params, &
        batch_count) &
        bind(c, name="hipsolverDnCheevjBatched_bufferSize")
#endif
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
  end interface

  interface hipsolverDnZheevjBatched_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnZheevjBatched_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork,params, &
        batch_count) &
        bind(c, name="cusolverDnZheevjBatched_bufferSize")
#else
    function hipsolverDnZheevjBatched_bufferSize_(handle,jobz,uplo,n,A,lda,W,lwork,params, &
        batch_count) &
        bind(c, name="hipsolverDnZheevjBatched_bufferSize")
#endif
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
  end interface

  interface hipsolverDnSsyevjBatched
#ifdef USE_CUDA_NAMES
    function hipsolverDnSsyevjBatched_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo,params, &
        batch_count) &
        bind(c, name="cusolverDnSsyevjBatched")
#else
    function hipsolverDnSsyevjBatched_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo,params, &
        batch_count) &
        bind(c, name="hipsolverDnSsyevjBatched")
#endif
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
  end interface

  interface hipsolverDnDsyevjBatched
#ifdef USE_CUDA_NAMES
    function hipsolverDnDsyevjBatched_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo,params, &
        batch_count) &
        bind(c, name="cusolverDnDsyevjBatched")
#else
    function hipsolverDnDsyevjBatched_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo,params, &
        batch_count) &
        bind(c, name="hipsolverDnDsyevjBatched")
#endif
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
  end interface

  interface hipsolverDnCheevjBatched
#ifdef USE_CUDA_NAMES
    function hipsolverDnCheevjBatched_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo,params, &
        batch_count) &
        bind(c, name="cusolverDnCheevjBatched")
#else
    function hipsolverDnCheevjBatched_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo,params, &
        batch_count) &
        bind(c, name="hipsolverDnCheevjBatched")
#endif
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
  end interface

  interface hipsolverDnZheevjBatched
#ifdef USE_CUDA_NAMES
    function hipsolverDnZheevjBatched_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo,params, &
        batch_count) &
        bind(c, name="cusolverDnZheevjBatched")
#else
    function hipsolverDnZheevjBatched_(handle,jobz,uplo,n,A,lda,W,work,lwork,devInfo,params, &
        batch_count) &
        bind(c, name="hipsolverDnZheevjBatched")
#endif
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
  end interface

  interface hipsolverDnSsygvd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnSsygvd_bufferSize_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork) &
        bind(c, name="cusolverDnSsygvd_bufferSize")
#else
    function hipsolverDnSsygvd_bufferSize_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork) &
        bind(c, name="hipsolverDnSsygvd_bufferSize")
#endif
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
  end interface

  interface hipsolverDnDsygvd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnDsygvd_bufferSize_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork) &
        bind(c, name="cusolverDnDsygvd_bufferSize")
#else
    function hipsolverDnDsygvd_bufferSize_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork) &
        bind(c, name="hipsolverDnDsygvd_bufferSize")
#endif
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
  end interface

  interface hipsolverDnChegvd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnChegvd_bufferSize_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork) &
        bind(c, name="cusolverDnChegvd_bufferSize")
#else
    function hipsolverDnChegvd_bufferSize_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork) &
        bind(c, name="hipsolverDnChegvd_bufferSize")
#endif
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
  end interface

  interface hipsolverDnZhegvd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnZhegvd_bufferSize_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork) &
        bind(c, name="cusolverDnZhegvd_bufferSize")
#else
    function hipsolverDnZhegvd_bufferSize_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork) &
        bind(c, name="hipsolverDnZhegvd_bufferSize")
#endif
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
  end interface

  interface hipsolverDnSsygvd
#ifdef USE_CUDA_NAMES
    function hipsolverDnSsygvd_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo) &
        bind(c, name="cusolverDnSsygvd")
#else
    function hipsolverDnSsygvd_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo) &
        bind(c, name="hipsolverDnSsygvd")
#endif
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
  end interface

  interface hipsolverDnDsygvd
#ifdef USE_CUDA_NAMES
    function hipsolverDnDsygvd_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo) &
        bind(c, name="cusolverDnDsygvd")
#else
    function hipsolverDnDsygvd_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo) &
        bind(c, name="hipsolverDnDsygvd")
#endif
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
  end interface

  interface hipsolverDnChegvd
#ifdef USE_CUDA_NAMES
    function hipsolverDnChegvd_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo) &
        bind(c, name="cusolverDnChegvd")
#else
    function hipsolverDnChegvd_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo) &
        bind(c, name="hipsolverDnChegvd")
#endif
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
  end interface

  interface hipsolverDnZhegvd
#ifdef USE_CUDA_NAMES
    function hipsolverDnZhegvd_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo) &
        bind(c, name="cusolverDnZhegvd")
#else
    function hipsolverDnZhegvd_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo) &
        bind(c, name="hipsolverDnZhegvd")
#endif
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
  end interface

  interface hipsolverDnSsygvdx_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnSsygvdx_bufferSize_(handle,itype,jobz,range,uplo,n,A,lda,B,ldb,vl,vu,il, &
        iu,nev,W,lwork) &
        bind(c, name="cusolverDnSsygvdx_bufferSize")
#else
    function hipsolverDnSsygvdx_bufferSize_(handle,itype,jobz,range,uplo,n,A,lda,B,ldb,vl,vu,il, &
        iu,nev,W,lwork) &
        bind(c, name="hipsolverDnSsygvdx_bufferSize")
#endif
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
  end interface

  interface hipsolverDnDsygvdx_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnDsygvdx_bufferSize_(handle,itype,jobz,range,uplo,n,A,lda,B,ldb,vl,vu,il, &
        iu,nev,W,lwork) &
        bind(c, name="cusolverDnDsygvdx_bufferSize")
#else
    function hipsolverDnDsygvdx_bufferSize_(handle,itype,jobz,range,uplo,n,A,lda,B,ldb,vl,vu,il, &
        iu,nev,W,lwork) &
        bind(c, name="hipsolverDnDsygvdx_bufferSize")
#endif
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
  end interface

  interface hipsolverDnChegvdx_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnChegvdx_bufferSize_(handle,itype,jobz,range,uplo,n,A,lda,B,ldb,vl,vu,il, &
        iu,nev,W,lwork) &
        bind(c, name="cusolverDnChegvdx_bufferSize")
#else
    function hipsolverDnChegvdx_bufferSize_(handle,itype,jobz,range,uplo,n,A,lda,B,ldb,vl,vu,il, &
        iu,nev,W,lwork) &
        bind(c, name="hipsolverDnChegvdx_bufferSize")
#endif
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
  end interface

  interface hipsolverDnZhegvdx_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnZhegvdx_bufferSize_(handle,itype,jobz,range,uplo,n,A,lda,B,ldb,vl,vu,il, &
        iu,nev,W,lwork) &
        bind(c, name="cusolverDnZhegvdx_bufferSize")
#else
    function hipsolverDnZhegvdx_bufferSize_(handle,itype,jobz,range,uplo,n,A,lda,B,ldb,vl,vu,il, &
        iu,nev,W,lwork) &
        bind(c, name="hipsolverDnZhegvdx_bufferSize")
#endif
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
  end interface

  interface hipsolverDnSsygvdx
#ifdef USE_CUDA_NAMES
    function hipsolverDnSsygvdx_(handle,itype,jobz,range,uplo,n,A,lda,B,ldb,vl,vu,il,iu,nev,W, &
        work,lwork,devInfo) &
        bind(c, name="cusolverDnSsygvdx")
#else
    function hipsolverDnSsygvdx_(handle,itype,jobz,range,uplo,n,A,lda,B,ldb,vl,vu,il,iu,nev,W, &
        work,lwork,devInfo) &
        bind(c, name="hipsolverDnSsygvdx")
#endif
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
  end interface

  interface hipsolverDnDsygvdx
#ifdef USE_CUDA_NAMES
    function hipsolverDnDsygvdx_(handle,itype,jobz,range,uplo,n,A,lda,B,ldb,vl,vu,il,iu,nev,W, &
        work,lwork,devInfo) &
        bind(c, name="cusolverDnDsygvdx")
#else
    function hipsolverDnDsygvdx_(handle,itype,jobz,range,uplo,n,A,lda,B,ldb,vl,vu,il,iu,nev,W, &
        work,lwork,devInfo) &
        bind(c, name="hipsolverDnDsygvdx")
#endif
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
  end interface

  interface hipsolverDnChegvdx
#ifdef USE_CUDA_NAMES
    function hipsolverDnChegvdx_(handle,itype,jobz,range,uplo,n,A,lda,B,ldb,vl,vu,il,iu,nev,W, &
        work,lwork,devInfo) &
        bind(c, name="cusolverDnChegvdx")
#else
    function hipsolverDnChegvdx_(handle,itype,jobz,range,uplo,n,A,lda,B,ldb,vl,vu,il,iu,nev,W, &
        work,lwork,devInfo) &
        bind(c, name="hipsolverDnChegvdx")
#endif
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
  end interface

  interface hipsolverDnZhegvdx
#ifdef USE_CUDA_NAMES
    function hipsolverDnZhegvdx_(handle,itype,jobz,range,uplo,n,A,lda,B,ldb,vl,vu,il,iu,nev,W, &
        work,lwork,devInfo) &
        bind(c, name="cusolverDnZhegvdx")
#else
    function hipsolverDnZhegvdx_(handle,itype,jobz,range,uplo,n,A,lda,B,ldb,vl,vu,il,iu,nev,W, &
        work,lwork,devInfo) &
        bind(c, name="hipsolverDnZhegvdx")
#endif
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
  end interface

  interface hipsolverDnSsygvj_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnSsygvj_bufferSize_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork,params) &
        bind(c, name="cusolverDnSsygvj_bufferSize")
#else
    function hipsolverDnSsygvj_bufferSize_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork,params) &
        bind(c, name="hipsolverDnSsygvj_bufferSize")
#endif
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
  end interface

  interface hipsolverDnDsygvj_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnDsygvj_bufferSize_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork,params) &
        bind(c, name="cusolverDnDsygvj_bufferSize")
#else
    function hipsolverDnDsygvj_bufferSize_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork,params) &
        bind(c, name="hipsolverDnDsygvj_bufferSize")
#endif
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
  end interface

  interface hipsolverDnChegvj_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnChegvj_bufferSize_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork,params) &
        bind(c, name="cusolverDnChegvj_bufferSize")
#else
    function hipsolverDnChegvj_bufferSize_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork,params) &
        bind(c, name="hipsolverDnChegvj_bufferSize")
#endif
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
  end interface

  interface hipsolverDnZhegvj_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnZhegvj_bufferSize_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork,params) &
        bind(c, name="cusolverDnZhegvj_bufferSize")
#else
    function hipsolverDnZhegvj_bufferSize_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork,params) &
        bind(c, name="hipsolverDnZhegvj_bufferSize")
#endif
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
  end interface

  interface hipsolverDnSsygvj
#ifdef USE_CUDA_NAMES
    function hipsolverDnSsygvj_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo,params) &
        bind(c, name="cusolverDnSsygvj")
#else
    function hipsolverDnSsygvj_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo,params) &
        bind(c, name="hipsolverDnSsygvj")
#endif
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
  end interface

  interface hipsolverDnDsygvj
#ifdef USE_CUDA_NAMES
    function hipsolverDnDsygvj_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo,params) &
        bind(c, name="cusolverDnDsygvj")
#else
    function hipsolverDnDsygvj_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo,params) &
        bind(c, name="hipsolverDnDsygvj")
#endif
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
  end interface

  interface hipsolverDnChegvj
#ifdef USE_CUDA_NAMES
    function hipsolverDnChegvj_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo,params) &
        bind(c, name="cusolverDnChegvj")
#else
    function hipsolverDnChegvj_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo,params) &
        bind(c, name="hipsolverDnChegvj")
#endif
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
  end interface

  interface hipsolverDnZhegvj
#ifdef USE_CUDA_NAMES
    function hipsolverDnZhegvj_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo,params) &
        bind(c, name="cusolverDnZhegvj")
#else
    function hipsolverDnZhegvj_(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo,params) &
        bind(c, name="hipsolverDnZhegvj")
#endif
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
  end interface

  interface hipsolverDnSsytrd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnSsytrd_bufferSize_(handle,uplo,n,A,lda,D,E,tau,lwork) &
        bind(c, name="cusolverDnSsytrd_bufferSize")
#else
    function hipsolverDnSsytrd_bufferSize_(handle,uplo,n,A,lda,D,E,tau,lwork) &
        bind(c, name="hipsolverDnSsytrd_bufferSize")
#endif
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
  end interface

  interface hipsolverDnDsytrd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnDsytrd_bufferSize_(handle,uplo,n,A,lda,D,E,tau,lwork) &
        bind(c, name="cusolverDnDsytrd_bufferSize")
#else
    function hipsolverDnDsytrd_bufferSize_(handle,uplo,n,A,lda,D,E,tau,lwork) &
        bind(c, name="hipsolverDnDsytrd_bufferSize")
#endif
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
  end interface

  interface hipsolverDnChetrd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnChetrd_bufferSize_(handle,uplo,n,A,lda,D,E,tau,lwork) &
        bind(c, name="cusolverDnChetrd_bufferSize")
#else
    function hipsolverDnChetrd_bufferSize_(handle,uplo,n,A,lda,D,E,tau,lwork) &
        bind(c, name="hipsolverDnChetrd_bufferSize")
#endif
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
  end interface

  interface hipsolverDnZhetrd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnZhetrd_bufferSize_(handle,uplo,n,A,lda,D,E,tau,lwork) &
        bind(c, name="cusolverDnZhetrd_bufferSize")
#else
    function hipsolverDnZhetrd_bufferSize_(handle,uplo,n,A,lda,D,E,tau,lwork) &
        bind(c, name="hipsolverDnZhetrd_bufferSize")
#endif
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
  end interface

  interface hipsolverDnSsytrd
#ifdef USE_CUDA_NAMES
    function hipsolverDnSsytrd_(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo) &
        bind(c, name="cusolverDnSsytrd")
#else
    function hipsolverDnSsytrd_(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnSsytrd")
#endif
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
  end interface

  interface hipsolverDnDsytrd
#ifdef USE_CUDA_NAMES
    function hipsolverDnDsytrd_(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo) &
        bind(c, name="cusolverDnDsytrd")
#else
    function hipsolverDnDsytrd_(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnDsytrd")
#endif
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
  end interface

  interface hipsolverDnChetrd
#ifdef USE_CUDA_NAMES
    function hipsolverDnChetrd_(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo) &
        bind(c, name="cusolverDnChetrd")
#else
    function hipsolverDnChetrd_(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnChetrd")
#endif
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
  end interface

  interface hipsolverDnZhetrd
#ifdef USE_CUDA_NAMES
    function hipsolverDnZhetrd_(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo) &
        bind(c, name="cusolverDnZhetrd")
#else
    function hipsolverDnZhetrd_(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo) &
        bind(c, name="hipsolverDnZhetrd")
#endif
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
  end interface

  interface hipsolverDnSsytrf_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnSsytrf_bufferSize_(handle,n,A,lda,lwork) &
        bind(c, name="cusolverDnSsytrf_bufferSize")
#else
    function hipsolverDnSsytrf_bufferSize_(handle,n,A,lda,lwork) &
        bind(c, name="hipsolverDnSsytrf_bufferSize")
#endif
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
  end interface

  interface hipsolverDnDsytrf_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnDsytrf_bufferSize_(handle,n,A,lda,lwork) &
        bind(c, name="cusolverDnDsytrf_bufferSize")
#else
    function hipsolverDnDsytrf_bufferSize_(handle,n,A,lda,lwork) &
        bind(c, name="hipsolverDnDsytrf_bufferSize")
#endif
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
  end interface

  interface hipsolverDnCsytrf_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnCsytrf_bufferSize_(handle,n,A,lda,lwork) &
        bind(c, name="cusolverDnCsytrf_bufferSize")
#else
    function hipsolverDnCsytrf_bufferSize_(handle,n,A,lda,lwork) &
        bind(c, name="hipsolverDnCsytrf_bufferSize")
#endif
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
  end interface

  interface hipsolverDnZsytrf_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnZsytrf_bufferSize_(handle,n,A,lda,lwork) &
        bind(c, name="cusolverDnZsytrf_bufferSize")
#else
    function hipsolverDnZsytrf_bufferSize_(handle,n,A,lda,lwork) &
        bind(c, name="hipsolverDnZsytrf_bufferSize")
#endif
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
  end interface

  interface hipsolverDnSsytrf
#ifdef USE_CUDA_NAMES
    function hipsolverDnSsytrf_(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo) &
        bind(c, name="cusolverDnSsytrf")
#else
    function hipsolverDnSsytrf_(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo) &
        bind(c, name="hipsolverDnSsytrf")
#endif
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
  end interface

  interface hipsolverDnDsytrf
#ifdef USE_CUDA_NAMES
    function hipsolverDnDsytrf_(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo) &
        bind(c, name="cusolverDnDsytrf")
#else
    function hipsolverDnDsytrf_(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo) &
        bind(c, name="hipsolverDnDsytrf")
#endif
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
  end interface

  interface hipsolverDnCsytrf
#ifdef USE_CUDA_NAMES
    function hipsolverDnCsytrf_(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo) &
        bind(c, name="cusolverDnCsytrf")
#else
    function hipsolverDnCsytrf_(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo) &
        bind(c, name="hipsolverDnCsytrf")
#endif
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
  end interface

  interface hipsolverDnZsytrf
#ifdef USE_CUDA_NAMES
    function hipsolverDnZsytrf_(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo) &
        bind(c, name="cusolverDnZsytrf")
#else
    function hipsolverDnZsytrf_(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo) &
        bind(c, name="hipsolverDnZsytrf")
#endif
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
  end interface

  interface hipsolverDnCreateParams
#ifdef USE_CUDA_NAMES
    function hipsolverDnCreateParams_(params) bind(c, name="cusolverDnCreateParams")
#else
    function hipsolverDnCreateParams_(params) bind(c, name="hipsolverDnCreateParams")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnCreateParams_
      type(c_ptr) :: params
    end function
  end interface

  interface hipsolverDnDestroyParams
#ifdef USE_CUDA_NAMES
    function hipsolverDnDestroyParams_(params) bind(c, name="cusolverDnDestroyParams")
#else
    function hipsolverDnDestroyParams_(params) bind(c, name="hipsolverDnDestroyParams")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnDestroyParams_
      type(c_ptr),value :: params
    end function
  end interface

  interface hipsolverDnSetAdvOptions
#ifdef USE_CUDA_NAMES
    function hipsolverDnSetAdvOptions_(params,func,alg) bind(c, name="cusolverDnSetAdvOptions")
#else
    function hipsolverDnSetAdvOptions_(params,func,alg) bind(c, name="hipsolverDnSetAdvOptions")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDnSetAdvOptions_
      type(c_ptr),value :: params
      integer(kind(HIPSOLVERDN_GETRF)),value :: func
      integer(kind(HIPSOLVER_ALG_0)),value :: alg
    end function
  end interface

  interface hipsolverDnXgeev_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnXgeev_bufferSize_(handle,params,jobvl,jobvr,n,dataTypeA,A,lda,dataTypeW,W, &
        dataTypeVL,VL,ldvl,dataTypeVR,VR,ldvr,computeType,lworkOnDevice,lworkOnHost) &
        bind(c, name="cusolverDnXgeev_bufferSize")
#else
    function hipsolverDnXgeev_bufferSize_(handle,params,jobvl,jobvr,n,dataTypeA,A,lda,dataTypeW,W, &
        dataTypeVL,VL,ldvl,dataTypeVR,VR,ldvr,computeType,lworkOnDevice,lworkOnHost) &
        bind(c, name="hipsolverDnXgeev_bufferSize")
#endif
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
  end interface

  interface hipsolverDnXgeev
#ifdef USE_CUDA_NAMES
    function hipsolverDnXgeev_(handle,params,jobvl,jobvr,n,dataTypeA,A,lda,dataTypeW,W,dataTypeVL, &
        VL,ldvl,dataTypeVR,VR,ldvr,computeType,workOnDevice,lworkOnDevice,workOnHost,lworkOnHost, &
        devInfo) &
        bind(c, name="cusolverDnXgeev")
#else
    function hipsolverDnXgeev_(handle,params,jobvl,jobvr,n,dataTypeA,A,lda,dataTypeW,W,dataTypeVL, &
        VL,ldvl,dataTypeVR,VR,ldvr,computeType,workOnDevice,lworkOnDevice,workOnHost,lworkOnHost, &
        devInfo) &
        bind(c, name="hipsolverDnXgeev")
#endif
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
  end interface

  interface hipsolverDnXgeqrf_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnXgeqrf_bufferSize_(handle,params,m,n,dataTypeA,A,lda,dataTypeTau,tau, &
        computeType,lworkOnDevice,lworkOnHost) &
        bind(c, name="cusolverDnXgeqrf_bufferSize")
#else
    function hipsolverDnXgeqrf_bufferSize_(handle,params,m,n,dataTypeA,A,lda,dataTypeTau,tau, &
        computeType,lworkOnDevice,lworkOnHost) &
        bind(c, name="hipsolverDnXgeqrf_bufferSize")
#endif
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
  end interface

  interface hipsolverDnXgeqrf
#ifdef USE_CUDA_NAMES
    function hipsolverDnXgeqrf_(handle,params,m,n,dataTypeA,A,lda,dataTypeTau,tau,computeType, &
        workOnDevice,lworkOnDevice,workOnHost,lworkOnHost,devInfo) &
        bind(c, name="cusolverDnXgeqrf")
#else
    function hipsolverDnXgeqrf_(handle,params,m,n,dataTypeA,A,lda,dataTypeTau,tau,computeType, &
        workOnDevice,lworkOnDevice,workOnHost,lworkOnHost,devInfo) &
        bind(c, name="hipsolverDnXgeqrf")
#endif
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
  end interface

  interface hipsolverDnXgetrf_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnXgetrf_bufferSize_(handle,params,m,n,dataTypeA,A,lda,computeType, &
        lworkOnDevice,lworkOnHost) &
        bind(c, name="cusolverDnXgetrf_bufferSize")
#else
    function hipsolverDnXgetrf_bufferSize_(handle,params,m,n,dataTypeA,A,lda,computeType, &
        lworkOnDevice,lworkOnHost) &
        bind(c, name="hipsolverDnXgetrf_bufferSize")
#endif
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
  end interface

  interface hipsolverDnXgetrf
#ifdef USE_CUDA_NAMES
    function hipsolverDnXgetrf_(handle,params,m,n,dataTypeA,A,lda,devIpiv,computeType, &
        workOnDevice,lworkOnDevice,workOnHost,lworkOnHost,devInfo) &
        bind(c, name="cusolverDnXgetrf")
#else
    function hipsolverDnXgetrf_(handle,params,m,n,dataTypeA,A,lda,devIpiv,computeType, &
        workOnDevice,lworkOnDevice,workOnHost,lworkOnHost,devInfo) &
        bind(c, name="hipsolverDnXgetrf")
#endif
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
  end interface

  interface hipsolverDnXgetrs
#ifdef USE_CUDA_NAMES
    function hipsolverDnXgetrs_(handle,params,trans,n,nrhs,dataTypeA,A,lda,devIpiv,dataTypeB,B, &
        ldb,devInfo) &
        bind(c, name="cusolverDnXgetrs")
#else
    function hipsolverDnXgetrs_(handle,params,trans,n,nrhs,dataTypeA,A,lda,devIpiv,dataTypeB,B, &
        ldb,devInfo) &
        bind(c, name="hipsolverDnXgetrs")
#endif
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
  end interface

  interface hipsolverDnXpotrf_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnXpotrf_bufferSize_(handle,params,uplo,n,dataTypeA,A,lda,computeType, &
        lworkOnDevice,lworkOnHost) &
        bind(c, name="cusolverDnXpotrf_bufferSize")
#else
    function hipsolverDnXpotrf_bufferSize_(handle,params,uplo,n,dataTypeA,A,lda,computeType, &
        lworkOnDevice,lworkOnHost) &
        bind(c, name="hipsolverDnXpotrf_bufferSize")
#endif
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
  end interface

  interface hipsolverDnXpotrf
#ifdef USE_CUDA_NAMES
    function hipsolverDnXpotrf_(handle,params,uplo,n,dataTypeA,A,lda,computeType,workOnDevice, &
        lworkOnDevice,workOnHost,lworkOnHost,myInfo) &
        bind(c, name="cusolverDnXpotrf")
#else
    function hipsolverDnXpotrf_(handle,params,uplo,n,dataTypeA,A,lda,computeType,workOnDevice, &
        lworkOnDevice,workOnHost,lworkOnHost,myInfo) &
        bind(c, name="hipsolverDnXpotrf")
#endif
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
  end interface

  interface hipsolverDnXpotrs
#ifdef USE_CUDA_NAMES
    function hipsolverDnXpotrs_(handle,params,uplo,n,nrhs,dataTypeA,A,lda,dataTypeB,B,ldb,myInfo) &
        bind(c, name="cusolverDnXpotrs")
#else
    function hipsolverDnXpotrs_(handle,params,uplo,n,nrhs,dataTypeA,A,lda,dataTypeB,B,ldb,myInfo) &
        bind(c, name="hipsolverDnXpotrs")
#endif
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
  end interface

  interface hipsolverDnXsyevd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnXsyevd_bufferSize_(handle,params,jobz,uplo,n,dataTypeA,A,lda,dataTypeW,W, &
        computeType,lworkOnDevice,lworkOnHost) &
        bind(c, name="cusolverDnXsyevd_bufferSize")
#else
    function hipsolverDnXsyevd_bufferSize_(handle,params,jobz,uplo,n,dataTypeA,A,lda,dataTypeW,W, &
        computeType,lworkOnDevice,lworkOnHost) &
        bind(c, name="hipsolverDnXsyevd_bufferSize")
#endif
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
  end interface

  interface hipsolverDnXsyevd
#ifdef USE_CUDA_NAMES
    function hipsolverDnXsyevd_(handle,params,jobz,uplo,n,dataTypeA,A,lda,dataTypeW,W,computeType, &
        workOnDevice,lworkOnDevice,workOnHost,lworkOnHost,devInfo) &
        bind(c, name="cusolverDnXsyevd")
#else
    function hipsolverDnXsyevd_(handle,params,jobz,uplo,n,dataTypeA,A,lda,dataTypeW,W,computeType, &
        workOnDevice,lworkOnDevice,workOnHost,lworkOnHost,devInfo) &
        bind(c, name="hipsolverDnXsyevd")
#endif
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
  end interface

  interface hipsolverDnXsyevBatched_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnXsyevBatched_bufferSize_(handle,params,jobz,uplo,n,dataTypeA,A,lda, &
        dataTypeW,W,computeType,lworkOnDevice,lworkOnHost,batchSize) &
        bind(c, name="cusolverDnXsyevBatched_bufferSize")
#else
    function hipsolverDnXsyevBatched_bufferSize_(handle,params,jobz,uplo,n,dataTypeA,A,lda, &
        dataTypeW,W,computeType,lworkOnDevice,lworkOnHost,batchSize) &
        bind(c, name="hipsolverDnXsyevBatched_bufferSize")
#endif
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
  end interface

  interface hipsolverDnXsyevBatched
#ifdef USE_CUDA_NAMES
    function hipsolverDnXsyevBatched_(handle,params,jobz,uplo,n,dataTypeA,A,lda,dataTypeW,W, &
        computeType,workOnDevice,lworkOnDevice,workOnHost,lworkOnHost,devInfo,batchSize) &
        bind(c, name="cusolverDnXsyevBatched")
#else
    function hipsolverDnXsyevBatched_(handle,params,jobz,uplo,n,dataTypeA,A,lda,dataTypeW,W, &
        computeType,workOnDevice,lworkOnDevice,workOnHost,lworkOnHost,devInfo,batchSize) &
        bind(c, name="hipsolverDnXsyevBatched")
#endif
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
  end interface

  interface hipsolverDnXsytrs_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDnXsytrs_bufferSize_(handle,uplo,n,nrhs,dataTypeA,A,lda,devIpiv,dataTypeB,B, &
        ldb,lworkOnDevice,lworkOnHost) &
        bind(c, name="cusolverDnXsytrs_bufferSize")
#else
    function hipsolverDnXsytrs_bufferSize_(handle,uplo,n,nrhs,dataTypeA,A,lda,devIpiv,dataTypeB,B, &
        ldb,lworkOnDevice,lworkOnHost) &
        bind(c, name="hipsolverDnXsytrs_bufferSize")
#endif
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
  end interface

  interface hipsolverDnXsytrs
#ifdef USE_CUDA_NAMES
    function hipsolverDnXsytrs_(handle,uplo,n,nrhs,dataTypeA,A,lda,devIpiv,dataTypeB,B,ldb, &
        workOnDevice,lworkOnDevice,workOnHost,lworkOnHost,devInfo) &
        bind(c, name="cusolverDnXsytrs")
#else
    function hipsolverDnXsytrs_(handle,uplo,n,nrhs,dataTypeA,A,lda,devIpiv,dataTypeB,B,ldb, &
        workOnDevice,lworkOnDevice,workOnHost,lworkOnHost,devInfo) &
        bind(c, name="hipsolverDnXsytrs")
#endif
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
  end interface

  interface hipsolverRfCreate
#ifdef USE_CUDA_NAMES
    function hipsolverRfCreate_(handle) bind(c, name="cusolverRfCreate")
#else
    function hipsolverRfCreate_(handle) bind(c, name="hipsolverRfCreate")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfCreate_
      type(c_ptr) :: handle
    end function
  end interface

  interface hipsolverRfDestroy
#ifdef USE_CUDA_NAMES
    function hipsolverRfDestroy_(handle) bind(c, name="cusolverRfDestroy")
#else
    function hipsolverRfDestroy_(handle) bind(c, name="hipsolverRfDestroy")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfDestroy_
      type(c_ptr),value :: handle
    end function
  end interface

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

  interface hipsolverRfAnalyze
#ifdef USE_CUDA_NAMES
    function hipsolverRfAnalyze_(handle) bind(c, name="cusolverRfAnalyze")
#else
    function hipsolverRfAnalyze_(handle) bind(c, name="hipsolverRfAnalyze")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfAnalyze_
      type(c_ptr),value :: handle
    end function
  end interface

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

  interface hipsolverRfGetMatrixFormat
#ifdef USE_CUDA_NAMES
    function hipsolverRfGetMatrixFormat_(handle,myFormat,diag) &
        bind(c, name="cusolverRfGetMatrixFormat")
#else
    function hipsolverRfGetMatrixFormat_(handle,myFormat,diag) &
        bind(c, name="hipsolverRfGetMatrixFormat")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfGetMatrixFormat_
      type(c_ptr),value :: handle
      type(c_ptr),value :: myFormat
      type(c_ptr),value :: diag
    end function
  end interface

  interface hipsolverRfGetNumericBoostReport
#ifdef USE_CUDA_NAMES
    function hipsolverRfGetNumericBoostReport_(handle,report) &
        bind(c, name="cusolverRfGetNumericBoostReport")
#else
    function hipsolverRfGetNumericBoostReport_(handle,report) &
        bind(c, name="hipsolverRfGetNumericBoostReport")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfGetNumericBoostReport_
      type(c_ptr),value :: handle
      type(c_ptr),value :: report
    end function
  end interface

  interface hipsolverRfGetNumericProperties
#ifdef USE_CUDA_NAMES
    function hipsolverRfGetNumericProperties_(handle,zero,boost) &
        bind(c, name="cusolverRfGetNumericProperties")
#else
    function hipsolverRfGetNumericProperties_(handle,zero,boost) &
        bind(c, name="hipsolverRfGetNumericProperties")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfGetNumericProperties_
      type(c_ptr),value :: handle
      real(c_double) :: zero
      real(c_double) :: boost
    end function
  end interface

  interface hipsolverRfGetResetValuesFastMode
#ifdef USE_CUDA_NAMES
    function hipsolverRfGetResetValuesFastMode_(handle,fastMode) &
        bind(c, name="cusolverRfGetResetValuesFastMode")
#else
    function hipsolverRfGetResetValuesFastMode_(handle,fastMode) &
        bind(c, name="hipsolverRfGetResetValuesFastMode")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfGetResetValuesFastMode_
      type(c_ptr),value :: handle
      type(c_ptr),value :: fastMode
    end function
  end interface

  interface hipsolverRfRefactor
#ifdef USE_CUDA_NAMES
    function hipsolverRfRefactor_(handle) bind(c, name="cusolverRfRefactor")
#else
    function hipsolverRfRefactor_(handle) bind(c, name="hipsolverRfRefactor")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfRefactor_
      type(c_ptr),value :: handle
    end function
  end interface

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

  interface hipsolverRfSetAlgs
#ifdef USE_CUDA_NAMES
    function hipsolverRfSetAlgs_(handle,fact_alg,solve_alg) bind(c, name="cusolverRfSetAlgs")
#else
    function hipsolverRfSetAlgs_(handle,fact_alg,solve_alg) bind(c, name="hipsolverRfSetAlgs")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfSetAlgs_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVERRF_FACTORIZATION_ALG0)),value :: fact_alg
      integer(kind(HIPSOLVERRF_TRIANGULAR_SOLVE_ALG1)),value :: solve_alg
    end function
  end interface

  interface hipsolverRfSetMatrixFormat
#ifdef USE_CUDA_NAMES
    function hipsolverRfSetMatrixFormat_(handle,myFormat,diag) &
        bind(c, name="cusolverRfSetMatrixFormat")
#else
    function hipsolverRfSetMatrixFormat_(handle,myFormat,diag) &
        bind(c, name="hipsolverRfSetMatrixFormat")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfSetMatrixFormat_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVERRF_MATRIX_FORMAT_CSR)),value :: myFormat
      integer(kind(HIPSOLVERRF_UNIT_DIAGONAL_STORED_L)),value :: diag
    end function
  end interface

  interface hipsolverRfSetNumericProperties
#ifdef USE_CUDA_NAMES
    function hipsolverRfSetNumericProperties_(handle,effective_zero,boost_val) &
        bind(c, name="cusolverRfSetNumericProperties")
#else
    function hipsolverRfSetNumericProperties_(handle,effective_zero,boost_val) &
        bind(c, name="hipsolverRfSetNumericProperties")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfSetNumericProperties_
      type(c_ptr),value :: handle
      real(c_double),value :: effective_zero
      real(c_double),value :: boost_val
    end function
  end interface

  interface hipsolverRfSetResetValuesFastMode
#ifdef USE_CUDA_NAMES
    function hipsolverRfSetResetValuesFastMode_(handle,fastMode) &
        bind(c, name="cusolverRfSetResetValuesFastMode")
#else
    function hipsolverRfSetResetValuesFastMode_(handle,fastMode) &
        bind(c, name="hipsolverRfSetResetValuesFastMode")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfSetResetValuesFastMode_
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVERRF_RESET_VALUES_FAST_MODE_OFF)),value :: fastMode
    end function
  end interface

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

  interface hipsolverRfBatchAnalyze
#ifdef USE_CUDA_NAMES
    function hipsolverRfBatchAnalyze_(handle) bind(c, name="cusolverRfBatchAnalyze")
#else
    function hipsolverRfBatchAnalyze_(handle) bind(c, name="hipsolverRfBatchAnalyze")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfBatchAnalyze_
      type(c_ptr),value :: handle
    end function
  end interface

  interface hipsolverRfBatchRefactor
#ifdef USE_CUDA_NAMES
    function hipsolverRfBatchRefactor_(handle) bind(c, name="cusolverRfBatchRefactor")
#else
    function hipsolverRfBatchRefactor_(handle) bind(c, name="hipsolverRfBatchRefactor")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfBatchRefactor_
      type(c_ptr),value :: handle
    end function
  end interface

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

  interface hipsolverRfBatchZeroPivot
#ifdef USE_CUDA_NAMES
    function hipsolverRfBatchZeroPivot_(handle,position) bind(c, name="cusolverRfBatchZeroPivot")
#else
    function hipsolverRfBatchZeroPivot_(handle,position) bind(c, name="hipsolverRfBatchZeroPivot")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverRfBatchZeroPivot_
      type(c_ptr),value :: handle
      integer(c_int) :: position
    end function
  end interface

  interface hipsolverSpCreate
#ifdef USE_CUDA_NAMES
    function hipsolverSpCreate_(handle) bind(c, name="cusolverSpCreate")
#else
    function hipsolverSpCreate_(handle) bind(c, name="hipsolverSpCreate")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpCreate_
      type(c_ptr) :: handle
    end function
  end interface

  interface hipsolverSpDestroy
#ifdef USE_CUDA_NAMES
    function hipsolverSpDestroy_(handle) bind(c, name="cusolverSpDestroy")
#else
    function hipsolverSpDestroy_(handle) bind(c, name="hipsolverSpDestroy")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpDestroy_
      type(c_ptr),value :: handle
    end function
  end interface

  interface hipsolverSpSetStream
#ifdef USE_CUDA_NAMES
    function hipsolverSpSetStream_(handle,streamId) bind(c, name="cusolverSpSetStream")
#else
    function hipsolverSpSetStream_(handle,streamId) bind(c, name="hipsolverSpSetStream")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpSetStream_
      type(c_ptr),value :: handle
      type(c_ptr),value :: streamId
    end function
  end interface

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

#ifndef USE_CUDA_NAMES
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
  end interface
#endif

  interface hipsolverSpDcsrlsvcholHost
#ifdef USE_CUDA_NAMES
    function hipsolverSpDcsrlsvcholHost_(handle,n,nnzA,descrA,csrVal,csrRowPtr,csrColInd,b, &
        tolerance,reorder,x,singularity) &
        bind(c, name="cusolverSpDcsrlsvcholHost")
#else
    function hipsolverSpDcsrlsvcholHost_(handle,n,nnzA,descrA,csrVal,csrRowPtr,csrColInd,b, &
        tolerance,reorder,x,singularity) &
        bind(c, name="hipsolverSpDcsrlsvcholHost")
#endif
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
  end interface

  interface hipsolverSpScsrlsvqr
#ifdef USE_CUDA_NAMES
    function hipsolverSpScsrlsvqr_(handle,n,nnz,descrA,csrVal,csrRowPts,csrColInd,b,tolerance, &
        reorder,x,singularity) &
        bind(c, name="cusolverSpScsrlsvqr")
#else
    function hipsolverSpScsrlsvqr_(handle,n,nnz,descrA,csrVal,csrRowPts,csrColInd,b,tolerance, &
        reorder,x,singularity) &
        bind(c, name="hipsolverSpScsrlsvqr")
#endif
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
  end interface

  interface hipsolverSpDcsrlsvqr
#ifdef USE_CUDA_NAMES
    function hipsolverSpDcsrlsvqr_(handle,n,nnz,descrA,csrVal,csrRowPts,csrColInd,b,tolerance, &
        reorder,x,singularity) &
        bind(c, name="cusolverSpDcsrlsvqr")
#else
    function hipsolverSpDcsrlsvqr_(handle,n,nnz,descrA,csrVal,csrRowPts,csrColInd,b,tolerance, &
        reorder,x,singularity) &
        bind(c, name="hipsolverSpDcsrlsvqr")
#endif
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
  end interface

  interface hipsolverSpCcsrlsvqr
#ifdef USE_CUDA_NAMES
    function hipsolverSpCcsrlsvqr_(handle,n,nnz,descrA,csrVal,csrRowPts,csrColInd,b,tolerance, &
        reorder,x,singularity) &
        bind(c, name="cusolverSpCcsrlsvqr")
#else
    function hipsolverSpCcsrlsvqr_(handle,n,nnz,descrA,csrVal,csrRowPts,csrColInd,b,tolerance, &
        reorder,x,singularity) &
        bind(c, name="hipsolverSpCcsrlsvqr")
#endif
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
  end interface

  interface hipsolverSpZcsrlsvqr
#ifdef USE_CUDA_NAMES
    function hipsolverSpZcsrlsvqr_(handle,n,nnz,descrA,csrVal,csrRowPts,csrColInd,b,tolerance, &
        reorder,x,singularity) &
        bind(c, name="cusolverSpZcsrlsvqr")
#else
    function hipsolverSpZcsrlsvqr_(handle,n,nnz,descrA,csrVal,csrRowPts,csrColInd,b,tolerance, &
        reorder,x,singularity) &
        bind(c, name="hipsolverSpZcsrlsvqr")
#endif
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
  end interface


#ifdef USE_FPOINTER_INTERFACES
  contains

#ifndef USE_CUDA_NAMES
    function hipsolverSorgbr_bufferSize_rank_0(handle,side,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgbr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      integer(c_int) :: lwork
      !
      hipsolverSorgbr_bufferSize_rank_0 = hipsolverSorgbr_bufferSize_(handle,side,m,n,k,c_loc(A), &
        lda,tau,lwork)
    end function

    function hipsolverSorgbr_bufferSize_rank_1(handle,side,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgbr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      integer(c_int) :: lwork
      !
      hipsolverSorgbr_bufferSize_rank_1 = hipsolverSorgbr_bufferSize_(handle,side,m,n,k,c_loc(A), &
        lda,tau,lwork)
    end function

    function hipsolverSorgbr_bufferSize_full_rank(handle,side,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgbr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      integer(c_int) :: lwork
      !
      hipsolverSorgbr_bufferSize_full_rank = hipsolverSorgbr_bufferSize_(handle,side,m,n,k, &
        c_loc(A),lda,tau,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverDorgbr_bufferSize_rank_0(handle,side,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgbr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      integer(c_int) :: lwork
      !
      hipsolverDorgbr_bufferSize_rank_0 = hipsolverDorgbr_bufferSize_(handle,side,m,n,k,c_loc(A), &
        lda,tau,lwork)
    end function

    function hipsolverDorgbr_bufferSize_rank_1(handle,side,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgbr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      integer(c_int) :: lwork
      !
      hipsolverDorgbr_bufferSize_rank_1 = hipsolverDorgbr_bufferSize_(handle,side,m,n,k,c_loc(A), &
        lda,tau,lwork)
    end function

    function hipsolverDorgbr_bufferSize_full_rank(handle,side,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgbr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      integer(c_int) :: lwork
      !
      hipsolverDorgbr_bufferSize_full_rank = hipsolverDorgbr_bufferSize_(handle,side,m,n,k, &
        c_loc(A),lda,tau,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverCungbr_bufferSize_rank_0(handle,side,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungbr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverCungbr_bufferSize_rank_0 = hipsolverCungbr_bufferSize_(handle,side,m,n,k,c_loc(A), &
        lda,tau,lwork)
    end function

    function hipsolverCungbr_bufferSize_rank_1(handle,side,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungbr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverCungbr_bufferSize_rank_1 = hipsolverCungbr_bufferSize_(handle,side,m,n,k,c_loc(A), &
        lda,tau,lwork)
    end function

    function hipsolverCungbr_bufferSize_full_rank(handle,side,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungbr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverCungbr_bufferSize_full_rank = hipsolverCungbr_bufferSize_(handle,side,m,n,k, &
        c_loc(A),lda,tau,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverZungbr_bufferSize_rank_0(handle,side,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungbr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverZungbr_bufferSize_rank_0 = hipsolverZungbr_bufferSize_(handle,side,m,n,k,c_loc(A), &
        lda,tau,lwork)
    end function

    function hipsolverZungbr_bufferSize_rank_1(handle,side,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungbr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverZungbr_bufferSize_rank_1 = hipsolverZungbr_bufferSize_(handle,side,m,n,k,c_loc(A), &
        lda,tau,lwork)
    end function

    function hipsolverZungbr_bufferSize_full_rank(handle,side,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungbr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverZungbr_bufferSize_full_rank = hipsolverZungbr_bufferSize_(handle,side,m,n,k, &
        c_loc(A),lda,tau,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverSorgbr_rank_0(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgbr_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSorgbr_rank_0 = hipsolverSorgbr_(handle,side,m,n,k,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

    function hipsolverSorgbr_rank_1(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgbr_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSorgbr_rank_1 = hipsolverSorgbr_(handle,side,m,n,k,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

    function hipsolverSorgbr_full_rank(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgbr_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSorgbr_full_rank = hipsolverSorgbr_(handle,side,m,n,k,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverDorgbr_rank_0(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgbr_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDorgbr_rank_0 = hipsolverDorgbr_(handle,side,m,n,k,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

    function hipsolverDorgbr_rank_1(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgbr_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDorgbr_rank_1 = hipsolverDorgbr_(handle,side,m,n,k,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

    function hipsolverDorgbr_full_rank(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgbr_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDorgbr_full_rank = hipsolverDorgbr_(handle,side,m,n,k,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverCungbr_rank_0(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungbr_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCungbr_rank_0 = hipsolverCungbr_(handle,side,m,n,k,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

    function hipsolverCungbr_rank_1(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungbr_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCungbr_rank_1 = hipsolverCungbr_(handle,side,m,n,k,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

    function hipsolverCungbr_full_rank(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungbr_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCungbr_full_rank = hipsolverCungbr_(handle,side,m,n,k,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverZungbr_rank_0(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungbr_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZungbr_rank_0 = hipsolverZungbr_(handle,side,m,n,k,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

    function hipsolverZungbr_rank_1(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungbr_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZungbr_rank_1 = hipsolverZungbr_(handle,side,m,n,k,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

    function hipsolverZungbr_full_rank(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungbr_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZungbr_full_rank = hipsolverZungbr_(handle,side,m,n,k,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverSorgqr_bufferSize_rank_0(handle,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgqr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      integer(c_int) :: lwork
      !
      hipsolverSorgqr_bufferSize_rank_0 = hipsolverSorgqr_bufferSize_(handle,m,n,k,c_loc(A),lda, &
        tau,lwork)
    end function

    function hipsolverSorgqr_bufferSize_rank_1(handle,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgqr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      integer(c_int) :: lwork
      !
      hipsolverSorgqr_bufferSize_rank_1 = hipsolverSorgqr_bufferSize_(handle,m,n,k,c_loc(A),lda, &
        tau,lwork)
    end function

    function hipsolverSorgqr_bufferSize_full_rank(handle,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgqr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      integer(c_int) :: lwork
      !
      hipsolverSorgqr_bufferSize_full_rank = hipsolverSorgqr_bufferSize_(handle,m,n,k,c_loc(A), &
        lda,tau,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverDorgqr_bufferSize_rank_0(handle,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgqr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      integer(c_int) :: lwork
      !
      hipsolverDorgqr_bufferSize_rank_0 = hipsolverDorgqr_bufferSize_(handle,m,n,k,c_loc(A),lda, &
        tau,lwork)
    end function

    function hipsolverDorgqr_bufferSize_rank_1(handle,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgqr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      integer(c_int) :: lwork
      !
      hipsolverDorgqr_bufferSize_rank_1 = hipsolverDorgqr_bufferSize_(handle,m,n,k,c_loc(A),lda, &
        tau,lwork)
    end function

    function hipsolverDorgqr_bufferSize_full_rank(handle,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgqr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      integer(c_int) :: lwork
      !
      hipsolverDorgqr_bufferSize_full_rank = hipsolverDorgqr_bufferSize_(handle,m,n,k,c_loc(A), &
        lda,tau,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverCungqr_bufferSize_rank_0(handle,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungqr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverCungqr_bufferSize_rank_0 = hipsolverCungqr_bufferSize_(handle,m,n,k,c_loc(A),lda, &
        tau,lwork)
    end function

    function hipsolverCungqr_bufferSize_rank_1(handle,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungqr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverCungqr_bufferSize_rank_1 = hipsolverCungqr_bufferSize_(handle,m,n,k,c_loc(A),lda, &
        tau,lwork)
    end function

    function hipsolverCungqr_bufferSize_full_rank(handle,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungqr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverCungqr_bufferSize_full_rank = hipsolverCungqr_bufferSize_(handle,m,n,k,c_loc(A), &
        lda,tau,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverZungqr_bufferSize_rank_0(handle,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungqr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverZungqr_bufferSize_rank_0 = hipsolverZungqr_bufferSize_(handle,m,n,k,c_loc(A),lda, &
        tau,lwork)
    end function

    function hipsolverZungqr_bufferSize_rank_1(handle,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungqr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverZungqr_bufferSize_rank_1 = hipsolverZungqr_bufferSize_(handle,m,n,k,c_loc(A),lda, &
        tau,lwork)
    end function

    function hipsolverZungqr_bufferSize_full_rank(handle,m,n,k,A,lda,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungqr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverZungqr_bufferSize_full_rank = hipsolverZungqr_bufferSize_(handle,m,n,k,c_loc(A), &
        lda,tau,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverSorgqr_rank_0(handle,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgqr_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSorgqr_rank_0 = hipsolverSorgqr_(handle,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverSorgqr_rank_1(handle,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgqr_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSorgqr_rank_1 = hipsolverSorgqr_(handle,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverSorgqr_full_rank(handle,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgqr_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSorgqr_full_rank = hipsolverSorgqr_(handle,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverDorgqr_rank_0(handle,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgqr_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDorgqr_rank_0 = hipsolverDorgqr_(handle,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverDorgqr_rank_1(handle,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgqr_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDorgqr_rank_1 = hipsolverDorgqr_(handle,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverDorgqr_full_rank(handle,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgqr_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDorgqr_full_rank = hipsolverDorgqr_(handle,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverCungqr_rank_0(handle,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungqr_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCungqr_rank_0 = hipsolverCungqr_(handle,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverCungqr_rank_1(handle,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungqr_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCungqr_rank_1 = hipsolverCungqr_(handle,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverCungqr_full_rank(handle,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungqr_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCungqr_full_rank = hipsolverCungqr_(handle,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverZungqr_rank_0(handle,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungqr_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZungqr_rank_0 = hipsolverZungqr_(handle,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverZungqr_rank_1(handle,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungqr_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZungqr_rank_1 = hipsolverZungqr_(handle,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverZungqr_full_rank(handle,m,n,k,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungqr_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZungqr_full_rank = hipsolverZungqr_(handle,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverSorgtr_bufferSize_rank_0(handle,uplo,n,A,lda,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgtr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      integer(c_int) :: lwork
      !
      hipsolverSorgtr_bufferSize_rank_0 = hipsolverSorgtr_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        tau,lwork)
    end function

    function hipsolverSorgtr_bufferSize_rank_1(handle,uplo,n,A,lda,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgtr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      integer(c_int) :: lwork
      !
      hipsolverSorgtr_bufferSize_rank_1 = hipsolverSorgtr_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        tau,lwork)
    end function

    function hipsolverSorgtr_bufferSize_full_rank(handle,uplo,n,A,lda,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgtr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      integer(c_int) :: lwork
      !
      hipsolverSorgtr_bufferSize_full_rank = hipsolverSorgtr_bufferSize_(handle,uplo,n,c_loc(A), &
        lda,tau,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverDorgtr_bufferSize_rank_0(handle,uplo,n,A,lda,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgtr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      integer(c_int) :: lwork
      !
      hipsolverDorgtr_bufferSize_rank_0 = hipsolverDorgtr_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        tau,lwork)
    end function

    function hipsolverDorgtr_bufferSize_rank_1(handle,uplo,n,A,lda,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgtr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      integer(c_int) :: lwork
      !
      hipsolverDorgtr_bufferSize_rank_1 = hipsolverDorgtr_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        tau,lwork)
    end function

    function hipsolverDorgtr_bufferSize_full_rank(handle,uplo,n,A,lda,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgtr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      integer(c_int) :: lwork
      !
      hipsolverDorgtr_bufferSize_full_rank = hipsolverDorgtr_bufferSize_(handle,uplo,n,c_loc(A), &
        lda,tau,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverCungtr_bufferSize_rank_0(handle,uplo,n,A,lda,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungtr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverCungtr_bufferSize_rank_0 = hipsolverCungtr_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        tau,lwork)
    end function

    function hipsolverCungtr_bufferSize_rank_1(handle,uplo,n,A,lda,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungtr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverCungtr_bufferSize_rank_1 = hipsolverCungtr_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        tau,lwork)
    end function

    function hipsolverCungtr_bufferSize_full_rank(handle,uplo,n,A,lda,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungtr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverCungtr_bufferSize_full_rank = hipsolverCungtr_bufferSize_(handle,uplo,n,c_loc(A), &
        lda,tau,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverZungtr_bufferSize_rank_0(handle,uplo,n,A,lda,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungtr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverZungtr_bufferSize_rank_0 = hipsolverZungtr_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        tau,lwork)
    end function

    function hipsolverZungtr_bufferSize_rank_1(handle,uplo,n,A,lda,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungtr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverZungtr_bufferSize_rank_1 = hipsolverZungtr_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        tau,lwork)
    end function

    function hipsolverZungtr_bufferSize_full_rank(handle,uplo,n,A,lda,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungtr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverZungtr_bufferSize_full_rank = hipsolverZungtr_bufferSize_(handle,uplo,n,c_loc(A), &
        lda,tau,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverSorgtr_rank_0(handle,uplo,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgtr_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSorgtr_rank_0 = hipsolverSorgtr_(handle,uplo,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverSorgtr_rank_1(handle,uplo,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgtr_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSorgtr_rank_1 = hipsolverSorgtr_(handle,uplo,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverSorgtr_full_rank(handle,uplo,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgtr_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSorgtr_full_rank = hipsolverSorgtr_(handle,uplo,n,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverDorgtr_rank_0(handle,uplo,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgtr_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDorgtr_rank_0 = hipsolverDorgtr_(handle,uplo,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverDorgtr_rank_1(handle,uplo,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgtr_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDorgtr_rank_1 = hipsolverDorgtr_(handle,uplo,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverDorgtr_full_rank(handle,uplo,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgtr_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDorgtr_full_rank = hipsolverDorgtr_(handle,uplo,n,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverCungtr_rank_0(handle,uplo,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungtr_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCungtr_rank_0 = hipsolverCungtr_(handle,uplo,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverCungtr_rank_1(handle,uplo,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungtr_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCungtr_rank_1 = hipsolverCungtr_(handle,uplo,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverCungtr_full_rank(handle,uplo,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungtr_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCungtr_full_rank = hipsolverCungtr_(handle,uplo,n,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverZungtr_rank_0(handle,uplo,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungtr_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZungtr_rank_0 = hipsolverZungtr_(handle,uplo,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverZungtr_rank_1(handle,uplo,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungtr_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZungtr_rank_1 = hipsolverZungtr_(handle,uplo,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverZungtr_full_rank(handle,uplo,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungtr_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZungtr_full_rank = hipsolverZungtr_(handle,uplo,n,c_loc(A),lda,tau,work,lwork, &
        devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverSormqr_bufferSize_rank_0(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormqr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      real(c_float),target :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverSormqr_bufferSize_rank_0 = hipsolverSormqr_bufferSize_(handle,side,trans,m,n,k, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

    function hipsolverSormqr_bufferSize_rank_1(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormqr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      real(c_float),target,dimension(:) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverSormqr_bufferSize_rank_1 = hipsolverSormqr_bufferSize_(handle,side,trans,m,n,k, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

    function hipsolverSormqr_bufferSize_full_rank(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormqr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      real(c_float),target,dimension(:,:) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverSormqr_bufferSize_full_rank = hipsolverSormqr_bufferSize_(handle,side,trans,m,n,k, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverDormqr_bufferSize_rank_0(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormqr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      real(c_double),target :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverDormqr_bufferSize_rank_0 = hipsolverDormqr_bufferSize_(handle,side,trans,m,n,k, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

    function hipsolverDormqr_bufferSize_rank_1(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormqr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      real(c_double),target,dimension(:) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverDormqr_bufferSize_rank_1 = hipsolverDormqr_bufferSize_(handle,side,trans,m,n,k, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

    function hipsolverDormqr_bufferSize_full_rank(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormqr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      real(c_double),target,dimension(:,:) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverDormqr_bufferSize_full_rank = hipsolverDormqr_bufferSize_(handle,side,trans,m,n,k, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverCunmqr_bufferSize_rank_0(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmqr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      complex(c_float_complex),target :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverCunmqr_bufferSize_rank_0 = hipsolverCunmqr_bufferSize_(handle,side,trans,m,n,k, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

    function hipsolverCunmqr_bufferSize_rank_1(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmqr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      complex(c_float_complex),target,dimension(:) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverCunmqr_bufferSize_rank_1 = hipsolverCunmqr_bufferSize_(handle,side,trans,m,n,k, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

    function hipsolverCunmqr_bufferSize_full_rank(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmqr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      complex(c_float_complex),target,dimension(:,:) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverCunmqr_bufferSize_full_rank = hipsolverCunmqr_bufferSize_(handle,side,trans,m,n,k, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverZunmqr_bufferSize_rank_0(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmqr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      complex(c_double_complex),target :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverZunmqr_bufferSize_rank_0 = hipsolverZunmqr_bufferSize_(handle,side,trans,m,n,k, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

    function hipsolverZunmqr_bufferSize_rank_1(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmqr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      complex(c_double_complex),target,dimension(:) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverZunmqr_bufferSize_rank_1 = hipsolverZunmqr_bufferSize_(handle,side,trans,m,n,k, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

    function hipsolverZunmqr_bufferSize_full_rank(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmqr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      complex(c_double_complex),target,dimension(:,:) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverZunmqr_bufferSize_full_rank = hipsolverZunmqr_bufferSize_(handle,side,trans,m,n,k, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverSormqr_rank_0(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormqr_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      real(c_float),target :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSormqr_rank_0 = hipsolverSormqr_(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C), &
        ldc,work,lwork,devInfo)
    end function

    function hipsolverSormqr_rank_1(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormqr_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      real(c_float),target,dimension(:) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSormqr_rank_1 = hipsolverSormqr_(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C), &
        ldc,work,lwork,devInfo)
    end function

    function hipsolverSormqr_full_rank(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormqr_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      real(c_float),target,dimension(:,:) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSormqr_full_rank = hipsolverSormqr_(handle,side,trans,m,n,k,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverDormqr_rank_0(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormqr_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      real(c_double),target :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDormqr_rank_0 = hipsolverDormqr_(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C), &
        ldc,work,lwork,devInfo)
    end function

    function hipsolverDormqr_rank_1(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormqr_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      real(c_double),target,dimension(:) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDormqr_rank_1 = hipsolverDormqr_(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C), &
        ldc,work,lwork,devInfo)
    end function

    function hipsolverDormqr_full_rank(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormqr_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      real(c_double),target,dimension(:,:) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDormqr_full_rank = hipsolverDormqr_(handle,side,trans,m,n,k,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverCunmqr_rank_0(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmqr_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      complex(c_float_complex),target :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCunmqr_rank_0 = hipsolverCunmqr_(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C), &
        ldc,work,lwork,devInfo)
    end function

    function hipsolverCunmqr_rank_1(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmqr_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      complex(c_float_complex),target,dimension(:) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCunmqr_rank_1 = hipsolverCunmqr_(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C), &
        ldc,work,lwork,devInfo)
    end function

    function hipsolverCunmqr_full_rank(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmqr_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      complex(c_float_complex),target,dimension(:,:) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCunmqr_full_rank = hipsolverCunmqr_(handle,side,trans,m,n,k,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverZunmqr_rank_0(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmqr_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      complex(c_double_complex),target :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZunmqr_rank_0 = hipsolverZunmqr_(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C), &
        ldc,work,lwork,devInfo)
    end function

    function hipsolverZunmqr_rank_1(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmqr_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      complex(c_double_complex),target,dimension(:) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZunmqr_rank_1 = hipsolverZunmqr_(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C), &
        ldc,work,lwork,devInfo)
    end function

    function hipsolverZunmqr_full_rank(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmqr_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      integer(c_int) :: k
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      complex(c_double_complex),target,dimension(:,:) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZunmqr_full_rank = hipsolverZunmqr_(handle,side,trans,m,n,k,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverSormtr_bufferSize_rank_0(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormtr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      real(c_float),target :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverSormtr_bufferSize_rank_0 = hipsolverSormtr_bufferSize_(handle,side,uplo,trans,m,n, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

    function hipsolverSormtr_bufferSize_rank_1(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormtr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      real(c_float),target,dimension(:) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverSormtr_bufferSize_rank_1 = hipsolverSormtr_bufferSize_(handle,side,uplo,trans,m,n, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

    function hipsolverSormtr_bufferSize_full_rank(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormtr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      real(c_float),target,dimension(:,:) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverSormtr_bufferSize_full_rank = hipsolverSormtr_bufferSize_(handle,side,uplo,trans,m, &
        n,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverDormtr_bufferSize_rank_0(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormtr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      real(c_double),target :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverDormtr_bufferSize_rank_0 = hipsolverDormtr_bufferSize_(handle,side,uplo,trans,m,n, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

    function hipsolverDormtr_bufferSize_rank_1(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormtr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      real(c_double),target,dimension(:) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverDormtr_bufferSize_rank_1 = hipsolverDormtr_bufferSize_(handle,side,uplo,trans,m,n, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

    function hipsolverDormtr_bufferSize_full_rank(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormtr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      real(c_double),target,dimension(:,:) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverDormtr_bufferSize_full_rank = hipsolverDormtr_bufferSize_(handle,side,uplo,trans,m, &
        n,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverCunmtr_bufferSize_rank_0(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmtr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      complex(c_float_complex),target :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverCunmtr_bufferSize_rank_0 = hipsolverCunmtr_bufferSize_(handle,side,uplo,trans,m,n, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

    function hipsolverCunmtr_bufferSize_rank_1(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmtr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      complex(c_float_complex),target,dimension(:) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverCunmtr_bufferSize_rank_1 = hipsolverCunmtr_bufferSize_(handle,side,uplo,trans,m,n, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

    function hipsolverCunmtr_bufferSize_full_rank(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmtr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      complex(c_float_complex),target,dimension(:,:) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverCunmtr_bufferSize_full_rank = hipsolverCunmtr_bufferSize_(handle,side,uplo,trans,m, &
        n,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverZunmtr_bufferSize_rank_0(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmtr_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      complex(c_double_complex),target :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverZunmtr_bufferSize_rank_0 = hipsolverZunmtr_bufferSize_(handle,side,uplo,trans,m,n, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

    function hipsolverZunmtr_bufferSize_rank_1(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmtr_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      complex(c_double_complex),target,dimension(:) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverZunmtr_bufferSize_rank_1 = hipsolverZunmtr_bufferSize_(handle,side,uplo,trans,m,n, &
        c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

    function hipsolverZunmtr_bufferSize_full_rank(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmtr_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      complex(c_double_complex),target,dimension(:,:) :: C
      integer(c_int) :: ldc
      integer(c_int) :: lwork
      !
      hipsolverZunmtr_bufferSize_full_rank = hipsolverZunmtr_bufferSize_(handle,side,uplo,trans,m, &
        n,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverSormtr_rank_0(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormtr_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      real(c_float),target :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSormtr_rank_0 = hipsolverSormtr_(handle,side,uplo,trans,m,n,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

    function hipsolverSormtr_rank_1(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormtr_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      real(c_float),target,dimension(:) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSormtr_rank_1 = hipsolverSormtr_(handle,side,uplo,trans,m,n,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

    function hipsolverSormtr_full_rank(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork, &
        devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormtr_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      real(c_float),target,dimension(:,:) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSormtr_full_rank = hipsolverSormtr_(handle,side,uplo,trans,m,n,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverDormtr_rank_0(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormtr_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      real(c_double),target :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDormtr_rank_0 = hipsolverDormtr_(handle,side,uplo,trans,m,n,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

    function hipsolverDormtr_rank_1(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormtr_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      real(c_double),target,dimension(:) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDormtr_rank_1 = hipsolverDormtr_(handle,side,uplo,trans,m,n,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

    function hipsolverDormtr_full_rank(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork, &
        devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormtr_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      real(c_double),target,dimension(:,:) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDormtr_full_rank = hipsolverDormtr_(handle,side,uplo,trans,m,n,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverCunmtr_rank_0(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmtr_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      complex(c_float_complex),target :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCunmtr_rank_0 = hipsolverCunmtr_(handle,side,uplo,trans,m,n,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

    function hipsolverCunmtr_rank_1(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmtr_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      complex(c_float_complex),target,dimension(:) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCunmtr_rank_1 = hipsolverCunmtr_(handle,side,uplo,trans,m,n,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

    function hipsolverCunmtr_full_rank(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork, &
        devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmtr_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      complex(c_float_complex),target,dimension(:,:) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCunmtr_full_rank = hipsolverCunmtr_(handle,side,uplo,trans,m,n,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverZunmtr_rank_0(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmtr_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      complex(c_double_complex),target :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZunmtr_rank_0 = hipsolverZunmtr_(handle,side,uplo,trans,m,n,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

    function hipsolverZunmtr_rank_1(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmtr_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      complex(c_double_complex),target,dimension(:) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZunmtr_rank_1 = hipsolverZunmtr_(handle,side,uplo,trans,m,n,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

    function hipsolverZunmtr_full_rank(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork, &
        devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmtr_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)) :: side
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      complex(c_double_complex),target,dimension(:,:) :: C
      integer(c_int) :: ldc
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZunmtr_full_rank = hipsolverZunmtr_(handle,side,uplo,trans,m,n,c_loc(A),lda,tau, &
        c_loc(C),ldc,work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverSgebrd_rank_0(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgebrd_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float),target :: D
      real(c_float),target :: E
      real(c_float),target :: tauq
      real(c_float),target :: taup
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSgebrd_rank_0 = hipsolverSgebrd_(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E), &
        c_loc(tauq),c_loc(taup),work,lwork,devInfo)
    end function

    function hipsolverSgebrd_rank_1(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgebrd_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      real(c_float),target,dimension(:) :: E
      real(c_float),target,dimension(:) :: tauq
      real(c_float),target,dimension(:) :: taup
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSgebrd_rank_1 = hipsolverSgebrd_(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E), &
        c_loc(tauq),c_loc(taup),work,lwork,devInfo)
    end function

    function hipsolverSgebrd_full_rank(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgebrd_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      real(c_float),target,dimension(:) :: E
      real(c_float),target,dimension(:) :: tauq
      real(c_float),target,dimension(:) :: taup
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSgebrd_full_rank = hipsolverSgebrd_(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E), &
        c_loc(tauq),c_loc(taup),work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverDgebrd_rank_0(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgebrd_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double),target :: D
      real(c_double),target :: E
      real(c_double),target :: tauq
      real(c_double),target :: taup
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDgebrd_rank_0 = hipsolverDgebrd_(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E), &
        c_loc(tauq),c_loc(taup),work,lwork,devInfo)
    end function

    function hipsolverDgebrd_rank_1(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgebrd_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      real(c_double),target,dimension(:) :: E
      real(c_double),target,dimension(:) :: tauq
      real(c_double),target,dimension(:) :: taup
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDgebrd_rank_1 = hipsolverDgebrd_(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E), &
        c_loc(tauq),c_loc(taup),work,lwork,devInfo)
    end function

    function hipsolverDgebrd_full_rank(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgebrd_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      real(c_double),target,dimension(:) :: E
      real(c_double),target,dimension(:) :: tauq
      real(c_double),target,dimension(:) :: taup
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDgebrd_full_rank = hipsolverDgebrd_(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E), &
        c_loc(tauq),c_loc(taup),work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverCgebrd_rank_0(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgebrd_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      real(c_float),target :: D
      real(c_float),target :: E
      complex(c_float_complex),target :: tauq
      complex(c_float_complex),target :: taup
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCgebrd_rank_0 = hipsolverCgebrd_(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E), &
        c_loc(tauq),c_loc(taup),work,lwork,devInfo)
    end function

    function hipsolverCgebrd_rank_1(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgebrd_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      real(c_float),target,dimension(:) :: E
      complex(c_float_complex),target,dimension(:) :: tauq
      complex(c_float_complex),target,dimension(:) :: taup
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCgebrd_rank_1 = hipsolverCgebrd_(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E), &
        c_loc(tauq),c_loc(taup),work,lwork,devInfo)
    end function

    function hipsolverCgebrd_full_rank(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgebrd_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      real(c_float),target,dimension(:) :: E
      complex(c_float_complex),target,dimension(:) :: tauq
      complex(c_float_complex),target,dimension(:) :: taup
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCgebrd_full_rank = hipsolverCgebrd_(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E), &
        c_loc(tauq),c_loc(taup),work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverZgebrd_rank_0(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgebrd_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      real(c_double),target :: D
      real(c_double),target :: E
      complex(c_double_complex),target :: tauq
      complex(c_double_complex),target :: taup
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZgebrd_rank_0 = hipsolverZgebrd_(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E), &
        c_loc(tauq),c_loc(taup),work,lwork,devInfo)
    end function

    function hipsolverZgebrd_rank_1(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgebrd_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      real(c_double),target,dimension(:) :: E
      complex(c_double_complex),target,dimension(:) :: tauq
      complex(c_double_complex),target,dimension(:) :: taup
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZgebrd_rank_1 = hipsolverZgebrd_(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E), &
        c_loc(tauq),c_loc(taup),work,lwork,devInfo)
    end function

    function hipsolverZgebrd_full_rank(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgebrd_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      real(c_double),target,dimension(:) :: E
      complex(c_double_complex),target,dimension(:) :: tauq
      complex(c_double_complex),target,dimension(:) :: taup
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZgebrd_full_rank = hipsolverZgebrd_(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E), &
        c_loc(tauq),c_loc(taup),work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverSgeqrf_bufferSize_rank_0(handle,m,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgeqrf_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverSgeqrf_bufferSize_rank_0 = hipsolverSgeqrf_bufferSize_(handle,m,n,c_loc(A),lda,lwork)
    end function

    function hipsolverSgeqrf_bufferSize_rank_1(handle,m,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgeqrf_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverSgeqrf_bufferSize_rank_1 = hipsolverSgeqrf_bufferSize_(handle,m,n,c_loc(A),lda,lwork)
    end function

    function hipsolverSgeqrf_bufferSize_full_rank(handle,m,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgeqrf_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverSgeqrf_bufferSize_full_rank = hipsolverSgeqrf_bufferSize_(handle,m,n,c_loc(A),lda, &
        lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverDgeqrf_bufferSize_rank_0(handle,m,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgeqrf_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverDgeqrf_bufferSize_rank_0 = hipsolverDgeqrf_bufferSize_(handle,m,n,c_loc(A),lda,lwork)
    end function

    function hipsolverDgeqrf_bufferSize_rank_1(handle,m,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgeqrf_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverDgeqrf_bufferSize_rank_1 = hipsolverDgeqrf_bufferSize_(handle,m,n,c_loc(A),lda,lwork)
    end function

    function hipsolverDgeqrf_bufferSize_full_rank(handle,m,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgeqrf_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverDgeqrf_bufferSize_full_rank = hipsolverDgeqrf_bufferSize_(handle,m,n,c_loc(A),lda, &
        lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverCgeqrf_bufferSize_rank_0(handle,m,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgeqrf_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverCgeqrf_bufferSize_rank_0 = hipsolverCgeqrf_bufferSize_(handle,m,n,c_loc(A),lda,lwork)
    end function

    function hipsolverCgeqrf_bufferSize_rank_1(handle,m,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgeqrf_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverCgeqrf_bufferSize_rank_1 = hipsolverCgeqrf_bufferSize_(handle,m,n,c_loc(A),lda,lwork)
    end function

    function hipsolverCgeqrf_bufferSize_full_rank(handle,m,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgeqrf_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverCgeqrf_bufferSize_full_rank = hipsolverCgeqrf_bufferSize_(handle,m,n,c_loc(A),lda, &
        lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverZgeqrf_bufferSize_rank_0(handle,m,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgeqrf_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverZgeqrf_bufferSize_rank_0 = hipsolverZgeqrf_bufferSize_(handle,m,n,c_loc(A),lda,lwork)
    end function

    function hipsolverZgeqrf_bufferSize_rank_1(handle,m,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgeqrf_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverZgeqrf_bufferSize_rank_1 = hipsolverZgeqrf_bufferSize_(handle,m,n,c_loc(A),lda,lwork)
    end function

    function hipsolverZgeqrf_bufferSize_full_rank(handle,m,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgeqrf_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverZgeqrf_bufferSize_full_rank = hipsolverZgeqrf_bufferSize_(handle,m,n,c_loc(A),lda, &
        lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverSgeqrf_rank_0(handle,m,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgeqrf_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSgeqrf_rank_0 = hipsolverSgeqrf_(handle,m,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverSgeqrf_rank_1(handle,m,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgeqrf_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSgeqrf_rank_1 = hipsolverSgeqrf_(handle,m,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverSgeqrf_full_rank(handle,m,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgeqrf_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSgeqrf_full_rank = hipsolverSgeqrf_(handle,m,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverDgeqrf_rank_0(handle,m,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgeqrf_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDgeqrf_rank_0 = hipsolverDgeqrf_(handle,m,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverDgeqrf_rank_1(handle,m,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgeqrf_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDgeqrf_rank_1 = hipsolverDgeqrf_(handle,m,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverDgeqrf_full_rank(handle,m,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgeqrf_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDgeqrf_full_rank = hipsolverDgeqrf_(handle,m,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverCgeqrf_rank_0(handle,m,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgeqrf_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCgeqrf_rank_0 = hipsolverCgeqrf_(handle,m,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverCgeqrf_rank_1(handle,m,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgeqrf_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCgeqrf_rank_1 = hipsolverCgeqrf_(handle,m,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverCgeqrf_full_rank(handle,m,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgeqrf_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_float_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCgeqrf_full_rank = hipsolverCgeqrf_(handle,m,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverZgeqrf_rank_0(handle,m,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgeqrf_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZgeqrf_rank_0 = hipsolverZgeqrf_(handle,m,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverZgeqrf_rank_1(handle,m,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgeqrf_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZgeqrf_rank_1 = hipsolverZgeqrf_(handle,m,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

    function hipsolverZgeqrf_full_rank(handle,m,n,A,lda,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgeqrf_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_double_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZgeqrf_full_rank = hipsolverZgeqrf_(handle,m,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverSSgesv_bufferSize_rank_0(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSSgesv_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: devIpiv
      real(c_float),target :: B
      integer(c_int) :: ldb
      real(c_float),target :: X
      integer(c_int) :: ldx
      integer(c_size_t) :: lwork
      !
      hipsolverSSgesv_bufferSize_rank_0 = hipsolverSSgesv_bufferSize_(handle,n,nrhs,c_loc(A),lda, &
        c_loc(devIpiv),c_loc(B),ldb,c_loc(X),ldx,lwork)
    end function

    function hipsolverSSgesv_bufferSize_rank_1(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSSgesv_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      real(c_float),target,dimension(:) :: B
      integer(c_int) :: ldb
      real(c_float),target,dimension(:) :: X
      integer(c_int) :: ldx
      integer(c_size_t) :: lwork
      !
      hipsolverSSgesv_bufferSize_rank_1 = hipsolverSSgesv_bufferSize_(handle,n,nrhs,c_loc(A),lda, &
        c_loc(devIpiv),c_loc(B),ldb,c_loc(X),ldx,lwork)
    end function

    function hipsolverSSgesv_bufferSize_full_rank(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSSgesv_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      real(c_float),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      real(c_float),target,dimension(:,:) :: X
      integer(c_int) :: ldx
      integer(c_size_t) :: lwork
      !
      hipsolverSSgesv_bufferSize_full_rank = hipsolverSSgesv_bufferSize_(handle,n,nrhs,c_loc(A), &
        lda,c_loc(devIpiv),c_loc(B),ldb,c_loc(X),ldx,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverDDgesv_bufferSize_rank_0(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDDgesv_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: devIpiv
      real(c_double),target :: B
      integer(c_int) :: ldb
      real(c_double),target :: X
      integer(c_int) :: ldx
      integer(c_size_t) :: lwork
      !
      hipsolverDDgesv_bufferSize_rank_0 = hipsolverDDgesv_bufferSize_(handle,n,nrhs,c_loc(A),lda, &
        c_loc(devIpiv),c_loc(B),ldb,c_loc(X),ldx,lwork)
    end function

    function hipsolverDDgesv_bufferSize_rank_1(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDDgesv_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      real(c_double),target,dimension(:) :: B
      integer(c_int) :: ldb
      real(c_double),target,dimension(:) :: X
      integer(c_int) :: ldx
      integer(c_size_t) :: lwork
      !
      hipsolverDDgesv_bufferSize_rank_1 = hipsolverDDgesv_bufferSize_(handle,n,nrhs,c_loc(A),lda, &
        c_loc(devIpiv),c_loc(B),ldb,c_loc(X),ldx,lwork)
    end function

    function hipsolverDDgesv_bufferSize_full_rank(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDDgesv_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      real(c_double),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      real(c_double),target,dimension(:,:) :: X
      integer(c_int) :: ldx
      integer(c_size_t) :: lwork
      !
      hipsolverDDgesv_bufferSize_full_rank = hipsolverDDgesv_bufferSize_(handle,n,nrhs,c_loc(A), &
        lda,c_loc(devIpiv),c_loc(B),ldb,c_loc(X),ldx,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverCCgesv_bufferSize_rank_0(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCCgesv_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: devIpiv
      complex(c_float_complex),target :: B
      integer(c_int) :: ldb
      complex(c_float_complex),target :: X
      integer(c_int) :: ldx
      integer(c_size_t) :: lwork
      !
      hipsolverCCgesv_bufferSize_rank_0 = hipsolverCCgesv_bufferSize_(handle,n,nrhs,c_loc(A),lda, &
        c_loc(devIpiv),c_loc(B),ldb,c_loc(X),ldx,lwork)
    end function

    function hipsolverCCgesv_bufferSize_rank_1(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCCgesv_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      complex(c_float_complex),target,dimension(:) :: B
      integer(c_int) :: ldb
      complex(c_float_complex),target,dimension(:) :: X
      integer(c_int) :: ldx
      integer(c_size_t) :: lwork
      !
      hipsolverCCgesv_bufferSize_rank_1 = hipsolverCCgesv_bufferSize_(handle,n,nrhs,c_loc(A),lda, &
        c_loc(devIpiv),c_loc(B),ldb,c_loc(X),ldx,lwork)
    end function

    function hipsolverCCgesv_bufferSize_full_rank(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCCgesv_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      complex(c_float_complex),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      complex(c_float_complex),target,dimension(:,:) :: X
      integer(c_int) :: ldx
      integer(c_size_t) :: lwork
      !
      hipsolverCCgesv_bufferSize_full_rank = hipsolverCCgesv_bufferSize_(handle,n,nrhs,c_loc(A), &
        lda,c_loc(devIpiv),c_loc(B),ldb,c_loc(X),ldx,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverZZgesv_bufferSize_rank_0(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZZgesv_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: devIpiv
      complex(c_double_complex),target :: B
      integer(c_int) :: ldb
      complex(c_double_complex),target :: X
      integer(c_int) :: ldx
      integer(c_size_t) :: lwork
      !
      hipsolverZZgesv_bufferSize_rank_0 = hipsolverZZgesv_bufferSize_(handle,n,nrhs,c_loc(A),lda, &
        c_loc(devIpiv),c_loc(B),ldb,c_loc(X),ldx,lwork)
    end function

    function hipsolverZZgesv_bufferSize_rank_1(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZZgesv_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      complex(c_double_complex),target,dimension(:) :: B
      integer(c_int) :: ldb
      complex(c_double_complex),target,dimension(:) :: X
      integer(c_int) :: ldx
      integer(c_size_t) :: lwork
      !
      hipsolverZZgesv_bufferSize_rank_1 = hipsolverZZgesv_bufferSize_(handle,n,nrhs,c_loc(A),lda, &
        c_loc(devIpiv),c_loc(B),ldb,c_loc(X),ldx,lwork)
    end function

    function hipsolverZZgesv_bufferSize_full_rank(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZZgesv_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      complex(c_double_complex),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      complex(c_double_complex),target,dimension(:,:) :: X
      integer(c_int) :: ldx
      integer(c_size_t) :: lwork
      !
      hipsolverZZgesv_bufferSize_full_rank = hipsolverZZgesv_bufferSize_(handle,n,nrhs,c_loc(A), &
        lda,c_loc(devIpiv),c_loc(B),ldb,c_loc(X),ldx,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverSSgesv_rank_0(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters, &
        devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSSgesv_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: devIpiv
      real(c_float),target :: B
      integer(c_int) :: ldb
      real(c_float),target :: X
      integer(c_int) :: ldx
      type(c_ptr) :: work
      integer(c_size_t) :: lwork
      type(c_ptr) :: niters
      integer(c_int) :: devInfo
      !
      hipsolverSSgesv_rank_0 = hipsolverSSgesv_(handle,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,c_loc(X),ldx,work,lwork,niters,devInfo)
    end function

    function hipsolverSSgesv_rank_1(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters, &
        devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSSgesv_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      real(c_float),target,dimension(:) :: B
      integer(c_int) :: ldb
      real(c_float),target,dimension(:) :: X
      integer(c_int) :: ldx
      type(c_ptr) :: work
      integer(c_size_t) :: lwork
      type(c_ptr) :: niters
      integer(c_int) :: devInfo
      !
      hipsolverSSgesv_rank_1 = hipsolverSSgesv_(handle,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,c_loc(X),ldx,work,lwork,niters,devInfo)
    end function

    function hipsolverSSgesv_full_rank(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters, &
        devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSSgesv_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      real(c_float),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      real(c_float),target,dimension(:,:) :: X
      integer(c_int) :: ldx
      type(c_ptr) :: work
      integer(c_size_t) :: lwork
      type(c_ptr) :: niters
      integer(c_int) :: devInfo
      !
      hipsolverSSgesv_full_rank = hipsolverSSgesv_(handle,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,c_loc(X),ldx,work,lwork,niters,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverDDgesv_rank_0(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters, &
        devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDDgesv_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: devIpiv
      real(c_double),target :: B
      integer(c_int) :: ldb
      real(c_double),target :: X
      integer(c_int) :: ldx
      type(c_ptr) :: work
      integer(c_size_t) :: lwork
      type(c_ptr) :: niters
      integer(c_int) :: devInfo
      !
      hipsolverDDgesv_rank_0 = hipsolverDDgesv_(handle,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,c_loc(X),ldx,work,lwork,niters,devInfo)
    end function

    function hipsolverDDgesv_rank_1(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters, &
        devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDDgesv_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      real(c_double),target,dimension(:) :: B
      integer(c_int) :: ldb
      real(c_double),target,dimension(:) :: X
      integer(c_int) :: ldx
      type(c_ptr) :: work
      integer(c_size_t) :: lwork
      type(c_ptr) :: niters
      integer(c_int) :: devInfo
      !
      hipsolverDDgesv_rank_1 = hipsolverDDgesv_(handle,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,c_loc(X),ldx,work,lwork,niters,devInfo)
    end function

    function hipsolverDDgesv_full_rank(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters, &
        devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDDgesv_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      real(c_double),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      real(c_double),target,dimension(:,:) :: X
      integer(c_int) :: ldx
      type(c_ptr) :: work
      integer(c_size_t) :: lwork
      type(c_ptr) :: niters
      integer(c_int) :: devInfo
      !
      hipsolverDDgesv_full_rank = hipsolverDDgesv_(handle,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,c_loc(X),ldx,work,lwork,niters,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverCCgesv_rank_0(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters, &
        devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCCgesv_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: devIpiv
      complex(c_float_complex),target :: B
      integer(c_int) :: ldb
      complex(c_float_complex),target :: X
      integer(c_int) :: ldx
      type(c_ptr) :: work
      integer(c_size_t) :: lwork
      type(c_ptr) :: niters
      integer(c_int) :: devInfo
      !
      hipsolverCCgesv_rank_0 = hipsolverCCgesv_(handle,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,c_loc(X),ldx,work,lwork,niters,devInfo)
    end function

    function hipsolverCCgesv_rank_1(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters, &
        devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCCgesv_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      complex(c_float_complex),target,dimension(:) :: B
      integer(c_int) :: ldb
      complex(c_float_complex),target,dimension(:) :: X
      integer(c_int) :: ldx
      type(c_ptr) :: work
      integer(c_size_t) :: lwork
      type(c_ptr) :: niters
      integer(c_int) :: devInfo
      !
      hipsolverCCgesv_rank_1 = hipsolverCCgesv_(handle,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,c_loc(X),ldx,work,lwork,niters,devInfo)
    end function

    function hipsolverCCgesv_full_rank(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters, &
        devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCCgesv_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      complex(c_float_complex),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      complex(c_float_complex),target,dimension(:,:) :: X
      integer(c_int) :: ldx
      type(c_ptr) :: work
      integer(c_size_t) :: lwork
      type(c_ptr) :: niters
      integer(c_int) :: devInfo
      !
      hipsolverCCgesv_full_rank = hipsolverCCgesv_(handle,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,c_loc(X),ldx,work,lwork,niters,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverZZgesv_rank_0(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters, &
        devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZZgesv_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: devIpiv
      complex(c_double_complex),target :: B
      integer(c_int) :: ldb
      complex(c_double_complex),target :: X
      integer(c_int) :: ldx
      type(c_ptr) :: work
      integer(c_size_t) :: lwork
      type(c_ptr) :: niters
      integer(c_int) :: devInfo
      !
      hipsolverZZgesv_rank_0 = hipsolverZZgesv_(handle,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,c_loc(X),ldx,work,lwork,niters,devInfo)
    end function

    function hipsolverZZgesv_rank_1(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters, &
        devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZZgesv_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      complex(c_double_complex),target,dimension(:) :: B
      integer(c_int) :: ldb
      complex(c_double_complex),target,dimension(:) :: X
      integer(c_int) :: ldx
      type(c_ptr) :: work
      integer(c_size_t) :: lwork
      type(c_ptr) :: niters
      integer(c_int) :: devInfo
      !
      hipsolverZZgesv_rank_1 = hipsolverZZgesv_(handle,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,c_loc(X),ldx,work,lwork,niters,devInfo)
    end function

    function hipsolverZZgesv_full_rank(handle,n,nrhs,A,lda,devIpiv,B,ldb,X,ldx,work,lwork,niters, &
        devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZZgesv_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      complex(c_double_complex),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      complex(c_double_complex),target,dimension(:,:) :: X
      integer(c_int) :: ldx
      type(c_ptr) :: work
      integer(c_size_t) :: lwork
      type(c_ptr) :: niters
      integer(c_int) :: devInfo
      !
      hipsolverZZgesv_full_rank = hipsolverZZgesv_(handle,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,c_loc(X),ldx,work,lwork,niters,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverSgetrf_bufferSize_rank_0(handle,m,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrf_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverSgetrf_bufferSize_rank_0 = hipsolverSgetrf_bufferSize_(handle,m,n,c_loc(A),lda,lwork)
    end function

    function hipsolverSgetrf_bufferSize_rank_1(handle,m,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrf_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverSgetrf_bufferSize_rank_1 = hipsolverSgetrf_bufferSize_(handle,m,n,c_loc(A),lda,lwork)
    end function

    function hipsolverSgetrf_bufferSize_full_rank(handle,m,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrf_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverSgetrf_bufferSize_full_rank = hipsolverSgetrf_bufferSize_(handle,m,n,c_loc(A),lda, &
        lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverDgetrf_bufferSize_rank_0(handle,m,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrf_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverDgetrf_bufferSize_rank_0 = hipsolverDgetrf_bufferSize_(handle,m,n,c_loc(A),lda,lwork)
    end function

    function hipsolverDgetrf_bufferSize_rank_1(handle,m,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrf_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverDgetrf_bufferSize_rank_1 = hipsolverDgetrf_bufferSize_(handle,m,n,c_loc(A),lda,lwork)
    end function

    function hipsolverDgetrf_bufferSize_full_rank(handle,m,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrf_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverDgetrf_bufferSize_full_rank = hipsolverDgetrf_bufferSize_(handle,m,n,c_loc(A),lda, &
        lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverCgetrf_bufferSize_rank_0(handle,m,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrf_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverCgetrf_bufferSize_rank_0 = hipsolverCgetrf_bufferSize_(handle,m,n,c_loc(A),lda,lwork)
    end function

    function hipsolverCgetrf_bufferSize_rank_1(handle,m,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrf_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverCgetrf_bufferSize_rank_1 = hipsolverCgetrf_bufferSize_(handle,m,n,c_loc(A),lda,lwork)
    end function

    function hipsolverCgetrf_bufferSize_full_rank(handle,m,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrf_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverCgetrf_bufferSize_full_rank = hipsolverCgetrf_bufferSize_(handle,m,n,c_loc(A),lda, &
        lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverZgetrf_bufferSize_rank_0(handle,m,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrf_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverZgetrf_bufferSize_rank_0 = hipsolverZgetrf_bufferSize_(handle,m,n,c_loc(A),lda,lwork)
    end function

    function hipsolverZgetrf_bufferSize_rank_1(handle,m,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrf_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverZgetrf_bufferSize_rank_1 = hipsolverZgetrf_bufferSize_(handle,m,n,c_loc(A),lda,lwork)
    end function

    function hipsolverZgetrf_bufferSize_full_rank(handle,m,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrf_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverZgetrf_bufferSize_full_rank = hipsolverZgetrf_bufferSize_(handle,m,n,c_loc(A),lda, &
        lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverSgetrf_rank_0(handle,m,n,A,lda,work,lwork,devIpiv,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrf_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int),target :: devIpiv
      integer(c_int) :: devInfo
      !
      hipsolverSgetrf_rank_0 = hipsolverSgetrf_(handle,m,n,c_loc(A),lda,work,lwork,c_loc(devIpiv), &
        devInfo)
    end function

    function hipsolverSgetrf_rank_1(handle,m,n,A,lda,work,lwork,devIpiv,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrf_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int),target,dimension(:) :: devIpiv
      integer(c_int) :: devInfo
      !
      hipsolverSgetrf_rank_1 = hipsolverSgetrf_(handle,m,n,c_loc(A),lda,work,lwork,c_loc(devIpiv), &
        devInfo)
    end function

    function hipsolverSgetrf_full_rank(handle,m,n,A,lda,work,lwork,devIpiv,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrf_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int),target,dimension(:) :: devIpiv
      integer(c_int) :: devInfo
      !
      hipsolverSgetrf_full_rank = hipsolverSgetrf_(handle,m,n,c_loc(A),lda,work,lwork, &
        c_loc(devIpiv),devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverDgetrf_rank_0(handle,m,n,A,lda,work,lwork,devIpiv,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrf_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int),target :: devIpiv
      integer(c_int) :: devInfo
      !
      hipsolverDgetrf_rank_0 = hipsolverDgetrf_(handle,m,n,c_loc(A),lda,work,lwork,c_loc(devIpiv), &
        devInfo)
    end function

    function hipsolverDgetrf_rank_1(handle,m,n,A,lda,work,lwork,devIpiv,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrf_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int),target,dimension(:) :: devIpiv
      integer(c_int) :: devInfo
      !
      hipsolverDgetrf_rank_1 = hipsolverDgetrf_(handle,m,n,c_loc(A),lda,work,lwork,c_loc(devIpiv), &
        devInfo)
    end function

    function hipsolverDgetrf_full_rank(handle,m,n,A,lda,work,lwork,devIpiv,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrf_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int),target,dimension(:) :: devIpiv
      integer(c_int) :: devInfo
      !
      hipsolverDgetrf_full_rank = hipsolverDgetrf_(handle,m,n,c_loc(A),lda,work,lwork, &
        c_loc(devIpiv),devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverCgetrf_rank_0(handle,m,n,A,lda,work,lwork,devIpiv,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrf_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int),target :: devIpiv
      integer(c_int) :: devInfo
      !
      hipsolverCgetrf_rank_0 = hipsolverCgetrf_(handle,m,n,c_loc(A),lda,work,lwork,c_loc(devIpiv), &
        devInfo)
    end function

    function hipsolverCgetrf_rank_1(handle,m,n,A,lda,work,lwork,devIpiv,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrf_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int),target,dimension(:) :: devIpiv
      integer(c_int) :: devInfo
      !
      hipsolverCgetrf_rank_1 = hipsolverCgetrf_(handle,m,n,c_loc(A),lda,work,lwork,c_loc(devIpiv), &
        devInfo)
    end function

    function hipsolverCgetrf_full_rank(handle,m,n,A,lda,work,lwork,devIpiv,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrf_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int),target,dimension(:) :: devIpiv
      integer(c_int) :: devInfo
      !
      hipsolverCgetrf_full_rank = hipsolverCgetrf_(handle,m,n,c_loc(A),lda,work,lwork, &
        c_loc(devIpiv),devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverZgetrf_rank_0(handle,m,n,A,lda,work,lwork,devIpiv,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrf_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int),target :: devIpiv
      integer(c_int) :: devInfo
      !
      hipsolverZgetrf_rank_0 = hipsolverZgetrf_(handle,m,n,c_loc(A),lda,work,lwork,c_loc(devIpiv), &
        devInfo)
    end function

    function hipsolverZgetrf_rank_1(handle,m,n,A,lda,work,lwork,devIpiv,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrf_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int),target,dimension(:) :: devIpiv
      integer(c_int) :: devInfo
      !
      hipsolverZgetrf_rank_1 = hipsolverZgetrf_(handle,m,n,c_loc(A),lda,work,lwork,c_loc(devIpiv), &
        devInfo)
    end function

    function hipsolverZgetrf_full_rank(handle,m,n,A,lda,work,lwork,devIpiv,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrf_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: m
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int),target,dimension(:) :: devIpiv
      integer(c_int) :: devInfo
      !
      hipsolverZgetrf_full_rank = hipsolverZgetrf_(handle,m,n,c_loc(A),lda,work,lwork, &
        c_loc(devIpiv),devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverSgetrs_bufferSize_rank_0(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrs_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: devIpiv
      real(c_float),target :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverSgetrs_bufferSize_rank_0 = hipsolverSgetrs_bufferSize_(handle,trans,n,nrhs, &
        c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
    end function

    function hipsolverSgetrs_bufferSize_rank_1(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrs_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      real(c_float),target,dimension(:) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverSgetrs_bufferSize_rank_1 = hipsolverSgetrs_bufferSize_(handle,trans,n,nrhs, &
        c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
    end function

    function hipsolverSgetrs_bufferSize_full_rank(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrs_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      real(c_float),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverSgetrs_bufferSize_full_rank = hipsolverSgetrs_bufferSize_(handle,trans,n,nrhs, &
        c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverDgetrs_bufferSize_rank_0(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrs_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: devIpiv
      real(c_double),target :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverDgetrs_bufferSize_rank_0 = hipsolverDgetrs_bufferSize_(handle,trans,n,nrhs, &
        c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
    end function

    function hipsolverDgetrs_bufferSize_rank_1(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrs_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      real(c_double),target,dimension(:) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverDgetrs_bufferSize_rank_1 = hipsolverDgetrs_bufferSize_(handle,trans,n,nrhs, &
        c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
    end function

    function hipsolverDgetrs_bufferSize_full_rank(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrs_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      real(c_double),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverDgetrs_bufferSize_full_rank = hipsolverDgetrs_bufferSize_(handle,trans,n,nrhs, &
        c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverCgetrs_bufferSize_rank_0(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrs_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: devIpiv
      complex(c_float_complex),target :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverCgetrs_bufferSize_rank_0 = hipsolverCgetrs_bufferSize_(handle,trans,n,nrhs, &
        c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
    end function

    function hipsolverCgetrs_bufferSize_rank_1(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrs_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      complex(c_float_complex),target,dimension(:) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverCgetrs_bufferSize_rank_1 = hipsolverCgetrs_bufferSize_(handle,trans,n,nrhs, &
        c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
    end function

    function hipsolverCgetrs_bufferSize_full_rank(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrs_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      complex(c_float_complex),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverCgetrs_bufferSize_full_rank = hipsolverCgetrs_bufferSize_(handle,trans,n,nrhs, &
        c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverZgetrs_bufferSize_rank_0(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrs_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: devIpiv
      complex(c_double_complex),target :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverZgetrs_bufferSize_rank_0 = hipsolverZgetrs_bufferSize_(handle,trans,n,nrhs, &
        c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
    end function

    function hipsolverZgetrs_bufferSize_rank_1(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrs_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      complex(c_double_complex),target,dimension(:) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverZgetrs_bufferSize_rank_1 = hipsolverZgetrs_bufferSize_(handle,trans,n,nrhs, &
        c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
    end function

    function hipsolverZgetrs_bufferSize_full_rank(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrs_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      complex(c_double_complex),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverZgetrs_bufferSize_full_rank = hipsolverZgetrs_bufferSize_(handle,trans,n,nrhs, &
        c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverSgetrs_rank_0(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrs_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: devIpiv
      real(c_float),target :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSgetrs_rank_0 = hipsolverSgetrs_(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,work,lwork,devInfo)
    end function

    function hipsolverSgetrs_rank_1(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrs_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      real(c_float),target,dimension(:) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSgetrs_rank_1 = hipsolverSgetrs_(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,work,lwork,devInfo)
    end function

    function hipsolverSgetrs_full_rank(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrs_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      real(c_float),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSgetrs_full_rank = hipsolverSgetrs_(handle,trans,n,nrhs,c_loc(A),lda, &
        c_loc(devIpiv),c_loc(B),ldb,work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverDgetrs_rank_0(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrs_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: devIpiv
      real(c_double),target :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDgetrs_rank_0 = hipsolverDgetrs_(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,work,lwork,devInfo)
    end function

    function hipsolverDgetrs_rank_1(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrs_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      real(c_double),target,dimension(:) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDgetrs_rank_1 = hipsolverDgetrs_(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,work,lwork,devInfo)
    end function

    function hipsolverDgetrs_full_rank(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrs_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      real(c_double),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDgetrs_full_rank = hipsolverDgetrs_(handle,trans,n,nrhs,c_loc(A),lda, &
        c_loc(devIpiv),c_loc(B),ldb,work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverCgetrs_rank_0(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrs_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: devIpiv
      complex(c_float_complex),target :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCgetrs_rank_0 = hipsolverCgetrs_(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,work,lwork,devInfo)
    end function

    function hipsolverCgetrs_rank_1(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrs_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      complex(c_float_complex),target,dimension(:) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCgetrs_rank_1 = hipsolverCgetrs_(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,work,lwork,devInfo)
    end function

    function hipsolverCgetrs_full_rank(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrs_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      complex(c_float_complex),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCgetrs_full_rank = hipsolverCgetrs_(handle,trans,n,nrhs,c_loc(A),lda, &
        c_loc(devIpiv),c_loc(B),ldb,work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverZgetrs_rank_0(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrs_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: devIpiv
      complex(c_double_complex),target :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZgetrs_rank_0 = hipsolverZgetrs_(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,work,lwork,devInfo)
    end function

    function hipsolverZgetrs_rank_1(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrs_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      complex(c_double_complex),target,dimension(:) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZgetrs_rank_1 = hipsolverZgetrs_(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv), &
        c_loc(B),ldb,work,lwork,devInfo)
    end function

    function hipsolverZgetrs_full_rank(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrs_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_OP_N)) :: trans
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: devIpiv
      complex(c_double_complex),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZgetrs_full_rank = hipsolverZgetrs_(handle,trans,n,nrhs,c_loc(A),lda, &
        c_loc(devIpiv),c_loc(B),ldb,work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverSpotrf_bufferSize_rank_0(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrf_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverSpotrf_bufferSize_rank_0 = hipsolverSpotrf_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        lwork)
    end function

    function hipsolverSpotrf_bufferSize_rank_1(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrf_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverSpotrf_bufferSize_rank_1 = hipsolverSpotrf_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        lwork)
    end function

    function hipsolverSpotrf_bufferSize_full_rank(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrf_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverSpotrf_bufferSize_full_rank = hipsolverSpotrf_bufferSize_(handle,uplo,n,c_loc(A), &
        lda,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverDpotrf_bufferSize_rank_0(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrf_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverDpotrf_bufferSize_rank_0 = hipsolverDpotrf_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        lwork)
    end function

    function hipsolverDpotrf_bufferSize_rank_1(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrf_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverDpotrf_bufferSize_rank_1 = hipsolverDpotrf_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        lwork)
    end function

    function hipsolverDpotrf_bufferSize_full_rank(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrf_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverDpotrf_bufferSize_full_rank = hipsolverDpotrf_bufferSize_(handle,uplo,n,c_loc(A), &
        lda,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverCpotrf_bufferSize_rank_0(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrf_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverCpotrf_bufferSize_rank_0 = hipsolverCpotrf_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        lwork)
    end function

    function hipsolverCpotrf_bufferSize_rank_1(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrf_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverCpotrf_bufferSize_rank_1 = hipsolverCpotrf_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        lwork)
    end function

    function hipsolverCpotrf_bufferSize_full_rank(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrf_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverCpotrf_bufferSize_full_rank = hipsolverCpotrf_bufferSize_(handle,uplo,n,c_loc(A), &
        lda,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverZpotrf_bufferSize_rank_0(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrf_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverZpotrf_bufferSize_rank_0 = hipsolverZpotrf_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        lwork)
    end function

    function hipsolverZpotrf_bufferSize_rank_1(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrf_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverZpotrf_bufferSize_rank_1 = hipsolverZpotrf_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        lwork)
    end function

    function hipsolverZpotrf_bufferSize_full_rank(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrf_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverZpotrf_bufferSize_full_rank = hipsolverZpotrf_bufferSize_(handle,uplo,n,c_loc(A), &
        lda,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverSpotrf_rank_0(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrf_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSpotrf_rank_0 = hipsolverSpotrf_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

    function hipsolverSpotrf_rank_1(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrf_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSpotrf_rank_1 = hipsolverSpotrf_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

    function hipsolverSpotrf_full_rank(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrf_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSpotrf_full_rank = hipsolverSpotrf_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverDpotrf_rank_0(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrf_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDpotrf_rank_0 = hipsolverDpotrf_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

    function hipsolverDpotrf_rank_1(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrf_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDpotrf_rank_1 = hipsolverDpotrf_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

    function hipsolverDpotrf_full_rank(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrf_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDpotrf_full_rank = hipsolverDpotrf_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverCpotrf_rank_0(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrf_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCpotrf_rank_0 = hipsolverCpotrf_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

    function hipsolverCpotrf_rank_1(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrf_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCpotrf_rank_1 = hipsolverCpotrf_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

    function hipsolverCpotrf_full_rank(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrf_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCpotrf_full_rank = hipsolverCpotrf_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverZpotrf_rank_0(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrf_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZpotrf_rank_0 = hipsolverZpotrf_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

    function hipsolverZpotrf_rank_1(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrf_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZpotrf_rank_1 = hipsolverZpotrf_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

    function hipsolverZpotrf_full_rank(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrf_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZpotrf_full_rank = hipsolverZpotrf_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverSpotri_bufferSize_rank_0(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotri_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverSpotri_bufferSize_rank_0 = hipsolverSpotri_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        lwork)
    end function

    function hipsolverSpotri_bufferSize_rank_1(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotri_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverSpotri_bufferSize_rank_1 = hipsolverSpotri_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        lwork)
    end function

    function hipsolverSpotri_bufferSize_full_rank(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotri_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverSpotri_bufferSize_full_rank = hipsolverSpotri_bufferSize_(handle,uplo,n,c_loc(A), &
        lda,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverDpotri_bufferSize_rank_0(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotri_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverDpotri_bufferSize_rank_0 = hipsolverDpotri_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        lwork)
    end function

    function hipsolverDpotri_bufferSize_rank_1(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotri_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverDpotri_bufferSize_rank_1 = hipsolverDpotri_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        lwork)
    end function

    function hipsolverDpotri_bufferSize_full_rank(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotri_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverDpotri_bufferSize_full_rank = hipsolverDpotri_bufferSize_(handle,uplo,n,c_loc(A), &
        lda,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverCpotri_bufferSize_rank_0(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotri_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverCpotri_bufferSize_rank_0 = hipsolverCpotri_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        lwork)
    end function

    function hipsolverCpotri_bufferSize_rank_1(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotri_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverCpotri_bufferSize_rank_1 = hipsolverCpotri_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        lwork)
    end function

    function hipsolverCpotri_bufferSize_full_rank(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotri_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverCpotri_bufferSize_full_rank = hipsolverCpotri_bufferSize_(handle,uplo,n,c_loc(A), &
        lda,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverZpotri_bufferSize_rank_0(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotri_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverZpotri_bufferSize_rank_0 = hipsolverZpotri_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        lwork)
    end function

    function hipsolverZpotri_bufferSize_rank_1(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotri_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverZpotri_bufferSize_rank_1 = hipsolverZpotri_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        lwork)
    end function

    function hipsolverZpotri_bufferSize_full_rank(handle,uplo,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotri_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverZpotri_bufferSize_full_rank = hipsolverZpotri_bufferSize_(handle,uplo,n,c_loc(A), &
        lda,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverSpotri_rank_0(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotri_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSpotri_rank_0 = hipsolverSpotri_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

    function hipsolverSpotri_rank_1(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotri_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSpotri_rank_1 = hipsolverSpotri_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

    function hipsolverSpotri_full_rank(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotri_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSpotri_full_rank = hipsolverSpotri_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverDpotri_rank_0(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotri_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDpotri_rank_0 = hipsolverDpotri_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

    function hipsolverDpotri_rank_1(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotri_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDpotri_rank_1 = hipsolverDpotri_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

    function hipsolverDpotri_full_rank(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotri_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDpotri_full_rank = hipsolverDpotri_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverCpotri_rank_0(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotri_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCpotri_rank_0 = hipsolverCpotri_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

    function hipsolverCpotri_rank_1(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotri_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCpotri_rank_1 = hipsolverCpotri_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

    function hipsolverCpotri_full_rank(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotri_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCpotri_full_rank = hipsolverCpotri_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverZpotri_rank_0(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotri_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZpotri_rank_0 = hipsolverZpotri_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

    function hipsolverZpotri_rank_1(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotri_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZpotri_rank_1 = hipsolverZpotri_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

    function hipsolverZpotri_full_rank(handle,uplo,n,A,lda,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotri_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZpotri_full_rank = hipsolverZpotri_(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverSpotrs_bufferSize_rank_0(handle,uplo,n,nrhs,A,lda,B,ldb,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrs_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float),target :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverSpotrs_bufferSize_rank_0 = hipsolverSpotrs_bufferSize_(handle,uplo,n,nrhs,c_loc(A), &
        lda,c_loc(B),ldb,lwork)
    end function

    function hipsolverSpotrs_bufferSize_rank_1(handle,uplo,n,nrhs,A,lda,B,ldb,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrs_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverSpotrs_bufferSize_rank_1 = hipsolverSpotrs_bufferSize_(handle,uplo,n,nrhs,c_loc(A), &
        lda,c_loc(B),ldb,lwork)
    end function

    function hipsolverSpotrs_bufferSize_full_rank(handle,uplo,n,nrhs,A,lda,B,ldb,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrs_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverSpotrs_bufferSize_full_rank = hipsolverSpotrs_bufferSize_(handle,uplo,n,nrhs, &
        c_loc(A),lda,c_loc(B),ldb,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverDpotrs_bufferSize_rank_0(handle,uplo,n,nrhs,A,lda,B,ldb,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrs_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double),target :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverDpotrs_bufferSize_rank_0 = hipsolverDpotrs_bufferSize_(handle,uplo,n,nrhs,c_loc(A), &
        lda,c_loc(B),ldb,lwork)
    end function

    function hipsolverDpotrs_bufferSize_rank_1(handle,uplo,n,nrhs,A,lda,B,ldb,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrs_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverDpotrs_bufferSize_rank_1 = hipsolverDpotrs_bufferSize_(handle,uplo,n,nrhs,c_loc(A), &
        lda,c_loc(B),ldb,lwork)
    end function

    function hipsolverDpotrs_bufferSize_full_rank(handle,uplo,n,nrhs,A,lda,B,ldb,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrs_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverDpotrs_bufferSize_full_rank = hipsolverDpotrs_bufferSize_(handle,uplo,n,nrhs, &
        c_loc(A),lda,c_loc(B),ldb,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverCpotrs_bufferSize_rank_0(handle,uplo,n,nrhs,A,lda,B,ldb,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrs_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      complex(c_float_complex),target :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverCpotrs_bufferSize_rank_0 = hipsolverCpotrs_bufferSize_(handle,uplo,n,nrhs,c_loc(A), &
        lda,c_loc(B),ldb,lwork)
    end function

    function hipsolverCpotrs_bufferSize_rank_1(handle,uplo,n,nrhs,A,lda,B,ldb,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrs_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_float_complex),target,dimension(:) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverCpotrs_bufferSize_rank_1 = hipsolverCpotrs_bufferSize_(handle,uplo,n,nrhs,c_loc(A), &
        lda,c_loc(B),ldb,lwork)
    end function

    function hipsolverCpotrs_bufferSize_full_rank(handle,uplo,n,nrhs,A,lda,B,ldb,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrs_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_float_complex),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverCpotrs_bufferSize_full_rank = hipsolverCpotrs_bufferSize_(handle,uplo,n,nrhs, &
        c_loc(A),lda,c_loc(B),ldb,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverZpotrs_bufferSize_rank_0(handle,uplo,n,nrhs,A,lda,B,ldb,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrs_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      complex(c_double_complex),target :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverZpotrs_bufferSize_rank_0 = hipsolverZpotrs_bufferSize_(handle,uplo,n,nrhs,c_loc(A), &
        lda,c_loc(B),ldb,lwork)
    end function

    function hipsolverZpotrs_bufferSize_rank_1(handle,uplo,n,nrhs,A,lda,B,ldb,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrs_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_double_complex),target,dimension(:) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverZpotrs_bufferSize_rank_1 = hipsolverZpotrs_bufferSize_(handle,uplo,n,nrhs,c_loc(A), &
        lda,c_loc(B),ldb,lwork)
    end function

    function hipsolverZpotrs_bufferSize_full_rank(handle,uplo,n,nrhs,A,lda,B,ldb,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrs_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_double_complex),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      integer(c_int) :: lwork
      !
      hipsolverZpotrs_bufferSize_full_rank = hipsolverZpotrs_bufferSize_(handle,uplo,n,nrhs, &
        c_loc(A),lda,c_loc(B),ldb,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverSpotrs_rank_0(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrs_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float),target :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSpotrs_rank_0 = hipsolverSpotrs_(handle,uplo,n,nrhs,c_loc(A),lda,c_loc(B),ldb,work, &
        lwork,devInfo)
    end function

    function hipsolverSpotrs_rank_1(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrs_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSpotrs_rank_1 = hipsolverSpotrs_(handle,uplo,n,nrhs,c_loc(A),lda,c_loc(B),ldb,work, &
        lwork,devInfo)
    end function

    function hipsolverSpotrs_full_rank(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrs_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSpotrs_full_rank = hipsolverSpotrs_(handle,uplo,n,nrhs,c_loc(A),lda,c_loc(B),ldb, &
        work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverDpotrs_rank_0(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrs_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double),target :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDpotrs_rank_0 = hipsolverDpotrs_(handle,uplo,n,nrhs,c_loc(A),lda,c_loc(B),ldb,work, &
        lwork,devInfo)
    end function

    function hipsolverDpotrs_rank_1(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrs_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDpotrs_rank_1 = hipsolverDpotrs_(handle,uplo,n,nrhs,c_loc(A),lda,c_loc(B),ldb,work, &
        lwork,devInfo)
    end function

    function hipsolverDpotrs_full_rank(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrs_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDpotrs_full_rank = hipsolverDpotrs_(handle,uplo,n,nrhs,c_loc(A),lda,c_loc(B),ldb, &
        work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverCpotrs_rank_0(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrs_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      complex(c_float_complex),target :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCpotrs_rank_0 = hipsolverCpotrs_(handle,uplo,n,nrhs,c_loc(A),lda,c_loc(B),ldb,work, &
        lwork,devInfo)
    end function

    function hipsolverCpotrs_rank_1(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrs_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_float_complex),target,dimension(:) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCpotrs_rank_1 = hipsolverCpotrs_(handle,uplo,n,nrhs,c_loc(A),lda,c_loc(B),ldb,work, &
        lwork,devInfo)
    end function

    function hipsolverCpotrs_full_rank(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrs_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_float_complex),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCpotrs_full_rank = hipsolverCpotrs_(handle,uplo,n,nrhs,c_loc(A),lda,c_loc(B),ldb, &
        work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverZpotrs_rank_0(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrs_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      complex(c_double_complex),target :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZpotrs_rank_0 = hipsolverZpotrs_(handle,uplo,n,nrhs,c_loc(A),lda,c_loc(B),ldb,work, &
        lwork,devInfo)
    end function

    function hipsolverZpotrs_rank_1(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrs_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_double_complex),target,dimension(:) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZpotrs_rank_1 = hipsolverZpotrs_(handle,uplo,n,nrhs,c_loc(A),lda,c_loc(B),ldb,work, &
        lwork,devInfo)
    end function

    function hipsolverZpotrs_full_rank(handle,uplo,n,nrhs,A,lda,B,ldb,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrs_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      integer(c_int) :: nrhs
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_double_complex),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZpotrs_full_rank = hipsolverZpotrs_(handle,uplo,n,nrhs,c_loc(A),lda,c_loc(B),ldb, &
        work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverSsyevd_bufferSize_rank_0(handle,jobz,uplo,n,A,lda,D,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsyevd_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float),target :: D
      integer(c_int) :: lwork
      !
      hipsolverSsyevd_bufferSize_rank_0 = hipsolverSsyevd_bufferSize_(handle,jobz,uplo,n,c_loc(A), &
        lda,c_loc(D),lwork)
    end function

    function hipsolverSsyevd_bufferSize_rank_1(handle,jobz,uplo,n,A,lda,D,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsyevd_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      integer(c_int) :: lwork
      !
      hipsolverSsyevd_bufferSize_rank_1 = hipsolverSsyevd_bufferSize_(handle,jobz,uplo,n,c_loc(A), &
        lda,c_loc(D),lwork)
    end function

    function hipsolverSsyevd_bufferSize_full_rank(handle,jobz,uplo,n,A,lda,D,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsyevd_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      integer(c_int) :: lwork
      !
      hipsolverSsyevd_bufferSize_full_rank = hipsolverSsyevd_bufferSize_(handle,jobz,uplo,n, &
        c_loc(A),lda,c_loc(D),lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverDsyevd_bufferSize_rank_0(handle,jobz,uplo,n,A,lda,D,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsyevd_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double),target :: D
      integer(c_int) :: lwork
      !
      hipsolverDsyevd_bufferSize_rank_0 = hipsolverDsyevd_bufferSize_(handle,jobz,uplo,n,c_loc(A), &
        lda,c_loc(D),lwork)
    end function

    function hipsolverDsyevd_bufferSize_rank_1(handle,jobz,uplo,n,A,lda,D,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsyevd_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      integer(c_int) :: lwork
      !
      hipsolverDsyevd_bufferSize_rank_1 = hipsolverDsyevd_bufferSize_(handle,jobz,uplo,n,c_loc(A), &
        lda,c_loc(D),lwork)
    end function

    function hipsolverDsyevd_bufferSize_full_rank(handle,jobz,uplo,n,A,lda,D,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsyevd_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      integer(c_int) :: lwork
      !
      hipsolverDsyevd_bufferSize_full_rank = hipsolverDsyevd_bufferSize_(handle,jobz,uplo,n, &
        c_loc(A),lda,c_loc(D),lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverCheevd_bufferSize_rank_0(handle,jobz,uplo,n,A,lda,D,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCheevd_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      real(c_float),target :: D
      integer(c_int) :: lwork
      !
      hipsolverCheevd_bufferSize_rank_0 = hipsolverCheevd_bufferSize_(handle,jobz,uplo,n,c_loc(A), &
        lda,c_loc(D),lwork)
    end function

    function hipsolverCheevd_bufferSize_rank_1(handle,jobz,uplo,n,A,lda,D,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCheevd_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      integer(c_int) :: lwork
      !
      hipsolverCheevd_bufferSize_rank_1 = hipsolverCheevd_bufferSize_(handle,jobz,uplo,n,c_loc(A), &
        lda,c_loc(D),lwork)
    end function

    function hipsolverCheevd_bufferSize_full_rank(handle,jobz,uplo,n,A,lda,D,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCheevd_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      integer(c_int) :: lwork
      !
      hipsolverCheevd_bufferSize_full_rank = hipsolverCheevd_bufferSize_(handle,jobz,uplo,n, &
        c_loc(A),lda,c_loc(D),lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverZheevd_bufferSize_rank_0(handle,jobz,uplo,n,A,lda,D,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZheevd_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      real(c_double),target :: D
      integer(c_int) :: lwork
      !
      hipsolverZheevd_bufferSize_rank_0 = hipsolverZheevd_bufferSize_(handle,jobz,uplo,n,c_loc(A), &
        lda,c_loc(D),lwork)
    end function

    function hipsolverZheevd_bufferSize_rank_1(handle,jobz,uplo,n,A,lda,D,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZheevd_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      integer(c_int) :: lwork
      !
      hipsolverZheevd_bufferSize_rank_1 = hipsolverZheevd_bufferSize_(handle,jobz,uplo,n,c_loc(A), &
        lda,c_loc(D),lwork)
    end function

    function hipsolverZheevd_bufferSize_full_rank(handle,jobz,uplo,n,A,lda,D,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZheevd_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      integer(c_int) :: lwork
      !
      hipsolverZheevd_bufferSize_full_rank = hipsolverZheevd_bufferSize_(handle,jobz,uplo,n, &
        c_loc(A),lda,c_loc(D),lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverSsyevd_rank_0(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsyevd_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float),target :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSsyevd_rank_0 = hipsolverSsyevd_(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),work, &
        lwork,devInfo)
    end function

    function hipsolverSsyevd_rank_1(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsyevd_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSsyevd_rank_1 = hipsolverSsyevd_(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),work, &
        lwork,devInfo)
    end function

    function hipsolverSsyevd_full_rank(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsyevd_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSsyevd_full_rank = hipsolverSsyevd_(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),work, &
        lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverDsyevd_rank_0(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsyevd_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double),target :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDsyevd_rank_0 = hipsolverDsyevd_(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),work, &
        lwork,devInfo)
    end function

    function hipsolverDsyevd_rank_1(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsyevd_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDsyevd_rank_1 = hipsolverDsyevd_(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),work, &
        lwork,devInfo)
    end function

    function hipsolverDsyevd_full_rank(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsyevd_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDsyevd_full_rank = hipsolverDsyevd_(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),work, &
        lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverCheevd_rank_0(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCheevd_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      real(c_float),target :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCheevd_rank_0 = hipsolverCheevd_(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),work, &
        lwork,devInfo)
    end function

    function hipsolverCheevd_rank_1(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCheevd_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCheevd_rank_1 = hipsolverCheevd_(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),work, &
        lwork,devInfo)
    end function

    function hipsolverCheevd_full_rank(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCheevd_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCheevd_full_rank = hipsolverCheevd_(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),work, &
        lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverZheevd_rank_0(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZheevd_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      real(c_double),target :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZheevd_rank_0 = hipsolverZheevd_(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),work, &
        lwork,devInfo)
    end function

    function hipsolverZheevd_rank_1(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZheevd_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZheevd_rank_1 = hipsolverZheevd_(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),work, &
        lwork,devInfo)
    end function

    function hipsolverZheevd_full_rank(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZheevd_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZheevd_full_rank = hipsolverZheevd_(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),work, &
        lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverSsygvd_bufferSize_rank_0(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsygvd_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float),target :: B
      integer(c_int) :: ldb
      real(c_float),target :: W
      integer(c_int) :: lwork
      !
      hipsolverSsygvd_bufferSize_rank_0 = hipsolverSsygvd_bufferSize_(handle,itype,jobz,uplo,n, &
        c_loc(A),lda,c_loc(B),ldb,c_loc(W),lwork)
    end function

    function hipsolverSsygvd_bufferSize_rank_1(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsygvd_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: B
      integer(c_int) :: ldb
      real(c_float),target,dimension(:) :: W
      integer(c_int) :: lwork
      !
      hipsolverSsygvd_bufferSize_rank_1 = hipsolverSsygvd_bufferSize_(handle,itype,jobz,uplo,n, &
        c_loc(A),lda,c_loc(B),ldb,c_loc(W),lwork)
    end function

    function hipsolverSsygvd_bufferSize_full_rank(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsygvd_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      real(c_float),target,dimension(:) :: W
      integer(c_int) :: lwork
      !
      hipsolverSsygvd_bufferSize_full_rank = hipsolverSsygvd_bufferSize_(handle,itype,jobz,uplo,n, &
        c_loc(A),lda,c_loc(B),ldb,c_loc(W),lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverDsygvd_bufferSize_rank_0(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsygvd_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double),target :: B
      integer(c_int) :: ldb
      real(c_double),target :: W
      integer(c_int) :: lwork
      !
      hipsolverDsygvd_bufferSize_rank_0 = hipsolverDsygvd_bufferSize_(handle,itype,jobz,uplo,n, &
        c_loc(A),lda,c_loc(B),ldb,c_loc(W),lwork)
    end function

    function hipsolverDsygvd_bufferSize_rank_1(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsygvd_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: B
      integer(c_int) :: ldb
      real(c_double),target,dimension(:) :: W
      integer(c_int) :: lwork
      !
      hipsolverDsygvd_bufferSize_rank_1 = hipsolverDsygvd_bufferSize_(handle,itype,jobz,uplo,n, &
        c_loc(A),lda,c_loc(B),ldb,c_loc(W),lwork)
    end function

    function hipsolverDsygvd_bufferSize_full_rank(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsygvd_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      real(c_double),target,dimension(:) :: W
      integer(c_int) :: lwork
      !
      hipsolverDsygvd_bufferSize_full_rank = hipsolverDsygvd_bufferSize_(handle,itype,jobz,uplo,n, &
        c_loc(A),lda,c_loc(B),ldb,c_loc(W),lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverChegvd_bufferSize_rank_0(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChegvd_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      complex(c_float_complex),target :: B
      integer(c_int) :: ldb
      real(c_float),target :: W
      integer(c_int) :: lwork
      !
      hipsolverChegvd_bufferSize_rank_0 = hipsolverChegvd_bufferSize_(handle,itype,jobz,uplo,n, &
        c_loc(A),lda,c_loc(B),ldb,c_loc(W),lwork)
    end function

    function hipsolverChegvd_bufferSize_rank_1(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChegvd_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_float_complex),target,dimension(:) :: B
      integer(c_int) :: ldb
      real(c_float),target,dimension(:) :: W
      integer(c_int) :: lwork
      !
      hipsolverChegvd_bufferSize_rank_1 = hipsolverChegvd_bufferSize_(handle,itype,jobz,uplo,n, &
        c_loc(A),lda,c_loc(B),ldb,c_loc(W),lwork)
    end function

    function hipsolverChegvd_bufferSize_full_rank(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChegvd_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_float_complex),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      real(c_float),target,dimension(:) :: W
      integer(c_int) :: lwork
      !
      hipsolverChegvd_bufferSize_full_rank = hipsolverChegvd_bufferSize_(handle,itype,jobz,uplo,n, &
        c_loc(A),lda,c_loc(B),ldb,c_loc(W),lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverZhegvd_bufferSize_rank_0(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhegvd_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      complex(c_double_complex),target :: B
      integer(c_int) :: ldb
      real(c_double),target :: W
      integer(c_int) :: lwork
      !
      hipsolverZhegvd_bufferSize_rank_0 = hipsolverZhegvd_bufferSize_(handle,itype,jobz,uplo,n, &
        c_loc(A),lda,c_loc(B),ldb,c_loc(W),lwork)
    end function

    function hipsolverZhegvd_bufferSize_rank_1(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhegvd_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_double_complex),target,dimension(:) :: B
      integer(c_int) :: ldb
      real(c_double),target,dimension(:) :: W
      integer(c_int) :: lwork
      !
      hipsolverZhegvd_bufferSize_rank_1 = hipsolverZhegvd_bufferSize_(handle,itype,jobz,uplo,n, &
        c_loc(A),lda,c_loc(B),ldb,c_loc(W),lwork)
    end function

    function hipsolverZhegvd_bufferSize_full_rank(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhegvd_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_double_complex),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      real(c_double),target,dimension(:) :: W
      integer(c_int) :: lwork
      !
      hipsolverZhegvd_bufferSize_full_rank = hipsolverZhegvd_bufferSize_(handle,itype,jobz,uplo,n, &
        c_loc(A),lda,c_loc(B),ldb,c_loc(W),lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverSsygvd_rank_0(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsygvd_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float),target :: B
      integer(c_int) :: ldb
      real(c_float),target :: W
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSsygvd_rank_0 = hipsolverSsygvd_(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B), &
        ldb,c_loc(W),work,lwork,devInfo)
    end function

    function hipsolverSsygvd_rank_1(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsygvd_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: B
      integer(c_int) :: ldb
      real(c_float),target,dimension(:) :: W
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSsygvd_rank_1 = hipsolverSsygvd_(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B), &
        ldb,c_loc(W),work,lwork,devInfo)
    end function

    function hipsolverSsygvd_full_rank(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsygvd_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      real(c_float),target,dimension(:) :: W
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSsygvd_full_rank = hipsolverSsygvd_(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B), &
        ldb,c_loc(W),work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverDsygvd_rank_0(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsygvd_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double),target :: B
      integer(c_int) :: ldb
      real(c_double),target :: W
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDsygvd_rank_0 = hipsolverDsygvd_(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B), &
        ldb,c_loc(W),work,lwork,devInfo)
    end function

    function hipsolverDsygvd_rank_1(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsygvd_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: B
      integer(c_int) :: ldb
      real(c_double),target,dimension(:) :: W
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDsygvd_rank_1 = hipsolverDsygvd_(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B), &
        ldb,c_loc(W),work,lwork,devInfo)
    end function

    function hipsolverDsygvd_full_rank(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsygvd_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      real(c_double),target,dimension(:) :: W
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDsygvd_full_rank = hipsolverDsygvd_(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B), &
        ldb,c_loc(W),work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverChegvd_rank_0(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChegvd_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      complex(c_float_complex),target :: B
      integer(c_int) :: ldb
      real(c_float),target :: W
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverChegvd_rank_0 = hipsolverChegvd_(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B), &
        ldb,c_loc(W),work,lwork,devInfo)
    end function

    function hipsolverChegvd_rank_1(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChegvd_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_float_complex),target,dimension(:) :: B
      integer(c_int) :: ldb
      real(c_float),target,dimension(:) :: W
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverChegvd_rank_1 = hipsolverChegvd_(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B), &
        ldb,c_loc(W),work,lwork,devInfo)
    end function

    function hipsolverChegvd_full_rank(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChegvd_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_float_complex),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      real(c_float),target,dimension(:) :: W
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverChegvd_full_rank = hipsolverChegvd_(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B), &
        ldb,c_loc(W),work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverZhegvd_rank_0(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhegvd_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      complex(c_double_complex),target :: B
      integer(c_int) :: ldb
      real(c_double),target :: W
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZhegvd_rank_0 = hipsolverZhegvd_(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B), &
        ldb,c_loc(W),work,lwork,devInfo)
    end function

    function hipsolverZhegvd_rank_1(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhegvd_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      complex(c_double_complex),target,dimension(:) :: B
      integer(c_int) :: ldb
      real(c_double),target,dimension(:) :: W
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZhegvd_rank_1 = hipsolverZhegvd_(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B), &
        ldb,c_loc(W),work,lwork,devInfo)
    end function

    function hipsolverZhegvd_full_rank(handle,itype,jobz,uplo,n,A,lda,B,ldb,W,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhegvd_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)) :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)) :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      complex(c_double_complex),target,dimension(:,:) :: B
      integer(c_int) :: ldb
      real(c_double),target,dimension(:) :: W
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZhegvd_full_rank = hipsolverZhegvd_(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B), &
        ldb,c_loc(W),work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverSsytrd_bufferSize_rank_0(handle,uplo,n,A,lda,D,E,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsytrd_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float),target :: D
      real(c_float),target :: E
      real(c_float) :: tau
      integer(c_int) :: lwork
      !
      hipsolverSsytrd_bufferSize_rank_0 = hipsolverSsytrd_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        c_loc(D),c_loc(E),tau,lwork)
    end function

    function hipsolverSsytrd_bufferSize_rank_1(handle,uplo,n,A,lda,D,E,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsytrd_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      real(c_float),target,dimension(:) :: E
      real(c_float) :: tau
      integer(c_int) :: lwork
      !
      hipsolverSsytrd_bufferSize_rank_1 = hipsolverSsytrd_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        c_loc(D),c_loc(E),tau,lwork)
    end function

    function hipsolverSsytrd_bufferSize_full_rank(handle,uplo,n,A,lda,D,E,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsytrd_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      real(c_float),target,dimension(:) :: E
      real(c_float) :: tau
      integer(c_int) :: lwork
      !
      hipsolverSsytrd_bufferSize_full_rank = hipsolverSsytrd_bufferSize_(handle,uplo,n,c_loc(A), &
        lda,c_loc(D),c_loc(E),tau,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverDsytrd_bufferSize_rank_0(handle,uplo,n,A,lda,D,E,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsytrd_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double),target :: D
      real(c_double),target :: E
      real(c_double) :: tau
      integer(c_int) :: lwork
      !
      hipsolverDsytrd_bufferSize_rank_0 = hipsolverDsytrd_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        c_loc(D),c_loc(E),tau,lwork)
    end function

    function hipsolverDsytrd_bufferSize_rank_1(handle,uplo,n,A,lda,D,E,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsytrd_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      real(c_double),target,dimension(:) :: E
      real(c_double) :: tau
      integer(c_int) :: lwork
      !
      hipsolverDsytrd_bufferSize_rank_1 = hipsolverDsytrd_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        c_loc(D),c_loc(E),tau,lwork)
    end function

    function hipsolverDsytrd_bufferSize_full_rank(handle,uplo,n,A,lda,D,E,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsytrd_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      real(c_double),target,dimension(:) :: E
      real(c_double) :: tau
      integer(c_int) :: lwork
      !
      hipsolverDsytrd_bufferSize_full_rank = hipsolverDsytrd_bufferSize_(handle,uplo,n,c_loc(A), &
        lda,c_loc(D),c_loc(E),tau,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverChetrd_bufferSize_rank_0(handle,uplo,n,A,lda,D,E,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChetrd_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      real(c_float),target :: D
      real(c_float),target :: E
      complex(c_float_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverChetrd_bufferSize_rank_0 = hipsolverChetrd_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        c_loc(D),c_loc(E),tau,lwork)
    end function

    function hipsolverChetrd_bufferSize_rank_1(handle,uplo,n,A,lda,D,E,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChetrd_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      real(c_float),target,dimension(:) :: E
      complex(c_float_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverChetrd_bufferSize_rank_1 = hipsolverChetrd_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        c_loc(D),c_loc(E),tau,lwork)
    end function

    function hipsolverChetrd_bufferSize_full_rank(handle,uplo,n,A,lda,D,E,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChetrd_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      real(c_float),target,dimension(:) :: E
      complex(c_float_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverChetrd_bufferSize_full_rank = hipsolverChetrd_bufferSize_(handle,uplo,n,c_loc(A), &
        lda,c_loc(D),c_loc(E),tau,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverZhetrd_bufferSize_rank_0(handle,uplo,n,A,lda,D,E,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhetrd_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      real(c_double),target :: D
      real(c_double),target :: E
      complex(c_double_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverZhetrd_bufferSize_rank_0 = hipsolverZhetrd_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        c_loc(D),c_loc(E),tau,lwork)
    end function

    function hipsolverZhetrd_bufferSize_rank_1(handle,uplo,n,A,lda,D,E,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhetrd_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      real(c_double),target,dimension(:) :: E
      complex(c_double_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverZhetrd_bufferSize_rank_1 = hipsolverZhetrd_bufferSize_(handle,uplo,n,c_loc(A),lda, &
        c_loc(D),c_loc(E),tau,lwork)
    end function

    function hipsolverZhetrd_bufferSize_full_rank(handle,uplo,n,A,lda,D,E,tau,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhetrd_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      real(c_double),target,dimension(:) :: E
      complex(c_double_complex) :: tau
      integer(c_int) :: lwork
      !
      hipsolverZhetrd_bufferSize_full_rank = hipsolverZhetrd_bufferSize_(handle,uplo,n,c_loc(A), &
        lda,c_loc(D),c_loc(E),tau,lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverSsytrd_rank_0(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsytrd_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      real(c_float),target :: D
      real(c_float),target :: E
      real(c_float) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSsytrd_rank_0 = hipsolverSsytrd_(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau, &
        work,lwork,devInfo)
    end function

    function hipsolverSsytrd_rank_1(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsytrd_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      real(c_float),target,dimension(:) :: E
      real(c_float) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSsytrd_rank_1 = hipsolverSsytrd_(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau, &
        work,lwork,devInfo)
    end function

    function hipsolverSsytrd_full_rank(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsytrd_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      real(c_float),target,dimension(:) :: E
      real(c_float) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSsytrd_full_rank = hipsolverSsytrd_(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E), &
        tau,work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverDsytrd_rank_0(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsytrd_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      real(c_double),target :: D
      real(c_double),target :: E
      real(c_double) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDsytrd_rank_0 = hipsolverDsytrd_(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau, &
        work,lwork,devInfo)
    end function

    function hipsolverDsytrd_rank_1(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsytrd_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      real(c_double),target,dimension(:) :: E
      real(c_double) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDsytrd_rank_1 = hipsolverDsytrd_(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau, &
        work,lwork,devInfo)
    end function

    function hipsolverDsytrd_full_rank(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsytrd_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      real(c_double),target,dimension(:) :: E
      real(c_double) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDsytrd_full_rank = hipsolverDsytrd_(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E), &
        tau,work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverChetrd_rank_0(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChetrd_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      real(c_float),target :: D
      real(c_float),target :: E
      complex(c_float_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverChetrd_rank_0 = hipsolverChetrd_(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau, &
        work,lwork,devInfo)
    end function

    function hipsolverChetrd_rank_1(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChetrd_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      real(c_float),target,dimension(:) :: E
      complex(c_float_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverChetrd_rank_1 = hipsolverChetrd_(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau, &
        work,lwork,devInfo)
    end function

    function hipsolverChetrd_full_rank(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChetrd_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_float),target,dimension(:) :: D
      real(c_float),target,dimension(:) :: E
      complex(c_float_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverChetrd_full_rank = hipsolverChetrd_(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E), &
        tau,work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverZhetrd_rank_0(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhetrd_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      real(c_double),target :: D
      real(c_double),target :: E
      complex(c_double_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZhetrd_rank_0 = hipsolverZhetrd_(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau, &
        work,lwork,devInfo)
    end function

    function hipsolverZhetrd_rank_1(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhetrd_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      real(c_double),target,dimension(:) :: E
      complex(c_double_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZhetrd_rank_1 = hipsolverZhetrd_(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau, &
        work,lwork,devInfo)
    end function

    function hipsolverZhetrd_full_rank(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhetrd_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      real(c_double),target,dimension(:) :: D
      real(c_double),target,dimension(:) :: E
      complex(c_double_complex) :: tau
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZhetrd_full_rank = hipsolverZhetrd_(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E), &
        tau,work,lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverSsytrf_bufferSize_rank_0(handle,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsytrf_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverSsytrf_bufferSize_rank_0 = hipsolverSsytrf_bufferSize_(handle,n,c_loc(A),lda,lwork)
    end function

    function hipsolverSsytrf_bufferSize_rank_1(handle,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsytrf_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverSsytrf_bufferSize_rank_1 = hipsolverSsytrf_bufferSize_(handle,n,c_loc(A),lda,lwork)
    end function

    function hipsolverSsytrf_bufferSize_full_rank(handle,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsytrf_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverSsytrf_bufferSize_full_rank = hipsolverSsytrf_bufferSize_(handle,n,c_loc(A),lda, &
        lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverDsytrf_bufferSize_rank_0(handle,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsytrf_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverDsytrf_bufferSize_rank_0 = hipsolverDsytrf_bufferSize_(handle,n,c_loc(A),lda,lwork)
    end function

    function hipsolverDsytrf_bufferSize_rank_1(handle,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsytrf_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverDsytrf_bufferSize_rank_1 = hipsolverDsytrf_bufferSize_(handle,n,c_loc(A),lda,lwork)
    end function

    function hipsolverDsytrf_bufferSize_full_rank(handle,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsytrf_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverDsytrf_bufferSize_full_rank = hipsolverDsytrf_bufferSize_(handle,n,c_loc(A),lda, &
        lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverCsytrf_bufferSize_rank_0(handle,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCsytrf_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverCsytrf_bufferSize_rank_0 = hipsolverCsytrf_bufferSize_(handle,n,c_loc(A),lda,lwork)
    end function

    function hipsolverCsytrf_bufferSize_rank_1(handle,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCsytrf_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverCsytrf_bufferSize_rank_1 = hipsolverCsytrf_bufferSize_(handle,n,c_loc(A),lda,lwork)
    end function

    function hipsolverCsytrf_bufferSize_full_rank(handle,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCsytrf_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverCsytrf_bufferSize_full_rank = hipsolverCsytrf_bufferSize_(handle,n,c_loc(A),lda, &
        lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverZsytrf_bufferSize_rank_0(handle,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZsytrf_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverZsytrf_bufferSize_rank_0 = hipsolverZsytrf_bufferSize_(handle,n,c_loc(A),lda,lwork)
    end function

    function hipsolverZsytrf_bufferSize_rank_1(handle,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZsytrf_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverZsytrf_bufferSize_rank_1 = hipsolverZsytrf_bufferSize_(handle,n,c_loc(A),lda,lwork)
    end function

    function hipsolverZsytrf_bufferSize_full_rank(handle,n,A,lda,lwork)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZsytrf_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int) :: lwork
      !
      hipsolverZsytrf_bufferSize_full_rank = hipsolverZsytrf_bufferSize_(handle,n,c_loc(A),lda, &
        lwork)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverSsytrf_rank_0(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsytrf_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: ipiv
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSsytrf_rank_0 = hipsolverSsytrf_(handle,uplo,n,c_loc(A),lda,c_loc(ipiv),work,lwork, &
        devInfo)
    end function

    function hipsolverSsytrf_rank_1(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsytrf_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: ipiv
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSsytrf_rank_1 = hipsolverSsytrf_(handle,uplo,n,c_loc(A),lda,c_loc(ipiv),work,lwork, &
        devInfo)
    end function

    function hipsolverSsytrf_full_rank(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsytrf_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: ipiv
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverSsytrf_full_rank = hipsolverSsytrf_(handle,uplo,n,c_loc(A),lda,c_loc(ipiv),work, &
        lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverDsytrf_rank_0(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsytrf_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: ipiv
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDsytrf_rank_0 = hipsolverDsytrf_(handle,uplo,n,c_loc(A),lda,c_loc(ipiv),work,lwork, &
        devInfo)
    end function

    function hipsolverDsytrf_rank_1(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsytrf_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: ipiv
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDsytrf_rank_1 = hipsolverDsytrf_(handle,uplo,n,c_loc(A),lda,c_loc(ipiv),work,lwork, &
        devInfo)
    end function

    function hipsolverDsytrf_full_rank(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsytrf_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: ipiv
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverDsytrf_full_rank = hipsolverDsytrf_(handle,uplo,n,c_loc(A),lda,c_loc(ipiv),work, &
        lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverCsytrf_rank_0(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCsytrf_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: ipiv
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCsytrf_rank_0 = hipsolverCsytrf_(handle,uplo,n,c_loc(A),lda,c_loc(ipiv),work,lwork, &
        devInfo)
    end function

    function hipsolverCsytrf_rank_1(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCsytrf_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: ipiv
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCsytrf_rank_1 = hipsolverCsytrf_(handle,uplo,n,c_loc(A),lda,c_loc(ipiv),work,lwork, &
        devInfo)
    end function

    function hipsolverCsytrf_full_rank(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCsytrf_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: ipiv
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverCsytrf_full_rank = hipsolverCsytrf_(handle,uplo,n,c_loc(A),lda,c_loc(ipiv),work, &
        lwork,devInfo)
    end function

#endif
#ifndef USE_CUDA_NAMES
    function hipsolverZsytrf_rank_0(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZsytrf_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      integer(c_int),target :: ipiv
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZsytrf_rank_0 = hipsolverZsytrf_(handle,uplo,n,c_loc(A),lda,c_loc(ipiv),work,lwork, &
        devInfo)
    end function

    function hipsolverZsytrf_rank_1(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZsytrf_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: ipiv
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZsytrf_rank_1 = hipsolverZsytrf_(handle,uplo,n,c_loc(A),lda,c_loc(ipiv),work,lwork, &
        devInfo)
    end function

    function hipsolverZsytrf_full_rank(handle,uplo,n,A,lda,ipiv,work,lwork,devInfo)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZsytrf_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:) :: A
      integer(c_int) :: lda
      integer(c_int),target,dimension(:) :: ipiv
      type(c_ptr) :: work
      integer(c_int) :: lwork
      integer(c_int) :: devInfo
      !
      hipsolverZsytrf_full_rank = hipsolverZsytrf_(handle,uplo,n,c_loc(A),lda,c_loc(ipiv),work, &
        lwork,devInfo)
    end function

#endif
#endif
end module hipfort_hipsolver
