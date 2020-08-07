!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Copyright (c) 2020 Advanced Micro Devices, Inc.
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
! FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
! AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
! LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
! OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
! THE SOFTWARE.
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          
           
module hipfort_hipsparse
  use hipfort_hipsparse_enums
  implicit none

 
  interface
  !  hipSPARSE initialization and management routines 
    function hipsparseCreate(handle) bind(c, name="hipsparseCreate")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCreate
      type(c_ptr),intent(INOUT) :: handle
    end function

  
    function hipsparseDestroy(handle) bind(c, name="hipsparseDestroy")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDestroy
      type(c_ptr),value :: handle
    end function

  
    function hipsparseGetVersion(handle,version) bind(c, name="hipsparseGetVersion")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseGetVersion
      type(c_ptr),value :: handle
      type(c_ptr),value :: version
    end function

  
    function hipsparseGetGitRevision(handle,rev) bind(c, name="hipsparseGetGitRevision")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseGetGitRevision
      type(c_ptr),value :: handle
      type(c_ptr),value :: rev
    end function

  
    function hipsparseSetStream(handle,streamId) bind(c, name="hipsparseSetStream")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSetStream
      type(c_ptr),value :: handle
      type(c_ptr),value :: streamId
    end function

  
    function hipsparseGetStream(handle,streamId) bind(c, name="hipsparseGetStream")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseGetStream
      type(c_ptr),value :: handle
      type(c_ptr),intent(INOUT) :: streamId
    end function

  !  hipSPARSE type creation, destruction, set and get routines 
    function hipsparseSetPointerMode(handle,mode) bind(c, name="hipsparseSetPointerMode")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSetPointerMode
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_POINTER_MODE_HOST)),value :: mode
    end function

  
    function hipsparseGetPointerMode(handle,mode) bind(c, name="hipsparseGetPointerMode")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseGetPointerMode
      type(c_ptr),value :: handle
      type(c_ptr),value :: mode
    end function

  
    function hipsparseCreateMatDescr(descrA) bind(c, name="hipsparseCreateMatDescr")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCreateMatDescr
      type(c_ptr),intent(INOUT) :: descrA
    end function

  
    function hipsparseDestroyMatDescr(descrA) bind(c, name="hipsparseDestroyMatDescr")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDestroyMatDescr
      type(c_ptr),value :: descrA
    end function

  
    function hipsparseCopyMatDescr(dest,src) bind(c, name="hipsparseCopyMatDescr")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCopyMatDescr
      type(c_ptr),value :: dest
      type(c_ptr),value :: src
    end function

  
    function hipsparseSetMatType(descrA,myType) bind(c, name="hipsparseSetMatType")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSetMatType
      type(c_ptr),value :: descrA
      integer(kind(HIPSPARSE_MATRIX_TYPE_GENERAL)),value :: myType
    end function

  
    function hipsparseSetMatFillMode(descrA,fillMode) bind(c, name="hipsparseSetMatFillMode")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSetMatFillMode
      type(c_ptr),value :: descrA
      integer(kind(HIPSPARSE_FILL_MODE_LOWER)),value :: fillMode
    end function

  
    function hipsparseSetMatDiagType(descrA,diagType) bind(c, name="hipsparseSetMatDiagType")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSetMatDiagType
      type(c_ptr),value :: descrA
      integer(kind(HIPSPARSE_DIAG_TYPE_NON_UNIT)),value :: diagType
    end function

  
    function hipsparseSetMatIndexBase(descrA,base) bind(c, name="hipsparseSetMatIndexBase")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSetMatIndexBase
      type(c_ptr),value :: descrA
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: base
    end function

  !  Hybrid (HYB) format 
    function hipsparseCreateHybMat(hybA) bind(c, name="hipsparseCreateHybMat")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCreateHybMat
      type(c_ptr),intent(INOUT) :: hybA
    end function

  
    function hipsparseDestroyHybMat(hybA) bind(c, name="hipsparseDestroyHybMat")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDestroyHybMat
      type(c_ptr),value :: hybA
    end function

  !  Info structures 
    function hipsparseCreateCsrsv2Info(info) bind(c, name="hipsparseCreateCsrsv2Info")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCreateCsrsv2Info
      type(c_ptr),intent(INOUT) :: info
    end function

  
    function hipsparseDestroyCsrsv2Info(info) bind(c, name="hipsparseDestroyCsrsv2Info")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDestroyCsrsv2Info
      type(c_ptr),value :: info
    end function

  
    function hipsparseCreateCsrsm2Info(info) bind(c, name="hipsparseCreateCsrsm2Info")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCreateCsrsm2Info
      type(c_ptr),intent(INOUT) :: info
    end function

  
    function hipsparseDestroyCsrsm2Info(info) bind(c, name="hipsparseDestroyCsrsm2Info")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDestroyCsrsm2Info
      type(c_ptr),value :: info
    end function

  
    function hipsparseCreateCsrilu02Info(info) bind(c, name="hipsparseCreateCsrilu02Info")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCreateCsrilu02Info
      type(c_ptr),intent(INOUT) :: info
    end function

  
    function hipsparseDestroyCsrilu02Info(info) bind(c, name="hipsparseDestroyCsrilu02Info")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDestroyCsrilu02Info
      type(c_ptr),value :: info
    end function

  
    function hipsparseCreateCsric02Info(info) bind(c, name="hipsparseCreateCsric02Info")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCreateCsric02Info
      type(c_ptr),intent(INOUT) :: info
    end function

  
    function hipsparseDestroyCsric02Info(info) bind(c, name="hipsparseDestroyCsric02Info")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDestroyCsric02Info
      type(c_ptr),value :: info
    end function

  
    function hipsparseCreateCsrgemm2Info(info) bind(c, name="hipsparseCreateCsrgemm2Info")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCreateCsrgemm2Info
      type(c_ptr),intent(INOUT) :: info
    end function

  
    function hipsparseDestroyCsrgemm2Info(info) bind(c, name="hipsparseDestroyCsrgemm2Info")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDestroyCsrgemm2Info
      type(c_ptr),value :: info
    end function

  !  Description: Addition of a scalar multiple of a sparse vector x
  !    and a dense vector y. 
    function hipsparseSaxpyi(handle,nnz,alpha,xVal,xInd,y,idxBase) bind(c, name="hipsparseSaxpyi")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseSaxpyi
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      type(c_ptr),value :: y
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

  
    function hipsparseDaxpyi(handle,nnz,alpha,xVal,xInd,y,idxBase) bind(c, name="hipsparseDaxpyi")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDaxpyi
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      type(c_ptr),value :: y
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

  
    function hipsparseCaxpyi(handle,nnz,alpha,xVal,xInd,y,idxBase) bind(c, name="hipsparseCaxpyi")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCaxpyi
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      type(c_ptr),value :: y
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

  
    function hipsparseZaxpyi(handle,nnz,alpha,xVal,xInd,y,idxBase) bind(c, name="hipsparseZaxpyi")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZaxpyi
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: xVal
      type(c_ptr),value :: xInd
      type(c_ptr),value :: y
      integer(kind(HIPSPARSE_INDEX_BASE_ZERO)),value :: idxBase
    end function

  !  Description: Compute the dot product of a sparse vector x
  !    with a dense vector y. 
    function hipsparseSdoti(handle,nnz,xVal,xInd,y,myResult,idxBase) bind(c, name="hipsparseSdoti")
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

  
    function hipsparseDdoti(handle,nnz,xVal,xInd,y,myResult,idxBase) bind(c, name="hipsparseDdoti")
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

  
    function hipsparseCdoti(handle,nnz,xVal,xInd,y,myResult,idxBase) bind(c, name="hipsparseCdoti")
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

  
    function hipsparseZdoti(handle,nnz,xVal,xInd,y,myResult,idxBase) bind(c, name="hipsparseZdoti")
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
    function hipsparseCdotci(handle,nnz,xVal,xInd,y,myResult,idxBase) bind(c, name="hipsparseCdotci")
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

  
    function hipsparseZdotci(handle,nnz,xVal,xInd,y,myResult,idxBase) bind(c, name="hipsparseZdotci")
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
    function hipsparseSgthr(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="hipsparseSgthr")
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

  
    function hipsparseDgthr(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="hipsparseDgthr")
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

  
    function hipsparseCgthr(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="hipsparseCgthr")
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

  
    function hipsparseZgthr(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="hipsparseZgthr")
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
    function hipsparseSgthrz(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="hipsparseSgthrz")
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

  
    function hipsparseDgthrz(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="hipsparseDgthrz")
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

  
    function hipsparseCgthrz(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="hipsparseCgthrz")
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

  
    function hipsparseZgthrz(handle,nnz,y,xVal,xInd,idxBase) bind(c, name="hipsparseZgthrz")
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
    function hipsparseSroti(handle,nnz,xVal,xInd,y,c,s,idxBase) bind(c, name="hipsparseSroti")
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

  
    function hipsparseDroti(handle,nnz,xVal,xInd,y,c,s,idxBase) bind(c, name="hipsparseDroti")
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
    function hipsparseSsctr(handle,nnz,xVal,xInd,y,idxBase) bind(c, name="hipsparseSsctr")
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

  
    function hipsparseDsctr(handle,nnz,xVal,xInd,y,idxBase) bind(c, name="hipsparseDsctr")
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

  
    function hipsparseCsctr(handle,nnz,xVal,xInd,y,idxBase) bind(c, name="hipsparseCsctr")
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

  
    function hipsparseZsctr(handle,nnz,xVal,xInd,y,idxBase) bind(c, name="hipsparseZsctr")
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
    function hipsparseScsrmv(handle,transA,m,n,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,x,beta,y) bind(c, name="hipsparseScsrmv")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrmv
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: x
      real(c_float),intent(IN) :: beta
      type(c_ptr),value :: y
    end function

  
    function hipsparseDcsrmv(handle,transA,m,n,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,x,beta,y) bind(c, name="hipsparseDcsrmv")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrmv
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: x
      real(c_double),intent(IN) :: beta
      type(c_ptr),value :: y
    end function

  
    function hipsparseCcsrmv(handle,transA,m,n,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,x,beta,y) bind(c, name="hipsparseCcsrmv")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrmv
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: x
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr),value :: y
    end function

  
    function hipsparseZcsrmv(handle,transA,m,n,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,x,beta,y) bind(c, name="hipsparseZcsrmv")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrmv
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: x
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr),value :: y
    end function

  !  Description: Solution of triangular linear system op(A)  x = alpha  f,
  !    where A is a sparse matrix in CSR storage format, x and f are dense vectors. 
    function hipsparseXcsrsv2_zeroPivot(handle,info,position) bind(c, name="hipsparseXcsrsv2_zeroPivot")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsrsv2_zeroPivot
      type(c_ptr),value :: handle
      type(c_ptr),value :: info
      type(c_ptr),value :: position
    end function

  
    function hipsparseScsrsv2_bufferSize(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,pBufferSizeInBytes) bind(c, name="hipsparseScsrsv2_bufferSize")
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
      type(c_ptr),value :: info
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
    function hipsparseDcsrsv2_bufferSize(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,pBufferSizeInBytes) bind(c, name="hipsparseDcsrsv2_bufferSize")
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
      type(c_ptr),value :: info
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
    function hipsparseCcsrsv2_bufferSize(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,pBufferSizeInBytes) bind(c, name="hipsparseCcsrsv2_bufferSize")
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
      type(c_ptr),value :: info
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
    function hipsparseZcsrsv2_bufferSize(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,pBufferSizeInBytes) bind(c, name="hipsparseZcsrsv2_bufferSize")
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
      type(c_ptr),value :: info
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
    function hipsparseScsrsv2_bufferSizeExt(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,pBufferSize) bind(c, name="hipsparseScsrsv2_bufferSizeExt")
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
      type(c_ptr),value :: info
      type(c_ptr),value :: pBufferSize
    end function

  
    function hipsparseDcsrsv2_bufferSizeExt(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,pBufferSize) bind(c, name="hipsparseDcsrsv2_bufferSizeExt")
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
      type(c_ptr),value :: info
      type(c_ptr),value :: pBufferSize
    end function

  
    function hipsparseCcsrsv2_bufferSizeExt(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,pBufferSize) bind(c, name="hipsparseCcsrsv2_bufferSizeExt")
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
      type(c_ptr),value :: info
      type(c_ptr),value :: pBufferSize
    end function

  
    function hipsparseZcsrsv2_bufferSizeExt(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,pBufferSize) bind(c, name="hipsparseZcsrsv2_bufferSizeExt")
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
      type(c_ptr),value :: info
      type(c_ptr),value :: pBufferSize
    end function

  
    function hipsparseScsrsv2_analysis(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,policy,pBuffer) bind(c, name="hipsparseScsrsv2_analysis")
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
      type(c_ptr),value :: info
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
    function hipsparseDcsrsv2_analysis(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,policy,pBuffer) bind(c, name="hipsparseDcsrsv2_analysis")
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
      type(c_ptr),value :: info
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
    function hipsparseCcsrsv2_analysis(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,policy,pBuffer) bind(c, name="hipsparseCcsrsv2_analysis")
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
      type(c_ptr),value :: info
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
    function hipsparseZcsrsv2_analysis(handle,transA,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,policy,pBuffer) bind(c, name="hipsparseZcsrsv2_analysis")
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
      type(c_ptr),value :: info
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
    function hipsparseScsrsv2_solve(handle,transA,m,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,f,x,policy,pBuffer) bind(c, name="hipsparseScsrsv2_solve")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrsv2_solve
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: info
      type(c_ptr),value :: f
      type(c_ptr),value :: x
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
    function hipsparseDcsrsv2_solve(handle,transA,m,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,f,x,policy,pBuffer) bind(c, name="hipsparseDcsrsv2_solve")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrsv2_solve
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: info
      type(c_ptr),value :: f
      type(c_ptr),value :: x
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
    function hipsparseCcsrsv2_solve(handle,transA,m,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,f,x,policy,pBuffer) bind(c, name="hipsparseCcsrsv2_solve")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrsv2_solve
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: info
      type(c_ptr),value :: f
      type(c_ptr),value :: x
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
    function hipsparseZcsrsv2_solve(handle,transA,m,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,f,x,policy,pBuffer) bind(c, name="hipsparseZcsrsv2_solve")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrsv2_solve
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: info
      type(c_ptr),value :: f
      type(c_ptr),value :: x
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  !  Description: Matrix-vector multiplication  y = alpha  op(A)  x  + beta  y,
  !    where A is a sparse matrix in HYB storage format, x and y are dense vectors. 
    function hipsparseShybmv(handle,transA,alpha,descrA,hybA,x,beta,y) bind(c, name="hipsparseShybmv")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseShybmv
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: hybA
      type(c_ptr),value :: x
      real(c_float),intent(IN) :: beta
      type(c_ptr),value :: y
    end function

  
    function hipsparseDhybmv(handle,transA,alpha,descrA,hybA,x,beta,y) bind(c, name="hipsparseDhybmv")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDhybmv
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: hybA
      type(c_ptr),value :: x
      real(c_double),intent(IN) :: beta
      type(c_ptr),value :: y
    end function

  
    function hipsparseChybmv(handle,transA,alpha,descrA,hybA,x,beta,y) bind(c, name="hipsparseChybmv")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseChybmv
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: hybA
      type(c_ptr),value :: x
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr),value :: y
    end function

  
    function hipsparseZhybmv(handle,transA,alpha,descrA,hybA,x,beta,y) bind(c, name="hipsparseZhybmv")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZhybmv
      type(c_ptr),value :: handle
      integer(kind(HIPSPARSE_OPERATION_NON_TRANSPOSE)),value :: transA
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: hybA
      type(c_ptr),value :: x
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr),value :: y
    end function

  !  Description: Matrix-vector multiplication  y = alpha  op(A)  x  + beta  y,
  !    where A is a sparse matrix in BSR storage format, x and y are dense vectors. 
    function hipsparseSbsrmv(handle,dirA,transA,mb,nb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,x,beta,y) bind(c, name="hipsparseSbsrmv")
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
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: x
      real(c_float),intent(IN) :: beta
      type(c_ptr),value :: y
    end function

  
    function hipsparseDbsrmv(handle,dirA,transA,mb,nb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,x,beta,y) bind(c, name="hipsparseDbsrmv")
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
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: x
      real(c_double),intent(IN) :: beta
      type(c_ptr),value :: y
    end function

  
    function hipsparseCbsrmv(handle,dirA,transA,mb,nb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,x,beta,y) bind(c, name="hipsparseCbsrmv")
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
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: x
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr),value :: y
    end function

  
    function hipsparseZbsrmv(handle,dirA,transA,mb,nb,nnzb,alpha,descrA,bsrSortedValA,bsrSortedRowPtrA,bsrSortedColIndA,blockDim,x,beta,y) bind(c, name="hipsparseZbsrmv")
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
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: bsrSortedValA
      type(c_ptr),value :: bsrSortedRowPtrA
      type(c_ptr),value :: bsrSortedColIndA
      integer(c_int),value :: blockDim
      type(c_ptr),value :: x
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr),value :: y
    end function

  !  Description: Matrix-matrix multiplication C = alpha  op(A)  B + beta  C,
  !    where A is a sparse matrix in CSR storage format, B and C are dense matrices. 
    function hipsparseScsrmm(handle,transA,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="hipsparseScsrmm")
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
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_float),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
    function hipsparseDcsrmm(handle,transA,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="hipsparseDcsrmm")
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
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_double),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
    function hipsparseCcsrmm(handle,transA,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="hipsparseCcsrmm")
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
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
    function hipsparseZcsrmm(handle,transA,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="hipsparseZcsrmm")
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
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  !  Description: Matrix-matrix multiplication C = alpha  op(A)  op(B) + beta  C,
  !    where A is a sparse matrix in CSR storage format, B and C are dense matrices. 
    function hipsparseScsrmm2(handle,transA,transB,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="hipsparseScsrmm2")
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
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_float),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
    function hipsparseDcsrmm2(handle,transA,transB,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="hipsparseDcsrmm2")
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
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_double),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
    function hipsparseCcsrmm2(handle,transA,transB,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="hipsparseCcsrmm2")
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
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
    function hipsparseZcsrmm2(handle,transA,transB,m,n,k,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,beta,C,ldc) bind(c, name="hipsparseZcsrmm2")
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
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  !  Description: Solution of triangular linear system op(A)  op(X) = alpha  op(B),
  !    where A is a sparse matrix in CSR storage format, X and B are dense matrices. 
    function hipsparseXcsrsm2_zeroPivot(handle,info,position) bind(c, name="hipsparseXcsrsm2_zeroPivot")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsrsm2_zeroPivot
      type(c_ptr),value :: handle
      type(c_ptr),value :: info
      type(c_ptr),value :: position
    end function

  
    function hipsparseScsrsm2_bufferSizeExt(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,info,policy,pBufferSize) bind(c, name="hipsparseScsrsm2_bufferSizeExt")
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
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: info
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBufferSize
    end function

  
    function hipsparseDcsrsm2_bufferSizeExt(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,info,policy,pBufferSize) bind(c, name="hipsparseDcsrsm2_bufferSizeExt")
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
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: info
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBufferSize
    end function

  
    function hipsparseCcsrsm2_bufferSizeExt(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,info,policy,pBufferSize) bind(c, name="hipsparseCcsrsm2_bufferSizeExt")
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
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: info
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBufferSize
    end function

  
    function hipsparseZcsrsm2_bufferSizeExt(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,info,policy,pBufferSize) bind(c, name="hipsparseZcsrsm2_bufferSizeExt")
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
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: info
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBufferSize
    end function

  
    function hipsparseScsrsm2_analysis(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,info,policy,pBuffer) bind(c, name="hipsparseScsrsm2_analysis")
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
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: info
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
    function hipsparseDcsrsm2_analysis(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,info,policy,pBuffer) bind(c, name="hipsparseDcsrsm2_analysis")
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
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: info
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
    function hipsparseCcsrsm2_analysis(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,info,policy,pBuffer) bind(c, name="hipsparseCcsrsm2_analysis")
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
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: info
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
    function hipsparseZcsrsm2_analysis(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,info,policy,pBuffer) bind(c, name="hipsparseZcsrsm2_analysis")
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
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: info
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
    function hipsparseScsrsm2_solve(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,info,policy,pBuffer) bind(c, name="hipsparseScsrsm2_solve")
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
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: info
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
    function hipsparseDcsrsm2_solve(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,info,policy,pBuffer) bind(c, name="hipsparseDcsrsm2_solve")
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
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: info
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
    function hipsparseCcsrsm2_solve(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,info,policy,pBuffer) bind(c, name="hipsparseCcsrsm2_solve")
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
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: info
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
    function hipsparseZcsrsm2_solve(handle,algo,transA,transB,m,nrhs,nnz,alpha,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,B,ldb,info,policy,pBuffer) bind(c, name="hipsparseZcsrsm2_solve")
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
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: info
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  !  Description: Sparse matrix sparse matrix addition C = alpha  A + beta  B, where A, B
  !    and C are sparse matrices in CSR storage format. 
    function hipsparseXcsrgeamNnz(handle,m,n,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,descrC,csrRowPtrC,nnzTotalDevHostPtr) bind(c, name="hipsparseXcsrgeamNnz")
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

  
    function hipsparseScsrgeam(handle,m,n,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,beta,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="hipsparseScsrgeam")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrgeam
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      real(c_float),intent(IN) :: beta
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

  
    function hipsparseDcsrgeam(handle,m,n,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,beta,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="hipsparseDcsrgeam")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrgeam
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      real(c_double),intent(IN) :: beta
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

  
    function hipsparseCcsrgeam(handle,m,n,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,beta,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="hipsparseCcsrgeam")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrgeam
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      complex(c_float_complex),intent(IN) :: beta
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

  
    function hipsparseZcsrgeam(handle,m,n,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,beta,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="hipsparseZcsrgeam")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrgeam
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrValA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      complex(c_double_complex),intent(IN) :: beta
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

  
    function hipsparseScsrgeam2_bufferSizeExt(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBufferSizeInBytes) bind(c, name="hipsparseScsrgeam2_bufferSizeExt")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrgeam2_bufferSizeExt
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      real(c_float),intent(IN) :: beta
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

  
    function hipsparseDcsrgeam2_bufferSizeExt(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBufferSizeInBytes) bind(c, name="hipsparseDcsrgeam2_bufferSizeExt")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrgeam2_bufferSizeExt
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      real(c_double),intent(IN) :: beta
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

  
    function hipsparseCcsrgeam2_bufferSizeExt(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBufferSizeInBytes) bind(c, name="hipsparseCcsrgeam2_bufferSizeExt")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrgeam2_bufferSizeExt
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      complex(c_float_complex),intent(IN) :: beta
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

  
    function hipsparseZcsrgeam2_bufferSizeExt(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBufferSizeInBytes) bind(c, name="hipsparseZcsrgeam2_bufferSizeExt")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrgeam2_bufferSizeExt
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      complex(c_double_complex),intent(IN) :: beta
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

  
    function hipsparseXcsrgeam2Nnz(handle,m,n,descrA,nnzA,csrSortedRowPtrA,csrSortedColIndA,descrB,nnzB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedRowPtrC,nnzTotalDevHostPtr,workspace) bind(c, name="hipsparseXcsrgeam2Nnz")
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

  
    function hipsparseScsrgeam2(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBuffer) bind(c, name="hipsparseScsrgeam2")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrgeam2
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      real(c_float),intent(IN) :: beta
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

  
    function hipsparseDcsrgeam2(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBuffer) bind(c, name="hipsparseDcsrgeam2")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrgeam2
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      real(c_double),intent(IN) :: beta
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

  
    function hipsparseCcsrgeam2(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBuffer) bind(c, name="hipsparseCcsrgeam2")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrgeam2
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      complex(c_float_complex),intent(IN) :: beta
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

  
    function hipsparseZcsrgeam2(handle,m,n,alpha,descrA,nnzA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,beta,descrB,nnzB,csrSortedValB,csrSortedRowPtrB,csrSortedColIndB,descrC,csrSortedValC,csrSortedRowPtrC,csrSortedColIndC,pBuffer) bind(c, name="hipsparseZcsrgeam2")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrgeam2
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrSortedValA
      type(c_ptr),value :: csrSortedRowPtrA
      type(c_ptr),value :: csrSortedColIndA
      complex(c_double_complex),intent(IN) :: beta
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
    function hipsparseXcsrgemmNnz(handle,transA,transB,m,n,k,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,descrC,csrRowPtrC,nnzTotalDevHostPtr) bind(c, name="hipsparseXcsrgemmNnz")
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

  
    function hipsparseScsrgemm(handle,transA,transB,m,n,k,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="hipsparseScsrgemm")
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

  
    function hipsparseDcsrgemm(handle,transA,transB,m,n,k,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="hipsparseDcsrgemm")
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

  
    function hipsparseCcsrgemm(handle,transA,transB,m,n,k,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="hipsparseCcsrgemm")
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

  
    function hipsparseZcsrgemm(handle,transA,transB,m,n,k,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="hipsparseZcsrgemm")
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
    function hipsparseScsrgemm2_bufferSizeExt(handle,m,n,k,alpha,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrRowPtrD,csrColIndD,info,pBufferSizeInBytes) bind(c, name="hipsparseScsrgemm2_bufferSizeExt")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrgemm2_bufferSizeExt
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      real(c_float),intent(IN) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      type(c_ptr),value :: csrRowPtrD
      type(c_ptr),value :: csrColIndD
      type(c_ptr),value :: info
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
    function hipsparseDcsrgemm2_bufferSizeExt(handle,m,n,k,alpha,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrRowPtrD,csrColIndD,info,pBufferSizeInBytes) bind(c, name="hipsparseDcsrgemm2_bufferSizeExt")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrgemm2_bufferSizeExt
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      real(c_double),intent(IN) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      type(c_ptr),value :: csrRowPtrD
      type(c_ptr),value :: csrColIndD
      type(c_ptr),value :: info
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
    function hipsparseCcsrgemm2_bufferSizeExt(handle,m,n,k,alpha,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrRowPtrD,csrColIndD,info,pBufferSizeInBytes) bind(c, name="hipsparseCcsrgemm2_bufferSizeExt")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrgemm2_bufferSizeExt
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      type(c_ptr),value :: csrRowPtrD
      type(c_ptr),value :: csrColIndD
      type(c_ptr),value :: info
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
    function hipsparseZcsrgemm2_bufferSizeExt(handle,m,n,k,alpha,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrRowPtrD,csrColIndD,info,pBufferSizeInBytes) bind(c, name="hipsparseZcsrgemm2_bufferSizeExt")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrgemm2_bufferSizeExt
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: descrA
      integer(c_int),value :: nnzA
      type(c_ptr),value :: csrRowPtrA
      type(c_ptr),value :: csrColIndA
      type(c_ptr),value :: descrB
      integer(c_int),value :: nnzB
      type(c_ptr),value :: csrRowPtrB
      type(c_ptr),value :: csrColIndB
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      type(c_ptr),value :: csrRowPtrD
      type(c_ptr),value :: csrColIndD
      type(c_ptr),value :: info
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
    function hipsparseXcsrgemm2Nnz(handle,m,n,k,descrA,nnzA,csrRowPtrA,csrColIndA,descrB,nnzB,csrRowPtrB,csrColIndB,descrD,nnzD,csrRowPtrD,csrColIndD,descrC,csrRowPtrC,nnzTotalDevHostPtr,info,pBuffer) bind(c, name="hipsparseXcsrgemm2Nnz")
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
      type(c_ptr),value :: info
      type(c_ptr),value :: pBuffer
    end function

  
    function hipsparseScsrgemm2(handle,m,n,k,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrValD,csrRowPtrD,csrColIndD,descrC,csrValC,csrRowPtrC,csrColIndC,info,pBuffer) bind(c, name="hipsparseScsrgemm2")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseScsrgemm2
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float),intent(IN) :: alpha
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
      real(c_float),intent(IN) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      type(c_ptr),value :: csrValD
      type(c_ptr),value :: csrRowPtrD
      type(c_ptr),value :: csrColIndD
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
      type(c_ptr),value :: info
      type(c_ptr),value :: pBuffer
    end function

  
    function hipsparseDcsrgemm2(handle,m,n,k,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrValD,csrRowPtrD,csrColIndD,descrC,csrValC,csrRowPtrC,csrColIndC,info,pBuffer) bind(c, name="hipsparseDcsrgemm2")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseDcsrgemm2
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double),intent(IN) :: alpha
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
      real(c_double),intent(IN) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      type(c_ptr),value :: csrValD
      type(c_ptr),value :: csrRowPtrD
      type(c_ptr),value :: csrColIndD
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
      type(c_ptr),value :: info
      type(c_ptr),value :: pBuffer
    end function

  
    function hipsparseCcsrgemm2(handle,m,n,k,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrValD,csrRowPtrD,csrColIndD,descrC,csrValC,csrRowPtrC,csrColIndC,info,pBuffer) bind(c, name="hipsparseCcsrgemm2")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCcsrgemm2
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex),intent(IN) :: alpha
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
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      type(c_ptr),value :: csrValD
      type(c_ptr),value :: csrRowPtrD
      type(c_ptr),value :: csrColIndD
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
      type(c_ptr),value :: info
      type(c_ptr),value :: pBuffer
    end function

  
    function hipsparseZcsrgemm2(handle,m,n,k,alpha,descrA,nnzA,csrValA,csrRowPtrA,csrColIndA,descrB,nnzB,csrValB,csrRowPtrB,csrColIndB,beta,descrD,nnzD,csrValD,csrRowPtrD,csrColIndD,descrC,csrValC,csrRowPtrC,csrColIndC,info,pBuffer) bind(c, name="hipsparseZcsrgemm2")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseZcsrgemm2
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex),intent(IN) :: alpha
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
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr),value :: descrD
      integer(c_int),value :: nnzD
      type(c_ptr),value :: csrValD
      type(c_ptr),value :: csrRowPtrD
      type(c_ptr),value :: csrColIndD
      type(c_ptr),value :: descrC
      type(c_ptr),value :: csrValC
      type(c_ptr),value :: csrRowPtrC
      type(c_ptr),value :: csrColIndC
      type(c_ptr),value :: info
      type(c_ptr),value :: pBuffer
    end function

  !  Description: Compute the incomplete-LU factorization with 0 fill-in (ILU0)
  !    of the matrix A stored in CSR format. 
    function hipsparseXcsrilu02_zeroPivot(handle,info,position) bind(c, name="hipsparseXcsrilu02_zeroPivot")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsrilu02_zeroPivot
      type(c_ptr),value :: handle
      type(c_ptr),value :: info
      type(c_ptr),value :: position
    end function

  
    function hipsparseScsrilu02_bufferSize(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,pBufferSizeInBytes) bind(c, name="hipsparseScsrilu02_bufferSize")
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
      type(c_ptr),value :: info
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
    function hipsparseDcsrilu02_bufferSize(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,pBufferSizeInBytes) bind(c, name="hipsparseDcsrilu02_bufferSize")
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
      type(c_ptr),value :: info
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
    function hipsparseCcsrilu02_bufferSize(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,pBufferSizeInBytes) bind(c, name="hipsparseCcsrilu02_bufferSize")
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
      type(c_ptr),value :: info
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
    function hipsparseZcsrilu02_bufferSize(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,pBufferSizeInBytes) bind(c, name="hipsparseZcsrilu02_bufferSize")
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
      type(c_ptr),value :: info
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
    function hipsparseScsrilu02_bufferSizeExt(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,pBufferSize) bind(c, name="hipsparseScsrilu02_bufferSizeExt")
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
      type(c_ptr),value :: info
      type(c_ptr),value :: pBufferSize
    end function

  
    function hipsparseDcsrilu02_bufferSizeExt(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,pBufferSize) bind(c, name="hipsparseDcsrilu02_bufferSizeExt")
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
      type(c_ptr),value :: info
      type(c_ptr),value :: pBufferSize
    end function

  
    function hipsparseCcsrilu02_bufferSizeExt(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,pBufferSize) bind(c, name="hipsparseCcsrilu02_bufferSizeExt")
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
      type(c_ptr),value :: info
      type(c_ptr),value :: pBufferSize
    end function

  
    function hipsparseZcsrilu02_bufferSizeExt(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,pBufferSize) bind(c, name="hipsparseZcsrilu02_bufferSizeExt")
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
      type(c_ptr),value :: info
      type(c_ptr),value :: pBufferSize
    end function

  
    function hipsparseScsrilu02_analysis(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,policy,pBuffer) bind(c, name="hipsparseScsrilu02_analysis")
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
      type(c_ptr),value :: info
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
    function hipsparseDcsrilu02_analysis(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,policy,pBuffer) bind(c, name="hipsparseDcsrilu02_analysis")
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
      type(c_ptr),value :: info
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
    function hipsparseCcsrilu02_analysis(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,policy,pBuffer) bind(c, name="hipsparseCcsrilu02_analysis")
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
      type(c_ptr),value :: info
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
    function hipsparseZcsrilu02_analysis(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,policy,pBuffer) bind(c, name="hipsparseZcsrilu02_analysis")
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
      type(c_ptr),value :: info
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
    function hipsparseScsrilu02(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,info,policy,pBuffer) bind(c, name="hipsparseScsrilu02")
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
      type(c_ptr),value :: info
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
    function hipsparseDcsrilu02(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,info,policy,pBuffer) bind(c, name="hipsparseDcsrilu02")
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
      type(c_ptr),value :: info
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
    function hipsparseCcsrilu02(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,info,policy,pBuffer) bind(c, name="hipsparseCcsrilu02")
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
      type(c_ptr),value :: info
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
    function hipsparseZcsrilu02(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,info,policy,pBuffer) bind(c, name="hipsparseZcsrilu02")
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
      type(c_ptr),value :: info
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  !  Description: Compute the incomplete Cholesky factorization with 0 fill-in (IC0)
  !    of the matrix A stored in CSR format. 
    function hipsparseXcsric02_zeroPivot(handle,info,position) bind(c, name="hipsparseXcsric02_zeroPivot")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseXcsric02_zeroPivot
      type(c_ptr),value :: handle
      type(c_ptr),value :: info
      type(c_ptr),value :: position
    end function

  
    function hipsparseScsric02_bufferSize(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,pBufferSizeInBytes) bind(c, name="hipsparseScsric02_bufferSize")
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
      type(c_ptr),value :: info
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
    function hipsparseDcsric02_bufferSize(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,pBufferSizeInBytes) bind(c, name="hipsparseDcsric02_bufferSize")
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
      type(c_ptr),value :: info
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
    function hipsparseCcsric02_bufferSize(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,pBufferSizeInBytes) bind(c, name="hipsparseCcsric02_bufferSize")
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
      type(c_ptr),value :: info
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
    function hipsparseZcsric02_bufferSize(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,pBufferSizeInBytes) bind(c, name="hipsparseZcsric02_bufferSize")
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
      type(c_ptr),value :: info
      type(c_ptr),value :: pBufferSizeInBytes
    end function

  
    function hipsparseScsric02_bufferSizeExt(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,pBufferSize) bind(c, name="hipsparseScsric02_bufferSizeExt")
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
      type(c_ptr),value :: info
      type(c_ptr),value :: pBufferSize
    end function

  
    function hipsparseDcsric02_bufferSizeExt(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,pBufferSize) bind(c, name="hipsparseDcsric02_bufferSizeExt")
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
      type(c_ptr),value :: info
      type(c_ptr),value :: pBufferSize
    end function

  
    function hipsparseCcsric02_bufferSizeExt(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,pBufferSize) bind(c, name="hipsparseCcsric02_bufferSizeExt")
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
      type(c_ptr),value :: info
      type(c_ptr),value :: pBufferSize
    end function

  
    function hipsparseZcsric02_bufferSizeExt(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,pBufferSize) bind(c, name="hipsparseZcsric02_bufferSizeExt")
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
      type(c_ptr),value :: info
      type(c_ptr),value :: pBufferSize
    end function

  
    function hipsparseScsric02_analysis(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,policy,pBuffer) bind(c, name="hipsparseScsric02_analysis")
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
      type(c_ptr),value :: info
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
    function hipsparseDcsric02_analysis(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,policy,pBuffer) bind(c, name="hipsparseDcsric02_analysis")
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
      type(c_ptr),value :: info
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
    function hipsparseCcsric02_analysis(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,policy,pBuffer) bind(c, name="hipsparseCcsric02_analysis")
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
      type(c_ptr),value :: info
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
    function hipsparseZcsric02_analysis(handle,m,nnz,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,info,policy,pBuffer) bind(c, name="hipsparseZcsric02_analysis")
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
      type(c_ptr),value :: info
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
    function hipsparseScsric02(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,info,policy,pBuffer) bind(c, name="hipsparseScsric02")
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
      type(c_ptr),value :: info
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
    function hipsparseDcsric02(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,info,policy,pBuffer) bind(c, name="hipsparseDcsric02")
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
      type(c_ptr),value :: info
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
    function hipsparseCcsric02(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,info,policy,pBuffer) bind(c, name="hipsparseCcsric02")
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
      type(c_ptr),value :: info
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  
    function hipsparseZcsric02(handle,m,nnz,descrA,csrSortedValA_valM,csrSortedRowPtrA,csrSortedColIndA,info,policy,pBuffer) bind(c, name="hipsparseZcsric02")
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
      type(c_ptr),value :: info
      integer(kind(HIPSPARSE_SOLVE_POLICY_NO_LEVEL)),value :: policy
      type(c_ptr),value :: pBuffer
    end function

  !  Description: 
  !    This function computes the number of nonzero elements per row or column and the total number of nonzero elements in a dense matrix. 
    function hipsparseSnnz(handle,dirA,m,n,descrA,A,lda,nnzPerRowColumn,nnzTotalDevHostPtr) bind(c, name="hipsparseSnnz")
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

  
    function hipsparseDnnz(handle,dirA,m,n,descrA,A,lda,nnzPerRowColumn,nnzTotalDevHostPtr) bind(c, name="hipsparseDnnz")
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

  
    function hipsparseCnnz(handle,dirA,m,n,descrA,A,lda,nnzPerRowColumn,nnzTotalDevHostPtr) bind(c, name="hipsparseCnnz")
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

  
    function hipsparseZnnz(handle,dirA,m,n,descrA,A,lda,nnzPerRowColumn,nnzTotalDevHostPtr) bind(c, name="hipsparseZnnz")
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
    function hipsparseSdense2csr(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="hipsparseSdense2csr")
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

  
    function hipsparseDdense2csr(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="hipsparseDdense2csr")
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

  
    function hipsparseCdense2csr(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="hipsparseCdense2csr")
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

  
    function hipsparseZdense2csr(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="hipsparseZdense2csr")
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
    function hipsparseSdense2csc(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_row_ind,csc_col_ptr) bind(c, name="hipsparseSdense2csc")
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

  
    function hipsparseDdense2csc(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_row_ind,csc_col_ptr) bind(c, name="hipsparseDdense2csc")
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

  
    function hipsparseCdense2csc(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_row_ind,csc_col_ptr) bind(c, name="hipsparseCdense2csc")
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

  
    function hipsparseZdense2csc(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_row_ind,csc_col_ptr) bind(c, name="hipsparseZdense2csc")
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
    function hipsparseScsr2dense(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld) bind(c, name="hipsparseScsr2dense")
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

  
    function hipsparseDcsr2dense(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld) bind(c, name="hipsparseDcsr2dense")
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

  
    function hipsparseCcsr2dense(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld) bind(c, name="hipsparseCcsr2dense")
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

  
    function hipsparseZcsr2dense(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld) bind(c, name="hipsparseZcsr2dense")
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
    function hipsparseScsc2dense(handle,m,n,descr,csc_val,csc_row_ind,csc_col_ptr,A,ld) bind(c, name="hipsparseScsc2dense")
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

  
    function hipsparseDcsc2dense(handle,m,n,descr,csc_val,csc_row_ind,csc_col_ptr,A,ld) bind(c, name="hipsparseDcsc2dense")
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

  
    function hipsparseCcsc2dense(handle,m,n,descr,csc_val,csc_row_ind,csc_col_ptr,A,ld) bind(c, name="hipsparseCcsc2dense")
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

  
    function hipsparseZcsc2dense(handle,m,n,descr,csc_val,csc_row_ind,csc_col_ptr,A,ld) bind(c, name="hipsparseZcsc2dense")
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
    function hipsparseXcsr2bsrNnz(handle,dirA,m,n,descrA,csrRowPtrA,csrColIndA,blockDim,descrC,bsrRowPtrC,bsrNnzb) bind(c, name="hipsparseXcsr2bsrNnz")
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
    function hipsparseSnnz_compress(handle,m,descrA,csrValA,csrRowPtrA,nnzPerRow,nnzC,tol) bind(c, name="hipsparseSnnz_compress")
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

  
    function hipsparseDnnz_compress(handle,m,descrA,csrValA,csrRowPtrA,nnzPerRow,nnzC,tol) bind(c, name="hipsparseDnnz_compress")
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

  
    function hipsparseCnnz_compress(handle,m,descrA,csrValA,csrRowPtrA,nnzPerRow,nnzC,tol) bind(c, name="hipsparseCnnz_compress")
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

  
    function hipsparseZnnz_compress(handle,m,descrA,csrValA,csrRowPtrA,nnzPerRow,nnzC,tol) bind(c, name="hipsparseZnnz_compress")
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
    function hipsparseXcsr2coo(handle,csrRowPtr,nnz,m,cooRowInd,idxBase) bind(c, name="hipsparseXcsr2coo")
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
    function hipsparseScsr2csc(handle,m,n,nnz,csrSortedVal,csrSortedRowPtr,csrSortedColInd,cscSortedVal,cscSortedRowInd,cscSortedColPtr,copyValues,idxBase) bind(c, name="hipsparseScsr2csc")
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

  
    function hipsparseDcsr2csc(handle,m,n,nnz,csrSortedVal,csrSortedRowPtr,csrSortedColInd,cscSortedVal,cscSortedRowInd,cscSortedColPtr,copyValues,idxBase) bind(c, name="hipsparseDcsr2csc")
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

  
    function hipsparseCcsr2csc(handle,m,n,nnz,csrSortedVal,csrSortedRowPtr,csrSortedColInd,cscSortedVal,cscSortedRowInd,cscSortedColPtr,copyValues,idxBase) bind(c, name="hipsparseCcsr2csc")
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

  
    function hipsparseZcsr2csc(handle,m,n,nnz,csrSortedVal,csrSortedRowPtr,csrSortedColInd,cscSortedVal,cscSortedRowInd,cscSortedColPtr,copyValues,idxBase) bind(c, name="hipsparseZcsr2csc")
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
    function hipsparseScsr2hyb(handle,m,n,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,hybA,userEllWidth,partitionType) bind(c, name="hipsparseScsr2hyb")
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

  
    function hipsparseDcsr2hyb(handle,m,n,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,hybA,userEllWidth,partitionType) bind(c, name="hipsparseDcsr2hyb")
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

  
    function hipsparseCcsr2hyb(handle,m,n,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,hybA,userEllWidth,partitionType) bind(c, name="hipsparseCcsr2hyb")
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

  
    function hipsparseZcsr2hyb(handle,m,n,descrA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA,hybA,userEllWidth,partitionType) bind(c, name="hipsparseZcsr2hyb")
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
    function hipsparseScsr2bsr(handle,dirA,m,n,descrA,csrValA,csrRowPtrA,csrColIndA,blockDim,descrC,bsrValC,bsrRowPtrC,bsrColIndC) bind(c, name="hipsparseScsr2bsr")
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

  
    function hipsparseDcsr2bsr(handle,dirA,m,n,descrA,csrValA,csrRowPtrA,csrColIndA,blockDim,descrC,bsrValC,bsrRowPtrC,bsrColIndC) bind(c, name="hipsparseDcsr2bsr")
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

  
    function hipsparseCcsr2bsr(handle,dirA,m,n,descrA,csrValA,csrRowPtrA,csrColIndA,blockDim,descrC,bsrValC,bsrRowPtrC,bsrColIndC) bind(c, name="hipsparseCcsr2bsr")
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

  
    function hipsparseZcsr2bsr(handle,dirA,m,n,descrA,csrValA,csrRowPtrA,csrColIndA,blockDim,descrC,bsrValC,bsrRowPtrC,bsrColIndC) bind(c, name="hipsparseZcsr2bsr")
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
    function hipsparseSbsr2csr(handle,dirA,mb,nb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="hipsparseSbsr2csr")
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

  
    function hipsparseDbsr2csr(handle,dirA,mb,nb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="hipsparseDbsr2csr")
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

  
    function hipsparseCbsr2csr(handle,dirA,mb,nb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="hipsparseCbsr2csr")
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

  
    function hipsparseZbsr2csr(handle,dirA,mb,nb,descrA,bsrValA,bsrRowPtrA,bsrColIndA,blockDim,descrC,csrValC,csrRowPtrC,csrColIndC) bind(c, name="hipsparseZbsr2csr")
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
    function hipsparseScsr2csr_compress(handle,m,n,descrA,csrValA,csrColIndA,csrRowPtrA,nnzA,nnzPerRow,csrValC,csrColIndC,csrRowPtrC,tol) bind(c, name="hipsparseScsr2csr_compress")
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

  
    function hipsparseDcsr2csr_compress(handle,m,n,descrA,csrValA,csrColIndA,csrRowPtrA,nnzA,nnzPerRow,csrValC,csrColIndC,csrRowPtrC,tol) bind(c, name="hipsparseDcsr2csr_compress")
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

  
    function hipsparseCcsr2csr_compress(handle,m,n,descrA,csrValA,csrColIndA,csrRowPtrA,nnzA,nnzPerRow,csrValC,csrColIndC,csrRowPtrC,tol) bind(c, name="hipsparseCcsr2csr_compress")
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

  
    function hipsparseZcsr2csr_compress(handle,m,n,descrA,csrValA,csrColIndA,csrRowPtrA,nnzA,nnzPerRow,csrValC,csrColIndC,csrRowPtrC,tol) bind(c, name="hipsparseZcsr2csr_compress")
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
    function hipsparseShyb2csr(handle,descrA,hybA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA) bind(c, name="hipsparseShyb2csr")
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

  
    function hipsparseDhyb2csr(handle,descrA,hybA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA) bind(c, name="hipsparseDhyb2csr")
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

  
    function hipsparseChyb2csr(handle,descrA,hybA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA) bind(c, name="hipsparseChyb2csr")
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

  
    function hipsparseZhyb2csr(handle,descrA,hybA,csrSortedValA,csrSortedRowPtrA,csrSortedColIndA) bind(c, name="hipsparseZhyb2csr")
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
    function hipsparseXcoo2csr(handle,cooRowInd,nnz,m,csrRowPtr,idxBase) bind(c, name="hipsparseXcoo2csr")
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
    function hipsparseCreateIdentityPermutation(handle,n,p) bind(c, name="hipsparseCreateIdentityPermutation")
      use iso_c_binding
      use hipfort_hipsparse_enums
      implicit none
      integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: hipsparseCreateIdentityPermutation
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: p
    end function

  !  Description: This routine computes the required buffer size for csrsort. 
    function hipsparseXcsrsort_bufferSizeExt(handle,m,n,nnz,csrRowPtr,csrColInd,pBufferSizeInBytes) bind(c, name="hipsparseXcsrsort_bufferSizeExt")
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
    function hipsparseXcsrsort(handle,m,n,nnz,descrA,csrRowPtr,csrColInd,P,pBuffer) bind(c, name="hipsparseXcsrsort")
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
    function hipsparseXcscsort_bufferSizeExt(handle,m,n,nnz,cscColPtr,cscRowInd,pBufferSizeInBytes) bind(c, name="hipsparseXcscsort_bufferSizeExt")
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
    function hipsparseXcscsort(handle,m,n,nnz,descrA,cscColPtr,cscRowInd,P,pBuffer) bind(c, name="hipsparseXcscsort")
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
    function hipsparseXcoosort_bufferSizeExt(handle,m,n,nnz,cooRows,cooCols,pBufferSizeInBytes) bind(c, name="hipsparseXcoosort_bufferSizeExt")
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
    function hipsparseXcoosortByRow(handle,m,n,nnz,cooRows,cooCols,P,pBuffer) bind(c, name="hipsparseXcoosortByRow")
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
    function hipsparseXcoosortByColumn(handle,m,n,nnz,cooRows,cooCols,P,pBuffer) bind(c, name="hipsparseXcoosortByColumn")
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