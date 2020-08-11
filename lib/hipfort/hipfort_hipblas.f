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
          
           
module hipfort_hipblas
  use hipfort_hipblas_enums
  implicit none

 
  interface
  
#ifdef USE_CUDA_NAMES
    function hipblasCreate(handle) bind(c, name="cublasCreate")
#else
    function hipblasCreate(handle) bind(c, name="hipblasCreate")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCreate
      type(c_ptr) :: handle
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDestroy(handle) bind(c, name="cublasDestroy")
#else
    function hipblasDestroy(handle) bind(c, name="hipblasDestroy")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDestroy
      type(c_ptr),value :: handle
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSetStream(handle,streamId) bind(c, name="cublasSetStream")
#else
    function hipblasSetStream(handle,streamId) bind(c, name="hipblasSetStream")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSetStream
      type(c_ptr),value :: handle
      type(c_ptr),value :: streamId
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasGetStream(handle,streamId) bind(c, name="cublasGetStream")
#else
    function hipblasGetStream(handle,streamId) bind(c, name="hipblasGetStream")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasGetStream
      type(c_ptr),value :: handle
      type(c_ptr) :: streamId
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSetPointerMode(handle,mode) bind(c, name="cublasSetPointerMode")
#else
    function hipblasSetPointerMode(handle,mode) bind(c, name="hipblasSetPointerMode")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSetPointerMode
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_POINTER_MODE_HOST)),value :: mode
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasGetPointerMode(handle,mode) bind(c, name="cublasGetPointerMode")
#else
    function hipblasGetPointerMode(handle,mode) bind(c, name="hipblasGetPointerMode")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasGetPointerMode
      type(c_ptr),value :: handle
      type(c_ptr),value :: mode
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSetVector(n,elemSize,x,incx,y,incy) bind(c, name="cublasSetVector")
#else
    function hipblasSetVector(n,elemSize,x,incx,y,incy) bind(c, name="hipblasSetVector")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSetVector
      integer(c_int),value :: n
      integer(c_int),value :: elemSize
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasGetVector(n,elemSize,x,incx,y,incy) bind(c, name="cublasGetVector")
#else
    function hipblasGetVector(n,elemSize,x,incx,y,incy) bind(c, name="hipblasGetVector")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasGetVector
      integer(c_int),value :: n
      integer(c_int),value :: elemSize
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSetMatrix(rows,cols,elemSize,A,lda,B,ldb) bind(c, name="cublasSetMatrix")
#else
    function hipblasSetMatrix(rows,cols,elemSize,A,lda,B,ldb) bind(c, name="hipblasSetMatrix")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSetMatrix
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      integer(c_int),value :: elemSize
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasGetMatrix(rows,cols,elemSize,A,lda,B,ldb) bind(c, name="cublasGetMatrix")
#else
    function hipblasGetMatrix(rows,cols,elemSize,A,lda,B,ldb) bind(c, name="hipblasGetMatrix")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasGetMatrix
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      integer(c_int),value :: elemSize
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSgeam(handle,transa,transb,m,n,alpha,A,lda,beta,B,ldb,C,ldc) bind(c, name="cublasSgeam")
#else
    function hipblasSgeam(handle,transa,transb,m,n,alpha,A,lda,beta,B,ldb,C,ldc) bind(c, name="hipblasSgeam")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSgeam
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: transa
      integer(kind(HIPBLAS_OP_N)),value :: transb
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float),intent(IN) :: beta
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDgeam(handle,transa,transb,m,n,alpha,A,lda,beta,B,ldb,C,ldc) bind(c, name="cublasDgeam")
#else
    function hipblasDgeam(handle,transa,transb,m,n,alpha,A,lda,beta,B,ldb,C,ldc) bind(c, name="hipblasDgeam")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDgeam
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: transa
      integer(kind(HIPBLAS_OP_N)),value :: transb
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double),intent(IN) :: beta
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasIsamax(handle,n,x,incx,myResult) bind(c, name="cublasIsamax")
#else
    function hipblasIsamax(handle,n,x,incx,myResult) bind(c, name="hipblasIsamax")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasIsamax
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasIdamax(handle,n,x,incx,myResult) bind(c, name="cublasIdamax")
#else
    function hipblasIdamax(handle,n,x,incx,myResult) bind(c, name="hipblasIdamax")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasIdamax
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasIcamax(handle,n,x,incx,myResult) bind(c, name="cublasIcamax")
#else
    function hipblasIcamax(handle,n,x,incx,myResult) bind(c, name="hipblasIcamax")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasIcamax
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasIzamax(handle,n,x,incx,myResult) bind(c, name="cublasIzamax")
#else
    function hipblasIzamax(handle,n,x,incx,myResult) bind(c, name="hipblasIzamax")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasIzamax
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasIsamaxBatched(handle,n,x,incx,batch_count,myResult) bind(c, name="cublasIsamaxBatched")
#else
    function hipblasIsamaxBatched(handle,n,x,incx,batch_count,myResult) bind(c, name="hipblasIsamaxBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasIsamaxBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasIdamaxBatched(handle,n,x,incx,batch_count,myResult) bind(c, name="cublasIdamaxBatched")
#else
    function hipblasIdamaxBatched(handle,n,x,incx,batch_count,myResult) bind(c, name="hipblasIdamaxBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasIdamaxBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasIcamaxBatched(handle,n,x,incx,batch_count,myResult) bind(c, name="cublasIcamaxBatched")
#else
    function hipblasIcamaxBatched(handle,n,x,incx,batch_count,myResult) bind(c, name="hipblasIcamaxBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasIcamaxBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasIzamaxBatched(handle,n,x,incx,batch_count,myResult) bind(c, name="cublasIzamaxBatched")
#else
    function hipblasIzamaxBatched(handle,n,x,incx,batch_count,myResult) bind(c, name="hipblasIzamaxBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasIzamaxBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasIsamaxStridedBatched(handle,n,x,incx,stridex,batch_count,myResult) bind(c, name="cublasIsamaxStridedBatched")
#else
    function hipblasIsamaxStridedBatched(handle,n,x,incx,stridex,batch_count,myResult) bind(c, name="hipblasIsamaxStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasIsamaxStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasIdamaxStridedBatched(handle,n,x,incx,stridex,batch_count,myResult) bind(c, name="cublasIdamaxStridedBatched")
#else
    function hipblasIdamaxStridedBatched(handle,n,x,incx,stridex,batch_count,myResult) bind(c, name="hipblasIdamaxStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasIdamaxStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasIcamaxStridedBatched(handle,n,x,incx,stridex,batch_count,myResult) bind(c, name="cublasIcamaxStridedBatched")
#else
    function hipblasIcamaxStridedBatched(handle,n,x,incx,stridex,batch_count,myResult) bind(c, name="hipblasIcamaxStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasIcamaxStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasIzamaxStridedBatched(handle,n,x,incx,stridex,batch_count,myResult) bind(c, name="cublasIzamaxStridedBatched")
#else
    function hipblasIzamaxStridedBatched(handle,n,x,incx,stridex,batch_count,myResult) bind(c, name="hipblasIzamaxStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasIzamaxStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasIsamin(handle,n,x,incx,myResult) bind(c, name="cublasIsamin")
#else
    function hipblasIsamin(handle,n,x,incx,myResult) bind(c, name="hipblasIsamin")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasIsamin
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasIdamin(handle,n,x,incx,myResult) bind(c, name="cublasIdamin")
#else
    function hipblasIdamin(handle,n,x,incx,myResult) bind(c, name="hipblasIdamin")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasIdamin
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasIcamin(handle,n,x,incx,myResult) bind(c, name="cublasIcamin")
#else
    function hipblasIcamin(handle,n,x,incx,myResult) bind(c, name="hipblasIcamin")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasIcamin
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasIzamin(handle,n,x,incx,myResult) bind(c, name="cublasIzamin")
#else
    function hipblasIzamin(handle,n,x,incx,myResult) bind(c, name="hipblasIzamin")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasIzamin
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasIsaminBatched(handle,n,x,incx,batch_count,myResult) bind(c, name="cublasIsaminBatched")
#else
    function hipblasIsaminBatched(handle,n,x,incx,batch_count,myResult) bind(c, name="hipblasIsaminBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasIsaminBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasIdaminBatched(handle,n,x,incx,batch_count,myResult) bind(c, name="cublasIdaminBatched")
#else
    function hipblasIdaminBatched(handle,n,x,incx,batch_count,myResult) bind(c, name="hipblasIdaminBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasIdaminBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasIcaminBatched(handle,n,x,incx,batch_count,myResult) bind(c, name="cublasIcaminBatched")
#else
    function hipblasIcaminBatched(handle,n,x,incx,batch_count,myResult) bind(c, name="hipblasIcaminBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasIcaminBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasIzaminBatched(handle,n,x,incx,batch_count,myResult) bind(c, name="cublasIzaminBatched")
#else
    function hipblasIzaminBatched(handle,n,x,incx,batch_count,myResult) bind(c, name="hipblasIzaminBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasIzaminBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasIsaminStridedBatched(handle,n,x,incx,stridex,batch_count,myResult) bind(c, name="cublasIsaminStridedBatched")
#else
    function hipblasIsaminStridedBatched(handle,n,x,incx,stridex,batch_count,myResult) bind(c, name="hipblasIsaminStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasIsaminStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasIdaminStridedBatched(handle,n,x,incx,stridex,batch_count,myResult) bind(c, name="cublasIdaminStridedBatched")
#else
    function hipblasIdaminStridedBatched(handle,n,x,incx,stridex,batch_count,myResult) bind(c, name="hipblasIdaminStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasIdaminStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasIcaminStridedBatched(handle,n,x,incx,stridex,batch_count,myResult) bind(c, name="cublasIcaminStridedBatched")
#else
    function hipblasIcaminStridedBatched(handle,n,x,incx,stridex,batch_count,myResult) bind(c, name="hipblasIcaminStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasIcaminStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasIzaminStridedBatched(handle,n,x,incx,stridex,batch_count,myResult) bind(c, name="cublasIzaminStridedBatched")
#else
    function hipblasIzaminStridedBatched(handle,n,x,incx,stridex,batch_count,myResult) bind(c, name="hipblasIzaminStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasIzaminStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSasum(handle,n,x,incx,myResult) bind(c, name="cublasSasum")
#else
    function hipblasSasum(handle,n,x,incx,myResult) bind(c, name="hipblasSasum")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSasum
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDasum(handle,n,x,incx,myResult) bind(c, name="cublasDasum")
#else
    function hipblasDasum(handle,n,x,incx,myResult) bind(c, name="hipblasDasum")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDasum
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasScasum(handle,n,x,incx,myResult) bind(c, name="cublasScasum")
#else
    function hipblasScasum(handle,n,x,incx,myResult) bind(c, name="hipblasScasum")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasScasum
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDzasum(handle,n,x,incx,myResult) bind(c, name="cublasDzasum")
#else
    function hipblasDzasum(handle,n,x,incx,myResult) bind(c, name="hipblasDzasum")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDzasum
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSasumBatched(handle,n,x,incx,batchCount,myResult) bind(c, name="cublasSasumBatched")
#else
    function hipblasSasumBatched(handle,n,x,incx,batchCount,myResult) bind(c, name="hipblasSasumBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSasumBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batchCount
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDasumBatched(handle,n,x,incx,batchCount,myResult) bind(c, name="cublasDasumBatched")
#else
    function hipblasDasumBatched(handle,n,x,incx,batchCount,myResult) bind(c, name="hipblasDasumBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDasumBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batchCount
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasScasumBatched(handle,n,x,incx,batchCount,myResult) bind(c, name="cublasScasumBatched")
#else
    function hipblasScasumBatched(handle,n,x,incx,batchCount,myResult) bind(c, name="hipblasScasumBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasScasumBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batchCount
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDzasumBatched(handle,n,x,incx,batchCount,myResult) bind(c, name="cublasDzasumBatched")
#else
    function hipblasDzasumBatched(handle,n,x,incx,batchCount,myResult) bind(c, name="hipblasDzasumBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDzasumBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batchCount
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSasumStridedBatched(handle,n,x,incx,stridex,batchCount,myResult) bind(c, name="cublasSasumStridedBatched")
#else
    function hipblasSasumStridedBatched(handle,n,x,incx,stridex,batchCount,myResult) bind(c, name="hipblasSasumStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSasumStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      integer(c_int),value :: batchCount
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDasumStridedBatched(handle,n,x,incx,stridex,batchCount,myResult) bind(c, name="cublasDasumStridedBatched")
#else
    function hipblasDasumStridedBatched(handle,n,x,incx,stridex,batchCount,myResult) bind(c, name="hipblasDasumStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDasumStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      integer(c_int),value :: batchCount
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasScasumStridedBatched(handle,n,x,incx,stridex,batchCount,myResult) bind(c, name="cublasScasumStridedBatched")
#else
    function hipblasScasumStridedBatched(handle,n,x,incx,stridex,batchCount,myResult) bind(c, name="hipblasScasumStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasScasumStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      integer(c_int),value :: batchCount
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDzasumStridedBatched(handle,n,x,incx,stridex,batchCount,myResult) bind(c, name="cublasDzasumStridedBatched")
#else
    function hipblasDzasumStridedBatched(handle,n,x,incx,stridex,batchCount,myResult) bind(c, name="hipblasDzasumStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDzasumStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      integer(c_int),value :: batchCount
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSaxpy(handle,n,alpha,x,incx,y,incy) bind(c, name="cublasSaxpy")
#else
    function hipblasSaxpy(handle,n,alpha,x,incx,y,incy) bind(c, name="hipblasSaxpy")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSaxpy
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDaxpy(handle,n,alpha,x,incx,y,incy) bind(c, name="cublasDaxpy")
#else
    function hipblasDaxpy(handle,n,alpha,x,incx,y,incy) bind(c, name="hipblasDaxpy")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDaxpy
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCaxpy(handle,n,alpha,x,incx,y,incy) bind(c, name="cublasCaxpy")
#else
    function hipblasCaxpy(handle,n,alpha,x,incx,y,incy) bind(c, name="hipblasCaxpy")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCaxpy
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZaxpy(handle,n,alpha,x,incx,y,incy) bind(c, name="cublasZaxpy")
#else
    function hipblasZaxpy(handle,n,alpha,x,incx,y,incy) bind(c, name="hipblasZaxpy")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZaxpy
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSaxpyBatched(handle,n,alpha,x,incx,y,incy,batch_count) bind(c, name="cublasSaxpyBatched")
#else
    function hipblasSaxpyBatched(handle,n,alpha,x,incx,y,incy,batch_count) bind(c, name="hipblasSaxpyBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSaxpyBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDaxpyBatched(handle,n,alpha,x,incx,y,incy,batch_count) bind(c, name="cublasDaxpyBatched")
#else
    function hipblasDaxpyBatched(handle,n,alpha,x,incx,y,incy,batch_count) bind(c, name="hipblasDaxpyBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDaxpyBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCaxpyBatched(handle,n,alpha,x,incx,y,incy,batch_count) bind(c, name="cublasCaxpyBatched")
#else
    function hipblasCaxpyBatched(handle,n,alpha,x,incx,y,incy,batch_count) bind(c, name="hipblasCaxpyBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCaxpyBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZaxpyBatched(handle,n,alpha,x,incx,y,incy,batch_count) bind(c, name="cublasZaxpyBatched")
#else
    function hipblasZaxpyBatched(handle,n,alpha,x,incx,y,incy,batch_count) bind(c, name="hipblasZaxpyBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZaxpyBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSaxpyStridedBatched(handle,n,alpha,x,incx,stridex,y,incy,stridey,batch_count) bind(c, name="cublasSaxpyStridedBatched")
#else
    function hipblasSaxpyStridedBatched(handle,n,alpha,x,incx,stridex,y,incy,stridey,batch_count) bind(c, name="hipblasSaxpyStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSaxpyStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDaxpyStridedBatched(handle,n,alpha,x,incx,stridex,y,incy,stridey,batch_count) bind(c, name="cublasDaxpyStridedBatched")
#else
    function hipblasDaxpyStridedBatched(handle,n,alpha,x,incx,stridex,y,incy,stridey,batch_count) bind(c, name="hipblasDaxpyStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDaxpyStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCaxpyStridedBatched(handle,n,alpha,x,incx,stridex,y,incy,stridey,batch_count) bind(c, name="cublasCaxpyStridedBatched")
#else
    function hipblasCaxpyStridedBatched(handle,n,alpha,x,incx,stridex,y,incy,stridey,batch_count) bind(c, name="hipblasCaxpyStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCaxpyStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZaxpyStridedBatched(handle,n,alpha,x,incx,stridex,y,incy,stridey,batch_count) bind(c, name="cublasZaxpyStridedBatched")
#else
    function hipblasZaxpyStridedBatched(handle,n,alpha,x,incx,stridex,y,incy,stridey,batch_count) bind(c, name="hipblasZaxpyStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZaxpyStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasScopy(handle,n,x,incx,y,incy) bind(c, name="cublasScopy")
#else
    function hipblasScopy(handle,n,x,incx,y,incy) bind(c, name="hipblasScopy")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasScopy
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDcopy(handle,n,x,incx,y,incy) bind(c, name="cublasDcopy")
#else
    function hipblasDcopy(handle,n,x,incx,y,incy) bind(c, name="hipblasDcopy")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDcopy
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCcopy(handle,n,x,incx,y,incy) bind(c, name="cublasCcopy")
#else
    function hipblasCcopy(handle,n,x,incx,y,incy) bind(c, name="hipblasCcopy")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCcopy
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZcopy(handle,n,x,incx,y,incy) bind(c, name="cublasZcopy")
#else
    function hipblasZcopy(handle,n,x,incx,y,incy) bind(c, name="hipblasZcopy")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZcopy
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasScopyBatched(handle,n,x,incx,y,incy,batchCount) bind(c, name="cublasScopyBatched")
#else
    function hipblasScopyBatched(handle,n,x,incx,y,incy,batchCount) bind(c, name="hipblasScopyBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasScopyBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDcopyBatched(handle,n,x,incx,y,incy,batchCount) bind(c, name="cublasDcopyBatched")
#else
    function hipblasDcopyBatched(handle,n,x,incx,y,incy,batchCount) bind(c, name="hipblasDcopyBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDcopyBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCcopyBatched(handle,n,x,incx,y,incy,batchCount) bind(c, name="cublasCcopyBatched")
#else
    function hipblasCcopyBatched(handle,n,x,incx,y,incy,batchCount) bind(c, name="hipblasCcopyBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCcopyBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZcopyBatched(handle,n,x,incx,y,incy,batchCount) bind(c, name="cublasZcopyBatched")
#else
    function hipblasZcopyBatched(handle,n,x,incx,y,incy,batchCount) bind(c, name="hipblasZcopyBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZcopyBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasScopyStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batchCount) bind(c, name="cublasScopyStridedBatched")
#else
    function hipblasScopyStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batchCount) bind(c, name="hipblasScopyStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasScopyStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDcopyStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batchCount) bind(c, name="cublasDcopyStridedBatched")
#else
    function hipblasDcopyStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batchCount) bind(c, name="hipblasDcopyStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDcopyStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCcopyStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batchCount) bind(c, name="cublasCcopyStridedBatched")
#else
    function hipblasCcopyStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batchCount) bind(c, name="hipblasCcopyStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCcopyStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZcopyStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batchCount) bind(c, name="cublasZcopyStridedBatched")
#else
    function hipblasZcopyStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batchCount) bind(c, name="hipblasZcopyStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZcopyStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasHdot(handle,n,x,incx,y,incy,myResult) bind(c, name="cublasHdot")
#else
    function hipblasHdot(handle,n,x,incx,y,incy,myResult) bind(c, name="hipblasHdot")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasHdot
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasBfdot(handle,n,x,incx,y,incy,myResult) bind(c, name="cublasBfdot")
#else
    function hipblasBfdot(handle,n,x,incx,y,incy,myResult) bind(c, name="hipblasBfdot")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasBfdot
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr) :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSdot(handle,n,x,incx,y,incy,myResult) bind(c, name="cublasSdot")
#else
    function hipblasSdot(handle,n,x,incx,y,incy,myResult) bind(c, name="hipblasSdot")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSdot
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDdot(handle,n,x,incx,y,incy,myResult) bind(c, name="cublasDdot")
#else
    function hipblasDdot(handle,n,x,incx,y,incy,myResult) bind(c, name="hipblasDdot")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDdot
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCdotc(handle,n,x,incx,y,incy,myResult) bind(c, name="cublasCdotc")
#else
    function hipblasCdotc(handle,n,x,incx,y,incy,myResult) bind(c, name="hipblasCdotc")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCdotc
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCdotu(handle,n,x,incx,y,incy,myResult) bind(c, name="cublasCdotu")
#else
    function hipblasCdotu(handle,n,x,incx,y,incy,myResult) bind(c, name="hipblasCdotu")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCdotu
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZdotc(handle,n,x,incx,y,incy,myResult) bind(c, name="cublasZdotc")
#else
    function hipblasZdotc(handle,n,x,incx,y,incy,myResult) bind(c, name="hipblasZdotc")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZdotc
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZdotu(handle,n,x,incx,y,incy,myResult) bind(c, name="cublasZdotu")
#else
    function hipblasZdotu(handle,n,x,incx,y,incy,myResult) bind(c, name="hipblasZdotu")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZdotu
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasHdotBatched(handle,n,x,incx,y,incy,batch_count,myResult) bind(c, name="cublasHdotBatched")
#else
    function hipblasHdotBatched(handle,n,x,incx,y,incy,batch_count,myResult) bind(c, name="hipblasHdotBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasHdotBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasBfdotBatched(handle,n,x,incx,y,incy,batch_count,myResult) bind(c, name="cublasBfdotBatched")
#else
    function hipblasBfdotBatched(handle,n,x,incx,y,incy,batch_count,myResult) bind(c, name="hipblasBfdotBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasBfdotBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
      type(c_ptr) :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSdotBatched(handle,n,x,incx,y,incy,batch_count,myResult) bind(c, name="cublasSdotBatched")
#else
    function hipblasSdotBatched(handle,n,x,incx,y,incy,batch_count,myResult) bind(c, name="hipblasSdotBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSdotBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDdotBatched(handle,n,x,incx,y,incy,batch_count,myResult) bind(c, name="cublasDdotBatched")
#else
    function hipblasDdotBatched(handle,n,x,incx,y,incy,batch_count,myResult) bind(c, name="hipblasDdotBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDdotBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCdotcBatched(handle,n,x,incx,y,incy,batch_count,myResult) bind(c, name="cublasCdotcBatched")
#else
    function hipblasCdotcBatched(handle,n,x,incx,y,incy,batch_count,myResult) bind(c, name="hipblasCdotcBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCdotcBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCdotuBatched(handle,n,x,incx,y,incy,batch_count,myResult) bind(c, name="cublasCdotuBatched")
#else
    function hipblasCdotuBatched(handle,n,x,incx,y,incy,batch_count,myResult) bind(c, name="hipblasCdotuBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCdotuBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZdotcBatched(handle,n,x,incx,y,incy,batch_count,myResult) bind(c, name="cublasZdotcBatched")
#else
    function hipblasZdotcBatched(handle,n,x,incx,y,incy,batch_count,myResult) bind(c, name="hipblasZdotcBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZdotcBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZdotuBatched(handle,n,x,incx,y,incy,batch_count,myResult) bind(c, name="cublasZdotuBatched")
#else
    function hipblasZdotuBatched(handle,n,x,incx,y,incy,batch_count,myResult) bind(c, name="hipblasZdotuBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZdotuBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasHdotStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batch_count,myResult) bind(c, name="cublasHdotStridedBatched")
#else
    function hipblasHdotStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batch_count,myResult) bind(c, name="hipblasHdotStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasHdotStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasBfdotStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batch_count,myResult) bind(c, name="cublasBfdotStridedBatched")
#else
    function hipblasBfdotStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batch_count,myResult) bind(c, name="hipblasBfdotStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasBfdotStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      integer(c_int),value :: batch_count
      type(c_ptr) :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSdotStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batch_count,myResult) bind(c, name="cublasSdotStridedBatched")
#else
    function hipblasSdotStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batch_count,myResult) bind(c, name="hipblasSdotStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSdotStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDdotStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batch_count,myResult) bind(c, name="cublasDdotStridedBatched")
#else
    function hipblasDdotStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batch_count,myResult) bind(c, name="hipblasDdotStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDdotStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCdotcStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batch_count,myResult) bind(c, name="cublasCdotcStridedBatched")
#else
    function hipblasCdotcStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batch_count,myResult) bind(c, name="hipblasCdotcStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCdotcStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCdotuStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batch_count,myResult) bind(c, name="cublasCdotuStridedBatched")
#else
    function hipblasCdotuStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batch_count,myResult) bind(c, name="hipblasCdotuStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCdotuStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZdotcStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batch_count,myResult) bind(c, name="cublasZdotcStridedBatched")
#else
    function hipblasZdotcStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batch_count,myResult) bind(c, name="hipblasZdotcStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZdotcStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZdotuStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batch_count,myResult) bind(c, name="cublasZdotuStridedBatched")
#else
    function hipblasZdotuStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batch_count,myResult) bind(c, name="hipblasZdotuStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZdotuStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSnrm2(handle,n,x,incx,myResult) bind(c, name="cublasSnrm2")
#else
    function hipblasSnrm2(handle,n,x,incx,myResult) bind(c, name="hipblasSnrm2")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSnrm2
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDnrm2(handle,n,x,incx,myResult) bind(c, name="cublasDnrm2")
#else
    function hipblasDnrm2(handle,n,x,incx,myResult) bind(c, name="hipblasDnrm2")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDnrm2
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasScnrm2(handle,n,x,incx,myResult) bind(c, name="cublasScnrm2")
#else
    function hipblasScnrm2(handle,n,x,incx,myResult) bind(c, name="hipblasScnrm2")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasScnrm2
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDznrm2(handle,n,x,incx,myResult) bind(c, name="cublasDznrm2")
#else
    function hipblasDznrm2(handle,n,x,incx,myResult) bind(c, name="hipblasDznrm2")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDznrm2
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSnrm2Batched(handle,n,x,incx,batchCount,myResult) bind(c, name="cublasSnrm2Batched")
#else
    function hipblasSnrm2Batched(handle,n,x,incx,batchCount,myResult) bind(c, name="hipblasSnrm2Batched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSnrm2Batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batchCount
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDnrm2Batched(handle,n,x,incx,batchCount,myResult) bind(c, name="cublasDnrm2Batched")
#else
    function hipblasDnrm2Batched(handle,n,x,incx,batchCount,myResult) bind(c, name="hipblasDnrm2Batched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDnrm2Batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batchCount
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasScnrm2Batched(handle,n,x,incx,batchCount,myResult) bind(c, name="cublasScnrm2Batched")
#else
    function hipblasScnrm2Batched(handle,n,x,incx,batchCount,myResult) bind(c, name="hipblasScnrm2Batched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasScnrm2Batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batchCount
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDznrm2Batched(handle,n,x,incx,batchCount,myResult) bind(c, name="cublasDznrm2Batched")
#else
    function hipblasDznrm2Batched(handle,n,x,incx,batchCount,myResult) bind(c, name="hipblasDznrm2Batched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDznrm2Batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batchCount
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSnrm2StridedBatched(handle,n,x,incx,stridex,batchCount,myResult) bind(c, name="cublasSnrm2StridedBatched")
#else
    function hipblasSnrm2StridedBatched(handle,n,x,incx,stridex,batchCount,myResult) bind(c, name="hipblasSnrm2StridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSnrm2StridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      integer(c_int),value :: batchCount
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDnrm2StridedBatched(handle,n,x,incx,stridex,batchCount,myResult) bind(c, name="cublasDnrm2StridedBatched")
#else
    function hipblasDnrm2StridedBatched(handle,n,x,incx,stridex,batchCount,myResult) bind(c, name="hipblasDnrm2StridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDnrm2StridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      integer(c_int),value :: batchCount
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasScnrm2StridedBatched(handle,n,x,incx,stridex,batchCount,myResult) bind(c, name="cublasScnrm2StridedBatched")
#else
    function hipblasScnrm2StridedBatched(handle,n,x,incx,stridex,batchCount,myResult) bind(c, name="hipblasScnrm2StridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasScnrm2StridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      integer(c_int),value :: batchCount
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDznrm2StridedBatched(handle,n,x,incx,stridex,batchCount,myResult) bind(c, name="cublasDznrm2StridedBatched")
#else
    function hipblasDznrm2StridedBatched(handle,n,x,incx,stridex,batchCount,myResult) bind(c, name="hipblasDznrm2StridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDznrm2StridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      integer(c_int),value :: batchCount
      type(c_ptr),value :: myResult
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSrot(handle,n,x,incx,y,incy,c,s) bind(c, name="cublasSrot")
#else
    function hipblasSrot(handle,n,x,incx,y,incy,c,s) bind(c, name="hipblasSrot")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSrot
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: c
      type(c_ptr),value :: s
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDrot(handle,n,x,incx,y,incy,c,s) bind(c, name="cublasDrot")
#else
    function hipblasDrot(handle,n,x,incx,y,incy,c,s) bind(c, name="hipblasDrot")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDrot
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: c
      type(c_ptr),value :: s
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCrot(handle,n,x,incx,y,incy,c,s) bind(c, name="cublasCrot")
#else
    function hipblasCrot(handle,n,x,incx,y,incy,c,s) bind(c, name="hipblasCrot")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCrot
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: c
      type(c_ptr),value :: s
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCsrot(handle,n,x,incx,y,incy,c,s) bind(c, name="cublasCsrot")
#else
    function hipblasCsrot(handle,n,x,incx,y,incy,c,s) bind(c, name="hipblasCsrot")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCsrot
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: c
      type(c_ptr),value :: s
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZrot(handle,n,x,incx,y,incy,c,s) bind(c, name="cublasZrot")
#else
    function hipblasZrot(handle,n,x,incx,y,incy,c,s) bind(c, name="hipblasZrot")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZrot
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: c
      type(c_ptr),value :: s
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZdrot(handle,n,x,incx,y,incy,c,s) bind(c, name="cublasZdrot")
#else
    function hipblasZdrot(handle,n,x,incx,y,incy,c,s) bind(c, name="hipblasZdrot")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZdrot
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: c
      type(c_ptr),value :: s
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSrotBatched(handle,n,x,incx,y,incy,c,s,batchCount) bind(c, name="cublasSrotBatched")
#else
    function hipblasSrotBatched(handle,n,x,incx,y,incy,c,s,batchCount) bind(c, name="hipblasSrotBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSrotBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: c
      type(c_ptr),value :: s
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDrotBatched(handle,n,x,incx,y,incy,c,s,batchCount) bind(c, name="cublasDrotBatched")
#else
    function hipblasDrotBatched(handle,n,x,incx,y,incy,c,s,batchCount) bind(c, name="hipblasDrotBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDrotBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: c
      type(c_ptr),value :: s
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCrotBatched(handle,n,x,incx,y,incy,c,s,batchCount) bind(c, name="cublasCrotBatched")
#else
    function hipblasCrotBatched(handle,n,x,incx,y,incy,c,s,batchCount) bind(c, name="hipblasCrotBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCrotBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: c
      type(c_ptr),value :: s
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCsrotBatched(handle,n,x,incx,y,incy,c,s,batchCount) bind(c, name="cublasCsrotBatched")
#else
    function hipblasCsrotBatched(handle,n,x,incx,y,incy,c,s,batchCount) bind(c, name="hipblasCsrotBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCsrotBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: c
      type(c_ptr),value :: s
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZrotBatched(handle,n,x,incx,y,incy,c,s,batchCount) bind(c, name="cublasZrotBatched")
#else
    function hipblasZrotBatched(handle,n,x,incx,y,incy,c,s,batchCount) bind(c, name="hipblasZrotBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZrotBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: c
      type(c_ptr),value :: s
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZdrotBatched(handle,n,x,incx,y,incy,c,s,batchCount) bind(c, name="cublasZdrotBatched")
#else
    function hipblasZdrotBatched(handle,n,x,incx,y,incy,c,s,batchCount) bind(c, name="hipblasZdrotBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZdrotBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: c
      type(c_ptr),value :: s
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSrotStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,c,s,batchCount) bind(c, name="cublasSrotStridedBatched")
#else
    function hipblasSrotStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,c,s,batchCount) bind(c, name="hipblasSrotStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSrotStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      type(c_ptr),value :: c
      type(c_ptr),value :: s
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDrotStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,c,s,batchCount) bind(c, name="cublasDrotStridedBatched")
#else
    function hipblasDrotStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,c,s,batchCount) bind(c, name="hipblasDrotStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDrotStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      type(c_ptr),value :: c
      type(c_ptr),value :: s
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCrotStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,c,s,batchCount) bind(c, name="cublasCrotStridedBatched")
#else
    function hipblasCrotStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,c,s,batchCount) bind(c, name="hipblasCrotStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCrotStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      type(c_ptr),value :: c
      type(c_ptr),value :: s
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCsrotStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,c,s,batchCount) bind(c, name="cublasCsrotStridedBatched")
#else
    function hipblasCsrotStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,c,s,batchCount) bind(c, name="hipblasCsrotStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCsrotStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      type(c_ptr),value :: c
      type(c_ptr),value :: s
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZrotStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,c,s,batchCount) bind(c, name="cublasZrotStridedBatched")
#else
    function hipblasZrotStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,c,s,batchCount) bind(c, name="hipblasZrotStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZrotStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      type(c_ptr),value :: c
      type(c_ptr),value :: s
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZdrotStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,c,s,batchCount) bind(c, name="cublasZdrotStridedBatched")
#else
    function hipblasZdrotStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,c,s,batchCount) bind(c, name="hipblasZdrotStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZdrotStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      type(c_ptr),value :: c
      type(c_ptr),value :: s
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSrotg(handle,a,b,c,s) bind(c, name="cublasSrotg")
#else
    function hipblasSrotg(handle,a,b,c,s) bind(c, name="hipblasSrotg")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSrotg
      type(c_ptr),value :: handle
      type(c_ptr),value :: a
      type(c_ptr),value :: b
      type(c_ptr),value :: c
      type(c_ptr),value :: s
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDrotg(handle,a,b,c,s) bind(c, name="cublasDrotg")
#else
    function hipblasDrotg(handle,a,b,c,s) bind(c, name="hipblasDrotg")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDrotg
      type(c_ptr),value :: handle
      type(c_ptr),value :: a
      type(c_ptr),value :: b
      type(c_ptr),value :: c
      type(c_ptr),value :: s
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCrotg(handle,a,b,c,s) bind(c, name="cublasCrotg")
#else
    function hipblasCrotg(handle,a,b,c,s) bind(c, name="hipblasCrotg")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCrotg
      type(c_ptr),value :: handle
      type(c_ptr),value :: a
      type(c_ptr),value :: b
      type(c_ptr),value :: c
      type(c_ptr),value :: s
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZrotg(handle,a,b,c,s) bind(c, name="cublasZrotg")
#else
    function hipblasZrotg(handle,a,b,c,s) bind(c, name="hipblasZrotg")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZrotg
      type(c_ptr),value :: handle
      type(c_ptr),value :: a
      type(c_ptr),value :: b
      type(c_ptr),value :: c
      type(c_ptr),value :: s
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSrotgBatched(handle,a,b,c,s,batchCount) bind(c, name="cublasSrotgBatched")
#else
    function hipblasSrotgBatched(handle,a,b,c,s,batchCount) bind(c, name="hipblasSrotgBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSrotgBatched
      type(c_ptr),value :: handle
      type(c_ptr) :: a
      type(c_ptr) :: b
      type(c_ptr) :: c
      type(c_ptr) :: s
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDrotgBatched(handle,a,b,c,s,batchCount) bind(c, name="cublasDrotgBatched")
#else
    function hipblasDrotgBatched(handle,a,b,c,s,batchCount) bind(c, name="hipblasDrotgBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDrotgBatched
      type(c_ptr),value :: handle
      type(c_ptr) :: a
      type(c_ptr) :: b
      type(c_ptr) :: c
      type(c_ptr) :: s
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCrotgBatched(handle,a,b,c,s,batchCount) bind(c, name="cublasCrotgBatched")
#else
    function hipblasCrotgBatched(handle,a,b,c,s,batchCount) bind(c, name="hipblasCrotgBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCrotgBatched
      type(c_ptr),value :: handle
      type(c_ptr) :: a
      type(c_ptr) :: b
      type(c_ptr) :: c
      type(c_ptr) :: s
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZrotgBatched(handle,a,b,c,s,batchCount) bind(c, name="cublasZrotgBatched")
#else
    function hipblasZrotgBatched(handle,a,b,c,s,batchCount) bind(c, name="hipblasZrotgBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZrotgBatched
      type(c_ptr),value :: handle
      type(c_ptr) :: a
      type(c_ptr) :: b
      type(c_ptr) :: c
      type(c_ptr) :: s
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSrotgStridedBatched(handle,a,stride_a,b,stride_b,c,stride_c,s,stride_s,batchCount) bind(c, name="cublasSrotgStridedBatched")
#else
    function hipblasSrotgStridedBatched(handle,a,stride_a,b,stride_b,c,stride_c,s,stride_s,batchCount) bind(c, name="hipblasSrotgStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSrotgStridedBatched
      type(c_ptr),value :: handle
      type(c_ptr),value :: a
      integer(c_int),value :: stride_a
      type(c_ptr),value :: b
      integer(c_int),value :: stride_b
      type(c_ptr),value :: c
      integer(c_int),value :: stride_c
      type(c_ptr),value :: s
      integer(c_int),value :: stride_s
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDrotgStridedBatched(handle,a,stride_a,b,stride_b,c,stride_c,s,stride_s,batchCount) bind(c, name="cublasDrotgStridedBatched")
#else
    function hipblasDrotgStridedBatched(handle,a,stride_a,b,stride_b,c,stride_c,s,stride_s,batchCount) bind(c, name="hipblasDrotgStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDrotgStridedBatched
      type(c_ptr),value :: handle
      type(c_ptr),value :: a
      integer(c_int),value :: stride_a
      type(c_ptr),value :: b
      integer(c_int),value :: stride_b
      type(c_ptr),value :: c
      integer(c_int),value :: stride_c
      type(c_ptr),value :: s
      integer(c_int),value :: stride_s
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCrotgStridedBatched(handle,a,stride_a,b,stride_b,c,stride_c,s,stride_s,batchCount) bind(c, name="cublasCrotgStridedBatched")
#else
    function hipblasCrotgStridedBatched(handle,a,stride_a,b,stride_b,c,stride_c,s,stride_s,batchCount) bind(c, name="hipblasCrotgStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCrotgStridedBatched
      type(c_ptr),value :: handle
      type(c_ptr),value :: a
      integer(c_int),value :: stride_a
      type(c_ptr),value :: b
      integer(c_int),value :: stride_b
      type(c_ptr),value :: c
      integer(c_int),value :: stride_c
      type(c_ptr),value :: s
      integer(c_int),value :: stride_s
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZrotgStridedBatched(handle,a,stride_a,b,stride_b,c,stride_c,s,stride_s,batchCount) bind(c, name="cublasZrotgStridedBatched")
#else
    function hipblasZrotgStridedBatched(handle,a,stride_a,b,stride_b,c,stride_c,s,stride_s,batchCount) bind(c, name="hipblasZrotgStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZrotgStridedBatched
      type(c_ptr),value :: handle
      type(c_ptr),value :: a
      integer(c_int),value :: stride_a
      type(c_ptr),value :: b
      integer(c_int),value :: stride_b
      type(c_ptr),value :: c
      integer(c_int),value :: stride_c
      type(c_ptr),value :: s
      integer(c_int),value :: stride_s
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSrotm(handle,n,x,incx,y,incy,param) bind(c, name="cublasSrotm")
#else
    function hipblasSrotm(handle,n,x,incx,y,incy,param) bind(c, name="hipblasSrotm")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSrotm
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: param
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDrotm(handle,n,x,incx,y,incy,param) bind(c, name="cublasDrotm")
#else
    function hipblasDrotm(handle,n,x,incx,y,incy,param) bind(c, name="hipblasDrotm")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDrotm
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: param
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSrotmBatched(handle,n,x,incx,y,incy,param,batchCount) bind(c, name="cublasSrotmBatched")
#else
    function hipblasSrotmBatched(handle,n,x,incx,y,incy,param,batchCount) bind(c, name="hipblasSrotmBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSrotmBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr) :: param
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDrotmBatched(handle,n,x,incx,y,incy,param,batchCount) bind(c, name="cublasDrotmBatched")
#else
    function hipblasDrotmBatched(handle,n,x,incx,y,incy,param,batchCount) bind(c, name="hipblasDrotmBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDrotmBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr) :: param
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSrotmStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,param,stride_param,batchCount) bind(c, name="cublasSrotmStridedBatched")
#else
    function hipblasSrotmStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,param,stride_param,batchCount) bind(c, name="hipblasSrotmStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSrotmStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      type(c_ptr),value :: param
      integer(c_int),value :: stride_param
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDrotmStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,param,stride_param,batchCount) bind(c, name="cublasDrotmStridedBatched")
#else
    function hipblasDrotmStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,param,stride_param,batchCount) bind(c, name="hipblasDrotmStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDrotmStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      type(c_ptr),value :: param
      integer(c_int),value :: stride_param
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSrotmg(handle,d1,d2,x1,y1,param) bind(c, name="cublasSrotmg")
#else
    function hipblasSrotmg(handle,d1,d2,x1,y1,param) bind(c, name="hipblasSrotmg")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSrotmg
      type(c_ptr),value :: handle
      type(c_ptr),value :: d1
      type(c_ptr),value :: d2
      type(c_ptr),value :: x1
      type(c_ptr),value :: y1
      type(c_ptr),value :: param
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDrotmg(handle,d1,d2,x1,y1,param) bind(c, name="cublasDrotmg")
#else
    function hipblasDrotmg(handle,d1,d2,x1,y1,param) bind(c, name="hipblasDrotmg")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDrotmg
      type(c_ptr),value :: handle
      type(c_ptr),value :: d1
      type(c_ptr),value :: d2
      type(c_ptr),value :: x1
      type(c_ptr),value :: y1
      type(c_ptr),value :: param
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSrotmgBatched(handle,d1,d2,x1,y1,param,batchCount) bind(c, name="cublasSrotmgBatched")
#else
    function hipblasSrotmgBatched(handle,d1,d2,x1,y1,param,batchCount) bind(c, name="hipblasSrotmgBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSrotmgBatched
      type(c_ptr),value :: handle
      type(c_ptr) :: d1
      type(c_ptr) :: d2
      type(c_ptr) :: x1
      type(c_ptr) :: y1
      type(c_ptr) :: param
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDrotmgBatched(handle,d1,d2,x1,y1,param,batchCount) bind(c, name="cublasDrotmgBatched")
#else
    function hipblasDrotmgBatched(handle,d1,d2,x1,y1,param,batchCount) bind(c, name="hipblasDrotmgBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDrotmgBatched
      type(c_ptr),value :: handle
      type(c_ptr) :: d1
      type(c_ptr) :: d2
      type(c_ptr) :: x1
      type(c_ptr) :: y1
      type(c_ptr) :: param
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSrotmgStridedBatched(handle,d1,stride_d1,d2,stride_d2,x1,stride_x1,y1,stride_y1,param,stride_param,batchCount) bind(c, name="cublasSrotmgStridedBatched")
#else
    function hipblasSrotmgStridedBatched(handle,d1,stride_d1,d2,stride_d2,x1,stride_x1,y1,stride_y1,param,stride_param,batchCount) bind(c, name="hipblasSrotmgStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSrotmgStridedBatched
      type(c_ptr),value :: handle
      type(c_ptr),value :: d1
      integer(c_int),value :: stride_d1
      type(c_ptr),value :: d2
      integer(c_int),value :: stride_d2
      type(c_ptr),value :: x1
      integer(c_int),value :: stride_x1
      type(c_ptr),value :: y1
      integer(c_int),value :: stride_y1
      type(c_ptr),value :: param
      integer(c_int),value :: stride_param
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDrotmgStridedBatched(handle,d1,stride_d1,d2,stride_d2,x1,stride_x1,y1,stride_y1,param,stride_param,batchCount) bind(c, name="cublasDrotmgStridedBatched")
#else
    function hipblasDrotmgStridedBatched(handle,d1,stride_d1,d2,stride_d2,x1,stride_x1,y1,stride_y1,param,stride_param,batchCount) bind(c, name="hipblasDrotmgStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDrotmgStridedBatched
      type(c_ptr),value :: handle
      type(c_ptr),value :: d1
      integer(c_int),value :: stride_d1
      type(c_ptr),value :: d2
      integer(c_int),value :: stride_d2
      type(c_ptr),value :: x1
      integer(c_int),value :: stride_x1
      type(c_ptr),value :: y1
      integer(c_int),value :: stride_y1
      type(c_ptr),value :: param
      integer(c_int),value :: stride_param
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSscal(handle,n,alpha,x,incx) bind(c, name="cublasSscal")
#else
    function hipblasSscal(handle,n,alpha,x,incx) bind(c, name="hipblasSscal")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSscal
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDscal(handle,n,alpha,x,incx) bind(c, name="cublasDscal")
#else
    function hipblasDscal(handle,n,alpha,x,incx) bind(c, name="hipblasDscal")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDscal
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCscal(handle,n,alpha,x,incx) bind(c, name="cublasCscal")
#else
    function hipblasCscal(handle,n,alpha,x,incx) bind(c, name="hipblasCscal")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCscal
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCsscal(handle,n,alpha,x,incx) bind(c, name="cublasCsscal")
#else
    function hipblasCsscal(handle,n,alpha,x,incx) bind(c, name="hipblasCsscal")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCsscal
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZscal(handle,n,alpha,x,incx) bind(c, name="cublasZscal")
#else
    function hipblasZscal(handle,n,alpha,x,incx) bind(c, name="hipblasZscal")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZscal
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZdscal(handle,n,alpha,x,incx) bind(c, name="cublasZdscal")
#else
    function hipblasZdscal(handle,n,alpha,x,incx) bind(c, name="hipblasZdscal")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZdscal
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSscalBatched(handle,n,alpha,x,incx,batchCount) bind(c, name="cublasSscalBatched")
#else
    function hipblasSscalBatched(handle,n,alpha,x,incx,batchCount) bind(c, name="hipblasSscalBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSscalBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDscalBatched(handle,n,alpha,x,incx,batchCount) bind(c, name="cublasDscalBatched")
#else
    function hipblasDscalBatched(handle,n,alpha,x,incx,batchCount) bind(c, name="hipblasDscalBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDscalBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCscalBatched(handle,n,alpha,x,incx,batchCount) bind(c, name="cublasCscalBatched")
#else
    function hipblasCscalBatched(handle,n,alpha,x,incx,batchCount) bind(c, name="hipblasCscalBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCscalBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZscalBatched(handle,n,alpha,x,incx,batchCount) bind(c, name="cublasZscalBatched")
#else
    function hipblasZscalBatched(handle,n,alpha,x,incx,batchCount) bind(c, name="hipblasZscalBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZscalBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCsscalBatched(handle,n,alpha,x,incx,batchCount) bind(c, name="cublasCsscalBatched")
#else
    function hipblasCsscalBatched(handle,n,alpha,x,incx,batchCount) bind(c, name="hipblasCsscalBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCsscalBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZdscalBatched(handle,n,alpha,x,incx,batchCount) bind(c, name="cublasZdscalBatched")
#else
    function hipblasZdscalBatched(handle,n,alpha,x,incx,batchCount) bind(c, name="hipblasZdscalBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZdscalBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSscalStridedBatched(handle,n,alpha,x,incx,stridex,batchCount) bind(c, name="cublasSscalStridedBatched")
#else
    function hipblasSscalStridedBatched(handle,n,alpha,x,incx,stridex,batchCount) bind(c, name="hipblasSscalStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSscalStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDscalStridedBatched(handle,n,alpha,x,incx,stridex,batchCount) bind(c, name="cublasDscalStridedBatched")
#else
    function hipblasDscalStridedBatched(handle,n,alpha,x,incx,stridex,batchCount) bind(c, name="hipblasDscalStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDscalStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCscalStridedBatched(handle,n,alpha,x,incx,stridex,batchCount) bind(c, name="cublasCscalStridedBatched")
#else
    function hipblasCscalStridedBatched(handle,n,alpha,x,incx,stridex,batchCount) bind(c, name="hipblasCscalStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCscalStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZscalStridedBatched(handle,n,alpha,x,incx,stridex,batchCount) bind(c, name="cublasZscalStridedBatched")
#else
    function hipblasZscalStridedBatched(handle,n,alpha,x,incx,stridex,batchCount) bind(c, name="hipblasZscalStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZscalStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCsscalStridedBatched(handle,n,alpha,x,incx,stridex,batchCount) bind(c, name="cublasCsscalStridedBatched")
#else
    function hipblasCsscalStridedBatched(handle,n,alpha,x,incx,stridex,batchCount) bind(c, name="hipblasCsscalStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCsscalStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZdscalStridedBatched(handle,n,alpha,x,incx,stridex,batchCount) bind(c, name="cublasZdscalStridedBatched")
#else
    function hipblasZdscalStridedBatched(handle,n,alpha,x,incx,stridex,batchCount) bind(c, name="hipblasZdscalStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZdscalStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSswap(handle,n,x,incx,y,incy) bind(c, name="cublasSswap")
#else
    function hipblasSswap(handle,n,x,incx,y,incy) bind(c, name="hipblasSswap")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSswap
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDswap(handle,n,x,incx,y,incy) bind(c, name="cublasDswap")
#else
    function hipblasDswap(handle,n,x,incx,y,incy) bind(c, name="hipblasDswap")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDswap
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCswap(handle,n,x,incx,y,incy) bind(c, name="cublasCswap")
#else
    function hipblasCswap(handle,n,x,incx,y,incy) bind(c, name="hipblasCswap")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCswap
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZswap(handle,n,x,incx,y,incy) bind(c, name="cublasZswap")
#else
    function hipblasZswap(handle,n,x,incx,y,incy) bind(c, name="hipblasZswap")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZswap
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSswapBatched(handle,n,x,incx,y,incy,batchCount) bind(c, name="cublasSswapBatched")
#else
    function hipblasSswapBatched(handle,n,x,incx,y,incy,batchCount) bind(c, name="hipblasSswapBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSswapBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDswapBatched(handle,n,x,incx,y,incy,batchCount) bind(c, name="cublasDswapBatched")
#else
    function hipblasDswapBatched(handle,n,x,incx,y,incy,batchCount) bind(c, name="hipblasDswapBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDswapBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCswapBatched(handle,n,x,incx,y,incy,batchCount) bind(c, name="cublasCswapBatched")
#else
    function hipblasCswapBatched(handle,n,x,incx,y,incy,batchCount) bind(c, name="hipblasCswapBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCswapBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZswapBatched(handle,n,x,incx,y,incy,batchCount) bind(c, name="cublasZswapBatched")
#else
    function hipblasZswapBatched(handle,n,x,incx,y,incy,batchCount) bind(c, name="hipblasZswapBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZswapBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSswapStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batchCount) bind(c, name="cublasSswapStridedBatched")
#else
    function hipblasSswapStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batchCount) bind(c, name="hipblasSswapStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSswapStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDswapStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batchCount) bind(c, name="cublasDswapStridedBatched")
#else
    function hipblasDswapStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batchCount) bind(c, name="hipblasDswapStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDswapStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCswapStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batchCount) bind(c, name="cublasCswapStridedBatched")
#else
    function hipblasCswapStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batchCount) bind(c, name="hipblasCswapStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCswapStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZswapStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batchCount) bind(c, name="cublasZswapStridedBatched")
#else
    function hipblasZswapStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batchCount) bind(c, name="hipblasZswapStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZswapStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSgbmv(handle,trans,m,n,kl,ku,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="cublasSgbmv")
#else
    function hipblasSgbmv(handle,trans,m,n,kl,ku,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="hipblasSgbmv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSgbmv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: kl
      integer(c_int),value :: ku
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      real(c_float),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDgbmv(handle,trans,m,n,kl,ku,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="cublasDgbmv")
#else
    function hipblasDgbmv(handle,trans,m,n,kl,ku,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="hipblasDgbmv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDgbmv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: kl
      integer(c_int),value :: ku
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      real(c_double),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCgbmv(handle,trans,m,n,kl,ku,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="cublasCgbmv")
#else
    function hipblasCgbmv(handle,trans,m,n,kl,ku,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="hipblasCgbmv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCgbmv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: kl
      integer(c_int),value :: ku
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZgbmv(handle,trans,m,n,kl,ku,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="cublasZgbmv")
#else
    function hipblasZgbmv(handle,trans,m,n,kl,ku,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="hipblasZgbmv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZgbmv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: kl
      integer(c_int),value :: ku
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSgbmvBatched(handle,trans,m,n,kl,ku,alpha,A,lda,x,incx,beta,y,incy,batch_count) bind(c, name="cublasSgbmvBatched")
#else
    function hipblasSgbmvBatched(handle,trans,m,n,kl,ku,alpha,A,lda,x,incx,beta,y,incy,batch_count) bind(c, name="hipblasSgbmvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSgbmvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: kl
      integer(c_int),value :: ku
      real(c_float),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      real(c_float),intent(IN) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDgbmvBatched(handle,trans,m,n,kl,ku,alpha,A,lda,x,incx,beta,y,incy,batch_count) bind(c, name="cublasDgbmvBatched")
#else
    function hipblasDgbmvBatched(handle,trans,m,n,kl,ku,alpha,A,lda,x,incx,beta,y,incy,batch_count) bind(c, name="hipblasDgbmvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDgbmvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: kl
      integer(c_int),value :: ku
      real(c_double),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      real(c_double),intent(IN) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCgbmvBatched(handle,trans,m,n,kl,ku,alpha,A,lda,x,incx,beta,y,incy,batch_count) bind(c, name="cublasCgbmvBatched")
#else
    function hipblasCgbmvBatched(handle,trans,m,n,kl,ku,alpha,A,lda,x,incx,beta,y,incy,batch_count) bind(c, name="hipblasCgbmvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCgbmvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: kl
      integer(c_int),value :: ku
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZgbmvBatched(handle,trans,m,n,kl,ku,alpha,A,lda,x,incx,beta,y,incy,batch_count) bind(c, name="cublasZgbmvBatched")
#else
    function hipblasZgbmvBatched(handle,trans,m,n,kl,ku,alpha,A,lda,x,incx,beta,y,incy,batch_count) bind(c, name="hipblasZgbmvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZgbmvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: kl
      integer(c_int),value :: ku
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSgbmvStridedBatched(handle,trans,m,n,kl,ku,alpha,A,lda,stride_a,x,incx,stride_x,beta,y,incy,stride_y,batch_count) bind(c, name="cublasSgbmvStridedBatched")
#else
    function hipblasSgbmvStridedBatched(handle,trans,m,n,kl,ku,alpha,A,lda,stride_a,x,incx,stride_x,beta,y,incy,stride_y,batch_count) bind(c, name="hipblasSgbmvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSgbmvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: kl
      integer(c_int),value :: ku
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: stride_a
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stride_x
      real(c_float),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stride_y
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDgbmvStridedBatched(handle,trans,m,n,kl,ku,alpha,A,lda,stride_a,x,incx,stride_x,beta,y,incy,stride_y,batch_count) bind(c, name="cublasDgbmvStridedBatched")
#else
    function hipblasDgbmvStridedBatched(handle,trans,m,n,kl,ku,alpha,A,lda,stride_a,x,incx,stride_x,beta,y,incy,stride_y,batch_count) bind(c, name="hipblasDgbmvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDgbmvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: kl
      integer(c_int),value :: ku
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: stride_a
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stride_x
      real(c_double),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stride_y
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCgbmvStridedBatched(handle,trans,m,n,kl,ku,alpha,A,lda,stride_a,x,incx,stride_x,beta,y,incy,stride_y,batch_count) bind(c, name="cublasCgbmvStridedBatched")
#else
    function hipblasCgbmvStridedBatched(handle,trans,m,n,kl,ku,alpha,A,lda,stride_a,x,incx,stride_x,beta,y,incy,stride_y,batch_count) bind(c, name="hipblasCgbmvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCgbmvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: kl
      integer(c_int),value :: ku
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: stride_a
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stride_x
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stride_y
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZgbmvStridedBatched(handle,trans,m,n,kl,ku,alpha,A,lda,stride_a,x,incx,stride_x,beta,y,incy,stride_y,batch_count) bind(c, name="cublasZgbmvStridedBatched")
#else
    function hipblasZgbmvStridedBatched(handle,trans,m,n,kl,ku,alpha,A,lda,stride_a,x,incx,stride_x,beta,y,incy,stride_y,batch_count) bind(c, name="hipblasZgbmvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZgbmvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: kl
      integer(c_int),value :: ku
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: stride_a
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stride_x
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stride_y
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSgemv(handle,trans,m,n,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="cublasSgemv")
#else
    function hipblasSgemv(handle,trans,m,n,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="hipblasSgemv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSgemv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      real(c_float),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDgemv(handle,trans,m,n,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="cublasDgemv")
#else
    function hipblasDgemv(handle,trans,m,n,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="hipblasDgemv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDgemv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      real(c_double),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCgemv(handle,trans,m,n,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="cublasCgemv")
#else
    function hipblasCgemv(handle,trans,m,n,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="hipblasCgemv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCgemv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZgemv(handle,trans,m,n,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="cublasZgemv")
#else
    function hipblasZgemv(handle,trans,m,n,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="hipblasZgemv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZgemv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSgemvBatched(handle,trans,m,n,alpha,A,lda,x,incx,beta,y,incy,batchCount) bind(c, name="cublasSgemvBatched")
#else
    function hipblasSgemvBatched(handle,trans,m,n,alpha,A,lda,x,incx,beta,y,incy,batchCount) bind(c, name="hipblasSgemvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSgemvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      real(c_float),intent(IN) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDgemvBatched(handle,trans,m,n,alpha,A,lda,x,incx,beta,y,incy,batchCount) bind(c, name="cublasDgemvBatched")
#else
    function hipblasDgemvBatched(handle,trans,m,n,alpha,A,lda,x,incx,beta,y,incy,batchCount) bind(c, name="hipblasDgemvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDgemvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      real(c_double),intent(IN) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCgemvBatched(handle,trans,m,n,alpha,A,lda,x,incx,beta,y,incy,batchCount) bind(c, name="cublasCgemvBatched")
#else
    function hipblasCgemvBatched(handle,trans,m,n,alpha,A,lda,x,incx,beta,y,incy,batchCount) bind(c, name="hipblasCgemvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCgemvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZgemvBatched(handle,trans,m,n,alpha,A,lda,x,incx,beta,y,incy,batchCount) bind(c, name="cublasZgemvBatched")
#else
    function hipblasZgemvBatched(handle,trans,m,n,alpha,A,lda,x,incx,beta,y,incy,batchCount) bind(c, name="hipblasZgemvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZgemvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSgemvStridedBatched(handle,trans,m,n,alpha,A,lda,strideA,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="cublasSgemvStridedBatched")
#else
    function hipblasSgemvStridedBatched(handle,trans,m,n,alpha,A,lda,strideA,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="hipblasSgemvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSgemvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      real(c_float),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDgemvStridedBatched(handle,trans,m,n,alpha,A,lda,strideA,x,incx,stridex,beta,y,stridey,incy,batchCount) bind(c, name="cublasDgemvStridedBatched")
#else
    function hipblasDgemvStridedBatched(handle,trans,m,n,alpha,A,lda,strideA,x,incx,stridex,beta,y,stridey,incy,batchCount) bind(c, name="hipblasDgemvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDgemvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      real(c_double),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: stridey
      integer(c_int),value :: incy
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCgemvStridedBatched(handle,trans,m,n,alpha,A,lda,strideA,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="cublasCgemvStridedBatched")
#else
    function hipblasCgemvStridedBatched(handle,trans,m,n,alpha,A,lda,strideA,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="hipblasCgemvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCgemvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZgemvStridedBatched(handle,trans,m,n,alpha,A,lda,strideA,x,incx,stridex,beta,y,stridey,incy,batchCount) bind(c, name="cublasZgemvStridedBatched")
#else
    function hipblasZgemvStridedBatched(handle,trans,m,n,alpha,A,lda,strideA,x,incx,stridex,beta,y,stridey,incy,batchCount) bind(c, name="hipblasZgemvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZgemvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: stridey
      integer(c_int),value :: incy
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSger(handle,m,n,alpha,x,incx,y,incy,A,lda) bind(c, name="cublasSger")
#else
    function hipblasSger(handle,m,n,alpha,x,incx,y,incy,A,lda) bind(c, name="hipblasSger")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSger
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDger(handle,m,n,alpha,x,incx,y,incy,A,lda) bind(c, name="cublasDger")
#else
    function hipblasDger(handle,m,n,alpha,x,incx,y,incy,A,lda) bind(c, name="hipblasDger")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDger
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCgeru(handle,m,n,alpha,x,incx,y,incy,A,lda) bind(c, name="cublasCgeru")
#else
    function hipblasCgeru(handle,m,n,alpha,x,incx,y,incy,A,lda) bind(c, name="hipblasCgeru")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCgeru
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCgerc(handle,m,n,alpha,x,incx,y,incy,A,lda) bind(c, name="cublasCgerc")
#else
    function hipblasCgerc(handle,m,n,alpha,x,incx,y,incy,A,lda) bind(c, name="hipblasCgerc")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCgerc
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZgeru(handle,m,n,alpha,x,incx,y,incy,A,lda) bind(c, name="cublasZgeru")
#else
    function hipblasZgeru(handle,m,n,alpha,x,incx,y,incy,A,lda) bind(c, name="hipblasZgeru")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZgeru
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZgerc(handle,m,n,alpha,x,incx,y,incy,A,lda) bind(c, name="cublasZgerc")
#else
    function hipblasZgerc(handle,m,n,alpha,x,incx,y,incy,A,lda) bind(c, name="hipblasZgerc")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZgerc
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSgerBatched(handle,m,n,alpha,x,incx,y,incy,A,lda,batchCount) bind(c, name="cublasSgerBatched")
#else
    function hipblasSgerBatched(handle,m,n,alpha,x,incx,y,incy,A,lda,batchCount) bind(c, name="hipblasSgerBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSgerBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDgerBatched(handle,m,n,alpha,x,incx,y,incy,A,lda,batchCount) bind(c, name="cublasDgerBatched")
#else
    function hipblasDgerBatched(handle,m,n,alpha,x,incx,y,incy,A,lda,batchCount) bind(c, name="hipblasDgerBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDgerBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCgeruBatched(handle,m,n,alpha,x,incx,y,incy,A,lda,batchCount) bind(c, name="cublasCgeruBatched")
#else
    function hipblasCgeruBatched(handle,m,n,alpha,x,incx,y,incy,A,lda,batchCount) bind(c, name="hipblasCgeruBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCgeruBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCgercBatched(handle,m,n,alpha,x,incx,y,incy,A,lda,batchCount) bind(c, name="cublasCgercBatched")
#else
    function hipblasCgercBatched(handle,m,n,alpha,x,incx,y,incy,A,lda,batchCount) bind(c, name="hipblasCgercBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCgercBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZgeruBatched(handle,m,n,alpha,x,incx,y,incy,A,lda,batchCount) bind(c, name="cublasZgeruBatched")
#else
    function hipblasZgeruBatched(handle,m,n,alpha,x,incx,y,incy,A,lda,batchCount) bind(c, name="hipblasZgeruBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZgeruBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZgercBatched(handle,m,n,alpha,x,incx,y,incy,A,lda,batchCount) bind(c, name="cublasZgercBatched")
#else
    function hipblasZgercBatched(handle,m,n,alpha,x,incx,y,incy,A,lda,batchCount) bind(c, name="hipblasZgercBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZgercBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSgerStridedBatched(handle,m,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batchCount) bind(c, name="cublasSgerStridedBatched")
#else
    function hipblasSgerStridedBatched(handle,m,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batchCount) bind(c, name="hipblasSgerStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSgerStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDgerStridedBatched(handle,m,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batchCount) bind(c, name="cublasDgerStridedBatched")
#else
    function hipblasDgerStridedBatched(handle,m,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batchCount) bind(c, name="hipblasDgerStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDgerStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCgeruStridedBatched(handle,m,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batchCount) bind(c, name="cublasCgeruStridedBatched")
#else
    function hipblasCgeruStridedBatched(handle,m,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batchCount) bind(c, name="hipblasCgeruStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCgeruStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCgercStridedBatched(handle,m,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batchCount) bind(c, name="cublasCgercStridedBatched")
#else
    function hipblasCgercStridedBatched(handle,m,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batchCount) bind(c, name="hipblasCgercStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCgercStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZgeruStridedBatched(handle,m,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batchCount) bind(c, name="cublasZgeruStridedBatched")
#else
    function hipblasZgeruStridedBatched(handle,m,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batchCount) bind(c, name="hipblasZgeruStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZgeruStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZgercStridedBatched(handle,m,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batchCount) bind(c, name="cublasZgercStridedBatched")
#else
    function hipblasZgercStridedBatched(handle,m,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batchCount) bind(c, name="hipblasZgercStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZgercStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasChbmv(handle,uplo,n,k,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="cublasChbmv")
#else
    function hipblasChbmv(handle,uplo,n,k,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="hipblasChbmv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasChbmv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZhbmv(handle,uplo,n,k,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="cublasZhbmv")
#else
    function hipblasZhbmv(handle,uplo,n,k,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="hipblasZhbmv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZhbmv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasChbmvBatched(handle,uplo,n,k,alpha,A,lda,x,incx,beta,y,incy,batchCount) bind(c, name="cublasChbmvBatched")
#else
    function hipblasChbmvBatched(handle,uplo,n,k,alpha,A,lda,x,incx,beta,y,incy,batchCount) bind(c, name="hipblasChbmvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasChbmvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZhbmvBatched(handle,uplo,n,k,alpha,A,lda,x,incx,beta,y,incy,batchCount) bind(c, name="cublasZhbmvBatched")
#else
    function hipblasZhbmvBatched(handle,uplo,n,k,alpha,A,lda,x,incx,beta,y,incy,batchCount) bind(c, name="hipblasZhbmvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZhbmvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasChbmvStridedBatched(handle,uplo,n,k,alpha,A,lda,strideA,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="cublasChbmvStridedBatched")
#else
    function hipblasChbmvStridedBatched(handle,uplo,n,k,alpha,A,lda,strideA,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="hipblasChbmvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasChbmvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZhbmvStridedBatched(handle,uplo,n,k,alpha,A,lda,strideA,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="cublasZhbmvStridedBatched")
#else
    function hipblasZhbmvStridedBatched(handle,uplo,n,k,alpha,A,lda,strideA,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="hipblasZhbmvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZhbmvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasChemv(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="cublasChemv")
#else
    function hipblasChemv(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="hipblasChemv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasChemv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZhemv(handle,uplo,n,alpha,A,da,x,incx,beta,y,incy) bind(c, name="cublasZhemv")
#else
    function hipblasZhemv(handle,uplo,n,alpha,A,da,x,incx,beta,y,incy) bind(c, name="hipblasZhemv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZhemv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: da
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasChemvBatched(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy,batch_count) bind(c, name="cublasChemvBatched")
#else
    function hipblasChemvBatched(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy,batch_count) bind(c, name="hipblasChemvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasChemvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZhemvBatched(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy,batch_count) bind(c, name="cublasZhemvBatched")
#else
    function hipblasZhemvBatched(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy,batch_count) bind(c, name="hipblasZhemvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZhemvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasChemvStridedBatched(handle,uplo,n,alpha,A,lda,stride_a,x,incx,stride_x,beta,y,incy,stride_y,batch_count) bind(c, name="cublasChemvStridedBatched")
#else
    function hipblasChemvStridedBatched(handle,uplo,n,alpha,A,lda,stride_a,x,incx,stride_x,beta,y,incy,stride_y,batch_count) bind(c, name="hipblasChemvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasChemvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: stride_a
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stride_x
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stride_y
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZhemvStridedBatched(handle,uplo,n,alpha,A,lda,stride_a,x,incx,stride_x,beta,y,incy,stride_y,batch_count) bind(c, name="cublasZhemvStridedBatched")
#else
    function hipblasZhemvStridedBatched(handle,uplo,n,alpha,A,lda,stride_a,x,incx,stride_x,beta,y,incy,stride_y,batch_count) bind(c, name="hipblasZhemvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZhemvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: stride_a
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stride_x
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stride_y
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCher(handle,uplo,n,alpha,x,incx,A,lda) bind(c, name="cublasCher")
#else
    function hipblasCher(handle,uplo,n,alpha,x,incx,A,lda) bind(c, name="hipblasCher")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCher
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZher(handle,uplo,n,alpha,x,incx,A,lda) bind(c, name="cublasZher")
#else
    function hipblasZher(handle,uplo,n,alpha,x,incx,A,lda) bind(c, name="hipblasZher")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZher
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCherBatched(handle,uplo,n,alpha,x,incx,A,lda,batchCount) bind(c, name="cublasCherBatched")
#else
    function hipblasCherBatched(handle,uplo,n,alpha,x,incx,A,lda,batchCount) bind(c, name="hipblasCherBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCherBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZherBatched(handle,uplo,n,alpha,x,incx,A,lda,batchCount) bind(c, name="cublasZherBatched")
#else
    function hipblasZherBatched(handle,uplo,n,alpha,x,incx,A,lda,batchCount) bind(c, name="hipblasZherBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZherBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCherStridedBatched(handle,uplo,n,alpha,x,incx,stridex,A,lda,strideA,batchCount) bind(c, name="cublasCherStridedBatched")
#else
    function hipblasCherStridedBatched(handle,uplo,n,alpha,x,incx,stridex,A,lda,strideA,batchCount) bind(c, name="hipblasCherStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCherStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZherStridedBatched(handle,uplo,n,alpha,x,incx,stridex,A,lda,strideA,batchCount) bind(c, name="cublasZherStridedBatched")
#else
    function hipblasZherStridedBatched(handle,uplo,n,alpha,x,incx,stridex,A,lda,strideA,batchCount) bind(c, name="hipblasZherStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZherStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCher2(handle,uplo,n,alpha,x,incx,y,incy,A,lda) bind(c, name="cublasCher2")
#else
    function hipblasCher2(handle,uplo,n,alpha,x,incx,y,incy,A,lda) bind(c, name="hipblasCher2")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCher2
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZher2(handle,uplo,n,alpha,x,incx,y,incy,A,lda) bind(c, name="cublasZher2")
#else
    function hipblasZher2(handle,uplo,n,alpha,x,incx,y,incy,A,lda) bind(c, name="hipblasZher2")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZher2
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCher2Batched(handle,uplo,n,alpha,x,incx,y,incy,A,lda,batchCount) bind(c, name="cublasCher2Batched")
#else
    function hipblasCher2Batched(handle,uplo,n,alpha,x,incx,y,incy,A,lda,batchCount) bind(c, name="hipblasCher2Batched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCher2Batched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZher2Batched(handle,uplo,n,alpha,x,incx,y,incy,A,lda,batchCount) bind(c, name="cublasZher2Batched")
#else
    function hipblasZher2Batched(handle,uplo,n,alpha,x,incx,y,incy,A,lda,batchCount) bind(c, name="hipblasZher2Batched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZher2Batched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCher2StridedBatched(handle,uplo,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batchCount) bind(c, name="cublasCher2StridedBatched")
#else
    function hipblasCher2StridedBatched(handle,uplo,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batchCount) bind(c, name="hipblasCher2StridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCher2StridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZher2StridedBatched(handle,uplo,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batchCount) bind(c, name="cublasZher2StridedBatched")
#else
    function hipblasZher2StridedBatched(handle,uplo,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batchCount) bind(c, name="hipblasZher2StridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZher2StridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasChpmv(handle,uplo,n,alpha,AP,x,incx,beta,y,incy) bind(c, name="cublasChpmv")
#else
    function hipblasChpmv(handle,uplo,n,alpha,AP,x,incx,beta,y,incy) bind(c, name="hipblasChpmv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasChpmv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: AP
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZhpmv(handle,uplo,n,alpha,AP,x,incx,beta,y,incy) bind(c, name="cublasZhpmv")
#else
    function hipblasZhpmv(handle,uplo,n,alpha,AP,x,incx,beta,y,incy) bind(c, name="hipblasZhpmv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZhpmv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: AP
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasChpmvBatched(handle,uplo,n,alpha,AP,x,incx,beta,y,incy,batchCount) bind(c, name="cublasChpmvBatched")
#else
    function hipblasChpmvBatched(handle,uplo,n,alpha,AP,x,incx,beta,y,incy,batchCount) bind(c, name="hipblasChpmvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasChpmvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr) :: AP
      type(c_ptr) :: x
      integer(c_int),value :: incx
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZhpmvBatched(handle,uplo,n,alpha,AP,x,incx,beta,y,incy,batchCount) bind(c, name="cublasZhpmvBatched")
#else
    function hipblasZhpmvBatched(handle,uplo,n,alpha,AP,x,incx,beta,y,incy,batchCount) bind(c, name="hipblasZhpmvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZhpmvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr) :: AP
      type(c_ptr) :: x
      integer(c_int),value :: incx
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasChpmvStridedBatched(handle,uplo,n,alpha,AP,strideAP,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="cublasChpmvStridedBatched")
#else
    function hipblasChpmvStridedBatched(handle,uplo,n,alpha,AP,strideAP,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="hipblasChpmvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasChpmvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: AP
      integer(c_int),value :: strideAP
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZhpmvStridedBatched(handle,uplo,n,alpha,AP,strideAP,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="cublasZhpmvStridedBatched")
#else
    function hipblasZhpmvStridedBatched(handle,uplo,n,alpha,AP,strideAP,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="hipblasZhpmvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZhpmvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: AP
      integer(c_int),value :: strideAP
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasChpr(handle,uplo,n,alpha,x,incx,AP) bind(c, name="cublasChpr")
#else
    function hipblasChpr(handle,uplo,n,alpha,x,incx,AP) bind(c, name="hipblasChpr")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasChpr
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: AP
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZhpr(handle,uplo,n,alpha,x,incx,AP) bind(c, name="cublasZhpr")
#else
    function hipblasZhpr(handle,uplo,n,alpha,x,incx,AP) bind(c, name="hipblasZhpr")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZhpr
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: AP
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasChprBatched(handle,uplo,n,alpha,x,incx,AP,batchCount) bind(c, name="cublasChprBatched")
#else
    function hipblasChprBatched(handle,uplo,n,alpha,x,incx,AP,batchCount) bind(c, name="hipblasChprBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasChprBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: AP
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZhprBatched(handle,uplo,n,alpha,x,incx,AP,batchCount) bind(c, name="cublasZhprBatched")
#else
    function hipblasZhprBatched(handle,uplo,n,alpha,x,incx,AP,batchCount) bind(c, name="hipblasZhprBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZhprBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: AP
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasChprStridedBatched(handle,uplo,n,alpha,x,incx,stridex,AP,strideAP,batchCount) bind(c, name="cublasChprStridedBatched")
#else
    function hipblasChprStridedBatched(handle,uplo,n,alpha,x,incx,stridex,AP,strideAP,batchCount) bind(c, name="hipblasChprStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasChprStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: AP
      integer(c_int),value :: strideAP
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZhprStridedBatched(handle,uplo,n,alpha,x,incx,stridex,AP,strideAP,batchCount) bind(c, name="cublasZhprStridedBatched")
#else
    function hipblasZhprStridedBatched(handle,uplo,n,alpha,x,incx,stridex,AP,strideAP,batchCount) bind(c, name="hipblasZhprStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZhprStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: AP
      integer(c_int),value :: strideAP
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasChpr2(handle,uplo,n,alpha,x,incx,y,incy,AP) bind(c, name="cublasChpr2")
#else
    function hipblasChpr2(handle,uplo,n,alpha,x,incx,y,incy,AP) bind(c, name="hipblasChpr2")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasChpr2
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: AP
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZhpr2(handle,uplo,n,alpha,x,incx,y,incy,AP) bind(c, name="cublasZhpr2")
#else
    function hipblasZhpr2(handle,uplo,n,alpha,x,incx,y,incy,AP) bind(c, name="hipblasZhpr2")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZhpr2
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: AP
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasChpr2Batched(handle,uplo,n,alpha,x,incx,y,incy,AP,batchCount) bind(c, name="cublasChpr2Batched")
#else
    function hipblasChpr2Batched(handle,uplo,n,alpha,x,incx,y,incy,AP,batchCount) bind(c, name="hipblasChpr2Batched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasChpr2Batched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr) :: AP
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZhpr2Batched(handle,uplo,n,alpha,x,incx,y,incy,AP,batchCount) bind(c, name="cublasZhpr2Batched")
#else
    function hipblasZhpr2Batched(handle,uplo,n,alpha,x,incx,y,incy,AP,batchCount) bind(c, name="hipblasZhpr2Batched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZhpr2Batched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr) :: AP
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasChpr2StridedBatched(handle,uplo,n,alpha,x,incx,stridex,y,incy,stridey,AP,strideAP,batchCount) bind(c, name="cublasChpr2StridedBatched")
#else
    function hipblasChpr2StridedBatched(handle,uplo,n,alpha,x,incx,stridex,y,incy,stridey,AP,strideAP,batchCount) bind(c, name="hipblasChpr2StridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasChpr2StridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      type(c_ptr),value :: AP
      integer(c_int),value :: strideAP
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZhpr2StridedBatched(handle,uplo,n,alpha,x,incx,stridex,y,incy,stridey,AP,strideAP,batchCount) bind(c, name="cublasZhpr2StridedBatched")
#else
    function hipblasZhpr2StridedBatched(handle,uplo,n,alpha,x,incx,stridex,y,incy,stridey,AP,strideAP,batchCount) bind(c, name="hipblasZhpr2StridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZhpr2StridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      type(c_ptr),value :: AP
      integer(c_int),value :: strideAP
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSsbmv(handle,uplo,n,k,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="cublasSsbmv")
#else
    function hipblasSsbmv(handle,uplo,n,k,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="hipblasSsbmv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSsbmv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      real(c_float),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDsbmv(handle,uplo,n,k,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="cublasDsbmv")
#else
    function hipblasDsbmv(handle,uplo,n,k,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="hipblasDsbmv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDsbmv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      real(c_double),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSsbmvBatched(handle,uplo,n,k,alpha,A,lda,x,incx,beta,y,incy,batchCount) bind(c, name="cublasSsbmvBatched")
#else
    function hipblasSsbmvBatched(handle,uplo,n,k,alpha,A,lda,x,incx,beta,y,incy,batchCount) bind(c, name="hipblasSsbmvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSsbmvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      real(c_float),intent(IN) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDsbmvBatched(handle,uplo,n,k,alpha,A,lda,x,incx,beta,y,incy,batchCount) bind(c, name="cublasDsbmvBatched")
#else
    function hipblasDsbmvBatched(handle,uplo,n,k,alpha,A,lda,x,incx,beta,y,incy,batchCount) bind(c, name="hipblasDsbmvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDsbmvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      real(c_double),intent(IN) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSsbmvStridedBatched(handle,uplo,n,k,alpha,A,lda,strideA,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="cublasSsbmvStridedBatched")
#else
    function hipblasSsbmvStridedBatched(handle,uplo,n,k,alpha,A,lda,strideA,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="hipblasSsbmvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSsbmvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      real(c_float),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDsbmvStridedBatched(handle,uplo,n,k,alpha,A,lda,strideA,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="cublasDsbmvStridedBatched")
#else
    function hipblasDsbmvStridedBatched(handle,uplo,n,k,alpha,A,lda,strideA,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="hipblasDsbmvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDsbmvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      real(c_double),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSspmv(handle,uplo,n,alpha,AP,x,incx,beta,y,incy) bind(c, name="cublasSspmv")
#else
    function hipblasSspmv(handle,uplo,n,alpha,AP,x,incx,beta,y,incy) bind(c, name="hipblasSspmv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSspmv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: AP
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      real(c_float),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDspmv(handle,uplo,n,alpha,AP,x,incx,beta,y,incy) bind(c, name="cublasDspmv")
#else
    function hipblasDspmv(handle,uplo,n,alpha,AP,x,incx,beta,y,incy) bind(c, name="hipblasDspmv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDspmv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: AP
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      real(c_double),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSspmvBatched(handle,uplo,n,alpha,AP,x,incx,beta,y,incy,batchCount) bind(c, name="cublasSspmvBatched")
#else
    function hipblasSspmvBatched(handle,uplo,n,alpha,AP,x,incx,beta,y,incy,batchCount) bind(c, name="hipblasSspmvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSspmvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr) :: AP
      type(c_ptr) :: x
      integer(c_int),value :: incx
      real(c_float),intent(IN) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDspmvBatched(handle,uplo,n,alpha,AP,x,incx,beta,y,incy,batchCount) bind(c, name="cublasDspmvBatched")
#else
    function hipblasDspmvBatched(handle,uplo,n,alpha,AP,x,incx,beta,y,incy,batchCount) bind(c, name="hipblasDspmvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDspmvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr) :: AP
      type(c_ptr) :: x
      integer(c_int),value :: incx
      real(c_double),intent(IN) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSspmvStridedBatched(handle,uplo,n,alpha,AP,strideAP,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="cublasSspmvStridedBatched")
#else
    function hipblasSspmvStridedBatched(handle,uplo,n,alpha,AP,strideAP,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="hipblasSspmvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSspmvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: AP
      integer(c_int),value :: strideAP
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      real(c_float),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDspmvStridedBatched(handle,uplo,n,alpha,AP,strideAP,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="cublasDspmvStridedBatched")
#else
    function hipblasDspmvStridedBatched(handle,uplo,n,alpha,AP,strideAP,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="hipblasDspmvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDspmvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: AP
      integer(c_int),value :: strideAP
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      real(c_double),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSspr(handle,uplo,n,alpha,x,incx,AP) bind(c, name="cublasSspr")
#else
    function hipblasSspr(handle,uplo,n,alpha,x,incx,AP) bind(c, name="hipblasSspr")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSspr
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: AP
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDspr(handle,uplo,n,alpha,x,incx,AP) bind(c, name="cublasDspr")
#else
    function hipblasDspr(handle,uplo,n,alpha,x,incx,AP) bind(c, name="hipblasDspr")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDspr
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: AP
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCspr(handle,uplo,n,alpha,x,incx,AP) bind(c, name="cublasCspr")
#else
    function hipblasCspr(handle,uplo,n,alpha,x,incx,AP) bind(c, name="hipblasCspr")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCspr
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: AP
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZspr(handle,uplo,n,alpha,x,incx,AP) bind(c, name="cublasZspr")
#else
    function hipblasZspr(handle,uplo,n,alpha,x,incx,AP) bind(c, name="hipblasZspr")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZspr
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: AP
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSsprBatched(handle,uplo,n,alpha,x,incx,AP,batchCount) bind(c, name="cublasSsprBatched")
#else
    function hipblasSsprBatched(handle,uplo,n,alpha,x,incx,AP,batchCount) bind(c, name="hipblasSsprBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSsprBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: AP
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDsprBatched(handle,uplo,n,alpha,x,incx,AP,batchCount) bind(c, name="cublasDsprBatched")
#else
    function hipblasDsprBatched(handle,uplo,n,alpha,x,incx,AP,batchCount) bind(c, name="hipblasDsprBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDsprBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: AP
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCsprBatched(handle,uplo,n,alpha,x,incx,AP,batchCount) bind(c, name="cublasCsprBatched")
#else
    function hipblasCsprBatched(handle,uplo,n,alpha,x,incx,AP,batchCount) bind(c, name="hipblasCsprBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCsprBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: AP
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZsprBatched(handle,uplo,n,alpha,x,incx,AP,batchCount) bind(c, name="cublasZsprBatched")
#else
    function hipblasZsprBatched(handle,uplo,n,alpha,x,incx,AP,batchCount) bind(c, name="hipblasZsprBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZsprBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: AP
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSsprStridedBatched(handle,uplo,n,alpha,x,incx,stridex,AP,strideAP,batchCount) bind(c, name="cublasSsprStridedBatched")
#else
    function hipblasSsprStridedBatched(handle,uplo,n,alpha,x,incx,stridex,AP,strideAP,batchCount) bind(c, name="hipblasSsprStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSsprStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: AP
      integer(c_int),value :: strideAP
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDsprStridedBatched(handle,uplo,n,alpha,x,incx,stridex,AP,strideAP,batchCount) bind(c, name="cublasDsprStridedBatched")
#else
    function hipblasDsprStridedBatched(handle,uplo,n,alpha,x,incx,stridex,AP,strideAP,batchCount) bind(c, name="hipblasDsprStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDsprStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: AP
      integer(c_int),value :: strideAP
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCsprStridedBatched(handle,uplo,n,alpha,x,incx,stridex,AP,strideAP,batchCount) bind(c, name="cublasCsprStridedBatched")
#else
    function hipblasCsprStridedBatched(handle,uplo,n,alpha,x,incx,stridex,AP,strideAP,batchCount) bind(c, name="hipblasCsprStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCsprStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: AP
      integer(c_int),value :: strideAP
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZsprStridedBatched(handle,uplo,n,alpha,x,incx,stridex,AP,strideAP,batchCount) bind(c, name="cublasZsprStridedBatched")
#else
    function hipblasZsprStridedBatched(handle,uplo,n,alpha,x,incx,stridex,AP,strideAP,batchCount) bind(c, name="hipblasZsprStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZsprStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: AP
      integer(c_int),value :: strideAP
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSspr2(handle,uplo,n,alpha,x,incx,y,incy,AP) bind(c, name="cublasSspr2")
#else
    function hipblasSspr2(handle,uplo,n,alpha,x,incx,y,incy,AP) bind(c, name="hipblasSspr2")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSspr2
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: AP
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDspr2(handle,uplo,n,alpha,x,incx,y,incy,AP) bind(c, name="cublasDspr2")
#else
    function hipblasDspr2(handle,uplo,n,alpha,x,incx,y,incy,AP) bind(c, name="hipblasDspr2")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDspr2
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: AP
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSspr2Batched(handle,uplo,n,alpha,x,incx,y,incy,AP,batchCount) bind(c, name="cublasSspr2Batched")
#else
    function hipblasSspr2Batched(handle,uplo,n,alpha,x,incx,y,incy,AP,batchCount) bind(c, name="hipblasSspr2Batched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSspr2Batched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr) :: AP
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDspr2Batched(handle,uplo,n,alpha,x,incx,y,incy,AP,batchCount) bind(c, name="cublasDspr2Batched")
#else
    function hipblasDspr2Batched(handle,uplo,n,alpha,x,incx,y,incy,AP,batchCount) bind(c, name="hipblasDspr2Batched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDspr2Batched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr) :: AP
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSspr2StridedBatched(handle,uplo,n,alpha,x,incx,stridex,y,incy,stridey,AP,strideAP,batchCount) bind(c, name="cublasSspr2StridedBatched")
#else
    function hipblasSspr2StridedBatched(handle,uplo,n,alpha,x,incx,stridex,y,incy,stridey,AP,strideAP,batchCount) bind(c, name="hipblasSspr2StridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSspr2StridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      type(c_ptr),value :: AP
      integer(c_int),value :: strideAP
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDspr2StridedBatched(handle,uplo,n,alpha,x,incx,stridex,y,incy,stridey,AP,strideAP,batchCount) bind(c, name="cublasDspr2StridedBatched")
#else
    function hipblasDspr2StridedBatched(handle,uplo,n,alpha,x,incx,stridex,y,incy,stridey,AP,strideAP,batchCount) bind(c, name="hipblasDspr2StridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDspr2StridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      type(c_ptr),value :: AP
      integer(c_int),value :: strideAP
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSsymv(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="cublasSsymv")
#else
    function hipblasSsymv(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="hipblasSsymv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSsymv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      real(c_float),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDsymv(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="cublasDsymv")
#else
    function hipblasDsymv(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="hipblasDsymv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDsymv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      real(c_double),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCsymv(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="cublasCsymv")
#else
    function hipblasCsymv(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="hipblasCsymv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCsymv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZsymv(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="cublasZsymv")
#else
    function hipblasZsymv(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="hipblasZsymv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZsymv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSsymvBatched(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy,batchCount) bind(c, name="cublasSsymvBatched")
#else
    function hipblasSsymvBatched(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy,batchCount) bind(c, name="hipblasSsymvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSsymvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      real(c_float),intent(IN) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDsymvBatched(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy,batchCount) bind(c, name="cublasDsymvBatched")
#else
    function hipblasDsymvBatched(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy,batchCount) bind(c, name="hipblasDsymvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDsymvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      real(c_double),intent(IN) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCsymvBatched(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy,batchCount) bind(c, name="cublasCsymvBatched")
#else
    function hipblasCsymvBatched(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy,batchCount) bind(c, name="hipblasCsymvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCsymvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZsymvBatched(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy,batchCount) bind(c, name="cublasZsymvBatched")
#else
    function hipblasZsymvBatched(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy,batchCount) bind(c, name="hipblasZsymvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZsymvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSsymvStridedBatched(handle,uplo,n,alpha,A,lda,stirdeA,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="cublasSsymvStridedBatched")
#else
    function hipblasSsymvStridedBatched(handle,uplo,n,alpha,A,lda,stirdeA,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="hipblasSsymvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSsymvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: stirdeA
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      real(c_float),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDsymvStridedBatched(handle,uplo,n,alpha,A,lda,stirdeA,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="cublasDsymvStridedBatched")
#else
    function hipblasDsymvStridedBatched(handle,uplo,n,alpha,A,lda,stirdeA,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="hipblasDsymvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDsymvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: stirdeA
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      real(c_double),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCsymvStridedBatched(handle,uplo,n,alpha,A,lda,stirdeA,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="cublasCsymvStridedBatched")
#else
    function hipblasCsymvStridedBatched(handle,uplo,n,alpha,A,lda,stirdeA,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="hipblasCsymvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCsymvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: stirdeA
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZsymvStridedBatched(handle,uplo,n,alpha,A,lda,stirdeA,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="cublasZsymvStridedBatched")
#else
    function hipblasZsymvStridedBatched(handle,uplo,n,alpha,A,lda,stirdeA,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="hipblasZsymvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZsymvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: stirdeA
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSsyr(handle,uplo,n,alpha,x,incx,A,lda) bind(c, name="cublasSsyr")
#else
    function hipblasSsyr(handle,uplo,n,alpha,x,incx,A,lda) bind(c, name="hipblasSsyr")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSsyr
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDsyr(handle,uplo,n,alpha,x,incx,A,lda) bind(c, name="cublasDsyr")
#else
    function hipblasDsyr(handle,uplo,n,alpha,x,incx,A,lda) bind(c, name="hipblasDsyr")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDsyr
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCsyr(handle,uplo,n,alpha,x,incx,A,lda) bind(c, name="cublasCsyr")
#else
    function hipblasCsyr(handle,uplo,n,alpha,x,incx,A,lda) bind(c, name="hipblasCsyr")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCsyr
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZsyr(handle,uplo,n,alpha,x,incx,A,lda) bind(c, name="cublasZsyr")
#else
    function hipblasZsyr(handle,uplo,n,alpha,x,incx,A,lda) bind(c, name="hipblasZsyr")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZsyr
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSsyrBatched(handle,uplo,n,alpha,x,incx,A,lda,batchCount) bind(c, name="cublasSsyrBatched")
#else
    function hipblasSsyrBatched(handle,uplo,n,alpha,x,incx,A,lda,batchCount) bind(c, name="hipblasSsyrBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSsyrBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDsyrBatched(handle,uplo,n,alpha,x,incx,A,lda,batchCount) bind(c, name="cublasDsyrBatched")
#else
    function hipblasDsyrBatched(handle,uplo,n,alpha,x,incx,A,lda,batchCount) bind(c, name="hipblasDsyrBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDsyrBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCsyrBatched(handle,uplo,n,alpha,x,incx,A,lda,batchCount) bind(c, name="cublasCsyrBatched")
#else
    function hipblasCsyrBatched(handle,uplo,n,alpha,x,incx,A,lda,batchCount) bind(c, name="hipblasCsyrBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCsyrBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZsyrBatched(handle,uplo,n,alpha,x,incx,A,lda,batchCount) bind(c, name="cublasZsyrBatched")
#else
    function hipblasZsyrBatched(handle,uplo,n,alpha,x,incx,A,lda,batchCount) bind(c, name="hipblasZsyrBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZsyrBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSsyrStridedBatched(handle,uplo,n,alpha,x,incx,stridex,A,lda,stridey,batchCount) bind(c, name="cublasSsyrStridedBatched")
#else
    function hipblasSsyrStridedBatched(handle,uplo,n,alpha,x,incx,stridex,A,lda,stridey,batchCount) bind(c, name="hipblasSsyrStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSsyrStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: stridey
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDsyrStridedBatched(handle,uplo,n,alpha,x,incx,stridex,A,lda,stridey,batchCount) bind(c, name="cublasDsyrStridedBatched")
#else
    function hipblasDsyrStridedBatched(handle,uplo,n,alpha,x,incx,stridex,A,lda,stridey,batchCount) bind(c, name="hipblasDsyrStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDsyrStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: stridey
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCsyrStridedBatched(handle,uplo,n,alpha,x,incx,stridex,A,lda,stridey,batchCount) bind(c, name="cublasCsyrStridedBatched")
#else
    function hipblasCsyrStridedBatched(handle,uplo,n,alpha,x,incx,stridex,A,lda,stridey,batchCount) bind(c, name="hipblasCsyrStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCsyrStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: stridey
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZsyrStridedBatched(handle,uplo,n,alpha,x,incx,stridex,A,lda,stridey,batchCount) bind(c, name="cublasZsyrStridedBatched")
#else
    function hipblasZsyrStridedBatched(handle,uplo,n,alpha,x,incx,stridex,A,lda,stridey,batchCount) bind(c, name="hipblasZsyrStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZsyrStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: stridey
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSsyr2(handle,uplo,n,alpha,x,incx,y,incy,A,lda) bind(c, name="cublasSsyr2")
#else
    function hipblasSsyr2(handle,uplo,n,alpha,x,incx,y,incy,A,lda) bind(c, name="hipblasSsyr2")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSsyr2
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDsyr2(handle,uplo,n,alpha,x,incx,y,incy,A,lda) bind(c, name="cublasDsyr2")
#else
    function hipblasDsyr2(handle,uplo,n,alpha,x,incx,y,incy,A,lda) bind(c, name="hipblasDsyr2")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDsyr2
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCsyr2(handle,uplo,n,alpha,x,incx,y,incy,A,lda) bind(c, name="cublasCsyr2")
#else
    function hipblasCsyr2(handle,uplo,n,alpha,x,incx,y,incy,A,lda) bind(c, name="hipblasCsyr2")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCsyr2
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZsyr2(handle,uplo,n,alpha,x,incx,y,incy,A,lda) bind(c, name="cublasZsyr2")
#else
    function hipblasZsyr2(handle,uplo,n,alpha,x,incx,y,incy,A,lda) bind(c, name="hipblasZsyr2")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZsyr2
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSsyr2Batched(handle,uplo,n,alpha,x,incx,y,incy,A,lda,batchCount) bind(c, name="cublasSsyr2Batched")
#else
    function hipblasSsyr2Batched(handle,uplo,n,alpha,x,incx,y,incy,A,lda,batchCount) bind(c, name="hipblasSsyr2Batched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSsyr2Batched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDsyr2Batched(handle,uplo,n,alpha,x,incx,y,incy,A,lda,batchCount) bind(c, name="cublasDsyr2Batched")
#else
    function hipblasDsyr2Batched(handle,uplo,n,alpha,x,incx,y,incy,A,lda,batchCount) bind(c, name="hipblasDsyr2Batched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDsyr2Batched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCsyr2Batched(handle,uplo,n,alpha,x,incx,y,incy,A,lda,batchCount) bind(c, name="cublasCsyr2Batched")
#else
    function hipblasCsyr2Batched(handle,uplo,n,alpha,x,incx,y,incy,A,lda,batchCount) bind(c, name="hipblasCsyr2Batched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCsyr2Batched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZsyr2Batched(handle,uplo,n,alpha,x,incx,y,incy,A,lda,batchCount) bind(c, name="cublasZsyr2Batched")
#else
    function hipblasZsyr2Batched(handle,uplo,n,alpha,x,incx,y,incy,A,lda,batchCount) bind(c, name="hipblasZsyr2Batched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZsyr2Batched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSsyr2StridedBatched(handle,uplo,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batchCount) bind(c, name="cublasSsyr2StridedBatched")
#else
    function hipblasSsyr2StridedBatched(handle,uplo,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batchCount) bind(c, name="hipblasSsyr2StridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSsyr2StridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDsyr2StridedBatched(handle,uplo,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batchCount) bind(c, name="cublasDsyr2StridedBatched")
#else
    function hipblasDsyr2StridedBatched(handle,uplo,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batchCount) bind(c, name="hipblasDsyr2StridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDsyr2StridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCsyr2StridedBatched(handle,uplo,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batchCount) bind(c, name="cublasCsyr2StridedBatched")
#else
    function hipblasCsyr2StridedBatched(handle,uplo,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batchCount) bind(c, name="hipblasCsyr2StridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCsyr2StridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZsyr2StridedBatched(handle,uplo,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batchCount) bind(c, name="cublasZsyr2StridedBatched")
#else
    function hipblasZsyr2StridedBatched(handle,uplo,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batchCount) bind(c, name="hipblasZsyr2StridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZsyr2StridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasStbmv(handle,uplo,transA,diag,m,k,A,lda,x,incx) bind(c, name="cublasStbmv")
#else
    function hipblasStbmv(handle,uplo,transA,diag,m,k,A,lda,x,incx) bind(c, name="hipblasStbmv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasStbmv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDtbmv(handle,uplo,transA,diag,m,k,A,lda,x,incx) bind(c, name="cublasDtbmv")
#else
    function hipblasDtbmv(handle,uplo,transA,diag,m,k,A,lda,x,incx) bind(c, name="hipblasDtbmv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDtbmv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCtbmv(handle,uplo,transA,diag,m,k,A,lda,x,incx) bind(c, name="cublasCtbmv")
#else
    function hipblasCtbmv(handle,uplo,transA,diag,m,k,A,lda,x,incx) bind(c, name="hipblasCtbmv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCtbmv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZtbmv(handle,uplo,transA,diag,m,k,A,lda,x,incx) bind(c, name="cublasZtbmv")
#else
    function hipblasZtbmv(handle,uplo,transA,diag,m,k,A,lda,x,incx) bind(c, name="hipblasZtbmv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZtbmv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasStbmvBatched(handle,uplo,transA,diag,m,k,A,lda,x,incx,batch_count) bind(c, name="cublasStbmvBatched")
#else
    function hipblasStbmvBatched(handle,uplo,transA,diag,m,k,A,lda,x,incx,batch_count) bind(c, name="hipblasStbmvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasStbmvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: k
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDtbmvBatched(handle,uplo,transA,diag,m,k,A,lda,x,incx,batch_count) bind(c, name="cublasDtbmvBatched")
#else
    function hipblasDtbmvBatched(handle,uplo,transA,diag,m,k,A,lda,x,incx,batch_count) bind(c, name="hipblasDtbmvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDtbmvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: k
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCtbmvBatched(handle,uplo,transA,diag,m,k,A,lda,x,incx,batch_count) bind(c, name="cublasCtbmvBatched")
#else
    function hipblasCtbmvBatched(handle,uplo,transA,diag,m,k,A,lda,x,incx,batch_count) bind(c, name="hipblasCtbmvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCtbmvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: k
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZtbmvBatched(handle,uplo,transA,diag,m,k,A,lda,x,incx,batch_count) bind(c, name="cublasZtbmvBatched")
#else
    function hipblasZtbmvBatched(handle,uplo,transA,diag,m,k,A,lda,x,incx,batch_count) bind(c, name="hipblasZtbmvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZtbmvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: k
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasStbmvStridedBatched(handle,uplo,transA,diag,m,k,A,lda,stride_a,x,incx,stride_x,batch_count) bind(c, name="cublasStbmvStridedBatched")
#else
    function hipblasStbmvStridedBatched(handle,uplo,transA,diag,m,k,A,lda,stride_a,x,incx,stride_x,batch_count) bind(c, name="hipblasStbmvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasStbmvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: stride_a
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stride_x
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDtbmvStridedBatched(handle,uplo,transA,diag,m,k,A,lda,stride_a,x,incx,stride_x,batch_count) bind(c, name="cublasDtbmvStridedBatched")
#else
    function hipblasDtbmvStridedBatched(handle,uplo,transA,diag,m,k,A,lda,stride_a,x,incx,stride_x,batch_count) bind(c, name="hipblasDtbmvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDtbmvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: stride_a
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stride_x
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCtbmvStridedBatched(handle,uplo,transA,diag,m,k,A,lda,stride_a,x,incx,stride_x,batch_count) bind(c, name="cublasCtbmvStridedBatched")
#else
    function hipblasCtbmvStridedBatched(handle,uplo,transA,diag,m,k,A,lda,stride_a,x,incx,stride_x,batch_count) bind(c, name="hipblasCtbmvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCtbmvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: stride_a
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stride_x
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZtbmvStridedBatched(handle,uplo,transA,diag,m,k,A,lda,stride_a,x,incx,stride_x,batch_count) bind(c, name="cublasZtbmvStridedBatched")
#else
    function hipblasZtbmvStridedBatched(handle,uplo,transA,diag,m,k,A,lda,stride_a,x,incx,stride_x,batch_count) bind(c, name="hipblasZtbmvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZtbmvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: stride_a
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stride_x
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasStpmv(handle,uplo,transA,diag,m,AP,x,incx) bind(c, name="cublasStpmv")
#else
    function hipblasStpmv(handle,uplo,transA,diag,m,AP,x,incx) bind(c, name="hipblasStpmv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasStpmv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: AP
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDtpmv(handle,uplo,transA,diag,m,AP,x,incx) bind(c, name="cublasDtpmv")
#else
    function hipblasDtpmv(handle,uplo,transA,diag,m,AP,x,incx) bind(c, name="hipblasDtpmv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDtpmv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: AP
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCtpmv(handle,uplo,transA,diag,m,AP,x,incx) bind(c, name="cublasCtpmv")
#else
    function hipblasCtpmv(handle,uplo,transA,diag,m,AP,x,incx) bind(c, name="hipblasCtpmv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCtpmv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: AP
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZtpmv(handle,uplo,transA,diag,m,AP,x,incx) bind(c, name="cublasZtpmv")
#else
    function hipblasZtpmv(handle,uplo,transA,diag,m,AP,x,incx) bind(c, name="hipblasZtpmv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZtpmv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: AP
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasStpmvBatched(handle,uplo,transA,diag,m,AP,x,incx,batchCount) bind(c, name="cublasStpmvBatched")
#else
    function hipblasStpmvBatched(handle,uplo,transA,diag,m,AP,x,incx,batchCount) bind(c, name="hipblasStpmvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasStpmvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr) :: AP
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDtpmvBatched(handle,uplo,transA,diag,m,AP,x,incx,batchCount) bind(c, name="cublasDtpmvBatched")
#else
    function hipblasDtpmvBatched(handle,uplo,transA,diag,m,AP,x,incx,batchCount) bind(c, name="hipblasDtpmvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDtpmvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr) :: AP
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCtpmvBatched(handle,uplo,transA,diag,m,AP,x,incx,batchCount) bind(c, name="cublasCtpmvBatched")
#else
    function hipblasCtpmvBatched(handle,uplo,transA,diag,m,AP,x,incx,batchCount) bind(c, name="hipblasCtpmvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCtpmvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr) :: AP
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZtpmvBatched(handle,uplo,transA,diag,m,AP,x,incx,batchCount) bind(c, name="cublasZtpmvBatched")
#else
    function hipblasZtpmvBatched(handle,uplo,transA,diag,m,AP,x,incx,batchCount) bind(c, name="hipblasZtpmvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZtpmvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr) :: AP
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasStpmvStridedBatched(handle,uplo,transA,diag,m,AP,strideAP,x,incx,stride,batchCount) bind(c, name="cublasStpmvStridedBatched")
#else
    function hipblasStpmvStridedBatched(handle,uplo,transA,diag,m,AP,strideAP,x,incx,stride,batchCount) bind(c, name="hipblasStpmvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasStpmvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: AP
      integer(c_int),value :: strideAP
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stride
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDtpmvStridedBatched(handle,uplo,transA,diag,m,AP,strideAP,x,incx,stride,batchCount) bind(c, name="cublasDtpmvStridedBatched")
#else
    function hipblasDtpmvStridedBatched(handle,uplo,transA,diag,m,AP,strideAP,x,incx,stride,batchCount) bind(c, name="hipblasDtpmvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDtpmvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: AP
      integer(c_int),value :: strideAP
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stride
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCtpmvStridedBatched(handle,uplo,transA,diag,m,AP,strideAP,x,incx,stride,batchCount) bind(c, name="cublasCtpmvStridedBatched")
#else
    function hipblasCtpmvStridedBatched(handle,uplo,transA,diag,m,AP,strideAP,x,incx,stride,batchCount) bind(c, name="hipblasCtpmvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCtpmvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: AP
      integer(c_int),value :: strideAP
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stride
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZtpmvStridedBatched(handle,uplo,transA,diag,m,AP,strideAP,x,incx,stride,batchCount) bind(c, name="cublasZtpmvStridedBatched")
#else
    function hipblasZtpmvStridedBatched(handle,uplo,transA,diag,m,AP,strideAP,x,incx,stride,batchCount) bind(c, name="hipblasZtpmvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZtpmvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: AP
      integer(c_int),value :: strideAP
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stride
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasStpsv(handle,uplo,transA,diag,m,AP,x,incx) bind(c, name="cublasStpsv")
#else
    function hipblasStpsv(handle,uplo,transA,diag,m,AP,x,incx) bind(c, name="hipblasStpsv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasStpsv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: AP
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDtpsv(handle,uplo,transA,diag,m,AP,x,incx) bind(c, name="cublasDtpsv")
#else
    function hipblasDtpsv(handle,uplo,transA,diag,m,AP,x,incx) bind(c, name="hipblasDtpsv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDtpsv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: AP
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCtpsv(handle,uplo,transA,diag,m,AP,x,incx) bind(c, name="cublasCtpsv")
#else
    function hipblasCtpsv(handle,uplo,transA,diag,m,AP,x,incx) bind(c, name="hipblasCtpsv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCtpsv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: AP
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZtpsv(handle,uplo,transA,diag,m,AP,x,incx) bind(c, name="cublasZtpsv")
#else
    function hipblasZtpsv(handle,uplo,transA,diag,m,AP,x,incx) bind(c, name="hipblasZtpsv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZtpsv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: AP
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasStpsvBatched(handle,uplo,transA,diag,m,AP,x,incx,batchCount) bind(c, name="cublasStpsvBatched")
#else
    function hipblasStpsvBatched(handle,uplo,transA,diag,m,AP,x,incx,batchCount) bind(c, name="hipblasStpsvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasStpsvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr) :: AP
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDtpsvBatched(handle,uplo,transA,diag,m,AP,x,incx,batchCount) bind(c, name="cublasDtpsvBatched")
#else
    function hipblasDtpsvBatched(handle,uplo,transA,diag,m,AP,x,incx,batchCount) bind(c, name="hipblasDtpsvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDtpsvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr) :: AP
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCtpsvBatched(handle,uplo,transA,diag,m,AP,x,incx,batchCount) bind(c, name="cublasCtpsvBatched")
#else
    function hipblasCtpsvBatched(handle,uplo,transA,diag,m,AP,x,incx,batchCount) bind(c, name="hipblasCtpsvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCtpsvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr) :: AP
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZtpsvBatched(handle,uplo,transA,diag,m,AP,x,incx,batchCount) bind(c, name="cublasZtpsvBatched")
#else
    function hipblasZtpsvBatched(handle,uplo,transA,diag,m,AP,x,incx,batchCount) bind(c, name="hipblasZtpsvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZtpsvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr) :: AP
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasStpsvStridedBatched(handle,uplo,transA,diag,m,AP,strideAP,x,incx,stridex,batchCount) bind(c, name="cublasStpsvStridedBatched")
#else
    function hipblasStpsvStridedBatched(handle,uplo,transA,diag,m,AP,strideAP,x,incx,stridex,batchCount) bind(c, name="hipblasStpsvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasStpsvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: AP
      integer(c_int),value :: strideAP
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDtpsvStridedBatched(handle,uplo,transA,diag,m,AP,strideAP,x,incx,stridex,batchCount) bind(c, name="cublasDtpsvStridedBatched")
#else
    function hipblasDtpsvStridedBatched(handle,uplo,transA,diag,m,AP,strideAP,x,incx,stridex,batchCount) bind(c, name="hipblasDtpsvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDtpsvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: AP
      integer(c_int),value :: strideAP
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCtpsvStridedBatched(handle,uplo,transA,diag,m,AP,strideAP,x,incx,stridex,batchCount) bind(c, name="cublasCtpsvStridedBatched")
#else
    function hipblasCtpsvStridedBatched(handle,uplo,transA,diag,m,AP,strideAP,x,incx,stridex,batchCount) bind(c, name="hipblasCtpsvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCtpsvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: AP
      integer(c_int),value :: strideAP
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZtpsvStridedBatched(handle,uplo,transA,diag,m,AP,strideAP,x,incx,stridex,batchCount) bind(c, name="cublasZtpsvStridedBatched")
#else
    function hipblasZtpsvStridedBatched(handle,uplo,transA,diag,m,AP,strideAP,x,incx,stridex,batchCount) bind(c, name="hipblasZtpsvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZtpsvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: AP
      integer(c_int),value :: strideAP
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasStrmv(handle,uplo,transA,diag,m,A,lda,x,incx) bind(c, name="cublasStrmv")
#else
    function hipblasStrmv(handle,uplo,transA,diag,m,A,lda,x,incx) bind(c, name="hipblasStrmv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasStrmv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDtrmv(handle,uplo,transA,diag,m,A,lda,x,incx) bind(c, name="cublasDtrmv")
#else
    function hipblasDtrmv(handle,uplo,transA,diag,m,A,lda,x,incx) bind(c, name="hipblasDtrmv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDtrmv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCtrmv(handle,uplo,transA,diag,m,A,lda,x,incx) bind(c, name="cublasCtrmv")
#else
    function hipblasCtrmv(handle,uplo,transA,diag,m,A,lda,x,incx) bind(c, name="hipblasCtrmv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCtrmv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZtrmv(handle,uplo,transA,diag,m,A,lda,x,incx) bind(c, name="cublasZtrmv")
#else
    function hipblasZtrmv(handle,uplo,transA,diag,m,A,lda,x,incx) bind(c, name="hipblasZtrmv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZtrmv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasStrmvBatched(handle,uplo,transA,diag,m,A,lda,x,incx,batch_count) bind(c, name="cublasStrmvBatched")
#else
    function hipblasStrmvBatched(handle,uplo,transA,diag,m,A,lda,x,incx,batch_count) bind(c, name="hipblasStrmvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasStrmvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDtrmvBatched(handle,uplo,transA,diag,m,A,lda,x,incx,batch_count) bind(c, name="cublasDtrmvBatched")
#else
    function hipblasDtrmvBatched(handle,uplo,transA,diag,m,A,lda,x,incx,batch_count) bind(c, name="hipblasDtrmvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDtrmvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCtrmvBatched(handle,uplo,transA,diag,m,A,lda,x,incx,batch_count) bind(c, name="cublasCtrmvBatched")
#else
    function hipblasCtrmvBatched(handle,uplo,transA,diag,m,A,lda,x,incx,batch_count) bind(c, name="hipblasCtrmvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCtrmvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZtrmvBatched(handle,uplo,transA,diag,m,A,lda,x,incx,batch_count) bind(c, name="cublasZtrmvBatched")
#else
    function hipblasZtrmvBatched(handle,uplo,transA,diag,m,A,lda,x,incx,batch_count) bind(c, name="hipblasZtrmvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZtrmvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasStrmvStridedBatched(handle,uplo,transA,diag,m,A,lda,stride_a,x,incx,stride_x,batch_count) bind(c, name="cublasStrmvStridedBatched")
#else
    function hipblasStrmvStridedBatched(handle,uplo,transA,diag,m,A,lda,stride_a,x,incx,stride_x,batch_count) bind(c, name="hipblasStrmvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasStrmvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: stride_a
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stride_x
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDtrmvStridedBatched(handle,uplo,transA,diag,m,A,lda,stride_a,x,incx,stride_x,batch_count) bind(c, name="cublasDtrmvStridedBatched")
#else
    function hipblasDtrmvStridedBatched(handle,uplo,transA,diag,m,A,lda,stride_a,x,incx,stride_x,batch_count) bind(c, name="hipblasDtrmvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDtrmvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: stride_a
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stride_x
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCtrmvStridedBatched(handle,uplo,transA,diag,m,A,lda,stride_a,x,incx,stride_x,batch_count) bind(c, name="cublasCtrmvStridedBatched")
#else
    function hipblasCtrmvStridedBatched(handle,uplo,transA,diag,m,A,lda,stride_a,x,incx,stride_x,batch_count) bind(c, name="hipblasCtrmvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCtrmvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: stride_a
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stride_x
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZtrmvStridedBatched(handle,uplo,transA,diag,m,A,lda,stride_a,x,incx,stride_x,batch_count) bind(c, name="cublasZtrmvStridedBatched")
#else
    function hipblasZtrmvStridedBatched(handle,uplo,transA,diag,m,A,lda,stride_a,x,incx,stride_x,batch_count) bind(c, name="hipblasZtrmvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZtrmvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: stride_a
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stride_x
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasStrsv(handle,uplo,transA,diag,m,A,lda,x,incx) bind(c, name="cublasStrsv")
#else
    function hipblasStrsv(handle,uplo,transA,diag,m,A,lda,x,incx) bind(c, name="hipblasStrsv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasStrsv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDtrsv(handle,uplo,transA,diag,m,A,lda,x,incx) bind(c, name="cublasDtrsv")
#else
    function hipblasDtrsv(handle,uplo,transA,diag,m,A,lda,x,incx) bind(c, name="hipblasDtrsv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDtrsv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCtrsv(handle,uplo,transA,diag,m,A,lda,x,incx) bind(c, name="cublasCtrsv")
#else
    function hipblasCtrsv(handle,uplo,transA,diag,m,A,lda,x,incx) bind(c, name="hipblasCtrsv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCtrsv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZtrsv(handle,uplo,transA,diag,m,A,lda,x,incx) bind(c, name="cublasZtrsv")
#else
    function hipblasZtrsv(handle,uplo,transA,diag,m,A,lda,x,incx) bind(c, name="hipblasZtrsv")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZtrsv
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasStrsvBatched(handle,uplo,transA,diag,m,A,lda,x,incx,batch_count) bind(c, name="cublasStrsvBatched")
#else
    function hipblasStrsvBatched(handle,uplo,transA,diag,m,A,lda,x,incx,batch_count) bind(c, name="hipblasStrsvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasStrsvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDtrsvBatched(handle,uplo,transA,diag,m,A,lda,x,incx,batch_count) bind(c, name="cublasDtrsvBatched")
#else
    function hipblasDtrsvBatched(handle,uplo,transA,diag,m,A,lda,x,incx,batch_count) bind(c, name="hipblasDtrsvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDtrsvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCtrsvBatched(handle,uplo,transA,diag,m,A,lda,x,incx,batch_count) bind(c, name="cublasCtrsvBatched")
#else
    function hipblasCtrsvBatched(handle,uplo,transA,diag,m,A,lda,x,incx,batch_count) bind(c, name="hipblasCtrsvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCtrsvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZtrsvBatched(handle,uplo,transA,diag,m,A,lda,x,incx,batch_count) bind(c, name="cublasZtrsvBatched")
#else
    function hipblasZtrsvBatched(handle,uplo,transA,diag,m,A,lda,x,incx,batch_count) bind(c, name="hipblasZtrsvBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZtrsvBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasStrsvStridedBatched(handle,uplo,transA,diag,m,A,lda,strideA,x,incx,stridex,batch_count) bind(c, name="cublasStrsvStridedBatched")
#else
    function hipblasStrsvStridedBatched(handle,uplo,transA,diag,m,A,lda,strideA,x,incx,stridex,batch_count) bind(c, name="hipblasStrsvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasStrsvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDtrsvStridedBatched(handle,uplo,transA,diag,m,A,lda,strideA,x,incx,stridex,batch_count) bind(c, name="cublasDtrsvStridedBatched")
#else
    function hipblasDtrsvStridedBatched(handle,uplo,transA,diag,m,A,lda,strideA,x,incx,stridex,batch_count) bind(c, name="hipblasDtrsvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDtrsvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCtrsvStridedBatched(handle,uplo,transA,diag,m,A,lda,strideA,x,incx,stridex,batch_count) bind(c, name="cublasCtrsvStridedBatched")
#else
    function hipblasCtrsvStridedBatched(handle,uplo,transA,diag,m,A,lda,strideA,x,incx,stridex,batch_count) bind(c, name="hipblasCtrsvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCtrsvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZtrsvStridedBatched(handle,uplo,transA,diag,m,A,lda,strideA,x,incx,stridex,batch_count) bind(c, name="cublasZtrsvStridedBatched")
#else
    function hipblasZtrsvStridedBatched(handle,uplo,transA,diag,m,A,lda,strideA,x,incx,stridex,batch_count) bind(c, name="hipblasZtrsvStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZtrsvStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCherk(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc) bind(c, name="cublasCherk")
#else
    function hipblasCherk(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc) bind(c, name="hipblasCherk")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCherk
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZherk(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc) bind(c, name="cublasZherk")
#else
    function hipblasZherk(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc) bind(c, name="hipblasZherk")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZherk
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCherkBatched(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc,batchCount) bind(c, name="cublasCherkBatched")
#else
    function hipblasCherkBatched(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc,batchCount) bind(c, name="hipblasCherkBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCherkBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      real(c_float),intent(IN) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZherkBatched(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc,batchCount) bind(c, name="cublasZherkBatched")
#else
    function hipblasZherkBatched(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc,batchCount) bind(c, name="hipblasZherkBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZherkBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      real(c_double),intent(IN) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCherkStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,beta,C,ldc,strideC,batchCount) bind(c, name="cublasCherkStridedBatched")
#else
    function hipblasCherkStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,beta,C,ldc,strideC,batchCount) bind(c, name="hipblasCherkStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCherkStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      real(c_float),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: strideC
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZherkStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,beta,C,ldc,strideC,batchCount) bind(c, name="cublasZherkStridedBatched")
#else
    function hipblasZherkStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,beta,C,ldc,strideC,batchCount) bind(c, name="hipblasZherkStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZherkStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      real(c_double),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: strideC
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCherkx(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="cublasCherkx")
#else
    function hipblasCherkx(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="hipblasCherkx")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCherkx
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_float),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZherkx(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="cublasZherkx")
#else
    function hipblasZherkx(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="hipblasZherkx")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZherkx
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_double),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCherkxBatched(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="cublasCherkxBatched")
#else
    function hipblasCherkxBatched(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="hipblasCherkxBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCherkxBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      real(c_float),intent(IN) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZherkxBatched(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="cublasZherkxBatched")
#else
    function hipblasZherkxBatched(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="hipblasZherkxBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZherkxBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      real(c_double),intent(IN) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCherkxStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,B,ldb,strideB,beta,C,ldc,strideC,batchCount) bind(c, name="cublasCherkxStridedBatched")
#else
    function hipblasCherkxStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,B,ldb,strideB,beta,C,ldc,strideC,batchCount) bind(c, name="hipblasCherkxStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCherkxStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int),value :: strideB
      real(c_float),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: strideC
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZherkxStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,B,ldb,strideB,beta,C,ldc,strideC,batchCount) bind(c, name="cublasZherkxStridedBatched")
#else
    function hipblasZherkxStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,B,ldb,strideB,beta,C,ldc,strideC,batchCount) bind(c, name="hipblasZherkxStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZherkxStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int),value :: strideB
      real(c_double),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: strideC
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCher2k(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="cublasCher2k")
#else
    function hipblasCher2k(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="hipblasCher2k")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCher2k
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_float),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZher2k(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="cublasZher2k")
#else
    function hipblasZher2k(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="hipblasZher2k")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZher2k
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_double),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCher2kBatched(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="cublasCher2kBatched")
#else
    function hipblasCher2kBatched(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="hipblasCher2kBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCher2kBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      real(c_float),intent(IN) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZher2kBatched(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="cublasZher2kBatched")
#else
    function hipblasZher2kBatched(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="hipblasZher2kBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZher2kBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      real(c_double),intent(IN) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCher2kStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,B,ldb,strideB,beta,C,ldc,strideC,batchCount) bind(c, name="cublasCher2kStridedBatched")
#else
    function hipblasCher2kStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,B,ldb,strideB,beta,C,ldc,strideC,batchCount) bind(c, name="hipblasCher2kStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCher2kStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int),value :: strideB
      real(c_float),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: strideC
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZher2kStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,B,ldb,strideB,beta,C,ldc,strideC,batchCount) bind(c, name="cublasZher2kStridedBatched")
#else
    function hipblasZher2kStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,B,ldb,strideB,beta,C,ldc,strideC,batchCount) bind(c, name="hipblasZher2kStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZher2kStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int),value :: strideB
      real(c_double),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: strideC
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSsyrk(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc) bind(c, name="cublasSsyrk")
#else
    function hipblasSsyrk(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc) bind(c, name="hipblasSsyrk")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSsyrk
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDsyrk(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc) bind(c, name="cublasDsyrk")
#else
    function hipblasDsyrk(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc) bind(c, name="hipblasDsyrk")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDsyrk
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCsyrk(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc) bind(c, name="cublasCsyrk")
#else
    function hipblasCsyrk(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc) bind(c, name="hipblasCsyrk")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCsyrk
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZsyrk(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc) bind(c, name="cublasZsyrk")
#else
    function hipblasZsyrk(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc) bind(c, name="hipblasZsyrk")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZsyrk
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSsyrkBatched(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc,batchCount) bind(c, name="cublasSsyrkBatched")
#else
    function hipblasSsyrkBatched(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc,batchCount) bind(c, name="hipblasSsyrkBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSsyrkBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      real(c_float),intent(IN) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDsyrkBatched(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc,batchCount) bind(c, name="cublasDsyrkBatched")
#else
    function hipblasDsyrkBatched(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc,batchCount) bind(c, name="hipblasDsyrkBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDsyrkBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      real(c_double),intent(IN) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCsyrkBatched(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc,batchCount) bind(c, name="cublasCsyrkBatched")
#else
    function hipblasCsyrkBatched(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc,batchCount) bind(c, name="hipblasCsyrkBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCsyrkBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZsyrkBatched(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc,batchCount) bind(c, name="cublasZsyrkBatched")
#else
    function hipblasZsyrkBatched(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc,batchCount) bind(c, name="hipblasZsyrkBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZsyrkBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSsyrkStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,beta,C,ldc,strideC,batchCount) bind(c, name="cublasSsyrkStridedBatched")
#else
    function hipblasSsyrkStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,beta,C,ldc,strideC,batchCount) bind(c, name="hipblasSsyrkStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSsyrkStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      real(c_float),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: strideC
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDsyrkStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,beta,C,ldc,strideC,batchCount) bind(c, name="cublasDsyrkStridedBatched")
#else
    function hipblasDsyrkStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,beta,C,ldc,strideC,batchCount) bind(c, name="hipblasDsyrkStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDsyrkStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      real(c_double),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: strideC
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCsyrkStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,beta,C,ldc,strideC,batchCount) bind(c, name="cublasCsyrkStridedBatched")
#else
    function hipblasCsyrkStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,beta,C,ldc,strideC,batchCount) bind(c, name="hipblasCsyrkStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCsyrkStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: strideC
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZsyrkStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,beta,C,ldc,strideC,batchCount) bind(c, name="cublasZsyrkStridedBatched")
#else
    function hipblasZsyrkStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,beta,C,ldc,strideC,batchCount) bind(c, name="hipblasZsyrkStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZsyrkStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: strideC
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSsyr2k(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="cublasSsyr2k")
#else
    function hipblasSsyr2k(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="hipblasSsyr2k")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSsyr2k
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_float),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDsyr2k(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="cublasDsyr2k")
#else
    function hipblasDsyr2k(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="hipblasDsyr2k")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDsyr2k
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_double),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCsyr2k(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="cublasCsyr2k")
#else
    function hipblasCsyr2k(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="hipblasCsyr2k")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCsyr2k
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZsyr2k(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="cublasZsyr2k")
#else
    function hipblasZsyr2k(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="hipblasZsyr2k")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZsyr2k
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSsyr2kBatched(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="cublasSsyr2kBatched")
#else
    function hipblasSsyr2kBatched(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="hipblasSsyr2kBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSsyr2kBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      real(c_float),intent(IN) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDsyr2kBatched(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="cublasDsyr2kBatched")
#else
    function hipblasDsyr2kBatched(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="hipblasDsyr2kBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDsyr2kBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      real(c_double),intent(IN) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCsyr2kBatched(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="cublasCsyr2kBatched")
#else
    function hipblasCsyr2kBatched(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="hipblasCsyr2kBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCsyr2kBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZsyr2kBatched(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="cublasZsyr2kBatched")
#else
    function hipblasZsyr2kBatched(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="hipblasZsyr2kBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZsyr2kBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSsyr2kStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,B,ldb,strideB,beta,C,ldc,strideC,batchCount) bind(c, name="cublasSsyr2kStridedBatched")
#else
    function hipblasSsyr2kStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,B,ldb,strideB,beta,C,ldc,strideC,batchCount) bind(c, name="hipblasSsyr2kStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSsyr2kStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int),value :: strideB
      real(c_float),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: strideC
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDsyr2kStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,B,ldb,strideB,beta,C,ldc,strideC,batchCount) bind(c, name="cublasDsyr2kStridedBatched")
#else
    function hipblasDsyr2kStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,B,ldb,strideB,beta,C,ldc,strideC,batchCount) bind(c, name="hipblasDsyr2kStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDsyr2kStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int),value :: strideB
      real(c_double),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: strideC
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCsyr2kStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,B,ldb,strideB,beta,C,ldc,strideC,batchCount) bind(c, name="cublasCsyr2kStridedBatched")
#else
    function hipblasCsyr2kStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,B,ldb,strideB,beta,C,ldc,strideC,batchCount) bind(c, name="hipblasCsyr2kStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCsyr2kStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int),value :: strideB
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: strideC
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZsyr2kStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,B,ldb,strideB,beta,C,ldc,strideC,batchCount) bind(c, name="cublasZsyr2kStridedBatched")
#else
    function hipblasZsyr2kStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,B,ldb,strideB,beta,C,ldc,strideC,batchCount) bind(c, name="hipblasZsyr2kStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZsyr2kStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int),value :: strideB
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: strideC
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSsyrkx(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="cublasSsyrkx")
#else
    function hipblasSsyrkx(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="hipblasSsyrkx")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSsyrkx
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_float),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDsyrkx(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="cublasDsyrkx")
#else
    function hipblasDsyrkx(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="hipblasDsyrkx")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDsyrkx
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_double),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCsyrkx(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="cublasCsyrkx")
#else
    function hipblasCsyrkx(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="hipblasCsyrkx")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCsyrkx
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZsyrkx(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="cublasZsyrkx")
#else
    function hipblasZsyrkx(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="hipblasZsyrkx")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZsyrkx
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSsyrkxBatched(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="cublasSsyrkxBatched")
#else
    function hipblasSsyrkxBatched(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="hipblasSsyrkxBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSsyrkxBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      real(c_float),intent(IN) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDsyrkxBatched(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="cublasDsyrkxBatched")
#else
    function hipblasDsyrkxBatched(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="hipblasDsyrkxBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDsyrkxBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      real(c_double),intent(IN) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCsyrkxBatched(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="cublasCsyrkxBatched")
#else
    function hipblasCsyrkxBatched(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="hipblasCsyrkxBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCsyrkxBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZsyrkxBatched(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="cublasZsyrkxBatched")
#else
    function hipblasZsyrkxBatched(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="hipblasZsyrkxBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZsyrkxBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSsyrkxStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,B,ldb,strideB,beta,C,ldc,stridec,batchCount) bind(c, name="cublasSsyrkxStridedBatched")
#else
    function hipblasSsyrkxStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,B,ldb,strideB,beta,C,ldc,stridec,batchCount) bind(c, name="hipblasSsyrkxStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSsyrkxStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int),value :: strideB
      real(c_float),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: stridec
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDsyrkxStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,B,ldb,strideB,beta,C,ldc,stridec,batchCount) bind(c, name="cublasDsyrkxStridedBatched")
#else
    function hipblasDsyrkxStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,B,ldb,strideB,beta,C,ldc,stridec,batchCount) bind(c, name="hipblasDsyrkxStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDsyrkxStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int),value :: strideB
      real(c_double),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: stridec
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCsyrkxStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,B,ldb,strideB,beta,C,ldc,stridec,batchCount) bind(c, name="cublasCsyrkxStridedBatched")
#else
    function hipblasCsyrkxStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,B,ldb,strideB,beta,C,ldc,stridec,batchCount) bind(c, name="hipblasCsyrkxStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCsyrkxStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int),value :: strideB
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: stridec
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZsyrkxStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,B,ldb,strideB,beta,C,ldc,stridec,batchCount) bind(c, name="cublasZsyrkxStridedBatched")
#else
    function hipblasZsyrkxStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,B,ldb,strideB,beta,C,ldc,stridec,batchCount) bind(c, name="hipblasZsyrkxStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZsyrkxStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int),value :: strideB
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: stridec
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasStrmm(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb) bind(c, name="cublasStrmm")
#else
    function hipblasStrmm(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb) bind(c, name="hipblasStrmm")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasStrmm
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_SIDE_LEFT)),value :: side
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDtrmm(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb) bind(c, name="cublasDtrmm")
#else
    function hipblasDtrmm(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb) bind(c, name="hipblasDtrmm")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDtrmm
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_SIDE_LEFT)),value :: side
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCtrmm(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb) bind(c, name="cublasCtrmm")
#else
    function hipblasCtrmm(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb) bind(c, name="hipblasCtrmm")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCtrmm
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_SIDE_LEFT)),value :: side
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZtrmm(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb) bind(c, name="cublasZtrmm")
#else
    function hipblasZtrmm(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb) bind(c, name="hipblasZtrmm")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZtrmm
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_SIDE_LEFT)),value :: side
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasStrmmBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb,batchCount) bind(c, name="cublasStrmmBatched")
#else
    function hipblasStrmmBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb,batchCount) bind(c, name="hipblasStrmmBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasStrmmBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_SIDE_LEFT)),value :: side
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDtrmmBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb,batchCount) bind(c, name="cublasDtrmmBatched")
#else
    function hipblasDtrmmBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb,batchCount) bind(c, name="hipblasDtrmmBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDtrmmBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_SIDE_LEFT)),value :: side
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCtrmmBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb,batchCount) bind(c, name="cublasCtrmmBatched")
#else
    function hipblasCtrmmBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb,batchCount) bind(c, name="hipblasCtrmmBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCtrmmBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_SIDE_LEFT)),value :: side
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZtrmmBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb,batchCount) bind(c, name="cublasZtrmmBatched")
#else
    function hipblasZtrmmBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb,batchCount) bind(c, name="hipblasZtrmmBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZtrmmBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_SIDE_LEFT)),value :: side
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasStrmmStridedBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,strideA,B,ldb,strideB,batchCount) bind(c, name="cublasStrmmStridedBatched")
#else
    function hipblasStrmmStridedBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,strideA,B,ldb,strideB,batchCount) bind(c, name="hipblasStrmmStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasStrmmStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_SIDE_LEFT)),value :: side
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int),value :: strideB
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDtrmmStridedBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,strideA,B,ldb,strideB,batchCount) bind(c, name="cublasDtrmmStridedBatched")
#else
    function hipblasDtrmmStridedBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,strideA,B,ldb,strideB,batchCount) bind(c, name="hipblasDtrmmStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDtrmmStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_SIDE_LEFT)),value :: side
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int),value :: strideB
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCtrmmStridedBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,strideA,B,ldb,strideB,batchCount) bind(c, name="cublasCtrmmStridedBatched")
#else
    function hipblasCtrmmStridedBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,strideA,B,ldb,strideB,batchCount) bind(c, name="hipblasCtrmmStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCtrmmStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_SIDE_LEFT)),value :: side
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int),value :: strideB
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZtrmmStridedBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,strideA,B,ldb,strideB,batchCount) bind(c, name="cublasZtrmmStridedBatched")
#else
    function hipblasZtrmmStridedBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,strideA,B,ldb,strideB,batchCount) bind(c, name="hipblasZtrmmStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZtrmmStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_SIDE_LEFT)),value :: side
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int),value :: strideB
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasStrsm(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb) bind(c, name="cublasStrsm")
#else
    function hipblasStrsm(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb) bind(c, name="hipblasStrsm")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasStrsm
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_SIDE_LEFT)),value :: side
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDtrsm(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb) bind(c, name="cublasDtrsm")
#else
    function hipblasDtrsm(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb) bind(c, name="hipblasDtrsm")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDtrsm
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_SIDE_LEFT)),value :: side
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCtrsm(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb) bind(c, name="cublasCtrsm")
#else
    function hipblasCtrsm(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb) bind(c, name="hipblasCtrsm")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCtrsm
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_SIDE_LEFT)),value :: side
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZtrsm(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb) bind(c, name="cublasZtrsm")
#else
    function hipblasZtrsm(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb) bind(c, name="hipblasZtrsm")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZtrsm
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_SIDE_LEFT)),value :: side
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasStrsmBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb,batch_count) bind(c, name="cublasStrsmBatched")
#else
    function hipblasStrsmBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb,batch_count) bind(c, name="hipblasStrsmBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasStrsmBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_SIDE_LEFT)),value :: side
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDtrsmBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb,batch_count) bind(c, name="cublasDtrsmBatched")
#else
    function hipblasDtrsmBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb,batch_count) bind(c, name="hipblasDtrsmBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDtrsmBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_SIDE_LEFT)),value :: side
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCtrsmBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb,batch_count) bind(c, name="cublasCtrsmBatched")
#else
    function hipblasCtrsmBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb,batch_count) bind(c, name="hipblasCtrsmBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCtrsmBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_SIDE_LEFT)),value :: side
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZtrsmBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb,batch_count) bind(c, name="cublasZtrsmBatched")
#else
    function hipblasZtrsmBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb,batch_count) bind(c, name="hipblasZtrsmBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZtrsmBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_SIDE_LEFT)),value :: side
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasStrsmStridedBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,strideA,B,ldb,strideB,batch_count) bind(c, name="cublasStrsmStridedBatched")
#else
    function hipblasStrsmStridedBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,strideA,B,ldb,strideB,batch_count) bind(c, name="hipblasStrsmStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasStrsmStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_SIDE_LEFT)),value :: side
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int),value :: strideB
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDtrsmStridedBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,strideA,B,ldb,strideB,batch_count) bind(c, name="cublasDtrsmStridedBatched")
#else
    function hipblasDtrsmStridedBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,strideA,B,ldb,strideB,batch_count) bind(c, name="hipblasDtrsmStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDtrsmStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_SIDE_LEFT)),value :: side
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int),value :: strideB
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCtrsmStridedBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,strideA,B,ldb,strideB,batch_count) bind(c, name="cublasCtrsmStridedBatched")
#else
    function hipblasCtrsmStridedBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,strideA,B,ldb,strideB,batch_count) bind(c, name="hipblasCtrsmStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCtrsmStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_SIDE_LEFT)),value :: side
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int),value :: strideB
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZtrsmStridedBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,strideA,B,ldb,strideB,batch_count) bind(c, name="cublasZtrsmStridedBatched")
#else
    function hipblasZtrsmStridedBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,strideA,B,ldb,strideB,batch_count) bind(c, name="hipblasZtrsmStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZtrsmStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_SIDE_LEFT)),value :: side
      integer(kind(HIPBLAS_FILL_MODE_UPPER)),value :: uplo
      integer(kind(HIPBLAS_OP_N)),value :: transA
      integer(kind(HIPBLAS_DIAG_NON_UNIT)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int),value :: strideB
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSgetrf(handle,n,A,lda,ipiv,myInfo) bind(c, name="cublasSgetrf")
#else
    function hipblasSgetrf(handle,n,A,lda,ipiv,myInfo) bind(c, name="hipblasSgetrf")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSgetrf
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: myInfo
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDgetrf(handle,n,A,lda,ipiv,myInfo) bind(c, name="cublasDgetrf")
#else
    function hipblasDgetrf(handle,n,A,lda,ipiv,myInfo) bind(c, name="hipblasDgetrf")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDgetrf
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: myInfo
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCgetrf(handle,n,A,lda,ipiv,myInfo) bind(c, name="cublasCgetrf")
#else
    function hipblasCgetrf(handle,n,A,lda,ipiv,myInfo) bind(c, name="hipblasCgetrf")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCgetrf
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: myInfo
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZgetrf(handle,n,A,lda,ipiv,myInfo) bind(c, name="cublasZgetrf")
#else
    function hipblasZgetrf(handle,n,A,lda,ipiv,myInfo) bind(c, name="hipblasZgetrf")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZgetrf
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: myInfo
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSgetrfBatched(handle,n,A,lda,ipiv,myInfo,batch_count) bind(c, name="cublasSgetrfBatched")
#else
    function hipblasSgetrfBatched(handle,n,A,lda,ipiv,myInfo,batch_count) bind(c, name="hipblasSgetrfBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSgetrfBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: myInfo
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDgetrfBatched(handle,n,A,lda,ipiv,myInfo,batch_count) bind(c, name="cublasDgetrfBatched")
#else
    function hipblasDgetrfBatched(handle,n,A,lda,ipiv,myInfo,batch_count) bind(c, name="hipblasDgetrfBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDgetrfBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: myInfo
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCgetrfBatched(handle,n,A,lda,ipiv,myInfo,batch_count) bind(c, name="cublasCgetrfBatched")
#else
    function hipblasCgetrfBatched(handle,n,A,lda,ipiv,myInfo,batch_count) bind(c, name="hipblasCgetrfBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCgetrfBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: myInfo
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZgetrfBatched(handle,n,A,lda,ipiv,myInfo,batch_count) bind(c, name="cublasZgetrfBatched")
#else
    function hipblasZgetrfBatched(handle,n,A,lda,ipiv,myInfo,batch_count) bind(c, name="hipblasZgetrfBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZgetrfBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: myInfo
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSgetrfStridedBatched(handle,n,A,lda,strideA,ipiv,strideP,myInfo,batch_count) bind(c, name="cublasSgetrfStridedBatched")
#else
    function hipblasSgetrfStridedBatched(handle,n,A,lda,strideA,ipiv,strideP,myInfo,batch_count) bind(c, name="hipblasSgetrfStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSgetrfStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: ipiv
      integer(c_int),value :: strideP
      type(c_ptr),value :: myInfo
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDgetrfStridedBatched(handle,n,A,lda,strideA,ipiv,strideP,myInfo,batch_count) bind(c, name="cublasDgetrfStridedBatched")
#else
    function hipblasDgetrfStridedBatched(handle,n,A,lda,strideA,ipiv,strideP,myInfo,batch_count) bind(c, name="hipblasDgetrfStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDgetrfStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: ipiv
      integer(c_int),value :: strideP
      type(c_ptr),value :: myInfo
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCgetrfStridedBatched(handle,n,A,lda,strideA,ipiv,strideP,myInfo,batch_count) bind(c, name="cublasCgetrfStridedBatched")
#else
    function hipblasCgetrfStridedBatched(handle,n,A,lda,strideA,ipiv,strideP,myInfo,batch_count) bind(c, name="hipblasCgetrfStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCgetrfStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: ipiv
      integer(c_int),value :: strideP
      type(c_ptr),value :: myInfo
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZgetrfStridedBatched(handle,n,A,lda,strideA,ipiv,strideP,myInfo,batch_count) bind(c, name="cublasZgetrfStridedBatched")
#else
    function hipblasZgetrfStridedBatched(handle,n,A,lda,strideA,ipiv,strideP,myInfo,batch_count) bind(c, name="hipblasZgetrfStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZgetrfStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: ipiv
      integer(c_int),value :: strideP
      type(c_ptr),value :: myInfo
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSgetrs(handle,trans,n,nrhs,A,lda,ipiv,B,ldb,myInfo) bind(c, name="cublasSgetrs")
#else
    function hipblasSgetrs(handle,trans,n,nrhs,A,lda,ipiv,B,ldb,myInfo) bind(c, name="hipblasSgetrs")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSgetrs
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDgetrs(handle,trans,n,nrhs,A,lda,ipiv,B,ldb,myInfo) bind(c, name="cublasDgetrs")
#else
    function hipblasDgetrs(handle,trans,n,nrhs,A,lda,ipiv,B,ldb,myInfo) bind(c, name="hipblasDgetrs")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDgetrs
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCgetrs(handle,trans,n,nrhs,A,lda,ipiv,B,ldb,myInfo) bind(c, name="cublasCgetrs")
#else
    function hipblasCgetrs(handle,trans,n,nrhs,A,lda,ipiv,B,ldb,myInfo) bind(c, name="hipblasCgetrs")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCgetrs
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZgetrs(handle,trans,n,nrhs,A,lda,ipiv,B,ldb,myInfo) bind(c, name="cublasZgetrs")
#else
    function hipblasZgetrs(handle,trans,n,nrhs,A,lda,ipiv,B,ldb,myInfo) bind(c, name="hipblasZgetrs")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZgetrs
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSgetrsBatched(handle,trans,n,nrhs,A,lda,ipiv,B,ldb,myInfo,batch_count) bind(c, name="cublasSgetrsBatched")
#else
    function hipblasSgetrsBatched(handle,trans,n,nrhs,A,lda,ipiv,B,ldb,myInfo,batch_count) bind(c, name="hipblasSgetrsBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSgetrsBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDgetrsBatched(handle,trans,n,nrhs,A,lda,ipiv,B,ldb,myInfo,batch_count) bind(c, name="cublasDgetrsBatched")
#else
    function hipblasDgetrsBatched(handle,trans,n,nrhs,A,lda,ipiv,B,ldb,myInfo,batch_count) bind(c, name="hipblasDgetrsBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDgetrsBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCgetrsBatched(handle,trans,n,nrhs,A,lda,ipiv,B,ldb,myInfo,batch_count) bind(c, name="cublasCgetrsBatched")
#else
    function hipblasCgetrsBatched(handle,trans,n,nrhs,A,lda,ipiv,B,ldb,myInfo,batch_count) bind(c, name="hipblasCgetrsBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCgetrsBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZgetrsBatched(handle,trans,n,nrhs,A,lda,ipiv,B,ldb,myInfo,batch_count) bind(c, name="cublasZgetrsBatched")
#else
    function hipblasZgetrsBatched(handle,trans,n,nrhs,A,lda,ipiv,B,ldb,myInfo,batch_count) bind(c, name="hipblasZgetrsBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZgetrsBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: myInfo
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSgetrsStridedBatched(handle,trans,n,nrhs,A,lda,strideA,ipiv,strideP,B,ldb,strideB,myInfo,batch_count) bind(c, name="cublasSgetrsStridedBatched")
#else
    function hipblasSgetrsStridedBatched(handle,trans,n,nrhs,A,lda,strideA,ipiv,strideP,B,ldb,strideB,myInfo,batch_count) bind(c, name="hipblasSgetrsStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSgetrsStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: ipiv
      integer(c_int),value :: strideP
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int),value :: strideB
      type(c_ptr),value :: myInfo
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDgetrsStridedBatched(handle,trans,n,nrhs,A,lda,strideA,ipiv,strideP,B,ldb,strideB,myInfo,batch_count) bind(c, name="cublasDgetrsStridedBatched")
#else
    function hipblasDgetrsStridedBatched(handle,trans,n,nrhs,A,lda,strideA,ipiv,strideP,B,ldb,strideB,myInfo,batch_count) bind(c, name="hipblasDgetrsStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDgetrsStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: ipiv
      integer(c_int),value :: strideP
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int),value :: strideB
      type(c_ptr),value :: myInfo
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCgetrsStridedBatched(handle,trans,n,nrhs,A,lda,strideA,ipiv,strideP,B,ldb,strideB,myInfo,batch_count) bind(c, name="cublasCgetrsStridedBatched")
#else
    function hipblasCgetrsStridedBatched(handle,trans,n,nrhs,A,lda,strideA,ipiv,strideP,B,ldb,strideB,myInfo,batch_count) bind(c, name="hipblasCgetrsStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCgetrsStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: ipiv
      integer(c_int),value :: strideP
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int),value :: strideB
      type(c_ptr),value :: myInfo
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZgetrsStridedBatched(handle,trans,n,nrhs,A,lda,strideA,ipiv,strideP,B,ldb,strideB,myInfo,batch_count) bind(c, name="cublasZgetrsStridedBatched")
#else
    function hipblasZgetrsStridedBatched(handle,trans,n,nrhs,A,lda,strideA,ipiv,strideP,B,ldb,strideB,myInfo,batch_count) bind(c, name="hipblasZgetrsStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZgetrsStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: ipiv
      integer(c_int),value :: strideP
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int),value :: strideB
      type(c_ptr),value :: myInfo
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSgeqrf(handle,m,n,A,lda,ipiv,myInfo) bind(c, name="cublasSgeqrf")
#else
    function hipblasSgeqrf(handle,m,n,A,lda,ipiv,myInfo) bind(c, name="hipblasSgeqrf")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSgeqrf
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: myInfo
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDgeqrf(handle,m,n,A,lda,ipiv,myInfo) bind(c, name="cublasDgeqrf")
#else
    function hipblasDgeqrf(handle,m,n,A,lda,ipiv,myInfo) bind(c, name="hipblasDgeqrf")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDgeqrf
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: myInfo
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCgeqrf(handle,m,n,A,lda,ipiv,myInfo) bind(c, name="cublasCgeqrf")
#else
    function hipblasCgeqrf(handle,m,n,A,lda,ipiv,myInfo) bind(c, name="hipblasCgeqrf")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCgeqrf
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: myInfo
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZgeqrf(handle,m,n,A,lda,ipiv,myInfo) bind(c, name="cublasZgeqrf")
#else
    function hipblasZgeqrf(handle,m,n,A,lda,ipiv,myInfo) bind(c, name="hipblasZgeqrf")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZgeqrf
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: myInfo
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSgeqrfBatched(handle,m,n,A,lda,ipiv,myInfo,batch_count) bind(c, name="cublasSgeqrfBatched")
#else
    function hipblasSgeqrfBatched(handle,m,n,A,lda,ipiv,myInfo,batch_count) bind(c, name="hipblasSgeqrfBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSgeqrfBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: ipiv
      type(c_ptr),value :: myInfo
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDgeqrfBatched(handle,m,n,A,lda,ipiv,myInfo,batch_count) bind(c, name="cublasDgeqrfBatched")
#else
    function hipblasDgeqrfBatched(handle,m,n,A,lda,ipiv,myInfo,batch_count) bind(c, name="hipblasDgeqrfBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDgeqrfBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: ipiv
      type(c_ptr),value :: myInfo
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCgeqrfBatched(handle,m,n,A,lda,ipiv,myInfo,batch_count) bind(c, name="cublasCgeqrfBatched")
#else
    function hipblasCgeqrfBatched(handle,m,n,A,lda,ipiv,myInfo,batch_count) bind(c, name="hipblasCgeqrfBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCgeqrfBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: ipiv
      type(c_ptr),value :: myInfo
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZgeqrfBatched(handle,m,n,A,lda,ipiv,myInfo,batch_count) bind(c, name="cublasZgeqrfBatched")
#else
    function hipblasZgeqrfBatched(handle,m,n,A,lda,ipiv,myInfo,batch_count) bind(c, name="hipblasZgeqrfBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZgeqrfBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: ipiv
      type(c_ptr),value :: myInfo
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSgeqrfStridedBatched(handle,m,n,A,lda,strideA,ipiv,strideP,myInfo,batch_count) bind(c, name="cublasSgeqrfStridedBatched")
#else
    function hipblasSgeqrfStridedBatched(handle,m,n,A,lda,strideA,ipiv,strideP,myInfo,batch_count) bind(c, name="hipblasSgeqrfStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSgeqrfStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: ipiv
      integer(c_int),value :: strideP
      type(c_ptr),value :: myInfo
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDgeqrfStridedBatched(handle,m,n,A,lda,strideA,ipiv,strideP,myInfo,batch_count) bind(c, name="cublasDgeqrfStridedBatched")
#else
    function hipblasDgeqrfStridedBatched(handle,m,n,A,lda,strideA,ipiv,strideP,myInfo,batch_count) bind(c, name="hipblasDgeqrfStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDgeqrfStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: ipiv
      integer(c_int),value :: strideP
      type(c_ptr),value :: myInfo
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCgeqrfStridedBatched(handle,m,n,A,lda,strideA,ipiv,strideP,myInfo,batch_count) bind(c, name="cublasCgeqrfStridedBatched")
#else
    function hipblasCgeqrfStridedBatched(handle,m,n,A,lda,strideA,ipiv,strideP,myInfo,batch_count) bind(c, name="hipblasCgeqrfStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCgeqrfStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: ipiv
      integer(c_int),value :: strideP
      type(c_ptr),value :: myInfo
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZgeqrfStridedBatched(handle,m,n,A,lda,strideA,ipiv,strideP,myInfo,batch_count) bind(c, name="cublasZgeqrfStridedBatched")
#else
    function hipblasZgeqrfStridedBatched(handle,m,n,A,lda,strideA,ipiv,strideP,myInfo,batch_count) bind(c, name="hipblasZgeqrfStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZgeqrfStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: strideA
      type(c_ptr),value :: ipiv
      integer(c_int),value :: strideP
      type(c_ptr),value :: myInfo
      integer(c_int),value :: batch_count
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSgemm(handle,transa,transb,m,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="cublasSgemm")
#else
    function hipblasSgemm(handle,transa,transb,m,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="hipblasSgemm")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSgemm
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: transa
      integer(kind(HIPBLAS_OP_N)),value :: transb
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_float),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDgemm(handle,transa,transb,m,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="cublasDgemm")
#else
    function hipblasDgemm(handle,transa,transb,m,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="hipblasDgemm")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDgemm
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: transa
      integer(kind(HIPBLAS_OP_N)),value :: transb
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_double),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCgemm(handle,transa,transb,m,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="cublasCgemm")
#else
    function hipblasCgemm(handle,transa,transb,m,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="hipblasCgemm")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCgemm
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: transa
      integer(kind(HIPBLAS_OP_N)),value :: transb
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZgemm(handle,transa,transb,m,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="cublasZgemm")
#else
    function hipblasZgemm(handle,transa,transb,m,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="hipblasZgemm")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZgemm
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: transa
      integer(kind(HIPBLAS_OP_N)),value :: transb
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSgemmBatched(handle,transa,transb,m,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="cublasSgemmBatched")
#else
    function hipblasSgemmBatched(handle,transa,transb,m,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="hipblasSgemmBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSgemmBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: transa
      integer(kind(HIPBLAS_OP_N)),value :: transb
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      real(c_float),intent(IN) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDgemmBatched(handle,transa,transb,m,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="cublasDgemmBatched")
#else
    function hipblasDgemmBatched(handle,transa,transb,m,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="hipblasDgemmBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDgemmBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: transa
      integer(kind(HIPBLAS_OP_N)),value :: transb
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      real(c_double),intent(IN) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCgemmBatched(handle,transa,transb,m,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="cublasCgemmBatched")
#else
    function hipblasCgemmBatched(handle,transa,transb,m,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="hipblasCgemmBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCgemmBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: transa
      integer(kind(HIPBLAS_OP_N)),value :: transb
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZgemmBatched(handle,transa,transb,m,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="cublasZgemmBatched")
#else
    function hipblasZgemmBatched(handle,transa,transb,m,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="hipblasZgemmBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZgemmBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: transa
      integer(kind(HIPBLAS_OP_N)),value :: transb
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasSgemmStridedBatched(handle,transa,transb,m,n,k,alpha,A,lda,bsa,B,ldb,bsb,beta,C,ldc,bsc,batchCount) bind(c, name="cublasSgemmStridedBatched")
#else
    function hipblasSgemmStridedBatched(handle,transa,transb,m,n,k,alpha,A,lda,bsa,B,ldb,bsb,beta,C,ldc,bsc,batchCount) bind(c, name="hipblasSgemmStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSgemmStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: transa
      integer(kind(HIPBLAS_OP_N)),value :: transb
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_long_long),value :: bsa
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_long_long),value :: bsb
      real(c_float),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_long_long),value :: bsc
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasDgemmStridedBatched(handle,transa,transb,m,n,k,alpha,A,lda,bsa,B,ldb,bsb,beta,C,ldc,bsc,batchCount) bind(c, name="cublasDgemmStridedBatched")
#else
    function hipblasDgemmStridedBatched(handle,transa,transb,m,n,k,alpha,A,lda,bsa,B,ldb,bsb,beta,C,ldc,bsc,batchCount) bind(c, name="hipblasDgemmStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDgemmStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: transa
      integer(kind(HIPBLAS_OP_N)),value :: transb
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_long_long),value :: bsa
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_long_long),value :: bsb
      real(c_double),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_long_long),value :: bsc
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasCgemmStridedBatched(handle,transa,transb,m,n,k,alpha,A,lda,bsa,B,ldb,bsb,beta,C,ldc,bsc,batchCount) bind(c, name="cublasCgemmStridedBatched")
#else
    function hipblasCgemmStridedBatched(handle,transa,transb,m,n,k,alpha,A,lda,bsa,B,ldb,bsb,beta,C,ldc,bsc,batchCount) bind(c, name="hipblasCgemmStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCgemmStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: transa
      integer(kind(HIPBLAS_OP_N)),value :: transb
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_long_long),value :: bsa
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_long_long),value :: bsb
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_long_long),value :: bsc
      integer(c_int),value :: batchCount
    end function

  
#ifdef USE_CUDA_NAMES
    function hipblasZgemmStridedBatched(handle,transa,transb,m,n,k,alpha,A,lda,bsa,B,ldb,bsb,beta,C,ldc,bsc,batchCount) bind(c, name="cublasZgemmStridedBatched")
#else
    function hipblasZgemmStridedBatched(handle,transa,transb,m,n,k,alpha,A,lda,bsa,B,ldb,bsb,beta,C,ldc,bsc,batchCount) bind(c, name="hipblasZgemmStridedBatched")
#endif
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZgemmStridedBatched
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_OP_N)),value :: transa
      integer(kind(HIPBLAS_OP_N)),value :: transb
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_long_long),value :: bsa
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_long_long),value :: bsb
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_long_long),value :: bsc
      integer(c_int),value :: batchCount
    end function

  end interface
  
end module hipfort_hipblas