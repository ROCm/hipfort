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

module hipfort_handles
  use, intrinsic :: iso_c_binding
  implicit none

  type, bind(c) :: bsric02Info_t
    type(c_ptr) :: ptr
  end type bsric02Info_t

  type, bind(c) :: bsrilu02Info_t
    type(c_ptr) :: ptr
  end type bsrilu02Info_t

  type, bind(c) :: bsrsm2Info_t
    type(c_ptr) :: ptr
  end type bsrsm2Info_t

  type, bind(c) :: bsrsv2Info_t
    type(c_ptr) :: ptr
  end type bsrsv2Info_t

  type, bind(c) :: csrcolor_t
    type(c_ptr) :: ptr
  end type csrcolor_t

  type, bind(c) :: csrgemm2Info_t
    type(c_ptr) :: ptr
  end type csrgemm2Info_t

  type, bind(c) :: csric02Info_t
    type(c_ptr) :: ptr
  end type csric02Info_t

  type, bind(c) :: csrilu02Info_t
    type(c_ptr) :: ptr
  end type csrilu02Info_t

  type, bind(c) :: csrsm2Info_t
    type(c_ptr) :: ptr
  end type csrsm2Info_t

  type, bind(c) :: csrsv2Info_t
    type(c_ptr) :: ptr
  end type csrsv2Info_t

  type, bind(c) :: fftw_plan_t
    type(c_ptr) :: ptr
  end type fftw_plan_t

  type, bind(c) :: fftwf_plan_t
    type(c_ptr) :: ptr
  end type fftwf_plan_t

  type, bind(c) :: hipCtx_t
    type(c_ptr) :: ptr
  end type hipCtx_t

  type, bind(c) :: hipEvent_t
    type(c_ptr) :: ptr
  end type hipEvent_t

  type, bind(c) :: hipExternalMemory_t
    type(c_ptr) :: ptr
  end type hipExternalMemory_t

  type, bind(c) :: hipExternalSemaphore_t
    type(c_ptr) :: ptr
  end type hipExternalSemaphore_t

  type, bind(c) :: hipFunction_t
    type(c_ptr) :: ptr
  end type hipFunction_t

  type, bind(c) :: hipGraphExec_t
    type(c_ptr) :: ptr
  end type hipGraphExec_t

  type, bind(c) :: hipGraphNode_t
    type(c_ptr) :: ptr
  end type hipGraphNode_t

  type, bind(c) :: hipGraph_t
    type(c_ptr) :: ptr
  end type hipGraph_t

  type, bind(c) :: hipMemPool_t
    type(c_ptr) :: ptr
  end type hipMemPool_t

  type, bind(c) :: hipModuleSymbol_t
    type(c_ptr) :: ptr
  end type hipModuleSymbol_t

  type, bind(c) :: hipModule_t
    type(c_ptr) :: ptr
  end type hipModule_t

  type, bind(c) :: hipStream_t
    type(c_ptr) :: ptr
  end type hipStream_t

  type, bind(c) :: hipUserObject_t
    type(c_ptr) :: ptr
  end type hipUserObject_t

  type, bind(c) :: hipblasHandle_t
    type(c_ptr) :: ptr
  end type hipblasHandle_t

  type, bind(c) :: hipfftHandle_t
    type(c_ptr) :: ptr
  end type hipfftHandle_t

  type, bind(c) :: hiprandDiscreteDistribution_t
    type(c_ptr) :: ptr
  end type hiprandDiscreteDistribution_t

  type, bind(c) :: hiprandGenerator_t
    type(c_ptr) :: ptr
  end type hiprandGenerator_t

  type, bind(c) :: hipsolverDnHandle_t
    type(c_ptr) :: ptr
  end type hipsolverDnHandle_t

  type, bind(c) :: hipsolverGesvdjInfo_t
    type(c_ptr) :: ptr
  end type hipsolverGesvdjInfo_t

  type, bind(c) :: hipsolverHandle_t
    type(c_ptr) :: ptr
  end type hipsolverHandle_t

  type, bind(c) :: hipsolverRfHandle_t
    type(c_ptr) :: ptr
  end type hipsolverRfHandle_t

  type, bind(c) :: hipsolverSpHandle_t
    type(c_ptr) :: ptr
  end type hipsolverSpHandle_t

  type, bind(c) :: hipsolverSyevjInfo_t
    type(c_ptr) :: ptr
  end type hipsolverSyevjInfo_t

  type, bind(c) :: hipsparseConstDnMatDescr_t
    type(c_ptr) :: ptr
  end type hipsparseConstDnMatDescr_t

  type, bind(c) :: hipsparseConstDnVecDescr_t
    type(c_ptr) :: ptr
  end type hipsparseConstDnVecDescr_t

  type, bind(c) :: hipsparseConstSpMatDescr_t
    type(c_ptr) :: ptr
  end type hipsparseConstSpMatDescr_t

  type, bind(c) :: hipsparseConstSpVecDescr_t
    type(c_ptr) :: ptr
  end type hipsparseConstSpVecDescr_t

  type, bind(c) :: hipsparseDnMatDescr_t
    type(c_ptr) :: ptr
  end type hipsparseDnMatDescr_t

  type, bind(c) :: hipsparseDnVecDescr_t
    type(c_ptr) :: ptr
  end type hipsparseDnVecDescr_t

  type, bind(c) :: hipsparseHandle_t
    type(c_ptr) :: ptr
  end type hipsparseHandle_t

  type, bind(c) :: hipsparseHybMat_t
    type(c_ptr) :: ptr
  end type hipsparseHybMat_t

  type, bind(c) :: hipsparseMatDescr_t
    type(c_ptr) :: ptr
  end type hipsparseMatDescr_t

  type, bind(c) :: hipsparseSpGEMMDescr_t
    type(c_ptr) :: ptr
  end type hipsparseSpGEMMDescr_t

  type, bind(c) :: hipsparseSpMatDescr_t
    type(c_ptr) :: ptr
  end type hipsparseSpMatDescr_t

  type, bind(c) :: hipsparseSpSMDescr_t
    type(c_ptr) :: ptr
  end type hipsparseSpSMDescr_t

  type, bind(c) :: hipsparseSpSVDescr_t
    type(c_ptr) :: ptr
  end type hipsparseSpSVDescr_t

  type, bind(c) :: hipsparseSpVecDescr_t
    type(c_ptr) :: ptr
  end type hipsparseSpVecDescr_t

  type, bind(c) :: pruneInfo_t
    type(c_ptr) :: ptr
  end type pruneInfo_t

  type, bind(c) :: rocblas_handle_t
    type(c_ptr) :: ptr
  end type rocblas_handle_t

  type, bind(c) :: rocfft_brick_t
    type(c_ptr) :: ptr
  end type rocfft_brick_t

  type, bind(c) :: rocfft_execution_info_t
    type(c_ptr) :: ptr
  end type rocfft_execution_info_t

  type, bind(c) :: rocfft_field_t
    type(c_ptr) :: ptr
  end type rocfft_field_t

  type, bind(c) :: rocfft_plan_description_t
    type(c_ptr) :: ptr
  end type rocfft_plan_description_t

  type, bind(c) :: rocfft_plan_t
    type(c_ptr) :: ptr
  end type rocfft_plan_t

  type, bind(c) :: rocrand_generator_t
    type(c_ptr) :: ptr
  end type rocrand_generator_t

  type, bind(c) :: rocsolver_rfinfo_t
    type(c_ptr) :: ptr
  end type rocsolver_rfinfo_t

  type, bind(c) :: rocsparse_color_info_t
    type(c_ptr) :: ptr
  end type rocsparse_color_info_t

  type, bind(c) :: rocsparse_const_dnmat_descr_t
    type(c_ptr) :: ptr
  end type rocsparse_const_dnmat_descr_t

  type, bind(c) :: rocsparse_const_dnvec_descr_t
    type(c_ptr) :: ptr
  end type rocsparse_const_dnvec_descr_t

  type, bind(c) :: rocsparse_const_spmat_descr_t
    type(c_ptr) :: ptr
  end type rocsparse_const_spmat_descr_t

  type, bind(c) :: rocsparse_const_spvec_descr_t
    type(c_ptr) :: ptr
  end type rocsparse_const_spvec_descr_t

  type, bind(c) :: rocsparse_dnmat_descr_t
    type(c_ptr) :: ptr
  end type rocsparse_dnmat_descr_t

  type, bind(c) :: rocsparse_dnvec_descr_t
    type(c_ptr) :: ptr
  end type rocsparse_dnvec_descr_t

  type, bind(c) :: rocsparse_error_t
    type(c_ptr) :: ptr
  end type rocsparse_error_t

  type, bind(c) :: rocsparse_extract_descr_t
    type(c_ptr) :: ptr
  end type rocsparse_extract_descr_t

  type, bind(c) :: rocsparse_handle_t
    type(c_ptr) :: ptr
  end type rocsparse_handle_t

  type, bind(c) :: rocsparse_hyb_mat_t
    type(c_ptr) :: ptr
  end type rocsparse_hyb_mat_t

  type, bind(c) :: rocsparse_mat_descr_t
    type(c_ptr) :: ptr
  end type rocsparse_mat_descr_t

  type, bind(c) :: rocsparse_mat_info_t
    type(c_ptr) :: ptr
  end type rocsparse_mat_info_t

  type, bind(c) :: rocsparse_sparse_to_sparse_descr_t
    type(c_ptr) :: ptr
  end type rocsparse_sparse_to_sparse_descr_t

  type, bind(c) :: rocsparse_spgeam_descr_t
    type(c_ptr) :: ptr
  end type rocsparse_spgeam_descr_t

  type, bind(c) :: rocsparse_spic0_descr_t
    type(c_ptr) :: ptr
  end type rocsparse_spic0_descr_t

  type, bind(c) :: rocsparse_spilu0_descr_t
    type(c_ptr) :: ptr
  end type rocsparse_spilu0_descr_t

  type, bind(c) :: rocsparse_spmat_descr_t
    type(c_ptr) :: ptr
  end type rocsparse_spmat_descr_t

  type, bind(c) :: rocsparse_spmv_descr_t
    type(c_ptr) :: ptr
  end type rocsparse_spmv_descr_t

  type, bind(c) :: rocsparse_sptrsm_descr_t
    type(c_ptr) :: ptr
  end type rocsparse_sptrsm_descr_t

  type, bind(c) :: rocsparse_sptrsv_descr_t
    type(c_ptr) :: ptr
  end type rocsparse_sptrsv_descr_t

  type, bind(c) :: rocsparse_spvec_descr_t
    type(c_ptr) :: ptr
  end type rocsparse_spvec_descr_t

end module hipfort_handles
