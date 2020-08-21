!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! ==============================================================================
! hipfort: FORTRAN Interfaces for GPU kernels
! ==============================================================================
! Copyright (c) 2020 Advanced Micro Devices, Inc. All rights reserved.
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
          
           
module hipfort_hipsparse
  use hipfort_hipsparse_enums
  implicit none

 
  interface
  !  hipSPARSE initialization and management routines 
#ifdef USE_CUDA_NAMES
    function hipsparseCreate(handle) bind(c, name="cusparseCreate")
#else
    function hipsparseCreate(handle) bind(c, name="hipsparseCreate")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCreate
      type(c_ptr) :: handle
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDestroy(handle) bind(c, name="cusparseDestroy")
#else
    function hipsparseDestroy(handle) bind(c, name="hipsparseDestroy")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDestroy
      type(c_ptr),value :: handle
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseGetVersion(handle,version) bind(c, name="cusparseGetVersion")
#else
    function hipsparseGetVersion(handle,version) bind(c, name="hipsparseGetVersion")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseGetVersion
      type(c_ptr),value :: handle
      type(c_ptr),value :: version
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseGetGitRevision(handle,rev) bind(c, name="cusparseGetGitRevision")
#else
    function hipsparseGetGitRevision(handle,rev) bind(c, name="hipsparseGetGitRevision")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseGetGitRevision
      type(c_ptr),value :: handle
      type(c_ptr),value :: rev
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseSetStream(handle,streamId) bind(c, name="cusparseSetStream")
#else
    function hipsparseSetStream(handle,streamId) bind(c, name="hipsparseSetStream")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSetStream
      type(c_ptr),value :: handle
      type(c_ptr),value :: streamId
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseGetStream(handle,streamId) bind(c, name="cusparseGetStream")
#else
    function hipsparseGetStream(handle,streamId) bind(c, name="hipsparseGetStream")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseGetStream
      type(c_ptr),value :: handle
      type(c_ptr) :: streamId
    end function

  !  hipSPARSE type creation, destruction, set and get routines 
#ifdef USE_CUDA_NAMES
    function hipsparseSetPointerMode(handle,mode) bind(c, name="cusparseSetPointerMode")
