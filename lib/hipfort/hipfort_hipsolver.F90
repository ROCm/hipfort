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
  use, intrinsic :: iso_c_binding
  implicit none

  !--- Opaque handles (all are typedef struct* → type(c_ptr)) ---
  !    hipsolverDnHandle_t
  !    hipsolverGesvdjInfo_t
  !    hipsolverHandle_t
  !    hipsolverRfHandle_t
  !    hipsolverSpHandle_t
  !    hipsolverSyevjInfo_t

  !--- 536 bind(C) interfaces ---
  interface

    !---------------------------------------------
    ! hipsolverCreate
    !---------------------------------------------
    function hipsolverCreate(handle) &
       result(Create) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCreate")
#else
       bind(C, name="hipsolverCreate")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: handle
       integer(c_int) :: Create
    end function hipsolverCreate

    !---------------------------------------------
    ! hipsolverDestroy
    !---------------------------------------------
    function hipsolverDestroy(handle) &
       result(Destroy) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDestroy")
#else
       bind(C, name="hipsolverDestroy")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int) :: Destroy
    end function hipsolverDestroy

    !---------------------------------------------
    ! hipsolverSetStream
    !---------------------------------------------
    function hipsolverSetStream(handle, streamId) &
       result(SetStream) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSetStream")
#else
       bind(C, name="hipsolverSetStream")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: streamId
       integer(c_int) :: SetStream
    end function hipsolverSetStream

    !---------------------------------------------
    ! hipsolverGetStream
    !---------------------------------------------
    function hipsolverGetStream(handle, streamId) &
       result(GetStream) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverGetStream")
#else
       bind(C, name="hipsolverGetStream")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       type(c_ptr) :: streamId
       integer(c_int) :: GetStream
    end function hipsolverGetStream

    !---------------------------------------------
    ! hipsolverSetDeterministicMode
    !---------------------------------------------
    function hipsolverSetDeterministicMode(handle, mode) &
       result(SetDeterministicMode) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSetDeterministicMode")
#else
       bind(C, name="hipsolverSetDeterministicMode")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: mode
       integer(c_int) :: SetDeterministicMode
    end function hipsolverSetDeterministicMode

    !---------------------------------------------
    ! hipsolverGetDeterministicMode
    !---------------------------------------------
    function hipsolverGetDeterministicMode(handle, mode) &
       result(GetDeterministicMode) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverGetDeterministicMode")
