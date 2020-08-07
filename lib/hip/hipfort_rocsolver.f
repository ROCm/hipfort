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
          
           
module hipfort_rocsolver
  use hipfort_rocsolver_enums
  implicit none

 
  interface
  
    function rocsolver_create_handle(handle) bind(c, name="rocsolver_create_handle")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_create_handle
      type(c_ptr),intent(INOUT) :: handle
    end function

  
    function rocsolver_destroy_handle(handle) bind(c, name="rocsolver_destroy_handle")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_destroy_handle
      type(c_ptr),value :: handle
    end function

  
    function rocsolver_add_stream(handle,stream) bind(c, name="rocsolver_add_stream")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_add_stream
      type(c_ptr),value :: handle
      type(c_ptr),value :: stream
    end function

  
    function rocsolver_set_stream(handle,stream) bind(c, name="rocsolver_set_stream")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_set_stream
      type(c_ptr),value :: handle
      type(c_ptr),value :: stream
    end function

  
    function rocsolver_get_stream(handle,stream) bind(c, name="rocsolver_get_stream")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_get_stream
      type(c_ptr),value :: handle
      type(c_ptr),intent(INOUT) :: stream
    end function

  
    function rocsolver_set_vector(elem_size,x,incy) bind(c, name="rocsolver_set_vector")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_set_vector
      integer(c_int),value :: elem_size
      type(c_ptr),value :: x
      integer(c_int),value :: incy
    end function

  
    function rocsolver_get_vector(elem_size,x,incy) bind(c, name="rocsolver_get_vector")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_get_vector
      integer(c_int),value :: elem_size
      type(c_ptr),value :: x
      integer(c_int),value :: incy
    end function

  
    function rocsolver_set_matrix(cols,lda,b,ldb) bind(c, name="rocsolver_set_matrix")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_set_matrix
      integer(c_int),value :: cols
      integer(c_int),value :: lda
      type(c_ptr),value :: b
      integer(c_int),value :: ldb
    end function

  
    function rocsolver_get_matrix(cols,lda,b,ldb) bind(c, name="rocsolver_get_matrix")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_get_matrix
      integer(c_int),value :: cols
      integer(c_int),value :: lda
      type(c_ptr),value :: b
      integer(c_int),value :: ldb
    end function

  ! ! \brief   loads char buf with the rocsolver library version. size_t len
  !      is the maximum length of char buf.
  ! 
  !  
    function rocsolver_get_version_string(buf,len) bind(c, name="rocsolver_get_version_string")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_get_version_string
      type(c_ptr),value :: buf
      integer(c_size_t),value :: len
    end function

  ! ! \brief LASWP performs a series of row interchanges on the matrix A.
  ! 
  !     \details
  !     It interchanges row I with row IPIV[k1 + (I - k1)  abs(inx)], for
  !     each of rows K1 through K2 of A. k1 and k2 are 1-based indices.
  ! 
  !     @param[in]
  !     handle          rocblas_handle
  !     @param[in]
  !     n               rocblas_int. n >= 0.\n
  !                     The number of columns of the matrix A.
  !     @param[inout]
  !     A               pointer to type. Array on the GPU of dimension ldan. \n 
  !                     On entry, the matrix of column dimension n to which the row
  !                     interchanges will be applied. On exit, the permuted matrix.
  !     @param[in]
  !     lda             rocblas_int. lda > 0.\n
  !                     The leading dimension of the array A.
  !     @param[in]
  !     k1              rocblas_int. k1 > 0.\n
  !                     The first element of IPIV for which a row interchange will
  !                     be done. This is a 1-based index.
  !     @param[in]
  !     k2              rocblas_int. k2 > k1 > 0.\n
  !                     (K2-K1+1) is the number of elements of IPIV for which a row
  !                     interchange will be done. This is a 1-based index.
  !     @param[in]
  !     ipiv            pointer to rocblas_int. Array on the GPU of dimension at least k1 + (k2 - k1)  abs(incx).\n
  !                     The vector of pivot indices.  Only the elements in positions
  !                     k1 through (k1 + (k2 - k1)  abs(incx)) of IPIV are accessed. 
  !                     Elements of ipiv are considered 1-based.
  !     @param[in]
  !     incx            rocblas_int. incx != 0.\n
  !                     The increment between successive values of IPIV.  If IPIV
  !                     is negative, the pivots are applied in reverse order.
  !     
    function rocsolver_slaswp(handle,n,A,lda,k1,k2,ipiv,incx) bind(c, name="rocsolver_slaswp")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_slaswp
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: k1
      integer(c_int),value :: k2
      type(c_ptr),value :: ipiv
      integer(c_int),value :: incx
    end function

  
    function rocsolver_dlaswp(handle,n,A,lda,k1,k2,ipiv,incx) bind(c, name="rocsolver_dlaswp")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dlaswp
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: k1
      integer(c_int),value :: k2
      type(c_ptr),value :: ipiv
      integer(c_int),value :: incx
    end function

  
    function rocsolver_claswp(handle,n,A,lda,k1,k2,ipiv,incx) bind(c, name="rocsolver_claswp")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_claswp
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: k1
      integer(c_int),value :: k2
      type(c_ptr),value :: ipiv
      integer(c_int),value :: incx
    end function

  
    function rocsolver_zlaswp(handle,n,A,lda,k1,k2,ipiv,incx) bind(c, name="rocsolver_zlaswp")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_zlaswp
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int),value :: k1
      integer(c_int),value :: k2
      type(c_ptr),value :: ipiv
      integer(c_int),value :: incx
    end function

  ! ! \brief LARFG generates an orthogonal Householder reflector H of order n. 
  ! 
  !     \details
  !     Householder reflector H is such that
  !  
  !         H  [alpha] = [beta]
  !             [  x  ]   [  0 ]
  ! 
  !     where x is an n-1 vector and alpha and beta are scalars. Matrix H can be 
  !     generated as
  !     
  !         H = I - tau  [1]  [1 v']
  !                       [v]
  ! 
  !     with v an n-1 vector and tau a scalar. 
  ! 
  !     @param[in]
  !     handle          rocblas_handle
  !     @param[in]
  !     n               rocblas_int. n >= 0.\n
  !                     The order (size) of reflector H. 
  !     @param[inout]
  !     alpha           pointer to type. A scalar on the GPU.\n
  !                     On input the scalar alpha, 
  !                     on output it is overwritten with beta.
  !     @param[inout]      
  !     x               pointer to type. Array on the GPU of size at least n-1.\n
  !                     On input it is the vector x, 
  !                     on output it is overwritten with vector v.
  !     @param[in]
  !     incx            rocblas_int. incx > 0.\n
  !                     The increment between consecutive elements of x. 
  !     @param[out]
  !     tau             pointer to type. A scalar on the GPU.\n
  !                     The scalar tau.
  ! 
  !     
    function rocsolver_slarfg(handle,n,alpha,x,incx,tau) bind(c, name="rocsolver_slarfg")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_slarfg
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      real(c_float),intent(IN) :: tau
    end function

  
    function rocsolver_dlarfg(handle,n,alpha,x,incx,tau) bind(c, name="rocsolver_dlarfg")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dlarfg
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      real(c_double),intent(IN) :: tau
    end function

  
    function rocsolver_clarfg(handle,n,alpha,x,incx,tau) bind(c, name="rocsolver_clarfg")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_clarfg
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      complex(c_float_complex),intent(IN) :: tau
    end function

  
    function rocsolver_zlarfg(handle,n,alpha,x,incx,tau) bind(c, name="rocsolver_zlarfg")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_zlarfg
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      complex(c_double_complex),intent(IN) :: tau
    end function

  ! ! \brief LARFT Generates the triangular factor T of a block reflector H of order n.
  ! 
  !     \details
  !     The block reflector H is defined as the product of k Householder matrices as
  ! 
  !         H = H(1)  H(2)  ...  H(k)  (forward direction), or
  !         H = H(k)  ...  H(2)  H(1)  (backward direction)
  ! 
  !     depending on the value of direct.  
  ! 
  !     The triangular matrix T is upper triangular in forward direction and lower triangular in backward direction. 
  !     If storev is column-wise, then
  ! 
  !         H = I - V  T  V'
  ! 
  !     where the i-th column of matrix V contains the Householder vector associated to H(i). If storev is row-wise, then
  ! 
  !         H = I - V'  T  V
  ! 
  !     where the i-th row of matrix V contains the Householder vector associated to H(i). 
  ! 
  !     @param[in]
  !     handle              rocblas_handle.
  !     @param[in]
  !     direct              rocblas_direct.\n
  !                         Specifies the direction in which the Householder matrices are applied.
  !     @param[in]
  !     storev              rocblas_storev.\n
  !                         Specifies how the Householder vectors are stored in matrix V.
  !     @param[in]
  !     n                   rocblas_int. n >= 0.\n
  !                         The order (size) of the block reflector.
  !     @param[in]          
  !     k                   rocsovler_int. k >= 1.\n
  !                         The number of Householder matrices.
  !     @param[in]          
  !     V                   pointer to type. Array on the GPU of size ldvk if column-wise, or ldvn if row-wise.\n
  !                         The matrix of Householder vectors.
  !     @param[in]
  !     ldv                 rocblas_int. ldv >= n if column-wise, or ldv >= k if row-wise.\n
  !                         Leading dimension of V.
  !     @param[in]
  !     tau                 pointer to type. Array of k scalars on the GPU.\n
  !                         The vector of all the scalars associated to the Householder matrices.
  !     @param[out]
  !     T                   pointer to type. Array on the GPU of dimension ldtk.\n
  !                         The triangular factor. T is upper triangular is forward operation, otherwise it is lower triangular.
  !                         The rest of the array is not used. 
  !     @param[in]  
  !     ldt                 rocblas_int. ldt >= k.\n
  !                         The leading dimension of T.
  ! 
  !     
    function rocsolver_slarft(handle,myDirect,storev,n,k,V,ldv,tau,T,ldt) bind(c, name="rocsolver_slarft")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_slarft
      type(c_ptr),value :: handle
      integer(kind(rocblas_forward_direction)),value :: myDirect
      integer(kind(rocblas_column_wise)),value :: storev
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      real(c_float),intent(IN) :: tau
      type(c_ptr),value :: T
      integer(c_int),value :: ldt
    end function

  
    function rocsolver_dlarft(handle,myDirect,storev,n,k,V,ldv,tau,T,ldt) bind(c, name="rocsolver_dlarft")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dlarft
      type(c_ptr),value :: handle
      integer(kind(rocblas_forward_direction)),value :: myDirect
      integer(kind(rocblas_column_wise)),value :: storev
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      real(c_double),intent(IN) :: tau
      type(c_ptr),value :: T
      integer(c_int),value :: ldt
    end function

  
    function rocsolver_clarft(handle,myDirect,storev,n,k,V,ldv,tau,T,ldt) bind(c, name="rocsolver_clarft")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_clarft
      type(c_ptr),value :: handle
      integer(kind(rocblas_forward_direction)),value :: myDirect
      integer(kind(rocblas_column_wise)),value :: storev
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      complex(c_float_complex),intent(IN) :: tau
      type(c_ptr),value :: T
      integer(c_int),value :: ldt
    end function

  
    function rocsolver_zlarft(handle,myDirect,storev,n,k,V,ldv,tau,T,ldt) bind(c, name="rocsolver_zlarft")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_zlarft
      type(c_ptr),value :: handle
      integer(kind(rocblas_forward_direction)),value :: myDirect
      integer(kind(rocblas_column_wise)),value :: storev
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      complex(c_double_complex),intent(IN) :: tau
      type(c_ptr),value :: T
      integer(c_int),value :: ldt
    end function

  ! ! \brief LARF applies a Householder reflector H to a general matrix A.
  ! 
  !     \details
  !     The Householder reflector H, of order m (or n), is to be applied to a m-by-n matrix A
  !     from the left (or the right). H is given by 
  ! 
  !         H = I - alpha  x  x'
  !     
  !     where alpha is a scalar and x a Householder vector. H is never actually computed.
  ! 
  !     @param[in]
  !     handle          rocblas_handle.
  !     @param[in]
  !     side            rocblas_side.\n
  !                     If side = rocblas_side_left, then compute HA
  !                     If side = rocblas_side_right, then compute AH
  !     @param[in]
  !     m               rocblas_int. m >= 0.\n
  !                     Number of rows of A.
  !     @param[in]
  !     n               rocblas_int. n >= 0.\n
  !                     Number of columns of A. 
  !     @param[in]
  !     x               pointer to type. Array on the GPU of  
  !                     size at least (1 + (m-1)abs(incx)) if left side, or
  !                     at least (1 + (n-1)abs(incx)) if right side.\n
  !                     The Householder vector x.
  !     @param[in]
  !     incx            rocblas_int. incx != 0.\n
  !                     Increment between to consecutive elements of x. 
  !                     If incx < 0, the elements of x are used in reverse order. 
  !     @param[in]
  !     alpha           pointer to type. A scalar on the GPU.\n
  !                     If alpha = 0, then H = I (A will remain the same, x is never used)
  !     @param[inout]
  !     A               pointer to type. Array on the GPU of size ldan.\n
  !                     On input, the matrix A. On output it is overwritten with
  !                     HA (or AH).
  !     @param[in]
  !     lda             rocblas_int. lda >= m.\n
  !                     Leading dimension of A. 
  !                         
  !     
    function rocsolver_slarf(handle,side,m,n,x,incx,alpha,A,lda) bind(c, name="rocsolver_slarf")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_slarf
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      real(c_float),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  
    function rocsolver_dlarf(handle,side,m,n,x,incx,alpha,A,lda) bind(c, name="rocsolver_dlarf")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dlarf
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      real(c_double),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  
    function rocsolver_clarf(handle,side,m,n,x,incx,alpha,A,lda) bind(c, name="rocsolver_clarf")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_clarf
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      complex(c_float_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  
    function rocsolver_zlarf(handle,side,m,n,x,incx,alpha,A,lda) bind(c, name="rocsolver_zlarf")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_zlarf
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: x
      integer(c_int),value :: incx
      complex(c_double_complex),intent(IN) :: alpha
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  ! ! \brief LARFB applies a block reflector H to a general m-by-n matrix A.
  ! 
  !     \details
  !     The block reflector H is applied in one of the following forms, depending on 
  !     the values of side and trans:
  ! 
  !         H   A  (No transpose from the left)
  !         H'  A  (Transpose or conjugate transpose from the left)
  !         A  H   (No transpose from the right), and
  !         A  H'  (Transpose or conjugate transpose from the right)
  ! 
  !     The block reflector H is defined as the product of k Householder matrices as
  ! 
  !         H = H(1)  H(2)  ...  H(k)  (forward direction), or
  !         H = H(k)  ...  H(2)  H(1)  (backward direction)
  ! 
  !     depending on the value of direct. H is never stored. It is calculated as
  ! 
  !         H = I - V  T  V'
  ! 
  !     where the i-th column of matrix V contains the Householder vector associated with H(i), if storev is column-wise; or
  ! 
  !         H = I - V'  T  V
  ! 
  !     where the i-th row of matrix V contains the Householder vector associated with H(i), if storev is row-wise. 
  !     T is the associated triangular factor as computed by LARFT.
  ! 
  !     @param[in]
  !     handle              rocblas_handle.
  !     @param[in]
  !     side                rocblas_side.\n
  !                         Specifies from which side to apply H.
  !     @param[in]
  !     trans               rocblas_operation.\n
  !                         Specifies whether the block reflector or its transposeconjugate transpose is to be applied.
  !     @param[in]
  !     direct              rocblas_direct.\n
  !                         Specifies the direction in which the Householder matrices were to be applied to generate H.
  !     @param[in]
  !     storev              rocblas_storev.\n
  !                         Specifies how the Householder vectors are stored in matrix V.
  !     @param[in]
  !     m                   rocblas_int. m >= 0.\n
  !                         Number of rows of matrix A.
  !     @param[in]
  !     n                   rocblas_int. n >= 0.\n
  !                         Number of columns of matrix A.
  !     @param[in]          
  !     k                   rocsovler_int. k >= 1.\n
  !                         The number of Householder matrices.
  !     @param[in]          
  !     V                   pointer to type. Array on the GPU of size ldvk if column-wise, ldvn if row-wise and applying from the right, 
  !                         or ldvm if row-wise and applying from the left.\n
  !                         The matrix of Householder vectors.
  !     @param[in]
  !     ldv                 rocblas_int. ldv >= k if row-wise, ldv >= m if column-wise and applying from the left, or ldv >= n if
  !                         column-wise and applying from the right.\n
  !                         Leading dimension of V.
  !     @param[in]
  !     T                   pointer to type. Array on the GPU of dimension ldtk.\n
  !                         The triangular factor of the block reflector.
  !     @param[in]  
  !     ldt                 rocblas_int. ldt >= k.\n
  !                         The leading dimension of T.
  !     @param[inout]
  !     A                   pointer to type. Array on the GPU of size ldan.\n
  !                         On input, the matrix A. On output it is overwritten with
  !                         HA, AH, H'A, or AH'.  
  !     @param[in]
  !     lda                 rocblas_int. lda >= m.\n
  !                         Leading dimension of A. 
  ! 
  !     
    function rocsolver_slarfb(handle,side,trans,myDirect,storev,m,n,k,V,ldv,T,ldt,A,lda) bind(c, name="rocsolver_slarfb")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_slarfb
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_operation_none)),value :: trans
      integer(kind(rocblas_forward_direction)),value :: myDirect
      integer(kind(rocblas_column_wise)),value :: storev
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      type(c_ptr),value :: T
      integer(c_int),value :: ldt
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  
    function rocsolver_dlarfb(handle,side,trans,myDirect,storev,m,n,k,V,ldv,T,ldt,A,lda) bind(c, name="rocsolver_dlarfb")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dlarfb
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_operation_none)),value :: trans
      integer(kind(rocblas_forward_direction)),value :: myDirect
      integer(kind(rocblas_column_wise)),value :: storev
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      type(c_ptr),value :: T
      integer(c_int),value :: ldt
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  
    function rocsolver_clarfb(handle,side,trans,myDirect,storev,m,n,k,V,ldv,T,ldt,A,lda) bind(c, name="rocsolver_clarfb")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_clarfb
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_operation_none)),value :: trans
      integer(kind(rocblas_forward_direction)),value :: myDirect
      integer(kind(rocblas_column_wise)),value :: storev
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      type(c_ptr),value :: T
      integer(c_int),value :: ldt
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  
    function rocsolver_zlarfb(handle,side,trans,myDirect,storev,m,n,k,V,ldv,T,ldt,A,lda) bind(c, name="rocsolver_zlarfb")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_zlarfb
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_operation_none)),value :: trans
      integer(kind(rocblas_forward_direction)),value :: myDirect
      integer(kind(rocblas_column_wise)),value :: storev
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: V
      integer(c_int),value :: ldv
      type(c_ptr),value :: T
      integer(c_int),value :: ldt
      type(c_ptr),value :: A
      integer(c_int),value :: lda
    end function

  ! ! \brief ORG2R generates a m-by-n Matrix Q with orthonormal columns.
  ! 
  !     \details
  !     (This is the unblocked version of the algorithm).
  ! 
  !     The matrix Q is defined as the first n columns of the product of k Householder
  !     reflectors of order m
  !     
  !         Q = H(1)  H(2)  ...  H(k)
  ! 
  !     Householder matrices H(i) are never stored, they are computed from its corresponding 
  !     Householder vector v(i) and scalar ipiv_i as returned by GEQRF.
  ! 
  !     @param[in]
  !     handle      rocblas_handle.
  !     @param[in]
  !     m           rocblas_int. m >= 0.\n
  !                 The number of rows of the matrix Q. 
  !     @param[in]
  !     n           rocblas_int. 0 <= n <= m.\n
  !                 The number of colums of the matrix Q.
  !     @param[in]
  !     k           rocblas_int. 0 <= k <= n.\n
  !                 The number of Householder reflectors.
  !     @param[inout]
  !     A           pointer to type. Array on the GPU of dimension ldan.\n
  !                 On entry, the i-th column has Householder vector v(i), for i = 1,2,...,k
  !                 as returned in the first k columns of matrix A of GEQRF.
  !                 On exit, the computed matrix Q.
  !     @param[in]
  !     lda         rocblas_int. lda >= m.\n
  !                 Specifies the leading dimension of A. 
  !     @param[in]
  !     ipiv        pointer to type. Array on the GPU of dimension at least k.\n
  !                 The scalar factors of the Householder matrices H(i) as returned by GEQRF.
  ! 
  !     
    function rocsolver_sorg2r(handle,m,n,k,A,lda,ipiv) bind(c, name="rocsolver_sorg2r")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_sorg2r
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
    end function

  
    function rocsolver_dorg2r(handle,m,n,k,A,lda,ipiv) bind(c, name="rocsolver_dorg2r")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dorg2r
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
    end function

  ! ! \brief ORGQR generates a m-by-n Matrix Q with orthonormal columns.
  ! 
  !     \details
  !     (This is the blocked version of the algorithm).
  ! 
  !     The matrix Q is defined as the first n columns of the product of k Householder
  !     reflectors of order m
  !     
  !         Q = H(1)  H(2)  ...  H(k)
  ! 
  !     Householder matrices H(i) are never stored, they are computed from its corresponding 
  !     Householder vector v(i) and scalar ipiv_i as returned by GEQRF.
  ! 
  !     @param[in]
  !     handle      rocblas_handle.
  !     @param[in]
  !     m           rocblas_int. m >= 0.\n
  !                 The number of rows of the matrix Q. 
  !     @param[in]
  !     n           rocblas_int. 0 <= n <= m.\n
  !                 The number of colums of the matrix Q.
  !     @param[in]
  !     k           rocblas_int. 0 <= k <= n.\n
  !                 The number of Householder reflectors.
  !     @param[inout]
  !     A           pointer to type. Array on the GPU of dimension ldan.\n
  !                 On entry, the i-th column has Householder vector v(i), for i = 1,2,...,k
  !                 as returned in the first k columns of matrix A of GEQRF.
  !                 On exit, the computed matrix Q.
  !     @param[in]
  !     lda         rocblas_int. lda >= m.\n
  !                 Specifies the leading dimension of A. 
  !     @param[in]
  !     ipiv        pointer to type. Array on the GPU of dimension at least k.\n
  !                 The scalar factors of the Householder matrices H(i) as returned by GEQRF.
  ! 
  !     
    function rocsolver_sorgqr(handle,m,n,k,A,lda,ipiv) bind(c, name="rocsolver_sorgqr")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_sorgqr
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
    end function

  
    function rocsolver_dorgqr(handle,m,n,k,A,lda,ipiv) bind(c, name="rocsolver_dorgqr")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dorgqr
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
    end function

  ! ! \brief ORGL2 generates a m-by-n Matrix Q with orthonormal rows.
  ! 
  !     \details
  !     (This is the unblocked version of the algorithm).
  ! 
  !     The matrix Q is defined as the first m rows of the product of k Householder
  !     reflectors of order n
  !     
  !         Q = H(k)  H(k-1)  ...  H(1)
  ! 
  !     Householder matrices H(i) are never stored, they are computed from its corresponding 
  !     Householder vector v(i) and scalar ipiv_i as returned by GELQF.
  ! 
  !     @param[in]
  !     handle      rocblas_handle.
  !     @param[in]
  !     m           rocblas_int. 0 <= m <= n.\n
  !                 The number of rows of the matrix Q. 
  !     @param[in]
  !     n           rocblas_int. n >= 0.\n
  !                 The number of colums of the matrix Q.
  !     @param[in]
  !     k           rocblas_int. 0 <= k <= m.\n
  !                 The number of Householder reflectors.
  !     @param[inout]
  !     A           pointer to type. Array on the GPU of dimension ldan.\n
  !                 On entry, the i-th row has Householder vector v(i), for i = 1,2,...,k
  !                 as returned in the first k rows of matrix A of GELQF.
  !                 On exit, the computed matrix Q.
  !     @param[in]
  !     lda         rocblas_int. lda >= m.\n
  !                 Specifies the leading dimension of A. 
  !     @param[in]
  !     ipiv        pointer to type. Array on the GPU of dimension at least k.\n
  !                 The scalar factors of the Householder matrices H(i) as returned by GELQF.
  ! 
  !     
    function rocsolver_sorgl2(handle,m,n,k,A,lda,ipiv) bind(c, name="rocsolver_sorgl2")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_sorgl2
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
    end function

  
    function rocsolver_dorgl2(handle,m,n,k,A,lda,ipiv) bind(c, name="rocsolver_dorgl2")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dorgl2
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
    end function

  ! ! \brief ORGLQ generates a m-by-n Matrix Q with orthonormal rows.
  ! 
  !     \details
  !     (This is the blocked version of the algorithm).
  ! 
  !     The matrix Q is defined as the first m rows of the product of k Householder
  !     reflectors of order n
  !     
  !         Q = H(k)  H(k-1)  ...  H(1)
  ! 
  !     Householder matrices H(i) are never stored, they are computed from its corresponding 
  !     Householder vector v(i) and scalar ipiv_i as returned by GELQF.
  ! 
  !     @param[in]
  !     handle      rocblas_handle.
  !     @param[in]
  !     m           rocblas_int. 0 <= m <= n.\n
  !                 The number of rows of the matrix Q. 
  !     @param[in]
  !     n           rocblas_int. n >= 0.\n
  !                 The number of colums of the matrix Q.
  !     @param[in]
  !     k           rocblas_int. 0 <= k <= m.\n
  !                 The number of Householder reflectors.
  !     @param[inout]
  !     A           pointer to type. Array on the GPU of dimension ldan.\n
  !                 On entry, the i-th row has Householder vector v(i), for i = 1,2,...,k
  !                 as returned in the first k rows of matrix A of GELQF.
  !                 On exit, the computed matrix Q.
  !     @param[in]
  !     lda         rocblas_int. lda >= m.\n
  !                 Specifies the leading dimension of A. 
  !     @param[in]
  !     ipiv        pointer to type. Array on the GPU of dimension at least k.\n
  !                 The scalar factors of the Householder matrices H(i) as returned by GELQF.
  ! 
  !     
    function rocsolver_sorglq(handle,m,n,k,A,lda,ipiv) bind(c, name="rocsolver_sorglq")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_sorglq
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
    end function

  
    function rocsolver_dorglq(handle,m,n,k,A,lda,ipiv) bind(c, name="rocsolver_dorglq")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dorglq
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
    end function

  ! ! \brief ORGBR generates a m-by-n Matrix Q with orthonormal rows or columns.
  ! 
  !     \details
  !     If storev is column-wise, then the matrix Q has orthonormal columns. If m >= k, Q is defined as the first 
  !     n columns of the product of k Householder reflectors of order m
  !     
  !         Q = H(1)  H(2)  ...  H(k)
  ! 
  !     If m < k, Q is defined as the product of Householder reflectors of order m
  ! 
  !         Q = H(1)  H(2)  ...  H(m-1)
  ! 
  !     On the other hand, if storev is row-wise, then the matrix Q has orthonormal rows. If n > k, Q is defined as the
  !     first m rows of the product of k Householder reflectors of order n
  ! 
  !         Q = H(k)  H(k-1)  ...  H(1)
  !     
  !     If n <= k, Q is defined as the product of Householder reflectors of order n
  ! 
  !         Q = H(n-1)  H(n-2)  ...  H(1)
  ! 
  !     The Householder matrices H(i) are never stored, they are computed from its corresponding 
  !     Householder vectors v(i) and scalars ipiv_i as returned by GEBRD in its arguments A and tauq or taup.
  ! 
  !     @param[in]
  !     handle      rocblas_handle.
  !     @param[in]
  !     storev      rocblas_storev.\n
  !                 Specifies whether to work column-wise or row-wise.
  !     @param[in]
  !     m           rocblas_int. m >= 0.\n
  !                 The number of rows of the matrix Q. 
  !                 If row-wise, then min(n,k) <= m <= n.
  !     @param[in]
  !     n           rocblas_int. n >= 0.\n
  !                 The number of colums of the matrix Q. 
  !                 If column-wise, then min(m,k) <= n <= m. 
  !     @param[in]
  !     k           rocblas_int. k >= 0.\n
  !                 The number of columns (if storev is colum-wise) or rows (if row-wise) of the
  !                 original matrix reduced by GEBRD.
  !     @param[inout]
  !     A           pointer to type. Array on the GPU of dimension ldan.\n
  !                 On entry, the i-th column (or row) has the Householder vector v(i)
  !                 as returned by GEBRD.
  !                 On exit, the computed matrix Q.
  !     @param[in]
  !     lda         rocblas_int. lda >= m.\n
  !                 Specifies the leading dimension of A. 
  !     @param[in]
  !     ipiv        pointer to type. Array on the GPU of dimension min(m,k) if column-wise, or min(n,k) if row-wise.\n
  !                 The scalar factors of the Householder matrices H(i) as returned by GEBRD.
  ! 
  !     
    function rocsolver_sorgbr(handle,storev,m,n,k,A,lda,ipiv) bind(c, name="rocsolver_sorgbr")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_sorgbr
      type(c_ptr),value :: handle
      integer(kind(rocblas_column_wise)),value :: storev
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
    end function

  
    function rocsolver_dorgbr(handle,storev,m,n,k,A,lda,ipiv) bind(c, name="rocsolver_dorgbr")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dorgbr
      type(c_ptr),value :: handle
      integer(kind(rocblas_column_wise)),value :: storev
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
    end function

  ! ! \brief ORM2R applies a matrix Q with orthonormal columns to a general m-by-n matrix C.
  ! 
  !     \details
  !     (This is the unblocked version of the algorithm).
  !     
  !     The matrix Q is applied in one of the following forms, depending on 
  !     the values of side and trans:
  ! 
  !         Q   C  (No transpose from the left)
  !         Q'  C  (Transpose from the left)
  !         C  Q   (No transpose from the right), and
  !         C  Q'  (Transpose from the right)
  ! 
  !     Q is an orthogonal matrix defined as the product of k Householder reflectors as
  ! 
  !         Q = H(1)  H(2)  ...  H(k)
  ! 
  !     or order m if applying from the left, or n if applying from the right. Q is never stored, it is 
  !     calculated from the Householder vectors and scalars returned by the QR factorization GEQRF.
  ! 
  !     @param[in]
  !     handle              rocblas_handle.
  !     @param[in]
  !     side                rocblas_side.\n
  !                         Specifies from which side to apply Q.
  !     @param[in]
  !     trans               rocblas_operation.\n
  !                         Specifies whether the matrix Q or its transpose is to be applied.
  !     @param[in]
  !     m                   rocblas_int. m >= 0.\n
  !                         Number of rows of matrix C.
  !     @param[in]
  !     n                   rocblas_int. n >= 0.\n
  !                         Number of columns of matrix C.
  !     @param[in]          
  !     k                   rocsovler_int. k >= 0; k <= m if side is left, k <= n if side is right.\n
  !                         The number of Householder reflectors that form Q.
  !     @param[in]          
  !     A                   pointer to type. Array on the GPU of size ldak.\n
  !                         The i-th column has the Householder vector v(i) associated with H(i) as returned by GEQRF
  !                         in the first k columns of its argument A.
  !     @param[in]
  !     lda                 rocblas_int. lda >= m if side is left, or lda >= n if side is right. \n
  !                         Leading dimension of A.
  !     @param[in]
  !     ipiv                pointer to type. Array on the GPU of dimension at least k.\n
  !                         The scalar factors of the Householder matrices H(i) as returned by GEQRF.
  !     @param[inout]
  !     C                   pointer to type. Array on the GPU of size ldcn.\n
  !                         On input, the matrix C. On output it is overwritten with
  !                         QC, CQ, Q'C, or CQ'.  
  !     @param[in]
  !     lda                 rocblas_int. ldc >= m.\n
  !                         Leading dimension of C. 
  !      
  !     
    function rocsolver_sorm2r(handle,side,trans,m,n,k,A,lda,ipiv,C,ldc) bind(c, name="rocsolver_sorm2r")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_sorm2r
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
    function rocsolver_dorm2r(handle,side,trans,m,n,k,A,lda,ipiv,C,ldc) bind(c, name="rocsolver_dorm2r")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dorm2r
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  ! ! \brief ORMQR applies a matrix Q with orthonormal columns to a general m-by-n matrix C.
  ! 
  !     \details
  !     (This is the blocked version of the algorithm).
  !     
  !     The matrix Q is applied in one of the following forms, depending on 
  !     the values of side and trans:
  ! 
  !         Q   C  (No transpose from the left)
  !         Q'  C  (Transpose from the left)
  !         C  Q   (No transpose from the right), and
  !         C  Q'  (Transpose from the right)
  ! 
  !     Q is an orthogonal matrix defined as the product of k Householder reflectors as
  ! 
  !         Q = H(1)  H(2)  ...  H(k)
  ! 
  !     or order m if applying from the left, or n if applying from the right. Q is never stored, it is 
  !     calculated from the Householder vectors and scalars returned by the QR factorization GEQRF.
  ! 
  !     @param[in]
  !     handle              rocblas_handle.
  !     @param[in]
  !     side                rocblas_side.\n
  !                         Specifies from which side to apply Q.
  !     @param[in]
  !     trans               rocblas_operation.\n
  !                         Specifies whether the matrix Q or its transpose is to be applied.
  !     @param[in]
  !     m                   rocblas_int. m >= 0.\n
  !                         Number of rows of matrix C.
  !     @param[in]
  !     n                   rocblas_int. n >= 0.\n
  !                         Number of columns of matrix C.
  !     @param[in]          
  !     k                   rocsovler_int. k >= 0; k <= m if side is left, k <= n if side is right.\n
  !                         The number of Householder reflectors that form Q.
  !     @param[in]          
  !     A                   pointer to type. Array on the GPU of size ldak.\n
  !                         The i-th column has the Householder vector v(i) associated with H(i) as returned by GEQRF
  !                         in the first k columns of its argument A.
  !     @param[in]
  !     lda                 rocblas_int. lda >= m if side is left, or lda >= n if side is right. \n
  !                         Leading dimension of A.
  !     @param[in]
  !     ipiv                pointer to type. Array on the GPU of dimension at least k.\n
  !                         The scalar factors of the Householder matrices H(i) as returned by GEQRF.
  !     @param[inout]
  !     C                   pointer to type. Array on the GPU of size ldcn.\n
  !                         On input, the matrix C. On output it is overwritten with
  !                         QC, CQ, Q'C, or CQ'.  
  !     @param[in]
  !     lda                 rocblas_int. ldc >= m.\n
  !                         Leading dimension of C. 
  !      
  !     
    function rocsolver_sormqr(handle,side,trans,m,n,k,A,lda,ipiv,C,ldc) bind(c, name="rocsolver_sormqr")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_sormqr
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
    function rocsolver_dormqr(handle,side,trans,m,n,k,A,lda,ipiv,C,ldc) bind(c, name="rocsolver_dormqr")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dormqr
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  ! ! \brief ORML2 applies a matrix Q with orthonormal rows to a general m-by-n matrix C.
  ! 
  !     \details
  !     (This is the unblocked version of the algorithm).
  !     
  !     The matrix Q is applied in one of the following forms, depending on 
  !     the values of side and trans:
  ! 
  !         Q   C  (No transpose from the left)
  !         Q'  C  (Transpose from the left)
  !         C  Q   (No transpose from the right), and
  !         C  Q'  (Transpose from the right)
  ! 
  !     Q is an orthogonal matrix defined as the product of k Householder reflectors as
  ! 
  !         Q = H(k)  H(k-1)  ...  H(1)
  ! 
  !     or order m if applying from the left, or n if applying from the right. Q is never stored, it is 
  !     calculated from the Householder vectors and scalars returned by the LQ factorization GELQF.
  ! 
  !     @param[in]
  !     handle              rocblas_handle.
  !     @param[in]
  !     side                rocblas_side.\n
  !                         Specifies from which side to apply Q.
  !     @param[in]
  !     trans               rocblas_operation.\n
  !                         Specifies whether the matrix Q or its transpose is to be applied.
  !     @param[in]
  !     m                   rocblas_int. m >= 0.\n
  !                         Number of rows of matrix C.
  !     @param[in]
  !     n                   rocblas_int. n >= 0.\n
  !                         Number of columns of matrix C.
  !     @param[in]          
  !     k                   rocsovler_int. k >= 0; k <= m if side is left, k <= n if side is right.\n
  !                         The number of Householder reflectors that form Q.
  !     @param[in]          
  !     A                   pointer to type. Array on the GPU of size ldam if side is left, or ldan if side is right.\n
  !                         The i-th row has the Householder vector v(i) associated with H(i) as returned by GELQF
  !                         in the first k rows of its argument A.
  !     @param[in]
  !     lda                 rocblas_int. lda >= k. \n
  !                         Leading dimension of A.
  !     @param[in]
  !     ipiv                pointer to type. Array on the GPU of dimension at least k.\n
  !                         The scalar factors of the Householder matrices H(i) as returned by GELQF.
  !     @param[inout]
  !     C                   pointer to type. Array on the GPU of size ldcn.\n
  !                         On input, the matrix C. On output it is overwritten with
  !                         QC, CQ, Q'C, or CQ'.  
  !     @param[in]
  !     lda                 rocblas_int. ldc >= m.\n
  !                         Leading dimension of C. 
  !      
  !     
    function rocsolver_sorml2(handle,side,trans,m,n,k,A,lda,ipiv,C,ldc) bind(c, name="rocsolver_sorml2")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_sorml2
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
    function rocsolver_dorml2(handle,side,trans,m,n,k,A,lda,ipiv,C,ldc) bind(c, name="rocsolver_dorml2")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dorml2
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  ! ! \brief ORMLQ applies a matrix Q with orthonormal rows to a general m-by-n matrix C.
  ! 
  !     \details
  !     (This is the blocked version of the algorithm).
  !     
  !     The matrix Q is applied in one of the following forms, depending on 
  !     the values of side and trans:
  ! 
  !         Q   C  (No transpose from the left)
  !         Q'  C  (Transpose from the left)
  !         C  Q   (No transpose from the right), and
  !         C  Q'  (Transpose from the right)
  ! 
  !     Q is an orthogonal matrix defined as the product of k Householder reflectors as
  ! 
  !         Q = H(k)  H(k-1)  ...  H(1)
  ! 
  !     or order m if applying from the left, or n if applying from the right. Q is never stored, it is 
  !     calculated from the Householder vectors and scalars returned by the LQ factorization GELQF.
  ! 
  !     @param[in]
  !     handle              rocblas_handle.
  !     @param[in]
  !     side                rocblas_side.\n
  !                         Specifies from which side to apply Q.
  !     @param[in]
  !     trans               rocblas_operation.\n
  !                         Specifies whether the matrix Q or its transpose is to be applied.
  !     @param[in]
  !     m                   rocblas_int. m >= 0.\n
  !                         Number of rows of matrix C.
  !     @param[in]
  !     n                   rocblas_int. n >= 0.\n
  !                         Number of columns of matrix C.
  !     @param[in]          
  !     k                   rocsovler_int. k >= 0; k <= m if side is left, k <= n if side is right.\n
  !                         The number of Householder reflectors that form Q.
  !     @param[in]          
  !     A                   pointer to type. Array on the GPU of size ldam if side is left, or ldan if side is right.\n
  !                         The i-th row has the Householder vector v(i) associated with H(i) as returned by GELQF
  !                         in the first k rows of its argument A.
  !     @param[in]
  !     lda                 rocblas_int. lda >= k. \n
  !                         Leading dimension of A.
  !     @param[in]
  !     ipiv                pointer to type. Array on the GPU of dimension at least k.\n
  !                         The scalar factors of the Householder matrices H(i) as returned by GELQF.
  !     @param[inout]
  !     C                   pointer to type. Array on the GPU of size ldcn.\n
  !                         On input, the matrix C. On output it is overwritten with
  !                         QC, CQ, Q'C, or CQ'.  
  !     @param[in]
  !     lda                 rocblas_int. ldc >= m.\n
  !                         Leading dimension of C. 
  !      
  !     
    function rocsolver_sormlq(handle,side,trans,m,n,k,A,lda,ipiv,C,ldc) bind(c, name="rocsolver_sormlq")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_sormlq
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
    function rocsolver_dormlq(handle,side,trans,m,n,k,A,lda,ipiv,C,ldc) bind(c, name="rocsolver_dormlq")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dormlq
      type(c_ptr),value :: handle
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  ! ! \brief ORMBR applies a matrix Q with orthonormal rows or columns to a general m-by-n matrix C.
  ! 
  !     \details
  !     If storev is column-wise, then the matrix Q has orthonormal columns. 
  !     If storev is row-wise, then the matrix Q has orthonormal rows.  
  !     The matrix Q is applied in one of the following forms, depending on
  !     the values of side and trans:
  ! 
  !         Q   C  (No transpose from the left)
  !         Q'  C  (Transpose from the left)
  !         C  Q   (No transpose from the right), and
  !         C  Q'  (Transpose from the right)
  ! 
  !     The order nq of orthogonal matrix Q is nq = m if applying from the left, or nq = n if applying from the right.
  ! 
  !     When storev is column-wise, if nq >= k, then Q is defined as the product of k Householder reflectors of order nq
  !     
  !         Q = H(1)  H(2)  ...  H(k),
  ! 
  !     and if nq < k, then Q is defined as the product 
  ! 
  !         Q = H(1)  H(2)  ...  H(nq-1).
  ! 
  !     When storev is row-wise, if nq > k, then Q is defined as the product of k Householder reflectors of order nq
  ! 
  !         Q = H(1)  H(2)  ...  H(k),
  !     
  !     and if n <= k, Q is defined as the product 
  ! 
  !         Q = H(1)  H(2)  ...  H(nq-1)
  ! 
  !     The Householder matrices H(i) are never stored, they are computed from its corresponding 
  !     Householder vectors v(i) and scalars ipiv_i as returned by GEBRD in its arguments A and tauq or taup.
  ! 
  !     @param[in]
  !     handle              rocblas_handle.
  !     @param[in]
  !     storev              rocblas_storev.\n
  !                         Specifies whether to work column-wise or row-wise.
  !     @param[in]
  !     side                rocblas_side.\n
  !                         Specifies from which side to apply Q.
  !     @param[in]
  !     trans               rocblas_operation.\n
  !                         Specifies whether the matrix Q or its transpose is to be applied.
  !     @param[in]
  !     m                   rocblas_int. m >= 0.\n
  !                         Number of rows of matrix C.
  !     @param[in]
  !     n                   rocblas_int. n >= 0.\n
  !                         Number of columns of matrix C.
  !     @param[in]          
  !     k                   rocsovler_int. k >= 0.\n
  !                         The number of columns (if storev is colum-wise) or rows (if row-wise) of the
  !                         original matrix reduced by GEBRD.
  !     @param[in]          
  !     A                   pointer to type. Array on the GPU of size ldamin(nq,k) if column-wise, or ldanq if row-wise.\n
  !                         The i-th column (or row) has the Householder vector v(i) associated with H(i) as returned by GEBRD.
  !     @param[in]
  !     lda                 rocblas_int. lda >= nq if column-wise, or lda >= min(nq,k) if row-wise. \n
  !                         Leading dimension of A.
  !     @param[in]
  !     ipiv                pointer to type. Array on the GPU of dimension at least min(nq,k).\n
  !                         The scalar factors of the Householder matrices H(i) as returned by GEBRD.
  !     @param[inout]
  !     C                   pointer to type. Array on the GPU of size ldcn.\n
  !                         On input, the matrix C. On output it is overwritten with
  !                         QC, CQ, Q'C, or CQ'.  
  !     @param[in]
  !     lda                 rocblas_int. ldc >= m.\n
  !                         Leading dimension of C. 
  ! 
  !     
    function rocsolver_sormbr(handle,storev,side,trans,m,n,k,A,lda,ipiv,C,ldc) bind(c, name="rocsolver_sormbr")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_sormbr
      type(c_ptr),value :: handle
      integer(kind(rocblas_column_wise)),value :: storev
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  
    function rocsolver_dormbr(handle,storev,side,trans,m,n,k,A,lda,ipiv,C,ldc) bind(c, name="rocsolver_dormbr")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dormbr
      type(c_ptr),value :: handle
      integer(kind(rocblas_column_wise)),value :: storev
      integer(kind(rocblas_side_left)),value :: side
      integer(kind(rocblas_operation_none)),value :: trans
      integer(c_int),value :: m
      integer(c_int),value :: n
      integer(c_int),value :: k
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: C
      integer(c_int),value :: ldc
    end function

  ! ! \brief GETF2 computes the LU factorization of a general m-by-n matrix A
  !     using partial pivoting with row interchanges.
  ! 
  !     \details
  !     (This is the right-looking Level 2 BLAS version of the algorithm).
  ! 
  !     The factorization has the form
  ! 
  !         A = P  L  U
  ! 
  !     where P is a permutation matrix, L is lower triangular with unit
  !     diagonal elements (lower trapezoidal if m > n), and U is upper
  !     triangular (upper trapezoidal if m < n).
  ! 
  !     @param[in]
  !     handle    rocblas_handle.
  !     @param[in]
  !     m         rocblas_int. m >= 0.\n
  !               The number of rows of the matrix A. 
  !     @param[in]
  !     n         rocblas_int. n >= 0.\n
  !               The number of colums of the matrix A. 
  !     @param[inout]
  !     A         pointer to type. Array on the GPU of dimension ldan.\n
  !               On entry, the m-by-n matrix A to be factored.
  !               On exit, the factors L and U from the factorization.
  !               The unit diagonal elements of L are not stored.
  !     @param[in]
  !     lda       rocblas_int. lda >= m.\n
  !               Specifies the leading dimension of A. 
  !     @param[out]
  !     ipiv      pointer to rocblas_int. Array on the GPU of dimension min(m,n).\n
  !               The vector of pivot indices. Elements of ipiv are 1-based indices.
  !               For 1 <= i <= min(m,n), the row i of the
  !               matrix was interchanged with row ipiv[i].
  !               Matrix P of the factorization can be derived from ipiv.
  !     @param[out]
  !     info      pointer to a rocblas_int on the GPU.\n
  !               If info = 0, succesful exit. 
  !               If info = i > 0, U is singular. U(i,i) is the first zero pivot.
  !             
  !     
    function rocsolver_sgetf2(handle,m,n,A,lda,ipiv,info) bind(c, name="rocsolver_sgetf2")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_sgetf2
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: info
    end function

  
    function rocsolver_dgetf2(handle,m,n,A,lda,ipiv,info) bind(c, name="rocsolver_dgetf2")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dgetf2
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: info
    end function

  
    function rocsolver_cgetf2(handle,m,n,A,lda,ipiv,info) bind(c, name="rocsolver_cgetf2")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_cgetf2
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: info
    end function

  
    function rocsolver_zgetf2(handle,m,n,A,lda,ipiv,info) bind(c, name="rocsolver_zgetf2")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_zgetf2
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: info
    end function

  ! ! \brief GETF2_BATCHED computes the LU factorization of a batch of general m-by-n matrices
  !     using partial pivoting with row interchanges.
  ! 
  !     \details
  !     (This is the right-looking Level 2 BLAS version of the algorithm).
  ! 
  !     The factorization of matrix A_i in the batch has the form
  ! 
  !         A_i = P_i  L_i  U_i
  ! 
  !     where P_i is a permutation matrix, L_i is lower triangular with unit
  !     diagonal elements (lower trapezoidal if m > n), and U_i is upper
  !     triangular (upper trapezoidal if m < n).
  ! 
  !     @param[in]
  !     handle    rocblas_handle.
  !     @param[in]
  !     m         rocblas_int. m >= 0.\n
  !               The number of rows of all matrices A_i in the batch.
  !     @param[in]
  !     n         rocblas_int. n >= 0.\n
  !               The number of colums of all matrices A_i in the batch.
  !     @param[inout]
  !     A         array of pointers to type. Each pointer points to an array on the GPU of dimension ldan.\n
  !               On entry, the m-by-n matrices A_i to be factored.
  !               On exit, the factors L_i and U_i from the factorizations.
  !               The unit diagonal elements of L_i are not stored.
  !     @param[in]
  !     lda       rocblas_int. lda >= m.\n
  !               Specifies the leading dimension of matrices A_i.
  !     @param[out]
  !     ipiv      pointer to rocblas_int. Array on the GPU (the size depends on the value of strideP).\n 
  !               Contains the vectors of pivot indices ipiv_i (corresponding to A_i). 
  !               Dimension of ipiv_i is min(m,n).
  !               Elements of ipiv_i are 1-based indices.
  !               For each instance A_i in the batch and for 1 <= j <= min(m,n), the row j of the
  !               matrix A_i was interchanged with row ipiv_i[j].
  !               Matrix P_i of the factorization can be derived from ipiv_i.
  !     @param[in]
  !     strideP   rocblas_stride.\n
  !               Stride from the start of one vector ipiv_i to the next one ipiv_(i+1).
  !               There is no restriction for the value of strideP. Normal use case is strideP >= min(m,n).
  !     @param[out]
  !     info      pointer to rocblas_int. Array of batch_count integers on the GPU.\n
  !               If info_i = 0, succesful exit for factorization of A_i. 
  !               If info_i = j > 0, U_i is singular. U_i(j,j) is the first zero pivot.
  !     @param[in]
  !     batch_count rocblas_int. batch_count >= 0.\n
  !                 Number of matrices in the batch. 
  !             
  !     
    function rocsolver_sgetf2_batched(handle,m,n,A,lda,ipiv,strideP,info,batch_count) bind(c, name="rocsolver_sgetf2_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_sgetf2_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_dgetf2_batched(handle,m,n,A,lda,ipiv,strideP,info,batch_count) bind(c, name="rocsolver_dgetf2_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dgetf2_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_cgetf2_batched(handle,m,n,A,lda,ipiv,strideP,info,batch_count) bind(c, name="rocsolver_cgetf2_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_cgetf2_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_zgetf2_batched(handle,m,n,A,lda,ipiv,strideP,info,batch_count) bind(c, name="rocsolver_zgetf2_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_zgetf2_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  ! ! \brief GETF2_STRIDED_BATCHED computes the LU factorization of a batch of general m-by-n matrices
  !     using partial pivoting with row interchanges.
  ! 
  !     \details
  !     (This is the right-looking Level 2 BLAS version of the algorithm).
  !     
  !     The factorization of matrix A_i in the batch has the form
  ! 
  !         A_i = P_i  L_i  U_i
  ! 
  !     where P_i is a permutation matrix, L_i is lower triangular with unit
  !     diagonal elements (lower trapezoidal if m > n), and U_i is upper
  !     triangular (upper trapezoidal if m < n).
  ! 
  !     @param[in]
  !     handle    rocblas_handle.
  !     @param[in]
  !     m         rocblas_int. m >= 0.\n
  !               The number of rows of all matrices A_i in the batch.
  !     @param[in]
  !     n         rocblas_int. n >= 0.\n
  !               The number of colums of all matrices A_i in the batch.
  !     @param[inout]
  !     A         pointer to type. Array on the GPU (the size depends on the value of strideA).\n
  !               On entry, in contains the m-by-n matrices A_i to be factored.
  !               On exit, the factors L_i and U_i from the factorization.
  !               The unit diagonal elements of L_i are not stored.
  !     @param[in]
  !     lda       rocblas_int. lda >= m.\n
  !               Specifies the leading dimension of matrices A_i.
  !     @param[in]
  !     strideA   rocblas_stride.\n
  !               Stride from the start of one matrix A_i and the next one A_(i+1).
  !               There is no restriction for the value of strideA. Normal use case is strideA >= ldan
  !     @param[out]
  !     ipiv      pointer to rocblas_int. Array on the GPU (the size depends on the value of strideP).\n 
  !               Contains the vectors of pivots indices ipiv_i (corresponding to A_i). 
  !               Dimension of ipiv_i is min(m,n).
  !               Elements of ipiv_i are 1-based indices.
  !               For each instance A_i in the batch and for 1 <= j <= min(m,n), the row j of the
  !               matrix A_i was interchanged with row ipiv_i[j].
  !               Matrix P_i of the factorization can be derived from ipiv_i.
  !     @param[in]
  !     strideP   rocblas_stride.\n
  !               Stride from the start of one vector ipiv_i to the next one ipiv_(i+1).
  !               There is no restriction for the value of strideP. Normal use case is strideP >= min(m,n).
  !     @param[out]
  !     info      pointer to rocblas_int. Array of batch_count integers on the GPU.\n
  !               If info_i = 0, succesful exit for factorization of A_i. 
  !               If info_i = j > 0, U_i is singular. U_i(j,j) is the first zero pivot.
  !     @param[in]
  !     batch_count rocblas_int. batch_count >= 0.\n
  !                 Number of matrices in the batch. 
  !             
  !     
    function rocsolver_sgetf2_strided_batched(handle,m,n,A,lda,strideA,ipiv,strideP,info,batch_count) bind(c, name="rocsolver_sgetf2_strided_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_sgetf2_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_dgetf2_strided_batched(handle,m,n,A,lda,strideA,ipiv,strideP,info,batch_count) bind(c, name="rocsolver_dgetf2_strided_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dgetf2_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_cgetf2_strided_batched(handle,m,n,A,lda,strideA,ipiv,strideP,info,batch_count) bind(c, name="rocsolver_cgetf2_strided_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_cgetf2_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_zgetf2_strided_batched(handle,m,n,A,lda,strideA,ipiv,strideP,info,batch_count) bind(c, name="rocsolver_zgetf2_strided_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_zgetf2_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  ! ! \brief GETRF computes the LU factorization of a general m-by-n matrix A
  !     using partial pivoting with row interchanges.
  ! 
  !     \details
  !     (This is the right-looking Level 3 BLAS version of the algorithm).
  ! 
  !     The factorization has the form
  ! 
  !         A = P  L  U
  ! 
  !     where P is a permutation matrix, L is lower triangular with unit
  !     diagonal elements (lower trapezoidal if m > n), and U is upper
  !     triangular (upper trapezoidal if m < n).
  ! 
  !     @param[in]
  !     handle    rocblas_handle.
  !     @param[in]
  !     m         rocblas_int. m >= 0.\n
  !               The number of rows of the matrix A. 
  !     @param[in]
  !     n         rocblas_int. n >= 0.\n
  !               The number of colums of the matrix A. 
  !     @param[inout]
  !     A         pointer to type. Array on the GPU of dimension ldan.\n
  !               On entry, the m-by-n matrix A to be factored.
  !               On exit, the factors L and U from the factorization.
  !               The unit diagonal elements of L are not stored.
  !     @param[in]
  !     lda       rocblas_int. lda >= m.\n
  !               Specifies the leading dimension of A. 
  !     @param[out]
  !     ipiv      pointer to rocblas_int. Array on the GPU of dimension min(m,n).\n
  !               The vector of pivot indices. Elements of ipiv are 1-based indices.
  !               For 1 <= i <= min(m,n), the row i of the
  !               matrix was interchanged with row ipiv[i].
  !               Matrix P of the factorization can be derived from ipiv.
  !     @param[out]
  !     info      pointer to a rocblas_int on the GPU.\n
  !               If info = 0, succesful exit. 
  !               If info = i > 0, U is singular. U(i,i) is the first zero pivot.
  !             
  !     
    function rocsolver_sgetrf(handle,m,n,A,lda,ipiv,info) bind(c, name="rocsolver_sgetrf")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_sgetrf
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: info
    end function

  
    function rocsolver_dgetrf(handle,m,n,A,lda,ipiv,info) bind(c, name="rocsolver_dgetrf")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dgetrf
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: info
    end function

  
    function rocsolver_cgetrf(handle,m,n,A,lda,ipiv,info) bind(c, name="rocsolver_cgetrf")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_cgetrf
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: info
    end function

  
    function rocsolver_zgetrf(handle,m,n,A,lda,ipiv,info) bind(c, name="rocsolver_zgetrf")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_zgetrf
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      type(c_ptr),value :: info
    end function

  ! ! \brief GETRF_BATCHED computes the LU factorization of a batch of general m-by-n matrices
  !     using partial pivoting with row interchanges.
  ! 
  !     \details
  !     (This is the right-looking Level 3 BLAS version of the algorithm).
  ! 
  !     The factorization of matrix A_i in the batch has the form
  ! 
  !         A_i = P_i  L_i  U_i
  ! 
  !     where P_i is a permutation matrix, L_i is lower triangular with unit
  !     diagonal elements (lower trapezoidal if m > n), and U_i is upper
  !     triangular (upper trapezoidal if m < n).
  ! 
  !     @param[in]
  !     handle    rocblas_handle.
  !     @param[in]
  !     m         rocblas_int. m >= 0.\n
  !               The number of rows of all matrices A_i in the batch.
  !     @param[in]
  !     n         rocblas_int. n >= 0.\n
  !               The number of colums of all matrices A_i in the batch.
  !     @param[inout]
  !     A         array of pointers to type. Each pointer points to an array on the GPU of dimension ldan.\n
  !               On entry, the m-by-n matrices A_i to be factored.
  !               On exit, the factors L_i and U_i from the factorizations.
  !               The unit diagonal elements of L_i are not stored.
  !     @param[in]
  !     lda       rocblas_int. lda >= m.\n
  !               Specifies the leading dimension of matrices A_i.
  !     @param[out]
  !     ipiv      pointer to rocblas_int. Array on the GPU (the size depends on the value of strideP).\n 
  !               Contains the vectors of pivot indices ipiv_i (corresponding to A_i). 
  !               Dimension of ipiv_i is min(m,n).
  !               Elements of ipiv_i are 1-based indices.
  !               For each instance A_i in the batch and for 1 <= j <= min(m,n), the row j of the
  !               matrix A_i was interchanged with row ipiv_i(j).
  !               Matrix P_i of the factorization can be derived from ipiv_i.
  !     @param[in]
  !     strideP   rocblas_stride.\n
  !               Stride from the start of one vector ipiv_i to the next one ipiv_(i+1).
  !               There is no restriction for the value of strideP. Normal use case is strideP >= min(m,n).
  !     @param[out]
  !     info      pointer to rocblas_int. Array of batch_count integers on the GPU.\n
  !               If info_i = 0, succesful exit for factorization of A_i. 
  !               If info_i = j > 0, U_i is singular. U_i(j,j) is the first zero pivot.
  !     @param[in]
  !     batch_count rocblas_int. batch_count >= 0.\n
  !                 Number of matrices in the batch. 
  !             
  !     
    function rocsolver_sgetrf_batched(handle,m,n,A,lda,ipiv,strideP,info,batch_count) bind(c, name="rocsolver_sgetrf_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_sgetrf_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_dgetrf_batched(handle,m,n,A,lda,ipiv,strideP,info,batch_count) bind(c, name="rocsolver_dgetrf_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dgetrf_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_cgetrf_batched(handle,m,n,A,lda,ipiv,strideP,info,batch_count) bind(c, name="rocsolver_cgetrf_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_cgetrf_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_zgetrf_batched(handle,m,n,A,lda,ipiv,strideP,info,batch_count) bind(c, name="rocsolver_zgetrf_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_zgetrf_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  ! ! \brief GETRF_STRIDED_BATCHED computes the LU factorization of a batch of general m-by-n matrices
  !     using partial pivoting with row interchanges.
  ! 
  !     \details
  !     (This is the right-looking Level 3 BLAS version of the algorithm).
  !     
  !     The factorization of matrix A_i in the batch has the form
  ! 
  !         A_i = P_i  L_i  U_i
  ! 
  !     where P_i is a permutation matrix, L_i is lower triangular with unit
  !     diagonal elements (lower trapezoidal if m > n), and U_i is upper
  !     triangular (upper trapezoidal if m < n).
  ! 
  !     @param[in]
  !     handle    rocblas_handle.
  !     @param[in]
  !     m         rocblas_int. m >= 0.\n
  !               The number of rows of all matrices A_i in the batch.
  !     @param[in]
  !     n         rocblas_int. n >= 0.\n
  !               The number of colums of all matrices A_i in the batch.
  !     @param[inout]
  !     A         pointer to type. Array on the GPU (the size depends on the value of strideA).\n
  !               On entry, in contains the m-by-n matrices A_i to be factored.
  !               On exit, the factors L_i and U_i from the factorization.
  !               The unit diagonal elements of L_i are not stored.
  !     @param[in]
  !     lda       rocblas_int. lda >= m.\n
  !               Specifies the leading dimension of matrices A_i.
  !     @param[in]
  !     strideA   rocblas_stride.\n
  !               Stride from the start of one matrix A_i and the next one A_(i+1).
  !               There is no restriction for the value of strideA. Normal use case is strideA >= ldan
  !     @param[out]
  !     ipiv      pointer to rocblas_int. Array on the GPU (the size depends on the value of strideP).\n 
  !               Contains the vectors of pivots indices ipiv_i (corresponding to A_i). 
  !               Dimension of ipiv_i is min(m,n).
  !               Elements of ipiv_i are 1-based indices.
  !               For each instance A_i in the batch and for 1 <= j <= min(m,n), the row j of the
  !               matrix A_i was interchanged with row ipiv_i(j).
  !               Matrix P_i of the factorization can be derived from ipiv_i.
  !     @param[in]
  !     strideP   rocblas_stride.\n
  !               Stride from the start of one vector ipiv_i to the next one ipiv_(i+1).
  !               There is no restriction for the value of strideP. Normal use case is strideP >= min(m,n).
  !     @param[out]
  !     info      pointer to rocblas_int. Array of batch_count integers on the GPU.\n
  !               If info_i = 0, succesful exit for factorization of A_i. 
  !               If info_i = j > 0, U_i is singular. U_i(j,j) is the first zero pivot.
  !     @param[in]
  !     batch_count rocblas_int. batch_count >= 0.\n
  !                 Number of matrices in the batch. 
  !             
  !     
    function rocsolver_sgetrf_strided_batched(handle,m,n,A,lda,strideA,ipiv,strideP,info,batch_count) bind(c, name="rocsolver_sgetrf_strided_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_sgetrf_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_dgetrf_strided_batched(handle,m,n,A,lda,strideA,ipiv,strideP,info,batch_count) bind(c, name="rocsolver_dgetrf_strided_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dgetrf_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_cgetrf_strided_batched(handle,m,n,A,lda,strideA,ipiv,strideP,info,batch_count) bind(c, name="rocsolver_cgetrf_strided_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_cgetrf_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_zgetrf_strided_batched(handle,m,n,A,lda,strideA,ipiv,strideP,info,batch_count) bind(c, name="rocsolver_zgetrf_strided_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_zgetrf_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  ! ! \brief GEQR2 computes a QR factorization of a general m-by-n matrix A.
  ! 
  !     \details
  !     (This is the unblocked version of the algorithm).
  ! 
  !     The factorization has the form
  ! 
  !         A =  Q  [ R ]
  !                  [ 0 ]
  ! 
  !     where R is upper triangular (upper trapezoidal if m < n), and Q is 
  !     a m-by-m orthogonal matrix represented as the product of Householder matrices
  ! 
  !         Q = H(1)  H(2)  ...  H(k), with k = min(m,n)
  ! 
  !     Each Householder matrix H(i), for i = 1,2,...,k, is given by
  ! 
  !         H(i) = I - ipiv[i-1]  v(i)  v(i)'
  !     
  !     where the first i-1 elements of the Householder vector v(i) are zero, and v(i)[i] = 1. 
  ! 
  !     @param[in]
  !     handle    rocblas_handle.
  !     @param[in]
  !     m         rocblas_int. m >= 0.\n
  !               The number of rows of the matrix A.
  !     @param[in]
  !     n         rocblas_int. n >= 0.\n
  !               The number of colums of the matrix A.
  !     @param[inout]
  !     A         pointer to type. Array on the GPU of dimension ldan.\n
  !               On entry, the m-by-n matrix to be factored.
  !               On exit, the elements on and above the diagonal contain the 
  !               factor R; the elements below the diagonal are the m - i elements
  !               of vector v(i) for i = 1,2,...,min(m,n).
  !     @param[in]
  !     lda       rocblas_int. lda >= m.\n
  !               Specifies the leading dimension of A. 
  !     @param[out]
  !     ipiv      pointer to type. Array on the GPU of dimension min(m,n).\n
  !               The scalar factors of the Householder matrices H(i).
  ! 
  !     
    function rocsolver_sgeqr2(handle,m,n,A,lda,ipiv) bind(c, name="rocsolver_sgeqr2")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_sgeqr2
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
    end function

  
    function rocsolver_dgeqr2(handle,m,n,A,lda,ipiv) bind(c, name="rocsolver_dgeqr2")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dgeqr2
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
    end function

  
    function rocsolver_cgeqr2(handle,m,n,A,lda,ipiv) bind(c, name="rocsolver_cgeqr2")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_cgeqr2
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
    end function

  
    function rocsolver_zgeqr2(handle,m,n,A,lda,ipiv) bind(c, name="rocsolver_zgeqr2")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_zgeqr2
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
    end function

  ! ! \brief GEQR2_BATCHED computes the QR factorization of a batch of general m-by-n matrices.
  ! 
  !     \details
  !     (This is the unblocked version of the algorithm).
  ! 
  !     The factorization of matrix A_j in the batch has the form
  ! 
  !         A_j =  Q_j  [ R_j ]
  !                      [  0  ]
  ! 
  !     where R_j is upper triangular (upper trapezoidal if m < n), and Q_j is 
  !     a m-by-m orthogonal matrix represented as the product of Householder matrices
  ! 
  !         Q_j = H_j(1)  H_j(2)  ...  H_j(k), with k = min(m,n)
  ! 
  !     Each Householder matrices H_j(i), for j = 1,2,...,batch_count, and i = 1,2,...,k, is given by
  ! 
  !         H_j(i) = I - ipiv_j[i-1]  v_j(i)  v_j(i)'
  ! 
  !     where the first i-1 elements of Householder vector v_j(i) are zero, and v_j(i)[i] = 1. 
  ! 
  !     @param[in]
  !     handle    rocblas_handle.
  !     @param[in]
  !     m         rocblas_int. m >= 0.\n
  !               The number of rows of all the matrices A_j in the batch.
  !     @param[in]
  !     n         rocblas_int. n >= 0.\n
  !               The number of colums of all the matrices A_j in the batch.
  !     @param[inout]
  !     A         Array of pointers to type. Each pointer points to an array on the GPU of dimension ldan.\n
  !               On entry, the m-by-n matrices A_j to be factored.
  !               On exit, the elements on and above the diagonal contain the 
  !               factor R_j. The elements below the diagonal are the m - i elements
  !               of vector v_j(i) for i=1,2,...,min(m,n).
  !     @param[in]
  !     lda       rocblas_int. lda >= m.\n
  !               Specifies the leading dimension of matrices A_j. 
  !     @param[out]
  !     ipiv      pointer to type. Array on the GPU (the size depends on the value of strideP).\n
  !               Contains the vectors ipiv_j of scalar factors of the 
  !               Householder matrices H_j(i).
  !     @param[in]
  !     strideP   rocblas_stride.\n
  !               Stride from the start of one vector ipiv_j to the next one ipiv_(j+1). 
  !               There is no restriction for the value
  !               of strideP. Normal use is strideP >= min(m,n).
  !     @param[in]
  !     batch_count  rocblas_int. batch_count >= 0.\n
  !                  Number of matrices in the batch.
  ! 
  !     
    function rocsolver_sgeqr2_batched(handle,m,n,A,lda,ipiv,strideP,batch_count) bind(c, name="rocsolver_sgeqr2_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_sgeqr2_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_dgeqr2_batched(handle,m,n,A,lda,ipiv,strideP,batch_count) bind(c, name="rocsolver_dgeqr2_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dgeqr2_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_cgeqr2_batched(handle,m,n,A,lda,ipiv,strideP,batch_count) bind(c, name="rocsolver_cgeqr2_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_cgeqr2_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_zgeqr2_batched(handle,m,n,A,lda,ipiv,strideP,batch_count) bind(c, name="rocsolver_zgeqr2_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_zgeqr2_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      integer(c_int),value :: batch_count
    end function

  ! ! \brief GEQR2_STRIDED_BATCHED computes the QR factorization of a batch of general m-by-n matrices.
  ! 
  !     \details
  !     (This is the unblocked version of the algorithm).
  ! 
  !     The factorization of matrix A_j in the batch has the form
  ! 
  !         A_j =  Q_j  [ R_j ]
  !                      [  0  ] 
  ! 
  !     where R_j is upper triangular (upper trapezoidal if m < n), and Q_j is 
  !     a m-by-m orthogonal matrix represented as the product of Householder matrices
  ! 
  !         Q_j = H_j(1)  H_j(2)  ...  H_j(k), with k = min(m,n)
  ! 
  !     Each Householder matrices H_j(i), for j = 1,2,...,batch_count, and i = 1,2,...,k, is given by
  ! 
  !         H_j(i) = I - ipiv_j[i-1]  v_j(i)  v_j(i)'
  ! 
  !     where the first i-1 elements of Householder vector v_j(i) are zero, and v_j(i)[i] = 1. 
  ! 
  !     @param[in]
  !     handle    rocblas_handle.
  !     @param[in]
  !     m         rocblas_int. m >= 0.\n
  !               The number of rows of all the matrices A_j in the batch.
  !     @param[in]
  !     n         rocblas_int. n >= 0.\n
  !               The number of colums of all the matrices A_j in the batch.
  !     @param[inout]
  !     A         pointer to type. Array on the GPU (the size depends on the value of strideA).\n
  !               On entry, the m-by-n matrices A_j to be factored.
  !               On exit, the elements on and above the diagonal contain the 
  !               factor R_j. The elements below the diagonal are the m - i elements
  !               of vector v_j(i) for i = 1,2,...,min(m,n).
  !     @param[in]
  !     lda       rocblas_int. lda >= m.\n
  !               Specifies the leading dimension of matrices A_j. 
  !     @param[in]
  !     strideA   rocblas_stride.\n   
  !               Stride from the start of one matrix A_j and the next one A_(j+1). 
  !               There is no restriction for the value of strideA. Normal use case is strideA >= ldan.
  !     @param[out]
  !     ipiv      pointer to type. Array on the GPU (the size depends on the value of strideP).\n
  !               Contains the vectors ipiv_j of scalar factors of the 
  !               Householder matrices H_j(i).
  !     @param[in]
  !     strideP   rocblas_stride.\n
  !               Stride from the start of one vector ipiv_j to the next one ipiv_(j+1). 
  !               There is no restriction for the value
  !               of strideP. Normal use is strideP >= min(m,n).
  !     @param[in]
  !     batch_count  rocblas_int. batch_count >= 0.\n
  !                  Number of matrices in the batch.
  ! 
  !     
    function rocsolver_sgeqr2_strided_batched(handle,m,n,A,lda,strideA,ipiv,strideP,batch_count) bind(c, name="rocsolver_sgeqr2_strided_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_sgeqr2_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_dgeqr2_strided_batched(handle,m,n,A,lda,strideA,ipiv,strideP,batch_count) bind(c, name="rocsolver_dgeqr2_strided_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dgeqr2_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_cgeqr2_strided_batched(handle,m,n,A,lda,strideA,ipiv,strideP,batch_count) bind(c, name="rocsolver_cgeqr2_strided_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_cgeqr2_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_zgeqr2_strided_batched(handle,m,n,A,lda,strideA,ipiv,strideP,batch_count) bind(c, name="rocsolver_zgeqr2_strided_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_zgeqr2_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      integer(c_int),value :: batch_count
    end function

  ! ! \brief GELQ2 computes a LQ factorization of a general m-by-n matrix A.
  ! 
  !     \details
  !     (This is the unblocked version of the algorithm).
  ! 
  !     The factorization has the form
  ! 
  !         A = [ L 0 ]  Q
  !  
  !     where L is lower triangular (lower trapezoidal if m > n), and Q is 
  !     a n-by-n orthogonal matrix represented as the product of Householder matrices
  ! 
  !         Q = H(k)  H(k-1)  ...  H(1), with k = min(m,n)
  ! 
  !     Each Householder matrix H(i), for i = 1,2,...,k, is given by
  ! 
  !         H(i) = I - ipiv[i-1]  v(i)'  v(i)
  !     
  !     where the first i-1 elements of the Householder vector v(i) are zero, and v(i)[i] = 1. 
  ! 
  !     @param[in]
  !     handle    rocblas_handle.
  !     @param[in]
  !     m         rocblas_int. m >= 0.\n
  !               The number of rows of the matrix A.
  !     @param[in]
  !     n         rocblas_int. n >= 0.\n
  !               The number of colums of the matrix A.
  !     @param[inout]
  !     A         pointer to type. Array on the GPU of dimension ldan.\n
  !               On entry, the m-by-n matrix to be factored.
  !               On exit, the elements on and delow the diagonal contain the 
  !               factor L; the elements above the diagonal are the n - i elements
  !               of vector v(i) for i = 1,2,...,min(m,n).
  !     @param[in]
  !     lda       rocblas_int. lda >= m.\n
  !               Specifies the leading dimension of A. 
  !     @param[out]
  !     ipiv      pointer to type. Array on the GPU of dimension min(m,n).\n
  !               The scalar factors of the Householder matrices H(i).
  ! 
  !     
    function rocsolver_sgelq2(handle,m,n,A,lda,ipiv) bind(c, name="rocsolver_sgelq2")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_sgelq2
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
    end function

  
    function rocsolver_dgelq2(handle,m,n,A,lda,ipiv) bind(c, name="rocsolver_dgelq2")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dgelq2
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
    end function

  
    function rocsolver_cgelq2(handle,m,n,A,lda,ipiv) bind(c, name="rocsolver_cgelq2")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_cgelq2
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
    end function

  
    function rocsolver_zgelq2(handle,m,n,A,lda,ipiv) bind(c, name="rocsolver_zgelq2")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_zgelq2
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
    end function

  ! ! \brief GELQ2_BATCHED computes the LQ factorization of a batch of general m-by-n matrices.
  ! 
  !     \details
  !     (This is the unblocked version of the algorithm).
  ! 
  !     The factorization of matrix A_j in the batch has the form
  ! 
  !         A_j = [ L_j 0 ]  Q_j 
  ! 
  !     where L_j is lower triangular (lower trapezoidal if m > n), and Q_j is 
  !     a n-by-n orthogonal matrix represented as the product of Householder matrices
  ! 
  !         Q_j = H_j(k)  H_j(k-1)  ...  H_j(1), with k = min(m,n)
  ! 
  !     Each Householder matrices H_j(i), for j = 1,2,...,batch_count, and i = 1,2,...,k, is given by
  ! 
  !         H_j(i) = I - ipiv_j[i-1]  v_j(i)'  v_j(i)
  ! 
  !     where the first i-1 elements of Householder vector v_j(i) are zero, and v_j(i)[i] = 1. 
  ! 
  !     @param[in]
  !     handle    rocblas_handle.
  !     @param[in]
  !     m         rocblas_int. m >= 0.\n
  !               The number of rows of all the matrices A_j in the batch.
  !     @param[in]
  !     n         rocblas_int. n >= 0.\n
  !               The number of colums of all the matrices A_j in the batch.
  !     @param[inout]
  !     A         Array of pointers to type. Each pointer points to an array on the GPU of dimension ldan.\n
  !               On entry, the m-by-n matrices A_j to be factored.
  !               On exit, the elements on and below the diagonal contain the 
  !               factor L_j. The elements above the diagonal are the n - i elements
  !               of vector v_j(i) for i=1,2,...,min(m,n).
  !     @param[in]
  !     lda       rocblas_int. lda >= m.\n
  !               Specifies the leading dimension of matrices A_j. 
  !     @param[out]
  !     ipiv      pointer to type. Array on the GPU (the size depends on the value of strideP).\n
  !               Contains the vectors ipiv_j of scalar factors of the 
  !               Householder matrices H_j(i).
  !     @param[in]
  !     strideP   rocblas_stride.\n
  !               Stride from the start of one vector ipiv_j to the next one ipiv_(j+1). 
  !               There is no restriction for the value
  !               of strideP. Normal use is strideP >= min(m,n).
  !     @param[in]
  !     batch_count  rocblas_int. batch_count >= 0.\n
  !                  Number of matrices in the batch.
  ! 
  !     
    function rocsolver_sgelq2_batched(handle,m,n,A,lda,ipiv,strideP,batch_count) bind(c, name="rocsolver_sgelq2_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_sgelq2_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_dgelq2_batched(handle,m,n,A,lda,ipiv,strideP,batch_count) bind(c, name="rocsolver_dgelq2_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dgelq2_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_cgelq2_batched(handle,m,n,A,lda,ipiv,strideP,batch_count) bind(c, name="rocsolver_cgelq2_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_cgelq2_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_zgelq2_batched(handle,m,n,A,lda,ipiv,strideP,batch_count) bind(c, name="rocsolver_zgelq2_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_zgelq2_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      integer(c_int),value :: batch_count
    end function

  ! ! \brief GELQ2_STRIDED_BATCHED computes the LQ factorization of a batch of general m-by-n matrices.
  ! 
  !     \details
  !     (This is the unblocked version of the algorithm).
  ! 
  !     The factorization of matrix A_j in the batch has the form
  ! 
  !         A_j = [ L_j 0 ]  Q_j 
  ! 
  !     where L_j is lower triangular (lower trapezoidal if m > n), and Q_j is 
  !     a n-by-n orthogonal matrix represented as the product of Householder matrices
  ! 
  !         Q_j = H_j(k)  H_j(k-1)  ...  H_j(1), with k = min(m,n)
  ! 
  !     Each Householder matrices H_j(i), for j = 1,2,...,batch_count, and i = 1,2,...,k, is given by
  ! 
  !         H_j(i) = I - ipiv_j[i-1]  v_j(i)'  v_j(i)
  ! 
  !     where the first i-1 elements of vector Householder vector v_j(i) are zero, and v_j(i)[i] = 1. 
  ! 
  !     @param[in]
  !     handle    rocblas_handle.
  !     @param[in]
  !     m         rocblas_int. m >= 0.\n
  !               The number of rows of all the matrices A_j in the batch.
  !     @param[in]
  !     n         rocblas_int. n >= 0.\n
  !               The number of colums of all the matrices A_j in the batch.
  !     @param[inout]
  !     A         pointer to type. Array on the GPU (the size depends on the value of strideA).\n
  !               On entry, the m-by-n matrices A_j to be factored.
  !               On exit, the elements on and below the diagonal contain the 
  !               factor L_j. The elements above the diagonal are the n - i elements
  !               of vector v_j(i) for i = 1,2,...,min(m,n).
  !     @param[in]
  !     lda       rocblas_int. lda >= m.\n
  !               Specifies the leading dimension of matrices A_j. 
  !     @param[in]
  !     strideA   rocblas_stride.\n   
  !               Stride from the start of one matrix A_j and the next one A_(j+1). 
  !               There is no restriction for the value of strideA. Normal use case is strideA >= ldan.
  !     @param[out]
  !     ipiv      pointer to type. Array on the GPU (the size depends on the value of strideP).\n
  !               Contains the vectors ipiv_j of scalar factors of the 
  !               Householder matrices H_j(i).
  !     @param[in]
  !     strideP   rocblas_stride.\n
  !               Stride from the start of one vector ipiv_j to the next one ipiv_(j+1). 
  !               There is no restriction for the value
  !               of strideP. Normal use is strideP >= min(m,n).
  !     @param[in]
  !     batch_count  rocblas_int. batch_count >= 0.\n
  !                  Number of matrices in the batch.
  ! 
  !     
    function rocsolver_sgelq2_strided_batched(handle,m,n,A,lda,strideA,ipiv,strideP,batch_count) bind(c, name="rocsolver_sgelq2_strided_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_sgelq2_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_dgelq2_strided_batched(handle,m,n,A,lda,strideA,ipiv,strideP,batch_count) bind(c, name="rocsolver_dgelq2_strided_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dgelq2_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_cgelq2_strided_batched(handle,m,n,A,lda,strideA,ipiv,strideP,batch_count) bind(c, name="rocsolver_cgelq2_strided_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_cgelq2_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_zgelq2_strided_batched(handle,m,n,A,lda,strideA,ipiv,strideP,batch_count) bind(c, name="rocsolver_zgelq2_strided_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_zgelq2_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      integer(c_int),value :: batch_count
    end function

  ! ! \brief GEQRF computes a QR factorization of a general m-by-n matrix A.
  ! 
  !     \details
  !     (This is the blocked version of the algorithm).
  ! 
  !     The factorization has the form
  ! 
  !         A =  Q  [ R ]
  !                  [ 0 ]
  !  
  !     where R is upper triangular (upper trapezoidal if m < n), and Q is 
  !     a m-by-m orthogonal matrix represented as the product of Householder matrices
  ! 
  !         Q = H(1)  H(2)  ...  H(k), with k = min(m,n)
  ! 
  !     Each Householder matrix H(i), for i = 1,2,...,k, is given by
  ! 
  !         H(i) = I - ipiv[i-1]  v(i)  v(i)'
  !     
  !     where the first i-1 elements of the Householder vector v(i) are zero, and v(i)[i] = 1. 
  ! 
  !     @param[in]
  !     handle    rocblas_handle.
  !     @param[in]
  !     m         rocblas_int. m >= 0.\n
  !               The number of rows of the matrix A.
  !     @param[in]
  !     n         rocblas_int. n >= 0.\n
  !               The number of colums of the matrix A.
  !     @param[inout]
  !     A         pointer to type. Array on the GPU of dimension ldan.\n
  !               On entry, the m-by-n matrix to be factored.
  !               On exit, the elements on and above the diagonal contain the 
  !               factor R; the elements below the diagonal are the m - i elements
  !               of vector v(i) for i = 1,2,...,min(m,n).
  !     @param[in]
  !     lda       rocblas_int. lda >= m.\n
  !               Specifies the leading dimension of A. 
  !     @param[out]
  !     ipiv      pointer to type. Array on the GPU of dimension min(m,n).\n
  !               The scalar factors of the Householder matrices H(i).
  ! 
  !     
    function rocsolver_sgeqrf(handle,m,n,A,lda,ipiv) bind(c, name="rocsolver_sgeqrf")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_sgeqrf
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
    end function

  
    function rocsolver_dgeqrf(handle,m,n,A,lda,ipiv) bind(c, name="rocsolver_dgeqrf")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dgeqrf
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
    end function

  
    function rocsolver_cgeqrf(handle,m,n,A,lda,ipiv) bind(c, name="rocsolver_cgeqrf")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_cgeqrf
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
    end function

  
    function rocsolver_zgeqrf(handle,m,n,A,lda,ipiv) bind(c, name="rocsolver_zgeqrf")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_zgeqrf
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
    end function

  ! ! \brief GEQRF_BATCHED computes the QR factorization of a batch of general m-by-n matrices.
  ! 
  !     \details
  !     (This is the blocked version of the algorithm).
  ! 
  !     The factorization of matrix A_j in the batch has the form
  ! 
  !         A_j =  Q_j  [ R_j ]
  !                      [  0  ] 
  ! 
  !     where R_j is upper triangular (upper trapezoidal if m < n), and Q_j is 
  !     a m-by-m orthogonal matrix represented as the product of Householder matrices
  ! 
  !         Q_j = H_j(1)  H_j(2)  ...  H_j(k), with k = min(m,n)
  ! 
  !     Each Householder matrices H_j(i), for j = 1,2,...,batch_count, and i = 1,2,...,k, is given by
  ! 
  !         H_j(i) = I - ipiv_j[i-1]  v_j(i)  v_j(i)'
  ! 
  !     where the first i-1 elements of vector Householder vector v_j(i) are zero, and v_j(i)[i] = 1. 
  ! 
  !     @param[in]
  !     handle    rocblas_handle.
  !     @param[in]
  !     m         rocblas_int. m >= 0.\n
  !               The number of rows of all the matrices A_j in the batch.
  !     @param[in]
  !     n         rocblas_int. n >= 0.\n
  !               The number of colums of all the matrices A_j in the batch.
  !     @param[inout]
  !     A         Array of pointers to type. Each pointer points to an array on the GPU of dimension ldan.\n
  !               On entry, the m-by-n matrices A_j to be factored.
  !               On exit, the elements on and above the diagonal contain the 
  !               factor R_j. The elements below the diagonal are the m - i elements
  !               of vector v_j(i) for i=1,2,...,min(m,n).
  !     @param[in]
  !     lda       rocblas_int. lda >= m.\n
  !               Specifies the leading dimension of matrices A_j. 
  !     @param[out]
  !     ipiv      pointer to type. Array on the GPU (the size depends on the value of strideP).\n
  !               Contains the vectors ipiv_j of scalar factors of the 
  !               Householder matrices H_j(i).
  !     @param[in]
  !     strideP   rocblas_stride.\n
  !               Stride from the start of one vector ipiv_j to the next one ipiv_(j+1). 
  !               There is no restriction for the value
  !               of strideP. Normal use is strideP >= min(m,n).
  !     @param[in]
  !     batch_count  rocblas_int. batch_count >= 0.\n
  !                  Number of matrices in the batch.
  ! 
  !     
    function rocsolver_sgeqrf_batched(handle,m,n,A,lda,ipiv,strideP,batch_count) bind(c, name="rocsolver_sgeqrf_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_sgeqrf_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_dgeqrf_batched(handle,m,n,A,lda,ipiv,strideP,batch_count) bind(c, name="rocsolver_dgeqrf_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dgeqrf_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_cgeqrf_batched(handle,m,n,A,lda,ipiv,strideP,batch_count) bind(c, name="rocsolver_cgeqrf_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_cgeqrf_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_zgeqrf_batched(handle,m,n,A,lda,ipiv,strideP,batch_count) bind(c, name="rocsolver_zgeqrf_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_zgeqrf_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      integer(c_int),value :: batch_count
    end function

  ! ! \brief GEQRF_STRIDED_BATCHED computes the QR factorization of a batch of general m-by-n matrices.
  ! 
  !     \details
  !     (This is the blocked version of the algorithm).
  ! 
  !     The factorization of matrix A_j in the batch has the form
  ! 
  !         A_j =  Q_j  [ R_j ]
  !                      [  0  ] 
  ! 
  !     where R_j is upper triangular (upper trapezoidal if m < n), and Q_j is 
  !     a m-by-m orthogonal matrix represented as the product of Householder matrices
  ! 
  !         Q_j = H_j(1)  H_j(2)  ...  H_j(k), with k = min(m,n)
  ! 
  !     Each Householder matrices H_j(i), for j = 1,2,...,batch_count, and i = 1,2,...,k, is given by
  ! 
  !         H_j(i) = I - ipiv_j[i-1]  v_j(i)  v_j(i)'
  ! 
  !     where the first i-1 elements of vector Householder vector v_j(i) are zero, and v_j(i)[i] = 1. 
  ! 
  !     @param[in]
  !     handle    rocblas_handle.
  !     @param[in]
  !     m         rocblas_int. m >= 0.\n
  !               The number of rows of all the matrices A_j in the batch.
  !     @param[in]
  !     n         rocblas_int. n >= 0.\n
  !               The number of colums of all the matrices A_j in the batch.
  !     @param[inout]
  !     A         pointer to type. Array on the GPU (the size depends on the value of strideA).\n
  !               On entry, the m-by-n matrices A_j to be factored.
  !               On exit, the elements on and above the diagonal contain the 
  !               factor R_j. The elements below the diagonal are the m - i elements
  !               of vector v_j(i) for i = 1,2,...,min(m,n).
  !     @param[in]
  !     lda       rocblas_int. lda >= m.\n
  !               Specifies the leading dimension of matrices A_j. 
  !     @param[in]
  !     strideA   rocblas_stride.\n   
  !               Stride from the start of one matrix A_j and the next one A_(j+1). 
  !               There is no restriction for the value of strideA. Normal use case is strideA >= ldan.
  !     @param[out]
  !     ipiv      pointer to type. Array on the GPU (the size depends on the value of strideP).\n
  !               Contains the vectors ipiv_j of scalar factors of the 
  !               Householder matrices H_j(i).
  !     @param[in]
  !     strideP   rocblas_stride.\n
  !               Stride from the start of one vector ipiv_j to the next one ipiv_(j+1). 
  !               There is no restriction for the value
  !               of strideP. Normal use is strideP >= min(m,n).
  !     @param[in]
  !     batch_count  rocblas_int. batch_count >= 0.\n
  !                  Number of matrices in the batch.
  ! 
  !     
    function rocsolver_sgeqrf_strided_batched(handle,m,n,A,lda,strideA,ipiv,strideP,batch_count) bind(c, name="rocsolver_sgeqrf_strided_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_sgeqrf_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_dgeqrf_strided_batched(handle,m,n,A,lda,strideA,ipiv,strideP,batch_count) bind(c, name="rocsolver_dgeqrf_strided_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dgeqrf_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_cgeqrf_strided_batched(handle,m,n,A,lda,strideA,ipiv,strideP,batch_count) bind(c, name="rocsolver_cgeqrf_strided_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_cgeqrf_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_zgeqrf_strided_batched(handle,m,n,A,lda,strideA,ipiv,strideP,batch_count) bind(c, name="rocsolver_zgeqrf_strided_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_zgeqrf_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      integer(c_int),value :: batch_count
    end function

  ! ! \brief GELQF computes a LQ factorization of a general m-by-n matrix A.
  ! 
  !     \details
  !     (This is the blocked version of the algorithm).
  ! 
  !     The factorization has the form
  ! 
  !         A = [ L 0 ]  Q
  !  
  !     where L is lower triangular (lower trapezoidal if m > n), and Q is 
  !     a n-by-n orthogonal matrix represented as the product of Householder matrices
  ! 
  !         Q = H(k)  H(k-1)  ...  H(1), with k = min(m,n)
  ! 
  !     Each Householder matrix H(i), for i = 1,2,...,k, is given by
  ! 
  !         H(i) = I - ipiv[i-1]  v(i)'  v(i)
  !     
  !     where the first i-1 elements of the Householder vector v(i) are zero, and v(i)[i] = 1. 
  ! 
  !     @param[in]
  !     handle    rocblas_handle.
  !     @param[in]
  !     m         rocblas_int. m >= 0.\n
  !               The number of rows of the matrix A.
  !     @param[in]
  !     n         rocblas_int. n >= 0.\n
  !               The number of colums of the matrix A.
  !     @param[inout]
  !     A         pointer to type. Array on the GPU of dimension ldan.\n
  !               On entry, the m-by-n matrix to be factored.
  !               On exit, the elements on and delow the diagonal contain the 
  !               factor L; the elements above the diagonal are the n - i elements
  !               of vector v(i) for i = 1,2,...,min(m,n).
  !     @param[in]
  !     lda       rocblas_int. lda >= m.\n
  !               Specifies the leading dimension of A. 
  !     @param[out]
  !     ipiv      pointer to type. Array on the GPU of dimension min(m,n).\n
  !               The scalar factors of the Householder matrices H(i).
  ! 
  !     
    function rocsolver_sgelqf(handle,m,n,A,lda,ipiv) bind(c, name="rocsolver_sgelqf")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_sgelqf
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
    end function

  
    function rocsolver_dgelqf(handle,m,n,A,lda,ipiv) bind(c, name="rocsolver_dgelqf")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dgelqf
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
    end function

  
    function rocsolver_cgelqf(handle,m,n,A,lda,ipiv) bind(c, name="rocsolver_cgelqf")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_cgelqf
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
    end function

  
    function rocsolver_zgelqf(handle,m,n,A,lda,ipiv) bind(c, name="rocsolver_zgelqf")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_zgelqf
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
    end function

  ! ! \brief GELQF_BATCHED computes the LQ factorization of a batch of general m-by-n matrices.
  ! 
  !     \details
  !     (This is the blocked version of the algorithm).
  ! 
  !     The factorization of matrix A_j in the batch has the form
  ! 
  !         A_j = [ L_j 0 ]  Q_j 
  ! 
  !     where L_j is lower triangular (lower trapezoidal if m > n), and Q_j is 
  !     a n-by-n orthogonal matrix represented as the product of Householder matrices
  ! 
  !         Q_j = H_j(k)  H_j(k-1)  ...  H_j(1), with k = min(m,n)
  ! 
  !     Each Householder matrices H_j(i), for j = 1,2,...,batch_count, and i = 1,2,...,k, is given by
  ! 
  !         H_j(i) = I - ipiv_j[i-1]  v_j(i)'  v_j(i)
  ! 
  !     where the first i-1 elements of Householder vector v_j(i) are zero, and v_j(i)[i] = 1. 
  ! 
  !     @param[in]
  !     handle    rocblas_handle.
  !     @param[in]
  !     m         rocblas_int. m >= 0.\n
  !               The number of rows of all the matrices A_j in the batch.
  !     @param[in]
  !     n         rocblas_int. n >= 0.\n
  !               The number of colums of all the matrices A_j in the batch.
  !     @param[inout]
  !     A         Array of pointers to type. Each pointer points to an array on the GPU of dimension ldan.\n
  !               On entry, the m-by-n matrices A_j to be factored.
  !               On exit, the elements on and below the diagonal contain the 
  !               factor L_j. The elements above the diagonal are the n - i elements
  !               of vector v_j(i) for i=1,2,...,min(m,n).
  !     @param[in]
  !     lda       rocblas_int. lda >= m.\n
  !               Specifies the leading dimension of matrices A_j. 
  !     @param[out]
  !     ipiv      pointer to type. Array on the GPU (the size depends on the value of strideP).\n
  !               Contains the vectors ipiv_j of scalar factors of the 
  !               Householder matrices H_j(i).
  !     @param[in]
  !     strideP   rocblas_stride.\n
  !               Stride from the start of one vector ipiv_j to the next one ipiv_(j+1). 
  !               There is no restriction for the value
  !               of strideP. Normal use is strideP >= min(m,n).
  !     @param[in]
  !     batch_count  rocblas_int. batch_count >= 0.\n
  !                  Number of matrices in the batch.
  ! 
  !     
    function rocsolver_sgelqf_batched(handle,m,n,A,lda,ipiv,strideP,batch_count) bind(c, name="rocsolver_sgelqf_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_sgelqf_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_dgelqf_batched(handle,m,n,A,lda,ipiv,strideP,batch_count) bind(c, name="rocsolver_dgelqf_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dgelqf_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_cgelqf_batched(handle,m,n,A,lda,ipiv,strideP,batch_count) bind(c, name="rocsolver_cgelqf_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_cgelqf_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_zgelqf_batched(handle,m,n,A,lda,ipiv,strideP,batch_count) bind(c, name="rocsolver_zgelqf_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_zgelqf_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      integer(c_int),value :: batch_count
    end function

  ! ! \brief GELQF_STRIDED_BATCHED computes the LQ factorization of a batch of general m-by-n matrices.
  ! 
  !     \details
  !     (This is the blocked version of the algorithm).
  ! 
  !     The factorization of matrix A_j in the batch has the form
  ! 
  !         A_j = [ L_j 0 ]  Q_j 
  ! 
  !     where L_j is lower triangular (lower trapezoidal if m > n), and Q_j is 
  !     a n-by-n orthogonal matrix represented as the product of Householder matrices
  ! 
  !         Q_j = H_j(k)  H_j(k-1)  ...  H_j(1), with k = min(m,n)
  ! 
  !     Each Householder matrices H_j(i), for j = 1,2,...,batch_count, and i = 1,2,...,k, is given by
  ! 
  !         H_j(i) = I - ipiv_j[i-1]  v_j(i)'  v_j(i)
  ! 
  !     where the first i-1 elements of vector Householder vector v_j(i) are zero, and v_j(i)[i] = 1. 
  ! 
  !     @param[in]
  !     handle    rocblas_handle.
  !     @param[in]
  !     m         rocblas_int. m >= 0.\n
  !               The number of rows of all the matrices A_j in the batch.
  !     @param[in]
  !     n         rocblas_int. n >= 0.\n
  !               The number of colums of all the matrices A_j in the batch.
  !     @param[inout]
  !     A         pointer to type. Array on the GPU (the size depends on the value of strideA).\n
  !               On entry, the m-by-n matrices A_j to be factored.
  !               On exit, the elements on and below the diagonal contain the 
  !               factor L_j. The elements above the diagonal are the n - i elements
  !               of vector v_j(i) for i = 1,2,...,min(m,n).
  !     @param[in]
  !     lda       rocblas_int. lda >= m.\n
  !               Specifies the leading dimension of matrices A_j. 
  !     @param[in]
  !     strideA   rocblas_stride.\n   
  !               Stride from the start of one matrix A_j and the next one A_(j+1). 
  !               There is no restriction for the value of strideA. Normal use case is strideA >= ldan.
  !     @param[out]
  !     ipiv      pointer to type. Array on the GPU (the size depends on the value of strideP).\n
  !               Contains the vectors ipiv_j of scalar factors of the 
  !               Householder matrices H_j(i).
  !     @param[in]
  !     strideP   rocblas_stride.\n
  !               Stride from the start of one vector ipiv_j to the next one ipiv_(j+1). 
  !               There is no restriction for the value
  !               of strideP. Normal use is strideP >= min(m,n).
  !     @param[in]
  !     batch_count  rocblas_int. batch_count >= 0.\n
  !                  Number of matrices in the batch.
  ! 
  !     
    function rocsolver_sgelqf_strided_batched(handle,m,n,A,lda,strideA,ipiv,strideP,batch_count) bind(c, name="rocsolver_sgelqf_strided_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_sgelqf_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_dgelqf_strided_batched(handle,m,n,A,lda,strideA,ipiv,strideP,batch_count) bind(c, name="rocsolver_dgelqf_strided_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dgelqf_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_cgelqf_strided_batched(handle,m,n,A,lda,strideA,ipiv,strideP,batch_count) bind(c, name="rocsolver_cgelqf_strided_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_cgelqf_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_zgelqf_strided_batched(handle,m,n,A,lda,strideA,ipiv,strideP,batch_count) bind(c, name="rocsolver_zgelqf_strided_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_zgelqf_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: m
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      integer(c_int),value :: batch_count
    end function

  ! ! \brief GETRS solves a system of n linear equations on n variables using the LU factorization computed by GETRF.
  ! 
  !     \details
  !     It solves one of the following systems: 
  ! 
  !         A   X = B (no transpose),  
  !         A'  X = B (transpose),  or  
  !         A  X = B (conjugate transpose)
  ! 
  !     depending on the value of trans. 
  ! 
  !     @param[in]
  !     handle      rocblas_handle.
  !     @param[in]
  !     trans       rocblas_operation.\n
  !                 Specifies the form of the system of equations. 
  !     @param[in]
  !     n           rocblas_int. n >= 0.\n
  !                 The order of the system, i.e. the number of columns and rows of A.  
  !     @param[in]
  !     nrhs        rocblas_int. nrhs >= 0.\n
  !                 The number of right hand sides, i.e., the number of columns
  !                 of the matrix B.
  !     @param[in]
  !     A           pointer to type. Array on the GPU of dimension ldan.\n
  !                 The factors L and U of the factorization A = PLU returned by GETRF.
  !     @param[in]
  !     lda         rocblas_int. lda >= n.\n
  !                 The leading dimension of A.  
  !     @param[in]
  !     ipiv        pointer to rocblas_int. Array on the GPU of dimension n.\n
  !                 The pivot indices returned by GETRF.
  !     @param[in,out]
  !     B           pointer to type. Array on the GPU of dimension ldbnrhs.\n
  !                 On entry, the right hand side matrix B.
  !                 On exit, the solution matrix X.
  !     @param[in]
  !     ldb         rocblas_int. ldb >= n.\n
  !                 The leading dimension of B.
  ! 
  !    
    function rocsolver_sgetrs(handle,n,lda,ldb) bind(c, name="rocsolver_sgetrs")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_sgetrs
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: lda
      integer(c_int),value :: ldb
    end function

  
    function rocsolver_dgetrs(handle,n,lda,ldb) bind(c, name="rocsolver_dgetrs")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dgetrs
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: lda
      integer(c_int),value :: ldb
    end function

  
    function rocsolver_cgetrs(handle,n,lda,ldb) bind(c, name="rocsolver_cgetrs")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_cgetrs
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: lda
      integer(c_int),value :: ldb
    end function

  
    function rocsolver_zgetrs(handle,n,lda,ldb) bind(c, name="rocsolver_zgetrs")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_zgetrs
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: lda
      integer(c_int),value :: ldb
    end function

  ! ! \brief GETRS_BATCHED solves a batch of systems of n linear equations on n variables 
  !      using the LU factorization computed by GETRF_BATCHED.
  ! 
  !     \details
  !     For each instance j in the batch, it solves one of the following systems: 
  ! 
  !         A_j   X_j = B_j (no transpose),  
  !         A_j'  X_j = B_j (transpose),  or  
  !         A_j  X_j = B_j (conjugate transpose)
  ! 
  !     depending on the value of trans. 
  ! 
  !     @param[in]
  !     handle      rocblas_handle.
  !     @param[in]
  !     trans       rocblas_operation.\n
  !                 Specifies the form of the system of equations of each instance in the batch. 
  !     @param[in]
  !     n           rocblas_int. n >= 0.\n
  !                 The order of the system, i.e. the number of columns and rows of all A_j matrices.  
  !     @param[in]
  !     nrhs        rocblas_int. nrhs >= 0.\n
  !                 The number of right hand sides, i.e., the number of columns
  !                 of all the matrices B_j.
  !     @param[in]
  !     A           Array of pointers to type. Each pointer points to an array on the GPU of dimension ldan.\n
  !                 The factors L_j and U_j of the factorization A_j = P_jL_jU_j returned by GETRF_BATCHED.
  !     @param[in]
  !     lda         rocblas_int. lda >= n.\n
  !                 The leading dimension of matrices A_j.
  !     @param[in]
  !     ipiv        pointer to rocblas_int. Array on the GPU (the size depends on the value of strideP).\n
  !                 Contains the vectors ipiv_j of pivot indices returned by GETRF_BATCHED.
  !     @param[in]
  !     strideP     rocblas_stride.\n
  !                 Stride from the start of one vector ipiv_j to the next one ipiv_(j+1).
  !                 There is no restriction for the value of strideP. Normal use case is strideP >= min(m,n).
  !     @param[in,out]
  !     B           Array of pointers to type. Each pointer points to an array on the GPU of dimension ldbnrhs.\n 
  !                 On entry, the right hand side matrices B_j.
  !                 On exit, the solution matrix X_j of each system in the batch.
  !     @param[in]
  !     ldb         rocblas_int. ldb >= n.\n
  !                 The leading dimension of matrices B_j.
  !     @param[in]
  !     batch_count rocblas_int. batch_count >= 0.\n
  !                 Number of instances (systems) in the batch. 
  ! 
  !    
    function rocsolver_sgetrs_batched(handle,n,lda,batch_count) bind(c, name="rocsolver_sgetrs_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_sgetrs_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: lda
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_dgetrs_batched(handle,n,lda,batch_count) bind(c, name="rocsolver_dgetrs_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dgetrs_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: lda
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_cgetrs_batched(handle,n,lda,ipiv,strideP,B,batch_count) bind(c, name="rocsolver_cgetrs_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_cgetrs_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      type(c_ptr) :: B
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_zgetrs_batched(handle,n,lda,ipiv,strideP,B,batch_count) bind(c, name="rocsolver_zgetrs_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_zgetrs_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: lda
      type(c_ptr),value :: ipiv
      integer(c_int64_t),value :: strideP
      type(c_ptr) :: B
      integer(c_int),value :: batch_count
    end function

  ! ! \brief GETRS_STRIDED_BATCHED solves a batch of systems of n linear equations on n variables 
  !      using the LU factorization computed by GETRF_STRIDED_BATCHED.
  ! 
  !     \details
  !     For each instance j in the batch, it solves one of the following systems: 
  ! 
  !         A_j   X_j = B_j (no transpose),  
  !         A_j'  X_j = B_j (transpose),  or  
  !         A_j  X_j = B_j (conjugate transpose)
  ! 
  !     depending on the value of trans. 
  ! 
  !     @param[in]
  !     handle      rocblas_handle.
  !     @param[in]
  !     trans       rocblas_operation.\n
  !                 Specifies the form of the system of equations of each instance in the batch. 
  !     @param[in]
  !     n           rocblas_int. n >= 0.\n
  !                 The order of the system, i.e. the number of columns and rows of all A_j matrices.  
  !     @param[in]
  !     nrhs        rocblas_int. nrhs >= 0.\n
  !                 The number of right hand sides, i.e., the number of columns
  !                 of all the matrices B_j.
  !     @param[in]
  !     A           pointer to type. Array on the GPU (the size depends on the value of strideA).\n
  !                 The factors L_j and U_j of the factorization A_j = P_jL_jU_j returned by GETRF_STRIDED_BATCHED.
  !     @param[in]
  !     lda         rocblas_int. lda >= n.\n
  !                 The leading dimension of matrices A_j.
  !     @param[in]
  !     strideA     rocblas_stride.\n
  !                 Stride from the start of one matrix A_j and the next one A_(j+1). 
  !                 There is no restriction for the value of strideA. Normal use case is strideA >= ldan.
  !     @param[in]
  !     ipiv        pointer to rocblas_int. Array on the GPU (the size depends on the value of strideP).\n
  !                 Contains the vectors ipiv_j of pivot indices returned by GETRF_STRIDED_BATCHED.
  !     @param[in]
  !     strideP     rocblas_stride.\n
  !                 Stride from the start of one vector ipiv_j to the next one ipiv_(j+1).
  !                 There is no restriction for the value of strideP. Normal use case is strideP >= min(m,n).
  !     @param[in,out]
  !     B           pointer to type. Array on the GPU (size depends on the value of strideB).\n
  !                 On entry, the right hand side matrices B_j.
  !                 On exit, the solution matrix X_j of each system in the batch.
  !     @param[in]
  !     ldb         rocblas_int. ldb >= n.\n
  !                 The leading dimension of matrices B_j.
  !     @param[in]
  !     strideB     rocblas_stride.\n
  !                 Stride from the start of one matrix B_j and the next one B_(j+1). 
  !                 There is no restriction for the value of strideB. Normal use case is strideB >= ldbnrhs.
  !     @param[in]
  !     batch_count rocblas_int. batch_count >= 0.\n
  !                 Number of instances (systems) in the batch. 
  ! 
  !    
    function rocsolver_sgetrs_strided_batched(handle,n,lda,strideA,batch_count) bind(c, name="rocsolver_sgetrs_strided_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_sgetrs_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_dgetrs_strided_batched(handle,n,lda,strideA,batch_count) bind(c, name="rocsolver_dgetrs_strided_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dgetrs_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_cgetrs_strided_batched(handle,n,lda,strideA,ldb,batch_count) bind(c, name="rocsolver_cgetrs_strided_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_cgetrs_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      integer(c_int),value :: ldb
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_zgetrs_strided_batched(handle,n,lda,strideA,ldb,batch_count) bind(c, name="rocsolver_zgetrs_strided_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_zgetrs_strided_batched
      type(c_ptr),value :: handle
      integer(c_int),value :: n
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      integer(c_int),value :: ldb
      integer(c_int),value :: batch_count
    end function

  ! ! \brief POTF2 computes the Cholesky factorization of a real symmetric
  !     positive definite matrix A.
  ! 
  !     \details
  !     (This is the unblocked version of the algorithm). 
  ! 
  !     The factorization has the form:
  ! 
  !         A = U'  U, or
  !         A = L   L'
  ! 
  !     depending on the value of uplo. U is an upper triangular matrix and L is lower triangular.
  ! 
  !     @param[in]
  !     handle    rocblas_handle.
  !     @param[in]
  !     uplo      rocblas_fill.\n
  !               Specifies whether the factorization is upper or lower triangular.
  !               If uplo indicates lower (or upper), then the upper (or lower) part of A is not used.
  !     @param[in]
  !     n         rocblas_int. n >= 0.\n
  !               The matrix dimensions.
  !     @param[inout]
  !     A         pointer to type. Array on the GPU of dimension ldan.\n
  !               On entry, the matrix A to be factored. On exit, the lower or upper triangular factor.
  !     @param[in]
  !     lda       rocblas_int. lda >= n.\n
  !               specifies the leading dimension of A.
  !     @param[out]
  !     info      pointer to a rocblas_int on the GPU.\n
  !               If info = 0, succesful factorization of matrix A. 
  !               If info = i > 0, the leading minor of order i of A is not positive definite. 
  !               The factorization stopped at this point.
  ! 
  !     
    function rocsolver_spotf2(handle,uplo,n,A,lda,info) bind(c, name="rocsolver_spotf2")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_spotf2
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: info
    end function

  
    function rocsolver_dpotf2(handle,uplo,n,A,lda,info) bind(c, name="rocsolver_dpotf2")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dpotf2
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: info
    end function

  ! ! \brief POTF2_BATCHED computes the Cholesky factorization of a 
  !     batch of real symmetric positive definite matrices.
  ! 
  !     \details
  !     (This is the unblocked version of the algorithm). 
  ! 
  !     The factorization of matrix A_i in the batch has the form:
  ! 
  !         A_i = U_i'  U_i, or
  !         A_i = L_i   L_i'
  ! 
  !     depending on the value of uplo. U_i is an upper triangular matrix and L_i is lower triangular.
  ! 
  !     @param[in]
  !     handle    rocblas_handle.
  !     @param[in]
  !     uplo      rocblas_fill.\n
  !               Specifies whether the factorization is upper or lower triangular.
  !               If uplo indicates lower (or upper), then the upper (or lower) part of A is not used.
  !     @param[in]
  !     n         rocblas_int. n >= 0.\n
  !               The dimension of matrix A_i.
  !     @param[inout]
  !     A         array of pointers to type. Each pointer points to an array on the GPU of dimension ldan.\n
  !               On entry, the matrices A_i to be factored. On exit, the upper or lower triangular factors. 
  !     @param[in]
  !     lda       rocblas_int. lda >= n.\n
  !               specifies the leading dimension of A_i.
  !     @param[out]
  !     info      pointer to rocblas_int. Array of batch_count integers on the GPU.\n
  !               If info_i = 0, succesful factorization of matrix A_i. 
  !               If info_i = j > 0, the leading minor of order j of A_i is not positive definite. 
  !               The i-th factorization stopped at this point.
  !     @param[in]
  !     batch_count rocblas_int. batch_count >= 0.\n
  !                 Number of matrices in the batch. 
  ! 
  !     
    function rocsolver_spotf2_batched(handle,uplo,n,A,lda,info,batch_count) bind(c, name="rocsolver_spotf2_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_spotf2_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_dpotf2_batched(handle,uplo,n,A,lda,info,batch_count) bind(c, name="rocsolver_dpotf2_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dpotf2_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  ! ! \brief POTF2_STRIDED_BATCHED computes the Cholesky factorization of a 
  !     batch of real symmetric positive definite matrices.
  ! 
  !     \details
  !     (This is the unblocked version of the algorithm). 
  ! 
  !     The factorization of matrix A_i in the batch has the form:
  ! 
  !         A_i = U_i'  U_i, or
  !         A_i = L_i   L_i'
  ! 
  !     depending on the value of uplo. U_i is an upper triangular matrix and L_i is lower triangular.
  ! 
  !     @param[in]
  !     handle    rocblas_handle.
  !     @param[in]
  !     uplo      rocblas_fill.\n
  !               Specifies whether the factorization is upper or lower triangular.
  !               If uplo indicates lower (or upper), then the upper (or lower) part of A is not used.
  !     @param[in]
  !     n         rocblas_int. n >= 0.\n
  !               The dimension of matrix A_i.
  !     @param[inout]
  !     A         pointer to type. Array on the GPU (the size depends on the value of strideA).\n
  !               On entry, the matrices A_i to be factored. On exit, the upper or lower triangular factors. 
  !     @param[in]
  !     lda       rocblas_int. lda >= n.\n
  !               specifies the leading dimension of A_i.
  !     @param[in]
  !     strideA   rocblas_stride.\n
  !               Stride from the start of one matrix A_i and the next one A_(i+1). 
  !               There is no restriction for the value of strideA. Normal use case is strideA >= ldan.
  !     @param[out]
  !     info      pointer to rocblas_int. Array of batch_count integers on the GPU.\n
  !               If info_i = 0, succesful factorization of matrix A_i. 
  !               If info_i = j > 0, the leading minor of order j of A_i is not positive definite. 
  !               The i-th factorization stopped at this point.
  !     @param[in]
  !     batch_count rocblas_int. batch_count >= 0.\n
  !                 Number of matrices in the batch. 
  ! 
  !     
    function rocsolver_spotf2_strided_batched(handle,uplo,n,A,lda,strideA,info,batch_count) bind(c, name="rocsolver_spotf2_strided_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_spotf2_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_dpotf2_strided_batched(handle,uplo,n,A,lda,strideA,info,batch_count) bind(c, name="rocsolver_dpotf2_strided_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dpotf2_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  ! ! \brief POTRF computes the Cholesky factorization of a real symmetric
  !     positive definite matrix A.
  ! 
  !     \details
  !     (This is the blocked version of the algorithm). 
  ! 
  !     The factorization has the form:
  ! 
  !         A = U'  U, or
  !         A = L   L'
  ! 
  !     depending on the value of uplo. U is an upper triangular matrix and L is lower triangular.
  ! 
  !     @param[in]
  !     handle    rocblas_handle.
  !     @param[in]
  !     uplo      rocblas_fill.\n
  !               Specifies whether the factorization is upper or lower triangular.
  !               If uplo indicates lower (or upper), then the upper (or lower) part of A is not used.
  !     @param[in]
  !     n         rocblas_int. n >= 0.\n
  !               The matrix dimensions.
  !     @param[inout]
  !     A         pointer to type. Array on the GPU of dimension ldan.\n
  !               On entry, the matrix A to be factored. On exit, the lower or upper triangular factor.
  !     @param[in]
  !     lda       rocblas_int. lda >= n.\n
  !               specifies the leading dimension of A.
  !     @param[out]
  !     info      pointer to a rocblas_int on the GPU.\n
  !               If info = 0, succesful factorization of matrix A. 
  !               If info = i > 0, the leading minor of order i of A is not positive definite. 
  !               The factorization stopped at this point.
  ! 
  !     
    function rocsolver_spotrf(handle,uplo,n,A,lda,info) bind(c, name="rocsolver_spotrf")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_spotrf
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: info
    end function

  
    function rocsolver_dpotrf(handle,uplo,n,A,lda,info) bind(c, name="rocsolver_dpotrf")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dpotrf
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: info
    end function

  ! ! \brief POTRF_BATCHED computes the Cholesky factorization of a 
  !     batch of real symmetric positive definite matrices.
  ! 
  !     \details
  !     (This is the blocked version of the algorithm). 
  ! 
  !     The factorization of matrix A_i in the batch has the form:
  ! 
  !         A_i = U_i'  U_i, or
  !         A_i = L_i   L_i'
  ! 
  !     depending on the value of uplo. U_i is an upper triangular matrix and L_i is lower triangular.
  ! 
  !     @param[in]
  !     handle    rocblas_handle.
  !     @param[in]
  !     uplo      rocblas_fill.\n
  !               Specifies whether the factorization is upper or lower triangular.
  !               If uplo indicates lower (or upper), then the upper (or lower) part of A is not used.
  !     @param[in]
  !     n         rocblas_int. n >= 0.\n
  !               The dimension of matrix A_i.
  !     @param[inout]
  !     A         array of pointers to type. Each pointer points to an array on the GPU of dimension ldan.\n
  !               On entry, the matrices A_i to be factored. On exit, the upper or lower triangular factors. 
  !     @param[in]
  !     lda       rocblas_int. lda >= n.\n
  !               specifies the leading dimension of A_i.
  !     @param[out]
  !     info      pointer to rocblas_int. Array of batch_count integers on the GPU.\n
  !               If info_i = 0, succesful factorization of matrix A_i. 
  !               If info_i = j > 0, the leading minor of order j of A_i is not positive definite. 
  !               The i-th factorization stopped at this point.
  !     @param[in]
  !     batch_count rocblas_int. batch_count >= 0.\n
  !                 Number of matrices in the batch. 
  ! 
  !     
    function rocsolver_spotrf_batched(handle,uplo,n,A,lda,info,batch_count) bind(c, name="rocsolver_spotrf_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_spotrf_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_dpotrf_batched(handle,uplo,n,A,lda,info,batch_count) bind(c, name="rocsolver_dpotrf_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dpotrf_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr) :: A
      integer(c_int),value :: lda
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  ! ! \brief POTRF_STRIDED_BATCHED computes the Cholesky factorization of a 
  !     batch of real symmetric positive definite matrices.
  ! 
  !     \details
  !     (This is the blocked version of the algorithm). 
  ! 
  !     The factorization of matrix A_i in the batch has the form:
  ! 
  !         A_i = U_i'  U_i, or
  !         A_i = L_i   L_i'
  ! 
  !     depending on the value of uplo. U_i is an upper triangular matrix and L_i is lower triangular.
  ! 
  !     @param[in]
  !     handle    rocblas_handle.
  !     @param[in]
  !     uplo      rocblas_fill.\n
  !               Specifies whether the factorization is upper or lower triangular.
  !               If uplo indicates lower (or upper), then the upper (or lower) part of A is not used.
  !     @param[in]
  !     n         rocblas_int. n >= 0.\n
  !               The dimension of matrix A_i.
  !     @param[inout]
  !     A         pointer to type. Array on the GPU (the size depends on the value of strideA).\n
  !               On entry, the matrices A_i to be factored. On exit, the upper or lower triangular factors. 
  !     @param[in]
  !     lda       rocblas_int. lda >= n.\n
  !               specifies the leading dimension of A_i.
  !     @param[in]
  !     strideA   rocblas_stride.\n
  !               Stride from the start of one matrix A_i and the next one A_(i+1). 
  !               There is no restriction for the value of strideA. Normal use case is strideA >= ldan.
  !     @param[out]
  !     info      pointer to rocblas_int. Array of batch_count integers on the GPU.\n
  !               If info_i = 0, succesful factorization of matrix A_i. 
  !               If info_i = j > 0, the leading minor of order j of A_i is not positive definite. 
  !               The i-th factorization stopped at this point.
  !     @param[in]
  !     batch_count rocblas_int. batch_count >= 0.\n
  !                 Number of matrices in the batch. 
  ! 
  !     
    function rocsolver_spotrf_strided_batched(handle,uplo,n,A,lda,strideA,info,batch_count) bind(c, name="rocsolver_spotrf_strided_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_spotrf_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  
    function rocsolver_dpotrf_strided_batched(handle,uplo,n,A,lda,strideA,info,batch_count) bind(c, name="rocsolver_dpotrf_strided_batched")
      use iso_c_binding
      use hipfort_rocsolver_enums
      implicit none
      integer(kind(rocblas_status_success)) :: rocsolver_dpotrf_strided_batched
      type(c_ptr),value :: handle
      integer(kind(rocblas_fill_upper)),value :: uplo
      integer(c_int),value :: n
      type(c_ptr),value :: A
      integer(c_int),value :: lda
      integer(c_int64_t),value :: strideA
      type(c_ptr),value :: info
      integer(c_int),value :: batch_count
    end function

  end interface
  
end module hipfort_rocsolver