#else
    function hipsparseSetPointerMode(handle,mode) bind(c, name="hipsparseSetPointerMode")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSetPointerMode
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_POINTER_MODE_HOST)),value :: mode
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseGetPointerMode(handle,mode) bind(c, name="cusparseGetPointerMode")
#else
    function hipsparseGetPointerMode(handle,mode) bind(c, name="hipsparseGetPointerMode")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseGetPointerMode
      type(c_ptr),value :: handle
      type(c_ptr),value :: mode
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCreateMatDescr(descrA) bind(c, name="cusparseCreateMatDescr")
#else
    function hipsparseCreateMatDescr(descrA) bind(c, name="hipsparseCreateMatDescr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCreateMatDescr
      type(c_ptr) :: descrA
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDestroyMatDescr(descrA) bind(c, name="cusparseDestroyMatDescr")
#else
    function hipsparseDestroyMatDescr(descrA) bind(c, name="hipsparseDestroyMatDescr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDestroyMatDescr
      type(c_ptr),value :: descrA
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCopyMatDescr(dest,src) bind(c, name="cusparseCopyMatDescr")
#else
    function hipsparseCopyMatDescr(dest,src) bind(c, name="hipsparseCopyMatDescr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCopyMatDescr
      type(c_ptr),value :: dest
      type(c_ptr),value :: src
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseSetMatType(descrA,myType) bind(c, name="cusparseSetMatType")
#else
    function hipsparseSetMatType(descrA,myType) bind(c, name="hipsparseSetMatType")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSetMatType
      type(c_ptr),value :: descrA
      integer(kind(HIPSPARSE_MATRIX_TYPE_GENERAL)),value :: myType
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseSetMatFillMode(descrA,fillMode) bind(c, name="cusparseSetMatFillMode")
#else
    function hipsparseSetMatFillMode(descrA,fillMode) bind(c, name="hipsparseSetMatFillMode")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSetMatFillMode
      type(c_ptr),value :: descrA
      integer(kind(HIPSPARSE_FILL_MODE_LOWER)),value :: fillMode
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseSetMatDiagType(descrA,diagType) bind(c, name="cusparseSetMatDiagType")
#else
    function hipsparseSetMatDiagType(descrA,diagType) bind(c, name="hipsparseSetMatDiagType")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSetMatDiagType
      type(c_ptr),value :: descrA
      integer(kind(HIPSPARSE_DIAG_TYPE_NON_UNIT)),value :: diagType
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseSetMatIndexBase(descrA,base) bind(c, name="cusparseSetMatIndexBase")
#else
    function hipsparseSetMatIndexBase(descrA,base) bind(c, name="hipsparseSetMatIndexBase")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSetMatIndexBase
      type(c_ptr),value :: descrA
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: base
    end function

  !  Hybrid (HYB) format 
#ifdef USE_CUDA_NAMES
    function hipsparseCreateHybMat(hybA) bind(c, name="cusparseCreateHybMat")
#else
    function hipsparseCreateHybMat(hybA) bind(c, name="hipsparseCreateHybMat")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCreateHybMat
      type(c_ptr) :: hybA
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDestroyHybMat(hybA) bind(c, name="cusparseDestroyHybMat")
#else
    function hipsparseDestroyHybMat(hybA) bind(c, name="hipsparseDestroyHybMat")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDestroyHybMat
      type(c_ptr),value :: hybA
    end function

  !  Info structures 
#ifdef USE_CUDA_NAMES
    function hipsparseCreateBsrsv2Info(myInfo) bind(c, name="cusparseCreateBsrsv2Info")
#else
    function hipsparseCreateBsrsv2Info(myInfo) bind(c, name="hipsparseCreateBsrsv2Info")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCreateBsrsv2Info
      type(c_ptr) :: myInfo
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDestroyBsrsv2Info(myInfo) bind(c, name="cusparseDestroyBsrsv2Info")
#else
    function hipsparseDestroyBsrsv2Info(myInfo) bind(c, name="hipsparseDestroyBsrsv2Info")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDestroyBsrsv2Info
      type(c_ptr),value :: myInfo
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCreateCsrsv2Info(myInfo) bind(c, name="cusparseCreateCsrsv2Info")
#else
    function hipsparseCreateCsrsv2Info(myInfo) bind(c, name="hipsparseCreateCsrsv2Info")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCreateCsrsv2Info
      type(c_ptr) :: myInfo
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDestroyCsrsv2Info(myInfo) bind(c, name="cusparseDestroyCsrsv2Info")
#else
    function hipsparseDestroyCsrsv2Info(myInfo) bind(c, name="hipsparseDestroyCsrsv2Info")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDestroyCsrsv2Info
      type(c_ptr),value :: myInfo
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCreateCsrsm2Info(myInfo) bind(c, name="cusparseCreateCsrsm2Info")
#else
    function hipsparseCreateCsrsm2Info(myInfo) bind(c, name="hipsparseCreateCsrsm2Info")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCreateCsrsm2Info
      type(c_ptr) :: myInfo
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDestroyCsrsm2Info(myInfo) bind(c, name="cusparseDestroyCsrsm2Info")
#else
    function hipsparseDestroyCsrsm2Info(myInfo) bind(c, name="hipsparseDestroyCsrsm2Info")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDestroyCsrsm2Info
      type(c_ptr),value :: myInfo
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCreateCsrilu02Info(myInfo) bind(c, name="cusparseCreateCsrilu02Info")
#else
    function hipsparseCreateCsrilu02Info(myInfo) bind(c, name="hipsparseCreateCsrilu02Info")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCreateCsrilu02Info
      type(c_ptr) :: myInfo
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDestroyCsrilu02Info(myInfo) bind(c, name="cusparseDestroyCsrilu02Info")
#else
    function hipsparseDestroyCsrilu02Info(myInfo) bind(c, name="hipsparseDestroyCsrilu02Info")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDestroyCsrilu02Info
      type(c_ptr),value :: myInfo
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCreateCsric02Info(myInfo) bind(c, name="cusparseCreateCsric02Info")
#else
    function hipsparseCreateCsric02Info(myInfo) bind(c, name="hipsparseCreateCsric02Info")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCreateCsric02Info
      type(c_ptr) :: myInfo
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDestroyCsric02Info(myInfo) bind(c, name="cusparseDestroyCsric02Info")
#else
    function hipsparseDestroyCsric02Info(myInfo) bind(c, name="hipsparseDestroyCsric02Info")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDestroyCsric02Info
      type(c_ptr),value :: myInfo
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCreateCsrgemm2Info(myInfo) bind(c, name="cusparseCreateCsrgemm2Info")
#else
    function hipsparseCreateCsrgemm2Info(myInfo) bind(c, name="hipsparseCreateCsrgemm2Info")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCreateCsrgemm2Info
      type(c_ptr) :: myInfo
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDestroyCsrgemm2Info(myInfo) bind(c, name="cusparseDestroyCsrgemm2Info")
#else
    function hipsparseDestroyCsrgemm2Info(myInfo) bind(c, name="hipsparseDestroyCsrgemm2Info")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDestroyCsrgemm2Info
      type(c_ptr),value :: myInfo
    end function

  !  Description: Addition of a scalar multiple of a sparse vector x
  !    and a dense vector y. 
#ifdef USE_CUDA_NAMES
    function hipsparseSaxpyi(handle,nnz,alpha,xVal,xInd,y,idxBase) bind(c, name="cusparseSaxpyi")
#else
    function hipsparseSaxpyi(handle,nnz,alpha,xVal,xInd,y,idxBase) bind(c, name="hipsparseSaxpyi")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSaxpyi
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      type(c_ptr),value :: y
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDaxpyi(handle,nnz,alpha,xVal,xInd,y,idxBase) bind(c, name="cusparseDaxpyi")
#else
    function hipsparseDaxpyi(handle,nnz,alpha,xVal,xInd,y,idxBase) bind(c, name="hipsparseDaxpyi")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDaxpyi
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      type(c_ptr),value :: y
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCaxpyi(handle,nnz,alpha,xVal,xInd,y,idxBase) bind(c, name="cusparseCaxpyi")
#else
    function hipsparseCaxpyi(handle,nnz,alpha,xVal,xInd,y,idxBase) bind(c, name="hipsparseCaxpyi")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCaxpyi
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      type(c_ptr),value :: y
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZaxpyi(handle,nnz,alpha,xVal,xInd,y,idxBase) bind(c, name="cusparseZaxpyi")
#else
    function hipsparseZaxpyi(handle,nnz,alpha,xVal,xInd,y,idxBase) bind(c, name="hipsparseZaxpyi")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZaxpyi
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      type(c_ptr),value :: y
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

  !  Description: Compute the dot product of a sparse vector x
  !    with a dense vector y. 
#ifdef USE_CUDA_NAMES
    function hipsparseSdoti(handle,nnz,xVal,xInd,y,myResult,idxBase) bind(c, name="cusparseSdoti")
#else
    function hipsparseSdoti(handle,nnz,xVal,xInd,y,myResult,idxBase) bind(c, name="hipsparseSdoti")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSdoti
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      type(c_ptr),value :: y
      type(c_ptr),value :: myResult
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDdoti(handle,nnz,xVal,xInd,y,myResult,idxBase) bind(c, name="cusparseDdoti")
#else
    function hipsparseDdoti(handle,nnz,xVal,xInd,y,myResult,idxBase) bind(c, name="hipsparseDdoti")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDdoti
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      type(c_ptr),value :: y
      type(c_ptr),value :: myResult
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCdoti(handle,nnz,xVal,xInd,y,myResult,idxBase) bind(c, name="cusparseCdoti")
#else
    function hipsparseCdoti(handle,nnz,xVal,xInd,y,myResult,idxBase) bind(c, name="hipsparseCdoti")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCdoti
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      type(c_ptr),value :: y
      type(c_ptr),value :: myResult
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZdoti(handle,nnz,xVal,xInd,y,myResult,idxBase) bind(c, name="cusparseZdoti")
#else
    function hipsparseZdoti(handle,nnz,xVal,xInd,y,myResult,idxBase) bind(c, name="hipsparseZdoti")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZdoti
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      type(c_ptr),value :: y
      type(c_ptr),value :: myResult
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

  !  Description: Compute the conjugated dot product of a sparse
  !    vector x with a dense vector y. 
#ifdef USE_CUDA_NAMES
    function hipsparseCdotci(handle,nnz,xVal,xInd,y,myResult,idxBase) bind(c, name="cusparseCdotci")
#else
    function hipsparseCdotci(handle,nnz,xVal,xInd,y,myResult,idxBase) bind(c, name="hipsparseCdotci")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCdotci
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      type(c_ptr),value :: y
      type(c_ptr),value :: myResult
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZdotci(handle,nnz,xVal,xInd,y,myResult,idxBase) bind(c, name="cusparseZdotci")
#else
    function hipsparseZdotci(handle,nnz,xVal,xInd,y,myResult,idxBase) bind(c, name="hipsparseZdotci")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZdotci
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      type(c_ptr),value :: y
      type(c_ptr),value :: myResult
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

  !  Description: Gathers the elements that are listed in xInd from
  !    a dense vector y and stores them in a sparse vector x. 
#ifdef USE_CUDA_NAMES
    function hipsparseSgthr(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="cusparseSgthr")
#else
    function hipsparseSgthr(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="hipsparseSgthr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSgthr
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: y
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDgthr(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="cusparseDgthr")
#else
    function hipsparseDgthr(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="hipsparseDgthr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDgthr
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: y
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCgthr(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="cusparseCgthr")
#else
    function hipsparseCgthr(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="hipsparseCgthr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCgthr
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: y
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZgthr(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="cusparseZgthr")
#else
    function hipsparseZgthr(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="hipsparseZgthr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZgthr
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: y
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

  !  Description: Gathers the elements that are listed in xInd from
  !    a dense vector y and stores them in a sparse vector x. Gathered
  !    elements are replaced by zero in y. 
#ifdef USE_CUDA_NAMES
    function hipsparseSgthrz(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="cusparseSgthrz")
#else
    function hipsparseSgthrz(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="hipsparseSgthrz")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSgthrz
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: y
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDgthrz(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="cusparseDgthrz")
#else
    function hipsparseDgthrz(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="hipsparseDgthrz")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDgthrz
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: y
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCgthrz(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="cusparseCgthrz")
#else
    function hipsparseCgthrz(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="hipsparseCgthrz")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCgthrz
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: y
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZgthrz(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="cusparseZgthrz")
#else
    function hipsparseZgthrz(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="hipsparseZgthrz")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZgthrz
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: y
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

  !  Description: Applies the Givens rotation matrix to a sparse vector
  !    x and a dense vector y. 
#ifdef USE_CUDA_NAMES
    function hipsparseSroti(handle,nnz,xVal,xInd,y,c,s,idxBase) bind(c, name="cusparseSroti")
#else
    function hipsparseSroti(handle,nnz,xVal,xInd,y,c,s,idxBase) bind(c, name="hipsparseSroti")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSroti
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      type(c_ptr),value :: y
      type(c_ptr),value :: c
      type(c_ptr),value :: s
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDroti(handle,nnz,xVal,xInd,y,c,s,idxBase) bind(c, name="cusparseDroti")
#else
    function hipsparseDroti(handle,nnz,xVal,xInd,y,c,s,idxBase) bind(c, name="hipsparseDroti")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDroti
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      type(c_ptr),value :: y
      type(c_ptr),value :: c
      type(c_ptr),value :: s
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

  !  Description: Scatters elements listed in xInd from a sparse vector x
  !    into a dense vector y. 
#ifdef USE_CUDA_NAMES
    function hipsparseSsctr(handle,nnz,xVal,xInd,y,idxBase) bind(c, name="cusparseSsctr")
#else
    function hipsparseSsctr(handle,nnz,xVal,xInd,y,idxBase) bind(c, name="hipsparseSsctr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSsctr
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      type(c_ptr),value :: y
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDsctr(handle,nnz,xVal,xInd,y,idxBase) bind(c, name="cusparseDsctr")
#else
    function hipsparseDsctr(handle,nnz,xVal,xInd,y,idxBase) bind(c, name="hipsparseDsctr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDsctr
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      type(c_ptr),value :: y
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCsctr(handle,nnz,xVal,xInd,y,idxBase) bind(c, name="cusparseCsctr")
#else
    function hipsparseCsctr(handle,nnz,xVal,xInd,y,idxBase) bind(c, name="hipsparseCsctr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCsctr
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      type(c_ptr),value :: y
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZsctr(handle,nnz,xVal,xInd,y,idxBase) bind(c, name="cusparseZsctr")
#else
    function hipsparseZsctr(handle,nnz,xVal,xInd,y,idxBase) bind(c, name="hipsparseZsctr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZsctr
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      type(c_ptr),value :: y
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

  !  Description: Matrix-vector multiplication  y = alpha  op(A)  x  + beta  y,
  !    where A is a sparse matrix in CSR storage format, x and y are dense vectors. 
#ifdef USE_CUDA_NAMES
    function hipsparseScsrmv(handle,transA,m,n,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,x,beta,y) bind(c, name="cusparseScsrmv")
#else
    function hipsparseScsrmv(handle,transA,m,n,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,x,beta,y) bind(c, name="hipsparseScsrmv")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrmv
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: x
      real(c_float) :: beta
      type(c_ptr),value :: y
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrmv(handle,transA,m,n,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,x,beta,y) bind(c, name="cusparseDcsrmv")
#else
    function hipsparseDcsrmv(handle,transA,m,n,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,x,beta,y) bind(c, name="hipsparseDcsrmv")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrmv
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: x
      real(c_double) :: beta
      type(c_ptr),value :: y
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrmv(handle,transA,m,n,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,x,beta,y) bind(c, name="cusparseCcsrmv")
#else
    function hipsparseCcsrmv(handle,transA,m,n,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,x,beta,y) bind(c, name="hipsparseCcsrmv")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrmv
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: x
      complex(c_float_complex) :: beta
      type(c_ptr),value :: y
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrmv(handle,transA,m,n,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,x,beta,y) bind(c, name="cusparseZcsrmv")
#else
    function hipsparseZcsrmv(handle,transA,m,n,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,x,beta,y) bind(c, name="hipsparseZcsrmv")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrmv
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: x
      complex(c_double_complex) :: beta
      type(c_ptr),value :: y
    end function

  !  Description: Solution of triangular linear system op(A)  x = alpha  f,
  !    where A is a sparse matrix in CSR storage format, x and f are dense vectors. 
#ifdef USE_CUDA_NAMES
    function hipsparseXcsrsv2_zeroPivot(handle,myInfo,position) bind(c, name="cusparseXcsrsv2_zeroPivot")
#else
    function hipsparseXcsrsv2_zeroPivot(handle,myInfo,position) bind(c, name="hipsparseXcsrsv2_zeroPivot")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsrsv2_zeroPivot
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: position
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseScsrsv2_bufferSize(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="cusparseScsrsv2_bufferSize")
#else
    function hipsparseScsrsv2_bufferSize(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseScsrsv2_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrsv2_bufferSize
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrsv2_bufferSize(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="cusparseDcsrsv2_bufferSize")
#else
    function hipsparseDcsrsv2_bufferSize(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseDcsrsv2_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrsv2_bufferSize
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrsv2_bufferSize(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="cusparseCcsrsv2_bufferSize")
#else
    function hipsparseCcsrsv2_bufferSize(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseCcsrsv2_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrsv2_bufferSize
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrsv2_bufferSize(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="cusparseZcsrsv2_bufferSize")
#else
    function hipsparseZcsrsv2_bufferSize(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseZcsrsv2_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrsv2_bufferSize
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseScsrsv2_bufferSizeExt(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="cusparseScsrsv2_bufferSizeExt")
#else
    function hipsparseScsrsv2_bufferSizeExt(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="hipsparseScsrsv2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrsv2_bufferSizeExt
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBufferSize
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrsv2_bufferSizeExt(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="cusparseDcsrsv2_bufferSizeExt")
#else
    function hipsparseDcsrsv2_bufferSizeExt(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="hipsparseDcsrsv2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrsv2_bufferSizeExt
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBufferSize
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrsv2_bufferSizeExt(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="cusparseCcsrsv2_bufferSizeExt")
#else
    function hipsparseCcsrsv2_bufferSizeExt(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="hipsparseCcsrsv2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrsv2_bufferSizeExt
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBufferSize
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrsv2_bufferSizeExt(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="cusparseZcsrsv2_bufferSizeExt")
#else
    function hipsparseZcsrsv2_bufferSizeExt(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="hipsparseZcsrsv2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrsv2_bufferSizeExt
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBufferSize
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseScsrsv2_analysis(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseScsrsv2_analysis")
#else
    function hipsparseScsrsv2_analysis(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseScsrsv2_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrsv2_analysis
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrsv2_analysis(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseDcsrsv2_analysis")
#else
    function hipsparseDcsrsv2_analysis(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseDcsrsv2_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrsv2_analysis
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrsv2_analysis(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseCcsrsv2_analysis")
#else
    function hipsparseCcsrsv2_analysis(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseCcsrsv2_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrsv2_analysis
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrsv2_analysis(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseZcsrsv2_analysis")
#else
    function hipsparseZcsrsv2_analysis(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseZcsrsv2_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrsv2_analysis
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseScsrsv2_solve(handle,transA,m,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,f,x,policy,pBuffer) bind(c, name="cusparseScsrsv2_solve")
#else
    function hipsparseScsrsv2_solve(handle,transA,m,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,f,x,policy,pBuffer) bind(c, name="hipsparseScsrsv2_solve")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrsv2_solve
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: f
      type(c_ptr),value :: x
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrsv2_solve(handle,transA,m,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,f,x,policy,pBuffer) bind(c, name="cusparseDcsrsv2_solve")
#else
    function hipsparseDcsrsv2_solve(handle,transA,m,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,f,x,policy,pBuffer) bind(c, name="hipsparseDcsrsv2_solve")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrsv2_solve
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: f
      type(c_ptr),value :: x
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrsv2_solve(handle,transA,m,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,f,x,policy,pBuffer) bind(c, name="cusparseCcsrsv2_solve")
#else
    function hipsparseCcsrsv2_solve(handle,transA,m,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,f,x,policy,pBuffer) bind(c, name="hipsparseCcsrsv2_solve")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrsv2_solve
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: f
      type(c_ptr),value :: x
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrsv2_solve(handle,transA,m,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,f,x,policy,pBuffer) bind(c, name="cusparseZcsrsv2_solve")
#else
    function hipsparseZcsrsv2_solve(handle,transA,m,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,f,x,policy,pBuffer) bind(c, name="hipsparseZcsrsv2_solve")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrsv2_solve
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: f
      type(c_ptr),value :: x
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  !  Description: Matrix-vector multiplication  y = alpha  op(A)  x  + beta  y,
  !    where A is a sparse matrix in HYB storage format, x and y are dense vectors. 
#ifdef USE_CUDA_NAMES
    function hipsparseShybmv(handle,transA,alpha,descrA,hybA,x,beta,y) bind(c, name="cusparseShybmv")
#else
    function hipsparseShybmv(handle,transA,alpha,descrA,hybA,x,beta,y) bind(c, name="hipsparseShybmv")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseShybmv
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: hybA
      type(c_ptr),value :: x
      real(c_float) :: beta
      type(c_ptr),value :: y
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDhybmv(handle,transA,alpha,descrA,hybA,x,beta,y) bind(c, name="cusparseDhybmv")
#else
    function hipsparseDhybmv(handle,transA,alpha,descrA,hybA,x,beta,y) bind(c, name="hipsparseDhybmv")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDhybmv
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: hybA
      type(c_ptr),value :: x
      real(c_double) :: beta
      type(c_ptr),value :: y
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseChybmv(handle,transA,alpha,descrA,hybA,x,beta,y) bind(c, name="cusparseChybmv")
#else
    function hipsparseChybmv(handle,transA,alpha,descrA,hybA,x,beta,y) bind(c, name="hipsparseChybmv")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseChybmv
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: hybA
      type(c_ptr),value :: x
      complex(c_float_complex) :: beta
      type(c_ptr),value :: y
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZhybmv(handle,transA,alpha,descrA,hybA,x,beta,y) bind(c, name="cusparseZhybmv")
#else
    function hipsparseZhybmv(handle,transA,alpha,descrA,hybA,x,beta,y) bind(c, name="hipsparseZhybmv")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZhybmv
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: hybA
      type(c_ptr),value :: x
      complex(c_double_complex) :: beta
      type(c_ptr),value :: y
    end function

  !  Description: Matrix-vector multiplication  y = alpha  op(A)  x  + beta  y,
  !    where A is a sparse matrix in BSR storage format, x and y are dense vectors. 
#ifdef USE_CUDA_NAMES
    function hipsparseSbsrmv(handle,dirA,transA,mb,nb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,x,beta,y) bind(c, name="cusparseSbsrmv")
#else
    function hipsparseSbsrmv(handle,dirA,transA,mb,nb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,x,beta,y) bind(c, name="hipsparseSbsrmv")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsrmv
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      integer(c_int),value :: nnzb
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: x
      real(c_float) :: beta
      type(c_ptr),value :: y
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDbsrmv(handle,dirA,transA,mb,nb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,x,beta,y) bind(c, name="cusparseDbsrmv")
#else
    function hipsparseDbsrmv(handle,dirA,transA,mb,nb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,x,beta,y) bind(c, name="hipsparseDbsrmv")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsrmv
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      integer(c_int),value :: nnzb
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: x
      real(c_double) :: beta
      type(c_ptr),value :: y
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCbsrmv(handle,dirA,transA,mb,nb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,x,beta,y) bind(c, name="cusparseCbsrmv")
#else
    function hipsparseCbsrmv(handle,dirA,transA,mb,nb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,x,beta,y) bind(c, name="hipsparseCbsrmv")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsrmv
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      integer(c_int),value :: nnzb
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: x
      complex(c_float_complex) :: beta
      type(c_ptr),value :: y
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZbsrmv(handle,dirA,transA,mb,nb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,x,beta,y) bind(c, name="cusparseZbsrmv")
#else
    function hipsparseZbsrmv(handle,dirA,transA,mb,nb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,x,beta,y) bind(c, name="hipsparseZbsrmv")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsrmv
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      integer(c_int),value :: nnzb
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: x
      complex(c_double_complex) :: beta
      type(c_ptr),value :: y
    end function

  !  Description: Solution of triangular linear system op(A)  x = alpha  f,
  !    where A is a sparse matrix in BSR storage format, x and f are dense vectors. 
#ifdef USE_CUDA_NAMES
    function hipsparseXbsrsv2_zeroPivot(handle,myInfo,position) bind(c, name="cusparseXbsrsv2_zeroPivot")
#else
    function hipsparseXbsrsv2_zeroPivot(handle,myInfo,position) bind(c, name="hipsparseXbsrsv2_zeroPivot")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXbsrsv2_zeroPivot
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: position
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseSbsrsv2_bufferSize(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes) bind(c, name="cusparseSbsrsv2_bufferSize")
#else
    function hipsparseSbsrsv2_bufferSize(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseSbsrsv2_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsrsv2_bufferSize
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDbsrsv2_bufferSize(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes) bind(c, name="cusparseDbsrsv2_bufferSize")
#else
    function hipsparseDbsrsv2_bufferSize(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseDbsrsv2_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsrsv2_bufferSize
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCbsrsv2_bufferSize(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes) bind(c, name="cusparseCbsrsv2_bufferSize")
#else
    function hipsparseCbsrsv2_bufferSize(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseCbsrsv2_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsrsv2_bufferSize
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZbsrsv2_bufferSize(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes) bind(c, name="cusparseZbsrsv2_bufferSize")
#else
    function hipsparseZbsrsv2_bufferSize(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseZbsrsv2_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsrsv2_bufferSize
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseSbsrsv2_bufferSizeExt(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSize) bind(c, name="cusparseSbsrsv2_bufferSizeExt")
#else
    function hipsparseSbsrsv2_bufferSizeExt(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSize) bind(c, name="hipsparseSbsrsv2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsrsv2_bufferSizeExt
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBufferSize
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDbsrsv2_bufferSizeExt(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSize) bind(c, name="cusparseDbsrsv2_bufferSizeExt")
#else
    function hipsparseDbsrsv2_bufferSizeExt(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSize) bind(c, name="hipsparseDbsrsv2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsrsv2_bufferSizeExt
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBufferSize
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCbsrsv2_bufferSizeExt(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSize) bind(c, name="cusparseCbsrsv2_bufferSizeExt")
#else
    function hipsparseCbsrsv2_bufferSizeExt(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSize) bind(c, name="hipsparseCbsrsv2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsrsv2_bufferSizeExt
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBufferSize
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZbsrsv2_bufferSizeExt(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSize) bind(c, name="cusparseZbsrsv2_bufferSizeExt")
#else
    function hipsparseZbsrsv2_bufferSizeExt(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,pBufferSize) bind(c, name="hipsparseZbsrsv2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsrsv2_bufferSizeExt
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBufferSize
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseSbsrsv2_analysis(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="cusparseSbsrsv2_analysis")
#else
    function hipsparseSbsrsv2_analysis(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="hipsparseSbsrsv2_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsrsv2_analysis
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDbsrsv2_analysis(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="cusparseDbsrsv2_analysis")
#else
    function hipsparseDbsrsv2_analysis(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="hipsparseDbsrsv2_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsrsv2_analysis
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCbsrsv2_analysis(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="cusparseCbsrsv2_analysis")
#else
    function hipsparseCbsrsv2_analysis(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="hipsparseCbsrsv2_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsrsv2_analysis
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZbsrsv2_analysis(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="cusparseZbsrsv2_analysis")
#else
    function hipsparseZbsrsv2_analysis(handle,dirA,transA,mb,nnzb,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,policy,pBuffer) bind(c, name="hipsparseZbsrsv2_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsrsv2_analysis
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseSbsrsv2_solve(handle,dirA,transA,mb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,f,x,policy,pBuffer) bind(c, name="cusparseSbsrsv2_solve")
#else
    function hipsparseSbsrsv2_solve(handle,dirA,transA,mb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,f,x,policy,pBuffer) bind(c, name="hipsparseSbsrsv2_solve")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsrsv2_solve
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: f
      type(c_ptr),value :: x
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDbsrsv2_solve(handle,dirA,transA,mb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,f,x,policy,pBuffer) bind(c, name="cusparseDbsrsv2_solve")
#else
    function hipsparseDbsrsv2_solve(handle,dirA,transA,mb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,f,x,policy,pBuffer) bind(c, name="hipsparseDbsrsv2_solve")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsrsv2_solve
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: f
      type(c_ptr),value :: x
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCbsrsv2_solve(handle,dirA,transA,mb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,f,x,policy,pBuffer) bind(c, name="cusparseCbsrsv2_solve")
#else
    function hipsparseCbsrsv2_solve(handle,dirA,transA,mb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,f,x,policy,pBuffer) bind(c, name="hipsparseCbsrsv2_solve")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsrsv2_solve
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: f
      type(c_ptr),value :: x
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZbsrsv2_solve(handle,dirA,transA,mb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,f,x,policy,pBuffer) bind(c, name="cusparseZbsrsv2_solve")
#else
    function hipsparseZbsrsv2_solve(handle,dirA,transA,mb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,myInfo,f,x,policy,pBuffer) bind(c, name="hipsparseZbsrsv2_solve")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsrsv2_solve
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: mb
      integer(c_int),value :: nnzb
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: f
      type(c_ptr),value :: x
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  !  Description: Matrix-matrix multiplication C = alpha  op(A)  B + beta  C,
  !    where A is a sparse matrix in BSR storage format, B and C are dense matrices. 
#ifdef USE_CUDA_NAMES
    function hipsparseSbsrmm(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,B,ldb,beta,C,ldc) bind(c, name="cusparseSbsrmm")
#else
    function hipsparseSbsrmm(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,B,ldb,beta,C,ldc) bind(c, name="hipsparseSbsrmm")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsrmm
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: mb
      integer(c_int),value :: n
      integer(c_int),value :: kb
      integer(c_int),value :: nnzb
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrValA
      type(c_ptr),value :: bsrRowPtrA
      type(c_ptr),value :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_float) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDbsrmm(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,B,ldb,beta,C,ldc) bind(c, name="cusparseDbsrmm")
#else
    function hipsparseDbsrmm(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,B,ldb,beta,C,ldc) bind(c, name="hipsparseDbsrmm")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsrmm
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: mb
      integer(c_int),value :: n
      integer(c_int),value :: kb
      integer(c_int),value :: nnzb
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrValA
      type(c_ptr),value :: bsrRowPtrA
      type(c_ptr),value :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_double) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCbsrmm(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,B,ldb,beta,C,ldc) bind(c, name="cusparseCbsrmm")
#else
    function hipsparseCbsrmm(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,B,ldb,beta,C,ldc) bind(c, name="hipsparseCbsrmm")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsrmm
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: mb
      integer(c_int),value :: n
      integer(c_int),value :: kb
      integer(c_int),value :: nnzb
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrValA
      type(c_ptr),value :: bsrRowPtrA
      type(c_ptr),value :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      complex(c_float_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZbsrmm(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,B,ldb,beta,C,ldc) bind(c, name="cusparseZbsrmm")
#else
    function hipsparseZbsrmm(handle,dirA,transA,transB,mb,n,kb,nnzb,alpha,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,B,ldb,beta,C,ldc) bind(c, name="hipsparseZbsrmm")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsrmm
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: mb
      integer(c_int),value :: n
      integer(c_int),value :: kb
      integer(c_int),value :: nnzb
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrValA
      type(c_ptr),value :: bsrRowPtrA
      type(c_ptr),value :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      complex(c_double_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  !  Description: Matrix-matrix multiplication C = alpha  op(A)  B + beta  C,
  !    where A is a sparse matrix in CSR storage format, B and C are dense matrices. 
#ifdef USE_CUDA_NAMES
    function hipsparseScsrmm(handle,transA,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="cusparseScsrmm")
#else
    function hipsparseScsrmm(handle,transA,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="hipsparseScsrmm")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrmm
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_float) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrmm(handle,transA,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="cusparseDcsrmm")
#else
    function hipsparseDcsrmm(handle,transA,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="hipsparseDcsrmm")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrmm
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_double) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrmm(handle,transA,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="cusparseCcsrmm")
#else
    function hipsparseCcsrmm(handle,transA,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="hipsparseCcsrmm")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrmm
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      complex(c_float_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrmm(handle,transA,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="cusparseZcsrmm")
#else
    function hipsparseZcsrmm(handle,transA,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="hipsparseZcsrmm")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrmm
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      complex(c_double_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  !  Description: Matrix-matrix multiplication C = alpha  op(A)  op(B) + beta  C,
  !    where A is a sparse matrix in CSR storage format, B and C are dense matrices. 
#ifdef USE_CUDA_NAMES
    function hipsparseScsrmm2(handle,transA,transB,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="cusparseScsrmm2")
#else
    function hipsparseScsrmm2(handle,transA,transB,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="hipsparseScsrmm2")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrmm2
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_float) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrmm2(handle,transA,transB,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="cusparseDcsrmm2")
#else
    function hipsparseDcsrmm2(handle,transA,transB,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="hipsparseDcsrmm2")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrmm2
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_double) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrmm2(handle,transA,transB,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="cusparseCcsrmm2")
#else
    function hipsparseCcsrmm2(handle,transA,transB,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="hipsparseCcsrmm2")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrmm2
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      complex(c_float_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrmm2(handle,transA,transB,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="cusparseZcsrmm2")
#else
    function hipsparseZcsrmm2(handle,transA,transB,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="hipsparseZcsrmm2")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrmm2
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      complex(c_double_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  !  Description: Solution of triangular linear system op(A)  op(X) = alpha  op(B),
  !    where A is a sparse matrix in CSR storage format, X and B are dense matrices. 
#ifdef USE_CUDA_NAMES
    function hipsparseXcsrsm2_zeroPivot(handle,myInfo,position) bind(c, name="cusparseXcsrsm2_zeroPivot")
#else
    function hipsparseXcsrsm2_zeroPivot(handle,myInfo,position) bind(c, name="hipsparseXcsrsm2_zeroPivot")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsrsm2_zeroPivot
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: position
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseScsrsm2_bufferSizeExt(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBufferSize) bind(c, name="cusparseScsrsm2_bufferSizeExt")
#else
    function hipsparseScsrsm2_bufferSizeExt(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBufferSize) bind(c, name="hipsparseScsrsm2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrsm2_bufferSizeExt
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBufferSize
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrsm2_bufferSizeExt(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBufferSize) bind(c, name="cusparseDcsrsm2_bufferSizeExt")
#else
    function hipsparseDcsrsm2_bufferSizeExt(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBufferSize) bind(c, name="hipsparseDcsrsm2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrsm2_bufferSizeExt
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBufferSize
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrsm2_bufferSizeExt(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBufferSize) bind(c, name="cusparseCcsrsm2_bufferSizeExt")
#else
    function hipsparseCcsrsm2_bufferSizeExt(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBufferSize) bind(c, name="hipsparseCcsrsm2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrsm2_bufferSizeExt
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBufferSize
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrsm2_bufferSizeExt(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBufferSize) bind(c, name="cusparseZcsrsm2_bufferSizeExt")
#else
    function hipsparseZcsrsm2_bufferSizeExt(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBufferSize) bind(c, name="hipsparseZcsrsm2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrsm2_bufferSizeExt
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBufferSize
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseScsrsm2_analysis(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer) bind(c, name="cusparseScsrsm2_analysis")
#else
    function hipsparseScsrsm2_analysis(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer) bind(c, name="hipsparseScsrsm2_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrsm2_analysis
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrsm2_analysis(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer) bind(c, name="cusparseDcsrsm2_analysis")
#else
    function hipsparseDcsrsm2_analysis(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer) bind(c, name="hipsparseDcsrsm2_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrsm2_analysis
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrsm2_analysis(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer) bind(c, name="cusparseCcsrsm2_analysis")
#else
    function hipsparseCcsrsm2_analysis(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer) bind(c, name="hipsparseCcsrsm2_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrsm2_analysis
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrsm2_analysis(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer) bind(c, name="cusparseZcsrsm2_analysis")
#else
    function hipsparseZcsrsm2_analysis(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer) bind(c, name="hipsparseZcsrsm2_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrsm2_analysis
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseScsrsm2_solve(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer) bind(c, name="cusparseScsrsm2_solve")
#else
    function hipsparseScsrsm2_solve(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer) bind(c, name="hipsparseScsrsm2_solve")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrsm2_solve
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrsm2_solve(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer) bind(c, name="cusparseDcsrsm2_solve")
#else
    function hipsparseDcsrsm2_solve(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer) bind(c, name="hipsparseDcsrsm2_solve")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrsm2_solve
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrsm2_solve(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer) bind(c, name="cusparseCcsrsm2_solve")
#else
    function hipsparseCcsrsm2_solve(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer) bind(c, name="hipsparseCcsrsm2_solve")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrsm2_solve
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrsm2_solve(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer) bind(c, name="cusparseZcsrsm2_solve")
#else
    function hipsparseZcsrsm2_solve(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,myInfo,policy,pBuffer) bind(c, name="hipsparseZcsrsm2_solve")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrsm2_solve
      type(c_ptr),value :: handle
      integer(c_int),value :: algo
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  !  Description: Matrix-matrix multiplication C = alpha  A  B + beta  C,
  !    where B is a sparse matrix in CSC storage format, A and C are dense matrices. 
#ifdef USE_CUDA_NAMES
    function hipsparseSgemmi(handle,m,n,k,nnz,alpha,A,lda,cscValB,cscColPtrB,cscRowIndB,beta,C,ldc) bind(c, name="cusparseSgemmi")
#else
    function hipsparseSgemmi(handle,m,n,k,nnz,alpha,A,lda,cscValB,cscColPtrB,cscRowIndB,beta,C,ldc) bind(c, name="hipsparseSgemmi")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSgemmi
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_float) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: cscValB
      type(c_ptr),value :: cscColPtrB
      type(c_ptr),value :: cscRowIndB
      real(c_float) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDgemmi(handle,m,n,k,nnz,alpha,A,lda,cscValB,cscColPtrB,cscRowIndB,beta,C,ldc) bind(c, name="cusparseDgemmi")
#else
    function hipsparseDgemmi(handle,m,n,k,nnz,alpha,A,lda,cscValB,cscColPtrB,cscRowIndB,beta,C,ldc) bind(c, name="hipsparseDgemmi")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDgemmi
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_double) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: cscValB
      type(c_ptr),value :: cscColPtrB
      type(c_ptr),value :: cscRowIndB
      real(c_double) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCgemmi(handle,m,n,k,nnz,alpha,A,lda,cscValB,cscColPtrB,cscRowIndB,beta,C,ldc) bind(c, name="cusparseCgemmi")
#else
    function hipsparseCgemmi(handle,m,n,k,nnz,alpha,A,lda,cscValB,cscColPtrB,cscRowIndB,beta,C,ldc) bind(c, name="hipsparseCgemmi")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCgemmi
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: cscValB
      type(c_ptr),value :: cscColPtrB
      type(c_ptr),value :: cscRowIndB
      complex(c_float_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZgemmi(handle,m,n,k,nnz,alpha,A,lda,cscValB,cscColPtrB,cscRowIndB,beta,C,ldc) bind(c, name="cusparseZgemmi")
#else
    function hipsparseZgemmi(handle,m,n,k,nnz,alpha,A,lda,cscValB,cscColPtrB,cscRowIndB,beta,C,ldc) bind(c, name="hipsparseZgemmi")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZgemmi
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: cscValB
      type(c_ptr),value :: cscColPtrB
      type(c_ptr),value :: cscRowIndB
      complex(c_double_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  !  Description: Sparse matrix sparse matrix addition C = alpha  A + beta  B, where A, B
  !    and C are sparse matrices in CSR storage format. 
#ifdef USE_CUDA_NAMES
    function hipsparseXcsrgeamNnz(handle,m,n,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,descrC,csrRowPtrC,nnzTotalDevHostPtr) bind(c, name="cusparseXcsrgeamNnz")
#else
    function hipsparseXcsrgeamNnz(handle,m,n,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,descrC,csrRowPtrC,nnzTotalDevHostPtr) bind(c, name="hipsparseXcsrgeamNnz")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsrgeamNnz
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: nnzTotalDevHostPtr
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseScsrgeam(handle,m,n,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,beta,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="cusparseScsrgeam")
#else
    function hipsparseScsrgeam(handle,m,n,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,beta,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="hipsparseScsrgeam")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrgeam
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      real(c_float) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrValB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrgeam(handle,m,n,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,beta,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="cusparseDcsrgeam")
#else
    function hipsparseDcsrgeam(handle,m,n,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,beta,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="hipsparseDcsrgeam")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrgeam
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      real(c_double) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrValB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrgeam(handle,m,n,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,beta,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="cusparseCcsrgeam")
#else
    function hipsparseCcsrgeam(handle,m,n,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,beta,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="hipsparseCcsrgeam")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrgeam
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      complex(c_float_complex) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrValB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrgeam(handle,m,n,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,beta,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="cusparseZcsrgeam")
#else
    function hipsparseZcsrgeam(handle,m,n,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,beta,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="hipsparseZcsrgeam")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrgeam
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      complex(c_double_complex) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrValB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseScsrgeam2_bufferSizeExt(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBufferSizeInBytes) bind(c, name="cusparseScsrgeam2_bufferSizeExt")
#else
    function hipsparseScsrgeam2_bufferSizeExt(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBufferSizeInBytes) bind(c, name="hipsparseScsrgeam2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrgeam2_bufferSizeExt
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      real(c_float) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrSortedValB
      type(c_ptr),value :: csrSortedRowPtrB
      type(c_ptr),value :: csrSortedColIndB
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrSortedValC
      type(c_ptr),value :: csrSortedRowPtrC
      type(c_ptr),value :: csrSortedColIndC
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrgeam2_bufferSizeExt(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBufferSizeInBytes) bind(c, name="cusparseDcsrgeam2_bufferSizeExt")
#else
    function hipsparseDcsrgeam2_bufferSizeExt(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBufferSizeInBytes) bind(c, name="hipsparseDcsrgeam2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrgeam2_bufferSizeExt
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      real(c_double) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrSortedValB
      type(c_ptr),value :: csrSortedRowPtrB
      type(c_ptr),value :: csrSortedColIndB
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrSortedValC
      type(c_ptr),value :: csrSortedRowPtrC
      type(c_ptr),value :: csrSortedColIndC
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrgeam2_bufferSizeExt(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBufferSizeInBytes) bind(c, name="cusparseCcsrgeam2_bufferSizeExt")
#else
    function hipsparseCcsrgeam2_bufferSizeExt(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBufferSizeInBytes) bind(c, name="hipsparseCcsrgeam2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrgeam2_bufferSizeExt
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      complex(c_float_complex) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrSortedValB
      type(c_ptr),value :: csrSortedRowPtrB
      type(c_ptr),value :: csrSortedColIndB
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrSortedValC
      type(c_ptr),value :: csrSortedRowPtrC
      type(c_ptr),value :: csrSortedColIndC
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrgeam2_bufferSizeExt(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBufferSizeInBytes) bind(c, name="cusparseZcsrgeam2_bufferSizeExt")
#else
    function hipsparseZcsrgeam2_bufferSizeExt(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBufferSizeInBytes) bind(c, name="hipsparseZcsrgeam2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrgeam2_bufferSizeExt
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      complex(c_double_complex) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrSortedValB
      type(c_ptr),value :: csrSortedRowPtrB
      type(c_ptr),value :: csrSortedColIndB
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrSortedValC
      type(c_ptr),value :: csrSortedRowPtrC
      type(c_ptr),value :: csrSortedColIndC
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseXcsrgeam2Nnz(handle,m,n,descrA,nnzA,csrSortedRowPtrA,csrSortedColIndA,descrB,nnzB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedRowPtrC,nnzTotalDevHostPtr,workspace) bind(c, name="cusparseXcsrgeam2Nnz")
#else
    function hipsparseXcsrgeam2Nnz(handle,m,n,descrA,nnzA,csrSortedRowPtrA,csrSortedColIndA,descrB,nnzB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedRowPtrC,nnzTotalDevHostPtr,workspace) bind(c, name="hipsparseXcsrgeam2Nnz")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsrgeam2Nnz
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrSortedRowPtrB
      type(c_ptr),value :: csrSortedColIndB
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrSortedRowPtrC
      type(c_ptr),value :: nnzTotalDevHostPtr
      type(c_ptr),value :: workspace
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseScsrgeam2(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBuffer) bind(c, name="cusparseScsrgeam2")
#else
    function hipsparseScsrgeam2(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBuffer) bind(c, name="hipsparseScsrgeam2")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrgeam2
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      real(c_float) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrSortedValB
      type(c_ptr),value :: csrSortedRowPtrB
      type(c_ptr),value :: csrSortedColIndB
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrSortedValC
      type(c_ptr),value :: csrSortedRowPtrC
      type(c_ptr),value :: csrSortedColIndC
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrgeam2(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBuffer) bind(c, name="cusparseDcsrgeam2")
#else
    function hipsparseDcsrgeam2(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBuffer) bind(c, name="hipsparseDcsrgeam2")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrgeam2
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      real(c_double) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrSortedValB
      type(c_ptr),value :: csrSortedRowPtrB
      type(c_ptr),value :: csrSortedColIndB
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrSortedValC
      type(c_ptr),value :: csrSortedRowPtrC
      type(c_ptr),value :: csrSortedColIndC
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrgeam2(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBuffer) bind(c, name="cusparseCcsrgeam2")
#else
    function hipsparseCcsrgeam2(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBuffer) bind(c, name="hipsparseCcsrgeam2")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrgeam2
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      complex(c_float_complex) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrSortedValB
      type(c_ptr),value :: csrSortedRowPtrB
      type(c_ptr),value :: csrSortedColIndB
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrSortedValC
      type(c_ptr),value :: csrSortedRowPtrC
      type(c_ptr),value :: csrSortedColIndC
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrgeam2(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBuffer) bind(c, name="cusparseZcsrgeam2")
#else
    function hipsparseZcsrgeam2(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBuffer) bind(c, name="hipsparseZcsrgeam2")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrgeam2
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      complex(c_double_complex) :: beta
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrSortedValB
      type(c_ptr),value :: csrSortedRowPtrB
      type(c_ptr),value :: csrSortedColIndB
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrSortedValC
      type(c_ptr),value :: csrSortedRowPtrC
      type(c_ptr),value :: csrSortedColIndC
      type(c_ptr),value :: pBuffer
    end function

  !  Description: Sparse matrix sparse matrix multiplication C = op(A)  op(B), where A, B
  !    and C are sparse matrices in CSR storage format. 
#ifdef USE_CUDA_NAMES
    function hipsparseXcsrgemmNnz(handle,transA,transB,m,n,k,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,descrC,csrRowPtrC,nnzTotalDevHostPtr) bind(c, name="cusparseXcsrgemmNnz")
#else
    function hipsparseXcsrgemmNnz(handle,transA,transB,m,n,k,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,descrC,csrRowPtrC,nnzTotalDevHostPtr) bind(c, name="hipsparseXcsrgemmNnz")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsrgemmNnz
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: nnzTotalDevHostPtr
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseScsrgemm(handle,transA,transB,m,n,k,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="cusparseScsrgemm")
#else
    function hipsparseScsrgemm(handle,transA,transB,m,n,k,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="hipsparseScsrgemm")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrgemm
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrValB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrgemm(handle,transA,transB,m,n,k,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="cusparseDcsrgemm")
#else
    function hipsparseDcsrgemm(handle,transA,transB,m,n,k,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="hipsparseDcsrgemm")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrgemm
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrValB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrgemm(handle,transA,transB,m,n,k,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="cusparseCcsrgemm")
#else
    function hipsparseCcsrgemm(handle,transA,transB,m,n,k,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="hipsparseCcsrgemm")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrgemm
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrValB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrgemm(handle,transA,transB,m,n,k,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="cusparseZcsrgemm")
#else
    function hipsparseZcsrgemm(handle,transA,transB,m,n,k,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="hipsparseZcsrgemm")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrgemm
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrValB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
    end function

  !  Description: Sparse matrix sparse matrix multiplication C = alpha  A  B + beta  D,
  !    where A, B and D are sparse matrices in CSR storage format. 
#ifdef USE_CUDA_NAMES
    function hipsparseScsrgemm2_bufferSizeExt(handle,m,n,k,alpha,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrRowPtrD,csrColIndD,myInfo,pBufferSizeInBytes) bind(c, name="cusparseScsrgemm2_bufferSizeExt")
#else
    function hipsparseScsrgemm2_bufferSizeExt(handle,m,n,k,alpha,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrRowPtrD,csrColIndD,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseScsrgemm2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrgemm2_bufferSizeExt
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      real(c_float) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      type(c_ptr),value :: csrRowPtrD
      type(c_ptr),value :: csrColIndD
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrgemm2_bufferSizeExt(handle,m,n,k,alpha,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrRowPtrD,csrColIndD,myInfo,pBufferSizeInBytes) bind(c, name="cusparseDcsrgemm2_bufferSizeExt")
#else
    function hipsparseDcsrgemm2_bufferSizeExt(handle,m,n,k,alpha,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrRowPtrD,csrColIndD,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseDcsrgemm2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrgemm2_bufferSizeExt
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      real(c_double) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      type(c_ptr),value :: csrRowPtrD
      type(c_ptr),value :: csrColIndD
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrgemm2_bufferSizeExt(handle,m,n,k,alpha,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrRowPtrD,csrColIndD,myInfo,pBufferSizeInBytes) bind(c, name="cusparseCcsrgemm2_bufferSizeExt")
#else
    function hipsparseCcsrgemm2_bufferSizeExt(handle,m,n,k,alpha,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrRowPtrD,csrColIndD,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseCcsrgemm2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrgemm2_bufferSizeExt
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      complex(c_float_complex) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      type(c_ptr),value :: csrRowPtrD
      type(c_ptr),value :: csrColIndD
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrgemm2_bufferSizeExt(handle,m,n,k,alpha,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrRowPtrD,csrColIndD,myInfo,pBufferSizeInBytes) bind(c, name="cusparseZcsrgemm2_bufferSizeExt")
#else
    function hipsparseZcsrgemm2_bufferSizeExt(handle,m,n,k,alpha,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrRowPtrD,csrColIndD,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseZcsrgemm2_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrgemm2_bufferSizeExt
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      complex(c_double_complex) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      type(c_ptr),value :: csrRowPtrD
      type(c_ptr),value :: csrColIndD
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseXcsrgemm2Nnz(handle,m,n,k,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,descrD,nnzD,csrRowPtrD,csrColIndD,descrC,csrRowPtrC,nnzTotalDevHostPtr,myInfo,pBuffer) bind(c, name="cusparseXcsrgemm2Nnz")
#else
    function hipsparseXcsrgemm2Nnz(handle,m,n,k,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,descrD,nnzD,csrRowPtrD,csrColIndD,descrC,csrRowPtrC,nnzTotalDevHostPtr,myInfo,pBuffer) bind(c, name="hipsparseXcsrgemm2Nnz")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsrgemm2Nnz
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      type(c_ptr),value :: csrRowPtrD
      type(c_ptr),value :: csrColIndD
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: nnzTotalDevHostPtr
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseScsrgemm2(handle,m,n,k,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrValD,csrRowPtrD,csrColIndD,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,pBuffer) bind(c, name="cusparseScsrgemm2")
#else
    function hipsparseScsrgemm2(handle,m,n,k,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrValD,csrRowPtrD,csrColIndD,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,pBuffer) bind(c, name="hipsparseScsrgemm2")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrgemm2
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrValB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      real(c_float) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      type(c_ptr),value :: csrValD
      type(c_ptr),value :: csrRowPtrD
      type(c_ptr),value :: csrColIndD
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrgemm2(handle,m,n,k,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrValD,csrRowPtrD,csrColIndD,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,pBuffer) bind(c, name="cusparseDcsrgemm2")
#else
    function hipsparseDcsrgemm2(handle,m,n,k,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrValD,csrRowPtrD,csrColIndD,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,pBuffer) bind(c, name="hipsparseDcsrgemm2")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrgemm2
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrValB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      real(c_double) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      type(c_ptr),value :: csrValD
      type(c_ptr),value :: csrRowPtrD
      type(c_ptr),value :: csrColIndD
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrgemm2(handle,m,n,k,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrValD,csrRowPtrD,csrColIndD,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,pBuffer) bind(c, name="cusparseCcsrgemm2")
#else
    function hipsparseCcsrgemm2(handle,m,n,k,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrValD,csrRowPtrD,csrColIndD,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,pBuffer) bind(c, name="hipsparseCcsrgemm2")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrgemm2
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrValB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      complex(c_float_complex) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      type(c_ptr),value :: csrValD
      type(c_ptr),value :: csrRowPtrD
      type(c_ptr),value :: csrColIndD
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrgemm2(handle,m,n,k,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrValD,csrRowPtrD,csrColIndD,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,pBuffer) bind(c, name="cusparseZcsrgemm2")
#else
    function hipsparseZcsrgemm2(handle,m,n,k,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrValD,csrRowPtrD,csrColIndD,descrC,csrValC,csrRowPtrC,csrColIndC,myInfo,pBuffer) bind(c, name="hipsparseZcsrgemm2")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrgemm2
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrValB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      complex(c_double_complex) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      type(c_ptr),value :: csrValD
      type(c_ptr),value :: csrRowPtrD
      type(c_ptr),value :: csrColIndD
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBuffer
    end function

  !  Description: Compute the incomplete-LU factorization with 0 fill-in (ILU0)
  !    of the matrix A stored in CSR format. 
#ifdef USE_CUDA_NAMES
    function hipsparseXcsrilu02_zeroPivot(handle,myInfo,position) bind(c, name="cusparseXcsrilu02_zeroPivot")
#else
    function hipsparseXcsrilu02_zeroPivot(handle,myInfo,position) bind(c, name="hipsparseXcsrilu02_zeroPivot")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsrilu02_zeroPivot
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: position
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseScsrilu02_bufferSize(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="cusparseScsrilu02_bufferSize")
#else
    function hipsparseScsrilu02_bufferSize(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseScsrilu02_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrilu02_bufferSize
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrilu02_bufferSize(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="cusparseDcsrilu02_bufferSize")
#else
    function hipsparseDcsrilu02_bufferSize(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseDcsrilu02_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrilu02_bufferSize
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrilu02_bufferSize(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="cusparseCcsrilu02_bufferSize")
#else
    function hipsparseCcsrilu02_bufferSize(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseCcsrilu02_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrilu02_bufferSize
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrilu02_bufferSize(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="cusparseZcsrilu02_bufferSize")
#else
    function hipsparseZcsrilu02_bufferSize(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseZcsrilu02_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrilu02_bufferSize
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseScsrilu02_bufferSizeExt(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="cusparseScsrilu02_bufferSizeExt")
#else
    function hipsparseScsrilu02_bufferSizeExt(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="hipsparseScsrilu02_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrilu02_bufferSizeExt
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBufferSize
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrilu02_bufferSizeExt(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="cusparseDcsrilu02_bufferSizeExt")
#else
    function hipsparseDcsrilu02_bufferSizeExt(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="hipsparseDcsrilu02_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrilu02_bufferSizeExt
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBufferSize
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrilu02_bufferSizeExt(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="cusparseCcsrilu02_bufferSizeExt")
#else
    function hipsparseCcsrilu02_bufferSizeExt(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="hipsparseCcsrilu02_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrilu02_bufferSizeExt
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBufferSize
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrilu02_bufferSizeExt(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="cusparseZcsrilu02_bufferSizeExt")
#else
    function hipsparseZcsrilu02_bufferSizeExt(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="hipsparseZcsrilu02_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrilu02_bufferSizeExt
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBufferSize
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseScsrilu02_analysis(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseScsrilu02_analysis")
#else
    function hipsparseScsrilu02_analysis(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseScsrilu02_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrilu02_analysis
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrilu02_analysis(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseDcsrilu02_analysis")
#else
    function hipsparseDcsrilu02_analysis(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseDcsrilu02_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrilu02_analysis
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrilu02_analysis(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseCcsrilu02_analysis")
#else
    function hipsparseCcsrilu02_analysis(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseCcsrilu02_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrilu02_analysis
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrilu02_analysis(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseZcsrilu02_analysis")
#else
    function hipsparseZcsrilu02_analysis(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseZcsrilu02_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrilu02_analysis
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseScsrilu02(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseScsrilu02")
#else
    function hipsparseScsrilu02(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseScsrilu02")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrilu02
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA_valM
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDcsrilu02(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseDcsrilu02")
#else
    function hipsparseDcsrilu02(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseDcsrilu02")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrilu02
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA_valM
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCcsrilu02(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseCcsrilu02")
#else
    function hipsparseCcsrilu02(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseCcsrilu02")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrilu02
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA_valM
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZcsrilu02(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseZcsrilu02")
#else
    function hipsparseZcsrilu02(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseZcsrilu02")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrilu02
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA_valM
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  !  Description: Compute the incomplete Cholesky factorization with 0 fill-in (IC0)
  !    of the matrix A stored in CSR format. 
#ifdef USE_CUDA_NAMES
    function hipsparseXcsric02_zeroPivot(handle,myInfo,position) bind(c, name="cusparseXcsric02_zeroPivot")
#else
    function hipsparseXcsric02_zeroPivot(handle,myInfo,position) bind(c, name="hipsparseXcsric02_zeroPivot")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsric02_zeroPivot
      type(c_ptr),value :: handle
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: position
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseScsric02_bufferSize(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="cusparseScsric02_bufferSize")
#else
    function hipsparseScsric02_bufferSize(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseScsric02_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsric02_bufferSize
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDcsric02_bufferSize(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="cusparseDcsric02_bufferSize")
#else
    function hipsparseDcsric02_bufferSize(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseDcsric02_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsric02_bufferSize
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCcsric02_bufferSize(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="cusparseCcsric02_bufferSize")
#else
    function hipsparseCcsric02_bufferSize(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseCcsric02_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsric02_bufferSize
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZcsric02_bufferSize(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="cusparseZcsric02_bufferSize")
#else
    function hipsparseZcsric02_bufferSize(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSizeInBytes) bind(c, name="hipsparseZcsric02_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsric02_bufferSize
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseScsric02_bufferSizeExt(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="cusparseScsric02_bufferSizeExt")
#else
    function hipsparseScsric02_bufferSizeExt(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="hipsparseScsric02_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsric02_bufferSizeExt
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBufferSize
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDcsric02_bufferSizeExt(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="cusparseDcsric02_bufferSizeExt")
#else
    function hipsparseDcsric02_bufferSizeExt(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="hipsparseDcsric02_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsric02_bufferSizeExt
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBufferSize
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCcsric02_bufferSizeExt(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="cusparseCcsric02_bufferSizeExt")
#else
    function hipsparseCcsric02_bufferSizeExt(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="hipsparseCcsric02_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsric02_bufferSizeExt
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBufferSize
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZcsric02_bufferSizeExt(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="cusparseZcsric02_bufferSizeExt")
#else
    function hipsparseZcsric02_bufferSizeExt(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,pBufferSize) bind(c, name="hipsparseZcsric02_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsric02_bufferSizeExt
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      type(c_ptr),value :: pBufferSize
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseScsric02_analysis(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseScsric02_analysis")
#else
    function hipsparseScsric02_analysis(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseScsric02_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsric02_analysis
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDcsric02_analysis(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseDcsric02_analysis")
#else
    function hipsparseDcsric02_analysis(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseDcsric02_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsric02_analysis
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCcsric02_analysis(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseCcsric02_analysis")
#else
    function hipsparseCcsric02_analysis(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseCcsric02_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsric02_analysis
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZcsric02_analysis(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseZcsric02_analysis")
#else
    function hipsparseZcsric02_analysis(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseZcsric02_analysis")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsric02_analysis
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseScsric02(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseScsric02")
#else
    function hipsparseScsric02(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseScsric02")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsric02
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA_valM
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDcsric02(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseDcsric02")
#else
    function hipsparseDcsric02(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseDcsric02")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsric02
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA_valM
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCcsric02(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseCcsric02")
#else
    function hipsparseCcsric02(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseCcsric02")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsric02
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA_valM
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZcsric02(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="cusparseZcsric02")
#else
    function hipsparseZcsric02(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,myInfo,policy,pBuffer) bind(c, name="hipsparseZcsric02")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsric02
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA_valM
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: myInfo
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  !  Description: 
  !    This function computes the number of nonzero elements per row or column and the total number of nonzero elements in a dense matrix. 
#ifdef USE_CUDA_NAMES
    function hipsparseSnnz(handle,dirA,m,n,descrA,A,lda,nnzPerRowColumn,nnzTotalDevHostPtr) bind(c, name="cusparseSnnz")
#else
    function hipsparseSnnz(handle,dirA,m,n,descrA,A,lda,nnzPerRowColumn,nnzTotalDevHostPtr) bind(c, name="hipsparseSnnz")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSnnz
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: nnzPerRowColumn
      type(c_ptr),value :: nnzTotalDevHostPtr
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDnnz(handle,dirA,m,n,descrA,A,lda,nnzPerRowColumn,nnzTotalDevHostPtr) bind(c, name="cusparseDnnz")
#else
    function hipsparseDnnz(handle,dirA,m,n,descrA,A,lda,nnzPerRowColumn,nnzTotalDevHostPtr) bind(c, name="hipsparseDnnz")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDnnz
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: nnzPerRowColumn
      type(c_ptr),value :: nnzTotalDevHostPtr
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCnnz(handle,dirA,m,n,descrA,A,lda,nnzPerRowColumn,nnzTotalDevHostPtr) bind(c, name="cusparseCnnz")
#else
    function hipsparseCnnz(handle,dirA,m,n,descrA,A,lda,nnzPerRowColumn,nnzTotalDevHostPtr) bind(c, name="hipsparseCnnz")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCnnz
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: nnzPerRowColumn
      type(c_ptr),value :: nnzTotalDevHostPtr
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZnnz(handle,dirA,m,n,descrA,A,lda,nnzPerRowColumn,nnzTotalDevHostPtr) bind(c, name="cusparseZnnz")
#else
    function hipsparseZnnz(handle,dirA,m,n,descrA,A,lda,nnzPerRowColumn,nnzTotalDevHostPtr) bind(c, name="hipsparseZnnz")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZnnz
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: nnzPerRowColumn
      type(c_ptr),value :: nnzTotalDevHostPtr
    end function

  !  Description: 
  !    This function converts the matrix A in dense format into a sparse matrix in CSR format. 
#ifdef USE_CUDA_NAMES
    function hipsparseSdense2csr(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="cusparseSdense2csr")
#else
    function hipsparseSdense2csr(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="hipsparseSdense2csr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSdense2csr
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
      type(c_ptr),value :: nnz_per_rows
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDdense2csr(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="cusparseDdense2csr")
#else
    function hipsparseDdense2csr(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="hipsparseDdense2csr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDdense2csr
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
      type(c_ptr),value :: nnz_per_rows
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCdense2csr(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="cusparseCdense2csr")
#else
    function hipsparseCdense2csr(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="hipsparseCdense2csr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCdense2csr
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
      type(c_ptr),value :: nnz_per_rows
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZdense2csr(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="cusparseZdense2csr")
#else
    function hipsparseZdense2csr(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="hipsparseZdense2csr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZdense2csr
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
      type(c_ptr),value :: nnz_per_rows
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
    end function

  !  Description: 
  !    This function converts the matrix A in dense format into a sparse matrix in CSC format 
#ifdef USE_CUDA_NAMES
    function hipsparseSdense2csc(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_row_ind,csc_col_ptr) bind(c, name="cusparseSdense2csc")
#else
    function hipsparseSdense2csc(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_row_ind,csc_col_ptr) bind(c, name="hipsparseSdense2csc")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSdense2csc
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
      type(c_ptr),value :: nnz_per_columns
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_row_ind
      type(c_ptr),value :: csc_col_ptr
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDdense2csc(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_row_ind,csc_col_ptr) bind(c, name="cusparseDdense2csc")
#else
    function hipsparseDdense2csc(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_row_ind,csc_col_ptr) bind(c, name="hipsparseDdense2csc")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDdense2csc
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
      type(c_ptr),value :: nnz_per_columns
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_row_ind
      type(c_ptr),value :: csc_col_ptr
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCdense2csc(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_row_ind,csc_col_ptr) bind(c, name="cusparseCdense2csc")
#else
    function hipsparseCdense2csc(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_row_ind,csc_col_ptr) bind(c, name="hipsparseCdense2csc")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCdense2csc
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
      type(c_ptr),value :: nnz_per_columns
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_row_ind
      type(c_ptr),value :: csc_col_ptr
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZdense2csc(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_row_ind,csc_col_ptr) bind(c, name="cusparseZdense2csc")
#else
    function hipsparseZdense2csc(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_row_ind,csc_col_ptr) bind(c, name="hipsparseZdense2csc")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZdense2csc
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
      type(c_ptr),value :: nnz_per_columns
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_row_ind
      type(c_ptr),value :: csc_col_ptr
    end function

  !  Description:
  !    This function converts the sparse matrix in CSR format into a dense matrix 
#ifdef USE_CUDA_NAMES
    function hipsparseScsr2dense(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld) bind(c, name="cusparseScsr2dense")
#else
    function hipsparseScsr2dense(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld) bind(c, name="hipsparseScsr2dense")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsr2dense
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: A
      integer(c_int),value :: ld
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDcsr2dense(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld) bind(c, name="cusparseDcsr2dense")
#else
    function hipsparseDcsr2dense(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld) bind(c, name="hipsparseDcsr2dense")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsr2dense
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: A
      integer(c_int),value :: ld
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCcsr2dense(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld) bind(c, name="cusparseCcsr2dense")
#else
    function hipsparseCcsr2dense(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld) bind(c, name="hipsparseCcsr2dense")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsr2dense
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: A
      integer(c_int),value :: ld
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZcsr2dense(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld) bind(c, name="cusparseZcsr2dense")
#else
    function hipsparseZcsr2dense(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld) bind(c, name="hipsparseZcsr2dense")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsr2dense
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: A
      integer(c_int),value :: ld
    end function

  !  Description:
  !    This function converts the sparse matrix in CSC format into a dense matrix. 
#ifdef USE_CUDA_NAMES
    function hipsparseScsc2dense(handle,m,n,descr,csc_val,csc_row_ind,csc_col_ptr,A,ld) bind(c, name="cusparseScsc2dense")
#else
    function hipsparseScsc2dense(handle,m,n,descr,csc_val,csc_row_ind,csc_col_ptr,A,ld) bind(c, name="hipsparseScsc2dense")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsc2dense
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_row_ind
      type(c_ptr),value :: csc_col_ptr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDcsc2dense(handle,m,n,descr,csc_val,csc_row_ind,csc_col_ptr,A,ld) bind(c, name="cusparseDcsc2dense")
#else
    function hipsparseDcsc2dense(handle,m,n,descr,csc_val,csc_row_ind,csc_col_ptr,A,ld) bind(c, name="hipsparseDcsc2dense")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsc2dense
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_row_ind
      type(c_ptr),value :: csc_col_ptr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCcsc2dense(handle,m,n,descr,csc_val,csc_row_ind,csc_col_ptr,A,ld) bind(c, name="cusparseCcsc2dense")
#else
    function hipsparseCcsc2dense(handle,m,n,descr,csc_val,csc_row_ind,csc_col_ptr,A,ld) bind(c, name="hipsparseCcsc2dense")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsc2dense
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_row_ind
      type(c_ptr),value :: csc_col_ptr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZcsc2dense(handle,m,n,descr,csc_val,csc_row_ind,csc_col_ptr,A,ld) bind(c, name="cusparseZcsc2dense")
#else
    function hipsparseZcsc2dense(handle,m,n,descr,csc_val,csc_row_ind,csc_col_ptr,A,ld) bind(c, name="hipsparseZcsc2dense")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsc2dense
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descr
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_row_ind
      type(c_ptr),value :: csc_col_ptr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
    end function

  !  Description:
  !    This function computes the number of nonzero block columns per block row and the total number of blocks in the BSR 
  !    matrix where the BSR matrix is formed by converting the input CSR matrix. 
#ifdef USE_CUDA_NAMES
    function hipsparseXcsr2bsrNnz(handle,dirA,m,n,descrA,csrRowPtrA,csrColIndA,blockDim,descrC,bsrRowPtrC,bsrNnzb) bind(c, name="cusparseXcsr2bsrNnz")
#else
    function hipsparseXcsr2bsrNnz(handle,dirA,m,n,descrA,csrRowPtrA,csrColIndA,blockDim,descrC,bsrRowPtrC,bsrNnzb) bind(c, name="hipsparseXcsr2bsrNnz")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsr2bsrNnz
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: descrC
      type(c_ptr),value :: bsrRowPtrC
      type(c_ptr),value :: bsrNnzb
    end function

  !  Description:
  !    This function computes the number of nonzero elements per row and the total number of nonzero elements 
  !    in the compressed version of the input CSR matrix where the matrix is compressed by removing elements 
  !    less than pr equal to the tolerance. 
#ifdef USE_CUDA_NAMES
    function hipsparseSnnz_compress(handle,m,descrA,csrValA,csrRowPtrA,nnzPerRow,nnzC,tol) bind(c, name="cusparseSnnz_compress")
#else
    function hipsparseSnnz_compress(handle,m,descrA,csrValA,csrRowPtrA,nnzPerRow,nnzC,tol) bind(c, name="hipsparseSnnz_compress")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSnnz_compress
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: nnzPerRow
      type(c_ptr),value :: nnzC
      real(c_float),value :: tol
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDnnz_compress(handle,m,descrA,csrValA,csrRowPtrA,nnzPerRow,nnzC,tol) bind(c, name="cusparseDnnz_compress")
#else
    function hipsparseDnnz_compress(handle,m,descrA,csrValA,csrRowPtrA,nnzPerRow,nnzC,tol) bind(c, name="hipsparseDnnz_compress")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDnnz_compress
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: nnzPerRow
      type(c_ptr),value :: nnzC
      real(c_double),value :: tol
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCnnz_compress(handle,m,descrA,csrValA,csrRowPtrA,nnzPerRow,nnzC,tol) bind(c, name="cusparseCnnz_compress")
#else
    function hipsparseCnnz_compress(handle,m,descrA,csrValA,csrRowPtrA,nnzPerRow,nnzC,tol) bind(c, name="hipsparseCnnz_compress")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCnnz_compress
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: nnzPerRow
      type(c_ptr),value :: nnzC
      complex(c_float_complex),value :: tol
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZnnz_compress(handle,m,descrA,csrValA,csrRowPtrA,nnzPerRow,nnzC,tol) bind(c, name="cusparseZnnz_compress")
#else
    function hipsparseZnnz_compress(handle,m,descrA,csrValA,csrRowPtrA,nnzPerRow,nnzC,tol) bind(c, name="hipsparseZnnz_compress")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZnnz_compress
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: nnzPerRow
      type(c_ptr),value :: nnzC
      complex(c_double_complex),value :: tol
    end function

  !  Description: This routine converts a sparse matrix in CSR storage format
  !    to a sparse matrix in COO storage format. 
#ifdef USE_CUDA_NAMES
    function hipsparseXcsr2coo(handle,csrRowPtr,nnz,m,cooRowInd,idxBase) bind(c, name="cusparseXcsr2coo")
#else
    function hipsparseXcsr2coo(handle,csrRowPtr,nnz,m,cooRowInd,idxBase) bind(c, name="hipsparseXcsr2coo")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsr2coo
      type(c_ptr),value :: handle
      type(c_ptr),value :: csrRowPtr
      integer(c_int),value :: nnz
      integer(c_int),value :: m
      type(c_ptr),value :: cooRowInd
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

  !  Description: This routine converts a sparse matrix in CSR storage format
  !    to a sparse matrix in CSC storage format. 
#ifdef USE_CUDA_NAMES
    function hipsparseScsr2csc(handle,m,n,nnz,csrSortedVal,csrSortedRowPtr,csrSortedColInd,cscSortedVal,cscSortedRowInd,cscSortedColPtr,copyValues,idxBase) bind(c, name="cusparseScsr2csc")
#else
    function hipsparseScsr2csc(handle,m,n,nnz,csrSortedVal,csrSortedRowPtr,csrSortedColInd,cscSortedVal,cscSortedRowInd,cscSortedColPtr,copyValues,idxBase) bind(c, name="hipsparseScsr2csc")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsr2csc
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: csrSortedVal
      type(c_ptr),value :: csrSortedRowPtr
      type(c_ptr),value :: csrSortedColInd
      type(c_ptr),value :: cscSortedVal
      type(c_ptr),value :: cscSortedRowInd
      type(c_ptr),value :: cscSortedColPtr
      integer(kind(HIPSPARSE_ACTION_SYMBOLIC)),value :: copyValues
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDcsr2csc(handle,m,n,nnz,csrSortedVal,csrSortedRowPtr,csrSortedColInd,cscSortedVal,cscSortedRowInd,cscSortedColPtr,copyValues,idxBase) bind(c, name="cusparseDcsr2csc")
#else
    function hipsparseDcsr2csc(handle,m,n,nnz,csrSortedVal,csrSortedRowPtr,csrSortedColInd,cscSortedVal,cscSortedRowInd,cscSortedColPtr,copyValues,idxBase) bind(c, name="hipsparseDcsr2csc")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsr2csc
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: csrSortedVal
      type(c_ptr),value :: csrSortedRowPtr
      type(c_ptr),value :: csrSortedColInd
      type(c_ptr),value :: cscSortedVal
      type(c_ptr),value :: cscSortedRowInd
      type(c_ptr),value :: cscSortedColPtr
      integer(kind(HIPSPARSE_ACTION_SYMBOLIC)),value :: copyValues
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCcsr2csc(handle,m,n,nnz,csrSortedVal,csrSortedRowPtr,csrSortedColInd,cscSortedVal,cscSortedRowInd,cscSortedColPtr,copyValues,idxBase) bind(c, name="cusparseCcsr2csc")
#else
    function hipsparseCcsr2csc(handle,m,n,nnz,csrSortedVal,csrSortedRowPtr,csrSortedColInd,cscSortedVal,cscSortedRowInd,cscSortedColPtr,copyValues,idxBase) bind(c, name="hipsparseCcsr2csc")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsr2csc
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: csrSortedVal
      type(c_ptr),value :: csrSortedRowPtr
      type(c_ptr),value :: csrSortedColInd
      type(c_ptr),value :: cscSortedVal
      type(c_ptr),value :: cscSortedRowInd
      type(c_ptr),value :: cscSortedColPtr
      integer(kind(HIPSPARSE_ACTION_SYMBOLIC)),value :: copyValues
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZcsr2csc(handle,m,n,nnz,csrSortedVal,csrSortedRowPtr,csrSortedColInd,cscSortedVal,cscSortedRowInd,cscSortedColPtr,copyValues,idxBase) bind(c, name="cusparseZcsr2csc")
#else
    function hipsparseZcsr2csc(handle,m,n,nnz,csrSortedVal,csrSortedRowPtr,csrSortedColInd,cscSortedVal,cscSortedRowInd,cscSortedColPtr,copyValues,idxBase) bind(c, name="hipsparseZcsr2csc")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsr2csc
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: csrSortedVal
      type(c_ptr),value :: csrSortedRowPtr
      type(c_ptr),value :: csrSortedColInd
      type(c_ptr),value :: cscSortedVal
      type(c_ptr),value :: cscSortedRowInd
      type(c_ptr),value :: cscSortedColPtr
      integer(kind(HIPSPARSE_ACTION_SYMBOLIC)),value :: copyValues
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

  !  Description: This routine converts a sparse matrix in CSR storage format
  !    to a sparse matrix in HYB storage format. 
#ifdef USE_CUDA_NAMES
    function hipsparseScsr2hyb(handle,m,n,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,hybA,userEllWidth,partitionType) bind(c, name="cusparseScsr2hyb")
#else
    function hipsparseScsr2hyb(handle,m,n,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,hybA,userEllWidth,partitionType) bind(c, name="hipsparseScsr2hyb")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsr2hyb
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: hybA
      integer(c_int),value :: userEllWidth
      integer(kind(HIPSPARSE_HYB_PARTITION_AUTO)),value :: partitionType
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDcsr2hyb(handle,m,n,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,hybA,userEllWidth,partitionType) bind(c, name="cusparseDcsr2hyb")
#else
    function hipsparseDcsr2hyb(handle,m,n,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,hybA,userEllWidth,partitionType) bind(c, name="hipsparseDcsr2hyb")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsr2hyb
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: hybA
      integer(c_int),value :: userEllWidth
      integer(kind(HIPSPARSE_HYB_PARTITION_AUTO)),value :: partitionType
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCcsr2hyb(handle,m,n,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,hybA,userEllWidth,partitionType) bind(c, name="cusparseCcsr2hyb")
#else
    function hipsparseCcsr2hyb(handle,m,n,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,hybA,userEllWidth,partitionType) bind(c, name="hipsparseCcsr2hyb")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsr2hyb
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: hybA
      integer(c_int),value :: userEllWidth
      integer(kind(HIPSPARSE_HYB_PARTITION_AUTO)),value :: partitionType
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZcsr2hyb(handle,m,n,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,hybA,userEllWidth,partitionType) bind(c, name="cusparseZcsr2hyb")
#else
    function hipsparseZcsr2hyb(handle,m,n,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,hybA,userEllWidth,partitionType) bind(c, name="hipsparseZcsr2hyb")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsr2hyb
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: hybA
      integer(c_int),value :: userEllWidth
      integer(kind(HIPSPARSE_HYB_PARTITION_AUTO)),value :: partitionType
    end function

  !  Description: This routine converts a sparse matrix in CSR storage format
  !    to a sparse matrix in BSR storage format. 
#ifdef USE_CUDA_NAMES
    function hipsparseScsr2bsr(handle,dirA,m,n,descrA,csrValA,csrRowPtrA,csrColIndA,blockDim,descrC,bsrValC,bsrRowPtrC,bsrColIndC) bind(c, name="cusparseScsr2bsr")
#else
    function hipsparseScsr2bsr(handle,dirA,m,n,descrA,csrValA,csrRowPtrA,csrColIndA,blockDim,descrC,bsrValC,bsrRowPtrC,bsrColIndC) bind(c, name="hipsparseScsr2bsr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsr2bsr
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: descrC
      type(c_ptr),value :: bsrValC
      type(c_ptr),value :: bsrRowPtrC
      type(c_ptr),value :: bsrColIndC
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDcsr2bsr(handle,dirA,m,n,descrA,csrValA,csrRowPtrA,csrColIndA,blockDim,descrC,bsrValC,bsrRowPtrC,bsrColIndC) bind(c, name="cusparseDcsr2bsr")
#else
    function hipsparseDcsr2bsr(handle,dirA,m,n,descrA,csrValA,csrRowPtrA,csrColIndA,blockDim,descrC,bsrValC,bsrRowPtrC,bsrColIndC) bind(c, name="hipsparseDcsr2bsr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsr2bsr
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: descrC
      type(c_ptr),value :: bsrValC
      type(c_ptr),value :: bsrRowPtrC
      type(c_ptr),value :: bsrColIndC
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCcsr2bsr(handle,dirA,m,n,descrA,csrValA,csrRowPtrA,csrColIndA,blockDim,descrC,bsrValC,bsrRowPtrC,bsrColIndC) bind(c, name="cusparseCcsr2bsr")
#else
    function hipsparseCcsr2bsr(handle,dirA,m,n,descrA,csrValA,csrRowPtrA,csrColIndA,blockDim,descrC,bsrValC,bsrRowPtrC,bsrColIndC) bind(c, name="hipsparseCcsr2bsr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsr2bsr
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: descrC
      type(c_ptr),value :: bsrValC
      type(c_ptr),value :: bsrRowPtrC
      type(c_ptr),value :: bsrColIndC
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZcsr2bsr(handle,dirA,m,n,descrA,csrValA,csrRowPtrA,csrColIndA,blockDim,descrC,bsrValC,bsrRowPtrC,bsrColIndC) bind(c, name="cusparseZcsr2bsr")
#else
    function hipsparseZcsr2bsr(handle,dirA,m,n,descrA,csrValA,csrRowPtrA,csrColIndA,blockDim,descrC,bsrValC,bsrRowPtrC,bsrColIndC) bind(c, name="hipsparseZcsr2bsr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsr2bsr
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: descrC
      type(c_ptr),value :: bsrValC
      type(c_ptr),value :: bsrRowPtrC
      type(c_ptr),value :: bsrColIndC
    end function

  !  Description: This routine converts a sparse matrix in BSR storage format
  !    to a sparse matrix in CSR storage format. 
#ifdef USE_CUDA_NAMES
    function hipsparseSbsr2csr(handle,dirA,mb,nb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="cusparseSbsr2csr")
#else
    function hipsparseSbsr2csr(handle,dirA,mb,nb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="hipsparseSbsr2csr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSbsr2csr
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrValA
      type(c_ptr),value :: bsrRowPtrA
      type(c_ptr),value :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDbsr2csr(handle,dirA,mb,nb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="cusparseDbsr2csr")
#else
    function hipsparseDbsr2csr(handle,dirA,mb,nb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="hipsparseDbsr2csr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDbsr2csr
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrValA
      type(c_ptr),value :: bsrRowPtrA
      type(c_ptr),value :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCbsr2csr(handle,dirA,mb,nb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="cusparseCbsr2csr")
#else
    function hipsparseCbsr2csr(handle,dirA,mb,nb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="hipsparseCbsr2csr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCbsr2csr
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrValA
      type(c_ptr),value :: bsrRowPtrA
      type(c_ptr),value :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZbsr2csr(handle,dirA,mb,nb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="cusparseZbsr2csr")
#else
    function hipsparseZbsr2csr(handle,dirA,mb,nb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="hipsparseZbsr2csr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZbsr2csr
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_DIRECTION_ROW)),value :: dirA
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrValA
      type(c_ptr),value :: bsrRowPtrA
      type(c_ptr),value :: bsrColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
    end function

  !  Description: This routine compresses the input CSR matrix by removing elements that 
  !    are less than or equal to the non-negative tolerance 
#ifdef USE_CUDA_NAMES
    function hipsparseScsr2csr_compress(handle,m,n,descrA,csrValA,csrColIndA,csrRowPtrA,nnzA,nnzPerRow,csrValC,csrColIndC,csrRowPtrC,tol) bind(c, name="cusparseScsr2csr_compress")
#else
    function hipsparseScsr2csr_compress(handle,m,n,descrA,csrValA,csrColIndA,csrRowPtrA,nnzA,nnzPerRow,csrValC,csrColIndC,csrRowPtrC,tol) bind(c, name="hipsparseScsr2csr_compress")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsr2csr_compress
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: csrRowPtrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: nnzPerRow
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrColIndC
      type(c_ptr),value :: csrRowPtrC
      real(c_float),value :: tol
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDcsr2csr_compress(handle,m,n,descrA,csrValA,csrColIndA,csrRowPtrA,nnzA,nnzPerRow,csrValC,csrColIndC,csrRowPtrC,tol) bind(c, name="cusparseDcsr2csr_compress")
#else
    function hipsparseDcsr2csr_compress(handle,m,n,descrA,csrValA,csrColIndA,csrRowPtrA,nnzA,nnzPerRow,csrValC,csrColIndC,csrRowPtrC,tol) bind(c, name="hipsparseDcsr2csr_compress")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsr2csr_compress
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: csrRowPtrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: nnzPerRow
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrColIndC
      type(c_ptr),value :: csrRowPtrC
      real(c_double),value :: tol
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseCcsr2csr_compress(handle,m,n,descrA,csrValA,csrColIndA,csrRowPtrA,nnzA,nnzPerRow,csrValC,csrColIndC,csrRowPtrC,tol) bind(c, name="cusparseCcsr2csr_compress")
#else
    function hipsparseCcsr2csr_compress(handle,m,n,descrA,csrValA,csrColIndA,csrRowPtrA,nnzA,nnzPerRow,csrValC,csrColIndC,csrRowPtrC,tol) bind(c, name="hipsparseCcsr2csr_compress")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsr2csr_compress
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: csrRowPtrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: nnzPerRow
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrColIndC
      type(c_ptr),value :: csrRowPtrC
      complex(c_float_complex),value :: tol
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZcsr2csr_compress(handle,m,n,descrA,csrValA,csrColIndA,csrRowPtrA,nnzA,nnzPerRow,csrValC,csrColIndC,csrRowPtrC,tol) bind(c, name="cusparseZcsr2csr_compress")
#else
    function hipsparseZcsr2csr_compress(handle,m,n,descrA,csrValA,csrColIndA,csrRowPtrA,nnzA,nnzPerRow,csrValC,csrColIndC,csrRowPtrC,tol) bind(c, name="hipsparseZcsr2csr_compress")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsr2csr_compress
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: csrRowPtrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: nnzPerRow
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrColIndC
      type(c_ptr),value :: csrRowPtrC
      complex(c_double_complex),value :: tol
    end function

  !  Description: This routine converts a sparse matrix in HYB storage format
  !    to a sparse matrix in CSR storage format. 
#ifdef USE_CUDA_NAMES
    function hipsparseShyb2csr(handle,descrA,hybA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA) bind(c, name="cusparseShyb2csr")
#else
    function hipsparseShyb2csr(handle,descrA,hybA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA) bind(c, name="hipsparseShyb2csr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseShyb2csr
      type(c_ptr),value :: handle
      type(c_ptr),value :: descrA
      type(c_ptr),value :: hybA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseDhyb2csr(handle,descrA,hybA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA) bind(c, name="cusparseDhyb2csr")
#else
    function hipsparseDhyb2csr(handle,descrA,hybA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA) bind(c, name="hipsparseDhyb2csr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDhyb2csr
      type(c_ptr),value :: handle
      type(c_ptr),value :: descrA
      type(c_ptr),value :: hybA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseChyb2csr(handle,descrA,hybA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA) bind(c, name="cusparseChyb2csr")
#else
    function hipsparseChyb2csr(handle,descrA,hybA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA) bind(c, name="hipsparseChyb2csr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseChyb2csr
      type(c_ptr),value :: handle
      type(c_ptr),value :: descrA
      type(c_ptr),value :: hybA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
    end function

  
#ifdef USE_CUDA_NAMES
    function hipsparseZhyb2csr(handle,descrA,hybA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA) bind(c, name="cusparseZhyb2csr")
#else
    function hipsparseZhyb2csr(handle,descrA,hybA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA) bind(c, name="hipsparseZhyb2csr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZhyb2csr
      type(c_ptr),value :: handle
      type(c_ptr),value :: descrA
      type(c_ptr),value :: hybA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
    end function

  !  Description: This routine converts a sparse matrix in COO storage format
  !    to a sparse matrix in CSR storage format. 
#ifdef USE_CUDA_NAMES
    function hipsparseXcoo2csr(handle,cooRowInd,nnz,m,csrRowPtr,idxBase) bind(c, name="cusparseXcoo2csr")
#else
    function hipsparseXcoo2csr(handle,cooRowInd,nnz,m,csrRowPtr,idxBase) bind(c, name="hipsparseXcoo2csr")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcoo2csr
      type(c_ptr),value :: handle
      type(c_ptr),value :: cooRowInd
      integer(c_int),value :: nnz
      integer(c_int),value :: m
      type(c_ptr),value :: csrRowPtr
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

  !  Description: This routine creates an identity map. 
#ifdef USE_CUDA_NAMES
    function hipsparseCreateIdentityPermutation(handle,n,p) bind(c, name="cusparseCreateIdentityPermutation")
#else
    function hipsparseCreateIdentityPermutation(handle,n,p) bind(c, name="hipsparseCreateIdentityPermutation")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCreateIdentityPermutation
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: p
    end function

  !  Description: This routine computes the required buffer size for csrsort. 
#ifdef USE_CUDA_NAMES
    function hipsparseXcsrsort_bufferSizeExt(handle,m,n,nnz,csrRowPtr,csrColInd,pBufferSizeInBytes) bind(c, name="cusparseXcsrsort_bufferSizeExt")
#else
    function hipsparseXcsrsort_bufferSizeExt(handle,m,n,nnz,csrRowPtr,csrColInd,pBufferSizeInBytes) bind(c, name="hipsparseXcsrsort_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsrsort_bufferSizeExt
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: csrRowPtr
      type(c_ptr),value :: csrColInd
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  !  Description: This routine sorts CSR format. 
#ifdef USE_CUDA_NAMES
    function hipsparseXcsrsort(handle,m,n,nnz,descrA,csrRowPtr,csrColInd,P,pBuffer) bind(c, name="cusparseXcsrsort")
#else
    function hipsparseXcsrsort(handle,m,n,nnz,descrA,csrRowPtr,csrColInd,P,pBuffer) bind(c, name="hipsparseXcsrsort")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsrsort
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrRowPtr
      type(c_ptr),value :: csrColInd
      type(c_ptr),value :: P
      type(c_ptr),value :: pBuffer
    end function

  !  Description: This routine computes the required buffer size for cscsort. 
#ifdef USE_CUDA_NAMES
    function hipsparseXcscsort_bufferSizeExt(handle,m,n,nnz,cscColPtr,cscRowInd,pBufferSizeInBytes) bind(c, name="cusparseXcscsort_bufferSizeExt")
#else
    function hipsparseXcscsort_bufferSizeExt(handle,m,n,nnz,cscColPtr,cscRowInd,pBufferSizeInBytes) bind(c, name="hipsparseXcscsort_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcscsort_bufferSizeExt
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: cscColPtr
      type(c_ptr),value :: cscRowInd
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  !  Description: This routine sorts CSR format. 
#ifdef USE_CUDA_NAMES
    function hipsparseXcscsort(handle,m,n,nnz,descrA,cscColPtr,cscRowInd,P,pBuffer) bind(c, name="cusparseXcscsort")
#else
    function hipsparseXcscsort(handle,m,n,nnz,descrA,cscColPtr,cscRowInd,P,pBuffer) bind(c, name="hipsparseXcscsort")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcscsort
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: descrA
      type(c_ptr),value :: cscColPtr
      type(c_ptr),value :: cscRowInd
      type(c_ptr),value :: P
      type(c_ptr),value :: pBuffer
    end function

  !  Description: This routine computes the required buffer size for coosort. 
#ifdef USE_CUDA_NAMES
    function hipsparseXcoosort_bufferSizeExt(handle,m,n,nnz,cooRows,cooCols,pBufferSizeInBytes) bind(c, name="cusparseXcoosort_bufferSizeExt")
#else
    function hipsparseXcoosort_bufferSizeExt(handle,m,n,nnz,cooRows,cooCols,pBufferSizeInBytes) bind(c, name="hipsparseXcoosort_bufferSizeExt")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcoosort_bufferSizeExt
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: cooRows
      type(c_ptr),value :: cooCols
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  !  Description: This routine sorts COO format by rows. 
#ifdef USE_CUDA_NAMES
    function hipsparseXcoosortByRow(handle,m,n,nnz,cooRows,cooCols,P,pBuffer) bind(c, name="cusparseXcoosortByRow")
#else
    function hipsparseXcoosortByRow(handle,m,n,nnz,cooRows,cooCols,P,pBuffer) bind(c, name="hipsparseXcoosortByRow")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcoosortByRow
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: cooRows
      type(c_ptr),value :: cooCols
      type(c_ptr),value :: P
      type(c_ptr),value :: pBuffer
    end function

  !  Description: This routine sorts COO format by columns. 
#ifdef USE_CUDA_NAMES
    function hipsparseXcoosortByColumn(handle,m,n,nnz,cooRows,cooCols,P,pBuffer) bind(c, name="cusparseXcoosortByColumn")
#else
    function hipsparseXcoosortByColumn(handle,m,n,nnz,cooRows,cooCols,P,pBuffer) bind(c, name="hipsparseXcoosortByColumn")
#endif
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcoosortByColumn
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: cooRows
      type(c_ptr),value :: cooCols
      type(c_ptr),value :: P
      type(c_ptr),value :: pBuffer
    end function

  end interface
  
end module hipfort_hipsparse