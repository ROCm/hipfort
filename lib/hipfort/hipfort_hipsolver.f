!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! ==============================================================================
! hipfort: FORTRAN Interfaces for GPU kernels
! ==============================================================================
! Copyright (c) 2021 Advanced Micro Devices, Inc. All rights reserved.
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

 
  
  interface hipsolverCreate
#ifdef USE_CUDA_NAMES
    function hipsolverCreate_raw(handle) bind(c, name="cusolverCreate")
#else
    function hipsolverCreate_raw(handle) bind(c, name="hipsolverCreate")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCreate_raw
      type(c_ptr) :: handle
    end function


  end interface
  
  interface hipsolverDestroy
#ifdef USE_CUDA_NAMES
    function hipsolverDestroy_raw(handle) bind(c, name="cusolverDestroy")
#else
    function hipsolverDestroy_raw(handle) bind(c, name="hipsolverDestroy")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDestroy_raw
      type(c_ptr),value :: handle
    end function


  end interface
  
  interface hipsolverSetStream
#ifdef USE_CUDA_NAMES
    function hipsolverSetStream_raw(handle,streamId) bind(c, name="cusolverSetStream")
#else
    function hipsolverSetStream_raw(handle,streamId) bind(c, name="hipsolverSetStream")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSetStream_raw
      type(c_ptr),value :: handle
      type(c_ptr),value :: streamId
    end function


  end interface
  
  interface hipsolverGetStream
#ifdef USE_CUDA_NAMES
    function hipsolverGetStream_raw(handle,streamId) bind(c, name="cusolverGetStream")
#else
    function hipsolverGetStream_raw(handle,streamId) bind(c, name="hipsolverGetStream")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverGetStream_raw
      type(c_ptr),value :: handle
      type(c_ptr) :: streamId
    end function


  end interface
  
  interface hipsolverSorgbr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverSorgbr_bufferSize_raw(handle,side,m,n,k,A,lda,tau,lwork) bind(c, name="cusolverSorgbr_bufferSize")
