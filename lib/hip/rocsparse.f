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
          
           
module rocsparse
  use rocsparse_enums
  implicit none

 
  interface
  ! @{
    function rocsparse_saxpyi(handle,nnz,alpha,x_val,x_ind,y,idx_base) bind(c, name="rocsparse_saxpyi")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_saxpyi
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      type(c_ptr),value :: y
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

  
    function rocsparse_daxpyi(handle,nnz,alpha,x_val,x_ind,y,idx_base) bind(c, name="rocsparse_daxpyi")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_daxpyi
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      type(c_ptr),value :: y
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

  
    function rocsparse_caxpyi(handle,nnz,alpha,x_val,x_ind,y,idx_base) bind(c, name="rocsparse_caxpyi")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_caxpyi
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      type(c_ptr),value :: y
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

  
    function rocsparse_zaxpyi(handle,nnz,alpha,x_val,x_ind,y,idx_base) bind(c, name="rocsparse_zaxpyi")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zaxpyi
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      type(c_ptr),value :: y
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

  ! @{
    function rocsparse_sdoti(handle,nnz,x_val,x_ind,y,myResult,idx_base) bind(c, name="rocsparse_sdoti")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sdoti
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      type(c_ptr),value :: y
      type(c_ptr),value :: myResult
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

  
    function rocsparse_ddoti(handle,nnz,x_val,x_ind,y,myResult,idx_base) bind(c, name="rocsparse_ddoti")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ddoti
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      type(c_ptr),value :: y
      type(c_ptr),value :: myResult
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

  
    function rocsparse_cdoti(handle,nnz,x_val,x_ind,y,myResult,idx_base) bind(c, name="rocsparse_cdoti")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cdoti
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      type(c_ptr),value :: y
      type(c_ptr),value :: myResult
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

  
    function rocsparse_zdoti(handle,nnz,x_val,x_ind,y,myResult,idx_base) bind(c, name="rocsparse_zdoti")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zdoti
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      type(c_ptr),value :: y
      type(c_ptr),value :: myResult
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

  ! @{
    function rocsparse_cdotci(handle,nnz,x_val,x_ind,y,myResult,idx_base) bind(c, name="rocsparse_cdotci")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cdotci
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      type(c_ptr),value :: y
      type(c_ptr),value :: myResult
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

  
    function rocsparse_zdotci(handle,nnz,x_val,x_ind,y,myResult,idx_base) bind(c, name="rocsparse_zdotci")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zdotci
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      type(c_ptr),value :: y
      type(c_ptr),value :: myResult
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

  ! @{
    function rocsparse_sgthr(handle,nnz,y,x_val,x_ind,idx_base) bind(c, name="rocsparse_sgthr")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sgthr
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: y
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

  
    function rocsparse_dgthr(handle,nnz,y,x_val,x_ind,idx_base) bind(c, name="rocsparse_dgthr")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dgthr
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: y
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

  
    function rocsparse_cgthr(handle,nnz,y,x_val,x_ind,idx_base) bind(c, name="rocsparse_cgthr")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cgthr
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: y
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

  
    function rocsparse_zgthr(handle,nnz,y,x_val,x_ind,idx_base) bind(c, name="rocsparse_zgthr")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zgthr
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: y
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

  ! @{
    function rocsparse_sgthrz(handle,nnz,y,x_val,x_ind,idx_base) bind(c, name="rocsparse_sgthrz")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sgthrz
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: y
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

  
    function rocsparse_dgthrz(handle,nnz,y,x_val,x_ind,idx_base) bind(c, name="rocsparse_dgthrz")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dgthrz
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: y
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

  
    function rocsparse_cgthrz(handle,nnz,y,x_val,x_ind,idx_base) bind(c, name="rocsparse_cgthrz")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cgthrz
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: y
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

  
    function rocsparse_zgthrz(handle,nnz,y,x_val,x_ind,idx_base) bind(c, name="rocsparse_zgthrz")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zgthrz
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: y
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

  ! @{
    function rocsparse_sroti(handle,nnz,x_val,x_ind,y,c,s,idx_base) bind(c, name="rocsparse_sroti")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sroti
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      type(c_ptr),value :: y
      type(c_ptr),value :: c
      type(c_ptr),value :: s
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

  
    function rocsparse_droti(handle,nnz,x_val,x_ind,y,c,s,idx_base) bind(c, name="rocsparse_droti")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_droti
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      type(c_ptr),value :: y
      type(c_ptr),value :: c
      type(c_ptr),value :: s
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

  ! @{
    function rocsparse_ssctr(handle,nnz,x_val,x_ind,y,idx_base) bind(c, name="rocsparse_ssctr")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ssctr
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      type(c_ptr),value :: y
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

  
    function rocsparse_dsctr(handle,nnz,x_val,x_ind,y,idx_base) bind(c, name="rocsparse_dsctr")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dsctr
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      type(c_ptr),value :: y
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

  
    function rocsparse_csctr(handle,nnz,x_val,x_ind,y,idx_base) bind(c, name="rocsparse_csctr")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csctr
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      type(c_ptr),value :: y
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

  
    function rocsparse_zsctr(handle,nnz,x_val,x_ind,y,idx_base) bind(c, name="rocsparse_zsctr")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zsctr
      type(c_ptr),value :: handle
      integer(c_int),value :: nnz
      type(c_ptr),value :: x_val
      type(c_ptr),value :: x_ind
      type(c_ptr),value :: y
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

  ! @{
    function rocsparse_sbsrmv(handle,dir,trans,mb,nb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,x,beta,y) bind(c, name="rocsparse_sbsrmv")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsrmv
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      integer(c_int),value :: nnzb
      real(c_float),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: x
      real(c_float),intent(IN) :: beta
      type(c_ptr),value :: y
    end function

  
    function rocsparse_dbsrmv(handle,dir,trans,mb,nb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,x,beta,y) bind(c, name="rocsparse_dbsrmv")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsrmv
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      integer(c_int),value :: nnzb
      real(c_double),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: x
      real(c_double),intent(IN) :: beta
      type(c_ptr),value :: y
    end function

  
    function rocsparse_cbsrmv(handle,dir,trans,mb,nb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,x,beta,y) bind(c, name="rocsparse_cbsrmv")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsrmv
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      integer(c_int),value :: nnzb
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: x
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr),value :: y
    end function

  
    function rocsparse_zbsrmv(handle,dir,trans,mb,nb,nnzb,alpha,descr,bsr_val,bsr_row_ptr,bsr_col_ind,bsr_dim,x,beta,y) bind(c, name="rocsparse_zbsrmv")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsrmv
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      integer(c_int),value :: nnzb
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: bsr_dim
      type(c_ptr),value :: x
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr),value :: y
    end function

  ! @{
    function rocsparse_scoomv(handle,trans,m,n,nnz,alpha,descr,coo_val,coo_row_ind,coo_col_ind,x,beta,y) bind(c, name="rocsparse_scoomv")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scoomv
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      real(c_float),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: coo_val
      type(c_ptr),value :: coo_row_ind
      type(c_ptr),value :: coo_col_ind
      type(c_ptr),value :: x
      real(c_float),intent(IN) :: beta
      type(c_ptr),value :: y
    end function

  
    function rocsparse_dcoomv(handle,trans,m,n,nnz,alpha,descr,coo_val,coo_row_ind,coo_col_ind,x,beta,y) bind(c, name="rocsparse_dcoomv")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcoomv
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      real(c_double),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: coo_val
      type(c_ptr),value :: coo_row_ind
      type(c_ptr),value :: coo_col_ind
      type(c_ptr),value :: x
      real(c_double),intent(IN) :: beta
      type(c_ptr),value :: y
    end function

  
    function rocsparse_ccoomv(handle,trans,m,n,nnz,alpha,descr,coo_val,coo_row_ind,coo_col_ind,x,beta,y) bind(c, name="rocsparse_ccoomv")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccoomv
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: coo_val
      type(c_ptr),value :: coo_row_ind
      type(c_ptr),value :: coo_col_ind
      type(c_ptr),value :: x
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr),value :: y
    end function

  
    function rocsparse_zcoomv(handle,trans,m,n,nnz,alpha,descr,coo_val,coo_row_ind,coo_col_ind,x,beta,y) bind(c, name="rocsparse_zcoomv")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcoomv
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: coo_val
      type(c_ptr),value :: coo_row_ind
      type(c_ptr),value :: coo_col_ind
      type(c_ptr),value :: x
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr),value :: y
    end function

  ! @{
    function rocsparse_scsrmv_analysis(handle,trans,m,n,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,info) bind(c, name="rocsparse_scsrmv_analysis")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrmv_analysis
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
    end function

  
    function rocsparse_dcsrmv_analysis(handle,trans,m,n,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,info) bind(c, name="rocsparse_dcsrmv_analysis")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrmv_analysis
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
    end function

  
    function rocsparse_ccsrmv_analysis(handle,trans,m,n,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,info) bind(c, name="rocsparse_ccsrmv_analysis")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrmv_analysis
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
    end function

  
    function rocsparse_zcsrmv_analysis(handle,trans,m,n,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,info) bind(c, name="rocsparse_zcsrmv_analysis")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrmv_analysis
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
    end function

  ! ! \ingroup level2_module
  !    \brief Sparse matrix vector multiplication using CSR storage format
  !  
  !    \details
  !    \p rocsparse_csrmv_clear deallocates all memory that was allocated by
  !    rocsparse_scsrmv_analysis(), rocsparse_dcsrmv_analysis(), rocsparse_ccsrmv_analysis()
  !    or rocsparse_zcsrmv_analysis(). This is especially useful, if memory is an issue and
  !    the analysis data is not required anymore for further computation, e.g. when
  !    switching to another sparse matrix format.
  !  
  !    \note
  !    Calling \p rocsparse_csrmv_clear is optional. All allocated resources will be
  !    cleared, when the opaque \ref rocsparse_mat_info struct is destroyed using
  !    rocsparse_destroy_mat_info().
  !  
  !    @param[in]
  !    handle      handle to the rocsparse library context queue.
  !    @param[inout]
  !    info        structure that holds the information collected during analysis step.
  !  
  !    \retval     rocsparse_status_success the operation completed successfully.
  !    \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !    \retval     rocsparse_status_invalid_pointer \p info pointer is invalid.
  !    \retval     rocsparse_status_memory_error the buffer for the gathered information
  !                could not be deallocated.
  !    \retval     rocsparse_status_internal_error an internal error occurred.
  !   
    function rocsparse_csrmv_clear(handle,info) bind(c, name="rocsparse_csrmv_clear")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csrmv_clear
      type(c_ptr),value :: handle
      type(c_ptr),intent(INOUT) :: info
    end function

  ! @{
    function rocsparse_scsrmv(handle,trans,m,n,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,info,x,beta,y) bind(c, name="rocsparse_scsrmv")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrmv
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      real(c_float),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      type(c_ptr),value :: x
      real(c_float),intent(IN) :: beta
      type(c_ptr),value :: y
    end function

  
    function rocsparse_dcsrmv(handle,trans,m,n,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,info,x,beta,y) bind(c, name="rocsparse_dcsrmv")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrmv
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      real(c_double),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      type(c_ptr),value :: x
      real(c_double),intent(IN) :: beta
      type(c_ptr),value :: y
    end function

  
    function rocsparse_ccsrmv(handle,trans,m,n,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,info,x,beta,y) bind(c, name="rocsparse_ccsrmv")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrmv
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      type(c_ptr),value :: x
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr),value :: y
    end function

  
    function rocsparse_zcsrmv(handle,trans,m,n,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,info,x,beta,y) bind(c, name="rocsparse_zcsrmv")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrmv
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      type(c_ptr),value :: x
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr),value :: y
    end function

  ! ! \ingroup level2_module
  !    \brief Sparse triangular solve using CSR storage format
  !  
  !    \details
  !    \p rocsparse_csrsv_zero_pivot returns \ref rocsparse_status_zero_pivot, if either a
  !    structural or numerical zero has been found during rocsparse_scsrsv_solve(),
  !    rocsparse_dcsrsv_solve(), rocsparse_ccsrsv_solve() or rocsparse_zcsrsv_solve()
  !    computation. The first zero pivot \f$j\f$ at \f$A_{j,j}\f$ is stored in \p position,
  !    using same index base as the CSR matrix.
  !  
  !    \p position can be in host or device memory. If no zero pivot has been found,
  !    \p position is set to -1 and \ref rocsparse_status_success is returned instead.
  !  
  !    \note \p rocsparse_csrsv_zero_pivot is a blocking function. It might influence
  !    performance negatively.
  !  
  !    @param[in]
  !    handle      handle to the rocsparse library context queue.
  !    @param[in]
  !    descr       descriptor of the sparse CSR matrix.
  !    @param[in]
  !    info        structure that holds the information collected during the analysis step.
  !    @param[inout]
  !    position    pointer to zero pivot \f$j\f$, can be in host or device memory.
  !  
  !    \retval     rocsparse_status_success the operation completed successfully.
  !    \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !    \retval     rocsparse_status_invalid_pointer \p info or \p position pointer is
  !                invalid.
  !    \retval     rocsparse_status_internal_error an internal error occurred.
  !    \retval     rocsparse_status_zero_pivot zero pivot has been found.
  !  
    function rocsparse_csrsv_zero_pivot(handle,descr,info,position) bind(c, name="rocsparse_csrsv_zero_pivot")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csrsv_zero_pivot
      type(c_ptr),value :: handle
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),intent(INOUT) :: info
      type(c_ptr),value :: position
    end function

  ! @{
    function rocsparse_scsrsv_buffer_size(handle,trans,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,info,buffer_size) bind(c, name="rocsparse_scsrsv_buffer_size")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrsv_buffer_size
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      type(c_ptr),value :: buffer_size
    end function

  
    function rocsparse_dcsrsv_buffer_size(handle,trans,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,info,buffer_size) bind(c, name="rocsparse_dcsrsv_buffer_size")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrsv_buffer_size
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      type(c_ptr),value :: buffer_size
    end function

  
    function rocsparse_ccsrsv_buffer_size(handle,trans,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,info,buffer_size) bind(c, name="rocsparse_ccsrsv_buffer_size")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrsv_buffer_size
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      type(c_ptr),value :: buffer_size
    end function

  
    function rocsparse_zcsrsv_buffer_size(handle,trans,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,info,buffer_size) bind(c, name="rocsparse_zcsrsv_buffer_size")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrsv_buffer_size
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      type(c_ptr),value :: buffer_size
    end function

  ! @{
    function rocsparse_scsrsv_analysis(handle,trans,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,info,analysis,solve,temp_buffer) bind(c, name="rocsparse_scsrsv_analysis")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrsv_analysis
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

  
    function rocsparse_dcsrsv_analysis(handle,trans,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,info,analysis,solve,temp_buffer) bind(c, name="rocsparse_dcsrsv_analysis")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrsv_analysis
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

  
    function rocsparse_ccsrsv_analysis(handle,trans,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,info,analysis,solve,temp_buffer) bind(c, name="rocsparse_ccsrsv_analysis")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrsv_analysis
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

  
    function rocsparse_zcsrsv_analysis(handle,trans,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,info,analysis,solve,temp_buffer) bind(c, name="rocsparse_zcsrsv_analysis")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrsv_analysis
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

  ! ! \ingroup level2_module
  !    \brief Sparse triangular solve using CSR storage format
  !  
  !    \details
  !    \p rocsparse_csrsv_clear deallocates all memory that was allocated by
  !    rocsparse_scsrsv_analysis(), rocsparse_dcsrsv_analysis(), rocsparse_ccsrsv_analysis()
  !    or rocsparse_zcsrsv_analysis(). This is especially useful, if memory is an issue and
  !    the analysis data is not required for further computation, e.g. when switching to
  !    another sparse matrix format. Calling \p rocsparse_csrsv_clear is optional. All
  !    allocated resources will be cleared, when the opaque \ref rocsparse_mat_info struct
  !    is destroyed using rocsparse_destroy_mat_info().
  !  
  !    @param[in]
  !    handle      handle to the rocsparse library context queue.
  !    @param[in]
  !    descr       descriptor of the sparse CSR matrix.
  !    @param[inout]
  !    info        structure that holds the information collected during the analysis step.
  !  
  !    \retval     rocsparse_status_success the operation completed successfully.
  !    \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !    \retval     rocsparse_status_invalid_pointer \p info pointer is invalid.
  !    \retval     rocsparse_status_memory_error the buffer holding the meta data could not
  !                be deallocated.
  !    \retval     rocsparse_status_internal_error an internal error occurred.
  !  
    function rocsparse_csrsv_clear(handle,descr,info) bind(c, name="rocsparse_csrsv_clear")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csrsv_clear
      type(c_ptr),value :: handle
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),intent(INOUT) :: info
    end function

  ! @{
    function rocsparse_scsrsv_solve(handle,trans,m,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,info,x,y,policy,temp_buffer) bind(c, name="rocsparse_scsrsv_solve")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrsv_solve
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      real(c_float),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      type(c_ptr),value :: x
      type(c_ptr),value :: y
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

  
    function rocsparse_dcsrsv_solve(handle,trans,m,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,info,x,y,policy,temp_buffer) bind(c, name="rocsparse_dcsrsv_solve")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrsv_solve
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      real(c_double),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      type(c_ptr),value :: x
      type(c_ptr),value :: y
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

  
    function rocsparse_ccsrsv_solve(handle,trans,m,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,info,x,y,policy,temp_buffer) bind(c, name="rocsparse_ccsrsv_solve")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrsv_solve
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      type(c_ptr),value :: x
      type(c_ptr),value :: y
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

  
    function rocsparse_zcsrsv_solve(handle,trans,m,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,info,x,y,policy,temp_buffer) bind(c, name="rocsparse_zcsrsv_solve")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrsv_solve
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      type(c_ptr),value :: x
      type(c_ptr),value :: y
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

  ! @{
    function rocsparse_sellmv(handle,trans,m,n,alpha,descr,ell_val,ell_col_ind,ell_width,x,beta,y) bind(c, name="rocsparse_sellmv")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sellmv
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: ell_val
      type(c_ptr),value :: ell_col_ind
      integer(c_int),value :: ell_width
      type(c_ptr),value :: x
      real(c_float),intent(IN) :: beta
      type(c_ptr),value :: y
    end function

  
    function rocsparse_dellmv(handle,trans,m,n,alpha,descr,ell_val,ell_col_ind,ell_width,x,beta,y) bind(c, name="rocsparse_dellmv")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dellmv
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: ell_val
      type(c_ptr),value :: ell_col_ind
      integer(c_int),value :: ell_width
      type(c_ptr),value :: x
      real(c_double),intent(IN) :: beta
      type(c_ptr),value :: y
    end function

  
    function rocsparse_cellmv(handle,trans,m,n,alpha,descr,ell_val,ell_col_ind,ell_width,x,beta,y) bind(c, name="rocsparse_cellmv")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cellmv
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: ell_val
      type(c_ptr),value :: ell_col_ind
      integer(c_int),value :: ell_width
      type(c_ptr),value :: x
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr),value :: y
    end function

  
    function rocsparse_zellmv(handle,trans,m,n,alpha,descr,ell_val,ell_col_ind,ell_width,x,beta,y) bind(c, name="rocsparse_zellmv")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zellmv
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: ell_val
      type(c_ptr),value :: ell_col_ind
      integer(c_int),value :: ell_width
      type(c_ptr),value :: x
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr),value :: y
    end function

  ! @{
    function rocsparse_shybmv(handle,trans,alpha,descr,hyb,x,beta,y) bind(c, name="rocsparse_shybmv")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_shybmv
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      real(c_float),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),intent(INOUT) :: hyb
      type(c_ptr),value :: x
      real(c_float),intent(IN) :: beta
      type(c_ptr),value :: y
    end function

  
    function rocsparse_dhybmv(handle,trans,alpha,descr,hyb,x,beta,y) bind(c, name="rocsparse_dhybmv")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dhybmv
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      real(c_double),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),intent(INOUT) :: hyb
      type(c_ptr),value :: x
      real(c_double),intent(IN) :: beta
      type(c_ptr),value :: y
    end function

  
    function rocsparse_chybmv(handle,trans,alpha,descr,hyb,x,beta,y) bind(c, name="rocsparse_chybmv")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_chybmv
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),intent(INOUT) :: hyb
      type(c_ptr),value :: x
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr),value :: y
    end function

  
    function rocsparse_zhybmv(handle,trans,alpha,descr,hyb,x,beta,y) bind(c, name="rocsparse_zhybmv")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zhybmv
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),intent(INOUT) :: hyb
      type(c_ptr),value :: x
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr),value :: y
    end function

  ! @{
    function rocsparse_scsrmm(handle,trans_A,trans_B,m,n,k,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,beta,C,ldc) bind(c, name="rocsparse_scsrmm")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrmm
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_float),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_float),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
    function rocsparse_dcsrmm(handle,trans_A,trans_B,m,n,k,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,beta,C,ldc) bind(c, name="rocsparse_dcsrmm")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrmm
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      real(c_double),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      real(c_double),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
    function rocsparse_ccsrmm(handle,trans_A,trans_B,m,n,k,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,beta,C,ldc) bind(c, name="rocsparse_ccsrmm")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrmm
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
    function rocsparse_zcsrmm(handle,trans_A,trans_B,m,n,k,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,beta,C,ldc) bind(c, name="rocsparse_zcsrmm")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrmm
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      integer(c_int),value :: nnz
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  ! ! \ingroup level3_module
  !    \brief Sparse triangular system solve using CSR storage format
  !  
  !    \details
  !    \p rocsparse_csrsm_zero_pivot returns \ref rocsparse_status_zero_pivot, if either a
  !    structural or numerical zero has been found during rocsparse_scsrsm_solve(),
  !    rocsparse_dcsrsm_solve(), rocsparse_ccsrsm_solve() or rocsparse_zcsrsm_solve()
  !    computation. The first zero pivot \f$j\f$ at \f$A_{j,j}\f$ is stored in \p position,
  !    using same index base as the CSR matrix.
  !  
  !    \p position can be in host or device memory. If no zero pivot has been found,
  !    \p position is set to -1 and \ref rocsparse_status_success is returned instead.
  !  
  !    \note \p rocsparse_csrsm_zero_pivot is a blocking function. It might influence
  !    performance negatively.
  !  
  !    @param[in]
  !    handle      handle to the rocsparse library context queue.
  !    @param[in]
  !    info        structure that holds the information collected during the analysis step.
  !    @param[inout]
  !    position    pointer to zero pivot \f$j\f$, can be in host or device memory.
  !  
  !    \retval     rocsparse_status_success the operation completed successfully.
  !    \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !    \retval     rocsparse_status_invalid_pointer \p info or \p position pointer is
  !                invalid.
  !    \retval     rocsparse_status_internal_error an internal error occurred.
  !    \retval     rocsparse_status_zero_pivot zero pivot has been found.
  !  
    function rocsparse_csrsm_zero_pivot(handle,info,position) bind(c, name="rocsparse_csrsm_zero_pivot")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csrsm_zero_pivot
      type(c_ptr),value :: handle
      type(c_ptr),intent(INOUT) :: info
      type(c_ptr),value :: position
    end function

  ! @{
    function rocsparse_scsrsm_buffer_size(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,info,policy,buffer_size) bind(c, name="rocsparse_scsrsm_buffer_size")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrsm_buffer_size
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_float),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),intent(INOUT) :: info
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: buffer_size
    end function

  
    function rocsparse_dcsrsm_buffer_size(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,info,policy,buffer_size) bind(c, name="rocsparse_dcsrsm_buffer_size")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrsm_buffer_size
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_double),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),intent(INOUT) :: info
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: buffer_size
    end function

  
    function rocsparse_ccsrsm_buffer_size(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,info,policy,buffer_size) bind(c, name="rocsparse_ccsrsm_buffer_size")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrsm_buffer_size
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),intent(INOUT) :: info
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: buffer_size
    end function

  
    function rocsparse_zcsrsm_buffer_size(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,info,policy,buffer_size) bind(c, name="rocsparse_zcsrsm_buffer_size")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrsm_buffer_size
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),intent(INOUT) :: info
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: buffer_size
    end function

  ! @{
    function rocsparse_scsrsm_analysis(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,info,analysis,solve,temp_buffer) bind(c, name="rocsparse_scsrsm_analysis")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrsm_analysis
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_float),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),intent(INOUT) :: info
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

  
    function rocsparse_dcsrsm_analysis(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,info,analysis,solve,temp_buffer) bind(c, name="rocsparse_dcsrsm_analysis")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrsm_analysis
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_double),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),intent(INOUT) :: info
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

  
    function rocsparse_ccsrsm_analysis(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,info,analysis,solve,temp_buffer) bind(c, name="rocsparse_ccsrsm_analysis")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrsm_analysis
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),intent(INOUT) :: info
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

  
    function rocsparse_zcsrsm_analysis(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,info,analysis,solve,temp_buffer) bind(c, name="rocsparse_zcsrsm_analysis")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrsm_analysis
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),intent(INOUT) :: info
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

  ! ! \ingroup level3_module
  !    \brief Sparse triangular system solve using CSR storage format
  !  
  !    \details
  !    \p rocsparse_csrsm_clear deallocates all memory that was allocated by
  !    rocsparse_scsrsm_analysis(), rocsparse_dcsrsm_analysis(), rocsparse_ccsrsm_analysis()
  !    or rocsparse_zcsrsm_analysis(). This is especially useful, if memory is an issue and
  !    the analysis data is not required for further computation, e.g. when switching to
  !    another sparse matrix format. Calling \p rocsparse_csrsm_clear is optional. All
  !    allocated resources will be cleared, when the opaque \ref rocsparse_mat_info struct
  !    is destroyed using rocsparse_destroy_mat_info().
  !  
  !    @param[in]
  !    handle      handle to the rocsparse library context queue.
  !    @param[inout]
  !    info        structure that holds the information collected during the analysis step.
  !  
  !    \retval     rocsparse_status_success the operation completed successfully.
  !    \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !    \retval     rocsparse_status_invalid_pointer \p info pointer is invalid.
  !    \retval     rocsparse_status_memory_error the buffer holding the meta data could not
  !                be deallocated.
  !    \retval     rocsparse_status_internal_error an internal error occurred.
  !  
    function rocsparse_csrsm_clear(handle,info) bind(c, name="rocsparse_csrsm_clear")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csrsm_clear
      type(c_ptr),value :: handle
      type(c_ptr),intent(INOUT) :: info
    end function

  ! @{
    function rocsparse_scsrsm_solve(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,info,policy,temp_buffer) bind(c, name="rocsparse_scsrsm_solve")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrsm_solve
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_float),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),intent(INOUT) :: info
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

  
    function rocsparse_dcsrsm_solve(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,info,policy,temp_buffer) bind(c, name="rocsparse_dcsrsm_solve")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrsm_solve
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      real(c_double),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),intent(INOUT) :: info
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

  
    function rocsparse_ccsrsm_solve(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,info,policy,temp_buffer) bind(c, name="rocsparse_ccsrsm_solve")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrsm_solve
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),intent(INOUT) :: info
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

  
    function rocsparse_zcsrsm_solve(handle,trans_A,trans_B,m,nrhs,nnz,alpha,descr,csr_val,csr_row_ptr,csr_col_ind,B,ldb,info,policy,temp_buffer) bind(c, name="rocsparse_zcsrsm_solve")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrsm_solve
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: nrhs
      integer(c_int),value :: nnz
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: B
      integer(c_int),value :: ldb
      type(c_ptr),intent(INOUT) :: info
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

  ! ! \ingroup extra_module
  !    \brief Sparse matrix sparse matrix addition using CSR storage format
  !  
  !    \details
  !    \p rocsparse_csrgeam_nnz computes the total CSR non-zero elements and the CSR row
  !    offsets, that point to the start of every row of the sparse CSR matrix, of the
  !    resulting matrix C. It is assumed that \p csr_row_ptr_C has been allocated with
  !    size \p m + 1.
  !  
  !    \note
  !    This function is non blocking and executed asynchronously with respect to the host.
  !    It may return before the actual computation has finished.
  !    \note
  !    Currently, only \ref rocsparse_matrix_type_general is supported.
  !  
  !    @param[in]
  !    handle          handle to the rocsparse library context queue.
  !    @param[in]
  !    m               number of rows of the sparse CSR matrix \f$A\f$, \f$B\f$ and \f$C\f$.
  !    @param[in]
  !    n               number of columns of the sparse CSR matrix \f$A\f$, \f$B\f$ and \f$C\f$.
  !    @param[in]
  !    descr_A         descriptor of the sparse CSR matrix \f$A\f$. Currenty, only
  !                    \ref rocsparse_matrix_type_general is supported.
  !    @param[in]
  !    nnz_A           number of non-zero entries of the sparse CSR matrix \f$A\f$.
  !    @param[in]
  !    csr_row_ptr_A   array of \p m+1 elements that point to the start of every row of the
  !                    sparse CSR matrix \f$A\f$.
  !    @param[in]
  !    csr_col_ind_A   array of \p nnz_A elements containing the column indices of the
  !                    sparse CSR matrix \f$A\f$.
  !    @param[in]
  !    descr_B         descriptor of the sparse CSR matrix \f$B\f$. Currenty, only
  !                    \ref rocsparse_matrix_type_general is supported.
  !    @param[in]
  !    nnz_B           number of non-zero entries of the sparse CSR matrix \f$B\f$.
  !    @param[in]
  !    csr_row_ptr_B   array of \p m+1 elements that point to the start of every row of the
  !                    sparse CSR matrix \f$B\f$.
  !    @param[in]
  !    csr_col_ind_B   array of \p nnz_B elements containing the column indices of the
  !                    sparse CSR matrix \f$B\f$.
  !    @param[in]
  !    descr_C         descriptor of the sparse CSR matrix \f$C\f$. Currenty, only
  !                    \ref rocsparse_matrix_type_general is supported.
  !    @param[out]
  !    csr_row_ptr_C   array of \p m+1 elements that point to the start of every row of the
  !                    sparse CSR matrix \f$C\f$.
  !    @param[out]
  !    nnz_C           pointer to the number of non-zero entries of the sparse CSR
  !                    matrix \f$C\f$. \p nnz_C can be a host or device pointer.
  !  
  !    \retval rocsparse_status_success the operation completed successfully.
  !    \retval rocsparse_status_invalid_handle the library context was not initialized.
  !    \retval rocsparse_status_invalid_size \p m, \p n, \p nnz_A or \p nnz_B is invalid.
  !    \retval rocsparse_status_invalid_pointer \p descr_A, \p csr_row_ptr_A,
  !            \p csr_col_ind_A, \p descr_B, \p csr_row_ptr_B, \p csr_col_ind_B,
  !            \p descr_C, \p csr_row_ptr_C or \p nnz_C is invalid.
  !    \retval rocsparse_status_not_implemented
  !            \p rocsparse_matrix_type != \ref rocsparse_matrix_type_general.
  !  
    function rocsparse_csrgeam_nnz(handle,m,n,descr_A,nnz_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_row_ptr_B,csr_col_ind_B,descr_C,csr_row_ptr_C,nnz_C) bind(c, name="rocsparse_csrgeam_nnz")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csrgeam_nnz
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: descr_A
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      type(c_ptr),intent(INOUT) :: descr_B
      integer(c_int),value :: nnz_B
      type(c_ptr),value :: csr_row_ptr_B
      type(c_ptr),value :: csr_col_ind_B
      type(c_ptr),intent(INOUT) :: descr_C
      type(c_ptr),value :: csr_row_ptr_C
      type(c_ptr),value :: nnz_C
    end function

  ! @{
    function rocsparse_scsrgeam(handle,m,n,alpha,descr_A,nnz_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,beta,descr_B,nnz_B,csr_val_B,csr_row_ptr_B,csr_col_ind_B,descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C) bind(c, name="rocsparse_scsrgeam")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrgeam
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr_A
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      real(c_float),intent(IN) :: beta
      type(c_ptr),intent(INOUT) :: descr_B
      integer(c_int),value :: nnz_B
      type(c_ptr),value :: csr_val_B
      type(c_ptr),value :: csr_row_ptr_B
      type(c_ptr),value :: csr_col_ind_B
      type(c_ptr),intent(INOUT) :: descr_C
      type(c_ptr),value :: csr_val_C
      type(c_ptr),value :: csr_row_ptr_C
      type(c_ptr),value :: csr_col_ind_C
    end function

  
    function rocsparse_dcsrgeam(handle,m,n,alpha,descr_A,nnz_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,beta,descr_B,nnz_B,csr_val_B,csr_row_ptr_B,csr_col_ind_B,descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C) bind(c, name="rocsparse_dcsrgeam")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrgeam
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr_A
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      real(c_double),intent(IN) :: beta
      type(c_ptr),intent(INOUT) :: descr_B
      integer(c_int),value :: nnz_B
      type(c_ptr),value :: csr_val_B
      type(c_ptr),value :: csr_row_ptr_B
      type(c_ptr),value :: csr_col_ind_B
      type(c_ptr),intent(INOUT) :: descr_C
      type(c_ptr),value :: csr_val_C
      type(c_ptr),value :: csr_row_ptr_C
      type(c_ptr),value :: csr_col_ind_C
    end function

  
    function rocsparse_ccsrgeam(handle,m,n,alpha,descr_A,nnz_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,beta,descr_B,nnz_B,csr_val_B,csr_row_ptr_B,csr_col_ind_B,descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C) bind(c, name="rocsparse_ccsrgeam")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrgeam
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr_A
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr),intent(INOUT) :: descr_B
      integer(c_int),value :: nnz_B
      type(c_ptr),value :: csr_val_B
      type(c_ptr),value :: csr_row_ptr_B
      type(c_ptr),value :: csr_col_ind_B
      type(c_ptr),intent(INOUT) :: descr_C
      type(c_ptr),value :: csr_val_C
      type(c_ptr),value :: csr_row_ptr_C
      type(c_ptr),value :: csr_col_ind_C
    end function

  
    function rocsparse_zcsrgeam(handle,m,n,alpha,descr_A,nnz_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,beta,descr_B,nnz_B,csr_val_B,csr_row_ptr_B,csr_col_ind_B,descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C) bind(c, name="rocsparse_zcsrgeam")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrgeam
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr_A
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr),intent(INOUT) :: descr_B
      integer(c_int),value :: nnz_B
      type(c_ptr),value :: csr_val_B
      type(c_ptr),value :: csr_row_ptr_B
      type(c_ptr),value :: csr_col_ind_B
      type(c_ptr),intent(INOUT) :: descr_C
      type(c_ptr),value :: csr_val_C
      type(c_ptr),value :: csr_row_ptr_C
      type(c_ptr),value :: csr_col_ind_C
    end function

  ! @{
    function rocsparse_scsrgemm_buffer_size(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_row_ptr_B,csr_col_ind_B,beta,descr_D,nnz_D,csr_row_ptr_D,csr_col_ind_D,info_C,buffer_size) bind(c, name="rocsparse_scsrgemm_buffer_size")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrgemm_buffer_size
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr_A
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      type(c_ptr),intent(INOUT) :: descr_B
      integer(c_int),value :: nnz_B
      type(c_ptr),value :: csr_row_ptr_B
      type(c_ptr),value :: csr_col_ind_B
      real(c_float),intent(IN) :: beta
      type(c_ptr),intent(INOUT) :: descr_D
      integer(c_int),value :: nnz_D
      type(c_ptr),value :: csr_row_ptr_D
      type(c_ptr),value :: csr_col_ind_D
      type(c_ptr),intent(INOUT) :: info_C
      type(c_ptr),value :: buffer_size
    end function

  
    function rocsparse_dcsrgemm_buffer_size(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_row_ptr_B,csr_col_ind_B,beta,descr_D,nnz_D,csr_row_ptr_D,csr_col_ind_D,info_C,buffer_size) bind(c, name="rocsparse_dcsrgemm_buffer_size")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrgemm_buffer_size
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr_A
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      type(c_ptr),intent(INOUT) :: descr_B
      integer(c_int),value :: nnz_B
      type(c_ptr),value :: csr_row_ptr_B
      type(c_ptr),value :: csr_col_ind_B
      real(c_double),intent(IN) :: beta
      type(c_ptr),intent(INOUT) :: descr_D
      integer(c_int),value :: nnz_D
      type(c_ptr),value :: csr_row_ptr_D
      type(c_ptr),value :: csr_col_ind_D
      type(c_ptr),intent(INOUT) :: info_C
      type(c_ptr),value :: buffer_size
    end function

  
    function rocsparse_ccsrgemm_buffer_size(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_row_ptr_B,csr_col_ind_B,beta,descr_D,nnz_D,csr_row_ptr_D,csr_col_ind_D,info_C,buffer_size) bind(c, name="rocsparse_ccsrgemm_buffer_size")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrgemm_buffer_size
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr_A
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      type(c_ptr),intent(INOUT) :: descr_B
      integer(c_int),value :: nnz_B
      type(c_ptr),value :: csr_row_ptr_B
      type(c_ptr),value :: csr_col_ind_B
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr),intent(INOUT) :: descr_D
      integer(c_int),value :: nnz_D
      type(c_ptr),value :: csr_row_ptr_D
      type(c_ptr),value :: csr_col_ind_D
      type(c_ptr),intent(INOUT) :: info_C
      type(c_ptr),value :: buffer_size
    end function

  
    function rocsparse_zcsrgemm_buffer_size(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_row_ptr_B,csr_col_ind_B,beta,descr_D,nnz_D,csr_row_ptr_D,csr_col_ind_D,info_C,buffer_size) bind(c, name="rocsparse_zcsrgemm_buffer_size")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrgemm_buffer_size
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr_A
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      type(c_ptr),intent(INOUT) :: descr_B
      integer(c_int),value :: nnz_B
      type(c_ptr),value :: csr_row_ptr_B
      type(c_ptr),value :: csr_col_ind_B
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr),intent(INOUT) :: descr_D
      integer(c_int),value :: nnz_D
      type(c_ptr),value :: csr_row_ptr_D
      type(c_ptr),value :: csr_col_ind_D
      type(c_ptr),intent(INOUT) :: info_C
      type(c_ptr),value :: buffer_size
    end function

  ! ! \ingroup extra_module
  !    \brief Sparse matrix sparse matrix multiplication using CSR storage format
  !  
  !    \details
  !    \p rocsparse_csrgemm_nnz computes the total CSR non-zero elements and the CSR row
  !    offsets, that point to the start of every row of the sparse CSR matrix, of the
  !    resulting multiplied matrix C. It is assumed that \p csr_row_ptr_C has been allocated
  !    with size \p m + 1.
  !    The required buffer size can be obtained by rocsparse_scsrgemm_buffer_size(),
  !    rocsparse_dcsrgemm_buffer_size(), rocsparse_ccsrgemm_buffer_size() and
  !    rocsparse_zcsrgemm_buffer_size(), respectively.
  !  
  !    \note
  !    This function is non blocking and executed asynchronously with respect to the host.
  !    It may return before the actual computation has finished.
  !    \note
  !    Please note, that for matrix products with more than 8192 intermediate products per
  !    row, additional temporary storage buffer is allocated by the algorithm.
  !    \note
  !    Currently, only \p trans_A == \p trans_B == \ref rocsparse_operation_none is
  !    supported.
  !    \note
  !    Currently, only \ref rocsparse_matrix_type_general is supported.
  !  
  !    @param[in]
  !    handle          handle to the rocsparse library context queue.
  !    @param[in]
  !    trans_A         matrix \f$A\f$ operation type.
  !    @param[in]
  !    trans_B         matrix \f$B\f$ operation type.
  !    @param[in]
  !    m               number of rows of the sparse CSR matrix \f$op(A)\f$ and \f$C\f$.
  !    @param[in]
  !    n               number of columns of the sparse CSR matrix \f$op(B)\f$ and
  !                    \f$C\f$.
  !    @param[in]
  !    k               number of columns of the sparse CSR matrix \f$op(A)\f$ and number of
  !                    rows of the sparse CSR matrix \f$op(B)\f$.
  !    @param[in]
  !    descr_A         descriptor of the sparse CSR matrix \f$A\f$. Currenty, only
  !                    \ref rocsparse_matrix_type_general is supported.
  !    @param[in]
  !    nnz_A           number of non-zero entries of the sparse CSR matrix \f$A\f$.
  !    @param[in]
  !    csr_row_ptr_A   array of \p m+1 elements (\f$op(A) == A\f$, \p k+1 otherwise)
  !                    that point to the start of every row of the sparse CSR matrix
  !                    \f$op(A)\f$.
  !    @param[in]
  !    csr_col_ind_A   array of \p nnz_A elements containing the column indices of the
  !                    sparse CSR matrix \f$A\f$.
  !    @param[in]
  !    descr_B         descriptor of the sparse CSR matrix \f$B\f$. Currenty, only
  !                    \ref rocsparse_matrix_type_general is supported.
  !    @param[in]
  !    nnz_B           number of non-zero entries of the sparse CSR matrix \f$B\f$.
  !    @param[in]
  !    csr_row_ptr_B   array of \p k+1 elements (\f$op(B) == B\f$, \p m+1 otherwise)
  !                    that point to the start of every row of the sparse CSR matrix
  !                    \f$op(B)\f$.
  !    @param[in]
  !    csr_col_ind_B   array of \p nnz_B elements containing the column indices of the
  !                    sparse CSR matrix \f$B\f$.
  !    @param[in]
  !    descr_D         descriptor of the sparse CSR matrix \f$D\f$. Currenty, only
  !                    \ref rocsparse_matrix_type_general is supported.
  !    @param[in]
  !    nnz_D           number of non-zero entries of the sparse CSR matrix \f$D\f$.
  !    @param[in]
  !    csr_row_ptr_D   array of \p m+1 elements that point to the start of every row of the
  !                    sparse CSR matrix \f$D\f$.
  !    @param[in]
  !    csr_col_ind_D   array of \p nnz_D elements containing the column indices of the sparse
  !                    CSR matrix \f$D\f$.
  !    @param[in]
  !    descr_C         descriptor of the sparse CSR matrix \f$C\f$. Currenty, only
  !                    \ref rocsparse_matrix_type_general is supported.
  !    @param[out]
  !    csr_row_ptr_C   array of \p m+1 elements that point to the start of every row of the
  !                    sparse CSR matrix \f$C\f$.
  !    @param[out]
  !    nnz_C           pointer to the number of non-zero entries of the sparse CSR
  !                    matrix \f$C\f$.
  !    @param[in]
  !    info_C          structure that holds meta data for the sparse CSR matrix \f$C\f$.
  !    @param[in]
  !    temp_buffer     temporary storage buffer allocated by the user, size is returned
  !                    by rocsparse_scsrgemm_buffer_size(),
  !                    rocsparse_dcsrgemm_buffer_size(), rocsparse_ccsrgemm_buffer_size() or
  !                    rocsparse_zcsrgemm_buffer_size().
  !  
  !    \retval rocsparse_status_success the operation completed successfully.
  !    \retval rocsparse_status_invalid_handle the library context was not initialized.
  !    \retval rocsparse_status_invalid_size \p m, \p n, \p k, \p nnz_A, \p nnz_B or
  !            \p nnz_D is invalid.
  !    \retval rocsparse_status_invalid_pointer \p descr_A, \p csr_row_ptr_A,
  !            \p csr_col_ind_A, \p descr_B, \p csr_row_ptr_B, \p csr_col_ind_B,
  !            \p descr_D, \p csr_row_ptr_D, \p csr_col_ind_D, \p descr_C,
  !            \p csr_row_ptr_C, \p nnz_C, \p info_C or \p temp_buffer is invalid.
  !    \retval rocsparse_status_memory_error additional buffer for long rows could not be
  !            allocated.
  !    \retval rocsparse_status_not_implemented
  !            \p trans_A != \ref rocsparse_operation_none,
  !            \p trans_B != \ref rocsparse_operation_none, or
  !            \p rocsparse_matrix_type != \ref rocsparse_matrix_type_general.
  !  
    function rocsparse_csrgemm_nnz(handle,trans_A,trans_B,m,n,k,descr_A,nnz_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_row_ptr_B,csr_col_ind_B,descr_D,nnz_D,csr_row_ptr_D,csr_col_ind_D,descr_C,csr_row_ptr_C,nnz_C,info_C,temp_buffer) bind(c, name="rocsparse_csrgemm_nnz")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csrgemm_nnz
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),intent(INOUT) :: descr_A
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      type(c_ptr),intent(INOUT) :: descr_B
      integer(c_int),value :: nnz_B
      type(c_ptr),value :: csr_row_ptr_B
      type(c_ptr),value :: csr_col_ind_B
      type(c_ptr),intent(INOUT) :: descr_D
      integer(c_int),value :: nnz_D
      type(c_ptr),value :: csr_row_ptr_D
      type(c_ptr),value :: csr_col_ind_D
      type(c_ptr),intent(INOUT) :: descr_C
      type(c_ptr),value :: csr_row_ptr_C
      type(c_ptr),value :: nnz_C
      type(c_ptr),intent(INOUT) :: info_C
      type(c_ptr),value :: temp_buffer
    end function

  ! @{
    function rocsparse_scsrgemm(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_val_B,csr_row_ptr_B,csr_col_ind_B,beta,descr_D,nnz_D,csr_val_D,csr_row_ptr_D,csr_col_ind_D,descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,info_C,temp_buffer) bind(c, name="rocsparse_scsrgemm")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrgemm
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_float),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr_A
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      type(c_ptr),intent(INOUT) :: descr_B
      integer(c_int),value :: nnz_B
      type(c_ptr),value :: csr_val_B
      type(c_ptr),value :: csr_row_ptr_B
      type(c_ptr),value :: csr_col_ind_B
      real(c_float),intent(IN) :: beta
      type(c_ptr),intent(INOUT) :: descr_D
      integer(c_int),value :: nnz_D
      type(c_ptr),value :: csr_val_D
      type(c_ptr),value :: csr_row_ptr_D
      type(c_ptr),value :: csr_col_ind_D
      type(c_ptr),intent(INOUT) :: descr_C
      type(c_ptr),value :: csr_val_C
      type(c_ptr),value :: csr_row_ptr_C
      type(c_ptr),value :: csr_col_ind_C
      type(c_ptr),intent(INOUT) :: info_C
      type(c_ptr),value :: temp_buffer
    end function

  
    function rocsparse_dcsrgemm(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_val_B,csr_row_ptr_B,csr_col_ind_B,beta,descr_D,nnz_D,csr_val_D,csr_row_ptr_D,csr_col_ind_D,descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,info_C,temp_buffer) bind(c, name="rocsparse_dcsrgemm")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrgemm
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      real(c_double),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr_A
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      type(c_ptr),intent(INOUT) :: descr_B
      integer(c_int),value :: nnz_B
      type(c_ptr),value :: csr_val_B
      type(c_ptr),value :: csr_row_ptr_B
      type(c_ptr),value :: csr_col_ind_B
      real(c_double),intent(IN) :: beta
      type(c_ptr),intent(INOUT) :: descr_D
      integer(c_int),value :: nnz_D
      type(c_ptr),value :: csr_val_D
      type(c_ptr),value :: csr_row_ptr_D
      type(c_ptr),value :: csr_col_ind_D
      type(c_ptr),intent(INOUT) :: descr_C
      type(c_ptr),value :: csr_val_C
      type(c_ptr),value :: csr_row_ptr_C
      type(c_ptr),value :: csr_col_ind_C
      type(c_ptr),intent(INOUT) :: info_C
      type(c_ptr),value :: temp_buffer
    end function

  
    function rocsparse_ccsrgemm(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_val_B,csr_row_ptr_B,csr_col_ind_B,beta,descr_D,nnz_D,csr_val_D,csr_row_ptr_D,csr_col_ind_D,descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,info_C,temp_buffer) bind(c, name="rocsparse_ccsrgemm")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrgemm
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr_A
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      type(c_ptr),intent(INOUT) :: descr_B
      integer(c_int),value :: nnz_B
      type(c_ptr),value :: csr_val_B
      type(c_ptr),value :: csr_row_ptr_B
      type(c_ptr),value :: csr_col_ind_B
      complex(c_float_complex),intent(IN) :: beta
      type(c_ptr),intent(INOUT) :: descr_D
      integer(c_int),value :: nnz_D
      type(c_ptr),value :: csr_val_D
      type(c_ptr),value :: csr_row_ptr_D
      type(c_ptr),value :: csr_col_ind_D
      type(c_ptr),intent(INOUT) :: descr_C
      type(c_ptr),value :: csr_val_C
      type(c_ptr),value :: csr_row_ptr_C
      type(c_ptr),value :: csr_col_ind_C
      type(c_ptr),intent(INOUT) :: info_C
      type(c_ptr),value :: temp_buffer
    end function

  
    function rocsparse_zcsrgemm(handle,trans_A,trans_B,m,n,k,alpha,descr_A,nnz_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,descr_B,nnz_B,csr_val_B,csr_row_ptr_B,csr_col_ind_B,beta,descr_D,nnz_D,csr_val_D,csr_row_ptr_D,csr_col_ind_D,descr_C,csr_val_C,csr_row_ptr_C,csr_col_ind_C,info_C,temp_buffer) bind(c, name="rocsparse_zcsrgemm")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrgemm
      type(c_ptr),value :: handle
      integer(kind(rocsparse_operation_none)),value :: trans_A
      integer(kind(rocsparse_operation_none)),value :: trans_B
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),intent(INOUT) :: descr_A
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      type(c_ptr),intent(INOUT) :: descr_B
      integer(c_int),value :: nnz_B
      type(c_ptr),value :: csr_val_B
      type(c_ptr),value :: csr_row_ptr_B
      type(c_ptr),value :: csr_col_ind_B
      complex(c_double_complex),intent(IN) :: beta
      type(c_ptr),intent(INOUT) :: descr_D
      integer(c_int),value :: nnz_D
      type(c_ptr),value :: csr_val_D
      type(c_ptr),value :: csr_row_ptr_D
      type(c_ptr),value :: csr_col_ind_D
      type(c_ptr),intent(INOUT) :: descr_C
      type(c_ptr),value :: csr_val_C
      type(c_ptr),value :: csr_row_ptr_C
      type(c_ptr),value :: csr_col_ind_C
      type(c_ptr),intent(INOUT) :: info_C
      type(c_ptr),value :: temp_buffer
    end function

  ! ! \ingroup precond_module
  !    \brief Incomplete Cholesky factorization with 0 fill-ins and no pivoting using CSR
  !    storage format
  !  
  !    \details
  !    \p rocsparse_csric_zero_pivot returns \ref rocsparse_status_zero_pivot, if either a
  !    structural or numerical zero has been found during rocsparse_scsric0() or
  !    rocsparse_dcsric0() computation. The first zero pivot \f$j\f$ at \f$A_{j,j}\f$
  !    is stored in \p position, using same index base as the CSR matrix.
  !  
  !    \p position can be in host or device memory. If no zero pivot has been found,
  !    \p position is set to -1 and \ref rocsparse_status_success is returned instead.
  !  
  !    \note \p rocsparse_csric0_zero_pivot is a blocking function. It might influence
  !    performance negatively.
  !  
  !    @param[in]
  !    handle      handle to the rocsparse library context queue.
  !    @param[in]
  !    info        structure that holds the information collected during the analysis step.
  !    @param[inout]
  !    position    pointer to zero pivot \f$j\f$, can be in host or device memory.
  !  
  !    \retval     rocsparse_status_success the operation completed successfully.
  !    \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !    \retval     rocsparse_status_invalid_pointer \p info or \p position pointer is
  !                invalid.
  !    \retval     rocsparse_status_internal_error an internal error occurred.
  !    \retval     rocsparse_status_zero_pivot zero pivot has been found.
  !  
    function rocsparse_csric0_zero_pivot(handle,info,position) bind(c, name="rocsparse_csric0_zero_pivot")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csric0_zero_pivot
      type(c_ptr),value :: handle
      type(c_ptr),intent(INOUT) :: info
      type(c_ptr),value :: position
    end function

  ! @{
    function rocsparse_scsric0_buffer_size(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,info,buffer_size) bind(c, name="rocsparse_scsric0_buffer_size")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsric0_buffer_size
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      type(c_ptr),value :: buffer_size
    end function

  
    function rocsparse_dcsric0_buffer_size(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,info,buffer_size) bind(c, name="rocsparse_dcsric0_buffer_size")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsric0_buffer_size
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      type(c_ptr),value :: buffer_size
    end function

  
    function rocsparse_ccsric0_buffer_size(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,info,buffer_size) bind(c, name="rocsparse_ccsric0_buffer_size")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsric0_buffer_size
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      type(c_ptr),value :: buffer_size
    end function

  
    function rocsparse_zcsric0_buffer_size(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,info,buffer_size) bind(c, name="rocsparse_zcsric0_buffer_size")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsric0_buffer_size
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      type(c_ptr),value :: buffer_size
    end function

  ! @{
    function rocsparse_scsric0_analysis(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,info,analysis,solve,temp_buffer) bind(c, name="rocsparse_scsric0_analysis")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsric0_analysis
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

  
    function rocsparse_dcsric0_analysis(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,info,analysis,solve,temp_buffer) bind(c, name="rocsparse_dcsric0_analysis")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsric0_analysis
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

  
    function rocsparse_ccsric0_analysis(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,info,analysis,solve,temp_buffer) bind(c, name="rocsparse_ccsric0_analysis")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsric0_analysis
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

  
    function rocsparse_zcsric0_analysis(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,info,analysis,solve,temp_buffer) bind(c, name="rocsparse_zcsric0_analysis")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsric0_analysis
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

  ! ! \ingroup precond_module
  !    \brief Incomplete Cholesky factorization with 0 fill-ins and no pivoting using CSR
  !    storage format
  !  
  !    \details
  !    \p rocsparse_csric0_clear deallocates all memory that was allocated by
  !    rocsparse_scsric0_analysis() or rocsparse_dcsric0_analysis(). This is especially
  !    useful, if memory is an issue and the analysis data is not required for further
  !    computation.
  !  
  !    \note
  !    Calling \p rocsparse_csric0_clear is optional. All allocated resources will be
  !    cleared, when the opaque \ref rocsparse_mat_info struct is destroyed using
  !    rocsparse_destroy_mat_info().
  !  
  !    @param[in]
  !    handle      handle to the rocsparse library context queue.
  !    @param[inout]
  !    info        structure that holds the information collected during the analysis step.
  !  
  !    \retval     rocsparse_status_success the operation completed successfully.
  !    \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !    \retval     rocsparse_status_invalid_pointer \p info pointer is invalid.
  !    \retval     rocsparse_status_memory_error the buffer holding the meta data could not
  !                be deallocated.
  !    \retval     rocsparse_status_internal_error an internal error occurred.
  !  
    function rocsparse_csric0_clear(handle,info) bind(c, name="rocsparse_csric0_clear")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csric0_clear
      type(c_ptr),value :: handle
      type(c_ptr),intent(INOUT) :: info
    end function

  ! @{
    function rocsparse_scsric0(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,info,policy,temp_buffer) bind(c, name="rocsparse_scsric0")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsric0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

  
    function rocsparse_dcsric0(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,info,policy,temp_buffer) bind(c, name="rocsparse_dcsric0")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsric0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

  
    function rocsparse_ccsric0(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,info,policy,temp_buffer) bind(c, name="rocsparse_ccsric0")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsric0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

  
    function rocsparse_zcsric0(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,info,policy,temp_buffer) bind(c, name="rocsparse_zcsric0")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsric0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

  ! ! \ingroup precond_module
  !    \brief Incomplete LU factorization with 0 fill-ins and no pivoting using CSR
  !    storage format
  !  
  !    \details
  !    \p rocsparse_csrilu0_zero_pivot returns \ref rocsparse_status_zero_pivot, if either a
  !    structural or numerical zero has been found during rocsparse_scsrilu0(),
  !    rocsparse_dcsrilu0(), rocsparse_ccsrilu0() or rocsparse_zcsrilu0() computation. The
  !    first zero pivot \f$j\f$ at \f$A_{j,j}\f$ is stored in \p position, using same index
  !    base as the CSR matrix.
  !  
  !    \p position can be in host or device memory. If no zero pivot has been found,
  !    \p position is set to -1 and \ref rocsparse_status_success is returned instead.
  !  
  !    \note \p rocsparse_csrilu0_zero_pivot is a blocking function. It might influence
  !    performance negatively.
  !  
  !    @param[in]
  !    handle      handle to the rocsparse library context queue.
  !    @param[in]
  !    info        structure that holds the information collected during the analysis step.
  !    @param[inout]
  !    position    pointer to zero pivot \f$j\f$, can be in host or device memory.
  !  
  !    \retval     rocsparse_status_success the operation completed successfully.
  !    \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !    \retval     rocsparse_status_invalid_pointer \p info or \p position pointer is
  !                invalid.
  !    \retval     rocsparse_status_internal_error an internal error occurred.
  !    \retval     rocsparse_status_zero_pivot zero pivot has been found.
  !  
    function rocsparse_csrilu0_zero_pivot(handle,info,position) bind(c, name="rocsparse_csrilu0_zero_pivot")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csrilu0_zero_pivot
      type(c_ptr),value :: handle
      type(c_ptr),intent(INOUT) :: info
      type(c_ptr),value :: position
    end function

  ! @{
    function rocsparse_scsrilu0_buffer_size(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,info,buffer_size) bind(c, name="rocsparse_scsrilu0_buffer_size")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrilu0_buffer_size
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      type(c_ptr),value :: buffer_size
    end function

  
    function rocsparse_dcsrilu0_buffer_size(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,info,buffer_size) bind(c, name="rocsparse_dcsrilu0_buffer_size")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrilu0_buffer_size
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      type(c_ptr),value :: buffer_size
    end function

  
    function rocsparse_ccsrilu0_buffer_size(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,info,buffer_size) bind(c, name="rocsparse_ccsrilu0_buffer_size")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrilu0_buffer_size
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      type(c_ptr),value :: buffer_size
    end function

  
    function rocsparse_zcsrilu0_buffer_size(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,info,buffer_size) bind(c, name="rocsparse_zcsrilu0_buffer_size")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrilu0_buffer_size
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      type(c_ptr),value :: buffer_size
    end function

  ! @{
    function rocsparse_scsrilu0_analysis(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,info,analysis,solve,temp_buffer) bind(c, name="rocsparse_scsrilu0_analysis")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrilu0_analysis
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

  
    function rocsparse_dcsrilu0_analysis(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,info,analysis,solve,temp_buffer) bind(c, name="rocsparse_dcsrilu0_analysis")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrilu0_analysis
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

  
    function rocsparse_ccsrilu0_analysis(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,info,analysis,solve,temp_buffer) bind(c, name="rocsparse_ccsrilu0_analysis")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrilu0_analysis
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

  
    function rocsparse_zcsrilu0_analysis(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,info,analysis,solve,temp_buffer) bind(c, name="rocsparse_zcsrilu0_analysis")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrilu0_analysis
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      integer(kind(rocsparse_analysis_policy_reuse)),value :: analysis
      integer(kind(rocsparse_solve_policy_auto)),value :: solve
      type(c_ptr),value :: temp_buffer
    end function

  ! ! \ingroup precond_module
  !    \brief Incomplete LU factorization with 0 fill-ins and no pivoting using CSR
  !    storage format
  !  
  !    \details
  !    \p rocsparse_csrilu0_clear deallocates all memory that was allocated by
  !    rocsparse_scsrilu0_analysis(), rocsparse_dcsrilu0_analysis(),
  !    rocsparse_ccsrilu0_analysis() or rocsparse_zcsrilu0_analysis(). This is especially
  !    useful, if memory is an issue and the analysis data is not required for further
  !    computation.
  !  
  !    \note
  !    Calling \p rocsparse_csrilu0_clear is optional. All allocated resources will be
  !    cleared, when the opaque \ref rocsparse_mat_info struct is destroyed using
  !    rocsparse_destroy_mat_info().
  !  
  !    @param[in]
  !    handle      handle to the rocsparse library context queue.
  !    @param[inout]
  !    info        structure that holds the information collected during the analysis step.
  !  
  !    \retval     rocsparse_status_success the operation completed successfully.
  !    \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !    \retval     rocsparse_status_invalid_pointer \p info pointer is invalid.
  !    \retval     rocsparse_status_memory_error the buffer holding the meta data could not
  !                be deallocated.
  !    \retval     rocsparse_status_internal_error an internal error occurred.
  !  
    function rocsparse_csrilu0_clear(handle,info) bind(c, name="rocsparse_csrilu0_clear")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csrilu0_clear
      type(c_ptr),value :: handle
      type(c_ptr),intent(INOUT) :: info
    end function

  ! @{
    function rocsparse_scsrilu0(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,info,policy,temp_buffer) bind(c, name="rocsparse_scsrilu0")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsrilu0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

  
    function rocsparse_dcsrilu0(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,info,policy,temp_buffer) bind(c, name="rocsparse_dcsrilu0")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsrilu0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

  
    function rocsparse_ccsrilu0(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,info,policy,temp_buffer) bind(c, name="rocsparse_ccsrilu0")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsrilu0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

  
    function rocsparse_zcsrilu0(handle,m,nnz,descr,csr_val,csr_row_ptr,csr_col_ind,info,policy,temp_buffer) bind(c, name="rocsparse_zcsrilu0")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsrilu0
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: nnz
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: info
      integer(kind(rocsparse_solve_policy_auto)),value :: policy
      type(c_ptr),value :: temp_buffer
    end function

  ! @{
    function rocsparse_snnz(handle,dir,m,n,descr,A,ld,nnz_per_row_columns,nnz_total_dev_host_ptr) bind(c, name="rocsparse_snnz")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_snnz
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
      type(c_ptr),value :: nnz_per_row_columns
      type(c_ptr),value :: nnz_total_dev_host_ptr
    end function

  
    function rocsparse_dnnz(handle,dir,m,n,descr,A,ld,nnz_per_row_columns,nnz_total_dev_host_ptr) bind(c, name="rocsparse_dnnz")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dnnz
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
      type(c_ptr),value :: nnz_per_row_columns
      type(c_ptr),value :: nnz_total_dev_host_ptr
    end function

  
    function rocsparse_cnnz(handle,dir,m,n,descr,A,ld,nnz_per_row_columns,nnz_total_dev_host_ptr) bind(c, name="rocsparse_cnnz")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cnnz
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
      type(c_ptr),value :: nnz_per_row_columns
      type(c_ptr),value :: nnz_total_dev_host_ptr
    end function

  
    function rocsparse_znnz(handle,dir,m,n,descr,A,ld,nnz_per_row_columns,nnz_total_dev_host_ptr) bind(c, name="rocsparse_znnz")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_znnz
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
      type(c_ptr),value :: nnz_per_row_columns
      type(c_ptr),value :: nnz_total_dev_host_ptr
    end function

  ! @{
    function rocsparse_sdense2csr(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="rocsparse_sdense2csr")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sdense2csr
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
      type(c_ptr),value :: nnz_per_rows
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
    end function

  
    function rocsparse_ddense2csr(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="rocsparse_ddense2csr")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ddense2csr
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
      type(c_ptr),value :: nnz_per_rows
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
    end function

  
    function rocsparse_cdense2csr(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="rocsparse_cdense2csr")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cdense2csr
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
      type(c_ptr),value :: nnz_per_rows
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
    end function

  
    function rocsparse_zdense2csr(handle,m,n,descr,A,ld,nnz_per_rows,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="rocsparse_zdense2csr")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zdense2csr
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
      type(c_ptr),value :: nnz_per_rows
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
    end function

  ! @{
    function rocsparse_sdense2csc(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_col_ptr,csc_row_ind) bind(c, name="rocsparse_sdense2csc")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sdense2csc
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
      type(c_ptr),value :: nnz_per_columns
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_col_ptr
      type(c_ptr),value :: csc_row_ind
    end function

  
    function rocsparse_ddense2csc(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_col_ptr,csc_row_ind) bind(c, name="rocsparse_ddense2csc")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ddense2csc
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
      type(c_ptr),value :: nnz_per_columns
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_col_ptr
      type(c_ptr),value :: csc_row_ind
    end function

  
    function rocsparse_cdense2csc(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_col_ptr,csc_row_ind) bind(c, name="rocsparse_cdense2csc")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cdense2csc
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
      type(c_ptr),value :: nnz_per_columns
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_col_ptr
      type(c_ptr),value :: csc_row_ind
    end function

  
    function rocsparse_zdense2csc(handle,m,n,descr,A,ld,nnz_per_columns,csc_val,csc_col_ptr,csc_row_ind) bind(c, name="rocsparse_zdense2csc")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zdense2csc
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: A
      integer(c_int),value :: ld
      type(c_ptr),value :: nnz_per_columns
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_col_ptr
      type(c_ptr),value :: csc_row_ind
    end function

  ! @{
    function rocsparse_scsr2dense(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld) bind(c, name="rocsparse_scsr2dense")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsr2dense
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: A
      integer(c_int),value :: ld
    end function

  
    function rocsparse_dcsr2dense(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld) bind(c, name="rocsparse_dcsr2dense")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsr2dense
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: A
      integer(c_int),value :: ld
    end function

  
    function rocsparse_ccsr2dense(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld) bind(c, name="rocsparse_ccsr2dense")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsr2dense
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: A
      integer(c_int),value :: ld
    end function

  
    function rocsparse_zcsr2dense(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,A,ld) bind(c, name="rocsparse_zcsr2dense")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsr2dense
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: A
      integer(c_int),value :: ld
    end function

  ! @{
    function rocsparse_scsc2dense(handle,m,n,descr,csc_val,csc_col_ptr,csc_row_ind,A,ld) bind(c, name="rocsparse_scsc2dense")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsc2dense
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_col_ptr
      type(c_ptr),value :: csc_row_ind
      type(c_ptr),value :: A
      integer(c_int),value :: ld
    end function

  
    function rocsparse_dcsc2dense(handle,m,n,descr,csc_val,csc_col_ptr,csc_row_ind,A,ld) bind(c, name="rocsparse_dcsc2dense")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsc2dense
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_col_ptr
      type(c_ptr),value :: csc_row_ind
      type(c_ptr),value :: A
      integer(c_int),value :: ld
    end function

  
    function rocsparse_ccsc2dense(handle,m,n,descr,csc_val,csc_col_ptr,csc_row_ind,A,ld) bind(c, name="rocsparse_ccsc2dense")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsc2dense
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_col_ptr
      type(c_ptr),value :: csc_row_ind
      type(c_ptr),value :: A
      integer(c_int),value :: ld
    end function

  
    function rocsparse_zcsc2dense(handle,m,n,descr,csc_val,csc_col_ptr,csc_row_ind,A,ld) bind(c, name="rocsparse_zcsc2dense")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsc2dense
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_col_ptr
      type(c_ptr),value :: csc_row_ind
      type(c_ptr),value :: A
      integer(c_int),value :: ld
    end function

  ! @{
    function rocsparse_snnz_compress(handle,m,descr_A,csr_val_A,csr_row_ptr_A,nnz_per_row,nnz_C,tol) bind(c, name="rocsparse_snnz_compress")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_snnz_compress
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),intent(INOUT) :: descr_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: nnz_per_row
      type(c_ptr),value :: nnz_C
      real(c_float),value :: tol
    end function

  
    function rocsparse_dnnz_compress(handle,m,descr_A,csr_val_A,csr_row_ptr_A,nnz_per_row,nnz_C,tol) bind(c, name="rocsparse_dnnz_compress")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dnnz_compress
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),intent(INOUT) :: descr_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: nnz_per_row
      type(c_ptr),value :: nnz_C
      real(c_double),value :: tol
    end function

  
    function rocsparse_cnnz_compress(handle,m,descr_A,csr_val_A,csr_row_ptr_A,nnz_per_row,nnz_C,tol) bind(c, name="rocsparse_cnnz_compress")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cnnz_compress
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),intent(INOUT) :: descr_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: nnz_per_row
      type(c_ptr),value :: nnz_C
      complex(c_float_complex),value :: tol
    end function

  
    function rocsparse_znnz_compress(handle,m,descr_A,csr_val_A,csr_row_ptr_A,nnz_per_row,nnz_C,tol) bind(c, name="rocsparse_znnz_compress")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_znnz_compress
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),intent(INOUT) :: descr_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: nnz_per_row
      type(c_ptr),value :: nnz_C
      complex(c_double_complex),value :: tol
    end function

  ! ! \ingroup conv_module
  !    \brief Convert a sparse CSR matrix into a sparse COO matrix
  !  
  !    \details
  !    \p rocsparse_csr2coo converts the CSR array containing the row offsets, that point
  !    to the start of every row, into a COO array of row indices.
  !  
  !    \note
  !    It can also be used to convert a CSC array containing the column offsets into a COO
  !    array of column indices.
  !  
  !    \note
  !    This function is non blocking and executed asynchronously with respect to the host.
  !    It may return before the actual computation has finished.
  !  
  !    @param[in]
  !    handle      handle to the rocsparse library context queue.
  !    @param[in]
  !    csr_row_ptr array of \p m+1 elements that point to the start of every row
  !                of the sparse CSR matrix.
  !    @param[in]
  !    nnz         number of non-zero entries of the sparse CSR matrix.
  !    @param[in]
  !    m           number of rows of the sparse CSR matrix.
  !    @param[out]
  !    coo_row_ind array of \p nnz elements containing the row indices of the sparse COO
  !                matrix.
  !    @param[in]
  !    idx_base    \ref rocsparse_index_base_zero or \ref rocsparse_index_base_one.
  !  
  !    \retval     rocsparse_status_success the operation completed successfully.
  !    \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !    \retval     rocsparse_status_invalid_size \p m or \p nnz is invalid.
  !    \retval     rocsparse_status_invalid_pointer \p csr_row_ptr or \p coo_row_ind
  !                pointer is invalid.
  !    \retval     rocsparse_status_arch_mismatch the device is not supported.
  !  
  !    \par Example
  !    This example converts a CSR matrix into a COO matrix.
  !    \code{.c}
  !             1 2 0 3 0
  !         A = 0 4 5 0 0
  !             6 0 0 7 8
  !  
  !        rocsparse_int m   = 3;
  !        rocsparse_int n   = 5;
  !        rocsparse_int nnz = 8;
  !  
  !        csr_row_ptr[m+1] = {0, 3, 5, 8};              device memory
  !        csr_col_ind[nnz] = {0, 1, 3, 1, 2, 0, 3, 4};  device memory
  !        csr_val[nnz]     = {1, 2, 3, 4, 5, 6, 7, 8};  device memory
  !  
  !         Allocate COO matrix arrays
  !        rocsparse_int coo_row_ind;
  !        rocsparse_int coo_col_ind;
  !        float coo_val;
  !  
  !        hipMalloc((void)&coo_row_ind, sizeof(rocsparse_int)  nnz);
  !        hipMalloc((void)&coo_col_ind, sizeof(rocsparse_int)  nnz);
  !        hipMalloc((void)&coo_val, sizeof(float)  nnz);
  !  
  !         Convert the csr row offsets into coo row indices
  !        rocsparse_csr2coo(handle,
  !                          csr_row_ptr,
  !                          nnz,
  !                          m,
  !                          coo_row_ind,
  !                          rocsparse_index_base_zero);
  !  
  !         Copy the column and value arrays
  !        hipMemcpy(coo_col_ind,
  !                  csr_col_ind,
  !                  sizeof(rocsparse_int)  nnz,
  !                  hipMemcpyDeviceToDevice);
  !  
  !        hipMemcpy(coo_val,
  !                  csr_val,
  !                  sizeof(float)  nnz,
  !                  hipMemcpyDeviceToDevice);
  !    \endcode
  !  
    function rocsparse_csr2coo(handle,csr_row_ptr,nnz,m,coo_row_ind,idx_base) bind(c, name="rocsparse_csr2coo")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csr2coo
      type(c_ptr),value :: handle
      type(c_ptr),value :: csr_row_ptr
      integer(c_int),value :: nnz
      integer(c_int),value :: m
      type(c_ptr),value :: coo_row_ind
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

  ! ! \ingroup conv_module
  !    \brief Convert a sparse CSR matrix into a sparse CSC matrix
  !  
  !    \details
  !    \p rocsparse_csr2csc_buffer_size returns the size of the temporary storage buffer
  !    required by rocsparse_scsr2csc(), rocsparse_dcsr2csc(), rocsparse_ccsr2csc() and
  !    rocsparse_zcsr2csc(). The temporary storage buffer must be allocated by the user.
  !  
  !    @param[in]
  !    handle      handle to the rocsparse library context queue.
  !    @param[in]
  !    m           number of rows of the sparse CSR matrix.
  !    @param[in]
  !    n           number of columns of the sparse CSR matrix.
  !    @param[in]
  !    nnz         number of non-zero entries of the sparse CSR matrix.
  !    @param[in]
  !    csr_row_ptr array of \p m+1 elements that point to the start of every row of the
  !                sparse CSR matrix.
  !    @param[in]
  !    csr_col_ind array of \p nnz elements containing the column indices of the sparse
  !                CSR matrix.
  !    @param[in]
  !    copy_values \ref rocsparse_action_symbolic or \ref rocsparse_action_numeric.
  !    @param[out]
  !    buffer_size number of bytes of the temporary storage buffer required by
  !                rocsparse_scsr2csc(), rocsparse_dcsr2csc(), rocsparse_ccsr2csc() and
  !                rocsparse_zcsr2csc().
  !  
  !    \retval     rocsparse_status_success the operation completed successfully.
  !    \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !    \retval     rocsparse_status_invalid_size \p m, \p n or \p nnz is invalid.
  !    \retval     rocsparse_status_invalid_pointer \p csr_row_ptr, \p csr_col_ind or
  !                \p buffer_size pointer is invalid.
  !    \retval     rocsparse_status_internal_error an internal error occurred.
  !  
    function rocsparse_csr2csc_buffer_size(handle,m,n,nnz,csr_row_ptr,csr_col_ind,copy_values,buffer_size) bind(c, name="rocsparse_csr2csc_buffer_size")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csr2csc_buffer_size
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      integer(kind(rocsparse_action_symbolic)),value :: copy_values
      type(c_ptr),value :: buffer_size
    end function

  ! @{
    function rocsparse_scsr2csc(handle,m,n,nnz,csr_val,csr_row_ptr,csr_col_ind,csc_val,csc_row_ind,csc_col_ptr,copy_values,idx_base,temp_buffer) bind(c, name="rocsparse_scsr2csc")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsr2csc
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_row_ind
      type(c_ptr),value :: csc_col_ptr
      integer(kind(rocsparse_action_symbolic)),value :: copy_values
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      type(c_ptr),value :: temp_buffer
    end function

  
    function rocsparse_dcsr2csc(handle,m,n,nnz,csr_val,csr_row_ptr,csr_col_ind,csc_val,csc_row_ind,csc_col_ptr,copy_values,idx_base,temp_buffer) bind(c, name="rocsparse_dcsr2csc")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsr2csc
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_row_ind
      type(c_ptr),value :: csc_col_ptr
      integer(kind(rocsparse_action_symbolic)),value :: copy_values
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      type(c_ptr),value :: temp_buffer
    end function

  
    function rocsparse_ccsr2csc(handle,m,n,nnz,csr_val,csr_row_ptr,csr_col_ind,csc_val,csc_row_ind,csc_col_ptr,copy_values,idx_base,temp_buffer) bind(c, name="rocsparse_ccsr2csc")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsr2csc
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_row_ind
      type(c_ptr),value :: csc_col_ptr
      integer(kind(rocsparse_action_symbolic)),value :: copy_values
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      type(c_ptr),value :: temp_buffer
    end function

  
    function rocsparse_zcsr2csc(handle,m,n,nnz,csr_val,csr_row_ptr,csr_col_ind,csc_val,csc_row_ind,csc_col_ptr,copy_values,idx_base,temp_buffer) bind(c, name="rocsparse_zcsr2csc")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsr2csc
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: csc_val
      type(c_ptr),value :: csc_row_ind
      type(c_ptr),value :: csc_col_ptr
      integer(kind(rocsparse_action_symbolic)),value :: copy_values
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
      type(c_ptr),value :: temp_buffer
    end function

  ! ! \ingroup conv_module
  !    \brief Convert a sparse CSR matrix into a sparse ELL matrix
  !  
  !    \details
  !    \p rocsparse_csr2ell_width computes the maximum of the per row non-zero elements
  !    over all rows, the ELL \p width, for a given CSR matrix.
  !  
  !    \note
  !    This function is non blocking and executed asynchronously with respect to the host.
  !    It may return before the actual computation has finished.
  !  
  !    @param[in]
  !    handle      handle to the rocsparse library context queue.
  !    @param[in]
  !    m           number of rows of the sparse CSR matrix.
  !    @param[in]
  !    csr_descr   descriptor of the sparse CSR matrix. Currently, only
  !                \ref rocsparse_matrix_type_general is supported.
  !    @param[in]
  !    csr_row_ptr array of \p m+1 elements that point to the start of every row of the
  !                sparse CSR matrix.
  !    @param[in]
  !    ell_descr   descriptor of the sparse ELL matrix. Currently, only
  !                \ref rocsparse_matrix_type_general is supported.
  !    @param[out]
  !    ell_width   pointer to the number of non-zero elements per row in ELL storage
  !                format.
  !  
  !    \retval     rocsparse_status_success the operation completed successfully.
  !    \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !    \retval     rocsparse_status_invalid_size \p m is invalid.
  !    \retval     rocsparse_status_invalid_pointer \p csr_descr, \p csr_row_ptr, or
  !                \p ell_width pointer is invalid.
  !    \retval     rocsparse_status_internal_error an internal error occurred.
  !    \retval     rocsparse_status_not_implemented
  !                \ref rocsparse_matrix_type != \ref rocsparse_matrix_type_general.
  !  
    function rocsparse_csr2ell_width(handle,m,csr_descr,csr_row_ptr,ell_descr,ell_width) bind(c, name="rocsparse_csr2ell_width")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csr2ell_width
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),intent(INOUT) :: csr_descr
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),intent(INOUT) :: ell_descr
      type(c_ptr),value :: ell_width
    end function

  ! @{
    function rocsparse_scsr2ell(handle,m,csr_descr,csr_val,csr_row_ptr,csr_col_ind,ell_descr,ell_width,ell_val,ell_col_ind) bind(c, name="rocsparse_scsr2ell")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsr2ell
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),intent(INOUT) :: csr_descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: ell_descr
      integer(c_int),value :: ell_width
      type(c_ptr),value :: ell_val
      type(c_ptr),value :: ell_col_ind
    end function

  
    function rocsparse_dcsr2ell(handle,m,csr_descr,csr_val,csr_row_ptr,csr_col_ind,ell_descr,ell_width,ell_val,ell_col_ind) bind(c, name="rocsparse_dcsr2ell")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsr2ell
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),intent(INOUT) :: csr_descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: ell_descr
      integer(c_int),value :: ell_width
      type(c_ptr),value :: ell_val
      type(c_ptr),value :: ell_col_ind
    end function

  
    function rocsparse_ccsr2ell(handle,m,csr_descr,csr_val,csr_row_ptr,csr_col_ind,ell_descr,ell_width,ell_val,ell_col_ind) bind(c, name="rocsparse_ccsr2ell")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsr2ell
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),intent(INOUT) :: csr_descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: ell_descr
      integer(c_int),value :: ell_width
      type(c_ptr),value :: ell_val
      type(c_ptr),value :: ell_col_ind
    end function

  
    function rocsparse_zcsr2ell(handle,m,csr_descr,csr_val,csr_row_ptr,csr_col_ind,ell_descr,ell_width,ell_val,ell_col_ind) bind(c, name="rocsparse_zcsr2ell")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsr2ell
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      type(c_ptr),intent(INOUT) :: csr_descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: ell_descr
      integer(c_int),value :: ell_width
      type(c_ptr),value :: ell_val
      type(c_ptr),value :: ell_col_ind
    end function

  ! @{
    function rocsparse_scsr2hyb(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,hyb,user_ell_width,partition_type) bind(c, name="rocsparse_scsr2hyb")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsr2hyb
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: hyb
      integer(c_int),value :: user_ell_width
      integer(kind(rocsparse_hyb_partition_auto)),value :: partition_type
    end function

  
    function rocsparse_dcsr2hyb(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,hyb,user_ell_width,partition_type) bind(c, name="rocsparse_dcsr2hyb")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsr2hyb
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: hyb
      integer(c_int),value :: user_ell_width
      integer(kind(rocsparse_hyb_partition_auto)),value :: partition_type
    end function

  
    function rocsparse_ccsr2hyb(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,hyb,user_ell_width,partition_type) bind(c, name="rocsparse_ccsr2hyb")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsr2hyb
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: hyb
      integer(c_int),value :: user_ell_width
      integer(kind(rocsparse_hyb_partition_auto)),value :: partition_type
    end function

  
    function rocsparse_zcsr2hyb(handle,m,n,descr,csr_val,csr_row_ptr,csr_col_ind,hyb,user_ell_width,partition_type) bind(c, name="rocsparse_zcsr2hyb")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsr2hyb
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),intent(INOUT) :: hyb
      integer(c_int),value :: user_ell_width
      integer(kind(rocsparse_hyb_partition_auto)),value :: partition_type
    end function

  ! ! \ingroup conv_module
  !    \brief 
  !    This function computes the number of nonzero block columns per row and the total number of nonzero blocks in a sparse 
  !    BSR matrix given a sparse CSR matrix as input.
  !   
  !    \details
  !    The routine does support asynchronous execution if the pointer mode is set to device.
  !   
  !    @param[in]
  !    handle      handle to the rocsparse library context queue.
  !  
  !    @param[in]
  !    dir             direction that specified whether to count nonzero elements by \ref rocsparse_direction_row or by 
  !                \ref rocsparse_direction_row.
  !  
  !    @param[in]
  !    m               number of rows of the sparse CSR matrix.
  !  
  !    @param[in]
  !    n               number of columns of the sparse CSR matrix.
  !  
  !    @param[in]
  !    csr_descr    descriptor of the sparse CSR matrix. Currently, only
  !                 \ref rocsparse_matrix_type_general is supported.
  !    @param[in]
  !    csr_row_ptr integer array containing \p m+1 elements that point to the start of each row of the CSR matrix          
  !  
  !    @param[in]
  !    csr_col_ind integer array of the column indices for each non-zero element in the CSR matrix
  !   
  !    @param[in]
  !    block_dim   the block dimension of the BSR matrix. Between 1 and min(m, n)
  !   
  !    @param[in]
  !    bsr_descr    descriptor of the sparse BSR matrix. Currently, only
  !                 \ref rocsparse_matrix_type_general is supported.
  !    @param[out]
  !    bsr_row_ptr integer array containing \p mb+1 elements that point to the start of each block row of the BSR matrix
  !  
  !    @param[out]
  !    bsr_nnz     total number of nonzero elements in device or host memory.
  !  
  !    \retval     rocsparse_status_success the operation completed successfully.
  !    \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !    \retval     rocsparse_status_invalid_size \p m or \p n or \p block_dim is invalid.
  !    \retval     rocsparse_status_invalid_pointer \p csr_row_ptr or \p csr_col_ind or \p bsr_row_ptr or \p bsr_nnz
  !                pointer is invalid.
  !  
    function rocsparse_csr2bsr_nnz(handle,dir,m,n,csr_descr,csr_row_ptr,csr_col_ind,block_dim,bsr_descr,bsr_row_ptr,bsr_nnz) bind(c, name="rocsparse_csr2bsr_nnz")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csr2bsr_nnz
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: csr_descr
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),intent(INOUT) :: bsr_descr
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_nnz
    end function

  ! @{
    function rocsparse_scsr2bsr(handle,dir,m,n,csr_descr,csr_val,csr_row_ptr,csr_col_ind,block_dim,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind) bind(c, name="rocsparse_scsr2bsr")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsr2bsr
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: csr_descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),intent(INOUT) :: bsr_descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
    end function

  
    function rocsparse_dcsr2bsr(handle,dir,m,n,csr_descr,csr_val,csr_row_ptr,csr_col_ind,block_dim,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind) bind(c, name="rocsparse_dcsr2bsr")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsr2bsr
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: csr_descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),intent(INOUT) :: bsr_descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
    end function

  
    function rocsparse_ccsr2bsr(handle,dir,m,n,csr_descr,csr_val,csr_row_ptr,csr_col_ind,block_dim,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind) bind(c, name="rocsparse_ccsr2bsr")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsr2bsr
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: csr_descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),intent(INOUT) :: bsr_descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
    end function

  
    function rocsparse_zcsr2bsr(handle,dir,m,n,csr_descr,csr_val,csr_row_ptr,csr_col_ind,block_dim,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind) bind(c, name="rocsparse_zcsr2bsr")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsr2bsr
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: csr_descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),intent(INOUT) :: bsr_descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
    end function

  ! @{
    function rocsparse_scsr2csr_compress(handle,m,n,descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,nnz_A,nnz_per_row,csr_val_C,csr_row_ptr_C,csr_col_ind_C,tol) bind(c, name="rocsparse_scsr2csr_compress")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_scsr2csr_compress
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: descr_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: nnz_per_row
      type(c_ptr),value :: csr_val_C
      type(c_ptr),value :: csr_row_ptr_C
      type(c_ptr),value :: csr_col_ind_C
      real(c_float),value :: tol
    end function

  
    function rocsparse_dcsr2csr_compress(handle,m,n,descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,nnz_A,nnz_per_row,csr_val_C,csr_row_ptr_C,csr_col_ind_C,tol) bind(c, name="rocsparse_dcsr2csr_compress")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dcsr2csr_compress
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: descr_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: nnz_per_row
      type(c_ptr),value :: csr_val_C
      type(c_ptr),value :: csr_row_ptr_C
      type(c_ptr),value :: csr_col_ind_C
      real(c_double),value :: tol
    end function

  
    function rocsparse_ccsr2csr_compress(handle,m,n,descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,nnz_A,nnz_per_row,csr_val_C,csr_row_ptr_C,csr_col_ind_C,tol) bind(c, name="rocsparse_ccsr2csr_compress")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ccsr2csr_compress
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: descr_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: nnz_per_row
      type(c_ptr),value :: csr_val_C
      type(c_ptr),value :: csr_row_ptr_C
      type(c_ptr),value :: csr_col_ind_C
      complex(c_float_complex),value :: tol
    end function

  
    function rocsparse_zcsr2csr_compress(handle,m,n,descr_A,csr_val_A,csr_row_ptr_A,csr_col_ind_A,nnz_A,nnz_per_row,csr_val_C,csr_row_ptr_C,csr_col_ind_C,tol) bind(c, name="rocsparse_zcsr2csr_compress")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zcsr2csr_compress
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: descr_A
      type(c_ptr),value :: csr_val_A
      type(c_ptr),value :: csr_row_ptr_A
      type(c_ptr),value :: csr_col_ind_A
      integer(c_int),value :: nnz_A
      type(c_ptr),value :: nnz_per_row
      type(c_ptr),value :: csr_val_C
      type(c_ptr),value :: csr_row_ptr_C
      type(c_ptr),value :: csr_col_ind_C
      complex(c_double_complex),value :: tol
    end function

  ! ! \ingroup conv_module
  !    \brief Convert a sparse COO matrix into a sparse CSR matrix
  !  
  !    \details
  !    \p rocsparse_coo2csr converts the COO array containing the row indices into a
  !    CSR array of row offsets, that point to the start of every row.
  !    It is assumed that the COO row index array is sorted.
  !  
  !    \note It can also be used, to convert a COO array containing the column indices into
  !    a CSC array of column offsets, that point to the start of every column. Then, it is
  !    assumed that the COO column index array is sorted, instead.
  !  
  !    \note
  !    This function is non blocking and executed asynchronously with respect to the host.
  !    It may return before the actual computation has finished.
  !  
  !    @param[in]
  !    handle      handle to the rocsparse library context queue.
  !    @param[in]
  !    coo_row_ind array of \p nnz elements containing the row indices of the sparse COO
  !                matrix.
  !    @param[in]
  !    nnz         number of non-zero entries of the sparse CSR matrix.
  !    @param[in]
  !    m           number of rows of the sparse CSR matrix.
  !    @param[out]
  !    csr_row_ptr array of \p m+1 elements that point to the start of every row of the
  !                sparse CSR matrix.
  !    @param[in]
  !    idx_base    \ref rocsparse_index_base_zero or \ref rocsparse_index_base_one.
  !  
  !    \retval     rocsparse_status_success the operation completed successfully.
  !    \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !    \retval     rocsparse_status_invalid_size \p m or \p nnz is invalid.
  !    \retval     rocsparse_status_invalid_pointer \p coo_row_ind or \p csr_row_ptr
  !                pointer is invalid.
  !  
  !    \par Example
  !    This example converts a COO matrix into a CSR matrix.
  !    \code{.c}
  !             1 2 0 3 0
  !         A = 0 4 5 0 0
  !             6 0 0 7 8
  !  
  !        rocsparse_int m   = 3;
  !        rocsparse_int n   = 5;
  !        rocsparse_int nnz = 8;
  !  
  !        coo_row_ind[nnz] = {0, 0, 0, 1, 1, 2, 2, 2};  device memory
  !        coo_col_ind[nnz] = {0, 1, 3, 1, 2, 0, 3, 4};  device memory
  !        coo_val[nnz]     = {1, 2, 3, 4, 5, 6, 7, 8};  device memory
  !  
  !         Allocate CSR matrix arrays
  !        rocsparse_int csr_row_ptr;
  !        rocsparse_int csr_col_ind;
  !        float csr_val;
  !  
  !        hipMalloc((void)&csr_row_ptr, sizeof(rocsparse_int)  (m + 1));
  !        hipMalloc((void)&csr_col_ind, sizeof(rocsparse_int)  nnz);
  !        hipMalloc((void)&csr_val, sizeof(float)  nnz);
  !  
  !         Convert the coo row indices into csr row offsets
  !        rocsparse_coo2csr(handle,
  !                          coo_row_ind,
  !                          nnz,
  !                          m,
  !                          csr_row_ptr,
  !                          rocsparse_index_base_zero);
  !  
  !         Copy the column and value arrays
  !        hipMemcpy(csr_col_ind,
  !                  coo_col_ind,
  !                  sizeof(rocsparse_int)  nnz,
  !                  hipMemcpyDeviceToDevice);
  !  
  !        hipMemcpy(csr_val,
  !                  coo_val,
  !                  sizeof(float)  nnz,
  !                  hipMemcpyDeviceToDevice);
  !    \endcode
  !  
    function rocsparse_coo2csr(handle,coo_row_ind,nnz,m,csr_row_ptr,idx_base) bind(c, name="rocsparse_coo2csr")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_coo2csr
      type(c_ptr),value :: handle
      type(c_ptr),value :: coo_row_ind
      integer(c_int),value :: nnz
      integer(c_int),value :: m
      type(c_ptr),value :: csr_row_ptr
      integer(kind(rocsparse_index_base_zero)),value :: idx_base
    end function

  ! ! \ingroup conv_module
  !    \brief Convert a sparse ELL matrix into a sparse CSR matrix
  !  
  !    \details
  !    \p rocsparse_ell2csr_nnz computes the total CSR non-zero elements and the CSR
  !    row offsets, that point to the start of every row of the sparse CSR matrix, for
  !    a given ELL matrix. It is assumed that \p csr_row_ptr has been allocated with
  !    size \p m + 1.
  !  
  !    \note
  !    This function is non blocking and executed asynchronously with respect to the host.
  !    It may return before the actual computation has finished.
  !  
  !    @param[in]
  !    handle      handle to the rocsparse library context queue.
  !    @param[in]
  !    m           number of rows of the sparse ELL matrix.
  !    @param[in]
  !    n           number of columns of the sparse ELL matrix.
  !    @param[in]
  !    ell_descr   descriptor of the sparse ELL matrix. Currently, only
  !                \ref rocsparse_matrix_type_general is supported.
  !    @param[in]
  !    ell_width   number of non-zero elements per row in ELL storage format.
  !    @param[in]
  !    ell_col_ind array of \p m times \p ell_width elements containing the column indices
  !                of the sparse ELL matrix.
  !    @param[in]
  !    csr_descr   descriptor of the sparse CSR matrix. Currently, only
  !                \ref rocsparse_matrix_type_general is supported.
  !    @param[out]
  !    csr_row_ptr array of \p m+1 elements that point to the start of every row of the
  !                sparse CSR matrix.
  !    @param[out]
  !    csr_nnz     pointer to the total number of non-zero elements in CSR storage
  !                format.
  !  
  !    \retval     rocsparse_status_success the operation completed successfully.
  !    \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !    \retval     rocsparse_status_invalid_size \p m, \p n or \p ell_width is invalid.
  !    \retval     rocsparse_status_invalid_pointer \p ell_descr, \p ell_col_ind,
  !                \p csr_descr, \p csr_row_ptr or \p csr_nnz pointer is invalid.
  !    \retval     rocsparse_status_not_implemented
  !                \ref rocsparse_matrix_type != \ref rocsparse_matrix_type_general.
  !  
    function rocsparse_ell2csr_nnz(handle,m,n,ell_descr,ell_width,ell_col_ind,csr_descr,csr_row_ptr,csr_nnz) bind(c, name="rocsparse_ell2csr_nnz")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_ell2csr_nnz
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: ell_descr
      integer(c_int),value :: ell_width
      type(c_ptr),value :: ell_col_ind
      type(c_ptr),intent(INOUT) :: csr_descr
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_nnz
    end function

  ! @{
    function rocsparse_sell2csr(handle,m,n,ell_descr,ell_width,ell_val,ell_col_ind,csr_descr,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="rocsparse_sell2csr")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sell2csr
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: ell_descr
      integer(c_int),value :: ell_width
      type(c_ptr),value :: ell_val
      type(c_ptr),value :: ell_col_ind
      type(c_ptr),intent(INOUT) :: csr_descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
    end function

  
    function rocsparse_dell2csr(handle,m,n,ell_descr,ell_width,ell_val,ell_col_ind,csr_descr,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="rocsparse_dell2csr")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dell2csr
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: ell_descr
      integer(c_int),value :: ell_width
      type(c_ptr),value :: ell_val
      type(c_ptr),value :: ell_col_ind
      type(c_ptr),intent(INOUT) :: csr_descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
    end function

  
    function rocsparse_cell2csr(handle,m,n,ell_descr,ell_width,ell_val,ell_col_ind,csr_descr,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="rocsparse_cell2csr")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cell2csr
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: ell_descr
      integer(c_int),value :: ell_width
      type(c_ptr),value :: ell_val
      type(c_ptr),value :: ell_col_ind
      type(c_ptr),intent(INOUT) :: csr_descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
    end function

  
    function rocsparse_zell2csr(handle,m,n,ell_descr,ell_width,ell_val,ell_col_ind,csr_descr,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="rocsparse_zell2csr")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zell2csr
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),intent(INOUT) :: ell_descr
      integer(c_int),value :: ell_width
      type(c_ptr),value :: ell_val
      type(c_ptr),value :: ell_col_ind
      type(c_ptr),intent(INOUT) :: csr_descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
    end function

  ! ! \ingroup conv_module
  !    \brief Convert a sparse HYB matrix into a sparse CSR matrix
  !  
  !    \details
  !    \p rocsparse_hyb2csr_buffer_size returns the size of the temporary storage buffer
  !    required by rocsparse_shyb2csr(), rocsparse_dhyb2csr(), rocsparse_chyb2csr() and
  !    rocsparse_dhyb2csr(). The temporary storage buffer must be allocated by the user.
  !  
  !    @param[in]
  !    handle          handle to the rocsparse library context queue.
  !    @param[in]
  !    descr           descriptor of the sparse HYB matrix. Currently, only
  !                    \ref rocsparse_matrix_type_general is supported.
  !    @param[in]
  !    hyb             sparse matrix in HYB format.
  !    @param[in]
  !    csr_row_ptr     array of \p m+1 elements that point to the start of every row of the
  !                    sparse CSR matrix.
  !    @param[out]
  !    buffer_size     number of bytes of the temporary storage buffer required by
  !                    rocsparse_shyb2csr(), rocsparse_dhyb2csr(), rocsparse_chyb2csr() and
  !                    rocsparse_zhyb2csr().
  !  
  !    \retval     rocsparse_status_success the operation completed successfully.
  !    \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !    \retval     rocsparse_status_invalid_pointer \p descr, \p hyb, \p csr_row_ptr or
  !                \p buffer_size pointer is invalid.
  !    \retval     rocsparse_status_internal_error an internal error occurred.
  !    \retval     rocsparse_status_not_implemented
  !                \ref rocsparse_matrix_type != \ref rocsparse_matrix_type_general.
  !  
    function rocsparse_hyb2csr_buffer_size(handle,descr,hyb,csr_row_ptr,buffer_size) bind(c, name="rocsparse_hyb2csr_buffer_size")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_hyb2csr_buffer_size
      type(c_ptr),value :: handle
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),intent(INOUT) :: hyb
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: buffer_size
    end function

  ! @{
    function rocsparse_shyb2csr(handle,descr,hyb,csr_val,csr_row_ptr,csr_col_ind,temp_buffer) bind(c, name="rocsparse_shyb2csr")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_shyb2csr
      type(c_ptr),value :: handle
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),intent(INOUT) :: hyb
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: temp_buffer
    end function

  
    function rocsparse_dhyb2csr(handle,descr,hyb,csr_val,csr_row_ptr,csr_col_ind,temp_buffer) bind(c, name="rocsparse_dhyb2csr")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dhyb2csr
      type(c_ptr),value :: handle
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),intent(INOUT) :: hyb
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: temp_buffer
    end function

  
    function rocsparse_chyb2csr(handle,descr,hyb,csr_val,csr_row_ptr,csr_col_ind,temp_buffer) bind(c, name="rocsparse_chyb2csr")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_chyb2csr
      type(c_ptr),value :: handle
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),intent(INOUT) :: hyb
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: temp_buffer
    end function

  
    function rocsparse_zhyb2csr(handle,descr,hyb,csr_val,csr_row_ptr,csr_col_ind,temp_buffer) bind(c, name="rocsparse_zhyb2csr")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zhyb2csr
      type(c_ptr),value :: handle
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),intent(INOUT) :: hyb
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: temp_buffer
    end function

  ! ! \ingroup conv_module
  !    \brief Create the identity map
  !  
  !    \details
  !    \p rocsparse_create_identity_permutation stores the identity map in \p p, such that
  !    \f$p = 0:1:(n-1)\f$.
  !  
  !    \code{.c}
  !        for(i = 0; i < n; ++i)
  !        {
  !            p[i] = i;
  !        }
  !    \endcode
  !  
  !    \note
  !    This function is non blocking and executed asynchronously with respect to the host.
  !    It may return before the actual computation has finished.
  !  
  !    @param[in]
  !    handle      handle to the rocsparse library context queue.
  !    @param[in]
  !    n           size of the map \p p.
  !    @param[out]
  !    p           array of \p n integers containing the map.
  !  
  !    \retval     rocsparse_status_success the operation completed successfully.
  !    \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !    \retval     rocsparse_status_invalid_size \p n is invalid.
  !    \retval     rocsparse_status_invalid_pointer \p p pointer is invalid.
  !  
  !    \par Example
  !    The following example creates an identity permutation.
  !    \code{.c}
  !        rocsparse_int size = 200;
  !  
  !         Allocate memory to hold the identity map
  !        rocsparse_int perm;
  !        hipMalloc((void)&perm, sizeof(rocsparse_int)  size);
  !  
  !         Fill perm with the identity permutation
  !        rocsparse_create_identity_permutation(handle, size, perm);
  !    \endcode
  !  
    function rocsparse_create_identity_permutation(handle,n,p) bind(c, name="rocsparse_create_identity_permutation")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_create_identity_permutation
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: p
    end function

  ! ! \ingroup conv_module
  !    \brief Sort a sparse CSR matrix
  !  
  !    \details
  !    \p rocsparse_csrsort_buffer_size returns the size of the temporary storage buffer
  !    required by rocsparse_csrsort(). The temporary storage buffer must be allocated by
  !    the user.
  !  
  !    @param[in]
  !    handle          handle to the rocsparse library context queue.
  !    @param[in]
  !    m               number of rows of the sparse CSR matrix.
  !    @param[in]
  !    n               number of columns of the sparse CSR matrix.
  !    @param[in]
  !    nnz             number of non-zero entries of the sparse CSR matrix.
  !    @param[in]
  !    csr_row_ptr     array of \p m+1 elements that point to the start of every row of the
  !                    sparse CSR matrix.
  !    @param[in]
  !    csr_col_ind     array of \p nnz elements containing the column indices of the sparse
  !                    CSR matrix.
  !    @param[out]
  !    buffer_size     number of bytes of the temporary storage buffer required by
  !                    rocsparse_csrsort().
  !  
  !    \retval     rocsparse_status_success the operation completed successfully.
  !    \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !    \retval     rocsparse_status_invalid_size \p m, \p n or \p nnz is invalid.
  !    \retval     rocsparse_status_invalid_pointer \p csr_row_ptr, \p csr_col_ind or
  !                \p buffer_size pointer is invalid.
  !  
    function rocsparse_csrsort_buffer_size(handle,m,n,nnz,csr_row_ptr,csr_col_ind,buffer_size) bind(c, name="rocsparse_csrsort_buffer_size")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csrsort_buffer_size
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: buffer_size
    end function

  ! ! \ingroup conv_module
  !    \brief Sort a sparse CSR matrix
  !  
  !    \details
  !    \p rocsparse_csrsort sorts a matrix in CSR format. The sorted permutation vector
  !    \p perm can be used to obtain sorted \p csr_val array. In this case, \p perm must be
  !    initialized as the identity permutation, see rocsparse_create_identity_permutation().
  !  
  !    \p rocsparse_csrsort requires extra temporary storage buffer that has to be allocated by
  !    the user. Storage buffer size can be determined by rocsparse_csrsort_buffer_size().
  !  
  !    \note
  !    \p perm can be \p NULL if a sorted permutation vector is not required.
  !  
  !    \note
  !    This function is non blocking and executed asynchronously with respect to the host.
  !    It may return before the actual computation has finished.
  !  
  !    @param[in]
  !    handle          handle to the rocsparse library context queue.
  !    @param[in]
  !    m               number of rows of the sparse CSR matrix.
  !    @param[in]
  !    n               number of columns of the sparse CSR matrix.
  !    @param[in]
  !    nnz             number of non-zero entries of the sparse CSR matrix.
  !    @param[in]
  !    descr           descriptor of the sparse CSR matrix. Currently, only
  !                    \ref rocsparse_matrix_type_general is supported.
  !    @param[in]
  !    csr_row_ptr     array of \p m+1 elements that point to the start of every row of the
  !                    sparse CSR matrix.
  !    @param[inout]
  !    csr_col_ind     array of \p nnz elements containing the column indices of the sparse
  !                    CSR matrix.
  !    @param[inout]
  !    perm            array of \p nnz integers containing the unsorted map indices, can be
  !                    \p NULL.
  !    @param[in]
  !    temp_buffer     temporary storage buffer allocated by the user, size is returned by
  !                    rocsparse_csrsort_buffer_size().
  !  
  !    \retval     rocsparse_status_success the operation completed successfully.
  !    \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !    \retval     rocsparse_status_invalid_size \p m, \p n or \p nnz is invalid.
  !    \retval     rocsparse_status_invalid_pointer \p descr, \p csr_row_ptr, \p csr_col_ind
  !                or \p temp_buffer pointer is invalid.
  !    \retval     rocsparse_status_internal_error an internal error occurred.
  !    \retval     rocsparse_status_not_implemented
  !                \ref rocsparse_matrix_type != \ref rocsparse_matrix_type_general.
  !  
  !    \par Example
  !    The following example sorts a \f$3 \times 3\f$ CSR matrix.
  !    \code{.c}
  !             1 2 3
  !         A = 4 5 6
  !             7 8 9
  !        rocsparse_int m   = 3;
  !        rocsparse_int n   = 3;
  !        rocsparse_int nnz = 9;
  !  
  !        csr_row_ptr[m + 1] = {0, 3, 6, 9};                 device memory
  !        csr_col_ind[nnz]   = {2, 0, 1, 0, 1, 2, 0, 2, 1};  device memory
  !        csr_val[nnz]       = {3, 1, 2, 4, 5, 6, 7, 9, 8};  device memory
  !  
  !         Create permutation vector perm as the identity map
  !        rocsparse_int perm;
  !        hipMalloc((void)&perm, sizeof(rocsparse_int)  nnz);
  !        rocsparse_create_identity_permutation(handle, nnz, perm);
  !  
  !         Allocate temporary buffer
  !        size_t buffer_size;
  !        void temp_buffer;
  !        rocsparse_csrsort_buffer_size(handle, m, n, nnz, csr_row_ptr, csr_col_ind, &buffer_size);
  !        hipMalloc(&temp_buffer, buffer_size);
  !  
  !         Sort the CSR matrix
  !        rocsparse_csrsort(handle, m, n, nnz, descr, csr_row_ptr, csr_col_ind, perm, temp_buffer);
  !  
  !         Gather sorted csr_val array
  !        float csr_val_sorted;
  !        hipMalloc((void)&csr_val_sorted, sizeof(float)  nnz);
  !        rocsparse_sgthr(handle, nnz, csr_val, csr_val_sorted, perm, rocsparse_index_base_zero);
  !  
  !         Clean up
  !        hipFree(temp_buffer);
  !        hipFree(perm);
  !        hipFree(csr_val);
  !    \endcode
  !  
    function rocsparse_csrsort(handle,m,n,nnz,descr,csr_row_ptr,csr_col_ind,perm,temp_buffer) bind(c, name="rocsparse_csrsort")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_csrsort
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
      type(c_ptr),value :: perm
      type(c_ptr),value :: temp_buffer
    end function

  ! ! \ingroup conv_module
  !    \brief Sort a sparse CSC matrix
  !  
  !    \details
  !    \p rocsparse_cscsort_buffer_size returns the size of the temporary storage buffer
  !    required by rocsparse_cscsort(). The temporary storage buffer must be allocated by
  !    the user.
  !  
  !    @param[in]
  !    handle          handle to the rocsparse library context queue.
  !    @param[in]
  !    m               number of rows of the sparse CSC matrix.
  !    @param[in]
  !    n               number of columns of the sparse CSC matrix.
  !    @param[in]
  !    nnz             number of non-zero entries of the sparse CSC matrix.
  !    @param[in]
  !    csc_col_ptr     array of \p n+1 elements that point to the start of every column of
  !                    the sparse CSC matrix.
  !    @param[in]
  !    csc_row_ind     array of \p nnz elements containing the row indices of the sparse
  !                    CSC matrix.
  !    @param[out]
  !    buffer_size     number of bytes of the temporary storage buffer required by
  !                    rocsparse_cscsort().
  !  
  !    \retval     rocsparse_status_success the operation completed successfully.
  !    \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !    \retval     rocsparse_status_invalid_size \p m, \p n or \p nnz is invalid.
  !    \retval     rocsparse_status_invalid_pointer \p csc_col_ptr, \p csc_row_ind or
  !                \p buffer_size pointer is invalid.
  !  
    function rocsparse_cscsort_buffer_size(handle,m,n,nnz,csc_col_ptr,csc_row_ind,buffer_size) bind(c, name="rocsparse_cscsort_buffer_size")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cscsort_buffer_size
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: csc_col_ptr
      type(c_ptr),value :: csc_row_ind
      type(c_ptr),value :: buffer_size
    end function

  ! ! \ingroup conv_module
  !    \brief Sort a sparse CSC matrix
  !  
  !    \details
  !    \p rocsparse_cscsort sorts a matrix in CSC format. The sorted permutation vector
  !    \p perm can be used to obtain sorted \p csc_val array. In this case, \p perm must be
  !    initialized as the identity permutation, see rocsparse_create_identity_permutation().
  !  
  !    \p rocsparse_cscsort requires extra temporary storage buffer that has to be allocated by
  !    the user. Storage buffer size can be determined by rocsparse_cscsort_buffer_size().
  !  
  !    \note
  !    \p perm can be \p NULL if a sorted permutation vector is not required.
  !  
  !    \note
  !    This function is non blocking and executed asynchronously with respect to the host.
  !    It may return before the actual computation has finished.
  !  
  !    @param[in]
  !    handle          handle to the rocsparse library context queue.
  !    @param[in]
  !    m               number of rows of the sparse CSC matrix.
  !    @param[in]
  !    n               number of columns of the sparse CSC matrix.
  !    @param[in]
  !    nnz             number of non-zero entries of the sparse CSC matrix.
  !    @param[in]
  !    descr           descriptor of the sparse CSC matrix. Currently, only
  !                    \ref rocsparse_matrix_type_general is supported.
  !    @param[in]
  !    csc_col_ptr     array of \p n+1 elements that point to the start of every column of
  !                    the sparse CSC matrix.
  !    @param[inout]
  !    csc_row_ind     array of \p nnz elements containing the row indices of the sparse
  !                    CSC matrix.
  !    @param[inout]
  !    perm            array of \p nnz integers containing the unsorted map indices, can be
  !                    \p NULL.
  !    @param[in]
  !    temp_buffer     temporary storage buffer allocated by the user, size is returned by
  !                    rocsparse_cscsort_buffer_size().
  !  
  !    \retval     rocsparse_status_success the operation completed successfully.
  !    \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !    \retval     rocsparse_status_invalid_size \p m, \p n or \p nnz is invalid.
  !    \retval     rocsparse_status_invalid_pointer \p descr, \p csc_col_ptr, \p csc_row_ind
  !                or \p temp_buffer pointer is invalid.
  !    \retval     rocsparse_status_internal_error an internal error occurred.
  !    \retval     rocsparse_status_not_implemented
  !                \ref rocsparse_matrix_type != \ref rocsparse_matrix_type_general.
  !  
  !    \par Example
  !    The following example sorts a \f$3 \times 3\f$ CSC matrix.
  !    \code{.c}
  !             1 2 3
  !         A = 4 5 6
  !             7 8 9
  !        rocsparse_int m   = 3;
  !        rocsparse_int n   = 3;
  !        rocsparse_int nnz = 9;
  !  
  !        csc_col_ptr[m + 1] = {0, 3, 6, 9};                 device memory
  !        csc_row_ind[nnz]   = {2, 0, 1, 0, 1, 2, 0, 2, 1};  device memory
  !        csc_val[nnz]       = {7, 1, 4, 2, 5, 8, 3, 9, 6};  device memory
  !  
  !         Create permutation vector perm as the identity map
  !        rocsparse_int perm;
  !        hipMalloc((void)&perm, sizeof(rocsparse_int)  nnz);
  !        rocsparse_create_identity_permutation(handle, nnz, perm);
  !  
  !         Allocate temporary buffer
  !        size_t buffer_size;
  !        void temp_buffer;
  !        rocsparse_cscsort_buffer_size(handle, m, n, nnz, csc_col_ptr, csc_row_ind, &buffer_size);
  !        hipMalloc(&temp_buffer, buffer_size);
  !  
  !         Sort the CSC matrix
  !        rocsparse_cscsort(handle, m, n, nnz, descr, csc_col_ptr, csc_row_ind, perm, temp_buffer);
  !  
  !         Gather sorted csc_val array
  !        float csc_val_sorted;
  !        hipMalloc((void)&csc_val_sorted, sizeof(float)  nnz);
  !        rocsparse_sgthr(handle, nnz, csc_val, csc_val_sorted, perm, rocsparse_index_base_zero);
  !  
  !         Clean up
  !        hipFree(temp_buffer);
  !        hipFree(perm);
  !        hipFree(csc_val);
  !    \endcode
  !  
    function rocsparse_cscsort(handle,m,n,nnz,descr,csc_col_ptr,csc_row_ind,perm,temp_buffer) bind(c, name="rocsparse_cscsort")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cscsort
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),intent(INOUT) :: descr
      type(c_ptr),value :: csc_col_ptr
      type(c_ptr),value :: csc_row_ind
      type(c_ptr),value :: perm
      type(c_ptr),value :: temp_buffer
    end function

  ! ! \ingroup conv_module
  !    \brief Sort a sparse COO matrix
  !  
  !    \details
  !    \p coosort_buffer_size returns the size of the temporary storage buffer that is
  !    required by rocsparse_coosort_by_row() and rocsparse_coosort_by_column(). The
  !    temporary storage buffer has to be allocated by the user.
  !  
  !    @param[in]
  !    handle          handle to the rocsparse library context queue.
  !    @param[in]
  !    m               number of rows of the sparse COO matrix.
  !    @param[in]
  !    n               number of columns of the sparse COO matrix.
  !    @param[in]
  !    nnz             number of non-zero entries of the sparse COO matrix.
  !    @param[in]
  !    coo_row_ind     array of \p nnz elements containing the row indices of the sparse
  !                    COO matrix.
  !    @param[in]
  !    coo_col_ind     array of \p nnz elements containing the column indices of the sparse
  !                    COO matrix.
  !    @param[out]
  !    buffer_size     number of bytes of the temporary storage buffer required by
  !                    rocsparse_coosort_by_row() and rocsparse_coosort_by_column().
  !  
  !    \retval     rocsparse_status_success the operation completed successfully.
  !    \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !    \retval     rocsparse_status_invalid_size \p m, \p n or \p nnz is invalid.
  !    \retval     rocsparse_status_invalid_pointer \p coo_row_ind, \p coo_col_ind or
  !                \p buffer_size pointer is invalid.
  !    \retval     rocsparse_status_internal_error an internal error occurred.
  !  
    function rocsparse_coosort_buffer_size(handle,m,n,nnz,coo_row_ind,coo_col_ind,buffer_size) bind(c, name="rocsparse_coosort_buffer_size")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_coosort_buffer_size
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: coo_row_ind
      type(c_ptr),value :: coo_col_ind
      type(c_ptr),value :: buffer_size
    end function

  ! ! \ingroup conv_module
  !    \brief Sort a sparse COO matrix by row
  !  
  !    \details
  !    \p rocsparse_coosort_by_row sorts a matrix in COO format by row. The sorted
  !    permutation vector \p perm can be used to obtain sorted \p coo_val array. In this
  !    case, \p perm must be initialized as the identity permutation, see
  !    rocsparse_create_identity_permutation().
  !  
  !    \p rocsparse_coosort_by_row requires extra temporary storage buffer that has to be
  !    allocated by the user. Storage buffer size can be determined by
  !    rocsparse_coosort_buffer_size().
  !  
  !    \note
  !    \p perm can be \p NULL if a sorted permutation vector is not required.
  !  
  !    \note
  !    This function is non blocking and executed asynchronously with respect to the host.
  !    It may return before the actual computation has finished.
  !  
  !    @param[in]
  !    handle          handle to the rocsparse library context queue.
  !    @param[in]
  !    m               number of rows of the sparse COO matrix.
  !    @param[in]
  !    n               number of columns of the sparse COO matrix.
  !    @param[in]
  !    nnz             number of non-zero entries of the sparse COO matrix.
  !    @param[inout]
  !    coo_row_ind     array of \p nnz elements containing the row indices of the sparse
  !                    COO matrix.
  !    @param[inout]
  !    coo_col_ind     array of \p nnz elements containing the column indices of the sparse
  !                    COO matrix.
  !    @param[inout]
  !    perm            array of \p nnz integers containing the unsorted map indices, can be
  !                    \p NULL.
  !    @param[in]
  !    temp_buffer     temporary storage buffer allocated by the user, size is returned by
  !                    rocsparse_coosort_buffer_size().
  !  
  !    \retval     rocsparse_status_success the operation completed successfully.
  !    \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !    \retval     rocsparse_status_invalid_size \p m, \p n or \p nnz is invalid.
  !    \retval     rocsparse_status_invalid_pointer \p coo_row_ind, \p coo_col_ind or
  !                \p temp_buffer pointer is invalid.
  !    \retval     rocsparse_status_internal_error an internal error occurred.
  !  
  !    \par Example
  !    The following example sorts a \f$3 \times 3\f$ COO matrix by row indices.
  !    \code{.c}
  !             1 2 3
  !         A = 4 5 6
  !             7 8 9
  !        rocsparse_int m   = 3;
  !        rocsparse_int n   = 3;
  !        rocsparse_int nnz = 9;
  !  
  !        coo_row_ind[nnz] = {0, 1, 2, 0, 1, 2, 0, 1, 2};  device memory
  !        coo_col_ind[nnz] = {0, 0, 0, 1, 1, 1, 2, 2, 2};  device memory
  !        coo_val[nnz]     = {1, 4, 7, 2, 5, 8, 3, 6, 9};  device memory
  !  
  !         Create permutation vector perm as the identity map
  !        rocsparse_int perm;
  !        hipMalloc((void)&perm, sizeof(rocsparse_int)  nnz);
  !        rocsparse_create_identity_permutation(handle, nnz, perm);
  !  
  !         Allocate temporary buffer
  !        size_t buffer_size;
  !        void temp_buffer;
  !        rocsparse_coosort_buffer_size(handle,
  !                                      m,
  !                                      n,
  !                                      nnz,
  !                                      coo_row_ind,
  !                                      coo_col_ind,
  !                                      &buffer_size);
  !        hipMalloc(&temp_buffer, buffer_size);
  !  
  !         Sort the COO matrix
  !        rocsparse_coosort_by_row(handle,
  !                                 m,
  !                                 n,
  !                                 nnz,
  !                                 coo_row_ind,
  !                                 coo_col_ind,
  !                                 perm,
  !                                 temp_buffer);
  !  
  !         Gather sorted coo_val array
  !        float coo_val_sorted;
  !        hipMalloc((void)&coo_val_sorted, sizeof(float)  nnz);
  !        rocsparse_sgthr(handle, nnz, coo_val, coo_val_sorted, perm, rocsparse_index_base_zero);
  !  
  !         Clean up
  !        hipFree(temp_buffer);
  !        hipFree(perm);
  !        hipFree(coo_val);
  !    \endcode
  !  
    function rocsparse_coosort_by_row(handle,m,n,nnz,coo_row_ind,coo_col_ind,perm,temp_buffer) bind(c, name="rocsparse_coosort_by_row")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_coosort_by_row
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: coo_row_ind
      type(c_ptr),value :: coo_col_ind
      type(c_ptr),value :: perm
      type(c_ptr),value :: temp_buffer
    end function

  ! ! \ingroup conv_module
  !    \brief Sort a sparse COO matrix by column
  !  
  !    \details
  !    \p rocsparse_coosort_by_column sorts a matrix in COO format by column. The sorted
  !    permutation vector \p perm can be used to obtain sorted \p coo_val array. In this
  !    case, \p perm must be initialized as the identity permutation, see
  !    rocsparse_create_identity_permutation().
  !  
  !    \p rocsparse_coosort_by_column requires extra temporary storage buffer that has to be
  !    allocated by the user. Storage buffer size can be determined by
  !    rocsparse_coosort_buffer_size().
  !  
  !    \note
  !    \p perm can be \p NULL if a sorted permutation vector is not required.
  !  
  !    \note
  !    This function is non blocking and executed asynchronously with respect to the host.
  !    It may return before the actual computation has finished.
  !  
  !    @param[in]
  !    handle          handle to the rocsparse library context queue.
  !    @param[in]
  !    m               number of rows of the sparse COO matrix.
  !    @param[in]
  !    n               number of columns of the sparse COO matrix.
  !    @param[in]
  !    nnz             number of non-zero entries of the sparse COO matrix.
  !    @param[inout]
  !    coo_row_ind     array of \p nnz elements containing the row indices of the sparse
  !                    COO matrix.
  !    @param[inout]
  !    coo_col_ind     array of \p nnz elements containing the column indices of the sparse
  !                    COO matrix.
  !    @param[inout]
  !    perm            array of \p nnz integers containing the unsorted map indices, can be
  !                    \p NULL.
  !    @param[in]
  !    temp_buffer     temporary storage buffer allocated by the user, size is returned by
  !                    rocsparse_coosort_buffer_size().
  !  
  !    \retval     rocsparse_status_success the operation completed successfully.
  !    \retval     rocsparse_status_invalid_handle the library context was not initialized.
  !    \retval     rocsparse_status_invalid_size \p m, \p n or \p nnz is invalid.
  !    \retval     rocsparse_status_invalid_pointer \p coo_row_ind, \p coo_col_ind or
  !                \p temp_buffer pointer is invalid.
  !    \retval     rocsparse_status_internal_error an internal error occurred.
  !  
  !    \par Example
  !    The following example sorts a \f$3 \times 3\f$ COO matrix by column indices.
  !    \code{.c}
  !             1 2 3
  !         A = 4 5 6
  !             7 8 9
  !        rocsparse_int m   = 3;
  !        rocsparse_int n   = 3;
  !        rocsparse_int nnz = 9;
  !  
  !        coo_row_ind[nnz] = {0, 0, 0, 1, 1, 1, 2, 2, 2};  device memory
  !        coo_col_ind[nnz] = {0, 1, 2, 0, 1, 2, 0, 1, 2};  device memory
  !        coo_val[nnz]     = {1, 2, 3, 4, 5, 6, 7, 8, 9};  device memory
  !  
  !         Create permutation vector perm as the identity map
  !        rocsparse_int perm;
  !        hipMalloc((void)&perm, sizeof(rocsparse_int)  nnz);
  !        rocsparse_create_identity_permutation(handle, nnz, perm);
  !  
  !         Allocate temporary buffer
  !        size_t buffer_size;
  !        void temp_buffer;
  !        rocsparse_coosort_buffer_size(handle,
  !                                      m,
  !                                      n,
  !                                      nnz,
  !                                      coo_row_ind,
  !                                      coo_col_ind,
  !                                      &buffer_size);
  !        hipMalloc(&temp_buffer, buffer_size);
  !  
  !         Sort the COO matrix
  !        rocsparse_coosort_by_column(handle,
  !                                    m,
  !                                    n,
  !                                    nnz,
  !                                    coo_row_ind,
  !                                    coo_col_ind,
  !                                    perm,
  !                                    temp_buffer);
  !  
  !         Gather sorted coo_val array
  !        float coo_val_sorted;
  !        hipMalloc((void)&coo_val_sorted, sizeof(float)  nnz);
  !        rocsparse_sgthr(handle, nnz, coo_val, coo_val_sorted, perm, rocsparse_index_base_zero);
  !  
  !         Clean up
  !        hipFree(temp_buffer);
  !        hipFree(perm);
  !        hipFree(coo_val);
  !    \endcode
  !  
    function rocsparse_coosort_by_column(handle,m,n,nnz,coo_row_ind,coo_col_ind,perm,temp_buffer) bind(c, name="rocsparse_coosort_by_column")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_coosort_by_column
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: nnz
      type(c_ptr),value :: coo_row_ind
      type(c_ptr),value :: coo_col_ind
      type(c_ptr),value :: perm
      type(c_ptr),value :: temp_buffer
    end function

  ! @{
    function rocsparse_sbsr2csr(handle,dir,mb,nb,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,csr_descr,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="rocsparse_sbsr2csr")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_sbsr2csr
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),intent(INOUT) :: bsr_descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),intent(INOUT) :: csr_descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
    end function

  
    function rocsparse_dbsr2csr(handle,dir,mb,nb,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,csr_descr,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="rocsparse_dbsr2csr")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_dbsr2csr
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),intent(INOUT) :: bsr_descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),intent(INOUT) :: csr_descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
    end function

  
    function rocsparse_cbsr2csr(handle,dir,mb,nb,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,csr_descr,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="rocsparse_cbsr2csr")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_cbsr2csr
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),intent(INOUT) :: bsr_descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),intent(INOUT) :: csr_descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
    end function

  
    function rocsparse_zbsr2csr(handle,dir,mb,nb,bsr_descr,bsr_val,bsr_row_ptr,bsr_col_ind,block_dim,csr_descr,csr_val,csr_row_ptr,csr_col_ind) bind(c, name="rocsparse_zbsr2csr")
      use iso_c_binding
      use rocsparse_enums
      implicit none
      integer(kind(rocsparse_status_success)) :: rocsparse_zbsr2csr
      type(c_ptr),value :: handle
      integer(kind(rocsparse_direction_row)),value :: dir
      integer(c_int),value :: mb
      integer(c_int),value :: nb
      type(c_ptr),intent(INOUT) :: bsr_descr
      type(c_ptr),value :: bsr_val
      type(c_ptr),value :: bsr_row_ptr
      type(c_ptr),value :: bsr_col_ind
      integer(c_int),value :: block_dim
      type(c_ptr),intent(INOUT) :: csr_descr
      type(c_ptr),value :: csr_val
      type(c_ptr),value :: csr_row_ptr
      type(c_ptr),value :: csr_col_ind
    end function

  end interface
  
end module rocsparse