#else
       bind(C, name="hipsolverGetDeterministicMode")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int) :: mode(*)
       integer(c_int) :: GetDeterministicMode
    end function hipsolverGetDeterministicMode

    !---------------------------------------------
    ! hipsolverCreateGesvdjInfo
    !---------------------------------------------
    function hipsolverCreateGesvdjInfo(info) &
       result(CreateGesvdjInfo) &
       bind(C, name="hipsolverCreateGesvdjInfo")
       import :: c_ptr, c_int
       type(c_ptr) :: info
       integer(c_int) :: CreateGesvdjInfo
    end function hipsolverCreateGesvdjInfo

    !---------------------------------------------
    ! hipsolverDestroyGesvdjInfo
    !---------------------------------------------
    function hipsolverDestroyGesvdjInfo(info) &
       result(DestroyGesvdjInfo) &
       bind(C, name="hipsolverDestroyGesvdjInfo")
       import :: c_ptr, c_int
       type(c_ptr), value :: info
       integer(c_int) :: DestroyGesvdjInfo
    end function hipsolverDestroyGesvdjInfo

    !---------------------------------------------
    ! hipsolverXgesvdjSetMaxSweeps
    !---------------------------------------------
    function hipsolverXgesvdjSetMaxSweeps(info, max_sweeps) &
       result(XgesvdjSetMaxSweeps) &
       bind(C, name="hipsolverXgesvdjSetMaxSweeps")
       import :: c_ptr, c_int
       type(c_ptr), value :: info
       integer(c_int), value :: max_sweeps
       integer(c_int) :: XgesvdjSetMaxSweeps
    end function hipsolverXgesvdjSetMaxSweeps

    !---------------------------------------------
    ! hipsolverXgesvdjSetSortEig
    !---------------------------------------------
    function hipsolverXgesvdjSetSortEig(info, sort_eig) &
       result(XgesvdjSetSortEig) &
       bind(C, name="hipsolverXgesvdjSetSortEig")
       import :: c_ptr, c_int
       type(c_ptr), value :: info
       integer(c_int), value :: sort_eig
       integer(c_int) :: XgesvdjSetSortEig
    end function hipsolverXgesvdjSetSortEig

    !---------------------------------------------
    ! hipsolverXgesvdjSetTolerance
    !---------------------------------------------
    function hipsolverXgesvdjSetTolerance(info, tolerance) &
       result(XgesvdjSetTolerance) &
       bind(C, name="hipsolverXgesvdjSetTolerance")
       import :: c_ptr, c_double, c_int
       type(c_ptr), value :: info
       real(c_double), value :: tolerance
       integer(c_int) :: XgesvdjSetTolerance
    end function hipsolverXgesvdjSetTolerance

    !---------------------------------------------
    ! hipsolverXgesvdjGetResidual
    !---------------------------------------------
    function hipsolverXgesvdjGetResidual(handle, info, residual) &
       result(XgesvdjGetResidual) &
       bind(C, name="hipsolverXgesvdjGetResidual")
       import :: c_ptr, c_double, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: info
       real(c_double) :: residual(*)
       integer(c_int) :: XgesvdjGetResidual
    end function hipsolverXgesvdjGetResidual

    !---------------------------------------------
    ! hipsolverXgesvdjGetSweeps
    !---------------------------------------------
    function hipsolverXgesvdjGetSweeps(handle, info, executed_sweeps) &
       result(XgesvdjGetSweeps) &
       bind(C, name="hipsolverXgesvdjGetSweeps")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: info
       integer(c_int) :: executed_sweeps(*)
       integer(c_int) :: XgesvdjGetSweeps
    end function hipsolverXgesvdjGetSweeps

    !---------------------------------------------
    ! hipsolverCreateSyevjInfo
    !---------------------------------------------
    function hipsolverCreateSyevjInfo(info) &
       result(CreateSyevjInfo) &
       bind(C, name="hipsolverCreateSyevjInfo")
       import :: c_ptr, c_int
       type(c_ptr) :: info
       integer(c_int) :: CreateSyevjInfo
    end function hipsolverCreateSyevjInfo

    !---------------------------------------------
    ! hipsolverDestroySyevjInfo
    !---------------------------------------------
    function hipsolverDestroySyevjInfo(info) &
       result(DestroySyevjInfo) &
       bind(C, name="hipsolverDestroySyevjInfo")
       import :: c_ptr, c_int
       type(c_ptr), value :: info
       integer(c_int) :: DestroySyevjInfo
    end function hipsolverDestroySyevjInfo

    !---------------------------------------------
    ! hipsolverXsyevjSetMaxSweeps
    !---------------------------------------------
    function hipsolverXsyevjSetMaxSweeps(info, max_sweeps) &
       result(XsyevjSetMaxSweeps) &
       bind(C, name="hipsolverXsyevjSetMaxSweeps")
       import :: c_ptr, c_int
       type(c_ptr), value :: info
       integer(c_int), value :: max_sweeps
       integer(c_int) :: XsyevjSetMaxSweeps
    end function hipsolverXsyevjSetMaxSweeps

    !---------------------------------------------
    ! hipsolverXsyevjSetSortEig
    !---------------------------------------------
    function hipsolverXsyevjSetSortEig(info, sort_eig) &
       result(XsyevjSetSortEig) &
       bind(C, name="hipsolverXsyevjSetSortEig")
       import :: c_ptr, c_int
       type(c_ptr), value :: info
       integer(c_int), value :: sort_eig
       integer(c_int) :: XsyevjSetSortEig
    end function hipsolverXsyevjSetSortEig

    !---------------------------------------------
    ! hipsolverXsyevjSetTolerance
    !---------------------------------------------
    function hipsolverXsyevjSetTolerance(info, tolerance) &
       result(XsyevjSetTolerance) &
       bind(C, name="hipsolverXsyevjSetTolerance")
       import :: c_ptr, c_double, c_int
       type(c_ptr), value :: info
       real(c_double), value :: tolerance
       integer(c_int) :: XsyevjSetTolerance
    end function hipsolverXsyevjSetTolerance

    !---------------------------------------------
    ! hipsolverXsyevjGetResidual
    !---------------------------------------------
    function hipsolverXsyevjGetResidual(handle, info, residual) &
       result(XsyevjGetResidual) &
       bind(C, name="hipsolverXsyevjGetResidual")
       import :: c_ptr, c_double, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: info
       real(c_double) :: residual(*)
       integer(c_int) :: XsyevjGetResidual
    end function hipsolverXsyevjGetResidual

    !---------------------------------------------
    ! hipsolverXsyevjGetSweeps
    !---------------------------------------------
    function hipsolverXsyevjGetSweeps(handle, info, executed_sweeps) &
       result(XsyevjGetSweeps) &
       bind(C, name="hipsolverXsyevjGetSweeps")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: info
       integer(c_int) :: executed_sweeps(*)
       integer(c_int) :: XsyevjGetSweeps
    end function hipsolverXsyevjGetSweeps

    !---------------------------------------------
    ! hipsolverSorgbr_bufferSize
    !---------------------------------------------
    function hipsolverSorgbr_bufferSize(handle, side, m, n, k, A, lda, tau, lwork) &
       result(Sorgbr_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSorgbr_bufferSize")
#else
       bind(C, name="hipsolverSorgbr_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: tau(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: Sorgbr_bufferSize
    end function hipsolverSorgbr_bufferSize

    !---------------------------------------------
    ! hipsolverDorgbr_bufferSize
    !---------------------------------------------
    function hipsolverDorgbr_bufferSize(handle, side, m, n, k, A, lda, tau, lwork) &
       result(Dorgbr_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDorgbr_bufferSize")
#else
       bind(C, name="hipsolverDorgbr_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: tau(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: Dorgbr_bufferSize
    end function hipsolverDorgbr_bufferSize

    !---------------------------------------------
    ! hipsolverCungbr_bufferSize
    !---------------------------------------------
    function hipsolverCungbr_bufferSize(handle, side, m, n, k, A, lda, tau, lwork) &
       result(Cungbr_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCungbr_bufferSize")
#else
       bind(C, name="hipsolverCungbr_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       integer(c_int) :: lwork(*)
       integer(c_int) :: Cungbr_bufferSize
    end function hipsolverCungbr_bufferSize

    !---------------------------------------------
    ! hipsolverZungbr_bufferSize
    !---------------------------------------------
    function hipsolverZungbr_bufferSize(handle, side, m, n, k, A, lda, tau, lwork) &
       result(Zungbr_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZungbr_bufferSize")
#else
       bind(C, name="hipsolverZungbr_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       integer(c_int) :: lwork(*)
       integer(c_int) :: Zungbr_bufferSize
    end function hipsolverZungbr_bufferSize

    !---------------------------------------------
    ! hipsolverSorgbr
    !---------------------------------------------
    function hipsolverSorgbr(handle, side, m, n, k, A, lda, tau, work, lwork, devInfo) &
       result(Sorgbr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSorgbr")
#else
       bind(C, name="hipsolverSorgbr")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: tau(*)
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Sorgbr
    end function hipsolverSorgbr

    !---------------------------------------------
    ! hipsolverDorgbr
    !---------------------------------------------
    function hipsolverDorgbr(handle, side, m, n, k, A, lda, tau, work, lwork, devInfo) &
       result(Dorgbr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDorgbr")
#else
       bind(C, name="hipsolverDorgbr")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: tau(*)
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Dorgbr
    end function hipsolverDorgbr

    !---------------------------------------------
    ! hipsolverCungbr
    !---------------------------------------------
    function hipsolverCungbr(handle, side, m, n, k, A, lda, tau, work, lwork, devInfo) &
       result(Cungbr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCungbr")
#else
       bind(C, name="hipsolverCungbr")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Cungbr
    end function hipsolverCungbr

    !---------------------------------------------
    ! hipsolverZungbr
    !---------------------------------------------
    function hipsolverZungbr(handle, side, m, n, k, A, lda, tau, work, lwork, devInfo) &
       result(Zungbr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZungbr")
#else
       bind(C, name="hipsolverZungbr")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Zungbr
    end function hipsolverZungbr

    !---------------------------------------------
    ! hipsolverSorgqr_bufferSize
    !---------------------------------------------
    function hipsolverSorgqr_bufferSize(handle, m, n, k, A, lda, tau, lwork) &
       result(Sorgqr_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSorgqr_bufferSize")
#else
       bind(C, name="hipsolverSorgqr_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: tau(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: Sorgqr_bufferSize
    end function hipsolverSorgqr_bufferSize

    !---------------------------------------------
    ! hipsolverDorgqr_bufferSize
    !---------------------------------------------
    function hipsolverDorgqr_bufferSize(handle, m, n, k, A, lda, tau, lwork) &
       result(Dorgqr_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDorgqr_bufferSize")
#else
       bind(C, name="hipsolverDorgqr_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: tau(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: Dorgqr_bufferSize
    end function hipsolverDorgqr_bufferSize

    !---------------------------------------------
    ! hipsolverCungqr_bufferSize
    !---------------------------------------------
    function hipsolverCungqr_bufferSize(handle, m, n, k, A, lda, tau, lwork) &
       result(Cungqr_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCungqr_bufferSize")
#else
       bind(C, name="hipsolverCungqr_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       integer(c_int) :: lwork(*)
       integer(c_int) :: Cungqr_bufferSize
    end function hipsolverCungqr_bufferSize

    !---------------------------------------------
    ! hipsolverZungqr_bufferSize
    !---------------------------------------------
    function hipsolverZungqr_bufferSize(handle, m, n, k, A, lda, tau, lwork) &
       result(Zungqr_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZungqr_bufferSize")
#else
       bind(C, name="hipsolverZungqr_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       integer(c_int) :: lwork(*)
       integer(c_int) :: Zungqr_bufferSize
    end function hipsolverZungqr_bufferSize

    !---------------------------------------------
    ! hipsolverSorgqr
    !---------------------------------------------
    function hipsolverSorgqr(handle, m, n, k, A, lda, tau, work, lwork, devInfo) &
       result(Sorgqr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSorgqr")
#else
       bind(C, name="hipsolverSorgqr")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: tau(*)
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Sorgqr
    end function hipsolverSorgqr

    !---------------------------------------------
    ! hipsolverDorgqr
    !---------------------------------------------
    function hipsolverDorgqr(handle, m, n, k, A, lda, tau, work, lwork, devInfo) &
       result(Dorgqr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDorgqr")
#else
       bind(C, name="hipsolverDorgqr")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: tau(*)
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Dorgqr
    end function hipsolverDorgqr

    !---------------------------------------------
    ! hipsolverCungqr
    !---------------------------------------------
    function hipsolverCungqr(handle, m, n, k, A, lda, tau, work, lwork, devInfo) &
       result(Cungqr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCungqr")
#else
       bind(C, name="hipsolverCungqr")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Cungqr
    end function hipsolverCungqr

    !---------------------------------------------
    ! hipsolverZungqr
    !---------------------------------------------
    function hipsolverZungqr(handle, m, n, k, A, lda, tau, work, lwork, devInfo) &
       result(Zungqr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZungqr")
#else
       bind(C, name="hipsolverZungqr")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Zungqr
    end function hipsolverZungqr

    !---------------------------------------------
    ! hipsolverSorgtr_bufferSize
    !---------------------------------------------
    function hipsolverSorgtr_bufferSize(handle, uplo, n, A, lda, tau, lwork) &
       result(Sorgtr_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSorgtr_bufferSize")
#else
       bind(C, name="hipsolverSorgtr_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: tau(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: Sorgtr_bufferSize
    end function hipsolverSorgtr_bufferSize

    !---------------------------------------------
    ! hipsolverDorgtr_bufferSize
    !---------------------------------------------
    function hipsolverDorgtr_bufferSize(handle, uplo, n, A, lda, tau, lwork) &
       result(Dorgtr_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDorgtr_bufferSize")
#else
       bind(C, name="hipsolverDorgtr_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: tau(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: Dorgtr_bufferSize
    end function hipsolverDorgtr_bufferSize

    !---------------------------------------------
    ! hipsolverCungtr_bufferSize
    !---------------------------------------------
    function hipsolverCungtr_bufferSize(handle, uplo, n, A, lda, tau, lwork) &
       result(Cungtr_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCungtr_bufferSize")
#else
       bind(C, name="hipsolverCungtr_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       integer(c_int) :: lwork(*)
       integer(c_int) :: Cungtr_bufferSize
    end function hipsolverCungtr_bufferSize

    !---------------------------------------------
    ! hipsolverZungtr_bufferSize
    !---------------------------------------------
    function hipsolverZungtr_bufferSize(handle, uplo, n, A, lda, tau, lwork) &
       result(Zungtr_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZungtr_bufferSize")
#else
       bind(C, name="hipsolverZungtr_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       integer(c_int) :: lwork(*)
       integer(c_int) :: Zungtr_bufferSize
    end function hipsolverZungtr_bufferSize

    !---------------------------------------------
    ! hipsolverSorgtr
    !---------------------------------------------
    function hipsolverSorgtr(handle, uplo, n, A, lda, tau, work, lwork, devInfo) &
       result(Sorgtr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSorgtr")
#else
       bind(C, name="hipsolverSorgtr")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: tau(*)
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Sorgtr
    end function hipsolverSorgtr

    !---------------------------------------------
    ! hipsolverDorgtr
    !---------------------------------------------
    function hipsolverDorgtr(handle, uplo, n, A, lda, tau, work, lwork, devInfo) &
       result(Dorgtr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDorgtr")
#else
       bind(C, name="hipsolverDorgtr")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: tau(*)
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Dorgtr
    end function hipsolverDorgtr

    !---------------------------------------------
    ! hipsolverCungtr
    !---------------------------------------------
    function hipsolverCungtr(handle, uplo, n, A, lda, tau, work, lwork, devInfo) &
       result(Cungtr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCungtr")
#else
       bind(C, name="hipsolverCungtr")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Cungtr
    end function hipsolverCungtr

    !---------------------------------------------
    ! hipsolverZungtr
    !---------------------------------------------
    function hipsolverZungtr(handle, uplo, n, A, lda, tau, work, lwork, devInfo) &
       result(Zungtr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZungtr")
#else
       bind(C, name="hipsolverZungtr")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Zungtr
    end function hipsolverZungtr

    !---------------------------------------------
    ! hipsolverSormqr_bufferSize
    !---------------------------------------------
    function hipsolverSormqr_bufferSize(handle, side, trans, m, n, k, A, lda, tau, C, ldc, lwork) &
       result(Sormqr_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSormqr_bufferSize")
#else
       bind(C, name="hipsolverSormqr_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: tau(*)
       real(c_float) :: C(*)
       integer(c_int), value :: ldc
       integer(c_int) :: lwork(*)
       integer(c_int) :: Sormqr_bufferSize
    end function hipsolverSormqr_bufferSize

    !---------------------------------------------
    ! hipsolverDormqr_bufferSize
    !---------------------------------------------
    function hipsolverDormqr_bufferSize(handle, side, trans, m, n, k, A, lda, tau, C, ldc, lwork) &
       result(Dormqr_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDormqr_bufferSize")
#else
       bind(C, name="hipsolverDormqr_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: tau(*)
       real(c_double) :: C(*)
       integer(c_int), value :: ldc
       integer(c_int) :: lwork(*)
       integer(c_int) :: Dormqr_bufferSize
    end function hipsolverDormqr_bufferSize

    !---------------------------------------------
    ! hipsolverCunmqr_bufferSize
    !---------------------------------------------
    function hipsolverCunmqr_bufferSize(handle, side, trans, m, n, k, A, lda, tau, C, ldc, lwork) &
       result(Cunmqr_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCunmqr_bufferSize")
#else
       bind(C, name="hipsolverCunmqr_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       integer(c_int) :: lwork(*)
       integer(c_int) :: Cunmqr_bufferSize
    end function hipsolverCunmqr_bufferSize

    !---------------------------------------------
    ! hipsolverZunmqr_bufferSize
    !---------------------------------------------
    function hipsolverZunmqr_bufferSize(handle, side, trans, m, n, k, A, lda, tau, C, ldc, lwork) &
       result(Zunmqr_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZunmqr_bufferSize")
#else
       bind(C, name="hipsolverZunmqr_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       integer(c_int) :: lwork(*)
       integer(c_int) :: Zunmqr_bufferSize
    end function hipsolverZunmqr_bufferSize

    !---------------------------------------------
    ! hipsolverSormqr
    !---------------------------------------------
    function hipsolverSormqr(handle, side, trans, m, n, k, A, lda, tau, C, ldc, work, lwork, &
                             devInfo) &
       result(Sormqr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSormqr")
#else
       bind(C, name="hipsolverSormqr")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: tau(*)
       real(c_float) :: C(*)
       integer(c_int), value :: ldc
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Sormqr
    end function hipsolverSormqr

    !---------------------------------------------
    ! hipsolverDormqr
    !---------------------------------------------
    function hipsolverDormqr(handle, side, trans, m, n, k, A, lda, tau, C, ldc, work, lwork, &
                             devInfo) &
       result(Dormqr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDormqr")
#else
       bind(C, name="hipsolverDormqr")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: tau(*)
       real(c_double) :: C(*)
       integer(c_int), value :: ldc
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Dormqr
    end function hipsolverDormqr

    !---------------------------------------------
    ! hipsolverCunmqr
    !---------------------------------------------
    function hipsolverCunmqr(handle, side, trans, m, n, k, A, lda, tau, C, ldc, work, lwork, &
                             devInfo) &
       result(Cunmqr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCunmqr")
#else
       bind(C, name="hipsolverCunmqr")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Cunmqr
    end function hipsolverCunmqr

    !---------------------------------------------
    ! hipsolverZunmqr
    !---------------------------------------------
    function hipsolverZunmqr(handle, side, trans, m, n, k, A, lda, tau, C, ldc, work, lwork, &
                             devInfo) &
       result(Zunmqr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZunmqr")
#else
       bind(C, name="hipsolverZunmqr")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Zunmqr
    end function hipsolverZunmqr

    !---------------------------------------------
    ! hipsolverSormtr_bufferSize
    !---------------------------------------------
    function hipsolverSormtr_bufferSize(handle, side, uplo, trans, m, n, A, lda, tau, C, ldc, &
                                        lwork) &
       result(Sormtr_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSormtr_bufferSize")
#else
       bind(C, name="hipsolverSormtr_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: uplo
       integer(c_int), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: tau(*)
       real(c_float) :: C(*)
       integer(c_int), value :: ldc
       integer(c_int) :: lwork(*)
       integer(c_int) :: Sormtr_bufferSize
    end function hipsolverSormtr_bufferSize

    !---------------------------------------------
    ! hipsolverDormtr_bufferSize
    !---------------------------------------------
    function hipsolverDormtr_bufferSize(handle, side, uplo, trans, m, n, A, lda, tau, C, ldc, &
                                        lwork) &
       result(Dormtr_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDormtr_bufferSize")
#else
       bind(C, name="hipsolverDormtr_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: uplo
       integer(c_int), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: tau(*)
       real(c_double) :: C(*)
       integer(c_int), value :: ldc
       integer(c_int) :: lwork(*)
       integer(c_int) :: Dormtr_bufferSize
    end function hipsolverDormtr_bufferSize

    !---------------------------------------------
    ! hipsolverCunmtr_bufferSize
    !---------------------------------------------
    function hipsolverCunmtr_bufferSize(handle, side, uplo, trans, m, n, A, lda, tau, C, ldc, &
                                        lwork) &
       result(Cunmtr_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCunmtr_bufferSize")
#else
       bind(C, name="hipsolverCunmtr_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: uplo
       integer(c_int), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       integer(c_int) :: lwork(*)
       integer(c_int) :: Cunmtr_bufferSize
    end function hipsolverCunmtr_bufferSize

    !---------------------------------------------
    ! hipsolverZunmtr_bufferSize
    !---------------------------------------------
    function hipsolverZunmtr_bufferSize(handle, side, uplo, trans, m, n, A, lda, tau, C, ldc, &
                                        lwork) &
       result(Zunmtr_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZunmtr_bufferSize")
#else
       bind(C, name="hipsolverZunmtr_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: uplo
       integer(c_int), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       integer(c_int) :: lwork(*)
       integer(c_int) :: Zunmtr_bufferSize
    end function hipsolverZunmtr_bufferSize

    !---------------------------------------------
    ! hipsolverSormtr
    !---------------------------------------------
    function hipsolverSormtr(handle, side, uplo, trans, m, n, A, lda, tau, C, ldc, work, lwork, &
                             devInfo) &
       result(Sormtr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSormtr")
#else
       bind(C, name="hipsolverSormtr")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: uplo
       integer(c_int), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: tau(*)
       real(c_float) :: C(*)
       integer(c_int), value :: ldc
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Sormtr
    end function hipsolverSormtr

    !---------------------------------------------
    ! hipsolverDormtr
    !---------------------------------------------
    function hipsolverDormtr(handle, side, uplo, trans, m, n, A, lda, tau, C, ldc, work, lwork, &
                             devInfo) &
       result(Dormtr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDormtr")
#else
       bind(C, name="hipsolverDormtr")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: uplo
       integer(c_int), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: tau(*)
       real(c_double) :: C(*)
       integer(c_int), value :: ldc
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Dormtr
    end function hipsolverDormtr

    !---------------------------------------------
    ! hipsolverCunmtr
    !---------------------------------------------
    function hipsolverCunmtr(handle, side, uplo, trans, m, n, A, lda, tau, C, ldc, work, lwork, &
                             devInfo) &
       result(Cunmtr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCunmtr")
#else
       bind(C, name="hipsolverCunmtr")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: uplo
       integer(c_int), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Cunmtr
    end function hipsolverCunmtr

    !---------------------------------------------
    ! hipsolverZunmtr
    !---------------------------------------------
    function hipsolverZunmtr(handle, side, uplo, trans, m, n, A, lda, tau, C, ldc, work, lwork, &
                             devInfo) &
       result(Zunmtr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZunmtr")
#else
       bind(C, name="hipsolverZunmtr")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: uplo
       integer(c_int), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Zunmtr
    end function hipsolverZunmtr

    !---------------------------------------------
    ! hipsolverSgebrd_bufferSize
    !---------------------------------------------
    function hipsolverSgebrd_bufferSize(handle, m, n, lwork) &
       result(Sgebrd_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSgebrd_bufferSize")
#else
       bind(C, name="hipsolverSgebrd_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int) :: lwork(*)
       integer(c_int) :: Sgebrd_bufferSize
    end function hipsolverSgebrd_bufferSize

    !---------------------------------------------
    ! hipsolverDgebrd_bufferSize
    !---------------------------------------------
    function hipsolverDgebrd_bufferSize(handle, m, n, lwork) &
       result(Dgebrd_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDgebrd_bufferSize")
#else
       bind(C, name="hipsolverDgebrd_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int) :: lwork(*)
       integer(c_int) :: Dgebrd_bufferSize
    end function hipsolverDgebrd_bufferSize

    !---------------------------------------------
    ! hipsolverCgebrd_bufferSize
    !---------------------------------------------
    function hipsolverCgebrd_bufferSize(handle, m, n, lwork) &
       result(Cgebrd_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCgebrd_bufferSize")
#else
       bind(C, name="hipsolverCgebrd_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int) :: lwork(*)
       integer(c_int) :: Cgebrd_bufferSize
    end function hipsolverCgebrd_bufferSize

    !---------------------------------------------
    ! hipsolverZgebrd_bufferSize
    !---------------------------------------------
    function hipsolverZgebrd_bufferSize(handle, m, n, lwork) &
       result(Zgebrd_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZgebrd_bufferSize")
#else
       bind(C, name="hipsolverZgebrd_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int) :: lwork(*)
       integer(c_int) :: Zgebrd_bufferSize
    end function hipsolverZgebrd_bufferSize

    !---------------------------------------------
    ! hipsolverSgebrd
    !---------------------------------------------
    function hipsolverSgebrd(handle, m, n, A, lda, D, E, tauq, taup, work, lwork, devInfo) &
       result(Sgebrd) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSgebrd")
#else
       bind(C, name="hipsolverSgebrd")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: D(*)
       real(c_float) :: E(*)
       real(c_float) :: tauq(*)
       real(c_float) :: taup(*)
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Sgebrd
    end function hipsolverSgebrd

    !---------------------------------------------
    ! hipsolverDgebrd
    !---------------------------------------------
    function hipsolverDgebrd(handle, m, n, A, lda, D, E, tauq, taup, work, lwork, devInfo) &
       result(Dgebrd) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDgebrd")
#else
       bind(C, name="hipsolverDgebrd")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: D(*)
       real(c_double) :: E(*)
       real(c_double) :: tauq(*)
       real(c_double) :: taup(*)
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Dgebrd
    end function hipsolverDgebrd

    !---------------------------------------------
    ! hipsolverCgebrd
    !---------------------------------------------
    function hipsolverCgebrd(handle, m, n, A, lda, D, E, tauq, taup, work, lwork, devInfo) &
       result(Cgebrd) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCgebrd")
#else
       bind(C, name="hipsolverCgebrd")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float) :: D(*)
       real(c_float) :: E(*)
       type(c_ptr), value :: tauq
       type(c_ptr), value :: taup
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Cgebrd
    end function hipsolverCgebrd

    !---------------------------------------------
    ! hipsolverZgebrd
    !---------------------------------------------
    function hipsolverZgebrd(handle, m, n, A, lda, D, E, tauq, taup, work, lwork, devInfo) &
       result(Zgebrd) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZgebrd")
#else
       bind(C, name="hipsolverZgebrd")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double) :: D(*)
       real(c_double) :: E(*)
       type(c_ptr), value :: tauq
       type(c_ptr), value :: taup
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Zgebrd
    end function hipsolverZgebrd

    !---------------------------------------------
    ! hipsolverSSgels_bufferSize
    !---------------------------------------------
    function hipsolverSSgels_bufferSize(handle, m, n, nrhs, A, lda, B, ldb, X, ldx, lwork) &
       result(SSgels_bufferSize) &
       bind(C, name="hipsolverSSgels_bufferSize")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: B(*)
       integer(c_int), value :: ldb
       real(c_float) :: X(*)
       integer(c_int), value :: ldx
       type(c_ptr), value :: lwork
       integer(c_int) :: SSgels_bufferSize
    end function hipsolverSSgels_bufferSize

    !---------------------------------------------
    ! hipsolverDDgels_bufferSize
    !---------------------------------------------
    function hipsolverDDgels_bufferSize(handle, m, n, nrhs, A, lda, B, ldb, X, ldx, lwork) &
       result(DDgels_bufferSize) &
       bind(C, name="hipsolverDDgels_bufferSize")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: B(*)
       integer(c_int), value :: ldb
       real(c_double) :: X(*)
       integer(c_int), value :: ldx
       type(c_ptr), value :: lwork
       integer(c_int) :: DDgels_bufferSize
    end function hipsolverDDgels_bufferSize

    !---------------------------------------------
    ! hipsolverCCgels_bufferSize
    !---------------------------------------------
    function hipsolverCCgels_bufferSize(handle, m, n, nrhs, A, lda, B, ldb, X, ldx, lwork) &
       result(CCgels_bufferSize) &
       bind(C, name="hipsolverCCgels_bufferSize")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       type(c_ptr), value :: lwork
       integer(c_int) :: CCgels_bufferSize
    end function hipsolverCCgels_bufferSize

    !---------------------------------------------
    ! hipsolverZZgels_bufferSize
    !---------------------------------------------
    function hipsolverZZgels_bufferSize(handle, m, n, nrhs, A, lda, B, ldb, X, ldx, lwork) &
       result(ZZgels_bufferSize) &
       bind(C, name="hipsolverZZgels_bufferSize")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       type(c_ptr), value :: lwork
       integer(c_int) :: ZZgels_bufferSize
    end function hipsolverZZgels_bufferSize

    !---------------------------------------------
    ! hipsolverSSgels
    !---------------------------------------------
    function hipsolverSSgels(handle, m, n, nrhs, A, lda, B, ldb, X, ldx, work, lwork, niters, &
                             devInfo) &
       result(SSgels) &
       bind(C, name="hipsolverSSgels")
       import :: c_ptr, c_int, c_float, c_long
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: B(*)
       integer(c_int), value :: ldb
       real(c_float) :: X(*)
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       integer(c_long), value :: lwork
       integer(c_int) :: niters(*)
       integer(c_int) :: devInfo(*)
       integer(c_int) :: SSgels
    end function hipsolverSSgels

    !---------------------------------------------
    ! hipsolverDDgels
    !---------------------------------------------
    function hipsolverDDgels(handle, m, n, nrhs, A, lda, B, ldb, X, ldx, work, lwork, niters, &
                             devInfo) &
       result(DDgels) &
       bind(C, name="hipsolverDDgels")
       import :: c_ptr, c_int, c_double, c_long
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: B(*)
       integer(c_int), value :: ldb
       real(c_double) :: X(*)
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       integer(c_long), value :: lwork
       integer(c_int) :: niters(*)
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DDgels
    end function hipsolverDDgels

    !---------------------------------------------
    ! hipsolverCCgels
    !---------------------------------------------
    function hipsolverCCgels(handle, m, n, nrhs, A, lda, B, ldb, X, ldx, work, lwork, niters, &
                             devInfo) &
       result(CCgels) &
       bind(C, name="hipsolverCCgels")
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       integer(c_long), value :: lwork
       integer(c_int) :: niters(*)
       integer(c_int) :: devInfo(*)
       integer(c_int) :: CCgels
    end function hipsolverCCgels

    !---------------------------------------------
    ! hipsolverZZgels
    !---------------------------------------------
    function hipsolverZZgels(handle, m, n, nrhs, A, lda, B, ldb, X, ldx, work, lwork, niters, &
                             devInfo) &
       result(ZZgels) &
       bind(C, name="hipsolverZZgels")
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       integer(c_long), value :: lwork
       integer(c_int) :: niters(*)
       integer(c_int) :: devInfo(*)
       integer(c_int) :: ZZgels
    end function hipsolverZZgels

    !---------------------------------------------
    ! hipsolverSgeqrf_bufferSize
    !---------------------------------------------
    function hipsolverSgeqrf_bufferSize(handle, m, n, A, lda, lwork) &
       result(Sgeqrf_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSgeqrf_bufferSize")
#else
       bind(C, name="hipsolverSgeqrf_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: Sgeqrf_bufferSize
    end function hipsolverSgeqrf_bufferSize

    !---------------------------------------------
    ! hipsolverDgeqrf_bufferSize
    !---------------------------------------------
    function hipsolverDgeqrf_bufferSize(handle, m, n, A, lda, lwork) &
       result(Dgeqrf_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDgeqrf_bufferSize")
#else
       bind(C, name="hipsolverDgeqrf_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: Dgeqrf_bufferSize
    end function hipsolverDgeqrf_bufferSize

    !---------------------------------------------
    ! hipsolverCgeqrf_bufferSize
    !---------------------------------------------
    function hipsolverCgeqrf_bufferSize(handle, m, n, A, lda, lwork) &
       result(Cgeqrf_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCgeqrf_bufferSize")
#else
       bind(C, name="hipsolverCgeqrf_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: Cgeqrf_bufferSize
    end function hipsolverCgeqrf_bufferSize

    !---------------------------------------------
    ! hipsolverZgeqrf_bufferSize
    !---------------------------------------------
    function hipsolverZgeqrf_bufferSize(handle, m, n, A, lda, lwork) &
       result(Zgeqrf_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZgeqrf_bufferSize")
#else
       bind(C, name="hipsolverZgeqrf_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: Zgeqrf_bufferSize
    end function hipsolverZgeqrf_bufferSize

    !---------------------------------------------
    ! hipsolverSgeqrf
    !---------------------------------------------
    function hipsolverSgeqrf(handle, m, n, A, lda, tau, work, lwork, devInfo) &
       result(Sgeqrf) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSgeqrf")
#else
       bind(C, name="hipsolverSgeqrf")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: tau(*)
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Sgeqrf
    end function hipsolverSgeqrf

    !---------------------------------------------
    ! hipsolverDgeqrf
    !---------------------------------------------
    function hipsolverDgeqrf(handle, m, n, A, lda, tau, work, lwork, devInfo) &
       result(Dgeqrf) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDgeqrf")
#else
       bind(C, name="hipsolverDgeqrf")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: tau(*)
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Dgeqrf
    end function hipsolverDgeqrf

    !---------------------------------------------
    ! hipsolverCgeqrf
    !---------------------------------------------
    function hipsolverCgeqrf(handle, m, n, A, lda, tau, work, lwork, devInfo) &
       result(Cgeqrf) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCgeqrf")
#else
       bind(C, name="hipsolverCgeqrf")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Cgeqrf
    end function hipsolverCgeqrf

    !---------------------------------------------
    ! hipsolverZgeqrf
    !---------------------------------------------
    function hipsolverZgeqrf(handle, m, n, A, lda, tau, work, lwork, devInfo) &
       result(Zgeqrf) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZgeqrf")
#else
       bind(C, name="hipsolverZgeqrf")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Zgeqrf
    end function hipsolverZgeqrf

    !---------------------------------------------
    ! hipsolverSSgesv_bufferSize
    !---------------------------------------------
    function hipsolverSSgesv_bufferSize(handle, n, nrhs, A, lda, devIpiv, B, ldb, X, ldx, lwork) &
       result(SSgesv_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSSgesv_bufferSize")
#else
       bind(C, name="hipsolverSSgesv_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: devIpiv(*)
       real(c_float) :: B(*)
       integer(c_int), value :: ldb
       real(c_float) :: X(*)
       integer(c_int), value :: ldx
       type(c_ptr), value :: lwork
       integer(c_int) :: SSgesv_bufferSize
    end function hipsolverSSgesv_bufferSize

    !---------------------------------------------
    ! hipsolverDDgesv_bufferSize
    !---------------------------------------------
    function hipsolverDDgesv_bufferSize(handle, n, nrhs, A, lda, devIpiv, B, ldb, X, ldx, lwork) &
       result(DDgesv_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDDgesv_bufferSize")
#else
       bind(C, name="hipsolverDDgesv_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: devIpiv(*)
       real(c_double) :: B(*)
       integer(c_int), value :: ldb
       real(c_double) :: X(*)
       integer(c_int), value :: ldx
       type(c_ptr), value :: lwork
       integer(c_int) :: DDgesv_bufferSize
    end function hipsolverDDgesv_bufferSize

    !---------------------------------------------
    ! hipsolverCCgesv_bufferSize
    !---------------------------------------------
    function hipsolverCCgesv_bufferSize(handle, n, nrhs, A, lda, devIpiv, B, ldb, X, ldx, lwork) &
       result(CCgesv_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCCgesv_bufferSize")
#else
       bind(C, name="hipsolverCCgesv_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: devIpiv(*)
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       type(c_ptr), value :: lwork
       integer(c_int) :: CCgesv_bufferSize
    end function hipsolverCCgesv_bufferSize

    !---------------------------------------------
    ! hipsolverZZgesv_bufferSize
    !---------------------------------------------
    function hipsolverZZgesv_bufferSize(handle, n, nrhs, A, lda, devIpiv, B, ldb, X, ldx, lwork) &
       result(ZZgesv_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZZgesv_bufferSize")
#else
       bind(C, name="hipsolverZZgesv_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: devIpiv(*)
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       type(c_ptr), value :: lwork
       integer(c_int) :: ZZgesv_bufferSize
    end function hipsolverZZgesv_bufferSize

    !---------------------------------------------
    ! hipsolverSSgesv
    !---------------------------------------------
    function hipsolverSSgesv(handle, n, nrhs, A, lda, devIpiv, B, ldb, X, ldx, work, lwork, &
                             niters, devInfo) &
       result(SSgesv) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSSgesv")
#else
       bind(C, name="hipsolverSSgesv")
#endif
       import :: c_ptr, c_int, c_float, c_long
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: devIpiv(*)
       real(c_float) :: B(*)
       integer(c_int), value :: ldb
       real(c_float) :: X(*)
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       integer(c_long), value :: lwork
       integer(c_int) :: niters(*)
       integer(c_int) :: devInfo(*)
       integer(c_int) :: SSgesv
    end function hipsolverSSgesv

    !---------------------------------------------
    ! hipsolverDDgesv
    !---------------------------------------------
    function hipsolverDDgesv(handle, n, nrhs, A, lda, devIpiv, B, ldb, X, ldx, work, lwork, &
                             niters, devInfo) &
       result(DDgesv) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDDgesv")
#else
       bind(C, name="hipsolverDDgesv")
#endif
       import :: c_ptr, c_int, c_double, c_long
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: devIpiv(*)
       real(c_double) :: B(*)
       integer(c_int), value :: ldb
       real(c_double) :: X(*)
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       integer(c_long), value :: lwork
       integer(c_int) :: niters(*)
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DDgesv
    end function hipsolverDDgesv

    !---------------------------------------------
    ! hipsolverCCgesv
    !---------------------------------------------
    function hipsolverCCgesv(handle, n, nrhs, A, lda, devIpiv, B, ldb, X, ldx, work, lwork, &
                             niters, devInfo) &
       result(CCgesv) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCCgesv")
#else
       bind(C, name="hipsolverCCgesv")
#endif
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: devIpiv(*)
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       integer(c_long), value :: lwork
       integer(c_int) :: niters(*)
       integer(c_int) :: devInfo(*)
       integer(c_int) :: CCgesv
    end function hipsolverCCgesv

    !---------------------------------------------
    ! hipsolverZZgesv
    !---------------------------------------------
    function hipsolverZZgesv(handle, n, nrhs, A, lda, devIpiv, B, ldb, X, ldx, work, lwork, &
                             niters, devInfo) &
       result(ZZgesv) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZZgesv")
#else
       bind(C, name="hipsolverZZgesv")
#endif
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: devIpiv(*)
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       integer(c_long), value :: lwork
       integer(c_int) :: niters(*)
       integer(c_int) :: devInfo(*)
       integer(c_int) :: ZZgesv
    end function hipsolverZZgesv

    !---------------------------------------------
    ! hipsolverSgesvd_bufferSize
    !---------------------------------------------
    function hipsolverSgesvd_bufferSize(handle, jobu, jobv, m, n, lwork) &
       result(Sgesvd_bufferSize) &
       bind(C, name="hipsolverSgesvd_bufferSize")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: jobu
       type(c_ptr), value :: jobv
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int) :: lwork(*)
       integer(c_int) :: Sgesvd_bufferSize
    end function hipsolverSgesvd_bufferSize

    !---------------------------------------------
    ! hipsolverDgesvd_bufferSize
    !---------------------------------------------
    function hipsolverDgesvd_bufferSize(handle, jobu, jobv, m, n, lwork) &
       result(Dgesvd_bufferSize) &
       bind(C, name="hipsolverDgesvd_bufferSize")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: jobu
       type(c_ptr), value :: jobv
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int) :: lwork(*)
       integer(c_int) :: Dgesvd_bufferSize
    end function hipsolverDgesvd_bufferSize

    !---------------------------------------------
    ! hipsolverCgesvd_bufferSize
    !---------------------------------------------
    function hipsolverCgesvd_bufferSize(handle, jobu, jobv, m, n, lwork) &
       result(Cgesvd_bufferSize) &
       bind(C, name="hipsolverCgesvd_bufferSize")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: jobu
       type(c_ptr), value :: jobv
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int) :: lwork(*)
       integer(c_int) :: Cgesvd_bufferSize
    end function hipsolverCgesvd_bufferSize

    !---------------------------------------------
    ! hipsolverZgesvd_bufferSize
    !---------------------------------------------
    function hipsolverZgesvd_bufferSize(handle, jobu, jobv, m, n, lwork) &
       result(Zgesvd_bufferSize) &
       bind(C, name="hipsolverZgesvd_bufferSize")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: jobu
       type(c_ptr), value :: jobv
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int) :: lwork(*)
       integer(c_int) :: Zgesvd_bufferSize
    end function hipsolverZgesvd_bufferSize

    !---------------------------------------------
    ! hipsolverSgesvd
    !---------------------------------------------
    function hipsolverSgesvd(handle, jobu, jobv, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                             rwork, devInfo) &
       result(Sgesvd) &
       bind(C, name="hipsolverSgesvd")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       type(c_ptr), value :: jobu
       type(c_ptr), value :: jobv
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: S(*)
       real(c_float) :: U(*)
       integer(c_int), value :: ldu
       real(c_float) :: V(*)
       integer(c_int), value :: ldv
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       real(c_float) :: rwork(*)
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Sgesvd
    end function hipsolverSgesvd

    !---------------------------------------------
    ! hipsolverDgesvd
    !---------------------------------------------
    function hipsolverDgesvd(handle, jobu, jobv, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                             rwork, devInfo) &
       result(Dgesvd) &
       bind(C, name="hipsolverDgesvd")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       type(c_ptr), value :: jobu
       type(c_ptr), value :: jobv
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: S(*)
       real(c_double) :: U(*)
       integer(c_int), value :: ldu
       real(c_double) :: V(*)
       integer(c_int), value :: ldv
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       real(c_double) :: rwork(*)
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Dgesvd
    end function hipsolverDgesvd

    !---------------------------------------------
    ! hipsolverCgesvd
    !---------------------------------------------
    function hipsolverCgesvd(handle, jobu, jobv, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                             rwork, devInfo) &
       result(Cgesvd) &
       bind(C, name="hipsolverCgesvd")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       type(c_ptr), value :: jobu
       type(c_ptr), value :: jobv
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float) :: S(*)
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       real(c_float) :: rwork(*)
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Cgesvd
    end function hipsolverCgesvd

    !---------------------------------------------
    ! hipsolverZgesvd
    !---------------------------------------------
    function hipsolverZgesvd(handle, jobu, jobv, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                             rwork, devInfo) &
       result(Zgesvd) &
       bind(C, name="hipsolverZgesvd")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       type(c_ptr), value :: jobu
       type(c_ptr), value :: jobv
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double) :: S(*)
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       real(c_double) :: rwork(*)
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Zgesvd
    end function hipsolverZgesvd

    !---------------------------------------------
    ! hipsolverSgesvdj_bufferSize
    !---------------------------------------------
    function hipsolverSgesvdj_bufferSize(handle, jobz, econ, m, n, A, lda, S, U, ldu, V, ldv, &
                                         lwork, params) &
       result(Sgesvdj_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSgesvdj_bufferSize")
#else
       bind(C, name="hipsolverSgesvdj_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: econ
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: S(*)
       real(c_float) :: U(*)
       integer(c_int), value :: ldu
       real(c_float) :: V(*)
       integer(c_int), value :: ldv
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int) :: Sgesvdj_bufferSize
    end function hipsolverSgesvdj_bufferSize

    !---------------------------------------------
    ! hipsolverDgesvdj_bufferSize
    !---------------------------------------------
    function hipsolverDgesvdj_bufferSize(handle, jobz, econ, m, n, A, lda, S, U, ldu, V, ldv, &
                                         lwork, params) &
       result(Dgesvdj_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDgesvdj_bufferSize")
#else
       bind(C, name="hipsolverDgesvdj_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: econ
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: S(*)
       real(c_double) :: U(*)
       integer(c_int), value :: ldu
       real(c_double) :: V(*)
       integer(c_int), value :: ldv
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int) :: Dgesvdj_bufferSize
    end function hipsolverDgesvdj_bufferSize

    !---------------------------------------------
    ! hipsolverCgesvdj_bufferSize
    !---------------------------------------------
    function hipsolverCgesvdj_bufferSize(handle, jobz, econ, m, n, A, lda, S, U, ldu, V, ldv, &
                                         lwork, params) &
       result(Cgesvdj_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCgesvdj_bufferSize")
#else
       bind(C, name="hipsolverCgesvdj_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: econ
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float) :: S(*)
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int) :: Cgesvdj_bufferSize
    end function hipsolverCgesvdj_bufferSize

    !---------------------------------------------
    ! hipsolverZgesvdj_bufferSize
    !---------------------------------------------
    function hipsolverZgesvdj_bufferSize(handle, jobz, econ, m, n, A, lda, S, U, ldu, V, ldv, &
                                         lwork, params) &
       result(Zgesvdj_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZgesvdj_bufferSize")
#else
       bind(C, name="hipsolverZgesvdj_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: econ
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double) :: S(*)
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int) :: Zgesvdj_bufferSize
    end function hipsolverZgesvdj_bufferSize

    !---------------------------------------------
    ! hipsolverSgesvdj
    !---------------------------------------------
    function hipsolverSgesvdj(handle, jobz, econ, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                              devInfo, params) &
       result(Sgesvdj) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSgesvdj")
#else
       bind(C, name="hipsolverSgesvdj")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: econ
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: S(*)
       real(c_float) :: U(*)
       integer(c_int), value :: ldu
       real(c_float) :: V(*)
       integer(c_int), value :: ldv
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int) :: Sgesvdj
    end function hipsolverSgesvdj

    !---------------------------------------------
    ! hipsolverDgesvdj
    !---------------------------------------------
    function hipsolverDgesvdj(handle, jobz, econ, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                              devInfo, params) &
       result(Dgesvdj) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDgesvdj")
#else
       bind(C, name="hipsolverDgesvdj")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: econ
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: S(*)
       real(c_double) :: U(*)
       integer(c_int), value :: ldu
       real(c_double) :: V(*)
       integer(c_int), value :: ldv
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int) :: Dgesvdj
    end function hipsolverDgesvdj

    !---------------------------------------------
    ! hipsolverCgesvdj
    !---------------------------------------------
    function hipsolverCgesvdj(handle, jobz, econ, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                              devInfo, params) &
       result(Cgesvdj) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCgesvdj")
#else
       bind(C, name="hipsolverCgesvdj")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: econ
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float) :: S(*)
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int) :: Cgesvdj
    end function hipsolverCgesvdj

    !---------------------------------------------
    ! hipsolverZgesvdj
    !---------------------------------------------
    function hipsolverZgesvdj(handle, jobz, econ, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                              devInfo, params) &
       result(Zgesvdj) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZgesvdj")
#else
       bind(C, name="hipsolverZgesvdj")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: econ
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double) :: S(*)
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int) :: Zgesvdj
    end function hipsolverZgesvdj

    !---------------------------------------------
    ! hipsolverSgesvdjBatched_bufferSize
    !---------------------------------------------
    function hipsolverSgesvdjBatched_bufferSize(handle, jobz, m, n, A, lda, S, U, ldu, V, ldv, &
                                                lwork, params, batch_count) &
       result(SgesvdjBatched_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSgesvdjBatched_bufferSize")
#else
       bind(C, name="hipsolverSgesvdjBatched_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: S(*)
       real(c_float) :: U(*)
       integer(c_int), value :: ldu
       real(c_float) :: V(*)
       integer(c_int), value :: ldv
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(c_int) :: SgesvdjBatched_bufferSize
    end function hipsolverSgesvdjBatched_bufferSize

    !---------------------------------------------
    ! hipsolverDgesvdjBatched_bufferSize
    !---------------------------------------------
    function hipsolverDgesvdjBatched_bufferSize(handle, jobz, m, n, A, lda, S, U, ldu, V, ldv, &
                                                lwork, params, batch_count) &
       result(DgesvdjBatched_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDgesvdjBatched_bufferSize")
#else
       bind(C, name="hipsolverDgesvdjBatched_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: S(*)
       real(c_double) :: U(*)
       integer(c_int), value :: ldu
       real(c_double) :: V(*)
       integer(c_int), value :: ldv
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(c_int) :: DgesvdjBatched_bufferSize
    end function hipsolverDgesvdjBatched_bufferSize

    !---------------------------------------------
    ! hipsolverCgesvdjBatched_bufferSize
    !---------------------------------------------
    function hipsolverCgesvdjBatched_bufferSize(handle, jobz, m, n, A, lda, S, U, ldu, V, ldv, &
                                                lwork, params, batch_count) &
       result(CgesvdjBatched_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCgesvdjBatched_bufferSize")
#else
       bind(C, name="hipsolverCgesvdjBatched_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float) :: S(*)
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(c_int) :: CgesvdjBatched_bufferSize
    end function hipsolverCgesvdjBatched_bufferSize

    !---------------------------------------------
    ! hipsolverZgesvdjBatched_bufferSize
    !---------------------------------------------
    function hipsolverZgesvdjBatched_bufferSize(handle, jobz, m, n, A, lda, S, U, ldu, V, ldv, &
                                                lwork, params, batch_count) &
       result(ZgesvdjBatched_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZgesvdjBatched_bufferSize")
#else
       bind(C, name="hipsolverZgesvdjBatched_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double) :: S(*)
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(c_int) :: ZgesvdjBatched_bufferSize
    end function hipsolverZgesvdjBatched_bufferSize

    !---------------------------------------------
    ! hipsolverSgesvdjBatched
    !---------------------------------------------
    function hipsolverSgesvdjBatched(handle, jobz, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                                     devInfo, params, batch_count) &
       result(SgesvdjBatched) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSgesvdjBatched")
#else
       bind(C, name="hipsolverSgesvdjBatched")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: S(*)
       real(c_float) :: U(*)
       integer(c_int), value :: ldu
       real(c_float) :: V(*)
       integer(c_int), value :: ldv
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(c_int) :: SgesvdjBatched
    end function hipsolverSgesvdjBatched

    !---------------------------------------------
    ! hipsolverDgesvdjBatched
    !---------------------------------------------
    function hipsolverDgesvdjBatched(handle, jobz, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                                     devInfo, params, batch_count) &
       result(DgesvdjBatched) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDgesvdjBatched")
#else
       bind(C, name="hipsolverDgesvdjBatched")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: S(*)
       real(c_double) :: U(*)
       integer(c_int), value :: ldu
       real(c_double) :: V(*)
       integer(c_int), value :: ldv
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(c_int) :: DgesvdjBatched
    end function hipsolverDgesvdjBatched

    !---------------------------------------------
    ! hipsolverCgesvdjBatched
    !---------------------------------------------
    function hipsolverCgesvdjBatched(handle, jobz, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                                     devInfo, params, batch_count) &
       result(CgesvdjBatched) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCgesvdjBatched")
#else
       bind(C, name="hipsolverCgesvdjBatched")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float) :: S(*)
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(c_int) :: CgesvdjBatched
    end function hipsolverCgesvdjBatched

    !---------------------------------------------
    ! hipsolverZgesvdjBatched
    !---------------------------------------------
    function hipsolverZgesvdjBatched(handle, jobz, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                                     devInfo, params, batch_count) &
       result(ZgesvdjBatched) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZgesvdjBatched")
#else
       bind(C, name="hipsolverZgesvdjBatched")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double) :: S(*)
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(c_int) :: ZgesvdjBatched
    end function hipsolverZgesvdjBatched

    !---------------------------------------------
    ! hipsolverSgetrf_bufferSize
    !---------------------------------------------
    function hipsolverSgetrf_bufferSize(handle, m, n, A, lda, lwork) &
       result(Sgetrf_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSgetrf_bufferSize")
#else
       bind(C, name="hipsolverSgetrf_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: Sgetrf_bufferSize
    end function hipsolverSgetrf_bufferSize

    !---------------------------------------------
    ! hipsolverDgetrf_bufferSize
    !---------------------------------------------
    function hipsolverDgetrf_bufferSize(handle, m, n, A, lda, lwork) &
       result(Dgetrf_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDgetrf_bufferSize")
#else
       bind(C, name="hipsolverDgetrf_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: Dgetrf_bufferSize
    end function hipsolverDgetrf_bufferSize

    !---------------------------------------------
    ! hipsolverCgetrf_bufferSize
    !---------------------------------------------
    function hipsolverCgetrf_bufferSize(handle, m, n, A, lda, lwork) &
       result(Cgetrf_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCgetrf_bufferSize")
#else
       bind(C, name="hipsolverCgetrf_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: Cgetrf_bufferSize
    end function hipsolverCgetrf_bufferSize

    !---------------------------------------------
    ! hipsolverZgetrf_bufferSize
    !---------------------------------------------
    function hipsolverZgetrf_bufferSize(handle, m, n, A, lda, lwork) &
       result(Zgetrf_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZgetrf_bufferSize")
#else
       bind(C, name="hipsolverZgetrf_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: Zgetrf_bufferSize
    end function hipsolverZgetrf_bufferSize

    !---------------------------------------------
    ! hipsolverSgetrf
    !---------------------------------------------
    function hipsolverSgetrf(handle, m, n, A, lda, work, lwork, devIpiv, devInfo) &
       result(Sgetrf) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSgetrf")
#else
       bind(C, name="hipsolverSgetrf")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devIpiv(*)
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Sgetrf
    end function hipsolverSgetrf

    !---------------------------------------------
    ! hipsolverDgetrf
    !---------------------------------------------
    function hipsolverDgetrf(handle, m, n, A, lda, work, lwork, devIpiv, devInfo) &
       result(Dgetrf) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDgetrf")
#else
       bind(C, name="hipsolverDgetrf")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devIpiv(*)
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Dgetrf
    end function hipsolverDgetrf

    !---------------------------------------------
    ! hipsolverCgetrf
    !---------------------------------------------
    function hipsolverCgetrf(handle, m, n, A, lda, work, lwork, devIpiv, devInfo) &
       result(Cgetrf) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCgetrf")
#else
       bind(C, name="hipsolverCgetrf")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devIpiv(*)
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Cgetrf
    end function hipsolverCgetrf

    !---------------------------------------------
    ! hipsolverZgetrf
    !---------------------------------------------
    function hipsolverZgetrf(handle, m, n, A, lda, work, lwork, devIpiv, devInfo) &
       result(Zgetrf) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZgetrf")
#else
       bind(C, name="hipsolverZgetrf")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devIpiv(*)
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Zgetrf
    end function hipsolverZgetrf

    !---------------------------------------------
    ! hipsolverSgetrs_bufferSize
    !---------------------------------------------
    function hipsolverSgetrs_bufferSize(handle, trans, n, nrhs, A, lda, devIpiv, B, ldb, lwork) &
       result(Sgetrs_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSgetrs_bufferSize")
#else
       bind(C, name="hipsolverSgetrs_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: trans
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: devIpiv(*)
       real(c_float) :: B(*)
       integer(c_int), value :: ldb
       integer(c_int) :: lwork(*)
       integer(c_int) :: Sgetrs_bufferSize
    end function hipsolverSgetrs_bufferSize

    !---------------------------------------------
    ! hipsolverDgetrs_bufferSize
    !---------------------------------------------
    function hipsolverDgetrs_bufferSize(handle, trans, n, nrhs, A, lda, devIpiv, B, ldb, lwork) &
       result(Dgetrs_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDgetrs_bufferSize")
#else
       bind(C, name="hipsolverDgetrs_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: trans
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: devIpiv(*)
       real(c_double) :: B(*)
       integer(c_int), value :: ldb
       integer(c_int) :: lwork(*)
       integer(c_int) :: Dgetrs_bufferSize
    end function hipsolverDgetrs_bufferSize

    !---------------------------------------------
    ! hipsolverCgetrs_bufferSize
    !---------------------------------------------
    function hipsolverCgetrs_bufferSize(handle, trans, n, nrhs, A, lda, devIpiv, B, ldb, lwork) &
       result(Cgetrs_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCgetrs_bufferSize")
#else
       bind(C, name="hipsolverCgetrs_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: trans
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: devIpiv(*)
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       integer(c_int) :: lwork(*)
       integer(c_int) :: Cgetrs_bufferSize
    end function hipsolverCgetrs_bufferSize

    !---------------------------------------------
    ! hipsolverZgetrs_bufferSize
    !---------------------------------------------
    function hipsolverZgetrs_bufferSize(handle, trans, n, nrhs, A, lda, devIpiv, B, ldb, lwork) &
       result(Zgetrs_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZgetrs_bufferSize")
#else
       bind(C, name="hipsolverZgetrs_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: trans
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: devIpiv(*)
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       integer(c_int) :: lwork(*)
       integer(c_int) :: Zgetrs_bufferSize
    end function hipsolverZgetrs_bufferSize

    !---------------------------------------------
    ! hipsolverSgetrs
    !---------------------------------------------
    function hipsolverSgetrs(handle, trans, n, nrhs, A, lda, devIpiv, B, ldb, work, lwork, &
                             devInfo) &
       result(Sgetrs) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSgetrs")
#else
       bind(C, name="hipsolverSgetrs")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: trans
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: devIpiv(*)
       real(c_float) :: B(*)
       integer(c_int), value :: ldb
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Sgetrs
    end function hipsolverSgetrs

    !---------------------------------------------
    ! hipsolverDgetrs
    !---------------------------------------------
    function hipsolverDgetrs(handle, trans, n, nrhs, A, lda, devIpiv, B, ldb, work, lwork, &
                             devInfo) &
       result(Dgetrs) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDgetrs")
#else
       bind(C, name="hipsolverDgetrs")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: trans
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: devIpiv(*)
       real(c_double) :: B(*)
       integer(c_int), value :: ldb
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Dgetrs
    end function hipsolverDgetrs

    !---------------------------------------------
    ! hipsolverCgetrs
    !---------------------------------------------
    function hipsolverCgetrs(handle, trans, n, nrhs, A, lda, devIpiv, B, ldb, work, lwork, &
                             devInfo) &
       result(Cgetrs) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCgetrs")
#else
       bind(C, name="hipsolverCgetrs")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: trans
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: devIpiv(*)
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Cgetrs
    end function hipsolverCgetrs

    !---------------------------------------------
    ! hipsolverZgetrs
    !---------------------------------------------
    function hipsolverZgetrs(handle, trans, n, nrhs, A, lda, devIpiv, B, ldb, work, lwork, &
                             devInfo) &
       result(Zgetrs) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZgetrs")
#else
       bind(C, name="hipsolverZgetrs")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: trans
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: devIpiv(*)
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Zgetrs
    end function hipsolverZgetrs

    !---------------------------------------------
    ! hipsolverSpotrf_bufferSize
    !---------------------------------------------
    function hipsolverSpotrf_bufferSize(handle, uplo, n, A, lda, lwork) &
       result(Spotrf_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSpotrf_bufferSize")
#else
       bind(C, name="hipsolverSpotrf_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: Spotrf_bufferSize
    end function hipsolverSpotrf_bufferSize

    !---------------------------------------------
    ! hipsolverDpotrf_bufferSize
    !---------------------------------------------
    function hipsolverDpotrf_bufferSize(handle, uplo, n, A, lda, lwork) &
       result(Dpotrf_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDpotrf_bufferSize")
#else
       bind(C, name="hipsolverDpotrf_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: Dpotrf_bufferSize
    end function hipsolverDpotrf_bufferSize

    !---------------------------------------------
    ! hipsolverCpotrf_bufferSize
    !---------------------------------------------
    function hipsolverCpotrf_bufferSize(handle, uplo, n, A, lda, lwork) &
       result(Cpotrf_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCpotrf_bufferSize")
#else
       bind(C, name="hipsolverCpotrf_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: Cpotrf_bufferSize
    end function hipsolverCpotrf_bufferSize

    !---------------------------------------------
    ! hipsolverZpotrf_bufferSize
    !---------------------------------------------
    function hipsolverZpotrf_bufferSize(handle, uplo, n, A, lda, lwork) &
       result(Zpotrf_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZpotrf_bufferSize")
#else
       bind(C, name="hipsolverZpotrf_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: Zpotrf_bufferSize
    end function hipsolverZpotrf_bufferSize

    !---------------------------------------------
    ! hipsolverSpotrf
    !---------------------------------------------
    function hipsolverSpotrf(handle, uplo, n, A, lda, work, lwork, devInfo) &
       result(Spotrf) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSpotrf")
#else
       bind(C, name="hipsolverSpotrf")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Spotrf
    end function hipsolverSpotrf

    !---------------------------------------------
    ! hipsolverDpotrf
    !---------------------------------------------
    function hipsolverDpotrf(handle, uplo, n, A, lda, work, lwork, devInfo) &
       result(Dpotrf) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDpotrf")
#else
       bind(C, name="hipsolverDpotrf")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Dpotrf
    end function hipsolverDpotrf

    !---------------------------------------------
    ! hipsolverCpotrf
    !---------------------------------------------
    function hipsolverCpotrf(handle, uplo, n, A, lda, work, lwork, devInfo) &
       result(Cpotrf) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCpotrf")
#else
       bind(C, name="hipsolverCpotrf")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Cpotrf
    end function hipsolverCpotrf

    !---------------------------------------------
    ! hipsolverZpotrf
    !---------------------------------------------
    function hipsolverZpotrf(handle, uplo, n, A, lda, work, lwork, devInfo) &
       result(Zpotrf) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZpotrf")
#else
       bind(C, name="hipsolverZpotrf")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Zpotrf
    end function hipsolverZpotrf

    !---------------------------------------------
    ! hipsolverSpotrfBatched_bufferSize
    !---------------------------------------------
    function hipsolverSpotrfBatched_bufferSize(handle, uplo, n, A, lda, lwork, batch_count) &
       result(SpotrfBatched_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSpotrfBatched_bufferSize")
#else
       bind(C, name="hipsolverSpotrfBatched_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int), value :: batch_count
       integer(c_int) :: SpotrfBatched_bufferSize
    end function hipsolverSpotrfBatched_bufferSize

    !---------------------------------------------
    ! hipsolverDpotrfBatched_bufferSize
    !---------------------------------------------
    function hipsolverDpotrfBatched_bufferSize(handle, uplo, n, A, lda, lwork, batch_count) &
       result(DpotrfBatched_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDpotrfBatched_bufferSize")
#else
       bind(C, name="hipsolverDpotrfBatched_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int), value :: batch_count
       integer(c_int) :: DpotrfBatched_bufferSize
    end function hipsolverDpotrfBatched_bufferSize

    !---------------------------------------------
    ! hipsolverCpotrfBatched_bufferSize
    !---------------------------------------------
    function hipsolverCpotrfBatched_bufferSize(handle, uplo, n, A, lda, lwork, batch_count) &
       result(CpotrfBatched_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCpotrfBatched_bufferSize")
#else
       bind(C, name="hipsolverCpotrfBatched_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int), value :: batch_count
       integer(c_int) :: CpotrfBatched_bufferSize
    end function hipsolverCpotrfBatched_bufferSize

    !---------------------------------------------
    ! hipsolverZpotrfBatched_bufferSize
    !---------------------------------------------
    function hipsolverZpotrfBatched_bufferSize(handle, uplo, n, A, lda, lwork, batch_count) &
       result(ZpotrfBatched_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZpotrfBatched_bufferSize")
#else
       bind(C, name="hipsolverZpotrfBatched_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int), value :: batch_count
       integer(c_int) :: ZpotrfBatched_bufferSize
    end function hipsolverZpotrfBatched_bufferSize

    !---------------------------------------------
    ! hipsolverSpotrfBatched
    !---------------------------------------------
    function hipsolverSpotrfBatched(handle, uplo, n, A, lda, work, lwork, devInfo, batch_count) &
       result(SpotrfBatched) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSpotrfBatched")
#else
       bind(C, name="hipsolverSpotrfBatched")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int), value :: batch_count
       integer(c_int) :: SpotrfBatched
    end function hipsolverSpotrfBatched

    !---------------------------------------------
    ! hipsolverDpotrfBatched
    !---------------------------------------------
    function hipsolverDpotrfBatched(handle, uplo, n, A, lda, work, lwork, devInfo, batch_count) &
       result(DpotrfBatched) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDpotrfBatched")
#else
       bind(C, name="hipsolverDpotrfBatched")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int), value :: batch_count
       integer(c_int) :: DpotrfBatched
    end function hipsolverDpotrfBatched

    !---------------------------------------------
    ! hipsolverCpotrfBatched
    !---------------------------------------------
    function hipsolverCpotrfBatched(handle, uplo, n, A, lda, work, lwork, devInfo, batch_count) &
       result(CpotrfBatched) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCpotrfBatched")
#else
       bind(C, name="hipsolverCpotrfBatched")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int), value :: batch_count
       integer(c_int) :: CpotrfBatched
    end function hipsolverCpotrfBatched

    !---------------------------------------------
    ! hipsolverZpotrfBatched
    !---------------------------------------------
    function hipsolverZpotrfBatched(handle, uplo, n, A, lda, work, lwork, devInfo, batch_count) &
       result(ZpotrfBatched) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZpotrfBatched")
#else
       bind(C, name="hipsolverZpotrfBatched")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int), value :: batch_count
       integer(c_int) :: ZpotrfBatched
    end function hipsolverZpotrfBatched

    !---------------------------------------------
    ! hipsolverSpotri_bufferSize
    !---------------------------------------------
    function hipsolverSpotri_bufferSize(handle, uplo, n, A, lda, lwork) &
       result(Spotri_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSpotri_bufferSize")
#else
       bind(C, name="hipsolverSpotri_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: Spotri_bufferSize
    end function hipsolverSpotri_bufferSize

    !---------------------------------------------
    ! hipsolverDpotri_bufferSize
    !---------------------------------------------
    function hipsolverDpotri_bufferSize(handle, uplo, n, A, lda, lwork) &
       result(Dpotri_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDpotri_bufferSize")
#else
       bind(C, name="hipsolverDpotri_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: Dpotri_bufferSize
    end function hipsolverDpotri_bufferSize

    !---------------------------------------------
    ! hipsolverCpotri_bufferSize
    !---------------------------------------------
    function hipsolverCpotri_bufferSize(handle, uplo, n, A, lda, lwork) &
       result(Cpotri_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCpotri_bufferSize")
#else
       bind(C, name="hipsolverCpotri_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: Cpotri_bufferSize
    end function hipsolverCpotri_bufferSize

    !---------------------------------------------
    ! hipsolverZpotri_bufferSize
    !---------------------------------------------
    function hipsolverZpotri_bufferSize(handle, uplo, n, A, lda, lwork) &
       result(Zpotri_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZpotri_bufferSize")
#else
       bind(C, name="hipsolverZpotri_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: Zpotri_bufferSize
    end function hipsolverZpotri_bufferSize

    !---------------------------------------------
    ! hipsolverSpotri
    !---------------------------------------------
    function hipsolverSpotri(handle, uplo, n, A, lda, work, lwork, devInfo) &
       result(Spotri) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSpotri")
#else
       bind(C, name="hipsolverSpotri")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Spotri
    end function hipsolverSpotri

    !---------------------------------------------
    ! hipsolverDpotri
    !---------------------------------------------
    function hipsolverDpotri(handle, uplo, n, A, lda, work, lwork, devInfo) &
       result(Dpotri) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDpotri")
#else
       bind(C, name="hipsolverDpotri")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Dpotri
    end function hipsolverDpotri

    !---------------------------------------------
    ! hipsolverCpotri
    !---------------------------------------------
    function hipsolverCpotri(handle, uplo, n, A, lda, work, lwork, devInfo) &
       result(Cpotri) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCpotri")
#else
       bind(C, name="hipsolverCpotri")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Cpotri
    end function hipsolverCpotri

    !---------------------------------------------
    ! hipsolverZpotri
    !---------------------------------------------
    function hipsolverZpotri(handle, uplo, n, A, lda, work, lwork, devInfo) &
       result(Zpotri) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZpotri")
#else
       bind(C, name="hipsolverZpotri")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Zpotri
    end function hipsolverZpotri

    !---------------------------------------------
    ! hipsolverSpotrs_bufferSize
    !---------------------------------------------
    function hipsolverSpotrs_bufferSize(handle, uplo, n, nrhs, A, lda, B, ldb, lwork) &
       result(Spotrs_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSpotrs_bufferSize")
#else
       bind(C, name="hipsolverSpotrs_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: B(*)
       integer(c_int), value :: ldb
       integer(c_int) :: lwork(*)
       integer(c_int) :: Spotrs_bufferSize
    end function hipsolverSpotrs_bufferSize

    !---------------------------------------------
    ! hipsolverDpotrs_bufferSize
    !---------------------------------------------
    function hipsolverDpotrs_bufferSize(handle, uplo, n, nrhs, A, lda, B, ldb, lwork) &
       result(Dpotrs_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDpotrs_bufferSize")
#else
       bind(C, name="hipsolverDpotrs_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: B(*)
       integer(c_int), value :: ldb
       integer(c_int) :: lwork(*)
       integer(c_int) :: Dpotrs_bufferSize
    end function hipsolverDpotrs_bufferSize

    !---------------------------------------------
    ! hipsolverCpotrs_bufferSize
    !---------------------------------------------
    function hipsolverCpotrs_bufferSize(handle, uplo, n, nrhs, A, lda, B, ldb, lwork) &
       result(Cpotrs_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCpotrs_bufferSize")
#else
       bind(C, name="hipsolverCpotrs_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       integer(c_int) :: lwork(*)
       integer(c_int) :: Cpotrs_bufferSize
    end function hipsolverCpotrs_bufferSize

    !---------------------------------------------
    ! hipsolverZpotrs_bufferSize
    !---------------------------------------------
    function hipsolverZpotrs_bufferSize(handle, uplo, n, nrhs, A, lda, B, ldb, lwork) &
       result(Zpotrs_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZpotrs_bufferSize")
#else
       bind(C, name="hipsolverZpotrs_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       integer(c_int) :: lwork(*)
       integer(c_int) :: Zpotrs_bufferSize
    end function hipsolverZpotrs_bufferSize

    !---------------------------------------------
    ! hipsolverSpotrs
    !---------------------------------------------
    function hipsolverSpotrs(handle, uplo, n, nrhs, A, lda, B, ldb, work, lwork, devInfo) &
       result(Spotrs) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSpotrs")
#else
       bind(C, name="hipsolverSpotrs")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: B(*)
       integer(c_int), value :: ldb
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Spotrs
    end function hipsolverSpotrs

    !---------------------------------------------
    ! hipsolverDpotrs
    !---------------------------------------------
    function hipsolverDpotrs(handle, uplo, n, nrhs, A, lda, B, ldb, work, lwork, devInfo) &
       result(Dpotrs) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDpotrs")
#else
       bind(C, name="hipsolverDpotrs")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: B(*)
       integer(c_int), value :: ldb
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Dpotrs
    end function hipsolverDpotrs

    !---------------------------------------------
    ! hipsolverCpotrs
    !---------------------------------------------
    function hipsolverCpotrs(handle, uplo, n, nrhs, A, lda, B, ldb, work, lwork, devInfo) &
       result(Cpotrs) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCpotrs")
#else
       bind(C, name="hipsolverCpotrs")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Cpotrs
    end function hipsolverCpotrs

    !---------------------------------------------
    ! hipsolverZpotrs
    !---------------------------------------------
    function hipsolverZpotrs(handle, uplo, n, nrhs, A, lda, B, ldb, work, lwork, devInfo) &
       result(Zpotrs) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZpotrs")
#else
       bind(C, name="hipsolverZpotrs")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Zpotrs
    end function hipsolverZpotrs

    !---------------------------------------------
    ! hipsolverSpotrsBatched_bufferSize
    !---------------------------------------------
    function hipsolverSpotrsBatched_bufferSize(handle, uplo, n, nrhs, A, lda, B, ldb, lwork, &
                                               batch_count) &
       result(SpotrsBatched_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSpotrsBatched_bufferSize")
#else
       bind(C, name="hipsolverSpotrsBatched_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       integer(c_int) :: lwork(*)
       integer(c_int), value :: batch_count
       integer(c_int) :: SpotrsBatched_bufferSize
    end function hipsolverSpotrsBatched_bufferSize

    !---------------------------------------------
    ! hipsolverDpotrsBatched_bufferSize
    !---------------------------------------------
    function hipsolverDpotrsBatched_bufferSize(handle, uplo, n, nrhs, A, lda, B, ldb, lwork, &
                                               batch_count) &
       result(DpotrsBatched_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDpotrsBatched_bufferSize")
#else
       bind(C, name="hipsolverDpotrsBatched_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       integer(c_int) :: lwork(*)
       integer(c_int), value :: batch_count
       integer(c_int) :: DpotrsBatched_bufferSize
    end function hipsolverDpotrsBatched_bufferSize

    !---------------------------------------------
    ! hipsolverCpotrsBatched_bufferSize
    !---------------------------------------------
    function hipsolverCpotrsBatched_bufferSize(handle, uplo, n, nrhs, A, lda, B, ldb, lwork, &
                                               batch_count) &
       result(CpotrsBatched_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCpotrsBatched_bufferSize")
#else
       bind(C, name="hipsolverCpotrsBatched_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       integer(c_int) :: lwork(*)
       integer(c_int), value :: batch_count
       integer(c_int) :: CpotrsBatched_bufferSize
    end function hipsolverCpotrsBatched_bufferSize

    !---------------------------------------------
    ! hipsolverZpotrsBatched_bufferSize
    !---------------------------------------------
    function hipsolverZpotrsBatched_bufferSize(handle, uplo, n, nrhs, A, lda, B, ldb, lwork, &
                                               batch_count) &
       result(ZpotrsBatched_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZpotrsBatched_bufferSize")
#else
       bind(C, name="hipsolverZpotrsBatched_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       integer(c_int) :: lwork(*)
       integer(c_int), value :: batch_count
       integer(c_int) :: ZpotrsBatched_bufferSize
    end function hipsolverZpotrsBatched_bufferSize

    !---------------------------------------------
    ! hipsolverSpotrsBatched
    !---------------------------------------------
    function hipsolverSpotrsBatched(handle, uplo, n, nrhs, A, lda, B, ldb, work, lwork, devInfo, &
                                    batch_count) &
       result(SpotrsBatched) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSpotrsBatched")
#else
       bind(C, name="hipsolverSpotrsBatched")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int), value :: batch_count
       integer(c_int) :: SpotrsBatched
    end function hipsolverSpotrsBatched

    !---------------------------------------------
    ! hipsolverDpotrsBatched
    !---------------------------------------------
    function hipsolverDpotrsBatched(handle, uplo, n, nrhs, A, lda, B, ldb, work, lwork, devInfo, &
                                    batch_count) &
       result(DpotrsBatched) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDpotrsBatched")
#else
       bind(C, name="hipsolverDpotrsBatched")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int), value :: batch_count
       integer(c_int) :: DpotrsBatched
    end function hipsolverDpotrsBatched

    !---------------------------------------------
    ! hipsolverCpotrsBatched
    !---------------------------------------------
    function hipsolverCpotrsBatched(handle, uplo, n, nrhs, A, lda, B, ldb, work, lwork, devInfo, &
                                    batch_count) &
       result(CpotrsBatched) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCpotrsBatched")
#else
       bind(C, name="hipsolverCpotrsBatched")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int), value :: batch_count
       integer(c_int) :: CpotrsBatched
    end function hipsolverCpotrsBatched

    !---------------------------------------------
    ! hipsolverZpotrsBatched
    !---------------------------------------------
    function hipsolverZpotrsBatched(handle, uplo, n, nrhs, A, lda, B, ldb, work, lwork, devInfo, &
                                    batch_count) &
       result(ZpotrsBatched) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZpotrsBatched")
#else
       bind(C, name="hipsolverZpotrsBatched")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int), value :: batch_count
       integer(c_int) :: ZpotrsBatched
    end function hipsolverZpotrsBatched

    !---------------------------------------------
    ! hipsolverSsyevd_bufferSize
    !---------------------------------------------
    function hipsolverSsyevd_bufferSize(handle, jobz, uplo, n, A, lda, D, lwork) &
       result(Ssyevd_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSsyevd_bufferSize")
#else
       bind(C, name="hipsolverSsyevd_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: D(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: Ssyevd_bufferSize
    end function hipsolverSsyevd_bufferSize

    !---------------------------------------------
    ! hipsolverDsyevd_bufferSize
    !---------------------------------------------
    function hipsolverDsyevd_bufferSize(handle, jobz, uplo, n, A, lda, D, lwork) &
       result(Dsyevd_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDsyevd_bufferSize")
#else
       bind(C, name="hipsolverDsyevd_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: D(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: Dsyevd_bufferSize
    end function hipsolverDsyevd_bufferSize

    !---------------------------------------------
    ! hipsolverCheevd_bufferSize
    !---------------------------------------------
    function hipsolverCheevd_bufferSize(handle, jobz, uplo, n, A, lda, D, lwork) &
       result(Cheevd_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCheevd_bufferSize")
#else
       bind(C, name="hipsolverCheevd_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float) :: D(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: Cheevd_bufferSize
    end function hipsolverCheevd_bufferSize

    !---------------------------------------------
    ! hipsolverZheevd_bufferSize
    !---------------------------------------------
    function hipsolverZheevd_bufferSize(handle, jobz, uplo, n, A, lda, D, lwork) &
       result(Zheevd_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZheevd_bufferSize")
#else
       bind(C, name="hipsolverZheevd_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double) :: D(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: Zheevd_bufferSize
    end function hipsolverZheevd_bufferSize

    !---------------------------------------------
    ! hipsolverSsyevd
    !---------------------------------------------
    function hipsolverSsyevd(handle, jobz, uplo, n, A, lda, D, work, lwork, devInfo) &
       result(Ssyevd) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSsyevd")
#else
       bind(C, name="hipsolverSsyevd")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: D(*)
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Ssyevd
    end function hipsolverSsyevd

    !---------------------------------------------
    ! hipsolverDsyevd
    !---------------------------------------------
    function hipsolverDsyevd(handle, jobz, uplo, n, A, lda, D, work, lwork, devInfo) &
       result(Dsyevd) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDsyevd")
#else
       bind(C, name="hipsolverDsyevd")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: D(*)
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Dsyevd
    end function hipsolverDsyevd

    !---------------------------------------------
    ! hipsolverCheevd
    !---------------------------------------------
    function hipsolverCheevd(handle, jobz, uplo, n, A, lda, D, work, lwork, devInfo) &
       result(Cheevd) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCheevd")
#else
       bind(C, name="hipsolverCheevd")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float) :: D(*)
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Cheevd
    end function hipsolverCheevd

    !---------------------------------------------
    ! hipsolverZheevd
    !---------------------------------------------
    function hipsolverZheevd(handle, jobz, uplo, n, A, lda, D, work, lwork, devInfo) &
       result(Zheevd) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZheevd")
#else
       bind(C, name="hipsolverZheevd")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double) :: D(*)
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Zheevd
    end function hipsolverZheevd

    !---------------------------------------------
    ! hipsolverSsyevdx_bufferSize
    !---------------------------------------------
    function hipsolverSsyevdx_bufferSize(handle, jobz, range, uplo, n, A, lda, vl, vu, il, iu, &
                                         nev, W, lwork) &
       result(Ssyevdx_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSsyevdx_bufferSize")
#else
       bind(C, name="hipsolverSsyevdx_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: range
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float), value :: vl
       real(c_float), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev(*)
       real(c_float) :: W(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: Ssyevdx_bufferSize
    end function hipsolverSsyevdx_bufferSize

    !---------------------------------------------
    ! hipsolverDsyevdx_bufferSize
    !---------------------------------------------
    function hipsolverDsyevdx_bufferSize(handle, jobz, range, uplo, n, A, lda, vl, vu, il, iu, &
                                         nev, W, lwork) &
       result(Dsyevdx_bufferSize) &
       bind(C, name="hipsolverDsyevdx_bufferSize")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: range
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double), value :: vl
       real(c_double), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev(*)
       real(c_double) :: W(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: Dsyevdx_bufferSize
    end function hipsolverDsyevdx_bufferSize

    !---------------------------------------------
    ! hipsolverCheevdx_bufferSize
    !---------------------------------------------
    function hipsolverCheevdx_bufferSize(handle, jobz, range, uplo, n, A, lda, vl, vu, il, iu, &
                                         nev, W, lwork) &
       result(Cheevdx_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCheevdx_bufferSize")
#else
       bind(C, name="hipsolverCheevdx_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: range
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float), value :: vl
       real(c_float), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev(*)
       real(c_float) :: W(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: Cheevdx_bufferSize
    end function hipsolverCheevdx_bufferSize

    !---------------------------------------------
    ! hipsolverZheevdx_bufferSize
    !---------------------------------------------
    function hipsolverZheevdx_bufferSize(handle, jobz, range, uplo, n, A, lda, vl, vu, il, iu, &
                                         nev, W, lwork) &
       result(Zheevdx_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZheevdx_bufferSize")
#else
       bind(C, name="hipsolverZheevdx_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: range
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double), value :: vl
       real(c_double), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev(*)
       real(c_double) :: W(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: Zheevdx_bufferSize
    end function hipsolverZheevdx_bufferSize

    !---------------------------------------------
    ! hipsolverSsyevdx
    !---------------------------------------------
    function hipsolverSsyevdx(handle, jobz, range, uplo, n, A, lda, vl, vu, il, iu, nev, W, work, &
                              lwork, devInfo) &
       result(Ssyevdx) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSsyevdx")
#else
       bind(C, name="hipsolverSsyevdx")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: range
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float), value :: vl
       real(c_float), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev(*)
       real(c_float) :: W(*)
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Ssyevdx
    end function hipsolverSsyevdx

    !---------------------------------------------
    ! hipsolverDsyevdx
    !---------------------------------------------
    function hipsolverDsyevdx(handle, jobz, range, uplo, n, A, lda, vl, vu, il, iu, nev, W, work, &
                              lwork, devInfo) &
       result(Dsyevdx) &
       bind(C, name="hipsolverDsyevdx")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: range
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double), value :: vl
       real(c_double), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev(*)
       real(c_double) :: W(*)
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Dsyevdx
    end function hipsolverDsyevdx

    !---------------------------------------------
    ! hipsolverCheevdx
    !---------------------------------------------
    function hipsolverCheevdx(handle, jobz, range, uplo, n, A, lda, vl, vu, il, iu, nev, W, work, &
                              lwork, devInfo) &
       result(Cheevdx) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCheevdx")
#else
       bind(C, name="hipsolverCheevdx")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: range
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float), value :: vl
       real(c_float), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev(*)
       real(c_float) :: W(*)
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Cheevdx
    end function hipsolverCheevdx

    !---------------------------------------------
    ! hipsolverZheevdx
    !---------------------------------------------
    function hipsolverZheevdx(handle, jobz, range, uplo, n, A, lda, vl, vu, il, iu, nev, W, work, &
                              lwork, devInfo) &
       result(Zheevdx) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZheevdx")
#else
       bind(C, name="hipsolverZheevdx")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: range
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double), value :: vl
       real(c_double), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev(*)
       real(c_double) :: W(*)
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Zheevdx
    end function hipsolverZheevdx

    !---------------------------------------------
    ! hipsolverSsyevj_bufferSize
    !---------------------------------------------
    function hipsolverSsyevj_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork, params) &
       result(Ssyevj_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSsyevj_bufferSize")
#else
       bind(C, name="hipsolverSsyevj_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: W(*)
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int) :: Ssyevj_bufferSize
    end function hipsolverSsyevj_bufferSize

    !---------------------------------------------
    ! hipsolverDsyevj_bufferSize
    !---------------------------------------------
    function hipsolverDsyevj_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork, params) &
       result(Dsyevj_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDsyevj_bufferSize")
#else
       bind(C, name="hipsolverDsyevj_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: W(*)
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int) :: Dsyevj_bufferSize
    end function hipsolverDsyevj_bufferSize

    !---------------------------------------------
    ! hipsolverCheevj_bufferSize
    !---------------------------------------------
    function hipsolverCheevj_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork, params) &
       result(Cheevj_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCheevj_bufferSize")
#else
       bind(C, name="hipsolverCheevj_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float) :: W(*)
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int) :: Cheevj_bufferSize
    end function hipsolverCheevj_bufferSize

    !---------------------------------------------
    ! hipsolverZheevj_bufferSize
    !---------------------------------------------
    function hipsolverZheevj_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork, params) &
       result(Zheevj_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZheevj_bufferSize")
#else
       bind(C, name="hipsolverZheevj_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double) :: W(*)
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int) :: Zheevj_bufferSize
    end function hipsolverZheevj_bufferSize

    !---------------------------------------------
    ! hipsolverSsyevj
    !---------------------------------------------
    function hipsolverSsyevj(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo, params) &
       result(Ssyevj) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSsyevj")
#else
       bind(C, name="hipsolverSsyevj")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: W(*)
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int) :: Ssyevj
    end function hipsolverSsyevj

    !---------------------------------------------
    ! hipsolverDsyevj
    !---------------------------------------------
    function hipsolverDsyevj(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo, params) &
       result(Dsyevj) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDsyevj")
#else
       bind(C, name="hipsolverDsyevj")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: W(*)
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int) :: Dsyevj
    end function hipsolverDsyevj

    !---------------------------------------------
    ! hipsolverCheevj
    !---------------------------------------------
    function hipsolverCheevj(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo, params) &
       result(Cheevj) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCheevj")
#else
       bind(C, name="hipsolverCheevj")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float) :: W(*)
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int) :: Cheevj
    end function hipsolverCheevj

    !---------------------------------------------
    ! hipsolverZheevj
    !---------------------------------------------
    function hipsolverZheevj(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo, params) &
       result(Zheevj) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZheevj")
#else
       bind(C, name="hipsolverZheevj")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double) :: W(*)
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int) :: Zheevj
    end function hipsolverZheevj

    !---------------------------------------------
    ! hipsolverSsyevjBatched_bufferSize
    !---------------------------------------------
    function hipsolverSsyevjBatched_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork, params, &
                                               batch_count) &
       result(SsyevjBatched_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSsyevjBatched_bufferSize")
#else
       bind(C, name="hipsolverSsyevjBatched_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: W(*)
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(c_int) :: SsyevjBatched_bufferSize
    end function hipsolverSsyevjBatched_bufferSize

    !---------------------------------------------
    ! hipsolverDsyevjBatched_bufferSize
    !---------------------------------------------
    function hipsolverDsyevjBatched_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork, params, &
                                               batch_count) &
       result(DsyevjBatched_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDsyevjBatched_bufferSize")
#else
       bind(C, name="hipsolverDsyevjBatched_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: W(*)
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(c_int) :: DsyevjBatched_bufferSize
    end function hipsolverDsyevjBatched_bufferSize

    !---------------------------------------------
    ! hipsolverCheevjBatched_bufferSize
    !---------------------------------------------
    function hipsolverCheevjBatched_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork, params, &
                                               batch_count) &
       result(CheevjBatched_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCheevjBatched_bufferSize")
#else
       bind(C, name="hipsolverCheevjBatched_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float) :: W(*)
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(c_int) :: CheevjBatched_bufferSize
    end function hipsolverCheevjBatched_bufferSize

    !---------------------------------------------
    ! hipsolverZheevjBatched_bufferSize
    !---------------------------------------------
    function hipsolverZheevjBatched_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork, params, &
                                               batch_count) &
       result(ZheevjBatched_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZheevjBatched_bufferSize")
#else
       bind(C, name="hipsolverZheevjBatched_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double) :: W(*)
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(c_int) :: ZheevjBatched_bufferSize
    end function hipsolverZheevjBatched_bufferSize

    !---------------------------------------------
    ! hipsolverSsyevjBatched
    !---------------------------------------------
    function hipsolverSsyevjBatched(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo, &
                                    params, batch_count) &
       result(SsyevjBatched) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSsyevjBatched")
#else
       bind(C, name="hipsolverSsyevjBatched")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: W(*)
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(c_int) :: SsyevjBatched
    end function hipsolverSsyevjBatched

    !---------------------------------------------
    ! hipsolverDsyevjBatched
    !---------------------------------------------
    function hipsolverDsyevjBatched(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo, &
                                    params, batch_count) &
       result(DsyevjBatched) &
       bind(C, name="hipsolverDsyevjBatched")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: W(*)
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(c_int) :: DsyevjBatched
    end function hipsolverDsyevjBatched

    !---------------------------------------------
    ! hipsolverCheevjBatched
    !---------------------------------------------
    function hipsolverCheevjBatched(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo, &
                                    params, batch_count) &
       result(CheevjBatched) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCheevjBatched")
#else
       bind(C, name="hipsolverCheevjBatched")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float) :: W(*)
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(c_int) :: CheevjBatched
    end function hipsolverCheevjBatched

    !---------------------------------------------
    ! hipsolverZheevjBatched
    !---------------------------------------------
    function hipsolverZheevjBatched(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo, &
                                    params, batch_count) &
       result(ZheevjBatched) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZheevjBatched")
#else
       bind(C, name="hipsolverZheevjBatched")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double) :: W(*)
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(c_int) :: ZheevjBatched
    end function hipsolverZheevjBatched

    !---------------------------------------------
    ! hipsolverSsygvd_bufferSize
    !---------------------------------------------
    function hipsolverSsygvd_bufferSize(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, lwork) &
       result(Ssygvd_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSsygvd_bufferSize")
#else
       bind(C, name="hipsolverSsygvd_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: B(*)
       integer(c_int), value :: ldb
       real(c_float) :: W(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: Ssygvd_bufferSize
    end function hipsolverSsygvd_bufferSize

    !---------------------------------------------
    ! hipsolverDsygvd_bufferSize
    !---------------------------------------------
    function hipsolverDsygvd_bufferSize(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, lwork) &
       result(Dsygvd_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDsygvd_bufferSize")
#else
       bind(C, name="hipsolverDsygvd_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: B(*)
       integer(c_int), value :: ldb
       real(c_double) :: W(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: Dsygvd_bufferSize
    end function hipsolverDsygvd_bufferSize

    !---------------------------------------------
    ! hipsolverChegvd_bufferSize
    !---------------------------------------------
    function hipsolverChegvd_bufferSize(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, lwork) &
       result(Chegvd_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverChegvd_bufferSize")
#else
       bind(C, name="hipsolverChegvd_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_float) :: W(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: Chegvd_bufferSize
    end function hipsolverChegvd_bufferSize

    !---------------------------------------------
    ! hipsolverZhegvd_bufferSize
    !---------------------------------------------
    function hipsolverZhegvd_bufferSize(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, lwork) &
       result(Zhegvd_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZhegvd_bufferSize")
#else
       bind(C, name="hipsolverZhegvd_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_double) :: W(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: Zhegvd_bufferSize
    end function hipsolverZhegvd_bufferSize

    !---------------------------------------------
    ! hipsolverSsygvd
    !---------------------------------------------
    function hipsolverSsygvd(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, work, lwork, &
                             devInfo) &
       result(Ssygvd) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSsygvd")
#else
       bind(C, name="hipsolverSsygvd")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: B(*)
       integer(c_int), value :: ldb
       real(c_float) :: W(*)
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Ssygvd
    end function hipsolverSsygvd

    !---------------------------------------------
    ! hipsolverDsygvd
    !---------------------------------------------
    function hipsolverDsygvd(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, work, lwork, &
                             devInfo) &
       result(Dsygvd) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDsygvd")
#else
       bind(C, name="hipsolverDsygvd")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: B(*)
       integer(c_int), value :: ldb
       real(c_double) :: W(*)
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Dsygvd
    end function hipsolverDsygvd

    !---------------------------------------------
    ! hipsolverChegvd
    !---------------------------------------------
    function hipsolverChegvd(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, work, lwork, &
                             devInfo) &
       result(Chegvd) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverChegvd")
#else
       bind(C, name="hipsolverChegvd")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_float) :: W(*)
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Chegvd
    end function hipsolverChegvd

    !---------------------------------------------
    ! hipsolverZhegvd
    !---------------------------------------------
    function hipsolverZhegvd(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, work, lwork, &
                             devInfo) &
       result(Zhegvd) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZhegvd")
#else
       bind(C, name="hipsolverZhegvd")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_double) :: W(*)
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Zhegvd
    end function hipsolverZhegvd

    !---------------------------------------------
    ! hipsolverSsygvdx_bufferSize
    !---------------------------------------------
    function hipsolverSsygvdx_bufferSize(handle, itype, jobz, range, uplo, n, A, lda, B, ldb, vl, &
                                         vu, il, iu, nev, W, lwork) &
       result(Ssygvdx_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSsygvdx_bufferSize")
#else
       bind(C, name="hipsolverSsygvdx_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: range
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: B(*)
       integer(c_int), value :: ldb
       real(c_float), value :: vl
       real(c_float), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev(*)
       real(c_float) :: W(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: Ssygvdx_bufferSize
    end function hipsolverSsygvdx_bufferSize

    !---------------------------------------------
    ! hipsolverDsygvdx_bufferSize
    !---------------------------------------------
    function hipsolverDsygvdx_bufferSize(handle, itype, jobz, range, uplo, n, A, lda, B, ldb, vl, &
                                         vu, il, iu, nev, W, lwork) &
       result(Dsygvdx_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDsygvdx_bufferSize")
#else
       bind(C, name="hipsolverDsygvdx_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: range
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: B(*)
       integer(c_int), value :: ldb
       real(c_double), value :: vl
       real(c_double), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev(*)
       real(c_double) :: W(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: Dsygvdx_bufferSize
    end function hipsolverDsygvdx_bufferSize

    !---------------------------------------------
    ! hipsolverChegvdx_bufferSize
    !---------------------------------------------
    function hipsolverChegvdx_bufferSize(handle, itype, jobz, range, uplo, n, A, lda, B, ldb, vl, &
                                         vu, il, iu, nev, W, lwork) &
       result(Chegvdx_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverChegvdx_bufferSize")
#else
       bind(C, name="hipsolverChegvdx_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: range
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_float), value :: vl
       real(c_float), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev(*)
       real(c_float) :: W(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: Chegvdx_bufferSize
    end function hipsolverChegvdx_bufferSize

    !---------------------------------------------
    ! hipsolverZhegvdx_bufferSize
    !---------------------------------------------
    function hipsolverZhegvdx_bufferSize(handle, itype, jobz, range, uplo, n, A, lda, B, ldb, vl, &
                                         vu, il, iu, nev, W, lwork) &
       result(Zhegvdx_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZhegvdx_bufferSize")
#else
       bind(C, name="hipsolverZhegvdx_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: range
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_double), value :: vl
       real(c_double), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev(*)
       real(c_double) :: W(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: Zhegvdx_bufferSize
    end function hipsolverZhegvdx_bufferSize

    !---------------------------------------------
    ! hipsolverSsygvdx
    !---------------------------------------------
    function hipsolverSsygvdx(handle, itype, jobz, range, uplo, n, A, lda, B, ldb, vl, vu, il, iu, &
                              nev, W, work, lwork, devInfo) &
       result(Ssygvdx) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSsygvdx")
#else
       bind(C, name="hipsolverSsygvdx")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: range
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: B(*)
       integer(c_int), value :: ldb
       real(c_float), value :: vl
       real(c_float), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev(*)
       real(c_float) :: W(*)
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Ssygvdx
    end function hipsolverSsygvdx

    !---------------------------------------------
    ! hipsolverDsygvdx
    !---------------------------------------------
    function hipsolverDsygvdx(handle, itype, jobz, range, uplo, n, A, lda, B, ldb, vl, vu, il, iu, &
                              nev, W, work, lwork, devInfo) &
       result(Dsygvdx) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDsygvdx")
#else
       bind(C, name="hipsolverDsygvdx")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: range
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: B(*)
       integer(c_int), value :: ldb
       real(c_double), value :: vl
       real(c_double), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev(*)
       real(c_double) :: W(*)
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Dsygvdx
    end function hipsolverDsygvdx

    !---------------------------------------------
    ! hipsolverChegvdx
    !---------------------------------------------
    function hipsolverChegvdx(handle, itype, jobz, range, uplo, n, A, lda, B, ldb, vl, vu, il, iu, &
                              nev, W, work, lwork, devInfo) &
       result(Chegvdx) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverChegvdx")
#else
       bind(C, name="hipsolverChegvdx")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: range
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_float), value :: vl
       real(c_float), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev(*)
       real(c_float) :: W(*)
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Chegvdx
    end function hipsolverChegvdx

    !---------------------------------------------
    ! hipsolverZhegvdx
    !---------------------------------------------
    function hipsolverZhegvdx(handle, itype, jobz, range, uplo, n, A, lda, B, ldb, vl, vu, il, iu, &
                              nev, W, work, lwork, devInfo) &
       result(Zhegvdx) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZhegvdx")
#else
       bind(C, name="hipsolverZhegvdx")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: range
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_double), value :: vl
       real(c_double), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev(*)
       real(c_double) :: W(*)
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Zhegvdx
    end function hipsolverZhegvdx

    !---------------------------------------------
    ! hipsolverSsygvj_bufferSize
    !---------------------------------------------
    function hipsolverSsygvj_bufferSize(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, lwork, &
                                        params) &
       result(Ssygvj_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSsygvj_bufferSize")
#else
       bind(C, name="hipsolverSsygvj_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: B(*)
       integer(c_int), value :: ldb
       real(c_float) :: W(*)
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int) :: Ssygvj_bufferSize
    end function hipsolverSsygvj_bufferSize

    !---------------------------------------------
    ! hipsolverDsygvj_bufferSize
    !---------------------------------------------
    function hipsolverDsygvj_bufferSize(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, lwork, &
                                        params) &
       result(Dsygvj_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDsygvj_bufferSize")
#else
       bind(C, name="hipsolverDsygvj_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: B(*)
       integer(c_int), value :: ldb
       real(c_double) :: W(*)
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int) :: Dsygvj_bufferSize
    end function hipsolverDsygvj_bufferSize

    !---------------------------------------------
    ! hipsolverChegvj_bufferSize
    !---------------------------------------------
    function hipsolverChegvj_bufferSize(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, lwork, &
                                        params) &
       result(Chegvj_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverChegvj_bufferSize")
#else
       bind(C, name="hipsolverChegvj_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_float) :: W(*)
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int) :: Chegvj_bufferSize
    end function hipsolverChegvj_bufferSize

    !---------------------------------------------
    ! hipsolverZhegvj_bufferSize
    !---------------------------------------------
    function hipsolverZhegvj_bufferSize(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, lwork, &
                                        params) &
       result(Zhegvj_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZhegvj_bufferSize")
#else
       bind(C, name="hipsolverZhegvj_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_double) :: W(*)
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int) :: Zhegvj_bufferSize
    end function hipsolverZhegvj_bufferSize

    !---------------------------------------------
    ! hipsolverSsygvj
    !---------------------------------------------
    function hipsolverSsygvj(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, work, lwork, &
                             devInfo, params) &
       result(Ssygvj) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSsygvj")
#else
       bind(C, name="hipsolverSsygvj")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: B(*)
       integer(c_int), value :: ldb
       real(c_float) :: W(*)
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int) :: Ssygvj
    end function hipsolverSsygvj

    !---------------------------------------------
    ! hipsolverDsygvj
    !---------------------------------------------
    function hipsolverDsygvj(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, work, lwork, &
                             devInfo, params) &
       result(Dsygvj) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDsygvj")
#else
       bind(C, name="hipsolverDsygvj")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: B(*)
       integer(c_int), value :: ldb
       real(c_double) :: W(*)
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int) :: Dsygvj
    end function hipsolverDsygvj

    !---------------------------------------------
    ! hipsolverChegvj
    !---------------------------------------------
    function hipsolverChegvj(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, work, lwork, &
                             devInfo, params) &
       result(Chegvj) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverChegvj")
#else
       bind(C, name="hipsolverChegvj")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_float) :: W(*)
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int) :: Chegvj
    end function hipsolverChegvj

    !---------------------------------------------
    ! hipsolverZhegvj
    !---------------------------------------------
    function hipsolverZhegvj(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, work, lwork, &
                             devInfo, params) &
       result(Zhegvj) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZhegvj")
#else
       bind(C, name="hipsolverZhegvj")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_double) :: W(*)
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int) :: Zhegvj
    end function hipsolverZhegvj

    !---------------------------------------------
    ! hipsolverSsytrd_bufferSize
    !---------------------------------------------
    function hipsolverSsytrd_bufferSize(handle, uplo, n, A, lda, D, E, tau, lwork) &
       result(Ssytrd_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSsytrd_bufferSize")
#else
       bind(C, name="hipsolverSsytrd_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: D(*)
       real(c_float) :: E(*)
       real(c_float) :: tau(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: Ssytrd_bufferSize
    end function hipsolverSsytrd_bufferSize

    !---------------------------------------------
    ! hipsolverDsytrd_bufferSize
    !---------------------------------------------
    function hipsolverDsytrd_bufferSize(handle, uplo, n, A, lda, D, E, tau, lwork) &
       result(Dsytrd_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDsytrd_bufferSize")
#else
       bind(C, name="hipsolverDsytrd_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: D(*)
       real(c_double) :: E(*)
       real(c_double) :: tau(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: Dsytrd_bufferSize
    end function hipsolverDsytrd_bufferSize

    !---------------------------------------------
    ! hipsolverChetrd_bufferSize
    !---------------------------------------------
    function hipsolverChetrd_bufferSize(handle, uplo, n, A, lda, D, E, tau, lwork) &
       result(Chetrd_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverChetrd_bufferSize")
#else
       bind(C, name="hipsolverChetrd_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float) :: D(*)
       real(c_float) :: E(*)
       type(c_ptr), value :: tau
       integer(c_int) :: lwork(*)
       integer(c_int) :: Chetrd_bufferSize
    end function hipsolverChetrd_bufferSize

    !---------------------------------------------
    ! hipsolverZhetrd_bufferSize
    !---------------------------------------------
    function hipsolverZhetrd_bufferSize(handle, uplo, n, A, lda, D, E, tau, lwork) &
       result(Zhetrd_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZhetrd_bufferSize")
#else
       bind(C, name="hipsolverZhetrd_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double) :: D(*)
       real(c_double) :: E(*)
       type(c_ptr), value :: tau
       integer(c_int) :: lwork(*)
       integer(c_int) :: Zhetrd_bufferSize
    end function hipsolverZhetrd_bufferSize

    !---------------------------------------------
    ! hipsolverSsytrd
    !---------------------------------------------
    function hipsolverSsytrd(handle, uplo, n, A, lda, D, E, tau, work, lwork, devInfo) &
       result(Ssytrd) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSsytrd")
#else
       bind(C, name="hipsolverSsytrd")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: D(*)
       real(c_float) :: E(*)
       real(c_float) :: tau(*)
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Ssytrd
    end function hipsolverSsytrd

    !---------------------------------------------
    ! hipsolverDsytrd
    !---------------------------------------------
    function hipsolverDsytrd(handle, uplo, n, A, lda, D, E, tau, work, lwork, devInfo) &
       result(Dsytrd) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDsytrd")
#else
       bind(C, name="hipsolverDsytrd")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: D(*)
       real(c_double) :: E(*)
       real(c_double) :: tau(*)
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Dsytrd
    end function hipsolverDsytrd

    !---------------------------------------------
    ! hipsolverChetrd
    !---------------------------------------------
    function hipsolverChetrd(handle, uplo, n, A, lda, D, E, tau, work, lwork, devInfo) &
       result(Chetrd) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverChetrd")
#else
       bind(C, name="hipsolverChetrd")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float) :: D(*)
       real(c_float) :: E(*)
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Chetrd
    end function hipsolverChetrd

    !---------------------------------------------
    ! hipsolverZhetrd
    !---------------------------------------------
    function hipsolverZhetrd(handle, uplo, n, A, lda, D, E, tau, work, lwork, devInfo) &
       result(Zhetrd) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZhetrd")
#else
       bind(C, name="hipsolverZhetrd")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double) :: D(*)
       real(c_double) :: E(*)
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Zhetrd
    end function hipsolverZhetrd

    !---------------------------------------------
    ! hipsolverSsytrf_bufferSize
    !---------------------------------------------
    function hipsolverSsytrf_bufferSize(handle, n, A, lda, lwork) &
       result(Ssytrf_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSsytrf_bufferSize")
#else
       bind(C, name="hipsolverSsytrf_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: Ssytrf_bufferSize
    end function hipsolverSsytrf_bufferSize

    !---------------------------------------------
    ! hipsolverDsytrf_bufferSize
    !---------------------------------------------
    function hipsolverDsytrf_bufferSize(handle, n, A, lda, lwork) &
       result(Dsytrf_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDsytrf_bufferSize")
#else
       bind(C, name="hipsolverDsytrf_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: Dsytrf_bufferSize
    end function hipsolverDsytrf_bufferSize

    !---------------------------------------------
    ! hipsolverCsytrf_bufferSize
    !---------------------------------------------
    function hipsolverCsytrf_bufferSize(handle, n, A, lda, lwork) &
       result(Csytrf_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCsytrf_bufferSize")
#else
       bind(C, name="hipsolverCsytrf_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: Csytrf_bufferSize
    end function hipsolverCsytrf_bufferSize

    !---------------------------------------------
    ! hipsolverZsytrf_bufferSize
    !---------------------------------------------
    function hipsolverZsytrf_bufferSize(handle, n, A, lda, lwork) &
       result(Zsytrf_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZsytrf_bufferSize")
#else
       bind(C, name="hipsolverZsytrf_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: Zsytrf_bufferSize
    end function hipsolverZsytrf_bufferSize

    !---------------------------------------------
    ! hipsolverSsytrf
    !---------------------------------------------
    function hipsolverSsytrf(handle, uplo, n, A, lda, ipiv, work, lwork, devInfo) &
       result(Ssytrf) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSsytrf")
#else
       bind(C, name="hipsolverSsytrf")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: ipiv(*)
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Ssytrf
    end function hipsolverSsytrf

    !---------------------------------------------
    ! hipsolverDsytrf
    !---------------------------------------------
    function hipsolverDsytrf(handle, uplo, n, A, lda, ipiv, work, lwork, devInfo) &
       result(Dsytrf) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDsytrf")
#else
       bind(C, name="hipsolverDsytrf")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: ipiv(*)
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Dsytrf
    end function hipsolverDsytrf

    !---------------------------------------------
    ! hipsolverCsytrf
    !---------------------------------------------
    function hipsolverCsytrf(handle, uplo, n, A, lda, ipiv, work, lwork, devInfo) &
       result(Csytrf) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverCsytrf")
#else
       bind(C, name="hipsolverCsytrf")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: ipiv(*)
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Csytrf
    end function hipsolverCsytrf

    !---------------------------------------------
    ! hipsolverZsytrf
    !---------------------------------------------
    function hipsolverZsytrf(handle, uplo, n, A, lda, ipiv, work, lwork, devInfo) &
       result(Zsytrf) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverZsytrf")
#else
       bind(C, name="hipsolverZsytrf")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: ipiv(*)
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: Zsytrf
    end function hipsolverZsytrf

    !---------------------------------------------
    ! hipsolverDnCreate
    !---------------------------------------------
    !> \brief An alias for `hipsolverCreate`.
    function hipsolverDnCreate(handle) &
       result(DnCreate) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDnCreate")
#else
       bind(C, name="hipsolverDnCreate")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: handle
       integer(c_int) :: DnCreate
    end function hipsolverDnCreate

    !---------------------------------------------
    ! hipsolverDnDestroy
    !---------------------------------------------
    !> \brief An alias for `hipsolverDestroy`.
    function hipsolverDnDestroy(handle) &
       result(DnDestroy) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDnDestroy")
#else
       bind(C, name="hipsolverDnDestroy")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int) :: DnDestroy
    end function hipsolverDnDestroy

    !---------------------------------------------
    ! hipsolverDnSetStream
    !---------------------------------------------
    !> \brief An alias for `hipsolverSetStream`.
    function hipsolverDnSetStream(handle, streamId) &
       result(DnSetStream) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDnSetStream")
#else
       bind(C, name="hipsolverDnSetStream")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: streamId
       integer(c_int) :: DnSetStream
    end function hipsolverDnSetStream

    !---------------------------------------------
    ! hipsolverDnGetStream
    !---------------------------------------------
    !> \brief An alias for `hipsolverGetStream`.
    function hipsolverDnGetStream(handle, streamId) &
       result(DnGetStream) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDnGetStream")
#else
       bind(C, name="hipsolverDnGetStream")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       type(c_ptr) :: streamId
       integer(c_int) :: DnGetStream
    end function hipsolverDnGetStream

    !---------------------------------------------
    ! hipsolverDnSetDeterministicMode
    !---------------------------------------------
    !> \brief An alias for `hipsolverSetDeterministicMode`.
    function hipsolverDnSetDeterministicMode(handle, mode) &
       result(DnSetDeterministicMode) &
       bind(C, name="hipsolverDnSetDeterministicMode")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: mode
       integer(c_int) :: DnSetDeterministicMode
    end function hipsolverDnSetDeterministicMode

    !---------------------------------------------
    ! hipsolverDnGetDeterministicMode
    !---------------------------------------------
    !> \brief An alias for `hipsolverGetDeterministicMode`.
    function hipsolverDnGetDeterministicMode(handle, mode) &
       result(DnGetDeterministicMode) &
       bind(C, name="hipsolverDnGetDeterministicMode")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int) :: mode(*)
       integer(c_int) :: DnGetDeterministicMode
    end function hipsolverDnGetDeterministicMode

    !---------------------------------------------
    ! hipsolverDnCreateGesvdjInfo
    !---------------------------------------------
    function hipsolverDnCreateGesvdjInfo(info) &
       result(DnCreateGesvdjInfo) &
       bind(C, name="hipsolverDnCreateGesvdjInfo")
       import :: c_ptr, c_int
       type(c_ptr) :: info
       integer(c_int) :: DnCreateGesvdjInfo
    end function hipsolverDnCreateGesvdjInfo

    !---------------------------------------------
    ! hipsolverDnDestroyGesvdjInfo
    !---------------------------------------------
    function hipsolverDnDestroyGesvdjInfo(info) &
       result(DnDestroyGesvdjInfo) &
       bind(C, name="hipsolverDnDestroyGesvdjInfo")
       import :: c_ptr, c_int
       type(c_ptr), value :: info
       integer(c_int) :: DnDestroyGesvdjInfo
    end function hipsolverDnDestroyGesvdjInfo

    !---------------------------------------------
    ! hipsolverDnXgesvdjSetMaxSweeps
    !---------------------------------------------
    function hipsolverDnXgesvdjSetMaxSweeps(info, max_sweeps) &
       result(DnXgesvdjSetMaxSweeps) &
       bind(C, name="hipsolverDnXgesvdjSetMaxSweeps")
       import :: c_ptr, c_int
       type(c_ptr), value :: info
       integer(c_int), value :: max_sweeps
       integer(c_int) :: DnXgesvdjSetMaxSweeps
    end function hipsolverDnXgesvdjSetMaxSweeps

    !---------------------------------------------
    ! hipsolverDnXgesvdjSetSortEig
    !---------------------------------------------
    function hipsolverDnXgesvdjSetSortEig(info, sort_eig) &
       result(DnXgesvdjSetSortEig) &
       bind(C, name="hipsolverDnXgesvdjSetSortEig")
       import :: c_ptr, c_int
       type(c_ptr), value :: info
       integer(c_int), value :: sort_eig
       integer(c_int) :: DnXgesvdjSetSortEig
    end function hipsolverDnXgesvdjSetSortEig

    !---------------------------------------------
    ! hipsolverDnXgesvdjSetTolerance
    !---------------------------------------------
    function hipsolverDnXgesvdjSetTolerance(info, tolerance) &
       result(DnXgesvdjSetTolerance) &
       bind(C, name="hipsolverDnXgesvdjSetTolerance")
       import :: c_ptr, c_double, c_int
       type(c_ptr), value :: info
       real(c_double), value :: tolerance
       integer(c_int) :: DnXgesvdjSetTolerance
    end function hipsolverDnXgesvdjSetTolerance

    !---------------------------------------------
    ! hipsolverDnXgesvdjGetResidual
    !---------------------------------------------
    function hipsolverDnXgesvdjGetResidual(handle, info, residual) &
       result(DnXgesvdjGetResidual) &
       bind(C, name="hipsolverDnXgesvdjGetResidual")
       import :: c_ptr, c_double, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: info
       real(c_double) :: residual(*)
       integer(c_int) :: DnXgesvdjGetResidual
    end function hipsolverDnXgesvdjGetResidual

    !---------------------------------------------
    ! hipsolverDnXgesvdjGetSweeps
    !---------------------------------------------
    function hipsolverDnXgesvdjGetSweeps(handle, info, executed_sweeps) &
       result(DnXgesvdjGetSweeps) &
       bind(C, name="hipsolverDnXgesvdjGetSweeps")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: info
       integer(c_int) :: executed_sweeps(*)
       integer(c_int) :: DnXgesvdjGetSweeps
    end function hipsolverDnXgesvdjGetSweeps

    !---------------------------------------------
    ! hipsolverDnCreateSyevjInfo
    !---------------------------------------------
    function hipsolverDnCreateSyevjInfo(info) &
       result(DnCreateSyevjInfo) &
       bind(C, name="hipsolverDnCreateSyevjInfo")
       import :: c_ptr, c_int
       type(c_ptr) :: info
       integer(c_int) :: DnCreateSyevjInfo
    end function hipsolverDnCreateSyevjInfo

    !---------------------------------------------
    ! hipsolverDnDestroySyevjInfo
    !---------------------------------------------
    function hipsolverDnDestroySyevjInfo(info) &
       result(DnDestroySyevjInfo) &
       bind(C, name="hipsolverDnDestroySyevjInfo")
       import :: c_ptr, c_int
       type(c_ptr), value :: info
       integer(c_int) :: DnDestroySyevjInfo
    end function hipsolverDnDestroySyevjInfo

    !---------------------------------------------
    ! hipsolverDnXsyevjSetMaxSweeps
    !---------------------------------------------
    function hipsolverDnXsyevjSetMaxSweeps(info, max_sweeps) &
       result(DnXsyevjSetMaxSweeps) &
       bind(C, name="hipsolverDnXsyevjSetMaxSweeps")
       import :: c_ptr, c_int
       type(c_ptr), value :: info
       integer(c_int), value :: max_sweeps
       integer(c_int) :: DnXsyevjSetMaxSweeps
    end function hipsolverDnXsyevjSetMaxSweeps

    !---------------------------------------------
    ! hipsolverDnXsyevjSetSortEig
    !---------------------------------------------
    function hipsolverDnXsyevjSetSortEig(info, sort_eig) &
       result(DnXsyevjSetSortEig) &
       bind(C, name="hipsolverDnXsyevjSetSortEig")
       import :: c_ptr, c_int
       type(c_ptr), value :: info
       integer(c_int), value :: sort_eig
       integer(c_int) :: DnXsyevjSetSortEig
    end function hipsolverDnXsyevjSetSortEig

    !---------------------------------------------
    ! hipsolverDnXsyevjSetTolerance
    !---------------------------------------------
    function hipsolverDnXsyevjSetTolerance(info, tolerance) &
       result(DnXsyevjSetTolerance) &
       bind(C, name="hipsolverDnXsyevjSetTolerance")
       import :: c_ptr, c_double, c_int
       type(c_ptr), value :: info
       real(c_double), value :: tolerance
       integer(c_int) :: DnXsyevjSetTolerance
    end function hipsolverDnXsyevjSetTolerance

    !---------------------------------------------
    ! hipsolverDnXsyevjGetResidual
    !---------------------------------------------
    function hipsolverDnXsyevjGetResidual(handle, info, residual) &
       result(DnXsyevjGetResidual) &
       bind(C, name="hipsolverDnXsyevjGetResidual")
       import :: c_ptr, c_double, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: info
       real(c_double) :: residual(*)
       integer(c_int) :: DnXsyevjGetResidual
    end function hipsolverDnXsyevjGetResidual

    !---------------------------------------------
    ! hipsolverDnXsyevjGetSweeps
    !---------------------------------------------
    function hipsolverDnXsyevjGetSweeps(handle, info, executed_sweeps) &
       result(DnXsyevjGetSweeps) &
       bind(C, name="hipsolverDnXsyevjGetSweeps")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: info
       integer(c_int) :: executed_sweeps(*)
       integer(c_int) :: DnXsyevjGetSweeps
    end function hipsolverDnXsyevjGetSweeps

    !---------------------------------------------
    ! hipsolverDnSorgbr_bufferSize
    !---------------------------------------------
    function hipsolverDnSorgbr_bufferSize(handle, side, m, n, k, A, lda, tau, lwork) &
       result(DnSorgbr_bufferSize) &
       bind(C, name="hipsolverDnSorgbr_bufferSize")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: tau(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnSorgbr_bufferSize
    end function hipsolverDnSorgbr_bufferSize

    !---------------------------------------------
    ! hipsolverDnDorgbr_bufferSize
    !---------------------------------------------
    function hipsolverDnDorgbr_bufferSize(handle, side, m, n, k, A, lda, tau, lwork) &
       result(DnDorgbr_bufferSize) &
       bind(C, name="hipsolverDnDorgbr_bufferSize")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: tau(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnDorgbr_bufferSize
    end function hipsolverDnDorgbr_bufferSize

    !---------------------------------------------
    ! hipsolverDnCungbr_bufferSize
    !---------------------------------------------
    function hipsolverDnCungbr_bufferSize(handle, side, m, n, k, A, lda, tau, lwork) &
       result(DnCungbr_bufferSize) &
       bind(C, name="hipsolverDnCungbr_bufferSize")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnCungbr_bufferSize
    end function hipsolverDnCungbr_bufferSize

    !---------------------------------------------
    ! hipsolverDnZungbr_bufferSize
    !---------------------------------------------
    function hipsolverDnZungbr_bufferSize(handle, side, m, n, k, A, lda, tau, lwork) &
       result(DnZungbr_bufferSize) &
       bind(C, name="hipsolverDnZungbr_bufferSize")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnZungbr_bufferSize
    end function hipsolverDnZungbr_bufferSize

    !---------------------------------------------
    ! hipsolverDnSorgbr
    !---------------------------------------------
    function hipsolverDnSorgbr(handle, side, m, n, k, A, lda, tau, work, lwork, devInfo) &
       result(DnSorgbr) &
       bind(C, name="hipsolverDnSorgbr")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: tau(*)
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnSorgbr
    end function hipsolverDnSorgbr

    !---------------------------------------------
    ! hipsolverDnDorgbr
    !---------------------------------------------
    function hipsolverDnDorgbr(handle, side, m, n, k, A, lda, tau, work, lwork, devInfo) &
       result(DnDorgbr) &
       bind(C, name="hipsolverDnDorgbr")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: tau(*)
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnDorgbr
    end function hipsolverDnDorgbr

    !---------------------------------------------
    ! hipsolverDnCungbr
    !---------------------------------------------
    function hipsolverDnCungbr(handle, side, m, n, k, A, lda, tau, work, lwork, devInfo) &
       result(DnCungbr) &
       bind(C, name="hipsolverDnCungbr")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnCungbr
    end function hipsolverDnCungbr

    !---------------------------------------------
    ! hipsolverDnZungbr
    !---------------------------------------------
    function hipsolverDnZungbr(handle, side, m, n, k, A, lda, tau, work, lwork, devInfo) &
       result(DnZungbr) &
       bind(C, name="hipsolverDnZungbr")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnZungbr
    end function hipsolverDnZungbr

    !---------------------------------------------
    ! hipsolverDnSorgqr_bufferSize
    !---------------------------------------------
    function hipsolverDnSorgqr_bufferSize(handle, m, n, k, A, lda, tau, lwork) &
       result(DnSorgqr_bufferSize) &
       bind(C, name="hipsolverDnSorgqr_bufferSize")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: tau(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnSorgqr_bufferSize
    end function hipsolverDnSorgqr_bufferSize

    !---------------------------------------------
    ! hipsolverDnDorgqr_bufferSize
    !---------------------------------------------
    function hipsolverDnDorgqr_bufferSize(handle, m, n, k, A, lda, tau, lwork) &
       result(DnDorgqr_bufferSize) &
       bind(C, name="hipsolverDnDorgqr_bufferSize")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: tau(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnDorgqr_bufferSize
    end function hipsolverDnDorgqr_bufferSize

    !---------------------------------------------
    ! hipsolverDnCungqr_bufferSize
    !---------------------------------------------
    function hipsolverDnCungqr_bufferSize(handle, m, n, k, A, lda, tau, lwork) &
       result(DnCungqr_bufferSize) &
       bind(C, name="hipsolverDnCungqr_bufferSize")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnCungqr_bufferSize
    end function hipsolverDnCungqr_bufferSize

    !---------------------------------------------
    ! hipsolverDnZungqr_bufferSize
    !---------------------------------------------
    function hipsolverDnZungqr_bufferSize(handle, m, n, k, A, lda, tau, lwork) &
       result(DnZungqr_bufferSize) &
       bind(C, name="hipsolverDnZungqr_bufferSize")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnZungqr_bufferSize
    end function hipsolverDnZungqr_bufferSize

    !---------------------------------------------
    ! hipsolverDnSorgqr
    !---------------------------------------------
    function hipsolverDnSorgqr(handle, m, n, k, A, lda, tau, work, lwork, devInfo) &
       result(DnSorgqr) &
       bind(C, name="hipsolverDnSorgqr")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: tau(*)
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnSorgqr
    end function hipsolverDnSorgqr

    !---------------------------------------------
    ! hipsolverDnDorgqr
    !---------------------------------------------
    function hipsolverDnDorgqr(handle, m, n, k, A, lda, tau, work, lwork, devInfo) &
       result(DnDorgqr) &
       bind(C, name="hipsolverDnDorgqr")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: tau(*)
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnDorgqr
    end function hipsolverDnDorgqr

    !---------------------------------------------
    ! hipsolverDnCungqr
    !---------------------------------------------
    function hipsolverDnCungqr(handle, m, n, k, A, lda, tau, work, lwork, devInfo) &
       result(DnCungqr) &
       bind(C, name="hipsolverDnCungqr")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnCungqr
    end function hipsolverDnCungqr

    !---------------------------------------------
    ! hipsolverDnZungqr
    !---------------------------------------------
    function hipsolverDnZungqr(handle, m, n, k, A, lda, tau, work, lwork, devInfo) &
       result(DnZungqr) &
       bind(C, name="hipsolverDnZungqr")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnZungqr
    end function hipsolverDnZungqr

    !---------------------------------------------
    ! hipsolverDnSorgtr_bufferSize
    !---------------------------------------------
    function hipsolverDnSorgtr_bufferSize(handle, uplo, n, A, lda, tau, lwork) &
       result(DnSorgtr_bufferSize) &
       bind(C, name="hipsolverDnSorgtr_bufferSize")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: tau(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnSorgtr_bufferSize
    end function hipsolverDnSorgtr_bufferSize

    !---------------------------------------------
    ! hipsolverDnDorgtr_bufferSize
    !---------------------------------------------
    function hipsolverDnDorgtr_bufferSize(handle, uplo, n, A, lda, tau, lwork) &
       result(DnDorgtr_bufferSize) &
       bind(C, name="hipsolverDnDorgtr_bufferSize")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: tau(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnDorgtr_bufferSize
    end function hipsolverDnDorgtr_bufferSize

    !---------------------------------------------
    ! hipsolverDnCungtr_bufferSize
    !---------------------------------------------
    function hipsolverDnCungtr_bufferSize(handle, uplo, n, A, lda, tau, lwork) &
       result(DnCungtr_bufferSize) &
       bind(C, name="hipsolverDnCungtr_bufferSize")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnCungtr_bufferSize
    end function hipsolverDnCungtr_bufferSize

    !---------------------------------------------
    ! hipsolverDnZungtr_bufferSize
    !---------------------------------------------
    function hipsolverDnZungtr_bufferSize(handle, uplo, n, A, lda, tau, lwork) &
       result(DnZungtr_bufferSize) &
       bind(C, name="hipsolverDnZungtr_bufferSize")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnZungtr_bufferSize
    end function hipsolverDnZungtr_bufferSize

    !---------------------------------------------
    ! hipsolverDnSorgtr
    !---------------------------------------------
    function hipsolverDnSorgtr(handle, uplo, n, A, lda, tau, work, lwork, devInfo) &
       result(DnSorgtr) &
       bind(C, name="hipsolverDnSorgtr")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: tau(*)
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnSorgtr
    end function hipsolverDnSorgtr

    !---------------------------------------------
    ! hipsolverDnDorgtr
    !---------------------------------------------
    function hipsolverDnDorgtr(handle, uplo, n, A, lda, tau, work, lwork, devInfo) &
       result(DnDorgtr) &
       bind(C, name="hipsolverDnDorgtr")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: tau(*)
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnDorgtr
    end function hipsolverDnDorgtr

    !---------------------------------------------
    ! hipsolverDnCungtr
    !---------------------------------------------
    function hipsolverDnCungtr(handle, uplo, n, A, lda, tau, work, lwork, devInfo) &
       result(DnCungtr) &
       bind(C, name="hipsolverDnCungtr")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnCungtr
    end function hipsolverDnCungtr

    !---------------------------------------------
    ! hipsolverDnZungtr
    !---------------------------------------------
    function hipsolverDnZungtr(handle, uplo, n, A, lda, tau, work, lwork, devInfo) &
       result(DnZungtr) &
       bind(C, name="hipsolverDnZungtr")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnZungtr
    end function hipsolverDnZungtr

    !---------------------------------------------
    ! hipsolverDnSormqr_bufferSize
    !---------------------------------------------
    function hipsolverDnSormqr_bufferSize(handle, side, trans, m, n, k, A, lda, tau, C, ldc, &
                                          lwork) &
       result(DnSormqr_bufferSize) &
       bind(C, name="hipsolverDnSormqr_bufferSize")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: tau(*)
       real(c_float) :: C(*)
       integer(c_int), value :: ldc
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnSormqr_bufferSize
    end function hipsolverDnSormqr_bufferSize

    !---------------------------------------------
    ! hipsolverDnDormqr_bufferSize
    !---------------------------------------------
    function hipsolverDnDormqr_bufferSize(handle, side, trans, m, n, k, A, lda, tau, C, ldc, &
                                          lwork) &
       result(DnDormqr_bufferSize) &
       bind(C, name="hipsolverDnDormqr_bufferSize")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: tau(*)
       real(c_double) :: C(*)
       integer(c_int), value :: ldc
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnDormqr_bufferSize
    end function hipsolverDnDormqr_bufferSize

    !---------------------------------------------
    ! hipsolverDnCunmqr_bufferSize
    !---------------------------------------------
    function hipsolverDnCunmqr_bufferSize(handle, side, trans, m, n, k, A, lda, tau, C, ldc, &
                                          lwork) &
       result(DnCunmqr_bufferSize) &
       bind(C, name="hipsolverDnCunmqr_bufferSize")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnCunmqr_bufferSize
    end function hipsolverDnCunmqr_bufferSize

    !---------------------------------------------
    ! hipsolverDnZunmqr_bufferSize
    !---------------------------------------------
    function hipsolverDnZunmqr_bufferSize(handle, side, trans, m, n, k, A, lda, tau, C, ldc, &
                                          lwork) &
       result(DnZunmqr_bufferSize) &
       bind(C, name="hipsolverDnZunmqr_bufferSize")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnZunmqr_bufferSize
    end function hipsolverDnZunmqr_bufferSize

    !---------------------------------------------
    ! hipsolverDnSormqr
    !---------------------------------------------
    function hipsolverDnSormqr(handle, side, trans, m, n, k, A, lda, tau, C, ldc, work, lwork, &
                               devInfo) &
       result(DnSormqr) &
       bind(C, name="hipsolverDnSormqr")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: tau(*)
       real(c_float) :: C(*)
       integer(c_int), value :: ldc
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnSormqr
    end function hipsolverDnSormqr

    !---------------------------------------------
    ! hipsolverDnDormqr
    !---------------------------------------------
    function hipsolverDnDormqr(handle, side, trans, m, n, k, A, lda, tau, C, ldc, work, lwork, &
                               devInfo) &
       result(DnDormqr) &
       bind(C, name="hipsolverDnDormqr")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: tau(*)
       real(c_double) :: C(*)
       integer(c_int), value :: ldc
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnDormqr
    end function hipsolverDnDormqr

    !---------------------------------------------
    ! hipsolverDnCunmqr
    !---------------------------------------------
    function hipsolverDnCunmqr(handle, side, trans, m, n, k, A, lda, tau, C, ldc, work, lwork, &
                               devInfo) &
       result(DnCunmqr) &
       bind(C, name="hipsolverDnCunmqr")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnCunmqr
    end function hipsolverDnCunmqr

    !---------------------------------------------
    ! hipsolverDnZunmqr
    !---------------------------------------------
    function hipsolverDnZunmqr(handle, side, trans, m, n, k, A, lda, tau, C, ldc, work, lwork, &
                               devInfo) &
       result(DnZunmqr) &
       bind(C, name="hipsolverDnZunmqr")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnZunmqr
    end function hipsolverDnZunmqr

    !---------------------------------------------
    ! hipsolverDnSormtr_bufferSize
    !---------------------------------------------
    function hipsolverDnSormtr_bufferSize(handle, side, uplo, trans, m, n, A, lda, tau, C, ldc, &
                                          lwork) &
       result(DnSormtr_bufferSize) &
       bind(C, name="hipsolverDnSormtr_bufferSize")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: uplo
       integer(c_int), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: tau(*)
       real(c_float) :: C(*)
       integer(c_int), value :: ldc
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnSormtr_bufferSize
    end function hipsolverDnSormtr_bufferSize

    !---------------------------------------------
    ! hipsolverDnDormtr_bufferSize
    !---------------------------------------------
    function hipsolverDnDormtr_bufferSize(handle, side, uplo, trans, m, n, A, lda, tau, C, ldc, &
                                          lwork) &
       result(DnDormtr_bufferSize) &
       bind(C, name="hipsolverDnDormtr_bufferSize")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: uplo
       integer(c_int), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: tau(*)
       real(c_double) :: C(*)
       integer(c_int), value :: ldc
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnDormtr_bufferSize
    end function hipsolverDnDormtr_bufferSize

    !---------------------------------------------
    ! hipsolverDnCunmtr_bufferSize
    !---------------------------------------------
    function hipsolverDnCunmtr_bufferSize(handle, side, uplo, trans, m, n, A, lda, tau, C, ldc, &
                                          lwork) &
       result(DnCunmtr_bufferSize) &
       bind(C, name="hipsolverDnCunmtr_bufferSize")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: uplo
       integer(c_int), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnCunmtr_bufferSize
    end function hipsolverDnCunmtr_bufferSize

    !---------------------------------------------
    ! hipsolverDnZunmtr_bufferSize
    !---------------------------------------------
    function hipsolverDnZunmtr_bufferSize(handle, side, uplo, trans, m, n, A, lda, tau, C, ldc, &
                                          lwork) &
       result(DnZunmtr_bufferSize) &
       bind(C, name="hipsolverDnZunmtr_bufferSize")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: uplo
       integer(c_int), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnZunmtr_bufferSize
    end function hipsolverDnZunmtr_bufferSize

    !---------------------------------------------
    ! hipsolverDnSormtr
    !---------------------------------------------
    function hipsolverDnSormtr(handle, side, uplo, trans, m, n, A, lda, tau, C, ldc, work, lwork, &
                               devInfo) &
       result(DnSormtr) &
       bind(C, name="hipsolverDnSormtr")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: uplo
       integer(c_int), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: tau(*)
       real(c_float) :: C(*)
       integer(c_int), value :: ldc
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnSormtr
    end function hipsolverDnSormtr

    !---------------------------------------------
    ! hipsolverDnDormtr
    !---------------------------------------------
    function hipsolverDnDormtr(handle, side, uplo, trans, m, n, A, lda, tau, C, ldc, work, lwork, &
                               devInfo) &
       result(DnDormtr) &
       bind(C, name="hipsolverDnDormtr")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: uplo
       integer(c_int), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: tau(*)
       real(c_double) :: C(*)
       integer(c_int), value :: ldc
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnDormtr
    end function hipsolverDnDormtr

    !---------------------------------------------
    ! hipsolverDnCunmtr
    !---------------------------------------------
    function hipsolverDnCunmtr(handle, side, uplo, trans, m, n, A, lda, tau, C, ldc, work, lwork, &
                               devInfo) &
       result(DnCunmtr) &
       bind(C, name="hipsolverDnCunmtr")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: uplo
       integer(c_int), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnCunmtr
    end function hipsolverDnCunmtr

    !---------------------------------------------
    ! hipsolverDnZunmtr
    !---------------------------------------------
    function hipsolverDnZunmtr(handle, side, uplo, trans, m, n, A, lda, tau, C, ldc, work, lwork, &
                               devInfo) &
       result(DnZunmtr) &
       bind(C, name="hipsolverDnZunmtr")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: side
       integer(c_int), value :: uplo
       integer(c_int), value :: trans
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnZunmtr
    end function hipsolverDnZunmtr

    !---------------------------------------------
    ! hipsolverDnSgebrd_bufferSize
    !---------------------------------------------
    function hipsolverDnSgebrd_bufferSize(handle, m, n, lwork) &
       result(DnSgebrd_bufferSize) &
       bind(C, name="hipsolverDnSgebrd_bufferSize")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnSgebrd_bufferSize
    end function hipsolverDnSgebrd_bufferSize

    !---------------------------------------------
    ! hipsolverDnDgebrd_bufferSize
    !---------------------------------------------
    function hipsolverDnDgebrd_bufferSize(handle, m, n, lwork) &
       result(DnDgebrd_bufferSize) &
       bind(C, name="hipsolverDnDgebrd_bufferSize")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnDgebrd_bufferSize
    end function hipsolverDnDgebrd_bufferSize

    !---------------------------------------------
    ! hipsolverDnCgebrd_bufferSize
    !---------------------------------------------
    function hipsolverDnCgebrd_bufferSize(handle, m, n, lwork) &
       result(DnCgebrd_bufferSize) &
       bind(C, name="hipsolverDnCgebrd_bufferSize")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnCgebrd_bufferSize
    end function hipsolverDnCgebrd_bufferSize

    !---------------------------------------------
    ! hipsolverDnZgebrd_bufferSize
    !---------------------------------------------
    function hipsolverDnZgebrd_bufferSize(handle, m, n, lwork) &
       result(DnZgebrd_bufferSize) &
       bind(C, name="hipsolverDnZgebrd_bufferSize")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnZgebrd_bufferSize
    end function hipsolverDnZgebrd_bufferSize

    !---------------------------------------------
    ! hipsolverDnSgebrd
    !---------------------------------------------
    function hipsolverDnSgebrd(handle, m, n, A, lda, D, E, tauq, taup, work, lwork, devInfo) &
       result(DnSgebrd) &
       bind(C, name="hipsolverDnSgebrd")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: D(*)
       real(c_float) :: E(*)
       real(c_float) :: tauq(*)
       real(c_float) :: taup(*)
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnSgebrd
    end function hipsolverDnSgebrd

    !---------------------------------------------
    ! hipsolverDnDgebrd
    !---------------------------------------------
    function hipsolverDnDgebrd(handle, m, n, A, lda, D, E, tauq, taup, work, lwork, devInfo) &
       result(DnDgebrd) &
       bind(C, name="hipsolverDnDgebrd")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: D(*)
       real(c_double) :: E(*)
       real(c_double) :: tauq(*)
       real(c_double) :: taup(*)
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnDgebrd
    end function hipsolverDnDgebrd

    !---------------------------------------------
    ! hipsolverDnCgebrd
    !---------------------------------------------
    function hipsolverDnCgebrd(handle, m, n, A, lda, D, E, tauq, taup, work, lwork, devInfo) &
       result(DnCgebrd) &
       bind(C, name="hipsolverDnCgebrd")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float) :: D(*)
       real(c_float) :: E(*)
       type(c_ptr), value :: tauq
       type(c_ptr), value :: taup
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnCgebrd
    end function hipsolverDnCgebrd

    !---------------------------------------------
    ! hipsolverDnZgebrd
    !---------------------------------------------
    function hipsolverDnZgebrd(handle, m, n, A, lda, D, E, tauq, taup, work, lwork, devInfo) &
       result(DnZgebrd) &
       bind(C, name="hipsolverDnZgebrd")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double) :: D(*)
       real(c_double) :: E(*)
       type(c_ptr), value :: tauq
       type(c_ptr), value :: taup
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnZgebrd
    end function hipsolverDnZgebrd

    !---------------------------------------------
    ! hipsolverDnSSgels_bufferSize
    !---------------------------------------------
    function hipsolverDnSSgels_bufferSize(handle, m, n, nrhs, A, lda, B, ldb, X, ldx, work, lwork) &
       result(DnSSgels_bufferSize) &
       bind(C, name="hipsolverDnSSgels_bufferSize")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: B(*)
       integer(c_int), value :: ldb
       real(c_float) :: X(*)
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       type(c_ptr), value :: lwork
       integer(c_int) :: DnSSgels_bufferSize
    end function hipsolverDnSSgels_bufferSize

    !---------------------------------------------
    ! hipsolverDnDDgels_bufferSize
    !---------------------------------------------
    function hipsolverDnDDgels_bufferSize(handle, m, n, nrhs, A, lda, B, ldb, X, ldx, work, lwork) &
       result(DnDDgels_bufferSize) &
       bind(C, name="hipsolverDnDDgels_bufferSize")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: B(*)
       integer(c_int), value :: ldb
       real(c_double) :: X(*)
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       type(c_ptr), value :: lwork
       integer(c_int) :: DnDDgels_bufferSize
    end function hipsolverDnDDgels_bufferSize

    !---------------------------------------------
    ! hipsolverDnCCgels_bufferSize
    !---------------------------------------------
    function hipsolverDnCCgels_bufferSize(handle, m, n, nrhs, A, lda, B, ldb, X, ldx, work, lwork) &
       result(DnCCgels_bufferSize) &
       bind(C, name="hipsolverDnCCgels_bufferSize")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       type(c_ptr), value :: lwork
       integer(c_int) :: DnCCgels_bufferSize
    end function hipsolverDnCCgels_bufferSize

    !---------------------------------------------
    ! hipsolverDnZZgels_bufferSize
    !---------------------------------------------
    function hipsolverDnZZgels_bufferSize(handle, m, n, nrhs, A, lda, B, ldb, X, ldx, work, lwork) &
       result(DnZZgels_bufferSize) &
       bind(C, name="hipsolverDnZZgels_bufferSize")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       type(c_ptr), value :: lwork
       integer(c_int) :: DnZZgels_bufferSize
    end function hipsolverDnZZgels_bufferSize

    !---------------------------------------------
    ! hipsolverDnSSgels
    !---------------------------------------------
    function hipsolverDnSSgels(handle, m, n, nrhs, A, lda, B, ldb, X, ldx, work, lwork, niters, &
                               devInfo) &
       result(DnSSgels) &
       bind(C, name="hipsolverDnSSgels")
       import :: c_ptr, c_int, c_float, c_long
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: B(*)
       integer(c_int), value :: ldb
       real(c_float) :: X(*)
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       integer(c_long), value :: lwork
       integer(c_int) :: niters(*)
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnSSgels
    end function hipsolverDnSSgels

    !---------------------------------------------
    ! hipsolverDnDDgels
    !---------------------------------------------
    function hipsolverDnDDgels(handle, m, n, nrhs, A, lda, B, ldb, X, ldx, work, lwork, niters, &
                               devInfo) &
       result(DnDDgels) &
       bind(C, name="hipsolverDnDDgels")
       import :: c_ptr, c_int, c_double, c_long
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: B(*)
       integer(c_int), value :: ldb
       real(c_double) :: X(*)
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       integer(c_long), value :: lwork
       integer(c_int) :: niters(*)
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnDDgels
    end function hipsolverDnDDgels

    !---------------------------------------------
    ! hipsolverDnCCgels
    !---------------------------------------------
    function hipsolverDnCCgels(handle, m, n, nrhs, A, lda, B, ldb, X, ldx, work, lwork, niters, &
                               devInfo) &
       result(DnCCgels) &
       bind(C, name="hipsolverDnCCgels")
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       integer(c_long), value :: lwork
       integer(c_int) :: niters(*)
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnCCgels
    end function hipsolverDnCCgels

    !---------------------------------------------
    ! hipsolverDnZZgels
    !---------------------------------------------
    function hipsolverDnZZgels(handle, m, n, nrhs, A, lda, B, ldb, X, ldx, work, lwork, niters, &
                               devInfo) &
       result(DnZZgels) &
       bind(C, name="hipsolverDnZZgels")
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       integer(c_long), value :: lwork
       integer(c_int) :: niters(*)
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnZZgels
    end function hipsolverDnZZgels

    !---------------------------------------------
    ! hipsolverDnSgeqrf_bufferSize
    !---------------------------------------------
    function hipsolverDnSgeqrf_bufferSize(handle, m, n, A, lda, lwork) &
       result(DnSgeqrf_bufferSize) &
       bind(C, name="hipsolverDnSgeqrf_bufferSize")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnSgeqrf_bufferSize
    end function hipsolverDnSgeqrf_bufferSize

    !---------------------------------------------
    ! hipsolverDnDgeqrf_bufferSize
    !---------------------------------------------
    function hipsolverDnDgeqrf_bufferSize(handle, m, n, A, lda, lwork) &
       result(DnDgeqrf_bufferSize) &
       bind(C, name="hipsolverDnDgeqrf_bufferSize")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnDgeqrf_bufferSize
    end function hipsolverDnDgeqrf_bufferSize

    !---------------------------------------------
    ! hipsolverDnCgeqrf_bufferSize
    !---------------------------------------------
    function hipsolverDnCgeqrf_bufferSize(handle, m, n, A, lda, lwork) &
       result(DnCgeqrf_bufferSize) &
       bind(C, name="hipsolverDnCgeqrf_bufferSize")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnCgeqrf_bufferSize
    end function hipsolverDnCgeqrf_bufferSize

    !---------------------------------------------
    ! hipsolverDnZgeqrf_bufferSize
    !---------------------------------------------
    function hipsolverDnZgeqrf_bufferSize(handle, m, n, A, lda, lwork) &
       result(DnZgeqrf_bufferSize) &
       bind(C, name="hipsolverDnZgeqrf_bufferSize")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnZgeqrf_bufferSize
    end function hipsolverDnZgeqrf_bufferSize

    !---------------------------------------------
    ! hipsolverDnSgeqrf
    !---------------------------------------------
    function hipsolverDnSgeqrf(handle, m, n, A, lda, tau, work, lwork, devInfo) &
       result(DnSgeqrf) &
       bind(C, name="hipsolverDnSgeqrf")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: tau(*)
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnSgeqrf
    end function hipsolverDnSgeqrf

    !---------------------------------------------
    ! hipsolverDnDgeqrf
    !---------------------------------------------
    function hipsolverDnDgeqrf(handle, m, n, A, lda, tau, work, lwork, devInfo) &
       result(DnDgeqrf) &
       bind(C, name="hipsolverDnDgeqrf")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: tau(*)
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnDgeqrf
    end function hipsolverDnDgeqrf

    !---------------------------------------------
    ! hipsolverDnCgeqrf
    !---------------------------------------------
    function hipsolverDnCgeqrf(handle, m, n, A, lda, tau, work, lwork, devInfo) &
       result(DnCgeqrf) &
       bind(C, name="hipsolverDnCgeqrf")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnCgeqrf
    end function hipsolverDnCgeqrf

    !---------------------------------------------
    ! hipsolverDnZgeqrf
    !---------------------------------------------
    function hipsolverDnZgeqrf(handle, m, n, A, lda, tau, work, lwork, devInfo) &
       result(DnZgeqrf) &
       bind(C, name="hipsolverDnZgeqrf")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnZgeqrf
    end function hipsolverDnZgeqrf

    !---------------------------------------------
    ! hipsolverDnSSgesv_bufferSize
    !---------------------------------------------
    function hipsolverDnSSgesv_bufferSize(handle, n, nrhs, A, lda, devIpiv, B, ldb, X, ldx, work, &
                                          lwork) &
       result(DnSSgesv_bufferSize) &
       bind(C, name="hipsolverDnSSgesv_bufferSize")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: devIpiv(*)
       real(c_float) :: B(*)
       integer(c_int), value :: ldb
       real(c_float) :: X(*)
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       type(c_ptr), value :: lwork
       integer(c_int) :: DnSSgesv_bufferSize
    end function hipsolverDnSSgesv_bufferSize

    !---------------------------------------------
    ! hipsolverDnDDgesv_bufferSize
    !---------------------------------------------
    function hipsolverDnDDgesv_bufferSize(handle, n, nrhs, A, lda, devIpiv, B, ldb, X, ldx, work, &
                                          lwork) &
       result(DnDDgesv_bufferSize) &
       bind(C, name="hipsolverDnDDgesv_bufferSize")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: devIpiv(*)
       real(c_double) :: B(*)
       integer(c_int), value :: ldb
       real(c_double) :: X(*)
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       type(c_ptr), value :: lwork
       integer(c_int) :: DnDDgesv_bufferSize
    end function hipsolverDnDDgesv_bufferSize

    !---------------------------------------------
    ! hipsolverDnCCgesv_bufferSize
    !---------------------------------------------
    function hipsolverDnCCgesv_bufferSize(handle, n, nrhs, A, lda, devIpiv, B, ldb, X, ldx, work, &
                                          lwork) &
       result(DnCCgesv_bufferSize) &
       bind(C, name="hipsolverDnCCgesv_bufferSize")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: devIpiv(*)
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       type(c_ptr), value :: lwork
       integer(c_int) :: DnCCgesv_bufferSize
    end function hipsolverDnCCgesv_bufferSize

    !---------------------------------------------
    ! hipsolverDnZZgesv_bufferSize
    !---------------------------------------------
    function hipsolverDnZZgesv_bufferSize(handle, n, nrhs, A, lda, devIpiv, B, ldb, X, ldx, work, &
                                          lwork) &
       result(DnZZgesv_bufferSize) &
       bind(C, name="hipsolverDnZZgesv_bufferSize")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: devIpiv(*)
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       type(c_ptr), value :: lwork
       integer(c_int) :: DnZZgesv_bufferSize
    end function hipsolverDnZZgesv_bufferSize

    !---------------------------------------------
    ! hipsolverDnSSgesv
    !---------------------------------------------
    function hipsolverDnSSgesv(handle, n, nrhs, A, lda, devIpiv, B, ldb, X, ldx, work, lwork, &
                               niters, devInfo) &
       result(DnSSgesv) &
       bind(C, name="hipsolverDnSSgesv")
       import :: c_ptr, c_int, c_float, c_long
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: devIpiv(*)
       real(c_float) :: B(*)
       integer(c_int), value :: ldb
       real(c_float) :: X(*)
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       integer(c_long), value :: lwork
       integer(c_int) :: niters(*)
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnSSgesv
    end function hipsolverDnSSgesv

    !---------------------------------------------
    ! hipsolverDnDDgesv
    !---------------------------------------------
    function hipsolverDnDDgesv(handle, n, nrhs, A, lda, devIpiv, B, ldb, X, ldx, work, lwork, &
                               niters, devInfo) &
       result(DnDDgesv) &
       bind(C, name="hipsolverDnDDgesv")
       import :: c_ptr, c_int, c_double, c_long
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: devIpiv(*)
       real(c_double) :: B(*)
       integer(c_int), value :: ldb
       real(c_double) :: X(*)
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       integer(c_long), value :: lwork
       integer(c_int) :: niters(*)
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnDDgesv
    end function hipsolverDnDDgesv

    !---------------------------------------------
    ! hipsolverDnCCgesv
    !---------------------------------------------
    function hipsolverDnCCgesv(handle, n, nrhs, A, lda, devIpiv, B, ldb, X, ldx, work, lwork, &
                               niters, devInfo) &
       result(DnCCgesv) &
       bind(C, name="hipsolverDnCCgesv")
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: devIpiv(*)
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       integer(c_long), value :: lwork
       integer(c_int) :: niters(*)
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnCCgesv
    end function hipsolverDnCCgesv

    !---------------------------------------------
    ! hipsolverDnZZgesv
    !---------------------------------------------
    function hipsolverDnZZgesv(handle, n, nrhs, A, lda, devIpiv, B, ldb, X, ldx, work, lwork, &
                               niters, devInfo) &
       result(DnZZgesv) &
       bind(C, name="hipsolverDnZZgesv")
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: devIpiv(*)
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       type(c_ptr), value :: work
       integer(c_long), value :: lwork
       integer(c_int) :: niters(*)
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnZZgesv
    end function hipsolverDnZZgesv

    !---------------------------------------------
    ! hipsolverDnSgesvd_bufferSize
    !---------------------------------------------
    function hipsolverDnSgesvd_bufferSize(handle, m, n, lwork) &
       result(DnSgesvd_bufferSize) &
       bind(C, name="hipsolverDnSgesvd_bufferSize")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnSgesvd_bufferSize
    end function hipsolverDnSgesvd_bufferSize

    !---------------------------------------------
    ! hipsolverDnDgesvd_bufferSize
    !---------------------------------------------
    function hipsolverDnDgesvd_bufferSize(handle, m, n, lwork) &
       result(DnDgesvd_bufferSize) &
       bind(C, name="hipsolverDnDgesvd_bufferSize")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnDgesvd_bufferSize
    end function hipsolverDnDgesvd_bufferSize

    !---------------------------------------------
    ! hipsolverDnCgesvd_bufferSize
    !---------------------------------------------
    function hipsolverDnCgesvd_bufferSize(handle, m, n, lwork) &
       result(DnCgesvd_bufferSize) &
       bind(C, name="hipsolverDnCgesvd_bufferSize")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnCgesvd_bufferSize
    end function hipsolverDnCgesvd_bufferSize

    !---------------------------------------------
    ! hipsolverDnZgesvd_bufferSize
    !---------------------------------------------
    function hipsolverDnZgesvd_bufferSize(handle, m, n, lwork) &
       result(DnZgesvd_bufferSize) &
       bind(C, name="hipsolverDnZgesvd_bufferSize")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnZgesvd_bufferSize
    end function hipsolverDnZgesvd_bufferSize

    !---------------------------------------------
    ! hipsolverDnSgesvd
    !---------------------------------------------
    function hipsolverDnSgesvd(handle, jobu, jobv, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                               rwork, devInfo) &
       result(DnSgesvd) &
       bind(C, name="hipsolverDnSgesvd")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       type(c_ptr), value :: jobu
       type(c_ptr), value :: jobv
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: S(*)
       real(c_float) :: U(*)
       integer(c_int), value :: ldu
       real(c_float) :: V(*)
       integer(c_int), value :: ldv
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       real(c_float) :: rwork(*)
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnSgesvd
    end function hipsolverDnSgesvd

    !---------------------------------------------
    ! hipsolverDnDgesvd
    !---------------------------------------------
    function hipsolverDnDgesvd(handle, jobu, jobv, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                               rwork, devInfo) &
       result(DnDgesvd) &
       bind(C, name="hipsolverDnDgesvd")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       type(c_ptr), value :: jobu
       type(c_ptr), value :: jobv
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: S(*)
       real(c_double) :: U(*)
       integer(c_int), value :: ldu
       real(c_double) :: V(*)
       integer(c_int), value :: ldv
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       real(c_double) :: rwork(*)
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnDgesvd
    end function hipsolverDnDgesvd

    !---------------------------------------------
    ! hipsolverDnCgesvd
    !---------------------------------------------
    function hipsolverDnCgesvd(handle, jobu, jobv, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                               rwork, devInfo) &
       result(DnCgesvd) &
       bind(C, name="hipsolverDnCgesvd")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       type(c_ptr), value :: jobu
       type(c_ptr), value :: jobv
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float) :: S(*)
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       real(c_float) :: rwork(*)
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnCgesvd
    end function hipsolverDnCgesvd

    !---------------------------------------------
    ! hipsolverDnZgesvd
    !---------------------------------------------
    function hipsolverDnZgesvd(handle, jobu, jobv, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                               rwork, devInfo) &
       result(DnZgesvd) &
       bind(C, name="hipsolverDnZgesvd")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       type(c_ptr), value :: jobu
       type(c_ptr), value :: jobv
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double) :: S(*)
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       real(c_double) :: rwork(*)
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnZgesvd
    end function hipsolverDnZgesvd

    !---------------------------------------------
    ! hipsolverDnSgesvdj_bufferSize
    !---------------------------------------------
    function hipsolverDnSgesvdj_bufferSize(handle, jobz, econ, m, n, A, lda, S, U, ldu, V, ldv, &
                                           lwork, params) &
       result(DnSgesvdj_bufferSize) &
       bind(C, name="hipsolverDnSgesvdj_bufferSize")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: econ
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: S(*)
       real(c_float) :: U(*)
       integer(c_int), value :: ldu
       real(c_float) :: V(*)
       integer(c_int), value :: ldv
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int) :: DnSgesvdj_bufferSize
    end function hipsolverDnSgesvdj_bufferSize

    !---------------------------------------------
    ! hipsolverDnDgesvdj_bufferSize
    !---------------------------------------------
    function hipsolverDnDgesvdj_bufferSize(handle, jobz, econ, m, n, A, lda, S, U, ldu, V, ldv, &
                                           lwork, params) &
       result(DnDgesvdj_bufferSize) &
       bind(C, name="hipsolverDnDgesvdj_bufferSize")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: econ
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: S(*)
       real(c_double) :: U(*)
       integer(c_int), value :: ldu
       real(c_double) :: V(*)
       integer(c_int), value :: ldv
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int) :: DnDgesvdj_bufferSize
    end function hipsolverDnDgesvdj_bufferSize

    !---------------------------------------------
    ! hipsolverDnCgesvdj_bufferSize
    !---------------------------------------------
    function hipsolverDnCgesvdj_bufferSize(handle, jobz, econ, m, n, A, lda, S, U, ldu, V, ldv, &
                                           lwork, params) &
       result(DnCgesvdj_bufferSize) &
       bind(C, name="hipsolverDnCgesvdj_bufferSize")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: econ
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float) :: S(*)
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int) :: DnCgesvdj_bufferSize
    end function hipsolverDnCgesvdj_bufferSize

    !---------------------------------------------
    ! hipsolverDnZgesvdj_bufferSize
    !---------------------------------------------
    function hipsolverDnZgesvdj_bufferSize(handle, jobz, econ, m, n, A, lda, S, U, ldu, V, ldv, &
                                           lwork, params) &
       result(DnZgesvdj_bufferSize) &
       bind(C, name="hipsolverDnZgesvdj_bufferSize")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: econ
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double) :: S(*)
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int) :: DnZgesvdj_bufferSize
    end function hipsolverDnZgesvdj_bufferSize

    !---------------------------------------------
    ! hipsolverDnSgesvdj
    !---------------------------------------------
    function hipsolverDnSgesvdj(handle, jobz, econ, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                                devInfo, params) &
       result(DnSgesvdj) &
       bind(C, name="hipsolverDnSgesvdj")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: econ
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: S(*)
       real(c_float) :: U(*)
       integer(c_int), value :: ldu
       real(c_float) :: V(*)
       integer(c_int), value :: ldv
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int) :: DnSgesvdj
    end function hipsolverDnSgesvdj

    !---------------------------------------------
    ! hipsolverDnDgesvdj
    !---------------------------------------------
    function hipsolverDnDgesvdj(handle, jobz, econ, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                                devInfo, params) &
       result(DnDgesvdj) &
       bind(C, name="hipsolverDnDgesvdj")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: econ
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: S(*)
       real(c_double) :: U(*)
       integer(c_int), value :: ldu
       real(c_double) :: V(*)
       integer(c_int), value :: ldv
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int) :: DnDgesvdj
    end function hipsolverDnDgesvdj

    !---------------------------------------------
    ! hipsolverDnCgesvdj
    !---------------------------------------------
    function hipsolverDnCgesvdj(handle, jobz, econ, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                                devInfo, params) &
       result(DnCgesvdj) &
       bind(C, name="hipsolverDnCgesvdj")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: econ
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float) :: S(*)
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int) :: DnCgesvdj
    end function hipsolverDnCgesvdj

    !---------------------------------------------
    ! hipsolverDnZgesvdj
    !---------------------------------------------
    function hipsolverDnZgesvdj(handle, jobz, econ, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                                devInfo, params) &
       result(DnZgesvdj) &
       bind(C, name="hipsolverDnZgesvdj")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: econ
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double) :: S(*)
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int) :: DnZgesvdj
    end function hipsolverDnZgesvdj

    !---------------------------------------------
    ! hipsolverDnSgesvdjBatched_bufferSize
    !---------------------------------------------
    function hipsolverDnSgesvdjBatched_bufferSize(handle, jobz, m, n, A, lda, S, U, ldu, V, ldv, &
                                                  lwork, params, batch_count) &
       result(DnSgesvdjBatched_bufferSize) &
       bind(C, name="hipsolverDnSgesvdjBatched_bufferSize")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: S(*)
       real(c_float) :: U(*)
       integer(c_int), value :: ldu
       real(c_float) :: V(*)
       integer(c_int), value :: ldv
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(c_int) :: DnSgesvdjBatched_bufferSize
    end function hipsolverDnSgesvdjBatched_bufferSize

    !---------------------------------------------
    ! hipsolverDnDgesvdjBatched_bufferSize
    !---------------------------------------------
    function hipsolverDnDgesvdjBatched_bufferSize(handle, jobz, m, n, A, lda, S, U, ldu, V, ldv, &
                                                  lwork, params, batch_count) &
       result(DnDgesvdjBatched_bufferSize) &
       bind(C, name="hipsolverDnDgesvdjBatched_bufferSize")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: S(*)
       real(c_double) :: U(*)
       integer(c_int), value :: ldu
       real(c_double) :: V(*)
       integer(c_int), value :: ldv
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(c_int) :: DnDgesvdjBatched_bufferSize
    end function hipsolverDnDgesvdjBatched_bufferSize

    !---------------------------------------------
    ! hipsolverDnCgesvdjBatched_bufferSize
    !---------------------------------------------
    function hipsolverDnCgesvdjBatched_bufferSize(handle, jobz, m, n, A, lda, S, U, ldu, V, ldv, &
                                                  lwork, params, batch_count) &
       result(DnCgesvdjBatched_bufferSize) &
       bind(C, name="hipsolverDnCgesvdjBatched_bufferSize")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float) :: S(*)
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(c_int) :: DnCgesvdjBatched_bufferSize
    end function hipsolverDnCgesvdjBatched_bufferSize

    !---------------------------------------------
    ! hipsolverDnZgesvdjBatched_bufferSize
    !---------------------------------------------
    function hipsolverDnZgesvdjBatched_bufferSize(handle, jobz, m, n, A, lda, S, U, ldu, V, ldv, &
                                                  lwork, params, batch_count) &
       result(DnZgesvdjBatched_bufferSize) &
       bind(C, name="hipsolverDnZgesvdjBatched_bufferSize")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double) :: S(*)
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(c_int) :: DnZgesvdjBatched_bufferSize
    end function hipsolverDnZgesvdjBatched_bufferSize

    !---------------------------------------------
    ! hipsolverDnSgesvdjBatched
    !---------------------------------------------
    function hipsolverDnSgesvdjBatched(handle, jobz, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                                       devInfo, params, batch_count) &
       result(DnSgesvdjBatched) &
       bind(C, name="hipsolverDnSgesvdjBatched")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: S(*)
       real(c_float) :: U(*)
       integer(c_int), value :: ldu
       real(c_float) :: V(*)
       integer(c_int), value :: ldv
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(c_int) :: DnSgesvdjBatched
    end function hipsolverDnSgesvdjBatched

    !---------------------------------------------
    ! hipsolverDnDgesvdjBatched
    !---------------------------------------------
    function hipsolverDnDgesvdjBatched(handle, jobz, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                                       devInfo, params, batch_count) &
       result(DnDgesvdjBatched) &
       bind(C, name="hipsolverDnDgesvdjBatched")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: S(*)
       real(c_double) :: U(*)
       integer(c_int), value :: ldu
       real(c_double) :: V(*)
       integer(c_int), value :: ldv
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(c_int) :: DnDgesvdjBatched
    end function hipsolverDnDgesvdjBatched

    !---------------------------------------------
    ! hipsolverDnCgesvdjBatched
    !---------------------------------------------
    function hipsolverDnCgesvdjBatched(handle, jobz, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                                       devInfo, params, batch_count) &
       result(DnCgesvdjBatched) &
       bind(C, name="hipsolverDnCgesvdjBatched")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float) :: S(*)
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(c_int) :: DnCgesvdjBatched
    end function hipsolverDnCgesvdjBatched

    !---------------------------------------------
    ! hipsolverDnZgesvdjBatched
    !---------------------------------------------
    function hipsolverDnZgesvdjBatched(handle, jobz, m, n, A, lda, S, U, ldu, V, ldv, work, lwork, &
                                       devInfo, params, batch_count) &
       result(DnZgesvdjBatched) &
       bind(C, name="hipsolverDnZgesvdjBatched")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double) :: S(*)
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(c_int) :: DnZgesvdjBatched
    end function hipsolverDnZgesvdjBatched

    !---------------------------------------------
    ! hipsolverDnSgesvdaStridedBatched_bufferSize
    !---------------------------------------------
    function hipsolverDnSgesvdaStridedBatched_bufferSize(handle, jobz, rank, m, n, A, lda, &
                                                         strideA, S, strideS, U, ldu, strideU, V, &
                                                         ldv, strideV, lwork, batch_count) &
       result(DnSgesvdaStridedBatched_bufferSize) &
       bind(C, name="hipsolverDnSgesvdaStridedBatched_bufferSize")
       import :: c_ptr, c_int, c_float, c_int64_t
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: rank
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       integer(c_int64_t), value :: strideA
       real(c_float) :: S(*)
       integer(c_int64_t), value :: strideS
       real(c_float) :: U(*)
       integer(c_int), value :: ldu
       integer(c_int64_t), value :: strideU
       real(c_float) :: V(*)
       integer(c_int), value :: ldv
       integer(c_int64_t), value :: strideV
       integer(c_int) :: lwork(*)
       integer(c_int), value :: batch_count
       integer(c_int) :: DnSgesvdaStridedBatched_bufferSize
    end function hipsolverDnSgesvdaStridedBatched_bufferSize

    !---------------------------------------------
    ! hipsolverDnDgesvdaStridedBatched_bufferSize
    !---------------------------------------------
    function hipsolverDnDgesvdaStridedBatched_bufferSize(handle, jobz, rank, m, n, A, lda, &
                                                         strideA, S, strideS, U, ldu, strideU, V, &
                                                         ldv, strideV, lwork, batch_count) &
       result(DnDgesvdaStridedBatched_bufferSize) &
       bind(C, name="hipsolverDnDgesvdaStridedBatched_bufferSize")
       import :: c_ptr, c_int, c_double, c_int64_t
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: rank
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       integer(c_int64_t), value :: strideA
       real(c_double) :: S(*)
       integer(c_int64_t), value :: strideS
       real(c_double) :: U(*)
       integer(c_int), value :: ldu
       integer(c_int64_t), value :: strideU
       real(c_double) :: V(*)
       integer(c_int), value :: ldv
       integer(c_int64_t), value :: strideV
       integer(c_int) :: lwork(*)
       integer(c_int), value :: batch_count
       integer(c_int) :: DnDgesvdaStridedBatched_bufferSize
    end function hipsolverDnDgesvdaStridedBatched_bufferSize

    !---------------------------------------------
    ! hipsolverDnCgesvdaStridedBatched_bufferSize
    !---------------------------------------------
    function hipsolverDnCgesvdaStridedBatched_bufferSize(handle, jobz, rank, m, n, A, lda, &
                                                         strideA, S, strideS, U, ldu, strideU, V, &
                                                         ldv, strideV, lwork, batch_count) &
       result(DnCgesvdaStridedBatched_bufferSize) &
       bind(C, name="hipsolverDnCgesvdaStridedBatched_bufferSize")
       import :: c_ptr, c_int, c_int64_t, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: rank
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int64_t), value :: strideA
       real(c_float) :: S(*)
       integer(c_int64_t), value :: strideS
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       integer(c_int64_t), value :: strideU
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       integer(c_int64_t), value :: strideV
       integer(c_int) :: lwork(*)
       integer(c_int), value :: batch_count
       integer(c_int) :: DnCgesvdaStridedBatched_bufferSize
    end function hipsolverDnCgesvdaStridedBatched_bufferSize

    !---------------------------------------------
    ! hipsolverDnZgesvdaStridedBatched_bufferSize
    !---------------------------------------------
    function hipsolverDnZgesvdaStridedBatched_bufferSize(handle, jobz, rank, m, n, A, lda, &
                                                         strideA, S, strideS, U, ldu, strideU, V, &
                                                         ldv, strideV, lwork, batch_count) &
       result(DnZgesvdaStridedBatched_bufferSize) &
       bind(C, name="hipsolverDnZgesvdaStridedBatched_bufferSize")
       import :: c_ptr, c_int, c_int64_t, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: rank
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int64_t), value :: strideA
       real(c_double) :: S(*)
       integer(c_int64_t), value :: strideS
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       integer(c_int64_t), value :: strideU
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       integer(c_int64_t), value :: strideV
       integer(c_int) :: lwork(*)
       integer(c_int), value :: batch_count
       integer(c_int) :: DnZgesvdaStridedBatched_bufferSize
    end function hipsolverDnZgesvdaStridedBatched_bufferSize

    !---------------------------------------------
    ! hipsolverDnSgesvdaStridedBatched
    !---------------------------------------------
    function hipsolverDnSgesvdaStridedBatched(handle, jobz, rank, m, n, A, lda, strideA, S, &
                                              strideS, U, ldu, strideU, V, ldv, strideV, work, &
                                              lwork, devInfo, hRnrmF, batch_count) &
       result(DnSgesvdaStridedBatched) &
       bind(C, name="hipsolverDnSgesvdaStridedBatched")
       import :: c_ptr, c_int, c_float, c_int64_t, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: rank
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       integer(c_int64_t), value :: strideA
       real(c_float) :: S(*)
       integer(c_int64_t), value :: strideS
       real(c_float) :: U(*)
       integer(c_int), value :: ldu
       integer(c_int64_t), value :: strideU
       real(c_float) :: V(*)
       integer(c_int), value :: ldv
       integer(c_int64_t), value :: strideV
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       real(c_double) :: hRnrmF(*)
       integer(c_int), value :: batch_count
       integer(c_int) :: DnSgesvdaStridedBatched
    end function hipsolverDnSgesvdaStridedBatched

    !---------------------------------------------
    ! hipsolverDnDgesvdaStridedBatched
    !---------------------------------------------
    function hipsolverDnDgesvdaStridedBatched(handle, jobz, rank, m, n, A, lda, strideA, S, &
                                              strideS, U, ldu, strideU, V, ldv, strideV, work, &
                                              lwork, devInfo, hRnrmF, batch_count) &
       result(DnDgesvdaStridedBatched) &
       bind(C, name="hipsolverDnDgesvdaStridedBatched")
       import :: c_ptr, c_int, c_double, c_int64_t
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: rank
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       integer(c_int64_t), value :: strideA
       real(c_double) :: S(*)
       integer(c_int64_t), value :: strideS
       real(c_double) :: U(*)
       integer(c_int), value :: ldu
       integer(c_int64_t), value :: strideU
       real(c_double) :: V(*)
       integer(c_int), value :: ldv
       integer(c_int64_t), value :: strideV
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       real(c_double) :: hRnrmF(*)
       integer(c_int), value :: batch_count
       integer(c_int) :: DnDgesvdaStridedBatched
    end function hipsolverDnDgesvdaStridedBatched

    !---------------------------------------------
    ! hipsolverDnCgesvdaStridedBatched
    !---------------------------------------------
    function hipsolverDnCgesvdaStridedBatched(handle, jobz, rank, m, n, A, lda, strideA, S, &
                                              strideS, U, ldu, strideU, V, ldv, strideV, work, &
                                              lwork, devInfo, hRnrmF, batch_count) &
       result(DnCgesvdaStridedBatched) &
       bind(C, name="hipsolverDnCgesvdaStridedBatched")
       import :: c_ptr, c_int, c_int64_t, c_float, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: rank
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int64_t), value :: strideA
       real(c_float) :: S(*)
       integer(c_int64_t), value :: strideS
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       integer(c_int64_t), value :: strideU
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       integer(c_int64_t), value :: strideV
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       real(c_double) :: hRnrmF(*)
       integer(c_int), value :: batch_count
       integer(c_int) :: DnCgesvdaStridedBatched
    end function hipsolverDnCgesvdaStridedBatched

    !---------------------------------------------
    ! hipsolverDnZgesvdaStridedBatched
    !---------------------------------------------
    function hipsolverDnZgesvdaStridedBatched(handle, jobz, rank, m, n, A, lda, strideA, S, &
                                              strideS, U, ldu, strideU, V, ldv, strideV, work, &
                                              lwork, devInfo, hRnrmF, batch_count) &
       result(DnZgesvdaStridedBatched) &
       bind(C, name="hipsolverDnZgesvdaStridedBatched")
       import :: c_ptr, c_int, c_int64_t, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: rank
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int64_t), value :: strideA
       real(c_double) :: S(*)
       integer(c_int64_t), value :: strideS
       type(c_ptr), value :: U
       integer(c_int), value :: ldu
       integer(c_int64_t), value :: strideU
       type(c_ptr), value :: V
       integer(c_int), value :: ldv
       integer(c_int64_t), value :: strideV
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       real(c_double) :: hRnrmF(*)
       integer(c_int), value :: batch_count
       integer(c_int) :: DnZgesvdaStridedBatched
    end function hipsolverDnZgesvdaStridedBatched

    !---------------------------------------------
    ! hipsolverDnSgetrf_bufferSize
    !---------------------------------------------
    function hipsolverDnSgetrf_bufferSize(handle, m, n, A, lda, lwork) &
       result(DnSgetrf_bufferSize) &
       bind(C, name="hipsolverDnSgetrf_bufferSize")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnSgetrf_bufferSize
    end function hipsolverDnSgetrf_bufferSize

    !---------------------------------------------
    ! hipsolverDnDgetrf_bufferSize
    !---------------------------------------------
    function hipsolverDnDgetrf_bufferSize(handle, m, n, A, lda, lwork) &
       result(DnDgetrf_bufferSize) &
       bind(C, name="hipsolverDnDgetrf_bufferSize")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnDgetrf_bufferSize
    end function hipsolverDnDgetrf_bufferSize

    !---------------------------------------------
    ! hipsolverDnCgetrf_bufferSize
    !---------------------------------------------
    function hipsolverDnCgetrf_bufferSize(handle, m, n, A, lda, lwork) &
       result(DnCgetrf_bufferSize) &
       bind(C, name="hipsolverDnCgetrf_bufferSize")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnCgetrf_bufferSize
    end function hipsolverDnCgetrf_bufferSize

    !---------------------------------------------
    ! hipsolverDnZgetrf_bufferSize
    !---------------------------------------------
    function hipsolverDnZgetrf_bufferSize(handle, m, n, A, lda, lwork) &
       result(DnZgetrf_bufferSize) &
       bind(C, name="hipsolverDnZgetrf_bufferSize")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnZgetrf_bufferSize
    end function hipsolverDnZgetrf_bufferSize

    !---------------------------------------------
    ! hipsolverDnSgetrf
    !---------------------------------------------
    function hipsolverDnSgetrf(handle, m, n, A, lda, work, devIpiv, devInfo) &
       result(DnSgetrf) &
       bind(C, name="hipsolverDnSgetrf")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: work(*)
       integer(c_int) :: devIpiv(*)
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnSgetrf
    end function hipsolverDnSgetrf

    !---------------------------------------------
    ! hipsolverDnDgetrf
    !---------------------------------------------
    function hipsolverDnDgetrf(handle, m, n, A, lda, work, devIpiv, devInfo) &
       result(DnDgetrf) &
       bind(C, name="hipsolverDnDgetrf")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: work(*)
       integer(c_int) :: devIpiv(*)
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnDgetrf
    end function hipsolverDnDgetrf

    !---------------------------------------------
    ! hipsolverDnCgetrf
    !---------------------------------------------
    function hipsolverDnCgetrf(handle, m, n, A, lda, work, devIpiv, devInfo) &
       result(DnCgetrf) &
       bind(C, name="hipsolverDnCgetrf")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: work
       integer(c_int) :: devIpiv(*)
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnCgetrf
    end function hipsolverDnCgetrf

    !---------------------------------------------
    ! hipsolverDnZgetrf
    !---------------------------------------------
    function hipsolverDnZgetrf(handle, m, n, A, lda, work, devIpiv, devInfo) &
       result(DnZgetrf) &
       bind(C, name="hipsolverDnZgetrf")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: work
       integer(c_int) :: devIpiv(*)
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnZgetrf
    end function hipsolverDnZgetrf

    !---------------------------------------------
    ! hipsolverDnSgetrs
    !---------------------------------------------
    function hipsolverDnSgetrs(handle, trans, n, nrhs, A, lda, devIpiv, B, ldb, devInfo) &
       result(DnSgetrs) &
       bind(C, name="hipsolverDnSgetrs")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: trans
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: devIpiv(*)
       real(c_float) :: B(*)
       integer(c_int), value :: ldb
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnSgetrs
    end function hipsolverDnSgetrs

    !---------------------------------------------
    ! hipsolverDnDgetrs
    !---------------------------------------------
    function hipsolverDnDgetrs(handle, trans, n, nrhs, A, lda, devIpiv, B, ldb, devInfo) &
       result(DnDgetrs) &
       bind(C, name="hipsolverDnDgetrs")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: trans
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: devIpiv(*)
       real(c_double) :: B(*)
       integer(c_int), value :: ldb
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnDgetrs
    end function hipsolverDnDgetrs

    !---------------------------------------------
    ! hipsolverDnCgetrs
    !---------------------------------------------
    function hipsolverDnCgetrs(handle, trans, n, nrhs, A, lda, devIpiv, B, ldb, devInfo) &
       result(DnCgetrs) &
       bind(C, name="hipsolverDnCgetrs")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: trans
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: devIpiv(*)
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnCgetrs
    end function hipsolverDnCgetrs

    !---------------------------------------------
    ! hipsolverDnZgetrs
    !---------------------------------------------
    function hipsolverDnZgetrs(handle, trans, n, nrhs, A, lda, devIpiv, B, ldb, devInfo) &
       result(DnZgetrs) &
       bind(C, name="hipsolverDnZgetrs")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: trans
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: devIpiv(*)
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnZgetrs
    end function hipsolverDnZgetrs

    !---------------------------------------------
    ! hipsolverDnSpotrf_bufferSize
    !---------------------------------------------
    function hipsolverDnSpotrf_bufferSize(handle, uplo, n, A, lda, lwork) &
       result(DnSpotrf_bufferSize) &
       bind(C, name="hipsolverDnSpotrf_bufferSize")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnSpotrf_bufferSize
    end function hipsolverDnSpotrf_bufferSize

    !---------------------------------------------
    ! hipsolverDnDpotrf_bufferSize
    !---------------------------------------------
    function hipsolverDnDpotrf_bufferSize(handle, uplo, n, A, lda, lwork) &
       result(DnDpotrf_bufferSize) &
       bind(C, name="hipsolverDnDpotrf_bufferSize")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnDpotrf_bufferSize
    end function hipsolverDnDpotrf_bufferSize

    !---------------------------------------------
    ! hipsolverDnCpotrf_bufferSize
    !---------------------------------------------
    function hipsolverDnCpotrf_bufferSize(handle, uplo, n, A, lda, lwork) &
       result(DnCpotrf_bufferSize) &
       bind(C, name="hipsolverDnCpotrf_bufferSize")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnCpotrf_bufferSize
    end function hipsolverDnCpotrf_bufferSize

    !---------------------------------------------
    ! hipsolverDnZpotrf_bufferSize
    !---------------------------------------------
    function hipsolverDnZpotrf_bufferSize(handle, uplo, n, A, lda, lwork) &
       result(DnZpotrf_bufferSize) &
       bind(C, name="hipsolverDnZpotrf_bufferSize")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnZpotrf_bufferSize
    end function hipsolverDnZpotrf_bufferSize

    !---------------------------------------------
    ! hipsolverDnSpotrf
    !---------------------------------------------
    function hipsolverDnSpotrf(handle, uplo, n, A, lda, work, lwork, devInfo) &
       result(DnSpotrf) &
       bind(C, name="hipsolverDnSpotrf")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnSpotrf
    end function hipsolverDnSpotrf

    !---------------------------------------------
    ! hipsolverDnDpotrf
    !---------------------------------------------
    function hipsolverDnDpotrf(handle, uplo, n, A, lda, work, lwork, devInfo) &
       result(DnDpotrf) &
       bind(C, name="hipsolverDnDpotrf")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnDpotrf
    end function hipsolverDnDpotrf

    !---------------------------------------------
    ! hipsolverDnCpotrf
    !---------------------------------------------
    function hipsolverDnCpotrf(handle, uplo, n, A, lda, work, lwork, devInfo) &
       result(DnCpotrf) &
       bind(C, name="hipsolverDnCpotrf")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnCpotrf
    end function hipsolverDnCpotrf

    !---------------------------------------------
    ! hipsolverDnZpotrf
    !---------------------------------------------
    function hipsolverDnZpotrf(handle, uplo, n, A, lda, work, lwork, devInfo) &
       result(DnZpotrf) &
       bind(C, name="hipsolverDnZpotrf")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnZpotrf
    end function hipsolverDnZpotrf

    !---------------------------------------------
    ! hipsolverDnSpotrfBatched
    !---------------------------------------------
    function hipsolverDnSpotrfBatched(handle, uplo, n, A, lda, devInfo, batch_count) &
       result(DnSpotrfBatched) &
       bind(C, name="hipsolverDnSpotrfBatched")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: devInfo(*)
       integer(c_int), value :: batch_count
       integer(c_int) :: DnSpotrfBatched
    end function hipsolverDnSpotrfBatched

    !---------------------------------------------
    ! hipsolverDnDpotrfBatched
    !---------------------------------------------
    function hipsolverDnDpotrfBatched(handle, uplo, n, A, lda, devInfo, batch_count) &
       result(DnDpotrfBatched) &
       bind(C, name="hipsolverDnDpotrfBatched")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: devInfo(*)
       integer(c_int), value :: batch_count
       integer(c_int) :: DnDpotrfBatched
    end function hipsolverDnDpotrfBatched

    !---------------------------------------------
    ! hipsolverDnCpotrfBatched
    !---------------------------------------------
    function hipsolverDnCpotrfBatched(handle, uplo, n, A, lda, devInfo, batch_count) &
       result(DnCpotrfBatched) &
       bind(C, name="hipsolverDnCpotrfBatched")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: devInfo(*)
       integer(c_int), value :: batch_count
       integer(c_int) :: DnCpotrfBatched
    end function hipsolverDnCpotrfBatched

    !---------------------------------------------
    ! hipsolverDnZpotrfBatched
    !---------------------------------------------
    function hipsolverDnZpotrfBatched(handle, uplo, n, A, lda, devInfo, batch_count) &
       result(DnZpotrfBatched) &
       bind(C, name="hipsolverDnZpotrfBatched")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: devInfo(*)
       integer(c_int), value :: batch_count
       integer(c_int) :: DnZpotrfBatched
    end function hipsolverDnZpotrfBatched

    !---------------------------------------------
    ! hipsolverDnSpotri_bufferSize
    !---------------------------------------------
    function hipsolverDnSpotri_bufferSize(handle, uplo, n, A, lda, lwork) &
       result(DnSpotri_bufferSize) &
       bind(C, name="hipsolverDnSpotri_bufferSize")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnSpotri_bufferSize
    end function hipsolverDnSpotri_bufferSize

    !---------------------------------------------
    ! hipsolverDnDpotri_bufferSize
    !---------------------------------------------
    function hipsolverDnDpotri_bufferSize(handle, uplo, n, A, lda, lwork) &
       result(DnDpotri_bufferSize) &
       bind(C, name="hipsolverDnDpotri_bufferSize")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnDpotri_bufferSize
    end function hipsolverDnDpotri_bufferSize

    !---------------------------------------------
    ! hipsolverDnCpotri_bufferSize
    !---------------------------------------------
    function hipsolverDnCpotri_bufferSize(handle, uplo, n, A, lda, lwork) &
       result(DnCpotri_bufferSize) &
       bind(C, name="hipsolverDnCpotri_bufferSize")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnCpotri_bufferSize
    end function hipsolverDnCpotri_bufferSize

    !---------------------------------------------
    ! hipsolverDnZpotri_bufferSize
    !---------------------------------------------
    function hipsolverDnZpotri_bufferSize(handle, uplo, n, A, lda, lwork) &
       result(DnZpotri_bufferSize) &
       bind(C, name="hipsolverDnZpotri_bufferSize")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnZpotri_bufferSize
    end function hipsolverDnZpotri_bufferSize

    !---------------------------------------------
    ! hipsolverDnSpotri
    !---------------------------------------------
    function hipsolverDnSpotri(handle, uplo, n, A, lda, work, lwork, devInfo) &
       result(DnSpotri) &
       bind(C, name="hipsolverDnSpotri")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnSpotri
    end function hipsolverDnSpotri

    !---------------------------------------------
    ! hipsolverDnDpotri
    !---------------------------------------------
    function hipsolverDnDpotri(handle, uplo, n, A, lda, work, lwork, devInfo) &
       result(DnDpotri) &
       bind(C, name="hipsolverDnDpotri")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnDpotri
    end function hipsolverDnDpotri

    !---------------------------------------------
    ! hipsolverDnCpotri
    !---------------------------------------------
    function hipsolverDnCpotri(handle, uplo, n, A, lda, work, lwork, devInfo) &
       result(DnCpotri) &
       bind(C, name="hipsolverDnCpotri")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnCpotri
    end function hipsolverDnCpotri

    !---------------------------------------------
    ! hipsolverDnZpotri
    !---------------------------------------------
    function hipsolverDnZpotri(handle, uplo, n, A, lda, work, lwork, devInfo) &
       result(DnZpotri) &
       bind(C, name="hipsolverDnZpotri")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnZpotri
    end function hipsolverDnZpotri

    !---------------------------------------------
    ! hipsolverDnSpotrs
    !---------------------------------------------
    function hipsolverDnSpotrs(handle, uplo, n, nrhs, A, lda, B, ldb, devInfo) &
       result(DnSpotrs) &
       bind(C, name="hipsolverDnSpotrs")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: B(*)
       integer(c_int), value :: ldb
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnSpotrs
    end function hipsolverDnSpotrs

    !---------------------------------------------
    ! hipsolverDnDpotrs
    !---------------------------------------------
    function hipsolverDnDpotrs(handle, uplo, n, nrhs, A, lda, B, ldb, devInfo) &
       result(DnDpotrs) &
       bind(C, name="hipsolverDnDpotrs")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: B(*)
       integer(c_int), value :: ldb
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnDpotrs
    end function hipsolverDnDpotrs

    !---------------------------------------------
    ! hipsolverDnCpotrs
    !---------------------------------------------
    function hipsolverDnCpotrs(handle, uplo, n, nrhs, A, lda, B, ldb, devInfo) &
       result(DnCpotrs) &
       bind(C, name="hipsolverDnCpotrs")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnCpotrs
    end function hipsolverDnCpotrs

    !---------------------------------------------
    ! hipsolverDnZpotrs
    !---------------------------------------------
    function hipsolverDnZpotrs(handle, uplo, n, nrhs, A, lda, B, ldb, devInfo) &
       result(DnZpotrs) &
       bind(C, name="hipsolverDnZpotrs")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnZpotrs
    end function hipsolverDnZpotrs

    !---------------------------------------------
    ! hipsolverDnSpotrsBatched
    !---------------------------------------------
    function hipsolverDnSpotrsBatched(handle, uplo, n, nrhs, A, lda, B, ldb, devInfo, batch_count) &
       result(DnSpotrsBatched) &
       bind(C, name="hipsolverDnSpotrsBatched")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       integer(c_int) :: devInfo(*)
       integer(c_int), value :: batch_count
       integer(c_int) :: DnSpotrsBatched
    end function hipsolverDnSpotrsBatched

    !---------------------------------------------
    ! hipsolverDnDpotrsBatched
    !---------------------------------------------
    function hipsolverDnDpotrsBatched(handle, uplo, n, nrhs, A, lda, B, ldb, devInfo, batch_count) &
       result(DnDpotrsBatched) &
       bind(C, name="hipsolverDnDpotrsBatched")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       integer(c_int) :: devInfo(*)
       integer(c_int), value :: batch_count
       integer(c_int) :: DnDpotrsBatched
    end function hipsolverDnDpotrsBatched

    !---------------------------------------------
    ! hipsolverDnCpotrsBatched
    !---------------------------------------------
    function hipsolverDnCpotrsBatched(handle, uplo, n, nrhs, A, lda, B, ldb, devInfo, batch_count) &
       result(DnCpotrsBatched) &
       bind(C, name="hipsolverDnCpotrsBatched")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       integer(c_int) :: devInfo(*)
       integer(c_int), value :: batch_count
       integer(c_int) :: DnCpotrsBatched
    end function hipsolverDnCpotrsBatched

    !---------------------------------------------
    ! hipsolverDnZpotrsBatched
    !---------------------------------------------
    function hipsolverDnZpotrsBatched(handle, uplo, n, nrhs, A, lda, B, ldb, devInfo, batch_count) &
       result(DnZpotrsBatched) &
       bind(C, name="hipsolverDnZpotrsBatched")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       integer(c_int), value :: nrhs
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       integer(c_int) :: devInfo(*)
       integer(c_int), value :: batch_count
       integer(c_int) :: DnZpotrsBatched
    end function hipsolverDnZpotrsBatched

    !---------------------------------------------
    ! hipsolverDnSsyevd_bufferSize
    !---------------------------------------------
    function hipsolverDnSsyevd_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork) &
       result(DnSsyevd_bufferSize) &
       bind(C, name="hipsolverDnSsyevd_bufferSize")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: W(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnSsyevd_bufferSize
    end function hipsolverDnSsyevd_bufferSize

    !---------------------------------------------
    ! hipsolverDnDsyevd_bufferSize
    !---------------------------------------------
    function hipsolverDnDsyevd_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork) &
       result(DnDsyevd_bufferSize) &
       bind(C, name="hipsolverDnDsyevd_bufferSize")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: W(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnDsyevd_bufferSize
    end function hipsolverDnDsyevd_bufferSize

    !---------------------------------------------
    ! hipsolverDnCheevd_bufferSize
    !---------------------------------------------
    function hipsolverDnCheevd_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork) &
       result(DnCheevd_bufferSize) &
       bind(C, name="hipsolverDnCheevd_bufferSize")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float) :: W(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnCheevd_bufferSize
    end function hipsolverDnCheevd_bufferSize

    !---------------------------------------------
    ! hipsolverDnZheevd_bufferSize
    !---------------------------------------------
    function hipsolverDnZheevd_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork) &
       result(DnZheevd_bufferSize) &
       bind(C, name="hipsolverDnZheevd_bufferSize")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double) :: W(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnZheevd_bufferSize
    end function hipsolverDnZheevd_bufferSize

    !---------------------------------------------
    ! hipsolverDnSsyevd
    !---------------------------------------------
    function hipsolverDnSsyevd(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo) &
       result(DnSsyevd) &
       bind(C, name="hipsolverDnSsyevd")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: W(*)
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnSsyevd
    end function hipsolverDnSsyevd

    !---------------------------------------------
    ! hipsolverDnDsyevd
    !---------------------------------------------
    function hipsolverDnDsyevd(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo) &
       result(DnDsyevd) &
       bind(C, name="hipsolverDnDsyevd")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: W(*)
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnDsyevd
    end function hipsolverDnDsyevd

    !---------------------------------------------
    ! hipsolverDnCheevd
    !---------------------------------------------
    function hipsolverDnCheevd(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo) &
       result(DnCheevd) &
       bind(C, name="hipsolverDnCheevd")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float) :: W(*)
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnCheevd
    end function hipsolverDnCheevd

    !---------------------------------------------
    ! hipsolverDnZheevd
    !---------------------------------------------
    function hipsolverDnZheevd(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo) &
       result(DnZheevd) &
       bind(C, name="hipsolverDnZheevd")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double) :: W(*)
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnZheevd
    end function hipsolverDnZheevd

    !---------------------------------------------
    ! hipsolverDnSsyevdx_bufferSize
    !---------------------------------------------
    function hipsolverDnSsyevdx_bufferSize(handle, jobz, range, uplo, n, A, lda, vl, vu, il, iu, &
                                           nev, W, lwork) &
       result(DnSsyevdx_bufferSize) &
       bind(C, name="hipsolverDnSsyevdx_bufferSize")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: range
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float), value :: vl
       real(c_float), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev(*)
       real(c_float) :: W(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnSsyevdx_bufferSize
    end function hipsolverDnSsyevdx_bufferSize

    !---------------------------------------------
    ! hipsolverDnDsyevdx_bufferSize
    !---------------------------------------------
    function hipsolverDnDsyevdx_bufferSize(handle, jobz, range, uplo, n, A, lda, vl, vu, il, iu, &
                                           nev, W, lwork) &
       result(DnDsyevdx_bufferSize) &
       bind(C, name="hipsolverDnDsyevdx_bufferSize")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: range
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double), value :: vl
       real(c_double), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev(*)
       real(c_double) :: W(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnDsyevdx_bufferSize
    end function hipsolverDnDsyevdx_bufferSize

    !---------------------------------------------
    ! hipsolverDnCheevdx_bufferSize
    !---------------------------------------------
    function hipsolverDnCheevdx_bufferSize(handle, jobz, range, uplo, n, A, lda, vl, vu, il, iu, &
                                           nev, W, lwork) &
       result(DnCheevdx_bufferSize) &
       bind(C, name="hipsolverDnCheevdx_bufferSize")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: range
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float), value :: vl
       real(c_float), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev(*)
       real(c_float) :: W(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnCheevdx_bufferSize
    end function hipsolverDnCheevdx_bufferSize

    !---------------------------------------------
    ! hipsolverDnZheevdx_bufferSize
    !---------------------------------------------
    function hipsolverDnZheevdx_bufferSize(handle, jobz, range, uplo, n, A, lda, vl, vu, il, iu, &
                                           nev, W, lwork) &
       result(DnZheevdx_bufferSize) &
       bind(C, name="hipsolverDnZheevdx_bufferSize")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: range
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double), value :: vl
       real(c_double), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev(*)
       real(c_double) :: W(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnZheevdx_bufferSize
    end function hipsolverDnZheevdx_bufferSize

    !---------------------------------------------
    ! hipsolverDnSsyevdx
    !---------------------------------------------
    function hipsolverDnSsyevdx(handle, jobz, range, uplo, n, A, lda, vl, vu, il, iu, nev, W, &
                                work, lwork, devInfo) &
       result(DnSsyevdx) &
       bind(C, name="hipsolverDnSsyevdx")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: range
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float), value :: vl
       real(c_float), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev(*)
       real(c_float) :: W(*)
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnSsyevdx
    end function hipsolverDnSsyevdx

    !---------------------------------------------
    ! hipsolverDnDsyevdx
    !---------------------------------------------
    function hipsolverDnDsyevdx(handle, jobz, range, uplo, n, A, lda, vl, vu, il, iu, nev, W, &
                                work, lwork, devInfo) &
       result(DnDsyevdx) &
       bind(C, name="hipsolverDnDsyevdx")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: range
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double), value :: vl
       real(c_double), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev(*)
       real(c_double) :: W(*)
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnDsyevdx
    end function hipsolverDnDsyevdx

    !---------------------------------------------
    ! hipsolverDnCheevdx
    !---------------------------------------------
    function hipsolverDnCheevdx(handle, jobz, range, uplo, n, A, lda, vl, vu, il, iu, nev, W, &
                                work, lwork, devInfo) &
       result(DnCheevdx) &
       bind(C, name="hipsolverDnCheevdx")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: range
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float), value :: vl
       real(c_float), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev(*)
       real(c_float) :: W(*)
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnCheevdx
    end function hipsolverDnCheevdx

    !---------------------------------------------
    ! hipsolverDnZheevdx
    !---------------------------------------------
    function hipsolverDnZheevdx(handle, jobz, range, uplo, n, A, lda, vl, vu, il, iu, nev, W, &
                                work, lwork, devInfo) &
       result(DnZheevdx) &
       bind(C, name="hipsolverDnZheevdx")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: range
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double), value :: vl
       real(c_double), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev(*)
       real(c_double) :: W(*)
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnZheevdx
    end function hipsolverDnZheevdx

    !---------------------------------------------
    ! hipsolverDnSsyevj_bufferSize
    !---------------------------------------------
    function hipsolverDnSsyevj_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork, params) &
       result(DnSsyevj_bufferSize) &
       bind(C, name="hipsolverDnSsyevj_bufferSize")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: W(*)
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int) :: DnSsyevj_bufferSize
    end function hipsolverDnSsyevj_bufferSize

    !---------------------------------------------
    ! hipsolverDnDsyevj_bufferSize
    !---------------------------------------------
    function hipsolverDnDsyevj_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork, params) &
       result(DnDsyevj_bufferSize) &
       bind(C, name="hipsolverDnDsyevj_bufferSize")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: W(*)
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int) :: DnDsyevj_bufferSize
    end function hipsolverDnDsyevj_bufferSize

    !---------------------------------------------
    ! hipsolverDnCheevj_bufferSize
    !---------------------------------------------
    function hipsolverDnCheevj_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork, params) &
       result(DnCheevj_bufferSize) &
       bind(C, name="hipsolverDnCheevj_bufferSize")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float) :: W(*)
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int) :: DnCheevj_bufferSize
    end function hipsolverDnCheevj_bufferSize

    !---------------------------------------------
    ! hipsolverDnZheevj_bufferSize
    !---------------------------------------------
    function hipsolverDnZheevj_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork, params) &
       result(DnZheevj_bufferSize) &
       bind(C, name="hipsolverDnZheevj_bufferSize")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double) :: W(*)
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int) :: DnZheevj_bufferSize
    end function hipsolverDnZheevj_bufferSize

    !---------------------------------------------
    ! hipsolverDnSsyevj
    !---------------------------------------------
    function hipsolverDnSsyevj(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo, params) &
       result(DnSsyevj) &
       bind(C, name="hipsolverDnSsyevj")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: W(*)
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int) :: DnSsyevj
    end function hipsolverDnSsyevj

    !---------------------------------------------
    ! hipsolverDnDsyevj
    !---------------------------------------------
    function hipsolverDnDsyevj(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo, params) &
       result(DnDsyevj) &
       bind(C, name="hipsolverDnDsyevj")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: W(*)
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int) :: DnDsyevj
    end function hipsolverDnDsyevj

    !---------------------------------------------
    ! hipsolverDnCheevj
    !---------------------------------------------
    function hipsolverDnCheevj(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo, params) &
       result(DnCheevj) &
       bind(C, name="hipsolverDnCheevj")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float) :: W(*)
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int) :: DnCheevj
    end function hipsolverDnCheevj

    !---------------------------------------------
    ! hipsolverDnZheevj
    !---------------------------------------------
    function hipsolverDnZheevj(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo, params) &
       result(DnZheevj) &
       bind(C, name="hipsolverDnZheevj")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double) :: W(*)
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int) :: DnZheevj
    end function hipsolverDnZheevj

    !---------------------------------------------
    ! hipsolverDnSsyevjBatched_bufferSize
    !---------------------------------------------
    function hipsolverDnSsyevjBatched_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork, params, &
                                                 batch_count) &
       result(DnSsyevjBatched_bufferSize) &
       bind(C, name="hipsolverDnSsyevjBatched_bufferSize")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: W(*)
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(c_int) :: DnSsyevjBatched_bufferSize
    end function hipsolverDnSsyevjBatched_bufferSize

    !---------------------------------------------
    ! hipsolverDnDsyevjBatched_bufferSize
    !---------------------------------------------
    function hipsolverDnDsyevjBatched_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork, params, &
                                                 batch_count) &
       result(DnDsyevjBatched_bufferSize) &
       bind(C, name="hipsolverDnDsyevjBatched_bufferSize")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: W(*)
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(c_int) :: DnDsyevjBatched_bufferSize
    end function hipsolverDnDsyevjBatched_bufferSize

    !---------------------------------------------
    ! hipsolverDnCheevjBatched_bufferSize
    !---------------------------------------------
    function hipsolverDnCheevjBatched_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork, params, &
                                                 batch_count) &
       result(DnCheevjBatched_bufferSize) &
       bind(C, name="hipsolverDnCheevjBatched_bufferSize")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float) :: W(*)
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(c_int) :: DnCheevjBatched_bufferSize
    end function hipsolverDnCheevjBatched_bufferSize

    !---------------------------------------------
    ! hipsolverDnZheevjBatched_bufferSize
    !---------------------------------------------
    function hipsolverDnZheevjBatched_bufferSize(handle, jobz, uplo, n, A, lda, W, lwork, params, &
                                                 batch_count) &
       result(DnZheevjBatched_bufferSize) &
       bind(C, name="hipsolverDnZheevjBatched_bufferSize")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double) :: W(*)
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(c_int) :: DnZheevjBatched_bufferSize
    end function hipsolverDnZheevjBatched_bufferSize

    !---------------------------------------------
    ! hipsolverDnSsyevjBatched
    !---------------------------------------------
    function hipsolverDnSsyevjBatched(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo, &
                                      params, batch_count) &
       result(DnSsyevjBatched) &
       bind(C, name="hipsolverDnSsyevjBatched")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: W(*)
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(c_int) :: DnSsyevjBatched
    end function hipsolverDnSsyevjBatched

    !---------------------------------------------
    ! hipsolverDnDsyevjBatched
    !---------------------------------------------
    function hipsolverDnDsyevjBatched(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo, &
                                      params, batch_count) &
       result(DnDsyevjBatched) &
       bind(C, name="hipsolverDnDsyevjBatched")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: W(*)
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(c_int) :: DnDsyevjBatched
    end function hipsolverDnDsyevjBatched

    !---------------------------------------------
    ! hipsolverDnCheevjBatched
    !---------------------------------------------
    function hipsolverDnCheevjBatched(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo, &
                                      params, batch_count) &
       result(DnCheevjBatched) &
       bind(C, name="hipsolverDnCheevjBatched")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float) :: W(*)
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(c_int) :: DnCheevjBatched
    end function hipsolverDnCheevjBatched

    !---------------------------------------------
    ! hipsolverDnZheevjBatched
    !---------------------------------------------
    function hipsolverDnZheevjBatched(handle, jobz, uplo, n, A, lda, W, work, lwork, devInfo, &
                                      params, batch_count) &
       result(DnZheevjBatched) &
       bind(C, name="hipsolverDnZheevjBatched")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double) :: W(*)
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int), value :: batch_count
       integer(c_int) :: DnZheevjBatched
    end function hipsolverDnZheevjBatched

    !---------------------------------------------
    ! hipsolverDnSsygvd_bufferSize
    !---------------------------------------------
    function hipsolverDnSsygvd_bufferSize(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, lwork) &
       result(DnSsygvd_bufferSize) &
       bind(C, name="hipsolverDnSsygvd_bufferSize")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: B(*)
       integer(c_int), value :: ldb
       real(c_float) :: W(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnSsygvd_bufferSize
    end function hipsolverDnSsygvd_bufferSize

    !---------------------------------------------
    ! hipsolverDnDsygvd_bufferSize
    !---------------------------------------------
    function hipsolverDnDsygvd_bufferSize(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, lwork) &
       result(DnDsygvd_bufferSize) &
       bind(C, name="hipsolverDnDsygvd_bufferSize")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: B(*)
       integer(c_int), value :: ldb
       real(c_double) :: W(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnDsygvd_bufferSize
    end function hipsolverDnDsygvd_bufferSize

    !---------------------------------------------
    ! hipsolverDnChegvd_bufferSize
    !---------------------------------------------
    function hipsolverDnChegvd_bufferSize(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, lwork) &
       result(DnChegvd_bufferSize) &
       bind(C, name="hipsolverDnChegvd_bufferSize")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_float) :: W(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnChegvd_bufferSize
    end function hipsolverDnChegvd_bufferSize

    !---------------------------------------------
    ! hipsolverDnZhegvd_bufferSize
    !---------------------------------------------
    function hipsolverDnZhegvd_bufferSize(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, lwork) &
       result(DnZhegvd_bufferSize) &
       bind(C, name="hipsolverDnZhegvd_bufferSize")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_double) :: W(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnZhegvd_bufferSize
    end function hipsolverDnZhegvd_bufferSize

    !---------------------------------------------
    ! hipsolverDnSsygvd
    !---------------------------------------------
    function hipsolverDnSsygvd(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, work, lwork, &
                               devInfo) &
       result(DnSsygvd) &
       bind(C, name="hipsolverDnSsygvd")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: B(*)
       integer(c_int), value :: ldb
       real(c_float) :: W(*)
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnSsygvd
    end function hipsolverDnSsygvd

    !---------------------------------------------
    ! hipsolverDnDsygvd
    !---------------------------------------------
    function hipsolverDnDsygvd(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, work, lwork, &
                               devInfo) &
       result(DnDsygvd) &
       bind(C, name="hipsolverDnDsygvd")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: B(*)
       integer(c_int), value :: ldb
       real(c_double) :: W(*)
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnDsygvd
    end function hipsolverDnDsygvd

    !---------------------------------------------
    ! hipsolverDnChegvd
    !---------------------------------------------
    function hipsolverDnChegvd(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, work, lwork, &
                               devInfo) &
       result(DnChegvd) &
       bind(C, name="hipsolverDnChegvd")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_float) :: W(*)
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnChegvd
    end function hipsolverDnChegvd

    !---------------------------------------------
    ! hipsolverDnZhegvd
    !---------------------------------------------
    function hipsolverDnZhegvd(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, work, lwork, &
                               devInfo) &
       result(DnZhegvd) &
       bind(C, name="hipsolverDnZhegvd")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_double) :: W(*)
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnZhegvd
    end function hipsolverDnZhegvd

    !---------------------------------------------
    ! hipsolverDnSsygvdx_bufferSize
    !---------------------------------------------
    function hipsolverDnSsygvdx_bufferSize(handle, itype, jobz, range, uplo, n, A, lda, B, ldb, &
                                           vl, vu, il, iu, nev, W, lwork) &
       result(DnSsygvdx_bufferSize) &
       bind(C, name="hipsolverDnSsygvdx_bufferSize")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: range
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: B(*)
       integer(c_int), value :: ldb
       real(c_float), value :: vl
       real(c_float), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev(*)
       real(c_float) :: W(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnSsygvdx_bufferSize
    end function hipsolverDnSsygvdx_bufferSize

    !---------------------------------------------
    ! hipsolverDnDsygvdx_bufferSize
    !---------------------------------------------
    function hipsolverDnDsygvdx_bufferSize(handle, itype, jobz, range, uplo, n, A, lda, B, ldb, &
                                           vl, vu, il, iu, nev, W, lwork) &
       result(DnDsygvdx_bufferSize) &
       bind(C, name="hipsolverDnDsygvdx_bufferSize")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: range
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: B(*)
       integer(c_int), value :: ldb
       real(c_double), value :: vl
       real(c_double), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev(*)
       real(c_double) :: W(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnDsygvdx_bufferSize
    end function hipsolverDnDsygvdx_bufferSize

    !---------------------------------------------
    ! hipsolverDnChegvdx_bufferSize
    !---------------------------------------------
    function hipsolverDnChegvdx_bufferSize(handle, itype, jobz, range, uplo, n, A, lda, B, ldb, &
                                           vl, vu, il, iu, nev, W, lwork) &
       result(DnChegvdx_bufferSize) &
       bind(C, name="hipsolverDnChegvdx_bufferSize")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: range
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_float), value :: vl
       real(c_float), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev(*)
       real(c_float) :: W(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnChegvdx_bufferSize
    end function hipsolverDnChegvdx_bufferSize

    !---------------------------------------------
    ! hipsolverDnZhegvdx_bufferSize
    !---------------------------------------------
    function hipsolverDnZhegvdx_bufferSize(handle, itype, jobz, range, uplo, n, A, lda, B, ldb, &
                                           vl, vu, il, iu, nev, W, lwork) &
       result(DnZhegvdx_bufferSize) &
       bind(C, name="hipsolverDnZhegvdx_bufferSize")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: range
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_double), value :: vl
       real(c_double), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev(*)
       real(c_double) :: W(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnZhegvdx_bufferSize
    end function hipsolverDnZhegvdx_bufferSize

    !---------------------------------------------
    ! hipsolverDnSsygvdx
    !---------------------------------------------
    function hipsolverDnSsygvdx(handle, itype, jobz, range, uplo, n, A, lda, B, ldb, vl, vu, il, &
                                iu, nev, W, work, lwork, devInfo) &
       result(DnSsygvdx) &
       bind(C, name="hipsolverDnSsygvdx")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: range
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: B(*)
       integer(c_int), value :: ldb
       real(c_float), value :: vl
       real(c_float), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev(*)
       real(c_float) :: W(*)
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnSsygvdx
    end function hipsolverDnSsygvdx

    !---------------------------------------------
    ! hipsolverDnDsygvdx
    !---------------------------------------------
    function hipsolverDnDsygvdx(handle, itype, jobz, range, uplo, n, A, lda, B, ldb, vl, vu, il, &
                                iu, nev, W, work, lwork, devInfo) &
       result(DnDsygvdx) &
       bind(C, name="hipsolverDnDsygvdx")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: range
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: B(*)
       integer(c_int), value :: ldb
       real(c_double), value :: vl
       real(c_double), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev(*)
       real(c_double) :: W(*)
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnDsygvdx
    end function hipsolverDnDsygvdx

    !---------------------------------------------
    ! hipsolverDnChegvdx
    !---------------------------------------------
    function hipsolverDnChegvdx(handle, itype, jobz, range, uplo, n, A, lda, B, ldb, vl, vu, il, &
                                iu, nev, W, work, lwork, devInfo) &
       result(DnChegvdx) &
       bind(C, name="hipsolverDnChegvdx")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: range
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_float), value :: vl
       real(c_float), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev(*)
       real(c_float) :: W(*)
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnChegvdx
    end function hipsolverDnChegvdx

    !---------------------------------------------
    ! hipsolverDnZhegvdx
    !---------------------------------------------
    function hipsolverDnZhegvdx(handle, itype, jobz, range, uplo, n, A, lda, B, ldb, vl, vu, il, &
                                iu, nev, W, work, lwork, devInfo) &
       result(DnZhegvdx) &
       bind(C, name="hipsolverDnZhegvdx")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: range
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_double), value :: vl
       real(c_double), value :: vu
       integer(c_int), value :: il
       integer(c_int), value :: iu
       integer(c_int) :: nev(*)
       real(c_double) :: W(*)
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnZhegvdx
    end function hipsolverDnZhegvdx

    !---------------------------------------------
    ! hipsolverDnSsygvj_bufferSize
    !---------------------------------------------
    function hipsolverDnSsygvj_bufferSize(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, lwork, &
                                          params) &
       result(DnSsygvj_bufferSize) &
       bind(C, name="hipsolverDnSsygvj_bufferSize")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: B(*)
       integer(c_int), value :: ldb
       real(c_float) :: W(*)
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int) :: DnSsygvj_bufferSize
    end function hipsolverDnSsygvj_bufferSize

    !---------------------------------------------
    ! hipsolverDnDsygvj_bufferSize
    !---------------------------------------------
    function hipsolverDnDsygvj_bufferSize(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, lwork, &
                                          params) &
       result(DnDsygvj_bufferSize) &
       bind(C, name="hipsolverDnDsygvj_bufferSize")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: B(*)
       integer(c_int), value :: ldb
       real(c_double) :: W(*)
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int) :: DnDsygvj_bufferSize
    end function hipsolverDnDsygvj_bufferSize

    !---------------------------------------------
    ! hipsolverDnChegvj_bufferSize
    !---------------------------------------------
    function hipsolverDnChegvj_bufferSize(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, lwork, &
                                          params) &
       result(DnChegvj_bufferSize) &
       bind(C, name="hipsolverDnChegvj_bufferSize")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_float) :: W(*)
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int) :: DnChegvj_bufferSize
    end function hipsolverDnChegvj_bufferSize

    !---------------------------------------------
    ! hipsolverDnZhegvj_bufferSize
    !---------------------------------------------
    function hipsolverDnZhegvj_bufferSize(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, lwork, &
                                          params) &
       result(DnZhegvj_bufferSize) &
       bind(C, name="hipsolverDnZhegvj_bufferSize")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_double) :: W(*)
       integer(c_int) :: lwork(*)
       type(c_ptr), value :: params
       integer(c_int) :: DnZhegvj_bufferSize
    end function hipsolverDnZhegvj_bufferSize

    !---------------------------------------------
    ! hipsolverDnSsygvj
    !---------------------------------------------
    function hipsolverDnSsygvj(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, work, lwork, &
                               devInfo, params) &
       result(DnSsygvj) &
       bind(C, name="hipsolverDnSsygvj")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: B(*)
       integer(c_int), value :: ldb
       real(c_float) :: W(*)
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int) :: DnSsygvj
    end function hipsolverDnSsygvj

    !---------------------------------------------
    ! hipsolverDnDsygvj
    !---------------------------------------------
    function hipsolverDnDsygvj(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, work, lwork, &
                               devInfo, params) &
       result(DnDsygvj) &
       bind(C, name="hipsolverDnDsygvj")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: B(*)
       integer(c_int), value :: ldb
       real(c_double) :: W(*)
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int) :: DnDsygvj
    end function hipsolverDnDsygvj

    !---------------------------------------------
    ! hipsolverDnChegvj
    !---------------------------------------------
    function hipsolverDnChegvj(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, work, lwork, &
                               devInfo, params) &
       result(DnChegvj) &
       bind(C, name="hipsolverDnChegvj")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_float) :: W(*)
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int) :: DnChegvj
    end function hipsolverDnChegvj

    !---------------------------------------------
    ! hipsolverDnZhegvj
    !---------------------------------------------
    function hipsolverDnZhegvj(handle, itype, jobz, uplo, n, A, lda, B, ldb, W, work, lwork, &
                               devInfo, params) &
       result(DnZhegvj) &
       bind(C, name="hipsolverDnZhegvj")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: itype
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       real(c_double) :: W(*)
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       type(c_ptr), value :: params
       integer(c_int) :: DnZhegvj
    end function hipsolverDnZhegvj

    !---------------------------------------------
    ! hipsolverDnSsytrd_bufferSize
    !---------------------------------------------
    function hipsolverDnSsytrd_bufferSize(handle, uplo, n, A, lda, D, E, tau, lwork) &
       result(DnSsytrd_bufferSize) &
       bind(C, name="hipsolverDnSsytrd_bufferSize")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: D(*)
       real(c_float) :: E(*)
       real(c_float) :: tau(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnSsytrd_bufferSize
    end function hipsolverDnSsytrd_bufferSize

    !---------------------------------------------
    ! hipsolverDnDsytrd_bufferSize
    !---------------------------------------------
    function hipsolverDnDsytrd_bufferSize(handle, uplo, n, A, lda, D, E, tau, lwork) &
       result(DnDsytrd_bufferSize) &
       bind(C, name="hipsolverDnDsytrd_bufferSize")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: D(*)
       real(c_double) :: E(*)
       real(c_double) :: tau(*)
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnDsytrd_bufferSize
    end function hipsolverDnDsytrd_bufferSize

    !---------------------------------------------
    ! hipsolverDnChetrd_bufferSize
    !---------------------------------------------
    function hipsolverDnChetrd_bufferSize(handle, uplo, n, A, lda, D, E, tau, lwork) &
       result(DnChetrd_bufferSize) &
       bind(C, name="hipsolverDnChetrd_bufferSize")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float) :: D(*)
       real(c_float) :: E(*)
       type(c_ptr), value :: tau
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnChetrd_bufferSize
    end function hipsolverDnChetrd_bufferSize

    !---------------------------------------------
    ! hipsolverDnZhetrd_bufferSize
    !---------------------------------------------
    function hipsolverDnZhetrd_bufferSize(handle, uplo, n, A, lda, D, E, tau, lwork) &
       result(DnZhetrd_bufferSize) &
       bind(C, name="hipsolverDnZhetrd_bufferSize")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double) :: D(*)
       real(c_double) :: E(*)
       type(c_ptr), value :: tau
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnZhetrd_bufferSize
    end function hipsolverDnZhetrd_bufferSize

    !---------------------------------------------
    ! hipsolverDnSsytrd
    !---------------------------------------------
    function hipsolverDnSsytrd(handle, uplo, n, A, lda, D, E, tau, work, lwork, devInfo) &
       result(DnSsytrd) &
       bind(C, name="hipsolverDnSsytrd")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: D(*)
       real(c_float) :: E(*)
       real(c_float) :: tau(*)
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnSsytrd
    end function hipsolverDnSsytrd

    !---------------------------------------------
    ! hipsolverDnDsytrd
    !---------------------------------------------
    function hipsolverDnDsytrd(handle, uplo, n, A, lda, D, E, tau, work, lwork, devInfo) &
       result(DnDsytrd) &
       bind(C, name="hipsolverDnDsytrd")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: D(*)
       real(c_double) :: E(*)
       real(c_double) :: tau(*)
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnDsytrd
    end function hipsolverDnDsytrd

    !---------------------------------------------
    ! hipsolverDnChetrd
    !---------------------------------------------
    function hipsolverDnChetrd(handle, uplo, n, A, lda, D, E, tau, work, lwork, devInfo) &
       result(DnChetrd) &
       bind(C, name="hipsolverDnChetrd")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_float) :: D(*)
       real(c_float) :: E(*)
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnChetrd
    end function hipsolverDnChetrd

    !---------------------------------------------
    ! hipsolverDnZhetrd
    !---------------------------------------------
    function hipsolverDnZhetrd(handle, uplo, n, A, lda, D, E, tau, work, lwork, devInfo) &
       result(DnZhetrd) &
       bind(C, name="hipsolverDnZhetrd")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       real(c_double) :: D(*)
       real(c_double) :: E(*)
       type(c_ptr), value :: tau
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnZhetrd
    end function hipsolverDnZhetrd

    !---------------------------------------------
    ! hipsolverDnSsytrf_bufferSize
    !---------------------------------------------
    function hipsolverDnSsytrf_bufferSize(handle, n, A, lda, lwork) &
       result(DnSsytrf_bufferSize) &
       bind(C, name="hipsolverDnSsytrf_bufferSize")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnSsytrf_bufferSize
    end function hipsolverDnSsytrf_bufferSize

    !---------------------------------------------
    ! hipsolverDnDsytrf_bufferSize
    !---------------------------------------------
    function hipsolverDnDsytrf_bufferSize(handle, n, A, lda, lwork) &
       result(DnDsytrf_bufferSize) &
       bind(C, name="hipsolverDnDsytrf_bufferSize")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnDsytrf_bufferSize
    end function hipsolverDnDsytrf_bufferSize

    !---------------------------------------------
    ! hipsolverDnCsytrf_bufferSize
    !---------------------------------------------
    function hipsolverDnCsytrf_bufferSize(handle, n, A, lda, lwork) &
       result(DnCsytrf_bufferSize) &
       bind(C, name="hipsolverDnCsytrf_bufferSize")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnCsytrf_bufferSize
    end function hipsolverDnCsytrf_bufferSize

    !---------------------------------------------
    ! hipsolverDnZsytrf_bufferSize
    !---------------------------------------------
    function hipsolverDnZsytrf_bufferSize(handle, n, A, lda, lwork) &
       result(DnZsytrf_bufferSize) &
       bind(C, name="hipsolverDnZsytrf_bufferSize")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: lwork(*)
       integer(c_int) :: DnZsytrf_bufferSize
    end function hipsolverDnZsytrf_bufferSize

    !---------------------------------------------
    ! hipsolverDnSsytrf
    !---------------------------------------------
    function hipsolverDnSsytrf(handle, uplo, n, A, lda, ipiv, work, lwork, devInfo) &
       result(DnSsytrf) &
       bind(C, name="hipsolverDnSsytrf")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: ipiv(*)
       real(c_float) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnSsytrf
    end function hipsolverDnSsytrf

    !---------------------------------------------
    ! hipsolverDnDsytrf
    !---------------------------------------------
    function hipsolverDnDsytrf(handle, uplo, n, A, lda, ipiv, work, lwork, devInfo) &
       result(DnDsytrf) &
       bind(C, name="hipsolverDnDsytrf")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: ipiv(*)
       real(c_double) :: work(*)
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnDsytrf
    end function hipsolverDnDsytrf

    !---------------------------------------------
    ! hipsolverDnCsytrf
    !---------------------------------------------
    function hipsolverDnCsytrf(handle, uplo, n, A, lda, ipiv, work, lwork, devInfo) &
       result(DnCsytrf) &
       bind(C, name="hipsolverDnCsytrf")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: ipiv(*)
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnCsytrf
    end function hipsolverDnCsytrf

    !---------------------------------------------
    ! hipsolverDnZsytrf
    !---------------------------------------------
    function hipsolverDnZsytrf(handle, uplo, n, A, lda, ipiv, work, lwork, devInfo) &
       result(DnZsytrf) &
       bind(C, name="hipsolverDnZsytrf")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_int), value :: n
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: ipiv(*)
       type(c_ptr), value :: work
       integer(c_int), value :: lwork
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnZsytrf
    end function hipsolverDnZsytrf

    !---------------------------------------------
    ! hipsolverDnCreateParams
    !---------------------------------------------
    function hipsolverDnCreateParams(params) &
       result(DnCreateParams) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDnCreateParams")
#else
       bind(C, name="hipsolverDnCreateParams")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: params
       integer(c_int) :: DnCreateParams
    end function hipsolverDnCreateParams

    !---------------------------------------------
    ! hipsolverDnDestroyParams
    !---------------------------------------------
    function hipsolverDnDestroyParams(params) &
       result(DnDestroyParams) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDnDestroyParams")
#else
       bind(C, name="hipsolverDnDestroyParams")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: params
       integer(c_int) :: DnDestroyParams
    end function hipsolverDnDestroyParams

    !---------------------------------------------
    ! hipsolverDnSetAdvOptions
    !---------------------------------------------
    function hipsolverDnSetAdvOptions(params, func, alg) &
       result(DnSetAdvOptions) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDnSetAdvOptions")
#else
       bind(C, name="hipsolverDnSetAdvOptions")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: params
       integer(c_int), value :: func
       integer(c_int), value :: alg
       integer(c_int) :: DnSetAdvOptions
    end function hipsolverDnSetAdvOptions

    !---------------------------------------------
    ! hipsolverDnXgeev_bufferSize
    !---------------------------------------------
    function hipsolverDnXgeev_bufferSize(handle, params, jobvl, jobvr, n, dataTypeA, A, lda, &
                                         dataTypeW, W, dataTypeVL, VL, ldvl, dataTypeVR, VR, ldvr, &
                                         computeType, lworkOnDevice, lworkOnHost) &
       result(DnXgeev_bufferSize) &
       bind(C, name="hipsolverDnXgeev_bufferSize")
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: handle
       type(c_ptr), value :: params
       integer(c_int), value :: jobvl
       integer(c_int), value :: jobvr
       integer(c_long), value :: n
       integer(c_int), value :: dataTypeA
       type(c_ptr), value :: A
       integer(c_long), value :: lda
       integer(c_int), value :: dataTypeW
       type(c_ptr), value :: W
       integer(c_int), value :: dataTypeVL
       type(c_ptr), value :: VL
       integer(c_long), value :: ldvl
       integer(c_int), value :: dataTypeVR
       type(c_ptr), value :: VR
       integer(c_long), value :: ldvr
       integer(c_int), value :: computeType
       type(c_ptr), value :: lworkOnDevice
       type(c_ptr), value :: lworkOnHost
       integer(c_int) :: DnXgeev_bufferSize
    end function hipsolverDnXgeev_bufferSize

    !---------------------------------------------
    ! hipsolverDnXgeev
    !---------------------------------------------
    function hipsolverDnXgeev(handle, params, jobvl, jobvr, n, dataTypeA, A, lda, dataTypeW, W, &
                              dataTypeVL, VL, ldvl, dataTypeVR, VR, ldvr, computeType, &
                              workOnDevice, lworkOnDevice, workOnHost, lworkOnHost, devInfo) &
       result(DnXgeev) &
       bind(C, name="hipsolverDnXgeev")
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: handle
       type(c_ptr), value :: params
       integer(c_int), value :: jobvl
       integer(c_int), value :: jobvr
       integer(c_long), value :: n
       integer(c_int), value :: dataTypeA
       type(c_ptr), value :: A
       integer(c_long), value :: lda
       integer(c_int), value :: dataTypeW
       type(c_ptr), value :: W
       integer(c_int), value :: dataTypeVL
       type(c_ptr), value :: VL
       integer(c_long), value :: ldvl
       integer(c_int), value :: dataTypeVR
       type(c_ptr), value :: VR
       integer(c_long), value :: ldvr
       integer(c_int), value :: computeType
       type(c_ptr), value :: workOnDevice
       integer(c_long), value :: lworkOnDevice
       type(c_ptr), value :: workOnHost
       integer(c_long), value :: lworkOnHost
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnXgeev
    end function hipsolverDnXgeev

    !---------------------------------------------
    ! hipsolverDnXgeqrf_bufferSize
    !---------------------------------------------
    function hipsolverDnXgeqrf_bufferSize(handle, params, m, n, dataTypeA, A, lda, dataTypeTau, &
                                          tau, computeType, lworkOnDevice, lworkOnHost) &
       result(DnXgeqrf_bufferSize) &
       bind(C, name="hipsolverDnXgeqrf_bufferSize")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: params
       integer(c_long), value :: m
       integer(c_long), value :: n
       integer(c_int), value :: dataTypeA
       type(c_ptr), value :: A
       integer(c_long), value :: lda
       integer(c_int), value :: dataTypeTau
       type(c_ptr), value :: tau
       integer(c_int), value :: computeType
       type(c_ptr), value :: lworkOnDevice
       type(c_ptr), value :: lworkOnHost
       integer(c_int) :: DnXgeqrf_bufferSize
    end function hipsolverDnXgeqrf_bufferSize

    !---------------------------------------------
    ! hipsolverDnXgeqrf
    !---------------------------------------------
    function hipsolverDnXgeqrf(handle, params, m, n, dataTypeA, A, lda, dataTypeTau, tau, &
                               computeType, workOnDevice, lworkOnDevice, workOnHost, lworkOnHost, &
                               devInfo) &
       result(DnXgeqrf) &
       bind(C, name="hipsolverDnXgeqrf")
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: params
       integer(c_long), value :: m
       integer(c_long), value :: n
       integer(c_int), value :: dataTypeA
       type(c_ptr), value :: A
       integer(c_long), value :: lda
       integer(c_int), value :: dataTypeTau
       type(c_ptr), value :: tau
       integer(c_int), value :: computeType
       type(c_ptr), value :: workOnDevice
       integer(c_long), value :: lworkOnDevice
       type(c_ptr), value :: workOnHost
       integer(c_long), value :: lworkOnHost
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnXgeqrf
    end function hipsolverDnXgeqrf

    !---------------------------------------------
    ! hipsolverDnXgetrf_bufferSize
    !---------------------------------------------
    function hipsolverDnXgetrf_bufferSize(handle, params, m, n, dataTypeA, A, lda, computeType, &
                                          lworkOnDevice, lworkOnHost) &
       result(DnXgetrf_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDnXgetrf_bufferSize")
#else
       bind(C, name="hipsolverDnXgetrf_bufferSize")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: params
       integer(c_long), value :: m
       integer(c_long), value :: n
       integer(c_int), value :: dataTypeA
       type(c_ptr), value :: A
       integer(c_long), value :: lda
       integer(c_int), value :: computeType
       type(c_ptr), value :: lworkOnDevice
       type(c_ptr), value :: lworkOnHost
       integer(c_int) :: DnXgetrf_bufferSize
    end function hipsolverDnXgetrf_bufferSize

    !---------------------------------------------
    ! hipsolverDnXgetrf
    !---------------------------------------------
    function hipsolverDnXgetrf(handle, params, m, n, dataTypeA, A, lda, devIpiv, computeType, &
                               workOnDevice, lworkOnDevice, workOnHost, lworkOnHost, devInfo) &
       result(DnXgetrf) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDnXgetrf")
#else
       bind(C, name="hipsolverDnXgetrf")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: params
       integer(c_long), value :: m
       integer(c_long), value :: n
       integer(c_int), value :: dataTypeA
       type(c_ptr), value :: A
       integer(c_long), value :: lda
       type(c_ptr), value :: devIpiv
       integer(c_int), value :: computeType
       type(c_ptr), value :: workOnDevice
       integer(c_long), value :: lworkOnDevice
       type(c_ptr), value :: workOnHost
       integer(c_long), value :: lworkOnHost
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnXgetrf
    end function hipsolverDnXgetrf

    !---------------------------------------------
    ! hipsolverDnXgetrs
    !---------------------------------------------
    function hipsolverDnXgetrs(handle, params, trans, n, nrhs, dataTypeA, A, lda, devIpiv, &
                               dataTypeB, B, ldb, devInfo) &
       result(DnXgetrs) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverDnXgetrs")
#else
       bind(C, name="hipsolverDnXgetrs")
#endif
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: handle
       type(c_ptr), value :: params
       integer(c_int), value :: trans
       integer(c_long), value :: n
       integer(c_long), value :: nrhs
       integer(c_int), value :: dataTypeA
       type(c_ptr), value :: A
       integer(c_long), value :: lda
       type(c_ptr), value :: devIpiv
       integer(c_int), value :: dataTypeB
       type(c_ptr), value :: B
       integer(c_long), value :: ldb
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnXgetrs
    end function hipsolverDnXgetrs

    !---------------------------------------------
    ! hipsolverDnXpotrf_bufferSize
    !---------------------------------------------
    function hipsolverDnXpotrf_bufferSize(handle, params, uplo, n, dataTypeA, A, lda, computeType, &
                                          lworkOnDevice, lworkOnHost) &
       result(DnXpotrf_bufferSize) &
       bind(C, name="hipsolverDnXpotrf_bufferSize")
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: handle
       type(c_ptr), value :: params
       integer(c_int), value :: uplo
       integer(c_long), value :: n
       integer(c_int), value :: dataTypeA
       type(c_ptr), value :: A
       integer(c_long), value :: lda
       integer(c_int), value :: computeType
       type(c_ptr), value :: lworkOnDevice
       type(c_ptr), value :: lworkOnHost
       integer(c_int) :: DnXpotrf_bufferSize
    end function hipsolverDnXpotrf_bufferSize

    !---------------------------------------------
    ! hipsolverDnXpotrf
    !---------------------------------------------
    function hipsolverDnXpotrf(handle, params, uplo, n, dataTypeA, A, lda, computeType, &
                               workOnDevice, lworkOnDevice, workOnHost, lworkOnHost, info) &
       result(DnXpotrf) &
       bind(C, name="hipsolverDnXpotrf")
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: handle
       type(c_ptr), value :: params
       integer(c_int), value :: uplo
       integer(c_long), value :: n
       integer(c_int), value :: dataTypeA
       type(c_ptr), value :: A
       integer(c_long), value :: lda
       integer(c_int), value :: computeType
       type(c_ptr), value :: workOnDevice
       integer(c_long), value :: lworkOnDevice
       type(c_ptr), value :: workOnHost
       integer(c_long), value :: lworkOnHost
       integer(c_int) :: info(*)
       integer(c_int) :: DnXpotrf
    end function hipsolverDnXpotrf

    !---------------------------------------------
    ! hipsolverDnXpotrs
    !---------------------------------------------
    function hipsolverDnXpotrs(handle, params, uplo, n, nrhs, dataTypeA, A, lda, dataTypeB, B, &
                               ldb, info) &
       result(DnXpotrs) &
       bind(C, name="hipsolverDnXpotrs")
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: handle
       type(c_ptr), value :: params
       integer(c_int), value :: uplo
       integer(c_long), value :: n
       integer(c_long), value :: nrhs
       integer(c_int), value :: dataTypeA
       type(c_ptr), value :: A
       integer(c_long), value :: lda
       integer(c_int), value :: dataTypeB
       type(c_ptr), value :: B
       integer(c_long), value :: ldb
       integer(c_int) :: info(*)
       integer(c_int) :: DnXpotrs
    end function hipsolverDnXpotrs

    !---------------------------------------------
    ! hipsolverDnXsyevd_bufferSize
    !---------------------------------------------
    function hipsolverDnXsyevd_bufferSize(handle, params, jobz, uplo, n, dataTypeA, A, lda, &
                                          dataTypeW, W, computeType, lworkOnDevice, lworkOnHost) &
       result(DnXsyevd_bufferSize) &
       bind(C, name="hipsolverDnXsyevd_bufferSize")
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: handle
       type(c_ptr), value :: params
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_long), value :: n
       integer(c_int), value :: dataTypeA
       type(c_ptr), value :: A
       integer(c_long), value :: lda
       integer(c_int), value :: dataTypeW
       type(c_ptr), value :: W
       integer(c_int), value :: computeType
       type(c_ptr), value :: lworkOnDevice
       type(c_ptr), value :: lworkOnHost
       integer(c_int) :: DnXsyevd_bufferSize
    end function hipsolverDnXsyevd_bufferSize

    !---------------------------------------------
    ! hipsolverDnXsyevd
    !---------------------------------------------
    function hipsolverDnXsyevd(handle, params, jobz, uplo, n, dataTypeA, A, lda, dataTypeW, W, &
                               computeType, workOnDevice, lworkOnDevice, workOnHost, lworkOnHost, &
                               devInfo) &
       result(DnXsyevd) &
       bind(C, name="hipsolverDnXsyevd")
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: handle
       type(c_ptr), value :: params
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_long), value :: n
       integer(c_int), value :: dataTypeA
       type(c_ptr), value :: A
       integer(c_long), value :: lda
       integer(c_int), value :: dataTypeW
       type(c_ptr), value :: W
       integer(c_int), value :: computeType
       type(c_ptr), value :: workOnDevice
       integer(c_long), value :: lworkOnDevice
       type(c_ptr), value :: workOnHost
       integer(c_long), value :: lworkOnHost
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnXsyevd
    end function hipsolverDnXsyevd

    !---------------------------------------------
    ! hipsolverDnXsyevBatched_bufferSize
    !---------------------------------------------
    function hipsolverDnXsyevBatched_bufferSize(handle, params, jobz, uplo, n, dataTypeA, A, lda, &
                                                dataTypeW, W, computeType, lworkOnDevice, &
                                                lworkOnHost, batchSize) &
       result(DnXsyevBatched_bufferSize) &
       bind(C, name="hipsolverDnXsyevBatched_bufferSize")
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: handle
       type(c_ptr), value :: params
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_long), value :: n
       integer(c_int), value :: dataTypeA
       type(c_ptr), value :: A
       integer(c_long), value :: lda
       integer(c_int), value :: dataTypeW
       type(c_ptr), value :: W
       integer(c_int), value :: computeType
       type(c_ptr), value :: lworkOnDevice
       type(c_ptr), value :: lworkOnHost
       integer(c_long), value :: batchSize
       integer(c_int) :: DnXsyevBatched_bufferSize
    end function hipsolverDnXsyevBatched_bufferSize

    !---------------------------------------------
    ! hipsolverDnXsyevBatched
    !---------------------------------------------
    function hipsolverDnXsyevBatched(handle, params, jobz, uplo, n, dataTypeA, A, lda, dataTypeW, &
                                     W, computeType, workOnDevice, lworkOnDevice, workOnHost, &
                                     lworkOnHost, devInfo, batchSize) &
       result(DnXsyevBatched) &
       bind(C, name="hipsolverDnXsyevBatched")
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: handle
       type(c_ptr), value :: params
       integer(c_int), value :: jobz
       integer(c_int), value :: uplo
       integer(c_long), value :: n
       integer(c_int), value :: dataTypeA
       type(c_ptr), value :: A
       integer(c_long), value :: lda
       integer(c_int), value :: dataTypeW
       type(c_ptr), value :: W
       integer(c_int), value :: computeType
       type(c_ptr), value :: workOnDevice
       integer(c_long), value :: lworkOnDevice
       type(c_ptr), value :: workOnHost
       integer(c_long), value :: lworkOnHost
       integer(c_int) :: devInfo(*)
       integer(c_long), value :: batchSize
       integer(c_int) :: DnXsyevBatched
    end function hipsolverDnXsyevBatched

    !---------------------------------------------
    ! hipsolverDnXsytrs_bufferSize
    !---------------------------------------------
    function hipsolverDnXsytrs_bufferSize(handle, uplo, n, nrhs, dataTypeA, A, lda, devIpiv, &
                                          dataTypeB, B, ldb, lworkOnDevice, lworkOnHost) &
       result(DnXsytrs_bufferSize) &
       bind(C, name="hipsolverDnXsytrs_bufferSize")
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_long), value :: n
       integer(c_long), value :: nrhs
       integer(c_int), value :: dataTypeA
       type(c_ptr), value :: A
       integer(c_long), value :: lda
       type(c_ptr), value :: devIpiv
       integer(c_int), value :: dataTypeB
       type(c_ptr), value :: B
       integer(c_long), value :: ldb
       type(c_ptr), value :: lworkOnDevice
       type(c_ptr), value :: lworkOnHost
       integer(c_int) :: DnXsytrs_bufferSize
    end function hipsolverDnXsytrs_bufferSize

    !---------------------------------------------
    ! hipsolverDnXsytrs
    !---------------------------------------------
    function hipsolverDnXsytrs(handle, uplo, n, nrhs, dataTypeA, A, lda, devIpiv, dataTypeB, B, &
                               ldb, workOnDevice, lworkOnDevice, workOnHost, lworkOnHost, devInfo) &
       result(DnXsytrs) &
       bind(C, name="hipsolverDnXsytrs")
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: handle
       integer(c_int), value :: uplo
       integer(c_long), value :: n
       integer(c_long), value :: nrhs
       integer(c_int), value :: dataTypeA
       type(c_ptr), value :: A
       integer(c_long), value :: lda
       type(c_ptr), value :: devIpiv
       integer(c_int), value :: dataTypeB
       type(c_ptr), value :: B
       integer(c_long), value :: ldb
       type(c_ptr), value :: workOnDevice
       integer(c_long), value :: lworkOnDevice
       type(c_ptr), value :: workOnHost
       integer(c_long), value :: lworkOnHost
       integer(c_int) :: devInfo(*)
       integer(c_int) :: DnXsytrs
    end function hipsolverDnXsytrs

    !---------------------------------------------
    ! hipsolverRfCreate
    !---------------------------------------------
    function hipsolverRfCreate(handle) &
       result(RfCreate) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverRfCreate")
#else
       bind(C, name="hipsolverRfCreate")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: handle
       integer(c_int) :: RfCreate
    end function hipsolverRfCreate

    !---------------------------------------------
    ! hipsolverRfDestroy
    !---------------------------------------------
    function hipsolverRfDestroy(handle) &
       result(RfDestroy) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverRfDestroy")
#else
       bind(C, name="hipsolverRfDestroy")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int) :: RfDestroy
    end function hipsolverRfDestroy

    !---------------------------------------------
    ! hipsolverRfSetupDevice
    !---------------------------------------------
    function hipsolverRfSetupDevice(n, nnzA, csrRowPtrA, csrColIndA, csrValA, nnzL, csrRowPtrL, &
                                    csrColIndL, csrValL, nnzU, csrRowPtrU, csrColIndU, csrValU, P, &
                                    Q, handle) &
       result(RfSetupDevice) &
       bind(C, name="hipsolverRfSetupDevice")
       import :: c_int, c_double, c_ptr
       integer(c_int), value :: n
       integer(c_int), value :: nnzA
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       real(c_double) :: csrValA(*)
       integer(c_int), value :: nnzL
       integer(c_int) :: csrRowPtrL(*)
       integer(c_int) :: csrColIndL(*)
       real(c_double) :: csrValL(*)
       integer(c_int), value :: nnzU
       integer(c_int) :: csrRowPtrU(*)
       integer(c_int) :: csrColIndU(*)
       real(c_double) :: csrValU(*)
       integer(c_int) :: P(*)
       integer(c_int) :: Q(*)
       type(c_ptr), value :: handle
       integer(c_int) :: RfSetupDevice
    end function hipsolverRfSetupDevice

    !---------------------------------------------
    ! hipsolverRfSetupHost
    !---------------------------------------------
    function hipsolverRfSetupHost(n, nnzA, h_csrRowPtrA, h_csrColIndA, h_csrValA, nnzL, &
                                  h_csrRowPtrL, h_csrColIndL, h_csrValL, nnzU, h_csrRowPtrU, &
                                  h_csrColIndU, h_csrValU, h_P, h_Q, handle) &
       result(RfSetupHost) &
       bind(C, name="hipsolverRfSetupHost")
       import :: c_int, c_double, c_ptr
       integer(c_int), value :: n
       integer(c_int), value :: nnzA
       integer(c_int) :: h_csrRowPtrA(*)
       integer(c_int) :: h_csrColIndA(*)
       real(c_double) :: h_csrValA(*)
       integer(c_int), value :: nnzL
       integer(c_int) :: h_csrRowPtrL(*)
       integer(c_int) :: h_csrColIndL(*)
       real(c_double) :: h_csrValL(*)
       integer(c_int), value :: nnzU
       integer(c_int) :: h_csrRowPtrU(*)
       integer(c_int) :: h_csrColIndU(*)
       real(c_double) :: h_csrValU(*)
       integer(c_int) :: h_P(*)
       integer(c_int) :: h_Q(*)
       type(c_ptr), value :: handle
       integer(c_int) :: RfSetupHost
    end function hipsolverRfSetupHost

    !---------------------------------------------
    ! hipsolverRfAccessBundledFactorsDevice
    !---------------------------------------------
    function hipsolverRfAccessBundledFactorsDevice(handle, nnzM, Mp, Mi, Mx) &
       result(RfAccessBundledFactorsDevice) &
       bind(C, name="hipsolverRfAccessBundledFactorsDevice")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int) :: nnzM(*)
       type(c_ptr) :: Mp
       type(c_ptr) :: Mi
       type(c_ptr) :: Mx
       integer(c_int) :: RfAccessBundledFactorsDevice
    end function hipsolverRfAccessBundledFactorsDevice

    !---------------------------------------------
    ! hipsolverRfAnalyze
    !---------------------------------------------
    function hipsolverRfAnalyze(handle) &
       result(RfAnalyze) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverRfAnalyze")
#else
       bind(C, name="hipsolverRfAnalyze")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int) :: RfAnalyze
    end function hipsolverRfAnalyze

    !---------------------------------------------
    ! hipsolverRfExtractBundledFactorsHost
    !---------------------------------------------
    function hipsolverRfExtractBundledFactorsHost(handle, h_nnzM, h_Mp, h_Mi, h_Mx) &
       result(RfExtractBundledFactorsHost) &
       bind(C, name="hipsolverRfExtractBundledFactorsHost")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int) :: h_nnzM(*)
       type(c_ptr) :: h_Mp
       type(c_ptr) :: h_Mi
       type(c_ptr) :: h_Mx
       integer(c_int) :: RfExtractBundledFactorsHost
    end function hipsolverRfExtractBundledFactorsHost

    !---------------------------------------------
    ! hipsolverRfExtractSplitFactorsHost
    !---------------------------------------------
    function hipsolverRfExtractSplitFactorsHost(handle, h_nnzL, h_Lp, h_Li, h_Lx, h_nnzU, h_Up, &
                                                h_Ui, h_Ux) &
       result(RfExtractSplitFactorsHost) &
       bind(C, name="hipsolverRfExtractSplitFactorsHost")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int) :: h_nnzL(*)
       type(c_ptr) :: h_Lp
       type(c_ptr) :: h_Li
       type(c_ptr) :: h_Lx
       integer(c_int) :: h_nnzU(*)
       type(c_ptr) :: h_Up
       type(c_ptr) :: h_Ui
       type(c_ptr) :: h_Ux
       integer(c_int) :: RfExtractSplitFactorsHost
    end function hipsolverRfExtractSplitFactorsHost

    !---------------------------------------------
    ! hipsolverRfGet_Algs
    !---------------------------------------------
    function hipsolverRfGet_Algs(handle, fact_alg, solve_alg) &
       result(RfGet_Algs) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverRfGet_Algs")
#else
       bind(C, name="hipsolverRfGet_Algs")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int) :: fact_alg(*)
       integer(c_int) :: solve_alg(*)
       integer(c_int) :: RfGet_Algs
    end function hipsolverRfGet_Algs

    !---------------------------------------------
    ! hipsolverRfGetMatrixFormat
    !---------------------------------------------
    function hipsolverRfGetMatrixFormat(handle, format, diag) &
       result(RfGetMatrixFormat) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverRfGetMatrixFormat")
#else
       bind(C, name="hipsolverRfGetMatrixFormat")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int) :: format(*)
       integer(c_int) :: diag(*)
       integer(c_int) :: RfGetMatrixFormat
    end function hipsolverRfGetMatrixFormat

    !---------------------------------------------
    ! hipsolverRfGetNumericBoostReport
    !---------------------------------------------
    function hipsolverRfGetNumericBoostReport(handle, report) &
       result(RfGetNumericBoostReport) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverRfGetNumericBoostReport")
#else
       bind(C, name="hipsolverRfGetNumericBoostReport")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int) :: report(*)
       integer(c_int) :: RfGetNumericBoostReport
    end function hipsolverRfGetNumericBoostReport

    !---------------------------------------------
    ! hipsolverRfGetNumericProperties
    !---------------------------------------------
    function hipsolverRfGetNumericProperties(handle, zero, boost) &
       result(RfGetNumericProperties) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverRfGetNumericProperties")
#else
       bind(C, name="hipsolverRfGetNumericProperties")
#endif
       import :: c_ptr, c_double, c_int
       type(c_ptr), value :: handle
       real(c_double) :: zero(*)
       real(c_double) :: boost(*)
       integer(c_int) :: RfGetNumericProperties
    end function hipsolverRfGetNumericProperties

    !---------------------------------------------
    ! hipsolverRfGetResetValuesFastMode
    !---------------------------------------------
    function hipsolverRfGetResetValuesFastMode(handle, fastMode) &
       result(RfGetResetValuesFastMode) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverRfGetResetValuesFastMode")
#else
       bind(C, name="hipsolverRfGetResetValuesFastMode")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int) :: fastMode(*)
       integer(c_int) :: RfGetResetValuesFastMode
    end function hipsolverRfGetResetValuesFastMode

    !---------------------------------------------
    ! hipsolverRfRefactor
    !---------------------------------------------
    function hipsolverRfRefactor(handle) &
       result(RfRefactor) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverRfRefactor")
#else
       bind(C, name="hipsolverRfRefactor")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int) :: RfRefactor
    end function hipsolverRfRefactor

    !---------------------------------------------
    ! hipsolverRfResetValues
    !---------------------------------------------
    function hipsolverRfResetValues(n, nnzA, csrRowPtrA, csrColIndA, csrValA, P, Q, handle) &
       result(RfResetValues) &
       bind(C, name="hipsolverRfResetValues")
       import :: c_int, c_double, c_ptr
       integer(c_int), value :: n
       integer(c_int), value :: nnzA
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       real(c_double) :: csrValA(*)
       integer(c_int) :: P(*)
       integer(c_int) :: Q(*)
       type(c_ptr), value :: handle
       integer(c_int) :: RfResetValues
    end function hipsolverRfResetValues

    !---------------------------------------------
    ! hipsolverRfSetAlgs
    !---------------------------------------------
    function hipsolverRfSetAlgs(handle, fact_alg, solve_alg) &
       result(RfSetAlgs) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverRfSetAlgs")
#else
       bind(C, name="hipsolverRfSetAlgs")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: fact_alg
       integer(c_int), value :: solve_alg
       integer(c_int) :: RfSetAlgs
    end function hipsolverRfSetAlgs

    !---------------------------------------------
    ! hipsolverRfSetMatrixFormat
    !---------------------------------------------
    function hipsolverRfSetMatrixFormat(handle, format, diag) &
       result(RfSetMatrixFormat) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverRfSetMatrixFormat")
#else
       bind(C, name="hipsolverRfSetMatrixFormat")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: format
       integer(c_int), value :: diag
       integer(c_int) :: RfSetMatrixFormat
    end function hipsolverRfSetMatrixFormat

    !---------------------------------------------
    ! hipsolverRfSetNumericProperties
    !---------------------------------------------
    function hipsolverRfSetNumericProperties(handle, effective_zero, boost_val) &
       result(RfSetNumericProperties) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverRfSetNumericProperties")
#else
       bind(C, name="hipsolverRfSetNumericProperties")
#endif
       import :: c_ptr, c_double, c_int
       type(c_ptr), value :: handle
       real(c_double), value :: effective_zero
       real(c_double), value :: boost_val
       integer(c_int) :: RfSetNumericProperties
    end function hipsolverRfSetNumericProperties

    !---------------------------------------------
    ! hipsolverRfSetResetValuesFastMode
    !---------------------------------------------
    function hipsolverRfSetResetValuesFastMode(handle, fastMode) &
       result(RfSetResetValuesFastMode) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverRfSetResetValuesFastMode")
#else
       bind(C, name="hipsolverRfSetResetValuesFastMode")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: fastMode
       integer(c_int) :: RfSetResetValuesFastMode
    end function hipsolverRfSetResetValuesFastMode

    !---------------------------------------------
    ! hipsolverRfSolve
    !---------------------------------------------
    function hipsolverRfSolve(handle, P, Q, nrhs, Temp, ldt, XF, ldxf) &
       result(RfSolve) &
       bind(C, name="hipsolverRfSolve")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int) :: P(*)
       integer(c_int) :: Q(*)
       integer(c_int), value :: nrhs
       real(c_double) :: Temp(*)
       integer(c_int), value :: ldt
       real(c_double) :: XF(*)
       integer(c_int), value :: ldxf
       integer(c_int) :: RfSolve
    end function hipsolverRfSolve

    !---------------------------------------------
    ! hipsolverRfBatchSetupHost
    !---------------------------------------------
    function hipsolverRfBatchSetupHost(batchSize, n, nnzA, h_csrRowPtrA, h_csrColIndA, &
                                       h_csrValA_array, nnzL, h_csrRowPtrL, h_csrColIndL, &
                                       h_csrValL, nnzU, h_csrRowPtrU, h_csrColIndU, h_csrValU, &
                                       h_P, h_Q, handle) &
       result(RfBatchSetupHost) &
       bind(C, name="hipsolverRfBatchSetupHost")
       import :: c_int, c_ptr, c_double
       integer(c_int), value :: batchSize
       integer(c_int), value :: n
       integer(c_int), value :: nnzA
       integer(c_int) :: h_csrRowPtrA(*)
       integer(c_int) :: h_csrColIndA(*)
       type(c_ptr), value :: h_csrValA_array
       integer(c_int), value :: nnzL
       integer(c_int) :: h_csrRowPtrL(*)
       integer(c_int) :: h_csrColIndL(*)
       real(c_double) :: h_csrValL(*)
       integer(c_int), value :: nnzU
       integer(c_int) :: h_csrRowPtrU(*)
       integer(c_int) :: h_csrColIndU(*)
       real(c_double) :: h_csrValU(*)
       integer(c_int) :: h_P(*)
       integer(c_int) :: h_Q(*)
       type(c_ptr), value :: handle
       integer(c_int) :: RfBatchSetupHost
    end function hipsolverRfBatchSetupHost

    !---------------------------------------------
    ! hipsolverRfBatchAnalyze
    !---------------------------------------------
    function hipsolverRfBatchAnalyze(handle) &
       result(RfBatchAnalyze) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverRfBatchAnalyze")
#else
       bind(C, name="hipsolverRfBatchAnalyze")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int) :: RfBatchAnalyze
    end function hipsolverRfBatchAnalyze

    !---------------------------------------------
    ! hipsolverRfBatchRefactor
    !---------------------------------------------
    function hipsolverRfBatchRefactor(handle) &
       result(RfBatchRefactor) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverRfBatchRefactor")
#else
       bind(C, name="hipsolverRfBatchRefactor")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int) :: RfBatchRefactor
    end function hipsolverRfBatchRefactor

    !---------------------------------------------
    ! hipsolverRfBatchResetValues
    !---------------------------------------------
    function hipsolverRfBatchResetValues(batchSize, n, nnzA, csrRowPtrA, csrColIndA, &
                                         csrValA_array, P, Q, handle) &
       result(RfBatchResetValues) &
       bind(C, name="hipsolverRfBatchResetValues")
       import :: c_int, c_ptr
       integer(c_int), value :: batchSize
       integer(c_int), value :: n
       integer(c_int), value :: nnzA
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       type(c_ptr), value :: csrValA_array
       integer(c_int) :: P(*)
       integer(c_int) :: Q(*)
       type(c_ptr), value :: handle
       integer(c_int) :: RfBatchResetValues
    end function hipsolverRfBatchResetValues

    !---------------------------------------------
    ! hipsolverRfBatchSolve
    !---------------------------------------------
    function hipsolverRfBatchSolve(handle, P, Q, nrhs, Temp, ldt, XF_array, ldxf) &
       result(RfBatchSolve) &
       bind(C, name="hipsolverRfBatchSolve")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int) :: P(*)
       integer(c_int) :: Q(*)
       integer(c_int), value :: nrhs
       real(c_double) :: Temp(*)
       integer(c_int), value :: ldt
       type(c_ptr), value :: XF_array
       integer(c_int), value :: ldxf
       integer(c_int) :: RfBatchSolve
    end function hipsolverRfBatchSolve

    !---------------------------------------------
    ! hipsolverRfBatchZeroPivot
    !---------------------------------------------
    function hipsolverRfBatchZeroPivot(handle, position) &
       result(RfBatchZeroPivot) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverRfBatchZeroPivot")
#else
       bind(C, name="hipsolverRfBatchZeroPivot")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int) :: position(*)
       integer(c_int) :: RfBatchZeroPivot
    end function hipsolverRfBatchZeroPivot

    !---------------------------------------------
    ! hipsolverSpCreate
    !---------------------------------------------
    function hipsolverSpCreate(handle) &
       result(SpCreate) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSpCreate")
#else
       bind(C, name="hipsolverSpCreate")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: handle
       integer(c_int) :: SpCreate
    end function hipsolverSpCreate

    !---------------------------------------------
    ! hipsolverSpDestroy
    !---------------------------------------------
    function hipsolverSpDestroy(handle) &
       result(SpDestroy) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSpDestroy")
#else
       bind(C, name="hipsolverSpDestroy")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int) :: SpDestroy
    end function hipsolverSpDestroy

    !---------------------------------------------
    ! hipsolverSpSetStream
    !---------------------------------------------
    function hipsolverSpSetStream(handle, streamId) &
       result(SpSetStream) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusolverSpSetStream")
#else
       bind(C, name="hipsolverSpSetStream")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: streamId
       integer(c_int) :: SpSetStream
    end function hipsolverSpSetStream

    !---------------------------------------------
    ! hipsolverSpScsrlsvchol
    !---------------------------------------------
    function hipsolverSpScsrlsvchol(handle, n, nnzA, descrA, csrVal, csrRowPtr, csrColInd, b, &
                                    tolerance, reorder, x, singularity) &
       result(SpScsrlsvchol) &
       bind(C, name="hipsolverSpScsrlsvchol")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nnzA
       type(c_ptr), value :: descrA
       real(c_float) :: csrVal(*)
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       real(c_float) :: b(*)
       real(c_float), value :: tolerance
       integer(c_int), value :: reorder
       real(c_float) :: x(*)
       integer(c_int) :: singularity(*)
       integer(c_int) :: SpScsrlsvchol
    end function hipsolverSpScsrlsvchol

    !---------------------------------------------
    ! hipsolverSpDcsrlsvchol
    !---------------------------------------------
    function hipsolverSpDcsrlsvchol(handle, n, nnzA, descrA, csrVal, csrRowPtr, csrColInd, b, &
                                    tolerance, reorder, x, singularity) &
       result(SpDcsrlsvchol) &
       bind(C, name="hipsolverSpDcsrlsvchol")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nnzA
       type(c_ptr), value :: descrA
       real(c_double) :: csrVal(*)
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       real(c_double) :: b(*)
       real(c_double), value :: tolerance
       integer(c_int), value :: reorder
       real(c_double) :: x(*)
       integer(c_int) :: singularity(*)
       integer(c_int) :: SpDcsrlsvchol
    end function hipsolverSpDcsrlsvchol

    !---------------------------------------------
    ! hipsolverSpScsrlsvcholHost
    !---------------------------------------------
    function hipsolverSpScsrlsvcholHost(handle, n, nnzA, descrA, csrVal, csrRowPtr, csrColInd, b, &
                                        tolerance, reorder, x, singularity) &
       result(SpScsrlsvcholHost) &
       bind(C, name="hipsolverSpScsrlsvcholHost")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nnzA
       type(c_ptr), value :: descrA
       real(c_float) :: csrVal(*)
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       real(c_float) :: b(*)
       real(c_float), value :: tolerance
       integer(c_int), value :: reorder
       real(c_float) :: x(*)
       integer(c_int) :: singularity(*)
       integer(c_int) :: SpScsrlsvcholHost
    end function hipsolverSpScsrlsvcholHost

    !---------------------------------------------
    ! hipsolverSpDcsrlsvcholHost
    !---------------------------------------------
    function hipsolverSpDcsrlsvcholHost(handle, n, nnzA, descrA, csrVal, csrRowPtr, csrColInd, b, &
                                        tolerance, reorder, x, singularity) &
       result(SpDcsrlsvcholHost) &
       bind(C, name="hipsolverSpDcsrlsvcholHost")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nnzA
       type(c_ptr), value :: descrA
       real(c_double) :: csrVal(*)
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       real(c_double) :: b(*)
       real(c_double), value :: tolerance
       integer(c_int), value :: reorder
       real(c_double) :: x(*)
       integer(c_int) :: singularity(*)
       integer(c_int) :: SpDcsrlsvcholHost
    end function hipsolverSpDcsrlsvcholHost

    !---------------------------------------------
    ! hipsolverSpScsrlsvqr
    !---------------------------------------------
    function hipsolverSpScsrlsvqr(handle, n, nnz, descrA, csrVal, csrRowPts, csrColInd, b, &
                                  tolerance, reorder, x, singularity) &
       result(SpScsrlsvqr) &
       bind(C, name="hipsolverSpScsrlsvqr")
       import :: c_ptr, c_int, c_float, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       real(c_float) :: csrVal(*)
       integer(c_int) :: csrRowPts(*)
       integer(c_int) :: csrColInd(*)
       real(c_float) :: b(*)
       real(c_double), value :: tolerance
       integer(c_int), value :: reorder
       real(c_float) :: x(*)
       integer(c_int) :: singularity(*)
       integer(c_int) :: SpScsrlsvqr
    end function hipsolverSpScsrlsvqr

    !---------------------------------------------
    ! hipsolverSpDcsrlsvqr
    !---------------------------------------------
    function hipsolverSpDcsrlsvqr(handle, n, nnz, descrA, csrVal, csrRowPts, csrColInd, b, &
                                  tolerance, reorder, x, singularity) &
       result(SpDcsrlsvqr) &
       bind(C, name="hipsolverSpDcsrlsvqr")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       real(c_double) :: csrVal(*)
       integer(c_int) :: csrRowPts(*)
       integer(c_int) :: csrColInd(*)
       real(c_double) :: b(*)
       real(c_double), value :: tolerance
       integer(c_int), value :: reorder
       real(c_double) :: x(*)
       integer(c_int) :: singularity(*)
       integer(c_int) :: SpDcsrlsvqr
    end function hipsolverSpDcsrlsvqr

    !---------------------------------------------
    ! hipsolverSpCcsrlsvqr
    !---------------------------------------------
    function hipsolverSpCcsrlsvqr(handle, n, nnz, descrA, csrVal, csrRowPts, csrColInd, b, &
                                  tolerance, reorder, x, singularity) &
       result(SpCcsrlsvqr) &
       bind(C, name="hipsolverSpCcsrlsvqr")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrVal
       integer(c_int) :: csrRowPts(*)
       integer(c_int) :: csrColInd(*)
       type(c_ptr), value :: b
       real(c_double), value :: tolerance
       integer(c_int), value :: reorder
       type(c_ptr), value :: x
       integer(c_int) :: singularity(*)
       integer(c_int) :: SpCcsrlsvqr
    end function hipsolverSpCcsrlsvqr

    !---------------------------------------------
    ! hipsolverSpZcsrlsvqr
    !---------------------------------------------
    function hipsolverSpZcsrlsvqr(handle, n, nnz, descrA, csrVal, csrRowPts, csrColInd, b, &
                                  tolerance, reorder, x, singularity) &
       result(SpZcsrlsvqr) &
       bind(C, name="hipsolverSpZcsrlsvqr")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrVal
       integer(c_int) :: csrRowPts(*)
       integer(c_int) :: csrColInd(*)
       type(c_ptr), value :: b
       real(c_double), value :: tolerance
       integer(c_int), value :: reorder
       type(c_ptr), value :: x
       integer(c_int) :: singularity(*)
       integer(c_int) :: SpZcsrlsvqr
    end function hipsolverSpZcsrlsvqr

  end interface
end module hipfort_hipsolver