#else
    function hipsolverSorgbr_bufferSize_raw(handle,side,m,n,k,A,lda,tau,lwork) bind(c, name="hipsolverSorgbr_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgbr_bufferSize_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float) :: tau
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverSorgbr_bufferSize_full_rank,&
      
hipsolverSorgbr_bufferSize_rank_0,&
      
hipsolverSorgbr_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverDorgbr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDorgbr_bufferSize_raw(handle,side,m,n,k,A,lda,tau,lwork) bind(c, name="cusolverDorgbr_bufferSize")
#else
    function hipsolverDorgbr_bufferSize_raw(handle,side,m,n,k,A,lda,tau,lwork) bind(c, name="hipsolverDorgbr_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgbr_bufferSize_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double) :: tau
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDorgbr_bufferSize_full_rank,&
      
hipsolverDorgbr_bufferSize_rank_0,&
      
hipsolverDorgbr_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverCungbr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverCungbr_bufferSize_raw(handle,side,m,n,k,A,lda,tau,lwork) bind(c, name="cusolverCungbr_bufferSize")
#else
    function hipsolverCungbr_bufferSize_raw(handle,side,m,n,k,A,lda,tau,lwork) bind(c, name="hipsolverCungbr_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungbr_bufferSize_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_float_complex) :: tau
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverCungbr_bufferSize_full_rank,&
      
hipsolverCungbr_bufferSize_rank_0,&
      
hipsolverCungbr_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverZungbr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverZungbr_bufferSize_raw(handle,side,m,n,k,A,lda,tau,lwork) bind(c, name="cusolverZungbr_bufferSize")
#else
    function hipsolverZungbr_bufferSize_raw(handle,side,m,n,k,A,lda,tau,lwork) bind(c, name="hipsolverZungbr_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungbr_bufferSize_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_SIDE_LEFT)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_double_complex) :: tau
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverZungbr_bufferSize_full_rank,&
      
hipsolverZungbr_bufferSize_rank_0,&
      
hipsolverZungbr_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverSorgbr
#ifdef USE_CUDA_NAMES
    function hipsolverSorgbr_raw(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo) bind(c, name="cusolverSorgbr")
#else
    function hipsolverSorgbr_raw(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo) bind(c, name="hipsolverSorgbr")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgbr_raw
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
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverSorgbr_full_rank,&
      
hipsolverSorgbr_rank_0,&
      
hipsolverSorgbr_rank_1
#endif

  end interface
  
  interface hipsolverDorgbr
#ifdef USE_CUDA_NAMES
    function hipsolverDorgbr_raw(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo) bind(c, name="cusolverDorgbr")
#else
    function hipsolverDorgbr_raw(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo) bind(c, name="hipsolverDorgbr")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgbr_raw
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
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDorgbr_full_rank,&
      
hipsolverDorgbr_rank_0,&
      
hipsolverDorgbr_rank_1
#endif

  end interface
  
  interface hipsolverCungbr
#ifdef USE_CUDA_NAMES
    function hipsolverCungbr_raw(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo) bind(c, name="cusolverCungbr")
#else
    function hipsolverCungbr_raw(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo) bind(c, name="hipsolverCungbr")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungbr_raw
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
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverCungbr_full_rank,&
      
hipsolverCungbr_rank_0,&
      
hipsolverCungbr_rank_1
#endif

  end interface
  
  interface hipsolverZungbr
#ifdef USE_CUDA_NAMES
    function hipsolverZungbr_raw(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo) bind(c, name="cusolverZungbr")
#else
    function hipsolverZungbr_raw(handle,side,m,n,k,A,lda,tau,work,lwork,devInfo) bind(c, name="hipsolverZungbr")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungbr_raw
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
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverZungbr_full_rank,&
      
hipsolverZungbr_rank_0,&
      
hipsolverZungbr_rank_1
#endif

  end interface
  
  interface hipsolverSorgqr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverSorgqr_bufferSize_raw(handle,m,n,k,A,lda,tau,lwork) bind(c, name="cusolverSorgqr_bufferSize")
#else
    function hipsolverSorgqr_bufferSize_raw(handle,m,n,k,A,lda,tau,lwork) bind(c, name="hipsolverSorgqr_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgqr_bufferSize_raw
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float) :: tau
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverSorgqr_bufferSize_full_rank,&
      
hipsolverSorgqr_bufferSize_rank_0,&
      
hipsolverSorgqr_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverDorgqr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDorgqr_bufferSize_raw(handle,m,n,k,A,lda,tau,lwork) bind(c, name="cusolverDorgqr_bufferSize")
#else
    function hipsolverDorgqr_bufferSize_raw(handle,m,n,k,A,lda,tau,lwork) bind(c, name="hipsolverDorgqr_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgqr_bufferSize_raw
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double) :: tau
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDorgqr_bufferSize_full_rank,&
      
hipsolverDorgqr_bufferSize_rank_0,&
      
hipsolverDorgqr_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverCungqr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverCungqr_bufferSize_raw(handle,m,n,k,A,lda,tau,lwork) bind(c, name="cusolverCungqr_bufferSize")
#else
    function hipsolverCungqr_bufferSize_raw(handle,m,n,k,A,lda,tau,lwork) bind(c, name="hipsolverCungqr_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungqr_bufferSize_raw
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_float_complex) :: tau
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverCungqr_bufferSize_full_rank,&
      
hipsolverCungqr_bufferSize_rank_0,&
      
hipsolverCungqr_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverZungqr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverZungqr_bufferSize_raw(handle,m,n,k,A,lda,tau,lwork) bind(c, name="cusolverZungqr_bufferSize")
#else
    function hipsolverZungqr_bufferSize_raw(handle,m,n,k,A,lda,tau,lwork) bind(c, name="hipsolverZungqr_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungqr_bufferSize_raw
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_double_complex) :: tau
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverZungqr_bufferSize_full_rank,&
      
hipsolverZungqr_bufferSize_rank_0,&
      
hipsolverZungqr_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverSorgqr
#ifdef USE_CUDA_NAMES
    function hipsolverSorgqr_raw(handle,m,n,k,A,lda,tau,work,lwork,devInfo) bind(c, name="cusolverSorgqr")
#else
    function hipsolverSorgqr_raw(handle,m,n,k,A,lda,tau,work,lwork,devInfo) bind(c, name="hipsolverSorgqr")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgqr_raw
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverSorgqr_full_rank,&
      
hipsolverSorgqr_rank_0,&
      
hipsolverSorgqr_rank_1
#endif

  end interface
  
  interface hipsolverDorgqr
#ifdef USE_CUDA_NAMES
    function hipsolverDorgqr_raw(handle,m,n,k,A,lda,tau,work,lwork,devInfo) bind(c, name="cusolverDorgqr")
#else
    function hipsolverDorgqr_raw(handle,m,n,k,A,lda,tau,work,lwork,devInfo) bind(c, name="hipsolverDorgqr")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgqr_raw
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDorgqr_full_rank,&
      
hipsolverDorgqr_rank_0,&
      
hipsolverDorgqr_rank_1
#endif

  end interface
  
  interface hipsolverCungqr
#ifdef USE_CUDA_NAMES
    function hipsolverCungqr_raw(handle,m,n,k,A,lda,tau,work,lwork,devInfo) bind(c, name="cusolverCungqr")
#else
    function hipsolverCungqr_raw(handle,m,n,k,A,lda,tau,work,lwork,devInfo) bind(c, name="hipsolverCungqr")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungqr_raw
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_float_complex) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverCungqr_full_rank,&
      
hipsolverCungqr_rank_0,&
      
hipsolverCungqr_rank_1
#endif

  end interface
  
  interface hipsolverZungqr
#ifdef USE_CUDA_NAMES
    function hipsolverZungqr_raw(handle,m,n,k,A,lda,tau,work,lwork,devInfo) bind(c, name="cusolverZungqr")
#else
    function hipsolverZungqr_raw(handle,m,n,k,A,lda,tau,work,lwork,devInfo) bind(c, name="hipsolverZungqr")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungqr_raw
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_double_complex) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverZungqr_full_rank,&
      
hipsolverZungqr_rank_0,&
      
hipsolverZungqr_rank_1
#endif

  end interface
  
  interface hipsolverSorgtr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverSorgtr_bufferSize_raw(handle,uplo,n,A,lda,tau,lwork) bind(c, name="cusolverSorgtr_bufferSize")
#else
    function hipsolverSorgtr_bufferSize_raw(handle,uplo,n,A,lda,tau,lwork) bind(c, name="hipsolverSorgtr_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgtr_bufferSize_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float) :: tau
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverSorgtr_bufferSize_full_rank,&
      
hipsolverSorgtr_bufferSize_rank_0,&
      
hipsolverSorgtr_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverDorgtr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDorgtr_bufferSize_raw(handle,uplo,n,A,lda,tau,lwork) bind(c, name="cusolverDorgtr_bufferSize")
#else
    function hipsolverDorgtr_bufferSize_raw(handle,uplo,n,A,lda,tau,lwork) bind(c, name="hipsolverDorgtr_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgtr_bufferSize_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double) :: tau
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDorgtr_bufferSize_full_rank,&
      
hipsolverDorgtr_bufferSize_rank_0,&
      
hipsolverDorgtr_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverCungtr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverCungtr_bufferSize_raw(handle,uplo,n,A,lda,tau,lwork) bind(c, name="cusolverCungtr_bufferSize")
#else
    function hipsolverCungtr_bufferSize_raw(handle,uplo,n,A,lda,tau,lwork) bind(c, name="hipsolverCungtr_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungtr_bufferSize_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_float_complex) :: tau
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverCungtr_bufferSize_full_rank,&
      
hipsolverCungtr_bufferSize_rank_0,&
      
hipsolverCungtr_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverZungtr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverZungtr_bufferSize_raw(handle,uplo,n,A,lda,tau,lwork) bind(c, name="cusolverZungtr_bufferSize")
#else
    function hipsolverZungtr_bufferSize_raw(handle,uplo,n,A,lda,tau,lwork) bind(c, name="hipsolverZungtr_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungtr_bufferSize_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_double_complex) :: tau
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverZungtr_bufferSize_full_rank,&
      
hipsolverZungtr_bufferSize_rank_0,&
      
hipsolverZungtr_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverSorgtr
#ifdef USE_CUDA_NAMES
    function hipsolverSorgtr_raw(handle,uplo,n,A,lda,tau,work,lwork,devInfo) bind(c, name="cusolverSorgtr")
#else
    function hipsolverSorgtr_raw(handle,uplo,n,A,lda,tau,work,lwork,devInfo) bind(c, name="hipsolverSorgtr")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSorgtr_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverSorgtr_full_rank,&
      
hipsolverSorgtr_rank_0,&
      
hipsolverSorgtr_rank_1
#endif

  end interface
  
  interface hipsolverDorgtr
#ifdef USE_CUDA_NAMES
    function hipsolverDorgtr_raw(handle,uplo,n,A,lda,tau,work,lwork,devInfo) bind(c, name="cusolverDorgtr")
#else
    function hipsolverDorgtr_raw(handle,uplo,n,A,lda,tau,work,lwork,devInfo) bind(c, name="hipsolverDorgtr")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDorgtr_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDorgtr_full_rank,&
      
hipsolverDorgtr_rank_0,&
      
hipsolverDorgtr_rank_1
#endif

  end interface
  
  interface hipsolverCungtr
#ifdef USE_CUDA_NAMES
    function hipsolverCungtr_raw(handle,uplo,n,A,lda,tau,work,lwork,devInfo) bind(c, name="cusolverCungtr")
#else
    function hipsolverCungtr_raw(handle,uplo,n,A,lda,tau,work,lwork,devInfo) bind(c, name="hipsolverCungtr")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCungtr_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_float_complex) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverCungtr_full_rank,&
      
hipsolverCungtr_rank_0,&
      
hipsolverCungtr_rank_1
#endif

  end interface
  
  interface hipsolverZungtr
#ifdef USE_CUDA_NAMES
    function hipsolverZungtr_raw(handle,uplo,n,A,lda,tau,work,lwork,devInfo) bind(c, name="cusolverZungtr")
#else
    function hipsolverZungtr_raw(handle,uplo,n,A,lda,tau,work,lwork,devInfo) bind(c, name="hipsolverZungtr")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZungtr_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_double_complex) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverZungtr_full_rank,&
      
hipsolverZungtr_rank_0,&
      
hipsolverZungtr_rank_1
#endif

  end interface
  
  interface hipsolverSormqr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverSormqr_bufferSize_raw(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork) bind(c, name="cusolverSormqr_bufferSize")
#else
    function hipsolverSormqr_bufferSize_raw(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork) bind(c, name="hipsolverSormqr_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormqr_bufferSize_raw
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
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverSormqr_bufferSize_full_rank,&
      
hipsolverSormqr_bufferSize_rank_0,&
      
hipsolverSormqr_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverDormqr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDormqr_bufferSize_raw(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork) bind(c, name="cusolverDormqr_bufferSize")
#else
    function hipsolverDormqr_bufferSize_raw(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork) bind(c, name="hipsolverDormqr_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormqr_bufferSize_raw
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
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDormqr_bufferSize_full_rank,&
      
hipsolverDormqr_bufferSize_rank_0,&
      
hipsolverDormqr_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverCunmqr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverCunmqr_bufferSize_raw(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork) bind(c, name="cusolverCunmqr_bufferSize")
#else
    function hipsolverCunmqr_bufferSize_raw(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork) bind(c, name="hipsolverCunmqr_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmqr_bufferSize_raw
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
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverCunmqr_bufferSize_full_rank,&
      
hipsolverCunmqr_bufferSize_rank_0,&
      
hipsolverCunmqr_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverZunmqr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverZunmqr_bufferSize_raw(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork) bind(c, name="cusolverZunmqr_bufferSize")
#else
    function hipsolverZunmqr_bufferSize_raw(handle,side,trans,m,n,k,A,lda,tau,C,ldc,lwork) bind(c, name="hipsolverZunmqr_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmqr_bufferSize_raw
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
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverZunmqr_bufferSize_full_rank,&
      
hipsolverZunmqr_bufferSize_rank_0,&
      
hipsolverZunmqr_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverSormqr
#ifdef USE_CUDA_NAMES
    function hipsolverSormqr_raw(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo) bind(c, name="cusolverSormqr")
#else
    function hipsolverSormqr_raw(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo) bind(c, name="hipsolverSormqr")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormqr_raw
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
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverSormqr_full_rank,&
      
hipsolverSormqr_rank_0,&
      
hipsolverSormqr_rank_1
#endif

  end interface
  
  interface hipsolverDormqr
#ifdef USE_CUDA_NAMES
    function hipsolverDormqr_raw(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo) bind(c, name="cusolverDormqr")
#else
    function hipsolverDormqr_raw(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo) bind(c, name="hipsolverDormqr")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormqr_raw
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
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDormqr_full_rank,&
      
hipsolverDormqr_rank_0,&
      
hipsolverDormqr_rank_1
#endif

  end interface
  
  interface hipsolverCunmqr
#ifdef USE_CUDA_NAMES
    function hipsolverCunmqr_raw(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo) bind(c, name="cusolverCunmqr")
#else
    function hipsolverCunmqr_raw(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo) bind(c, name="hipsolverCunmqr")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmqr_raw
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
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverCunmqr_full_rank,&
      
hipsolverCunmqr_rank_0,&
      
hipsolverCunmqr_rank_1
#endif

  end interface
  
  interface hipsolverZunmqr
#ifdef USE_CUDA_NAMES
    function hipsolverZunmqr_raw(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo) bind(c, name="cusolverZunmqr")
#else
    function hipsolverZunmqr_raw(handle,side,trans,m,n,k,A,lda,tau,C,ldc,work,lwork,devInfo) bind(c, name="hipsolverZunmqr")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmqr_raw
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
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverZunmqr_full_rank,&
      
hipsolverZunmqr_rank_0,&
      
hipsolverZunmqr_rank_1
#endif

  end interface
  
  interface hipsolverSormtr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverSormtr_bufferSize_raw(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork) bind(c, name="cusolverSormtr_bufferSize")
#else
    function hipsolverSormtr_bufferSize_raw(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork) bind(c, name="hipsolverSormtr_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormtr_bufferSize_raw
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
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverSormtr_bufferSize_full_rank,&
      
hipsolverSormtr_bufferSize_rank_0,&
      
hipsolverSormtr_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverDormtr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDormtr_bufferSize_raw(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork) bind(c, name="cusolverDormtr_bufferSize")
#else
    function hipsolverDormtr_bufferSize_raw(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork) bind(c, name="hipsolverDormtr_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormtr_bufferSize_raw
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
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDormtr_bufferSize_full_rank,&
      
hipsolverDormtr_bufferSize_rank_0,&
      
hipsolverDormtr_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverCunmtr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverCunmtr_bufferSize_raw(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork) bind(c, name="cusolverCunmtr_bufferSize")
#else
    function hipsolverCunmtr_bufferSize_raw(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork) bind(c, name="hipsolverCunmtr_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmtr_bufferSize_raw
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
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverCunmtr_bufferSize_full_rank,&
      
hipsolverCunmtr_bufferSize_rank_0,&
      
hipsolverCunmtr_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverZunmtr_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverZunmtr_bufferSize_raw(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork) bind(c, name="cusolverZunmtr_bufferSize")
#else
    function hipsolverZunmtr_bufferSize_raw(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,lwork) bind(c, name="hipsolverZunmtr_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmtr_bufferSize_raw
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
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverZunmtr_bufferSize_full_rank,&
      
hipsolverZunmtr_bufferSize_rank_0,&
      
hipsolverZunmtr_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverSormtr
#ifdef USE_CUDA_NAMES
    function hipsolverSormtr_raw(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo) bind(c, name="cusolverSormtr")
#else
    function hipsolverSormtr_raw(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo) bind(c, name="hipsolverSormtr")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSormtr_raw
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
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverSormtr_full_rank,&
      
hipsolverSormtr_rank_0,&
      
hipsolverSormtr_rank_1
#endif

  end interface
  
  interface hipsolverDormtr
#ifdef USE_CUDA_NAMES
    function hipsolverDormtr_raw(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo) bind(c, name="cusolverDormtr")
#else
    function hipsolverDormtr_raw(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo) bind(c, name="hipsolverDormtr")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDormtr_raw
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
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDormtr_full_rank,&
      
hipsolverDormtr_rank_0,&
      
hipsolverDormtr_rank_1
#endif

  end interface
  
  interface hipsolverCunmtr
#ifdef USE_CUDA_NAMES
    function hipsolverCunmtr_raw(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo) bind(c, name="cusolverCunmtr")
#else
    function hipsolverCunmtr_raw(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo) bind(c, name="hipsolverCunmtr")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCunmtr_raw
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
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverCunmtr_full_rank,&
      
hipsolverCunmtr_rank_0,&
      
hipsolverCunmtr_rank_1
#endif

  end interface
  
  interface hipsolverZunmtr
#ifdef USE_CUDA_NAMES
    function hipsolverZunmtr_raw(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo) bind(c, name="cusolverZunmtr")
#else
    function hipsolverZunmtr_raw(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo) bind(c, name="hipsolverZunmtr")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZunmtr_raw
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
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverZunmtr_full_rank,&
      
hipsolverZunmtr_rank_0,&
      
hipsolverZunmtr_rank_1
#endif

  end interface
  
  interface hipsolverSgebrd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverSgebrd_bufferSize_raw(handle,m,n,lwork) bind(c, name="cusolverSgebrd_bufferSize")
#else
    function hipsolverSgebrd_bufferSize_raw(handle,m,n,lwork) bind(c, name="hipsolverSgebrd_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgebrd_bufferSize_raw
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: lwork
    end function


  end interface
  
  interface hipsolverDgebrd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDgebrd_bufferSize_raw(handle,m,n,lwork) bind(c, name="cusolverDgebrd_bufferSize")
#else
    function hipsolverDgebrd_bufferSize_raw(handle,m,n,lwork) bind(c, name="hipsolverDgebrd_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgebrd_bufferSize_raw
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: lwork
    end function


  end interface
  
  interface hipsolverCgebrd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverCgebrd_bufferSize_raw(handle,m,n,lwork) bind(c, name="cusolverCgebrd_bufferSize")
#else
    function hipsolverCgebrd_bufferSize_raw(handle,m,n,lwork) bind(c, name="hipsolverCgebrd_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgebrd_bufferSize_raw
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: lwork
    end function


  end interface
  
  interface hipsolverZgebrd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverZgebrd_bufferSize_raw(handle,m,n,lwork) bind(c, name="cusolverZgebrd_bufferSize")
#else
    function hipsolverZgebrd_bufferSize_raw(handle,m,n,lwork) bind(c, name="hipsolverZgebrd_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgebrd_bufferSize_raw
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: lwork
    end function


  end interface
  
  interface hipsolverSgebrd
#ifdef USE_CUDA_NAMES
    function hipsolverSgebrd_raw(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo) bind(c, name="cusolverSgebrd")
#else
    function hipsolverSgebrd_raw(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo) bind(c, name="hipsolverSgebrd")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgebrd_raw
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
    module procedure hipsolverSgebrd_full_rank,&
      
hipsolverSgebrd_rank_0,&
      
hipsolverSgebrd_rank_1
#endif

  end interface
  
  interface hipsolverDgebrd
#ifdef USE_CUDA_NAMES
    function hipsolverDgebrd_raw(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo) bind(c, name="cusolverDgebrd")
#else
    function hipsolverDgebrd_raw(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo) bind(c, name="hipsolverDgebrd")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgebrd_raw
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
    module procedure hipsolverDgebrd_full_rank,&
      
hipsolverDgebrd_rank_0,&
      
hipsolverDgebrd_rank_1
#endif

  end interface
  
  interface hipsolverCgebrd
#ifdef USE_CUDA_NAMES
    function hipsolverCgebrd_raw(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo) bind(c, name="cusolverCgebrd")
#else
    function hipsolverCgebrd_raw(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo) bind(c, name="hipsolverCgebrd")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgebrd_raw
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
    module procedure hipsolverCgebrd_full_rank,&
      
hipsolverCgebrd_rank_0,&
      
hipsolverCgebrd_rank_1
#endif

  end interface
  
  interface hipsolverZgebrd
#ifdef USE_CUDA_NAMES
    function hipsolverZgebrd_raw(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo) bind(c, name="cusolverZgebrd")
#else
    function hipsolverZgebrd_raw(handle,m,n,A,lda,D,E,tauq,taup,work,lwork,devInfo) bind(c, name="hipsolverZgebrd")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgebrd_raw
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
    module procedure hipsolverZgebrd_full_rank,&
      
hipsolverZgebrd_rank_0,&
      
hipsolverZgebrd_rank_1
#endif

  end interface
  
  interface hipsolverSgeqrf_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverSgeqrf_bufferSize_raw(handle,m,n,A,lda,lwork) bind(c, name="cusolverSgeqrf_bufferSize")
#else
    function hipsolverSgeqrf_bufferSize_raw(handle,m,n,A,lda,lwork) bind(c, name="hipsolverSgeqrf_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgeqrf_bufferSize_raw
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverSgeqrf_bufferSize_full_rank,&
      
hipsolverSgeqrf_bufferSize_rank_0,&
      
hipsolverSgeqrf_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverDgeqrf_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDgeqrf_bufferSize_raw(handle,m,n,A,lda,lwork) bind(c, name="cusolverDgeqrf_bufferSize")
#else
    function hipsolverDgeqrf_bufferSize_raw(handle,m,n,A,lda,lwork) bind(c, name="hipsolverDgeqrf_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgeqrf_bufferSize_raw
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDgeqrf_bufferSize_full_rank,&
      
hipsolverDgeqrf_bufferSize_rank_0,&
      
hipsolverDgeqrf_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverCgeqrf_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverCgeqrf_bufferSize_raw(handle,m,n,A,lda,lwork) bind(c, name="cusolverCgeqrf_bufferSize")
#else
    function hipsolverCgeqrf_bufferSize_raw(handle,m,n,A,lda,lwork) bind(c, name="hipsolverCgeqrf_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgeqrf_bufferSize_raw
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverCgeqrf_bufferSize_full_rank,&
      
hipsolverCgeqrf_bufferSize_rank_0,&
      
hipsolverCgeqrf_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverZgeqrf_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverZgeqrf_bufferSize_raw(handle,m,n,A,lda,lwork) bind(c, name="cusolverZgeqrf_bufferSize")
#else
    function hipsolverZgeqrf_bufferSize_raw(handle,m,n,A,lda,lwork) bind(c, name="hipsolverZgeqrf_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgeqrf_bufferSize_raw
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverZgeqrf_bufferSize_full_rank,&
      
hipsolverZgeqrf_bufferSize_rank_0,&
      
hipsolverZgeqrf_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverSgeqrf
#ifdef USE_CUDA_NAMES
    function hipsolverSgeqrf_raw(handle,m,n,A,lda,tau,work,lwork,devInfo) bind(c, name="cusolverSgeqrf")
#else
    function hipsolverSgeqrf_raw(handle,m,n,A,lda,tau,work,lwork,devInfo) bind(c, name="hipsolverSgeqrf")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgeqrf_raw
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverSgeqrf_full_rank,&
      
hipsolverSgeqrf_rank_0,&
      
hipsolverSgeqrf_rank_1
#endif

  end interface
  
  interface hipsolverDgeqrf
#ifdef USE_CUDA_NAMES
    function hipsolverDgeqrf_raw(handle,m,n,A,lda,tau,work,lwork,devInfo) bind(c, name="cusolverDgeqrf")
#else
    function hipsolverDgeqrf_raw(handle,m,n,A,lda,tau,work,lwork,devInfo) bind(c, name="hipsolverDgeqrf")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgeqrf_raw
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDgeqrf_full_rank,&
      
hipsolverDgeqrf_rank_0,&
      
hipsolverDgeqrf_rank_1
#endif

  end interface
  
  interface hipsolverCgeqrf
#ifdef USE_CUDA_NAMES
    function hipsolverCgeqrf_raw(handle,m,n,A,lda,tau,work,lwork,devInfo) bind(c, name="cusolverCgeqrf")
#else
    function hipsolverCgeqrf_raw(handle,m,n,A,lda,tau,work,lwork,devInfo) bind(c, name="hipsolverCgeqrf")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgeqrf_raw
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_float_complex) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverCgeqrf_full_rank,&
      
hipsolverCgeqrf_rank_0,&
      
hipsolverCgeqrf_rank_1
#endif

  end interface
  
  interface hipsolverZgeqrf
#ifdef USE_CUDA_NAMES
    function hipsolverZgeqrf_raw(handle,m,n,A,lda,tau,work,lwork,devInfo) bind(c, name="cusolverZgeqrf")
#else
    function hipsolverZgeqrf_raw(handle,m,n,A,lda,tau,work,lwork,devInfo) bind(c, name="hipsolverZgeqrf")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgeqrf_raw
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_double_complex) :: tau
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverZgeqrf_full_rank,&
      
hipsolverZgeqrf_rank_0,&
      
hipsolverZgeqrf_rank_1
#endif

  end interface
  
  interface hipsolverSgetrf_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverSgetrf_bufferSize_raw(handle,m,n,A,lda,lwork) bind(c, name="cusolverSgetrf_bufferSize")
#else
    function hipsolverSgetrf_bufferSize_raw(handle,m,n,A,lda,lwork) bind(c, name="hipsolverSgetrf_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrf_bufferSize_raw
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverSgetrf_bufferSize_full_rank,&
      
hipsolverSgetrf_bufferSize_rank_0,&
      
hipsolverSgetrf_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverDgetrf_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDgetrf_bufferSize_raw(handle,m,n,A,lda,lwork) bind(c, name="cusolverDgetrf_bufferSize")
#else
    function hipsolverDgetrf_bufferSize_raw(handle,m,n,A,lda,lwork) bind(c, name="hipsolverDgetrf_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrf_bufferSize_raw
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDgetrf_bufferSize_full_rank,&
      
hipsolverDgetrf_bufferSize_rank_0,&
      
hipsolverDgetrf_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverCgetrf_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverCgetrf_bufferSize_raw(handle,m,n,A,lda,lwork) bind(c, name="cusolverCgetrf_bufferSize")
#else
    function hipsolverCgetrf_bufferSize_raw(handle,m,n,A,lda,lwork) bind(c, name="hipsolverCgetrf_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrf_bufferSize_raw
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverCgetrf_bufferSize_full_rank,&
      
hipsolverCgetrf_bufferSize_rank_0,&
      
hipsolverCgetrf_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverZgetrf_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverZgetrf_bufferSize_raw(handle,m,n,A,lda,lwork) bind(c, name="cusolverZgetrf_bufferSize")
#else
    function hipsolverZgetrf_bufferSize_raw(handle,m,n,A,lda,lwork) bind(c, name="hipsolverZgetrf_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrf_bufferSize_raw
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverZgetrf_bufferSize_full_rank,&
      
hipsolverZgetrf_bufferSize_rank_0,&
      
hipsolverZgetrf_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverSgetrf
#ifdef USE_CUDA_NAMES
    function hipsolverSgetrf_raw(handle,m,n,A,lda,work,lwork,devIpiv,devInfo) bind(c, name="cusolverSgetrf")
#else
    function hipsolverSgetrf_raw(handle,m,n,A,lda,work,lwork,devIpiv,devInfo) bind(c, name="hipsolverSgetrf")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrf_raw
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverSgetrf_full_rank,&
      
hipsolverSgetrf_rank_0,&
      
hipsolverSgetrf_rank_1
#endif

  end interface
  
  interface hipsolverDgetrf
#ifdef USE_CUDA_NAMES
    function hipsolverDgetrf_raw(handle,m,n,A,lda,work,lwork,devIpiv,devInfo) bind(c, name="cusolverDgetrf")
#else
    function hipsolverDgetrf_raw(handle,m,n,A,lda,work,lwork,devIpiv,devInfo) bind(c, name="hipsolverDgetrf")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrf_raw
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDgetrf_full_rank,&
      
hipsolverDgetrf_rank_0,&
      
hipsolverDgetrf_rank_1
#endif

  end interface
  
  interface hipsolverCgetrf
#ifdef USE_CUDA_NAMES
    function hipsolverCgetrf_raw(handle,m,n,A,lda,work,lwork,devIpiv,devInfo) bind(c, name="cusolverCgetrf")
#else
    function hipsolverCgetrf_raw(handle,m,n,A,lda,work,lwork,devIpiv,devInfo) bind(c, name="hipsolverCgetrf")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrf_raw
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverCgetrf_full_rank,&
      
hipsolverCgetrf_rank_0,&
      
hipsolverCgetrf_rank_1
#endif

  end interface
  
  interface hipsolverZgetrf
#ifdef USE_CUDA_NAMES
    function hipsolverZgetrf_raw(handle,m,n,A,lda,work,lwork,devIpiv,devInfo) bind(c, name="cusolverZgetrf")
#else
    function hipsolverZgetrf_raw(handle,m,n,A,lda,work,lwork,devIpiv,devInfo) bind(c, name="hipsolverZgetrf")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrf_raw
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverZgetrf_full_rank,&
      
hipsolverZgetrf_rank_0,&
      
hipsolverZgetrf_rank_1
#endif

  end interface
  
  interface hipsolverSgetrs_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverSgetrs_bufferSize_raw(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork) bind(c, name="cusolverSgetrs_bufferSize")
#else
    function hipsolverSgetrs_bufferSize_raw(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork) bind(c, name="hipsolverSgetrs_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrs_bufferSize_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverSgetrs_bufferSize_full_rank,&
      
hipsolverSgetrs_bufferSize_rank_0,&
      
hipsolverSgetrs_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverDgetrs_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDgetrs_bufferSize_raw(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork) bind(c, name="cusolverDgetrs_bufferSize")
#else
    function hipsolverDgetrs_bufferSize_raw(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork) bind(c, name="hipsolverDgetrs_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrs_bufferSize_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDgetrs_bufferSize_full_rank,&
      
hipsolverDgetrs_bufferSize_rank_0,&
      
hipsolverDgetrs_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverCgetrs_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverCgetrs_bufferSize_raw(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork) bind(c, name="cusolverCgetrs_bufferSize")
#else
    function hipsolverCgetrs_bufferSize_raw(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork) bind(c, name="hipsolverCgetrs_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrs_bufferSize_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverCgetrs_bufferSize_full_rank,&
      
hipsolverCgetrs_bufferSize_rank_0,&
      
hipsolverCgetrs_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverZgetrs_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverZgetrs_bufferSize_raw(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork) bind(c, name="cusolverZgetrs_bufferSize")
#else
    function hipsolverZgetrs_bufferSize_raw(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,lwork) bind(c, name="hipsolverZgetrs_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrs_bufferSize_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_OP_N)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: nrhs
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: devIpiv
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverZgetrs_bufferSize_full_rank,&
      
hipsolverZgetrs_bufferSize_rank_0,&
      
hipsolverZgetrs_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverSgetrs
#ifdef USE_CUDA_NAMES
    function hipsolverSgetrs_raw(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo) bind(c, name="cusolverSgetrs")
#else
    function hipsolverSgetrs_raw(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo) bind(c, name="hipsolverSgetrs")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSgetrs_raw
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
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverSgetrs_full_rank,&
      
hipsolverSgetrs_rank_0,&
      
hipsolverSgetrs_rank_1
#endif

  end interface
  
  interface hipsolverDgetrs
#ifdef USE_CUDA_NAMES
    function hipsolverDgetrs_raw(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo) bind(c, name="cusolverDgetrs")
#else
    function hipsolverDgetrs_raw(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo) bind(c, name="hipsolverDgetrs")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDgetrs_raw
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
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDgetrs_full_rank,&
      
hipsolverDgetrs_rank_0,&
      
hipsolverDgetrs_rank_1
#endif

  end interface
  
  interface hipsolverCgetrs
#ifdef USE_CUDA_NAMES
    function hipsolverCgetrs_raw(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo) bind(c, name="cusolverCgetrs")
#else
    function hipsolverCgetrs_raw(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo) bind(c, name="hipsolverCgetrs")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCgetrs_raw
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
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverCgetrs_full_rank,&
      
hipsolverCgetrs_rank_0,&
      
hipsolverCgetrs_rank_1
#endif

  end interface
  
  interface hipsolverZgetrs
#ifdef USE_CUDA_NAMES
    function hipsolverZgetrs_raw(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo) bind(c, name="cusolverZgetrs")
#else
    function hipsolverZgetrs_raw(handle,trans,n,nrhs,A,lda,devIpiv,B,ldb,work,lwork,devInfo) bind(c, name="hipsolverZgetrs")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZgetrs_raw
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
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverZgetrs_full_rank,&
      
hipsolverZgetrs_rank_0,&
      
hipsolverZgetrs_rank_1
#endif

  end interface
  
  interface hipsolverSpotrf_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverSpotrf_bufferSize_raw(handle,uplo,n,A,lda,lwork) bind(c, name="cusolverSpotrf_bufferSize")
#else
    function hipsolverSpotrf_bufferSize_raw(handle,uplo,n,A,lda,lwork) bind(c, name="hipsolverSpotrf_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrf_bufferSize_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverSpotrf_bufferSize_full_rank,&
      
hipsolverSpotrf_bufferSize_rank_0,&
      
hipsolverSpotrf_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverDpotrf_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDpotrf_bufferSize_raw(handle,uplo,n,A,lda,lwork) bind(c, name="cusolverDpotrf_bufferSize")
#else
    function hipsolverDpotrf_bufferSize_raw(handle,uplo,n,A,lda,lwork) bind(c, name="hipsolverDpotrf_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrf_bufferSize_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDpotrf_bufferSize_full_rank,&
      
hipsolverDpotrf_bufferSize_rank_0,&
      
hipsolverDpotrf_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverCpotrf_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverCpotrf_bufferSize_raw(handle,uplo,n,A,lda,lwork) bind(c, name="cusolverCpotrf_bufferSize")
#else
    function hipsolverCpotrf_bufferSize_raw(handle,uplo,n,A,lda,lwork) bind(c, name="hipsolverCpotrf_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrf_bufferSize_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverCpotrf_bufferSize_full_rank,&
      
hipsolverCpotrf_bufferSize_rank_0,&
      
hipsolverCpotrf_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverZpotrf_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverZpotrf_bufferSize_raw(handle,uplo,n,A,lda,lwork) bind(c, name="cusolverZpotrf_bufferSize")
#else
    function hipsolverZpotrf_bufferSize_raw(handle,uplo,n,A,lda,lwork) bind(c, name="hipsolverZpotrf_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrf_bufferSize_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverZpotrf_bufferSize_full_rank,&
      
hipsolverZpotrf_bufferSize_rank_0,&
      
hipsolverZpotrf_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverSpotrf
#ifdef USE_CUDA_NAMES
    function hipsolverSpotrf_raw(handle,uplo,n,A,lda,work,lwork,devInfo) bind(c, name="cusolverSpotrf")
#else
    function hipsolverSpotrf_raw(handle,uplo,n,A,lda,work,lwork,devInfo) bind(c, name="hipsolverSpotrf")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrf_raw
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
    module procedure hipsolverSpotrf_full_rank,&
      
hipsolverSpotrf_rank_0,&
      
hipsolverSpotrf_rank_1
#endif

  end interface
  
  interface hipsolverDpotrf
#ifdef USE_CUDA_NAMES
    function hipsolverDpotrf_raw(handle,uplo,n,A,lda,work,lwork,devInfo) bind(c, name="cusolverDpotrf")
#else
    function hipsolverDpotrf_raw(handle,uplo,n,A,lda,work,lwork,devInfo) bind(c, name="hipsolverDpotrf")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrf_raw
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
    module procedure hipsolverDpotrf_full_rank,&
      
hipsolverDpotrf_rank_0,&
      
hipsolverDpotrf_rank_1
#endif

  end interface
  
  interface hipsolverCpotrf
#ifdef USE_CUDA_NAMES
    function hipsolverCpotrf_raw(handle,uplo,n,A,lda,work,lwork,devInfo) bind(c, name="cusolverCpotrf")
#else
    function hipsolverCpotrf_raw(handle,uplo,n,A,lda,work,lwork,devInfo) bind(c, name="hipsolverCpotrf")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrf_raw
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
    module procedure hipsolverCpotrf_full_rank,&
      
hipsolverCpotrf_rank_0,&
      
hipsolverCpotrf_rank_1
#endif

  end interface
  
  interface hipsolverZpotrf
#ifdef USE_CUDA_NAMES
    function hipsolverZpotrf_raw(handle,uplo,n,A,lda,work,lwork,devInfo) bind(c, name="cusolverZpotrf")
#else
    function hipsolverZpotrf_raw(handle,uplo,n,A,lda,work,lwork,devInfo) bind(c, name="hipsolverZpotrf")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrf_raw
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
    module procedure hipsolverZpotrf_full_rank,&
      
hipsolverZpotrf_rank_0,&
      
hipsolverZpotrf_rank_1
#endif

  end interface
  
  interface hipsolverSpotrfBatched_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverSpotrfBatched_bufferSize_raw(handle,uplo,n,A,lda,lwork,batch_count) bind(c, name="cusolverSpotrfBatched_bufferSize")
#else
    function hipsolverSpotrfBatched_bufferSize_raw(handle,uplo,n,A,lda,lwork,batch_count) bind(c, name="hipsolverSpotrfBatched_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrfBatched_bufferSize_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: lwork
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverSpotrfBatched_bufferSize_full_rank,&
      
hipsolverSpotrfBatched_bufferSize_rank_0,&
      
hipsolverSpotrfBatched_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverDpotrfBatched_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDpotrfBatched_bufferSize_raw(handle,uplo,n,A,lda,lwork,batch_count) bind(c, name="cusolverDpotrfBatched_bufferSize")
#else
    function hipsolverDpotrfBatched_bufferSize_raw(handle,uplo,n,A,lda,lwork,batch_count) bind(c, name="hipsolverDpotrfBatched_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrfBatched_bufferSize_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: lwork
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDpotrfBatched_bufferSize_full_rank,&
      
hipsolverDpotrfBatched_bufferSize_rank_0,&
      
hipsolverDpotrfBatched_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverCpotrfBatched_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverCpotrfBatched_bufferSize_raw(handle,uplo,n,A,lda,lwork,batch_count) bind(c, name="cusolverCpotrfBatched_bufferSize")
#else
    function hipsolverCpotrfBatched_bufferSize_raw(handle,uplo,n,A,lda,lwork,batch_count) bind(c, name="hipsolverCpotrfBatched_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrfBatched_bufferSize_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: lwork
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverCpotrfBatched_bufferSize_full_rank,&
      
hipsolverCpotrfBatched_bufferSize_rank_0,&
      
hipsolverCpotrfBatched_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverZpotrfBatched_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverZpotrfBatched_bufferSize_raw(handle,uplo,n,A,lda,lwork,batch_count) bind(c, name="cusolverZpotrfBatched_bufferSize")
#else
    function hipsolverZpotrfBatched_bufferSize_raw(handle,uplo,n,A,lda,lwork,batch_count) bind(c, name="hipsolverZpotrfBatched_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrfBatched_bufferSize_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: lwork
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverZpotrfBatched_bufferSize_full_rank,&
      
hipsolverZpotrfBatched_bufferSize_rank_0,&
      
hipsolverZpotrfBatched_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverSpotrfBatched
#ifdef USE_CUDA_NAMES
    function hipsolverSpotrfBatched_raw(handle,uplo,n,A,lda,work,lwork,devInfo,batch_count) bind(c, name="cusolverSpotrfBatched")
#else
    function hipsolverSpotrfBatched_raw(handle,uplo,n,A,lda,work,lwork,devInfo,batch_count) bind(c, name="hipsolverSpotrfBatched")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrfBatched_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverSpotrfBatched_full_rank,&
      
hipsolverSpotrfBatched_rank_0,&
      
hipsolverSpotrfBatched_rank_1
#endif

  end interface
  
  interface hipsolverDpotrfBatched
#ifdef USE_CUDA_NAMES
    function hipsolverDpotrfBatched_raw(handle,uplo,n,A,lda,work,lwork,devInfo,batch_count) bind(c, name="cusolverDpotrfBatched")
#else
    function hipsolverDpotrfBatched_raw(handle,uplo,n,A,lda,work,lwork,devInfo,batch_count) bind(c, name="hipsolverDpotrfBatched")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrfBatched_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDpotrfBatched_full_rank,&
      
hipsolverDpotrfBatched_rank_0,&
      
hipsolverDpotrfBatched_rank_1
#endif

  end interface
  
  interface hipsolverCpotrfBatched
#ifdef USE_CUDA_NAMES
    function hipsolverCpotrfBatched_raw(handle,uplo,n,A,lda,work,lwork,devInfo,batch_count) bind(c, name="cusolverCpotrfBatched")
#else
    function hipsolverCpotrfBatched_raw(handle,uplo,n,A,lda,work,lwork,devInfo,batch_count) bind(c, name="hipsolverCpotrfBatched")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrfBatched_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverCpotrfBatched_full_rank,&
      
hipsolverCpotrfBatched_rank_0,&
      
hipsolverCpotrfBatched_rank_1
#endif

  end interface
  
  interface hipsolverZpotrfBatched
#ifdef USE_CUDA_NAMES
    function hipsolverZpotrfBatched_raw(handle,uplo,n,A,lda,work,lwork,devInfo,batch_count) bind(c, name="cusolverZpotrfBatched")
#else
    function hipsolverZpotrfBatched_raw(handle,uplo,n,A,lda,work,lwork,devInfo,batch_count) bind(c, name="hipsolverZpotrfBatched")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrfBatched_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
      integer(c_int),value :: batch_count
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverZpotrfBatched_full_rank,&
      
hipsolverZpotrfBatched_rank_0,&
      
hipsolverZpotrfBatched_rank_1
#endif

  end interface
  
  interface hipsolverSsyevd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverSsyevd_bufferSize_raw(handle,jobz,uplo,n,A,lda,D,lwork) bind(c, name="cusolverSsyevd_bufferSize")
#else
    function hipsolverSsyevd_bufferSize_raw(handle,jobz,uplo,n,A,lda,D,lwork) bind(c, name="hipsolverSsyevd_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsyevd_bufferSize_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverSsyevd_bufferSize_full_rank,&
      
hipsolverSsyevd_bufferSize_rank_0,&
      
hipsolverSsyevd_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverDsyevd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDsyevd_bufferSize_raw(handle,jobz,uplo,n,A,lda,D,lwork) bind(c, name="cusolverDsyevd_bufferSize")
#else
    function hipsolverDsyevd_bufferSize_raw(handle,jobz,uplo,n,A,lda,D,lwork) bind(c, name="hipsolverDsyevd_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsyevd_bufferSize_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDsyevd_bufferSize_full_rank,&
      
hipsolverDsyevd_bufferSize_rank_0,&
      
hipsolverDsyevd_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverCheevd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverCheevd_bufferSize_raw(handle,jobz,uplo,n,A,lda,D,lwork) bind(c, name="cusolverCheevd_bufferSize")
#else
    function hipsolverCheevd_bufferSize_raw(handle,jobz,uplo,n,A,lda,D,lwork) bind(c, name="hipsolverCheevd_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCheevd_bufferSize_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverCheevd_bufferSize_full_rank,&
      
hipsolverCheevd_bufferSize_rank_0,&
      
hipsolverCheevd_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverZheevd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverZheevd_bufferSize_raw(handle,jobz,uplo,n,A,lda,D,lwork) bind(c, name="cusolverZheevd_bufferSize")
#else
    function hipsolverZheevd_bufferSize_raw(handle,jobz,uplo,n,A,lda,D,lwork) bind(c, name="hipsolverZheevd_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZheevd_bufferSize_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverZheevd_bufferSize_full_rank,&
      
hipsolverZheevd_bufferSize_rank_0,&
      
hipsolverZheevd_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverSsyevd
#ifdef USE_CUDA_NAMES
    function hipsolverSsyevd_raw(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo) bind(c, name="cusolverSsyevd")
#else
    function hipsolverSsyevd_raw(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo) bind(c, name="hipsolverSsyevd")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsyevd_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverSsyevd_full_rank,&
      
hipsolverSsyevd_rank_0,&
      
hipsolverSsyevd_rank_1
#endif

  end interface
  
  interface hipsolverDsyevd
#ifdef USE_CUDA_NAMES
    function hipsolverDsyevd_raw(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo) bind(c, name="cusolverDsyevd")
#else
    function hipsolverDsyevd_raw(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo) bind(c, name="hipsolverDsyevd")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsyevd_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDsyevd_full_rank,&
      
hipsolverDsyevd_rank_0,&
      
hipsolverDsyevd_rank_1
#endif

  end interface
  
  interface hipsolverCheevd
#ifdef USE_CUDA_NAMES
    function hipsolverCheevd_raw(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo) bind(c, name="cusolverCheevd")
#else
    function hipsolverCheevd_raw(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo) bind(c, name="hipsolverCheevd")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCheevd_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverCheevd_full_rank,&
      
hipsolverCheevd_rank_0,&
      
hipsolverCheevd_rank_1
#endif

  end interface
  
  interface hipsolverZheevd
#ifdef USE_CUDA_NAMES
    function hipsolverZheevd_raw(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo) bind(c, name="cusolverZheevd")
#else
    function hipsolverZheevd_raw(handle,jobz,uplo,n,A,lda,D,work,lwork,devInfo) bind(c, name="hipsolverZheevd")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZheevd_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverZheevd_full_rank,&
      
hipsolverZheevd_rank_0,&
      
hipsolverZheevd_rank_1
#endif

  end interface
  
  interface hipsolverSsygvd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverSsygvd_bufferSize_raw(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,lwork) bind(c, name="cusolverSsygvd_bufferSize")
#else
    function hipsolverSsygvd_bufferSize_raw(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,lwork) bind(c, name="hipsolverSsygvd_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsygvd_bufferSize_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: D
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverSsygvd_bufferSize_full_rank,&
      
hipsolverSsygvd_bufferSize_rank_0,&
      
hipsolverSsygvd_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverDsygvd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDsygvd_bufferSize_raw(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,lwork) bind(c, name="cusolverDsygvd_bufferSize")
#else
    function hipsolverDsygvd_bufferSize_raw(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,lwork) bind(c, name="hipsolverDsygvd_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsygvd_bufferSize_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: D
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDsygvd_bufferSize_full_rank,&
      
hipsolverDsygvd_bufferSize_rank_0,&
      
hipsolverDsygvd_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverChegvd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverChegvd_bufferSize_raw(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,lwork) bind(c, name="cusolverChegvd_bufferSize")
#else
    function hipsolverChegvd_bufferSize_raw(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,lwork) bind(c, name="hipsolverChegvd_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChegvd_bufferSize_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: D
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverChegvd_bufferSize_full_rank,&
      
hipsolverChegvd_bufferSize_rank_0,&
      
hipsolverChegvd_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverZhegvd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverZhegvd_bufferSize_raw(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,lwork) bind(c, name="cusolverZhegvd_bufferSize")
#else
    function hipsolverZhegvd_bufferSize_raw(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,lwork) bind(c, name="hipsolverZhegvd_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhegvd_bufferSize_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: D
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverZhegvd_bufferSize_full_rank,&
      
hipsolverZhegvd_bufferSize_rank_0,&
      
hipsolverZhegvd_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverSsygvd
#ifdef USE_CUDA_NAMES
    function hipsolverSsygvd_raw(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,work,lwork,devInfo) bind(c, name="cusolverSsygvd")
#else
    function hipsolverSsygvd_raw(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,work,lwork,devInfo) bind(c, name="hipsolverSsygvd")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsygvd_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: D
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverSsygvd_full_rank,&
      
hipsolverSsygvd_rank_0,&
      
hipsolverSsygvd_rank_1
#endif

  end interface
  
  interface hipsolverDsygvd
#ifdef USE_CUDA_NAMES
    function hipsolverDsygvd_raw(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,work,lwork,devInfo) bind(c, name="cusolverDsygvd")
#else
    function hipsolverDsygvd_raw(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,work,lwork,devInfo) bind(c, name="hipsolverDsygvd")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsygvd_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: D
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDsygvd_full_rank,&
      
hipsolverDsygvd_rank_0,&
      
hipsolverDsygvd_rank_1
#endif

  end interface
  
  interface hipsolverChegvd
#ifdef USE_CUDA_NAMES
    function hipsolverChegvd_raw(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,work,lwork,devInfo) bind(c, name="cusolverChegvd")
#else
    function hipsolverChegvd_raw(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,work,lwork,devInfo) bind(c, name="hipsolverChegvd")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChegvd_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: D
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverChegvd_full_rank,&
      
hipsolverChegvd_rank_0,&
      
hipsolverChegvd_rank_1
#endif

  end interface
  
  interface hipsolverZhegvd
#ifdef USE_CUDA_NAMES
    function hipsolverZhegvd_raw(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,work,lwork,devInfo) bind(c, name="cusolverZhegvd")
#else
    function hipsolverZhegvd_raw(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,work,lwork,devInfo) bind(c, name="hipsolverZhegvd")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhegvd_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_EIG_TYPE_1)),value :: itype
      integer(kind(HIPSOLVER_EIG_MODE_NOVECTOR)),value :: jobz
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: D
      type(c_ptr),value :: work
      integer(c_int),value :: lwork
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverZhegvd_full_rank,&
      
hipsolverZhegvd_rank_0,&
      
hipsolverZhegvd_rank_1
#endif

  end interface
  
  interface hipsolverSsytrd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverSsytrd_bufferSize_raw(handle,uplo,n,A,lda,D,E,tau,lwork) bind(c, name="cusolverSsytrd_bufferSize")
#else
    function hipsolverSsytrd_bufferSize_raw(handle,uplo,n,A,lda,D,E,tau,lwork) bind(c, name="hipsolverSsytrd_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsytrd_bufferSize_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      real(c_float) :: tau
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverSsytrd_bufferSize_full_rank,&
      
hipsolverSsytrd_bufferSize_rank_0,&
      
hipsolverSsytrd_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverDsytrd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverDsytrd_bufferSize_raw(handle,uplo,n,A,lda,D,E,tau,lwork) bind(c, name="cusolverDsytrd_bufferSize")
#else
    function hipsolverDsytrd_bufferSize_raw(handle,uplo,n,A,lda,D,E,tau,lwork) bind(c, name="hipsolverDsytrd_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsytrd_bufferSize_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      real(c_double) :: tau
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDsytrd_bufferSize_full_rank,&
      
hipsolverDsytrd_bufferSize_rank_0,&
      
hipsolverDsytrd_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverChetrd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverChetrd_bufferSize_raw(handle,uplo,n,A,lda,D,E,tau,lwork) bind(c, name="cusolverChetrd_bufferSize")
#else
    function hipsolverChetrd_bufferSize_raw(handle,uplo,n,A,lda,D,E,tau,lwork) bind(c, name="hipsolverChetrd_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChetrd_bufferSize_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      complex(c_float_complex) :: tau
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverChetrd_bufferSize_full_rank,&
      
hipsolverChetrd_bufferSize_rank_0,&
      
hipsolverChetrd_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverZhetrd_bufferSize
#ifdef USE_CUDA_NAMES
    function hipsolverZhetrd_bufferSize_raw(handle,uplo,n,A,lda,D,E,tau,lwork) bind(c, name="cusolverZhetrd_bufferSize")
#else
    function hipsolverZhetrd_bufferSize_raw(handle,uplo,n,A,lda,D,E,tau,lwork) bind(c, name="hipsolverZhetrd_bufferSize")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhetrd_bufferSize_raw
      type(c_ptr),value :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: D
      type(c_ptr),value :: E
      complex(c_double_complex) :: tau
      type(c_ptr),value :: lwork
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverZhetrd_bufferSize_full_rank,&
      
hipsolverZhetrd_bufferSize_rank_0,&
      
hipsolverZhetrd_bufferSize_rank_1
#endif

  end interface
  
  interface hipsolverSsytrd
#ifdef USE_CUDA_NAMES
    function hipsolverSsytrd_raw(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo) bind(c, name="cusolverSsytrd")
#else
    function hipsolverSsytrd_raw(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo) bind(c, name="hipsolverSsytrd")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSsytrd_raw
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
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverSsytrd_full_rank,&
      
hipsolverSsytrd_rank_0,&
      
hipsolverSsytrd_rank_1
#endif

  end interface
  
  interface hipsolverDsytrd
#ifdef USE_CUDA_NAMES
    function hipsolverDsytrd_raw(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo) bind(c, name="cusolverDsytrd")
#else
    function hipsolverDsytrd_raw(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo) bind(c, name="hipsolverDsytrd")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDsytrd_raw
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
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverDsytrd_full_rank,&
      
hipsolverDsytrd_rank_0,&
      
hipsolverDsytrd_rank_1
#endif

  end interface
  
  interface hipsolverChetrd
#ifdef USE_CUDA_NAMES
    function hipsolverChetrd_raw(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo) bind(c, name="cusolverChetrd")
#else
    function hipsolverChetrd_raw(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo) bind(c, name="hipsolverChetrd")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverChetrd_raw
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
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverChetrd_full_rank,&
      
hipsolverChetrd_rank_0,&
      
hipsolverChetrd_rank_1
#endif

  end interface
  
  interface hipsolverZhetrd
#ifdef USE_CUDA_NAMES
    function hipsolverZhetrd_raw(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo) bind(c, name="cusolverZhetrd")
#else
    function hipsolverZhetrd_raw(handle,uplo,n,A,lda,D,E,tau,work,lwork,devInfo) bind(c, name="hipsolverZhetrd")
#endif
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZhetrd_raw
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
      type(c_ptr),value :: devInfo
    end function

#ifdef USE_FPOINTER_INTERFACES
    module procedure hipsolverZhetrd_full_rank,&
      
hipsolverZhetrd_rank_0,&
      
hipsolverZhetrd_rank_1
#endif

  end interface

#ifdef USE_FPOINTER_INTERFACES
  contains
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
      type(c_ptr) :: lwork
      !
      hipsolverSorgbr_bufferSize_full_rank = hipsolverSorgbr_bufferSize_raw(handle,side,m,n,k,c_loc(A),lda,tau,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverSorgbr_bufferSize_rank_0 = hipsolverSorgbr_bufferSize_raw(handle,side,m,n,k,c_loc(A),lda,tau,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverSorgbr_bufferSize_rank_1 = hipsolverSorgbr_bufferSize_raw(handle,side,m,n,k,c_loc(A),lda,tau,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverDorgbr_bufferSize_full_rank = hipsolverDorgbr_bufferSize_raw(handle,side,m,n,k,c_loc(A),lda,tau,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverDorgbr_bufferSize_rank_0 = hipsolverDorgbr_bufferSize_raw(handle,side,m,n,k,c_loc(A),lda,tau,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverDorgbr_bufferSize_rank_1 = hipsolverDorgbr_bufferSize_raw(handle,side,m,n,k,c_loc(A),lda,tau,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverCungbr_bufferSize_full_rank = hipsolverCungbr_bufferSize_raw(handle,side,m,n,k,c_loc(A),lda,tau,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverCungbr_bufferSize_rank_0 = hipsolverCungbr_bufferSize_raw(handle,side,m,n,k,c_loc(A),lda,tau,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverCungbr_bufferSize_rank_1 = hipsolverCungbr_bufferSize_raw(handle,side,m,n,k,c_loc(A),lda,tau,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverZungbr_bufferSize_full_rank = hipsolverZungbr_bufferSize_raw(handle,side,m,n,k,c_loc(A),lda,tau,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverZungbr_bufferSize_rank_0 = hipsolverZungbr_bufferSize_raw(handle,side,m,n,k,c_loc(A),lda,tau,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverZungbr_bufferSize_rank_1 = hipsolverZungbr_bufferSize_raw(handle,side,m,n,k,c_loc(A),lda,tau,lwork)
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
      type(c_ptr) :: devInfo
      !
      hipsolverSorgbr_full_rank = hipsolverSorgbr_raw(handle,side,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverSorgbr_rank_0 = hipsolverSorgbr_raw(handle,side,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverSorgbr_rank_1 = hipsolverSorgbr_raw(handle,side,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverDorgbr_full_rank = hipsolverDorgbr_raw(handle,side,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverDorgbr_rank_0 = hipsolverDorgbr_raw(handle,side,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverDorgbr_rank_1 = hipsolverDorgbr_raw(handle,side,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverCungbr_full_rank = hipsolverCungbr_raw(handle,side,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverCungbr_rank_0 = hipsolverCungbr_raw(handle,side,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverCungbr_rank_1 = hipsolverCungbr_raw(handle,side,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverZungbr_full_rank = hipsolverZungbr_raw(handle,side,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverZungbr_rank_0 = hipsolverZungbr_raw(handle,side,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverZungbr_rank_1 = hipsolverZungbr_raw(handle,side,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
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
      type(c_ptr) :: lwork
      !
      hipsolverSorgqr_bufferSize_full_rank = hipsolverSorgqr_bufferSize_raw(handle,m,n,k,c_loc(A),lda,tau,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverSorgqr_bufferSize_rank_0 = hipsolverSorgqr_bufferSize_raw(handle,m,n,k,c_loc(A),lda,tau,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverSorgqr_bufferSize_rank_1 = hipsolverSorgqr_bufferSize_raw(handle,m,n,k,c_loc(A),lda,tau,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverDorgqr_bufferSize_full_rank = hipsolverDorgqr_bufferSize_raw(handle,m,n,k,c_loc(A),lda,tau,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverDorgqr_bufferSize_rank_0 = hipsolverDorgqr_bufferSize_raw(handle,m,n,k,c_loc(A),lda,tau,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverDorgqr_bufferSize_rank_1 = hipsolverDorgqr_bufferSize_raw(handle,m,n,k,c_loc(A),lda,tau,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverCungqr_bufferSize_full_rank = hipsolverCungqr_bufferSize_raw(handle,m,n,k,c_loc(A),lda,tau,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverCungqr_bufferSize_rank_0 = hipsolverCungqr_bufferSize_raw(handle,m,n,k,c_loc(A),lda,tau,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverCungqr_bufferSize_rank_1 = hipsolverCungqr_bufferSize_raw(handle,m,n,k,c_loc(A),lda,tau,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverZungqr_bufferSize_full_rank = hipsolverZungqr_bufferSize_raw(handle,m,n,k,c_loc(A),lda,tau,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverZungqr_bufferSize_rank_0 = hipsolverZungqr_bufferSize_raw(handle,m,n,k,c_loc(A),lda,tau,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverZungqr_bufferSize_rank_1 = hipsolverZungqr_bufferSize_raw(handle,m,n,k,c_loc(A),lda,tau,lwork)
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
      type(c_ptr) :: devInfo
      !
      hipsolverSorgqr_full_rank = hipsolverSorgqr_raw(handle,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverSorgqr_rank_0 = hipsolverSorgqr_raw(handle,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverSorgqr_rank_1 = hipsolverSorgqr_raw(handle,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverDorgqr_full_rank = hipsolverDorgqr_raw(handle,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverDorgqr_rank_0 = hipsolverDorgqr_raw(handle,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverDorgqr_rank_1 = hipsolverDorgqr_raw(handle,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverCungqr_full_rank = hipsolverCungqr_raw(handle,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverCungqr_rank_0 = hipsolverCungqr_raw(handle,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverCungqr_rank_1 = hipsolverCungqr_raw(handle,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverZungqr_full_rank = hipsolverZungqr_raw(handle,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverZungqr_rank_0 = hipsolverZungqr_raw(handle,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverZungqr_rank_1 = hipsolverZungqr_raw(handle,m,n,k,c_loc(A),lda,tau,work,lwork,devInfo)
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
      type(c_ptr) :: lwork
      !
      hipsolverSorgtr_bufferSize_full_rank = hipsolverSorgtr_bufferSize_raw(handle,uplo,n,c_loc(A),lda,tau,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverSorgtr_bufferSize_rank_0 = hipsolverSorgtr_bufferSize_raw(handle,uplo,n,c_loc(A),lda,tau,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverSorgtr_bufferSize_rank_1 = hipsolverSorgtr_bufferSize_raw(handle,uplo,n,c_loc(A),lda,tau,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverDorgtr_bufferSize_full_rank = hipsolverDorgtr_bufferSize_raw(handle,uplo,n,c_loc(A),lda,tau,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverDorgtr_bufferSize_rank_0 = hipsolverDorgtr_bufferSize_raw(handle,uplo,n,c_loc(A),lda,tau,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverDorgtr_bufferSize_rank_1 = hipsolverDorgtr_bufferSize_raw(handle,uplo,n,c_loc(A),lda,tau,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverCungtr_bufferSize_full_rank = hipsolverCungtr_bufferSize_raw(handle,uplo,n,c_loc(A),lda,tau,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverCungtr_bufferSize_rank_0 = hipsolverCungtr_bufferSize_raw(handle,uplo,n,c_loc(A),lda,tau,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverCungtr_bufferSize_rank_1 = hipsolverCungtr_bufferSize_raw(handle,uplo,n,c_loc(A),lda,tau,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverZungtr_bufferSize_full_rank = hipsolverZungtr_bufferSize_raw(handle,uplo,n,c_loc(A),lda,tau,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverZungtr_bufferSize_rank_0 = hipsolverZungtr_bufferSize_raw(handle,uplo,n,c_loc(A),lda,tau,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverZungtr_bufferSize_rank_1 = hipsolverZungtr_bufferSize_raw(handle,uplo,n,c_loc(A),lda,tau,lwork)
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
      type(c_ptr) :: devInfo
      !
      hipsolverSorgtr_full_rank = hipsolverSorgtr_raw(handle,uplo,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverSorgtr_rank_0 = hipsolverSorgtr_raw(handle,uplo,n,c_loc(A),lda,tau,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverSorgtr_rank_1 = hipsolverSorgtr_raw(handle,uplo,n,c_loc(A),lda,tau,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverDorgtr_full_rank = hipsolverDorgtr_raw(handle,uplo,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverDorgtr_rank_0 = hipsolverDorgtr_raw(handle,uplo,n,c_loc(A),lda,tau,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverDorgtr_rank_1 = hipsolverDorgtr_raw(handle,uplo,n,c_loc(A),lda,tau,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverCungtr_full_rank = hipsolverCungtr_raw(handle,uplo,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverCungtr_rank_0 = hipsolverCungtr_raw(handle,uplo,n,c_loc(A),lda,tau,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverCungtr_rank_1 = hipsolverCungtr_raw(handle,uplo,n,c_loc(A),lda,tau,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverZungtr_full_rank = hipsolverZungtr_raw(handle,uplo,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverZungtr_rank_0 = hipsolverZungtr_raw(handle,uplo,n,c_loc(A),lda,tau,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverZungtr_rank_1 = hipsolverZungtr_raw(handle,uplo,n,c_loc(A),lda,tau,work,lwork,devInfo)
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
      type(c_ptr) :: lwork
      !
      hipsolverSormqr_bufferSize_full_rank = hipsolverSormqr_bufferSize_raw(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverSormqr_bufferSize_rank_0 = hipsolverSormqr_bufferSize_raw(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverSormqr_bufferSize_rank_1 = hipsolverSormqr_bufferSize_raw(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverDormqr_bufferSize_full_rank = hipsolverDormqr_bufferSize_raw(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverDormqr_bufferSize_rank_0 = hipsolverDormqr_bufferSize_raw(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverDormqr_bufferSize_rank_1 = hipsolverDormqr_bufferSize_raw(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverCunmqr_bufferSize_full_rank = hipsolverCunmqr_bufferSize_raw(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverCunmqr_bufferSize_rank_0 = hipsolverCunmqr_bufferSize_raw(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverCunmqr_bufferSize_rank_1 = hipsolverCunmqr_bufferSize_raw(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverZunmqr_bufferSize_full_rank = hipsolverZunmqr_bufferSize_raw(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverZunmqr_bufferSize_rank_0 = hipsolverZunmqr_bufferSize_raw(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverZunmqr_bufferSize_rank_1 = hipsolverZunmqr_bufferSize_raw(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
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
      type(c_ptr) :: devInfo
      !
      hipsolverSormqr_full_rank = hipsolverSormqr_raw(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C),ldc,work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverSormqr_rank_0 = hipsolverSormqr_raw(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C),ldc,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverSormqr_rank_1 = hipsolverSormqr_raw(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C),ldc,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverDormqr_full_rank = hipsolverDormqr_raw(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C),ldc,work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverDormqr_rank_0 = hipsolverDormqr_raw(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C),ldc,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverDormqr_rank_1 = hipsolverDormqr_raw(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C),ldc,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverCunmqr_full_rank = hipsolverCunmqr_raw(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C),ldc,work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverCunmqr_rank_0 = hipsolverCunmqr_raw(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C),ldc,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverCunmqr_rank_1 = hipsolverCunmqr_raw(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C),ldc,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverZunmqr_full_rank = hipsolverZunmqr_raw(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C),ldc,work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverZunmqr_rank_0 = hipsolverZunmqr_raw(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C),ldc,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverZunmqr_rank_1 = hipsolverZunmqr_raw(handle,side,trans,m,n,k,c_loc(A),lda,tau,c_loc(C),ldc,work,lwork,devInfo)
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
      type(c_ptr) :: lwork
      !
      hipsolverSormtr_bufferSize_full_rank = hipsolverSormtr_bufferSize_raw(handle,side,uplo,trans,m,n,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverSormtr_bufferSize_rank_0 = hipsolverSormtr_bufferSize_raw(handle,side,uplo,trans,m,n,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverSormtr_bufferSize_rank_1 = hipsolverSormtr_bufferSize_raw(handle,side,uplo,trans,m,n,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverDormtr_bufferSize_full_rank = hipsolverDormtr_bufferSize_raw(handle,side,uplo,trans,m,n,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverDormtr_bufferSize_rank_0 = hipsolverDormtr_bufferSize_raw(handle,side,uplo,trans,m,n,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverDormtr_bufferSize_rank_1 = hipsolverDormtr_bufferSize_raw(handle,side,uplo,trans,m,n,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverCunmtr_bufferSize_full_rank = hipsolverCunmtr_bufferSize_raw(handle,side,uplo,trans,m,n,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverCunmtr_bufferSize_rank_0 = hipsolverCunmtr_bufferSize_raw(handle,side,uplo,trans,m,n,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverCunmtr_bufferSize_rank_1 = hipsolverCunmtr_bufferSize_raw(handle,side,uplo,trans,m,n,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverZunmtr_bufferSize_full_rank = hipsolverZunmtr_bufferSize_raw(handle,side,uplo,trans,m,n,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverZunmtr_bufferSize_rank_0 = hipsolverZunmtr_bufferSize_raw(handle,side,uplo,trans,m,n,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverZunmtr_bufferSize_rank_1 = hipsolverZunmtr_bufferSize_raw(handle,side,uplo,trans,m,n,c_loc(A),lda,tau,c_loc(C),ldc,lwork)
    end function

    function hipsolverSormtr_full_rank(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverSormtr_full_rank = hipsolverSormtr_raw(handle,side,uplo,trans,m,n,c_loc(A),lda,tau,c_loc(C),ldc,work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverSormtr_rank_0 = hipsolverSormtr_raw(handle,side,uplo,trans,m,n,c_loc(A),lda,tau,c_loc(C),ldc,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverSormtr_rank_1 = hipsolverSormtr_raw(handle,side,uplo,trans,m,n,c_loc(A),lda,tau,c_loc(C),ldc,work,lwork,devInfo)
    end function

    function hipsolverDormtr_full_rank(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverDormtr_full_rank = hipsolverDormtr_raw(handle,side,uplo,trans,m,n,c_loc(A),lda,tau,c_loc(C),ldc,work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverDormtr_rank_0 = hipsolverDormtr_raw(handle,side,uplo,trans,m,n,c_loc(A),lda,tau,c_loc(C),ldc,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverDormtr_rank_1 = hipsolverDormtr_raw(handle,side,uplo,trans,m,n,c_loc(A),lda,tau,c_loc(C),ldc,work,lwork,devInfo)
    end function

    function hipsolverCunmtr_full_rank(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverCunmtr_full_rank = hipsolverCunmtr_raw(handle,side,uplo,trans,m,n,c_loc(A),lda,tau,c_loc(C),ldc,work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverCunmtr_rank_0 = hipsolverCunmtr_raw(handle,side,uplo,trans,m,n,c_loc(A),lda,tau,c_loc(C),ldc,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverCunmtr_rank_1 = hipsolverCunmtr_raw(handle,side,uplo,trans,m,n,c_loc(A),lda,tau,c_loc(C),ldc,work,lwork,devInfo)
    end function

    function hipsolverZunmtr_full_rank(handle,side,uplo,trans,m,n,A,lda,tau,C,ldc,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverZunmtr_full_rank = hipsolverZunmtr_raw(handle,side,uplo,trans,m,n,c_loc(A),lda,tau,c_loc(C),ldc,work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverZunmtr_rank_0 = hipsolverZunmtr_raw(handle,side,uplo,trans,m,n,c_loc(A),lda,tau,c_loc(C),ldc,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverZunmtr_rank_1 = hipsolverZunmtr_raw(handle,side,uplo,trans,m,n,c_loc(A),lda,tau,c_loc(C),ldc,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverSgebrd_full_rank = hipsolverSgebrd_raw(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E),c_loc(tauq),c_loc(taup),work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverSgebrd_rank_0 = hipsolverSgebrd_raw(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E),c_loc(tauq),c_loc(taup),work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverSgebrd_rank_1 = hipsolverSgebrd_raw(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E),c_loc(tauq),c_loc(taup),work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverDgebrd_full_rank = hipsolverDgebrd_raw(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E),c_loc(tauq),c_loc(taup),work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverDgebrd_rank_0 = hipsolverDgebrd_raw(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E),c_loc(tauq),c_loc(taup),work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverDgebrd_rank_1 = hipsolverDgebrd_raw(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E),c_loc(tauq),c_loc(taup),work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverCgebrd_full_rank = hipsolverCgebrd_raw(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E),c_loc(tauq),c_loc(taup),work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverCgebrd_rank_0 = hipsolverCgebrd_raw(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E),c_loc(tauq),c_loc(taup),work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverCgebrd_rank_1 = hipsolverCgebrd_raw(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E),c_loc(tauq),c_loc(taup),work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverZgebrd_full_rank = hipsolverZgebrd_raw(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E),c_loc(tauq),c_loc(taup),work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverZgebrd_rank_0 = hipsolverZgebrd_raw(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E),c_loc(tauq),c_loc(taup),work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverZgebrd_rank_1 = hipsolverZgebrd_raw(handle,m,n,c_loc(A),lda,c_loc(D),c_loc(E),c_loc(tauq),c_loc(taup),work,lwork,devInfo)
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
      type(c_ptr) :: lwork
      !
      hipsolverSgeqrf_bufferSize_full_rank = hipsolverSgeqrf_bufferSize_raw(handle,m,n,c_loc(A),lda,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverSgeqrf_bufferSize_rank_0 = hipsolverSgeqrf_bufferSize_raw(handle,m,n,c_loc(A),lda,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverSgeqrf_bufferSize_rank_1 = hipsolverSgeqrf_bufferSize_raw(handle,m,n,c_loc(A),lda,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverDgeqrf_bufferSize_full_rank = hipsolverDgeqrf_bufferSize_raw(handle,m,n,c_loc(A),lda,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverDgeqrf_bufferSize_rank_0 = hipsolverDgeqrf_bufferSize_raw(handle,m,n,c_loc(A),lda,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverDgeqrf_bufferSize_rank_1 = hipsolverDgeqrf_bufferSize_raw(handle,m,n,c_loc(A),lda,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverCgeqrf_bufferSize_full_rank = hipsolverCgeqrf_bufferSize_raw(handle,m,n,c_loc(A),lda,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverCgeqrf_bufferSize_rank_0 = hipsolverCgeqrf_bufferSize_raw(handle,m,n,c_loc(A),lda,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverCgeqrf_bufferSize_rank_1 = hipsolverCgeqrf_bufferSize_raw(handle,m,n,c_loc(A),lda,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverZgeqrf_bufferSize_full_rank = hipsolverZgeqrf_bufferSize_raw(handle,m,n,c_loc(A),lda,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverZgeqrf_bufferSize_rank_0 = hipsolverZgeqrf_bufferSize_raw(handle,m,n,c_loc(A),lda,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverZgeqrf_bufferSize_rank_1 = hipsolverZgeqrf_bufferSize_raw(handle,m,n,c_loc(A),lda,lwork)
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
      type(c_ptr) :: devInfo
      !
      hipsolverSgeqrf_full_rank = hipsolverSgeqrf_raw(handle,m,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverSgeqrf_rank_0 = hipsolverSgeqrf_raw(handle,m,n,c_loc(A),lda,tau,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverSgeqrf_rank_1 = hipsolverSgeqrf_raw(handle,m,n,c_loc(A),lda,tau,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverDgeqrf_full_rank = hipsolverDgeqrf_raw(handle,m,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverDgeqrf_rank_0 = hipsolverDgeqrf_raw(handle,m,n,c_loc(A),lda,tau,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverDgeqrf_rank_1 = hipsolverDgeqrf_raw(handle,m,n,c_loc(A),lda,tau,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverCgeqrf_full_rank = hipsolverCgeqrf_raw(handle,m,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverCgeqrf_rank_0 = hipsolverCgeqrf_raw(handle,m,n,c_loc(A),lda,tau,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverCgeqrf_rank_1 = hipsolverCgeqrf_raw(handle,m,n,c_loc(A),lda,tau,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverZgeqrf_full_rank = hipsolverZgeqrf_raw(handle,m,n,c_loc(A),lda,tau,work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverZgeqrf_rank_0 = hipsolverZgeqrf_raw(handle,m,n,c_loc(A),lda,tau,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverZgeqrf_rank_1 = hipsolverZgeqrf_raw(handle,m,n,c_loc(A),lda,tau,work,lwork,devInfo)
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
      type(c_ptr) :: lwork
      !
      hipsolverSgetrf_bufferSize_full_rank = hipsolverSgetrf_bufferSize_raw(handle,m,n,c_loc(A),lda,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverSgetrf_bufferSize_rank_0 = hipsolverSgetrf_bufferSize_raw(handle,m,n,c_loc(A),lda,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverSgetrf_bufferSize_rank_1 = hipsolverSgetrf_bufferSize_raw(handle,m,n,c_loc(A),lda,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverDgetrf_bufferSize_full_rank = hipsolverDgetrf_bufferSize_raw(handle,m,n,c_loc(A),lda,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverDgetrf_bufferSize_rank_0 = hipsolverDgetrf_bufferSize_raw(handle,m,n,c_loc(A),lda,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverDgetrf_bufferSize_rank_1 = hipsolverDgetrf_bufferSize_raw(handle,m,n,c_loc(A),lda,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverCgetrf_bufferSize_full_rank = hipsolverCgetrf_bufferSize_raw(handle,m,n,c_loc(A),lda,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverCgetrf_bufferSize_rank_0 = hipsolverCgetrf_bufferSize_raw(handle,m,n,c_loc(A),lda,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverCgetrf_bufferSize_rank_1 = hipsolverCgetrf_bufferSize_raw(handle,m,n,c_loc(A),lda,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverZgetrf_bufferSize_full_rank = hipsolverZgetrf_bufferSize_raw(handle,m,n,c_loc(A),lda,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverZgetrf_bufferSize_rank_0 = hipsolverZgetrf_bufferSize_raw(handle,m,n,c_loc(A),lda,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverZgetrf_bufferSize_rank_1 = hipsolverZgetrf_bufferSize_raw(handle,m,n,c_loc(A),lda,lwork)
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
      type(c_ptr) :: devInfo
      !
      hipsolverSgetrf_full_rank = hipsolverSgetrf_raw(handle,m,n,c_loc(A),lda,work,lwork,c_loc(devIpiv),devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverSgetrf_rank_0 = hipsolverSgetrf_raw(handle,m,n,c_loc(A),lda,work,lwork,c_loc(devIpiv),devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverSgetrf_rank_1 = hipsolverSgetrf_raw(handle,m,n,c_loc(A),lda,work,lwork,c_loc(devIpiv),devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverDgetrf_full_rank = hipsolverDgetrf_raw(handle,m,n,c_loc(A),lda,work,lwork,c_loc(devIpiv),devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverDgetrf_rank_0 = hipsolverDgetrf_raw(handle,m,n,c_loc(A),lda,work,lwork,c_loc(devIpiv),devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverDgetrf_rank_1 = hipsolverDgetrf_raw(handle,m,n,c_loc(A),lda,work,lwork,c_loc(devIpiv),devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverCgetrf_full_rank = hipsolverCgetrf_raw(handle,m,n,c_loc(A),lda,work,lwork,c_loc(devIpiv),devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverCgetrf_rank_0 = hipsolverCgetrf_raw(handle,m,n,c_loc(A),lda,work,lwork,c_loc(devIpiv),devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverCgetrf_rank_1 = hipsolverCgetrf_raw(handle,m,n,c_loc(A),lda,work,lwork,c_loc(devIpiv),devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverZgetrf_full_rank = hipsolverZgetrf_raw(handle,m,n,c_loc(A),lda,work,lwork,c_loc(devIpiv),devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverZgetrf_rank_0 = hipsolverZgetrf_raw(handle,m,n,c_loc(A),lda,work,lwork,c_loc(devIpiv),devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverZgetrf_rank_1 = hipsolverZgetrf_raw(handle,m,n,c_loc(A),lda,work,lwork,c_loc(devIpiv),devInfo)
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
      type(c_ptr) :: lwork
      !
      hipsolverSgetrs_bufferSize_full_rank = hipsolverSgetrs_bufferSize_raw(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverSgetrs_bufferSize_rank_0 = hipsolverSgetrs_bufferSize_raw(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverSgetrs_bufferSize_rank_1 = hipsolverSgetrs_bufferSize_raw(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverDgetrs_bufferSize_full_rank = hipsolverDgetrs_bufferSize_raw(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverDgetrs_bufferSize_rank_0 = hipsolverDgetrs_bufferSize_raw(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverDgetrs_bufferSize_rank_1 = hipsolverDgetrs_bufferSize_raw(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverCgetrs_bufferSize_full_rank = hipsolverCgetrs_bufferSize_raw(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverCgetrs_bufferSize_rank_0 = hipsolverCgetrs_bufferSize_raw(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverCgetrs_bufferSize_rank_1 = hipsolverCgetrs_bufferSize_raw(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverZgetrs_bufferSize_full_rank = hipsolverZgetrs_bufferSize_raw(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverZgetrs_bufferSize_rank_0 = hipsolverZgetrs_bufferSize_raw(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverZgetrs_bufferSize_rank_1 = hipsolverZgetrs_bufferSize_raw(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,lwork)
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
      type(c_ptr) :: devInfo
      !
      hipsolverSgetrs_full_rank = hipsolverSgetrs_raw(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverSgetrs_rank_0 = hipsolverSgetrs_raw(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverSgetrs_rank_1 = hipsolverSgetrs_raw(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverDgetrs_full_rank = hipsolverDgetrs_raw(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverDgetrs_rank_0 = hipsolverDgetrs_raw(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverDgetrs_rank_1 = hipsolverDgetrs_raw(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverCgetrs_full_rank = hipsolverCgetrs_raw(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverCgetrs_rank_0 = hipsolverCgetrs_raw(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverCgetrs_rank_1 = hipsolverCgetrs_raw(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverZgetrs_full_rank = hipsolverZgetrs_raw(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverZgetrs_rank_0 = hipsolverZgetrs_raw(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverZgetrs_rank_1 = hipsolverZgetrs_raw(handle,trans,n,nrhs,c_loc(A),lda,c_loc(devIpiv),c_loc(B),ldb,work,lwork,devInfo)
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
      type(c_ptr) :: lwork
      !
      hipsolverSpotrf_bufferSize_full_rank = hipsolverSpotrf_bufferSize_raw(handle,uplo,n,c_loc(A),lda,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverSpotrf_bufferSize_rank_0 = hipsolverSpotrf_bufferSize_raw(handle,uplo,n,c_loc(A),lda,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverSpotrf_bufferSize_rank_1 = hipsolverSpotrf_bufferSize_raw(handle,uplo,n,c_loc(A),lda,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverDpotrf_bufferSize_full_rank = hipsolverDpotrf_bufferSize_raw(handle,uplo,n,c_loc(A),lda,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverDpotrf_bufferSize_rank_0 = hipsolverDpotrf_bufferSize_raw(handle,uplo,n,c_loc(A),lda,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverDpotrf_bufferSize_rank_1 = hipsolverDpotrf_bufferSize_raw(handle,uplo,n,c_loc(A),lda,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverCpotrf_bufferSize_full_rank = hipsolverCpotrf_bufferSize_raw(handle,uplo,n,c_loc(A),lda,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverCpotrf_bufferSize_rank_0 = hipsolverCpotrf_bufferSize_raw(handle,uplo,n,c_loc(A),lda,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverCpotrf_bufferSize_rank_1 = hipsolverCpotrf_bufferSize_raw(handle,uplo,n,c_loc(A),lda,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverZpotrf_bufferSize_full_rank = hipsolverZpotrf_bufferSize_raw(handle,uplo,n,c_loc(A),lda,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverZpotrf_bufferSize_rank_0 = hipsolverZpotrf_bufferSize_raw(handle,uplo,n,c_loc(A),lda,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverZpotrf_bufferSize_rank_1 = hipsolverZpotrf_bufferSize_raw(handle,uplo,n,c_loc(A),lda,lwork)
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
      type(c_ptr) :: devInfo
      !
      hipsolverSpotrf_full_rank = hipsolverSpotrf_raw(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverSpotrf_rank_0 = hipsolverSpotrf_raw(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverSpotrf_rank_1 = hipsolverSpotrf_raw(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverDpotrf_full_rank = hipsolverDpotrf_raw(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverDpotrf_rank_0 = hipsolverDpotrf_raw(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverDpotrf_rank_1 = hipsolverDpotrf_raw(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverCpotrf_full_rank = hipsolverCpotrf_raw(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverCpotrf_rank_0 = hipsolverCpotrf_raw(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverCpotrf_rank_1 = hipsolverCpotrf_raw(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverZpotrf_full_rank = hipsolverZpotrf_raw(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverZpotrf_rank_0 = hipsolverZpotrf_raw(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverZpotrf_rank_1 = hipsolverZpotrf_raw(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo)
    end function

    function hipsolverSpotrfBatched_bufferSize_full_rank(handle,uplo,n,A,lda,lwork,batch_count)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrfBatched_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:,:,:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: lwork
      integer(c_int) :: batch_count
      !
      hipsolverSpotrfBatched_bufferSize_full_rank = hipsolverSpotrfBatched_bufferSize_raw(handle,uplo,n,c_loc(A),lda,lwork,batch_count)
    end function

    function hipsolverSpotrfBatched_bufferSize_rank_0(handle,uplo,n,A,lda,lwork,batch_count)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrfBatched_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      type(c_ptr) :: lwork
      integer(c_int) :: batch_count
      !
      hipsolverSpotrfBatched_bufferSize_rank_0 = hipsolverSpotrfBatched_bufferSize_raw(handle,uplo,n,c_loc(A),lda,lwork,batch_count)
    end function

    function hipsolverSpotrfBatched_bufferSize_rank_1(handle,uplo,n,A,lda,lwork,batch_count)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrfBatched_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: lwork
      integer(c_int) :: batch_count
      !
      hipsolverSpotrfBatched_bufferSize_rank_1 = hipsolverSpotrfBatched_bufferSize_raw(handle,uplo,n,c_loc(A),lda,lwork,batch_count)
    end function

    function hipsolverDpotrfBatched_bufferSize_full_rank(handle,uplo,n,A,lda,lwork,batch_count)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrfBatched_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:,:,:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: lwork
      integer(c_int) :: batch_count
      !
      hipsolverDpotrfBatched_bufferSize_full_rank = hipsolverDpotrfBatched_bufferSize_raw(handle,uplo,n,c_loc(A),lda,lwork,batch_count)
    end function

    function hipsolverDpotrfBatched_bufferSize_rank_0(handle,uplo,n,A,lda,lwork,batch_count)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrfBatched_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      type(c_ptr) :: lwork
      integer(c_int) :: batch_count
      !
      hipsolverDpotrfBatched_bufferSize_rank_0 = hipsolverDpotrfBatched_bufferSize_raw(handle,uplo,n,c_loc(A),lda,lwork,batch_count)
    end function

    function hipsolverDpotrfBatched_bufferSize_rank_1(handle,uplo,n,A,lda,lwork,batch_count)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrfBatched_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: lwork
      integer(c_int) :: batch_count
      !
      hipsolverDpotrfBatched_bufferSize_rank_1 = hipsolverDpotrfBatched_bufferSize_raw(handle,uplo,n,c_loc(A),lda,lwork,batch_count)
    end function

    function hipsolverCpotrfBatched_bufferSize_full_rank(handle,uplo,n,A,lda,lwork,batch_count)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrfBatched_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:,:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: lwork
      integer(c_int) :: batch_count
      !
      hipsolverCpotrfBatched_bufferSize_full_rank = hipsolverCpotrfBatched_bufferSize_raw(handle,uplo,n,c_loc(A),lda,lwork,batch_count)
    end function

    function hipsolverCpotrfBatched_bufferSize_rank_0(handle,uplo,n,A,lda,lwork,batch_count)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrfBatched_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      type(c_ptr) :: lwork
      integer(c_int) :: batch_count
      !
      hipsolverCpotrfBatched_bufferSize_rank_0 = hipsolverCpotrfBatched_bufferSize_raw(handle,uplo,n,c_loc(A),lda,lwork,batch_count)
    end function

    function hipsolverCpotrfBatched_bufferSize_rank_1(handle,uplo,n,A,lda,lwork,batch_count)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrfBatched_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: lwork
      integer(c_int) :: batch_count
      !
      hipsolverCpotrfBatched_bufferSize_rank_1 = hipsolverCpotrfBatched_bufferSize_raw(handle,uplo,n,c_loc(A),lda,lwork,batch_count)
    end function

    function hipsolverZpotrfBatched_bufferSize_full_rank(handle,uplo,n,A,lda,lwork,batch_count)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrfBatched_bufferSize_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:,:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: lwork
      integer(c_int) :: batch_count
      !
      hipsolverZpotrfBatched_bufferSize_full_rank = hipsolverZpotrfBatched_bufferSize_raw(handle,uplo,n,c_loc(A),lda,lwork,batch_count)
    end function

    function hipsolverZpotrfBatched_bufferSize_rank_0(handle,uplo,n,A,lda,lwork,batch_count)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrfBatched_bufferSize_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      type(c_ptr) :: lwork
      integer(c_int) :: batch_count
      !
      hipsolverZpotrfBatched_bufferSize_rank_0 = hipsolverZpotrfBatched_bufferSize_raw(handle,uplo,n,c_loc(A),lda,lwork,batch_count)
    end function

    function hipsolverZpotrfBatched_bufferSize_rank_1(handle,uplo,n,A,lda,lwork,batch_count)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrfBatched_bufferSize_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: lwork
      integer(c_int) :: batch_count
      !
      hipsolverZpotrfBatched_bufferSize_rank_1 = hipsolverZpotrfBatched_bufferSize_raw(handle,uplo,n,c_loc(A),lda,lwork,batch_count)
    end function

    function hipsolverSpotrfBatched_full_rank(handle,uplo,n,A,lda,work,lwork,devInfo,batch_count)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrfBatched_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:,:,:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      type(c_ptr) :: devInfo
      integer(c_int) :: batch_count
      !
      hipsolverSpotrfBatched_full_rank = hipsolverSpotrfBatched_raw(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo,batch_count)
    end function

    function hipsolverSpotrfBatched_rank_0(handle,uplo,n,A,lda,work,lwork,devInfo,batch_count)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrfBatched_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      type(c_ptr) :: devInfo
      integer(c_int) :: batch_count
      !
      hipsolverSpotrfBatched_rank_0 = hipsolverSpotrfBatched_raw(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo,batch_count)
    end function

    function hipsolverSpotrfBatched_rank_1(handle,uplo,n,A,lda,work,lwork,devInfo,batch_count)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverSpotrfBatched_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_float),target,dimension(:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      type(c_ptr) :: devInfo
      integer(c_int) :: batch_count
      !
      hipsolverSpotrfBatched_rank_1 = hipsolverSpotrfBatched_raw(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo,batch_count)
    end function

    function hipsolverDpotrfBatched_full_rank(handle,uplo,n,A,lda,work,lwork,devInfo,batch_count)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrfBatched_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:,:,:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      type(c_ptr) :: devInfo
      integer(c_int) :: batch_count
      !
      hipsolverDpotrfBatched_full_rank = hipsolverDpotrfBatched_raw(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo,batch_count)
    end function

    function hipsolverDpotrfBatched_rank_0(handle,uplo,n,A,lda,work,lwork,devInfo,batch_count)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrfBatched_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      type(c_ptr) :: devInfo
      integer(c_int) :: batch_count
      !
      hipsolverDpotrfBatched_rank_0 = hipsolverDpotrfBatched_raw(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo,batch_count)
    end function

    function hipsolverDpotrfBatched_rank_1(handle,uplo,n,A,lda,work,lwork,devInfo,batch_count)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverDpotrfBatched_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      real(c_double),target,dimension(:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      type(c_ptr) :: devInfo
      integer(c_int) :: batch_count
      !
      hipsolverDpotrfBatched_rank_1 = hipsolverDpotrfBatched_raw(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo,batch_count)
    end function

    function hipsolverCpotrfBatched_full_rank(handle,uplo,n,A,lda,work,lwork,devInfo,batch_count)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrfBatched_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:,:,:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      type(c_ptr) :: devInfo
      integer(c_int) :: batch_count
      !
      hipsolverCpotrfBatched_full_rank = hipsolverCpotrfBatched_raw(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo,batch_count)
    end function

    function hipsolverCpotrfBatched_rank_0(handle,uplo,n,A,lda,work,lwork,devInfo,batch_count)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrfBatched_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      type(c_ptr) :: devInfo
      integer(c_int) :: batch_count
      !
      hipsolverCpotrfBatched_rank_0 = hipsolverCpotrfBatched_raw(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo,batch_count)
    end function

    function hipsolverCpotrfBatched_rank_1(handle,uplo,n,A,lda,work,lwork,devInfo,batch_count)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverCpotrfBatched_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_float_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      type(c_ptr) :: devInfo
      integer(c_int) :: batch_count
      !
      hipsolverCpotrfBatched_rank_1 = hipsolverCpotrfBatched_raw(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo,batch_count)
    end function

    function hipsolverZpotrfBatched_full_rank(handle,uplo,n,A,lda,work,lwork,devInfo,batch_count)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrfBatched_full_rank
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:,:,:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      type(c_ptr) :: devInfo
      integer(c_int) :: batch_count
      !
      hipsolverZpotrfBatched_full_rank = hipsolverZpotrfBatched_raw(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo,batch_count)
    end function

    function hipsolverZpotrfBatched_rank_0(handle,uplo,n,A,lda,work,lwork,devInfo,batch_count)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrfBatched_rank_0
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      type(c_ptr) :: devInfo
      integer(c_int) :: batch_count
      !
      hipsolverZpotrfBatched_rank_0 = hipsolverZpotrfBatched_raw(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo,batch_count)
    end function

    function hipsolverZpotrfBatched_rank_1(handle,uplo,n,A,lda,work,lwork,devInfo,batch_count)
      use iso_c_binding
      use hipfort_hipsolver_enums
      implicit none
      integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: hipsolverZpotrfBatched_rank_1
      type(c_ptr) :: handle
      integer(kind(HIPSOLVER_FILL_MODE_UPPER)) :: uplo
      integer(c_int) :: n
      complex(c_double_complex),target,dimension(:) :: A
      integer(c_int) :: lda
      type(c_ptr) :: work
      integer(c_int) :: lwork
      type(c_ptr) :: devInfo
      integer(c_int) :: batch_count
      !
      hipsolverZpotrfBatched_rank_1 = hipsolverZpotrfBatched_raw(handle,uplo,n,c_loc(A),lda,work,lwork,devInfo,batch_count)
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
      type(c_ptr) :: lwork
      !
      hipsolverSsyevd_bufferSize_full_rank = hipsolverSsyevd_bufferSize_raw(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverSsyevd_bufferSize_rank_0 = hipsolverSsyevd_bufferSize_raw(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverSsyevd_bufferSize_rank_1 = hipsolverSsyevd_bufferSize_raw(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverDsyevd_bufferSize_full_rank = hipsolverDsyevd_bufferSize_raw(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverDsyevd_bufferSize_rank_0 = hipsolverDsyevd_bufferSize_raw(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverDsyevd_bufferSize_rank_1 = hipsolverDsyevd_bufferSize_raw(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverCheevd_bufferSize_full_rank = hipsolverCheevd_bufferSize_raw(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverCheevd_bufferSize_rank_0 = hipsolverCheevd_bufferSize_raw(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverCheevd_bufferSize_rank_1 = hipsolverCheevd_bufferSize_raw(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverZheevd_bufferSize_full_rank = hipsolverZheevd_bufferSize_raw(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverZheevd_bufferSize_rank_0 = hipsolverZheevd_bufferSize_raw(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverZheevd_bufferSize_rank_1 = hipsolverZheevd_bufferSize_raw(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),lwork)
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
      type(c_ptr) :: devInfo
      !
      hipsolverSsyevd_full_rank = hipsolverSsyevd_raw(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverSsyevd_rank_0 = hipsolverSsyevd_raw(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverSsyevd_rank_1 = hipsolverSsyevd_raw(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverDsyevd_full_rank = hipsolverDsyevd_raw(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverDsyevd_rank_0 = hipsolverDsyevd_raw(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverDsyevd_rank_1 = hipsolverDsyevd_raw(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverCheevd_full_rank = hipsolverCheevd_raw(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverCheevd_rank_0 = hipsolverCheevd_raw(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverCheevd_rank_1 = hipsolverCheevd_raw(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverZheevd_full_rank = hipsolverZheevd_raw(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverZheevd_rank_0 = hipsolverZheevd_raw(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverZheevd_rank_1 = hipsolverZheevd_raw(handle,jobz,uplo,n,c_loc(A),lda,c_loc(D),work,lwork,devInfo)
    end function

    function hipsolverSsygvd_bufferSize_full_rank(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,lwork)
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
      real(c_float),target,dimension(:) :: D
      type(c_ptr) :: lwork
      !
      hipsolverSsygvd_bufferSize_full_rank = hipsolverSsygvd_bufferSize_raw(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B),ldb,c_loc(D),lwork)
    end function

    function hipsolverSsygvd_bufferSize_rank_0(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,lwork)
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
      real(c_float),target :: D
      type(c_ptr) :: lwork
      !
      hipsolverSsygvd_bufferSize_rank_0 = hipsolverSsygvd_bufferSize_raw(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B),ldb,c_loc(D),lwork)
    end function

    function hipsolverSsygvd_bufferSize_rank_1(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,lwork)
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
      real(c_float),target,dimension(:) :: D
      type(c_ptr) :: lwork
      !
      hipsolverSsygvd_bufferSize_rank_1 = hipsolverSsygvd_bufferSize_raw(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B),ldb,c_loc(D),lwork)
    end function

    function hipsolverDsygvd_bufferSize_full_rank(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,lwork)
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
      real(c_double),target,dimension(:) :: D
      type(c_ptr) :: lwork
      !
      hipsolverDsygvd_bufferSize_full_rank = hipsolverDsygvd_bufferSize_raw(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B),ldb,c_loc(D),lwork)
    end function

    function hipsolverDsygvd_bufferSize_rank_0(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,lwork)
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
      real(c_double),target :: D
      type(c_ptr) :: lwork
      !
      hipsolverDsygvd_bufferSize_rank_0 = hipsolverDsygvd_bufferSize_raw(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B),ldb,c_loc(D),lwork)
    end function

    function hipsolverDsygvd_bufferSize_rank_1(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,lwork)
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
      real(c_double),target,dimension(:) :: D
      type(c_ptr) :: lwork
      !
      hipsolverDsygvd_bufferSize_rank_1 = hipsolverDsygvd_bufferSize_raw(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B),ldb,c_loc(D),lwork)
    end function

    function hipsolverChegvd_bufferSize_full_rank(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,lwork)
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
      real(c_float),target,dimension(:) :: D
      type(c_ptr) :: lwork
      !
      hipsolverChegvd_bufferSize_full_rank = hipsolverChegvd_bufferSize_raw(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B),ldb,c_loc(D),lwork)
    end function

    function hipsolverChegvd_bufferSize_rank_0(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,lwork)
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
      real(c_float),target :: D
      type(c_ptr) :: lwork
      !
      hipsolverChegvd_bufferSize_rank_0 = hipsolverChegvd_bufferSize_raw(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B),ldb,c_loc(D),lwork)
    end function

    function hipsolverChegvd_bufferSize_rank_1(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,lwork)
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
      real(c_float),target,dimension(:) :: D
      type(c_ptr) :: lwork
      !
      hipsolverChegvd_bufferSize_rank_1 = hipsolverChegvd_bufferSize_raw(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B),ldb,c_loc(D),lwork)
    end function

    function hipsolverZhegvd_bufferSize_full_rank(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,lwork)
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
      real(c_double),target,dimension(:) :: D
      type(c_ptr) :: lwork
      !
      hipsolverZhegvd_bufferSize_full_rank = hipsolverZhegvd_bufferSize_raw(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B),ldb,c_loc(D),lwork)
    end function

    function hipsolverZhegvd_bufferSize_rank_0(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,lwork)
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
      real(c_double),target :: D
      type(c_ptr) :: lwork
      !
      hipsolverZhegvd_bufferSize_rank_0 = hipsolverZhegvd_bufferSize_raw(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B),ldb,c_loc(D),lwork)
    end function

    function hipsolverZhegvd_bufferSize_rank_1(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,lwork)
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
      real(c_double),target,dimension(:) :: D
      type(c_ptr) :: lwork
      !
      hipsolverZhegvd_bufferSize_rank_1 = hipsolverZhegvd_bufferSize_raw(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B),ldb,c_loc(D),lwork)
    end function

    function hipsolverSsygvd_full_rank(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,work,lwork,devInfo)
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
      real(c_float),target,dimension(:) :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      type(c_ptr) :: devInfo
      !
      hipsolverSsygvd_full_rank = hipsolverSsygvd_raw(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B),ldb,c_loc(D),work,lwork,devInfo)
    end function

    function hipsolverSsygvd_rank_0(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,work,lwork,devInfo)
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
      real(c_float),target :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      type(c_ptr) :: devInfo
      !
      hipsolverSsygvd_rank_0 = hipsolverSsygvd_raw(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B),ldb,c_loc(D),work,lwork,devInfo)
    end function

    function hipsolverSsygvd_rank_1(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,work,lwork,devInfo)
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
      real(c_float),target,dimension(:) :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      type(c_ptr) :: devInfo
      !
      hipsolverSsygvd_rank_1 = hipsolverSsygvd_raw(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B),ldb,c_loc(D),work,lwork,devInfo)
    end function

    function hipsolverDsygvd_full_rank(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,work,lwork,devInfo)
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
      real(c_double),target,dimension(:) :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      type(c_ptr) :: devInfo
      !
      hipsolverDsygvd_full_rank = hipsolverDsygvd_raw(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B),ldb,c_loc(D),work,lwork,devInfo)
    end function

    function hipsolverDsygvd_rank_0(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,work,lwork,devInfo)
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
      real(c_double),target :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      type(c_ptr) :: devInfo
      !
      hipsolverDsygvd_rank_0 = hipsolverDsygvd_raw(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B),ldb,c_loc(D),work,lwork,devInfo)
    end function

    function hipsolverDsygvd_rank_1(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,work,lwork,devInfo)
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
      real(c_double),target,dimension(:) :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      type(c_ptr) :: devInfo
      !
      hipsolverDsygvd_rank_1 = hipsolverDsygvd_raw(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B),ldb,c_loc(D),work,lwork,devInfo)
    end function

    function hipsolverChegvd_full_rank(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,work,lwork,devInfo)
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
      real(c_float),target,dimension(:) :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      type(c_ptr) :: devInfo
      !
      hipsolverChegvd_full_rank = hipsolverChegvd_raw(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B),ldb,c_loc(D),work,lwork,devInfo)
    end function

    function hipsolverChegvd_rank_0(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,work,lwork,devInfo)
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
      real(c_float),target :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      type(c_ptr) :: devInfo
      !
      hipsolverChegvd_rank_0 = hipsolverChegvd_raw(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B),ldb,c_loc(D),work,lwork,devInfo)
    end function

    function hipsolverChegvd_rank_1(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,work,lwork,devInfo)
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
      real(c_float),target,dimension(:) :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      type(c_ptr) :: devInfo
      !
      hipsolverChegvd_rank_1 = hipsolverChegvd_raw(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B),ldb,c_loc(D),work,lwork,devInfo)
    end function

    function hipsolverZhegvd_full_rank(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,work,lwork,devInfo)
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
      real(c_double),target,dimension(:) :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      type(c_ptr) :: devInfo
      !
      hipsolverZhegvd_full_rank = hipsolverZhegvd_raw(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B),ldb,c_loc(D),work,lwork,devInfo)
    end function

    function hipsolverZhegvd_rank_0(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,work,lwork,devInfo)
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
      real(c_double),target :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      type(c_ptr) :: devInfo
      !
      hipsolverZhegvd_rank_0 = hipsolverZhegvd_raw(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B),ldb,c_loc(D),work,lwork,devInfo)
    end function

    function hipsolverZhegvd_rank_1(handle,itype,jobz,uplo,n,A,lda,B,ldb,D,work,lwork,devInfo)
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
      real(c_double),target,dimension(:) :: D
      type(c_ptr) :: work
      integer(c_int) :: lwork
      type(c_ptr) :: devInfo
      !
      hipsolverZhegvd_rank_1 = hipsolverZhegvd_raw(handle,itype,jobz,uplo,n,c_loc(A),lda,c_loc(B),ldb,c_loc(D),work,lwork,devInfo)
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
      type(c_ptr) :: lwork
      !
      hipsolverSsytrd_bufferSize_full_rank = hipsolverSsytrd_bufferSize_raw(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverSsytrd_bufferSize_rank_0 = hipsolverSsytrd_bufferSize_raw(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverSsytrd_bufferSize_rank_1 = hipsolverSsytrd_bufferSize_raw(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverDsytrd_bufferSize_full_rank = hipsolverDsytrd_bufferSize_raw(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverDsytrd_bufferSize_rank_0 = hipsolverDsytrd_bufferSize_raw(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverDsytrd_bufferSize_rank_1 = hipsolverDsytrd_bufferSize_raw(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverChetrd_bufferSize_full_rank = hipsolverChetrd_bufferSize_raw(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverChetrd_bufferSize_rank_0 = hipsolverChetrd_bufferSize_raw(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverChetrd_bufferSize_rank_1 = hipsolverChetrd_bufferSize_raw(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverZhetrd_bufferSize_full_rank = hipsolverZhetrd_bufferSize_raw(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau,lwork)
    end function

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
      type(c_ptr) :: lwork
      !
      hipsolverZhetrd_bufferSize_rank_0 = hipsolverZhetrd_bufferSize_raw(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau,lwork)
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
      type(c_ptr) :: lwork
      !
      hipsolverZhetrd_bufferSize_rank_1 = hipsolverZhetrd_bufferSize_raw(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau,lwork)
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
      type(c_ptr) :: devInfo
      !
      hipsolverSsytrd_full_rank = hipsolverSsytrd_raw(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau,work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverSsytrd_rank_0 = hipsolverSsytrd_raw(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverSsytrd_rank_1 = hipsolverSsytrd_raw(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverDsytrd_full_rank = hipsolverDsytrd_raw(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau,work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverDsytrd_rank_0 = hipsolverDsytrd_raw(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverDsytrd_rank_1 = hipsolverDsytrd_raw(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverChetrd_full_rank = hipsolverChetrd_raw(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau,work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverChetrd_rank_0 = hipsolverChetrd_raw(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverChetrd_rank_1 = hipsolverChetrd_raw(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverZhetrd_full_rank = hipsolverZhetrd_raw(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau,work,lwork,devInfo)
    end function

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
      type(c_ptr) :: devInfo
      !
      hipsolverZhetrd_rank_0 = hipsolverZhetrd_raw(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau,work,lwork,devInfo)
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
      type(c_ptr) :: devInfo
      !
      hipsolverZhetrd_rank_1 = hipsolverZhetrd_raw(handle,uplo,n,c_loc(A),lda,c_loc(D),c_loc(E),tau,work,lwork,devInfo)
    end function

  
#endif
end module hipfort_hipsolver