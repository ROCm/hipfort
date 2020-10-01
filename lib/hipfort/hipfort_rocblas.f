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
          
           
module hipfort_rocblas
  use hipfort_rocblas_enums
  implicit none

 
  interface
  !> 
  !>   ===========================================================================
  !>      level 1 BLAS
  !>   ===========================================================================
  !>  
    function rocblas_sscal(handle,incx) bind(c, name="rocblas_sscal")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sscal
      type(c_ptr),value :: handle
      integer(c_int),value :: incx
    end function

  
    function rocblas_dscal(handle,incx) bind(c, name="rocblas_dscal")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dscal
      type(c_ptr),value :: handle
      integer(c_int),value :: incx
    end function

  
    function rocblas_cscal(handle,n,alpha,x,incx) bind(c, name="rocblas_cscal")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cscal
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
    function rocblas_zscal(handle,n,alpha,x,incx) bind(c, name="rocblas_zscal")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zscal
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
    function rocblas_csscal(handle,n,alpha,x,incx) bind(c, name="rocblas_csscal")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_csscal
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  !> ! \brief BLAS Level 1 API
  !> 
  !>     \details
  !>     scal  scales each element of vector x with scalar alpha.
  !> 
  !>         x := alpha  x
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of elements in x.
  !>     @param[in]
  !>     alpha     device pointer or host pointer for the scalar alpha.
  !>     @param[inout]
  !>     x         device pointer storing vector x.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of x.
  !> 
  !> 
  !>     
    function rocblas_zdscal(handle,n,alpha,x,incx) bind(c, name="rocblas_zdscal")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zdscal
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
    function rocblas_sscal_batched(handle,n,alpha,x,incx,batch_count) bind(c, name="rocblas_sscal_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sscal_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dscal_batched(handle,n,alpha,x,incx,batch_count) bind(c, name="rocblas_dscal_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dscal_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_cscal_batched(handle,n,alpha,x,incx,batch_count) bind(c, name="rocblas_cscal_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cscal_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_zscal_batched(handle,n,alpha,x,incx,batch_count) bind(c, name="rocblas_zscal_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zscal_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_csscal_batched(handle,n,alpha,x,incx,batch_count) bind(c, name="rocblas_csscal_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_csscal_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 1 API
  !>      \details
  !>     scal_batched  scales each element of vector x_i with scalar alpha, for i = 1, ... , batch_count.
  !> 
  !>          x_i := alpha  x_i
  !> 
  !>      where (x_i) is the i-th instance of the batch.
  !>     @param[in]
  !>     handle      [rocblas_handle]
  !>                 handle to the rocblas library context queue.
  !>     @param[in]
  !>     n           [rocblas_int]
  !>                 the number of elements in each x_i.
  !>     @param[in]
  !>     alpha       host pointer or device pointer for the scalar alpha.
  !>     @param[inout]
  !>     x           device array of device pointers storing each vector x_i.
  !>     @param[in]
  !>     incx        [rocblas_int]
  !>                 specifies the increment for the elements of each x_i.
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 specifies the number of batches in x.
  !>      
    function rocblas_zdscal_batched(handle,n,alpha,x,incx,batch_count) bind(c, name="rocblas_zdscal_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zdscal_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_sscal_strided_batched(handle,n,alpha,x,incx,stride_x,batch_count) bind(c, name="rocblas_sscal_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sscal_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dscal_strided_batched(handle,n,alpha,x,incx,stride_x,batch_count) bind(c, name="rocblas_dscal_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dscal_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_cscal_strided_batched(handle,n,alpha,x,incx,stride_x,batch_count) bind(c, name="rocblas_cscal_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cscal_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_zscal_strided_batched(handle,n,alpha,x,incx,stride_x,batch_count) bind(c, name="rocblas_zscal_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zscal_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_csscal_strided_batched(handle,n,alpha,x,incx,stride_x,batch_count) bind(c, name="rocblas_csscal_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_csscal_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 1 API
  !>      \details
  !>     scal_strided_batched  scales each element of vector x_i with scalar alpha, for i = 1, ... , batch_count.
  !> 
  !>          x_i := alpha  x_i ,
  !> 
  !>      where (x_i) is the i-th instance of the batch.
  !>      @param[in]
  !>     handle      [rocblas_handle]
  !>                 handle to the rocblas library context queue.
  !>     @param[in]
  !>     n           [rocblas_int]
  !>                 the number of elements in each x_i.
  !>     @param[in]
  !>     alpha       host pointer or device pointer for the scalar alpha.
  !>     @param[inout]
  !>     x           device pointer to the first vector (x_1) in the batch.
  !>     @param[in]
  !>     incx        [rocblas_int]
  !>                 specifies the increment for the elements of x.
  !>     @param[in]
  !>     stride_x    [rocblas_stride]
  !>                 stride from the start of one vector (x_i) and the next one (x_i+1).
  !>                 There are no restrictions placed on stride_x, however the user should
  !>                 take care to ensure that stride_x is of appropriate size, for a typical
  !>                 case this means stride_x >= n  incx.
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 specifies the number of batches in x.
  !>      
    function rocblas_zdscal_strided_batched(handle,n,alpha,x,incx,stride_x,batch_count) bind(c, name="rocblas_zdscal_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zdscal_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_scopy(handle,n,x,incx,y,incy) bind(c, name="rocblas_scopy")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_scopy
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
    function rocblas_dcopy(handle,n,x,incx,y,incy) bind(c, name="rocblas_dcopy")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dcopy
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
    function rocblas_ccopy(handle,n,x,incx,y,incy) bind(c, name="rocblas_ccopy")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ccopy
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  !> ! \brief BLAS Level 1 API
  !> 
  !>     \details
  !>     copy  copies each element x[i] into y[i], for  i = 1 , ... , n
  !> 
  !>         y := x,
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of elements in x to be copied to y.
  !>     @param[in]
  !>     x         device pointer storing vector x.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of x.
  !>     @param[out]
  !>     y         device pointer storing vector y.
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of y.
  !> 
  !>     
    function rocblas_zcopy(handle,n,x,incx,y,incy) bind(c, name="rocblas_zcopy")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zcopy
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
    function rocblas_scopy_batched(handle,n,x,incx,y,incy,batch_count) bind(c, name="rocblas_scopy_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_scopy_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dcopy_batched(handle,n,x,incx,y,incy,batch_count) bind(c, name="rocblas_dcopy_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dcopy_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_ccopy_batched(handle,n,x,incx,y,incy,batch_count) bind(c, name="rocblas_ccopy_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ccopy_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 1 API
  !> 
  !>     \details
  !>     copy_batched copies each element x_i[j] into y_i[j], for  j = 1 , ... , n; i = 1 , ... , batch_count
  !> 
  !>         y_i := x_i,
  !> 
  !>     where (x_i, y_i) is the i-th instance of the batch.
  !>     x_i and y_i are vectors.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of elements in each x_i to be copied to y_i.
  !>     @param[in]
  !>     x         device array of device pointers storing each vector x_i.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each vector x_i.
  !>     @param[out]
  !>     y         device array of device pointers storing each vector y_i.
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of each vector y_i.
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch
  !> 
  !>     
    function rocblas_zcopy_batched(handle,n,x,incx,y,incy,batch_count) bind(c, name="rocblas_zcopy_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zcopy_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_scopy_strided_batched(handle,n,x,incx,stridex,y,incy,stridey,batch_count) bind(c, name="rocblas_scopy_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_scopy_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dcopy_strided_batched(handle,n,x,incx,stridex,y,incy,stridey,batch_count) bind(c, name="rocblas_dcopy_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dcopy_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_ccopy_strided_batched(handle,n,x,incx,stridex,y,incy,stridey,batch_count) bind(c, name="rocblas_ccopy_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ccopy_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 1 API
  !> 
  !>     \details
  !>     copy_strided_batched copies each element x_i[j] into y_i[j], for  j = 1 , ... , n; i = 1 , ... , batch_count
  !> 
  !>         y_i := x_i,
  !> 
  !>     where (x_i, y_i) is the i-th instance of the batch.
  !>     x_i and y_i are vectors.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of elements in each x_i to be copied to y_i.
  !>     @param[in]
  !>     x         device pointer to the first vector (x_1) in the batch.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increments for the elements of vectors x_i.
  !>     @param[in]
  !>     stridex     [rocblas_stride]
  !>                 stride from the start of one vector (x_i) and the next one (x_i+1).
  !>                 There are no restrictions placed on stride_x, however the user should
  !>                 take care to ensure that stride_x is of appropriate size, for a typical
  !>                 case this means stride_x >= n  incx.
  !>     @param[out]
  !>     y         device pointer to the first vector (y_1) in the batch.
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of vectors y_i.
  !>     @param[in]
  !>     stridey     [rocblas_stride]
  !>                 stride from the start of one vector (y_i) and the next one (y_i+1).
  !>                 There are no restrictions placed on stride_y, however the user should
  !>                 take care to ensure that stride_y is of appropriate size, for a typical
  !>                 case this means stride_y >= n  incy. stridey should be non zero.
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of y.
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch
  !> 
  !>     
    function rocblas_zcopy_strided_batched(handle,n,x,incx,stridex,y,incy,stridey,batch_count) bind(c, name="rocblas_zcopy_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zcopy_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_sdot(handle,n,x,incx,y,incy,myResult) bind(c, name="rocblas_sdot")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sdot
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_ddot(handle,n,x,incx,y,incy,myResult) bind(c, name="rocblas_ddot")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ddot
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_hdot(handle,n,x,incx,y,incy,myResult) bind(c, name="rocblas_hdot")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_hdot
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr) :: myResult
    end function

  
    function rocblas_bfdot(handle,n,x,incx,y,incy,myResult) bind(c, name="rocblas_bfdot")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_bfdot
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_cdotu(handle,n,x,incx,y,incy,myResult) bind(c, name="rocblas_cdotu")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cdotu
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_zdotu(handle,n,x,incx,y,incy,myResult) bind(c, name="rocblas_zdotu")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zdotu
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_cdotc(handle,n,x,incx,y,incy,myResult) bind(c, name="rocblas_cdotc")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cdotc
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: myResult
    end function

  !> ! \brief BLAS Level 1 API
  !> 
  !>     \details
  !>     dot(u)  performs the dot product of vectors x and y
  !> 
  !>         result = x  y;
  !> 
  !>     dotc  performs the dot product of the conjugate of complex vector x and complex vector y
  !> 
  !>         result = conjugate (x)  y;
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of elements in x and y.
  !>     @param[in]
  !>     x         device pointer storing vector x.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of y.
  !>     @param[in]
  !>     y         device pointer storing vector y.
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of y.
  !>     @param[inout]
  !>     result
  !>               device pointer or host pointer to store the dot product.
  !>               return is 0.0 if n <= 0.
  !> 
  !>     
    function rocblas_zdotc(handle,n,x,incx,y,incy,myResult) bind(c, name="rocblas_zdotc")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zdotc
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_sdot_batched(handle,n,x,incx,y,incy,batch_count,myResult) bind(c, name="rocblas_sdot_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sdot_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_ddot_batched(handle,n,x,incx,y,incy,batch_count,myResult) bind(c, name="rocblas_ddot_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ddot_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_hdot_batched(handle,n,x,incx,y,incy,batch_count,myResult) bind(c, name="rocblas_hdot_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_hdot_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
      type(c_ptr) :: myResult
    end function

  
    function rocblas_bfdot_batched(handle,n,x,incx,y,incy,batch_count,myResult) bind(c, name="rocblas_bfdot_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_bfdot_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_cdotu_batched(handle,n,x,incx,y,incy,batch_count,myResult) bind(c, name="rocblas_cdotu_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cdotu_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_zdotu_batched(handle,n,x,incx,y,incy,batch_count,myResult) bind(c, name="rocblas_zdotu_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zdotu_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_cdotc_batched(handle,n,x,incx,y,incy,batch_count,myResult) bind(c, name="rocblas_cdotc_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cdotc_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  !> ! \brief BLAS Level 1 API
  !> 
  !>     \details
  !>     dot_batched(u) performs a batch of dot products of vectors x and y
  !> 
  !>         result_i = x_i  y_i;
  !> 
  !>     dotc_batched  performs a batch of dot products of the conjugate of complex vector x and complex vector y
  !> 
  !>         result_i = conjugate (x_i)  y_i;
  !> 
  !>     where (x_i, y_i) is the i-th instance of the batch.
  !>     x_i and y_i are vectors, for i = 1, ..., batch_count
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of elements in each x_i and y_i.
  !>     @param[in]
  !>     x         device array of device pointers storing each vector x_i.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i.
  !>     @param[in]
  !>     y         device array of device pointers storing each vector y_i.
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of each y_i.
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch
  !>     @param[inout]
  !>     result
  !>               device array or host array of batch_count size to store the dot products of each batch.
  !>               return 0.0 for each element if n <= 0.
  !> 
  !>     
    function rocblas_zdotc_batched(handle,n,x,incx,y,incy,batch_count,myResult) bind(c, name="rocblas_zdotc_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zdotc_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_sdot_strided_batched(handle,n,x,incx,stridex,y,incy,stridey,batch_count,myResult) bind(c, name="rocblas_sdot_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sdot_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_ddot_strided_batched(handle,n,x,incx,stridex,y,incy,stridey,batch_count,myResult) bind(c, name="rocblas_ddot_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ddot_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_hdot_strided_batched(handle,n,x,incx,stridex,y,incy,stridey,batch_count,myResult) bind(c, name="rocblas_hdot_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_hdot_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      integer(c_int),value :: batch_count
      type(c_ptr) :: myResult
    end function

  
    function rocblas_bfdot_strided_batched(handle,n,x,incx,stridex,y,incy,stridey,batch_count,myResult) bind(c, name="rocblas_bfdot_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_bfdot_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_cdotu_strided_batched(handle,n,x,incx,stridex,y,incy,stridey,batch_count,myResult) bind(c, name="rocblas_cdotu_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cdotu_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_zdotu_strided_batched(handle,n,x,incx,stridex,y,incy,stridey,batch_count,myResult) bind(c, name="rocblas_zdotu_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zdotu_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_cdotc_strided_batched(handle,n,x,incx,stridex,y,incy,stridey,batch_count,myResult) bind(c, name="rocblas_cdotc_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cdotc_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  !> ! \brief BLAS Level 1 API
  !> 
  !>     \details
  !>     dot_strided_batched(u)  performs a batch of dot products of vectors x and y
  !> 
  !>         result_i = x_i  y_i;
  !> 
  !>     dotc_strided_batched  performs a batch of dot products of the conjugate of complex vector x and complex vector y
  !> 
  !>         result_i = conjugate (x_i)  y_i;
  !> 
  !>     where (x_i, y_i) is the i-th instance of the batch.
  !>     x_i and y_i are vectors, for i = 1, ..., batch_count
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of elements in each x_i and y_i.
  !>     @param[in]
  !>     x         device pointer to the first vector (x_1) in the batch.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i.
  !>     @param[in]
  !>     stridex     [rocblas_stride]
  !>                 stride from the start of one vector (x_i) and the next one (x_i+1)
  !>     @param[in]
  !>     y         device pointer to the first vector (y_1) in the batch.
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of each y_i.
  !>     @param[in]
  !>     stridey     [rocblas_stride]
  !>                 stride from the start of one vector (y_i) and the next one (y_i+1)
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch
  !>     @param[inout]
  !>     result
  !>               device array or host array of batch_count size to store the dot products of each batch.
  !>               return 0.0 for each element if n <= 0.
  !> 
  !>     
    function rocblas_zdotc_strided_batched(handle,n,x,incx,stridex,y,incy,stridey,batch_count,myResult) bind(c, name="rocblas_zdotc_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zdotc_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_sswap(handle,incy) bind(c, name="rocblas_sswap")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sswap
      type(c_ptr),value :: handle
      integer(c_int),value :: incy
    end function

  
    function rocblas_dswap(handle,incy) bind(c, name="rocblas_dswap")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dswap
      type(c_ptr),value :: handle
      integer(c_int),value :: incy
    end function

  
    function rocblas_cswap(handle,n,x,incx,y,incy) bind(c, name="rocblas_cswap")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cswap
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  !> ! \brief BLAS Level 1 API
  !> 
  !>     \details
  !>     swap  interchanges vectors x and y.
  !> 
  !>         y := x; x := y
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of elements in x and y.
  !>     @param[inout]
  !>     x         device pointer storing vector x.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of x.
  !>     @param[inout]
  !>     y         device pointer storing vector y.
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of y.
  !> 
  !>     
    function rocblas_zswap(handle,n,x,incx,y,incy) bind(c, name="rocblas_zswap")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zswap
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
    function rocblas_sswap_batched(handle,n,x,incx,y,incy,batch_count) bind(c, name="rocblas_sswap_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sswap_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dswap_batched(handle,n,x,incx,y,incy,batch_count) bind(c, name="rocblas_dswap_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dswap_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_cswap_batched(handle,n,x,incx,y,incy,batch_count) bind(c, name="rocblas_cswap_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cswap_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 1 API
  !> 
  !>     \details
  !>     swap_batched interchanges vectors x_i and y_i, for i = 1 , ... , batch_count
  !> 
  !>         y_i := x_i; x_i := y_i
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of elements in each x_i and y_i.
  !>     @param[inout]
  !>     x         device array of device pointers storing each vector x_i.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i.
  !>     @param[inout]
  !>     y         device array of device pointers storing each vector y_i.
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of each y_i.
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch.
  !> 
  !>     
    function rocblas_zswap_batched(handle,n,x,incx,y,incy,batch_count) bind(c, name="rocblas_zswap_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zswap_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_sswap_strided_batched(handle,n,x,incx,stridex,y,incy,stridey,batch_count) bind(c, name="rocblas_sswap_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sswap_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dswap_strided_batched(handle,n,x,incx,stridex,y,incy,stridey,batch_count) bind(c, name="rocblas_dswap_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dswap_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_cswap_strided_batched(handle,n,x,incx,stridex,y,incy,stridey,batch_count) bind(c, name="rocblas_cswap_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cswap_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 1 API
  !> 
  !>     \details
  !>     swap_strided_batched interchanges vectors x_i and y_i, for i = 1 , ... , batch_count
  !> 
  !>         y_i := x_i; x_i := y_i
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of elements in each x_i and y_i.
  !>     @param[inout]
  !>     x         device pointer to the first vector x_1.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of x.
  !>     @param[in]
  !>     stridex   [rocblas_stride]
  !>               stride from the start of one vector (x_i) and the next one (x_i+1).
  !>               There are no restrictions placed on stride_x, however the user should
  !>               take care to ensure that stride_x is of appropriate size, for a typical
  !>               case this means stride_x >= n  incx.
  !>     @param[inout]
  !>     y         device pointer to the first vector y_1.
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of y.
  !>     @param[in]
  !>     stridey   [rocblas_stride]
  !>               stride from the start of one vector (y_i) and the next one (y_i+1).
  !>               There are no restrictions placed on stride_x, however the user should
  !>               take care to ensure that stride_y is of appropriate size, for a typical
  !>               case this means stride_y >= n  incy. stridey should be non zero.
  !>      @param[in]
  !>      batch_count [rocblas_int]
  !>                  number of instances in the batch.
  !> 
  !>     
    function rocblas_zswap_strided_batched(handle,n,x,incx,stridex,y,incy,stridey,batch_count) bind(c, name="rocblas_zswap_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zswap_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_saxpy(handle,n,alpha,x,incx,y,incy) bind(c, name="rocblas_saxpy")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_saxpy
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
    function rocblas_daxpy(handle,n,alpha,x,incx,y,incy) bind(c, name="rocblas_daxpy")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_daxpy
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
    function rocblas_haxpy(handle,n,alpha,x,incx,y,incy) bind(c, name="rocblas_haxpy")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_haxpy
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
    end function

  
    function rocblas_caxpy(handle,n,alpha,x,incx,y,incy) bind(c, name="rocblas_caxpy")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_caxpy
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  !> ! \brief BLAS Level 1 API
  !> 
  !>     \details
  !>     axpy   computes ant alpha multiplied by vector x, plus vector y
  !> 
  !>         y := alpha  x + y
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of elements in x and y.
  !>     @param[in]
  !>     alpha     device pointer or host pointer to specify the scalar alpha.
  !>     @param[in]
  !>     x         device pointer storing vector x.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of x.
  !>     @param[out]
  !>     y         device pointer storing vector y.
  !>     @param[inout]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of y.
  !> 
  !>     
    function rocblas_zaxpy(handle,n,alpha,x,incx,y,incy) bind(c, name="rocblas_zaxpy")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zaxpy
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
    function rocblas_haxpy_batched(handle,n,alpha,x,incx,y,incy,batch_count) bind(c, name="rocblas_haxpy_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_haxpy_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_saxpy_batched(handle,n,alpha,x,incx,y,incy,batch_count) bind(c, name="rocblas_saxpy_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_saxpy_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_daxpy_batched(handle,n,alpha,x,incx,y,incy,batch_count) bind(c, name="rocblas_daxpy_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_daxpy_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_caxpy_batched(handle,n,alpha,x,incx,y,incy,batch_count) bind(c, name="rocblas_caxpy_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_caxpy_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 1 API
  !> 
  !>     \details
  !>     axpy_batched   compute y := alpha  x + y over a set of batched vectors.
  !> 
  !>     @param[in]
  !>     handle    rocblas_handle
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     n         rocblas_int
  !>     @param[in]
  !>     alpha     specifies the scalar alpha.
  !>     @param[in]
  !>     x         pointer storing vector x on the GPU.
  !>     @param[in]
  !>     incx      rocblas_int
  !>               specifies the increment for the elements of x.
  !>     @param[out]
  !>     y         pointer storing vector y on the GPU.
  !>     @param[inout]
  !>     incy      rocblas_int
  !>               specifies the increment for the elements of y.
  !> 
  !>     @param[in]
  !>     batch_count rocblas_int
  !>               number of instances in the batch
  !> 
  !>     
    function rocblas_zaxpy_batched(handle,n,alpha,x,incx,y,incy,batch_count) bind(c, name="rocblas_zaxpy_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zaxpy_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_haxpy_strided_batched(handle,n,alpha,x,incx,stridex,y,incy,stridey,batch_count) bind(c, name="rocblas_haxpy_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_haxpy_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_saxpy_strided_batched(handle,n,alpha,x,incx,stridex,y,incy,stridey,batch_count) bind(c, name="rocblas_saxpy_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_saxpy_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_daxpy_strided_batched(handle,n,alpha,x,incx,stridex,y,incy,stridey,batch_count) bind(c, name="rocblas_daxpy_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_daxpy_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_caxpy_strided_batched(handle,n,alpha,x,incx,stridex,y,incy,stridey,batch_count) bind(c, name="rocblas_caxpy_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_caxpy_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 1 API
  !> 
  !>     \details
  !>     axpy_strided_batched   compute y := alpha  x + y over a set of strided batched vectors.
  !> 
  !>     @param[in]
  !>     handle    rocblas_handle
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     n         rocblas_int
  !>     @param[in]
  !>     alpha     specifies the scalar alpha.
  !>     @param[in]
  !>     x         pointer storing vector x on the GPU.
  !>     @param[in]
  !>     incx      rocblas_int
  !>               specifies the increment for the elements of x.
  !>     @param[in]
  !>     stridex   rocblas_stride
  !>               specifies the increment between vectors of x.
  !>     @param[out]
  !>     y         pointer storing vector y on the GPU.
  !>     @param[inout]
  !>     incy      rocblas_int
  !>               specifies the increment for the elements of y.
  !>     @param[in]
  !>     stridey   rocblas_stride
  !>               specifies the increment between vectors of y.
  !> 
  !>     @param[in]
  !>     batch_count rocblas_int
  !>               number of instances in the batch
  !> 
  !>     
    function rocblas_zaxpy_strided_batched(handle,n,alpha,x,incx,stridex,y,incy,stridey,batch_count) bind(c, name="rocblas_zaxpy_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zaxpy_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_sasum(handle,incx,myResult) bind(c, name="rocblas_sasum")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sasum
      type(c_ptr),value :: handle
      integer(c_int),value :: incx
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_dasum(handle,incx,myResult) bind(c, name="rocblas_dasum")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dasum
      type(c_ptr),value :: handle
      integer(c_int),value :: incx
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_scasum(handle,n,x,incx,myResult) bind(c, name="rocblas_scasum")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_scasum
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: myResult
    end function

  !> ! \brief BLAS Level 1 API
  !> 
  !>     \details
  !>     asum computes the sum of the magnitudes of elements of a real vector x,
  !>          or the sum of magnitudes of the real and imaginary parts of elements if x is a complex
  !>    vector
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of elements in x and y.
  !>     @param[in]
  !>     x         device pointer storing vector x.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of x. incx must be > 0.
  !>     @param[inout]
  !>     result
  !>               device pointer or host pointer to store the asum product.
  !>               return is 0.0 if n <= 0.
  !> 
  !>     
    function rocblas_dzasum(handle,n,x,incx,myResult) bind(c, name="rocblas_dzasum")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dzasum
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_sasum_batched(handle,n,x,incx,batch_count,results) bind(c, name="rocblas_sasum_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sasum_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
      type(c_ptr),value :: results
    end function

  
    function rocblas_dasum_batched(handle,n,x,incx,batch_count,results) bind(c, name="rocblas_dasum_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dasum_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
      type(c_ptr),value :: results
    end function

  
    function rocblas_scasum_batched(handle,n,x,incx,batch_count,results) bind(c, name="rocblas_scasum_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_scasum_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
      type(c_ptr),value :: results
    end function

  !> ! \brief BLAS Level 1 API
  !> 
  !>     \details
  !>     asum_batched computes the sum of the magnitudes of the elements in a batch of real vectors x_i,
  !>         or the sum of magnitudes of the real and imaginary parts of elements if x_i is a complex
  !>         vector, for i = 1, ..., batch_count
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               number of elements in each vector x_i
  !>     @param[in]
  !>     x         device array of device pointers storing each vector x_i.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i. incx must be > 0.
  !>     @param[out]
  !>     results
  !>               device array or host array of batch_count size for results.
  !>               return is 0.0 if n, incx<=0.
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>               number of instances in the batch.
  !>     
    function rocblas_dzasum_batched(handle,n,x,incx,batch_count,results) bind(c, name="rocblas_dzasum_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dzasum_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
      type(c_ptr),value :: results
    end function

  
    function rocblas_sasum_strided_batched(handle,n,x,incx,stridex,batch_count,results) bind(c, name="rocblas_sasum_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sasum_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      integer(c_int),value :: batch_count
      type(c_ptr),value :: results
    end function

  
    function rocblas_dasum_strided_batched(handle,n,x,incx,stridex,batch_count,results) bind(c, name="rocblas_dasum_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dasum_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      integer(c_int),value :: batch_count
      type(c_ptr),value :: results
    end function

  
    function rocblas_scasum_strided_batched(handle,n,x,incx,stridex,batch_count,results) bind(c, name="rocblas_scasum_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_scasum_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      integer(c_int),value :: batch_count
      type(c_ptr),value :: results
    end function

  !> ! \brief BLAS Level 1 API
  !> 
  !>     \details
  !>     asum_strided_batched computes the sum of the magnitudes of elements of a real vectors x_i,
  !>         or the sum of magnitudes of the real and imaginary parts of elements if x_i is a complex
  !>         vector, for i = 1, ..., batch_count
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               number of elements in each vector x_i
  !>     @param[in]
  !>     x         device pointer to the first vector x_1.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i. incx must be > 0.
  !>     @param[in]
  !>     stridex   [rocblas_stride]
  !>               stride from the start of one vector (x_i) and the next one (x_i+1).
  !>               There are no restrictions placed on stride_x, however the user should
  !>               take care to ensure that stride_x is of appropriate size, for a typical
  !>               case this means stride_x >= n  incx.
  !>     @param[out]
  !>     results
  !>               device pointer or host pointer to array for storing contiguous batch_count results.
  !>               return is 0.0 if n, incx<=0.
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>               number of instances in the batch
  !>     
    function rocblas_dzasum_strided_batched(handle,n,x,incx,stridex,batch_count,results) bind(c, name="rocblas_dzasum_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dzasum_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      integer(c_int),value :: batch_count
      type(c_ptr),value :: results
    end function

  
    function rocblas_snrm2(handle,incx,myResult) bind(c, name="rocblas_snrm2")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_snrm2
      type(c_ptr),value :: handle
      integer(c_int),value :: incx
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_dnrm2(handle,incx,myResult) bind(c, name="rocblas_dnrm2")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dnrm2
      type(c_ptr),value :: handle
      integer(c_int),value :: incx
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_scnrm2(handle,n,x,incx,myResult) bind(c, name="rocblas_scnrm2")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_scnrm2
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: myResult
    end function

  !> ! \brief BLAS Level 1 API
  !> 
  !>     \details
  !>     nrm2 computes the euclidean norm of a real or complex vector
  !> 
  !>               result := sqrt( x'x ) for real vectors
  !>               result := sqrt( xHx ) for complex vectors
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of elements in x.
  !>     @param[in]
  !>     x         device pointer storing vector x.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of y.
  !>     @param[inout]
  !>     result
  !>               device pointer or host pointer to store the nrm2 product.
  !>               return is 0.0 if n, incx<=0.
  !>     
    function rocblas_dznrm2(handle,n,x,incx,myResult) bind(c, name="rocblas_dznrm2")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dznrm2
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_snrm2_batched(handle,n,x,incx,batch_count,results) bind(c, name="rocblas_snrm2_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_snrm2_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
      type(c_ptr),value :: results
    end function

  
    function rocblas_dnrm2_batched(handle,n,x,incx,batch_count,results) bind(c, name="rocblas_dnrm2_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dnrm2_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
      type(c_ptr),value :: results
    end function

  
    function rocblas_scnrm2_batched(handle,n,x,incx,batch_count,results) bind(c, name="rocblas_scnrm2_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_scnrm2_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
      type(c_ptr),value :: results
    end function

  !> ! \brief BLAS Level 1 API
  !> 
  !>     \details
  !>     nrm2_batched computes the euclidean norm over a batch of real or complex vectors
  !> 
  !>               result := sqrt( x_i'x_i ) for real vectors x, for i = 1, ..., batch_count
  !>               result := sqrt( x_iHx_i ) for complex vectors x, for i = 1, ..., batch_count
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               number of elements in each x_i.
  !>     @param[in]
  !>     x         device array of device pointers storing each vector x_i.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i. incx must be > 0.
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>               number of instances in the batch
  !>     @param[out]
  !>     results
  !>               device pointer or host pointer to array of batch_count size for nrm2 results.
  !>               return is 0.0 for each element if n <= 0, incx<=0.
  !> 
  !>     
    function rocblas_dznrm2_batched(handle,n,x,incx,batch_count,results) bind(c, name="rocblas_dznrm2_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dznrm2_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
      type(c_ptr),value :: results
    end function

  
    function rocblas_snrm2_strided_batched(handle,n,x,incx,stridex,batch_count,results) bind(c, name="rocblas_snrm2_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_snrm2_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      integer(c_int),value :: batch_count
      type(c_ptr),value :: results
    end function

  
    function rocblas_dnrm2_strided_batched(handle,n,x,incx,stridex,batch_count,results) bind(c, name="rocblas_dnrm2_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dnrm2_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      integer(c_int),value :: batch_count
      type(c_ptr),value :: results
    end function

  
    function rocblas_scnrm2_strided_batched(handle,n,x,incx,stridex,batch_count,results) bind(c, name="rocblas_scnrm2_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_scnrm2_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      integer(c_int),value :: batch_count
      type(c_ptr),value :: results
    end function

  !> ! \brief BLAS Level 1 API
  !> 
  !>     \details
  !>     nrm2_strided_batched computes the euclidean norm over a batch of real or complex vectors
  !> 
  !>               := sqrt( x_i'x_i ) for real vectors x, for i = 1, ..., batch_count
  !>               := sqrt( x_iHx_i ) for complex vectors, for i = 1, ..., batch_count
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               number of elements in each x_i.
  !>     @param[in]
  !>     x         device pointer to the first vector x_1.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i. incx must be > 0.
  !>     @param[in]
  !>     stridex   [rocblas_stride]
  !>               stride from the start of one vector (x_i) and the next one (x_i+1).
  !>               There are no restrictions placed on stride_x, however the user should
  !>               take care to ensure that stride_x is of appropriate size, for a typical
  !>               case this means stride_x >= n  incx.
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>               number of instances in the batch
  !>     @param[out]
  !>     results
  !>               device pointer or host pointer to array for storing contiguous batch_count results.
  !>               return is 0.0 for each element if n <= 0, incx<=0.
  !> 
  !>     
    function rocblas_dznrm2_strided_batched(handle,n,x,incx,stridex,batch_count,results) bind(c, name="rocblas_dznrm2_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dznrm2_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      integer(c_int),value :: batch_count
      type(c_ptr),value :: results
    end function

  
    function rocblas_isamax(handle,myResult) bind(c, name="rocblas_isamax")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_isamax
      type(c_ptr),value :: handle
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_idamax(handle,myResult) bind(c, name="rocblas_idamax")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_idamax
      type(c_ptr),value :: handle
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_icamax(handle,n,x,incx,myResult) bind(c, name="rocblas_icamax")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_icamax
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: myResult
    end function

  !> ! \brief BLAS Level 1 API
  !> 
  !>     \details
  !>     amax finds the first index of the element of maximum magnitude of a vector x.
  !>    vector
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of elements in x.
  !>     @param[in]
  !>     x         device pointer storing vector x.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of y.
  !>     @param[inout]
  !>     result
  !>               device pointer or host pointer to store the amax index.
  !>               return is 0.0 if n, incx<=0.
  !>     
    function rocblas_izamax(handle,n,x,incx,myResult) bind(c, name="rocblas_izamax")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_izamax
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_isamax_batched(handle,n,x,incx,batch_count,myResult) bind(c, name="rocblas_isamax_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_isamax_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_idamax_batched(handle,n,x,incx,batch_count,myResult) bind(c, name="rocblas_idamax_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_idamax_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_icamax_batched(handle,n,x,incx,batch_count,myResult) bind(c, name="rocblas_icamax_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_icamax_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  !> ! \brief BLAS Level 1 API
  !> 
  !>     \details
  !>      amax_batched finds the first index of the element of maximum magnitude of each vector x_i in a batch, for i = 1, ..., batch_count.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               number of elements in each vector x_i
  !>     @param[in]
  !>     x         device array of device pointers storing each vector x_i.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i. incx must be > 0.
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>               number of instances in the batch, must be > 0.
  !>     @param[out]
  !>     result
  !>               device or host array of pointers of batch_count size for results.
  !>               return is 0 if n, incx<=0.
  !>     
    function rocblas_izamax_batched(handle,n,x,incx,batch_count,myResult) bind(c, name="rocblas_izamax_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_izamax_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_isamax_strided_batched(handle,n,x,incx,stridex,batch_count,myResult) bind(c, name="rocblas_isamax_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_isamax_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_idamax_strided_batched(handle,n,x,incx,stridex,batch_count,myResult) bind(c, name="rocblas_idamax_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_idamax_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_icamax_strided_batched(handle,n,x,incx,stridex,batch_count,myResult) bind(c, name="rocblas_icamax_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_icamax_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  !> ! \brief BLAS Level 1 API
  !> 
  !>     \details
  !>      amax_strided_batched finds the first index of the element of maximum magnitude of each vector x_i in a batch, for i = 1, ..., batch_count.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               number of elements in each vector x_i
  !>     @param[in]
  !>     x         device pointer to the first vector x_1.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i. incx must be > 0.
  !>     @param[in]
  !>     stridex   [rocblas_stride]
  !>               specifies the pointer increment between one x_i and the next x_(i + 1).
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>               number of instances in the batch
  !>     @param[out]
  !>     result
  !>               device or host pointer for storing contiguous batch_count results.
  !>               return is 0 if n <= 0, incx<=0.
  !> 
  !>     
    function rocblas_izamax_strided_batched(handle,n,x,incx,stridex,batch_count,myResult) bind(c, name="rocblas_izamax_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_izamax_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_isamin(handle,myResult) bind(c, name="rocblas_isamin")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_isamin
      type(c_ptr),value :: handle
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_idamin(handle,myResult) bind(c, name="rocblas_idamin")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_idamin
      type(c_ptr),value :: handle
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_icamin(handle,n,x,incx,myResult) bind(c, name="rocblas_icamin")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_icamin
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: myResult
    end function

  !> ! \brief BLAS Level 1 API
  !> 
  !>     \details
  !>     amin finds the first index of the element of minimum magnitude of a vector x.
  !> 
  !>    vector
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of elements in x.
  !>     @param[in]
  !>     x         device pointer storing vector x.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of y.
  !>     @param[inout]
  !>     result
  !>               device pointer or host pointer to store the amin index.
  !>               return is 0.0 if n, incx<=0.
  !>     
    function rocblas_izamin(handle,n,x,incx,myResult) bind(c, name="rocblas_izamin")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_izamin
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_isamin_batched(handle,n,x,incx,batch_count,myResult) bind(c, name="rocblas_isamin_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_isamin_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_idamin_batched(handle,n,x,incx,batch_count,myResult) bind(c, name="rocblas_idamin_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_idamin_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_icamin_batched(handle,n,x,incx,batch_count,myResult) bind(c, name="rocblas_icamin_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_icamin_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  !> ! \brief BLAS Level 1 API
  !> 
  !>     \details
  !>     amin_batched finds the first index of the element of minimum magnitude of each vector x_i in a batch, for i = 1, ..., batch_count.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               number of elements in each vector x_i
  !>     @param[in]
  !>     x         device array of device pointers storing each vector x_i.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i. incx must be > 0.
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>               number of instances in the batch, must be > 0.
  !>     @param[out]
  !>     result
  !>               device or host pointers to array of batch_count size for results.
  !>               return is 0 if n, incx<=0.
  !>     
    function rocblas_izamin_batched(handle,n,x,incx,batch_count,myResult) bind(c, name="rocblas_izamin_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_izamin_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_isamin_strided_batched(handle,n,x,incx,stridex,batch_count,myResult) bind(c, name="rocblas_isamin_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_isamin_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_idamin_strided_batched(handle,n,x,incx,stridex,batch_count,myResult) bind(c, name="rocblas_idamin_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_idamin_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_icamin_strided_batched(handle,n,x,incx,stridex,batch_count,myResult) bind(c, name="rocblas_icamin_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_icamin_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  !> ! \brief BLAS Level 1 API
  !> 
  !>     \details
  !>      amin_strided_batched finds the first index of the element of minimum magnitude of each vector x_i in a batch, for i = 1, ..., batch_count.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               number of elements in each vector x_i
  !>     @param[in]
  !>     x         device pointer to the first vector x_1.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i. incx must be > 0.
  !>     @param[in]
  !>     stridex   [rocblas_stride]
  !>               specifies the pointer increment between one x_i and the next x_(i + 1)
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>               number of instances in the batch
  !>     @param[out]
  !>     result
  !>               device or host pointer to array for storing contiguous batch_count results.
  !>               return is 0 if n <= 0, incx<=0.
  !> 
  !>     
    function rocblas_izamin_strided_batched(handle,n,x,incx,stridex,batch_count,myResult) bind(c, name="rocblas_izamin_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_izamin_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      integer(c_int),value :: batch_count
      type(c_ptr),value :: myResult
    end function

  
    function rocblas_srot(handle,n,x,incx,y,incy,c,s) bind(c, name="rocblas_srot")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_srot
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: c
      type(c_ptr),value :: s
    end function

  
    function rocblas_drot(handle,n,x,incx,y,incy,c,s) bind(c, name="rocblas_drot")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_drot
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: c
      type(c_ptr),value :: s
    end function

  
    function rocblas_crot(handle,n,x,incx,y,incy,c,s) bind(c, name="rocblas_crot")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_crot
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: c
      type(c_ptr),value :: s
    end function

  
    function rocblas_csrot(handle,n,x,incx,y,incy,c,s) bind(c, name="rocblas_csrot")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_csrot
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: c
      type(c_ptr),value :: s
    end function

  
    function rocblas_zrot(handle,n,x,incx,y,incy,c,s) bind(c, name="rocblas_zrot")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zrot
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: c
      type(c_ptr),value :: s
    end function

  !> ! \brief BLAS Level 1 API
  !> 
  !>     \details
  !>     rot applies the Givens rotation matrix defined by c=cos(alpha) and s=sin(alpha) to vectors x and y.
  !>         Scalars c and s may be stored in either host or device memory, location is specified by calling rocblas_set_pointer_mode.
  !> 
  !>     @param[in]
  !>     handle  [rocblas_handle]
  !>             handle to the rocblas library context queue.
  !>     @param[in]
  !>     n       [rocblas_int]
  !>             number of elements in the x and y vectors.
  !>     @param[inout]
  !>     x       device pointer storing vector x.
  !>     @param[in]
  !>     incx    [rocblas_int]
  !>             specifies the increment between elements of x.
  !>     @param[inout]
  !>     y       device pointer storing vector y.
  !>     @param[in]
  !>     incy    [rocblas_int]
  !>             specifies the increment between elements of y.
  !>     @param[in]
  !>     c       device pointer or host pointer storing scalar cosine component of the rotation matrix.
  !>     @param[in]
  !>     s       device pointer or host pointer storing scalar sine component of the rotation matrix.
  !> 
  !>     
    function rocblas_zdrot(handle,n,x,incx,y,incy,c,s) bind(c, name="rocblas_zdrot")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zdrot
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: c
      type(c_ptr),value :: s
    end function

  
    function rocblas_srot_batched(handle,n,x,incx,y,incy,c,s,batch_count) bind(c, name="rocblas_srot_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_srot_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: c
      type(c_ptr),value :: s
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_drot_batched(handle,n,x,incx,y,incy,c,s,batch_count) bind(c, name="rocblas_drot_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_drot_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: c
      type(c_ptr),value :: s
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_crot_batched(handle,n,x,incx,y,incy,c,s,batch_count) bind(c, name="rocblas_crot_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_crot_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: c
      type(c_ptr),value :: s
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_csrot_batched(handle,n,x,incx,y,incy,c,s,batch_count) bind(c, name="rocblas_csrot_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_csrot_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: c
      type(c_ptr),value :: s
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_zrot_batched(handle,n,x,incx,y,incy,c,s,batch_count) bind(c, name="rocblas_zrot_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zrot_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: c
      type(c_ptr),value :: s
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 1 API
  !> 
  !>     \details
  !>     rot_batched applies the Givens rotation matrix defined by c=cos(alpha) and s=sin(alpha) to batched vectors x_i and y_i, for i = 1, ..., batch_count.
  !>         Scalars c and s may be stored in either host or device memory, location is specified by calling rocblas_set_pointer_mode.
  !> 
  !>     @param[in]
  !>     handle  [rocblas_handle]
  !>             handle to the rocblas library context queue.
  !>     @param[in]
  !>     n       [rocblas_int]
  !>             number of elements in each x_i and y_i vectors.
  !>     @param[inout]
  !>     x       device array of deivce pointers storing each vector x_i.
  !>     @param[in]
  !>     incx    [rocblas_int]
  !>             specifies the increment between elements of each x_i.
  !>     @param[inout]
  !>     y       device array of device pointers storing each vector y_i.
  !>     @param[in]
  !>     incy    [rocblas_int]
  !>             specifies the increment between elements of each y_i.
  !>     @param[in]
  !>     c       device pointer or host pointer to scalar cosine component of the rotation matrix.
  !>     @param[in]
  !>     s       device pointer or host pointer to scalar sine component of the rotation matrix.
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 the number of x and y arrays, i.e. the number of batches.
  !> 
  !>     
    function rocblas_zdrot_batched(handle,n,x,incx,y,incy,c,s,batch_count) bind(c, name="rocblas_zdrot_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zdrot_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: c
      type(c_ptr),value :: s
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_srot_strided_batched(handle,n,x,incx,stride_x,y,incy,stride_y,c,s,batch_count) bind(c, name="rocblas_srot_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_srot_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stride_y
      type(c_ptr),value :: c
      type(c_ptr),value :: s
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_drot_strided_batched(handle,n,x,incx,stride_x,y,incy,stride_y,c,s,batch_count) bind(c, name="rocblas_drot_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_drot_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stride_y
      type(c_ptr),value :: c
      type(c_ptr),value :: s
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_crot_strided_batched(handle,n,x,incx,stride_x,y,incy,stride_y,c,s,batch_count) bind(c, name="rocblas_crot_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_crot_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stride_y
      type(c_ptr),value :: c
      type(c_ptr),value :: s
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_csrot_strided_batched(handle,n,x,incx,stride_x,y,incy,stride_y,c,s,batch_count) bind(c, name="rocblas_csrot_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_csrot_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stride_y
      type(c_ptr),value :: c
      type(c_ptr),value :: s
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_zrot_strided_batched(handle,n,x,incx,stride_x,y,incy,stride_y,c,s,batch_count) bind(c, name="rocblas_zrot_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zrot_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stride_y
      type(c_ptr),value :: c
      type(c_ptr),value :: s
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 1 API
  !> 
  !>     \details
  !>     rot_strided_batched applies the Givens rotation matrix defined by c=cos(alpha) and s=sin(alpha) to strided batched vectors x_i and y_i, for i = 1, ..., batch_count.
  !>         Scalars c and s may be stored in either host or device memory, location is specified by calling rocblas_set_pointer_mode.
  !> 
  !>     @param[in]
  !>     handle  [rocblas_handle]
  !>             handle to the rocblas library context queue.
  !>     @param[in]
  !>     n       [rocblas_int]
  !>             number of elements in each x_i and y_i vectors.
  !>     @param[inout]
  !>     x       device pointer to the first vector x_1.
  !>     @param[in]
  !>     incx    [rocblas_int]
  !>             specifies the increment between elements of each x_i.
  !>     @param[in]
  !>     stride_x [rocblas_stride]
  !>              specifies the increment from the beginning of x_i to the beginning of x_(i+1)
  !>     @param[inout]
  !>     y       device pointer to the first vector y_1.
  !>     @param[in]
  !>     incy    [rocblas_int]
  !>             specifies the increment between elements of each y_i.
  !>     @param[in]
  !>     stride_y [rocblas_stride]
  !>              specifies the increment from the beginning of y_i to the beginning of y_(i+1)
  !>     @param[in]
  !>     c       device pointer or host pointer to scalar cosine component of the rotation matrix.
  !>     @param[in]
  !>     s       device pointer or host pointer to scalar sine component of the rotation matrix.
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>             the number of x and y arrays, i.e. the number of batches.
  !> 
  !>     
    function rocblas_zdrot_strided_batched(handle,n,x,incx,stride_x,y,incy,stride_y,c,s,batch_count) bind(c, name="rocblas_zdrot_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zdrot_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stride_y
      type(c_ptr),value :: c
      type(c_ptr),value :: s
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_srotg(handle,a,b,c,s) bind(c, name="rocblas_srotg")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_srotg
      type(c_ptr),value :: handle
      type(c_ptr),value :: a
      type(c_ptr),value :: b
      type(c_ptr),value :: c
      type(c_ptr),value :: s
    end function

  
    function rocblas_drotg(handle,a,b,c,s) bind(c, name="rocblas_drotg")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_drotg
      type(c_ptr),value :: handle
      type(c_ptr),value :: a
      type(c_ptr),value :: b
      type(c_ptr),value :: c
      type(c_ptr),value :: s
    end function

  
    function rocblas_crotg(handle,a,b,c,s) bind(c, name="rocblas_crotg")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_crotg
      type(c_ptr),value :: handle
      type(c_ptr),value :: a
      type(c_ptr),value :: b
      type(c_ptr),value :: c
      type(c_ptr),value :: s
    end function

  !> ! \brief BLAS Level 1 API
  !> 
  !>     \details
  !>     rotg creates the Givens rotation matrix for the vector (a b).
  !>          Scalars c and s and arrays a and b may be stored in either host or device memory, location is specified by calling rocblas_set_pointer_mode.
  !>          If the pointer mode is set to rocblas_pointer_mode_host, this function blocks the CPU until the GPU has finished and the results are available in host memory.
  !>          If the pointer mode is set to rocblas_pointer_mode_device, this function returns immediately and synchronization is required to read the results.
  !> 
  !>     @param[in]
  !>     handle  [rocblas_handle]
  !>             handle to the rocblas library context queue.
  !>     @param[inout]
  !>     a       device pointer or host pointer to input vector element, overwritten with r.
  !>     @param[inout]
  !>     b       device pointer or host pointer to input vector element, overwritten with z.
  !>     @param[inout]
  !>     c       device pointer or host pointer to cosine element of Givens rotation.
  !>     @param[inout]
  !>     s       device pointer or host pointer sine element of Givens rotation.
  !> 
  !>     
    function rocblas_zrotg(handle,a,b,c,s) bind(c, name="rocblas_zrotg")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zrotg
      type(c_ptr),value :: handle
      type(c_ptr),value :: a
      type(c_ptr),value :: b
      type(c_ptr),value :: c
      type(c_ptr),value :: s
    end function

  
    function rocblas_srotg_batched(handle,a,b,c,s,batch_count) bind(c, name="rocblas_srotg_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_srotg_batched
      type(c_ptr),value :: handle
      type(c_ptr) :: a
      type(c_ptr) :: b
      type(c_ptr) :: c
      type(c_ptr) :: s
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_drotg_batched(handle,a,b,c,s,batch_count) bind(c, name="rocblas_drotg_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_drotg_batched
      type(c_ptr),value :: handle
      type(c_ptr) :: a
      type(c_ptr) :: b
      type(c_ptr) :: c
      type(c_ptr) :: s
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_crotg_batched(handle,a,b,c,s,batch_count) bind(c, name="rocblas_crotg_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_crotg_batched
      type(c_ptr),value :: handle
      type(c_ptr) :: a
      type(c_ptr) :: b
      type(c_ptr) :: c
      type(c_ptr) :: s
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 1 API
  !> 
  !>     \details
  !>     rotg_batched creates the Givens rotation matrix for the batched vectors (a_i b_i), for i = 1, ..., batch_count.
  !>          a, b, c, and s may be stored in either host or device memory, location is specified by calling rocblas_set_pointer_mode.
  !>          If the pointer mode is set to rocblas_pointer_mode_host, this function blocks the CPU until the GPU has finished and the results are available in host memory.
  !>          If the pointer mode is set to rocblas_pointer_mode_device, this function returns immediately and synchronization is required to read the results.
  !> 
  !>     @param[in]
  !>     handle  [rocblas_handle]
  !>             handle to the rocblas library context queue.
  !>     @param[inout]
  !>     a       device array of device pointers storing each single input vector element a_i, overwritten with r_i.
  !>     @param[inout]
  !>     b       device array of device pointers storing each single input vector element b_i, overwritten with z_i.
  !>     @param[inout]
  !>     c       device array of device pointers storing each cosine element of Givens rotation for the batch.
  !>     @param[inout]
  !>     s       device array of device pointers storing each sine element of Givens rotation for the batch.
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of batches (length of arrays a, b, c, and s).
  !> 
  !>     
    function rocblas_zrotg_batched(handle,a,b,c,s,batch_count) bind(c, name="rocblas_zrotg_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zrotg_batched
      type(c_ptr),value :: handle
      type(c_ptr) :: a
      type(c_ptr) :: b
      type(c_ptr) :: c
      type(c_ptr) :: s
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_srotg_strided_batched(handle,a,stride_a,b,stride_b,c,stride_c,s,stride_s,batch_count) bind(c, name="rocblas_srotg_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_srotg_strided_batched
      type(c_ptr),value :: handle
      type(c_ptr),value :: a
      integer(c_int64_t),value :: stride_a
      type(c_ptr),value :: b
      integer(c_int64_t),value :: stride_b
      type(c_ptr),value :: c
      integer(c_int64_t),value :: stride_c
      type(c_ptr),value :: s
      integer(c_int64_t),value :: stride_s
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_drotg_strided_batched(handle,a,stride_a,b,stride_b,c,stride_c,s,stride_s,batch_count) bind(c, name="rocblas_drotg_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_drotg_strided_batched
      type(c_ptr),value :: handle
      type(c_ptr),value :: a
      integer(c_int64_t),value :: stride_a
      type(c_ptr),value :: b
      integer(c_int64_t),value :: stride_b
      type(c_ptr),value :: c
      integer(c_int64_t),value :: stride_c
      type(c_ptr),value :: s
      integer(c_int64_t),value :: stride_s
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_crotg_strided_batched(handle,a,stride_a,b,stride_b,c,stride_c,s,stride_s,batch_count) bind(c, name="rocblas_crotg_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_crotg_strided_batched
      type(c_ptr),value :: handle
      type(c_ptr),value :: a
      integer(c_int64_t),value :: stride_a
      type(c_ptr),value :: b
      integer(c_int64_t),value :: stride_b
      type(c_ptr),value :: c
      integer(c_int64_t),value :: stride_c
      type(c_ptr),value :: s
      integer(c_int64_t),value :: stride_s
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 1 API
  !> 
  !>     \details
  !>     rotg_strided_batched creates the Givens rotation matrix for the strided batched vectors (a_i b_i), for i = 1, ..., batch_count.
  !>          a, b, c, and s may be stored in either host or device memory, location is specified by calling rocblas_set_pointer_mode.
  !>          If the pointer mode is set to rocblas_pointer_mode_host, this function blocks the CPU until the GPU has finished and the results are available in host memory.
  !>          If the pointer mode is set to rocblas_pointer_mode_device, this function returns immediately and synchronization is required to read the results.
  !> 
  !>     @param[in]
  !>     handle  [rocblas_handle]
  !>             handle to the rocblas library context queue.
  !>     @param[inout]
  !>     a       device strided_batched pointer or host strided_batched pointer to first single input vector element a_1, overwritten with r.
  !>     @param[in]
  !>     stride_a [rocblas_stride]
  !>              distance between elements of a in batch (distance between a_i and a_(i + 1))
  !>     @param[inout]
  !>     b       device strided_batched pointer or host strided_batched pointer to first single input vector element b_1, overwritten with z.
  !>     @param[in]
  !>     stride_b [rocblas_stride]
  !>              distance between elements of b in batch (distance between b_i and b_(i + 1))
  !>     @param[inout]
  !>     c       device strided_batched pointer or host strided_batched pointer to first cosine element of Givens rotations c_1.
  !>     @param[in]
  !>     stride_c [rocblas_stride]
  !>              distance between elements of c in batch (distance between c_i and c_(i + 1))
  !>     @param[inout]
  !>     s       device strided_batched pointer or host strided_batched pointer to sine element of Givens rotations s_1.
  !>     @param[in]
  !>     stride_s [rocblas_stride]
  !>              distance between elements of s in batch (distance between s_i and s_(i + 1))
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of batches (length of arrays a, b, c, and s).
  !> 
  !>     
    function rocblas_zrotg_strided_batched(handle,a,stride_a,b,stride_b,c,stride_c,s,stride_s,batch_count) bind(c, name="rocblas_zrotg_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zrotg_strided_batched
      type(c_ptr),value :: handle
      type(c_ptr),value :: a
      integer(c_int64_t),value :: stride_a
      type(c_ptr),value :: b
      integer(c_int64_t),value :: stride_b
      type(c_ptr),value :: c
      integer(c_int64_t),value :: stride_c
      type(c_ptr),value :: s
      integer(c_int64_t),value :: stride_s
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_srotm(handle,n,x,incx,y,incy,param) bind(c, name="rocblas_srotm")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_srotm
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: param
    end function

  !> ! \brief BLAS Level 1 API
  !> 
  !>     \details
  !>     rotm applies the modified Givens rotation matrix defined by param to vectors x and y.
  !> 
  !>     @param[in]
  !>     handle  [rocblas_handle]
  !>             handle to the rocblas library context queue.
  !>     @param[in]
  !>     n       [rocblas_int]
  !>             number of elements in the x and y vectors.
  !>     @param[inout]
  !>     x       device pointer storing vector x.
  !>     @param[in]
  !>     incx    [rocblas_int]
  !>             specifies the increment between elements of x.
  !>     @param[inout]
  !>     y       device pointer storing vector y.
  !>     @param[in]
  !>     incy    [rocblas_int]
  !>             specifies the increment between elements of y.
  !>     @param[in]
  !>     param   device vector or host vector of 5 elements defining the rotation.
  !>             param[0] = flag
  !>             param[1] = H11
  !>             param[2] = H21
  !>             param[3] = H12
  !>             param[4] = H22
  !>             The flag parameter defines the form of H:
  !>             flag = -1 => H = ( H11 H12 H21 H22 )
  !>             flag =  0 => H = ( 1.0 H12 H21 1.0 )
  !>             flag =  1 => H = ( H11 1.0 -1.0 H22 )
  !>             flag = -2 => H = ( 1.0 0.0 0.0 1.0 )
  !>             param may be stored in either host or device memory, location is specified by calling rocblas_set_pointer_mode.
  !> 
  !>     
    function rocblas_drotm(handle,n,x,incx,y,incy,param) bind(c, name="rocblas_drotm")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_drotm
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: param
    end function

  
    function rocblas_srotm_batched(handle,n,x,incx,y,incy,param,batch_count) bind(c, name="rocblas_srotm_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_srotm_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr) :: param
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 1 API
  !> 
  !>     \details
  !>     rotm_batched applies the modified Givens rotation matrix defined by param_i to batched vectors x_i and y_i, for i = 1, ..., batch_count.
  !> 
  !>     @param[in]
  !>     handle  [rocblas_handle]
  !>             handle to the rocblas library context queue.
  !>     @param[in]
  !>     n       [rocblas_int]
  !>             number of elements in the x and y vectors.
  !>     @param[inout]
  !>     x       device array of device pointers storing each vector x_i.
  !>     @param[in]
  !>     incx    [rocblas_int]
  !>             specifies the increment between elements of each x_i.
  !>     @param[inout]
  !>     y       device array of device pointers storing each vector y_1.
  !>     @param[in]
  !>     incy    [rocblas_int]
  !>             specifies the increment between elements of each y_i.
  !>     @param[in]
  !>     param   device array of device vectors of 5 elements defining the rotation.
  !>             param[0] = flag
  !>             param[1] = H11
  !>             param[2] = H21
  !>             param[3] = H12
  !>             param[4] = H22
  !>             The flag parameter defines the form of H:
  !>             flag = -1 => H = ( H11 H12 H21 H22 )
  !>             flag =  0 => H = ( 1.0 H12 H21 1.0 )
  !>             flag =  1 => H = ( H11 1.0 -1.0 H22 )
  !>             flag = -2 => H = ( 1.0 0.0 0.0 1.0 )
  !>             param may ONLY be stored on the device for the batched version of this function.
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 the number of x and y arrays, i.e. the number of batches.
  !> 
  !>     
    function rocblas_drotm_batched(handle,n,x,incx,y,incy,param,batch_count) bind(c, name="rocblas_drotm_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_drotm_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr) :: param
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_srotm_strided_batched(handle,n,x,incx,stride_x,y,incy,stride_y,param,stride_param,batch_count) bind(c, name="rocblas_srotm_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_srotm_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stride_y
      type(c_ptr),value :: param
      integer(c_int64_t),value :: stride_param
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 1 API
  !> 
  !>     \details
  !>     rotm_strided_batched applies the modified Givens rotation matrix defined by param_i to strided batched vectors x_i and y_i, for i = 1, ..., batch_count
  !> 
  !>     @param[in]
  !>     handle  [rocblas_handle]
  !>             handle to the rocblas library context queue.
  !>     @param[in]
  !>     n       [rocblas_int]
  !>             number of elements in the x and y vectors.
  !>     @param[inout]
  !>     x       device pointer pointing to first strided batched vector x_1.
  !>     @param[in]
  !>     incx    [rocblas_int]
  !>             specifies the increment between elements of each x_i.
  !>     @param[in]
  !>     stride_x [rocblas_stride]
  !>              specifies the increment between the beginning of x_i and x_(i + 1)
  !>     @param[inout]
  !>     y       device pointer pointing to first strided batched vector y_1.
  !>     @param[in]
  !>     incy    [rocblas_int]
  !>             specifies the increment between elements of each y_i.
  !>     @param[in]
  !>     stride_y [rocblas_stride]
  !>              specifies the increment between the beginning of y_i and y_(i + 1)
  !>     @param[in]
  !>     param   device pointer pointing to first array of 5 elements defining the rotation (param_1).
  !>             param[0] = flag
  !>             param[1] = H11
  !>             param[2] = H21
  !>             param[3] = H12
  !>             param[4] = H22
  !>             The flag parameter defines the form of H:
  !>             flag = -1 => H = ( H11 H12 H21 H22 )
  !>             flag =  0 => H = ( 1.0 H12 H21 1.0 )
  !>             flag =  1 => H = ( H11 1.0 -1.0 H22 )
  !>             flag = -2 => H = ( 1.0 0.0 0.0 1.0 )
  !>             param may ONLY be stored on the device for the strided_batched version of this function.
  !>     @param[in]
  !>     stride_param [rocblas_stride]
  !>                  specifies the increment between the beginning of param_i and param_(i + 1)
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 the number of x and y arrays, i.e. the number of batches.
  !> 
  !>     
    function rocblas_drotm_strided_batched(handle,n,x,incx,stride_x,y,incy,stride_y,param,stride_param,batch_count) bind(c, name="rocblas_drotm_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_drotm_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stride_y
      type(c_ptr),value :: param
      integer(c_int64_t),value :: stride_param
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_srotmg(handle,d1,d2,x1,y1,param) bind(c, name="rocblas_srotmg")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_srotmg
      type(c_ptr),value :: handle
      type(c_ptr),value :: d1
      type(c_ptr),value :: d2
      type(c_ptr),value :: x1
      type(c_ptr),value :: y1
      type(c_ptr),value :: param
    end function

  !> ! \brief BLAS Level 1 API
  !> 
  !>     \details
  !>     rotmg creates the modified Givens rotation matrix for the vector (d1  x1, d2  y1).
  !>           Parameters may be stored in either host or device memory, location is specified by calling rocblas_set_pointer_mode.
  !>           If the pointer mode is set to rocblas_pointer_mode_host, this function blocks the CPU until the GPU has finished and the results are available in host memory.
  !>           If the pointer mode is set to rocblas_pointer_mode_device, this function returns immediately and synchronization is required to read the results.
  !> 
  !>     @param[in]
  !>     handle  [rocblas_handle]
  !>             handle to the rocblas library context queue.
  !>     @param[inout]
  !>     d1      device pointer or host pointer to input scalar that is overwritten.
  !>     @param[inout]
  !>     d2      device pointer or host pointer to input scalar that is overwritten.
  !>     @param[inout]
  !>     x1      device pointer or host pointer to input scalar that is overwritten.
  !>     @param[in]
  !>     y1      device pointer or host pointer to input scalar.
  !>     @param[out]
  !>     param   device vector or host vector of 5 elements defining the rotation.
  !>             param[0] = flag
  !>             param[1] = H11
  !>             param[2] = H21
  !>             param[3] = H12
  !>             param[4] = H22
  !>             The flag parameter defines the form of H:
  !>             flag = -1 => H = ( H11 H12 H21 H22 )
  !>             flag =  0 => H = ( 1.0 H12 H21 1.0 )
  !>             flag =  1 => H = ( H11 1.0 -1.0 H22 )
  !>             flag = -2 => H = ( 1.0 0.0 0.0 1.0 )
  !>             param may be stored in either host or device memory, location is specified by calling rocblas_set_pointer_mode.
  !> 
  !>     
    function rocblas_drotmg(handle,d1,d2,x1,y1,param) bind(c, name="rocblas_drotmg")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_drotmg
      type(c_ptr),value :: handle
      type(c_ptr),value :: d1
      type(c_ptr),value :: d2
      type(c_ptr),value :: x1
      type(c_ptr),value :: y1
      type(c_ptr),value :: param
    end function

  
    function rocblas_srotmg_batched(handle,d1,d2,x1,y1,param,batch_count) bind(c, name="rocblas_srotmg_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_srotmg_batched
      type(c_ptr),value :: handle
      type(c_ptr) :: d1
      type(c_ptr) :: d2
      type(c_ptr) :: x1
      type(c_ptr) :: y1
      type(c_ptr) :: param
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 1 API
  !> 
  !>     \details
  !>     rotmg_batched creates the modified Givens rotation matrix for the batched vectors (d1_i  x1_i, d2_i  y1_i), for i = 1, ..., batch_count.
  !>           Parameters may be stored in either host or device memory, location is specified by calling rocblas_set_pointer_mode.
  !>           If the pointer mode is set to rocblas_pointer_mode_host, this function blocks the CPU until the GPU has finished and the results are available in host memory.
  !>           If the pointer mode is set to rocblas_pointer_mode_device, this function returns immediately and synchronization is required to read the results.
  !> 
  !>     @param[in]
  !>     handle  [rocblas_handle]
  !>             handle to the rocblas library context queue.
  !>     @param[inout]
  !>     d1      device batched array or host batched array of input scalars that is overwritten.
  !>     @param[inout]
  !>     d2      device batched array or host batched array of input scalars that is overwritten.
  !>     @param[inout]
  !>     x1      device batched array or host batched array of input scalars that is overwritten.
  !>     @param[in]
  !>     y1      device batched array or host batched array of input scalars.
  !>     @param[out]
  !>     param   device batched array or host batched array of vectors of 5 elements defining the rotation.
  !>             param[0] = flag
  !>             param[1] = H11
  !>             param[2] = H21
  !>             param[3] = H12
  !>             param[4] = H22
  !>             The flag parameter defines the form of H:
  !>             flag = -1 => H = ( H11 H12 H21 H22 )
  !>             flag =  0 => H = ( 1.0 H12 H21 1.0 )
  !>             flag =  1 => H = ( H11 1.0 -1.0 H22 )
  !>             flag = -2 => H = ( 1.0 0.0 0.0 1.0 )
  !>             param may be stored in either host or device memory, location is specified by calling rocblas_set_pointer_mode.
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 the number of instances in the batch.
  !> 
  !>     
    function rocblas_drotmg_batched(handle,d1,d2,x1,y1,param,batch_count) bind(c, name="rocblas_drotmg_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_drotmg_batched
      type(c_ptr),value :: handle
      type(c_ptr) :: d1
      type(c_ptr) :: d2
      type(c_ptr) :: x1
      type(c_ptr) :: y1
      type(c_ptr) :: param
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_srotmg_strided_batched(handle,d1,stride_d1,d2,stride_d2,x1,stride_x1,y1,stride_y1,param,stride_param,batch_count) bind(c, name="rocblas_srotmg_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_srotmg_strided_batched
      type(c_ptr),value :: handle
      type(c_ptr),value :: d1
      integer(c_int64_t),value :: stride_d1
      type(c_ptr),value :: d2
      integer(c_int64_t),value :: stride_d2
      type(c_ptr),value :: x1
      integer(c_int64_t),value :: stride_x1
      type(c_ptr),value :: y1
      integer(c_int64_t),value :: stride_y1
      type(c_ptr),value :: param
      integer(c_int64_t),value :: stride_param
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 1 API
  !> 
  !>     \details
  !>     rotmg_strided_batched creates the modified Givens rotation matrix for the strided batched vectors (d1_i  x1_i, d2_i  y1_i), for i = 1, ..., batch_count.
  !>           Parameters may be stored in either host or device memory, location is specified by calling rocblas_set_pointer_mode.
  !>           If the pointer mode is set to rocblas_pointer_mode_host, this function blocks the CPU until the GPU has finished and the results are available in host memory.
  !>           If the pointer mode is set to rocblas_pointer_mode_device, this function returns immediately and synchronization is required to read the results.
  !> 
  !>     @param[in]
  !>     handle  [rocblas_handle]
  !>             handle to the rocblas library context queue.
  !>     @param[inout]
  !>     d1      device strided_batched array or host strided_batched array of input scalars that is overwritten.
  !>     @param[in]
  !>     stride_d1 [rocblas_stride]
  !>               specifies the increment between the beginning of d1_i and d1_(i+1)
  !>     @param[inout]
  !>     d2      device strided_batched array or host strided_batched array of input scalars that is overwritten.
  !>     @param[in]
  !>     stride_d2 [rocblas_stride]
  !>               specifies the increment between the beginning of d2_i and d2_(i+1)
  !>     @param[inout]
  !>     x1      device strided_batched array or host strided_batched array of input scalars that is overwritten.
  !>     @param[in]
  !>     stride_x1 [rocblas_stride]
  !>               specifies the increment between the beginning of x1_i and x1_(i+1)
  !>     @param[in]
  !>     y1      device strided_batched array or host strided_batched array of input scalars.
  !>     @param[in]
  !>     stride_y1 [rocblas_stride]
  !>               specifies the increment between the beginning of y1_i and y1_(i+1)
  !>     @param[out]
  !>     param   device strided_batched array or host strided_batched array of vectors of 5 elements defining the rotation.
  !>             param[0] = flag
  !>             param[1] = H11
  !>             param[2] = H21
  !>             param[3] = H12
  !>             param[4] = H22
  !>             The flag parameter defines the form of H:
  !>             flag = -1 => H = ( H11 H12 H21 H22 )
  !>             flag =  0 => H = ( 1.0 H12 H21 1.0 )
  !>             flag =  1 => H = ( H11 1.0 -1.0 H22 )
  !>             flag = -2 => H = ( 1.0 0.0 0.0 1.0 )
  !>             param may be stored in either host or device memory, location is specified by calling rocblas_set_pointer_mode.
  !>     @param[in]
  !>     stride_param [rocblas_stride]
  !>                  specifies the increment between the beginning of param_i and param_(i + 1)
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 the number of instances in the batch.
  !> 
  !>     
    function rocblas_drotmg_strided_batched(handle,d1,stride_d1,d2,stride_d2,x1,stride_x1,y1,stride_y1,param,stride_param,batch_count) bind(c, name="rocblas_drotmg_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_drotmg_strided_batched
      type(c_ptr),value :: handle
      type(c_ptr),value :: d1
      integer(c_int64_t),value :: stride_d1
      type(c_ptr),value :: d2
      integer(c_int64_t),value :: stride_d2
      type(c_ptr),value :: x1
      integer(c_int64_t),value :: stride_x1
      type(c_ptr),value :: y1
      integer(c_int64_t),value :: stride_y1
      type(c_ptr),value :: param
      integer(c_int64_t),value :: stride_param
      integer(c_int),value :: batch_count
    end function

  !> 
  !>   ===========================================================================
  !>      level 2 BLAS
  !>   ===========================================================================
  !>  
    function rocblas_sgbmv(handle,trans,m,n,kl,ku,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="rocblas_sgbmv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sgbmv
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: kl
      integer(c_int),value :: ku
      real(c_float) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      real(c_float) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
    function rocblas_dgbmv(handle,trans,m,n,kl,ku,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="rocblas_dgbmv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dgbmv
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: kl
      integer(c_int),value :: ku
      real(c_double) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      real(c_double) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
    function rocblas_cgbmv(handle,trans,m,n,kl,ku,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="rocblas_cgbmv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cgbmv
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: kl
      integer(c_int),value :: ku
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      complex(c_float_complex) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xGBMV performs one of the matrix-vector operations
  !> 
  !>         y := alphaAx    + betay,   or
  !>         y := alphaATx + betay,   or
  !>         y := alphaAHx + betay,
  !> 
  !>     where alpha and beta are scalars, x and y are vectors and A is an
  !>     m by n banded matrix with kl sub-diagonals and ku super-diagonals.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     trans     [rocblas_operation]
  !>               indicates whether matrix A is tranposed (conjugated) or not
  !>     @param[in]
  !>     m         [rocblas_int]
  !>               number of rows of matrix A
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               number of columns of matrix A
  !>     @param[in]
  !>     kl        [rocblas_int]
  !>               number of sub-diagonals of A
  !>     @param[in]
  !>     ku        [rocblas_int]
  !>               number of super-diagonals of A
  !>     @param[in]
  !>     alpha     device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>         A     device pointer storing banded matrix A.
  !>               Leading (kl + ku + 1) by n part of the matrix contains the coefficients
  !>               of the banded matrix. The leading diagonal resides in row (ku + 1) with
  !>               the first super-diagonal above on the RHS of row ku. The first sub-diagonal
  !>               resides below on the LHS of row ku + 2. This propogates up and down across
  !>               subsuper-diagonals.
  !>                 Ex: (m = n = 7; ku = 2, kl = 2)
  !>                 1 2 3 0 0 0 0             0 0 3 3 3 3 3
  !>                 4 1 2 3 0 0 0             0 2 2 2 2 2 2
  !>                 5 4 1 2 3 0 0    ---->    1 1 1 1 1 1 1
  !>                 0 5 4 1 2 3 0             4 4 4 4 4 4 0
  !>                 0 0 5 4 1 2 0             5 5 5 5 5 0 0
  !>                 0 0 0 5 4 1 2             0 0 0 0 0 0 0
  !>                 0 0 0 0 5 4 1             0 0 0 0 0 0 0
  !>               Note that the empty elements which don't correspond to data will not
  !>               be referenced.
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of A. Must be >= (kl + ku + 1)
  !>     @param[in]
  !>     x         device pointer storing vector x.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of x.
  !>     @param[in]
  !>     beta      device pointer or host pointer to scalar beta.
  !>     @param[inout]
  !>     y         device pointer storing vector y.
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of y.
  !> 
  !>     
    function rocblas_zgbmv(handle,trans,m,n,kl,ku,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="rocblas_zgbmv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zgbmv
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: kl
      integer(c_int),value :: ku
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      complex(c_double_complex) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
    function rocblas_sgbmv_batched(handle,trans,m,n,kl,ku,alpha,A,lda,x,incx,beta,y,incy,batch_count) bind(c, name="rocblas_sgbmv_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sgbmv_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: kl
      integer(c_int),value :: ku
      real(c_float) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      real(c_float) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dgbmv_batched(handle,trans,m,n,kl,ku,alpha,A,lda,x,incx,beta,y,incy,batch_count) bind(c, name="rocblas_dgbmv_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dgbmv_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: kl
      integer(c_int),value :: ku
      real(c_double) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      real(c_double) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_cgbmv_batched(handle,trans,m,n,kl,ku,alpha,A,lda,x,incx,beta,y,incy,batch_count) bind(c, name="rocblas_cgbmv_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cgbmv_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: kl
      integer(c_int),value :: ku
      complex(c_float_complex) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      complex(c_float_complex) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xGBMV_BATCHED performs one of the matrix-vector operations
  !> 
  !>         y_i := alphaA_ix_i    + betay_i,   or
  !>         y_i := alphaA_iTx_i + betay_i,   or
  !>         y_i := alphaA_iHx_i + betay_i,
  !> 
  !>     where (A_i, x_i, y_i) is the i-th instance of the batch.
  !>     alpha and beta are scalars, x_i and y_i are vectors and A_i is an
  !>     m by n banded matrix with kl sub-diagonals and ku super-diagonals,
  !>     for i = 1, ..., batch_count.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     trans     [rocblas_operation]
  !>               indicates whether matrix A is tranposed (conjugated) or not
  !>     @param[in]
  !>     m         [rocblas_int]
  !>               number of rows of each matrix A_i
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               number of columns of each matrix A_i
  !>     @param[in]
  !>     kl        [rocblas_int]
  !>               number of sub-diagonals of each A_i
  !>     @param[in]
  !>     ku        [rocblas_int]
  !>               number of super-diagonals of each A_i
  !>     @param[in]
  !>     alpha     device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>         A     device array of device pointers storing each banded matrix A_i.
  !>               Leading (kl + ku + 1) by n part of the matrix contains the coefficients
  !>               of the banded matrix. The leading diagonal resides in row (ku + 1) with
  !>               the first super-diagonal above on the RHS of row ku. The first sub-diagonal
  !>               resides below on the LHS of row ku + 2. This propogates up and down across
  !>               subsuper-diagonals.
  !>                 Ex: (m = n = 7; ku = 2, kl = 2)
  !>                 1 2 3 0 0 0 0             0 0 3 3 3 3 3
  !>                 4 1 2 3 0 0 0             0 2 2 2 2 2 2
  !>                 5 4 1 2 3 0 0    ---->    1 1 1 1 1 1 1
  !>                 0 5 4 1 2 3 0             4 4 4 4 4 4 0
  !>                 0 0 5 4 1 2 0             5 5 5 5 5 0 0
  !>                 0 0 0 5 4 1 2             0 0 0 0 0 0 0
  !>                 0 0 0 0 5 4 1             0 0 0 0 0 0 0
  !>               Note that the empty elements which don't correspond to data will not
  !>               be referenced.
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of each A_i. Must be >= (kl + ku + 1)
  !>     @param[in]
  !>     x         device array of device pointers storing each vector x_i.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i.
  !>     @param[in]
  !>     beta      device pointer or host pointer to scalar beta.
  !>     @param[inout]
  !>     y         device array of device pointers storing each vector y_i.
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of each y_i.
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 specifies the number of instances in the batch.
  !> 
  !>     
    function rocblas_zgbmv_batched(handle,trans,m,n,kl,ku,alpha,A,lda,x,incx,beta,y,incy,batch_count) bind(c, name="rocblas_zgbmv_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zgbmv_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: kl
      integer(c_int),value :: ku
      complex(c_double_complex) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      complex(c_double_complex) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_sgbmv_strided_batched(handle,trans,m,n,kl,ku,alpha,A,lda,stride_A,x,incx,stride_x,beta,y,incy,stride_y,batch_count) bind(c, name="rocblas_sgbmv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sgbmv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: kl
      integer(c_int),value :: ku
      real(c_float) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      real(c_float) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stride_y
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dgbmv_strided_batched(handle,trans,m,n,kl,ku,alpha,A,lda,stride_A,x,incx,stride_x,beta,y,incy,stride_y,batch_count) bind(c, name="rocblas_dgbmv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dgbmv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: kl
      integer(c_int),value :: ku
      real(c_double) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      real(c_double) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stride_y
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_cgbmv_strided_batched(handle,trans,m,n,kl,ku,alpha,A,lda,stride_A,x,incx,stride_x,beta,y,incy,stride_y,batch_count) bind(c, name="rocblas_cgbmv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cgbmv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: kl
      integer(c_int),value :: ku
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      complex(c_float_complex) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stride_y
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xGBMV_STRIDED_BATCHED performs one of the matrix-vector operations
  !> 
  !>         y_i := alphaA_ix_i    + betay_i,   or
  !>         y_i := alphaA_iTx_i + betay_i,   or
  !>         y_i := alphaA_iHx_i + betay_i,
  !> 
  !>     where (A_i, x_i, y_i) is the i-th instance of the batch.
  !>     alpha and beta are scalars, x_i and y_i are vectors and A_i is an
  !>     m by n banded matrix with kl sub-diagonals and ku super-diagonals,
  !>     for i = 1, ..., batch_count.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     trans     [rocblas_operation]
  !>               indicates whether matrix A is tranposed (conjugated) or not
  !>     @param[in]
  !>     m         [rocblas_int]
  !>               number of rows of matrix A
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               number of columns of matrix A
  !>     @param[in]
  !>     kl        [rocblas_int]
  !>               number of sub-diagonals of A
  !>     @param[in]
  !>     ku        [rocblas_int]
  !>               number of super-diagonals of A
  !>     @param[in]
  !>     alpha     device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>         A     device pointer to first banded matrix (A_1).
  !>               Leading (kl + ku + 1) by n part of the matrix contains the coefficients
  !>               of the banded matrix. The leading diagonal resides in row (ku + 1) with
  !>               the first super-diagonal above on the RHS of row ku. The first sub-diagonal
  !>               resides below on the LHS of row ku + 2. This propogates up and down across
  !>               subsuper-diagonals.
  !>                 Ex: (m = n = 7; ku = 2, kl = 2)
  !>                 1 2 3 0 0 0 0             0 0 3 3 3 3 3
  !>                 4 1 2 3 0 0 0             0 2 2 2 2 2 2
  !>                 5 4 1 2 3 0 0    ---->    1 1 1 1 1 1 1
  !>                 0 5 4 1 2 3 0             4 4 4 4 4 4 0
  !>                 0 0 5 4 1 2 0             5 5 5 5 5 0 0
  !>                 0 0 0 5 4 1 2             0 0 0 0 0 0 0
  !>                 0 0 0 0 5 4 1             0 0 0 0 0 0 0
  !>               Note that the empty elements which don't correspond to data will not
  !>               be referenced.
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of A. Must be >= (kl + ku + 1)
  !>     @param[in]
  !>     stride_A  [rocblas_stride]
  !>               stride from the start of one matrix (A_i) and the next one (A_i+1)
  !>     @param[in]
  !>     x         device pointer to first vector (x_1).
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of x.
  !>     @param[in]
  !>     stride_x  [rocblas_stride]
  !>               stride from the start of one vector (x_i) and the next one (x_i+1)
  !>     @param[in]
  !>     beta      device pointer or host pointer to scalar beta.
  !>     @param[inout]
  !>     y         device pointer to first vector (y_1).
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of y.
  !>     @param[in]
  !>     stride_y  [rocblas_stride]
  !>               stride from the start of one vector (y_i) and the next one (x_i+1)
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 specifies the number of instances in the batch.
  !> 
  !>     
    function rocblas_zgbmv_strided_batched(handle,trans,m,n,kl,ku,alpha,A,lda,stride_A,x,incx,stride_x,beta,y,incy,stride_y,batch_count) bind(c, name="rocblas_zgbmv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zgbmv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: kl
      integer(c_int),value :: ku
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      complex(c_double_complex) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stride_y
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_sgemv(handle,trans,m,n,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="rocblas_sgemv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sgemv
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      real(c_float) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
    function rocblas_dgemv(handle,trans,m,n,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="rocblas_dgemv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dgemv
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      real(c_double) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
    function rocblas_cgemv(handle,trans,m,n,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="rocblas_cgemv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cgemv
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      complex(c_float_complex) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xGEMV performs one of the matrix-vector operations
  !> 
  !>         y := alphaAx    + betay,   or
  !>         y := alphaATx + betay,   or
  !>         y := alphaAHx + betay,
  !> 
  !>     where alpha and beta are scalars, x and y are vectors and A is an
  !>     m by n matrix.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     trans     [rocblas_operation]
  !>               indicates whether matrix A is tranposed (conjugated) or not
  !>     @param[in]
  !>     m         [rocblas_int]
  !>               number of rows of matrix A
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               number of columns of matrix A
  !>     @param[in]
  !>     alpha     device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>     A         device pointer storing matrix A.
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of A.
  !>     @param[in]
  !>     x         device pointer storing vector x.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of x.
  !>     @param[in]
  !>     beta      device pointer or host pointer to scalar beta.
  !>     @param[inout]
  !>     y         device pointer storing vector y.
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of y.
  !> 
  !>     
    function rocblas_zgemv(handle,trans,m,n,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="rocblas_zgemv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zgemv
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      complex(c_double_complex) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
    function rocblas_sgemv_batched(handle,trans,m,n,alpha,A,lda,x,incx,beta,y,incy,batch_count) bind(c, name="rocblas_sgemv_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sgemv_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      real(c_float) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dgemv_batched(handle,trans,m,n,alpha,A,lda,x,incx,beta,y,incy,batch_count) bind(c, name="rocblas_dgemv_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dgemv_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      real(c_double) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_cgemv_batched(handle,trans,m,n,alpha,A,lda,x,incx,beta,y,incy,batch_count) bind(c, name="rocblas_cgemv_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cgemv_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      complex(c_float_complex) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xGEMV_BATCHED performs a batch of matrix-vector operations
  !> 
  !>         y_i := alphaA_ix_i    + betay_i,   or
  !>         y_i := alphaA_iTx_i + betay_i,   or
  !>         y_i := alphaA_iHx_i + betay_i,
  !> 
  !>     where (A_i, x_i, y_i) is the i-th instance of the batch.
  !>     alpha and beta are scalars, x_i and y_i are vectors and A_i is an
  !>     m by n matrix, for i = 1, ..., batch_count.
  !> 
  !>     @param[in]
  !>     handle      [rocblas_handle]
  !>                 handle to the rocblas library context queue.
  !>     @param[in]
  !>     trans       [rocblas_operation]
  !>                 indicates whether matrices A_i are tranposed (conjugated) or not
  !>     @param[in]
  !>     m           [rocblas_int]
  !>                 number of rows of each matrix A_i
  !>     @param[in]
  !>     n           [rocblas_int]
  !>                 number of columns of each matrix A_i
  !>     @param[in]
  !>     alpha       device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>     A           device array of device pointers storing each matrix A_i.
  !>     @param[in]
  !>     lda         [rocblas_int]
  !>                 specifies the leading dimension of each matrix A_i.
  !>     @param[in]
  !>     x           device array of device pointers storing each vector x_i.
  !>     @param[in]
  !>     incx        [rocblas_int]
  !>                 specifies the increment for the elements of each vector x_i.
  !>     @param[in]
  !>     beta        device pointer or host pointer to scalar beta.
  !>     @param[inout]
  !>     y           device array of device pointers storing each vector y_i.
  !>     @param[in]
  !>     incy        [rocblas_int]
  !>                 specifies the increment for the elements of each vector y_i.
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch
  !> 
  !>     
    function rocblas_zgemv_batched(handle,trans,m,n,alpha,A,lda,x,incx,beta,y,incy,batch_count) bind(c, name="rocblas_zgemv_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zgemv_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      complex(c_double_complex) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_sgemv_strided_batched(handle,transA,m,n,alpha,A,lda,strideA,x,incx,stridex,beta,y,incy,stridey,batch_count) bind(c, name="rocblas_sgemv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sgemv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      real(c_float) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dgemv_strided_batched(handle,transA,m,n,alpha,A,lda,strideA,x,incx,stridex,beta,y,incy,stridey,batch_count) bind(c, name="rocblas_dgemv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dgemv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      real(c_double) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_cgemv_strided_batched(handle,transA,m,n,alpha,A,lda,strideA,x,incx,stridex,beta,y,incy,stridey,batch_count) bind(c, name="rocblas_cgemv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cgemv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      complex(c_float_complex) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xGEMV_STRIDED_BATCHED performs a batch of matrix-vector operations
  !> 
  !>         y_i := alphaA_ix_i    + betay_i,   or
  !>         y_i := alphaA_iTx_i + betay_i,   or
  !>         y_i := alphaA_iHx_i + betay_i,
  !> 
  !>     where (A_i, x_i, y_i) is the i-th instance of the batch.
  !>     alpha and beta are scalars, x_i and y_i are vectors and A_i is an
  !>     m by n matrix, for i = 1, ..., batch_count.
  !> 
  !>     @param[in]
  !>     handle      [rocblas_handle]
  !>                 handle to the rocblas library context queue.
  !>     @param[in]
  !>     transA      [rocblas_operation]
  !>                 indicates whether matrices A_i are tranposed (conjugated) or not
  !>     @param[in]
  !>     m           [rocblas_int]
  !>                 number of rows of matrices A_i
  !>     @param[in]
  !>     n           [rocblas_int]
  !>                 number of columns of matrices A_i
  !>     @param[in]
  !>     alpha       device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>     A           device pointer to the first matrix (A_1) in the batch.
  !>     @param[in]
  !>     lda         [rocblas_int]
  !>                 specifies the leading dimension of matrices A_i.
  !>     @param[in]
  !>     strideA     [rocblas_stride]
  !>                 stride from the start of one matrix (A_i) and the next one (A_i+1)
  !>     @param[in]
  !>     x           device pointer to the first vector (x_1) in the batch.
  !>     @param[in]
  !>     incx        [rocblas_int]
  !>                 specifies the increment for the elements of vectors x_i.
  !>     @param[in]
  !>     stridex     [rocblas_stride]
  !>                 stride from the start of one vector (x_i) and the next one (x_i+1).
  !>                 There are no restrictions placed on stride_x, however the user should
  !>                 take care to ensure that stride_x is of appropriate size. When trans equals rocblas_operation_none
  !>                 this typically means stride_x >= n  incx, otherwise stride_x >= m  incx.
  !>     @param[in]
  !>     beta        device pointer or host pointer to scalar beta.
  !>     @param[inout]
  !>     y           device pointer to the first vector (y_1) in the batch.
  !>     @param[in]
  !>     incy        [rocblas_int]
  !>                 specifies the increment for the elements of vectors y_i.
  !>     @param[in]
  !>     stridey     [rocblas_stride]
  !>                 stride from the start of one vector (y_i) and the next one (y_i+1).
  !>                 There are no restrictions placed on stride_y, however the user should
  !>                 take care to ensure that stride_y is of appropriate size. When trans equals rocblas_operation_none
  !>                 this typically means stride_y >= m  incy, otherwise stride_y >= n  incy. stridey should be non zero.
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch
  !> 
  !>     
    function rocblas_zgemv_strided_batched(handle,transA,m,n,alpha,A,lda,strideA,x,incx,stridex,beta,y,incy,stridey,batch_count) bind(c, name="rocblas_zgemv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zgemv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: transA
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      complex(c_double_complex) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_chbmv(handle,uplo,n,k,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="rocblas_chbmv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_chbmv
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      complex(c_float_complex) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xHBMV performs the matrix-vector operations
  !> 
  !>         y := alphaAx + betay
  !> 
  !>     where alpha and beta are scalars, x and y are n element vectors and A is an
  !>     n by n hermitian band matrix, with k super-diagonals.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               rocblas_fill_upper: The upper triangular part of A is being supplied.
  !>               rocblas_fill_lower: The lower triangular part of A is being supplied.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the order of the matrix A.
  !>     @param[in]
  !>     k         [rocblas_int]
  !>               the number of super-diagonals of the matrix A. Must be >= 0.
  !>     @param[in]
  !>     alpha     device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>     A         device pointer storing matrix A. Of dimension (lda, n).
  !>               if uplo == rocblas_fill_upper:
  !>                 The leading (k + 1) by n part of A must contain the upper
  !>                 triangular band part of the hermitian matrix, with the leading
  !>                 diagonal in row (k + 1), the first super-diagonal on the RHS
  !>                 of row k, etc.
  !>                 The top left k by x triangle of A will not be referenced.
  !>                     Ex (upper, lda = n = 4, k = 1):
  !>                     A                             Represented matrix
  !>                     (0,0) (5,9) (6,8) (7,7)       (1, 0) (5, 9) (0, 0) (0, 0)
  !>                     (1,0) (2,0) (3,0) (4,0)       (5,-9) (2, 0) (6, 8) (0, 0)
  !>                     (0,0) (0,0) (0,0) (0,0)       (0, 0) (6,-8) (3, 0) (7, 7)
  !>                     (0,0) (0,0) (0,0) (0,0)       (0, 0) (0, 0) (7,-7) (4, 0)
  !> 
  !>               if uplo == rocblas_fill_lower:
  !>                 The leading (k + 1) by n part of A must contain the lower
  !>                 triangular band part of the hermitian matrix, with the leading
  !>                 diagonal in row (1), the first sub-diagonal on the LHS of
  !>                 row 2, etc.
  !>                 The bottom right k by k triangle of A will not be referenced.
  !>                     Ex (lower, lda = 2, n = 4, k = 1):
  !>                     A                               Represented matrix
  !>                     (1,0) (2,0) (3,0) (4,0)         (1, 0) (5,-9) (0, 0) (0, 0)
  !>                     (5,9) (6,8) (7,7) (0,0)         (5, 9) (2, 0) (6,-8) (0, 0)
  !>                                                     (0, 0) (6, 8) (3, 0) (7,-7)
  !>                                                     (0, 0) (0, 0) (7, 7) (4, 0)
  !> 
  !>               As a hermitian matrix, the imaginary part of the main diagonal
  !>               of A will not be referenced and is assumed to be == 0.
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of A. must be >= k + 1
  !>     @param[in]
  !>     x         device pointer storing vector x.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of x.
  !>     @param[in]
  !>     beta      device pointer or host pointer to scalar beta.
  !>     @param[inout]
  !>     y         device pointer storing vector y.
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of y.
  !> 
  !>     
    function rocblas_zhbmv(handle,uplo,n,k,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="rocblas_zhbmv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zhbmv
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      complex(c_double_complex) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
    function rocblas_chbmv_batched(handle,uplo,n,k,alpha,A,lda,x,incx,beta,y,incy,batch_count) bind(c, name="rocblas_chbmv_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_chbmv_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      complex(c_float_complex) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xHBMV_BATCHED performs one of the matrix-vector operations
  !> 
  !>         y_i := alphaA_ix_i + betay_i
  !> 
  !>     where alpha and beta are scalars, x_i and y_i are n element vectors and A_i is an
  !>     n by n hermitian band matrix with k super-diagonals, for each batch in i = [1, batch_count].
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               rocblas_fill_upper: The upper triangular part of each A_i is being supplied.
  !>               rocblas_fill_lower: The lower triangular part of each A_i is being supplied.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the order of each matrix A_i.
  !>     @param[in]
  !>     k         [rocblas_int]
  !>               the number of super-diagonals of each matrix A_i. Must be >= 0.
  !>     @param[in]
  !>     alpha     device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>     A         device array of device pointers storing each matrix_i A of dimension (lda, n).
  !>               if uplo == rocblas_fill_upper:
  !>                 The leading (k + 1) by n part of each A_i must contain the upper
  !>                 triangular band part of the hermitian matrix, with the leading
  !>                 diagonal in row (k + 1), the first super-diagonal on the RHS
  !>                 of row k, etc.
  !>                 The top left k by x triangle of each A_i will not be referenced.
  !>                     Ex (upper, lda = n = 4, k = 1):
  !>                     A                             Represented matrix
  !>                     (0,0) (5,9) (6,8) (7,7)       (1, 0) (5, 9) (0, 0) (0, 0)
  !>                     (1,0) (2,0) (3,0) (4,0)       (5,-9) (2, 0) (6, 8) (0, 0)
  !>                     (0,0) (0,0) (0,0) (0,0)       (0, 0) (6,-8) (3, 0) (7, 7)
  !>                     (0,0) (0,0) (0,0) (0,0)       (0, 0) (0, 0) (7,-7) (4, 0)
  !> 
  !>               if uplo == rocblas_fill_lower:
  !>                 The leading (k + 1) by n part of each A_i must contain the lower
  !>                 triangular band part of the hermitian matrix, with the leading
  !>                 diagonal in row (1), the first sub-diagonal on the LHS of
  !>                 row 2, etc.
  !>                 The bottom right k by k triangle of each A_i will not be referenced.
  !>                     Ex (lower, lda = 2, n = 4, k = 1):
  !>                     A                               Represented matrix
  !>                     (1,0) (2,0) (3,0) (4,0)         (1, 0) (5,-9) (0, 0) (0, 0)
  !>                     (5,9) (6,8) (7,7) (0,0)         (5, 9) (2, 0) (6,-8) (0, 0)
  !>                                                     (0, 0) (6, 8) (3, 0) (7,-7)
  !>                                                     (0, 0) (0, 0) (7, 7) (4, 0)
  !> 
  !>               As a hermitian matrix, the imaginary part of the main diagonal
  !>               of each A_i will not be referenced and is assumed to be == 0.
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of each A_i. must be >= max(1, n)
  !>     @param[in]
  !>     x         device array of device pointers storing each vector x_i.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i.
  !>     @param[in]
  !>     beta      device pointer or host pointer to scalar beta.
  !>     @param[inout]
  !>     y         device array of device pointers storing each vector y_i.
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of y.
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch.
  !> 
  !>     
    function rocblas_zhbmv_batched(handle,uplo,n,k,alpha,A,lda,x,incx,beta,y,incy,batch_count) bind(c, name="rocblas_zhbmv_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zhbmv_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      complex(c_double_complex) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_chbmv_strided_batched(handle,uplo,n,k,alpha,A,lda,stride_A,x,incx,stride_x,beta,y,incy,stride_y,batch_count) bind(c, name="rocblas_chbmv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_chbmv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      complex(c_float_complex) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stride_y
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xHBMV_STRIDED_BATCHED performs one of the matrix-vector operations
  !> 
  !>         y_i := alphaA_ix_i + betay_i
  !> 
  !>     where alpha and beta are scalars, x_i and y_i are n element vectors and A_i is an
  !>     n by n hermitian band matrix with k super-diagonals, for each batch in i = [1, batch_count].
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               rocblas_fill_upper: The upper triangular part of each A_i is being supplied.
  !>               rocblas_fill_lower: The lower triangular part of each A_i is being supplied.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the order of each matrix A_i.
  !>     @param[in]
  !>     k         [rocblas_int]
  !>               the number of super-diagonals of each matrix A_i. Must be >= 0.
  !>     @param[in]
  !>     alpha     device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>     A         device array pointing to the first matrix A_1. Each A_i is of dimension (lda, n).
  !>               if uplo == rocblas_fill_upper:
  !>                 The leading (k + 1) by n part of each A_i must contain the upper
  !>                 triangular band part of the hermitian matrix, with the leading
  !>                 diagonal in row (k + 1), the first super-diagonal on the RHS
  !>                 of row k, etc.
  !>                 The top left k by x triangle of each A_i will not be referenced.
  !>                     Ex (upper, lda = n = 4, k = 1):
  !>                     A                             Represented matrix
  !>                     (0,0) (5,9) (6,8) (7,7)       (1, 0) (5, 9) (0, 0) (0, 0)
  !>                     (1,0) (2,0) (3,0) (4,0)       (5,-9) (2, 0) (6, 8) (0, 0)
  !>                     (0,0) (0,0) (0,0) (0,0)       (0, 0) (6,-8) (3, 0) (7, 7)
  !>                     (0,0) (0,0) (0,0) (0,0)       (0, 0) (0, 0) (7,-7) (4, 0)
  !> 
  !>               if uplo == rocblas_fill_lower:
  !>                 The leading (k + 1) by n part of each A_i must contain the lower
  !>                 triangular band part of the hermitian matrix, with the leading
  !>                 diagonal in row (1), the first sub-diagonal on the LHS of
  !>                 row 2, etc.
  !>                 The bottom right k by k triangle of each A_i will not be referenced.
  !>                     Ex (lower, lda = 2, n = 4, k = 1):
  !>                     A                               Represented matrix
  !>                     (1,0) (2,0) (3,0) (4,0)         (1, 0) (5,-9) (0, 0) (0, 0)
  !>                     (5,9) (6,8) (7,7) (0,0)         (5, 9) (2, 0) (6,-8) (0, 0)
  !>                                                     (0, 0) (6, 8) (3, 0) (7,-7)
  !>                                                     (0, 0) (0, 0) (7, 7) (4, 0)
  !> 
  !>               As a hermitian matrix, the imaginary part of the main diagonal
  !>               of each A_i will not be referenced and is assumed to be == 0.
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of each A_i. must be >= max(1, n)
  !>     @param[in]
  !>     stride_A  [rocblas_stride]
  !>               stride from the start of one matrix (A_i) and the next one (A_i+1)
  !>     @param[in]
  !>     x         device array pointing to the first vector y_1.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i.
  !>     @param[in]
  !>     stride_x  [rocblas_stride]
  !>               stride from the start of one vector (x_i) and the next one (x_i+1)
  !>     @param[in]
  !>     beta      device pointer or host pointer to scalar beta.
  !>     @param[inout]
  !>     y         device array pointing to the first vector y_1.
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of y.
  !>     @param[in]
  !>     stride_y  [rocblas_stride]
  !>               stride from the start of one vector (y_i) and the next one (y_i+1)
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch.
  !> 
  !>     
    function rocblas_zhbmv_strided_batched(handle,uplo,n,k,alpha,A,lda,stride_A,x,incx,stride_x,beta,y,incy,stride_y,batch_count) bind(c, name="rocblas_zhbmv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zhbmv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      complex(c_double_complex) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stride_y
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_chemv(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="rocblas_chemv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_chemv
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      complex(c_float_complex) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xHEMV performs one of the matrix-vector operations
  !> 
  !>         y := alphaAx + betay
  !> 
  !>     where alpha and beta are scalars, x and y are n element vectors and A is an
  !>     n by n hermitian matrix.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               rocblas_fill_upper: the upper triangular part of the hermitian matrix A is supplied.
  !>               rocblas_fill_lower: the lower triangular part of the hermitian matrix A is supplied.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the order of the matrix A.
  !>     @param[in]
  !>     alpha     device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>     A         device pointer storing matrix A. Of dimension (lda, n).
  !>               if uplo == rocblas_fill_upper:
  !>                 The upper triangular part of A must contain
  !>                 the upper triangular part of a hermitian matrix. The lower
  !>                 triangular part of A will not be referenced.
  !>               if uplo == rocblas_fill_lower:
  !>                 The lower triangular part of A must contain
  !>                 the lower triangular part of a hermitian matrix. The upper
  !>                 triangular part of A will not be referenced.
  !>               As a hermitian matrix, the imaginary part of the main diagonal
  !>               of A will not be referenced and is assumed to be == 0.
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of A. must be >= max(1, n)
  !>     @param[in]
  !>     x         device pointer storing vector x.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of x.
  !>     @param[in]
  !>     beta      device pointer or host pointer to scalar beta.
  !>     @param[inout]
  !>     y         device pointer storing vector y.
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of y.
  !> 
  !>     
    function rocblas_zhemv(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="rocblas_zhemv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zhemv
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      complex(c_double_complex) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
    function rocblas_chemv_batched(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy,batch_count) bind(c, name="rocblas_chemv_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_chemv_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      complex(c_float_complex) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xHEMV_BATCHED performs one of the matrix-vector operations
  !> 
  !>         y_i := alphaA_ix_i + betay_i
  !> 
  !>     where alpha and beta are scalars, x_i and y_i are n element vectors and A_i is an
  !>     n by n hermitian matrix, for each batch in i = [1, batch_count].
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               rocblas_fill_upper: the upper triangular part of the hermitian matrix A is supplied.
  !>               rocblas_fill_lower: the lower triangular part of the hermitian matrix A is supplied.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the order of each matrix A_i.
  !>     @param[in]
  !>     alpha     device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>     A         device array of device pointers storing each matrix A_i of dimension (lda, n).
  !>               if uplo == rocblas_fill_upper:
  !>                 The upper triangular part of each A_i must contain
  !>                 the upper triangular part of a hermitian matrix. The lower
  !>                 triangular part of each A_i will not be referenced.
  !>               if uplo == rocblas_fill_lower:
  !>                 The lower triangular part of each A_i must contain
  !>                 the lower triangular part of a hermitian matrix. The upper
  !>                 triangular part of each A_i will not be referenced.
  !>               As a hermitian matrix, the imaginary part of the main diagonal
  !>               of each A_i will not be referenced and is assumed to be == 0.
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of each A_i. must be >= max(1, n)
  !>     @param[in]
  !>     x         device array of device pointers storing each vector x_i.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i.
  !>     @param[in]
  !>     beta      device pointer or host pointer to scalar beta.
  !>     @param[inout]
  !>     y         device array of device pointers storing each vector y_i.
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of y.
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch.
  !> 
  !>     
    function rocblas_zhemv_batched(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy,batch_count) bind(c, name="rocblas_zhemv_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zhemv_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      complex(c_double_complex) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_chemv_strided_batched(handle,uplo,n,alpha,A,lda,stride_A,x,incx,stride_x,beta,y,incy,stride_y,batch_count) bind(c, name="rocblas_chemv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_chemv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      complex(c_float_complex) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stride_y
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xHEMV_STRIDED_BATCHED performs one of the matrix-vector operations
  !> 
  !>         y_i := alphaA_ix_i + betay_i
  !> 
  !>     where alpha and beta are scalars, x_i and y_i are n element vectors and A_i is an
  !>     n by n hermitian matrix, for each batch in i = [1, batch_count].
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               rocblas_fill_upper: the upper triangular part of the hermitian matrix A is supplied.
  !>               rocblas_fill_lower: the lower triangular part of the hermitian matrix A is supplied.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the order of each matrix A_i.
  !>     @param[in]
  !>     alpha     device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>     A         device array of device pointers storing each matrix A_i of dimension (lda, n).
  !>               if uplo == rocblas_fill_upper:
  !>                 The upper triangular part of each A_i must contain
  !>                 the upper triangular part of a hermitian matrix. The lower
  !>                 triangular part of each A_i will not be referenced.
  !>               if uplo == rocblas_fill_lower:
  !>                 The lower triangular part of each A_i must contain
  !>                 the lower triangular part of a hermitian matrix. The upper
  !>                 triangular part of each A_i will not be referenced.
  !>               As a hermitian matrix, the imaginary part of the main diagonal
  !>               of each A_i will not be referenced and is assumed to be == 0.
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of each A_i. must be >= max(1, n)
  !>     @param[in]
  !>     x         device array of device pointers storing each vector x_i.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i.
  !>     @param[in]
  !>     beta      device pointer or host pointer to scalar beta.
  !>     @param[inout]
  !>     y         device array of device pointers storing each vector y_i.
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of y.
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch.
  !> 
  !>     
    function rocblas_zhemv_strided_batched(handle,uplo,n,alpha,A,lda,stride_A,x,incx,stride_x,beta,y,incy,stride_y,batch_count) bind(c, name="rocblas_zhemv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zhemv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      complex(c_double_complex) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stride_y
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_cher(handle,uplo,n,alpha,x,incx,A,lda) bind(c, name="rocblas_cher")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cher
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xHER performs the matrix-vector operations
  !> 
  !>         A := A + alphaxxH
  !> 
  !>     where alpha is a real scalar, x is a vector, and A is an
  !>     n by n hermitian matrix.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               specifies whether the upper 'rocblas_fill_upper' or lower 'rocblas_fill_lower'
  !>               rocblas_fill_upper: The upper triangular part of A is supplied in A.
  !>               rocblas_fill_lower: The lower triangular part of A is supplied in A.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of rows and columns of matrix A, must be at least 0.
  !>     @param[in]
  !>     alpha
  !>               device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>     x         device pointer storing vector x.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of x.
  !>     @param[inout]
  !>     A         device pointer storing the specified triangular portion of
  !>               the hermitian matrix A. Of size (lda  n).
  !>               if uplo == rocblas_fill_upper:
  !>                 The upper triangular portion of the hermitian matrix A is supplied. The lower
  !>                 triangluar portion will not be touched.
  !>             if uplo == rocblas_fill_lower:
  !>                 The lower triangular portion of the hermitian matrix A is supplied. The upper
  !>                 triangular portion will not be touched.
  !>             Note that the imaginary part of the diagonal elements are not accessed and are assumed
  !>             to be 0.
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of A. Must be at least max(1, n).
  !>     
    function rocblas_zher(handle,uplo,n,alpha,x,incx,A,lda) bind(c, name="rocblas_zher")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zher
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  
    function rocblas_cher_batched(handle,uplo,n,alpha,x,incx,A,lda,batch_count) bind(c, name="rocblas_cher_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cher_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xHER_BATCHED performs the matrix-vector operations
  !> 
  !>         A_i := A_i + alphax_ix_iH
  !> 
  !>     where alpha is a real scalar, x_i is a vector, and A_i is an
  !>     n by n symmetric matrix, for i = 1, ..., batch_count.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               specifies whether the upper 'rocblas_fill_upper' or lower 'rocblas_fill_lower'
  !>               rocblas_fill_upper: The upper triangular part of each A_i is supplied in A.
  !>               rocblas_fill_lower: The lower triangular part of each A_i is supplied in A.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of rows and columns of each matrix A_i, must be at least 0.
  !>     @param[in]
  !>     alpha
  !>               device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>     x         device array of device pointers storing each vector x_i.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i.
  !>     @param[inout]
  !>     A         device array of device pointers storing the specified triangular portion of
  !>               each hermitian matrix A_i of at least size ((n  (n + 1))  2). Array is of at least size batch_count.
  !>               if uplo == rocblas_fill_upper:
  !>                 The upper triangular portion of each hermitian matrix A_i is supplied. The lower triangular portion
  !>                 of each A_i will not be touched.
  !>             if uplo == rocblas_fill_lower:
  !>                 The lower triangular portion of each hermitian matrix A_i is supplied. The upper triangular portion
  !>                 of each A_i will not be touched.
  !>             Note that the imaginary part of the diagonal elements are not accessed and are assumed
  !>             to be 0.
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of each A_i. Must be at least max(1, n).
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch.
  !>     
    function rocblas_zher_batched(handle,uplo,n,alpha,x,incx,A,lda,batch_count) bind(c, name="rocblas_zher_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zher_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_cher_strided_batched(handle,uplo,n,alpha,x,incx,stride_x,A,lda,stride_A,batch_count) bind(c, name="rocblas_cher_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cher_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xHER_STRIDED_BATCHED performs the matrix-vector operations
  !> 
  !>         A_i := A_i + alphax_ix_iH
  !> 
  !>     where alpha is a real scalar, x_i is a vector, and A_i is an
  !>     n by n hermitian matrix, for i = 1, ..., batch_count.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               specifies whether the upper 'rocblas_fill_upper' or lower 'rocblas_fill_lower'
  !>               rocblas_fill_upper: The upper triangular part of each A_i is supplied in A.
  !>               rocblas_fill_lower: The lower triangular part of each A_i is supplied in A.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of rows and columns of each matrix A_i, must be at least 0.
  !>     @param[in]
  !>     alpha
  !>               device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>     x         device pointer pointing to the first vector (x_1).
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i.
  !>     @param[in]
  !>     stride_x  [rocblas_stride]
  !>               stride from the start of one vector (x_i) and the next one (x_i+1).
  !>     @param[inout]
  !>     A         device array of device pointers storing the specified triangular portion of
  !>               each hermitian matrix A_i. Points to the first matrix (A_1).
  !>               if uplo == rocblas_fill_upper:
  !>                 The upper triangular portion of each hermitian matrix A_i is supplied. The lower triangular
  !>                 portion of each A_i will not be touched.
  !>             if uplo == rocblas_fill_lower:
  !>                 The lower triangular portion of each hermitian matrix A_i is supplied. The upper triangular
  !>                 portion of each A_i will not be touched.
  !>             Note that the imaginary part of the diagonal elements are not accessed and are assumed
  !>             to be 0.
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of each A_i.
  !>     @param[in]
  !>     stride_A    [rocblas_stride]
  !>                 stride from the start of one (A_i) and the next (A_i+1)
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch.
  !>     
    function rocblas_zher_strided_batched(handle,uplo,n,alpha,x,incx,stride_x,A,lda,stride_A,batch_count) bind(c, name="rocblas_zher_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zher_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_cher2(handle,uplo,n,alpha,x,incx,y,incy,A,lda) bind(c, name="rocblas_cher2")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cher2
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xHER2 performs the matrix-vector operations
  !> 
  !>         A := A + alphaxyH + conj(alpha)yxH
  !> 
  !>     where alpha is a complex scalar, x and y are vectors, and A is an
  !>     n by n hermitian matrix.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               specifies whether the upper 'rocblas_fill_upper' or lower 'rocblas_fill_lower'
  !>               rocblas_fill_upper: The upper triangular part of A is supplied.
  !>               rocblas_fill_lower: The lower triangular part of A is supplied.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of rows and columns of matrix A, must be at least 0.
  !>     @param[in]
  !>     alpha
  !>               device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>     x         device pointer storing vector x.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of x.
  !>     @param[in]
  !>     y         device pointer storing vector y.
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of y.
  !>     @param[inout]
  !>     A         device pointer storing the specified triangular portion of
  !>               the hermitian matrix A. Of size (lda, n).
  !>               if uplo == rocblas_fill_upper:
  !>                 The upper triangular portion of the hermitian matrix A is supplied. The lower triangular
  !>                 portion of A will not be touched.
  !>             if uplo == rocblas_fill_lower:
  !>                 The lower triangular portion of the hermitian matrix A is supplied. The upper triangular
  !>                 portion of A will not be touched.
  !>             Note that the imaginary part of the diagonal elements are not accessed and are assumed
  !>             to be 0.
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of A. Must be at least max(lda, 1).
  !>     
    function rocblas_zher2(handle,uplo,n,alpha,x,incx,y,incy,A,lda) bind(c, name="rocblas_zher2")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zher2
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  
    function rocblas_cher2_batched(handle,uplo,n,alpha,x,incx,y,incy,A,lda,batch_count) bind(c, name="rocblas_cher2_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cher2_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xHER2_BATCHED performs the matrix-vector operations
  !> 
  !>         A_i := A_i + alphax_iy_iH + conj(alpha)y_ix_iH
  !> 
  !>     where alpha is a complex scalar, x_i and y_i are vectors, and A_i is an
  !>     n by n hermitian matrix for each batch in i = [1, batch_count].
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               specifies whether the upper 'rocblas_fill_upper' or lower 'rocblas_fill_lower'
  !>               rocblas_fill_upper: The upper triangular part of each A_i is supplied.
  !>               rocblas_fill_lower: The lower triangular part of each A_i is supplied.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of rows and columns of each matrix A_i, must be at least 0.
  !>     @param[in]
  !>     alpha
  !>               device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>     x         device array of device pointers storing each vector x_i.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of x.
  !>     @param[in]
  !>     y         device array of device pointers storing each vector y_i.
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of each y_i.
  !>     @param[inout]
  !>     A         device array of device pointers storing the specified triangular portion of
  !>               each hermitian matrix A_i of size (lda, n).
  !>               if uplo == rocblas_fill_upper:
  !>                 The upper triangular portion of each hermitian matrix A_i is supplied. The lower triangular
  !>                 portion of each A_i will not be touched.
  !>             if uplo == rocblas_fill_lower:
  !>                 The lower triangular portion of each hermitian matrix A_i is supplied. The upper triangular
  !>                 portion of each A_i will not be touched.
  !>             Note that the imaginary part of the diagonal elements are not accessed and are assumed
  !>             to be 0.
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of each A_i. Must be at least max(lda, 1).
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch.
  !>     
    function rocblas_zher2_batched(handle,uplo,n,alpha,x,incx,y,incy,A,lda,batch_count) bind(c, name="rocblas_zher2_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zher2_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_cher2_strided_batched(handle,uplo,n,alpha,x,incx,stride_x,y,incy,stride_y,A,lda,stride_A,batch_count) bind(c, name="rocblas_cher2_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cher2_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stride_y
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xHER2_STRIDED_BATCHED performs the matrix-vector operations
  !> 
  !>         A_i := A_i + alphax_iy_iH + conj(alpha)y_ix_iH
  !> 
  !>     where alpha is a complex scalar, x_i and y_i are vectors, and A_i is an
  !>     n by n hermitian matrix for each batch in i = [1, batch_count].
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               specifies whether the upper 'rocblas_fill_upper' or lower 'rocblas_fill_lower'
  !>               rocblas_fill_upper: The upper triangular part of each A_i is supplied.
  !>               rocblas_fill_lower: The lower triangular part of each A_i is supplied.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of rows and columns of each matrix A_i, must be at least 0.
  !>     @param[in]
  !>     alpha
  !>               device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>     x         device pointer pointing to the first vector x_1.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i.
  !>     @param[in]
  !>     stride_x  [rocblas_stride]
  !>               specifies the stride between the beginning of one vector (x_i) and the next (x_i+1).
  !>     @param[in]
  !>     y         device pointer pointing to the first vector y_i.
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of each y_i.
  !>     @param[in]
  !>     stride_y  [rocblas_stride]
  !>               specifies the stride between the beginning of one vector (y_i) and the next (y_i+1).
  !>     @param[inout]
  !>     A         device pointer pointing to the first matrix (A_1). Stores the specified triangular portion of
  !>               each hermitian matrix A_i.
  !>               if uplo == rocblas_fill_upper:
  !>                 The upper triangular portion of each hermitian matrix A_i is supplied. The lower triangular
  !>                 portion of each A_i will not be touched.
  !>             if uplo == rocblas_fill_lower:
  !>                 The lower triangular portion of each hermitian matrix A_i is supplied. The upper triangular
  !>                 portion of each A_i will not be touched.
  !>             Note that the imaginary part of the diagonal elements are not accessed and are assumed
  !>             to be 0.
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of each A_i. Must be at least max(lda, 1).
  !>     @param[in]
  !>     stride_A  [rocblas_stride]
  !>               specifies the stride between the beginning of one matrix (A_i) and the next (A_i+1).
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch.
  !>     
    function rocblas_zher2_strided_batched(handle,uplo,n,alpha,x,incx,stride_x,y,incy,stride_y,A,lda,stride_A,batch_count) bind(c, name="rocblas_zher2_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zher2_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stride_y
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_chpmv(handle,uplo,n,alpha,AP,x,incx,beta,y,incy) bind(c, name="rocblas_chpmv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_chpmv
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: AP
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      complex(c_float_complex) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xHPMV performs the matrix-vector operation
  !> 
  !>         y := alphaAx + betay
  !> 
  !>     where alpha and beta are scalars, x and y are n element vectors and A is an
  !>     n by n hermitian matrix, supplied in packed form (see description below).
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               rocblas_fill_upper: the upper triangular part of the hermitian matrix A is supplied in AP.
  !>               rocblas_fill_lower: the lower triangular part of the hermitian matrix A is supplied in AP.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the order of the matrix A, must be >= 0.
  !>     @param[in]
  !>     alpha     device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>     AP        device pointer storing the packed version of the specified triangular portion of
  !>               the hermitian matrix A. Of at least size ((n  (n + 1))  2).
  !>               if uplo == rocblas_fill_upper:
  !>                 The upper triangular portion of the hermitian matrix A is supplied.
  !>                 The matrix is compacted so that AP contains the triangular portion column-by-column
  !>                 so that:
  !>                 AP(0) = A(0,0)
  !>                 AP(1) = A(0,1)
  !>                 AP(2) = A(1,1), etc.
  !>                     Ex: (rocblas_fill_upper; n = 3)
  !>                         (1, 0) (2, 1) (3, 2)
  !>                         (2,-1) (4, 0) (5,-1)    -----> [(1,0), (2,1), (4,0), (3,2), (5,-1), (6,0)]
  !>                         (3,-2) (5, 1) (6, 0)
  !>             if uplo == rocblas_fill_lower:
  !>                 The lower triangular portion of the hermitian matrix A is supplied.
  !>                 The matrix is compacted so that AP contains the triangular portion column-by-column
  !>                 so that:
  !>                 AP(0) = A(0,0)
  !>                 AP(1) = A(1,0)
  !>                 AP(2) = A(2,1), etc.
  !>                     Ex: (rocblas_fill_lower; n = 3)
  !>                         (1, 0) (2, 1) (3, 2)
  !>                         (2,-1) (4, 0) (5,-1)    -----> [(1,0), (2,-1), (3,-2), (4,0), (5,1), (6,0)]
  !>                         (3,-2) (5, 1) (6, 0)
  !>             Note that the imaginary part of the diagonal elements are not accessed and are assumed
  !>             to be 0.
  !>     @param[in]
  !>     x         device pointer storing vector x.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of x.
  !>     @param[in]
  !>     beta      device pointer or host pointer to scalar beta.
  !>     @param[inout]
  !>     y         device pointer storing vector y.
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of y.
  !> 
  !>     
    function rocblas_zhpmv(handle,uplo,n,alpha,AP,x,incx,beta,y,incy) bind(c, name="rocblas_zhpmv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zhpmv
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: AP
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      complex(c_double_complex) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
    function rocblas_chpmv_batched(handle,uplo,n,alpha,AP,x,incx,beta,y,incy,batch_count) bind(c, name="rocblas_chpmv_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_chpmv_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr) :: AP
      type(c_ptr) :: x
      integer(c_int),value :: incx
      complex(c_float_complex) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xHPMV_BATCHED performs the matrix-vector operation
  !> 
  !>         y_i := alphaA_ix_i + betay_i
  !> 
  !>     where alpha and beta are scalars, x_i and y_i are n element vectors and A_i is an
  !>     n by n hermitian matrix, supplied in packed form (see description below),
  !>     for each batch in i = [1, batch_count].
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               rocblas_fill_upper: the upper triangular part of each hermitian matrix A_i is supplied in AP.
  !>               rocblas_fill_lower: the lower triangular part of each hermitian matrix A_i is supplied in AP.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the order of each matrix A_i.
  !>     @param[in]
  !>     alpha     device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>     AP      device pointer of device pointers storing the packed version of the specified triangular
  !>             portion of each hermitian matrix A_i. Each A_i is of at least size ((n  (n + 1))  2).
  !>             if uplo == rocblas_fill_upper:
  !>             The upper triangular portion of each hermitian matrix A_i is supplied.
  !>             The matrix is compacted so that each AP_i contains the triangular portion column-by-column
  !>             so that:
  !>             AP(0) = A(0,0)
  !>             AP(1) = A(0,1)
  !>             AP(2) = A(1,1), etc.
  !>                 Ex: (rocblas_fill_upper; n = 3)
  !>                     (1, 0) (2, 1) (3, 2)
  !>                     (2,-1) (4, 0) (5,-1)    -----> [(1,0), (2,1), (4,0), (3,2), (5,-1), (6,0)]
  !>                     (3,-2) (5, 1) (6, 0)
  !>         if uplo == rocblas_fill_lower:
  !>             The lower triangular portion of each hermitian matrix A_i is supplied.
  !>             The matrix is compacted so that each AP_i contains the triangular portion column-by-column
  !>             so that:
  !>             AP(0) = A(0,0)
  !>             AP(1) = A(1,0)
  !>             AP(2) = A(2,1), etc.
  !>                 Ex: (rocblas_fill_lower; n = 3)
  !>                     (1, 0) (2, 1) (3, 2)
  !>                     (2,-1) (4, 0) (5,-1)    -----> [(1,0), (2,-1), (3,-2), (4,0), (5,1), (6,0)]
  !>                     (3,-2) (5, 1) (6, 0)
  !>         Note that the imaginary part of the diagonal elements are not accessed and are assumed
  !>         to be 0.
  !>     @param[in]
  !>     x         device array of device pointers storing each vector x_i.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i.
  !>     @param[in]
  !>     beta      device pointer or host pointer to scalar beta.
  !>     @param[inout]
  !>     y         device array of device pointers storing each vector y_i.
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of y.
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch.
  !> 
  !>     
    function rocblas_zhpmv_batched(handle,uplo,n,alpha,AP,x,incx,beta,y,incy,batch_count) bind(c, name="rocblas_zhpmv_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zhpmv_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr) :: AP
      type(c_ptr) :: x
      integer(c_int),value :: incx
      complex(c_double_complex) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_chpmv_strided_batched(handle,uplo,n,alpha,AP,stride_A,x,incx,stride_x,beta,y,incy,stride_y,batch_count) bind(c, name="rocblas_chpmv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_chpmv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: AP
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      complex(c_float_complex) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stride_y
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xHPMV_STRIDED_BATCHED performs the matrix-vector operation
  !> 
  !>         y_i := alphaA_ix_i + betay_i
  !> 
  !>     where alpha and beta are scalars, x_i and y_i are n element vectors and A_i is an
  !>     n by n hermitian matrix, supplied in packed form (see description below),
  !>     for each batch in i = [1, batch_count].
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               rocblas_fill_upper: the upper triangular part of each hermitian matrix A_i is supplied in AP.
  !>               rocblas_fill_lower: the lower triangular part of each hermitian matrix A_i is supplied in AP.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the order of each matrix A_i.
  !>     @param[in]
  !>     alpha     device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>     AP        device pointer pointing to the beginning of the first matrix (AP_1). Stores the packed
  !>               version of the specified triangular portion of each hermitian matrix AP_i of size ((n  (n + 1))  2).
  !>               if uplo == rocblas_fill_upper:
  !>                 The upper triangular portion of each hermitian matrix A_i is supplied.
  !>                 The matrix is compacted so that each AP_i contains the triangular portion column-by-column
  !>                 so that:
  !>                 AP(0) = A(0,0)
  !>                 AP(1) = A(0,1)
  !>                 AP(2) = A(1,1), etc.
  !>                     Ex: (rocblas_fill_upper; n = 3)
  !>                         (1, 0) (2, 1) (3, 2)
  !>                         (2,-1) (4, 0) (5,-1)    -----> [(1,0), (2,1), (4,0), (3,2), (5,-1), (6,0)]
  !>                         (3,-2) (5, 1) (6, 0)
  !>             if uplo == rocblas_fill_lower:
  !>                 The lower triangular portion of each hermitian matrix A_i is supplied.
  !>                 The matrix is compacted so that each AP_i contains the triangular portion column-by-column
  !>                 so that:
  !>                 AP(0) = A(0,0)
  !>                 AP(1) = A(1,0)
  !>                 AP(2) = A(2,1), etc.
  !>                     Ex: (rocblas_fill_lower; n = 3)
  !>                         (1, 0) (2, 1) (3, 2)
  !>                         (2,-1) (4, 0) (5,-1)    -----> [(1,0), (2,-1), (3,-2), (4,0), (5,1), (6,0)]
  !>                         (3,-2) (5, 1) (6, 0)
  !>         Note that the imaginary part of the diagonal elements are not accessed and are assumed
  !>         to be 0.
  !>     @param[in]
  !>     stride_A  [rocblas_stride]
  !>               stride from the start of one matrix (AP_i) and the next one (AP_i+1).
  !>     @param[in]
  !>     x         device array pointing to the beginning of the first vector (x_1).
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i.
  !>     @param[in]
  !>     stride_x  [rocblas_stride]
  !>               stride from the start of one vector (x_i) and the next one (x_i+1).
  !>     @param[in]
  !>     beta      device pointer or host pointer to scalar beta.
  !>     @param[inout]
  !>     y         device array pointing to the beginning of the first vector (y_1).
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of y.
  !>     @param[in]
  !>     stride_y  [rocblas_stride]
  !>               stride from the start of one vector (y_i) and the next one (y_i+1).
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch.
  !> 
  !>     
    function rocblas_zhpmv_strided_batched(handle,uplo,n,alpha,AP,stride_A,x,incx,stride_x,beta,y,incy,stride_y,batch_count) bind(c, name="rocblas_zhpmv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zhpmv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: AP
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      complex(c_double_complex) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stride_y
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_chpr(handle,uplo,n,alpha,x,incx,AP) bind(c, name="rocblas_chpr")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_chpr
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: AP
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xHPR performs the matrix-vector operations
  !> 
  !>         A := A + alphaxxH
  !> 
  !>     where alpha is a real scalar, x is a vector, and A is an
  !>     n by n hermitian matrix, supplied in packed form.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               specifies whether the upper 'rocblas_fill_upper' or lower 'rocblas_fill_lower'
  !>               rocblas_fill_upper: The upper triangular part of A is supplied in AP.
  !>               rocblas_fill_lower: The lower triangular part of A is supplied in AP.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of rows and columns of matrix A, must be at least 0.
  !>     @param[in]
  !>     alpha
  !>               device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>     x         device pointer storing vector x.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of x.
  !>     @param[inout]
  !>     AP        device pointer storing the packed version of the specified triangular portion of
  !>               the hermitian matrix A. Of at least size ((n  (n + 1))  2).
  !>               if uplo == rocblas_fill_upper:
  !>                 The upper triangular portion of the hermitian matrix A is supplied.
  !>                 The matrix is compacted so that AP contains the triangular portion column-by-column
  !>                 so that:
  !>                 AP(0) = A(0,0)
  !>                 AP(1) = A(0,1)
  !>                 AP(2) = A(1,1), etc.
  !>                     Ex: (rocblas_fill_upper; n = 3)
  !>                         (1, 0) (2, 1) (4,9)
  !>                         (2,-1) (3, 0) (5,3)  -----> [(1,0), (2,1), (3,0), (4,9), (5,3), (6,0)]
  !>                         (4,-9) (5,-3) (6,0)
  !>             if uplo == rocblas_fill_lower:
  !>                 The lower triangular portion of the hermitian matrix A is supplied.
  !>                 The matrix is compacted so that AP contains the triangular portion column-by-column
  !>                 so that:
  !>                 AP(0) = A(0,0)
  !>                 AP(1) = A(1,0)
  !>                 AP(2) = A(2,1), etc.
  !>                     Ex: (rocblas_fill_lower; n = 3)
  !>                         (1, 0) (2, 1) (4,9)
  !>                         (2,-1) (3, 0) (5,3)  -----> [(1,0), (2,-1), (4,-9), (3,0), (5,-3), (6,0)]
  !>                         (4,-9) (5,-3) (6,0)
  !>             Note that the imaginary part of the diagonal elements are not accessed and are assumed
  !>             to be 0.
  !>     
    function rocblas_zhpr(handle,uplo,n,alpha,x,incx,AP) bind(c, name="rocblas_zhpr")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zhpr
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: AP
    end function

  
    function rocblas_chpr_batched(handle,uplo,n,alpha,x,incx,AP,batch_count) bind(c, name="rocblas_chpr_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_chpr_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: AP
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xHPR_BATCHED performs the matrix-vector operations
  !> 
  !>         A_i := A_i + alphax_ix_iH
  !> 
  !>     where alpha is a real scalar, x_i is a vector, and A_i is an
  !>     n by n symmetric matrix, supplied in packed form, for i = 1, ..., batch_count.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               specifies whether the upper 'rocblas_fill_upper' or lower 'rocblas_fill_lower'
  !>               rocblas_fill_upper: The upper triangular part of each A_i is supplied in AP.
  !>               rocblas_fill_lower: The lower triangular part of each A_i is supplied in AP.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of rows and columns of each matrix A_i, must be at least 0.
  !>     @param[in]
  !>     alpha
  !>               device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>     x         device array of device pointers storing each vector x_i.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i.
  !>     @param[inout]
  !>     AP        device array of device pointers storing the packed version of the specified triangular portion of
  !>               each hermitian matrix A_i of at least size ((n  (n + 1))  2). Array is of at least size batch_count.
  !>               if uplo == rocblas_fill_upper:
  !>                 The upper triangular portion of each hermitian matrix A_i is supplied.
  !>                 The matrix is compacted so that AP contains the triangular portion column-by-column
  !>                 so that:
  !>                 AP(0) = A(0,0)
  !>                 AP(1) = A(0,1)
  !>                 AP(2) = A(1,1), etc.
  !>                     Ex: (rocblas_fill_upper; n = 3)
  !>                         (1, 0) (2, 1) (4,9)
  !>                         (2,-1) (3, 0) (5,3)  -----> [(1,0), (2,1), (3,0), (4,9), (5,3), (6,0)]
  !>                         (4,-9) (5,-3) (6,0)
  !>             if uplo == rocblas_fill_lower:
  !>                 The lower triangular portion of each hermitian matrix A_i is supplied.
  !>                 The matrix is compacted so that AP contains the triangular portion column-by-column
  !>                 so that:
  !>                 AP(0) = A(0,0)
  !>                 AP(1) = A(1,0)
  !>                 AP(2) = A(2,1), etc.
  !>                     Ex: (rocblas_fill_lower; n = 3)
  !>                         (1, 0) (2, 1) (4,9)
  !>                         (2,-1) (3, 0) (5,3)  -----> [(1,0), (2,-1), (4,-9), (3,0), (5,-3), (6,0)]
  !>                         (4,-9) (5,-3) (6,0)
  !>             Note that the imaginary part of the diagonal elements are not accessed and are assumed
  !>             to be 0.
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch.
  !>     
    function rocblas_zhpr_batched(handle,uplo,n,alpha,x,incx,AP,batch_count) bind(c, name="rocblas_zhpr_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zhpr_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: AP
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_chpr_strided_batched(handle,uplo,n,alpha,x,incx,stride_x,AP,stride_A,batch_count) bind(c, name="rocblas_chpr_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_chpr_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      type(c_ptr),value :: AP
      integer(c_int64_t),value :: stride_A
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xHPR_STRIDED_BATCHED performs the matrix-vector operations
  !> 
  !>         A_i := A_i + alphax_ix_iH
  !> 
  !>     where alpha is a real scalar, x_i is a vector, and A_i is an
  !>     n by n symmetric matrix, supplied in packed form, for i = 1, ..., batch_count.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               specifies whether the upper 'rocblas_fill_upper' or lower 'rocblas_fill_lower'
  !>               rocblas_fill_upper: The upper triangular part of each A_i is supplied in AP.
  !>               rocblas_fill_lower: The lower triangular part of each A_i is supplied in AP.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of rows and columns of each matrix A_i, must be at least 0.
  !>     @param[in]
  !>     alpha
  !>               device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>     x         device pointer pointing to the first vector (x_1).
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i.
  !>     @param[in]
  !>     stride_x  [rocblas_stride]
  !>               stride from the start of one vector (x_i) and the next one (x_i+1).
  !>     @param[inout]
  !>     AP        device array of device pointers storing the packed version of the specified triangular portion of
  !>               each hermitian matrix A_i. Points to the first matrix (A_1).
  !>               if uplo == rocblas_fill_upper:
  !>                 The upper triangular portion of each hermitian matrix A_i is supplied.
  !>                 The matrix is compacted so that AP contains the triangular portion column-by-column
  !>                 so that:
  !>                 AP(0) = A(0,0)
  !>                 AP(1) = A(0,1)
  !>                 AP(2) = A(1,1), etc.
  !>                     Ex: (rocblas_fill_upper; n = 3)
  !>                         (1, 0) (2, 1) (4,9)
  !>                         (2,-1) (3, 0) (5,3)  -----> [(1,0), (2,1), (3,0), (4,9), (5,3), (6,0)]
  !>                         (4,-9) (5,-3) (6,0)
  !>             if uplo == rocblas_fill_lower:
  !>                 The lower triangular portion of each hermitian matrix A_i is supplied.
  !>                 The matrix is compacted so that AP contains the triangular portion column-by-column
  !>                 so that:
  !>                 AP(0) = A(0,0)
  !>                 AP(1) = A(1,0)
  !>                 AP(2) = A(2,1), etc.
  !>                     Ex: (rocblas_fill_lower; n = 3)
  !>                         (1, 0) (2, 1) (4,9)
  !>                         (2,-1) (3, 0) (5,3)  -----> [(1,0), (2,-1), (4,-9), (3,0), (5,-3), (6,0)]
  !>                         (4,-9) (5,-3) (6,0)
  !>             Note that the imaginary part of the diagonal elements are not accessed and are assumed
  !>             to be 0.
  !>     @param[in]
  !>     stride_A    [rocblas_stride]
  !>                 stride from the start of one (A_i) and the next (A_i+1)
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch.
  !>     
    function rocblas_zhpr_strided_batched(handle,uplo,n,alpha,x,incx,stride_x,AP,stride_A,batch_count) bind(c, name="rocblas_zhpr_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zhpr_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      type(c_ptr),value :: AP
      integer(c_int64_t),value :: stride_A
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_chpr2(handle,uplo,n,alpha,x,incx,y,incy,AP) bind(c, name="rocblas_chpr2")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_chpr2
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: AP
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xHPR2 performs the matrix-vector operations
  !> 
  !>         A := A + alphaxyH + conj(alpha)yxH
  !> 
  !>     where alpha is a complex scalar, x and y are vectors, and A is an
  !>     n by n hermitian matrix, supplied in packed form.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               specifies whether the upper 'rocblas_fill_upper' or lower 'rocblas_fill_lower'
  !>               rocblas_fill_upper: The upper triangular part of A is supplied in AP.
  !>               rocblas_fill_lower: The lower triangular part of A is supplied in AP.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of rows and columns of matrix A, must be at least 0.
  !>     @param[in]
  !>     alpha
  !>               device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>     x         device pointer storing vector x.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of x.
  !>     @param[in]
  !>     y         device pointer storing vector y.
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of y.
  !>     @param[inout]
  !>     AP        device pointer storing the packed version of the specified triangular portion of
  !>               the hermitian matrix A. Of at least size ((n  (n + 1))  2).
  !>               if uplo == rocblas_fill_upper:
  !>                 The upper triangular portion of the hermitian matrix A is supplied.
  !>                 The matrix is compacted so that AP contains the triangular portion column-by-column
  !>                 so that:
  !>                 AP(0) = A(0,0)
  !>                 AP(1) = A(0,1)
  !>                 AP(2) = A(1,1), etc.
  !>                     Ex: (rocblas_fill_upper; n = 3)
  !>                         (1, 0) (2, 1) (4,9)
  !>                         (2,-1) (3, 0) (5,3)  -----> [(1,0), (2,1), (3,0), (4,9), (5,3), (6,0)]
  !>                         (4,-9) (5,-3) (6,0)
  !>             if uplo == rocblas_fill_lower:
  !>                 The lower triangular portion of the hermitian matrix A is supplied.
  !>                 The matrix is compacted so that AP contains the triangular portion column-by-column
  !>                 so that:
  !>                 AP(0) = A(0,0)
  !>                 AP(1) = A(1,0)
  !>                 AP(2) = A(2,1), etc.
  !>                     Ex: (rocblas_fill_lower; n = 3)
  !>                         (1, 0) (2, 1) (4,9)
  !>                         (2,-1) (3, 0) (5,3)  -----> [(1,0), (2,-1), (4,-9), (3,0), (5,-3), (6,0)]
  !>                         (4,-9) (5,-3) (6,0)
  !>             Note that the imaginary part of the diagonal elements are not accessed and are assumed
  !>             to be 0.
  !>     
    function rocblas_zhpr2(handle,uplo,n,alpha,x,incx,y,incy,AP) bind(c, name="rocblas_zhpr2")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zhpr2
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: AP
    end function

  
    function rocblas_chpr2_batched(handle,uplo,n,alpha,x,incx,y,incy,AP,batch_count) bind(c, name="rocblas_chpr2_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_chpr2_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr) :: AP
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xHPR2_BATCHED performs the matrix-vector operations
  !> 
  !>         A_i := A_i + alphax_iy_iH + conj(alpha)y_ix_iH
  !> 
  !>     where alpha is a complex scalar, x_i and y_i are vectors, and A_i is an
  !>     n by n symmetric matrix, supplied in packed form, for i = 1, ..., batch_count.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               specifies whether the upper 'rocblas_fill_upper' or lower 'rocblas_fill_lower'
  !>               rocblas_fill_upper: The upper triangular part of each A_i is supplied in AP.
  !>               rocblas_fill_lower: The lower triangular part of each A_i is supplied in AP.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of rows and columns of each matrix A_i, must be at least 0.
  !>     @param[in]
  !>     alpha
  !>               device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>     x         device array of device pointers storing each vector x_i.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i.
  !>     @param[in]
  !>     y         device array of device pointers storing each vector y_i.
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of each y_i.
  !>     @param[inout]
  !>     AP        device array of device pointers storing the packed version of the specified triangular portion of
  !>               each hermitian matrix A_i of at least size ((n  (n + 1))  2). Array is of at least size batch_count.
  !>               if uplo == rocblas_fill_upper:
  !>                 The upper triangular portion of each hermitian matrix A_i is supplied.
  !>                 The matrix is compacted so that AP contains the triangular portion column-by-column
  !>                 so that:
  !>                 AP(0) = A(0,0)
  !>                 AP(1) = A(0,1)
  !>                 AP(2) = A(1,1), etc.
  !>                     Ex: (rocblas_fill_upper; n = 3)
  !>                         (1, 0) (2, 1) (4,9)
  !>                         (2,-1) (3, 0) (5,3)  -----> [(1,0), (2,1), (3,0), (4,9), (5,3), (6,0)]
  !>                         (4,-9) (5,-3) (6,0)
  !>             if uplo == rocblas_fill_lower:
  !>                 The lower triangular portion of each hermitian matrix A_i is supplied.
  !>                 The matrix is compacted so that AP contains the triangular portion column-by-column
  !>                 so that:
  !>                 AP(0) = A(0,0)
  !>                 AP(1) = A(1,0)
  !>                 AP(2) = A(2,1), etc.
  !>                     Ex: (rocblas_fill_lower; n = 3)
  !>                         (1, 0) (2, 1) (4,9)
  !>                         (2,-1) (3, 0) (5,3)  -----> [(1,0), (2,-1), (4,-9), (3,0), (5,-3), (6,0)]
  !>                         (4,-9) (5,-3) (6,0)
  !>             Note that the imaginary part of the diagonal elements are not accessed and are assumed
  !>             to be 0.
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch.
  !>     
    function rocblas_zhpr2_batched(handle,uplo,n,alpha,x,incx,y,incy,AP,batch_count) bind(c, name="rocblas_zhpr2_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zhpr2_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr) :: AP
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_chpr2_strided_batched(handle,uplo,n,alpha,x,incx,stride_x,y,incy,stride_y,AP,stride_A,batch_count) bind(c, name="rocblas_chpr2_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_chpr2_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stride_y
      type(c_ptr),value :: AP
      integer(c_int64_t),value :: stride_A
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xHPR2_STRIDED_BATCHED performs the matrix-vector operations
  !> 
  !>         A_i := A_i + alphax_iy_iH + conj(alpha)y_ix_iH
  !> 
  !>     where alpha is a complex scalar, x_i and y_i are vectors, and A_i is an
  !>     n by n symmetric matrix, supplied in packed form, for i = 1, ..., batch_count.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               specifies whether the upper 'rocblas_fill_upper' or lower 'rocblas_fill_lower'
  !>               rocblas_fill_upper: The upper triangular part of each A_i is supplied in AP.
  !>               rocblas_fill_lower: The lower triangular part of each A_i is supplied in AP.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of rows and columns of each matrix A_i, must be at least 0.
  !>     @param[in]
  !>     alpha
  !>               device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>     x         device pointer pointing to the first vector (x_1).
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i.
  !>     @param[in]
  !>     stride_x  [rocblas_stride]
  !>               stride from the start of one vector (x_i) and the next one (x_i+1).
  !>     @param[in]
  !>     y         device pointer pointing to the first vector (y_1).
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of each y_i.
  !>     @param[in]
  !>     stride_y  [rocblas_stride]
  !>               stride from the start of one vector (y_i) and the next one (y_i+1).
  !>     @param[inout]
  !>     AP        device array of device pointers storing the packed version of the specified triangular portion of
  !>               each hermitian matrix A_i. Points to the first matrix (A_1).
  !>               if uplo == rocblas_fill_upper:
  !>                 The upper triangular portion of each hermitian matrix A_i is supplied.
  !>                 The matrix is compacted so that AP contains the triangular portion column-by-column
  !>                 so that:
  !>                 AP(0) = A(0,0)
  !>                 AP(1) = A(0,1)
  !>                 AP(2) = A(1,1), etc.
  !>                     Ex: (rocblas_fill_upper; n = 3)
  !>                         (1, 0) (2, 1) (4,9)
  !>                         (2,-1) (3, 0) (5,3)  -----> [(1,0), (2,1), (3,0), (4,9), (5,3), (6,0)]
  !>                         (4,-9) (5,-3) (6,0)
  !>             if uplo == rocblas_fill_lower:
  !>                 The lower triangular portion of each hermitian matrix A_i is supplied.
  !>                 The matrix is compacted so that AP contains the triangular portion column-by-column
  !>                 so that:
  !>                 AP(0) = A(0,0)
  !>                 AP(1) = A(1,0)
  !>                 AP(2) = A(2,1), etc.
  !>                     Ex: (rocblas_fill_lower; n = 3)
  !>                         (1, 0) (2, 1) (4,9)
  !>                         (2,-1) (3, 0) (5,3)  -----> [(1,0), (2,-1), (4,-9), (3,0), (5,-3), (6,0)]
  !>                         (4,-9) (5,-3) (6,0)
  !>             Note that the imaginary part of the diagonal elements are not accessed and are assumed
  !>             to be 0.
  !>     @param[in]
  !>     stride_A    [rocblas_stride]
  !>                 stride from the start of one (A_i) and the next (A_i+1)
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch.
  !>     
    function rocblas_zhpr2_strided_batched(handle,uplo,n,alpha,x,incx,stride_x,y,incy,stride_y,AP,stride_A,batch_count) bind(c, name="rocblas_zhpr2_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zhpr2_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stride_y
      type(c_ptr),value :: AP
      integer(c_int64_t),value :: stride_A
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_strmv(handle,uplo,transA,diag,m,A,lda,x,incx) bind(c, name="rocblas_strmv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_strmv
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
    function rocblas_dtrmv(handle,uplo,transA,diag,m,A,lda,x,incx) bind(c, name="rocblas_dtrmv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dtrmv
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
    function rocblas_ctrmv(handle,uplo,transA,diag,m,A,lda,x,incx) bind(c, name="rocblas_ctrmv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ctrmv
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     trmv performs one of the matrix-vector operations
  !> 
  !>          x = Ax or x = ATx,
  !> 
  !>     where x is an n element vector and A is an n by n unit, or non-unit, upper or lower triangular matrix.
  !> 
  !>     The vector x is overwritten.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  A is an upper triangular matrix.
  !>             rocblas_fill_lower:  A is a  lower triangular matrix.
  !> 
  !>     @param[in]
  !>     transA     [rocblas_operation]
  !> 
  !>     @param[in]
  !>     diag    [rocblas_diagonal]
  !>             rocblas_diagonal_unit:     A is assumed to be unit triangular.
  !>             rocblas_diagonal_non_unit:  A is not assumed to be unit triangular.
  !> 
  !>     @param[in]
  !>     m         [rocblas_int]
  !>               m specifies the number of rows of A. m >= 0.
  !> 
  !>     @param[in]
  !>     A         device pointer storing matrix A,
  !>               of dimension ( lda, m )
  !> 
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of A.
  !>               lda = max( 1, m ).
  !> 
  !>     @param[in]
  !>     x         device pointer storing vector x.
  !> 
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of x.
  !> 
  !>     
    function rocblas_ztrmv(handle,uplo,transA,diag,m,A,lda,x,incx) bind(c, name="rocblas_ztrmv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ztrmv
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
    function rocblas_strmv_strided_batched(handle,uplo,transA,diag,m,A,lda,stridea,x,incx,stridex,batch_count) bind(c, name="rocblas_strmv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_strmv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stridea
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dtrmv_strided_batched(handle,uplo,transA,diag,m,A,lda,stridea,x,incx,stridex,batch_count) bind(c, name="rocblas_dtrmv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dtrmv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stridea
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_ctrmv_strided_batched(handle,uplo,transA,diag,m,A,lda,stridea,x,incx,stridex,batch_count) bind(c, name="rocblas_ctrmv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ctrmv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stridea
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     trmv_strided_batched performs one of the matrix-vector operations
  !> 
  !>          x_i = A_ix_i or x_i = ATx_i, 0 \le i < batch_count
  !> 
  !>     where x_i is an n element vector and A_i is an n by n (unit, or non-unit, upper or lower triangular matrix)
  !>     with strides specifying how to retrieve $x_i$ (resp. $A_i$) from $x_{i-1}$ (resp. $A_i$).
  !> 
  !>     The vectors x_i are overwritten.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  A_i is an upper triangular matrix.
  !>             rocblas_fill_lower:  A_i is a  lower triangular matrix.
  !> 
  !>     @param[in]
  !>     transA     [rocblas_operation]
  !> 
  !>     @param[in]
  !>     diag    [rocblas_diagonal]
  !>             rocblas_diagonal_unit:     A_i is assumed to be unit triangular.
  !>             rocblas_diagonal_non_unit:  A_i is not assumed to be unit triangular.
  !> 
  !>     @param[in]
  !>     m         [rocblas_int]
  !>               m specifies the number of rows of matrices A_i. m >= 0.
  !> 
  !>     @param[in]
  !>     A         device pointer of the matrix A_0,
  !>               of dimension ( lda, m )
  !> 
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of A_i.
  !>               lda >= max( 1, m ).
  !> 
  !>     @param[in]
  !>     stride_a  [rocblas_stride]
  !>               stride from the start of one A_i matrix to the next A_{i + 1}
  !> 
  !>     @param[in]
  !>     x         device pointer storing the vector x_0.
  !> 
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of one vector x.
  !> 
  !>     @param[in]
  !>     stride_x  [rocblas_stride]
  !>               stride from the start of one x_i vector to the next x_{i + 1}
  !> 
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>               The number of batched matricesvectors.
  !> 
  !> 
  !>     
    function rocblas_ztrmv_strided_batched(handle,uplo,transA,diag,m,A,lda,stridea,x,incx,stridex,batch_count) bind(c, name="rocblas_ztrmv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ztrmv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stridea
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_stpmv(handle,uplo,transA,diag,m,A,x,incx) bind(c, name="rocblas_stpmv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_stpmv
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
    function rocblas_dtpmv(handle,uplo,transA,diag,m,A,x,incx) bind(c, name="rocblas_dtpmv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dtpmv
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
    function rocblas_ctpmv(handle,uplo,transA,diag,m,A,x,incx) bind(c, name="rocblas_ctpmv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ctpmv
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     tpmv performs one of the matrix-vector operations
  !> 
  !>          x = Ax or x = ATx,
  !> 
  !>     where x is an n element vector and A is an n by n unit, or non-unit, upper or lower triangular matrix, supplied in the pack form.
  !> 
  !>     The vector x is overwritten.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  A is an upper triangular matrix.
  !>             rocblas_fill_lower:  A is a  lower triangular matrix.
  !> 
  !>     @param[in]
  !>     transA     [rocblas_operation]
  !> 
  !>     @param[in]
  !>     diag    [rocblas_diagonal]
  !>             rocblas_diagonal_unit:     A is assumed to be unit triangular.
  !>             rocblas_diagonal_non_unit:  A is not assumed to be unit triangular.
  !> 
  !>     @param[in]
  !>     m       [rocblas_int]
  !>             m specifies the number of rows of A. m >= 0.
  !> 
  !>     @param[in]
  !>     A       device pointer storing matrix A,
  !>             of dimension at leat ( m  ( m + 1 )  2 ).
  !>           Before entry with uplo = rocblas_fill_upper, the array A
  !>           must contain the upper triangular matrix packed sequentially,
  !>           column by column, so that A[0] contains a_{0,0}, A[1] and A[2] contain
  !>           a_{0,1} and a_{1, 1} respectively, and so on.
  !>           Before entry with uplo = rocblas_fill_lower, the array A
  !>           must contain the lower triangular matrix packed sequentially,
  !>           column by column, so that A[0] contains a_{0,0}, A[1] and A[2] contain
  !>           a_{1,0} and a_{2,0} respectively, and so on.
  !>           Note that when DIAG = rocblas_diagonal_unit, the diagonal elements of A are
  !>           not referenced, but are assumed to be unity.
  !> 
  !>     @param[in]
  !>     x       device pointer storing vector x.
  !> 
  !>     @param[in]
  !>     incx    [rocblas_int]
  !>             specifies the increment for the elements of x. incx must not be zero.
  !> 
  !>     
    function rocblas_ztpmv(handle,uplo,transA,diag,m,A,x,incx) bind(c, name="rocblas_ztpmv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ztpmv
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
    function rocblas_stpmv_strided_batched(handle,uplo,transA,diag,m,A,stridea,x,incx,stridex,batch_count) bind(c, name="rocblas_stpmv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_stpmv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      integer(c_int64_t),value :: stridea
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dtpmv_strided_batched(handle,uplo,transA,diag,m,A,stridea,x,incx,stridex,batch_count) bind(c, name="rocblas_dtpmv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dtpmv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      integer(c_int64_t),value :: stridea
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_ctpmv_strided_batched(handle,uplo,transA,diag,m,A,stridea,x,incx,stridex,batch_count) bind(c, name="rocblas_ctpmv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ctpmv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      integer(c_int64_t),value :: stridea
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     tpmv_strided_batched performs one of the matrix-vector operations
  !> 
  !>          x_i = A_ix_i or x_i = ATx_i, 0 \le i < batch_count
  !> 
  !>     where x_i is an n element vector and A_i is an n by n (unit, or non-unit, upper or lower triangular matrix)
  !>     with strides specifying how to retrieve $x_i$ (resp. $A_i$) from $x_{i-1}$ (resp. $A_i$).
  !> 
  !>     The vectors x_i are overwritten.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  A_i is an upper triangular matrix.
  !>             rocblas_fill_lower:  A_i is a  lower triangular matrix.
  !> 
  !>     @param[in]
  !>     transA     [rocblas_operation]
  !> 
  !>     @param[in]
  !>     diag    [rocblas_diagonal]
  !>             rocblas_diagonal_unit:     A_i is assumed to be unit triangular.
  !>             rocblas_diagonal_non_unit:  A_i is not assumed to be unit triangular.
  !> 
  !>     @param[in]
  !>     m         [rocblas_int]
  !>               m specifies the number of rows of matrices A_i. m >= 0.
  !> 
  !>     @param[in]
  !>     A         device pointer of the matrix A_0,
  !>               of dimension ( lda, m )
  !> 
  !>     @param[in]
  !>     stride_a  [rocblas_stride]
  !>               stride from the start of one A_i matrix to the next A_{i + 1}
  !> 
  !>     @param[in]
  !>     x         device pointer storing the vector x_0.
  !> 
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of one vector x.
  !> 
  !>     @param[in]
  !>     stride_x  [rocblas_stride]
  !>               stride from the start of one x_i vector to the next x_{i + 1}
  !> 
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>               The number of batched matricesvectors.
  !> 
  !> 
  !>     
    function rocblas_ztpmv_strided_batched(handle,uplo,transA,diag,m,A,stridea,x,incx,stridex,batch_count) bind(c, name="rocblas_ztpmv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ztpmv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      integer(c_int64_t),value :: stridea
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_stbmv(handle,uplo,trans,diag,m,k,A,lda,x,incx) bind(c, name="rocblas_stbmv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_stbmv
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
    function rocblas_dtbmv(handle,uplo,trans,diag,m,k,A,lda,x,incx) bind(c, name="rocblas_dtbmv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dtbmv
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
    function rocblas_ctbmv(handle,uplo,trans,diag,m,k,A,lda,x,incx) bind(c, name="rocblas_ctbmv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ctbmv
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xTBMV performs one of the matrix-vector operations
  !> 
  !>         x := Ax      or
  !>         x := ATx   or
  !>         x := AHx,
  !> 
  !>     x is a vectors and A is a banded m by m matrix (see description below).
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               rocblas_fill_upper: A is an upper banded triangular matrix.
  !>               rocblas_fill_lower: A is a  lower banded triangular matrix.
  !>     @param[in]
  !>     trans     [rocblas_operation]
  !>               indicates whether matrix A is tranposed (conjugated) or not.
  !>     @param[in]
  !>     diag      [rocblas_diagonal]
  !>               rocblas_diagonal_unit: The main diagonal of A is assumed to consist of only
  !>                                      1's and is not referenced.
  !>               rocblas_diagonal_non_unit: No assumptions are made of A's main diagonal.
  !>     @param[in]
  !>     m         [rocblas_int]
  !>               the number of rows and columns of the matrix represented by A.
  !>     @param[in]
  !>     k         [rocblas_int]
  !>               if uplo == rocblas_fill_upper, k specifies the number of super-diagonals
  !>               of the matrix A.
  !>               if uplo == rocblas_fill_lower, k specifies the number of sub-diagonals
  !>               of the matrix A.
  !>               k must satisfy k > 0 && k < lda.
  !>     @param[in]
  !>     A         device pointer storing banded triangular matrix A.
  !>               if uplo == rocblas_fill_upper:
  !>                 The matrix represented is an upper banded triangular matrix
  !>                 with the main diagonal and k super-diagonals, everything
  !>                 else can be assumed to be 0.
  !>                 The matrix is compacted so that the main diagonal resides on the k'th
  !>                 row, the first super diagonal resides on the RHS of the k-1'th row, etc,
  !>                 with the k'th diagonal on the RHS of the 0'th row.
  !>                    Ex: (rocblas_fill_upper; m = 5; k = 2)
  !>                       1 6 9 0 0              0 0 9 8 7
  !>                       0 2 7 8 0              0 6 7 8 9
  !>                       0 0 3 8 7     ---->    1 2 3 4 5
  !>                       0 0 0 4 9              0 0 0 0 0
  !>                       0 0 0 0 5              0 0 0 0 0
  !>               if uplo == rocblas_fill_lower:
  !>                 The matrix represnted is a lower banded triangular matrix
  !>                 with the main diagonal and k sub-diagonals, everything else can be
  !>                 assumed to be 0.
  !>                 The matrix is compacted so that the main diagonal resides on the 0'th row,
  !>                 working up to the k'th diagonal residing on the LHS of the k'th row.
  !>                    Ex: (rocblas_fill_lower; m = 5; k = 2)
  !>                       1 0 0 0 0              1 2 3 4 5
  !>                       6 2 0 0 0              6 7 8 9 0
  !>                       9 7 3 0 0     ---->    9 8 7 0 0
  !>                       0 8 8 4 0              0 0 0 0 0
  !>                       0 0 7 9 5              0 0 0 0 0
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of A. lda must satisfy lda > k.
  !>     @param[inout]
  !>     x         device pointer storing vector x.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of x.
  !> 
  !>     
    function rocblas_ztbmv(handle,uplo,trans,diag,m,k,A,lda,x,incx) bind(c, name="rocblas_ztbmv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ztbmv
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
    function rocblas_stbmv_batched(handle,uplo,trans,diag,m,k,A,lda,x,incx,batch_count) bind(c, name="rocblas_stbmv_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_stbmv_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: k
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dtbmv_batched(handle,uplo,trans,diag,m,k,A,lda,x,incx,batch_count) bind(c, name="rocblas_dtbmv_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dtbmv_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: k
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_ctbmv_batched(handle,uplo,trans,diag,m,k,A,da,x,incx,batch_count) bind(c, name="rocblas_ctbmv_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ctbmv_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: k
      type(c_ptr) :: A
      integer(c_int),value :: da
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xTBMV_BATCHED performs one of the matrix-vector operations
  !> 
  !>         x_i := A_ix_i      or
  !>         x_i := A_iTx_i   or
  !>         x_i := A_iHx_i,
  !> 
  !>     where (A_i, x_i) is the i-th instance of the batch.
  !>     x_i is a vector and A_i is an m by m matrix, for i = 1, ..., batch_count.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               rocblas_fill_upper: each A_i is an upper banded triangular matrix.
  !>               rocblas_fill_lower: each A_i is a  lower banded triangular matrix.
  !>     @param[in]
  !>     trans     [rocblas_operation]
  !>               indicates whether each matrix A_i is tranposed (conjugated) or not.
  !>     @param[in]
  !>     diag      [rocblas_diagonal]
  !>               rocblas_diagonal_unit: The main diagonal of each A_i is assumed to consist of only
  !>                                      1's and is not referenced.
  !>               rocblas_diagonal_non_unit: No assumptions are made of each A_i's main diagonal.
  !>     @param[in]
  !>     m         [rocblas_int]
  !>               the number of rows and columns of the matrix represented by each A_i.
  !>     @param[in]
  !>     k         [rocblas_int]
  !>               if uplo == rocblas_fill_upper, k specifies the number of super-diagonals
  !>               of each matrix A_i.
  !>               if uplo == rocblas_fill_lower, k specifies the number of sub-diagonals
  !>               of each matrix A_i.
  !>               k must satisfy k > 0 && k < lda.
  !>     @param[in]
  !>     A         device array of device pointers storing each banded triangular matrix A_i.
  !>               if uplo == rocblas_fill_upper:
  !>                 The matrix represented is an upper banded triangular matrix
  !>                 with the main diagonal and k super-diagonals, everything
  !>                 else can be assumed to be 0.
  !>                 The matrix is compacted so that the main diagonal resides on the k'th
  !>                 row, the first super diagonal resides on the RHS of the k-1'th row, etc,
  !>                 with the k'th diagonal on the RHS of the 0'th row.
  !>                    Ex: (rocblas_fill_upper; m = 5; k = 2)
  !>                       1 6 9 0 0              0 0 9 8 7
  !>                       0 2 7 8 0              0 6 7 8 9
  !>                       0 0 3 8 7     ---->    1 2 3 4 5
  !>                       0 0 0 4 9              0 0 0 0 0
  !>                       0 0 0 0 5              0 0 0 0 0
  !>               if uplo == rocblas_fill_lower:
  !>                 The matrix represnted is a lower banded triangular matrix
  !>                 with the main diagonal and k sub-diagonals, everything else can be
  !>                 assumed to be 0.
  !>                 The matrix is compacted so that the main diagonal resides on the 0'th row,
  !>                 working up to the k'th diagonal residing on the LHS of the k'th row.
  !>                    Ex: (rocblas_fill_lower; m = 5; k = 2)
  !>                       1 0 0 0 0              1 2 3 4 5
  !>                       6 2 0 0 0              6 7 8 9 0
  !>                       9 7 3 0 0     ---->    9 8 7 0 0
  !>                       0 8 8 4 0              0 0 0 0 0
  !>                       0 0 7 9 5              0 0 0 0 0
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of each A_i. lda must satisfy lda > k.
  !>     @param[inout]
  !>     x         device array of device pointer storing each vector x_i.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i.
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch.
  !> 
  !>     
    function rocblas_ztbmv_batched(handle,uplo,trans,diag,m,k,A,lda,x,incx,batch_count) bind(c, name="rocblas_ztbmv_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ztbmv_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: k
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_stbmv_strided_batched(handle,uplo,trans,diag,m,k,A,lda,stride_A,x,incx,stride_x,batch_count) bind(c, name="rocblas_stbmv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_stbmv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dtbmv_strided_batched(handle,uplo,trans,diag,m,k,A,lda,stride_A,x,incx,stride_x,batch_count) bind(c, name="rocblas_dtbmv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dtbmv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_ctbmv_strided_batched(handle,uplo,trans,diag,m,k,A,lda,stride_A,x,incx,stride_x,batch_count) bind(c, name="rocblas_ctbmv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ctbmv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xTBMV_STRIDED_BATCHED performs one of the matrix-vector operations
  !> 
  !>         x_i := A_ix_i      or
  !>         x_i := A_iTx_i   or
  !>         x_i := A_iHx_i,
  !> 
  !>     where (A_i, x_i) is the i-th instance of the batch.
  !>     x_i is a vector and A_i is an m by m matrix, for i = 1, ..., batch_count.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               rocblas_fill_upper: each A_i is an upper banded triangular matrix.
  !>               rocblas_fill_lower: each A_i is a  lower banded triangular matrix.
  !>     @param[in]
  !>     trans     [rocblas_operation]
  !>               indicates whether each matrix A_i is tranposed (conjugated) or not.
  !>     @param[in]
  !>     diag      [rocblas_diagonal]
  !>               rocblas_diagonal_unit: The main diagonal of each A_i is assumed to consist of only
  !>                                      1's and is not referenced.
  !>               rocblas_diagonal_non_unit: No assumptions are made of each A_i's main diagonal.
  !>     @param[in]
  !>     m         [rocblas_int]
  !>               the number of rows and columns of the matrix represented by each A_i.
  !>     @param[in]
  !>     k         [rocblas_int]
  !>               if uplo == rocblas_fill_upper, k specifies the number of super-diagonals
  !>               of each matrix A_i.
  !>               if uplo == rocblas_fill_lower, k specifies the number of sub-diagonals
  !>               of each matrix A_i.
  !>               k must satisfy k > 0 && k < lda.
  !>     @param[in]
  !>     A         device array to the first matrix A_i of the batch. Stores each banded triangular matrix A_i.
  !>               if uplo == rocblas_fill_upper:
  !>                 The matrix represented is an upper banded triangular matrix
  !>                 with the main diagonal and k super-diagonals, everything
  !>                 else can be assumed to be 0.
  !>                 The matrix is compacted so that the main diagonal resides on the k'th
  !>                 row, the first super diagonal resides on the RHS of the k-1'th row, etc,
  !>                 with the k'th diagonal on the RHS of the 0'th row.
  !>                    Ex: (rocblas_fill_upper; m = 5; k = 2)
  !>                       1 6 9 0 0              0 0 9 8 7
  !>                       0 2 7 8 0              0 6 7 8 9
  !>                       0 0 3 8 7     ---->    1 2 3 4 5
  !>                       0 0 0 4 9              0 0 0 0 0
  !>                       0 0 0 0 5              0 0 0 0 0
  !>               if uplo == rocblas_fill_lower:
  !>                 The matrix represnted is a lower banded triangular matrix
  !>                 with the main diagonal and k sub-diagonals, everything else can be
  !>                 assumed to be 0.
  !>                 The matrix is compacted so that the main diagonal resides on the 0'th row,
  !>                 working up to the k'th diagonal residing on the LHS of the k'th row.
  !>                    Ex: (rocblas_fill_lower; m = 5; k = 2)
  !>                       1 0 0 0 0              1 2 3 4 5
  !>                       6 2 0 0 0              6 7 8 9 0
  !>                       9 7 3 0 0     ---->    9 8 7 0 0
  !>                       0 8 8 4 0              0 0 0 0 0
  !>                       0 0 7 9 5              0 0 0 0 0
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of each A_i. lda must satisfy lda > k.
  !>     @param[in]
  !>     stride_A  [rocblas_stride]
  !>               stride from the start of one A_i matrix to the next A_(i + 1).
  !>     @param[inout]
  !>     x         device array to the first vector x_i of the batch.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i.
  !>     @param[in]
  !>     stride_x  [rocblas_stride]
  !>               stride from the start of one x_i matrix to the next x_(i + 1).
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch.
  !> 
  !>     
    function rocblas_ztbmv_strided_batched(handle,uplo,trans,diag,m,k,A,lda,stride_A,x,incx,stride_x,batch_count) bind(c, name="rocblas_ztbmv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ztbmv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_stbsv(handle,uplo,transA,diag,n,k,A,lda,x,incx) bind(c, name="rocblas_stbsv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_stbsv
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
    function rocblas_dtbsv(handle,uplo,transA,diag,n,k,A,lda,x,incx) bind(c, name="rocblas_dtbsv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dtbsv
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
    function rocblas_ctbsv(handle,uplo,transA,diag,n,k,A,lda,x,incx) bind(c, name="rocblas_ctbsv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ctbsv
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     tbsv solves
  !> 
  !>          Ax = b or ATx = b or AHx = b,
  !> 
  !>     where x and b are vectors and A is a banded triangular matrix.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  A is an upper triangular matrix.
  !>             rocblas_fill_lower:  A is a  lower triangular matrix.
  !> 
  !>     @param[in]
  !>     transA     [rocblas_operation]
  !>                rocblas_operation_none: Solves Ax = b
  !>                rocblas_operation_transpose: Solves ATx = b
  !>                rocblas_operation_conjugate_transpose: Solves AHx = b
  !> 
  !>     @param[in]
  !>     diag    [rocblas_diagonal]
  !>             rocblas_diagonal_unit:     A is assumed to be unit triangular (i.e. the diagonal elements
  !>                                        of A are not used in computations).
  !>             rocblas_diagonal_non_unit: A is not assumed to be unit triangular.
  !> 
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               n specifies the number of rows of b. n >= 0.
  !>     @param[in]
  !>     k         [rocblas_int]
  !>               if(uplo == rocblas_fill_upper)
  !>                 k specifies the number of super-diagonals of A.
  !>               if(uplo == rocblas_fill_lower)
  !>                 k specifies the number of sub-diagonals of A.
  !>               k >= 0.
  !> 
  !>     @param[in]
  !>     A         device pointer storing the matrix A in banded format.
  !> 
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of A.
  !>               lda >= (k + 1).
  !> 
  !>     @param[inout]
  !>     x         device pointer storing input vector b. Overwritten by the output vector x.
  !> 
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of x.
  !> 
  !>     
    function rocblas_ztbsv(handle,uplo,transA,diag,n,k,A,lda,x,incx) bind(c, name="rocblas_ztbsv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ztbsv
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
    function rocblas_stbsv_batched(handle,uplo,transA,diag,n,k,A,lda,x,incx,batch_count) bind(c, name="rocblas_stbsv_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_stbsv_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dtbsv_batched(handle,uplo,transA,diag,n,k,A,lda,x,incx,batch_count) bind(c, name="rocblas_dtbsv_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dtbsv_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_ctbsv_batched(handle,uplo,transA,diag,n,k,A,lda,x,incx,batch_count) bind(c, name="rocblas_ctbsv_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ctbsv_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     tbsv_batched solves
  !> 
  !>          A_ix_i = b_i or A_iTx_i = b_i or A_iHx_i = b_i,
  !> 
  !>     where x_i and b_i are vectors and A_i is a banded triangular matrix,
  !>     for i = [1, batch_count].
  !> 
  !>     The input vectors b_i are overwritten by the output vectors x_i.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  A_i is an upper triangular matrix.
  !>             rocblas_fill_lower:  A_i is a  lower triangular matrix.
  !> 
  !>     @param[in]
  !>     transA     [rocblas_operation]
  !>                rocblas_operation_none: Solves A_ix_i = b_i
  !>                rocblas_operation_transpose: Solves A_iTx_i = b_i
  !>                rocblas_operation_conjugate_transpose: Solves A_iHx_i = b_i
  !> 
  !>     @param[in]
  !>     diag    [rocblas_diagonal]
  !>             rocblas_diagonal_unit:     each A_i is assumed to be unit triangular (i.e. the diagonal elements
  !>                                        of each A_i are not used in computations).
  !>             rocblas_diagonal_non_unit: each A_i is not assumed to be unit triangular.
  !> 
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               n specifies the number of rows of each b_i. n >= 0.
  !>     @param[in]
  !>     k         [rocblas_int]
  !>               if(uplo == rocblas_fill_upper)
  !>                 k specifies the number of super-diagonals of each A_i.
  !>               if(uplo == rocblas_fill_lower)
  !>                 k specifies the number of sub-diagonals of each A_i.
  !>               k >= 0.
  !> 
  !>     @param[in]
  !>     A         device vector of device pointers storing each matrix A_i in banded format.
  !> 
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of each A_i.
  !>               lda >= (k + 1).
  !> 
  !>     @param[inout]
  !>     x         device vector of device pointers storing each input vector b_i. Overwritten by each output
  !>               vector x_i.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i.
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch.
  !> 
  !>     
    function rocblas_ztbsv_batched(handle,uplo,transA,diag,n,k,A,lda,x,incx,batch_count) bind(c, name="rocblas_ztbsv_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ztbsv_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_stbsv_strided_batched(handle,uplo,transA,diag,n,k,A,lda,stride_A,x,incx,stride_x,batch_count) bind(c, name="rocblas_stbsv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_stbsv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dtbsv_strided_batched(handle,uplo,transA,diag,n,k,A,lda,stride_A,x,incx,stride_x,batch_count) bind(c, name="rocblas_dtbsv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dtbsv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_ctbsv_strided_batched(handle,uplo,transA,diag,n,k,A,lda,stride_A,x,incx,stride_x,batch_count) bind(c, name="rocblas_ctbsv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ctbsv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     tbsv_strided_batched solves
  !> 
  !>          A_ix_i = b_i or A_iTx_i = b_i or A_iHx_i = b_i,
  !> 
  !>     where x_i and b_i are vectors and A_i is a banded triangular matrix,
  !>     for i = [1, batch_count].
  !> 
  !>     The input vectors b_i are overwritten by the output vectors x_i.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  A_i is an upper triangular matrix.
  !>             rocblas_fill_lower:  A_i is a  lower triangular matrix.
  !> 
  !>     @param[in]
  !>     transA     [rocblas_operation]
  !>                rocblas_operation_none: Solves A_ix_i = b_i
  !>                rocblas_operation_transpose: Solves A_iTx_i = b_i
  !>                rocblas_operation_conjugate_transpose: Solves A_iHx_i = b_i
  !> 
  !>     @param[in]
  !>     diag    [rocblas_diagonal]
  !>             rocblas_diagonal_unit:     each A_i is assumed to be unit triangular (i.e. the diagonal elements
  !>                                        of each A_i are not used in computations).
  !>             rocblas_diagonal_non_unit: each A_i is not assumed to be unit triangular.
  !> 
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               n specifies the number of rows of each b_i. n >= 0.
  !>     @param[in]
  !>     k         [rocblas_int]
  !>               if(uplo == rocblas_fill_upper)
  !>                 k specifies the number of super-diagonals of each A_i.
  !>               if(uplo == rocblas_fill_lower)
  !>                 k specifies the number of sub-diagonals of each A_i.
  !>               k >= 0.
  !> 
  !>     @param[in]
  !>     A         device pointer pointing to the first banded matrix A_1.
  !> 
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of each A_i.
  !>               lda >= (k + 1).
  !>     @param[in]
  !>     stride_A  [rocblas_stride]
  !>               specifies the distance between the start of one matrix (A_i) and the next (A_i+1).
  !> 
  !>     @param[inout]
  !>     x         device pointer pointing to the first input vector b_1. Overwritten by output vectors x.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i.
  !>     @param[in]
  !>     stride_x  [rocblas_stride]
  !>               specifies the distance between the start of one vector (x_i) and the next (x_i+1).
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch.
  !> 
  !>     
    function rocblas_ztbsv_strided_batched(handle,uplo,transA,diag,n,k,A,lda,stride_A,x,incx,stride_x,batch_count) bind(c, name="rocblas_ztbsv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ztbsv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_strsv(handle,uplo,transA,diag,m,A,lda,x,incx) bind(c, name="rocblas_strsv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_strsv
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
    function rocblas_dtrsv(handle,uplo,transA,diag,m,A,lda,x,incx) bind(c, name="rocblas_dtrsv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dtrsv
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
    function rocblas_ctrsv(handle,uplo,transA,diag,m,A,lda,x,incx) bind(c, name="rocblas_ctrsv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ctrsv
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     trsv solves
  !> 
  !>          Ax = b or ATx = b,
  !> 
  !>     where x and b are vectors and A is a triangular matrix.
  !> 
  !>     The vector x is overwritten on b.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  A is an upper triangular matrix.
  !>             rocblas_fill_lower:  A is a  lower triangular matrix.
  !> 
  !>     @param[in]
  !>     transA     [rocblas_operation]
  !> 
  !>     @param[in]
  !>     diag    [rocblas_diagonal]
  !>             rocblas_diagonal_unit:     A is assumed to be unit triangular.
  !>             rocblas_diagonal_non_unit:  A is not assumed to be unit triangular.
  !> 
  !>     @param[in]
  !>     m         [rocblas_int]
  !>               m specifies the number of rows of b. m >= 0.
  !> 
  !>     @param[in]
  !>     A         device pointer storing matrix A,
  !>               of dimension ( lda, m )
  !> 
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of A.
  !>               lda = max( 1, m ).
  !> 
  !>     @param[in]
  !>     x         device pointer storing vector x.
  !> 
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of x.
  !> 
  !>     
    function rocblas_ztrsv(handle,uplo,transA,diag,m,A,lda,x,incx) bind(c, name="rocblas_ztrsv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ztrsv
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
    function rocblas_strsv_batched(handle,uplo,transA,diag,m,A,lda,x,incx,batch_count) bind(c, name="rocblas_strsv_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_strsv_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dtrsv_batched(handle,uplo,transA,diag,m,A,lda,x,incx,batch_count) bind(c, name="rocblas_dtrsv_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dtrsv_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_ctrsv_batched(handle,uplo,transA,diag,m,A,lda,x,incx,batch_count) bind(c, name="rocblas_ctrsv_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ctrsv_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     trsv_batched solves
  !> 
  !>          A_ix_i = b_i or A_iTx_i = b_i,
  !> 
  !>     where (A_i, x_i, b_i) is the i-th instance of the batch.
  !>     x_i and b_i are vectors and A_i is an
  !>     m by m triangular matrix.
  !> 
  !>     The vector x is overwritten on b.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  A is an upper triangular matrix.
  !>             rocblas_fill_lower:  A is a  lower triangular matrix.
  !> 
  !>     @param[in]
  !>     transA     [rocblas_operation]
  !> 
  !>     @param[in]
  !>     diag    [rocblas_diagonal]
  !>             rocblas_diagonal_unit:     A is assumed to be unit triangular.
  !>             rocblas_diagonal_non_unit:  A is not assumed to be unit triangular.
  !> 
  !>     @param[in]
  !>     m         [rocblas_int]
  !>               m specifies the number of rows of b. m >= 0.
  !> 
  !>     @param[in]
  !>     A         device array of device pointers storing each matrix A_i.
  !> 
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of each A_i.
  !>               lda = max(1, m)
  !> 
  !>     @param[in]
  !>     x         device array of device pointers storing each vector x_i.
  !> 
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of x.
  !> 
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch
  !> 
  !>     
    function rocblas_ztrsv_batched(handle,uplo,transA,diag,m,A,lda,x,incx,batch_count) bind(c, name="rocblas_ztrsv_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ztrsv_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_strsv_strided_batched(handle,uplo,transA,diag,m,A,lda,stride_A,x,incx,stride_x,batch_count) bind(c, name="rocblas_strsv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_strsv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dtrsv_strided_batched(handle,uplo,transA,diag,m,A,lda,stride_A,x,incx,stride_x,batch_count) bind(c, name="rocblas_dtrsv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dtrsv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_ctrsv_strided_batched(handle,uplo,transA,diag,m,A,lda,stride_A,x,incx,stride_x,batch_count) bind(c, name="rocblas_ctrsv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ctrsv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     trsv_strided_batched solves
  !> 
  !>          A_ix_i = b_i or A_iTx_i = b_i,
  !> 
  !>     where (A_i, x_i, b_i) is the i-th instance of the batch.
  !>     x_i and b_i are vectors and A_i is an m by m triangular matrix, for i = 1, ..., batch_count.
  !> 
  !>     The vector x is overwritten on b.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  A is an upper triangular matrix.
  !>             rocblas_fill_lower:  A is a  lower triangular matrix.
  !> 
  !>     @param[in]
  !>     transA     [rocblas_operation]
  !> 
  !>     @param[in]
  !>     diag    [rocblas_diagonal]
  !>             rocblas_diagonal_unit:     A is assumed to be unit triangular.
  !>             rocblas_diagonal_non_unit:  A is not assumed to be unit triangular.
  !> 
  !>     @param[in]
  !>     m         [rocblas_int]
  !>               m specifies the number of rows of each b_i. m >= 0.
  !> 
  !>     @param[in]
  !>     A         device pointer to the first matrix (A_1) in the batch, of dimension ( lda, m )
  !> 
  !>     @param[in]
  !>     stride_A  [rocblas_stride]
  !>               stride from the start of one A_i matrix to the next A_(i + 1)
  !> 
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of each A_i.
  !>               lda = max( 1, m ).
  !> 
  !>     @param[in, out]
  !>     x         device pointer to the first vector (x_1) in the batch.
  !> 
  !>     @param[in]
  !>     stride_x [rocblas_stride]
  !>              stride from the start of one x_i vector to the next x_(i + 1)
  !> 
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i.
  !> 
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch
  !> 
  !>     
    function rocblas_ztrsv_strided_batched(handle,uplo,transA,diag,m,A,lda,stride_A,x,incx,stride_x,batch_count) bind(c, name="rocblas_ztrsv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ztrsv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_stpsv(handle,uplo,transA,diag,n,AP,x,incx) bind(c, name="rocblas_stpsv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_stpsv
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: n
      type(c_ptr),value :: AP
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
    function rocblas_dtpsv(handle,uplo,transA,diag,n,AP,x,incx) bind(c, name="rocblas_dtpsv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dtpsv
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: n
      type(c_ptr),value :: AP
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
    function rocblas_ctpsv(handle,uplo,transA,diag,n,AP,x,incx) bind(c, name="rocblas_ctpsv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ctpsv
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: n
      type(c_ptr),value :: AP
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     TPSV solves
  !> 
  !>          Ax = b or ATx = b, or AHx = b,
  !> 
  !>     where x and b are vectors and A is a triangular matrix stored in the packed format.
  !> 
  !>     The input vector b is overwritten by the output vector x.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  A is an upper triangular matrix.
  !>             rocblas_fill_lower:  A is a  lower triangular matrix.
  !> 
  !>     @param[in]
  !>     transA  [rocblas_operation]
  !>             rocblas_operation_none: Solves Ax = b
  !>             rocblas_operation_transpose: Solves ATx = b
  !>             rocblas_operation_conjugate_transpose: Solves AHx = b
  !> 
  !>     @param[in]
  !>     diag    [rocblas_diagonal]
  !>             rocblas_diagonal_unit:     A is assumed to be unit triangular (i.e. the diagonal elements
  !>                                        of A are not used in computations).
  !>             rocblas_diagonal_non_unit: A is not assumed to be unit triangular.
  !> 
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               n specifies the number of rows of b. n >= 0.
  !> 
  !>     @param[in]
  !>     AP        device pointer storing the packed version of matrix A,
  !>               of dimension >= (n  (n + 1)  2)
  !> 
  !>     @param[inout]
  !>     x         device pointer storing vector b on input, overwritten by x on output.
  !> 
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of x.
  !> 
  !>     
    function rocblas_ztpsv(handle,uplo,transA,diag,n,AP,x,incx) bind(c, name="rocblas_ztpsv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ztpsv
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: n
      type(c_ptr),value :: AP
      type(c_ptr),value :: x
      integer(c_int),value :: incx
    end function

  
    function rocblas_stpsv_batched(handle,uplo,transA,diag,n,AP,x,incx,batch_count) bind(c, name="rocblas_stpsv_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_stpsv_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: n
      type(c_ptr) :: AP
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dtpsv_batched(handle,uplo,transA,diag,n,AP,x,incx,batch_count) bind(c, name="rocblas_dtpsv_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dtpsv_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: n
      type(c_ptr) :: AP
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_ctpsv_batched(handle,uplo,transA,diag,n,AP,x,incx,batch_count) bind(c, name="rocblas_ctpsv_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ctpsv_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: n
      type(c_ptr) :: AP
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     TPSV_BATCHED solves
  !> 
  !>          A_ix_i = b_i or A_iTx_i = b_i, or A_iHx_i = b_i,
  !> 
  !>     where x_i and b_i are vectors and A_i is a triangular matrix stored in the packed format,
  !>     for i in [1, batch_count].
  !> 
  !>     The input vectors b_i are overwritten by the output vectors x_i.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  each A_i is an upper triangular matrix.
  !>             rocblas_fill_lower:  each A_i is a  lower triangular matrix.
  !> 
  !>     @param[in]
  !>     transA  [rocblas_operation]
  !>             rocblas_operation_none: Solves Ax = b
  !>             rocblas_operation_transpose: Solves ATx = b
  !>             rocblas_operation_conjugate_transpose: Solves AHx = b
  !> 
  !>     @param[in]
  !>     diag    [rocblas_diagonal]
  !>             rocblas_diagonal_unit:     each A_i is assumed to be unit triangular (i.e. the diagonal elements
  !>                                        of each A_i are not used in computations).
  !>             rocblas_diagonal_non_unit: each A_i is not assumed to be unit triangular.
  !> 
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               n specifies the number of rows of each b_i. n >= 0.
  !> 
  !>     @param[in]
  !>     AP        device array of device pointers storing the packed versions of each matrix A_i,
  !>               of dimension >= (n  (n + 1)  2)
  !> 
  !>     @param[inout]
  !>     x         device array of device pointers storing each input vector b_i, overwritten by x_i on output.
  !> 
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i.
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 specifies the number of instances in the batch.
  !> 
  !>     
    function rocblas_ztpsv_batched(handle,uplo,transA,diag,n,AP,x,incx,batch_count) bind(c, name="rocblas_ztpsv_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ztpsv_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: n
      type(c_ptr) :: AP
      type(c_ptr) :: x
      integer(c_int),value :: incx
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_stpsv_strided_batched(handle,uplo,transA,diag,n,AP,stride_A,x,incx,stride_x,batch_count) bind(c, name="rocblas_stpsv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_stpsv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: n
      type(c_ptr),value :: AP
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dtpsv_strided_batched(handle,uplo,transA,diag,n,AP,stride_A,x,incx,stride_x,batch_count) bind(c, name="rocblas_dtpsv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dtpsv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: n
      type(c_ptr),value :: AP
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_ctpsv_strided_batched(handle,uplo,transA,diag,n,AP,stride_A,x,incx,stride_x,batch_count) bind(c, name="rocblas_ctpsv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ctpsv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: n
      type(c_ptr),value :: AP
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     TPSV_STRIDED_BATCHED solves
  !> 
  !>          A_ix_i = b_i or A_iTx_i = b_i, or A_iHx_i = b_i,
  !> 
  !>     where x_i and b_i are vectors and A_i is a triangular matrix stored in the packed format,
  !>     for i in [1, batch_count].
  !> 
  !>     The input vectors b_i are overwritten by the output vectors x_i.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  each A_i is an upper triangular matrix.
  !>             rocblas_fill_lower:  each A_i is a  lower triangular matrix.
  !> 
  !>     @param[in]
  !>     transA  [rocblas_operation]
  !>             rocblas_operation_none: Solves Ax = b
  !>             rocblas_operation_transpose: Solves ATx = b
  !>             rocblas_operation_conjugate_transpose: Solves AHx = b
  !> 
  !>     @param[in]
  !>     diag    [rocblas_diagonal]
  !>             rocblas_diagonal_unit:     each A_i is assumed to be unit triangular (i.e. the diagonal elements
  !>                                        of each A_i are not used in computations).
  !>             rocblas_diagonal_non_unit: each A_i is not assumed to be unit triangular.
  !> 
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               n specifies the number of rows of each b_i. n >= 0.
  !> 
  !>     @param[in]
  !>     AP        device pointer pointing to the first packed matrix A_1,
  !>               of dimension >= (n  (n + 1)  2)
  !> 
  !>     @param[in]
  !>     stride_A  [rocblas_stride]
  !>               stride from the beginning of one packed matrix (AP_i) and the next (AP_i+1).
  !> 
  !>     @param[inout]
  !>     x         device pointer pointing to the first input vector b_1. Overwritten by each x_i on output.
  !> 
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i.
  !>     @param[in]
  !>     stride_x  [rocblas_stride]
  !>               stride from the beginning of one vector (x_i) and the next (x_i+1).
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 specifies the number of instances in the batch.
  !> 
  !>     
    function rocblas_ztpsv_strided_batched(handle,uplo,transA,diag,n,AP,stride_A,x,incx,stride_x,batch_count) bind(c, name="rocblas_ztpsv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ztpsv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: n
      type(c_ptr),value :: AP
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_ssymv(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="rocblas_ssymv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ssymv
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      real(c_float) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
    function rocblas_dsymv(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="rocblas_dsymv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dsymv
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      real(c_double) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
    function rocblas_csymv(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="rocblas_csymv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_csymv
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      complex(c_float_complex) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xSYMV performs the matrix-vector operation:
  !> 
  !>         y := alphaAx + betay,
  !> 
  !>     where alpha and beta are scalars, x and y are n element vectors and
  !>     A should contain an upper or lower triangular n by n symmetric matrix.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      rocblas_fill
  !>               specifies whether the upper 'rocblas_fill_upper' or lower 'rocblas_fill_lower'
  !>               if rocblas_fill_upper, the lower part of A is not referenced
  !>               if rocblas_fill_lower, the upper part of A is not referenced
  !>     @param[in]
  !>     n         [rocblas_int]
  !>     @param[in]
  !>     alpha
  !>               specifies the scalar alpha
  !>     @param[in]
  !>     A         pointer storing matrix A on the GPU
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of A
  !>     @param[in]
  !>     x         pointer storing vector x on the GPU
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of x
  !>     @param[in]
  !>     beta      specifies the scalar beta
  !>     @param[out]
  !>     y         pointer storing vector y on the GPU
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of y
  !> 
  !>     
    function rocblas_zsymv(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="rocblas_zsymv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zsymv
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      complex(c_double_complex) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
    function rocblas_ssymv_batched(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy,batch_count) bind(c, name="rocblas_ssymv_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ssymv_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      real(c_float) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dsymv_batched(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy,batch_count) bind(c, name="rocblas_dsymv_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dsymv_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      real(c_double) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_csymv_batched(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy,batch_count) bind(c, name="rocblas_csymv_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_csymv_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      complex(c_float_complex) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xSYMV_batched performs the matrix-vector operation:
  !> 
  !>         y_i := alphaA_ix_i + betay_i,
  !> 
  !>     where (A_i, x_i, y_i) is the i-th instance of the batch.
  !>     alpha and beta are scalars, x_i and y_i are vectors and A_i is an
  !>     n by n symmetric matrix, for i = 1, ..., batch_count.
  !>     A a should contain an upper or lower triangular symmetric matrix
  !>     and the opposing triangular part of A is not referenced
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               specifies whether the upper 'rocblas_fill_upper' or lower 'rocblas_fill_lower'
  !>               if rocblas_fill_upper, the lower part of A is not referenced
  !>               if rocblas_fill_lower, the upper part of A is not referenced
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               number of rows and columns of each matrix A_i
  !>     @param[in]
  !>     alpha
  !>               device pointer or host pointer to scalar alpha
  !>     @param[in]
  !>     A         device array of device pointers storing each matrix A_i
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of each matrix A_i
  !>     @param[in]
  !>     x         device array of device pointers storing each vector x_i
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each vector x_i
  !>     @param[in]
  !>     beta      device pointer or host pointer to scalar beta
  !>     @param[out]
  !>     y         device array of device pointers storing each vector y_i
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of each vector y_i
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch
  !> 
  !>     
    function rocblas_zsymv_batched(handle,uplo,n,alpha,A,lda,x,incx,beta,y,incy,batch_count) bind(c, name="rocblas_zsymv_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zsymv_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      complex(c_double_complex) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_ssymv_strided_batched(handle,uplo,n,alpha,A,lda,strideA,x,incx,stridex,beta,y,incy,stridey,batch_count) bind(c, name="rocblas_ssymv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ssymv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      real(c_float) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dsymv_strided_batched(handle,uplo,n,alpha,A,lda,strideA,x,incx,stridex,beta,y,incy,stridey,batch_count) bind(c, name="rocblas_dsymv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dsymv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      real(c_double) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_csymv_strided_batched(handle,uplo,n,alpha,A,lda,strideA,x,incx,stridex,beta,y,incy,stridey,batch_count) bind(c, name="rocblas_csymv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_csymv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      complex(c_float_complex) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xSYMV_strided_batched performs the matrix-vector operation:
  !> 
  !>         y_i := alphaA_ix_i + betay_i,
  !> 
  !>     where (A_i, x_i, y_i) is the i-th instance of the batch.
  !>     alpha and beta are scalars, x_i and y_i are vectors and A_i is an
  !>     n by n symmetric matrix, for i = 1, ..., batch_count.
  !>     A a should contain an upper or lower triangular symmetric matrix
  !>     and the opposing triangular part of A is not referenced
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               specifies whether the upper 'rocblas_fill_upper' or lower 'rocblas_fill_lower'
  !>               if rocblas_fill_upper, the lower part of A is not referenced
  !>               if rocblas_fill_lower, the upper part of A is not referenced
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               number of rows and columns of each matrix A_i
  !>     @param[in]
  !>     alpha
  !>               device pointer or host pointer to scalar alpha
  !>     @param[in]
  !>     A         Device pointer to the first matrix A_1 on the GPU
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of each matrix A_i
  !>     @param[in]
  !>     strideA     [rocblas_stride]
  !>                 stride from the start of one matrix (A_i) and the next one (A_i+1)
  !>     @param[in]
  !>     x         Device pointer to the first vector x_1 on the GPU
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each vector x_i
  !>     @param[in]
  !>     stridex     [rocblas_stride]
  !>                 stride from the start of one vector (x_i) and the next one (x_i+1).
  !>                 There are no restrictions placed on stride_x, however the user should
  !>                 take care to ensure that stridex is of appropriate size.
  !>                 This typically means stridex >= n  incx. stridex should be non zero.
  !>     @param[in]
  !>     beta      device pointer or host pointer to scalar beta
  !>     @param[out]
  !>     y         Device pointer to the first vector y_1 on the GPU
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of each vector y_i
  !>     @param[in]
  !>     stridey     [rocblas_stride]
  !>                 stride from the start of one vector (y_i) and the next one (y_i+1).
  !>                 There are no restrictions placed on stride_y, however the user should
  !>                 take care to ensure that stridey is of appropriate size.
  !>                 This typically means stridey >= n  incy. stridey should be non zero.
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch
  !> 
  !>     
    function rocblas_zsymv_strided_batched(handle,uplo,n,alpha,A,lda,strideA,x,incx,stridex,beta,y,incy,stridey,batch_count) bind(c, name="rocblas_zsymv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zsymv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      complex(c_double_complex) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_sspmv(handle,uplo,n,alpha,A,x,incx,beta,y,incy) bind(c, name="rocblas_sspmv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sspmv
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: A
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      real(c_float) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xSPMV performs the matrix-vector operation:
  !> 
  !>         y := alphaAx + betay,
  !> 
  !>     where alpha and beta are scalars, x and y are n element vectors and
  !>     A should contain an upper or lower triangular n by n packed symmetric matrix.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      rocblas_fill
  !>               specifies whether the upper 'rocblas_fill_upper' or lower 'rocblas_fill_lower'
  !>               if rocblas_fill_upper, the lower part of A is not referenced
  !>               if rocblas_fill_lower, the upper part of A is not referenced
  !>     @param[in]
  !>     n         [rocblas_int]
  !>     @param[in]
  !>     alpha
  !>               specifies the scalar alpha
  !>     @param[in]
  !>     A         pointer storing matrix A on the GPU
  !>     @param[in]
  !>     x         pointer storing vector x on the GPU
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of x
  !>     @param[in]
  !>     beta      specifies the scalar beta
  !>     @param[out]
  !>     y         pointer storing vector y on the GPU
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of y
  !> 
  !>     
    function rocblas_dspmv(handle,uplo,n,alpha,A,x,incx,beta,y,incy) bind(c, name="rocblas_dspmv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dspmv
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: A
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      real(c_double) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
    function rocblas_sspmv_batched(handle,uplo,n,alpha,A,x,incx,beta,y,incy,batch_count) bind(c, name="rocblas_sspmv_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sspmv_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr) :: A
      type(c_ptr) :: x
      integer(c_int),value :: incx
      real(c_float) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xSPMV_batched performs the matrix-vector operation:
  !> 
  !>         y_i := alphaA_ix_i + betay_i,
  !> 
  !>     where (A_i, x_i, y_i) is the i-th instance of the batch.
  !>     alpha and beta are scalars, x_i and y_i are vectors and A_i is an
  !>     n by n symmetric matrix, for i = 1, ..., batch_count.
  !>     A should contain an upper or lower triangular n by n packed symmetric matrix.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               specifies whether the upper 'rocblas_fill_upper' or lower 'rocblas_fill_lower'
  !>               if rocblas_fill_upper, the lower part of A is not referenced
  !>               if rocblas_fill_lower, the upper part of A is not referenced
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               number of rows and columns of each matrix A_i
  !>     @param[in]
  !>     alpha
  !>               device pointer or host pointer to scalar alpha
  !>     @param[in]
  !>     A         device array of device pointers storing each matrix A_i
  !>     @param[in]
  !>     x         device array of device pointers storing each vector x_i
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each vector x_i
  !>     @param[in]
  !>     beta      device pointer or host pointer to scalar beta
  !>     @param[out]
  !>     y         device array of device pointers storing each vector y_i
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of each vector y_i
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch
  !> 
  !>     
    function rocblas_dspmv_batched(handle,uplo,n,alpha,A,x,incx,beta,y,incy,batch_count) bind(c, name="rocblas_dspmv_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dspmv_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr) :: A
      type(c_ptr) :: x
      integer(c_int),value :: incx
      real(c_double) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_sspmv_strided_batched(handle,uplo,n,alpha,A,strideA,x,incx,stridex,beta,y,incy,stridey,batch_count) bind(c, name="rocblas_sspmv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sspmv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: A
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      real(c_float) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xSPMV_strided_batched performs the matrix-vector operation:
  !> 
  !>         y_i := alphaA_ix_i + betay_i,
  !> 
  !>     where (A_i, x_i, y_i) is the i-th instance of the batch.
  !>     alpha and beta are scalars, x_i and y_i are vectors and A_i is an
  !>     n by n symmetric matrix, for i = 1, ..., batch_count.
  !>     A should contain an upper or lower triangular n by n packed symmetric matrix.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               specifies whether the upper 'rocblas_fill_upper' or lower 'rocblas_fill_lower'
  !>               if rocblas_fill_upper, the lower part of A is not referenced
  !>               if rocblas_fill_lower, the upper part of A is not referenced
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               number of rows and columns of each matrix A_i
  !>     @param[in]
  !>     alpha
  !>               device pointer or host pointer to scalar alpha
  !>     @param[in]
  !>     A         Device pointer to the first matrix A_1 on the GPU
  !>     @param[in]
  !>     strideA     [rocblas_stride]
  !>                 stride from the start of one matrix (A_i) and the next one (A_i+1)
  !>     @param[in]
  !>     x         Device pointer to the first vector x_1 on the GPU
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each vector x_i
  !>     @param[in]
  !>     stridex     [rocblas_stride]
  !>                 stride from the start of one vector (x_i) and the next one (x_i+1).
  !>                 There are no restrictions placed on stridex, however the user should
  !>                 take care to ensure that stridex is of appropriate size.
  !>                 This typically means stridex >= n  incx. stridex should be non zero.
  !>     @param[in]
  !>     beta      device pointer or host pointer to scalar beta
  !>     @param[out]
  !>     y         Device pointer to the first vector y_1 on the GPU
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of each vector y_i
  !>     @param[in]
  !>     stridey     [rocblas_stride]
  !>                 stride from the start of one vector (y_i) and the next one (y_i+1).
  !>                 There are no restrictions placed on stridey, however the user should
  !>                 take care to ensure that stridey is of appropriate size.
  !>                 This typically means stridey >= n  incy. stridey should be non zero.
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch
  !> 
  !>     
    function rocblas_dspmv_strided_batched(handle,uplo,n,alpha,A,strideA,x,incx,stridex,beta,y,incy,stridey,batch_count) bind(c, name="rocblas_dspmv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dspmv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: A
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      real(c_double) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_ssbmv(handle,uplo,n,k,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="rocblas_ssbmv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ssbmv
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      real(c_float) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xSBMV performs the matrix-vector operation:
  !> 
  !>         y := alphaAx + betay,
  !> 
  !>     where alpha and beta are scalars, x and y are n element vectors and
  !>     A should contain an upper or lower triangular n by n symmetric banded matrix.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      rocblas_fill
  !>               specifies whether the upper 'rocblas_fill_upper' or lower 'rocblas_fill_lower'
  !>               if rocblas_fill_upper, the lower part of A is not referenced
  !>               if rocblas_fill_lower, the upper part of A is not referenced
  !>     @param[in]
  !>     n         [rocblas_int]
  !>     @param[in]
  !>     k         [rocblas_int]
  !>               specifies the number of sub- and super-diagonals
  !>     @param[in]
  !>     alpha
  !>               specifies the scalar alpha
  !>     @param[in]
  !>     A         pointer storing matrix A on the GPU
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of matrix A
  !>     @param[in]
  !>     x         pointer storing vector x on the GPU
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of x
  !>     @param[in]
  !>     beta      specifies the scalar beta
  !>     @param[out]
  !>     y         pointer storing vector y on the GPU
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of y
  !> 
  !>     
    function rocblas_dsbmv(handle,uplo,n,k,alpha,A,lda,x,incx,beta,y,incy) bind(c, name="rocblas_dsbmv")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dsbmv
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      real(c_double) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  
    function rocblas_dsbmv_batched(handle,uplo,n,k,alpha,A,lda,x,incx,beta,y,incy,batch_count) bind(c, name="rocblas_dsbmv_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dsbmv_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      real(c_double) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xSBMV_batched performs the matrix-vector operation:
  !> 
  !>         y_i := alphaA_ix_i + betay_i,
  !> 
  !>     where (A_i, x_i, y_i) is the i-th instance of the batch.
  !>     alpha and beta are scalars, x_i and y_i are vectors and A_i is an
  !>     n by n symmetric banded matrix, for i = 1, ..., batch_count.
  !>     A should contain an upper or lower triangular n by n symmetric banded matrix.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               specifies whether the upper 'rocblas_fill_upper' or lower 'rocblas_fill_lower'
  !>               if rocblas_fill_upper, the lower part of A is not referenced
  !>               if rocblas_fill_lower, the upper part of A is not referenced
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               number of rows and columns of each matrix A_i
  !>     @param[in]
  !>     k         [rocblas_int]
  !>               specifies the number of sub- and super-diagonals
  !>     @param[in]
  !>     alpha
  !>               device pointer or host pointer to scalar alpha
  !>     @param[in]
  !>     A         device array of device pointers storing each matrix A_i
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of each matrix A_i
  !>     @param[in]
  !>     x         device array of device pointers storing each vector x_i
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each vector x_i
  !>     @param[in]
  !>     beta      device pointer or host pointer to scalar beta
  !>     @param[out]
  !>     y         device array of device pointers storing each vector y_i
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of each vector y_i
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch
  !> 
  !>     
    function rocblas_ssbmv_batched(handle,uplo,n,k,alpha,A,lda,x,incx,beta,y,incy,batch_count) bind(c, name="rocblas_ssbmv_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ssbmv_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      real(c_float) :: beta
      type(c_ptr) :: y
      integer(c_int),value :: incy
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_ssbmv_strided_batched(handle,uplo,n,k,alpha,A,lda,strideA,x,incx,stridex,beta,y,incy,stridey,batch_count) bind(c, name="rocblas_ssbmv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ssbmv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      real(c_float) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xSBMV_strided_batched performs the matrix-vector operation:
  !> 
  !>         y_i := alphaA_ix_i + betay_i,
  !> 
  !>     where (A_i, x_i, y_i) is the i-th instance of the batch.
  !>     alpha and beta are scalars, x_i and y_i are vectors and A_i is an
  !>     n by n symmetric banded matrix, for i = 1, ..., batch_count.
  !>     A should contain an upper or lower triangular n by n symmetric banded matrix.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               specifies whether the upper 'rocblas_fill_upper' or lower 'rocblas_fill_lower'
  !>               if rocblas_fill_upper, the lower part of A is not referenced
  !>               if rocblas_fill_lower, the upper part of A is not referenced
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               number of rows and columns of each matrix A_i
  !>     @param[in]
  !>     k         [rocblas_int]
  !>               specifies the number of sub- and super-diagonals
  !>     @param[in]
  !>     alpha
  !>               device pointer or host pointer to scalar alpha
  !>     @param[in]
  !>     A         Device pointer to the first matrix A_1 on the GPU
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of each matrix A_i
  !>     @param[in]
  !>     strideA     [rocblas_stride]
  !>                 stride from the start of one matrix (A_i) and the next one (A_i+1)
  !>     @param[in]
  !>     x         Device pointer to the first vector x_1 on the GPU
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each vector x_i
  !>     @param[in]
  !>     stridex     [rocblas_stride]
  !>                 stride from the start of one vector (x_i) and the next one (x_i+1).
  !>                 There are no restrictions placed on stridex, however the user should
  !>                 take care to ensure that stridex is of appropriate size.
  !>                 This typically means stridex >= n  incx. stridex should be non zero.
  !>     @param[in]
  !>     beta      device pointer or host pointer to scalar beta
  !>     @param[out]
  !>     y         Device pointer to the first vector y_1 on the GPU
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of each vector y_i
  !>     @param[in]
  !>     stridey     [rocblas_stride]
  !>                 stride from the start of one vector (y_i) and the next one (y_i+1).
  !>                 There are no restrictions placed on stridey, however the user should
  !>                 take care to ensure that stridey is of appropriate size.
  !>                 This typically means stridey >= n  incy. stridey should be non zero.
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch
  !> 
  !>     
    function rocblas_dsbmv_strided_batched(handle,uplo,n,k,alpha,A,lda,strideA,x,incx,stridex,beta,y,incy,stridey,batch_count) bind(c, name="rocblas_dsbmv_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dsbmv_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      real(c_double) :: beta
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_sger(handle,m,n,alpha,x,incx,y,incy,A,lda) bind(c, name="rocblas_sger")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sger
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  
    function rocblas_dger(handle,m,n,alpha,x,incx,y,incy,A,lda) bind(c, name="rocblas_dger")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dger
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  
    function rocblas_cgeru(handle,m,n,alpha,x,incx,y,incy,A,lda) bind(c, name="rocblas_cgeru")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cgeru
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  
    function rocblas_zgeru(handle,m,n,alpha,x,incx,y,incy,A,lda) bind(c, name="rocblas_zgeru")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zgeru
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  
    function rocblas_cgerc(handle,m,n,alpha,x,incx,y,incy,A,lda) bind(c, name="rocblas_cgerc")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cgerc
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xGER,xGERU,xGERC performs the matrix-vector operations
  !> 
  !>         A := A + alphaxyT , OR
  !>         A := A + alphaxyH for xGERC
  !> 
  !>     where alpha is a scalar, x and y are vectors, and A is an
  !>     m by n matrix.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     m         [rocblas_int]
  !>               the number of rows of the matrix A.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of columns of the matrix A.
  !>     @param[in]
  !>     alpha
  !>               device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>     x         device pointer storing vector x.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of x.
  !>     @param[in]
  !>     y         device pointer storing vector y.
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of y.
  !>     @param[inout]
  !>     A         device pointer storing matrix A.
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of A.
  !> 
  !>     
    function rocblas_zgerc(handle,m,n,alpha,x,incx,y,incy,A,lda) bind(c, name="rocblas_zgerc")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zgerc
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  
    function rocblas_sger_batched(handle,m,n,alpha,x,incx,y,incy,A,lda,batch_count) bind(c, name="rocblas_sger_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sger_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dger_batched(handle,m,n,alpha,x,incx,y,incy,A,lda,batch_count) bind(c, name="rocblas_dger_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dger_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_cgeru_batched(handle,m,n,alpha,x,incx,y,incy,A,lda,batch_count) bind(c, name="rocblas_cgeru_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cgeru_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_zgeru_batched(handle,m,n,alpha,x,incx,y,incy,A,lda,batch_count) bind(c, name="rocblas_zgeru_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zgeru_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_cgerc_batched(handle,m,n,alpha,x,incx,y,incy,A,lda,batch_count) bind(c, name="rocblas_cgerc_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cgerc_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xGER,xGERU,xGERC_BATCHED performs a batch of the matrix-vector operations
  !> 
  !>         A := A + alphaxyT , OR
  !>         A := A + alphaxyH for xGERC
  !> 
  !>     where (A_i, x_i, y_i) is the i-th instance of the batch.
  !>     alpha is a scalar, x_i and y_i are vectors and A_i is an
  !>     m by n matrix, for i = 1, ..., batch_count.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     m         [rocblas_int]
  !>               the number of rows of each matrix A_i.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of columns of eaceh matrix A_i.
  !>     @param[in]
  !>     alpha
  !>               device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>     x         device array of device pointers storing each vector x_i.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each vector x_i.
  !>     @param[in]
  !>     y         device array of device pointers storing each vector y_i.
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of each vector y_i.
  !>     @param[inout]
  !>     A         device array of device pointers storing each matrix A_i.
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of each A_i.
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch
  !> 
  !>     
    function rocblas_zgerc_batched(handle,m,n,alpha,x,incx,y,incy,A,lda,batch_count) bind(c, name="rocblas_zgerc_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zgerc_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_sger_strided_batched(handle,m,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batch_count) bind(c, name="rocblas_sger_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sger_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dger_strided_batched(handle,m,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batch_count) bind(c, name="rocblas_dger_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dger_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_cgeru_strided_batched(handle,m,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batch_count) bind(c, name="rocblas_cgeru_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cgeru_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_zgeru_strided_batched(handle,m,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batch_count) bind(c, name="rocblas_zgeru_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zgeru_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_cgerc_strided_batched(handle,m,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batch_count) bind(c, name="rocblas_cgerc_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cgerc_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xGERC,xGERU,xGERC_STRIDED_BATCHED performs the matrix-vector operations
  !> 
  !>         A_i := A_i + alphax_iy_iT, OR
  !>         A_i := A_i + alphax_iy_iH  for xGERC
  !> 
  !>     where (A_i, x_i, y_i) is the i-th instance of the batch.
  !>     alpha is a scalar, x_i and y_i are vectors and A_i is an
  !>     m by n matrix, for i = 1, ..., batch_count.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     m         [rocblas_int]
  !>               the number of rows of each matrix A_i.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of columns of each matrix A_i.
  !>     @param[in]
  !>     alpha
  !>               device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>     x         device pointer to the first vector (x_1) in the batch.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increments for the elements of each vector x_i.
  !>     @param[in]
  !>     stridex   [rocblas_stride]
  !>               stride from the start of one vector (x_i) and the next one (x_i+1).
  !>               There are no restrictions placed on stride_x, however the user should
  !>               take care to ensure that stride_x is of appropriate size, for a typical
  !>               case this means stride_x >= m  incx.
  !>     @param[inout]
  !>     y         device pointer to the first vector (y_1) in the batch.
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of each vector y_i.
  !>     @param[in]
  !>     stridey   [rocblas_stride]
  !>               stride from the start of one vector (y_i) and the next one (y_i+1).
  !>               There are no restrictions placed on stride_y, however the user should
  !>               take care to ensure that stride_y is of appropriate size, for a typical
  !>               case this means stride_y >= n  incy.
  !>     @param[inout]
  !>     A         device pointer to the first matrix (A_1) in the batch.
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of each A_i.
  !>     @param[in]
  !>     strideA     [rocblas_stride]
  !>                 stride from the start of one matrix (A_i) and the next one (A_i+1)
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch
  !> 
  !>     
    function rocblas_zgerc_strided_batched(handle,m,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batch_count) bind(c, name="rocblas_zgerc_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zgerc_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_sspr(handle,uplo,n,alpha,x,incx,AP) bind(c, name="rocblas_sspr")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sspr
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: AP
    end function

  
    function rocblas_dspr(handle,uplo,n,alpha,x,incx,AP) bind(c, name="rocblas_dspr")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dspr
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: AP
    end function

  
    function rocblas_cspr(handle,uplo,n,alpha,x,incx,AP) bind(c, name="rocblas_cspr")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cspr
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: AP
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xSPR performs the matrix-vector operations
  !> 
  !>         A := A + alphaxxT
  !> 
  !>     where alpha is a scalar, x is a vector, and A is an
  !>     n by n symmetric matrix, supplied in packed form.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               specifies whether the upper 'rocblas_fill_upper' or lower 'rocblas_fill_lower'
  !>               rocblas_fill_upper: The upper triangular part of A is supplied in AP.
  !>               rocblas_fill_lower: The lower triangular part of A is supplied in AP.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of rows and columns of matrix A, must be at least 0.
  !>     @param[in]
  !>     alpha
  !>               device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>     x         device pointer storing vector x.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of x.
  !>     @param[inout]
  !>     AP        device pointer storing the packed version of the specified triangular portion of
  !>               the symmetric matrix A. Of at least size ((n  (n + 1))  2).
  !>               if uplo == rocblas_fill_upper:
  !>                 The upper triangular portion of the symmetric matrix A is supplied.
  !>                 The matrix is compacted so that AP contains the triangular portion column-by-column
  !>                 so that:
  !>                 AP(0) = A(0,0)
  !>                 AP(1) = A(0,1)
  !>                 AP(2) = A(1,1), etc.
  !>                     Ex: (rocblas_fill_upper; n = 4)
  !>                         1 2 4 7
  !>                         2 3 5 8   -----> [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
  !>                         4 5 6 9
  !>                         7 8 9 0
  !>             if uplo == rocblas_fill_lower:
  !>                 The lower triangular portion of the symmetric matrix A is supplied.
  !>                 The matrix is compacted so that AP contains the triangular portion column-by-column
  !>                 so that:
  !>                 AP(0) = A(0,0)
  !>                 AP(1) = A(1,0)
  !>                 AP(2) = A(2,1), etc.
  !>                     Ex: (rocblas_fill_lower; n = 4)
  !>                         1 2 3 4
  !>                         2 5 6 7    -----> [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
  !>                         3 6 8 9
  !>                         4 7 9 0
  !>     
    function rocblas_zspr(handle,uplo,n,alpha,x,incx,AP) bind(c, name="rocblas_zspr")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zspr
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: AP
    end function

  
    function rocblas_sspr_batched(handle,uplo,n,alpha,x,incx,AP,batch_count) bind(c, name="rocblas_sspr_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sspr_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: AP
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dspr_batched(handle,uplo,n,alpha,x,incx,AP,batch_count) bind(c, name="rocblas_dspr_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dspr_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: AP
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_cspr_batched(handle,uplo,n,alpha,x,incx,AP,batch_count) bind(c, name="rocblas_cspr_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cspr_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: AP
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xSPR_BATCHED performs the matrix-vector operations
  !> 
  !>         A_i := A_i + alphax_ix_iT
  !> 
  !>     where alpha is a scalar, x_i is a vector, and A_i is an
  !>     n by n symmetric matrix, supplied in packed form, for i = 1, ..., batch_count.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               specifies whether the upper 'rocblas_fill_upper' or lower 'rocblas_fill_lower'
  !>               rocblas_fill_upper: The upper triangular part of each A_i is supplied in AP.
  !>               rocblas_fill_lower: The lower triangular part of each A_i is supplied in AP.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of rows and columns of each matrix A_i, must be at least 0.
  !>     @param[in]
  !>     alpha
  !>               device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>     x         device array of device pointers storing each vector x_i.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i.
  !>     @param[inout]
  !>     AP        device array of device pointers storing the packed version of the specified triangular portion of
  !>               each symmetric matrix A_i of at least size ((n  (n + 1))  2). Array is of at least size batch_count.
  !>               if uplo == rocblas_fill_upper:
  !>                 The upper triangular portion of each symmetric matrix A_i is supplied.
  !>                 The matrix is compacted so that AP contains the triangular portion column-by-column
  !>                 so that:
  !>                 AP(0) = A(0,0)
  !>                 AP(1) = A(0,1)
  !>                 AP(2) = A(1,1), etc.
  !>                     Ex: (rocblas_fill_upper; n = 4)
  !>                         1 2 4 7
  !>                         2 3 5 8   -----> [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
  !>                         4 5 6 9
  !>                         7 8 9 0
  !>             if uplo == rocblas_fill_lower:
  !>                 The lower triangular portion of each symmetric matrix A_i is supplied.
  !>                 The matrix is compacted so that AP contains the triangular portion column-by-column
  !>                 so that:
  !>                 AP(0) = A(0,0)
  !>                 AP(1) = A(1,0)
  !>                 AP(2) = A(2,1), etc.
  !>                     Ex: (rocblas_fill_lower; n = 4)
  !>                         1 2 3 4
  !>                         2 5 6 7    -----> [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
  !>                         3 6 8 9
  !>                         4 7 9 0
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch.
  !>     
    function rocblas_zspr_batched(handle,uplo,n,alpha,x,incx,AP,batch_count) bind(c, name="rocblas_zspr_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zspr_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: AP
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_sspr_strided_batched(handle,uplo,n,alpha,x,incx,stride_x,AP,stride_A,batch_count) bind(c, name="rocblas_sspr_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sspr_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      type(c_ptr),value :: AP
      integer(c_int64_t),value :: stride_A
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dspr_strided_batched(handle,uplo,n,alpha,x,incx,stride_x,AP,stride_A,batch_count) bind(c, name="rocblas_dspr_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dspr_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      type(c_ptr),value :: AP
      integer(c_int64_t),value :: stride_A
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_cspr_strided_batched(handle,uplo,n,alpha,x,incx,stride_x,AP,stride_A,batch_count) bind(c, name="rocblas_cspr_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cspr_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      type(c_ptr),value :: AP
      integer(c_int64_t),value :: stride_A
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xSPR_STRIDED_BATCHED performs the matrix-vector operations
  !> 
  !>         A_i := A_i + alphax_ix_iT
  !> 
  !>     where alpha is a scalar, x_i is a vector, and A_i is an
  !>     n by n symmetric matrix, supplied in packed form, for i = 1, ..., batch_count.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               specifies whether the upper 'rocblas_fill_upper' or lower 'rocblas_fill_lower'
  !>               rocblas_fill_upper: The upper triangular part of each A_i is supplied in AP.
  !>               rocblas_fill_lower: The lower triangular part of each A_i is supplied in AP.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of rows and columns of each matrix A_i, must be at least 0.
  !>     @param[in]
  !>     alpha
  !>               device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>     x         device pointer pointing to the first vector (x_1).
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i.
  !>     @param[in]
  !>     stride_x  [rocblas_stride]
  !>               stride from the start of one vector (x_i) and the next one (x_i+1).
  !>     @param[inout]
  !>     AP        device pointer storing the packed version of the specified triangular portion of
  !>               each symmetric matrix A_i. Points to the first A_1.
  !>               if uplo == rocblas_fill_upper:
  !>                 The upper triangular portion of each symmetric matrix A_i is supplied.
  !>                 The matrix is compacted so that AP contains the triangular portion column-by-column
  !>                 so that:
  !>                 AP(0) = A(0,0)
  !>                 AP(1) = A(0,1)
  !>                 AP(2) = A(1,1), etc.
  !>                     Ex: (rocblas_fill_upper; n = 4)
  !>                         1 2 4 7
  !>                         2 3 5 8   -----> [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
  !>                         4 5 6 9
  !>                         7 8 9 0
  !>             if uplo == rocblas_fill_lower:
  !>                 The lower triangular portion of each symmetric matrix A_i is supplied.
  !>                 The matrix is compacted so that AP contains the triangular portion column-by-column
  !>                 so that:
  !>                 AP(0) = A(0,0)
  !>                 AP(1) = A(1,0)
  !>                 AP(2) = A(2,1), etc.
  !>                     Ex: (rocblas_fill_lower; n = 4)
  !>                         1 2 3 4
  !>                         2 5 6 7    -----> [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
  !>                         3 6 8 9
  !>                         4 7 9 0
  !>     @param[in]
  !>     stride_A    [rocblas_stride]
  !>                 stride from the start of one (A_i) and the next (A_i+1)
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch.
  !>     
    function rocblas_zspr_strided_batched(handle,uplo,n,alpha,x,incx,stride_x,AP,stride_A,batch_count) bind(c, name="rocblas_zspr_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zspr_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      type(c_ptr),value :: AP
      integer(c_int64_t),value :: stride_A
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_sspr2(handle,uplo,n,alpha,x,incx,y,incy,AP) bind(c, name="rocblas_sspr2")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sspr2
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: AP
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xSPR2 performs the matrix-vector operation
  !> 
  !>         A := A + alphaxyT + alphayxT
  !> 
  !>     where alpha is a scalar, x and y are vectors, and A is an
  !>     n by n symmetric matrix, supplied in packed form.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               specifies whether the upper 'rocblas_fill_upper' or lower 'rocblas_fill_lower'
  !>               rocblas_fill_upper: The upper triangular part of A is supplied in AP.
  !>               rocblas_fill_lower: The lower triangular part of A is supplied in AP.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of rows and columns of matrix A, must be at least 0.
  !>     @param[in]
  !>     alpha
  !>               device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>     x         device pointer storing vector x.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of x.
  !>     @param[in]
  !>     y         device pointer storing vector y.
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of y.
  !>     @param[inout]
  !>     AP        device pointer storing the packed version of the specified triangular portion of
  !>               the symmetric matrix A. Of at least size ((n  (n + 1))  2).
  !>               if uplo == rocblas_fill_upper:
  !>                 The upper triangular portion of the symmetric matrix A is supplied.
  !>                 The matrix is compacted so that AP contains the triangular portion column-by-column
  !>                 so that:
  !>                 AP(0) = A(0,0)
  !>                 AP(1) = A(0,1)
  !>                 AP(2) = A(1,1), etc.
  !>                     Ex: (rocblas_fill_upper; n = 4)
  !>                         1 2 4 7
  !>                         2 3 5 8   -----> [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
  !>                         4 5 6 9
  !>                         7 8 9 0
  !>             if uplo == rocblas_fill_lower:
  !>                 The lower triangular portion of the symmetric matrix A is supplied.
  !>                 The matrix is compacted so that AP contains the triangular portion column-by-column
  !>                 so that:
  !>                 AP(0) = A(0,0)
  !>                 AP(1) = A(1,0)
  !>                 AP(n) = A(2,1), etc.
  !>                     Ex: (rocblas_fill_lower; n = 4)
  !>                         1 2 3 4
  !>                         2 5 6 7    -----> [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
  !>                         3 6 8 9
  !>                         4 7 9 0
  !>     
    function rocblas_dspr2(handle,uplo,n,alpha,x,incx,y,incy,AP) bind(c, name="rocblas_dspr2")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dspr2
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: AP
    end function

  
    function rocblas_sspr2_batched(handle,uplo,n,alpha,x,incx,y,incy,AP,batch_count) bind(c, name="rocblas_sspr2_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sspr2_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr) :: AP
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xSPR2_BATCHED performs the matrix-vector operation
  !> 
  !>         A_i := A_i + alphax_iy_iT + alphayxT
  !> 
  !>     where alpha is a scalar, x_i is a vector, and A_i is an
  !>     n by n symmetric matrix, supplied in packed form, for i = 1, ..., batch_count.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               specifies whether the upper 'rocblas_fill_upper' or lower 'rocblas_fill_lower'
  !>               rocblas_fill_upper: The upper triangular part of each A_i is supplied in AP.
  !>               rocblas_fill_lower: The lower triangular part of each A_i is supplied in AP.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of rows and columns of each matrix A_i, must be at least 0.
  !>     @param[in]
  !>     alpha
  !>               device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>     x         device array of device pointers storing each vector x_i.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i.
  !>     @param[in]
  !>     y         device array of device pointers storing each vector y_i.
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of each y_i.
  !>     @param[inout]
  !>     AP        device array of device pointers storing the packed version of the specified triangular portion of
  !>               each symmetric matrix A_i of at least size ((n  (n + 1))  2). Array is of at least size batch_count.
  !>               if uplo == rocblas_fill_upper:
  !>                 The upper triangular portion of each symmetric matrix A_i is supplied.
  !>                 The matrix is compacted so that AP contains the triangular portion column-by-column
  !>                 so that:
  !>                 AP(0) = A(0,0)
  !>                 AP(1) = A(0,1)
  !>                 AP(2) = A(1,1), etc.
  !>                     Ex: (rocblas_fill_upper; n = 4)
  !>                         1 2 4 7
  !>                         2 3 5 8   -----> [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
  !>                         4 5 6 9
  !>                         7 8 9 0
  !>             if uplo == rocblas_fill_lower:
  !>                 The lower triangular portion of each symmetric matrix A_i is supplied.
  !>                 The matrix is compacted so that AP contains the triangular portion column-by-column
  !>                 so that:
  !>                 AP(0) = A(0,0)
  !>                 AP(1) = A(1,0)
  !>                 AP(n) = A(2,1), etc.
  !>                     Ex: (rocblas_fill_lower; n = 4)
  !>                         1 2 3 4
  !>                         2 5 6 7    -----> [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
  !>                         3 6 8 9
  !>                         4 7 9 0
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch.
  !>     
    function rocblas_dspr2_batched(handle,uplo,n,alpha,x,incx,y,incy,AP,batch_count) bind(c, name="rocblas_dspr2_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dspr2_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr) :: AP
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_sspr2_strided_batched(handle,uplo,n,alpha,x,incx,stride_x,y,incy,stride_y,AP,stride_A,batch_count) bind(c, name="rocblas_sspr2_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sspr2_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stride_y
      type(c_ptr),value :: AP
      integer(c_int64_t),value :: stride_A
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xSPR_STRIDED_BATCHED performs the matrix-vector operation
  !> 
  !>         A_i := A_i + alphax_ix_iT
  !> 
  !>     where alpha is a scalar, x_i is a vector, and A_i is an
  !>     n by n symmetric matrix, supplied in packed form, for i = 1, ..., batch_count.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               specifies whether the upper 'rocblas_fill_upper' or lower 'rocblas_fill_lower'
  !>               rocblas_fill_upper: The upper triangular part of each A_i is supplied in AP.
  !>               rocblas_fill_lower: The lower triangular part of each A_i is supplied in AP.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of rows and columns of each matrix A_i, must be at least 0.
  !>     @param[in]
  !>     alpha
  !>               device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>     x         device pointer pointing to the first vector (x_1).
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i.
  !>     @param[in]
  !>     stride_x  [rocblas_stride]
  !>               stride from the start of one vector (x_i) and the next one (x_i+1).
  !>     @param[in]
  !>     y         device pointer pointing to the first vector (y_1).
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of each y_i.
  !>     @param[in]
  !>     stride_y  [rocblas_stride]
  !>               stride from the start of one vector (y_i) and the next one (y_i+1).
  !>     @param[inout]
  !>     AP        device pointer storing the packed version of the specified triangular portion of
  !>               each symmetric matrix A_i. Points to the first A_1.
  !>               if uplo == rocblas_fill_upper:
  !>                 The upper triangular portion of each symmetric matrix A_i is supplied.
  !>                 The matrix is compacted so that AP contains the triangular portion column-by-column
  !>                 so that:
  !>                 AP(0) = A(0,0)
  !>                 AP(1) = A(0,1)
  !>                 AP(2) = A(1,1), etc.
  !>                     Ex: (rocblas_fill_upper; n = 4)
  !>                         1 2 4 7
  !>                         2 3 5 8   -----> [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
  !>                         4 5 6 9
  !>                         7 8 9 0
  !>             if uplo == rocblas_fill_lower:
  !>                 The lower triangular portion of each symmetric matrix A_i is supplied.
  !>                 The matrix is compacted so that AP contains the triangular portion column-by-column
  !>                 so that:
  !>                 AP(0) = A(0,0)
  !>                 AP(1) = A(1,0)
  !>                 AP(n) = A(2,1), etc.
  !>                     Ex: (rocblas_fill_lower; n = 4)
  !>                         1 2 3 4
  !>                         2 5 6 7    -----> [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
  !>                         3 6 8 9
  !>                         4 7 9 0
  !>     @param[in]
  !>     stride_A    [rocblas_stride]
  !>                 stride from the start of one (A_i) and the next (A_i+1)
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch.
  !>     
    function rocblas_dspr2_strided_batched(handle,uplo,n,alpha,x,incx,stride_x,y,incy,stride_y,AP,stride_A,batch_count) bind(c, name="rocblas_dspr2_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dspr2_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stride_y
      type(c_ptr),value :: AP
      integer(c_int64_t),value :: stride_A
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_ssyr(handle,uplo,n,alpha,x,incx,A,lda) bind(c, name="rocblas_ssyr")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ssyr
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  
    function rocblas_dsyr(handle,uplo,n,alpha,x,incx,A,lda) bind(c, name="rocblas_dsyr")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dsyr
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  
    function rocblas_csyr(handle,uplo,n,alpha,x,incx,A,lda) bind(c, name="rocblas_csyr")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_csyr
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xSYR performs the matrix-vector operations
  !> 
  !>         A := A + alphaxxT
  !> 
  !>     where alpha is a scalar, x is a vector, and A is an
  !>     n by n symmetric matrix.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               specifies whether the upper 'rocblas_fill_upper' or lower 'rocblas_fill_lower'
  !>               if rocblas_fill_upper, the lower part of A is not referenced
  !>               if rocblas_fill_lower, the upper part of A is not referenced
  !> 
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of rows and columns of matrix A.
  !>     @param[in]
  !>     alpha
  !>               device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>     x         device pointer storing vector x.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of x.
  !>     @param[inout]
  !>     A         device pointer storing matrix A.
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of A.
  !> 
  !>     
    function rocblas_zsyr(handle,uplo,n,alpha,x,incx,A,lda) bind(c, name="rocblas_zsyr")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zsyr
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  
    function rocblas_ssyr_batched(handle,uplo,n,alpha,x,incx,A,lda,batch_count) bind(c, name="rocblas_ssyr_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ssyr_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dsyr_batched(handle,uplo,n,alpha,x,incx,A,lda,batch_count) bind(c, name="rocblas_dsyr_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dsyr_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_csyr_batched(handle,uplo,n,alpha,x,incx,A,lda,batch_count) bind(c, name="rocblas_csyr_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_csyr_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xSYR_batched performs a batch of matrix-vector operations
  !> 
  !>         A[i] := A[i] + alphax[i]x[i]T
  !> 
  !>     where alpha is a scalar, x is an array of vectors, and A is an array of
  !>     n by n symmetric matrices, for i = 1 , ... , batch_count
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               specifies whether the upper 'rocblas_fill_upper' or lower 'rocblas_fill_lower'
  !>               if rocblas_fill_upper, the lower part of A is not referenced
  !>               if rocblas_fill_lower, the upper part of A is not referenced
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of rows and columns of matrix A.
  !>     @param[in]
  !>     alpha
  !>               device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>     x         device array of device pointers storing each vector x_i.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i.
  !>     @param[inout]
  !>     A         device array of device pointers storing each matrix A_i.
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of each A_i.
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch
  !> 
  !>     
    function rocblas_zsyr_batched(handle,uplo,n,alpha,x,incx,A,lda,batch_count) bind(c, name="rocblas_zsyr_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zsyr_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_ssyr_strided_batched(handle,uplo,n,alpha,x,incx,stridex,A,lda,strideA,batch_count) bind(c, name="rocblas_ssyr_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ssyr_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dsyr_strided_batched(handle,uplo,n,alpha,x,incx,stridex,A,lda,strideA,batch_count) bind(c, name="rocblas_dsyr_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dsyr_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_csyr_strided_batched(handle,uplo,n,alpha,x,incx,stridex,A,lda,strideA,batch_count) bind(c, name="rocblas_csyr_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_csyr_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xSYR_strided_batched performs the matrix-vector operations
  !> 
  !>         A[i] := A[i] + alphax[i]x[i]T
  !> 
  !>     where alpha is a scalar, vectors, and A is an array of
  !>     n by n symmetric matrices, for i = 1 , ... , batch_count
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               specifies whether the upper 'rocblas_fill_upper' or lower 'rocblas_fill_lower'
  !>               if rocblas_fill_upper, the lower part of A is not referenced
  !>               if rocblas_fill_lower, the upper part of A is not referenced
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of rows and columns of each matrix A.
  !>     @param[in]
  !>     alpha
  !>               device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>     x         device pointer to the first vector x_1.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i.
  !>     @param[in]
  !>     stridex   [rocblas_stride]
  !>               specifies the pointer increment between vectors (x_i) and (x_i+1).
  !>     @param[inout]
  !>     A         device pointer to the first matrix A_1.
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of each A_i.
  !>     @param[in]
  !>     strideA   [rocblas_stride]
  !>               stride from the start of one matrix (A_i) and the next one (A_i+1)
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>               number of instances in the batch
  !> 
  !>     
    function rocblas_zsyr_strided_batched(handle,uplo,n,alpha,x,incx,stridex,A,lda,strideA,batch_count) bind(c, name="rocblas_zsyr_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zsyr_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_ssyr2(handle,uplo,n,alpha,x,incx,y,incy,A,lda) bind(c, name="rocblas_ssyr2")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ssyr2
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  
    function rocblas_dsyr2(handle,uplo,n,alpha,x,incx,y,incy,A,lda) bind(c, name="rocblas_dsyr2")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dsyr2
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  
    function rocblas_csyr2(handle,uplo,n,alpha,x,incx,y,incy,A,lda) bind(c, name="rocblas_csyr2")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_csyr2
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xSYR2 performs the matrix-vector operations
  !> 
  !>         A := A + alphaxyT + alphayxT
  !> 
  !>     where alpha is a scalar, x and y are vectors, and A is an
  !>     n by n symmetric matrix.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               specifies whether the upper 'rocblas_fill_upper' or lower 'rocblas_fill_lower'
  !>               if rocblas_fill_upper, the lower part of A is not referenced
  !>               if rocblas_fill_lower, the upper part of A is not referenced
  !> 
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of rows and columns of matrix A.
  !>     @param[in]
  !>     alpha
  !>               device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>     x         device pointer storing vector x.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of x.
  !>     @param[in]
  !>     y         device pointer storing vector y.
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of y.
  !>     @param[inout]
  !>     A         device pointer storing matrix A.
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of A.
  !> 
  !>     
    function rocblas_zsyr2(handle,uplo,n,alpha,x,incx,y,incy,A,lda) bind(c, name="rocblas_zsyr2")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zsyr2
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  
    function rocblas_ssyr2_batched(handle,uplo,n,alpha,x,incx,y,incy,A,lda,batch_count) bind(c, name="rocblas_ssyr2_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ssyr2_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dsyr2_batched(handle,uplo,n,alpha,x,incx,y,incy,A,lda,batch_count) bind(c, name="rocblas_dsyr2_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dsyr2_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_csyr2_batched(handle,uplo,n,alpha,x,incx,y,incy,A,lda,batch_count) bind(c, name="rocblas_csyr2_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_csyr2_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xSYR2_BATCHED performs a batch of matrix-vector operations
  !> 
  !>         A[i] := A[i] + alphax[i]y[i]T + alphay[i]x[i]T
  !> 
  !>     where alpha is a scalar, x[i] and y[i] are vectors, and A[i] is a
  !>     n by n symmetric matrix, for i = 1 , ... , batch_count
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               specifies whether the upper 'rocblas_fill_upper' or lower 'rocblas_fill_lower'
  !>               if rocblas_fill_upper, the lower part of A is not referenced
  !>               if rocblas_fill_lower, the upper part of A is not referenced
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of rows and columns of matrix A.
  !>     @param[in]
  !>     alpha
  !>               device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>     x         device array of device pointers storing each vector x_i.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i.
  !>     @param[in]
  !>     y         device array of device pointers storing each vector y_i.
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of each y_i.
  !>     @param[inout]
  !>     A         device array of device pointers storing each matrix A_i.
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of each A_i.
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch
  !> 
  !>     
    function rocblas_zsyr2_batched(handle,uplo,n,alpha,x,incx,y,incy,A,lda,batch_count) bind(c, name="rocblas_zsyr2_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zsyr2_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: y
      integer(c_int),value :: incy
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_ssyr2_strided_batched(handle,uplo,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batch_count) bind(c, name="rocblas_ssyr2_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ssyr2_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dsyr2_strided_batched(handle,uplo,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batch_count) bind(c, name="rocblas_dsyr2_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dsyr2_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_csyr2_strided_batched(handle,uplo,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batch_count) bind(c, name="rocblas_csyr2_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_csyr2_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 2 API
  !> 
  !>     \details
  !>     xSYR2_STRIDED_BATCHED the matrix-vector operations
  !> 
  !>         A[i] := A[i] + alphax[i]y[i]T + alphay[i]x[i]T
  !> 
  !>     where alpha is a scalar, x[i] and y[i] are vectors, and A[i] is a
  !>     n by n symmetric matrices, for i = 1 , ... , batch_count
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               specifies whether the upper 'rocblas_fill_upper' or lower 'rocblas_fill_lower'
  !>               if rocblas_fill_upper, the lower part of A is not referenced
  !>               if rocblas_fill_lower, the upper part of A is not referenced
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               the number of rows and columns of each matrix A.
  !>     @param[in]
  !>     alpha
  !>               device pointer or host pointer to scalar alpha.
  !>     @param[in]
  !>     x         device pointer to the first vector x_1.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment for the elements of each x_i.
  !>     @param[in]
  !>     stridex   [rocblas_stride]
  !>               specifies the pointer increment between vectors (x_i) and (x_i+1).
  !>     @param[in]
  !>     y         device pointer to the first vector y_1.
  !>     @param[in]
  !>     incy      [rocblas_int]
  !>               specifies the increment for the elements of each y_i.
  !>     @param[in]
  !>     stridey   [rocblas_stride]
  !>               specifies the pointer increment between vectors (y_i) and (y_i+1).
  !>     @param[inout]
  !>     A         device pointer to the first matrix A_1.
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of each A_i.
  !>     @param[in]
  !>     strideA   [rocblas_stride]
  !>               stride from the start of one matrix (A_i) and the next one (A_i+1)
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>               number of instances in the batch
  !> 
  !>     
    function rocblas_zsyr2_strided_batched(handle,uplo,n,alpha,x,incx,stridex,y,incy,stridey,A,lda,strideA,batch_count) bind(c, name="rocblas_zsyr2_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zsyr2_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stridex
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      integer(c_int64_t),value :: stridey
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      integer(c_int),value :: batch_count
    end function

  !> 
  !>   ===========================================================================
  !>      level 3 BLAS
  !>   ===========================================================================
  !>  
    function rocblas_chemm(handle,side,uplo,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="rocblas_chemm")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_chemm
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      complex(c_float_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  !> ! \brief BLAS Level 3 API
  !> 
  !>     \details
  !> 
  !>     hemm performs one of the matrix-matrix operations:
  !> 
  !>     C := alphaAB + betaC if side == rocblas_side_left,
  !>     C := alphaBA + betaC if side == rocblas_side_right,
  !> 
  !>     where alpha and beta are scalars, B and C are m by n matrices, and
  !>     A is a Hermitian matrix stored as either upper or lower.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     side  [rocblas_side]
  !>             rocblas_side_left:      C := alphaAB + betaC
  !>             rocblas_side_right:     C := alphaBA + betaC
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  A is an upper triangular matrix
  !>             rocblas_fill_lower:  A is a  lower triangular matrix
  !> 
  !>     @param[in]
  !>     m       [rocblas_int]
  !>             m specifies the number of rows of B and C. m >= 0.
  !> 
  !>     @param[in]
  !>     n       [rocblas_int]
  !>             n specifies the number of columns of B and C. n >= 0.
  !> 
  !>     @param[in]
  !>     alpha
  !>             alpha specifies the scalar alpha. When alpha is
  !>             zero then A and B are not referenced.
  !> 
  !>     @param[in]
  !>     A       pointer storing matrix A on the GPU.
  !>             A is m by m if side == rocblas_side_left
  !>             A is n by n if side == rocblas_side_right
  !>             Only the upperlower triangular part is accessed.
  !>             The imaginary component of the diagonal elements is not used.
  !> 
  !>     @param[in]
  !>     lda     [rocblas_int]
  !>             lda specifies the first dimension of A.
  !>             if side = rocblas_side_left,  lda >= max( 1, m ),
  !>             otherwise lda >= max( 1, n ).
  !> 
  !>     @param[in]
  !>     B       pointer storing matrix B on the GPU.
  !>             Matrix dimension is m by n
  !> 
  !>     @param[in]
  !>     ldb     [rocblas_int]
  !>             ldb specifies the first dimension of B. ldb >= max( 1, m )
  !> 
  !>     @param[in]
  !>     beta
  !>             beta specifies the scalar beta. When beta is
  !>             zero then C need not be set before entry.
  !> 
  !>     @param[in]
  !>     C       pointer storing matrix C on the GPU.
  !>             Matrix dimension is m by n
  !> 
  !>     @param[in]
  !>     ldc    [rocblas_int]
  !>            ldc specifies the first dimension of C. ldc >= max( 1, m )
  !> 
  !>     
    function rocblas_zhemm(handle,side,uplo,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="rocblas_zhemm")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zhemm
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      complex(c_double_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
    function rocblas_chemm_batched(handle,side,uplo,m,n,alpha,A,lda,B,ldb,beta,C,ldc,batch_count) bind(c, name="rocblas_chemm_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_chemm_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      complex(c_float_complex) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 3 API
  !> 
  !>     \details
  !> 
  !>     hemm_batched performs a batch of the matrix-matrix operations:
  !> 
  !>     C_i := alphaA_iB_i + betaC_i if side == rocblas_side_left,
  !>     C_i := alphaB_iA_i + betaC_i if side == rocblas_side_right,
  !> 
  !>     where alpha and beta are scalars, B_i and C_i are m by n matrices, and
  !>     A_i is a Hermitian matrix stored as either upper or lower.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     side  [rocblas_side]
  !>             rocblas_side_left:      C_i := alphaA_iB_i + betaC_i
  !>             rocblas_side_right:     C_i := alphaB_iA_i + betaC_i
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  A_i is an upper triangular matrix
  !>             rocblas_fill_lower:  A_i is a  lower triangular matrix
  !> 
  !>     @param[in]
  !>     m       [rocblas_int]
  !>             m specifies the number of rows of B_i and C_i. m >= 0.
  !> 
  !>     @param[in]
  !>     n       [rocblas_int]
  !>             n specifies the number of columns of B_i and C_i. n >= 0.
  !> 
  !>     @param[in]
  !>     alpha
  !>             alpha specifies the scalar alpha. When alpha is
  !>             zero then A_i and B_i are not referenced.
  !> 
  !>     @param[in]
  !>     A       device array of device pointers storing each matrix A_i on the GPU.
  !>             A_i is m by m if side == rocblas_side_left
  !>             A_i is n by n if side == rocblas_side_right
  !>             Only the upperlower triangular part is accessed.
  !>             The imaginary component of the diagonal elements is not used.
  !> 
  !>     @param[in]
  !>     lda     [rocblas_int]
  !>             lda specifies the first dimension of A_i.
  !>             if side = rocblas_side_left,  lda >= max( 1, m ),
  !>             otherwise lda >= max( 1, n ).
  !> 
  !>     @param[in]
  !>     B       device array of device pointers storing each matrix B_i on the GPU.
  !>             Matrix dimension is m by n
  !> 
  !>     @param[in]
  !>     ldb     [rocblas_int]
  !>             ldb specifies the first dimension of B_i. ldb >= max( 1, m )
  !> 
  !>     @param[in]
  !>     beta
  !>             beta specifies the scalar beta. When beta is
  !>             zero then C_i need not be set before entry.
  !> 
  !>     @param[in]
  !>     C       device array of device pointers storing each matrix C_i on the GPU.
  !>             Matrix dimension is m by n
  !> 
  !>     @param[in]
  !>     ldc    [rocblas_int]
  !>            ldc specifies the first dimension of C_i. ldc >= max( 1, m )
  !> 
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch.
  !> 
  !>     
    function rocblas_zhemm_batched(handle,side,uplo,m,n,alpha,A,lda,B,ldb,beta,C,ldc,batch_count) bind(c, name="rocblas_zhemm_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zhemm_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      complex(c_double_complex) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_chemm_strided_batched(handle,side,uplo,m,n,alpha,A,lda,stride_A,B,ldb,stride_B,beta,C,ldc,stride_C,batch_count) bind(c, name="rocblas_chemm_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_chemm_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int64_t),value :: stride_B
      complex(c_float_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_C
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 3 API
  !> 
  !>     \details
  !> 
  !>     hemm_strided_batched performs a batch of the matrix-matrix operations:
  !> 
  !>     C_i := alphaA_iB_i + betaC_i if side == rocblas_side_left,
  !>     C_i := alphaB_iA_i + betaC_i if side == rocblas_side_right,
  !> 
  !>     where alpha and beta are scalars, B_i and C_i are m by n matrices, and
  !>     A_i is a Hermitian matrix stored as either upper or lower.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     side  [rocblas_side]
  !>             rocblas_side_left:      C_i := alphaA_iB_i + betaC_i
  !>             rocblas_side_right:     C_i := alphaB_iA_i + betaC_i
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  A_i is an upper triangular matrix
  !>             rocblas_fill_lower:  A_i is a  lower triangular matrix
  !> 
  !>     @param[in]
  !>     m       [rocblas_int]
  !>             m specifies the number of rows of B_i and C_i. m >= 0.
  !> 
  !>     @param[in]
  !>     n       [rocblas_int]
  !>             n specifies the number of columns of B_i and C_i. n >= 0.
  !> 
  !>     @param[in]
  !>     alpha
  !>             alpha specifies the scalar alpha. When alpha is
  !>             zero then A_i and B_i are not referenced.
  !> 
  !>     @param[in]
  !>     A       device pointer to first matrix A_1
  !>             A_i is m by m if side == rocblas_side_left
  !>             A_i is n by n if side == rocblas_side_right
  !>             Only the upperlower triangular part is accessed.
  !>             The imaginary component of the diagonal elements is not used.
  !> 
  !>     @param[in]
  !>     lda     [rocblas_int]
  !>             lda specifies the first dimension of A_i.
  !>             if side = rocblas_side_left,  lda >= max( 1, m ),
  !>             otherwise lda >= max( 1, n ).
  !> 
  !>     @param[in]
  !>     stride_A  [rocblas_stride]
  !>               stride from the start of one matrix (A_i) and the next one (A_i+1)
  !> 
  !>     @param[in]
  !>     B       device pointer to first matrix B_1 of dimension (ldb, n) on the GPU
  !> 
  !>     @param[in]
  !>     ldb     [rocblas_int]
  !>             ldb specifies the first dimension of B_i.
  !>             if side = rocblas_operation_none,  ldb >= max( 1, m ),
  !>             otherwise ldb >= max( 1, n ).
  !> 
  !>     @param[in]
  !>     stride_B  [rocblas_stride]
  !>               stride from the start of one matrix (B_i) and the next one (B_i+1)
  !> 
  !>     @param[in]
  !>     beta
  !>             beta specifies the scalar beta. When beta is
  !>             zero then C need not be set before entry.
  !> 
  !>     @param[in]
  !>     C        device pointer to first matrix C_1 of dimension (ldc, n) on the GPU.
  !> 
  !>     @param[in]
  !>     ldc    [rocblas_int]
  !>            ldc specifies the first dimension of C. ldc >= max( 1, m )
  !> 
  !>     @param[inout]
  !>     stride_C  [rocblas_stride]
  !>               stride from the start of one matrix (C_i) and the next one (C_i+1)
  !> 
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch
  !> 
  !>     
    function rocblas_zhemm_strided_batched(handle,side,uplo,m,n,alpha,A,lda,stride_A,B,ldb,stride_B,beta,C,ldc,stride_C,batch_count) bind(c, name="rocblas_zhemm_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zhemm_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int64_t),value :: stride_B
      complex(c_double_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_C
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_cherk(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc) bind(c, name="rocblas_cherk")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cherk
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  !> ! \brief BLAS Level 3 API
  !> 
  !>     \details
  !> 
  !>     herk performs one of the matrix-matrix operations for a Hermitian rank-k update
  !> 
  !>     C := alphaop( A )op( A )^H + betaC
  !> 
  !>     where  alpha and beta are scalars, op(A) is an n by k matrix, and
  !>     C is a n x n Hermitian matrix stored as either upper or lower.
  !> 
  !>         op( A ) = A, and A is n by k if transA == rocblas_operation_none
  !>         op( A ) = A^H and A is k by n if transA == rocblas_operation_conjugate_transpose
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  C is an upper triangular matrix
  !>             rocblas_fill_lower:  C is a  lower triangular matrix
  !> 
  !>     @param[in]
  !>     transA  [rocblas_operation]
  !>             rocblas_operation_conjugate_transpose:  op(A) = A^H
  !>             rocblas_operation_none:                 op(A) = A
  !> 
  !>     @param[in]
  !>     n       [rocblas_int]
  !>             n specifies the number of rows and columns of C. n >= 0.
  !> 
  !>     @param[in]
  !>     k       [rocblas_int]
  !>             k specifies the number of columns of op(A). k >= 0.
  !> 
  !>     @param[in]
  !>     alpha
  !>             alpha specifies the scalar alpha. When alpha is
  !>             zero then A is not referenced and A need not be set before
  !>             entry.
  !> 
  !>     @param[in]
  !>     A       pointer storing matrix A on the GPU.
  !>             Martrix dimension is ( lda, k ) when if transA = rocblas_operation_none, otherwise (lda, n)
  !>             only the upperlower triangular part is accessed.
  !> 
  !>     @param[in]
  !>     lda     [rocblas_int]
  !>             lda specifies the first dimension of A.
  !>             if transA = rocblas_operation_none,  lda >= max( 1, n ),
  !>             otherwise lda >= max( 1, k ).
  !> 
  !>     @param[in]
  !>     beta
  !>             beta specifies the scalar beta. When beta is
  !>             zero then C need not be set before entry.
  !> 
  !>     @param[in]
  !>     C       pointer storing matrix C on the GPU.
  !>             The imaginary component of the diagonal elements are not used but are set to zero unless quick return.
  !> 
  !>     @param[in]
  !>     ldc    [rocblas_int]
  !>            ldc specifies the first dimension of C. ldc >= max( 1, n ).
  !> 
  !>     
    function rocblas_zherk(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc) bind(c, name="rocblas_zherk")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zherk
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
    function rocblas_cherk_batched(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc,batch_count) bind(c, name="rocblas_cherk_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cherk_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      real(c_float) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 3 API
  !> 
  !>     \details
  !> 
  !>     herk_batched performs a batch of the matrix-matrix operations for a Hermitian rank-k update
  !> 
  !>     C_i := alphaop( A_i )op( A_i )^H + betaC_i
  !> 
  !>     where  alpha and beta are scalars, op(A) is an n by k matrix, and
  !>     C_i is a n x n Hermitian matrix stored as either upper or lower.
  !> 
  !>         op( A_i ) = A_i, and A_i is n by k if transA == rocblas_operation_none
  !>         op( A_i ) = A_i^H and A_i is k by n if transA == rocblas_operation_conjugate_transpose
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  C_i is an upper triangular matrix
  !>             rocblas_fill_lower:  C_i is a  lower triangular matrix
  !> 
  !>     @param[in]
  !>     transA  [rocblas_operation]
  !>             rocblas_operation_conjugate_transpose: op(A) = A^H
  !>             rocblas_operation_none:                op(A) = A
  !> 
  !>     @param[in]
  !>     n       [rocblas_int]
  !>             n specifies the number of rows and columns of C_i. n >= 0.
  !> 
  !>     @param[in]
  !>     k       [rocblas_int]
  !>             k specifies the number of columns of op(A). k >= 0.
  !> 
  !>     @param[in]
  !>     alpha
  !>             alpha specifies the scalar alpha. When alpha is
  !>             zero then A is not referenced and A need not be set before
  !>             entry.
  !> 
  !>     @param[in]
  !>     A       device array of device pointers storing each matrix_i A of dimension (lda, k)
  !>             when transA is rocblas_operation_none, otherwise of dimension (lda, n)
  !> 
  !>     @param[in]
  !>     lda     [rocblas_int]
  !>             lda specifies the first dimension of A_i.
  !>             if transA = rocblas_operation_none,  lda >= max( 1, n ),
  !>             otherwise lda >= max( 1, k ).
  !> 
  !>     @param[in]
  !>     beta
  !>             beta specifies the scalar beta. When beta is
  !>             zero then C need not be set before entry.
  !> 
  !>     @param[in]
  !>     C       device array of device pointers storing each matrix C_i on the GPU.
  !>             The imaginary component of the diagonal elements are not used but are set to zero unless quick return.
  !> 
  !>     @param[in]
  !>     ldc    [rocblas_int]
  !>            ldc specifies the first dimension of C. ldc >= max( 1, n ).
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch.
  !> 
  !>     
    function rocblas_zherk_batched(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc,batch_count) bind(c, name="rocblas_zherk_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zherk_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      real(c_double) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_cherk_strided_batched(handle,uplo,transA,n,k,alpha,A,lda,stride_A,beta,C,ldc,stride_C,batch_count) bind(c, name="rocblas_cherk_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cherk_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      real(c_float) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_C
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 3 API
  !> 
  !>     \details
  !> 
  !>     herk_strided_batched performs a batch of the matrix-matrix operations for a Hermitian rank-k update
  !> 
  !>     C_i := alphaop( A_i )op( A_i )^H + betaC_i
  !> 
  !>     where  alpha and beta are scalars, op(A) is an n by k matrix, and
  !>     C_i is a n x n Hermitian matrix stored as either upper or lower.
  !> 
  !>         op( A_i ) = A_i, and A_i is n by k if transA == rocblas_operation_none
  !>         op( A_i ) = A_i^H and A_i is k by n if transA == rocblas_operation_conjugate_transpose
  !> 
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  C_i is an upper triangular matrix
  !>             rocblas_fill_lower:  C_i is a  lower triangular matrix
  !> 
  !>     @param[in]
  !>     transA  [rocblas_operation]
  !>             rocblas_operation_conjugate_transpose: op(A) = A^H
  !>             rocblas_operation_none:                op(A) = A
  !> 
  !>     @param[in]
  !>     n       [rocblas_int]
  !>             n specifies the number of rows and columns of C_i. n >= 0.
  !> 
  !>     @param[in]
  !>     k       [rocblas_int]
  !>             k specifies the number of columns of op(A). k >= 0.
  !> 
  !>     @param[in]
  !>     alpha
  !>             alpha specifies the scalar alpha. When alpha is
  !>             zero then A is not referenced and A need not be set before
  !>             entry.
  !> 
  !>     @param[in]
  !>     A       Device pointer to the first matrix A_1 on the GPU of dimension (lda, k)
  !>             when transA is rocblas_operation_none, otherwise of dimension (lda, n)
  !> 
  !>     @param[in]
  !>     lda     [rocblas_int]
  !>             lda specifies the first dimension of A_i.
  !>             if transA = rocblas_operation_none,  lda >= max( 1, n ),
  !>             otherwise lda >= max( 1, k ).
  !> 
  !>     @param[in]
  !>     stride_A  [rocblas_stride]
  !>               stride from the start of one matrix (A_i) and the next one (A_i+1)
  !> 
  !>     @param[in]
  !>     beta
  !>             beta specifies the scalar beta. When beta is
  !>             zero then C need not be set before entry.
  !> 
  !>     @param[in]
  !>     C       Device pointer to the first matrix C_1 on the GPU.
  !>             The imaginary component of the diagonal elements are not used but are set to zero unless quick return.
  !> 
  !>     @param[in]
  !>     ldc    [rocblas_int]
  !>            ldc specifies the first dimension of C. ldc >= max( 1, n ).
  !> 
  !>     @param[inout]
  !>     stride_C  [rocblas_stride]
  !>               stride from the start of one matrix (C_i) and the next one (C_i+1)
  !> 
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch.
  !> 
  !>     
    function rocblas_zherk_strided_batched(handle,uplo,transA,n,k,alpha,A,lda,stride_A,beta,C,ldc,stride_C,batch_count) bind(c, name="rocblas_zherk_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zherk_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      real(c_double) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_C
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_cher2k(handle,uplo,trans,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="rocblas_cher2k")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cher2k
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_float) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  !> ! \brief BLAS Level 3 API
  !> 
  !>     \details
  !> 
  !>     her2k performs one of the matrix-matrix operations for a Hermitian rank-2k update
  !> 
  !>     C := alphaop( A )op( B )^H + conj(alpha)op( B )op( A )^H + betaC
  !> 
  !>     where  alpha and beta are scalars, op(A) and op(B) are n by k matrices, and
  !>     C is a n x n Hermitian matrix stored as either upper or lower.
  !> 
  !>         op( A ) = A, op( B ) = B, and A and B are n by k if trans == rocblas_operation_none
  !>         op( A ) = A^H, op( B ) = B^H,  and A and B are k by n if trans == rocblas_operation_conjugate_transpose
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  C is an upper triangular matrix
  !>             rocblas_fill_lower:  C is a  lower triangular matrix
  !> 
  !>     @param[in]
  !>     trans  [rocblas_operation]
  !>             rocblas_operation_conjugate_transpose:  op( A ) = A^H, op( B ) = B^H
  !>             rocblas_operation_none:                 op( A ) = A, op( B ) = B
  !> 
  !>     @param[in]
  !>     n       [rocblas_int]
  !>             n specifies the number of rows and columns of C. n >= 0.
  !> 
  !>     @param[in]
  !>     k       [rocblas_int]
  !>             k specifies the number of columns of op(A). k >= 0.
  !> 
  !>     @param[in]
  !>     alpha
  !>             alpha specifies the scalar alpha. When alpha is
  !>             zero then A is not referenced and A need not be set before
  !>             entry.
  !> 
  !>     @param[in]
  !>     A       pointer storing matrix A on the GPU.
  !>             Martrix dimension is ( lda, k ) when if trans = rocblas_operation_none, otherwise (lda, n)
  !>             only the upperlower triangular part is accessed.
  !> 
  !>     @param[in]
  !>     lda     [rocblas_int]
  !>             lda specifies the first dimension of A.
  !>             if trans = rocblas_operation_none,  lda >= max( 1, n ),
  !>             otherwise lda >= max( 1, k ).
  !>     @param[in]
  !>     B       pointer storing matrix B on the GPU.
  !>             Martrix dimension is ( ldb, k ) when if trans = rocblas_operation_none, otherwise (ldb, n)
  !>             only the upperlower triangular part is accessed.
  !> 
  !>     @param[in]
  !>     ldb     [rocblas_int]
  !>             ldb specifies the first dimension of B.
  !>             if trans = rocblas_operation_none,  ldb >= max( 1, n ),
  !>             otherwise ldb >= max( 1, k ).
  !>     @param[in]
  !>     beta
  !>             beta specifies the scalar beta. When beta is
  !>             zero then C need not be set before entry.
  !> 
  !>     @param[in]
  !>     C       pointer storing matrix C on the GPU.
  !>             The imaginary component of the diagonal elements are not used but are set to zero unless quick return.
  !> 
  !>     @param[in]
  !>     ldc    [rocblas_int]
  !>            ldc specifies the first dimension of C. ldc >= max( 1, n ).
  !> 
  !>     
    function rocblas_zher2k(handle,uplo,trans,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="rocblas_zher2k")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zher2k
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_double) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
    function rocblas_cher2k_batched(handle,uplo,trans,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batch_count) bind(c, name="rocblas_cher2k_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cher2k_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      real(c_float) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 3 API
  !> 
  !>     \details
  !> 
  !>     her2k_batched performs a batch of the matrix-matrix operations for a Hermitian rank-2k update
  !> 
  !>     C_i := alphaop( A_i )op( B_i )^H + conj(alpha)op( B_i )op( A_i )^H + betaC_i
  !> 
  !>     where  alpha and beta are scalars, op(A_i) and op(B_i) are n by k matrices, and
  !>     C_i is a n x n Hermitian matrix stored as either upper or lower.
  !> 
  !>         op( A_i ) = A_i, op( B_i ) = B_i, and A_i and B_i are n by k if trans == rocblas_operation_none
  !>         op( A_i ) = A_i^H, op( B_i ) = B_i^H,  and A_i and B_i are k by n if trans == rocblas_operation_conjugate_transpose
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  C_i is an upper triangular matrix
  !>             rocblas_fill_lower:  C_i is a  lower triangular matrix
  !> 
  !>     @param[in]
  !>     trans  [rocblas_operation]
  !>             rocblas_operation_conjugate_transpose: op(A) = A^H
  !>             rocblas_operation_none:                op(A) = A
  !> 
  !>     @param[in]
  !>     n       [rocblas_int]
  !>             n specifies the number of rows and columns of C_i. n >= 0.
  !> 
  !>     @param[in]
  !>     k       [rocblas_int]
  !>             k specifies the number of columns of op(A). k >= 0.
  !> 
  !>     @param[in]
  !>     alpha
  !>             alpha specifies the scalar alpha. When alpha is
  !>             zero then A is not referenced and A need not be set before
  !>             entry.
  !> 
  !>     @param[in]
  !>     A       device array of device pointers storing each matrix_i A of dimension (lda, k)
  !>             when trans is rocblas_operation_none, otherwise of dimension (lda, n)
  !> 
  !>     @param[in]
  !>     lda     [rocblas_int]
  !>             lda specifies the first dimension of A_i.
  !>             if trans = rocblas_operation_none,  lda >= max( 1, n ),
  !>             otherwise lda >= max( 1, k ).
  !>     @param[in]
  !>     B       device array of device pointers storing each matrix_i B of dimension (ldb, k)
  !>             when trans is rocblas_operation_none, otherwise of dimension (ldb, n)
  !> 
  !>     @param[in]
  !>     ldb     [rocblas_int]
  !>             ldb specifies the first dimension of B_i.
  !>             if trans = rocblas_operation_none,  ldb >= max( 1, n ),
  !>             otherwise ldb >= max( 1, k ).
  !>     @param[in]
  !>     beta
  !>             beta specifies the scalar beta. When beta is
  !>             zero then C need not be set before entry.
  !> 
  !>     @param[in]
  !>     C       device array of device pointers storing each matrix C_i on the GPU.
  !>             The imaginary component of the diagonal elements are not used but are set to zero unless quick return.
  !> 
  !>     @param[in]
  !>     ldc    [rocblas_int]
  !>            ldc specifies the first dimension of C. ldc >= max( 1, n ).
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch.
  !> 
  !>     
    function rocblas_zher2k_batched(handle,uplo,trans,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batch_count) bind(c, name="rocblas_zher2k_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zher2k_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      real(c_double) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_cher2k_strided_batched(handle,uplo,trans,n,k,alpha,A,lda,stride_A,B,ldb,stride_B,beta,C,ldc,stride_C,batch_count) bind(c, name="rocblas_cher2k_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cher2k_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int64_t),value :: stride_B
      real(c_float) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_C
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 3 API
  !> 
  !>     \details
  !> 
  !>     her2k_strided_batched performs a batch of the matrix-matrix operations for a Hermitian rank-2k update
  !> 
  !>     C_i := alphaop( A_i )op( B_i )^H + conj(alpha)op( B_i )op( A_i )^H + betaC_i
  !> 
  !>     where  alpha and beta are scalars, op(A_i) and op(B_i) are n by k matrices, and
  !>     C_i is a n x n Hermitian matrix stored as either upper or lower.
  !> 
  !>         op( A_i ) = A_i, op( B_i ) = B_i, and A_i and B_i are n by k if trans == rocblas_operation_none
  !>         op( A_i ) = A_i^H, op( B_i ) = B_i^H,  and A_i and B_i are k by n if trans == rocblas_operation_conjugate_transpose
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  C_i is an upper triangular matrix
  !>             rocblas_fill_lower:  C_i is a  lower triangular matrix
  !> 
  !>     @param[in]
  !>     trans  [rocblas_operation]
  !>             rocblas_operation_conjugate_transpose: op( A_i ) = A_i^H, op( B_i ) = B_i^H
  !>             rocblas_operation_none:                op( A_i ) = A_i, op( B_i ) = B_i
  !> 
  !>     @param[in]
  !>     n       [rocblas_int]
  !>             n specifies the number of rows and columns of C_i. n >= 0.
  !> 
  !>     @param[in]
  !>     k       [rocblas_int]
  !>             k specifies the number of columns of op(A). k >= 0.
  !> 
  !>     @param[in]
  !>     alpha
  !>             alpha specifies the scalar alpha. When alpha is
  !>             zero then A is not referenced and A need not be set before
  !>             entry.
  !> 
  !>     @param[in]
  !>     A       Device pointer to the first matrix A_1 on the GPU of dimension (lda, k)
  !>             when trans is rocblas_operation_none, otherwise of dimension (lda, n)
  !> 
  !>     @param[in]
  !>     lda     [rocblas_int]
  !>             lda specifies the first dimension of A_i.
  !>             if trans = rocblas_operation_none,  lda >= max( 1, n ),
  !>             otherwise lda >= max( 1, k ).
  !> 
  !>     @param[in]
  !>     stride_A  [rocblas_stride]
  !>               stride from the start of one matrix (A_i) and the next one (A_i+1)
  !> 
  !>     @param[in]
  !>     B       Device pointer to the first matrix B_1 on the GPU of dimension (ldb, k)
  !>             when trans is rocblas_operation_none, otherwise of dimension (ldb, n)
  !> 
  !>     @param[in]
  !>     ldb     [rocblas_int]
  !>             ldb specifies the first dimension of B_i.
  !>             if trans = rocblas_operation_none,  ldb >= max( 1, n ),
  !>             otherwise ldb >= max( 1, k ).
  !> 
  !>     @param[in]
  !>     stride_B  [rocblas_stride]
  !>               stride from the start of one matrix (B_i) and the next one (B_i+1)
  !> 
  !>     @param[in]
  !>     beta
  !>             beta specifies the scalar beta. When beta is
  !>             zero then C need not be set before entry.
  !> 
  !>     @param[in]
  !>     C       Device pointer to the first matrix C_1 on the GPU.
  !>             The imaginary component of the diagonal elements are not used but are set to zero unless quick return.
  !> 
  !>     @param[in]
  !>     ldc    [rocblas_int]
  !>            ldc specifies the first dimension of C. ldc >= max( 1, n ).
  !> 
  !>     @param[inout]
  !>     stride_C  [rocblas_stride]
  !>               stride from the start of one matrix (C_i) and the next one (C_i+1)
  !> 
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch.
  !> 
  !>     
    function rocblas_zher2k_strided_batched(handle,uplo,trans,n,k,alpha,A,lda,stride_A,B,ldb,stride_B,beta,C,ldc,stride_C,batch_count) bind(c, name="rocblas_zher2k_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zher2k_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int64_t),value :: stride_B
      real(c_double) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_C
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_cherkx(handle,uplo,trans,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="rocblas_cherkx")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cherkx
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_float) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  !> ! \brief BLAS Level 3 API
  !> 
  !>     \details
  !> 
  !>     herkx performs one of the matrix-matrix operations for a Hermitian rank-k update
  !> 
  !>     C := alphaop( A )op( B )^H + betaC
  !> 
  !>     where  alpha and beta are scalars, op(A) and op(B) are n by k matrices, and
  !>     C is a n x n Hermitian matrix stored as either upper or lower.
  !>     This routine should only be used when the caller can guarantee that the result of op( A )op( B )^T will be Hermetian.
  !> 
  !> 
  !>         op( A ) = A, op( B ) = B, and A and B are n by k if trans == rocblas_operation_none
  !>         op( A ) = A^H, op( B ) = B^H,  and A and B are k by n if trans == rocblas_operation_conjugate_transpose
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  C is an upper triangular matrix
  !>             rocblas_fill_lower:  C is a  lower triangular matrix
  !> 
  !>     @param[in]
  !>     trans  [rocblas_operation]
  !>             rocblas_operation_conjugate_transpose:  op( A ) = A^H, op( B ) = B^H
  !>             rocblas_operation_none:                 op( A ) = A, op( B ) = B
  !> 
  !>     @param[in]
  !>     n       [rocblas_int]
  !>             n specifies the number of rows and columns of C. n >= 0.
  !> 
  !>     @param[in]
  !>     k       [rocblas_int]
  !>             k specifies the number of columns of op(A). k >= 0.
  !> 
  !>     @param[in]
  !>     alpha
  !>             alpha specifies the scalar alpha. When alpha is
  !>             zero then A is not referenced and A need not be set before
  !>             entry.
  !> 
  !>     @param[in]
  !>     A       pointer storing matrix A on the GPU.
  !>             Martrix dimension is ( lda, k ) when if trans = rocblas_operation_none, otherwise (lda, n)
  !>             only the upperlower triangular part is accessed.
  !> 
  !>     @param[in]
  !>     lda     [rocblas_int]
  !>             lda specifies the first dimension of A.
  !>             if trans = rocblas_operation_none,  lda >= max( 1, n ),
  !>             otherwise lda >= max( 1, k ).
  !>     @param[in]
  !>     B       pointer storing matrix B on the GPU.
  !>             Martrix dimension is ( ldb, k ) when if trans = rocblas_operation_none, otherwise (ldb, n)
  !>             only the upperlower triangular part is accessed.
  !> 
  !>     @param[in]
  !>     ldb     [rocblas_int]
  !>             ldb specifies the first dimension of B.
  !>             if trans = rocblas_operation_none,  ldb >= max( 1, n ),
  !>             otherwise ldb >= max( 1, k ).
  !>     @param[in]
  !>     beta
  !>             beta specifies the scalar beta. When beta is
  !>             zero then C need not be set before entry.
  !> 
  !>     @param[in]
  !>     C       pointer storing matrix C on the GPU.
  !>             The imaginary component of the diagonal elements are not used but are set to zero unless quick return.
  !> 
  !>     @param[in]
  !>     ldc    [rocblas_int]
  !>            ldc specifies the first dimension of C. ldc >= max( 1, n ).
  !> 
  !>     
    function rocblas_zherkx(handle,uplo,trans,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="rocblas_zherkx")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zherkx
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_double) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
    function rocblas_cherkx_batched(handle,uplo,trans,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batch_count) bind(c, name="rocblas_cherkx_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cherkx_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      real(c_float) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 3 API
  !> 
  !>     \details
  !> 
  !>     herkx_batched performs a batch of the matrix-matrix operations for a Hermitian rank-k update
  !> 
  !>     C_i := alphaop( A_i )op( B_i )^H + betaC_i
  !> 
  !>     where  alpha and beta are scalars, op(A_i) and op(B_i) are n by k matrices, and
  !>     C_i is a n x n Hermitian matrix stored as either upper or lower.
  !>     This routine should only be used when the caller can guarantee that the result of op( A )op( B )^T will be Hermetian.
  !> 
  !>         op( A_i ) = A_i, op( B_i ) = B_i, and A_i and B_i are n by k if trans == rocblas_operation_none
  !>         op( A_i ) = A_i^H, op( B_i ) = B_i^H,  and A_i and B_i are k by n if trans == rocblas_operation_conjugate_transpose
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  C_i is an upper triangular matrix
  !>             rocblas_fill_lower:  C_i is a  lower triangular matrix
  !> 
  !>     @param[in]
  !>     trans  [rocblas_operation]
  !>             rocblas_operation_conjugate_transpose: op(A) = A^H
  !>             rocblas_operation_none:                op(A) = A
  !> 
  !>     @param[in]
  !>     n       [rocblas_int]
  !>             n specifies the number of rows and columns of C_i. n >= 0.
  !> 
  !>     @param[in]
  !>     k       [rocblas_int]
  !>             k specifies the number of columns of op(A). k >= 0.
  !> 
  !>     @param[in]
  !>     alpha
  !>             alpha specifies the scalar alpha. When alpha is
  !>             zero then A is not referenced and A need not be set before
  !>             entry.
  !> 
  !>     @param[in]
  !>     A       device array of device pointers storing each matrix_i A of dimension (lda, k)
  !>             when trans is rocblas_operation_none, otherwise of dimension (lda, n)
  !> 
  !>     @param[in]
  !>     lda     [rocblas_int]
  !>             lda specifies the first dimension of A_i.
  !>             if trans = rocblas_operation_none,  lda >= max( 1, n ),
  !>             otherwise lda >= max( 1, k ).
  !> 
  !>     @param[in]
  !>     B       device array of device pointers storing each matrix_i B of dimension (ldb, k)
  !>             when trans is rocblas_operation_none, otherwise of dimension (ldb, n)
  !> 
  !>     @param[in]
  !>     ldb     [rocblas_int]
  !>             ldb specifies the first dimension of B_i.
  !>             if trans = rocblas_operation_none,  ldb >= max( 1, n ),
  !>             otherwise ldb >= max( 1, k ).
  !> 
  !>     @param[in]
  !>     beta
  !>             beta specifies the scalar beta. When beta is
  !>             zero then C need not be set before entry.
  !> 
  !>     @param[in]
  !>     C       device array of device pointers storing each matrix C_i on the GPU.
  !>             The imaginary component of the diagonal elements are not used but are set to zero unless quick return.
  !> 
  !>     @param[in]
  !>     ldc    [rocblas_int]
  !>            ldc specifies the first dimension of C. ldc >= max( 1, n ).
  !> 
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch.
  !> 
  !>     
    function rocblas_zherkx_batched(handle,uplo,trans,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batch_count) bind(c, name="rocblas_zherkx_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zherkx_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      real(c_double) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_cherkx_strided_batched(handle,uplo,trans,n,k,alpha,A,lda,stride_A,B,ldb,stride_B,beta,C,ldc,stride_C,batch_count) bind(c, name="rocblas_cherkx_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cherkx_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int64_t),value :: stride_B
      real(c_float) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_C
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 3 API
  !> 
  !>     \details
  !> 
  !>     herkx_strided_batched performs a batch of the matrix-matrix operations for a Hermitian rank-k update
  !> 
  !>     C_i := alphaop( A_i )op( B_i )^H + betaC_i
  !> 
  !>     where  alpha and beta are scalars, op(A_i) and op(B_i) are n by k matrices, and
  !>     C_i is a n x n Hermitian matrix stored as either upper or lower.
  !>     This routine should only be used when the caller can guarantee that the result of op( A )op( B )^T will be Hermetian.
  !> 
  !>         op( A_i ) = A_i, op( B_i ) = B_i, and A_i and B_i are n by k if trans == rocblas_operation_none
  !>         op( A_i ) = A_i^H, op( B_i ) = B_i^H,  and A_i and B_i are k by n if trans == rocblas_operation_conjugate_transpose
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  C_i is an upper triangular matrix
  !>             rocblas_fill_lower:  C_i is a  lower triangular matrix
  !> 
  !>     @param[in]
  !>     trans  [rocblas_operation]
  !>             rocblas_operation_conjugate_transpose: op( A_i ) = A_i^H, op( B_i ) = B_i^H
  !>             rocblas_operation_none:                op( A_i ) = A_i, op( B_i ) = B_i
  !> 
  !>     @param[in]
  !>     n       [rocblas_int]
  !>             n specifies the number of rows and columns of C_i. n >= 0.
  !> 
  !>     @param[in]
  !>     k       [rocblas_int]
  !>             k specifies the number of columns of op(A). k >= 0.
  !> 
  !>     @param[in]
  !>     alpha
  !>             alpha specifies the scalar alpha. When alpha is
  !>             zero then A is not referenced and A need not be set before
  !>             entry.
  !> 
  !>     @param[in]
  !>     A       Device pointer to the first matrix A_1 on the GPU of dimension (lda, k)
  !>             when trans is rocblas_operation_none, otherwise of dimension (lda, n)
  !> 
  !>     @param[in]
  !>     lda     [rocblas_int]
  !>             lda specifies the first dimension of A_i.
  !>             if trans = rocblas_operation_none,  lda >= max( 1, n ),
  !>             otherwise lda >= max( 1, k ).
  !> 
  !>     @param[in]
  !>     stride_A  [rocblas_stride]
  !>               stride from the start of one matrix (A_i) and the next one (A_i+1)
  !> 
  !>     @param[in]
  !>     B       Device pointer to the first matrix B_1 on the GPU of dimension (ldb, k)
  !>             when trans is rocblas_operation_none, otherwise of dimension (ldb, n)
  !> 
  !>     @param[in]
  !>     ldb     [rocblas_int]
  !>             ldb specifies the first dimension of B_i.
  !>             if trans = rocblas_operation_none,  ldb >= max( 1, n ),
  !>             otherwise ldb >= max( 1, k ).
  !> 
  !>     @param[in]
  !>     stride_B  [rocblas_stride]
  !>               stride from the start of one matrix (B_i) and the next one (B_i+1)
  !> 
  !>     @param[in]
  !>     beta
  !>             beta specifies the scalar beta. When beta is
  !>             zero then C need not be set before entry.
  !> 
  !>     @param[in]
  !>     C       Device pointer to the first matrix C_1 on the GPU.
  !>             The imaginary component of the diagonal elements are not used but are set to zero unless quick return.
  !> 
  !>     @param[in]
  !>     ldc    [rocblas_int]
  !>            ldc specifies the first dimension of C. ldc >= max( 1, n ).
  !> 
  !>     @param[inout]
  !>     stride_C  [rocblas_stride]
  !>               stride from the start of one matrix (C_i) and the next one (C_i+1)
  !> 
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch.
  !> 
  !>     
    function rocblas_zherkx_strided_batched(handle,uplo,trans,n,k,alpha,A,lda,stride_A,B,ldb,stride_B,beta,C,ldc,stride_C,batch_count) bind(c, name="rocblas_zherkx_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zherkx_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int64_t),value :: stride_B
      real(c_double) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_C
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_ssymm(handle,side,uplo,m,n,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="rocblas_ssymm")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ssymm
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_float) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
    function rocblas_dsymm(handle,side,uplo,m,n,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="rocblas_dsymm")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dsymm
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_double) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
    function rocblas_csymm(handle,side,uplo,m,n,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="rocblas_csymm")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_csymm
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      complex(c_float_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  !> ! \brief BLAS Level 3 API
  !> 
  !>     \details
  !> 
  !>     symm performs one of the matrix-matrix operations:
  !> 
  !>     C := alphaAB + betaC if side == rocblas_side_left,
  !>     C := alphaBA + betaC if side == rocblas_side_right,
  !> 
  !>     where alpha and beta are scalars, B and C are m by n matrices, and
  !>     A is a symmetric matrix stored as either upper or lower.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     side  [rocblas_side]
  !>             rocblas_side_left:      C := alphaAB + betaC
  !>             rocblas_side_right:     C := alphaBA + betaC
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  A is an upper triangular matrix
  !>             rocblas_fill_lower:  A is a  lower triangular matrix
  !> 
  !>     @param[in]
  !>     m       [rocblas_int]
  !>             m specifies the number of rows of B and C. m >= 0.
  !> 
  !>     @param[in]
  !>     n       [rocblas_int]
  !>             n specifies the number of columns of B and C. n >= 0.
  !> 
  !>     @param[in]
  !>     alpha
  !>             alpha specifies the scalar alpha. When alpha is
  !>             zero then A and B are not referenced.
  !> 
  !>     @param[in]
  !>     A       pointer storing matrix A on the GPU.
  !>             A is m by m if side == rocblas_side_left
  !>             A is n by n if side == rocblas_side_right
  !>             only the upperlower triangular part is accessed.
  !> 
  !>     @param[in]
  !>     lda     [rocblas_int]
  !>             lda specifies the first dimension of A.
  !>             if side = rocblas_side_left,  lda >= max( 1, m ),
  !>             otherwise lda >= max( 1, n ).
  !> 
  !>     @param[in]
  !>     B       pointer storing matrix B on the GPU.
  !>             Matrix dimension is m by n
  !> 
  !>     @param[in]
  !>     ldb     [rocblas_int]
  !>             ldb specifies the first dimension of B. ldb >= max( 1, m )
  !> 
  !>     @param[in]
  !>     beta
  !>             beta specifies the scalar beta. When beta is
  !>             zero then C need not be set before entry.
  !> 
  !>     @param[in]
  !>     C       pointer storing matrix C on the GPU.
  !>             Matrix dimension is m by n
  !> 
  !>     @param[in]
  !>     ldc    [rocblas_int]
  !>            ldc specifies the first dimension of C. ldc >= max( 1, m )
  !> 
  !>     
    function rocblas_zsymm(handle,side,uplo,m,n,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="rocblas_zsymm")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zsymm
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      complex(c_double_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
    function rocblas_ssymm_batched(handle,side,uplo,m,n,alpha,A,lda,B,ldb,beta,C,ldc,batch_count) bind(c, name="rocblas_ssymm_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ssymm_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      real(c_float) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dsymm_batched(handle,side,uplo,m,n,alpha,A,lda,B,ldb,beta,C,ldc,batch_count) bind(c, name="rocblas_dsymm_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dsymm_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      real(c_double) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_csymm_batched(handle,side,uplo,m,n,alpha,A,lda,B,ldb,beta,C,ldc,batch_count) bind(c, name="rocblas_csymm_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_csymm_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      complex(c_float_complex) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 3 API
  !> 
  !>     \details
  !> 
  !>     symm_batched performs a batch of the matrix-matrix operations:
  !> 
  !>     C_i := alphaA_iB_i + betaC_i if side == rocblas_side_left,
  !>     C_i := alphaB_iA_i + betaC_i if side == rocblas_side_right,
  !> 
  !>     where alpha and beta are scalars, B_i and C_i are m by n matrices, and
  !>     A_i is a symmetric matrix stored as either upper or lower.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     side  [rocblas_side]
  !>             rocblas_side_left:      C_i := alphaA_iB_i + betaC_i
  !>             rocblas_side_right:     C_i := alphaB_iA_i + betaC_i
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  A_i is an upper triangular matrix
  !>             rocblas_fill_lower:  A_i is a  lower triangular matrix
  !> 
  !>     @param[in]
  !>     m       [rocblas_int]
  !>             m specifies the number of rows of B_i and C_i. m >= 0.
  !> 
  !>     @param[in]
  !>     n       [rocblas_int]
  !>             n specifies the number of columns of B_i and C_i. n >= 0.
  !> 
  !>     @param[in]
  !>     alpha
  !>             alpha specifies the scalar alpha. When alpha is
  !>             zero then A_i and B_i are not referenced.
  !> 
  !>     @param[in]
  !>     A       device array of device pointers storing each matrix A_i on the GPU.
  !>             A_i is m by m if side == rocblas_side_left
  !>             A_i is n by n if side == rocblas_side_right
  !>             only the upperlower triangular part is accessed.
  !> 
  !>     @param[in]
  !>     lda     [rocblas_int]
  !>             lda specifies the first dimension of A_i.
  !>             if side = rocblas_side_left,  lda >= max( 1, m ),
  !>             otherwise lda >= max( 1, n ).
  !> 
  !>     @param[in]
  !>     B       device array of device pointers storing each matrix B_i on the GPU.
  !>             Matrix dimension is m by n
  !> 
  !>     @param[in]
  !>     ldb     [rocblas_int]
  !>             ldb specifies the first dimension of B_i. ldb >= max( 1, m )
  !> 
  !>     @param[in]
  !>     beta
  !>             beta specifies the scalar beta. When beta is
  !>             zero then C_i need not be set before entry.
  !> 
  !>     @param[in]
  !>     C       device array of device pointers storing each matrix C_i on the GPU.
  !>             Matrix dimension is m by n
  !> 
  !>     @param[in]
  !>     ldc    [rocblas_int]
  !>            ldc specifies the first dimension of C_i. ldc >= max( 1, m )
  !> 
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch.
  !> 
  !>     
    function rocblas_zsymm_batched(handle,side,uplo,m,n,alpha,A,lda,B,ldb,beta,C,ldc,batch_count) bind(c, name="rocblas_zsymm_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zsymm_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      complex(c_double_complex) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_ssymm_strided_batched(handle,side,uplo,m,n,alpha,A,lda,stride_A,B,ldb,stride_B,beta,C,ldc,stride_C,batch_count) bind(c, name="rocblas_ssymm_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ssymm_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int64_t),value :: stride_B
      real(c_float) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_C
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dsymm_strided_batched(handle,side,uplo,m,n,alpha,A,lda,stride_A,B,ldb,stride_B,beta,C,ldc,stride_C,batch_count) bind(c, name="rocblas_dsymm_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dsymm_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int64_t),value :: stride_B
      real(c_double) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_C
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_csymm_strided_batched(handle,side,uplo,m,n,alpha,A,lda,stride_A,B,ldb,stride_B,beta,C,ldc,stride_C,batch_count) bind(c, name="rocblas_csymm_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_csymm_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int64_t),value :: stride_B
      complex(c_float_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_C
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 3 API
  !> 
  !>     \details
  !> 
  !>     symm_strided_batched performs a batch of the matrix-matrix operations:
  !> 
  !>     C_i := alphaA_iB_i + betaC_i if side == rocblas_side_left,
  !>     C_i := alphaB_iA_i + betaC_i if side == rocblas_side_right,
  !> 
  !>     where alpha and beta are scalars, B_i and C_i are m by n matrices, and
  !>     A_i is a symmetric matrix stored as either upper or lower.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     side  [rocblas_side]
  !>             rocblas_side_left:      C_i := alphaA_iB_i + betaC_i
  !>             rocblas_side_right:     C_i := alphaB_iA_i + betaC_i
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  A_i is an upper triangular matrix
  !>             rocblas_fill_lower:  A_i is a  lower triangular matrix
  !> 
  !>     @param[in]
  !>     m       [rocblas_int]
  !>             m specifies the number of rows of B_i and C_i. m >= 0.
  !> 
  !>     @param[in]
  !>     n       [rocblas_int]
  !>             n specifies the number of columns of B_i and C_i. n >= 0.
  !> 
  !>     @param[in]
  !>     alpha
  !>             alpha specifies the scalar alpha. When alpha is
  !>             zero then A_i and B_i are not referenced.
  !> 
  !>     @param[in]
  !>     A       device pointer to first matrix A_1
  !>             A_i is m by m if side == rocblas_side_left
  !>             A_i is n by n if side == rocblas_side_right
  !>             only the upperlower triangular part is accessed.
  !> 
  !>     @param[in]
  !>     lda     [rocblas_int]
  !>             lda specifies the first dimension of A_i.
  !>             if side = rocblas_side_left,  lda >= max( 1, m ),
  !>             otherwise lda >= max( 1, n ).
  !> 
  !>     @param[in]
  !>     stride_A  [rocblas_stride]
  !>               stride from the start of one matrix (A_i) and the next one (A_i+1)
  !> 
  !>     @param[in]
  !>     B       device pointer to first matrix B_1 of dimension (ldb, n) on the GPU.
  !> 
  !>     @param[in]
  !>     ldb     [rocblas_int]
  !>             ldb specifies the first dimension of B_i. ldb >= max( 1, m )
  !> 
  !>     @param[in]
  !>     stride_B  [rocblas_stride]
  !>               stride from the start of one matrix (B_i) and the next one (B_i+1)
  !>     @param[in]
  !>     beta
  !>             beta specifies the scalar beta. When beta is
  !>             zero then C need not be set before entry.
  !> 
  !>     @param[in]
  !>     C        device pointer to first matrix C_1 of dimension (ldc, n) on the GPU.
  !> 
  !>     @param[in]
  !>     ldc    [rocblas_int]
  !>            ldc specifies the first dimension of C. ldc >= max( 1, m ).
  !> 
  !>     @param[inout]
  !>     stride_C  [rocblas_stride]
  !>               stride from the start of one matrix (C_i) and the next one (C_i+1)
  !> 
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch.
  !> 
  !>     
    function rocblas_zsymm_strided_batched(handle,side,uplo,m,n,alpha,A,lda,stride_A,B,ldb,stride_B,beta,C,ldc,stride_C,batch_count) bind(c, name="rocblas_zsymm_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zsymm_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int64_t),value :: stride_B
      complex(c_double_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_C
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_ssyrk(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc) bind(c, name="rocblas_ssyrk")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ssyrk
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
    function rocblas_dsyrk(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc) bind(c, name="rocblas_dsyrk")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dsyrk
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
    function rocblas_csyrk(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc) bind(c, name="rocblas_csyrk")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_csyrk
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_float_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  !> ! \brief BLAS Level 3 API
  !> 
  !>     \details
  !> 
  !>     syrk performs one of the matrix-matrix operations for a symmetric rank-k update
  !> 
  !>     C := alphaop( A )op( A )^T + betaC
  !> 
  !>     where  alpha and beta are scalars, op(A) is an n by k matrix, and
  !>     C is a symmetric n x n matrix stored as either upper or lower.
  !> 
  !>         op( A ) = A, and A is n by k if transA == rocblas_operation_none
  !>         op( A ) = A^T and A is k by n if transA == rocblas_operation_transpose
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  C is an upper triangular matrix
  !>             rocblas_fill_lower:  C is a  lower triangular matrix
  !> 
  !>     @param[in]
  !>     transA  [rocblas_operation]
  !>             rocblas_operation_transpose:      op(A) = A^T
  !>             rocblas_operation_none:           op(A) = A
  !> 
  !>     @param[in]
  !>     n       [rocblas_int]
  !>             n specifies the number of rows and columns of C. n >= 0.
  !> 
  !>     @param[in]
  !>     k       [rocblas_int]
  !>             k specifies the number of columns of op(A). k >= 0.
  !> 
  !>     @param[in]
  !>     alpha
  !>             alpha specifies the scalar alpha. When alpha is
  !>             zero then A is not referenced and A need not be set before
  !>             entry.
  !> 
  !>     @param[in]
  !>     A       pointer storing matrix A on the GPU.
  !>             Martrix dimension is ( lda, k ) when if transA = rocblas_operation_none, otherwise (lda, n)
  !>             only the upperlower triangular part is accessed.
  !> 
  !>     @param[in]
  !>     lda     [rocblas_int]
  !>             lda specifies the first dimension of A.
  !>             if transA = rocblas_operation_none,  lda >= max( 1, n ),
  !>             otherwise lda >= max( 1, k ).
  !> 
  !>     @param[in]
  !>     beta
  !>             beta specifies the scalar beta. When beta is
  !>             zero then C need not be set before entry.
  !> 
  !>     @param[in]
  !>     C       pointer storing matrix C on the GPU.
  !> 
  !>     @param[in]
  !>     ldc    [rocblas_int]
  !>            ldc specifies the first dimension of C. ldc >= max( 1, n ).
  !> 
  !>     
    function rocblas_zsyrk(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc) bind(c, name="rocblas_zsyrk")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zsyrk
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_double_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
    function rocblas_ssyrk_batched(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc,batch_count) bind(c, name="rocblas_ssyrk_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ssyrk_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      real(c_float) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dsyrk_batched(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc,batch_count) bind(c, name="rocblas_dsyrk_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dsyrk_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      real(c_double) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_csyrk_batched(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc,batch_count) bind(c, name="rocblas_csyrk_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_csyrk_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      complex(c_float_complex) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 3 API
  !> 
  !>     \details
  !> 
  !>     syrk_batched performs a batch of the matrix-matrix operations for a symmetric rank-k update
  !> 
  !>     C_i := alphaop( A_i )op( A_i )^T + betaC_i
  !> 
  !>     where  alpha and beta are scalars, op(A_i) is an n by k matrix, and
  !>     C_i is a symmetric n x n matrix stored as either upper or lower.
  !> 
  !>         op( A_i ) = A_i, and A_i is n by k if transA == rocblas_operation_none
  !>         op( A_i ) = A^T and A_i is k by n if transA == rocblas_operation_transpose
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  C_i is an upper triangular matrix
  !>             rocblas_fill_lower:  C_i is a  lower triangular matrix
  !> 
  !>     @param[in]
  !>     transA  [rocblas_operation]
  !>             rocblas_operation_transpose:      op(A) = A^T
  !>             rocblas_operation_none:           op(A) = A
  !> 
  !>     @param[in]
  !>     n       [rocblas_int]
  !>             n specifies the number of rows and columns of C_i. n >= 0.
  !> 
  !>     @param[in]
  !>     k       [rocblas_int]
  !>             k specifies the number of columns of op(A). k >= 0.
  !> 
  !>     @param[in]
  !>     alpha
  !>             alpha specifies the scalar alpha. When alpha is
  !>             zero then A is not referenced and A need not be set before
  !>             entry.
  !> 
  !>     @param[in]
  !>     A       device array of device pointers storing each matrix_i A of dimension (lda, k)
  !>             when transA is rocblas_operation_none, otherwise of dimension (lda, n)
  !> 
  !>     @param[in]
  !>     lda     [rocblas_int]
  !>             lda specifies the first dimension of A_i.
  !>             if transA = rocblas_operation_none,  lda >= max( 1, n ),
  !>             otherwise lda >= max( 1, k ).
  !> 
  !>     @param[in]
  !>     beta
  !>             beta specifies the scalar beta. When beta is
  !>             zero then C need not be set before entry.
  !> 
  !>     @param[in]
  !>     C       device array of device pointers storing each matrix C_i on the GPU.
  !> 
  !>     @param[in]
  !>     ldc    [rocblas_int]
  !>            ldc specifies the first dimension of C. ldc >= max( 1, n ).
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch.
  !> 
  !>     
    function rocblas_zsyrk_batched(handle,uplo,transA,n,k,alpha,A,lda,beta,C,ldc,batch_count) bind(c, name="rocblas_zsyrk_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zsyrk_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      complex(c_double_complex) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_ssyrk_strided_batched(handle,uplo,transA,n,k,alpha,A,lda,stride_A,beta,C,ldc,stride_C,batch_count) bind(c, name="rocblas_ssyrk_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ssyrk_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      real(c_float) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_C
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dsyrk_strided_batched(handle,uplo,transA,n,k,alpha,A,lda,stride_A,beta,C,ldc,stride_C,batch_count) bind(c, name="rocblas_dsyrk_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dsyrk_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      real(c_double) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_C
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_csyrk_strided_batched(handle,uplo,transA,n,k,alpha,A,lda,stride_A,beta,C,ldc,stride_C,batch_count) bind(c, name="rocblas_csyrk_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_csyrk_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      complex(c_float_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_C
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 3 API
  !> 
  !>     \details
  !> 
  !>     syrk_strided_batched performs a batch of the matrix-matrix operations for a symmetric rank-k update
  !> 
  !>     C_i := alphaop( A_i )op( A_i )^T + betaC_i
  !> 
  !>     where  alpha and beta are scalars, op(A_i) is an n by k matrix, and
  !>     C_i is a symmetric n x n matrix stored as either upper or lower.
  !> 
  !>         op( A_i ) = A_i, and A_i is n by k if transA == rocblas_operation_none
  !>         op( A_i ) = A^T and A_i is k by n if transA == rocblas_operation_transpose
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  C_i is an upper triangular matrix
  !>             rocblas_fill_lower:  C_i is a  lower triangular matrix
  !> 
  !>     @param[in]
  !>     transA  [rocblas_operation]
  !>             rocblas_operation_transpose:      op(A) = A^T
  !>             rocblas_operation_none:           op(A) = A
  !> 
  !>     @param[in]
  !>     n       [rocblas_int]
  !>             n specifies the number of rows and columns of C_i. n >= 0.
  !> 
  !>     @param[in]
  !>     k       [rocblas_int]
  !>             k specifies the number of columns of op(A). k >= 0.
  !> 
  !>     @param[in]
  !>     alpha
  !>             alpha specifies the scalar alpha. When alpha is
  !>             zero then A is not referenced and A need not be set before
  !>             entry.
  !> 
  !>     @param[in]
  !>     A       Device pointer to the first matrix A_1 on the GPU of dimension (lda, k)
  !>             when transA is rocblas_operation_none, otherwise of dimension (lda, n)
  !> 
  !>     @param[in]
  !>     lda     [rocblas_int]
  !>             lda specifies the first dimension of A_i.
  !>             if transA = rocblas_operation_none,  lda >= max( 1, n ),
  !>             otherwise lda >= max( 1, k ).
  !> 
  !>     @param[in]
  !>     stride_A  [rocblas_stride]
  !>               stride from the start of one matrix (A_i) and the next one (A_i+1)
  !> 
  !>     @param[in]
  !>     beta
  !>             beta specifies the scalar beta. When beta is
  !>             zero then C need not be set before entry.
  !> 
  !>     @param[in]
  !>     C       Device pointer to the first matrix C_1 on the GPU. on the GPU.
  !> 
  !>     @param[in]
  !>     ldc    [rocblas_int]
  !>            ldc specifies the first dimension of C. ldc >= max( 1, n ).
  !> 
  !>     @param[inout]
  !>     stride_C  [rocblas_stride]
  !>               stride from the start of one matrix (C_i) and the next one (C_i+1)
  !> 
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch.
  !> 
  !>     
    function rocblas_zsyrk_strided_batched(handle,uplo,transA,n,k,alpha,A,lda,stride_A,beta,C,ldc,stride_C,batch_count) bind(c, name="rocblas_zsyrk_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zsyrk_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      complex(c_double_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_C
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_ssyr2k(handle,uplo,trans,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="rocblas_ssyr2k")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ssyr2k
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_float) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
    function rocblas_dsyr2k(handle,uplo,trans,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="rocblas_dsyr2k")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dsyr2k
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_double) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
    function rocblas_csyr2k(handle,uplo,trans,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="rocblas_csyr2k")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_csyr2k
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      complex(c_float_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  !> ! \brief BLAS Level 3 API
  !> 
  !>     \details
  !> 
  !>     syr2k performs one of the matrix-matrix operations for a symmetric rank-2k update
  !> 
  !>     C := alpha(op( A )op( B )^T + op( B )op( A )^T) + betaC
  !> 
  !>     where  alpha and beta are scalars, op(A) and op(B) are n by k matrix, and
  !>     C is a symmetric n x n matrix stored as either upper or lower.
  !> 
  !>         op( A ) = A, op( B ) = B, and A and B are n by k if trans == rocblas_operation_none
  !>         op( A ) = A^T, op( B ) = B^T,  and A and B are k by n if trans == rocblas_operation_transpose
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  C is an upper triangular matrix
  !>             rocblas_fill_lower:  C is a  lower triangular matrix
  !> 
  !>     @param[in]
  !>     trans  [rocblas_operation]
  !>             rocblas_operation_transpose:      op( A ) = A^T, op( B ) = B^T
  !>             rocblas_operation_none:           op( A ) = A, op( B ) = B
  !> 
  !>     @param[in]
  !>     n       [rocblas_int]
  !>             n specifies the number of rows and columns of C. n >= 0.
  !> 
  !>     @param[in]
  !>     k       [rocblas_int]
  !>             k specifies the number of columns of op(A) and op(B). k >= 0.
  !> 
  !>     @param[in]
  !>     alpha
  !>             alpha specifies the scalar alpha. When alpha is
  !>             zero then A is not referenced and A need not be set before
  !>             entry.
  !> 
  !>     @param[in]
  !>     A       pointer storing matrix A on the GPU.
  !>             Martrix dimension is ( lda, k ) when if trans = rocblas_operation_none, otherwise (lda, n)
  !>             only the upperlower triangular part is accessed.
  !> 
  !>     @param[in]
  !>     lda     [rocblas_int]
  !>             lda specifies the first dimension of A.
  !>             if trans = rocblas_operation_none,  lda >= max( 1, n ),
  !>             otherwise lda >= max( 1, k ).
  !>     @param[in]
  !>     B       pointer storing matrix B on the GPU.
  !>             Martrix dimension is ( ldb, k ) when if trans = rocblas_operation_none, otherwise (ldb, n)
  !>             only the upperlower triangular part is accessed.
  !> 
  !>     @param[in]
  !>     ldb     [rocblas_int]
  !>             ldb specifies the first dimension of B.
  !>             if trans = rocblas_operation_none,  ldb >= max( 1, n ),
  !>             otherwise ldb >= max( 1, k ).
  !>     @param[in]
  !>     beta
  !>             beta specifies the scalar beta. When beta is
  !>             zero then C need not be set before entry.
  !> 
  !>     @param[in]
  !>     C       pointer storing matrix C on the GPU.
  !> 
  !>     @param[in]
  !>     ldc    [rocblas_int]
  !>            ldc specifies the first dimension of C. ldc >= max( 1, n ).
  !> 
  !>     
    function rocblas_zsyr2k(handle,uplo,trans,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="rocblas_zsyr2k")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zsyr2k
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      complex(c_double_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
    function rocblas_ssyr2k_batched(handle,uplo,trans,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batch_count) bind(c, name="rocblas_ssyr2k_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ssyr2k_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      real(c_float) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dsyr2k_batched(handle,uplo,trans,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batch_count) bind(c, name="rocblas_dsyr2k_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dsyr2k_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      real(c_double) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_csyr2k_batched(handle,uplo,trans,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batch_count) bind(c, name="rocblas_csyr2k_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_csyr2k_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      complex(c_float_complex) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 3 API
  !> 
  !>     \details
  !> 
  !>     syr2k_batched performs a batch of the matrix-matrix operations for a symmetric rank-2k update
  !> 
  !>     C_i := alpha(op( A_i )op( B_i )^T + op( B_i )op( A_i )^T) + betaC_i
  !> 
  !>     where  alpha and beta are scalars, op(A_i) and op(B_i) are n by k matrix, and
  !>     C_i is a symmetric n x n matrix stored as either upper or lower.
  !> 
  !>         op( A_i ) = A_i, op( B_i ) = B_i, and A_i and B_i are n by k if trans == rocblas_operation_none
  !>         op( A_i ) = A_i^T, op( B_i ) = B_i^T,  and A_i and B_i are k by n if trans == rocblas_operation_transpose
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  C_i is an upper triangular matrix
  !>             rocblas_fill_lower:  C_i is a  lower triangular matrix
  !> 
  !>     @param[in]
  !>     trans  [rocblas_operation]
  !>             rocblas_operation_transpose:      op( A_i ) = A_i^T, op( B_i ) = B_i^T
  !>             rocblas_operation_none:           op( A_i ) = A_i, op( B_i ) = B_i
  !> 
  !>     @param[in]
  !>     n       [rocblas_int]
  !>             n specifies the number of rows and columns of C_i. n >= 0.
  !> 
  !>     @param[in]
  !>     k       [rocblas_int]
  !>             k specifies the number of columns of op(A). k >= 0.
  !> 
  !>     @param[in]
  !>     alpha
  !>             alpha specifies the scalar alpha. When alpha is
  !>             zero then A is not referenced and A need not be set before
  !>             entry.
  !> 
  !>     @param[in]
  !>     A       device array of device pointers storing each matrix_i A of dimension (lda, k)
  !>             when trans is rocblas_operation_none, otherwise of dimension (lda, n)
  !> 
  !>     @param[in]
  !>     lda     [rocblas_int]
  !>             lda specifies the first dimension of A_i.
  !>             if trans = rocblas_operation_none,  lda >= max( 1, n ),
  !>             otherwise lda >= max( 1, k ).
  !>     @param[in]
  !>     B       device array of device pointers storing each matrix_i B of dimension (ldb, k)
  !>             when trans is rocblas_operation_none, otherwise of dimension (ldb, n)
  !>     @param[in]
  !>     ldb     [rocblas_int]
  !>             ldb specifies the first dimension of B.
  !>             if trans = rocblas_operation_none,  ldb >= max( 1, n ),
  !>             otherwise ldb >= max( 1, k ).
  !>     @param[in]
  !>     beta
  !>             beta specifies the scalar beta. When beta is
  !>             zero then C need not be set before entry.
  !> 
  !>     @param[in]
  !>     C       device array of device pointers storing each matrix C_i on the GPU.
  !> 
  !>     @param[in]
  !>     ldc    [rocblas_int]
  !>            ldc specifies the first dimension of C. ldc >= max( 1, n ).
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch.
  !> 
  !>     
    function rocblas_zsyr2k_batched(handle,uplo,trans,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batch_count) bind(c, name="rocblas_zsyr2k_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zsyr2k_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      complex(c_double_complex) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_ssyr2k_strided_batched(handle,uplo,trans,n,k,alpha,A,lda,stride_A,B,ldb,stride_B,beta,C,ldc,stride_C,batch_count) bind(c, name="rocblas_ssyr2k_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ssyr2k_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int64_t),value :: stride_B
      real(c_float) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_C
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dsyr2k_strided_batched(handle,uplo,trans,n,k,alpha,A,lda,stride_A,B,ldb,stride_B,beta,C,ldc,stride_C,batch_count) bind(c, name="rocblas_dsyr2k_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dsyr2k_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int64_t),value :: stride_B
      real(c_double) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_C
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_csyr2k_strided_batched(handle,uplo,trans,n,k,alpha,A,lda,stride_A,B,ldb,stride_B,beta,C,ldc,stride_C,batch_count) bind(c, name="rocblas_csyr2k_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_csyr2k_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int64_t),value :: stride_B
      complex(c_float_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_C
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 3 API
  !> 
  !>     \details
  !> 
  !>     syr2k_strided_batched performs a batch of the matrix-matrix operations for a symmetric rank-2k update
  !> 
  !>     C_i := alpha(op( A_i )op( B_i )^T + op( B_i )op( A_i )^T) + betaC_i
  !> 
  !>     where  alpha and beta are scalars, op(A_i) and op(B_i) are n by k matrix, and
  !>     C_i is a symmetric n x n matrix stored as either upper or lower.
  !> 
  !>         op( A_i ) = A_i, op( B_i ) = B_i, and A_i and B_i are n by k if trans == rocblas_operation_none
  !>         op( A_i ) = A_i^T, op( B_i ) = B_i^T,  and A_i and B_i are k by n if trans == rocblas_operation_transpose
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  C_i is an upper triangular matrix
  !>             rocblas_fill_lower:  C_i is a  lower triangular matrix
  !> 
  !>     @param[in]
  !>     trans  [rocblas_operation]
  !>             rocblas_operation_transpose:      op( A_i ) = A_i^T, op( B_i ) = B_i^T
  !>             rocblas_operation_none:           op( A_i ) = A_i, op( B_i ) = B_i
  !> 
  !>     @param[in]
  !>     n       [rocblas_int]
  !>             n specifies the number of rows and columns of C_i. n >= 0.
  !> 
  !>     @param[in]
  !>     k       [rocblas_int]
  !>             k specifies the number of columns of op(A). k >= 0.
  !> 
  !>     @param[in]
  !>     alpha
  !>             alpha specifies the scalar alpha. When alpha is
  !>             zero then A is not referenced and A need not be set before
  !>             entry.
  !> 
  !>     @param[in]
  !>     A       Device pointer to the first matrix A_1 on the GPU of dimension (lda, k)
  !>             when trans is rocblas_operation_none, otherwise of dimension (lda, n)
  !> 
  !>     @param[in]
  !>     lda     [rocblas_int]
  !>             lda specifies the first dimension of A_i.
  !>             if trans = rocblas_operation_none,  lda >= max( 1, n ),
  !>             otherwise lda >= max( 1, k ).
  !> 
  !>     @param[in]
  !>     stride_A  [rocblas_stride]
  !>               stride from the start of one matrix (A_i) and the next one (A_i+1)
  !> 
  !>     @param[in]
  !>     B       Device pointer to the first matrix B_1 on the GPU of dimension (ldb, k)
  !>             when trans is rocblas_operation_none, otherwise of dimension (ldb, n)
  !> 
  !>     @param[in]
  !>     ldb     [rocblas_int]
  !>             ldb specifies the first dimension of B_i.
  !>             if trans = rocblas_operation_none,  ldb >= max( 1, n ),
  !>             otherwise ldb >= max( 1, k ).
  !> 
  !>     @param[in]
  !>     stride_B  [rocblas_stride]
  !>               stride from the start of one matrix (B_i) and the next one (B_i+1)
  !> 
  !>     @param[in]
  !>     beta
  !>             beta specifies the scalar beta. When beta is
  !>             zero then C need not be set before entry.
  !> 
  !>     @param[in]
  !>     C       Device pointer to the first matrix C_1 on the GPU.
  !> 
  !>     @param[in]
  !>     ldc    [rocblas_int]
  !>            ldc specifies the first dimension of C. ldc >= max( 1, n ).
  !> 
  !>     @param[inout]
  !>     stride_C  [rocblas_stride]
  !>               stride from the start of one matrix (C_i) and the next one (C_i+1)
  !> 
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch.
  !> 
  !>     
    function rocblas_zsyr2k_strided_batched(handle,uplo,trans,n,k,alpha,A,lda,stride_A,B,ldb,stride_B,beta,C,ldc,stride_C,batch_count) bind(c, name="rocblas_zsyr2k_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zsyr2k_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int64_t),value :: stride_B
      complex(c_double_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_C
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_ssyrkx(handle,uplo,trans,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="rocblas_ssyrkx")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ssyrkx
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_float) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
    function rocblas_dsyrkx(handle,uplo,trans,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="rocblas_dsyrkx")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dsyrkx
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_double) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
    function rocblas_csyrkx(handle,uplo,trans,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="rocblas_csyrkx")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_csyrkx
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      complex(c_float_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  !> ! \brief BLAS Level 3 API
  !> 
  !>     \details
  !> 
  !>     syrkx performs one of the matrix-matrix operations for a symmetric rank-k update
  !> 
  !>     C := alphaop( A )op( B )^T + betaC
  !> 
  !>     where  alpha and beta are scalars, op(A) and op(B) are n by k matrix, and
  !>     C is a symmetric n x n matrix stored as either upper or lower.
  !>     This routine should only be used when the caller can guarantee that the result of op( A )op( B )^T will be symmetric.
  !> 
  !>         op( A ) = A, op( B ) = B, and A and B are n by k if trans == rocblas_operation_none
  !>         op( A ) = A^T, op( B ) = B^T,  and A and B are k by n if trans == rocblas_operation_transpose
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  C is an upper triangular matrix
  !>             rocblas_fill_lower:  C is a  lower triangular matrix
  !> 
  !>     @param[in]
  !>     trans  [rocblas_operation]
  !>             rocblas_operation_transpose:      op( A ) = A^T, op( B ) = B^T
  !>             rocblas_operation_none:           op( A ) = A, op( B ) = B
  !> 
  !>     @param[in]
  !>     n       [rocblas_int]
  !>             n specifies the number of rows and columns of C. n >= 0.
  !> 
  !>     @param[in]
  !>     k       [rocblas_int]
  !>             k specifies the number of columns of op(A) and op(B). k >= 0.
  !> 
  !>     @param[in]
  !>     alpha
  !>             alpha specifies the scalar alpha. When alpha is
  !>             zero then A is not referenced and A need not be set before
  !>             entry.
  !> 
  !>     @param[in]
  !>     A       pointer storing matrix A on the GPU.
  !>             Martrix dimension is ( lda, k ) when if trans = rocblas_operation_none, otherwise (lda, n)
  !>             only the upperlower triangular part is accessed.
  !> 
  !>     @param[in]
  !>     lda     [rocblas_int]
  !>             lda specifies the first dimension of A.
  !>             if trans = rocblas_operation_none,  lda >= max( 1, n ),
  !>             otherwise lda >= max( 1, k ).
  !> 
  !>     @param[in]
  !>     B       pointer storing matrix B on the GPU.
  !>             Martrix dimension is ( ldb, k ) when if trans = rocblas_operation_none, otherwise (ldb, n)
  !>             only the upperlower triangular part is accessed.
  !> 
  !>     @param[in]
  !>     ldb     [rocblas_int]
  !>             ldb specifies the first dimension of B.
  !>             if trans = rocblas_operation_none,  ldb >= max( 1, n ),
  !>             otherwise ldb >= max( 1, k ).
  !> 
  !>     @param[in]
  !>     beta
  !>             beta specifies the scalar beta. When beta is
  !>             zero then C need not be set before entry.
  !> 
  !>     @param[in]
  !>     C       pointer storing matrix C on the GPU.
  !> 
  !>     @param[in]
  !>     ldc    [rocblas_int]
  !>            ldc specifies the first dimension of C. ldc >= max( 1, n ).
  !> 
  !>     
    function rocblas_zsyrkx(handle,uplo,trans,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="rocblas_zsyrkx")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zsyrkx
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      complex(c_double_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
    function rocblas_ssyrkx_batched(handle,uplo,trans,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batch_count) bind(c, name="rocblas_ssyrkx_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ssyrkx_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      real(c_float) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dsyrkx_batched(handle,uplo,trans,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batch_count) bind(c, name="rocblas_dsyrkx_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dsyrkx_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      real(c_double) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_csyrkx_batched(handle,uplo,trans,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batch_count) bind(c, name="rocblas_csyrkx_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_csyrkx_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      complex(c_float_complex) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 3 API
  !> 
  !>     \details
  !> 
  !>     syrkx_batched performs a batch of the matrix-matrix operations for a symmetric rank-k update
  !> 
  !>     C_i := alphaop( A_i )op( B_i )^T + betaC_i
  !> 
  !>     where  alpha and beta are scalars, op(A_i) and op(B_i) are n by k matrix, and
  !>     C_i is a symmetric n x n matrix stored as either upper or lower.
  !>     This routine should only be used when the caller can guarantee that the result of op( A_i )op( B_i )^T will be symmetric.
  !> 
  !>         op( A_i ) = A_i, op( B_i ) = B_i, and A_i and B_i are n by k if trans == rocblas_operation_none
  !>         op( A_i ) = A_i^T, op( B_i ) = B_i^T,  and A_i and B_i are k by n if trans == rocblas_operation_transpose
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  C_i is an upper triangular matrix
  !>             rocblas_fill_lower:  C_i is a  lower triangular matrix
  !> 
  !>     @param[in]
  !>     trans  [rocblas_operation]
  !>             rocblas_operation_transpose:      op( A_i ) = A_i^T, op( B_i ) = B_i^T
  !>             rocblas_operation_none:           op( A_i ) = A_i, op( B_i ) = B_i
  !> 
  !>     @param[in]
  !>     n       [rocblas_int]
  !>             n specifies the number of rows and columns of C_i. n >= 0.
  !> 
  !>     @param[in]
  !>     k       [rocblas_int]
  !>             k specifies the number of columns of op(A). k >= 0.
  !> 
  !>     @param[in]
  !>     alpha
  !>             alpha specifies the scalar alpha. When alpha is
  !>             zero then A is not referenced and A need not be set before
  !>             entry.
  !> 
  !>     @param[in]
  !>     A       device array of device pointers storing each matrix_i A of dimension (lda, k)
  !>             when trans is rocblas_operation_none, otherwise of dimension (lda, n)
  !> 
  !>     @param[in]
  !>     lda     [rocblas_int]
  !>             lda specifies the first dimension of A_i.
  !>             if trans = rocblas_operation_none,  lda >= max( 1, n ),
  !>             otherwise lda >= max( 1, k ).
  !> 
  !>     @param[in]
  !>     B       device array of device pointers storing each matrix_i B of dimension (ldb, k)
  !>             when trans is rocblas_operation_none, otherwise of dimension (ldb, n)
  !> 
  !>     @param[in]
  !>     ldb     [rocblas_int]
  !>             ldb specifies the first dimension of B.
  !>             if trans = rocblas_operation_none,  ldb >= max( 1, n ),
  !>             otherwise ldb >= max( 1, k ).
  !> 
  !>     @param[in]
  !>     beta
  !>             beta specifies the scalar beta. When beta is
  !>             zero then C need not be set before entry.
  !> 
  !>     @param[in]
  !>     C       device array of device pointers storing each matrix C_i on the GPU.
  !> 
  !>     @param[in]
  !>     ldc    [rocblas_int]
  !>            ldc specifies the first dimension of C. ldc >= max( 1, n ).
  !> 
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>             number of instances in the batch.
  !> 
  !>     
    function rocblas_zsyrkx_batched(handle,uplo,trans,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batch_count) bind(c, name="rocblas_zsyrkx_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zsyrkx_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      complex(c_double_complex) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_ssyrkx_strided_batched(handle,uplo,trans,n,k,alpha,A,lda,stride_A,B,ldb,stride_B,beta,C,ldc,stride_C,batch_count) bind(c, name="rocblas_ssyrkx_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ssyrkx_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int64_t),value :: stride_B
      real(c_float) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_C
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dsyrkx_strided_batched(handle,uplo,trans,n,k,alpha,A,lda,stride_A,B,ldb,stride_B,beta,C,ldc,stride_C,batch_count) bind(c, name="rocblas_dsyrkx_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dsyrkx_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int64_t),value :: stride_B
      real(c_double) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_C
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_csyrkx_strided_batched(handle,uplo,trans,n,k,alpha,A,lda,stride_A,B,ldb,stride_B,beta,C,ldc,stride_C,batch_count) bind(c, name="rocblas_csyrkx_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_csyrkx_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int64_t),value :: stride_B
      complex(c_float_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_C
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 3 API
  !> 
  !>     \details
  !> 
  !>     syrkx_strided_batched performs a batch of the matrix-matrix operations for a symmetric rank-k update
  !> 
  !>     C_i := alphaop( A_i )op( B_i )^T + betaC_i
  !> 
  !>     where  alpha and beta are scalars, op(A_i) and op(B_i) are n by k matrix, and
  !>     C_i is a symmetric n x n matrix stored as either upper or lower.
  !>     This routine should only be used when the caller can guarantee that the result of op( A_i )op( B_i )^T will be symmetric.
  !> 
  !>         op( A_i ) = A_i, op( B_i ) = B_i, and A_i and B_i are n by k if trans == rocblas_operation_none
  !>         op( A_i ) = A_i^T, op( B_i ) = B_i^T,  and A_i and B_i are k by n if trans == rocblas_operation_transpose
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  C_i is an upper triangular matrix
  !>             rocblas_fill_lower:  C_i is a  lower triangular matrix
  !> 
  !>     @param[in]
  !>     trans  [rocblas_operation]
  !>             rocblas_operation_transpose:      op( A_i ) = A_i^T, op( B_i ) = B_i^T
  !>             rocblas_operation_none:           op( A_i ) = A_i, op( B_i ) = B_i
  !> 
  !>     @param[in]
  !>     n       [rocblas_int]
  !>             n specifies the number of rows and columns of C_i. n >= 0.
  !> 
  !>     @param[in]
  !>     k       [rocblas_int]
  !>             k specifies the number of columns of op(A). k >= 0.
  !> 
  !>     @param[in]
  !>     alpha
  !>             alpha specifies the scalar alpha. When alpha is
  !>             zero then A is not referenced and A need not be set before
  !>             entry.
  !> 
  !>     @param[in]
  !>     A       Device pointer to the first matrix A_1 on the GPU of dimension (lda, k)
  !>             when trans is rocblas_operation_none, otherwise of dimension (lda, n)
  !> 
  !>     @param[in]
  !>     lda     [rocblas_int]
  !>             lda specifies the first dimension of A_i.
  !>             if trans = rocblas_operation_none,  lda >= max( 1, n ),
  !>             otherwise lda >= max( 1, k ).
  !> 
  !>     @param[in]
  !>     stride_A  [rocblas_stride]
  !>               stride from the start of one matrix (A_i) and the next one (A_i+1)
  !> 
  !>     @param[in]
  !>     B       Device pointer to the first matrix B_1 on the GPU of dimension (ldb, k)
  !>             when trans is rocblas_operation_none, otherwise of dimension (ldb, n)
  !> 
  !>     @param[in]
  !>     ldb     [rocblas_int]
  !>             ldb specifies the first dimension of B_i.
  !>             if trans = rocblas_operation_none,  ldb >= max( 1, n ),
  !>             otherwise ldb >= max( 1, k ).
  !> 
  !>     @param[in]
  !>     stride_B  [rocblas_stride]
  !>               stride from the start of one matrix (B_i) and the next one (B_i+1)
  !> 
  !>     @param[in]
  !>     beta
  !>             beta specifies the scalar beta. When beta is
  !>             zero then C need not be set before entry.
  !> 
  !>     @param[in]
  !>     C       Device pointer to the first matrix C_1 on the GPU.
  !> 
  !>     @param[in]
  !>     ldc    [rocblas_int]
  !>            ldc specifies the first dimension of C. ldc >= max( 1, n ).
  !> 
  !>     @param[inout]
  !>     stride_C  [rocblas_stride]
  !>               stride from the start of one matrix (C_i) and the next one (C_i+1)
  !> 
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch.
  !> 
  !>     
    function rocblas_zsyrkx_strided_batched(handle,uplo,trans,n,k,alpha,A,lda,stride_A,B,ldb,stride_B,beta,C,ldc,stride_C,batch_count) bind(c, name="rocblas_zsyrkx_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zsyrkx_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_A
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int64_t),value :: stride_B
      complex(c_double_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_C
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_strmm(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb) bind(c, name="rocblas_strmm")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_strmm
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
    end function

  
    function rocblas_dtrmm(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb) bind(c, name="rocblas_dtrmm")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dtrmm
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
    end function

  
    function rocblas_ctrmm(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb) bind(c, name="rocblas_ctrmm")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ctrmm
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
    end function

  !> ! \brief BLAS Level 3 API
  !> 
  !>     \details
  !> 
  !>     trmm performs one of the matrix-matrix operations
  !> 
  !>     B := alphaop( A )B,   or   B := alphaBop( A )
  !> 
  !>     where  alpha  is a scalar,  B  is an m by n matrix,  A  is a unit, or
  !>     non-unit,  upper or lower triangular matrix  and  op( A )  is one  of
  !> 
  !>         op( A ) = A   or   op( A ) = A^T   or   op( A ) = A^H.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     side    [rocblas_side]
  !>             Specifies whether op(A) multiplies B from the left or right as follows:
  !>             rocblas_side_left:       B := alphaop( A )B.
  !>             rocblas_side_right:      B := alphaBop( A ).
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             Specifies whether the matrix A is an uppoer or lower triangular matrix as follows:
  !>             rocblas_fill_upper:  A is an upper triangular matrix.
  !>             rocblas_fill_lower:  A is a  lower triangular matrix.
  !> 
  !>     @param[in]
  !>     transA  [rocblas_operation]
  !>             Specifies the form of op(A) to be used in the matrix multiplication as follows:
  !>             rocblas_operation_none:    op(A) = A.
  !>             rocblas_operation_transpose:      op(A) = A^T.
  !>             rocblas_operation_conjugate_transpose:  op(A) = A^H.
  !> 
  !>     @param[in]
  !>     diag    [rocblas_diagonal]
  !>             Specifies whether or not A is unit triangular as follows:
  !>             rocblas_diagonal_unit:      A is assumed to be unit triangular.
  !>             rocblas_diagonal_non_unit:  A is not assumed to be unit triangular.
  !> 
  !>     @param[in]
  !>     m       [rocblas_int]
  !>             m specifies the number of rows of B. m >= 0.
  !> 
  !>     @param[in]
  !>     n       [rocblas_int]
  !>             n specifies the number of columns of B. n >= 0.
  !> 
  !>     @param[in]
  !>     alpha
  !>             alpha specifies the scalar alpha. When alpha is
  !>             zero then A is not referenced and B need not be set before
  !>             entry.
  !> 
  !>     @param[in]
  !>     A       Device pointer to matrix A on the GPU.
  !>             A has dimension ( lda, k ), where k is m
  !>             when  side == rocblas_side_left  and
  !>             is  n  when  side == rocblas_side_right.
  !> 
  !>         When uplo == rocblas_fill_upper the  leading  k by k
  !>         upper triangular part of the array  A must contain the upper
  !>         triangular matrix  and the strictly lower triangular part of
  !>         A is not referenced.
  !> 
  !>         When uplo == rocblas_fill_lower the  leading  k by k
  !>         lower triangular part of the array  A must contain the lower
  !>         triangular matrix  and the strictly upper triangular part of
  !>         A is not referenced.
  !> 
  !>         Note that when  diag == rocblas_diagonal_unit  the diagonal elements of
  !>         A  are not referenced either,  but are assumed to be  unity.
  !> 
  !>     @param[in]
  !>     lda     [rocblas_int]
  !>             lda specifies the first dimension of A.
  !>             if side == rocblas_side_left,  lda >= max( 1, m ),
  !>             if side == rocblas_side_right, lda >= max( 1, n ).
  !> 
  !>     @param[in]
  !>     B       Device pointer to the first matrix B_0 on the GPU.
  !>             On entry,  the leading  m by n part of the array  B must
  !>            contain the matrix  B,  and  on exit  is overwritten  by the
  !>            transformed matrix.
  !> 
  !>     @param[in]
  !>     ldb    [rocblas_int]
  !>            ldb specifies the first dimension of B. ldb >= max( 1, m ).
  !> 
  !>     
    function rocblas_ztrmm(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb) bind(c, name="rocblas_ztrmm")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ztrmm
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
    end function

  
    function rocblas_strmm_batched(handle,side,uplo,transa,diag,m,n,alpha,a,lda,c,ldc,batch_count) bind(c, name="rocblas_strmm_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_strmm_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transa
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr) :: a
      integer(c_int),value :: lda
      type(c_ptr) :: c
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dtrmm_batched(handle,side,uplo,transa,diag,m,n,alpha,a,lda,c,ldc,batch_count) bind(c, name="rocblas_dtrmm_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dtrmm_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transa
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr) :: a
      integer(c_int),value :: lda
      type(c_ptr) :: c
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_ctrmm_batched(handle,side,uplo,transa,diag,m,n,alpha,a,lda,c,ldc,batch_count) bind(c, name="rocblas_ctrmm_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ctrmm_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transa
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr) :: a
      integer(c_int),value :: lda
      type(c_ptr) :: c
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 3 API
  !> 
  !>     \details
  !> 
  !>     trmm_batched performs one of the batched matrix-matrix operations
  !> 
  !>     B_i := alphaop( A_i )B_i,   or   B_i := alphaB_iop( A_i )  for i = 0, 1, ... batch_count -1
  !> 
  !>     where  alpha  is a scalar,  B_i  is an m by n matrix,  A_i  is a unit, or
  !>     non-unit,  upper or lower triangular matrix  and  op( A_i )  is one  of
  !> 
  !>         op( A_i ) = A_i   or   op( A_i ) = A_i^T   or   op( A_i ) = A_i^H.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     side    [rocblas_side]
  !>             Specifies whether op(A_i) multiplies B_i from the left or right as follows:
  !>             rocblas_side_left:       B_i := alphaop( A_i )B_i.
  !>             rocblas_side_right:      B_i := alphaB_iop( A_i ).
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             Specifies whether the matrix A is an uppoer or lower triangular matrix as follows:
  !>             rocblas_fill_upper:  A is an upper triangular matrix.
  !>             rocblas_fill_lower:  A is a  lower triangular matrix.
  !> 
  !>     @param[in]
  !>     transA  [rocblas_operation]
  !>             Specifies the form of op(A_i) to be used in the matrix multiplication as follows:
  !>             rocblas_operation_none:    op(A_i) = A_i.
  !>             rocblas_operation_transpose:      op(A_i) = A_i^T.
  !>             rocblas_operation_conjugate_transpose:  op(A_i) = A_i^H.
  !> 
  !>     @param[in]
  !>     diag    [rocblas_diagonal]
  !>             Specifies whether or not A_i is unit triangular as follows:
  !>             rocblas_diagonal_unit:      A_i is assumed to be unit triangular.
  !>             rocblas_diagonal_non_unit:  A_i is not assumed to be unit triangular.
  !> 
  !>     @param[in]
  !>     m       [rocblas_int]
  !>             m specifies the number of rows of B_i. m >= 0.
  !> 
  !>     @param[in]
  !>     n       [rocblas_int]
  !>             n specifies the number of columns of B_i. n >= 0.
  !> 
  !>     @param[in]
  !>     alpha
  !>             alpha specifies the scalar alpha. When alpha is
  !>             zero then A_i is not referenced and B_i need not be set before
  !>             entry.
  !> 
  !>     @param[in]
  !>     A       Device array of device pointers storing each matrix A_i on the GPU.
  !>             Each A_i is of dimension ( lda, k ), where k is m
  !>             when  side == rocblas_side_left  and
  !>             is  n  when  side == rocblas_side_right.
  !> 
  !>         When uplo == rocblas_fill_upper the  leading  k by k
  !>         upper triangular part of the array  A must contain the upper
  !>         triangular matrix  and the strictly lower triangular part of
  !>         A is not referenced.
  !> 
  !>         When uplo == rocblas_fill_lower the  leading  k by k
  !>         lower triangular part of the array  A must contain the lower
  !>         triangular matrix  and the strictly upper triangular part of
  !>         A is not referenced.
  !> 
  !>         Note that when  diag == rocblas_diagonal_unit  the diagonal elements of
  !>         A_i  are not referenced either,  but are assumed to be  unity.
  !> 
  !>     @param[in]
  !>     lda     [rocblas_int]
  !>             lda specifies the first dimension of A.
  !>             if side == rocblas_side_left,  lda >= max( 1, m ),
  !>             if side == rocblas_side_right, lda >= max( 1, n ).
  !> 
  !>     @param[in]
  !>     B       device array of device pointers storing each matrix B_i on the GPU.
  !>             On entry,  the leading  m by n part of the array  B_i must
  !>            contain the matrix  B_i,  and  on exit  is overwritten  by the
  !>            transformed matrix.
  !> 
  !>     @param[in]
  !>     ldb    [rocblas_int]
  !>            ldb specifies the first dimension of B_i. ldb >= max( 1, m ).
  !> 
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances i in the batch.
  !>     
    function rocblas_ztrmm_batched(handle,side,uplo,transa,diag,m,n,alpha,a,lda,c,ldc,batch_count) bind(c, name="rocblas_ztrmm_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ztrmm_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transa
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr) :: a
      integer(c_int),value :: lda
      type(c_ptr) :: c
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_strmm_strided_batched(handle,side,uplo,transa,diag,m,n,alpha,a,lda,stride_a,c,ldc,stride_c,batch_count) bind(c, name="rocblas_strmm_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_strmm_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transa
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: a
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_a
      type(c_ptr),value :: c
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_c
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dtrmm_strided_batched(handle,side,uplo,transa,diag,m,n,alpha,a,lda,stride_a,c,ldc,stride_c,batch_count) bind(c, name="rocblas_dtrmm_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dtrmm_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transa
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: a
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_a
      type(c_ptr),value :: c
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_c
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_ctrmm_strided_batched(handle,side,uplo,transa,diag,m,n,alpha,a,lda,stride_a,c,ldc,stride_c,batch_count) bind(c, name="rocblas_ctrmm_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ctrmm_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transa
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: a
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_a
      type(c_ptr),value :: c
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_c
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 3 API
  !> 
  !>     \details
  !> 
  !>     trmm_strided_batched performs one of the strided_batched matrix-matrix operations
  !> 
  !>     B_i := alphaop( A_i )B_i,   or   B_i := alphaB_iop( A_i )  for i = 0, 1, ... batch_count -1
  !> 
  !>     where  alpha  is a scalar,  B_i  is an m by n matrix,  A_i  is a unit, or
  !>     non-unit,  upper or lower triangular matrix  and  op( A_i )  is one  of
  !> 
  !>         op( A_i ) = A_i   or   op( A_i ) = A_i^T   or   op( A_i ) = A_i^H.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     side    [rocblas_side]
  !>             Specifies whether op(A_i) multiplies B_i from the left or right as follows:
  !>             rocblas_side_left:       B_i := alphaop( A_i )B_i.
  !>             rocblas_side_right:      B_i := alphaB_iop( A_i ).
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             Specifies whether the matrix A is an uppoer or lower triangular matrix as follows:
  !>             rocblas_fill_upper:  A is an upper triangular matrix.
  !>             rocblas_fill_lower:  A is a  lower triangular matrix.
  !> 
  !>     @param[in]
  !>     transA  [rocblas_operation]
  !>             Specifies the form of op(A_i) to be used in the matrix multiplication as follows:
  !>             rocblas_operation_none:    op(A_i) = A_i.
  !>             rocblas_operation_transpose:      op(A_i) = A_i^T.
  !>             rocblas_operation_conjugate_transpose:  op(A_i) = A_i^H.
  !> 
  !>     @param[in]
  !>     diag    [rocblas_diagonal]
  !>             Specifies whether or not A_i is unit triangular as follows:
  !>             rocblas_diagonal_unit:      A_i is assumed to be unit triangular.
  !>             rocblas_diagonal_non_unit:  A_i is not assumed to be unit triangular.
  !> 
  !>     @param[in]
  !>     m       [rocblas_int]
  !>             m specifies the number of rows of B_i. m >= 0.
  !> 
  !>     @param[in]
  !>     n       [rocblas_int]
  !>             n specifies the number of columns of B_i. n >= 0.
  !> 
  !>     @param[in]
  !>     alpha
  !>             alpha specifies the scalar alpha. When alpha is
  !>             zero then A_i is not referenced and B_i need not be set before
  !>             entry.
  !> 
  !>     @param[in]
  !>     A       Device pointer to the first matrix A_0 on the GPU.
  !>             Each A_i is of dimension ( lda, k ), where k is m
  !>             when  side == rocblas_side_left  and
  !>             is  n  when  side == rocblas_side_right.
  !> 
  !>         When uplo == rocblas_fill_upper the  leading  k by k
  !>         upper triangular part of the array  A must contain the upper
  !>         triangular matrix  and the strictly lower triangular part of
  !>         A is not referenced.
  !> 
  !>         When uplo == rocblas_fill_lower the  leading  k by k
  !>         lower triangular part of the array  A must contain the lower
  !>         triangular matrix  and the strictly upper triangular part of
  !>         A is not referenced.
  !> 
  !>         Note that when  diag == rocblas_diagonal_unit  the diagonal elements of
  !>         A_i  are not referenced either,  but are assumed to be  unity.
  !> 
  !>     @param[in]
  !>     lda     [rocblas_int]
  !>             lda specifies the first dimension of A.
  !>             if side == rocblas_side_left,  lda >= max( 1, m ),
  !>             if side == rocblas_side_right, lda >= max( 1, n ).
  !> 
  !>     @param[in]
  !>     stride_A  [rocblas_stride]
  !>               stride from the start of one matrix (A_i) and the next one (A_i+1)
  !> 
  !>     @param[in]
  !>     B       Device pointer to the first matrix B_0 on the GPU.
  !>             On entry,  the leading  m by n part of the array  B_i must
  !>            contain the matrix  B_i,  and  on exit  is overwritten  by the
  !>            transformed matrix.
  !> 
  !>     @param[in]
  !>     ldb    [rocblas_int]
  !>            ldb specifies the first dimension of B_i. ldb >= max( 1, m ).
  !> 
  !>            @param[in]
  !>     stride_B  [rocblas_stride]
  !>               stride from the start of one matrix (B_i) and the next one (B_i+1)
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances i in the batch.
  !>     
    function rocblas_ztrmm_strided_batched(handle,side,uplo,transa,diag,m,n,alpha,a,lda,stride_a,c,ldc,stride_c,batch_count) bind(c, name="rocblas_ztrmm_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ztrmm_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transa
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: a
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_a
      type(c_ptr),value :: c
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_c
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_strtri(handle,uplo,diag,n,A,lda,invA,ldinvA) bind(c, name="rocblas_strtri")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_strtri
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: invA
      integer(c_int),value :: ldinvA
    end function

  
    function rocblas_dtrtri(handle,uplo,diag,n,A,lda,invA,ldinvA) bind(c, name="rocblas_dtrtri")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dtrtri
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: invA
      integer(c_int),value :: ldinvA
    end function

  
    function rocblas_ctrtri(handle,uplo,diag,n,A,lda,invA,ldinvA) bind(c, name="rocblas_ctrtri")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ctrtri
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: invA
      integer(c_int),value :: ldinvA
    end function

  !> ! \brief BLAS Level 3 API
  !> 
  !>     \details
  !>     trtri  compute the inverse of a matrix A, namely, invA
  !> 
  !>         and write the result into invA;
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               specifies whether the upper 'rocblas_fill_upper' or lower 'rocblas_fill_lower'
  !>               if rocblas_fill_upper, the lower part of A is not referenced
  !>               if rocblas_fill_lower, the upper part of A is not referenced
  !>     @param[in]
  !>     diag      [rocblas_diagonal]
  !>               = 'rocblas_diagonal_non_unit', A is non-unit triangular;
  !>               = 'rocblas_diagonal_unit', A is unit triangular;
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               size of matrix A and invA
  !>     @param[in]
  !>     A         device pointer storing matrix A.
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of A.
  !>     @param[out]
  !>     invA      device pointer storing matrix invA.
  !>     @param[in]
  !>     ldinvA    [rocblas_int]
  !>               specifies the leading dimension of invA.
  !> 
  !> 
    function rocblas_ztrtri(handle,uplo,diag,n,A,lda,invA,ldinvA) bind(c, name="rocblas_ztrtri")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ztrtri
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: invA
      integer(c_int),value :: ldinvA
    end function

  
    function rocblas_strtri_batched(handle,uplo,diag,n,A,lda,invA,ldinvA,batch_count) bind(c, name="rocblas_strtri_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_strtri_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: invA
      integer(c_int),value :: ldinvA
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dtrtri_batched(handle,uplo,diag,n,A,lda,invA,ldinvA,batch_count) bind(c, name="rocblas_dtrtri_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dtrtri_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: invA
      integer(c_int),value :: ldinvA
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_ctrtri_batched(handle,uplo,diag,n,A,lda,invA,ldinvA,batch_count) bind(c, name="rocblas_ctrtri_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ctrtri_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: invA
      integer(c_int),value :: ldinvA
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 3 API
  !> 
  !>     \details
  !>     trtri_batched  compute the inverse of A_i and write into invA_i where
  !>                    A_i and invA_i are the i-th matrices in the batch,
  !>                    for i = 1, ..., batch_count.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               specifies whether the upper 'rocblas_fill_upper' or lower 'rocblas_fill_lower'
  !>     @param[in]
  !>     diag      [rocblas_diagonal]
  !>               = 'rocblas_diagonal_non_unit', A is non-unit triangular;
  !>               = 'rocblas_diagonal_unit', A is unit triangular;
  !>     @param[in]
  !>     n         [rocblas_int]
  !>     @param[in]
  !>     A         device array of device pointers storing each matrix A_i.
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of each A_i.
  !>     @param[out]
  !>     invA      device array of device pointers storing the inverse of each matrix A_i.
  !>               Partial inplace operation is supported, see below.
  !>               If UPLO = 'U', the leading N-by-N upper triangular part of the invA will store
  !>               the inverse of the upper triangular matrix, and the strictly lower
  !>               triangular part of invA is cleared.
  !>               If UPLO = 'L', the leading N-by-N lower triangular part of the invA will store
  !>               the inverse of the lower triangular matrix, and the strictly upper
  !>               triangular part of invA is cleared.
  !>     @param[in]
  !>     ldinvA    [rocblas_int]
  !>               specifies the leading dimension of each invA_i.
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>               numbers of matrices in the batch
  !>     
    function rocblas_ztrtri_batched(handle,uplo,diag,n,A,lda,invA,ldinvA,batch_count) bind(c, name="rocblas_ztrtri_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ztrtri_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: invA
      integer(c_int),value :: ldinvA
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_strtri_strided_batched(handle,uplo,diag,n,A,lda,stride_a,invA,ldinvA,stride_invA,batch_count) bind(c, name="rocblas_strtri_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_strtri_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_a
      type(c_ptr),value :: invA
      integer(c_int),value :: ldinvA
      integer(c_int64_t),value :: stride_invA
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dtrtri_strided_batched(handle,uplo,diag,n,A,lda,stride_a,invA,ldinvA,stride_invA,batch_count) bind(c, name="rocblas_dtrtri_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dtrtri_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_a
      type(c_ptr),value :: invA
      integer(c_int),value :: ldinvA
      integer(c_int64_t),value :: stride_invA
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_ctrtri_strided_batched(handle,uplo,diag,n,A,lda,stride_a,invA,ldinvA,stride_invA,batch_count) bind(c, name="rocblas_ctrtri_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ctrtri_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_a
      type(c_ptr),value :: invA
      integer(c_int),value :: ldinvA
      integer(c_int64_t),value :: stride_invA
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 3 API
  !> 
  !>     \details
  !>     trtri_strided_batched compute the inverse of A_i and write into invA_i where
  !>                    A_i and invA_i are the i-th matrices in the batch,
  !>                    for i = 1, ..., batch_count
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     uplo      [rocblas_fill]
  !>               specifies whether the upper 'rocblas_fill_upper' or lower 'rocblas_fill_lower'
  !>     @param[in]
  !>     diag      [rocblas_diagonal]
  !>               = 'rocblas_diagonal_non_unit', A is non-unit triangular;
  !>               = 'rocblas_diagonal_unit', A is unit triangular;
  !>     @param[in]
  !>     n         [rocblas_int]
  !>     @param[in]
  !>     A         device pointer pointing to address of first matrix A_1.
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of each A.
  !>     @param[in]
  !>     stride_a  [rocblas_stride]
  !>              "batch stride a": stride from the start of one A_i matrix to the next A_(i + 1).
  !>     @param[out]
  !>     invA      device pointer storing the inverses of each matrix A_i.
  !>               Partial inplace operation is supported, see below.
  !>               If UPLO = 'U', the leading N-by-N upper triangular part of the invA will store
  !>               the inverse of the upper triangular matrix, and the strictly lower
  !>               triangular part of invA is cleared.
  !>               If UPLO = 'L', the leading N-by-N lower triangular part of the invA will store
  !>               the inverse of the lower triangular matrix, and the strictly upper
  !>               triangular part of invA is cleared.
  !>     @param[in]
  !>     ldinvA    [rocblas_int]
  !>               specifies the leading dimension of each invA_i.
  !>     @param[in]
  !>     stride_invA  [rocblas_stride]
  !>                  "batch stride invA": stride from the start of one invA_i matrix to the next invA_(i + 1).
  !>     @param[in]
  !>     batch_count  [rocblas_int]
  !>                  numbers of matrices in the batch
  !>     
    function rocblas_ztrtri_strided_batched(handle,uplo,diag,n,A,lda,stride_a,invA,ldinvA,stride_invA,batch_count) bind(c, name="rocblas_ztrtri_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ztrtri_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_a
      type(c_ptr),value :: invA
      integer(c_int),value :: ldinvA
      integer(c_int64_t),value :: stride_invA
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_strsm(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb) bind(c, name="rocblas_strsm")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_strsm
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
    end function

  
    function rocblas_dtrsm(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb) bind(c, name="rocblas_dtrsm")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dtrsm
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
    end function

  
    function rocblas_ctrsm(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb) bind(c, name="rocblas_ctrsm")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ctrsm
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
    end function

  !> ! \brief BLAS Level 3 API
  !> 
  !>     \details
  !> 
  !>     trsm solves
  !> 
  !>         op(A)X = alphaB or  Xop(A) = alphaB,
  !> 
  !>     where alpha is a scalar, X and B are m by n matrices,
  !>     A is triangular matrix and op(A) is one of
  !> 
  !>         op( A ) = A   or   op( A ) = A^T   or   op( A ) = A^H.
  !> 
  !>     The matrix X is overwritten on B.
  !> 
  !>     Note about memory allocation:
  !>     When trsm is launched with a k evenly divisible by the internal block size of 128,
  !>     and is no larger than 10 of these blocks, the API takes advantage of utilizing pre-allocated
  !>     memory found in the handle to increase overall performance. This memory can be managed by using
  !>     the environment variable WORKBUF_TRSM_B_CHNK. When this variable is not set the device memory
  !>     used for temporary storage will default to 1 MB and may result in chunking, which in turn may
  !>     reduce performance. Under these circumstances it is recommended that WORKBUF_TRSM_B_CHNK be set
  !>     to the desired chunk of right hand sides to be used at a time.
  !> 
  !>     (where k is m when rocblas_side_left and is n when rocblas_side_right)
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     side    [rocblas_side]
  !>             rocblas_side_left:       op(A)X = alphaB.
  !>             rocblas_side_right:      Xop(A) = alphaB.
  !> 
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  A is an upper triangular matrix.
  !>             rocblas_fill_lower:  A is a  lower triangular matrix.
  !> 
  !>     @param[in]
  !>     transA  [rocblas_operation]
  !>             transB:    op(A) = A.
  !>             rocblas_operation_transpose:      op(A) = A^T.
  !>             rocblas_operation_conjugate_transpose:  op(A) = A^H.
  !> 
  !>     @param[in]
  !>     diag    [rocblas_diagonal]
  !>             rocblas_diagonal_unit:     A is assumed to be unit triangular.
  !>             rocblas_diagonal_non_unit:  A is not assumed to be unit triangular.
  !> 
  !>     @param[in]
  !>     m       [rocblas_int]
  !>             m specifies the number of rows of B. m >= 0.
  !> 
  !>     @param[in]
  !>     n       [rocblas_int]
  !>             n specifies the number of columns of B. n >= 0.
  !> 
  !>     @param[in]
  !>     alpha
  !>             device pointer or host pointer specifying the scalar alpha. When alpha is
  !>             &zero then A is not referenced and B need not be set before
  !>             entry.
  !> 
  !>     @param[in]
  !>     A       device pointer storing matrix A.
  !>             of dimension ( lda, k ), where k is m
  !>             when  rocblas_side_left  and
  !>             is  n  when  rocblas_side_right
  !>             only the upperlower triangular part is accessed.
  !> 
  !>     @param[in]
  !>     lda     [rocblas_int]
  !>             lda specifies the first dimension of A.
  !>             if side = rocblas_side_left,  lda >= max( 1, m ),
  !>             if side = rocblas_side_right, lda >= max( 1, n ).
  !> 
  !>     @param[in,out]
  !>     B       device pointer storing matrix B.
  !> 
  !>     @param[in]
  !>     ldb    [rocblas_int]
  !>            ldb specifies the first dimension of B. ldb >= max( 1, m ).
  !> 
  !>     
    function rocblas_ztrsm(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb) bind(c, name="rocblas_ztrsm")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ztrsm
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
    end function

  
    function rocblas_strsm_batched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb,batch_count) bind(c, name="rocblas_strsm_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_strsm_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dtrsm_batched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb,batch_count) bind(c, name="rocblas_dtrsm_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dtrsm_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_ctrsm_batched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb,batch_count) bind(c, name="rocblas_ctrsm_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ctrsm_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 3 API
  !>     \details
  !>     trsm_batched performs the following batched operation:
  !> 
  !>         op(A_i)X_i = alphaB_i or  X_iop(A_i) = alphaB_i, for i = 1, ..., batch_count.
  !> 
  !>     where alpha is a scalar, X and B are batched m by n matrices,
  !>     A is triangular batched matrix and op(A) is one of
  !> 
  !>         op( A ) = A   or   op( A ) = A^T   or   op( A ) = A^H.
  !> 
  !>     Each matrix X_i is overwritten on B_i for i = 1, ..., batch_count.
  !> 
  !>     Note about memory allocation:
  !>     When trsm is launched with a k evenly divisible by the internal block size of 128,
  !>     and is no larger than 10 of these blocks, the API takes advantage of utilizing pre-allocated
  !>     memory found in the handle to increase overall performance. This memory can be managed by using
  !>     the environment variable WORKBUF_TRSM_B_CHNK. When this variable is not set the device memory
  !>     used for temporary storage will default to 1 MB and may result in chunking, which in turn may
  !>     reduce performance. Under these circumstances it is recommended that WORKBUF_TRSM_B_CHNK be set
  !>     to the desired chunk of right hand sides to be used at a time.
  !>     (where k is m when rocblas_side_left and is n when rocblas_side_right)
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     side    [rocblas_side]
  !>             rocblas_side_left:       op(A)X = alphaB.
  !>             rocblas_side_right:      Xop(A) = alphaB.
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  each A_i is an upper triangular matrix.
  !>             rocblas_fill_lower:  each A_i is a  lower triangular matrix.
  !>     @param[in]
  !>     transA  [rocblas_operation]
  !>             transB:    op(A) = A.
  !>             rocblas_operation_transpose:      op(A) = A^T.
  !>             rocblas_operation_conjugate_transpose:  op(A) = A^H.
  !>     @param[in]
  !>     diag    [rocblas_diagonal]
  !>             rocblas_diagonal_unit:     each A_i is assumed to be unit triangular.
  !>             rocblas_diagonal_non_unit:  each A_i is not assumed to be unit triangular.
  !>     @param[in]
  !>     m       [rocblas_int]
  !>             m specifies the number of rows of each B_i. m >= 0.
  !>     @param[in]
  !>     n       [rocblas_int]
  !>             n specifies the number of columns of each B_i. n >= 0.
  !>     @param[in]
  !>     alpha
  !>             device pointer or host pointer specifying the scalar alpha. When alpha is
  !>             &zero then A is not referenced and B need not be set before
  !>             entry.
  !>     @param[in]
  !>     A       device array of device pointers storing each matrix A_i on the GPU.
  !>             Matricies are of dimension ( lda, k ), where k is m
  !>             when  rocblas_side_left  and is  n  when  rocblas_side_right
  !>             only the upperlower triangular part is accessed.
  !>     @param[in]
  !>     lda     [rocblas_int]
  !>             lda specifies the first dimension of each A_i.
  !>             if side = rocblas_side_left,  lda >= max( 1, m ),
  !>             if side = rocblas_side_right, lda >= max( 1, n ).
  !>     @param[in,out]
  !>     B       device array of device pointers storing each matrix B_i on the GPU.
  !>     @param[in]
  !>     ldb    [rocblas_int]
  !>            ldb specifies the first dimension of each B_i. ldb >= max( 1, m ).
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of trsm operatons in the batch.
  !>     
    function rocblas_ztrsm_batched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,B,ldb,batch_count) bind(c, name="rocblas_ztrsm_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ztrsm_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_strsm_strided_batched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,stride_a,B,ldb,stride_b,batch_count) bind(c, name="rocblas_strsm_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_strsm_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_a
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int64_t),value :: stride_b
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dtrsm_strided_batched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,stride_a,B,ldb,stride_b,batch_count) bind(c, name="rocblas_dtrsm_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dtrsm_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_a
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int64_t),value :: stride_b
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_ctrsm_strided_batched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,stride_a,B,ldb,stride_b,batch_count) bind(c, name="rocblas_ctrsm_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ctrsm_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_a
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int64_t),value :: stride_b
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 3 API
  !>     \details
  !>     trsm_srided_batched performs the following strided batched operation:
  !> 
  !>         op(A_i)X_i = alphaB_i or  X_iop(A_i) = alphaB_i, for i = 1, ..., batch_count.
  !> 
  !>     where alpha is a scalar, X and B are strided batched m by n matrices,
  !>     A is triangular strided batched matrix and op(A) is one of
  !> 
  !>         op( A ) = A   or   op( A ) = A^T   or   op( A ) = A^H.
  !> 
  !>     Each matrix X_i is overwritten on B_i for i = 1, ..., batch_count.
  !> 
  !>     Note about memory allocation:
  !>     When trsm is launched with a k evenly divisible by the internal block size of 128,
  !>     and is no larger than 10 of these blocks, the API takes advantage of utilizing pre-allocated
  !>     memory found in the handle to increase overall performance. This memory can be managed by using
  !>     the environment variable WORKBUF_TRSM_B_CHNK. When this variable is not set the device memory
  !>     used for temporary storage will default to 1 MB and may result in chunking, which in turn may
  !>     reduce performance. Under these circumstances it is recommended that WORKBUF_TRSM_B_CHNK be set
  !>     to the desired chunk of right hand sides to be used at a time.
  !>     (where k is m when rocblas_side_left and is n when rocblas_side_right)
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     side    [rocblas_side]
  !>             rocblas_side_left:       op(A)X = alphaB.
  !>             rocblas_side_right:      Xop(A) = alphaB.
  !>     @param[in]
  !>     uplo    [rocblas_fill]
  !>             rocblas_fill_upper:  each A_i is an upper triangular matrix.
  !>             rocblas_fill_lower:  each A_i is a  lower triangular matrix.
  !>     @param[in]
  !>     transA  [rocblas_operation]
  !>             transB:    op(A) = A.
  !>             rocblas_operation_transpose:      op(A) = A^T.
  !>             rocblas_operation_conjugate_transpose:  op(A) = A^H.
  !>     @param[in]
  !>     diag    [rocblas_diagonal]
  !>             rocblas_diagonal_unit:     each A_i is assumed to be unit triangular.
  !>             rocblas_diagonal_non_unit:  each A_i is not assumed to be unit triangular.
  !>     @param[in]
  !>     m       [rocblas_int]
  !>             m specifies the number of rows of each B_i. m >= 0.
  !>     @param[in]
  !>     n       [rocblas_int]
  !>             n specifies the number of columns of each B_i. n >= 0.
  !>     @param[in]
  !>     alpha
  !>             device pointer or host pointer specifying the scalar alpha. When alpha is
  !>             &zero then A is not referenced and B need not be set before
  !>             entry.
  !>     @param[in]
  !>     A       device pointer pointing to the first matrix A_1.
  !>             of dimension ( lda, k ), where k is m
  !>             when  rocblas_side_left  and
  !>             is  n  when  rocblas_side_right
  !>             only the upperlower triangular part is accessed.
  !>     @param[in]
  !>     lda     [rocblas_int]
  !>             lda specifies the first dimension of each A_i.
  !>             if side = rocblas_side_left,  lda >= max( 1, m ),
  !>             if side = rocblas_side_right, lda >= max( 1, n ).
  !>     @param[in]
  !>     stride_a [rocblas_stride]
  !>              stride from the start of one A_i matrix to the next A_(i + 1).
  !>     @param[in,out]
  !>     B       device pointer pointing to the first matrix B_1.
  !>     @param[in]
  !>     ldb    [rocblas_int]
  !>            ldb specifies the first dimension of each B_i. ldb >= max( 1, m ).
  !>     @param[in]
  !>     stride_b [rocblas_stride]
  !>              stride from the start of one B_i matrix to the next B_(i + 1).
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of trsm operatons in the batch.
  !>     
    function rocblas_ztrsm_strided_batched(handle,side,uplo,transA,diag,m,n,alpha,A,lda,stride_a,B,ldb,stride_b,batch_count) bind(c, name="rocblas_ztrsm_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ztrsm_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_diagonal_non_unit)),value :: diag
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_a
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int64_t),value :: stride_b
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_sgemm(handle,transA,transB,m,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="rocblas_sgemm")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sgemm
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_operation_none)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_float) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
    function rocblas_dgemm(handle,transA,transB,m,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="rocblas_dgemm")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dgemm
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_operation_none)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_double) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
    function rocblas_hgemm(handle,transA,transB,m,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="rocblas_hgemm")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_hgemm
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_operation_none)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      type(c_ptr) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
    end function

  
    function rocblas_cgemm(handle,transA,transB,m,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="rocblas_cgemm")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cgemm
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_operation_none)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      complex(c_float_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  !> ! \brief BLAS Level 3 API
  !> 
  !>     \details
  !>     xGEMM performs one of the matrix-matrix operations
  !> 
  !>         C = alphaop( A )op( B ) + betaC,
  !> 
  !>     where op( X ) is one of
  !> 
  !>         op( X ) = X      or
  !>         op( X ) = XT   or
  !>         op( X ) = XH,
  !> 
  !>     alpha and beta are scalars, and A, B and C are matrices, with
  !>     op( A ) an m by k matrix, op( B ) a k by n matrix and C an m by n matrix.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     transA    [rocblas_operation]
  !>               specifies the form of op( A )
  !>     @param[in]
  !>     transB    [rocblas_operation]
  !>               specifies the form of op( B )
  !>     @param[in]
  !>     m         [rocblas_int]
  !>               number or rows of matrices op( A ) and C
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               number of columns of matrices op( B ) and C
  !>     @param[in]
  !>     k         [rocblas_int]
  !>               number of columns of matrix op( A ) and number of rows of matrix op( B )
  !>     @param[in]
  !>     alpha     device pointer or host pointer specifying the scalar alpha.
  !>     @param[in]
  !>     A         device pointer storing matrix A.
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of A.
  !>     @param[in]
  !>     B         device pointer storing matrix B.
  !>     @param[in]
  !>     ldb       [rocblas_int]
  !>               specifies the leading dimension of B.
  !>     @param[in]
  !>     beta      device pointer or host pointer specifying the scalar beta.
  !>     @param[in, out]
  !>     C         device pointer storing matrix C on the GPU.
  !>     @param[in]
  !>     ldc       [rocblas_int]
  !>               specifies the leading dimension of C.
  !> 
  !>     
    function rocblas_zgemm(handle,transA,transB,m,n,k,alpha,A,lda,B,ldb,beta,C,ldc) bind(c, name="rocblas_zgemm")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zgemm
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_operation_none)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      complex(c_double_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
    function rocblas_sgemm_batched(handle,transA,transB,m,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batch_count) bind(c, name="rocblas_sgemm_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sgemm_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_operation_none)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      real(c_float) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dgemm_batched(handle,transA,transB,m,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batch_count) bind(c, name="rocblas_dgemm_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dgemm_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_operation_none)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      real(c_double) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_hgemm_batched(handle,transA,transB,m,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batch_count) bind(c, name="rocblas_hgemm_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_hgemm_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_operation_none)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      type(c_ptr) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_cgemm_batched(handle,transA,transB,m,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batch_count) bind(c, name="rocblas_cgemm_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cgemm_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_operation_none)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      complex(c_float_complex) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 3 API
  !>      \details
  !>     xGEMM_BATCHED performs one of the batched matrix-matrix operations
  !>          C_i = alphaop( A_i )op( B_i ) + betaC_i, for i = 1, ..., batch_count.
  !>      where op( X ) is one of
  !>          op( X ) = X      or
  !>         op( X ) = XT   or
  !>         op( X ) = XH,
  !>      alpha and beta are scalars, and A, B and C are strided batched matrices, with
  !>     op( A ) an m by k by batch_count strided_batched matrix,
  !>     op( B ) an k by n by batch_count strided_batched matrix and
  !>     C an m by n by batch_count strided_batched matrix.
  !>     @param[in]
  !>     handle    [rocblas_handle
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     transA    [rocblas_operation]
  !>               specifies the form of op( A )
  !>     @param[in]
  !>     transB    [rocblas_operation]
  !>               specifies the form of op( B )
  !>     @param[in]
  !>     m         [rocblas_int]
  !>               matrix dimention m.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               matrix dimention n.
  !>     @param[in]
  !>     k         [rocblas_int]
  !>               matrix dimention k.
  !>     @param[in]
  !>     alpha     device pointer or host pointer specifying the scalar alpha.
  !>     @param[in]
  !>     A         device array of device pointers storing each matrix A_i.
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of each A_i.
  !>     @param[in]
  !>     B         device array of device pointers storing each matrix B_i.
  !>     @param[in]
  !>     ldb       [rocblas_int]
  !>               specifies the leading dimension of each B_i.
  !>     @param[in]
  !>     beta      device pointer or host pointer specifying the scalar beta.
  !>     @param[in, out]
  !>     C         device array of device pointers storing each matrix C_i.
  !>     @param[in]
  !>     ldc       [rocblas_int]
  !>               specifies the leading dimension of each C_i.
  !>     @param[in]
  !>     batch_count
  !>               [rocblas_int]
  !>               number of gemm operations in the batch
  !>      
    function rocblas_zgemm_batched(handle,transa,transb,m,n,k,alpha,A,lda,B,ldb,beta,C,ldc,batch_count) bind(c, name="rocblas_zgemm_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zgemm_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: transa
      integer(kind(rocblas_operation_none)),value :: transb
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      complex(c_double_complex) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_sgemm_strided_batched(handle,transA,transB,m,n,k,alpha,A,lda,stride_a,B,ldb,stride_b,beta,C,ldc,stride_c,batch_count) bind(c, name="rocblas_sgemm_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sgemm_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_operation_none)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_a
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int64_t),value :: stride_b
      real(c_float) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_c
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dgemm_strided_batched(handle,transA,transB,m,n,k,alpha,A,lda,stride_a,B,ldb,stride_b,beta,C,ldc,stride_c,batch_count) bind(c, name="rocblas_dgemm_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dgemm_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_operation_none)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_a
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int64_t),value :: stride_b
      real(c_double) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_c
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_hgemm_strided_batched(handle,transA,transB,m,n,k,alpha,A,lda,stride_a,B,ldb,stride_b,beta,C,ldc,stride_c,batch_count) bind(c, name="rocblas_hgemm_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_hgemm_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_operation_none)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_a
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      integer(c_int64_t),value :: stride_b
      type(c_ptr) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_c
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_hgemm_kernel_name(handle,transA,transB,m,n,k,alpha,A,lda,stride_a,B,ldb,stride_b,beta,C,ldc,stride_c,batch_count) bind(c, name="rocblas_hgemm_kernel_name")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_hgemm_kernel_name
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_operation_none)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_a
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      integer(c_int64_t),value :: stride_b
      type(c_ptr) :: beta
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_c
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_sgemm_kernel_name(handle,transA,transB,m,n,k,alpha,A,lda,stride_a,B,ldb,stride_b,beta,C,ldc,stride_c,batch_count) bind(c, name="rocblas_sgemm_kernel_name")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sgemm_kernel_name
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_operation_none)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_a
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int64_t),value :: stride_b
      real(c_float) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_c
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dgemm_kernel_name(handle,transA,transB,m,n,k,alpha,A,lda,stride_a,B,ldb,stride_b,beta,C,ldc,stride_c,batch_count) bind(c, name="rocblas_dgemm_kernel_name")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dgemm_kernel_name
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_operation_none)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_a
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int64_t),value :: stride_b
      real(c_double) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_c
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_cgemm_strided_batched(handle,transa,transb,m,n,k,alpha,A,lda,stride_a,B,ldb,stride_b,beta,C,ldc,stride_c,batch_count) bind(c, name="rocblas_cgemm_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cgemm_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: transa
      integer(kind(rocblas_operation_none)),value :: transb
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_a
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int64_t),value :: stride_b
      complex(c_float_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_c
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 3 API
  !> 
  !>     \details
  !>     xGEMM_STRIDED_BATCHED performs one of the strided batched matrix-matrix operations
  !> 
  !>         C_i = alphaop( A_i )op( B_i ) + betaC_i, for i = 1, ..., batch_count.
  !> 
  !>     where op( X ) is one of
  !> 
  !>         op( X ) = X      or
  !>         op( X ) = XT   or
  !>         op( X ) = XH,
  !> 
  !>     alpha and beta are scalars, and A, B and C are strided batched matrices, with
  !>     op( A ) an m by k by batch_count strided_batched matrix,
  !>     op( B ) an k by n by batch_count strided_batched matrix and
  !>     C an m by n by batch_count strided_batched matrix.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     transA    [rocblas_operation]
  !>               specifies the form of op( A )
  !>     @param[in]
  !>     transB    [rocblas_operation]
  !>               specifies the form of op( B )
  !>     @param[in]
  !>     m         [rocblas_int]
  !>               matrix dimention m.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               matrix dimention n.
  !>     @param[in]
  !>     k         [rocblas_int]
  !>               matrix dimention k.
  !>     @param[in]
  !>     alpha     device pointer or host pointer specifying the scalar alpha.
  !>     @param[in]
  !>     A         device pointer pointing to the first matrix A_1.
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of each A_i.
  !>     @param[in]
  !>     stride_a  [rocblas_stride]
  !>               stride from the start of one A_i matrix to the next A_(i + 1).
  !>     @param[in]
  !>     B         device pointer pointing to the first matrix B_1.
  !>     @param[in]
  !>     ldb       [rocblas_int]
  !>               specifies the leading dimension of each B_i.
  !>     @param[in]
  !>     stride_b  [rocblas_stride]
  !>               stride from the start of one B_i matrix to the next B_(i + 1).
  !>     @param[in]
  !>     beta      device pointer or host pointer specifying the scalar beta.
  !>     @param[in, out]
  !>     C         device pointer pointing to the first matrix C_1.
  !>     @param[in]
  !>     ldc       [rocblas_int]
  !>               specifies the leading dimension of each C_i.
  !>     @param[in]
  !>     stride_c  [rocblas_stride]
  !>               stride from the start of one C_i matrix to the next C_(i + 1).
  !>     @param[in]
  !>     batch_count
  !>               [rocblas_int]
  !>               number of gemm operatons in the batch
  !> 
  !>     
    function rocblas_zgemm_strided_batched(handle,transa,transb,m,n,k,alpha,A,lda,stride_a,B,ldb,stride_b,beta,C,ldc,stride_c,batch_count) bind(c, name="rocblas_zgemm_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zgemm_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: transa
      integer(kind(rocblas_operation_none)),value :: transb
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_a
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int64_t),value :: stride_b
      complex(c_double_complex) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_c
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_sdgmm(handle,side,m,n,A,lda,x,incx,C,ldc) bind(c, name="rocblas_sdgmm")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sdgmm
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
    function rocblas_ddgmm(handle,side,m,n,A,lda,x,incx,C,ldc) bind(c, name="rocblas_ddgmm")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ddgmm
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
    function rocblas_cdgmm(handle,side,m,n,A,lda,x,incx,C,ldc) bind(c, name="rocblas_cdgmm")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cdgmm
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  !> ! \brief BLAS Level 3 API
  !> 
  !>     \details
  !>     xDGMM performs one of the matrix-matrix operations
  !> 
  !>         C = A  diag(x) if side == rocblas_side_right
  !>         C = diag(x)  A if side == rocblas_side_left
  !> 
  !>     where C and A are m by n dimensional matrices. diag( x ) is a diagonal matrix
  !>     and x is vector of dimension n if side == rocblas_side_right and dimension m
  !>     if side == rocblas_side_left.
  !> 
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     side      [rocblas_side]
  !>               specifies the side of diag(x)
  !>     @param[in]
  !>     m         [rocblas_int]
  !>               matrix dimension m.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               matrix dimension n.
  !>     @param[in]
  !>     A         device pointer storing matrix A.
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of A.
  !>     @param[in]
  !>     x         device pointer storing vector x.
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment between values of x
  !>     @param[in, out]
  !>     C         device pointer storing matrix C.
  !>     @param[in]
  !>     ldc       [rocblas_int]
  !>               specifies the leading dimension of C.
  !> 
  !>     
    function rocblas_zdgmm(handle,side,m,n,A,lda,x,incx,C,ldc) bind(c, name="rocblas_zdgmm")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zdgmm
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
    function rocblas_sdgmm_batched(handle,side,m,n,A,lda,x,incx,C,ldc,batch_count) bind(c, name="rocblas_sdgmm_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sdgmm_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_ddgmm_batched(handle,side,m,n,A,lda,x,incx,C,ldc,batch_count) bind(c, name="rocblas_ddgmm_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ddgmm_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_cdgmm_batched(handle,side,m,n,A,lda,x,incx,C,ldc,batch_count) bind(c, name="rocblas_cdgmm_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cdgmm_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 3 API
  !> 
  !>     \details
  !>     xDGMM_batched performs one of the batched matrix-matrix operations
  !> 
  !>         C_i = A_i  diag(x_i) for i = 0, 1, ... batch_count-1 if side == rocblas_side_right
  !>         C_i = diag(x_i)  A_i for i = 0, 1, ... batch_count-1 if side == rocblas_side_left
  !> 
  !>     where C_i and A_i are m by n dimensional matrices. diag(x_i) is a diagonal matrix
  !>     and x_i is vector of dimension n if side == rocblas_side_right and dimension m
  !>     if side == rocblas_side_left.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     side      [rocblas_side]
  !>               specifies the side of diag(x)
  !>     @param[in]
  !>     m         [rocblas_int]
  !>               matrix dimension m.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               matrix dimension n.
  !>     @param[in]
  !>     A         device array of device pointers storing each matrix A_i on the GPU.
  !>               Each A_i is of dimension ( lda, n )
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of A_i.
  !>     @param[in]
  !>     x         device array of device pointers storing each vector x_i on the GPU.
  !>               Each x_i is of dimension n if side == rocblas_side_right and dimension
  !>               m if side == rocblas_side_left
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment between values of x_i
  !>     @param[in, out]
  !>     C         device array of device pointers storing each matrix C_i on the GPU.
  !>               Each C_i is of dimension ( ldc, n ).
  !>     @param[in]
  !>     ldc       [rocblas_int]
  !>               specifies the leading dimension of C_i.
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances in the batch.
  !> 
  !>     
    function rocblas_zdgmm_batched(handle,side,m,n,A,lda,x,incx,C,ldc,batch_count) bind(c, name="rocblas_zdgmm_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zdgmm_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr) :: x
      integer(c_int),value :: incx
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_sdgmm_strided_batched(handle,side,m,n,A,lda,stride_a,x,incx,stride_x,C,ldc,stride_c,batch_count) bind(c, name="rocblas_sdgmm_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sdgmm_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_a
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_c
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_ddgmm_strided_batched(handle,side,m,n,A,lda,stride_a,x,incx,stride_x,C,ldc,stride_c,batch_count) bind(c, name="rocblas_ddgmm_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_ddgmm_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_a
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_c
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_cdgmm_strided_batched(handle,side,m,n,A,lda,stride_a,x,incx,stride_x,C,ldc,stride_c,batch_count) bind(c, name="rocblas_cdgmm_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cdgmm_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_a
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_c
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 3 API
  !> 
  !>     \details
  !>     xDGMM_strided_batched performs one of the batched matrix-matrix operations
  !> 
  !>         C_i = A_i  diag(x_i)   if side == rocblas_side_right   for i = 0, 1, ... batch_count-1
  !>         C_i = diag(x_i)  A_i   if side == rocblas_side_left    for i = 0, 1, ... batch_count-1
  !> 
  !>     where C_i and A_i are m by n dimensional matrices. diag(x_i) is a diagonal matrix
  !>     and x_i is vector of dimension n if side == rocblas_side_right and dimension m
  !>     if side == rocblas_side_left.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     side      [rocblas_side]
  !>               specifies the side of diag(x)
  !>     @param[in]
  !>     m         [rocblas_int]
  !>               matrix dimension m.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               matrix dimension n.
  !>     @param[in]
  !>     A         device pointer to the first matrix A_0 on the GPU.
  !>               Each A_i is of dimension ( lda, n )
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of A.
  !>     @param[in]
  !>     stride_A  [rocblas_stride]
  !>               stride from the start of one matrix (A_i) and the next one (A_i+1)
  !>     @param[in]
  !>     x         pointer to the first vector x_0 on the GPU.
  !>               Each x_i is of dimension n if side == rocblas_side_right and dimension
  !>               m if side == rocblas_side_left
  !>     @param[in]
  !>     incx      [rocblas_int]
  !>               specifies the increment between values of x
  !>     @param[in]
  !>     stride_x  [rocblas_stride]
  !>               stride from the start of one vector(x_i) and the next one (x_i+1)
  !>     @param[in, out]
  !>     C         device pointer to the first matrix C_0 on the GPU.
  !>               Each C_i is of dimension ( ldc, n ).
  !>     @param[in]
  !>     ldc       [rocblas_int]
  !>               specifies the leading dimension of C.
  !>     @param[in]
  !>     stride_C  [rocblas_stride]
  !>               stride from the start of one matrix (C_i) and the next one (C_i+1)
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances i in the batch.
  !> 
  !>     
    function rocblas_zdgmm_strided_batched(handle,side,m,n,A,lda,stride_a,x,incx,stride_x,C,ldc,stride_c,batch_count) bind(c, name="rocblas_zdgmm_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zdgmm_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_a
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      integer(c_int64_t),value :: stride_x
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_c
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_sgeam(handle,transA,transB,m,n,alpha,A,lda,beta,B,ldb,C,ldc) bind(c, name="rocblas_sgeam")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sgeam
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_operation_none)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_float) :: beta
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
    function rocblas_dgeam(handle,transA,transB,m,n,alpha,A,lda,beta,B,ldb,C,ldc) bind(c, name="rocblas_dgeam")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dgeam
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_operation_none)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      real(c_double) :: beta
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
    function rocblas_cgeam(handle,transA,transB,m,n,alpha,A,lda,beta,B,ldb,C,ldc) bind(c, name="rocblas_cgeam")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cgeam
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_operation_none)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_float_complex) :: beta
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  !> ! \brief BLAS Level 3 API
  !> 
  !>     \details
  !>     xGEAM performs one of the matrix-matrix operations
  !> 
  !>         C = alphaop( A ) + betaop( B ),
  !> 
  !>     where op( X ) is one of
  !> 
  !>         op( X ) = X      or
  !>         op( X ) = XT   or
  !>         op( X ) = XH,
  !> 
  !>     alpha and beta are scalars, and A, B and C are matrices, with
  !>     op( A ) an m by n matrix, op( B ) an m by n matrix, and C an m by n matrix.
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     transA    [rocblas_operation]
  !>               specifies the form of op( A )
  !>     @param[in]
  !>     transB    [rocblas_operation]
  !>               specifies the form of op( B )
  !>     @param[in]
  !>     m         [rocblas_int]
  !>               matrix dimension m.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               matrix dimension n.
  !>     @param[in]
  !>     alpha     device pointer or host pointer specifying the scalar alpha.
  !>     @param[in]
  !>     A         device pointer storing matrix A.
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of A.
  !>     @param[in]
  !>     beta      device pointer or host pointer specifying the scalar beta.
  !>     @param[in]
  !>     B         device pointer storing matrix B.
  !>     @param[in]
  !>     ldb       [rocblas_int]
  !>               specifies the leading dimension of B.
  !>     @param[in, out]
  !>     C         device pointer storing matrix C.
  !>     @param[in]
  !>     ldc       [rocblas_int]
  !>               specifies the leading dimension of C.
  !> 
  !>     
    function rocblas_zgeam(handle,transA,transB,m,n,alpha,A,lda,beta,B,ldb,C,ldc) bind(c, name="rocblas_zgeam")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zgeam
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_operation_none)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      complex(c_double_complex) :: beta
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
    function rocblas_sgeam_batched(handle,transA,transB,m,n,alpha,A,lda,beta,B,ldb,C,ldc,batch_count) bind(c, name="rocblas_sgeam_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sgeam_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_operation_none)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      real(c_float) :: beta
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dgeam_batched(handle,transA,transB,m,n,alpha,A,lda,beta,B,ldb,C,ldc,batch_count) bind(c, name="rocblas_dgeam_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dgeam_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_operation_none)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      real(c_double) :: beta
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_cgeam_batched(handle,transA,transB,m,n,alpha,A,lda,beta,B,ldb,C,ldc,batch_count) bind(c, name="rocblas_cgeam_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cgeam_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_operation_none)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      complex(c_float_complex) :: beta
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 3 API
  !> 
  !>     \details
  !>     xGEAM_batched performs one of the batched matrix-matrix operations
  !> 
  !>         C_i = alphaop( A_i ) + betaop( B_i )  for i = 0, 1, ... batch_count - 1
  !> 
  !>     where alpha and beta are scalars, and op(A_i), op(B_i) and C_i are m by n matrices
  !>     and op( X ) is one of
  !> 
  !>         op( X ) = X      or
  !>         op( X ) = XT
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !>     @param[in]
  !>     transA    [rocblas_operation]
  !>               specifies the form of op( A )
  !>     @param[in]
  !>     transB    [rocblas_operation]
  !>               specifies the form of op( B )
  !>     @param[in]
  !>     m         [rocblas_int]
  !>               matrix dimension m.
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               matrix dimension n.
  !>     @param[in]
  !>     alpha     device pointer or host pointer specifying the scalar alpha.
  !>     @param[in]
  !>     A         device array of device pointers storing each matrix A_i on the GPU.
  !>               Each A_i is of dimension ( lda, k ), where k is m
  !>               when  transA == rocblas_operation_none and
  !>               is  n  when  transA == rocblas_operation_transpose.
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of A.
  !>     @param[in]
  !>     beta      device pointer or host pointer specifying the scalar beta.
  !>     @param[in]
  !>     B         device array of device pointers storing each matrix B_i on the GPU.
  !>               Each B_i is of dimension ( ldb, k ), where k is m
  !>               when  transB == rocblas_operation_none and
  !>               is  n  when  transB == rocblas_operation_transpose.
  !>     @param[in]
  !>     ldb       [rocblas_int]
  !>               specifies the leading dimension of B.
  !>     @param[in, out]
  !>     C         device array of device pointers storing each matrix C_i on the GPU.
  !>               Each C_i is of dimension ( ldc, n ).
  !>     @param[in]
  !>     ldc       [rocblas_int]
  !>               specifies the leading dimension of C.
  !> 
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances i in the batch.
  !> 
  !>     
    function rocblas_zgeam_batched(handle,transA,transB,m,n,alpha,A,lda,beta,B,ldb,C,ldc,batch_count) bind(c, name="rocblas_zgeam_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zgeam_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_operation_none)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr) :: A
      integer(c_int),value :: lda
      complex(c_double_complex) :: beta
      type(c_ptr) :: B
      integer(c_int),value :: ldb
      type(c_ptr) :: C
      integer(c_int),value :: ldc
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_sgeam_strided_batched(handle,transA,transB,m,n,alpha,A,lda,stride_a,beta,B,ldb,stride_b,C,ldc,stride_c,batch_count) bind(c, name="rocblas_sgeam_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_sgeam_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_operation_none)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_a
      real(c_float) :: beta
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int64_t),value :: stride_b
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_c
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_dgeam_strided_batched(handle,transA,transB,m,n,alpha,A,lda,stride_a,beta,B,ldb,stride_b,C,ldc,stride_c,batch_count) bind(c, name="rocblas_dgeam_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_dgeam_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_operation_none)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_a
      real(c_double) :: beta
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int64_t),value :: stride_b
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_c
      integer(c_int),value :: batch_count
    end function

  
    function rocblas_cgeam_strided_batched(handle,transA,transB,m,n,alpha,A,lda,stride_a,beta,B,ldb,stride_b,C,ldc,stride_c,batch_count) bind(c, name="rocblas_cgeam_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_cgeam_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_operation_none)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_a
      complex(c_float_complex) :: beta
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int64_t),value :: stride_b
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_c
      integer(c_int),value :: batch_count
    end function

  !> ! \brief BLAS Level 3 API
  !> 
  !>     \details
  !>     xGEAM_strided_batched performs one of the batched matrix-matrix operations
  !> 
  !>         C_i = alphaop( A_i ) + betaop( B_i )  for i = 0, 1, ... batch_count - 1
  !> 
  !>     where alpha and beta are scalars, and op(A_i), op(B_i) and C_i are m by n matrices
  !>     and op( X ) is one of
  !> 
  !>         op( X ) = X      or
  !>         op( X ) = XT
  !> 
  !>     @param[in]
  !>     handle    [rocblas_handle]
  !>               handle to the rocblas library context queue.
  !> 
  !>     @param[in]
  !>     transA    [rocblas_operation]
  !>               specifies the form of op( A )
  !> 
  !>     @param[in]
  !>     transB    [rocblas_operation]
  !>               specifies the form of op( B )
  !> 
  !>     @param[in]
  !>     m         [rocblas_int]
  !>               matrix dimension m.
  !> 
  !>     @param[in]
  !>     n         [rocblas_int]
  !>               matrix dimension n.
  !> 
  !>     @param[in]
  !>     alpha     device pointer or host pointer specifying the scalar alpha.
  !> 
  !>     @param[in]
  !>     A         device pointer to the first matrix A_0 on the GPU.
  !>               Each A_i is of dimension ( lda, k ), where k is m
  !>               when  transA == rocblas_operation_none and
  !>               is  n  when  transA == rocblas_operation_transpose.
  !> 
  !>     @param[in]
  !>     lda       [rocblas_int]
  !>               specifies the leading dimension of A.
  !> 
  !>     @param[in]
  !>     stride_A  [rocblas_stride]
  !>               stride from the start of one matrix (A_i) and the next one (A_i+1)
  !> 
  !>     @param[in]
  !>     beta      device pointer or host pointer specifying the scalar beta.
  !> 
  !>     @param[in]
  !>     B         pointer to the first matrix B_0 on the GPU.
  !>               Each B_i is of dimension ( ldb, k ), where k is m
  !>               when  transB == rocblas_operation_none and
  !>               is  n  when  transB == rocblas_operation_transpose.
  !> 
  !>     @param[in]
  !>     ldb       [rocblas_int]
  !>               specifies the leading dimension of B.
  !> 
  !>     @param[in]
  !>     stride_B  [rocblas_stride]
  !>               stride from the start of one matrix (B_i) and the next one (B_i+1)
  !> 
  !>     @param[in, out]
  !>     C         pointer to the first matrix C_0 on the GPU.
  !>               Each C_i is of dimension ( ldc, n ).
  !> 
  !>     @param[in]
  !>     ldc       [rocblas_int]
  !>               specifies the leading dimension of C.
  !> 
  !>     @param[in]
  !>     stride_C  [rocblas_stride]
  !>               stride from the start of one matrix (C_i) and the next one (C_i+1)
  !> 
  !>     @param[in]
  !>     batch_count [rocblas_int]
  !>                 number of instances i in the batch.
  !> 
  !>     
    function rocblas_zgeam_strided_batched(handle,transA,transB,m,n,alpha,A,lda,stride_a,beta,B,ldb,stride_b,C,ldc,stride_c,batch_count) bind(c, name="rocblas_zgeam_strided_batched")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_zgeam_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_operation_none)),value :: transA
      integer(kind(rocblas_operation_none)),value :: transB
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: stride_a
      complex(c_double_complex) :: beta
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      integer(c_int64_t),value :: stride_b
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
      integer(c_int64_t),value :: stride_c
      integer(c_int),value :: batch_count
    end function

  !> ! \brief   loads char buf with the rocblas library version. size_t len
  !>     is the maximum length of char buf.
  !>     \details
  !> 
  !>     @param[in, out]
  !>     buf             pointer to buffer for version string
  !> 
  !>     @param[in]
  !>     len             length of buf
  !> 
  !>  
    function rocblas_get_version_string(buf,len) bind(c, name="rocblas_get_version_string")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_get_version_string
      type(c_ptr),value :: buf
      integer(c_size_t),value :: len
    end function

  !> ! \brief
  !>     \details
  !>     Indicates that subsequent rocBLAS kernel calls should collect the optimal device memory size in bytes for their given kernel arguments,
  !>     and keep track of the maximum.
  !>     Each kernel call can reuse temporary device memory on the same stream, so the maximum is collected.
  !>     Returns rocblas_status_size_query_mismatch if another size query is already in progress; returns rocblas_status_success otherwise.
  !>     @param[in]
  !>     handle          rocblas handle
  !>  
    function rocblas_start_device_memory_size_query(handle) bind(c, name="rocblas_start_device_memory_size_query")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_start_device_memory_size_query
      type(c_ptr),value :: handle
    end function

  !> ! \brief
  !>     \details
  !>     Stops collecting optimal device memory size information
  !>     Returns rocblas_status_size_query_mismatch if a collection is not underway; rocblas_status_invalid_handle if handle is nullptr;
  !>     rocblas_status_invalid_pointer if size is nullptr; rocblas_status_success otherwise
  !>     @param[in]
  !>     handle          rocblas handle
  !>     @param[out]
  !>     size             maximum of the optimal sizes collected
  !>  
    function rocblas_stop_device_memory_size_query(handle,mySize) bind(c, name="rocblas_stop_device_memory_size_query")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_stop_device_memory_size_query
      type(c_ptr),value :: handle
      type(c_ptr),value :: mySize
    end function

  !> ! \brief
  !>     \details
  !>     Gets the current device memory size for the handle
  !>     Returns rocblas_status_invalid_handle if handle is nullptr; rocblas_status_invalid_pointer if size is nullptr; rocblas_status_success otherwise
  !>     @param[in]
  !>     handle          rocblas handle
  !>     @param[out]
  !>     size             current device memory size for the handle
  !>  
    function rocblas_get_device_memory_size(handle,mySize) bind(c, name="rocblas_get_device_memory_size")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_get_device_memory_size
      type(c_ptr),value :: handle
      type(c_ptr),value :: mySize
    end function

  !> ! \brief
  !>     \details
  !>     Changes the size of allocated device memory at runtime.
  !> 
  !>     Any previously allocated device memory is freed.
  !> 
  !>     If size > 0 sets the device memory size to the specified size (in bytes)
  !>     If size == 0 frees the memory allocated so far, and lets rocBLAS manage device memory in the future, expanding it when necessary
  !>     Returns rocblas_status_invalid_handle if handle is nullptr; rocblas_status_invalid_pointer if size is nullptr; rocblas_status_success otherwise
  !>     @param[in]
  !>     handle          rocblas handle
  !>     @param[in]
  !>     size             size of allocated device memory
  !>  
    function rocblas_set_device_memory_size(handle,mySize) bind(c, name="rocblas_set_device_memory_size")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_set_device_memory_size
      type(c_ptr),value :: handle
      integer(c_size_t),value :: mySize
    end function

  !> ! \brief create handle
  !>  
    function rocblas_create_handle(handle) bind(c, name="rocblas_create_handle")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_create_handle
      type(c_ptr) :: handle
    end function

  !> ! \brief destroy handle
  !>  
    function rocblas_destroy_handle(handle) bind(c, name="rocblas_destroy_handle")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_destroy_handle
      type(c_ptr),value :: handle
    end function

  !> ! \brief set stream for handle
  !>  
    function rocblas_set_stream(handle,stream) bind(c, name="rocblas_set_stream")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_set_stream
      type(c_ptr),value :: handle
      type(c_ptr),value :: stream
    end function

  !> ! \brief get stream [0] from handle
  !>  
    function rocblas_get_stream(handle,stream) bind(c, name="rocblas_get_stream")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_get_stream
      type(c_ptr),value :: handle
      type(c_ptr) :: stream
    end function

  !> ! \brief set rocblas_pointer_mode
  !>  
    function rocblas_set_pointer_mode(handle,pointer_mode) bind(c, name="rocblas_set_pointer_mode")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_set_pointer_mode
      type(c_ptr),value :: handle
      integer(kind(rocblas_pointer_mode_host)),value :: pointer_mode
    end function

  !> ! \brief get rocblas_pointer_mode
  !>  
    function rocblas_get_pointer_mode(handle,pointer_mode) bind(c, name="rocblas_get_pointer_mode")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_get_pointer_mode
      type(c_ptr),value :: handle
      type(c_ptr),value :: pointer_mode
    end function

  !> ! \brief set rocblas_atomics_mode
  !>  
    function rocblas_set_atomics_mode(handle,atomics_mode) bind(c, name="rocblas_set_atomics_mode")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_set_atomics_mode
      type(c_ptr),value :: handle
      integer(kind(rocblas_atomics_not_allowed)),value :: atomics_mode
    end function

  !> ! \brief get rocblas_atomics_mode
  !>  
    function rocblas_get_atomics_mode(handle,atomics_mode) bind(c, name="rocblas_get_atomics_mode")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_get_atomics_mode
      type(c_ptr),value :: handle
      type(c_ptr),value :: atomics_mode
    end function

  !> ! \brief copy vector from host to device
  !>  
    function rocblas_set_vector(n,elem_size,x,incx,y,incy) bind(c, name="rocblas_set_vector")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_set_vector
      integer(c_int),value :: n
      integer(c_int),value :: elem_size
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  !> ! \brief copy vector from device to host
  !>  
    function rocblas_get_vector(n,elem_size,x,incx,y,incy) bind(c, name="rocblas_get_vector")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_get_vector
      integer(c_int),value :: n
      integer(c_int),value :: elem_size
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
    end function

  !> ! \brief copy matrix from host to device
  !>  
    function rocblas_set_matrix(rows,cols,elem_size,a,lda,b,ldb) bind(c, name="rocblas_set_matrix")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_set_matrix
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      integer(c_int),value :: elem_size
      type(c_ptr),value :: a
      integer(c_int),value :: lda
      type(c_ptr),value :: b
      integer(c_int),value :: ldb
    end function

  !> ! \brief copy matrix from device to host
  !>  
    function rocblas_get_matrix(rows,cols,elem_size,a,lda,b,ldb) bind(c, name="rocblas_get_matrix")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_get_matrix
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      integer(c_int),value :: elem_size
      type(c_ptr),value :: a
      integer(c_int),value :: lda
      type(c_ptr),value :: b
      integer(c_int),value :: ldb
    end function

  !> ! \brief asynchronously copy vector from host to device
  !>      \details
  !>     rocblas_set_vector_async copies a vector from pinned host memory to device memory asynchronously.
  !>     Memory on the host must be allocated with hipHostMalloc or the transfer will be synchronous.
  !>     @param[in]
  !>     n           [rocblas_int]
  !>                 number of elements in the vector
  !>     @param[in]
  !>     x           pointer to vector on the host
  !>     @param[in]
  !>     incx        [rocblas_int]
  !>                 specifies the increment for the elements of the vector
  !>     @param[out]
  !>     y           pointer to vector on the device
  !>     @param[in]
  !>     incy        [rocblas_int]
  !>                 specifies the increment for the elements of the vector
  !>     @param[in]
  !>     stream      specifies the stream into which this transfer request is queued
  !>      
    function rocblas_set_vector_async(n,elem_size,x,incx,y,incy,stream) bind(c, name="rocblas_set_vector_async")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_set_vector_async
      integer(c_int),value :: n
      integer(c_int),value :: elem_size
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: stream
    end function

  !> ! \brief asynchronously copy vector from device to host
  !>      \details
  !>     rocblas_get_vector_async copies a vector from pinned host memory to device memory asynchronously.
  !>     Memory on the host must be allocated with hipHostMalloc or the transfer will be synchronous.
  !>     @param[in]
  !>     n           [rocblas_int]
  !>                 number of elements in the vector
  !>     @param[in]
  !>     x           pointer to vector on the device
  !>     @param[in]
  !>     incx        [rocblas_int]
  !>                 specifies the increment for the elements of the vector
  !>     @param[out]
  !>     y           pointer to vector on the host
  !>     @param[in]
  !>     incy        [rocblas_int]
  !>                 specifies the increment for the elements of the vector
  !>     @param[in]
  !>     stream      specifies the stream into which this transfer request is queued
  !>      
    function rocblas_get_vector_async(n,elem_size,x,incx,y,incy,stream) bind(c, name="rocblas_get_vector_async")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_get_vector_async
      integer(c_int),value :: n
      integer(c_int),value :: elem_size
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      type(c_ptr),value :: y
      integer(c_int),value :: incy
      type(c_ptr),value :: stream
    end function

  !> ! \brief asynchronously copy matrix from host to device
  !>      \details
  !>     rocblas_set_matrix_async copies a matrix from pinned host memory to device memory asynchronously.
  !>     Memory on the host must be allocated with hipHostMalloc or the transfer will be synchronous.
  !>     @param[in]
  !>     rows        [rocblas_int]
  !>                 number of rows in matrices
  !>     @param[in]
  !>     cols        [rocblas_int]
  !>                 number of columns in matrices
  !>     @param[in]
  !>     elem_size   [rocblas_int]
  !>                 number of bytes per element in the matrix
  !>     @param[in]
  !>     a           pointer to matrix on the host
  !>     @param[in]
  !>     lda         [rocblas_int]
  !>                 specifies the leading dimension of A
  !>     @param[out]
  !>     b           pointer to matrix on the GPU
  !>     @param[in]
  !>     ldb         [rocblas_int]
  !>                 specifies the leading dimension of B
  !>     @param[in]
  !>     stream      specifies the stream into which this transfer request is queued
  !>      
    function rocblas_set_matrix_async(rows,cols,elem_size,a,lda,b,ldb,stream) bind(c, name="rocblas_set_matrix_async")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_set_matrix_async
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      integer(c_int),value :: elem_size
      type(c_ptr),value :: a
      integer(c_int),value :: lda
      type(c_ptr),value :: b
      integer(c_int),value :: ldb
      type(c_ptr),value :: stream
    end function

  !> ! \brief asynchronously copy matrix from device to host
  !>      \details
  !>     rocblas_get_matrix_async copies a matrix from device memory to pinned host memory asynchronously.
  !>     Memory on the host must be allocated with hipHostMalloc or the transfer will be synchronous.
  !>     @param[in]
  !>     rows        [rocblas_int]
  !>                 number of rows in matrices
  !>     @param[in]
  !>     cols        [rocblas_int]
  !>                 number of columns in matrices
  !>     @param[in]
  !>     elem_size   [rocblas_int]
  !>                 number of bytes per element in the matrix
  !>     @param[in]
  !>     a           pointer to matrix on the GPU
  !>     @param[in]
  !>     lda         [rocblas_int]
  !>                 specifies the leading dimension of A
  !>     @param[out]
  !>     b           pointer to matrix on the host
  !>     @param[in]
  !>     ldb         [rocblas_int]
  !>                 specifies the leading dimension of B
  !>     @param[in]
  !>     stream      specifies the stream into which this transfer request is queued
  !>      
    function rocblas_get_matrix_async(rows,cols,elem_size,a,lda,b,ldb,stream) bind(c, name="rocblas_get_matrix_async")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_get_matrix_async
      integer(c_int),value :: rows
      integer(c_int),value :: cols
      integer(c_int),value :: elem_size
      type(c_ptr),value :: a
      integer(c_int),value :: lda
      type(c_ptr),value :: b
      integer(c_int),value :: ldb
      type(c_ptr),value :: stream
    end function

  !> 
  !>   Function to set startstop event handlers (for internal use only)
  !>  
    function rocblas_set_start_stop_events(handle,startEvent,stopEvent) bind(c, name="rocblas_set_start_stop_events")
      use iso_c_binding
      use hipfort_rocblas_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocblas_set_start_stop_events
      type(c_ptr),value :: handle
      type(c_ptr),value :: startEvent
      type(c_ptr),value :: stopEvent
    end function

  end interface
  
end module hipfort_rocblas