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
          
           
module hipfort_hipblas
  use hipfort_hipblas_enums
  implicit none

 
  interface
  
    function hipblasCreate(handle) bind(c, name="hipblasCreate")
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCreate
      type(c_ptr),intent(INOUT) :: handle
    end function

  
    function hipblasDestroy(handle) bind(c, name="hipblasDestroy")
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDestroy
      type(c_ptr),value :: handle
    end function

  
    function hipblasSetStream(handle,streamId) bind(c, name="hipblasSetStream")
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSetStream
      type(c_ptr),value :: handle
      type(c_ptr),value :: streamId
    end function

  
    function hipblasGetStream(handle,streamId) bind(c, name="hipblasGetStream")
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasGetStream
      type(c_ptr),value :: handle
      type(c_ptr),intent(INOUT) :: streamId
    end function

  
    function hipblasSetPointerMode(handle,mode) bind(c, name="hipblasSetPointerMode")
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSetPointerMode
      type(c_ptr),value :: handle
      integer(kind(HIPBLAS_POINTER_MODE_HOST)),value :: mode
    end function

  
    function hipblasGetPointerMode(handle,mode) bind(c, name="hipblasGetPointerMode")
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasGetPointerMode
      type(c_ptr),value :: handle
      type(c_ptr),value :: mode
    end function

  
    function hipblasSetVector(n,elemSize,x,incx,y,incy) bind(c, name="hipblasSetVector")
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

  
    function hipblasGetVector(n,elemSize,x,incx,y,incy) bind(c, name="hipblasGetVector")
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

  
    function hipblasSetMatrix(rows,cols,elemSize,A,lda,B,ldb) bind(c, name="hipblasSetMatrix")
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

  
    function hipblasGetMatrix(rows,cols,elemSize,A,lda,B,ldb) bind(c, name="hipblasGetMatrix")
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

  
    function hipblasSgeam(handle,transa,transb,m,n,alpha,A,lda,beta,B,ldb,C,ldc) bind(c, name="hipblasSgeam")
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

  
    function hipblasDgeam(handle,transa,transb,m,n,alpha,A,lda,beta,B,ldb,C,ldc) bind(c, name="hipblasDgeam")
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

  
    function hipblasIsamax(handle,n,x,incx,myResult) bind(c, name="hipblasIsamax")
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

  
    function hipblasIdamax(handle,n,x,incx,myResult) bind(c, name="hipblasIdamax")
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

  
    function hipblasIcamax(handle,n,x,incx,myResult) bind(c, name="hipblasIcamax")
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

  
    function hipblasIzamax(handle,n,x,incx,myResult) bind(c, name="hipblasIzamax")
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

  
    function hipblasIsamaxBatched(handle,n,x,incx,batch_count,myResult) bind(c, name="hipblasIsamaxBatched")
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

  
    function hipblasIdamaxBatched(handle,n,x,incx,batch_count,myResult) bind(c, name="hipblasIdamaxBatched")
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

  
    function hipblasIcamaxBatched(handle,n,x,incx,batch_count,myResult) bind(c, name="hipblasIcamaxBatched")
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

  
    function hipblasIzamaxBatched(handle,n,x,incx,batch_count,myResult) bind(c, name="hipblasIzamaxBatched")
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

  
    function hipblasIsamaxStridedBatched(handle,n,x,incx,stridex,batch_count,myResult) bind(c, name="hipblasIsamaxStridedBatched")
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

  
    function hipblasIdamaxStridedBatched(handle,n,x,incx,stridex,batch_count,myResult) bind(c, name="hipblasIdamaxStridedBatched")
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

  
    function hipblasIcamaxStridedBatched(handle,n,x,incx,stridex,batch_count,myResult) bind(c, name="hipblasIcamaxStridedBatched")
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

  
    function hipblasIzamaxStridedBatched(handle,n,x,incx,stridex,batch_count,myResult) bind(c, name="hipblasIzamaxStridedBatched")
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

  
    function hipblasIsamin(handle,n,x,incx,myResult) bind(c, name="hipblasIsamin")
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

  
    function hipblasIdamin(handle,n,x,incx,myResult) bind(c, name="hipblasIdamin")
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

  
    function hipblasIcamin(handle,n,x,incx,myResult) bind(c, name="hipblasIcamin")
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

  
    function hipblasIzamin(handle,n,x,incx,myResult) bind(c, name="hipblasIzamin")
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

  
    function hipblasIsaminBatched(handle,n,x,incx,batch_count,myResult) bind(c, name="hipblasIsaminBatched")
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

  
    function hipblasIdaminBatched(handle,n,x,incx,batch_count,myResult) bind(c, name="hipblasIdaminBatched")
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

  
    function hipblasIcaminBatched(handle,n,x,incx,batch_count,myResult) bind(c, name="hipblasIcaminBatched")
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

  
    function hipblasIzaminBatched(handle,n,x,incx,batch_count,myResult) bind(c, name="hipblasIzaminBatched")
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

  
    function hipblasIsaminStridedBatched(handle,n,x,incx,stridex,batch_count,myResult) bind(c, name="hipblasIsaminStridedBatched")
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

  
    function hipblasIdaminStridedBatched(handle,n,x,incx,stridex,batch_count,myResult) bind(c, name="hipblasIdaminStridedBatched")
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

  
    function hipblasIcaminStridedBatched(handle,n,x,incx,stridex,batch_count,myResult) bind(c, name="hipblasIcaminStridedBatched")
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

  
    function hipblasIzaminStridedBatched(handle,n,x,incx,stridex,batch_count,myResult) bind(c, name="hipblasIzaminStridedBatched")
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

  
    function hipblasSasum(handle,n,x,incx,myResult) bind(c, name="hipblasSasum")
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

  
    function hipblasDasum(handle,n,x,incx,myResult) bind(c, name="hipblasDasum")
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

  
    function hipblasScasum(handle,n,x,incx,myResult) bind(c, name="hipblasScasum")
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

  
    function hipblasDzasum(handle,n,x,incx,myResult) bind(c, name="hipblasDzasum")
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

  
    function hipblasSasumBatched(handle,n,x,incx,batchCount,myResult) bind(c, name="hipblasSasumBatched")
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

  
    function hipblasDasumBatched(handle,n,x,incx,batchCount,myResult) bind(c, name="hipblasDasumBatched")
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

  
    function hipblasScasumBatched(handle,n,x,incx,batchCount,myResult) bind(c, name="hipblasScasumBatched")
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

  
    function hipblasDzasumBatched(handle,n,x,incx,batchCount,myResult) bind(c, name="hipblasDzasumBatched")
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

  
    function hipblasSasumStridedBatched(handle,n,x,incx,stridex,batchCount,myResult) bind(c, name="hipblasSasumStridedBatched")
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

  
    function hipblasDasumStridedBatched(handle,n,x,incx,stridex,batchCount,myResult) bind(c, name="hipblasDasumStridedBatched")
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

  
    function hipblasScasumStridedBatched(handle,n,x,incx,stridex,batchCount,myResult) bind(c, name="hipblasScasumStridedBatched")
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

  
    function hipblasDzasumStridedBatched(handle,n,x,incx,stridex,batchCount,myResult) bind(c, name="hipblasDzasumStridedBatched")
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

  
    function hipblasSaxpy(handle,n,alpha,x,incx,y,incy) bind(c, name="hipblasSaxpy")
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

  
    function hipblasDaxpy(handle,n,alpha,x,incx,y,incy) bind(c, name="hipblasDaxpy")
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

  
    function hipblasCaxpy(handle,n,alpha,x,incx,y,incy) bind(c, name="hipblasCaxpy")
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

  
    function hipblasZaxpy(handle,n,alpha,x,incx,y,incy) bind(c, name="hipblasZaxpy")
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

  
    function hipblasSaxpyBatched(handle,n,alpha,x,incx,y,incy,batch_count) bind(c, name="hipblasSaxpyBatched")
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

  
    function hipblasDaxpyBatched(handle,n,alpha,x,incx,y,incy,batch_count) bind(c, name="hipblasDaxpyBatched")
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

  
    function hipblasCaxpyBatched(handle,n,alpha,x,incx,y,incy,batch_count) bind(c, name="hipblasCaxpyBatched")
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

  
    function hipblasZaxpyBatched(handle,n,alpha,x,incx,y,incy,batch_count) bind(c, name="hipblasZaxpyBatched")
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

  
    function hipblasSaxpyStridedBatched(handle,n,alpha,x,incx,stridex,y,incy,stridey,batch_count) bind(c, name="hipblasSaxpyStridedBatched")
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

  
    function hipblasDaxpyStridedBatched(handle,n,alpha,x,incx,stridex,y,incy,stridey,batch_count) bind(c, name="hipblasDaxpyStridedBatched")
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

  
    function hipblasCaxpyStridedBatched(handle,n,alpha,x,incx,stridex,y,incy,stridey,batch_count) bind(c, name="hipblasCaxpyStridedBatched")
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

  
    function hipblasZaxpyStridedBatched(handle,n,alpha,x,incx,stridex,y,incy,stridey,batch_count) bind(c, name="hipblasZaxpyStridedBatched")
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

  
    function hipblasScopy(handle,n,x,incx,y,incy) bind(c, name="hipblasScopy")
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

  
    function hipblasDcopy(handle,n,x,incx,y,incy) bind(c, name="hipblasDcopy")
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

  
    function hipblasCcopy(handle,n,x,incx,y,incy) bind(c, name="hipblasCcopy")
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

  
    function hipblasZcopy(handle,n,x,incx,y,incy) bind(c, name="hipblasZcopy")
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

  
    function hipblasScopyBatched(handle,n,x,incx,y,incy,batchCount) bind(c, name="hipblasScopyBatched")
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

  
    function hipblasDcopyBatched(handle,n,x,incx,y,incy,batchCount) bind(c, name="hipblasDcopyBatched")
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

  
    function hipblasCcopyBatched(handle,n,x,incx,y,incy,batchCount) bind(c, name="hipblasCcopyBatched")
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

  
    function hipblasZcopyBatched(handle,n,x,incx,y,incy,batchCount) bind(c, name="hipblasZcopyBatched")
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

  
    function hipblasScopyStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batchCount) bind(c, name="hipblasScopyStridedBatched")
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

  
    function hipblasDcopyStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batchCount) bind(c, name="hipblasDcopyStridedBatched")
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

  
    function hipblasCcopyStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batchCount) bind(c, name="hipblasCcopyStridedBatched")
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

  
    function hipblasZcopyStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batchCount) bind(c, name="hipblasZcopyStridedBatched")
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

  
    function hipblasHdot(handle,n,x,incx,y,incy,myResult) bind(c, name="hipblasHdot")
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

  
    function hipblasBfdot(handle,n,x,incx,y,incy,myResult) bind(c, name="hipblasBfdot")
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasBfdot
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: x
      integer(c_int),value :: incx
      type(c_ptr),intent(INOUT) :: y
      integer(c_int),value :: incy
      type(c_ptr),intent(INOUT) :: myResult
    end function

  
    function hipblasSdot(handle,n,x,incx,y,incy,myResult) bind(c, name="hipblasSdot")
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

  
    function hipblasDdot(handle,n,x,incx,y,incy,myResult) bind(c, name="hipblasDdot")
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

  
    function hipblasCdotc(handle,n,x,incx,y,incy,myResult) bind(c, name="hipblasCdotc")
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

  
    function hipblasCdotu(handle,n,x,incx,y,incy,myResult) bind(c, name="hipblasCdotu")
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

  
    function hipblasZdotc(handle,n,x,incx,y,incy,myResult) bind(c, name="hipblasZdotc")
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

  
    function hipblasZdotu(handle,n,x,incx,y,incy,myResult) bind(c, name="hipblasZdotu")
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

  
    function hipblasHdotBatched(handle,n,x,incx,y,incy,batch_count,myResult) bind(c, name="hipblasHdotBatched")
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

  
    function hipblasBfdotBatched(handle,n,x,incx,y,incy,batch_count,myResult) bind(c, name="hipblasBfdotBatched")
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasBfdotBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: x
      integer(c_int),value :: incx
      type(c_ptr),intent(INOUT) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
      type(c_ptr),intent(INOUT) :: myResult
    end function

  
    function hipblasSdotBatched(handle,n,x,incx,y,incy,batch_count,myResult) bind(c, name="hipblasSdotBatched")
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

  
    function hipblasDdotBatched(handle,n,x,incx,y,incy,batch_count,myResult) bind(c, name="hipblasDdotBatched")
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

  
    function hipblasCdotcBatched(handle,n,x,incx,y,incy,batch_count,myResult) bind(c, name="hipblasCdotcBatched")
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

  
    function hipblasCdotuBatched(handle,n,x,incx,y,incy,batch_count,myResult) bind(c, name="hipblasCdotuBatched")
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

  
    function hipblasZdotcBatched(handle,n,x,incx,y,incy,batch_count,myResult) bind(c, name="hipblasZdotcBatched")
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

  
    function hipblasZdotuBatched(handle,n,x,incx,y,incy,batch_count,myResult) bind(c, name="hipblasZdotuBatched")
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

  
    function hipblasHdotStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batch_count,myResult) bind(c, name="hipblasHdotStridedBatched")
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

  
    function hipblasBfdotStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batch_count,myResult) bind(c, name="hipblasBfdotStridedBatched")
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasBfdotStridedBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: stridex
      type(c_ptr),intent(INOUT) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: stridey
      integer(c_int),value :: batch_count
      type(c_ptr),intent(INOUT) :: myResult
    end function

  
    function hipblasSdotStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batch_count,myResult) bind(c, name="hipblasSdotStridedBatched")
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

  
    function hipblasDdotStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batch_count,myResult) bind(c, name="hipblasDdotStridedBatched")
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

  
    function hipblasCdotcStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batch_count,myResult) bind(c, name="hipblasCdotcStridedBatched")
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

  
    function hipblasCdotuStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batch_count,myResult) bind(c, name="hipblasCdotuStridedBatched")
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

  
    function hipblasZdotcStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batch_count,myResult) bind(c, name="hipblasZdotcStridedBatched")
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

  
    function hipblasZdotuStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batch_count,myResult) bind(c, name="hipblasZdotuStridedBatched")
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

  
    function hipblasSnrm2(handle,n,x,incx,myResult) bind(c, name="hipblasSnrm2")
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

  
    function hipblasDnrm2(handle,n,x,incx,myResult) bind(c, name="hipblasDnrm2")
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

  
    function hipblasScnrm2(handle,n,x,incx,myResult) bind(c, name="hipblasScnrm2")
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

  
    function hipblasDznrm2(handle,n,x,incx,myResult) bind(c, name="hipblasDznrm2")
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

  
    function hipblasSnrm2Batched(handle,n,x,incx,batchCount,myResult) bind(c, name="hipblasSnrm2Batched")
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

  
    function hipblasDnrm2Batched(handle,n,x,incx,batchCount,myResult) bind(c, name="hipblasDnrm2Batched")
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

  
    function hipblasScnrm2Batched(handle,n,x,incx,batchCount,myResult) bind(c, name="hipblasScnrm2Batched")
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

  
    function hipblasDznrm2Batched(handle,n,x,incx,batchCount,myResult) bind(c, name="hipblasDznrm2Batched")
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

  
    function hipblasSnrm2StridedBatched(handle,n,x,incx,stridex,batchCount,myResult) bind(c, name="hipblasSnrm2StridedBatched")
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

  
    function hipblasDnrm2StridedBatched(handle,n,x,incx,stridex,batchCount,myResult) bind(c, name="hipblasDnrm2StridedBatched")
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

  
    function hipblasScnrm2StridedBatched(handle,n,x,incx,stridex,batchCount,myResult) bind(c, name="hipblasScnrm2StridedBatched")
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

  
    function hipblasDznrm2StridedBatched(handle,n,x,incx,stridex,batchCount,myResult) bind(c, name="hipblasDznrm2StridedBatched")
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

  
    function hipblasSrot(handle,n,x,incx,y,incy,c,s) bind(c, name="hipblasSrot")
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

  
    function hipblasDrot(handle,n,x,incx,y,incy,c,s) bind(c, name="hipblasDrot")
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

  
    function hipblasCrot(handle,n,x,incx,y,incy,c,s) bind(c, name="hipblasCrot")
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

  
    function hipblasCsrot(handle,n,x,incx,y,incy,c,s) bind(c, name="hipblasCsrot")
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

  
    function hipblasZrot(handle,n,x,incx,y,incy,c,s) bind(c, name="hipblasZrot")
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

  
    function hipblasZdrot(handle,n,x,incx,y,incy,c,s) bind(c, name="hipblasZdrot")
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

  
    function hipblasSrotBatched(handle,n,x,incx,y,incy,c,s,batchCount) bind(c, name="hipblasSrotBatched")
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

  
    function hipblasDrotBatched(handle,n,x,incx,y,incy,c,s,batchCount) bind(c, name="hipblasDrotBatched")
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

  
    function hipblasCrotBatched(handle,n,x,incx,y,incy,c,s,batchCount) bind(c, name="hipblasCrotBatched")
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

  
    function hipblasCsrotBatched(handle,n,x,incx,y,incy,c,s,batchCount) bind(c, name="hipblasCsrotBatched")
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

  
    function hipblasZrotBatched(handle,n,x,incx,y,incy,c,s,batchCount) bind(c, name="hipblasZrotBatched")
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

  
    function hipblasZdrotBatched(handle,n,x,incx,y,incy,c,s,batchCount) bind(c, name="hipblasZdrotBatched")
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

  
    function hipblasSrotStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,c,s,batchCount) bind(c, name="hipblasSrotStridedBatched")
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

  
    function hipblasDrotStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,c,s,batchCount) bind(c, name="hipblasDrotStridedBatched")
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

  
    function hipblasCrotStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,c,s,batchCount) bind(c, name="hipblasCrotStridedBatched")
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

  
    function hipblasCsrotStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,c,s,batchCount) bind(c, name="hipblasCsrotStridedBatched")
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

  
    function hipblasZrotStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,c,s,batchCount) bind(c, name="hipblasZrotStridedBatched")
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

  
    function hipblasZdrotStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,c,s,batchCount) bind(c, name="hipblasZdrotStridedBatched")
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

  
    function hipblasSrotg(handle,a,b,c,s) bind(c, name="hipblasSrotg")
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

  
    function hipblasDrotg(handle,a,b,c,s) bind(c, name="hipblasDrotg")
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

  
    function hipblasCrotg(handle,a,b,c,s) bind(c, name="hipblasCrotg")
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

  
    function hipblasZrotg(handle,a,b,c,s) bind(c, name="hipblasZrotg")
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

  
    function hipblasSrotgBatched(handle,a,b,c,s,batchCount) bind(c, name="hipblasSrotgBatched")
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

  
    function hipblasDrotgBatched(handle,a,b,c,s,batchCount) bind(c, name="hipblasDrotgBatched")
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

  
    function hipblasCrotgBatched(handle,a,b,c,s,batchCount) bind(c, name="hipblasCrotgBatched")
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

  
    function hipblasZrotgBatched(handle,a,b,c,s,batchCount) bind(c, name="hipblasZrotgBatched")
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

  
    function hipblasSrotgStridedBatched(handle,a,stride_a,b,stride_b,c,stride_c,s,stride_s,batchCount) bind(c, name="hipblasSrotgStridedBatched")
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

  
    function hipblasDrotgStridedBatched(handle,a,stride_a,b,stride_b,c,stride_c,s,stride_s,batchCount) bind(c, name="hipblasDrotgStridedBatched")
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

  
    function hipblasCrotgStridedBatched(handle,a,stride_a,b,stride_b,c,stride_c,s,stride_s,batchCount) bind(c, name="hipblasCrotgStridedBatched")
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

  
    function hipblasZrotgStridedBatched(handle,a,stride_a,b,stride_b,c,stride_c,s,stride_s,batchCount) bind(c, name="hipblasZrotgStridedBatched")
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

  
    function hipblasSrotm(handle,n,x,incx,y,incy,param) bind(c, name="hipblasSrotm")
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

  
    function hipblasDrotm(handle,n,x,incx,y,incy,param) bind(c, name="hipblasDrotm")
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

  
    function hipblasSrotmBatched(handle,n,x,incx,y,incy,param,batchCount) bind(c, name="hipblasSrotmBatched")
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

  
    function hipblasDrotmBatched(handle,n,x,incx,y,incy,param,batchCount) bind(c, name="hipblasDrotmBatched")
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

  
    function hipblasSrotmStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,param,stride_param,batchCount) bind(c, name="hipblasSrotmStridedBatched")
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

  
    function hipblasDrotmStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,param,stride_param,batchCount) bind(c, name="hipblasDrotmStridedBatched")
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

  
    function hipblasSrotmg(handle,d1,d2,x1,y1,param) bind(c, name="hipblasSrotmg")
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

  
    function hipblasDrotmg(handle,d1,d2,x1,y1,param) bind(c, name="hipblasDrotmg")
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

  
    function hipblasSrotmgBatched(handle,d1,d2,x1,y1,param,batchCount) bind(c, name="hipblasSrotmgBatched")
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

  
    function hipblasDrotmgBatched(handle,d1,d2,x1,y1,param,batchCount) bind(c, name="hipblasDrotmgBatched")
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

  
    function hipblasSrotmgStridedBatched(handle,d1,stride_d1,d2,stride_d2,x1,stride_x1,y1,stride_y1,param,stride_param,batchCount) bind(c, name="hipblasSrotmgStridedBatched")
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

  
    function hipblasDrotmgStridedBatched(handle,d1,stride_d1,d2,stride_d2,x1,stride_x1,y1,stride_y1,param,stride_param,batchCount) bind(c, name="hipblasDrotmgStridedBatched")
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

  
    function hipblasSscal(handle,n,alpha,x,incx) bind(c, name="hipblasSscal")
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

  
    function hipblasDscal(handle,n,alpha,x,incx) bind(c, name="hipblasDscal")
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

  
    function hipblasCscal(handle,n,alpha,x,incx) bind(c, name="hipblasCscal")
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

  
    function hipblasCsscal(handle,n,alpha,x,incx) bind(c, name="hipblasCsscal")
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

  
    function hipblasZscal(handle,n,alpha,x,incx) bind(c, name="hipblasZscal")
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

  
    function hipblasZdscal(handle,n,alpha,x,incx) bind(c, name="hipblasZdscal")
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

  
    function hipblasSscalBatched(handle,n,alpha,x,incx,batchCount) bind(c, name="hipblasSscalBatched")
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

  
    function hipblasDscalBatched(handle,n,alpha,x,incx,batchCount) bind(c, name="hipblasDscalBatched")
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

  
    function hipblasCscalBatched(handle,n,alpha,x,incx,batchCount) bind(c, name="hipblasCscalBatched")
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

  
    function hipblasZscalBatched(handle,n,alpha,x,incx,batchCount) bind(c, name="hipblasZscalBatched")
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

  
    function hipblasCsscalBatched(handle,n,alpha,x,incx,batchCount) bind(c, name="hipblasCsscalBatched")
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

  
    function hipblasZdscalBatched(handle,n,alpha,x,incx,batchCount) bind(c, name="hipblasZdscalBatched")
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

  
    function hipblasSscalStridedBatched(handle,n,alpha,x,incx,stridex,batchCount) bind(c, name="hipblasSscalStridedBatched")
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

  
    function hipblasDscalStridedBatched(handle,n,alpha,x,incx,stridex,batchCount) bind(c, name="hipblasDscalStridedBatched")
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

  
    function hipblasCscalStridedBatched(handle,n,alpha,x,incx,stridex,batchCount) bind(c, name="hipblasCscalStridedBatched")
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

  
    function hipblasZscalStridedBatched(handle,n,alpha,x,incx,stridex,batchCount) bind(c, name="hipblasZscalStridedBatched")
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

  
    function hipblasCsscalStridedBatched(handle,n,alpha,x,incx,stridex,batchCount) bind(c, name="hipblasCsscalStridedBatched")
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

  
    function hipblasZdscalStridedBatched(handle,n,alpha,x,incx,stridex,batchCount) bind(c, name="hipblasZdscalStridedBatched")
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

  
    function hipblasSswap(handle,n,x,incx,y,incy) bind(c, name="hipblasSswap")
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

  
    function hipblasDswap(handle,n,x,incx,y,incy) bind(c, name="hipblasDswap")
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

  
    function hipblasCswap(handle,n,x,incx,y,incy) bind(c, name="hipblasCswap")
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

  
    function hipblasZswap(handle,n,x,incx,y,incy) bind(c, name="hipblasZswap")
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

  
    function hipblasSswapBatched(handle,n,x,incx,y,incy,batchCount) bind(c, name="hipblasSswapBatched")
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

  
    function hipblasDswapBatched(handle,n,x,incx,y,incy,batchCount) bind(c, name="hipblasDswapBatched")
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

  
    function hipblasCswapBatched(handle,n,x,incx,y,incy,batchCount) bind(c, name="hipblasCswapBatched")
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

  
    function hipblasZswapBatched(handle,n,x,incx,y,incy,batchCount) bind(c, name="hipblasZswapBatched")
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

  
    function hipblasSswapStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batchCount) bind(c, name="hipblasSswapStridedBatched")
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

  
    function hipblasDswapStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batchCount) bind(c, name="hipblasDswapStridedBatched")
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

  
    function hipblasCswapStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batchCount) bind(c, name="hipblasCswapStridedBatched")
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

  
    function hipblasZswapStridedBatched(handle,n,x,incx,stridex,y,incy,stridey,batchCount) bind(c, name="hipblasZswapStridedBatched")
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

  
    function hipblasSgbmv(handle,trans,m,n,kl,ku,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="hipblasSgbmv")
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

  
    function hipblasDgbmv(handle,trans,m,n,kl,ku,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="hipblasDgbmv")
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

  
    function hipblasCgbmv(handle,trans,m,n,kl,ku,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="hipblasCgbmv")
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

  
    function hipblasZgbmv(handle,trans,m,n,kl,ku,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="hipblasZgbmv")
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

  
    function hipblasSgbmvBatched(handle,trans,m,n,kl,ku,alpha,A,lda,x,incx,beta,y,incy,batch_count) bind(c, name="hipblasSgbmvBatched")
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

  
    function hipblasDgbmvBatched(handle,trans,m,n,kl,ku,alpha,A,lda,x,incx,beta,y,incy,batch_count) bind(c, name="hipblasDgbmvBatched")
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

  
    function hipblasCgbmvBatched(handle,trans,m,n,kl,ku,alpha,A,lda,x,incx,beta,y,incy,batch_count) bind(c, name="hipblasCgbmvBatched")
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

  
    function hipblasZgbmvBatched(handle,trans,m,n,kl,ku,alpha,A,lda,x,incx,beta,y,incy,batch_count) bind(c, name="hipblasZgbmvBatched")
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

  
    function hipblasSgbmvStridedBatched(handle,trans,m,n,kl,ku,alpha,A,lda,stride_a,x,incx,stride_x,beta,y,incy,stride_y,batch_count) bind(c, name="hipblasSgbmvStridedBatched")
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

  
    function hipblasDgbmvStridedBatched(handle,trans,m,n,kl,ku,alpha,A,lda,stride_a,x,incx,stride_x,beta,y,incy,stride_y,batch_count) bind(c, name="hipblasDgbmvStridedBatched")
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

  
    function hipblasCgbmvStridedBatched(handle,trans,m,n,kl,ku,alpha,A,lda,stride_a,x,incx,stride_x,beta,y,incy,stride_y,batch_count) bind(c, name="hipblasCgbmvStridedBatched")
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

  
    function hipblasZgbmvStridedBatched(handle,trans,m,n,kl,ku,alpha,A,lda,stride_a,x,incx,stride_x,beta,y,incy,stride_y,batch_count) bind(c, name="hipblasZgbmvStridedBatched")
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

  
    function hipblasSgemv(handle,trans,m,n,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="hipblasSgemv")
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

  
    function hipblasDgemv(handle,trans,m,n,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="hipblasDgemv")
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

  
    function hipblasCgemv(handle,trans,m,n,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="hipblasCgemv")
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

  
    function hipblasZgemv(handle,trans,m,n,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="hipblasZgemv")
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

  
    function hipblasSgemvBatched(handle,trans,m,n,alpha,A,lda,x,incx,beta,y,incy,batchCount) bind(c, name="hipblasSgemvBatched")
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

  
    function hipblasDgemvBatched(handle,trans,m,n,alpha,A,lda,x,incx,beta,y,incy,batchCount) bind(c, name="hipblasDgemvBatched")
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

  
    function hipblasCgemvBatched(handle,trans,m,n,alpha,A,lda,x,incx,beta,y,incy,batchCount) bind(c, name="hipblasCgemvBatched")
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

  
    function hipblasZgemvBatched(handle,trans,m,n,alpha,A,lda,x,incx,beta,y,incy,batchCount) bind(c, name="hipblasZgemvBatched")
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

  
    function hipblasSgemvStridedBatched(handle,trans,m,n,alpha,A,lda,strideA,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="hipblasSgemvStridedBatched")
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

  
    function hipblasDgemvStridedBatched(handle,trans,m,n,alpha,A,lda,strideA,x,incx,stridex,beta,y,stridey,incy,batchCount) bind(c, name="hipblasDgemvStridedBatched")
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

  
    function hipblasCgemvStridedBatched(handle,trans,m,n,alpha,A,lda,strideA,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="hipblasCgemvStridedBatched")
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

  
    function hipblasZgemvStridedBatched(handle,trans,m,n,alpha,A,lda,strideA,x,incx,stridex,beta,y,stridey,incy,batchCount) bind(c, name="hipblasZgemvStridedBatched")
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

  
    function hipblasSger(handle,m,n,alpha,x,incx,y,incy,A,lda) bind(c, name="hipblasSger")
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

  
    function hipblasDger(handle,m,n,alpha,x,incx,y,incy,A,lda) bind(c, name="hipblasDger")
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

  
    function hipblasCgeru(handle,m,n,alpha,x,incx,y,incy,A,lda) bind(c, name="hipblasCgeru")
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

  
    function hipblasCgerc(handle,m,n,alpha,x,incx,y,incy,A,lda) bind(c, name="hipblasCgerc")
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

  
    function hipblasZgeru(handle,m,n,alpha,x,incx,y,incy,A,lda) bind(c, name="hipblasZgeru")
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

  
    function hipblasZgerc(handle,m,n,alpha,x,incx,y,incy,A,lda) bind(c, name="hipblasZgerc")
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

  
    function hipblasSgerBatched(handle,m,n,alpha,x,incx,y,incy,A,lda,batchCount) bind(c, name="hipblasSgerBatched")
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

  
    function hipblasDgerBatched(handle,m,n,alpha,x,incx,y,incy,A,lda,batchCount) bind(c, name="hipblasDgerBatched")
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

  
    function hipblasCgeruBatched(handle,m,n,alpha,x,incx,y,incy,A,lda,batchCount) bind(c, name="hipblasCgeruBatched")
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

  
    function hipblasCgercBatched(handle,m,n,alpha,x,incx,y,incy,A,lda,batchCount) bind(c, name="hipblasCgercBatched")
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

  
    function hipblasZgeruBatched(handle,m,n,alpha,x,incx,y,incy,A,lda,batchCount) bind(c, name="hipblasZgeruBatched")
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

  
    function hipblasZgercBatched(handle,m,n,alpha,x,incx,y,incy,A,lda,batchCount) bind(c, name="hipblasZgercBatched")
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

  
    function hipblasSgerStridedBatched(handle,m,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batchCount) bind(c, name="hipblasSgerStridedBatched")
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

  
    function hipblasDgerStridedBatched(handle,m,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batchCount) bind(c, name="hipblasDgerStridedBatched")
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

  
    function hipblasCgeruStridedBatched(handle,m,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batchCount) bind(c, name="hipblasCgeruStridedBatched")
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

  
    function hipblasCgercStridedBatched(handle,m,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batchCount) bind(c, name="hipblasCgercStridedBatched")
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

  
    function hipblasZgeruStridedBatched(handle,m,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batchCount) bind(c, name="hipblasZgeruStridedBatched")
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

  
    function hipblasZgercStridedBatched(handle,m,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batchCount) bind(c, name="hipblasZgercStridedBatched")
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

  
    function hipblasChbmv(handle,uplo,n,k,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="hipblasChbmv")
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

  
    function hipblasZhbmv(handle,uplo,n,k,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="hipblasZhbmv")
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

  
    function hipblasChbmvBatched(handle,uplo,n,k,alpha,A,lda,x,incx,beta,y,incy,batchCount) bind(c, name="hipblasChbmvBatched")
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

  
    function hipblasZhbmvBatched(handle,uplo,n,k,alpha,A,lda,x,incx,beta,y,incy,batchCount) bind(c, name="hipblasZhbmvBatched")
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

  
    function hipblasChbmvStridedBatched(handle,uplo,n,k,alpha,A,lda,strideA,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="hipblasChbmvStridedBatched")
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

  
    function hipblasZhbmvStridedBatched(handle,uplo,n,k,alpha,A,lda,strideA,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="hipblasZhbmvStridedBatched")
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

  
    function hipblasChemv(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="hipblasChemv")
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

  
    function hipblasZhemv(handle,uplo,n,alpha,A,da,x,incx,beta,y,incy) bind(c, name="hipblasZhemv")
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

  
    function hipblasChemvBatched(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy,batch_count) bind(c, name="hipblasChemvBatched")
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

  
    function hipblasZhemvBatched(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy,batch_count) bind(c, name="hipblasZhemvBatched")
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

  
    function hipblasChemvStridedBatched(handle,uplo,n,alpha,A,lda,stride_a,x,incx,stride_x,beta,y,incy,stride_y,batch_count) bind(c, name="hipblasChemvStridedBatched")
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

  
    function hipblasZhemvStridedBatched(handle,uplo,n,alpha,A,lda,stride_a,x,incx,stride_x,beta,y,incy,stride_y,batch_count) bind(c, name="hipblasZhemvStridedBatched")
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

  
    function hipblasCher(handle,uplo,n,alpha,x,incx,A,lda) bind(c, name="hipblasCher")
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

  
    function hipblasZher(handle,uplo,n,alpha,x,incx,A,lda) bind(c, name="hipblasZher")
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

  
    function hipblasCherBatched(handle,uplo,n,alpha,x,incx,A,lda,batchCount) bind(c, name="hipblasCherBatched")
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

  
    function hipblasZherBatched(handle,uplo,n,alpha,x,incx,A,lda,batchCount) bind(c, name="hipblasZherBatched")
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

  
    function hipblasCherStridedBatched(handle,uplo,n,alpha,x,incx,stridex,A,lda,strideA,batchCount) bind(c, name="hipblasCherStridedBatched")
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

  
    function hipblasZherStridedBatched(handle,uplo,n,alpha,x,incx,stridex,A,lda,strideA,batchCount) bind(c, name="hipblasZherStridedBatched")
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

  
    function hipblasCher2(handle,uplo,n,alpha,x,incx,y,incy,A,lda) bind(c, name="hipblasCher2")
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

  
    function hipblasZher2(handle,uplo,n,alpha,x,incx,y,incy,A,lda) bind(c, name="hipblasZher2")
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

  
    function hipblasCher2Batched(handle,uplo,n,alpha,x,incx,y,incy,A,lda,batchCount) bind(c, name="hipblasCher2Batched")
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

  
    function hipblasZher2Batched(handle,uplo,n,alpha,x,incx,y,incy,A,lda,batchCount) bind(c, name="hipblasZher2Batched")
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

  
    function hipblasCher2StridedBatched(handle,uplo,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batchCount) bind(c, name="hipblasCher2StridedBatched")
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

  
    function hipblasZher2StridedBatched(handle,uplo,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batchCount) bind(c, name="hipblasZher2StridedBatched")
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

  
    function hipblasChpmv(handle,uplo,n,alpha,AP,x,incx,beta,y,incy) bind(c, name="hipblasChpmv")
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

  
    function hipblasZhpmv(handle,uplo,n,alpha,AP,x,incx,beta,y,incy) bind(c, name="hipblasZhpmv")
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

  
    function hipblasChpmvBatched(handle,uplo,n,alpha,AP,x,incx,beta,y,incy,batchCount) bind(c, name="hipblasChpmvBatched")
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

  
    function hipblasZhpmvBatched(handle,uplo,n,alpha,AP,x,incx,beta,y,incy,batchCount) bind(c, name="hipblasZhpmvBatched")
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

  
    function hipblasChpmvStridedBatched(handle,uplo,n,alpha,AP,strideAP,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="hipblasChpmvStridedBatched")
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

  
    function hipblasZhpmvStridedBatched(handle,uplo,n,alpha,AP,strideAP,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="hipblasZhpmvStridedBatched")
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

  
    function hipblasChpr(handle,uplo,n,alpha,x,incx,AP) bind(c, name="hipblasChpr")
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

  
    function hipblasZhpr(handle,uplo,n,alpha,x,incx,AP) bind(c, name="hipblasZhpr")
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

  
    function hipblasChprBatched(handle,uplo,n,alpha,x,incx,AP,batchCount) bind(c, name="hipblasChprBatched")
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

  
    function hipblasZhprBatched(handle,uplo,n,alpha,x,incx,AP,batchCount) bind(c, name="hipblasZhprBatched")
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

  
    function hipblasChprStridedBatched(handle,uplo,n,alpha,x,incx,stridex,AP,strideAP,batchCount) bind(c, name="hipblasChprStridedBatched")
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

  
    function hipblasZhprStridedBatched(handle,uplo,n,alpha,x,incx,stridex,AP,strideAP,batchCount) bind(c, name="hipblasZhprStridedBatched")
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

  
    function hipblasChpr2(handle,uplo,n,alpha,x,incx,y,incy,AP) bind(c, name="hipblasChpr2")
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

  
    function hipblasZhpr2(handle,uplo,n,alpha,x,incx,y,incy,AP) bind(c, name="hipblasZhpr2")
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

  
    function hipblasChpr2Batched(handle,uplo,n,alpha,x,incx,y,incy,AP,batchCount) bind(c, name="hipblasChpr2Batched")
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

  
    function hipblasZhpr2Batched(handle,uplo,n,alpha,x,incx,y,incy,AP,batchCount) bind(c, name="hipblasZhpr2Batched")
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

  
    function hipblasChpr2StridedBatched(handle,uplo,n,alpha,x,incx,stridex,y,incy,stridey,AP,strideAP,batchCount) bind(c, name="hipblasChpr2StridedBatched")
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

  
    function hipblasZhpr2StridedBatched(handle,uplo,n,alpha,x,incx,stridex,y,incy,stridey,AP,strideAP,batchCount) bind(c, name="hipblasZhpr2StridedBatched")
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

  
    function hipblasSsbmv(handle,uplo,n,k,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="hipblasSsbmv")
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

  
    function hipblasDsbmv(handle,uplo,n,k,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="hipblasDsbmv")
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

  
    function hipblasSsbmvBatched(handle,uplo,n,k,alpha,A,lda,x,incx,beta,y,incy,batchCount) bind(c, name="hipblasSsbmvBatched")
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

  
    function hipblasDsbmvBatched(handle,uplo,n,k,alpha,A,lda,x,incx,beta,y,incy,batchCount) bind(c, name="hipblasDsbmvBatched")
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

  
    function hipblasSsbmvStridedBatched(handle,uplo,n,k,alpha,A,lda,strideA,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="hipblasSsbmvStridedBatched")
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

  
    function hipblasDsbmvStridedBatched(handle,uplo,n,k,alpha,A,lda,strideA,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="hipblasDsbmvStridedBatched")
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

  
    function hipblasSspmv(handle,uplo,n,alpha,AP,x,incx,beta,y,incy) bind(c, name="hipblasSspmv")
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

  
    function hipblasDspmv(handle,uplo,n,alpha,AP,x,incx,beta,y,incy) bind(c, name="hipblasDspmv")
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

  
    function hipblasSspmvBatched(handle,uplo,n,alpha,AP,x,incx,beta,y,incy,batchCount) bind(c, name="hipblasSspmvBatched")
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

  
    function hipblasDspmvBatched(handle,uplo,n,alpha,AP,x,incx,beta,y,incy,batchCount) bind(c, name="hipblasDspmvBatched")
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

  
    function hipblasSspmvStridedBatched(handle,uplo,n,alpha,AP,strideAP,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="hipblasSspmvStridedBatched")
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

  
    function hipblasDspmvStridedBatched(handle,uplo,n,alpha,AP,strideAP,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="hipblasDspmvStridedBatched")
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

  
    function hipblasSspr(handle,uplo,n,alpha,x,incx,AP) bind(c, name="hipblasSspr")
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

  
    function hipblasDspr(handle,uplo,n,alpha,x,incx,AP) bind(c, name="hipblasDspr")
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

  
    function hipblasCspr(handle,uplo,n,alpha,x,incx,AP) bind(c, name="hipblasCspr")
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

  
    function hipblasZspr(handle,uplo,n,alpha,x,incx,AP) bind(c, name="hipblasZspr")
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

  
    function hipblasSsprBatched(handle,uplo,n,alpha,x,incx,AP,batchCount) bind(c, name="hipblasSsprBatched")
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

  
    function hipblasDsprBatched(handle,uplo,n,alpha,x,incx,AP,batchCount) bind(c, name="hipblasDsprBatched")
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

  
    function hipblasCsprBatched(handle,uplo,n,alpha,x,incx,AP,batchCount) bind(c, name="hipblasCsprBatched")
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

  
    function hipblasZsprBatched(handle,uplo,n,alpha,x,incx,AP,batchCount) bind(c, name="hipblasZsprBatched")
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

  
    function hipblasSsprStridedBatched(handle,uplo,n,alpha,x,incx,stridex,AP,strideAP,batchCount) bind(c, name="hipblasSsprStridedBatched")
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

  
    function hipblasDsprStridedBatched(handle,uplo,n,alpha,x,incx,stridex,AP,strideAP,batchCount) bind(c, name="hipblasDsprStridedBatched")
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

  
    function hipblasCsprStridedBatched(handle,uplo,n,alpha,x,incx,stridex,AP,strideAP,batchCount) bind(c, name="hipblasCsprStridedBatched")
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

  
    function hipblasZsprStridedBatched(handle,uplo,n,alpha,x,incx,stridex,AP,strideAP,batchCount) bind(c, name="hipblasZsprStridedBatched")
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

  
    function hipblasSspr2(handle,uplo,n,alpha,x,incx,y,incy,AP) bind(c, name="hipblasSspr2")
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

  
    function hipblasDspr2(handle,uplo,n,alpha,x,incx,y,incy,AP) bind(c, name="hipblasDspr2")
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

  
    function hipblasSspr2Batched(handle,uplo,n,alpha,x,incx,y,incy,AP,batchCount) bind(c, name="hipblasSspr2Batched")
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

  
    function hipblasDspr2Batched(handle,uplo,n,alpha,x,incx,y,incy,AP,batchCount) bind(c, name="hipblasDspr2Batched")
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

  
    function hipblasSspr2StridedBatched(handle,uplo,n,alpha,x,incx,stridex,y,incy,stridey,AP,strideAP,batchCount) bind(c, name="hipblasSspr2StridedBatched")
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

  
    function hipblasDspr2StridedBatched(handle,uplo,n,alpha,x,incx,stridex,y,incy,stridey,AP,strideAP,batchCount) bind(c, name="hipblasDspr2StridedBatched")
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

  
    function hipblasSsymv(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="hipblasSsymv")
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

  
    function hipblasDsymv(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="hipblasDsymv")
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

  
    function hipblasCsymv(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="hipblasCsymv")
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

  
    function hipblasZsymv(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="hipblasZsymv")
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

  
    function hipblasSsymvBatched(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy,batchCount) bind(c, name="hipblasSsymvBatched")
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

  
    function hipblasDsymvBatched(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy,batchCount) bind(c, name="hipblasDsymvBatched")
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

  
    function hipblasCsymvBatched(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy,batchCount) bind(c, name="hipblasCsymvBatched")
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

  
    function hipblasZsymvBatched(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy,batchCount) bind(c, name="hipblasZsymvBatched")
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

  
    function hipblasSsymvStridedBatched(handle,uplo,n,alpha,A,lda,stirdeA,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="hipblasSsymvStridedBatched")
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

  
    function hipblasDsymvStridedBatched(handle,uplo,n,alpha,A,lda,stirdeA,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="hipblasDsymvStridedBatched")
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

  
    function hipblasCsymvStridedBatched(handle,uplo,n,alpha,A,lda,stirdeA,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="hipblasCsymvStridedBatched")
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

  
    function hipblasZsymvStridedBatched(handle,uplo,n,alpha,A,lda,stirdeA,x,incx,stridex,beta,y,incy,stridey,batchCount) bind(c, name="hipblasZsymvStridedBatched")
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

  
    function hipblasSsyr(handle,uplo,n,alpha,x,incx,A,lda) bind(c, name="hipblasSsyr")
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

  
    function hipblasDsyr(handle,uplo,n,alpha,x,incx,A,lda) bind(c, name="hipblasDsyr")
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

  
    function hipblasCsyr(handle,uplo,n,alpha,x,incx,A,lda) bind(c, name="hipblasCsyr")
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

  
    function hipblasZsyr(handle,uplo,n,alpha,x,incx,A,lda) bind(c, name="hipblasZsyr")
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

  
    function hipblasSsyrBatched(handle,uplo,n,alpha,x,incx,A,lda,batchCount) bind(c, name="hipblasSsyrBatched")
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

  
    function hipblasDsyrBatched(handle,uplo,n,alpha,x,incx,A,lda,batchCount) bind(c, name="hipblasDsyrBatched")
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

  
    function hipblasCsyrBatched(handle,uplo,n,alpha,x,incx,A,lda,batchCount) bind(c, name="hipblasCsyrBatched")
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

  
    function hipblasZsyrBatched(handle,uplo,n,alpha,x,incx,A,lda,batchCount) bind(c, name="hipblasZsyrBatched")
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

  
    function hipblasSsyrStridedBatched(handle,uplo,n,alpha,x,incx,stridex,A,lda,stridey,batchCount) bind(c, name="hipblasSsyrStridedBatched")
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

  
    function hipblasDsyrStridedBatched(handle,uplo,n,alpha,x,incx,stridex,A,lda,stridey,batchCount) bind(c, name="hipblasDsyrStridedBatched")
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

  
    function hipblasCsyrStridedBatched(handle,uplo,n,alpha,x,incx,stridex,A,lda,stridey,batchCount) bind(c, name="hipblasCsyrStridedBatched")
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

  
    function hipblasZsyrStridedBatched(handle,uplo,n,alpha,x,incx,stridex,A,lda,stridey,batchCount) bind(c, name="hipblasZsyrStridedBatched")
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

  
    function hipblasSsyr2(handle,uplo,n,alpha,x,incx,y,incy,A,lda) bind(c, name="hipblasSsyr2")
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

  
    function hipblasDsyr2(handle,uplo,n,alpha,x,incx,y,incy,A,lda) bind(c, name="hipblasDsyr2")
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

  
    function hipblasCsyr2(handle,uplo,n,alpha,x,incx,y,incy,A,lda) bind(c, name="hipblasCsyr2")
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

  
    function hipblasZsyr2(handle,uplo,n,alpha,x,incx,y,incy,A,lda) bind(c, name="hipblasZsyr2")
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

  
    function hipblasSsyr2Batched(handle,uplo,n,alpha,x,incx,y,incy,A,lda,batchCount) bind(c, name="hipblasSsyr2Batched")
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

  
    function hipblasDsyr2Batched(handle,uplo,n,alpha,x,incx,y,incy,A,lda,batchCount) bind(c, name="hipblasDsyr2Batched")
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

  
    function hipblasCsyr2Batched(handle,uplo,n,alpha,x,incx,y,incy,A,lda,batchCount) bind(c, name="hipblasCsyr2Batched")
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

  
    function hipblasZsyr2Batched(handle,uplo,n,alpha,x,incx,y,incy,A,lda,batchCount) bind(c, name="hipblasZsyr2Batched")
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

  
    function hipblasSsyr2StridedBatched(handle,uplo,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batchCount) bind(c, name="hipblasSsyr2StridedBatched")
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

  
    function hipblasDsyr2StridedBatched(handle,uplo,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batchCount) bind(c, name="hipblasDsyr2StridedBatched")
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

  
    function hipblasCsyr2StridedBatched(handle,uplo,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batchCount) bind(c, name="hipblasCsyr2StridedBatched")
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

  
    function hipblasZsyr2StridedBatched(handle,uplo,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batchCount) bind(c, name="hipblasZsyr2StridedBatched")
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

  
    function hipblasStbmv(handle,uplo,transA,diag,m,k,A,lda,x,incx) bind(c, name="hipblasStbmv")
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

  
    function hipblasDtbmv(handle,uplo,transA,diag,m,k,A,lda,x,incx) bind(c, name="hipblasDtbmv")
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

  
    function hipblasCtbmv(handle,uplo,transA,diag,m,k,A,lda,x,incx) bind(c, name="hipblasCtbmv")
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

  
    function hipblasZtbmv(handle,uplo,transA,diag,m,k,A,lda,x,incx) bind(c, name="hipblasZtbmv")
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

  
    function hipblasStbmvBatched(handle,uplo,transA,diag,m,k,A,lda,x,incx,batch_count) bind(c, name="hipblasStbmvBatched")
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

  
    function hipblasDtbmvBatched(handle,uplo,transA,diag,m,k,A,lda,x,incx,batch_count) bind(c, name="hipblasDtbmvBatched")
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

  
    function hipblasCtbmvBatched(handle,uplo,transA,diag,m,k,A,lda,x,incx,batch_count) bind(c, name="hipblasCtbmvBatched")
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

  
    function hipblasZtbmvBatched(handle,uplo,transA,diag,m,k,A,lda,x,incx,batch_count) bind(c, name="hipblasZtbmvBatched")
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

  
    function hipblasStbmvStridedBatched(handle,uplo,transA,diag,m,k,A,lda,stride_a,x,incx,stride_x,batch_count) bind(c, name="hipblasStbmvStridedBatched")
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

  
    function hipblasDtbmvStridedBatched(handle,uplo,transA,diag,m,k,A,lda,stride_a,x,incx,stride_x,batch_count) bind(c, name="hipblasDtbmvStridedBatched")
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

  
    function hipblasCtbmvStridedBatched(handle,uplo,transA,diag,m,k,A,lda,stride_a,x,incx,stride_x,batch_count) bind(c, name="hipblasCtbmvStridedBatched")
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

  
    function hipblasZtbmvStridedBatched(handle,uplo,transA,diag,m,k,A,lda,stride_a,x,incx,stride_x,batch_count) bind(c, name="hipblasZtbmvStridedBatched")
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

  
    function hipblasStpmv(handle,uplo,transA,diag,m,AP,x,incx) bind(c, name="hipblasStpmv")
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

  
    function hipblasDtpmv(handle,uplo,transA,diag,m,AP,x,incx) bind(c, name="hipblasDtpmv")
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

  
    function hipblasCtpmv(handle,uplo,transA,diag,m,AP,x,incx) bind(c, name="hipblasCtpmv")
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

  
    function hipblasZtpmv(handle,uplo,transA,diag,m,AP,x,incx) bind(c, name="hipblasZtpmv")
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

  
    function hipblasStpmvBatched(handle,uplo,transA,diag,m,AP,x,incx,batchCount) bind(c, name="hipblasStpmvBatched")
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

  
    function hipblasDtpmvBatched(handle,uplo,transA,diag,m,AP,x,incx,batchCount) bind(c, name="hipblasDtpmvBatched")
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

  
    function hipblasCtpmvBatched(handle,uplo,transA,diag,m,AP,x,incx,batchCount) bind(c, name="hipblasCtpmvBatched")
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

  
    function hipblasZtpmvBatched(handle,uplo,transA,diag,m,AP,x,incx,batchCount) bind(c, name="hipblasZtpmvBatched")
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

  
    function hipblasStpmvStridedBatched(handle,uplo,transA,diag,m,AP,strideAP,x,incx,stride,batchCount) bind(c, name="hipblasStpmvStridedBatched")
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

  
    function hipblasDtpmvStridedBatched(handle,uplo,transA,diag,m,AP,strideAP,x,incx,stride,batchCount) bind(c, name="hipblasDtpmvStridedBatched")
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

  
    function hipblasCtpmvStridedBatched(handle,uplo,transA,diag,m,AP,strideAP,x,incx,stride,batchCount) bind(c, name="hipblasCtpmvStridedBatched")
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

  
    function hipblasZtpmvStridedBatched(handle,uplo,transA,diag,m,AP,strideAP,x,incx,stride,batchCount) bind(c, name="hipblasZtpmvStridedBatched")
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

  
    function hipblasStpsv(handle,uplo,transA,diag,m,AP,x,incx) bind(c, name="hipblasStpsv")
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

  
    function hipblasDtpsv(handle,uplo,transA,diag,m,AP,x,incx) bind(c, name="hipblasDtpsv")
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

  
    function hipblasCtpsv(handle,uplo,transA,diag,m,AP,x,incx) bind(c, name="hipblasCtpsv")
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

  
    function hipblasZtpsv(handle,uplo,transA,diag,m,AP,x,incx) bind(c, name="hipblasZtpsv")
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

  
    function hipblasStpsvBatched(handle,uplo,transA,diag,m,AP,x,incx,batchCount) bind(c, name="hipblasStpsvBatched")
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

  
    function hipblasDtpsvBatched(handle,uplo,transA,diag,m,AP,x,incx,batchCount) bind(c, name="hipblasDtpsvBatched")
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

  
    function hipblasCtpsvBatched(handle,uplo,transA,diag,m,AP,x,incx,batchCount) bind(c, name="hipblasCtpsvBatched")
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

  
    function hipblasZtpsvBatched(handle,uplo,transA,diag,m,AP,x,incx,batchCount) bind(c, name="hipblasZtpsvBatched")
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

  
    function hipblasStpsvStridedBatched(handle,uplo,transA,diag,m,AP,strideAP,x,incx,stridex,batchCount) bind(c, name="hipblasStpsvStridedBatched")
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

  
    function hipblasDtpsvStridedBatched(handle,uplo,transA,diag,m,AP,strideAP,x,incx,stridex,batchCount) bind(c, name="hipblasDtpsvStridedBatched")
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

  
    function hipblasCtpsvStridedBatched(handle,uplo,transA,diag,m,AP,strideAP,x,incx,stridex,batchCount) bind(c, name="hipblasCtpsvStridedBatched")
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

  
    function hipblasZtpsvStridedBatched(handle,uplo,transA,diag,m,AP,strideAP,x,incx,stridex,batchCount) bind(c, name="hipblasZtpsvStridedBatched")
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

  
    function hipblasStrmv(handle,uplo,transA,diag,m,A,lda,x,incx) bind(c, name="hipblasStrmv")
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

  
    function hipblasDtrmv(handle,uplo,transA,diag,m,A,lda,x,incx) bind(c, name="hipblasDtrmv")
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

  
    function hipblasCtrmv(handle,uplo,transA,diag,m,A,lda,x,incx) bind(c, name="hipblasCtrmv")
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

  
    function hipblasZtrmv(handle,uplo,transA,diag,m,A,lda,x,incx) bind(c, name="hipblasZtrmv")
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

  
    function hipblasStrmvBatched(handle,uplo,transA,diag,m,A,lda,x,incx,batch_count) bind(c, name="hipblasStrmvBatched")
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

  
    function hipblasDtrmvBatched(handle,uplo,transA,diag,m,A,lda,x,incx,batch_count) bind(c, name="hipblasDtrmvBatched")
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

  
    function hipblasCtrmvBatched(handle,uplo,transA,diag,m,A,lda,x,incx,batch_count) bind(c, name="hipblasCtrmvBatched")
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

  
    function hipblasZtrmvBatched(handle,uplo,transA,diag,m,A,lda,x,incx,batch_count) bind(c, name="hipblasZtrmvBatched")
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

  
    function hipblasStrmvStridedBatched(handle,uplo,transA,diag,m,A,lda,stride_a,x,incx,stride_x,batch_count) bind(c, name="hipblasStrmvStridedBatched")
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

  
    function hipblasDtrmvStridedBatched(handle,uplo,transA,diag,m,A,lda,stride_a,x,incx,stride_x,batch_count) bind(c, name="hipblasDtrmvStridedBatched")
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

  
    function hipblasCtrmvStridedBatched(handle,uplo,transA,diag,m,A,lda,stride_a,x,incx,stride_x,batch_count) bind(c, name="hipblasCtrmvStridedBatched")
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

  
    function hipblasZtrmvStridedBatched(handle,uplo,transA,diag,m,A,lda,stride_a,x,incx,stride_x,batch_count) bind(c, name="hipblasZtrmvStridedBatched")
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

  
    function hipblasStrsv(handle,uplo,transA,diag,m,A,lda,x,incx) bind(c, name="hipblasStrsv")
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

  
    function hipblasDtrsv(handle,uplo,transA,diag,m,A,lda,x,incx) bind(c, name="hipblasDtrsv")
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

  
    function hipblasCtrsv(handle,uplo,transA,diag,m,A,lda,x,incx) bind(c, name="hipblasCtrsv")
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

  
    function hipblasZtrsv(handle,uplo,transA,diag,m,A,lda,x,incx) bind(c, name="hipblasZtrsv")
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

  
    function hipblasStrsvBatched(handle,uplo,transA,diag,m,A,lda,x,incx,batch_count) bind(c, name="hipblasStrsvBatched")
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

  
    function hipblasDtrsvBatched(handle,uplo,transA,diag,m,A,lda,x,incx,batch_count) bind(c, name="hipblasDtrsvBatched")
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

  
    function hipblasCtrsvBatched(handle,uplo,transA,diag,m,A,lda,x,incx,batch_count) bind(c, name="hipblasCtrsvBatched")
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

  
    function hipblasZtrsvBatched(handle,uplo,transA,diag,m,A,lda,x,incx,batch_count) bind(c, name="hipblasZtrsvBatched")
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

  
    function hipblasStrsvStridedBatched(handle,uplo,transA,diag,m,A,lda,strideA,x,incx,stridex,batch_count) bind(c, name="hipblasStrsvStridedBatched")
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

  
    function hipblasDtrsvStridedBatched(handle,uplo,transA,diag,m,A,lda,strideA,x,incx,stridex,batch_count) bind(c, name="hipblasDtrsvStridedBatched")
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

  
    function hipblasCtrsvStridedBatched(handle,uplo,transA,diag,m,A,lda,strideA,x,incx,stridex,batch_count) bind(c, name="hipblasCtrsvStridedBatched")
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

  
    function hipblasZtrsvStridedBatched(handle,uplo,transA,diag,m,A,lda,strideA,x,incx,stridex,batch_count) bind(c, name="hipblasZtrsvStridedBatched")
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

  
    function hipblasCherk(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc) bind(c, name="hipblasCherk")
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

  
    function hipblasZherk(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc) bind(c, name="hipblasZherk")
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

  
    function hipblasCherkBatched(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc,batchCount) bind(c, name="hipblasCherkBatched")
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

  
    function hipblasZherkBatched(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc,batchCount) bind(c, name="hipblasZherkBatched")
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

  
    function hipblasCherkStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,beta,C,ldc,strideC,batchCount) bind(c, name="hipblasCherkStridedBatched")
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

  
    function hipblasZherkStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,beta,C,ldc,strideC,batchCount) bind(c, name="hipblasZherkStridedBatched")
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

  
    function hipblasCherkx(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="hipblasCherkx")
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

  
    function hipblasZherkx(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="hipblasZherkx")
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

  
    function hipblasCherkxBatched(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="hipblasCherkxBatched")
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

  
    function hipblasZherkxBatched(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="hipblasZherkxBatched")
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

  
    function hipblasCherkxStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,B,ldb,strideB,beta,C,ldc,strideC,batchCount) bind(c, name="hipblasCherkxStridedBatched")
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

  
    function hipblasZherkxStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,B,ldb,strideB,beta,C,ldc,strideC,batchCount) bind(c, name="hipblasZherkxStridedBatched")
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

  
    function hipblasCher2k(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="hipblasCher2k")
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

  
    function hipblasZher2k(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="hipblasZher2k")
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

  
    function hipblasCher2kBatched(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="hipblasCher2kBatched")
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

  
    function hipblasZher2kBatched(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="hipblasZher2kBatched")
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

  
    function hipblasCher2kStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,B,ldb,strideB,beta,C,ldc,strideC,batchCount) bind(c, name="hipblasCher2kStridedBatched")
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

  
    function hipblasZher2kStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,B,ldb,strideB,beta,C,ldc,strideC,batchCount) bind(c, name="hipblasZher2kStridedBatched")
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

  
    function hipblasSsyrk(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc) bind(c, name="hipblasSsyrk")
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

  
    function hipblasDsyrk(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc) bind(c, name="hipblasDsyrk")
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

  
    function hipblasCsyrk(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc) bind(c, name="hipblasCsyrk")
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

  
    function hipblasZsyrk(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc) bind(c, name="hipblasZsyrk")
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

  
    function hipblasSsyrkBatched(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc,batchCount) bind(c, name="hipblasSsyrkBatched")
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

  
    function hipblasDsyrkBatched(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc,batchCount) bind(c, name="hipblasDsyrkBatched")
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

  
    function hipblasCsyrkBatched(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc,batchCount) bind(c, name="hipblasCsyrkBatched")
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

  
    function hipblasZsyrkBatched(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc,batchCount) bind(c, name="hipblasZsyrkBatched")
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

  
    function hipblasSsyrkStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,beta,C,ldc,strideC,batchCount) bind(c, name="hipblasSsyrkStridedBatched")
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

  
    function hipblasDsyrkStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,beta,C,ldc,strideC,batchCount) bind(c, name="hipblasDsyrkStridedBatched")
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

  
    function hipblasCsyrkStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,beta,C,ldc,strideC,batchCount) bind(c, name="hipblasCsyrkStridedBatched")
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

  
    function hipblasZsyrkStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,beta,C,ldc,strideC,batchCount) bind(c, name="hipblasZsyrkStridedBatched")
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

  
    function hipblasSsyr2k(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="hipblasSsyr2k")
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

  
    function hipblasDsyr2k(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="hipblasDsyr2k")
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

  
    function hipblasCsyr2k(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="hipblasCsyr2k")
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

  
    function hipblasZsyr2k(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="hipblasZsyr2k")
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

  
    function hipblasSsyr2kBatched(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="hipblasSsyr2kBatched")
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

  
    function hipblasDsyr2kBatched(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="hipblasDsyr2kBatched")
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

  
    function hipblasCsyr2kBatched(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="hipblasCsyr2kBatched")
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

  
    function hipblasZsyr2kBatched(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="hipblasZsyr2kBatched")
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

  
    function hipblasSsyr2kStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,B,ldb,strideB,beta,C,ldc,strideC,batchCount) bind(c, name="hipblasSsyr2kStridedBatched")
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

  
    function hipblasDsyr2kStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,B,ldb,strideB,beta,C,ldc,strideC,batchCount) bind(c, name="hipblasDsyr2kStridedBatched")
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

  
    function hipblasCsyr2kStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,B,ldb,strideB,beta,C,ldc,strideC,batchCount) bind(c, name="hipblasCsyr2kStridedBatched")
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

  
    function hipblasZsyr2kStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,B,ldb,strideB,beta,C,ldc,strideC,batchCount) bind(c, name="hipblasZsyr2kStridedBatched")
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

  
    function hipblasSsyrkx(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="hipblasSsyrkx")
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

  
    function hipblasDsyrkx(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="hipblasDsyrkx")
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

  
    function hipblasCsyrkx(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="hipblasCsyrkx")
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

  
    function hipblasZsyrkx(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="hipblasZsyrkx")
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

  
    function hipblasSsyrkxBatched(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="hipblasSsyrkxBatched")
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

  
    function hipblasDsyrkxBatched(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="hipblasDsyrkxBatched")
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

  
    function hipblasCsyrkxBatched(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="hipblasCsyrkxBatched")
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

  
    function hipblasZsyrkxBatched(handle,uplo,transA,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="hipblasZsyrkxBatched")
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

  
    function hipblasSsyrkxStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,B,ldb,strideB,beta,C,ldc,stridec,batchCount) bind(c, name="hipblasSsyrkxStridedBatched")
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

  
    function hipblasDsyrkxStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,B,ldb,strideB,beta,C,ldc,stridec,batchCount) bind(c, name="hipblasDsyrkxStridedBatched")
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

  
    function hipblasCsyrkxStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,B,ldb,strideB,beta,C,ldc,stridec,batchCount) bind(c, name="hipblasCsyrkxStridedBatched")
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

  
    function hipblasZsyrkxStridedBatched(handle,uplo,transA,n,k,alpha,A,lda,strideA,B,ldb,strideB,beta,C,ldc,stridec,batchCount) bind(c, name="hipblasZsyrkxStridedBatched")
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

  
    function hipblasStrmm(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb) bind(c, name="hipblasStrmm")
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

  
    function hipblasDtrmm(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb) bind(c, name="hipblasDtrmm")
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

  
    function hipblasCtrmm(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb) bind(c, name="hipblasCtrmm")
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

  
    function hipblasZtrmm(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb) bind(c, name="hipblasZtrmm")
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

  
    function hipblasStrmmBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb,batchCount) bind(c, name="hipblasStrmmBatched")
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

  
    function hipblasDtrmmBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb,batchCount) bind(c, name="hipblasDtrmmBatched")
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

  
    function hipblasCtrmmBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb,batchCount) bind(c, name="hipblasCtrmmBatched")
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

  
    function hipblasZtrmmBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb,batchCount) bind(c, name="hipblasZtrmmBatched")
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

  
    function hipblasStrmmStridedBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,strideA,B,ldb,strideB,batchCount) bind(c, name="hipblasStrmmStridedBatched")
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

  
    function hipblasDtrmmStridedBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,strideA,B,ldb,strideB,batchCount) bind(c, name="hipblasDtrmmStridedBatched")
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

  
    function hipblasCtrmmStridedBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,strideA,B,ldb,strideB,batchCount) bind(c, name="hipblasCtrmmStridedBatched")
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

  
    function hipblasZtrmmStridedBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,strideA,B,ldb,strideB,batchCount) bind(c, name="hipblasZtrmmStridedBatched")
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

  
    function hipblasStrsm(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb) bind(c, name="hipblasStrsm")
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

  
    function hipblasDtrsm(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb) bind(c, name="hipblasDtrsm")
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

  
    function hipblasCtrsm(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb) bind(c, name="hipblasCtrsm")
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

  
    function hipblasZtrsm(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb) bind(c, name="hipblasZtrsm")
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

  
    function hipblasStrsmBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb,batch_count) bind(c, name="hipblasStrsmBatched")
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

  
    function hipblasDtrsmBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb,batch_count) bind(c, name="hipblasDtrsmBatched")
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

  
    function hipblasCtrsmBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb,batch_count) bind(c, name="hipblasCtrsmBatched")
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

  
    function hipblasZtrsmBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb,batch_count) bind(c, name="hipblasZtrsmBatched")
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

  
    function hipblasStrsmStridedBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,strideA,B,ldb,strideB,batch_count) bind(c, name="hipblasStrsmStridedBatched")
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

  
    function hipblasDtrsmStridedBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,strideA,B,ldb,strideB,batch_count) bind(c, name="hipblasDtrsmStridedBatched")
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

  
    function hipblasCtrsmStridedBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,strideA,B,ldb,strideB,batch_count) bind(c, name="hipblasCtrsmStridedBatched")
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

  
    function hipblasZtrsmStridedBatched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,strideA,B,ldb,strideB,batch_count) bind(c, name="hipblasZtrsmStridedBatched")
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

  
    function hipblasSgetrf(handle,n,A,lda,ipiv,info) bind(c, name="hipblasSgetrf")
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSgetrf
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: info
    end function

  
    function hipblasDgetrf(handle,n,A,lda,ipiv,info) bind(c, name="hipblasDgetrf")
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDgetrf
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: info
    end function

  
    function hipblasCgetrf(handle,n,A,lda,ipiv,info) bind(c, name="hipblasCgetrf")
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCgetrf
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: info
    end function

  
    function hipblasZgetrf(handle,n,A,lda,ipiv,info) bind(c, name="hipblasZgetrf")
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZgetrf
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: info
    end function

  
    function hipblasSgetrfBatched(handle,n,A,lda,ipiv,info,batch_count) bind(c, name="hipblasSgetrfBatched")
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasSgetrfBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function hipblasDgetrfBatched(handle,n,A,lda,ipiv,info,batch_count) bind(c, name="hipblasDgetrfBatched")
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasDgetrfBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function hipblasCgetrfBatched(handle,n,A,lda,ipiv,info,batch_count) bind(c, name="hipblasCgetrfBatched")
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasCgetrfBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function hipblasZgetrfBatched(handle,n,A,lda,ipiv,info,batch_count) bind(c, name="hipblasZgetrfBatched")
      use iso_c_binding
      use hipfort_hipblas_enums
      implicit none
      integer(kind(HIPBLAS_STATUS_SUCCESS)) :: hipblasZgetrfBatched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function hipblasSgetrfStridedBatched(handle,n,A,lda,strideA,ipiv,strideP,info,batch_count) bind(c, name="hipblasSgetrfStridedBatched")
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
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function hipblasDgetrfStridedBatched(handle,n,A,lda,strideA,ipiv,strideP,info,batch_count) bind(c, name="hipblasDgetrfStridedBatched")
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
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function hipblasCgetrfStridedBatched(handle,n,A,lda,strideA,ipiv,strideP,info,batch_count) bind(c, name="hipblasCgetrfStridedBatched")
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
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function hipblasZgetrfStridedBatched(handle,n,A,lda,strideA,ipiv,strideP,info,batch_count) bind(c, name="hipblasZgetrfStridedBatched")
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
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function hipblasSgetrs(handle,trans,n,nrhs,A,lda,ipiv,B,ldb,info) bind(c, name="hipblasSgetrs")
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
      type(c_ptr),value :: info
    end function

  
    function hipblasDgetrs(handle,trans,n,nrhs,A,lda,ipiv,B,ldb,info) bind(c, name="hipblasDgetrs")
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
      type(c_ptr),value :: info
    end function

  
    function hipblasCgetrs(handle,trans,n,nrhs,A,lda,ipiv,B,ldb,info) bind(c, name="hipblasCgetrs")
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
      type(c_ptr),value :: info
    end function

  
    function hipblasZgetrs(handle,trans,n,nrhs,A,lda,ipiv,B,ldb,info) bind(c, name="hipblasZgetrs")
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
      type(c_ptr),value :: info
    end function

  
    function hipblasSgetrsBatched(handle,trans,n,nrhs,A,lda,ipiv,B,ldb,info,batch_count) bind(c, name="hipblasSgetrsBatched")
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
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function hipblasDgetrsBatched(handle,trans,n,nrhs,A,lda,ipiv,B,ldb,info,batch_count) bind(c, name="hipblasDgetrsBatched")
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
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function hipblasCgetrsBatched(handle,trans,n,nrhs,A,lda,ipiv,B,ldb,info,batch_count) bind(c, name="hipblasCgetrsBatched")
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
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function hipblasZgetrsBatched(handle,trans,n,nrhs,A,lda,ipiv,B,ldb,info,batch_count) bind(c, name="hipblasZgetrsBatched")
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
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function hipblasSgetrsStridedBatched(handle,trans,n,nrhs,A,lda,strideA,ipiv,strideP,B,ldb,strideB,info,batch_count) bind(c, name="hipblasSgetrsStridedBatched")
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
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function hipblasDgetrsStridedBatched(handle,trans,n,nrhs,A,lda,strideA,ipiv,strideP,B,ldb,strideB,info,batch_count) bind(c, name="hipblasDgetrsStridedBatched")
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
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function hipblasCgetrsStridedBatched(handle,trans,n,nrhs,A,lda,strideA,ipiv,strideP,B,ldb,strideB,info,batch_count) bind(c, name="hipblasCgetrsStridedBatched")
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
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function hipblasZgetrsStridedBatched(handle,trans,n,nrhs,A,lda,strideA,ipiv,strideP,B,ldb,strideB,info,batch_count) bind(c, name="hipblasZgetrsStridedBatched")
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
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function hipblasSgeqrf(handle,m,n,A,lda,ipiv,info) bind(c, name="hipblasSgeqrf")
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
      type(c_ptr),value :: info
    end function

  
    function hipblasDgeqrf(handle,m,n,A,lda,ipiv,info) bind(c, name="hipblasDgeqrf")
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
      type(c_ptr),value :: info
    end function

  
    function hipblasCgeqrf(handle,m,n,A,lda,ipiv,info) bind(c, name="hipblasCgeqrf")
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
      type(c_ptr),value :: info
    end function

  
    function hipblasZgeqrf(handle,m,n,A,lda,ipiv,info) bind(c, name="hipblasZgeqrf")
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
      type(c_ptr),value :: info
    end function

  
    function hipblasSgeqrfBatched(handle,m,n,A,lda,ipiv,info,batch_count) bind(c, name="hipblasSgeqrfBatched")
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
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function hipblasDgeqrfBatched(handle,m,n,A,lda,ipiv,info,batch_count) bind(c, name="hipblasDgeqrfBatched")
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
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function hipblasCgeqrfBatched(handle,m,n,A,lda,ipiv,info,batch_count) bind(c, name="hipblasCgeqrfBatched")
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
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function hipblasZgeqrfBatched(handle,m,n,A,lda,ipiv,info,batch_count) bind(c, name="hipblasZgeqrfBatched")
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
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function hipblasSgeqrfStridedBatched(handle,m,n,A,lda,strideA,ipiv,strideP,info,batch_count) bind(c, name="hipblasSgeqrfStridedBatched")
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
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function hipblasDgeqrfStridedBatched(handle,m,n,A,lda,strideA,ipiv,strideP,info,batch_count) bind(c, name="hipblasDgeqrfStridedBatched")
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
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function hipblasCgeqrfStridedBatched(handle,m,n,A,lda,strideA,ipiv,strideP,info,batch_count) bind(c, name="hipblasCgeqrfStridedBatched")
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
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function hipblasZgeqrfStridedBatched(handle,m,n,A,lda,strideA,ipiv,strideP,info,batch_count) bind(c, name="hipblasZgeqrfStridedBatched")
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
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function hipblasSgemm(handle,transa,transb,m,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="hipblasSgemm")
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

  
    function hipblasDgemm(handle,transa,transb,m,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="hipblasDgemm")
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

  
    function hipblasCgemm(handle,transa,transb,m,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="hipblasCgemm")
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

  
    function hipblasZgemm(handle,transa,transb,m,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="hipblasZgemm")
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

  
    function hipblasSgemmBatched(handle,transa,transb,m,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="hipblasSgemmBatched")
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

  
    function hipblasDgemmBatched(handle,transa,transb,m,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="hipblasDgemmBatched")
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

  
    function hipblasCgemmBatched(handle,transa,transb,m,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="hipblasCgemmBatched")
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

  
    function hipblasZgemmBatched(handle,transa,transb,m,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batchCount) bind(c, name="hipblasZgemmBatched")
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

  
    function hipblasSgemmStridedBatched(handle,transa,transb,m,n,k,alpha,A,lda,bsa,B,ldb,bsb,beta,C,ldc,bsc,batchCount) bind(c, name="hipblasSgemmStridedBatched")
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

  
    function hipblasDgemmStridedBatched(handle,transa,transb,m,n,k,alpha,A,lda,bsa,B,ldb,bsb,beta,C,ldc,bsc,batchCount) bind(c, name="hipblasDgemmStridedBatched")
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

  
    function hipblasCgemmStridedBatched(handle,transa,transb,m,n,k,alpha,A,lda,bsa,B,ldb,bsb,beta,C,ldc,bsc,batchCount) bind(c, name="hipblasCgemmStridedBatched")
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

  
    function hipblasZgemmStridedBatched(handle,transa,transb,m,n,k,alpha,A,lda,bsa,B,ldb,bsb,beta,C,ldc,bsc,batchCount) bind(c, name="hipblasZgemmStridedBatched")
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
