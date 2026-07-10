! Auto-generated module wrapper for hipfort_hipsparse
! DO NOT EDIT — re-run the generator to update.

module hipfort_hipsparse
  use hipfort_hipsparse_enums
  use hipfort_hipsparse_types
  use, intrinsic :: iso_c_binding
  implicit none

  !--- Opaque handles (all are typedef struct* → type(c_ptr)) ---
  !    bsric02Info_t
  !    bsrilu02Info_t
  !    bsrsm2Info_t
  !    bsrsv2Info_t
  !    csrcolor_t
  !    csrgemm2Info_t
  !    csric02Info_t
  !    csrilu02Info_t
  !    csrsm2Info_t
  !    csrsv2Info_t
  !    hipsparseConstDnMatDescr_t
  !    hipsparseConstDnVecDescr_t
  !    hipsparseConstSpMatDescr_t
  !    hipsparseConstSpVecDescr_t
  !    hipsparseDnMatDescr_t
  !    hipsparseDnVecDescr_t
  !    hipsparseHandle_t
  !    hipsparseHybMat_t
  !    hipsparseMatDescr_t
  !    hipsparseSpGEMMDescr_t
  !    hipsparseSpMatDescr_t
  !    hipsparseSpSMDescr_t
  !    hipsparseSpSVDescr_t
  !    hipsparseSpVecDescr_t
  !    pruneInfo_t

  !--- 548 bind(C) interfaces ---
  interface

    !---------------------------------------------
    ! hipsparseCreate
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Create a hipSPARSE handle.
    !>
    !> \details
    !> \p hipsparseCreate creates the hipSPARSE library context. It must be
    !> initialized before any other hipSPARSE API function is invoked and must be passed to
    !> all subsequent library function calls. The handle should be destroyed at the end
    !> using hipsparseDestroy().
    function hipsparseCreate(handle) &
       result(Create) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCreate")
#else
       bind(C, name="hipsparseCreate")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: handle
       integer(c_int) :: Create
    end function hipsparseCreate

    !---------------------------------------------
    ! hipsparseDestroy
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Destroy a hipSPARSE handle.
    !>
    !> \details
    !> \p hipsparseDestroy destroys the hipSPARSE library context and releases all
    !> resources used by the hipSPARSE library.
    function hipsparseDestroy(handle) &
       result(Destroy) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDestroy")
#else
       bind(C, name="hipsparseDestroy")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int) :: Destroy
    end function hipsparseDestroy

    !---------------------------------------------
    ! hipsparseGetErrorName
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Return the string representation of a hipSPARSE status's matching backend status enum
    !> name
    !>
    !> \details
    !> \p hipsparseGetErrorName takes a hipSPARSE status as input and first converts it to the
    !> matching backend
    !> status (either rocsparse_status or cusparseStatus_t). It then returns the string
    !> representation of this status
    !> enum name. If the status is not recognized, the function returns "Unrecognized status code".
    !>
    !> For example, hipsparseGetErrorName(HIPSPARSE_STATUS_SUCCESS) on a system with a rocSPARSE
    !> backend will
    !> return "rocsparse_status_success". On a system with a cuSPARSE backend this function would
    !> return
    !> "CUSPARSE_STATUS_SUCCESS".
    function hipsparseGetErrorName(status) &
       result(GetErrorName) &
       bind(C, name="hipsparseGetErrorName")
       import :: c_int, c_char
       integer(c_int), value :: status
       character(c_char) :: GetErrorName
    end function hipsparseGetErrorName

    !---------------------------------------------
    ! hipsparseGetErrorString
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Return the hipSPARSE status's matching backend status description as a string
    !>
    !> \details
    !> \p hipsparseGetErrorString takes a hipSPARSE status as input and first converts it to the
    !> matching backend
    !> status (either rocsparse_status or cusparseStatus_t). It then returns the string description
    !> of this status.
    !> If the status is not recognized, the function returns "Unrecognized status code".
    function hipsparseGetErrorString(status) &
       result(GetErrorString) &
       bind(C, name="hipsparseGetErrorString")
       import :: c_int, c_char
       integer(c_int), value :: status
       character(c_char) :: GetErrorString
    end function hipsparseGetErrorString

    !---------------------------------------------
    ! hipsparseGetVersion
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Get the hipSPARSE version.
    !>
    !> \details
    !> \p hipsparseGetVersion gets the hipSPARSE library version number.
    !> - patch = version % 100
    !> - minor = version / 100 % 1000
    !> - major = version / 100000
    function hipsparseGetVersion(handle, version) &
       result(GetVersion) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseGetVersion")
#else
       bind(C, name="hipsparseGetVersion")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int) :: version(*)
       integer(c_int) :: GetVersion
    end function hipsparseGetVersion

    !---------------------------------------------
    ! hipsparseSetStream
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Specify the user-defined HIP stream.
    !>
    !> \details
    !> \p hipsparseSetStream specifies the stream to be used by the hipSPARSE library
    !> context and all subsequent function calls.
    function hipsparseSetStream(handle, streamId) &
       result(SetStream) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSetStream")
#else
       bind(C, name="hipsparseSetStream")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: streamId
       integer(c_int) :: SetStream
    end function hipsparseSetStream

    !---------------------------------------------
    ! hipsparseGetStream
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Get the current stream from the library context.
    !>
    !> \details
    !> \p hipsparseGetStream gets the hipSPARSE library context stream which is currently
    !> used for all subsequent function calls.
    function hipsparseGetStream(handle, streamId) &
       result(GetStream) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseGetStream")
#else
       bind(C, name="hipsparseGetStream")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       type(c_ptr) :: streamId
       integer(c_int) :: GetStream
    end function hipsparseGetStream

    !---------------------------------------------
    ! hipsparseSetPointerMode
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Specify the pointer mode.
    !>
    !> \details
    !> \p hipsparseSetPointerMode specifies the pointer mode to be used by the hipSPARSE
    !> library context and all subsequent function calls. By default, all values are passed
    !> by reference on the host. Valid pointer modes are \ref HIPSPARSE_POINTER_MODE_HOST
    !> or \ref HIPSPARSE_POINTER_MODE_DEVICE.
    function hipsparseSetPointerMode(handle, mode) &
       result(SetPointerMode) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSetPointerMode")
#else
       bind(C, name="hipsparseSetPointerMode")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: mode
       integer(c_int) :: SetPointerMode
    end function hipsparseSetPointerMode

    !---------------------------------------------
    ! hipsparseGetPointerMode
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Get the current pointer mode from the library context.
    !>
    !> \details
    !> \p hipsparseGetPointerMode gets the hipSPARSE library context pointer mode which
    !> is currently used for all subsequent function calls.
    function hipsparseGetPointerMode(handle, mode) &
       result(GetPointerMode) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseGetPointerMode")
#else
       bind(C, name="hipsparseGetPointerMode")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int) :: mode(*)
       integer(c_int) :: GetPointerMode
    end function hipsparseGetPointerMode

    !---------------------------------------------
    ! hipsparseCreateMatDescr
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Create a matrix descriptor.
    !> \details
    !> \p hipsparseCreateMatDescr creates a matrix descriptor. It initializes
    !> \ref hipsparseMatrixType_t to \ref HIPSPARSE_MATRIX_TYPE_GENERAL and
    !> \ref hipsparseIndexBase_t to \ref HIPSPARSE_INDEX_BASE_ZERO. It should be destroyed
    !> at the end using hipsparseDestroyMatDescr().
    function hipsparseCreateMatDescr(descrA) &
       result(CreateMatDescr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCreateMatDescr")
#else
       bind(C, name="hipsparseCreateMatDescr")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: descrA
       integer(c_int) :: CreateMatDescr
    end function hipsparseCreateMatDescr

    !---------------------------------------------
    ! hipsparseDestroyMatDescr
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Destroy a matrix descriptor.
    !>
    !> \details
    !> \p hipsparseDestroyMatDescr destroys a matrix descriptor and releases all
    !> resources used by the descriptor.
    function hipsparseDestroyMatDescr(descrA) &
       result(DestroyMatDescr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDestroyMatDescr")
#else
       bind(C, name="hipsparseDestroyMatDescr")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: descrA
       integer(c_int) :: DestroyMatDescr
    end function hipsparseDestroyMatDescr

    !---------------------------------------------
    ! hipsparseCopyMatDescr
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Copy a matrix descriptor.
    !> \details
    !> \p hipsparseCopyMatDescr copies a matrix descriptor. Both source and destination
    !> matrix descriptors must be initialized prior to calling \p hipsparseCopyMatDescr.
    function hipsparseCopyMatDescr(dest, src) &
       result(CopyMatDescr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCopyMatDescr")
#else
       bind(C, name="hipsparseCopyMatDescr")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: dest
       type(c_ptr), value :: src
       integer(c_int) :: CopyMatDescr
    end function hipsparseCopyMatDescr

    !---------------------------------------------
    ! hipsparseSetMatType
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Specify the matrix type of a matrix descriptor.
    !>
    !> \details
    !> \p hipsparseSetMatType sets the matrix type of a matrix descriptor. Valid
    !> matrix types are \ref HIPSPARSE_MATRIX_TYPE_GENERAL,
    !> \ref HIPSPARSE_MATRIX_TYPE_SYMMETRIC, \ref HIPSPARSE_MATRIX_TYPE_HERMITIAN, or
    !> \ref HIPSPARSE_MATRIX_TYPE_TRIANGULAR.
    function hipsparseSetMatType(descrA, type) &
       result(SetMatType) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSetMatType")
#else
       bind(C, name="hipsparseSetMatType")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: descrA
       integer(c_int), value :: type
       integer(c_int) :: SetMatType
    end function hipsparseSetMatType

    !---------------------------------------------
    ! hipsparseGetMatType
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Get the matrix type of a matrix descriptor.
    !>
    !> \details
    !> \p hipsparseGetMatType returns the matrix type of a matrix descriptor.
    function hipsparseGetMatType(descrA) &
       result(GetMatType) &
       bind(C, name="hipsparseGetMatType")
       import :: c_ptr, c_int
       type(c_ptr), value :: descrA
       integer(c_int) :: GetMatType
    end function hipsparseGetMatType

    !---------------------------------------------
    ! hipsparseSetMatFillMode
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Specify the matrix fill mode of a matrix descriptor.
    !>
    !> \details
    !> \p hipsparseSetMatFillMode sets the matrix fill mode of a matrix descriptor.
    !> Valid fill modes are \ref HIPSPARSE_FILL_MODE_LOWER or
    !> \ref HIPSPARSE_FILL_MODE_UPPER.
    function hipsparseSetMatFillMode(descrA, fillMode) &
       result(SetMatFillMode) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSetMatFillMode")
#else
       bind(C, name="hipsparseSetMatFillMode")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: descrA
       integer(c_int), value :: fillMode
       integer(c_int) :: SetMatFillMode
    end function hipsparseSetMatFillMode

    !---------------------------------------------
    ! hipsparseGetMatFillMode
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Get the matrix fill mode of a matrix descriptor.
    !>
    !> \details
    !> \p hipsparseGetMatFillMode returns the matrix fill mode of a matrix descriptor.
    function hipsparseGetMatFillMode(descrA) &
       result(GetMatFillMode) &
       bind(C, name="hipsparseGetMatFillMode")
       import :: c_ptr, c_int
       type(c_ptr), value :: descrA
       integer(c_int) :: GetMatFillMode
    end function hipsparseGetMatFillMode

    !---------------------------------------------
    ! hipsparseSetMatDiagType
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Specify the matrix diagonal type of a matrix descriptor.
    !>
    !> \details
    !> \p hipsparseSetMatDiagType sets the matrix diagonal type of a matrix
    !> descriptor. Valid diagonal types are \ref HIPSPARSE_DIAG_TYPE_UNIT or
    !> \ref HIPSPARSE_DIAG_TYPE_NON_UNIT.
    function hipsparseSetMatDiagType(descrA, diagType) &
       result(SetMatDiagType) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSetMatDiagType")
#else
       bind(C, name="hipsparseSetMatDiagType")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: descrA
       integer(c_int), value :: diagType
       integer(c_int) :: SetMatDiagType
    end function hipsparseSetMatDiagType

    !---------------------------------------------
    ! hipsparseGetMatDiagType
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Get the matrix diagonal type of a matrix descriptor.
    !>
    !> \details
    !> \p hipsparseGetMatDiagType returns the matrix diagonal type of a matrix
    !> descriptor.
    function hipsparseGetMatDiagType(descrA) &
       result(GetMatDiagType) &
       bind(C, name="hipsparseGetMatDiagType")
       import :: c_ptr, c_int
       type(c_ptr), value :: descrA
       integer(c_int) :: GetMatDiagType
    end function hipsparseGetMatDiagType

    !---------------------------------------------
    ! hipsparseSetMatIndexBase
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Specify the index base of a matrix descriptor.
    !>
    !> \details
    !> \p hipsparseSetMatIndexBase sets the index base of a matrix descriptor. Valid
    !> options are \ref HIPSPARSE_INDEX_BASE_ZERO or \ref HIPSPARSE_INDEX_BASE_ONE.
    function hipsparseSetMatIndexBase(descrA, base) &
       result(SetMatIndexBase) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSetMatIndexBase")
#else
       bind(C, name="hipsparseSetMatIndexBase")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: descrA
       integer(c_int), value :: base
       integer(c_int) :: SetMatIndexBase
    end function hipsparseSetMatIndexBase

    !---------------------------------------------
    ! hipsparseGetMatIndexBase
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Get the index base of a matrix descriptor.
    !>
    !> \details
    !> \p hipsparseGetMatIndexBase returns the index base of a matrix descriptor.
    function hipsparseGetMatIndexBase(descrA) &
       result(GetMatIndexBase) &
       bind(C, name="hipsparseGetMatIndexBase")
       import :: c_ptr, c_int
       type(c_ptr), value :: descrA
       integer(c_int) :: GetMatIndexBase
    end function hipsparseGetMatIndexBase

    !---------------------------------------------
    ! hipsparseCreateHybMat
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Create a \p HYB matrix structure.
    !>
    !> \details
    !> \p hipsparseCreateHybMat creates a structure that holds the matrix in \p HYB
    !> storage format. It should be destroyed at the end using hipsparseDestroyHybMat().
    function hipsparseCreateHybMat(hybA) &
       result(CreateHybMat) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCreateHybMat")
#else
       bind(C, name="hipsparseCreateHybMat")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: hybA
       integer(c_int) :: CreateHybMat
    end function hipsparseCreateHybMat

    !---------------------------------------------
    ! hipsparseDestroyHybMat
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Destroy a \p HYB matrix structure.
    !>
    !> \details
    !> \p hipsparseDestroyHybMat destroys a \p HYB structure.
    function hipsparseDestroyHybMat(hybA) &
       result(DestroyHybMat) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDestroyHybMat")
#else
       bind(C, name="hipsparseDestroyHybMat")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: hybA
       integer(c_int) :: DestroyHybMat
    end function hipsparseDestroyHybMat

    !---------------------------------------------
    ! hipsparseCreateBsrsv2Info
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Create a bsrsv2 info structure.
    !>
    !> \details
    !> \p hipsparseCreateBsrsv2Info creates a structure that holds the bsrsv2 info data
    !> that is gathered during the analysis routines. It should be destroyed
    !> at the end using hipsparseDestroyBsrsv2Info().
    function hipsparseCreateBsrsv2Info(info) &
       result(CreateBsrsv2Info) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCreateBsrsv2Info")
#else
       bind(C, name="hipsparseCreateBsrsv2Info")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: info
       integer(c_int) :: CreateBsrsv2Info
    end function hipsparseCreateBsrsv2Info

    !---------------------------------------------
    ! hipsparseDestroyBsrsv2Info
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Destroy a bsrsv2 info structure.
    !>
    !> \details
    !> \p hipsparseDestroyBsrsv2Info destroys a bsrsv2 info structure.
    function hipsparseDestroyBsrsv2Info(info) &
       result(DestroyBsrsv2Info) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDestroyBsrsv2Info")
#else
       bind(C, name="hipsparseDestroyBsrsv2Info")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: info
       integer(c_int) :: DestroyBsrsv2Info
    end function hipsparseDestroyBsrsv2Info

    !---------------------------------------------
    ! hipsparseCreateBsrsm2Info
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Create a bsrsm2 info structure.
    !>
    !> \details
    !> \p hipsparseCreateBsrsm2Info creates a structure that holds the bsrsm2 info data
    !> that is gathered during the analysis routines. It should be destroyed
    !> at the end using hipsparseDestroyBsrsm2Info().
    function hipsparseCreateBsrsm2Info(info) &
       result(CreateBsrsm2Info) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCreateBsrsm2Info")
#else
       bind(C, name="hipsparseCreateBsrsm2Info")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: info
       integer(c_int) :: CreateBsrsm2Info
    end function hipsparseCreateBsrsm2Info

    !---------------------------------------------
    ! hipsparseDestroyBsrsm2Info
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Destroy a bsrsm2 info structure.
    !>
    !> \details
    !> \p hipsparseDestroyBsrsm2Info destroys a bsrsm2 info structure.
    function hipsparseDestroyBsrsm2Info(info) &
       result(DestroyBsrsm2Info) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDestroyBsrsm2Info")
#else
       bind(C, name="hipsparseDestroyBsrsm2Info")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: info
       integer(c_int) :: DestroyBsrsm2Info
    end function hipsparseDestroyBsrsm2Info

    !---------------------------------------------
    ! hipsparseCreateBsrilu02Info
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Create a bsrilu02 info structure.
    !>
    !> \details
    !> \p hipsparseCreateBsrilu02Info creates a structure that holds the bsrilu02 info data
    !> that is gathered during the analysis routines. It should be destroyed
    !> at the end using hipsparseDestroyBsrilu02Info().
    function hipsparseCreateBsrilu02Info(info) &
       result(CreateBsrilu02Info) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCreateBsrilu02Info")
#else
       bind(C, name="hipsparseCreateBsrilu02Info")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: info
       integer(c_int) :: CreateBsrilu02Info
    end function hipsparseCreateBsrilu02Info

    !---------------------------------------------
    ! hipsparseDestroyBsrilu02Info
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Destroy a bsrilu02 info structure
    !>
    !> \details
    !> \p hipsparseDestroyBsrilu02Info destroys a bsrilu02 info structure.
    function hipsparseDestroyBsrilu02Info(info) &
       result(DestroyBsrilu02Info) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDestroyBsrilu02Info")
#else
       bind(C, name="hipsparseDestroyBsrilu02Info")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: info
       integer(c_int) :: DestroyBsrilu02Info
    end function hipsparseDestroyBsrilu02Info

    !---------------------------------------------
    ! hipsparseCreateBsric02Info
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Create a bsric02 info structure.
    !>
    !> \details
    !> \p hipsparseCreateBsric02Info creates a structure that holds the bsric02 info data
    !> that is gathered during the analysis routines. It should be destroyed
    !> at the end using hipsparseDestroyBsric02Info().
    function hipsparseCreateBsric02Info(info) &
       result(CreateBsric02Info) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCreateBsric02Info")
#else
       bind(C, name="hipsparseCreateBsric02Info")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: info
       integer(c_int) :: CreateBsric02Info
    end function hipsparseCreateBsric02Info

    !---------------------------------------------
    ! hipsparseDestroyBsric02Info
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Destroy a bsric02 info structure.
    !>
    !> \details
    !> \p hipsparseDestroyBsric02Info destroys a bsric02 info structure.
    function hipsparseDestroyBsric02Info(info) &
       result(DestroyBsric02Info) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDestroyBsric02Info")
#else
       bind(C, name="hipsparseDestroyBsric02Info")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: info
       integer(c_int) :: DestroyBsric02Info
    end function hipsparseDestroyBsric02Info

    !---------------------------------------------
    ! hipsparseCreateCsrsv2Info
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Create a csrsv2 info structure.
    !>
    !> \details
    !> \p hipsparseCreateCsrsv2Info creates a structure that holds the csrsv2 info data
    !> that is gathered during the analysis routines. It should be destroyed
    !> at the end using hipsparseDestroyCsrsv2Info().
    function hipsparseCreateCsrsv2Info(info) &
       result(CreateCsrsv2Info) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCreateCsrsv2Info")
#else
       bind(C, name="hipsparseCreateCsrsv2Info")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: info
       integer(c_int) :: CreateCsrsv2Info
    end function hipsparseCreateCsrsv2Info

    !---------------------------------------------
    ! hipsparseDestroyCsrsv2Info
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Destroy a csrsv2 info structure.
    !>
    !> \details
    !> \p hipsparseDestroyCsrsv2Info destroys a csrsv2 info structure.
    function hipsparseDestroyCsrsv2Info(info) &
       result(DestroyCsrsv2Info) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDestroyCsrsv2Info")
#else
       bind(C, name="hipsparseDestroyCsrsv2Info")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: info
       integer(c_int) :: DestroyCsrsv2Info
    end function hipsparseDestroyCsrsv2Info

    !---------------------------------------------
    ! hipsparseCreateCsrsm2Info
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Create a csrsm2 info structure.
    !>
    !> \details
    !> \p hipsparseCreateCsrsm2Info creates a structure that holds the csrsm2 info data
    !> that is gathered during the analysis routines. It should be destroyed
    !> at the end using hipsparseDestroyCsrsm2Info().
    function hipsparseCreateCsrsm2Info(info) &
       result(CreateCsrsm2Info) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCreateCsrsm2Info")
#else
       bind(C, name="hipsparseCreateCsrsm2Info")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: info
       integer(c_int) :: CreateCsrsm2Info
    end function hipsparseCreateCsrsm2Info

    !---------------------------------------------
    ! hipsparseDestroyCsrsm2Info
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Destroy a csrsm2 info structure.
    !>
    !> \details
    !> \p hipsparseDestroyCsrsm2Info destroys a csrsm2 info structure.
    function hipsparseDestroyCsrsm2Info(info) &
       result(DestroyCsrsm2Info) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDestroyCsrsm2Info")
#else
       bind(C, name="hipsparseDestroyCsrsm2Info")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: info
       integer(c_int) :: DestroyCsrsm2Info
    end function hipsparseDestroyCsrsm2Info

    !---------------------------------------------
    ! hipsparseCreateCsrilu02Info
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Create a csrilu02 info structure.
    !>
    !> \details
    !> \p hipsparseCreateCsrilu02Info creates a structure that holds the csrilu02 info data
    !> that is gathered during the analysis routines. It should be destroyed
    !> at the end using hipsparseDestroyCsrilu02Info().
    function hipsparseCreateCsrilu02Info(info) &
       result(CreateCsrilu02Info) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCreateCsrilu02Info")
#else
       bind(C, name="hipsparseCreateCsrilu02Info")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: info
       integer(c_int) :: CreateCsrilu02Info
    end function hipsparseCreateCsrilu02Info

    !---------------------------------------------
    ! hipsparseDestroyCsrilu02Info
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Destroy a csrilu02 info structure.
    !>
    !> \details
    !> \p hipsparseDestroyCsrilu02Info destroys a csrilu02 info structure.
    function hipsparseDestroyCsrilu02Info(info) &
       result(DestroyCsrilu02Info) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDestroyCsrilu02Info")
#else
       bind(C, name="hipsparseDestroyCsrilu02Info")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: info
       integer(c_int) :: DestroyCsrilu02Info
    end function hipsparseDestroyCsrilu02Info

    !---------------------------------------------
    ! hipsparseCreateCsric02Info
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Create a csric02 info structure.
    !>
    !> \details
    !> \p hipsparseCreateCsric02Info creates a structure that holds the csric02 info data
    !> that is gathered during the analysis routines. It should be destroyed
    !> at the end using hipsparseDestroyCsric02Info().
    function hipsparseCreateCsric02Info(info) &
       result(CreateCsric02Info) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCreateCsric02Info")
#else
       bind(C, name="hipsparseCreateCsric02Info")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: info
       integer(c_int) :: CreateCsric02Info
    end function hipsparseCreateCsric02Info

    !---------------------------------------------
    ! hipsparseDestroyCsric02Info
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Destroy a csric02 info structure.
    !>
    !> \details
    !> \p hipsparseDestroyCsric02Info destroys a csric02 info structure.
    function hipsparseDestroyCsric02Info(info) &
       result(DestroyCsric02Info) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDestroyCsric02Info")
#else
       bind(C, name="hipsparseDestroyCsric02Info")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: info
       integer(c_int) :: DestroyCsric02Info
    end function hipsparseDestroyCsric02Info

    !---------------------------------------------
    ! hipsparseCreateCsru2csrInfo
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Create a csru2csr info structure.
    !>
    !> \details
    !> \p hipsparseCreateCsru2csrInfo creates a structure that holds the csru2csr info data
    !> that is gathered during the analysis routines. It should be destroyed
    !> at the end using hipsparseDestroyCsru2csrInfo().
    function hipsparseCreateCsru2csrInfo(info) &
       result(CreateCsru2csrInfo) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCreateCsru2csrInfo")
#else
       bind(C, name="hipsparseCreateCsru2csrInfo")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: info
       integer(c_int) :: CreateCsru2csrInfo
    end function hipsparseCreateCsru2csrInfo

    !---------------------------------------------
    ! hipsparseDestroyCsru2csrInfo
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Destroy a csru2csr info structure.
    !>
    !> \details
    !> \p hipsparseDestroyCsru2csrInfo destroys a csru2csr info structure.
    function hipsparseDestroyCsru2csrInfo(info) &
       result(DestroyCsru2csrInfo) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDestroyCsru2csrInfo")
#else
       bind(C, name="hipsparseDestroyCsru2csrInfo")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: info
       integer(c_int) :: DestroyCsru2csrInfo
    end function hipsparseDestroyCsru2csrInfo

    !---------------------------------------------
    ! hipsparseCreateColorInfo
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Create a color info structure.
    !>
    !> \details
    !> \p hipsparseCreateColorInfo creates a structure that holds the color info data
    !> that is gathered during the analysis routines. It should be destroyed
    !> at the end using hipsparseDestroyColorInfo().
    function hipsparseCreateColorInfo(info) &
       result(CreateColorInfo) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCreateColorInfo")
#else
       bind(C, name="hipsparseCreateColorInfo")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: info
       integer(c_int) :: CreateColorInfo
    end function hipsparseCreateColorInfo

    !---------------------------------------------
    ! hipsparseDestroyColorInfo
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Destroy a color info structure.
    !>
    !> \details
    !> \p hipsparseDestroyColorInfo destroys a color info structure.
    function hipsparseDestroyColorInfo(info) &
       result(DestroyColorInfo) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDestroyColorInfo")
#else
       bind(C, name="hipsparseDestroyColorInfo")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: info
       integer(c_int) :: DestroyColorInfo
    end function hipsparseDestroyColorInfo

    !---------------------------------------------
    ! hipsparseCreateCsrgemm2Info
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Create a csrgemm2 info structure.
    !>
    !> \details
    !> \p hipsparseCreateCsrgemm2Info creates a structure that holds the csrgemm2 info data
    !> that is gathered during the analysis routines. It should be destroyed
    !> at the end using hipsparseDestroyCsrgemm2Info().
    function hipsparseCreateCsrgemm2Info(info) &
       result(CreateCsrgemm2Info) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCreateCsrgemm2Info")
#else
       bind(C, name="hipsparseCreateCsrgemm2Info")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: info
       integer(c_int) :: CreateCsrgemm2Info
    end function hipsparseCreateCsrgemm2Info

    !---------------------------------------------
    ! hipsparseDestroyCsrgemm2Info
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Destroy a csrgemm2 info structure.
    !>
    !> \details
    !> \p hipsparseDestroyCsrgemm2Info destroys a csrgemm2 info structure.
    function hipsparseDestroyCsrgemm2Info(info) &
       result(DestroyCsrgemm2Info) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDestroyCsrgemm2Info")
#else
       bind(C, name="hipsparseDestroyCsrgemm2Info")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: info
       integer(c_int) :: DestroyCsrgemm2Info
    end function hipsparseDestroyCsrgemm2Info

    !---------------------------------------------
    ! hipsparseCreatePruneInfo
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Create a prune info structure.
    !>
    !> \details
    !> \p hipsparseCreatePruneInfo creates a structure that holds the prune info data
    !> that is gathered during the analysis routines. It should be destroyed
    !> at the end using hipsparseDestroyPruneInfo().
    function hipsparseCreatePruneInfo(info) &
       result(CreatePruneInfo) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCreatePruneInfo")
#else
       bind(C, name="hipsparseCreatePruneInfo")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: info
       integer(c_int) :: CreatePruneInfo
    end function hipsparseCreatePruneInfo

    !---------------------------------------------
    ! hipsparseDestroyPruneInfo
    !---------------------------------------------
    !> \ingroup aux_module
    !> \brief Destroy a prune info structure
    !>
    !> \details
    !> \p hipsparseDestroyPruneInfo destroys a prune info structure.
    function hipsparseDestroyPruneInfo(info) &
       result(DestroyPruneInfo) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDestroyPruneInfo")
#else
       bind(C, name="hipsparseDestroyPruneInfo")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: info
       integer(c_int) :: DestroyPruneInfo
    end function hipsparseDestroyPruneInfo

    !---------------------------------------------
    ! hipsparseSaxpyi
    !---------------------------------------------
    !> \ingroup level1_module
    !> \brief Scale a sparse vector and add it to a dense vector.
    !>
    !> \details
    !> \p hipsparseXaxpyi multiplies the sparse vector \f$x\f$ with scalar \f$\alpha\f$ and
    !> adds the result to the dense vector \f$y\f$, such that
    !>
    !> \f[
    !> y := y + \alpha \cdot x
    !> \f]
    !>
    !> \code{.c}
    !> for(i = 0; i < nnz; ++i)
    !> {
    !> y[xInd[i]] = y[xInd[i]] + alpha * xVal[i];
    !> }
    !> \endcode
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> \note
    !> If \p nnz is zero, the function returns successfully without modifying \p y.
    !> Duplicate indices in \p xInd will result in the corresponding values being added
    !> multiple times to the same location in \p y.
    !>
    !> \deprecated
    !> This function is deprecated when using the CUDA backend (CUDA 11.0+) and will be
    !> removed in CUDA 12.0. This deprecation does not apply to the ROCm backend.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> nnz         number of non-zero entries of vector \f$x\f$. Must be non-negative.
    !> @param[in]
    !> alpha       scalar \f$\alpha\f$.
    !> @param[in]
    !> xVal        array of \p nnz elements containing the values of \f$x\f$.
    !> @param[in]
    !> xInd        array of \p nnz elements containing the indices of the non-zero
    !> values of \f$x\f$.
    !> @param[inout]
    !> y           array of values in dense format. Must be pre-allocated with sufficient
    !> size to accommodate all indices specified in \p xInd.
    !> @param[in]
    !> idxBase     index base. \ref HIPSPARSE_INDEX_BASE_ZERO for zero-based indexing or
    !> \ref HIPSPARSE_INDEX_BASE_ONE for one-based indexing.
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle is nullptr, \p nnz is negative,
    !> \p alpha, \p xVal, \p xInd, or \p y is nullptr when \p nnz is greater than zero,
    !> or \p idxBase is neither \ref HIPSPARSE_INDEX_BASE_ZERO nor \ref HIPSPARSE_INDEX_BASE_ONE.
    function hipsparseSaxpyi(handle, nnz, alpha, xVal, xInd, y, idxBase) &
       result(Saxpyi) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSaxpyi")
#else
       bind(C, name="hipsparseSaxpyi")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: nnz
       real(c_float) :: alpha(*)
       real(c_float) :: xVal(*)
       integer(c_int) :: xInd(*)
       real(c_float) :: y(*)
       integer(c_int), value :: idxBase
       integer(c_int) :: Saxpyi
    end function hipsparseSaxpyi

    !---------------------------------------------
    ! hipsparseDaxpyi
    !---------------------------------------------
    function hipsparseDaxpyi(handle, nnz, alpha, xVal, xInd, y, idxBase) &
       result(Daxpyi) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDaxpyi")
#else
       bind(C, name="hipsparseDaxpyi")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: nnz
       real(c_double) :: alpha(*)
       real(c_double) :: xVal(*)
       integer(c_int) :: xInd(*)
       real(c_double) :: y(*)
       integer(c_int), value :: idxBase
       integer(c_int) :: Daxpyi
    end function hipsparseDaxpyi

    !---------------------------------------------
    ! hipsparseCaxpyi
    !---------------------------------------------
    function hipsparseCaxpyi(handle, nnz, alpha, xVal, xInd, y, idxBase) &
       result(Caxpyi) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCaxpyi")
#else
       bind(C, name="hipsparseCaxpyi")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: nnz
       type(c_ptr), value :: alpha
       type(c_ptr), value :: xVal
       integer(c_int) :: xInd(*)
       type(c_ptr), value :: y
       integer(c_int), value :: idxBase
       integer(c_int) :: Caxpyi
    end function hipsparseCaxpyi

    !---------------------------------------------
    ! hipsparseZaxpyi
    !---------------------------------------------
    function hipsparseZaxpyi(handle, nnz, alpha, xVal, xInd, y, idxBase) &
       result(Zaxpyi) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZaxpyi")
#else
       bind(C, name="hipsparseZaxpyi")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: nnz
       type(c_ptr), value :: alpha
       type(c_ptr), value :: xVal
       integer(c_int) :: xInd(*)
       type(c_ptr), value :: y
       integer(c_int), value :: idxBase
       integer(c_int) :: Zaxpyi
    end function hipsparseZaxpyi

    !---------------------------------------------
    ! hipsparseCdotci
    !---------------------------------------------
    !> \ingroup level1_module
    !> \brief Compute the dot product of a complex conjugate sparse vector with a dense
    !> vector.
    !>
    !> \details
    !> \p hipsparseXdotci computes the dot product of the complex conjugate sparse vector
    !> \f$x\f$ with the dense vector \f$y\f$, such that
    !> \f[
    !> result := \bar{x}^H y
    !> \f]
    !>
    !> \code{.c}
    !> result = 0
    !> for(i = 0; i < nnz; ++i)
    !> {
    !> result += conj(xVal[i]) * y[xInd[i]];
    !> }
    !> \endcode
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> \note
    !> If \p nnz is zero, the function returns successfully with \p result set to zero.
    !>
    !> \deprecated
    !> This function is deprecated when using the CUDA backend (CUDA 10.0+) and will be
    !> removed in CUDA 11.0. This deprecation does not apply to the ROCm backend.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> nnz         number of non-zero entries of vector \f$x\f$. Must be non-negative.
    !> @param[in]
    !> xVal        array of \p nnz values containing the elements of \f$x\f$.
    !> @param[in]
    !> xInd        array of \p nnz elements containing the indices of the non-zero
    !> values of \f$x\f$.
    !> @param[in]
    !> y           array of values in dense format. Must be pre-allocated with sufficient
    !> size to accommodate all indices specified in \p xInd.
    !> @param[out]
    !> result      pointer to the result, which can be host or device memory.
    !> @param[in]
    !> idxBase     index base. \ref HIPSPARSE_INDEX_BASE_ZERO for zero-based indexing or
    !> \ref HIPSPARSE_INDEX_BASE_ONE for one-based indexing.
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle or \p result is nullptr, \p nnz is negative,
    !> \p xVal, \p xInd, or \p y is nullptr when \p nnz is greater than zero, or \p idxBase
    !> is neither \ref HIPSPARSE_INDEX_BASE_ZERO nor \ref HIPSPARSE_INDEX_BASE_ONE.
    !> \retval HIPSPARSE_STATUS_ALLOC_FAILED the buffer for the dot product reduction
    !> could not be allocated.
    !> \retval HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    function hipsparseCdotci(handle, nnz, xVal, xInd, y, result, idxBase) &
       result(Cdotci) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCdotci")
#else
       bind(C, name="hipsparseCdotci")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: nnz
       type(c_ptr), value :: xVal
       integer(c_int) :: xInd(*)
       type(c_ptr), value :: y
       type(c_ptr), value :: result
       integer(c_int), value :: idxBase
       integer(c_int) :: Cdotci
    end function hipsparseCdotci

    !---------------------------------------------
    ! hipsparseZdotci
    !---------------------------------------------
    function hipsparseZdotci(handle, nnz, xVal, xInd, y, result, idxBase) &
       result(Zdotci) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZdotci")
#else
       bind(C, name="hipsparseZdotci")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: nnz
       type(c_ptr), value :: xVal
       integer(c_int) :: xInd(*)
       type(c_ptr), value :: y
       type(c_ptr), value :: result
       integer(c_int), value :: idxBase
       integer(c_int) :: Zdotci
    end function hipsparseZdotci

    !---------------------------------------------
    ! hipsparseSdoti
    !---------------------------------------------
    !> \ingroup level1_module
    !> \brief Compute the dot product of a sparse vector with a dense vector.
    !>
    !> \details
    !> \p hipsparseXdoti computes the dot product of the sparse vector \f$x\f$ with the
    !> dense vector \f$y\f$, such that
    !> \f[
    !> result := y^T x
    !> \f]
    !>
    !> \code{.c}
    !> result = 0
    !> for(i = 0; i < nnz; ++i)
    !> {
    !> result += xVal[i] * y[xInd[i]];
    !> }
    !> \endcode
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> \note
    !> If \p nnz is zero, the function returns successfully with \p result set to zero.
    !>
    !> \deprecated
    !> This function is deprecated when using the CUDA backend (CUDA 10.0+) and will be
    !> removed in CUDA 11.0. This deprecation does not apply to the ROCm backend.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> nnz         number of non-zero entries of vector \f$x\f$. Must be non-negative.
    !> @param[in]
    !> xVal        array of \p nnz values containing the elements of \f$x\f$.
    !> @param[in]
    !> xInd        array of \p nnz elements containing the indices of the non-zero
    !> values of \f$x\f$.
    !> @param[in]
    !> y           array of values in dense format. Must be pre-allocated with sufficient
    !> size to accommodate all indices specified in \p xInd.
    !> @param[out]
    !> result      pointer to the result, which can be host or device memory.
    !> @param[in]
    !> idxBase     index base. \ref HIPSPARSE_INDEX_BASE_ZERO for zero-based indexing or
    !> \ref HIPSPARSE_INDEX_BASE_ONE for one-based indexing.
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle or \p result is nullptr, \p nnz is negative,
    !> \p xVal, \p xInd, or \p y is nullptr when \p nnz is greater than zero, or \p idxBase
    !> is neither \ref HIPSPARSE_INDEX_BASE_ZERO nor \ref HIPSPARSE_INDEX_BASE_ONE.
    !> \retval HIPSPARSE_STATUS_ALLOC_FAILED the buffer for the dot product reduction
    !> could not be allocated.
    !> \retval HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    function hipsparseSdoti(handle, nnz, xVal, xInd, y, result, idxBase) &
       result(Sdoti) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSdoti")
#else
       bind(C, name="hipsparseSdoti")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: nnz
       real(c_float) :: xVal(*)
       integer(c_int) :: xInd(*)
       real(c_float) :: y(*)
       real(c_float) :: result(*)
       integer(c_int), value :: idxBase
       integer(c_int) :: Sdoti
    end function hipsparseSdoti

    !---------------------------------------------
    ! hipsparseDdoti
    !---------------------------------------------
    function hipsparseDdoti(handle, nnz, xVal, xInd, y, result, idxBase) &
       result(Ddoti) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDdoti")
#else
       bind(C, name="hipsparseDdoti")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: nnz
       real(c_double) :: xVal(*)
       integer(c_int) :: xInd(*)
       real(c_double) :: y(*)
       real(c_double) :: result(*)
       integer(c_int), value :: idxBase
       integer(c_int) :: Ddoti
    end function hipsparseDdoti

    !---------------------------------------------
    ! hipsparseCdoti
    !---------------------------------------------
    function hipsparseCdoti(handle, nnz, xVal, xInd, y, result, idxBase) &
       result(Cdoti) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCdoti")
#else
       bind(C, name="hipsparseCdoti")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: nnz
       type(c_ptr), value :: xVal
       integer(c_int) :: xInd(*)
       type(c_ptr), value :: y
       type(c_ptr), value :: result
       integer(c_int), value :: idxBase
       integer(c_int) :: Cdoti
    end function hipsparseCdoti

    !---------------------------------------------
    ! hipsparseZdoti
    !---------------------------------------------
    function hipsparseZdoti(handle, nnz, xVal, xInd, y, result, idxBase) &
       result(Zdoti) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZdoti")
#else
       bind(C, name="hipsparseZdoti")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: nnz
       type(c_ptr), value :: xVal
       integer(c_int) :: xInd(*)
       type(c_ptr), value :: y
       type(c_ptr), value :: result
       integer(c_int), value :: idxBase
       integer(c_int) :: Zdoti
    end function hipsparseZdoti

    !---------------------------------------------
    ! hipsparseSgthr
    !---------------------------------------------
    !> \ingroup level1_module
    !> \brief Gather elements from a dense vector and store them in a sparse vector.
    !>
    !> \details
    !> \p hipsparseXgthr gathers the elements that are listed in \p xInd from the dense
    !> vector \f$y\f$ and stores them in the sparse vector \f$x\f$.
    !>
    !> \code{.c}
    !> for(i = 0; i < nnz; ++i)
    !> {
    !> xVal[i] = y[xInd[i]];
    !> }
    !> \endcode
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> \note
    !> If \p nnz is zero, the function returns successfully without modifying \p xVal.
    !>
    !> \deprecated
    !> This function is deprecated when using the CUDA backend (CUDA 11.0+) and will be
    !> removed in CUDA 12.0. This deprecation does not apply to the ROCm backend.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> nnz         number of non-zero entries of \f$x\f$. Must be non-negative.
    !> @param[in]
    !> y           array of values in dense format. Must be pre-allocated with sufficient
    !> size to accommodate all indices specified in \p xInd.
    !> @param[out]
    !> xVal        array of \p nnz elements that will contain the gathered values of \f$x\f$.
    !> @param[in]
    !> xInd        array of \p nnz elements containing the indices of the non-zero
    !> values of \f$x\f$.
    !> @param[in]
    !> idxBase     index base. \ref HIPSPARSE_INDEX_BASE_ZERO for zero-based indexing or
    !> \ref HIPSPARSE_INDEX_BASE_ONE for one-based indexing.
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle is nullptr, \p nnz is negative,
    !> \p y, \p xVal, or \p xInd is nullptr when \p nnz is greater than zero, or \p idxBase
    !> is neither \ref HIPSPARSE_INDEX_BASE_ZERO nor \ref HIPSPARSE_INDEX_BASE_ONE.
    function hipsparseSgthr(handle, nnz, y, xVal, xInd, idxBase) &
       result(Sgthr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSgthr")
#else
       bind(C, name="hipsparseSgthr")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: nnz
       real(c_float) :: y(*)
       real(c_float) :: xVal(*)
       integer(c_int) :: xInd(*)
       integer(c_int), value :: idxBase
       integer(c_int) :: Sgthr
    end function hipsparseSgthr

    !---------------------------------------------
    ! hipsparseDgthr
    !---------------------------------------------
    function hipsparseDgthr(handle, nnz, y, xVal, xInd, idxBase) &
       result(Dgthr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDgthr")
#else
       bind(C, name="hipsparseDgthr")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: nnz
       real(c_double) :: y(*)
       real(c_double) :: xVal(*)
       integer(c_int) :: xInd(*)
       integer(c_int), value :: idxBase
       integer(c_int) :: Dgthr
    end function hipsparseDgthr

    !---------------------------------------------
    ! hipsparseCgthr
    !---------------------------------------------
    function hipsparseCgthr(handle, nnz, y, xVal, xInd, idxBase) &
       result(Cgthr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCgthr")
#else
       bind(C, name="hipsparseCgthr")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: nnz
       type(c_ptr), value :: y
       type(c_ptr), value :: xVal
       integer(c_int) :: xInd(*)
       integer(c_int), value :: idxBase
       integer(c_int) :: Cgthr
    end function hipsparseCgthr

    !---------------------------------------------
    ! hipsparseZgthr
    !---------------------------------------------
    function hipsparseZgthr(handle, nnz, y, xVal, xInd, idxBase) &
       result(Zgthr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZgthr")
#else
       bind(C, name="hipsparseZgthr")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: nnz
       type(c_ptr), value :: y
       type(c_ptr), value :: xVal
       integer(c_int) :: xInd(*)
       integer(c_int), value :: idxBase
       integer(c_int) :: Zgthr
    end function hipsparseZgthr

    !---------------------------------------------
    ! hipsparseSgthrz
    !---------------------------------------------
    !> \ingroup level1_module
    !> \brief Gather and zero out elements from a dense vector and store them in a sparse
    !> vector.
    !>
    !> \details
    !> \p hipsparseXgthrz gathers the elements that are listed in \p xInd from the dense
    !> vector \f$y\f$ and stores them in the sparse vector \f$x\f$. The gathered elements
    !> in \f$y\f$ are replaced by zero.
    !>
    !> \code{.c}
    !> for(i = 0; i < nnz; ++i)
    !> {
    !> xVal[i]    = y[xInd[i]];
    !> y[xInd[i]] = 0;
    !> }
    !> \endcode
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> \note
    !> If \p nnz is zero, the function returns successfully without modifying \p xVal or \p y.
    !>
    !> \deprecated
    !> This function is deprecated when using the CUDA backend (CUDA 11.0+) and will be
    !> removed in CUDA 12.0. This deprecation does not apply to the ROCm backend.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> nnz         number of non-zero entries of \f$x\f$. Must be non-negative.
    !> @param[inout]
    !> y           array of values in dense format. Must be pre-allocated with sufficient
    !> size to accommodate all indices specified in \p xInd. Gathered elements
    !> are set to zero.
    !> @param[out]
    !> xVal        array of \p nnz elements that will contain the gathered values of \f$x\f$.
    !> @param[in]
    !> xInd        array of \p nnz elements containing the indices of the non-zero
    !> values of \f$x\f$.
    !> @param[in]
    !> idxBase     index base. \ref HIPSPARSE_INDEX_BASE_ZERO for zero-based indexing or
    !> \ref HIPSPARSE_INDEX_BASE_ONE for one-based indexing.
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle is nullptr, \p nnz is negative,
    !> \p y, \p xVal, or \p xInd is nullptr when \p nnz is greater than zero, or \p idxBase
    !> is neither \ref HIPSPARSE_INDEX_BASE_ZERO nor \ref HIPSPARSE_INDEX_BASE_ONE.
    function hipsparseSgthrz(handle, nnz, y, xVal, xInd, idxBase) &
       result(Sgthrz) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSgthrz")
#else
       bind(C, name="hipsparseSgthrz")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: nnz
       real(c_float) :: y(*)
       real(c_float) :: xVal(*)
       integer(c_int) :: xInd(*)
       integer(c_int), value :: idxBase
       integer(c_int) :: Sgthrz
    end function hipsparseSgthrz

    !---------------------------------------------
    ! hipsparseDgthrz
    !---------------------------------------------
    function hipsparseDgthrz(handle, nnz, y, xVal, xInd, idxBase) &
       result(Dgthrz) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDgthrz")
#else
       bind(C, name="hipsparseDgthrz")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: nnz
       real(c_double) :: y(*)
       real(c_double) :: xVal(*)
       integer(c_int) :: xInd(*)
       integer(c_int), value :: idxBase
       integer(c_int) :: Dgthrz
    end function hipsparseDgthrz

    !---------------------------------------------
    ! hipsparseCgthrz
    !---------------------------------------------
    function hipsparseCgthrz(handle, nnz, y, xVal, xInd, idxBase) &
       result(Cgthrz) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCgthrz")
#else
       bind(C, name="hipsparseCgthrz")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: nnz
       type(c_ptr), value :: y
       type(c_ptr), value :: xVal
       integer(c_int) :: xInd(*)
       integer(c_int), value :: idxBase
       integer(c_int) :: Cgthrz
    end function hipsparseCgthrz

    !---------------------------------------------
    ! hipsparseZgthrz
    !---------------------------------------------
    function hipsparseZgthrz(handle, nnz, y, xVal, xInd, idxBase) &
       result(Zgthrz) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZgthrz")
#else
       bind(C, name="hipsparseZgthrz")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: nnz
       type(c_ptr), value :: y
       type(c_ptr), value :: xVal
       integer(c_int) :: xInd(*)
       integer(c_int), value :: idxBase
       integer(c_int) :: Zgthrz
    end function hipsparseZgthrz

    !---------------------------------------------
    ! hipsparseSroti
    !---------------------------------------------
    !> \ingroup level1_module
    !> \brief Apply the Givens rotation to a dense and a sparse vector.
    !>
    !> \details
    !> \p hipsparseXroti applies the Givens rotation matrix \f$G\f$ to the sparse vector
    !> \f$x\f$ and the dense vector \f$y\f$, where
    !> \f[
    !> G = \begin{pmatrix} c & s \\ -s & c \end{pmatrix}
    !> \f]
    !>
    !> \code{.c}
    !> for(i = 0; i < nnz; ++i)
    !> {
    !> x_tmp = xVal[i];
    !> y_tmp = y[xInd[i]];
    !>
    !> xVal[i]    = c * x_tmp + s * y_tmp;
    !> y[xInd[i]] = c * y_tmp - s * x_tmp;
    !> }
    !> \endcode
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> \note
    !> If \p nnz is zero, the function returns successfully without modifying \p xVal or \p y.
    !>
    !> \deprecated
    !> This function is deprecated when using the CUDA backend (CUDA 11.0+) and will be
    !> removed in CUDA 12.0. This deprecation does not apply to the ROCm backend.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> nnz         number of non-zero entries of \f$x\f$. Must be non-negative.
    !> @param[inout]
    !> xVal        array of \p nnz elements containing the non-zero values of \f$x\f$.
    !> @param[in]
    !> xInd        array of \p nnz elements containing the indices of the non-zero
    !> values of \f$x\f$.
    !> @param[inout]
    !> y           array of values in dense format. Must be pre-allocated with sufficient
    !> size to accommodate all indices specified in \p xInd.
    !> @param[in]
    !> c           pointer to the cosine element of \f$G\f$, which can be on host or device.
    !> @param[in]
    !> s           pointer to the sine element of \f$G\f$, which can be on host or device.
    !> @param[in]
    !> idxBase     index base. \ref HIPSPARSE_INDEX_BASE_ZERO for zero-based indexing or
    !> \ref HIPSPARSE_INDEX_BASE_ONE for one-based indexing.
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p c, or \p s is nullptr, \p nnz is
    !> negative,
    !> \p xVal, \p xInd, or \p y is nullptr when \p nnz is greater than zero, or \p idxBase
    !> is neither \ref HIPSPARSE_INDEX_BASE_ZERO nor \ref HIPSPARSE_INDEX_BASE_ONE.
    function hipsparseSroti(handle, nnz, xVal, xInd, y, c, s, idxBase) &
       result(Sroti) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSroti")
#else
       bind(C, name="hipsparseSroti")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: nnz
       real(c_float) :: xVal(*)
       integer(c_int) :: xInd(*)
       real(c_float) :: y(*)
       real(c_float) :: c(*)
       real(c_float) :: s(*)
       integer(c_int), value :: idxBase
       integer(c_int) :: Sroti
    end function hipsparseSroti

    !---------------------------------------------
    ! hipsparseDroti
    !---------------------------------------------
    function hipsparseDroti(handle, nnz, xVal, xInd, y, c, s, idxBase) &
       result(Droti) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDroti")
#else
       bind(C, name="hipsparseDroti")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: nnz
       real(c_double) :: xVal(*)
       integer(c_int) :: xInd(*)
       real(c_double) :: y(*)
       real(c_double) :: c(*)
       real(c_double) :: s(*)
       integer(c_int), value :: idxBase
       integer(c_int) :: Droti
    end function hipsparseDroti

    !---------------------------------------------
    ! hipsparseSsctr
    !---------------------------------------------
    !> \ingroup level1_module
    !> \brief Scatter elements from a dense vector across a sparse vector.
    !>
    !> \details
    !> \p hipsparseXsctr scatters the elements that are listed in \p xInd from the sparse
    !> vector \f$x\f$ into the dense vector \f$y\f$. Indices of \f$y\f$ that are not listed
    !> in \p xInd remain unchanged.
    !>
    !> \code{.c}
    !> for(i = 0; i < nnz; ++i)
    !> {
    !> y[xInd[i]] = xVal[i];
    !> }
    !> \endcode
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> \note
    !> If \p nnz is zero, the function returns successfully without modifying \p y.
    !> Duplicate indices in \p xInd will result in the last value being written to \p y.
    !>
    !> \deprecated
    !> This function is deprecated when using the CUDA backend (CUDA 11.0+) and will be
    !> removed in CUDA 12.0. This deprecation does not apply to the ROCm backend.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> nnz         number of non-zero entries of \f$x\f$. Must be non-negative.
    !> @param[in]
    !> xVal        array of \p nnz elements containing the non-zero values of \f$x\f$.
    !> @param[in]
    !> xInd        array of \p nnz elements containing the indices of the non-zero
    !> values of \f$x\f$.
    !> @param[inout]
    !> y           array of values in dense format. Must be pre-allocated with sufficient
    !> size to accommodate all indices specified in \p xInd.
    !> @param[in]
    !> idxBase     index base. \ref HIPSPARSE_INDEX_BASE_ZERO for zero-based indexing or
    !> \ref HIPSPARSE_INDEX_BASE_ONE for one-based indexing.
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle is nullptr, \p nnz is negative,
    !> \p xVal, \p xInd, or \p y is nullptr when \p nnz is greater than zero, or \p idxBase
    !> is neither \ref HIPSPARSE_INDEX_BASE_ZERO nor \ref HIPSPARSE_INDEX_BASE_ONE.
    function hipsparseSsctr(handle, nnz, xVal, xInd, y, idxBase) &
       result(Ssctr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSsctr")
#else
       bind(C, name="hipsparseSsctr")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: nnz
       real(c_float) :: xVal(*)
       integer(c_int) :: xInd(*)
       real(c_float) :: y(*)
       integer(c_int), value :: idxBase
       integer(c_int) :: Ssctr
    end function hipsparseSsctr

    !---------------------------------------------
    ! hipsparseDsctr
    !---------------------------------------------
    function hipsparseDsctr(handle, nnz, xVal, xInd, y, idxBase) &
       result(Dsctr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDsctr")
#else
       bind(C, name="hipsparseDsctr")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: nnz
       real(c_double) :: xVal(*)
       integer(c_int) :: xInd(*)
       real(c_double) :: y(*)
       integer(c_int), value :: idxBase
       integer(c_int) :: Dsctr
    end function hipsparseDsctr

    !---------------------------------------------
    ! hipsparseCsctr
    !---------------------------------------------
    function hipsparseCsctr(handle, nnz, xVal, xInd, y, idxBase) &
       result(Csctr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCsctr")
#else
       bind(C, name="hipsparseCsctr")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: nnz
       type(c_ptr), value :: xVal
       integer(c_int) :: xInd(*)
       type(c_ptr), value :: y
       integer(c_int), value :: idxBase
       integer(c_int) :: Csctr
    end function hipsparseCsctr

    !---------------------------------------------
    ! hipsparseZsctr
    !---------------------------------------------
    function hipsparseZsctr(handle, nnz, xVal, xInd, y, idxBase) &
       result(Zsctr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZsctr")
#else
       bind(C, name="hipsparseZsctr")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: nnz
       type(c_ptr), value :: xVal
       integer(c_int) :: xInd(*)
       type(c_ptr), value :: y
       integer(c_int), value :: idxBase
       integer(c_int) :: Zsctr
    end function hipsparseZsctr

    !---------------------------------------------
    ! hipsparseSbsrmv
    !---------------------------------------------
    !> \ingroup level2_module
    !> \brief Sparse matrix vector multiplication using the BSR storage format.
    !>
    !> \details
    !> \p hipsparseXbsrmv multiplies the scalar \f$\alpha\f$ with a sparse
    !> \f$m \times n\f$ matrix, defined in BSR storage format, and the dense vector \f$x\f$ and adds
    !> the
    !> result to the dense vector \f$y\f$ that is multiplied by the scalar \f$\beta\f$, such that
    !> \f[
    !> y := \alpha \cdot op(A) \cdot x + \beta \cdot y,
    !> \f]
    !> with
    !> \f[
    !> op(A) = \left\{
    !> \begin{array}{ll}
    !> A,   & \text{if trans == HIPSPARSE_OPERATION_NON_TRANSPOSE}
    !> \end{array}
    !> \right.
    !> \f]
    !> and where \f$m = mb \times blockDim\f$ and \f$n= nb \times blockDim\f$.
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> \note
    !> Currently, only \p transA == \ref HIPSPARSE_OPERATION_NON_TRANSPOSE is supported.
    !>
    !> @param[in]
    !> handle          handle to the hipSPARSE library context queue.
    !> @param[in]
    !> dirA            matrix storage of BSR blocks.
    !> @param[in]
    !> transA          matrix operation type.
    !> @param[in]
    !> mb              number of block rows of the sparse BSR matrix. Must be non-negative.
    !> @param[in]
    !> nb              number of block columns of the sparse BSR matrix. Must be non-negative.
    !> @param[in]
    !> nnzb            number of non-zero blocks of the sparse BSR matrix. Must be non-negative.
    !> @param[in]
    !> alpha           scalar \f$\alpha\f$.
    !> @param[in]
    !> descrA          descriptor of the sparse BSR matrix. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> bsrSortedValA   array of \p nnzb blocks of the sparse BSR matrix.
    !> @param[in]
    !> bsrSortedRowPtrA array of \p mb+1 elements that point to the start of every block row of
    !> the sparse BSR matrix.
    !> @param[in]
    !> bsrSortedColIndA array of \p nnzb elements containing the block column indices of the sparse
    !> BSR matrix.
    !> @param[in]
    !> blockDim        block dimension of the sparse BSR matrix. Must be positive.
    !> @param[in]
    !> x               array of \p nb*blockDim elements (\f$op(A) = A\f$) or \p mb*blockDim
    !> elements (\f$op(A) = A^T\f$ or \f$op(A) = A^H\f$).
    !> @param[in]
    !> beta            scalar \f$\beta\f$.
    !> @param[inout]
    !> y               array of \p mb*blockDim elements (\f$op(A) = A\f$) or \p nb*blockDim
    !> elements (\f$op(A) = A^T\f$ or \f$op(A) = A^H\f$).
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p descrA, \p alpha, or \p beta is nullptr,
    !> \p mb, \p nb, or \p nnzb is negative, \p blockDim is less than or equal to zero, or
    !> \p bsrSortedValA, \p bsrSortedRowPtrA, \p bsrSortedColIndA, \p x, or \p y is nullptr.
    !> \retval HIPSPARSE_STATUS_ARCH_MISMATCH the device is not supported.
    !> \retval HIPSPARSE_STATUS_NOT_SUPPORTED \p transA is not \ref
    !> HIPSPARSE_OPERATION_NON_TRANSPOSE
    !> or \ref hipsparseMatrixType_t is not \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseSbsrmv(handle, dirA, transA, mb, nb, nnzb, alpha, descrA, bsrSortedValA, &
                             bsrSortedRowPtrA, bsrSortedColIndA, blockDim, x, beta, y) &
       result(Sbsrmv) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSbsrmv")
#else
       bind(C, name="hipsparseSbsrmv")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: transA
       integer(c_int), value :: mb
       integer(c_int), value :: nb
       integer(c_int), value :: nnzb
       real(c_float) :: alpha(*)
       type(c_ptr), value :: descrA
       real(c_float) :: bsrSortedValA(*)
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       real(c_float) :: x(*)
       real(c_float) :: beta(*)
       real(c_float) :: y(*)
       integer(c_int) :: Sbsrmv
    end function hipsparseSbsrmv

    !---------------------------------------------
    ! hipsparseDbsrmv
    !---------------------------------------------
    function hipsparseDbsrmv(handle, dirA, transA, mb, nb, nnzb, alpha, descrA, bsrSortedValA, &
                             bsrSortedRowPtrA, bsrSortedColIndA, blockDim, x, beta, y) &
       result(Dbsrmv) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDbsrmv")
#else
       bind(C, name="hipsparseDbsrmv")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: transA
       integer(c_int), value :: mb
       integer(c_int), value :: nb
       integer(c_int), value :: nnzb
       real(c_double) :: alpha(*)
       type(c_ptr), value :: descrA
       real(c_double) :: bsrSortedValA(*)
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       real(c_double) :: x(*)
       real(c_double) :: beta(*)
       real(c_double) :: y(*)
       integer(c_int) :: Dbsrmv
    end function hipsparseDbsrmv

    !---------------------------------------------
    ! hipsparseCbsrmv
    !---------------------------------------------
    function hipsparseCbsrmv(handle, dirA, transA, mb, nb, nnzb, alpha, descrA, bsrSortedValA, &
                             bsrSortedRowPtrA, bsrSortedColIndA, blockDim, x, beta, y) &
       result(Cbsrmv) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCbsrmv")
#else
       bind(C, name="hipsparseCbsrmv")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: transA
       integer(c_int), value :: mb
       integer(c_int), value :: nb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: alpha
       type(c_ptr), value :: descrA
       type(c_ptr), value :: bsrSortedValA
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: x
       type(c_ptr), value :: beta
       type(c_ptr), value :: y
       integer(c_int) :: Cbsrmv
    end function hipsparseCbsrmv

    !---------------------------------------------
    ! hipsparseZbsrmv
    !---------------------------------------------
    function hipsparseZbsrmv(handle, dirA, transA, mb, nb, nnzb, alpha, descrA, bsrSortedValA, &
                             bsrSortedRowPtrA, bsrSortedColIndA, blockDim, x, beta, y) &
       result(Zbsrmv) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZbsrmv")
#else
       bind(C, name="hipsparseZbsrmv")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: transA
       integer(c_int), value :: mb
       integer(c_int), value :: nb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: alpha
       type(c_ptr), value :: descrA
       type(c_ptr), value :: bsrSortedValA
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: x
       type(c_ptr), value :: beta
       type(c_ptr), value :: y
       integer(c_int) :: Zbsrmv
    end function hipsparseZbsrmv

    !---------------------------------------------
    ! hipsparseXbsrsv2_zeroPivot
    !---------------------------------------------
    !> \ingroup level2_module
    !> \details
    !> \p hipsparseXbsrsv2_zeroPivot returns \ref HIPSPARSE_STATUS_ZERO_PIVOT if either a
    !> structural or numerical zero has been found during \ref hipsparseSbsrsv2_analysis
    !> "hipsparseXbsrsv2_analysis()" or \ref hipsparseSbsrsv2_solve "hipsparseXbsrsv2_solve()"
    !> computation. The first zero pivot \f$j\f$ at \f$A_{j,j}\f$ is stored in \p position,
    !> using the same index base as the BSR matrix.
    !>
    !> \p position can be in host or device memory. If no zero pivot has been found,
    !> \p position is set to -1 and \ref HIPSPARSE_STATUS_SUCCESS is returned instead.
    !>
    !> \note \p hipsparseXbsrsv2_zeroPivot is a blocking function. It might negatively
    !> influence performance.
    !>
    !> \deprecated
    !> This function is deprecated when using the CUDA backend (CUDA 12.0+) and will be
    !> removed in CUDA 13.0. This deprecation does not apply to the ROCm backend.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> info        structure that holds the information collected during the analysis step.
    !> @param[inout]
    !> position    pointer to zero pivot \f$j\f$, can be in host or device memory.
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p info, or \p position is nullptr.
    !> \retval HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    !> \retval HIPSPARSE_STATUS_ZERO_PIVOT zero pivot has been found.
    function hipsparseXbsrsv2_zeroPivot(handle, info, position) &
       result(Xbsrsv2_zeroPivot) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseXbsrsv2_zeroPivot")
#else
       bind(C, name="hipsparseXbsrsv2_zeroPivot")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: info
       integer(c_int) :: position(*)
       integer(c_int) :: Xbsrsv2_zeroPivot
    end function hipsparseXbsrsv2_zeroPivot

    !---------------------------------------------
    ! hipsparseSbsrsv2_bufferSize
    !---------------------------------------------
    !> \ingroup level2_module
    !> \details
    !> \p hipsparseXbsrsv2_bufferSize returns the size of the temporary storage buffer in bytes
    !> that is required by \ref hipsparseSbsrsv2_analysis "hipsparseXbsrsv2_analysis()" and
    !> \ref hipsparseSbsrsv2_solve "hipsparseXbsrsv2_solve()". The temporary storage buffer must
    !> be allocated by the user.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> dirA        matrix storage of BSR blocks.
    !> @param[in]
    !> transA      matrix operation type.
    !> @param[in]
    !> mb          number of block rows of the sparse BSR matrix.
    !> @param[in]
    !> nnzb        number of non-zero blocks of the sparse BSR matrix.
    !> @param[in]
    !> descrA      descriptor of the sparse BSR matrix.
    !> @param[in]
    !> bsrSortedValA array of \p nnzb blocks of the sparse BSR matrix.
    !> @param[in]
    !> bsrSortedRowPtrA array of \p mb+1 elements that point to the start of every block row of
    !> the sparse BSR matrix.
    !> @param[in]
    !> bsrSortedColIndA array of \p nnz containing the block column indices of the sparse
    !> BSR matrix.
    !> @param[in]
    !> blockDim    block dimension of the sparse BSR matrix.
    !> @param[out]
    !> info        structure that holds the information collected during the analysis step.
    !> @param[out]
    !> pBufferSizeInBytes number of bytes of the temporary storage buffer required by
    !> \ref hipsparseSbsrsv2_analysis "hipsparseXbsrsv2_analysis()" and
    !> \ref hipsparseSbsrsv2_solve "hipsparseXbsrsv2_solve()".
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval     HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p mb, \p nnzb, \p blockDim,
    !> \p descr, \p bsrSortedValA, \p bsrSortedRowPtrA, \p bsrSortedColIndA,
    !> \p info, or \p pBufferSizeInBytes is invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    !> \retval     HIPSPARSE_STATUS_NOT_SUPPORTED
    !> \p transA == \ref HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE or
    !> \ref hipsparseMatrixType_t != \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseSbsrsv2_bufferSize(handle, dirA, transA, mb, nnzb, descrA, bsrSortedValA, &
                                         bsrSortedRowPtrA, bsrSortedColIndA, blockDim, info, &
                                         pBufferSizeInBytes) &
       result(Sbsrsv2_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSbsrsv2_bufferSize")
#else
       bind(C, name="hipsparseSbsrsv2_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: transA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       real(c_float) :: bsrSortedValA(*)
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int) :: pBufferSizeInBytes(*)
       integer(c_int) :: Sbsrsv2_bufferSize
    end function hipsparseSbsrsv2_bufferSize

    !---------------------------------------------
    ! hipsparseDbsrsv2_bufferSize
    !---------------------------------------------
    function hipsparseDbsrsv2_bufferSize(handle, dirA, transA, mb, nnzb, descrA, bsrSortedValA, &
                                         bsrSortedRowPtrA, bsrSortedColIndA, blockDim, info, &
                                         pBufferSizeInBytes) &
       result(Dbsrsv2_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDbsrsv2_bufferSize")
#else
       bind(C, name="hipsparseDbsrsv2_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: transA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       real(c_double) :: bsrSortedValA(*)
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int) :: pBufferSizeInBytes(*)
       integer(c_int) :: Dbsrsv2_bufferSize
    end function hipsparseDbsrsv2_bufferSize

    !---------------------------------------------
    ! hipsparseCbsrsv2_bufferSize
    !---------------------------------------------
    function hipsparseCbsrsv2_bufferSize(handle, dirA, transA, mb, nnzb, descrA, bsrSortedValA, &
                                         bsrSortedRowPtrA, bsrSortedColIndA, blockDim, info, &
                                         pBufferSizeInBytes) &
       result(Cbsrsv2_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCbsrsv2_bufferSize")
#else
       bind(C, name="hipsparseCbsrsv2_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: transA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       type(c_ptr), value :: bsrSortedValA
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int) :: pBufferSizeInBytes(*)
       integer(c_int) :: Cbsrsv2_bufferSize
    end function hipsparseCbsrsv2_bufferSize

    !---------------------------------------------
    ! hipsparseZbsrsv2_bufferSize
    !---------------------------------------------
    function hipsparseZbsrsv2_bufferSize(handle, dirA, transA, mb, nnzb, descrA, bsrSortedValA, &
                                         bsrSortedRowPtrA, bsrSortedColIndA, blockDim, info, &
                                         pBufferSizeInBytes) &
       result(Zbsrsv2_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZbsrsv2_bufferSize")
#else
       bind(C, name="hipsparseZbsrsv2_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: transA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       type(c_ptr), value :: bsrSortedValA
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int) :: pBufferSizeInBytes(*)
       integer(c_int) :: Zbsrsv2_bufferSize
    end function hipsparseZbsrsv2_bufferSize

    !---------------------------------------------
    ! hipsparseSbsrsv2_bufferSizeExt
    !---------------------------------------------
    !> \ingroup level2_module
    !> \details
    !> \p hipsparseXbsrsv2_bufferSizeExt returns the size of the temporary storage buffer in bytes
    !> that is required by \ref hipsparseSbsrsv2_analysis "hipsparseXbsrsv2_analysis()" and
    !> \ref hipsparseSbsrsv2_solve "hipsparseXbsrsv2_solve()". The temporary storage buffer must be
    !> allocated by the user.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> dirA        matrix storage of BSR blocks.
    !> @param[in]
    !> transA      matrix operation type.
    !> @param[in]
    !> mb          number of block rows of the sparse BSR matrix.
    !> @param[in]
    !> nnzb        number of non-zero blocks of the sparse BSR matrix.
    !> @param[in]
    !> descrA      descriptor of the sparse BSR matrix.
    !> @param[in]
    !> bsrSortedValA array of \p nnzb blocks of the sparse BSR matrix.
    !> @param[in]
    !> bsrSortedRowPtrA array of \p mb+1 elements that point to the start of every block row of
    !> the sparse BSR matrix.
    !> @param[in]
    !> bsrSortedColIndA array of \p nnz containing the block column indices of the sparse
    !> BSR matrix.
    !> @param[in]
    !> blockDim    block dimension of the sparse BSR matrix.
    !> @param[out]
    !> info        structure that holds the information collected during the analysis step.
    !> @param[out]
    !> pBufferSizeInBytes number of bytes of the temporary storage buffer required by
    !> \ref hipsparseSbsrsv2_analysis "hipsparseXbsrsv2_analysis()" and
    !> \ref hipsparseSbsrsv2_solve "hipsparseXbsrsv2_solve()".
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval     HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p mb, \p nnzb, \p blockDim,
    !> \p descr, \p bsrSortedValA, \p bsrSortedRowPtrA, \p bsrSortedColIndA,
    !> \p info, or \p pBufferSizeInBytes is invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    !> \retval     HIPSPARSE_STATUS_NOT_SUPPORTED
    !> \p transA == \ref HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE or
    !> \ref hipsparseMatrixType_t != \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseSbsrsv2_bufferSizeExt(handle, dirA, transA, mb, nnzb, descrA, bsrSortedValA, &
                                            bsrSortedRowPtrA, bsrSortedColIndA, blockDim, info, &
                                            pBufferSizeInBytes) &
       result(Sbsrsv2_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSbsrsv2_bufferSizeExt")
#else
       bind(C, name="hipsparseSbsrsv2_bufferSizeExt")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: transA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       real(c_float) :: bsrSortedValA(*)
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Sbsrsv2_bufferSizeExt
    end function hipsparseSbsrsv2_bufferSizeExt

    !---------------------------------------------
    ! hipsparseDbsrsv2_bufferSizeExt
    !---------------------------------------------
    function hipsparseDbsrsv2_bufferSizeExt(handle, dirA, transA, mb, nnzb, descrA, bsrSortedValA, &
                                            bsrSortedRowPtrA, bsrSortedColIndA, blockDim, info, &
                                            pBufferSizeInBytes) &
       result(Dbsrsv2_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDbsrsv2_bufferSizeExt")
#else
       bind(C, name="hipsparseDbsrsv2_bufferSizeExt")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: transA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       real(c_double) :: bsrSortedValA(*)
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Dbsrsv2_bufferSizeExt
    end function hipsparseDbsrsv2_bufferSizeExt

    !---------------------------------------------
    ! hipsparseCbsrsv2_bufferSizeExt
    !---------------------------------------------
    function hipsparseCbsrsv2_bufferSizeExt(handle, dirA, transA, mb, nnzb, descrA, bsrSortedValA, &
                                            bsrSortedRowPtrA, bsrSortedColIndA, blockDim, info, &
                                            pBufferSizeInBytes) &
       result(Cbsrsv2_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCbsrsv2_bufferSizeExt")
#else
       bind(C, name="hipsparseCbsrsv2_bufferSizeExt")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: transA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       type(c_ptr), value :: bsrSortedValA
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Cbsrsv2_bufferSizeExt
    end function hipsparseCbsrsv2_bufferSizeExt

    !---------------------------------------------
    ! hipsparseZbsrsv2_bufferSizeExt
    !---------------------------------------------
    function hipsparseZbsrsv2_bufferSizeExt(handle, dirA, transA, mb, nnzb, descrA, bsrSortedValA, &
                                            bsrSortedRowPtrA, bsrSortedColIndA, blockDim, info, &
                                            pBufferSizeInBytes) &
       result(Zbsrsv2_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZbsrsv2_bufferSizeExt")
#else
       bind(C, name="hipsparseZbsrsv2_bufferSizeExt")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: transA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       type(c_ptr), value :: bsrSortedValA
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Zbsrsv2_bufferSizeExt
    end function hipsparseZbsrsv2_bufferSizeExt

    !---------------------------------------------
    ! hipsparseSbsrsv2_analysis
    !---------------------------------------------
    !> \ingroup level2_module
    !> \details
    !> \p hipsparseXbsrsv2_analysis performs the analysis step for \ref hipsparseSbsrsv2_solve
    !> "hipsparseXbsrsv2_solve()". It is expected that this function will be executed only once
    !> for a given matrix and particular operation type.
    !>
    !> \note
    !> If the matrix sparsity pattern changes, the gathered information will become invalid.
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> dirA        matrix storage of BSR blocks.
    !> @param[in]
    !> transA      matrix operation type.
    !> @param[in]
    !> mb          number of block rows of the sparse BSR matrix.
    !> @param[in]
    !> nnzb        number of non-zero blocks of the sparse BSR matrix.
    !> @param[in]
    !> descrA      descriptor of the sparse BSR matrix.
    !> @param[in]
    !> bsrSortedValA array of \p nnzb blocks of the sparse BSR matrix.
    !> @param[in]
    !> bsrSortedRowPtrA array of \p mb+1 elements that point to the start of every block row of
    !> the sparse BSR matrix.
    !> @param[in]
    !> bsrSortedColIndA array of \p nnz containing the block column indices of the sparse
    !> BSR matrix.
    !> @param[in]
    !> blockDim    block dimension of the sparse BSR matrix.
    !> @param[out]
    !> info        structure that holds the information collected during
    !> the analysis step.
    !> @param[in]
    !> policy      \ref HIPSPARSE_SOLVE_POLICY_NO_LEVEL or
    !> \ref HIPSPARSE_SOLVE_POLICY_USE_LEVEL.
    !> @param[in]
    !> pBuffer     temporary storage buffer allocated by the user.
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval     HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p mb, \p nnzb, \p blockDim,
    !> \p descrA, \p bsrSortedRowPtrA, \p bsrSortedColIndA, \p info, or
    !> \p pBuffer is invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    !> \retval     HIPSPARSE_STATUS_NOT_SUPPORTED
    !> \p transA == \ref HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE or
    !> \ref hipsparseMatrixType_t != \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseSbsrsv2_analysis(handle, dirA, transA, mb, nnzb, descrA, bsrSortedValA, &
                                       bsrSortedRowPtrA, bsrSortedColIndA, blockDim, info, policy, &
                                       pBuffer) &
       result(Sbsrsv2_analysis) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSbsrsv2_analysis")
#else
       bind(C, name="hipsparseSbsrsv2_analysis")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: transA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       real(c_float) :: bsrSortedValA(*)
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Sbsrsv2_analysis
    end function hipsparseSbsrsv2_analysis

    !---------------------------------------------
    ! hipsparseDbsrsv2_analysis
    !---------------------------------------------
    function hipsparseDbsrsv2_analysis(handle, dirA, transA, mb, nnzb, descrA, bsrSortedValA, &
                                       bsrSortedRowPtrA, bsrSortedColIndA, blockDim, info, policy, &
                                       pBuffer) &
       result(Dbsrsv2_analysis) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDbsrsv2_analysis")
#else
       bind(C, name="hipsparseDbsrsv2_analysis")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: transA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       real(c_double) :: bsrSortedValA(*)
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Dbsrsv2_analysis
    end function hipsparseDbsrsv2_analysis

    !---------------------------------------------
    ! hipsparseCbsrsv2_analysis
    !---------------------------------------------
    function hipsparseCbsrsv2_analysis(handle, dirA, transA, mb, nnzb, descrA, bsrSortedValA, &
                                       bsrSortedRowPtrA, bsrSortedColIndA, blockDim, info, policy, &
                                       pBuffer) &
       result(Cbsrsv2_analysis) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCbsrsv2_analysis")
#else
       bind(C, name="hipsparseCbsrsv2_analysis")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: transA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       type(c_ptr), value :: bsrSortedValA
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Cbsrsv2_analysis
    end function hipsparseCbsrsv2_analysis

    !---------------------------------------------
    ! hipsparseZbsrsv2_analysis
    !---------------------------------------------
    function hipsparseZbsrsv2_analysis(handle, dirA, transA, mb, nnzb, descrA, bsrSortedValA, &
                                       bsrSortedRowPtrA, bsrSortedColIndA, blockDim, info, policy, &
                                       pBuffer) &
       result(Zbsrsv2_analysis) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZbsrsv2_analysis")
#else
       bind(C, name="hipsparseZbsrsv2_analysis")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: transA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       type(c_ptr), value :: bsrSortedValA
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Zbsrsv2_analysis
    end function hipsparseZbsrsv2_analysis

    !---------------------------------------------
    ! hipsparseSbsrsv2_solve
    !---------------------------------------------
    !> \ingroup level2_module
    !> \brief Sparse triangular solve using the BSR storage format.
    !>
    !> \details
    !> \p hipsparseXbsrsv2_solve solves a sparse triangular linear system of a sparse
    !> \f$m \times m\f$ matrix, defined in BSR storage format, a dense solution vector
    !> \f$y\f$ and the right-hand side \f$x\f$ that is multiplied by \f$\alpha\f$, such that
    !> \f[
    !> op(A) \cdot y = \alpha \cdot x,
    !> \f]
    !> with
    !> \f[
    !> op(A) = \left\{
    !> \begin{array}{ll}
    !> A,   & \text{if trans == HIPSPARSE_OPERATION_NON_TRANSPOSE} \\
    !> A^T, & \text{if trans == HIPSPARSE_OPERATION_TRANSPOSE}
    !> \end{array}
    !> \right.
    !> \f]
    !>
    !> Performing the above operation requires three steps. First, the user calls
    !> \ref hipsparseSbsrsv2_bufferSize "hipsparseXbsrsv2_bufferSize()", which will determine the
    !> size of the required
    !> temporary storage buffer. The user then allocates this buffer and calls
    !> \ref hipsparseSbsrsv2_analysis "hipsparseXbsrsv2_analysis()", which will perform analysis on
    !> the sparse matrix
    !> \f$op(A)\f$. Finally, the user completes the computation by calling \p
    !> hipsparseXbsrsv2_solve. The buffer size,
    !> buffer allocation, and analysis only need to be called once for a given sparse matrix
    !> \f$op(A)\f$, while the
    !> computation stage can be repeatedly used with different \f$x\f$ and \f$y\f$ vectors. After
    !> all calls to
    !> \p hipsparseXbsrsv2_solve are complete, the temporary buffer can be deallocated.
    !>
    !> Solving a triangular system involves inverting the diagonal blocks. This means that if the
    !> sparse matrix is
    !> missing the diagonal block (referred to as a structural zero) or the diagonal block is not
    !> invertible (referred
    !> to as a numerical zero) then a solution is not possible. \p hipsparseXbsrsv2_solve tracks the
    !> location of the first
    !> zero pivot (either numerical or structural zero). The zero pivot status can be checked
    !> calling \ref hipsparseXbsrsv2_zeroPivot().
    !> If \ref hipsparseXbsrsv2_zeroPivot() returns \ref HIPSPARSE_STATUS_SUCCESS, then no zero
    !> pivot was found and therefore
    !> the matrix does not have a structural or numerical zero.
    !>
    !> The user can specify that the sparse matrix should be interpreted as having identity blocks
    !> on the diagonal by setting the diagonal
    !> type on the descriptor \p descrA to \ref HIPSPARSE_DIAG_TYPE_UNIT using \ref
    !> hipsparseSetMatDiagType. If
    !> \ref hipsparseDiagType_t == \ref HIPSPARSE_DIAG_TYPE_UNIT, no zero pivot will be reported,
    !> even if the diagonal block \f$A_{j,j}\f$
    !> for some \f$j\f$ is not invertible.
    !>
    !> The sparse CSR matrix passed to \p hipsparseXbsrsv2_solve does not actually have to be a
    !> triangular matrix. Instead, the
    !> triangular upper or lower part of the sparse matrix is solved based on \ref
    !> hipsparseFillMode_t set on the descriptor
    !> \p descrA. If the fill mode is set to \ref HIPSPARSE_FILL_MODE_LOWER, then the lower
    !> triangular matrix is solved. If the
    !> fill mode is set to \ref HIPSPARSE_FILL_MODE_UPPER, then the upper triangular matrix is
    !> solved.
    !>
    !> \note
    !> The sparse BSR matrix has to be sorted.
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> \note
    !> Currently, only \p transA == \ref HIPSPARSE_OPERATION_NON_TRANSPOSE and
    !> \p transA == \ref HIPSPARSE_OPERATION_TRANSPOSE is supported.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> dirA        matrix storage of BSR blocks.
    !> @param[in]
    !> transA      matrix operation type.
    !> @param[in]
    !> mb          number of block rows of the sparse BSR matrix.
    !> @param[in]
    !> nnzb        number of non-zero blocks of the sparse BSR matrix.
    !> @param[in]
    !> alpha       scalar \f$\alpha\f$.
    !> @param[in]
    !> descrA      descriptor of the sparse BSR matrix.
    !> @param[in]
    !> bsrSortedValA array of \p nnzb blocks of the sparse BSR matrix.
    !> @param[in]
    !> bsrSortedRowPtrA array of \p mb+1 elements that point to the start of every block row of
    !> the sparse BSR matrix.
    !> @param[in]
    !> bsrSortedColIndA array of \p nnz containing the block column indices of the sparse
    !> BSR matrix.
    !> @param[in]
    !> blockDim    block dimension of the sparse BSR matrix.
    !> @param[in]
    !> info        structure that holds the information collected during the analysis step.
    !> @param[in]
    !> f           array of \p m elements, holding the right-hand side.
    !> @param[out]
    !> x           array of \p m elements, holding the solution.
    !> @param[in]
    !> policy      \ref HIPSPARSE_SOLVE_POLICY_NO_LEVEL or
    !> \ref HIPSPARSE_SOLVE_POLICY_USE_LEVEL.
    !> @param[in]
    !> pBuffer     temporary storage buffer allocated by the user.
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval     HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p mb, \p nnzb, \p blockDim,
    !> \p descrA, \p alpha, \p bsrSortedValA, \p bsrSortedRowPtrA, \p bsrSortedColIndA,
    !> \p f, or \p x is invalid.
    !> \retval     HIPSPARSE_STATUS_ARCH_MISMATCH the device is not supported.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    !> \retval     HIPSPARSE_STATUS_NOT_SUPPORTED
    !> \p transA == \ref HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE or
    !> \ref hipsparseMatrixType_t != \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseSbsrsv2_solve(handle, dirA, transA, mb, nnzb, alpha, descrA, bsrSortedValA, &
                                    bsrSortedRowPtrA, bsrSortedColIndA, blockDim, info, f, x, &
                                    policy, pBuffer) &
       result(Sbsrsv2_solve) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSbsrsv2_solve")
#else
       bind(C, name="hipsparseSbsrsv2_solve")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: transA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       real(c_float) :: alpha(*)
       type(c_ptr), value :: descrA
       real(c_float) :: bsrSortedValA(*)
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       real(c_float) :: f(*)
       real(c_float) :: x(*)
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Sbsrsv2_solve
    end function hipsparseSbsrsv2_solve

    !---------------------------------------------
    ! hipsparseDbsrsv2_solve
    !---------------------------------------------
    function hipsparseDbsrsv2_solve(handle, dirA, transA, mb, nnzb, alpha, descrA, bsrSortedValA, &
                                    bsrSortedRowPtrA, bsrSortedColIndA, blockDim, info, f, x, &
                                    policy, pBuffer) &
       result(Dbsrsv2_solve) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDbsrsv2_solve")
#else
       bind(C, name="hipsparseDbsrsv2_solve")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: transA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       real(c_double) :: alpha(*)
       type(c_ptr), value :: descrA
       real(c_double) :: bsrSortedValA(*)
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       real(c_double) :: f(*)
       real(c_double) :: x(*)
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Dbsrsv2_solve
    end function hipsparseDbsrsv2_solve

    !---------------------------------------------
    ! hipsparseCbsrsv2_solve
    !---------------------------------------------
    function hipsparseCbsrsv2_solve(handle, dirA, transA, mb, nnzb, alpha, descrA, bsrSortedValA, &
                                    bsrSortedRowPtrA, bsrSortedColIndA, blockDim, info, f, x, &
                                    policy, pBuffer) &
       result(Cbsrsv2_solve) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCbsrsv2_solve")
#else
       bind(C, name="hipsparseCbsrsv2_solve")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: transA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: alpha
       type(c_ptr), value :: descrA
       type(c_ptr), value :: bsrSortedValA
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       type(c_ptr), value :: f
       type(c_ptr), value :: x
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Cbsrsv2_solve
    end function hipsparseCbsrsv2_solve

    !---------------------------------------------
    ! hipsparseZbsrsv2_solve
    !---------------------------------------------
    function hipsparseZbsrsv2_solve(handle, dirA, transA, mb, nnzb, alpha, descrA, bsrSortedValA, &
                                    bsrSortedRowPtrA, bsrSortedColIndA, blockDim, info, f, x, &
                                    policy, pBuffer) &
       result(Zbsrsv2_solve) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZbsrsv2_solve")
#else
       bind(C, name="hipsparseZbsrsv2_solve")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: transA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: alpha
       type(c_ptr), value :: descrA
       type(c_ptr), value :: bsrSortedValA
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       type(c_ptr), value :: f
       type(c_ptr), value :: x
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Zbsrsv2_solve
    end function hipsparseZbsrsv2_solve

    !---------------------------------------------
    ! hipsparseSbsrxmv
    !---------------------------------------------
    !> \ingroup level2_module
    !> \brief Sparse matrix vector multiplication with mask operation using the BSR storage format.
    !>
    !> \details
    !> \p hipsparseXbsrxmv multiplies the scalar \f$\alpha\f$ with a sparse
    !> \f$(mb \times \text{blockDim}) \times (nb \times \text{blockDim})\f$
    !> modified matrix, defined in BSR storage format, and the dense vector \f$x\f$ and adds the
    !> result to the dense vector \f$y\f$ that is multiplied by the scalar \f$\beta\f$,
    !> such that
    !> \f[
    !> y := \left( \alpha \cdot op(A) \cdot x + \beta \cdot y \right)\left( \text{mask} \right),
    !> \f]
    !> with
    !> \f[
    !> op(A) = \left\{
    !> \begin{array}{ll}
    !> A,   & \text{if trans == HIPSPARSE_OPERATION_NON_TRANSPOSE} \\
    !> A^T, & \text{if trans == HIPSPARSE_OPERATION_TRANSPOSE} \\
    !> A^H, & \text{if trans == HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE}
    !> \end{array}
    !> \right.
    !> \f]
    !>
    !> The \f$\text{mask}\f$ is defined as an array of block row indices.
    !> The input sparse matrix is defined with a modified BSR storage format where the beginning and
    !> the end of each row
    !> is defined with two arrays, \p bsrRowPtr and \p bsr_end_ptr (both of size \p mb), rather the
    !> usual \p bsrRowPtr of size \p mb+1.
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> \note
    !> Currently, only \p trans == \ref HIPSPARSE_OPERATION_NON_TRANSPOSE is supported,
    !> and \p blockDim == 1 is not supported.
    !>
    !> \deprecated
    !> This function is deprecated when using the CUDA backend (CUDA 12.0+) and will be
    !> removed in CUDA 13.0. This deprecation does not apply to the ROCm backend.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> dir         matrix storage of BSR blocks.
    !> @param[in]
    !> trans       matrix operation type.
    !> @param[in]
    !> sizeOfMask  number of updated block rows of the array \p y. Must be non-negative and
    !> not greater than \p mb.
    !> @param[in]
    !> mb          number of block rows of the sparse BSR matrix. Must be non-negative.
    !> @param[in]
    !> nb          number of block columns of the sparse BSR matrix. Must be non-negative.
    !> @param[in]
    !> nnzb        number of non-zero blocks of the sparse BSR matrix. Must be non-negative.
    !> @param[in]
    !> alpha       scalar \f$\alpha\f$.
    !> @param[in]
    !> descr       descriptor of the sparse BSR matrix. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> bsrVal      array of \p nnzb blocks of the sparse BSR matrix.
    !> @param[in]
    !> bsrMaskPtr  array of \p sizeOfMask elements that give the indices of the updated block rows.
    !> @param[in]
    !> bsrRowPtr   array of \p mb elements that point to the start of every block row of
    !> the sparse BSR matrix.
    !> @param[in]
    !> bsrEndPtr   array of \p mb elements that point to the end of every block row of
    !> the sparse BSR matrix.
    !> @param[in]
    !> bsrColInd   array of \p nnzb elements containing the block column indices of the sparse
    !> BSR matrix.
    !> @param[in]
    !> blockDim    block dimension of the sparse BSR matrix. Must be greater than 1.
    !> @param[in]
    !> x           array of \p nb*blockDim elements (\f$op(A) = A\f$) or \p mb*blockDim
    !> elements (\f$op(A) = A^T\f$ or \f$op(A) = A^H\f$).
    !> @param[in]
    !> beta        scalar \f$\beta\f$.
    !> @param[inout]
    !> y           array of \p mb*blockDim elements (\f$op(A) = A\f$) or \p nb*blockDim
    !> elements (\f$op(A) = A^T\f$ or \f$op(A) = A^H\f$).
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p descr, \p alpha, or \p beta is nullptr,
    !> \p mb, \p nb, \p nnzb, or \p sizeOfMask is negative, \p sizeOfMask is greater than \p mb,
    !> \p blockDim is less than or equal to 1, or \p bsrVal, \p bsrMaskPtr, \p bsrRowPtr,
    !> \p bsrEndPtr, \p bsrColInd, \p x, or \p y is nullptr.
    !> \retval HIPSPARSE_STATUS_ARCH_MISMATCH the device is not supported.
    !> \retval HIPSPARSE_STATUS_NOT_SUPPORTED \p trans is not \ref
    !> HIPSPARSE_OPERATION_NON_TRANSPOSE,
    !> or \ref hipsparseMatrixType_t is not \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseSbsrxmv(handle, dir, trans, sizeOfMask, mb, nb, nnzb, alpha, descr, bsrVal, &
                              bsrMaskPtr, bsrRowPtr, bsrEndPtr, bsrColInd, blockDim, x, beta, y) &
       result(Sbsrxmv) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSbsrxmv")
#else
       bind(C, name="hipsparseSbsrxmv")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: dir
       integer(c_int), value :: trans
       integer(c_int), value :: sizeOfMask
       integer(c_int), value :: mb
       integer(c_int), value :: nb
       integer(c_int), value :: nnzb
       real(c_float) :: alpha(*)
       type(c_ptr), value :: descr
       real(c_float) :: bsrVal(*)
       integer(c_int) :: bsrMaskPtr(*)
       integer(c_int) :: bsrRowPtr(*)
       integer(c_int) :: bsrEndPtr(*)
       integer(c_int) :: bsrColInd(*)
       integer(c_int), value :: blockDim
       real(c_float) :: x(*)
       real(c_float) :: beta(*)
       real(c_float) :: y(*)
       integer(c_int) :: Sbsrxmv
    end function hipsparseSbsrxmv

    !---------------------------------------------
    ! hipsparseDbsrxmv
    !---------------------------------------------
    function hipsparseDbsrxmv(handle, dir, trans, sizeOfMask, mb, nb, nnzb, alpha, descr, bsrVal, &
                              bsrMaskPtr, bsrRowPtr, bsrEndPtr, bsrColInd, blockDim, x, beta, y) &
       result(Dbsrxmv) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDbsrxmv")
#else
       bind(C, name="hipsparseDbsrxmv")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: dir
       integer(c_int), value :: trans
       integer(c_int), value :: sizeOfMask
       integer(c_int), value :: mb
       integer(c_int), value :: nb
       integer(c_int), value :: nnzb
       real(c_double) :: alpha(*)
       type(c_ptr), value :: descr
       real(c_double) :: bsrVal(*)
       integer(c_int) :: bsrMaskPtr(*)
       integer(c_int) :: bsrRowPtr(*)
       integer(c_int) :: bsrEndPtr(*)
       integer(c_int) :: bsrColInd(*)
       integer(c_int), value :: blockDim
       real(c_double) :: x(*)
       real(c_double) :: beta(*)
       real(c_double) :: y(*)
       integer(c_int) :: Dbsrxmv
    end function hipsparseDbsrxmv

    !---------------------------------------------
    ! hipsparseCbsrxmv
    !---------------------------------------------
    function hipsparseCbsrxmv(handle, dir, trans, sizeOfMask, mb, nb, nnzb, alpha, descr, bsrVal, &
                              bsrMaskPtr, bsrRowPtr, bsrEndPtr, bsrColInd, blockDim, x, beta, y) &
       result(Cbsrxmv) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCbsrxmv")
#else
       bind(C, name="hipsparseCbsrxmv")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dir
       integer(c_int), value :: trans
       integer(c_int), value :: sizeOfMask
       integer(c_int), value :: mb
       integer(c_int), value :: nb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: alpha
       type(c_ptr), value :: descr
       type(c_ptr), value :: bsrVal
       integer(c_int) :: bsrMaskPtr(*)
       integer(c_int) :: bsrRowPtr(*)
       integer(c_int) :: bsrEndPtr(*)
       integer(c_int) :: bsrColInd(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: x
       type(c_ptr), value :: beta
       type(c_ptr), value :: y
       integer(c_int) :: Cbsrxmv
    end function hipsparseCbsrxmv

    !---------------------------------------------
    ! hipsparseZbsrxmv
    !---------------------------------------------
    function hipsparseZbsrxmv(handle, dir, trans, sizeOfMask, mb, nb, nnzb, alpha, descr, bsrVal, &
                              bsrMaskPtr, bsrRowPtr, bsrEndPtr, bsrColInd, blockDim, x, beta, y) &
       result(Zbsrxmv) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZbsrxmv")
#else
       bind(C, name="hipsparseZbsrxmv")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dir
       integer(c_int), value :: trans
       integer(c_int), value :: sizeOfMask
       integer(c_int), value :: mb
       integer(c_int), value :: nb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: alpha
       type(c_ptr), value :: descr
       type(c_ptr), value :: bsrVal
       integer(c_int) :: bsrMaskPtr(*)
       integer(c_int) :: bsrRowPtr(*)
       integer(c_int) :: bsrEndPtr(*)
       integer(c_int) :: bsrColInd(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: x
       type(c_ptr), value :: beta
       type(c_ptr), value :: y
       integer(c_int) :: Zbsrxmv
    end function hipsparseZbsrxmv

    !---------------------------------------------
    ! hipsparseScsrmv
    !---------------------------------------------
    !> \ingroup level2_module
    !> \brief Sparse matrix vector multiplication using the CSR storage format.
    !>
    !> \details
    !> \p hipsparseXcsrmv multiplies the scalar \f$\alpha\f$ with a sparse \f$m \times n\f$
    !> matrix, defined in CSR storage format, and the dense vector \f$x\f$ and adds the
    !> result to the dense vector \f$y\f$ that is multiplied by the scalar \f$\beta\f$,
    !> such that
    !> \f[
    !> y := \alpha \cdot op(A) \cdot x + \beta \cdot y,
    !> \f]
    !> with
    !> \f[
    !> op(A) = \left\{
    !> \begin{array}{ll}
    !> A,   & \text{if transA == HIPSPARSE_OPERATION_NON_TRANSPOSE} \\
    !> A^T, & \text{if transA == HIPSPARSE_OPERATION_TRANSPOSE} \\
    !> A^H, & \text{if transA == HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE}
    !> \end{array}
    !> \right.
    !> \f]
    !>
    !> \code{.c}
    !> for(i = 0; i < m; ++i)
    !> {
    !> y[i] = beta * y[i];
    !>
    !> for(j = csrRowPtr[i]; j < csrRowPtr[i + 1]; ++j)
    !> {
    !> y[i] = y[i] + alpha * csrVal[j] * x[csrColInd[j]];
    !> }
    !> }
    !> \endcode
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> \note
    !> Currently, only \p transA == \ref HIPSPARSE_OPERATION_NON_TRANSPOSE is supported.
    !>
    !> \deprecated
    !> This function is deprecated when using the CUDA backend (CUDA 10.0+) and will be
    !> removed in CUDA 11.0. This deprecation does not apply to the ROCm backend.
    !>
    !> @param[in]
    !> handle              handle to the hipSPARSE library context queue.
    !> @param[in]
    !> transA              matrix operation type.
    !> @param[in]
    !> m                   number of rows of the sparse CSR matrix. Must be non-negative.
    !> @param[in]
    !> n                   number of columns of the sparse CSR matrix. Must be non-negative.
    !> @param[in]
    !> nnz number of non-zero entries of the sparse CSR matrix. Must be non-negative.
    !> @param[in]
    !> alpha               scalar \f$\alpha\f$.
    !> @param[in]
    !> descrA              descriptor of the sparse CSR matrix. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> csrSortedValA       array of \p nnz elements of the sparse CSR matrix.
    !> @param[in]
    !> csrSortedRowPtrA    array of \p m+1 elements that point to the start
    !> of every row of the sparse CSR matrix.
    !> @param[in]
    !> csrSortedColIndA    array of \p nnz elements containing the column indices of the sparse
    !> CSR matrix.
    !> @param[in]
    !> x                   array of \p n elements (\f$op(A) == A\f$) or \p m elements
    !> (\f$op(A) == A^T\f$ or \f$op(A) == A^H\f$).
    !> @param[in]
    !> beta                scalar \f$\beta\f$.
    !> @param[inout]
    !> y                   array of \p m elements (\f$op(A) == A\f$) or \p n elements
    !> (\f$op(A) == A^T\f$ or \f$op(A) == A^H\f$).
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p descrA, \p alpha, or \p beta is nullptr,
    !> \p m, \p n, or \p nnz is negative, or \p csrSortedValA, \p csrSortedRowPtrA,
    !> \p csrSortedColIndA, \p x, or \p y is nullptr.
    !> \retval HIPSPARSE_STATUS_ARCH_MISMATCH the device is not supported.
    !> \retval HIPSPARSE_STATUS_NOT_SUPPORTED \ref hipsparseMatrixType_t is not
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseScsrmv(handle, transA, m, n, nnz, alpha, descrA, csrSortedValA, &
                             csrSortedRowPtrA, csrSortedColIndA, x, beta, y) &
       result(Scsrmv) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseScsrmv")
#else
       bind(C, name="hipsparseScsrmv")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       real(c_float) :: alpha(*)
       type(c_ptr), value :: descrA
       real(c_float) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       real(c_float) :: x(*)
       real(c_float) :: beta(*)
       real(c_float) :: y(*)
       integer(c_int) :: Scsrmv
    end function hipsparseScsrmv

    !---------------------------------------------
    ! hipsparseDcsrmv
    !---------------------------------------------
    function hipsparseDcsrmv(handle, transA, m, n, nnz, alpha, descrA, csrSortedValA, &
                             csrSortedRowPtrA, csrSortedColIndA, x, beta, y) &
       result(Dcsrmv) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDcsrmv")
#else
       bind(C, name="hipsparseDcsrmv")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       real(c_double) :: alpha(*)
       type(c_ptr), value :: descrA
       real(c_double) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       real(c_double) :: x(*)
       real(c_double) :: beta(*)
       real(c_double) :: y(*)
       integer(c_int) :: Dcsrmv
    end function hipsparseDcsrmv

    !---------------------------------------------
    ! hipsparseCcsrmv
    !---------------------------------------------
    function hipsparseCcsrmv(handle, transA, m, n, nnz, alpha, descrA, csrSortedValA, &
                             csrSortedRowPtrA, csrSortedColIndA, x, beta, y) &
       result(Ccsrmv) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCcsrmv")
#else
       bind(C, name="hipsparseCcsrmv")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       type(c_ptr), value :: alpha
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: x
       type(c_ptr), value :: beta
       type(c_ptr), value :: y
       integer(c_int) :: Ccsrmv
    end function hipsparseCcsrmv

    !---------------------------------------------
    ! hipsparseZcsrmv
    !---------------------------------------------
    function hipsparseZcsrmv(handle, transA, m, n, nnz, alpha, descrA, csrSortedValA, &
                             csrSortedRowPtrA, csrSortedColIndA, x, beta, y) &
       result(Zcsrmv) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZcsrmv")
#else
       bind(C, name="hipsparseZcsrmv")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       type(c_ptr), value :: alpha
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: x
       type(c_ptr), value :: beta
       type(c_ptr), value :: y
       integer(c_int) :: Zcsrmv
    end function hipsparseZcsrmv

    !---------------------------------------------
    ! hipsparseXcsrsv2_zeroPivot
    !---------------------------------------------
    !> \ingroup level2_module
    !> \details
    !> \p hipsparseXcsrsv2_zeroPivot returns \ref HIPSPARSE_STATUS_ZERO_PIVOT if either a
    !> structural or numerical zero has been found during hipsparseScsrsv2_solve(),
    !> hipsparseDcsrsv2_solve(), hipsparseCcsrsv2_solve(), or hipsparseZcsrsv2_solve()
    !> computation. The first zero pivot \f$j\f$ at \f$A_{j,j}\f$ is stored in \p position,
    !> using same index base as the CSR matrix.
    !>
    !> \p position can be in host or device memory. If no zero pivot has been found,
    !> \p position is set to -1 and \ref HIPSPARSE_STATUS_SUCCESS is returned instead.
    !>
    !> \note \p hipsparseXcsrsv2_zeroPivot is a blocking function. It might negatively
    !> influence performance.
    !>
    !> \deprecated
    !> This function is deprecated when using the CUDA backend (CUDA 11.0+) and will be
    !> removed in CUDA 12.0. This deprecation does not apply to the ROCm backend.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> info        structure that holds the information collected during the analysis step.
    !> @param[inout]
    !> position    pointer to zero pivot \f$j\f$, which can be in host or device memory.
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p info, or \p position is nullptr.
    !> \retval HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    !> \retval HIPSPARSE_STATUS_ZERO_PIVOT zero pivot has been found.
    function hipsparseXcsrsv2_zeroPivot(handle, info, position) &
       result(Xcsrsv2_zeroPivot) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseXcsrsv2_zeroPivot")
#else
       bind(C, name="hipsparseXcsrsv2_zeroPivot")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: info
       integer(c_int) :: position(*)
       integer(c_int) :: Xcsrsv2_zeroPivot
    end function hipsparseXcsrsv2_zeroPivot

    !---------------------------------------------
    ! hipsparseScsrsv2_bufferSize
    !---------------------------------------------
    !> \ingroup level2_module
    !> \details
    !> \p hipsparseXcsrsv2_bufferSize returns the size of the temporary storage buffer in bytes
    !> that is required by \ref hipsparseScsrsv2_analysis "hipsparseScsrsv2_analysis()" and
    !> \ref hipsparseScsrsv2_solve "hipsparseXcsrsv2_solve()". The temporary storage buffer must
    !> be allocated by the user.
    !>
    !> @param[in]
    !> handle           handle to the hipSPARSE library context queue.
    !> @param[in]
    !> transA           matrix operation type.
    !> @param[in]
    !> m                number of rows of the sparse CSR matrix.
    !> @param[in]
    !> nnz              number of non-zero entries of the sparse CSR matrix.
    !> @param[in]
    !> descrA           descriptor of the sparse CSR matrix.
    !> @param[in]
    !> csrSortedValA    array of \p nnz elements of the sparse CSR matrix.
    !> @param[in]
    !> csrSortedRowPtrA array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix.
    !> @param[in]
    !> csrSortedColIndA array of \p nnz elements containing the column indices of the sparse
    !> CSR matrix.
    !> @param[out]
    !> info             structure that holds the information collected during the analysis step.
    !> @param[out]
    !> pBufferSizeInBytes number of bytes of the temporary storage buffer required by
    !> \ref hipsparseScsrsv2_analysis "hipsparseXcsrsv2_analysis()" and
    !> \ref hipsparseScsrsv2_solve "hipsparseXcsrsv2_solve()".
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p nnz, \p descrA, \p csrSortedValA,
    !> \p csrSortedRowPtrA, \p csrSortedColIndA, \p info, or \p pBufferSizeInBytes is invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    !> \retval     HIPSPARSE_STATUS_NOT_SUPPORTED
    !> \p transA == \ref HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE or
    !> \ref hipsparseMatrixType_t != \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseScsrsv2_bufferSize(handle, transA, m, nnz, descrA, csrSortedValA, &
                                         csrSortedRowPtrA, csrSortedColIndA, info, &
                                         pBufferSizeInBytes) &
       result(Scsrsv2_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseScsrsv2_bufferSize")
#else
       bind(C, name="hipsparseScsrsv2_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       real(c_float) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       integer(c_int) :: pBufferSizeInBytes(*)
       integer(c_int) :: Scsrsv2_bufferSize
    end function hipsparseScsrsv2_bufferSize

    !---------------------------------------------
    ! hipsparseDcsrsv2_bufferSize
    !---------------------------------------------
    function hipsparseDcsrsv2_bufferSize(handle, transA, m, nnz, descrA, csrSortedValA, &
                                         csrSortedRowPtrA, csrSortedColIndA, info, &
                                         pBufferSizeInBytes) &
       result(Dcsrsv2_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDcsrsv2_bufferSize")
#else
       bind(C, name="hipsparseDcsrsv2_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       real(c_double) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       integer(c_int) :: pBufferSizeInBytes(*)
       integer(c_int) :: Dcsrsv2_bufferSize
    end function hipsparseDcsrsv2_bufferSize

    !---------------------------------------------
    ! hipsparseCcsrsv2_bufferSize
    !---------------------------------------------
    function hipsparseCcsrsv2_bufferSize(handle, transA, m, nnz, descrA, csrSortedValA, &
                                         csrSortedRowPtrA, csrSortedColIndA, info, &
                                         pBufferSizeInBytes) &
       result(Ccsrsv2_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCcsrsv2_bufferSize")
#else
       bind(C, name="hipsparseCcsrsv2_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       integer(c_int) :: pBufferSizeInBytes(*)
       integer(c_int) :: Ccsrsv2_bufferSize
    end function hipsparseCcsrsv2_bufferSize

    !---------------------------------------------
    ! hipsparseZcsrsv2_bufferSize
    !---------------------------------------------
    function hipsparseZcsrsv2_bufferSize(handle, transA, m, nnz, descrA, csrSortedValA, &
                                         csrSortedRowPtrA, csrSortedColIndA, info, &
                                         pBufferSizeInBytes) &
       result(Zcsrsv2_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZcsrsv2_bufferSize")
#else
       bind(C, name="hipsparseZcsrsv2_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       integer(c_int) :: pBufferSizeInBytes(*)
       integer(c_int) :: Zcsrsv2_bufferSize
    end function hipsparseZcsrsv2_bufferSize

    !---------------------------------------------
    ! hipsparseScsrsv2_bufferSizeExt
    !---------------------------------------------
    !> \ingroup level2_module
    !> \details
    !> \p hipsparseXcsrsv2_bufferSizeExt returns the size of the temporary storage buffer in bytes
    !> that is required by \ref hipsparseScsrsv2_analysis "hipsparseXcsrsv2_analysis()" and
    !> \ref hipsparseScsrsv2_solve "hipsparseScsrsv2_solve()". The temporary storage buffer must be
    !> allocated by the user.
    !>
    !> @param[in]
    !> handle           handle to the hipSPARSE library context queue.
    !> @param[in]
    !> transA           matrix operation type.
    !> @param[in]
    !> m                number of rows of the sparse CSR matrix.
    !> @param[in]
    !> nnz              number of non-zero entries of the sparse CSR matrix.
    !> @param[in]
    !> descrA           descriptor of the sparse CSR matrix.
    !> @param[in]
    !> csrSortedValA    array of \p nnz elements of the sparse CSR matrix.
    !> @param[in]
    !> csrSortedRowPtrA array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix.
    !> @param[in]
    !> csrSortedColIndA array of \p nnz elements containing the column indices of the sparse
    !> CSR matrix.
    !> @param[out]
    !> info             structure that holds the information collected during the analysis step.
    !> @param[out]
    !> pBufferSizeInBytes number of bytes of the temporary storage buffer required by
    !> \ref hipsparseScsrsv2_analysis "hipsparseXcsrsv2_analysis()" and
    !> \ref hipsparseScsrsv2_solve "hipsparseXcsrsv2_solve()".
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p nnz, \p descrA, \p csrSortedValA,
    !> \p csrSortedRowPtrA, \p csrSortedColIndA, \p info, or \p pBufferSizeInBytes is invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    !> \retval     HIPSPARSE_STATUS_NOT_SUPPORTED
    !> \p transA == \ref HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE or
    !> \ref hipsparseMatrixType_t != \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseScsrsv2_bufferSizeExt(handle, transA, m, nnz, descrA, csrSortedValA, &
                                            csrSortedRowPtrA, csrSortedColIndA, info, &
                                            pBufferSizeInBytes) &
       result(Scsrsv2_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseScsrsv2_bufferSizeExt")
#else
       bind(C, name="hipsparseScsrsv2_bufferSizeExt")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       real(c_float) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Scsrsv2_bufferSizeExt
    end function hipsparseScsrsv2_bufferSizeExt

    !---------------------------------------------
    ! hipsparseDcsrsv2_bufferSizeExt
    !---------------------------------------------
    function hipsparseDcsrsv2_bufferSizeExt(handle, transA, m, nnz, descrA, csrSortedValA, &
                                            csrSortedRowPtrA, csrSortedColIndA, info, &
                                            pBufferSizeInBytes) &
       result(Dcsrsv2_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDcsrsv2_bufferSizeExt")
#else
       bind(C, name="hipsparseDcsrsv2_bufferSizeExt")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       real(c_double) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Dcsrsv2_bufferSizeExt
    end function hipsparseDcsrsv2_bufferSizeExt

    !---------------------------------------------
    ! hipsparseCcsrsv2_bufferSizeExt
    !---------------------------------------------
    function hipsparseCcsrsv2_bufferSizeExt(handle, transA, m, nnz, descrA, csrSortedValA, &
                                            csrSortedRowPtrA, csrSortedColIndA, info, &
                                            pBufferSizeInBytes) &
       result(Ccsrsv2_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCcsrsv2_bufferSizeExt")
#else
       bind(C, name="hipsparseCcsrsv2_bufferSizeExt")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Ccsrsv2_bufferSizeExt
    end function hipsparseCcsrsv2_bufferSizeExt

    !---------------------------------------------
    ! hipsparseZcsrsv2_bufferSizeExt
    !---------------------------------------------
    function hipsparseZcsrsv2_bufferSizeExt(handle, transA, m, nnz, descrA, csrSortedValA, &
                                            csrSortedRowPtrA, csrSortedColIndA, info, &
                                            pBufferSizeInBytes) &
       result(Zcsrsv2_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZcsrsv2_bufferSizeExt")
#else
       bind(C, name="hipsparseZcsrsv2_bufferSizeExt")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Zcsrsv2_bufferSizeExt
    end function hipsparseZcsrsv2_bufferSizeExt

    !---------------------------------------------
    ! hipsparseScsrsv2_analysis
    !---------------------------------------------
    !> \ingroup level2_module
    !> \details
    !> \p hipsparseXcsrsv2_analysis performs the analysis step for
    !> \ref hipsparseScsrsv2_solve "hipsparseXcsrsv2_solve()". It is expected that this
    !> function will be executed only once for a given matrix and particular operation
    !> type.
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> @param[in]
    !> handle           handle to the hipSPARSE library context queue.
    !> @param[in]
    !> transA           matrix operation type.
    !> @param[in]
    !> m                number of rows of the sparse CSR matrix.
    !> @param[in]
    !> nnz              number of non-zero entries of the sparse CSR matrix.
    !> @param[in]
    !> descrA           descriptor of the sparse CSR matrix.
    !> @param[in]
    !> csrSortedValA    array of \p nnz elements of the sparse CSR matrix.
    !> @param[in]
    !> csrSortedRowPtrA array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix.
    !> @param[in]
    !> csrSortedColIndA array of \p nnz elements containing the column indices of the sparse
    !> CSR matrix.
    !> @param[out]
    !> info             structure that holds the information collected during
    !> the analysis step.
    !> @param[in]
    !> policy      \ref HIPSPARSE_SOLVE_POLICY_NO_LEVEL or
    !> \ref HIPSPARSE_SOLVE_POLICY_USE_LEVEL.
    !> @param[in]
    !> pBuffer     temporary storage buffer allocated by the user.
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval     HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p nnz, \p descr,
    !> \p csrSortedRowPtrA, \p csrSortedColIndA, \p info, or \p pBuffer is
    !> invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    !> \retval     HIPSPARSE_STATUS_NOT_SUPPORTED
    !> \p transA == \ref HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE or
    !> \ref hipsparseMatrixType_t != \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseScsrsv2_analysis(handle, transA, m, nnz, descrA, csrSortedValA, &
                                       csrSortedRowPtrA, csrSortedColIndA, info, policy, pBuffer) &
       result(Scsrsv2_analysis) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseScsrsv2_analysis")
#else
       bind(C, name="hipsparseScsrsv2_analysis")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       real(c_float) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Scsrsv2_analysis
    end function hipsparseScsrsv2_analysis

    !---------------------------------------------
    ! hipsparseDcsrsv2_analysis
    !---------------------------------------------
    function hipsparseDcsrsv2_analysis(handle, transA, m, nnz, descrA, csrSortedValA, &
                                       csrSortedRowPtrA, csrSortedColIndA, info, policy, pBuffer) &
       result(Dcsrsv2_analysis) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDcsrsv2_analysis")
#else
       bind(C, name="hipsparseDcsrsv2_analysis")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       real(c_double) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Dcsrsv2_analysis
    end function hipsparseDcsrsv2_analysis

    !---------------------------------------------
    ! hipsparseCcsrsv2_analysis
    !---------------------------------------------
    function hipsparseCcsrsv2_analysis(handle, transA, m, nnz, descrA, csrSortedValA, &
                                       csrSortedRowPtrA, csrSortedColIndA, info, policy, pBuffer) &
       result(Ccsrsv2_analysis) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCcsrsv2_analysis")
#else
       bind(C, name="hipsparseCcsrsv2_analysis")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Ccsrsv2_analysis
    end function hipsparseCcsrsv2_analysis

    !---------------------------------------------
    ! hipsparseZcsrsv2_analysis
    !---------------------------------------------
    function hipsparseZcsrsv2_analysis(handle, transA, m, nnz, descrA, csrSortedValA, &
                                       csrSortedRowPtrA, csrSortedColIndA, info, policy, pBuffer) &
       result(Zcsrsv2_analysis) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZcsrsv2_analysis")
#else
       bind(C, name="hipsparseZcsrsv2_analysis")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Zcsrsv2_analysis
    end function hipsparseZcsrsv2_analysis

    !---------------------------------------------
    ! hipsparseScsrsv2_solve
    !---------------------------------------------
    !> \ingroup level2_module
    !> \brief Sparse triangular solve using the CSR storage format
    !>
    !> \details
    !> \p hipsparseXcsrsv2_solve solves a sparse triangular linear system of a sparse
    !> \f$m \times m\f$ matrix, defined in CSR storage format, a dense solution vector
    !> \f$y\f$, and the right-hand side \f$x\f$ that is multiplied by \f$\alpha\f$, such that
    !> \f[
    !> op(A) \cdot y = \alpha \cdot x,
    !> \f]
    !> with
    !> \f[
    !> op(A) = \left\{
    !> \begin{array}{ll}
    !> A,   & \text{if trans == HIPSPARSE_OPERATION_NON_TRANSPOSE} \\
    !> A^T, & \text{if trans == HIPSPARSE_OPERATION_TRANSPOSE} \\
    !> A^H, & \text{if trans == HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE}
    !> \end{array}
    !> \right.
    !> \f]
    !>
    !> Performing the above operation requires three steps. First, the user calls
    !> \ref hipsparseScsrsv2_bufferSize "hipsparseXcsrsv2_bufferSize()" (or
    !> \ref hipsparseScsrsv2_bufferSizeExt "hipsparseXcsrsv2_bufferSizeExt()") which will determine
    !> the size of the
    !> required temporary storage buffer. The user then allocates this buffer and calls
    !> \ref hipsparseScsrsv2_analysis "hipsparseXcsrsv2_analysis()" which will perform analysis on
    !> the sparse matrix
    !> \f$op(A)\f$. Finally, the user completes the computation by calling \p
    !> hipsparseXcsrsv2_solve. The buffer size,
    !> buffer allocation, and analysis only need to be called once for a given sparse matrix
    !> \f$op(A)\f$, while the
    !> computation stage can be repeatedly used with different \f$x\f$ and \f$y\f$ vectors. After
    !> all calls to
    !> \p hipsparseXcsrsv2_solve are complete, the temporary buffer can be deallocated.
    !>
    !> Solving a triangular system involves division by the diagonal elements. This means that if
    !> the sparse matrix is
    !> missing the diagonal entry (referred to as a structural zero) or the diagonal entry is zero
    !> (referred to as a numerical zero),
    !> then a division by zero would occur. \p hipsparseXcsrsv2_solve tracks the location of the
    !> first zero pivot (either numerical
    !> or structural zero). The zero pivot status can be checked by calling \ref
    !> hipsparseXcsrsv2_zeroPivot(). If
    !> \ref hipsparseXcsrsv2_zeroPivot() returns \ref HIPSPARSE_STATUS_SUCCESS, then no zero pivot
    !> was found and therefore
    !> the matrix does not have a structural or numerical zero.
    !>
    !> The user can specify that the sparse matrix should be interpreted as having ones on the
    !> diagonal by setting the diagonal type
    !> on the descriptor \p descrA to \ref HIPSPARSE_DIAG_TYPE_UNIT using \ref
    !> hipsparseSetMatDiagType. If
    !> \ref hipsparseDiagType_t == \ref HIPSPARSE_DIAG_TYPE_UNIT, no zero pivot will be reported,
    !> even if \f$A_{j,j} = 0\f$ for
    !> some \f$j\f$.
    !>
    !> The sparse CSR matrix passed to \p hipsparseXcsrsv2_solve does not actually have to be a
    !> triangular matrix. Instead, the
    !> triangular upper or lower part of the sparse matrix is solved based on \ref
    !> hipsparseFillMode_t set on the descriptor
    !> \p descrA. If the fill mode is set to \ref HIPSPARSE_FILL_MODE_LOWER, then the lower
    !> triangular matrix is solved. If the
    !> fill mode is set to \ref HIPSPARSE_FILL_MODE_UPPER, then the upper triangular matrix is
    !> solved.
    !>
    !> \note
    !> The sparse CSR matrix has to be sorted. This can be achieved by calling
    !> hipsparseXcsrsort().
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> \note
    !> Currently, only \p transA == \ref HIPSPARSE_OPERATION_NON_TRANSPOSE and
    !> \p transA == \ref HIPSPARSE_OPERATION_TRANSPOSE is supported.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> transA      matrix operation type.
    !> @param[in]
    !> m           number of rows of the sparse CSR matrix.
    !> @param[in]
    !> nnz         number of non-zero entries of the sparse CSR matrix.
    !> @param[in]
    !> alpha       scalar \f$\alpha\f$.
    !> @param[in]
    !> descrA      descriptor of the sparse CSR matrix.
    !> @param[in]
    !> csrSortedValA array of \p nnz elements of the sparse CSR matrix.
    !> @param[in]
    !> csrSortedRowPtrA array of \p m+1 elements that point to the start
    !> of every row of the sparse CSR matrix.
    !> @param[in]
    !> csrSortedColIndA array of \p nnz elements containing the column indices of the sparse
    !> CSR matrix.
    !> @param[in]
    !> info        structure that holds the information collected during the analysis step.
    !> @param[in]
    !> f           array of \p m elements, holding the right-hand side.
    !> @param[out]
    !> x           array of \p m elements, holding the solution.
    !> @param[in]
    !> policy      \ref HIPSPARSE_SOLVE_POLICY_NO_LEVEL or
    !> \ref HIPSPARSE_SOLVE_POLICY_USE_LEVEL.
    !> @param[in]
    !> pBuffer     temporary storage buffer allocated by the user.
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval     HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p nnz, \p descrA,
    !> \p alpha, \p csrSortedValA, \p csrSortedRowPtrA, \p csrSortedColIndA,
    !> \p f, or \p x is invalid.
    !> \retval     HIPSPARSE_STATUS_ARCH_MISMATCH the device is not supported.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    !> \retval     HIPSPARSE_STATUS_NOT_SUPPORTED
    !> \p transA == \ref HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE or
    !> \ref hipsparseMatrixType_t != \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseScsrsv2_solve(handle, transA, m, nnz, alpha, descrA, csrSortedValA, &
                                    csrSortedRowPtrA, csrSortedColIndA, info, f, x, policy, &
                                    pBuffer) &
       result(Scsrsv2_solve) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseScsrsv2_solve")
#else
       bind(C, name="hipsparseScsrsv2_solve")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       real(c_float) :: alpha(*)
       type(c_ptr), value :: descrA
       real(c_float) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       real(c_float) :: f(*)
       real(c_float) :: x(*)
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Scsrsv2_solve
    end function hipsparseScsrsv2_solve

    !---------------------------------------------
    ! hipsparseDcsrsv2_solve
    !---------------------------------------------
    function hipsparseDcsrsv2_solve(handle, transA, m, nnz, alpha, descrA, csrSortedValA, &
                                    csrSortedRowPtrA, csrSortedColIndA, info, f, x, policy, &
                                    pBuffer) &
       result(Dcsrsv2_solve) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDcsrsv2_solve")
#else
       bind(C, name="hipsparseDcsrsv2_solve")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       real(c_double) :: alpha(*)
       type(c_ptr), value :: descrA
       real(c_double) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       real(c_double) :: f(*)
       real(c_double) :: x(*)
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Dcsrsv2_solve
    end function hipsparseDcsrsv2_solve

    !---------------------------------------------
    ! hipsparseCcsrsv2_solve
    !---------------------------------------------
    function hipsparseCcsrsv2_solve(handle, transA, m, nnz, alpha, descrA, csrSortedValA, &
                                    csrSortedRowPtrA, csrSortedColIndA, info, f, x, policy, &
                                    pBuffer) &
       result(Ccsrsv2_solve) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCcsrsv2_solve")
#else
       bind(C, name="hipsparseCcsrsv2_solve")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: alpha
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: f
       type(c_ptr), value :: x
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Ccsrsv2_solve
    end function hipsparseCcsrsv2_solve

    !---------------------------------------------
    ! hipsparseZcsrsv2_solve
    !---------------------------------------------
    function hipsparseZcsrsv2_solve(handle, transA, m, nnz, alpha, descrA, csrSortedValA, &
                                    csrSortedRowPtrA, csrSortedColIndA, info, f, x, policy, &
                                    pBuffer) &
       result(Zcsrsv2_solve) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZcsrsv2_solve")
#else
       bind(C, name="hipsparseZcsrsv2_solve")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: alpha
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: f
       type(c_ptr), value :: x
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Zcsrsv2_solve
    end function hipsparseZcsrsv2_solve

    !---------------------------------------------
    ! hipsparseSgemvi_bufferSize
    !---------------------------------------------
    !> \ingroup level2_module
    !> \details
    !> \p hipsparseXgemvi_bufferSize returns the size of the temporary storage buffer in bytes
    !> required by \ref hipsparseSgemvi "hipsparseXgemvi()". The temporary storage buffer must
    !> be allocated by the user.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> transA      matrix operation type.
    !> @param[in]
    !> m           number of rows of the dense matrix.
    !> @param[in]
    !> n           number of columns of the dense matrix.
    !> @param[in]
    !> nnz         number of non-zero entries in the sparse vector.
    !> @param[out]
    !> pBufferSizeInBytes temporary storage buffer size.
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval     HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p n, \p nnz, or
    !> \p pBufferSizeInBytes is invalid.
    !> \retval     HIPSPARSE_STATUS_NOT_SUPPORTED
    !> \p transA != \ref HIPSPARSE_OPERATION_NON_TRANSPOSE or
    !> \ref hipsparseMatrixType_t != \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseSgemvi_bufferSize(handle, transA, m, n, nnz, pBufferSizeInBytes) &
       result(Sgemvi_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSgemvi_bufferSize")
#else
       bind(C, name="hipsparseSgemvi_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       integer(c_int) :: pBufferSizeInBytes(*)
       integer(c_int) :: Sgemvi_bufferSize
    end function hipsparseSgemvi_bufferSize

    !---------------------------------------------
    ! hipsparseDgemvi_bufferSize
    !---------------------------------------------
    function hipsparseDgemvi_bufferSize(handle, transA, m, n, nnz, pBufferSizeInBytes) &
       result(Dgemvi_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDgemvi_bufferSize")
#else
       bind(C, name="hipsparseDgemvi_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       integer(c_int) :: pBufferSizeInBytes(*)
       integer(c_int) :: Dgemvi_bufferSize
    end function hipsparseDgemvi_bufferSize

    !---------------------------------------------
    ! hipsparseCgemvi_bufferSize
    !---------------------------------------------
    function hipsparseCgemvi_bufferSize(handle, transA, m, n, nnz, pBufferSizeInBytes) &
       result(Cgemvi_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCgemvi_bufferSize")
#else
       bind(C, name="hipsparseCgemvi_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       integer(c_int) :: pBufferSizeInBytes(*)
       integer(c_int) :: Cgemvi_bufferSize
    end function hipsparseCgemvi_bufferSize

    !---------------------------------------------
    ! hipsparseZgemvi_bufferSize
    !---------------------------------------------
    function hipsparseZgemvi_bufferSize(handle, transA, m, n, nnz, pBufferSizeInBytes) &
       result(Zgemvi_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZgemvi_bufferSize")
#else
       bind(C, name="hipsparseZgemvi_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       integer(c_int) :: pBufferSizeInBytes(*)
       integer(c_int) :: Zgemvi_bufferSize
    end function hipsparseZgemvi_bufferSize

    !---------------------------------------------
    ! hipsparseSgemvi
    !---------------------------------------------
    !> \ingroup level2_module
    !> \brief Dense matrix sparse vector multiplication
    !>
    !> \details
    !> \p hipsparseXgemvi multiplies the scalar \f$\alpha\f$ with a dense \f$m \times n\f$
    !> matrix \f$A\f$ and the sparse vector \f$x\f$ and adds the result to the dense vector
    !> \f$y\f$ that is multiplied by the scalar \f$\beta\f$, such that
    !> \f[
    !> y := \alpha \cdot op(A) \cdot x + \beta \cdot y,
    !> \f]
    !> with
    !> \f[
    !> op(A) = \left\{
    !> \begin{array}{ll}
    !> A,   & \text{if transA == HIPSPARSE_OPERATION_NON_TRANSPOSE}
    !> \end{array}
    !> \right.
    !> \f]
    !>
    !> Performing the above operation involves two steps. First, the user calls
    !> \ref hipsparseSgemvi_bufferSize "hipsparseXgemvi_bufferSize()" to determine the size of
    !> the temporary storage buffer. Next, the user allocates this temporary buffer and passes it to
    !> \p hipsparseXgemvi to complete the computation. After all calls to \p hipsparseXgemvi are
    !> complete, the
    !> temporary storage buffer can be freed.
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> \note
    !> Currently, only \p transA == \ref HIPSPARSE_OPERATION_NON_TRANSPOSE is supported.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> transA      matrix operation type.
    !> @param[in]
    !> m           number of rows of the dense matrix.
    !> @param[in]
    !> n           number of columns of the dense matrix.
    !> @param[in]
    !> alpha       scalar \f$\alpha\f$.
    !> @param[in]
    !> A           pointer to the dense matrix.
    !> @param[in]
    !> lda         leading dimension of the dense matrix.
    !> @param[in]
    !> nnz         number of non-zero entries in the sparse vector.
    !> @param[in]
    !> x           array of \p nnz elements containing the values of the sparse vector.
    !> @param[in]
    !> xInd        array of \p nnz elements containing the indices of the sparse vector.
    !> @param[in]
    !> beta        scalar \f$\beta\f$.
    !> @param[inout]
    !> y           array of \p m elements (\f$op(A) == A\f$) or \p n elements
    !> (\f$op(A) == A^T\f$ or \f$op(A) == A^H\f$).
    !> @param[in]
    !> idxBase     \ref HIPSPARSE_INDEX_BASE_ZERO or \ref HIPSPARSE_INDEX_BASE_ONE.
    !> @param[in]
    !> pBuffer     temporary storage buffer.
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval     HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p n, \p lda, \p nnz, \p alpha,
    !> \p A, \p x, \p xInd, \p beta, \p y, or \p pBuffer is invalid.
    !> \retval     HIPSPARSE_STATUS_NOT_SUPPORTED
    !> \p transA != \ref HIPSPARSE_OPERATION_NON_TRANSPOSE or
    !> \ref hipsparseMatrixType_t != \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseSgemvi(handle, transA, m, n, alpha, A, lda, nnz, x, xInd, beta, y, idxBase, &
                             pBuffer) &
       result(Sgemvi) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSgemvi")
#else
       bind(C, name="hipsparseSgemvi")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: alpha(*)
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       integer(c_int), value :: nnz
       real(c_float) :: x(*)
       integer(c_int) :: xInd(*)
       real(c_float) :: beta(*)
       real(c_float) :: y(*)
       integer(c_int), value :: idxBase
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Sgemvi
    end function hipsparseSgemvi

    !---------------------------------------------
    ! hipsparseDgemvi
    !---------------------------------------------
    function hipsparseDgemvi(handle, transA, m, n, alpha, A, lda, nnz, x, xInd, beta, y, idxBase, &
                             pBuffer) &
       result(Dgemvi) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDgemvi")
#else
       bind(C, name="hipsparseDgemvi")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: alpha(*)
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       integer(c_int), value :: nnz
       real(c_double) :: x(*)
       integer(c_int) :: xInd(*)
       real(c_double) :: beta(*)
       real(c_double) :: y(*)
       integer(c_int), value :: idxBase
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Dgemvi
    end function hipsparseDgemvi

    !---------------------------------------------
    ! hipsparseCgemvi
    !---------------------------------------------
    function hipsparseCgemvi(handle, transA, m, n, alpha, A, lda, nnz, x, xInd, beta, y, idxBase, &
                             pBuffer) &
       result(Cgemvi) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCgemvi")
#else
       bind(C, name="hipsparseCgemvi")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: alpha
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int), value :: nnz
       type(c_ptr), value :: x
       integer(c_int) :: xInd(*)
       type(c_ptr), value :: beta
       type(c_ptr), value :: y
       integer(c_int), value :: idxBase
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Cgemvi
    end function hipsparseCgemvi

    !---------------------------------------------
    ! hipsparseZgemvi
    !---------------------------------------------
    function hipsparseZgemvi(handle, transA, m, n, alpha, A, lda, nnz, x, xInd, beta, y, idxBase, &
                             pBuffer) &
       result(Zgemvi) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZgemvi")
#else
       bind(C, name="hipsparseZgemvi")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: alpha
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int), value :: nnz
       type(c_ptr), value :: x
       integer(c_int) :: xInd(*)
       type(c_ptr), value :: beta
       type(c_ptr), value :: y
       integer(c_int), value :: idxBase
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Zgemvi
    end function hipsparseZgemvi

    !---------------------------------------------
    ! hipsparseShybmv
    !---------------------------------------------
    !> \ingroup level2_module
    !> \brief Sparse matrix vector multiplication using the HYB storage format.
    !>
    !> \details
    !> \p hipsparseXhybmv multiplies the scalar \f$\alpha\f$ with a sparse \f$m \times n\f$
    !> matrix, defined in HYB storage format, and the dense vector \f$x\f$ and adds the
    !> result to the dense vector \f$y\f$ that is multiplied by the scalar \f$\beta\f$,
    !> such that
    !> \f[
    !> y := \alpha \cdot op(A) \cdot x + \beta \cdot y,
    !> \f]
    !> with
    !> \f[
    !> op(A) = \left\{
    !> \begin{array}{ll}
    !> A,   & \text{if transA == HIPSPARSE_OPERATION_NON_TRANSPOSE}
    !> \end{array}
    !> \right.
    !> \f]
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> \note
    !> Currently, only \p transA == \ref HIPSPARSE_OPERATION_NON_TRANSPOSE is supported.
    !>
    !> \deprecated
    !> This function is deprecated when using the CUDA backend (CUDA 10.0+) and will be
    !> removed in CUDA 11.0. This deprecation does not apply to the ROCm backend.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> transA      matrix operation type.
    !> @param[in]
    !> alpha       scalar \f$\alpha\f$.
    !> @param[in]
    !> descrA      descriptor of the sparse HYB matrix. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> hybA        matrix in HYB storage format.
    !> @param[in]
    !> x           array of \p n elements (\f$op(A) == A\f$) or \p m elements
    !> (\f$op(A) == A^T\f$ or \f$op(A) == A^H\f$).
    !> @param[in]
    !> beta        scalar \f$\beta\f$.
    !> @param[inout]
    !> y           array of \p m elements (\f$op(A) == A\f$) or \p n elements
    !> (\f$op(A) == A^T\f$ or \f$op(A) == A^H\f$).
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p descrA, \p alpha, \p beta, or \p hybA is
    !> nullptr,
    !> or \p x or \p y is nullptr.
    !> \retval HIPSPARSE_STATUS_ARCH_MISMATCH the device is not supported.
    !> \retval HIPSPARSE_STATUS_ALLOC_FAILED the buffer could not be allocated.
    !> \retval HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    !> \retval HIPSPARSE_STATUS_NOT_SUPPORTED \p transA is not \ref
    !> HIPSPARSE_OPERATION_NON_TRANSPOSE
    !> or \ref hipsparseMatrixType_t is not \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseShybmv(handle, transA, alpha, descrA, hybA, x, beta, y) &
       result(Shybmv) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseShybmv")
#else
       bind(C, name="hipsparseShybmv")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       real(c_float) :: alpha(*)
       type(c_ptr), value :: descrA
       type(c_ptr), value :: hybA
       real(c_float) :: x(*)
       real(c_float) :: beta(*)
       real(c_float) :: y(*)
       integer(c_int) :: Shybmv
    end function hipsparseShybmv

    !---------------------------------------------
    ! hipsparseDhybmv
    !---------------------------------------------
    function hipsparseDhybmv(handle, transA, alpha, descrA, hybA, x, beta, y) &
       result(Dhybmv) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDhybmv")
#else
       bind(C, name="hipsparseDhybmv")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       real(c_double) :: alpha(*)
       type(c_ptr), value :: descrA
       type(c_ptr), value :: hybA
       real(c_double) :: x(*)
       real(c_double) :: beta(*)
       real(c_double) :: y(*)
       integer(c_int) :: Dhybmv
    end function hipsparseDhybmv

    !---------------------------------------------
    ! hipsparseChybmv
    !---------------------------------------------
    function hipsparseChybmv(handle, transA, alpha, descrA, hybA, x, beta, y) &
       result(Chybmv) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseChybmv")
#else
       bind(C, name="hipsparseChybmv")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       type(c_ptr), value :: alpha
       type(c_ptr), value :: descrA
       type(c_ptr), value :: hybA
       type(c_ptr), value :: x
       type(c_ptr), value :: beta
       type(c_ptr), value :: y
       integer(c_int) :: Chybmv
    end function hipsparseChybmv

    !---------------------------------------------
    ! hipsparseZhybmv
    !---------------------------------------------
    function hipsparseZhybmv(handle, transA, alpha, descrA, hybA, x, beta, y) &
       result(Zhybmv) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZhybmv")
#else
       bind(C, name="hipsparseZhybmv")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       type(c_ptr), value :: alpha
       type(c_ptr), value :: descrA
       type(c_ptr), value :: hybA
       type(c_ptr), value :: x
       type(c_ptr), value :: beta
       type(c_ptr), value :: y
       integer(c_int) :: Zhybmv
    end function hipsparseZhybmv

    !---------------------------------------------
    ! hipsparseSbsrmm
    !---------------------------------------------
    !> \ingroup level3_module
    !> \brief Sparse matrix dense matrix multiplication using the BSR storage format.
    !>
    !> \details
    !> \p hipsparseXbsrmm multiplies the scalar \f$\alpha\f$ with a sparse \f$m \times k\f$
    !> matrix \f$A\f$, defined in BSR storage format, and the column-oriented dense \f$k \times n\f$
    !> matrix \f$B\f$ and adds the result to the column-oriented dense \f$m \times n\f$ matrix
    !> \f$C\f$ that
    !> is multiplied by the scalar \f$\beta\f$, such that
    !> \f[
    !> C := \alpha \cdot op(A) \cdot op(B) + \beta \cdot C,
    !> \f]
    !> with
    !> \f[
    !> op(A) = \left\{
    !> \begin{array}{ll}
    !> A,   & \text{if transA == HIPSPARSE_OPERATION_NON_TRANSPOSE} \\
    !> \end{array}
    !> \right.
    !> \f]
    !> and
    !> \f[
    !> op(B) = \left\{
    !> \begin{array}{ll}
    !> B,   & \text{if transB == HIPSPARSE_OPERATION_NON_TRANSPOSE} \\
    !> B^T, & \text{if transB == HIPSPARSE_OPERATION_TRANSPOSE} \\
    !> \end{array}
    !> \right.
    !> \f]
    !> and where \f$k = blockDim \times kb\f$ and \f$m = blockDim \times mb\f$.
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> \note
    !> Currently, only \p transA == \ref HIPSPARSE_OPERATION_NON_TRANSPOSE is supported.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> dirA the storage format of the blocks. Can be \ref HIPSPARSE_DIRECTION_ROW or \ref
    !> HIPSPARSE_DIRECTION_COLUMN.
    !> @param[in]
    !> transA matrix \f$A\f$ operation type. Currently, only \ref HIPSPARSE_OPERATION_NON_TRANSPOSE
    !> is supported.
    !> @param[in]
    !> transB matrix \f$B\f$ operation type. Currently, only \ref HIPSPARSE_OPERATION_NON_TRANSPOSE
    !> and \ref HIPSPARSE_OPERATION_TRANSPOSE
    !> are supported.
    !> @param[in]
    !> mb          number of block rows of the sparse BSR matrix \f$A\f$. Must be non-negative.
    !> @param[in]
    !> n number of columns of the dense matrix \f$op(B)\f$ and \f$C\f$. Must be non-negative.
    !> @param[in]
    !> kb          number of block columns of the sparse BSR matrix \f$A\f$. Must be non-negative.
    !> @param[in]
    !> nnzb        number of non-zero blocks of the sparse BSR matrix \f$A\f$. Must be non-negative.
    !> @param[in]
    !> alpha       scalar \f$\alpha\f$.
    !> @param[in]
    !> descrA      descriptor of the sparse BSR matrix \f$A\f$. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> bsrValA     array of \p nnzb*blockDim*blockDim elements of the sparse BSR matrix \f$A\f$.
    !> @param[in]
    !> bsrRowPtrA  array of \p mb+1 elements that point to the start of every block row of the
    !> sparse BSR matrix \f$A\f$.
    !> @param[in]
    !> bsrColIndA  array of \p nnzb elements containing the block column indices of the sparse
    !> BSR matrix \f$A\f$.
    !> @param[in]
    !> blockDim    size of the blocks in the sparse BSR matrix. Must be positive.
    !> @param[in]
    !> B           array of dimension \p ldb*n (\f$op(B) == B\f$),
    !> \p ldb*k otherwise.
    !> @param[in]
    !> ldb leading dimension of \f$B\f$, must be at least \f$\max{(1, k)}\f$ (\f$ op(B) == B\f$)
    !> where \p k=blockDim*kb,
    !> \f$\max{(1, n)}\f$ otherwise.
    !> @param[in]
    !> beta        scalar \f$\beta\f$.
    !> @param[inout]
    !> C           array of dimension \p ldc*n.
    !> @param[in]
    !> ldc leading dimension of \f$C\f$, must be at least \f$\max{(1, m)}\f$ (\f$ op(A) == A\f$)
    !> where \p m=blockDim*mb,
    !> \f$\max{(1, k)}\f$ where \p k=blockDim*kb otherwise.
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p descrA, \p alpha, or \p beta is nullptr,
    !> \p mb, \p n, \p kb, or \p nnzb is negative, \p ldb or \p ldc is invalid,
    !> \p blockDim is less than or equal to zero, or \p bsrValA, \p bsrRowPtrA, \p bsrColIndA,
    !> \p B, or \p C is nullptr.
    !> \retval HIPSPARSE_STATUS_ARCH_MISMATCH the device is not supported.
    !> \retval HIPSPARSE_STATUS_NOT_SUPPORTED \p transA is not \ref
    !> HIPSPARSE_OPERATION_NON_TRANSPOSE,
    !> \p transB is \ref HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE, or
    !> \ref hipsparseMatrixType_t is not \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseSbsrmm(handle, dirA, transA, transB, mb, n, kb, nnzb, alpha, descrA, &
                             bsrValA, bsrRowPtrA, bsrColIndA, blockDim, B, ldb, beta, C, ldc) &
       result(Sbsrmm) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSbsrmm")
#else
       bind(C, name="hipsparseSbsrmm")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: transA
       integer(c_int), value :: transB
       integer(c_int), value :: mb
       integer(c_int), value :: n
       integer(c_int), value :: kb
       integer(c_int), value :: nnzb
       real(c_float) :: alpha(*)
       type(c_ptr), value :: descrA
       real(c_float) :: bsrValA(*)
       integer(c_int) :: bsrRowPtrA(*)
       integer(c_int) :: bsrColIndA(*)
       integer(c_int), value :: blockDim
       real(c_float) :: B(*)
       integer(c_int), value :: ldb
       real(c_float) :: beta(*)
       real(c_float) :: C(*)
       integer(c_int), value :: ldc
       integer(c_int) :: Sbsrmm
    end function hipsparseSbsrmm

    !---------------------------------------------
    ! hipsparseDbsrmm
    !---------------------------------------------
    function hipsparseDbsrmm(handle, dirA, transA, transB, mb, n, kb, nnzb, alpha, descrA, &
                             bsrValA, bsrRowPtrA, bsrColIndA, blockDim, B, ldb, beta, C, ldc) &
       result(Dbsrmm) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDbsrmm")
#else
       bind(C, name="hipsparseDbsrmm")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: transA
       integer(c_int), value :: transB
       integer(c_int), value :: mb
       integer(c_int), value :: n
       integer(c_int), value :: kb
       integer(c_int), value :: nnzb
       real(c_double) :: alpha(*)
       type(c_ptr), value :: descrA
       real(c_double) :: bsrValA(*)
       integer(c_int) :: bsrRowPtrA(*)
       integer(c_int) :: bsrColIndA(*)
       integer(c_int), value :: blockDim
       real(c_double) :: B(*)
       integer(c_int), value :: ldb
       real(c_double) :: beta(*)
       real(c_double) :: C(*)
       integer(c_int), value :: ldc
       integer(c_int) :: Dbsrmm
    end function hipsparseDbsrmm

    !---------------------------------------------
    ! hipsparseCbsrmm
    !---------------------------------------------
    function hipsparseCbsrmm(handle, dirA, transA, transB, mb, n, kb, nnzb, alpha, descrA, &
                             bsrValA, bsrRowPtrA, bsrColIndA, blockDim, B, ldb, beta, C, ldc) &
       result(Cbsrmm) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCbsrmm")
#else
       bind(C, name="hipsparseCbsrmm")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: transA
       integer(c_int), value :: transB
       integer(c_int), value :: mb
       integer(c_int), value :: n
       integer(c_int), value :: kb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: alpha
       type(c_ptr), value :: descrA
       type(c_ptr), value :: bsrValA
       integer(c_int) :: bsrRowPtrA(*)
       integer(c_int) :: bsrColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: beta
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       integer(c_int) :: Cbsrmm
    end function hipsparseCbsrmm

    !---------------------------------------------
    ! hipsparseZbsrmm
    !---------------------------------------------
    function hipsparseZbsrmm(handle, dirA, transA, transB, mb, n, kb, nnzb, alpha, descrA, &
                             bsrValA, bsrRowPtrA, bsrColIndA, blockDim, B, ldb, beta, C, ldc) &
       result(Zbsrmm) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZbsrmm")
#else
       bind(C, name="hipsparseZbsrmm")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: transA
       integer(c_int), value :: transB
       integer(c_int), value :: mb
       integer(c_int), value :: n
       integer(c_int), value :: kb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: alpha
       type(c_ptr), value :: descrA
       type(c_ptr), value :: bsrValA
       integer(c_int) :: bsrRowPtrA(*)
       integer(c_int) :: bsrColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: beta
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       integer(c_int) :: Zbsrmm
    end function hipsparseZbsrmm

    !---------------------------------------------
    ! hipsparseXbsrsm2_zeroPivot
    !---------------------------------------------
    !> \ingroup level3_module
    !> \details
    !> \p hipsparseXbsrsm2_zeroPivot returns \ref HIPSPARSE_STATUS_ZERO_PIVOT if either a
    !> structural or numerical zero has been found during \ref hipsparseSbsrsm2_analysis
    !> "hipsparseXbsrsm2_analysis()"
    !> or \ref hipsparseSbsrsm2_solve "hipsparseXbsrsm2_solve()" computation. The first zero pivot
    !> \f$j\f$ at \f$A_{j,j}\f$
    !> is stored in \p position, using the same index base as the BSR matrix.
    !>
    !> \p position can be in host or device memory. If no zero pivot has been found,
    !> \p position is set to -1 and \ref HIPSPARSE_STATUS_SUCCESS is returned instead.
    !>
    !> \note \p hipsparseXbsrsm2_zeroPivot is a blocking function. It might negatively
    !> influence performance.
    !>
    !> \deprecated
    !> This function is deprecated when using the CUDA backend (CUDA 12.0+) and will be
    !> removed in CUDA 13.0. This deprecation does not apply to the ROCm backend.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> info        structure that holds the information collected during the analysis step.
    !> @param[inout]
    !> position    pointer to zero pivot \f$j\f$, which can be in host or device memory.
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p info, or \p position is nullptr.
    !> \retval HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    !> \retval HIPSPARSE_STATUS_ZERO_PIVOT zero pivot has been found.
    function hipsparseXbsrsm2_zeroPivot(handle, info, position) &
       result(Xbsrsm2_zeroPivot) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseXbsrsm2_zeroPivot")
#else
       bind(C, name="hipsparseXbsrsm2_zeroPivot")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: info
       integer(c_int) :: position(*)
       integer(c_int) :: Xbsrsm2_zeroPivot
    end function hipsparseXbsrsm2_zeroPivot

    !---------------------------------------------
    ! hipsparseSbsrsm2_bufferSize
    !---------------------------------------------
    !> \ingroup level3_module
    !> \details
    !> \p hipsparseXbsrsm2_buffer_size returns the size of the temporary storage buffer in bytes
    !> that is required by \ref hipsparseSbsrsm2_analysis "hipsparseXbsrsm2_analysis()" and
    !> \ref hipsparseSbsrsm2_solve "hipsparseXbsrsm2_solve()". The temporary storage buffer must
    !> be allocated by the user.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> dirA        matrix storage of BSR blocks.
    !> @param[in]
    !> transA      matrix \f$A\f$ operation type.
    !> @param[in]
    !> transX      matrix \f$X\f$ operation type.
    !> @param[in]
    !> mb          number of block rows of the sparse BSR matrix \f$A\f$.
    !> @param[in]
    !> nrhs        number of columns of the dense matrix \f$op(X)\f$.
    !> @param[in]
    !> nnzb        number of non-zero blocks of the sparse BSR matrix \f$A\f$.
    !> @param[in]
    !> descrA      descriptor of the sparse BSR matrix \f$A\f$.
    !> @param[in]
    !> bsrSortedValA array of \p nnzb blocks of the sparse BSR matrix.
    !> @param[in]
    !> bsrSortedRowPtrA array of \p mb+1 elements that point to the start of every block row of
    !> the sparse BSR matrix.
    !> @param[in]
    !> bsrSortedColIndA array of \p nnzb containing the block column indices of the sparse
    !> BSR matrix.
    !> @param[in]
    !> blockDim    block dimension of the sparse BSR matrix.
    !> @param[in]
    !> info        structure that holds the information collected during the analysis step.
    !> @param[out]
    !> pBufferSizeInBytes number of bytes of the temporary storage buffer required by
    !> \ref hipsparseSbsrsm2_analysis "hipsparseXbsrsm2_analysis()" and
    !> \ref hipsparseSbsrsm2_solve "hipsparseXbsrsm2_solve()".
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval     HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p mb, \p nrhs, \p nnzb, \p blockDim,
    !> \p descrA, \p bsrSortedValA, \p bsrSortedRowPtrA, \p bsrSortedColIndA, \p info, or
    !> \p pBufferSizeInBytes is invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    !> \retval     HIPSPARSE_STATUS_NOT_SUPPORTED
    !> \p transA == \ref HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE,
    !> \p transX == \ref HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE, or
    !> \ref hipsparseMatrixType_t != \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseSbsrsm2_bufferSize(handle, dirA, transA, transX, mb, nrhs, nnzb, descrA, &
                                         bsrSortedValA, bsrSortedRowPtrA, bsrSortedColIndA, &
                                         blockDim, info, pBufferSizeInBytes) &
       result(Sbsrsm2_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSbsrsm2_bufferSize")
#else
       bind(C, name="hipsparseSbsrsm2_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: transA
       integer(c_int), value :: transX
       integer(c_int), value :: mb
       integer(c_int), value :: nrhs
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       real(c_float) :: bsrSortedValA(*)
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int) :: pBufferSizeInBytes(*)
       integer(c_int) :: Sbsrsm2_bufferSize
    end function hipsparseSbsrsm2_bufferSize

    !---------------------------------------------
    ! hipsparseDbsrsm2_bufferSize
    !---------------------------------------------
    function hipsparseDbsrsm2_bufferSize(handle, dirA, transA, transX, mb, nrhs, nnzb, descrA, &
                                         bsrSortedValA, bsrSortedRowPtrA, bsrSortedColIndA, &
                                         blockDim, info, pBufferSizeInBytes) &
       result(Dbsrsm2_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDbsrsm2_bufferSize")
#else
       bind(C, name="hipsparseDbsrsm2_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: transA
       integer(c_int), value :: transX
       integer(c_int), value :: mb
       integer(c_int), value :: nrhs
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       real(c_double) :: bsrSortedValA(*)
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int) :: pBufferSizeInBytes(*)
       integer(c_int) :: Dbsrsm2_bufferSize
    end function hipsparseDbsrsm2_bufferSize

    !---------------------------------------------
    ! hipsparseCbsrsm2_bufferSize
    !---------------------------------------------
    function hipsparseCbsrsm2_bufferSize(handle, dirA, transA, transX, mb, nrhs, nnzb, descrA, &
                                         bsrSortedValA, bsrSortedRowPtrA, bsrSortedColIndA, &
                                         blockDim, info, pBufferSizeInBytes) &
       result(Cbsrsm2_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCbsrsm2_bufferSize")
#else
       bind(C, name="hipsparseCbsrsm2_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: transA
       integer(c_int), value :: transX
       integer(c_int), value :: mb
       integer(c_int), value :: nrhs
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       type(c_ptr), value :: bsrSortedValA
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int) :: pBufferSizeInBytes(*)
       integer(c_int) :: Cbsrsm2_bufferSize
    end function hipsparseCbsrsm2_bufferSize

    !---------------------------------------------
    ! hipsparseZbsrsm2_bufferSize
    !---------------------------------------------
    function hipsparseZbsrsm2_bufferSize(handle, dirA, transA, transX, mb, nrhs, nnzb, descrA, &
                                         bsrSortedValA, bsrSortedRowPtrA, bsrSortedColIndA, &
                                         blockDim, info, pBufferSizeInBytes) &
       result(Zbsrsm2_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZbsrsm2_bufferSize")
#else
       bind(C, name="hipsparseZbsrsm2_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: transA
       integer(c_int), value :: transX
       integer(c_int), value :: mb
       integer(c_int), value :: nrhs
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       type(c_ptr), value :: bsrSortedValA
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int) :: pBufferSizeInBytes(*)
       integer(c_int) :: Zbsrsm2_bufferSize
    end function hipsparseZbsrsm2_bufferSize

    !---------------------------------------------
    ! hipsparseSbsrsm2_analysis
    !---------------------------------------------
    !> \ingroup level3_module
    !> \brief Sparse triangular system solve using the BSR storage format.
    !>
    !> \details
    !> \p hipsparseXbsrsm2_analysis performs the analysis step for \ref hipsparseSbsrsm2_solve
    !> "hipsparseXbsrsm2_solve()". It is expected that this function will be executed only once
    !> for a given matrix and particular operation type.
    !>
    !> \note
    !> If the matrix sparsity pattern changes, the gathered information will become invalid.
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> dirA        matrix storage of BSR blocks.
    !> @param[in]
    !> transA      matrix \f$A\f$ operation type.
    !> @param[in]
    !> transX      matrix \f$X\f$ operation type.
    !> @param[in]
    !> mb          number of block rows of the sparse BSR matrix \f$A\f$.
    !> @param[in]
    !> nrhs        number of columns of the dense matrix \f$op(X)\f$.
    !> @param[in]
    !> nnzb        number of non-zero blocks of the sparse BSR matrix \f$A\f$.
    !> @param[in]
    !> descrA      descriptor of the sparse BSR matrix \f$A\f$.
    !> @param[in]
    !> bsrSortedValA array of \p nnzb blocks of the sparse BSR matrix \f$A\f$.
    !> @param[in]
    !> bsrSortedRowPtrA array of \p mb+1 elements that point to the start of every block row of
    !> the sparse BSR matrix \f$A\f$.
    !> @param[in]
    !> bsrSortedColIndA array of \p nnzb containing the block column indices of the sparse
    !> BSR matrix \f$A\f$.
    !> @param[in]
    !> blockDim    block dimension of the sparse BSR matrix \f$A\f$.
    !> @param[out]
    !> info        structure that holds the information collected during the analysis step.
    !> @param[in]
    !> policy      \ref HIPSPARSE_SOLVE_POLICY_NO_LEVEL or
    !> \ref HIPSPARSE_SOLVE_POLICY_USE_LEVEL.
    !> @param[in]
    !> pBuffer     temporary storage buffer allocated by the user.
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval     HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p mb, \p nrhs, \p nnzb,
    !> \p blockDim, \p descrA, \p bsrSortedValA, \p bsrSortedRowPtrA,
    !> \p bsrSortedColIndA, \p info, or \p pBuffer is invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    !> \retval     HIPSPARSE_STATUS_NOT_SUPPORTED
    !> \p transA == \ref HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE,
    !> \p transX == \ref HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE, or
    !> \ref hipsparseMatrixType_t != \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseSbsrsm2_analysis(handle, dirA, transA, transX, mb, nrhs, nnzb, descrA, &
                                       bsrSortedValA, bsrSortedRowPtrA, bsrSortedColIndA, &
                                       blockDim, info, policy, pBuffer) &
       result(Sbsrsm2_analysis) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSbsrsm2_analysis")
#else
       bind(C, name="hipsparseSbsrsm2_analysis")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: transA
       integer(c_int), value :: transX
       integer(c_int), value :: mb
       integer(c_int), value :: nrhs
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       real(c_float) :: bsrSortedValA(*)
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Sbsrsm2_analysis
    end function hipsparseSbsrsm2_analysis

    !---------------------------------------------
    ! hipsparseDbsrsm2_analysis
    !---------------------------------------------
    function hipsparseDbsrsm2_analysis(handle, dirA, transA, transX, mb, nrhs, nnzb, descrA, &
                                       bsrSortedValA, bsrSortedRowPtrA, bsrSortedColIndA, &
                                       blockDim, info, policy, pBuffer) &
       result(Dbsrsm2_analysis) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDbsrsm2_analysis")
#else
       bind(C, name="hipsparseDbsrsm2_analysis")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: transA
       integer(c_int), value :: transX
       integer(c_int), value :: mb
       integer(c_int), value :: nrhs
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       real(c_double) :: bsrSortedValA(*)
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Dbsrsm2_analysis
    end function hipsparseDbsrsm2_analysis

    !---------------------------------------------
    ! hipsparseCbsrsm2_analysis
    !---------------------------------------------
    function hipsparseCbsrsm2_analysis(handle, dirA, transA, transX, mb, nrhs, nnzb, descrA, &
                                       bsrSortedValA, bsrSortedRowPtrA, bsrSortedColIndA, &
                                       blockDim, info, policy, pBuffer) &
       result(Cbsrsm2_analysis) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCbsrsm2_analysis")
#else
       bind(C, name="hipsparseCbsrsm2_analysis")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: transA
       integer(c_int), value :: transX
       integer(c_int), value :: mb
       integer(c_int), value :: nrhs
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       type(c_ptr), value :: bsrSortedValA
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Cbsrsm2_analysis
    end function hipsparseCbsrsm2_analysis

    !---------------------------------------------
    ! hipsparseZbsrsm2_analysis
    !---------------------------------------------
    function hipsparseZbsrsm2_analysis(handle, dirA, transA, transX, mb, nrhs, nnzb, descrA, &
                                       bsrSortedValA, bsrSortedRowPtrA, bsrSortedColIndA, &
                                       blockDim, info, policy, pBuffer) &
       result(Zbsrsm2_analysis) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZbsrsm2_analysis")
#else
       bind(C, name="hipsparseZbsrsm2_analysis")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: transA
       integer(c_int), value :: transX
       integer(c_int), value :: mb
       integer(c_int), value :: nrhs
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       type(c_ptr), value :: bsrSortedValA
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Zbsrsm2_analysis
    end function hipsparseZbsrsm2_analysis

    !---------------------------------------------
    ! hipsparseSbsrsm2_solve
    !---------------------------------------------
    !> \ingroup level3_module
    !> \brief Sparse triangular system solve using the BSR storage format.
    !>
    !> \details
    !> \p hipsparseXbsrsm2_solve solves a sparse triangular linear system of a sparse
    !> \f$m \times m\f$ matrix, defined in BSR storage format, a column-oriented dense solution
    !> matrix
    !> \f$X\f$ and the column-oriented dense right-hand side matrix \f$B\f$ that is multiplied by
    !> \f$\alpha\f$,
    !> such that
    !> \f[
    !> op(A) \cdot op(X) = \alpha \cdot op(B),
    !> \f]
    !> with
    !> \f[
    !> op(A) = \left\{
    !> \begin{array}{ll}
    !> A,   & \text{if transA == HIPSPARSE_OPERATION_NON_TRANSPOSE} \\
    !> A^T, & \text{if transA == HIPSPARSE_OPERATION_TRANSPOSE} \\
    !> A^H, & \text{if transA == HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE}
    !> \end{array}
    !> \right.
    !> \f]
    !> ,
    !> \f[
    !> op(B) = \left\{
    !> \begin{array}{ll}
    !> B,   & \text{if transX == HIPSPARSE_OPERATION_NON_TRANSPOSE} \\
    !> B^T, & \text{if transX == HIPSPARSE_OPERATION_TRANSPOSE} \\
    !> B^H, & \text{if transX == HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE}
    !> \end{array}
    !> \right.
    !> \f]
    !> and
    !> \f[
    !> op(X) = \left\{
    !> \begin{array}{ll}
    !> X,   & \text{if transX == HIPSPARSE_OPERATION_NON_TRANSPOSE} \\
    !> X^T, & \text{if transX == HIPSPARSE_OPERATION_TRANSPOSE} \\
    !> X^H, & \text{if transX == HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE}
    !> \end{array}
    !> \right.
    !> \f]
    !> and where \f$m = blockDim \times mb\f$.
    !>
    !> Note that, as indicated above, the operation type of both \f$op(B)\f$ and \f$op(X)\f$ is
    !> specified by the
    !> \p transX parameter and that the operation type of \f$B\f$ and \f$X\f$ must match. For
    !> example, if \f$op(B)=B\f$, then
    !> \f$op(X)=X\f$. Likewise, if \f$op(B)=B^T\f$, then \f$op(X)=X^T\f$.
    !>
    !> Given that the sparse matrix \f$A\f$ is a square matrix, its size is \f$m \times m\f$
    !> regardless of
    !> whether \f$A\f$ is transposed or not. The size of the column-oriented dense matrices \f$B\f$
    !> and \f$X\f$
    !> depends on the value of \p transX:
    !>
    !> \f[
    !> op(B) = \left\{
    !> \begin{array}{ll}
    !> ldb \times nrhs, \text{ } ldb \ge m, & \text{if transX == HIPSPARSE_OPERATION_NON_TRANSPOSE}
    !> \\
    !> ldb \times m, \text{  } ldb \ge nrhs,  & \text{if transX == HIPSPARSE_OPERATION_TRANSPOSE} \\
    !> ldb \times m, \text{ } ldb \ge nrhs, & \text{if transX ==
    !> HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE}
    !> \end{array}
    !> \right.
    !> \f]
    !> and
    !> \f[
    !> op(X) = \left\{
    !> \begin{array}{ll}
    !> ldb \times nrhs, \text{ } ldb \ge m, & \text{if transX == HIPSPARSE_OPERATION_NON_TRANSPOSE}
    !> \\
    !> ldb \times m, \text{  } ldb \ge nrhs,  & \text{if transX == HIPSPARSE_OPERATION_TRANSPOSE} \\
    !> ldb \times m, \text{ } ldb \ge nrhs, & \text{if transX ==
    !> HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE}
    !> \end{array}
    !> \right.
    !> \f]
    !>
    !> \p hipsparseXbsrsm2_solve requires a user-allocated temporary buffer. Its size is returned by
    !> \ref hipsparseSbsrsm2_bufferSize "hipsparseXbsrsm2_bufferSize()". The size of the required
    !> buffer is larger
    !> when \p transA equals \ref HIPSPARSE_OPERATION_TRANSPOSE or \ref
    !> HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE and
    !> when \p transX is \ref HIPSPARSE_OPERATION_NON_TRANSPOSE. The subsequent solve will also be
    !> faster when \f$A\f$ is
    !> non-transposed and \f$B\f$ is transposed (or conjugate transposed). For example, instead of
    !> solving:
    !>
    !> \f[
    !> \left[
    !> \begin{array}{c | c}
    !> \begin{array}{c c}
    !> a_{00} & a_{01} \\
    !> a_{10} & a_{11}
    !> \end{array} &
    !> \begin{array}{c c}
    !> 0 & 0 \\
    !> 0 & 0
    !> \end{array} \\
    !> \hline
    !> \begin{array}{c c}
    !> a_{20} & a_{21} \\
    !> a_{30} & a_{31}
    !> \end{array} &
    !> \begin{array}{c c}
    !> a_{22} & a_{23} \\
    !> a_{32} & a_{33}
    !> \end{array} \\
    !> \end{array}
    !> \right]
    !> \cdot
    !> \begin{bmatrix}
    !> x_{00} & x_{01} \\
    !> x_{10} & x_{11} \\
    !> x_{20} & x_{21} \\
    !> x_{30} & x_{31} \\
    !> \end{bmatrix}
    !> =
    !> \begin{bmatrix}
    !> b_{00} & b_{01} \\
    !> b_{10} & b_{11} \\
    !> b_{20} & b_{21} \\
    !> b_{30} & b_{31} \\
    !> \end{bmatrix}
    !> \f]
    !>
    !> Consider solving:
    !>
    !> \f[
    !> \left[
    !> \begin{array}{c | c}
    !> \begin{array}{c c}
    !> a_{00} & a_{01} \\
    !> a_{10} & a_{11}
    !> \end{array} &
    !> \begin{array}{c c}
    !> 0 & 0 \\
    !> 0 & 0
    !> \end{array} \\
    !> \hline
    !> \begin{array}{c c}
    !> a_{20} & a_{21} \\
    !> a_{30} & a_{31}
    !> \end{array} &
    !> \begin{array}{c c}
    !> a_{22} & a_{23} \\
    !> a_{32} & a_{33}
    !> \end{array} \\
    !> \end{array}
    !> \right]
    !> \cdot
    !> \begin{bmatrix}
    !> x_{00} & x_{10} & x_{20} & x_{30} \\
    !> x_{01} & x_{11} & x_{21} & x_{31}
    !> \end{bmatrix}^{T}
    !> =
    !> \begin{bmatrix}
    !> b_{00} & b_{10} & b_{20} & b_{30} \\
    !> b_{01} & b_{11} & b_{21} & b_{31}
    !> \end{bmatrix}^{T}
    !> \f]
    !>
    !> After the temporary storage buffer has been allocated, analysis meta data is required. It can
    !> be obtained
    !> by hipsparseSbsrsm2_analysis "hipsparseXbsrsm2_analysis()". The triangular solve is completed
    !> by calling
    !> \p hipsparseXbsrsm2_solve, and after all solves are performed, the temporary storage buffer
    !> allocated by the
    !> user can be freed.
    !>
    !> Solving a triangular system involves inverting the diagonal blocks. This means that if the
    !> sparse matrix is
    !> missing the diagonal block (referred to as a structural zero) or the diagonal block is not
    !> invertible (referred
    !> to as a numerical zero), then a solution is not possible. \p hipsparseXbsrsm2_solve tracks
    !> the location of the first
    !> zero pivot (either numerical or structural zero). The zero pivot status can be checked by
    !> calling \ref hipsparseXbsrsm2_zeroPivot().
    !> If \ref hipsparseXbsrsm2_zeroPivot() returns \ref HIPSPARSE_STATUS_SUCCESS, then no zero
    !> pivot was found and therefore
    !> the matrix does not have a structural or numerical zero.
    !>
    !> The user can specify that the sparse matrix should be interpreted as having identity blocks
    !> on the diagonal by setting the diagonal
    !> type on the descriptor \p descrA to \ref HIPSPARSE_DIAG_TYPE_UNIT using \ref
    !> hipsparseSetMatDiagType. If
    !> \ref hipsparseDiagType_t == \ref HIPSPARSE_DIAG_TYPE_UNIT, no zero pivot will be reported,
    !> even if the diagonal block \f$A_{j,j}\f$
    !> for some \f$j\f$ is not invertible.
    !>
    !> The sparse CSR matrix passed to \p hipsparseXbsrsm2_solve does not actually have to be a
    !> triangular matrix. Instead, the
    !> triangular upper or lower part of the sparse matrix is solved based on \ref
    !> hipsparseFillMode_t set on the descriptor
    !> \p descrA. If the fill mode is set to \ref HIPSPARSE_FILL_MODE_LOWER, then the lower
    !> triangular matrix is solved. If the
    !> fill mode is set to \ref HIPSPARSE_FILL_MODE_UPPER, then the upper triangular matrix is
    !> solved.
    !>
    !> \note
    !> The sparse BSR matrix has to be sorted.
    !>
    !> \note
    !> Operation type of B and X must match if \f$op(B)=B, op(X)=X\f$.
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> \note
    !> Currently, only \p transA != \ref HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE and
    !> \p transX != \ref HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE is supported.
    !>
    !> @param[in]
    !> handle           handle to the hipSPARSE library context queue.
    !> @param[in]
    !> dirA             matrix storage of BSR blocks.
    !> @param[in]
    !> transA           matrix \f$A\f$ operation type.
    !> @param[in]
    !> transX           matrix \f$X\f$ operation type.
    !> @param[in]
    !> mb               number of block rows of the sparse BSR matrix \f$A\f$.
    !> @param[in]
    !> nrhs             number of columns of the dense matrix \f$op(X)\f$.
    !> @param[in]
    !> nnzb             number of non-zero blocks of the sparse BSR matrix \f$A\f$.
    !> @param[in]
    !> alpha            scalar \f$\alpha\f$.
    !> @param[in]
    !> descrA           descriptor of the sparse BSR matrix \f$A\f$.
    !> @param[in]
    !> bsrSortedValA    array of \p nnzb blocks of the sparse BSR matrix.
    !> @param[in]
    !> bsrSortedRowPtrA array of \p mb+1 elements that point to the start of every block row of
    !> the sparse BSR matrix.
    !> @param[in]
    !> bsrSortedColIndA array of \p nnzb containing the block column indices of the sparse
    !> BSR matrix.
    !> @param[in]
    !> blockDim         block dimension of the sparse BSR matrix.
    !> @param[in]
    !> info             structure that holds the information collected during the analysis step.
    !> @param[in]
    !> B                rhs matrix B with leading dimension \p ldb.
    !> @param[in]
    !> ldb              leading dimension of rhs matrix \f$B\f$.
    !> @param[out]
    !> X                solution matrix X with leading dimension \p ldx.
    !> @param[in]
    !> ldx              leading dimension of solution matrix \f$X\f$.
    !> @param[in]
    !> policy \ref HIPSPARSE_SOLVE_POLICY_NO_LEVEL or \ref HIPSPARSE_SOLVE_POLICY_USE_LEVEL.
    !> @param[in]
    !> pBuffer          temporary storage buffer allocated by the user.
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval     HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p mb, \p nrhs, \p nnzb, \p blockDim,
    !> \p alpha, \p descrA, \p bsrSortedValA, \p bsrSortedRowPtrA, \p bsrSortedColIndA,
    !> \p B, \p X \p info, or \p pBuffer is invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    !> \retval     HIPSPARSE_STATUS_NOT_SUPPORTED
    !> \p transA == \ref HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE,
    !> \p transX == \ref HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE or
    !> \ref hipsparseMatrixType_t != \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseSbsrsm2_solve(handle, dirA, transA, transX, mb, nrhs, nnzb, alpha, descrA, &
                                    bsrSortedValA, bsrSortedRowPtrA, bsrSortedColIndA, blockDim, &
                                    info, B, ldb, X, ldx, policy, pBuffer) &
       result(Sbsrsm2_solve) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSbsrsm2_solve")
#else
       bind(C, name="hipsparseSbsrsm2_solve")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: transA
       integer(c_int), value :: transX
       integer(c_int), value :: mb
       integer(c_int), value :: nrhs
       integer(c_int), value :: nnzb
       real(c_float) :: alpha(*)
       type(c_ptr), value :: descrA
       real(c_float) :: bsrSortedValA(*)
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       real(c_float) :: B(*)
       integer(c_int), value :: ldb
       real(c_float) :: X(*)
       integer(c_int), value :: ldx
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Sbsrsm2_solve
    end function hipsparseSbsrsm2_solve

    !---------------------------------------------
    ! hipsparseDbsrsm2_solve
    !---------------------------------------------
    function hipsparseDbsrsm2_solve(handle, dirA, transA, transX, mb, nrhs, nnzb, alpha, descrA, &
                                    bsrSortedValA, bsrSortedRowPtrA, bsrSortedColIndA, blockDim, &
                                    info, B, ldb, X, ldx, policy, pBuffer) &
       result(Dbsrsm2_solve) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDbsrsm2_solve")
#else
       bind(C, name="hipsparseDbsrsm2_solve")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: transA
       integer(c_int), value :: transX
       integer(c_int), value :: mb
       integer(c_int), value :: nrhs
       integer(c_int), value :: nnzb
       real(c_double) :: alpha(*)
       type(c_ptr), value :: descrA
       real(c_double) :: bsrSortedValA(*)
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       real(c_double) :: B(*)
       integer(c_int), value :: ldb
       real(c_double) :: X(*)
       integer(c_int), value :: ldx
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Dbsrsm2_solve
    end function hipsparseDbsrsm2_solve

    !---------------------------------------------
    ! hipsparseCbsrsm2_solve
    !---------------------------------------------
    function hipsparseCbsrsm2_solve(handle, dirA, transA, transX, mb, nrhs, nnzb, alpha, descrA, &
                                    bsrSortedValA, bsrSortedRowPtrA, bsrSortedColIndA, blockDim, &
                                    info, B, ldb, X, ldx, policy, pBuffer) &
       result(Cbsrsm2_solve) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCbsrsm2_solve")
#else
       bind(C, name="hipsparseCbsrsm2_solve")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: transA
       integer(c_int), value :: transX
       integer(c_int), value :: mb
       integer(c_int), value :: nrhs
       integer(c_int), value :: nnzb
       type(c_ptr), value :: alpha
       type(c_ptr), value :: descrA
       type(c_ptr), value :: bsrSortedValA
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Cbsrsm2_solve
    end function hipsparseCbsrsm2_solve

    !---------------------------------------------
    ! hipsparseZbsrsm2_solve
    !---------------------------------------------
    function hipsparseZbsrsm2_solve(handle, dirA, transA, transX, mb, nrhs, nnzb, alpha, descrA, &
                                    bsrSortedValA, bsrSortedRowPtrA, bsrSortedColIndA, blockDim, &
                                    info, B, ldb, X, ldx, policy, pBuffer) &
       result(Zbsrsm2_solve) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZbsrsm2_solve")
#else
       bind(C, name="hipsparseZbsrsm2_solve")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: transA
       integer(c_int), value :: transX
       integer(c_int), value :: mb
       integer(c_int), value :: nrhs
       integer(c_int), value :: nnzb
       type(c_ptr), value :: alpha
       type(c_ptr), value :: descrA
       type(c_ptr), value :: bsrSortedValA
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: X
       integer(c_int), value :: ldx
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Zbsrsm2_solve
    end function hipsparseZbsrsm2_solve

    !---------------------------------------------
    ! hipsparseScsrmm
    !---------------------------------------------
    !> \ingroup level3_module
    !> \brief Sparse matrix dense matrix multiplication using the CSR storage format.
    !>
    !> \details
    !> \p hipsparseXcsrmm multiplies the scalar \f$\alpha\f$ with a sparse \f$m \times k\f$
    !> matrix \f$A\f$, defined in CSR storage format, and the column-oriented dense \f$k \times n\f$
    !> matrix \f$B\f$ and adds the result to the column-oriented dense \f$m \times n\f$ matrix
    !> \f$C\f$ that
    !> is multiplied by the scalar \f$\beta\f$, such that
    !> \f[
    !> C := \alpha \cdot op(A) \cdot B + \beta \cdot C,
    !> \f]
    !> with
    !> \f[
    !> op(A) = \left\{
    !> \begin{array}{ll}
    !> A,   & \text{if transA == HIPSPARSE_OPERATION_NON_TRANSPOSE} \\
    !> A^T, & \text{if transA == HIPSPARSE_OPERATION_TRANSPOSE} \\
    !> A^H, & \text{if transA == HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE}
    !> \end{array}
    !> \right.
    !> \f]
    !>
    !> \code{.c}
    !> for(i = 0; i < ldc; ++i)
    !> {
    !> for(j = 0; j < n; ++j)
    !> {
    !> C[i][j] = beta * C[i][j];
    !>
    !> for(k = csrRowPtr[i]; k < csrRowPtr[i + 1]; ++k)
    !> {
    !> C[i][j] += alpha * csrVal[k] * B[csrColInd[k]][j];
    !> }
    !> }
    !> }
    !> \endcode
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> \deprecated
    !> This function is deprecated when using the CUDA backend (CUDA 10.0+) and will be
    !> removed in CUDA 11.0. This deprecation does not apply to the ROCm backend.
    !>
    !> @param[in]
    !> handle              handle to the hipSPARSE library context queue.
    !> @param[in]
    !> transA              matrix \f$A\f$ operation type.
    !> @param[in]
    !> m                   number of rows of the sparse CSR matrix \f$A\f$. Must be non-negative.
    !> @param[in]
    !> n number of columns of the dense matrix \f$op(B)\f$ and \f$C\f$. Must be non-negative.
    !> @param[in]
    !> k                   number of columns of the sparse CSR matrix \f$A\f$. Must be non-negative.
    !> @param[in]
    !> nnz number of non-zero entries of the sparse CSR matrix \f$A\f$. Must be non-negative.
    !> @param[in]
    !> alpha               scalar \f$\alpha\f$.
    !> @param[in]
    !> descrA              descriptor of the sparse CSR matrix \f$A\f$. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> csrSortedValA       array of \p nnz elements of the sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> csrSortedRowPtrA    array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> csrSortedColIndA    array of \p nnz elements containing the column indices of the sparse
    !> CSR matrix \f$A\f$.
    !> @param[in]
    !> B                   array of dimension \p ldb*n (\f$op(B) == B\f$),
    !> \p ldb*k otherwise.
    !> @param[in]
    !> ldb                 leading dimension of \f$B\f$, must be at least \f$\max{(1, k)}\f$
    !> (\f$op(B) == B\f$), \f$\max{(1, n)}\f$ otherwise.
    !> @param[in]
    !> beta                scalar \f$\beta\f$.
    !> @param[inout]
    !> C                   array of dimension \p ldc*n.
    !> @param[in]
    !> ldc                 leading dimension of \f$C\f$, must be at least \f$\max{(1, m)}\f$
    !> (\f$op(A) == A\f$), \f$\max{(1, k)}\f$ otherwise.
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p descrA, \p alpha, or \p beta is nullptr,
    !> \p m, \p n, \p k, or \p nnz is negative, \p ldb or \p ldc is invalid, or
    !> \p csrSortedValA, \p csrSortedRowPtrA, \p csrSortedColIndA, \p B, or \p C is nullptr.
    !> \retval HIPSPARSE_STATUS_ARCH_MISMATCH the device is not supported.
    !> \retval HIPSPARSE_STATUS_NOT_SUPPORTED \ref hipsparseMatrixType_t is not
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseScsrmm(handle, transA, m, n, k, nnz, alpha, descrA, csrSortedValA, &
                             csrSortedRowPtrA, csrSortedColIndA, B, ldb, beta, C, ldc) &
       result(Scsrmm) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseScsrmm")
#else
       bind(C, name="hipsparseScsrmm")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       integer(c_int), value :: nnz
       real(c_float) :: alpha(*)
       type(c_ptr), value :: descrA
       real(c_float) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       real(c_float) :: B(*)
       integer(c_int), value :: ldb
       real(c_float) :: beta(*)
       real(c_float) :: C(*)
       integer(c_int), value :: ldc
       integer(c_int) :: Scsrmm
    end function hipsparseScsrmm

    !---------------------------------------------
    ! hipsparseDcsrmm
    !---------------------------------------------
    function hipsparseDcsrmm(handle, transA, m, n, k, nnz, alpha, descrA, csrSortedValA, &
                             csrSortedRowPtrA, csrSortedColIndA, B, ldb, beta, C, ldc) &
       result(Dcsrmm) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDcsrmm")
#else
       bind(C, name="hipsparseDcsrmm")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       integer(c_int), value :: nnz
       real(c_double) :: alpha(*)
       type(c_ptr), value :: descrA
       real(c_double) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       real(c_double) :: B(*)
       integer(c_int), value :: ldb
       real(c_double) :: beta(*)
       real(c_double) :: C(*)
       integer(c_int), value :: ldc
       integer(c_int) :: Dcsrmm
    end function hipsparseDcsrmm

    !---------------------------------------------
    ! hipsparseCcsrmm
    !---------------------------------------------
    function hipsparseCcsrmm(handle, transA, m, n, k, nnz, alpha, descrA, csrSortedValA, &
                             csrSortedRowPtrA, csrSortedColIndA, B, ldb, beta, C, ldc) &
       result(Ccsrmm) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCcsrmm")
#else
       bind(C, name="hipsparseCcsrmm")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       integer(c_int), value :: nnz
       type(c_ptr), value :: alpha
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: beta
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       integer(c_int) :: Ccsrmm
    end function hipsparseCcsrmm

    !---------------------------------------------
    ! hipsparseZcsrmm
    !---------------------------------------------
    function hipsparseZcsrmm(handle, transA, m, n, k, nnz, alpha, descrA, csrSortedValA, &
                             csrSortedRowPtrA, csrSortedColIndA, B, ldb, beta, C, ldc) &
       result(Zcsrmm) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZcsrmm")
#else
       bind(C, name="hipsparseZcsrmm")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       integer(c_int), value :: nnz
       type(c_ptr), value :: alpha
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: beta
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       integer(c_int) :: Zcsrmm
    end function hipsparseZcsrmm

    !---------------------------------------------
    ! hipsparseScsrmm2
    !---------------------------------------------
    !> \ingroup level3_module
    !> \brief Sparse matrix dense matrix multiplication using the CSR storage format.
    !>
    !> \details
    !> \p hipsparseXcsrmm2 multiplies the scalar \f$\alpha\f$ with a sparse \f$m \times k\f$
    !> matrix \f$A\f$, defined in CSR storage format, and the column-oriented dense \f$k \times n\f$
    !> matrix \f$B\f$ and adds the result to the column-oriented dense \f$m \times n\f$ matrix
    !> \f$C\f$ that
    !> is multiplied by the scalar \f$\beta\f$, such that
    !> \f[
    !> C := \alpha \cdot op(A) \cdot op(B) + \beta \cdot C,
    !> \f]
    !> with
    !> \f[
    !> op(A) = \left\{
    !> \begin{array}{ll}
    !> A,   & \text{if transA == HIPSPARSE_OPERATION_NON_TRANSPOSE} \\
    !> A^T, & \text{if transA == HIPSPARSE_OPERATION_TRANSPOSE} \\
    !> A^H, & \text{if transA == HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE}
    !> \end{array}
    !> \right.
    !> \f]
    !> and
    !> \f[
    !> op(B) = \left\{
    !> \begin{array}{ll}
    !> B,   & \text{if transB == HIPSPARSE_OPERATION_NON_TRANSPOSE} \\
    !> B^T, & \text{if transB == HIPSPARSE_OPERATION_TRANSPOSE} \\
    !> B^H, & \text{if transB == HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE}
    !> \end{array}
    !> \right.
    !> \f]
    !>
    !> \code{.c}
    !> for(i = 0; i < ldc; ++i)
    !> {
    !> for(j = 0; j < n; ++j)
    !> {
    !> C[i][j] = beta * C[i][j];
    !>
    !> for(k = csrRowPtr[i]; k < csrRowPtr[i + 1]; ++k)
    !> {
    !> C[i][j] += alpha * csrVal[k] * B[csrColInd[k]][j];
    !> }
    !> }
    !> }
    !> \endcode
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> transA      matrix \f$A\f$ operation type.
    !> @param[in]
    !> transB      matrix \f$B\f$ operation type.
    !> @param[in]
    !> m           number of rows of the sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> n           number of columns of the dense matrix \f$op(B)\f$ and \f$C\f$.
    !> @param[in]
    !> k           number of columns of the sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> nnz         number of non-zero entries of the sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> alpha       scalar \f$\alpha\f$.
    !> @param[in]
    !> descrA      descriptor of the sparse CSR matrix \f$A\f$. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> csrSortedValA array of \p nnz elements of the sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> csrSortedRowPtrA array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> csrSortedColIndA array of \p nnz elements containing the column indices of the sparse
    !> CSR matrix \f$A\f$.
    !> @param[in]
    !> B           array of dimension \p ldb*n (\f$op(B) == B\f$),
    !> \p ldb*k otherwise.
    !> @param[in]
    !> ldb         leading dimension of \f$B\f$. Must be at least \f$\max{(1, k)}\f$
    !> (\f$op(B) == B\f$), \f$\max{(1, n)}\f$ otherwise.
    !> @param[in]
    !> beta        scalar \f$\beta\f$.
    !> @param[inout]
    !> C           array of dimension \p ldc*n.
    !> @param[in]
    !> ldc         leading dimension of \f$C\f$. Must be at least \f$\max{(1, m)}\f$
    !> (\f$op(A) == A\f$), \f$\max{(1, k)}\f$ otherwise.
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p n, \p k, \p nnz, \p ldb, \p ldc,
    !> \p descrA, \p alpha, \p csrSortedValA, \p csrSortedRowPtrA, \p csrSortedColIndA,
    !> \p B, \p beta, or \p C is invalid.
    !> \retval     HIPSPARSE_STATUS_ARCH_MISMATCH the device is not supported.
    !> \retval     HIPSPARSE_STATUS_NOT_SUPPORTED
    !> \ref hipsparseMatrixType_t != \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseScsrmm2(handle, transA, transB, m, n, k, nnz, alpha, descrA, csrSortedValA, &
                              csrSortedRowPtrA, csrSortedColIndA, B, ldb, beta, C, ldc) &
       result(Scsrmm2) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseScsrmm2")
#else
       bind(C, name="hipsparseScsrmm2")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: transB
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       integer(c_int), value :: nnz
       real(c_float) :: alpha(*)
       type(c_ptr), value :: descrA
       real(c_float) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       real(c_float) :: B(*)
       integer(c_int), value :: ldb
       real(c_float) :: beta(*)
       real(c_float) :: C(*)
       integer(c_int), value :: ldc
       integer(c_int) :: Scsrmm2
    end function hipsparseScsrmm2

    !---------------------------------------------
    ! hipsparseDcsrmm2
    !---------------------------------------------
    function hipsparseDcsrmm2(handle, transA, transB, m, n, k, nnz, alpha, descrA, csrSortedValA, &
                              csrSortedRowPtrA, csrSortedColIndA, B, ldb, beta, C, ldc) &
       result(Dcsrmm2) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDcsrmm2")
#else
       bind(C, name="hipsparseDcsrmm2")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: transB
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       integer(c_int), value :: nnz
       real(c_double) :: alpha(*)
       type(c_ptr), value :: descrA
       real(c_double) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       real(c_double) :: B(*)
       integer(c_int), value :: ldb
       real(c_double) :: beta(*)
       real(c_double) :: C(*)
       integer(c_int), value :: ldc
       integer(c_int) :: Dcsrmm2
    end function hipsparseDcsrmm2

    !---------------------------------------------
    ! hipsparseCcsrmm2
    !---------------------------------------------
    function hipsparseCcsrmm2(handle, transA, transB, m, n, k, nnz, alpha, descrA, csrSortedValA, &
                              csrSortedRowPtrA, csrSortedColIndA, B, ldb, beta, C, ldc) &
       result(Ccsrmm2) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCcsrmm2")
#else
       bind(C, name="hipsparseCcsrmm2")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: transB
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       integer(c_int), value :: nnz
       type(c_ptr), value :: alpha
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: beta
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       integer(c_int) :: Ccsrmm2
    end function hipsparseCcsrmm2

    !---------------------------------------------
    ! hipsparseZcsrmm2
    !---------------------------------------------
    function hipsparseZcsrmm2(handle, transA, transB, m, n, k, nnz, alpha, descrA, csrSortedValA, &
                              csrSortedRowPtrA, csrSortedColIndA, B, ldb, beta, C, ldc) &
       result(Zcsrmm2) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZcsrmm2")
#else
       bind(C, name="hipsparseZcsrmm2")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: transB
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       integer(c_int), value :: nnz
       type(c_ptr), value :: alpha
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: beta
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       integer(c_int) :: Zcsrmm2
    end function hipsparseZcsrmm2

    !---------------------------------------------
    ! hipsparseXcsrsm2_zeroPivot
    !---------------------------------------------
    !> \ingroup level3_module
    !> \details
    !> \p hipsparseXcsrsm2_zeroPivot returns \ref HIPSPARSE_STATUS_ZERO_PIVOT if either a
    !> structural or numerical zero has been found during \ref hipsparseScsrsm2_analysis
    !> "hipsparseXcsrsm2_analysis()" or \ref hipsparseScsrsm2_solve "hipsparseXcsrsm2_solve()"
    !> computation. The first zero pivot \f$j\f$ at \f$A_{j,j}\f$ is stored in \p position,
    !> using the same index base as the CSR matrix.
    !>
    !> \p position can be in host or device memory. If no zero pivot has been found,
    !> \p position is set to -1 and \ref HIPSPARSE_STATUS_SUCCESS is returned instead.
    !>
    !> \note \p hipsparseXcsrsm2_zeroPivot is a blocking function. It might negatively
    !> influence performance.
    !>
    !> \deprecated
    !> This function is deprecated when using the CUDA backend (CUDA 11.0+) and will be
    !> removed in CUDA 12.0. This deprecation does not apply to the ROCm backend.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> info        structure that holds the information collected during the analysis step.
    !> @param[inout]
    !> position    pointer to zero pivot \f$j\f$, which can be in host or device memory.
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p info, or \p position is nullptr.
    !> \retval HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    !> \retval HIPSPARSE_STATUS_ZERO_PIVOT zero pivot has been found.
    function hipsparseXcsrsm2_zeroPivot(handle, info, position) &
       result(Xcsrsm2_zeroPivot) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseXcsrsm2_zeroPivot")
#else
       bind(C, name="hipsparseXcsrsm2_zeroPivot")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: info
       integer(c_int) :: position(*)
       integer(c_int) :: Xcsrsm2_zeroPivot
    end function hipsparseXcsrsm2_zeroPivot

    !---------------------------------------------
    ! hipsparseScsrsm2_bufferSizeExt
    !---------------------------------------------
    !> \ingroup level3_module
    !> \details
    !> \p hipsparseXcsrsm2_bufferSizeExt returns the size of the temporary storage buffer
    !> in bytes that is required by \ref hipsparseScsrsm2_analysis "hipsparseXcsrsm2_analysis()"
    !> and \ref hipsparseScsrsm2_solve "hipsparseXcsrsm2_solve()". The temporary storage buffer
    !> must be allocated by the user.
    !>
    !> @param[in]
    !> handle           handle to the hipSPARSE library context queue.
    !> @param[in]
    !> algo             algorithm to use.
    !> @param[in]
    !> transA           matrix \f$A\f$ operation type.
    !> @param[in]
    !> transB           matrix \f$B\f$ operation type.
    !> @param[in]
    !> m                number of rows of the sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> nrhs             number of columns of the dense matrix \f$op(B)\f$.
    !> @param[in]
    !> nnz              number of non-zero entries of the sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> alpha            scalar \f$\alpha\f$.
    !> @param[in]
    !> descrA           descriptor of the sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> csrSortedValA    array of \p nnz elements of the sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> csrSortedRowPtrA array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> csrSortedColIndA array of \p nnz elements containing the column indices of the sparse
    !> CSR matrix \f$A\f$.
    !> @param[in]
    !> B                array of \p m \f$\times\f$ \p nrhs elements of the rhs matrix \f$B\f$.
    !> @param[in]
    !> ldb              leading dimension of rhs matrix \f$B\f$.
    !> @param[in]
    !> info             structure that holds the information collected during the analysis step.
    !> @param[in]
    !> policy      \ref HIPSPARSE_SOLVE_POLICY_NO_LEVEL or
    !> \ref HIPSPARSE_SOLVE_POLICY_USE_LEVEL.
    !> @param[out]
    !> pBufferSizeInBytes number of bytes of the temporary storage buffer required by
    !> \ref hipsparseScsrsm2_analysis "hipsparseXcsrsm2_analysis()" and
    !> \ref hipsparseScsrsm2_solve "hipsparseXcsrsm2_solve()".
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval     HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p nrhs, \p nnz, \p alpha,
    !> \p descrA, \p csrSortedValA, \p csrSortedRowPtrA, \p csrSortedColIndA, \p B,
    !> \p info, or \p pBufferSizeInBytes is invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    !> \retval     HIPSPARSE_STATUS_NOT_SUPPORTED
    !> \p transA == \ref HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE,
    !> \p transB == \ref HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE, or
    !> \ref hipsparseMatrixType_t != \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseScsrsm2_bufferSizeExt(handle, algo, transA, transB, m, nrhs, nnz, alpha, &
                                            descrA, csrSortedValA, csrSortedRowPtrA, &
                                            csrSortedColIndA, B, ldb, info, policy, &
                                            pBufferSizeInBytes) &
       result(Scsrsm2_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseScsrsm2_bufferSizeExt")
#else
       bind(C, name="hipsparseScsrsm2_bufferSizeExt")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: algo
       integer(c_int), value :: transA
       integer(c_int), value :: transB
       integer(c_int), value :: m
       integer(c_int), value :: nrhs
       integer(c_int), value :: nnz
       real(c_float) :: alpha(*)
       type(c_ptr), value :: descrA
       real(c_float) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       real(c_float) :: B(*)
       integer(c_int), value :: ldb
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Scsrsm2_bufferSizeExt
    end function hipsparseScsrsm2_bufferSizeExt

    !---------------------------------------------
    ! hipsparseDcsrsm2_bufferSizeExt
    !---------------------------------------------
    function hipsparseDcsrsm2_bufferSizeExt(handle, algo, transA, transB, m, nrhs, nnz, alpha, &
                                            descrA, csrSortedValA, csrSortedRowPtrA, &
                                            csrSortedColIndA, B, ldb, info, policy, &
                                            pBufferSizeInBytes) &
       result(Dcsrsm2_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDcsrsm2_bufferSizeExt")
#else
       bind(C, name="hipsparseDcsrsm2_bufferSizeExt")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: algo
       integer(c_int), value :: transA
       integer(c_int), value :: transB
       integer(c_int), value :: m
       integer(c_int), value :: nrhs
       integer(c_int), value :: nnz
       real(c_double) :: alpha(*)
       type(c_ptr), value :: descrA
       real(c_double) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       real(c_double) :: B(*)
       integer(c_int), value :: ldb
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Dcsrsm2_bufferSizeExt
    end function hipsparseDcsrsm2_bufferSizeExt

    !---------------------------------------------
    ! hipsparseCcsrsm2_bufferSizeExt
    !---------------------------------------------
    function hipsparseCcsrsm2_bufferSizeExt(handle, algo, transA, transB, m, nrhs, nnz, alpha, &
                                            descrA, csrSortedValA, csrSortedRowPtrA, &
                                            csrSortedColIndA, B, ldb, info, policy, &
                                            pBufferSizeInBytes) &
       result(Ccsrsm2_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCcsrsm2_bufferSizeExt")
#else
       bind(C, name="hipsparseCcsrsm2_bufferSizeExt")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: algo
       integer(c_int), value :: transA
       integer(c_int), value :: transB
       integer(c_int), value :: m
       integer(c_int), value :: nrhs
       integer(c_int), value :: nnz
       type(c_ptr), value :: alpha
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Ccsrsm2_bufferSizeExt
    end function hipsparseCcsrsm2_bufferSizeExt

    !---------------------------------------------
    ! hipsparseZcsrsm2_bufferSizeExt
    !---------------------------------------------
    function hipsparseZcsrsm2_bufferSizeExt(handle, algo, transA, transB, m, nrhs, nnz, alpha, &
                                            descrA, csrSortedValA, csrSortedRowPtrA, &
                                            csrSortedColIndA, B, ldb, info, policy, &
                                            pBufferSizeInBytes) &
       result(Zcsrsm2_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZcsrsm2_bufferSizeExt")
#else
       bind(C, name="hipsparseZcsrsm2_bufferSizeExt")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: algo
       integer(c_int), value :: transA
       integer(c_int), value :: transB
       integer(c_int), value :: m
       integer(c_int), value :: nrhs
       integer(c_int), value :: nnz
       type(c_ptr), value :: alpha
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Zcsrsm2_bufferSizeExt
    end function hipsparseZcsrsm2_bufferSizeExt

    !---------------------------------------------
    ! hipsparseScsrsm2_analysis
    !---------------------------------------------
    !> \ingroup level3_module
    !> \details
    !> \p hipsparseXcsrsm2_analysis performs the analysis step for \ref hipsparseScsrsm2_solve
    !> "hipsparseXcsrsm2_solve()". It is expected that this function will be executed only once
    !> for a given matrix and particular operation type.
    !>
    !> \note
    !> If the matrix sparsity pattern changes, the gathered information will become invalid.
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> algo        algorithm to use.
    !> @param[in]
    !> transA      matrix \f$A\f$ operation type.
    !> @param[in]
    !> transB      matrix \f$B\f$ operation type.
    !> @param[in]
    !> m           number of rows of the sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> nrhs        number of columns of the dense matrix \f$op(B)\f$.
    !> @param[in]
    !> nnz         number of non-zero entries of the sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> alpha       scalar \f$\alpha\f$.
    !> @param[in]
    !> descrA      descriptor of the sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> csrSortedValA array of \p nnz elements of the sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> csrSortedRowPtrA array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> csrSortedColIndA array of \p nnz elements containing the column indices of the sparse
    !> CSR matrix \f$A\f$.
    !> @param[in]
    !> B           array of \p m \f$\times\f$ \p nrhs elements of the rhs matrix \f$B\f$.
    !> @param[in]
    !> ldb         leading dimension of rhs matrix \f$B\f$.
    !> @param[out]
    !> info        structure that holds the information collected during the analysis step.
    !> @param[in]
    !> policy      \ref HIPSPARSE_SOLVE_POLICY_NO_LEVEL or
    !> \ref HIPSPARSE_SOLVE_POLICY_USE_LEVEL.
    !> @param[in]
    !> pBuffer     temporary storage buffer allocated by the user.
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval     HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p nrhs, \p nnz, \p alpha,
    !> \p descrA, \p csrSortedValA, \p csrSortedRowPtrA, \p csrSortedColIndA, \p B,
    !> \p info, or \p pBuffer is invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    !> \retval     HIPSPARSE_STATUS_NOT_SUPPORTED
    !> \p transA == \ref HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE,
    !> \p transB == \ref HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE, or
    !> \ref hipsparseMatrixType_t != \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseScsrsm2_analysis(handle, algo, transA, transB, m, nrhs, nnz, alpha, descrA, &
                                       csrSortedValA, csrSortedRowPtrA, csrSortedColIndA, B, ldb, &
                                       info, policy, pBuffer) &
       result(Scsrsm2_analysis) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseScsrsm2_analysis")
#else
       bind(C, name="hipsparseScsrsm2_analysis")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: algo
       integer(c_int), value :: transA
       integer(c_int), value :: transB
       integer(c_int), value :: m
       integer(c_int), value :: nrhs
       integer(c_int), value :: nnz
       real(c_float) :: alpha(*)
       type(c_ptr), value :: descrA
       real(c_float) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       real(c_float) :: B(*)
       integer(c_int), value :: ldb
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Scsrsm2_analysis
    end function hipsparseScsrsm2_analysis

    !---------------------------------------------
    ! hipsparseDcsrsm2_analysis
    !---------------------------------------------
    function hipsparseDcsrsm2_analysis(handle, algo, transA, transB, m, nrhs, nnz, alpha, descrA, &
                                       csrSortedValA, csrSortedRowPtrA, csrSortedColIndA, B, ldb, &
                                       info, policy, pBuffer) &
       result(Dcsrsm2_analysis) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDcsrsm2_analysis")
#else
       bind(C, name="hipsparseDcsrsm2_analysis")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: algo
       integer(c_int), value :: transA
       integer(c_int), value :: transB
       integer(c_int), value :: m
       integer(c_int), value :: nrhs
       integer(c_int), value :: nnz
       real(c_double) :: alpha(*)
       type(c_ptr), value :: descrA
       real(c_double) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       real(c_double) :: B(*)
       integer(c_int), value :: ldb
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Dcsrsm2_analysis
    end function hipsparseDcsrsm2_analysis

    !---------------------------------------------
    ! hipsparseCcsrsm2_analysis
    !---------------------------------------------
    function hipsparseCcsrsm2_analysis(handle, algo, transA, transB, m, nrhs, nnz, alpha, descrA, &
                                       csrSortedValA, csrSortedRowPtrA, csrSortedColIndA, B, ldb, &
                                       info, policy, pBuffer) &
       result(Ccsrsm2_analysis) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCcsrsm2_analysis")
#else
       bind(C, name="hipsparseCcsrsm2_analysis")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: algo
       integer(c_int), value :: transA
       integer(c_int), value :: transB
       integer(c_int), value :: m
       integer(c_int), value :: nrhs
       integer(c_int), value :: nnz
       type(c_ptr), value :: alpha
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Ccsrsm2_analysis
    end function hipsparseCcsrsm2_analysis

    !---------------------------------------------
    ! hipsparseZcsrsm2_analysis
    !---------------------------------------------
    function hipsparseZcsrsm2_analysis(handle, algo, transA, transB, m, nrhs, nnz, alpha, descrA, &
                                       csrSortedValA, csrSortedRowPtrA, csrSortedColIndA, B, ldb, &
                                       info, policy, pBuffer) &
       result(Zcsrsm2_analysis) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZcsrsm2_analysis")
#else
       bind(C, name="hipsparseZcsrsm2_analysis")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: algo
       integer(c_int), value :: transA
       integer(c_int), value :: transB
       integer(c_int), value :: m
       integer(c_int), value :: nrhs
       integer(c_int), value :: nnz
       type(c_ptr), value :: alpha
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Zcsrsm2_analysis
    end function hipsparseZcsrsm2_analysis

    !---------------------------------------------
    ! hipsparseScsrsm2_solve
    !---------------------------------------------
    !> \ingroup level3_module
    !> \brief Sparse triangular system solve using the CSR storage format
    !>
    !> \details
    !> \p hipsparseXcsrsm2_solve solves a sparse triangular linear system of a sparse
    !> \f$m \times m\f$ matrix, defined in CSR storage format, a column-oriented dense solution
    !> matrix
    !> \f$X\f$, and the column-oriented dense right-hand side matrix \f$B\f$ that is multiplied by
    !> \f$\alpha\f$, such that
    !> \f[
    !> op(A) \cdot op(X) = \alpha \cdot op(B),
    !> \f]
    !> with
    !> \f[
    !> op(A) = \left\{
    !> \begin{array}{ll}
    !> A,   & \text{if transA == HIPSPARSE_OPERATION_NON_TRANSPOSE} \\
    !> A^T, & \text{if transA == HIPSPARSE_OPERATION_TRANSPOSE} \\
    !> A^H, & \text{if transA == HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE}
    !> \end{array}
    !> \right.
    !> \f]
    !> ,
    !> \f[
    !> op(B) = \left\{
    !> \begin{array}{ll}
    !> B,   & \text{if transB == HIPSPARSE_OPERATION_NON_TRANSPOSE} \\
    !> B^T, & \text{if transB == HIPSPARSE_OPERATION_TRANSPOSE} \\
    !> B^H, & \text{if transB == HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE}
    !> \end{array}
    !> \right.
    !> \f]
    !> and
    !> \f[
    !> op(X) = \left\{
    !> \begin{array}{ll}
    !> X,   & \text{if transB == HIPSPARSE_OPERATION_NON_TRANSPOSE} \\
    !> X^T, & \text{if transB == HIPSPARSE_OPERATION_TRANSPOSE} \\
    !> X^H, & \text{if transB == HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE}
    !> \end{array}
    !> \right.
    !> \f]
    !>
    !> The solution is performed in-place, meaning that the matrix \f$B\f$ is overwritten with the
    !> solution
    !> \f$X\f$ after calling \p hipsparseXcsrsm2_solve. Given that the sparse matrix \f$A\f$ is a
    !> square matrix, its
    !> size is \f$m \times m\f$ regardless of whether \f$A\f$ is transposed or not. The size of the
    !> column-oriented dense
    !> matrices \f$B\f$ and \f$X\f$ depend on the value of \p transB
    !>
    !> \f[
    !> op(B)/op(X) = \left\{
    !> \begin{array}{ll}
    !> ldb \times nrhs, \text{ } ldb \ge m, & \text{if transB == HIPSPARSE_OPERATION_NON_TRANSPOSE}
    !> \\
    !> ldb \times m, \text{  } ldb \ge nrhs,  & \text{if transB == HIPSPARSE_OPERATION_TRANSPOSE} \\
    !> ldb \times m, \text{ } ldb \ge nrhs, & \text{if transB ==
    !> HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE}
    !> \end{array}
    !> \right.
    !> \f]
    !>
    !> \p hipsparseXcsrsm2_solve requires a user-allocated temporary buffer. Its size is returned by
    !> \ref hipsparseScsrsm2_bufferSizeExt "hipsparseXcsrsm2_bufferSizeExt()". The size of the
    !> required buffer is
    !> larger when \p transA equals \ref HIPSPARSE_OPERATION_TRANSPOSE or \ref
    !> HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE
    !> and when \p transB is \ref HIPSPARSE_OPERATION_NON_TRANSPOSE. The subsequent solve will also
    !> be faster when \f$A\f$
    !> is non-transposed and \f$B\f$ is transposed (or conjugate transposed). For example, instead
    !> of solving:
    !>
    !> \f[
    !> \begin{bmatrix}
    !> a_{00} & 0 & 0 \\
    !> a_{10} & a_{11} & 0 \\
    !> a_{20} & a_{21} & a_{22} \\
    !> \end{bmatrix}
    !> \cdot
    !> \begin{bmatrix}
    !> x_{00} & x_{01} \\
    !> x_{10} & x_{11} \\
    !> x_{20} & x_{21} \\
    !> \end{bmatrix}
    !> =
    !> \begin{bmatrix}
    !> b_{00} & b_{01} \\
    !> b_{10} & b_{11} \\
    !> b_{20} & b_{21} \\
    !> \end{bmatrix}
    !> \f]
    !>
    !> Consider solving:
    !>
    !> \f[
    !> \begin{bmatrix}
    !> a_{00} & 0 & 0 \\
    !> a_{10} & a_{11} & 0 \\
    !> a_{20} & a_{21} & a_{22}
    !> \end{bmatrix}
    !> \cdot
    !> \begin{bmatrix}
    !> x_{00} & x_{10} & x_{20} \\
    !> x_{01} & x_{11} & x_{21}
    !> \end{bmatrix}^{T}
    !> =
    !> \begin{bmatrix}
    !> b_{00} & b_{10} & b_{20} \\
    !> b_{01} & b_{11} & b_{21}
    !> \end{bmatrix}^{T}
    !> \f]
    !>
    !> After the temporary storage buffer has been allocated, analysis meta data is required. It can
    !> be obtained by
    !> \ref hipsparseScsrsm2_analysis "hipsparseXcsrsm2_analysis()". The triangular solve is
    !> completed by calling
    !> \p hipsparseXcsrsm2_solve. After all solves are performed, the temporary storage buffer
    !> allocated by the
    !> user can be freed.
    !>
    !> Solving a triangular system involves division by the diagonal elements. This means that if
    !> the sparse matrix is
    !> missing the diagonal entry (referred to as a structural zero) or the diagonal entry is zero
    !> (referred to as a numerical zero),
    !> then a division by zero would occur. \p hipsparseXcsrsm2_solve tracks the location of the
    !> first zero pivot (either numerical
    !> or structural zero). The zero pivot status can be checked by calling \ref
    !> hipsparseXcsrsm2_zeroPivot(). If
    !> \ref hipsparseXcsrsm2_zeroPivot() returns \ref HIPSPARSE_STATUS_SUCCESS, then no zero pivot
    !> was found and therefore
    !> the matrix does not have a structural or numerical zero.
    !>
    !> The user can specify that the sparse matrix should be interpreted as having ones on the
    !> diagonal by setting the diagonal type
    !> on the descriptor \p descrA to \ref HIPSPARSE_DIAG_TYPE_UNIT using \ref
    !> hipsparseSetMatDiagType. If
    !> \ref hipsparseDiagType_t == \ref HIPSPARSE_DIAG_TYPE_UNIT, no zero pivot will be reported,
    !> even if \f$A_{j,j} = 0\f$ for
    !> some \f$j\f$.
    !>
    !> The sparse CSR matrix passed to \p hipsparseXcsrsm2_solve does not actually have to be a
    !> triangular matrix. Instead, the
    !> triangular upper or lower part of the sparse matrix is solved based on the \ref
    !> hipsparseFillMode_t setting on the descriptor
    !> \p descrA. If the fill mode is set to \ref HIPSPARSE_FILL_MODE_LOWER, then the lower
    !> triangular matrix is solved. If the
    !> fill mode is set to \ref HIPSPARSE_FILL_MODE_UPPER, then the upper triangular matrix is
    !> solved.
    !>
    !> \note
    !> The sparse CSR matrix has to be sorted. This can be achieved by calling
    !> hipsparseXcsrsort().
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> \note
    !> Currently, only \p transA != \ref HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE and
    !> \p transB != \ref HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE is supported.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> algo        algorithm to use.
    !> @param[in]
    !> transA      matrix \f$A\f$ operation type.
    !> @param[in]
    !> transB      matrix \f$B\f$ operation type.
    !> @param[in]
    !> m           number of rows of the sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> nrhs        number of columns of the dense matrix \f$op(B)\f$.
    !> @param[in]
    !> nnz         number of non-zero entries of the sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> alpha       scalar \f$\alpha\f$.
    !> @param[in]
    !> descrA      descriptor of the sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> csrSortedValA array of \p nnz elements of the sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> csrSortedRowPtrA array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> csrSortedColIndA array of \p nnz elements containing the column indices of the sparse
    !> CSR matrix \f$A\f$.
    !> @param[inout]
    !> B           array of \p m \f$\times\f$ \p nrhs elements of the rhs matrix \f$B\f$.
    !> @param[in]
    !> ldb         leading dimension of rhs matrix \f$B\f$.
    !> @param[in]
    !> info        structure that holds the information collected during the analysis step.
    !> @param[in]
    !> policy      \ref HIPSPARSE_SOLVE_POLICY_NO_LEVEL or
    !> \ref HIPSPARSE_SOLVE_POLICY_USE_LEVEL.
    !> @param[in]
    !> pBuffer     temporary storage buffer allocated by the user.
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval     HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p nrhs, \p nnz, \p alpha,
    !> \p descrA, \p csrSortedValA, \p csrSortedRowPtrA, \p csrSortedColIndA, \p B,
    !> \p info, or \p pBuffer is invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    !> \retval     HIPSPARSE_STATUS_NOT_SUPPORTED
    !> \p transA == \ref HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE,
    !> \p transB == \ref HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE, or
    !> \ref hipsparseMatrixType_t != \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseScsrsm2_solve(handle, algo, transA, transB, m, nrhs, nnz, alpha, descrA, &
                                    csrSortedValA, csrSortedRowPtrA, csrSortedColIndA, B, ldb, &
                                    info, policy, pBuffer) &
       result(Scsrsm2_solve) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseScsrsm2_solve")
#else
       bind(C, name="hipsparseScsrsm2_solve")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: algo
       integer(c_int), value :: transA
       integer(c_int), value :: transB
       integer(c_int), value :: m
       integer(c_int), value :: nrhs
       integer(c_int), value :: nnz
       real(c_float) :: alpha(*)
       type(c_ptr), value :: descrA
       real(c_float) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       real(c_float) :: B(*)
       integer(c_int), value :: ldb
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Scsrsm2_solve
    end function hipsparseScsrsm2_solve

    !---------------------------------------------
    ! hipsparseDcsrsm2_solve
    !---------------------------------------------
    function hipsparseDcsrsm2_solve(handle, algo, transA, transB, m, nrhs, nnz, alpha, descrA, &
                                    csrSortedValA, csrSortedRowPtrA, csrSortedColIndA, B, ldb, &
                                    info, policy, pBuffer) &
       result(Dcsrsm2_solve) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDcsrsm2_solve")
#else
       bind(C, name="hipsparseDcsrsm2_solve")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: algo
       integer(c_int), value :: transA
       integer(c_int), value :: transB
       integer(c_int), value :: m
       integer(c_int), value :: nrhs
       integer(c_int), value :: nnz
       real(c_double) :: alpha(*)
       type(c_ptr), value :: descrA
       real(c_double) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       real(c_double) :: B(*)
       integer(c_int), value :: ldb
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Dcsrsm2_solve
    end function hipsparseDcsrsm2_solve

    !---------------------------------------------
    ! hipsparseCcsrsm2_solve
    !---------------------------------------------
    function hipsparseCcsrsm2_solve(handle, algo, transA, transB, m, nrhs, nnz, alpha, descrA, &
                                    csrSortedValA, csrSortedRowPtrA, csrSortedColIndA, B, ldb, &
                                    info, policy, pBuffer) &
       result(Ccsrsm2_solve) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCcsrsm2_solve")
#else
       bind(C, name="hipsparseCcsrsm2_solve")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: algo
       integer(c_int), value :: transA
       integer(c_int), value :: transB
       integer(c_int), value :: m
       integer(c_int), value :: nrhs
       integer(c_int), value :: nnz
       type(c_ptr), value :: alpha
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Ccsrsm2_solve
    end function hipsparseCcsrsm2_solve

    !---------------------------------------------
    ! hipsparseZcsrsm2_solve
    !---------------------------------------------
    function hipsparseZcsrsm2_solve(handle, algo, transA, transB, m, nrhs, nnz, alpha, descrA, &
                                    csrSortedValA, csrSortedRowPtrA, csrSortedColIndA, B, ldb, &
                                    info, policy, pBuffer) &
       result(Zcsrsm2_solve) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZcsrsm2_solve")
#else
       bind(C, name="hipsparseZcsrsm2_solve")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: algo
       integer(c_int), value :: transA
       integer(c_int), value :: transB
       integer(c_int), value :: m
       integer(c_int), value :: nrhs
       integer(c_int), value :: nnz
       type(c_ptr), value :: alpha
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Zcsrsm2_solve
    end function hipsparseZcsrsm2_solve

    !---------------------------------------------
    ! hipsparseSgemmi
    !---------------------------------------------
    !> \ingroup level3_module
    !> \brief Dense matrix sparse matrix multiplication using the CSC storage format.
    !>
    !> \details
    !> \p hipsparseXgemmi multiplies the scalar \f$\alpha\f$ with a dense column-oriented \f$m
    !> \times k\f$
    !> matrix \f$A\f$ and the sparse \f$k \times n\f$ matrix \f$B\f$, defined in CSC
    !> storage format, and adds the result to the dense column-oriented \f$m \times n\f$ matrix
    !> \f$C\f$ that
    !> is multiplied by the scalar \f$\beta\f$, such that
    !> \f[
    !> C := \alpha \cdot A \cdot B + \beta \cdot C
    !> \f]
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> \deprecated
    !> This function is deprecated when using the CUDA backend (CUDA 11.0+) and will be
    !> removed in CUDA 12.0. This deprecation does not apply to the ROCm backend.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m           number of rows of the dense matrix \f$A\f$. Must be non-negative.
    !> @param[in]
    !> n number of columns of the sparse CSC matrix \f$op(B)\f$ and \f$C\f$. Must be non-negative.
    !> @param[in]
    !> k           number of columns of the dense matrix \f$A\f$. Must be non-negative.
    !> @param[in]
    !> nnz number of non-zero entries of the sparse CSC matrix \f$B\f$. Must be non-negative.
    !> @param[in]
    !> alpha       scalar \f$\alpha\f$.
    !> @param[in]
    !> A           array of dimension \f$lda \times k\f$ (\f$op(A) == A\f$) or
    !> \f$lda \times m\f$ (\f$op(A) == A^T\f$ or \f$op(A) == A^H\f$).
    !> @param[in]
    !> lda         leading dimension of \f$A\f$, must be at least \f$m\f$
    !> (\f$op(A) == A\f$) or \f$k\f$ (\f$op(A) == A^T\f$ or
    !> \f$op(A) == A^H\f$).
    !> @param[in]
    !> cscValB     array of \p nnz elements of the sparse CSC matrix \f$B\f$.
    !> @param[in]
    !> cscColPtrB  array of \p n+1 elements that point to the start of every column of the
    !> sparse CSC matrix \f$B\f$.
    !> @param[in]
    !> cscRowIndB  array of \p nnz elements containing the column indices of the sparse CSC
    !> matrix \f$B\f$.
    !> @param[in]
    !> beta        scalar \f$\beta\f$.
    !> @param[inout]
    !> C           array of dimension \f$ldc \times n\f$ that holds the values of \f$C\f$.
    !> @param[in]
    !> ldc         leading dimension of \f$C\f$, must be at least \f$m\f$.
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p alpha or \p beta is nullptr,
    !> \p m, \p n, \p k, or \p nnz is negative, \p lda or \p ldc is invalid, or
    !> \p A, \p cscValB, \p cscColPtrB, \p cscRowIndB, or \p C is nullptr.
    function hipsparseSgemmi(handle, m, n, k, nnz, alpha, A, lda, cscValB, cscColPtrB, cscRowIndB, &
                             beta, C, ldc) &
       result(Sgemmi) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSgemmi")
#else
       bind(C, name="hipsparseSgemmi")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       integer(c_int), value :: nnz
       real(c_float) :: alpha(*)
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: cscValB(*)
       integer(c_int) :: cscColPtrB(*)
       integer(c_int) :: cscRowIndB(*)
       real(c_float) :: beta(*)
       real(c_float) :: C(*)
       integer(c_int), value :: ldc
       integer(c_int) :: Sgemmi
    end function hipsparseSgemmi

    !---------------------------------------------
    ! hipsparseDgemmi
    !---------------------------------------------
    function hipsparseDgemmi(handle, m, n, k, nnz, alpha, A, lda, cscValB, cscColPtrB, cscRowIndB, &
                             beta, C, ldc) &
       result(Dgemmi) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDgemmi")
#else
       bind(C, name="hipsparseDgemmi")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       integer(c_int), value :: nnz
       real(c_double) :: alpha(*)
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: cscValB(*)
       integer(c_int) :: cscColPtrB(*)
       integer(c_int) :: cscRowIndB(*)
       real(c_double) :: beta(*)
       real(c_double) :: C(*)
       integer(c_int), value :: ldc
       integer(c_int) :: Dgemmi
    end function hipsparseDgemmi

    !---------------------------------------------
    ! hipsparseCgemmi
    !---------------------------------------------
    function hipsparseCgemmi(handle, m, n, k, nnz, alpha, A, lda, cscValB, cscColPtrB, cscRowIndB, &
                             beta, C, ldc) &
       result(Cgemmi) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCgemmi")
#else
       bind(C, name="hipsparseCgemmi")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       integer(c_int), value :: nnz
       type(c_ptr), value :: alpha
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: cscValB
       integer(c_int) :: cscColPtrB(*)
       integer(c_int) :: cscRowIndB(*)
       type(c_ptr), value :: beta
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       integer(c_int) :: Cgemmi
    end function hipsparseCgemmi

    !---------------------------------------------
    ! hipsparseZgemmi
    !---------------------------------------------
    function hipsparseZgemmi(handle, m, n, k, nnz, alpha, A, lda, cscValB, cscColPtrB, cscRowIndB, &
                             beta, C, ldc) &
       result(Zgemmi) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZgemmi")
#else
       bind(C, name="hipsparseZgemmi")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       integer(c_int), value :: nnz
       type(c_ptr), value :: alpha
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       type(c_ptr), value :: cscValB
       integer(c_int) :: cscColPtrB(*)
       integer(c_int) :: cscRowIndB(*)
       type(c_ptr), value :: beta
       type(c_ptr), value :: C
       integer(c_int), value :: ldc
       integer(c_int) :: Zgemmi
    end function hipsparseZgemmi

    !---------------------------------------------
    ! hipsparseXcsrgeamNnz
    !---------------------------------------------
    !> \ingroup extra_module
    !> \details
    !> \p hipsparseXcsrgeamNnz computes the total CSR non-zero elements and the CSR row
    !> offsets that point to the start of every row of the sparse CSR matrix of the
    !> resulting matrix \f$C\f$. It is assumed that \p csrRowPtrC has been allocated with
    !> size \p m+1. The desired index base in the output CSR matrix is set in the
    !> \ref hipsparseMatDescr_t. See \ref hipsparseSetMatIndexBase().
    !>
    !> For a full code example, see \ref hipsparseScsrgeam().
    !>
    !> \note
    !> As indicated, \p nnzTotalDevHostPtr can point to either host or device memory. This is
    !> controlled
    !> by setting the pointer mode. See \ref hipsparseSetPointerMode().
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> \note
    !> Currently, only \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !>
    !> \deprecated
    !> This function is deprecated and will be removed in a future release.
    !>
    !> @param[in]
    !> handle          handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m number of rows of the sparse CSR matrices \f$A\f$, \f$B\f$, and \f$C\f$. Must be
    !> non-negative.
    !> @param[in]
    !> n number of columns of the sparse CSR matrices \f$A\f$, \f$B\f$, and \f$C\f$. Must be
    !> non-negative.
    !> @param[in]
    !> descrA          descriptor of the sparse CSR matrix \f$A\f$. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> nnzA number of non-zero entries of the sparse CSR matrix \f$A\f$. Must be non-negative.
    !> @param[in]
    !> csrRowPtrA      array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> csrColIndA      array of \p nnzA elements containing the column indices of the
    !> sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> descrB          descriptor of the sparse CSR matrix \f$B\f$. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> nnzB number of non-zero entries of the sparse CSR matrix \f$B\f$. Must be non-negative.
    !> @param[in]
    !> csrRowPtrB      array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix \f$B\f$.
    !> @param[in]
    !> csrColIndB      array of \p nnzB elements containing the column indices of the
    !> sparse CSR matrix \f$B\f$.
    !> @param[in]
    !> descrC          descriptor of the sparse CSR matrix \f$C\f$. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[out]
    !> csrRowPtrC      array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix \f$C\f$.
    !> @param[out]
    !> nnzTotalDevHostPtr pointer to the number of non-zero entries of the sparse CSR
    !> matrix \f$C\f$. \p nnzTotalDevHostPtr can be a host or device pointer.
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p descrA, \p descrB, or \p descrC is
    !> nullptr,
    !> \p m, \p n, \p nnzA, or \p nnzB is negative, or \p csrRowPtrA, \p csrColIndA, \p csrRowPtrB,
    !> \p csrColIndB, \p csrRowPtrC, or \p nnzTotalDevHostPtr is nullptr.
    !> \retval HIPSPARSE_STATUS_NOT_SUPPORTED \ref hipsparseMatrixType_t is not
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseXcsrgeamNnz(handle, m, n, descrA, nnzA, csrRowPtrA, csrColIndA, descrB, &
                                  nnzB, csrRowPtrB, csrColIndB, descrC, csrRowPtrC, &
                                  nnzTotalDevHostPtr) &
       result(XcsrgeamNnz) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseXcsrgeamNnz")
#else
       bind(C, name="hipsparseXcsrgeamNnz")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: descrA
       integer(c_int), value :: nnzA
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       type(c_ptr), value :: descrB
       integer(c_int), value :: nnzB
       integer(c_int) :: csrRowPtrB(*)
       integer(c_int) :: csrColIndB(*)
       type(c_ptr), value :: descrC
       integer(c_int) :: csrRowPtrC(*)
       integer(c_int) :: nnzTotalDevHostPtr(*)
       integer(c_int) :: XcsrgeamNnz
    end function hipsparseXcsrgeamNnz

    !---------------------------------------------
    ! hipsparseScsrgeam
    !---------------------------------------------
    !> \ingroup extra_module
    !> \brief Sparse matrix sparse matrix addition using the CSR storage format.
    !>
    !> \details
    !> \p hipsparseXcsrgeam multiplies the scalar \f$\alpha\f$ with the sparse
    !> \f$m \times n\f$ matrix \f$A\f$, defined in CSR storage format, multiplies the
    !> scalar \f$\beta\f$ with the sparse \f$m \times n\f$ matrix \f$B\f$, defined in CSR
    !> storage format, and adds both resulting matrices to obtain the sparse
    !> \f$m \times n\f$ matrix \f$C\f$, defined in CSR storage format, such that
    !> \f[
    !> C := \alpha \cdot A + \beta \cdot B.
    !> \f]
    !>
    !> This computation involves a multi-step process. First, the user must allocate \p csrRowPtrC
    !> to have size \p m+1. The user then calls \ref hipsparseXcsrgeamNnz, which fills in the \p
    !> csrRowPtrC
    !> array and computes the total number of non-zeros in \f$C\f$, \p nnzC. The user then allocates
    !> both
    !> arrays \p csrColIndC and \p csrValC to have size \p nnzC and calls \p hipsparseXcsrgeam to
    !> complete
    !> the computation. The desired index base in the output CSR matrix \f$C\f$ is set in the
    !> \ref hipsparseMatDescr_t \p descrC. See \ref hipsparseSetMatIndexBase().
    !>
    !> \note Both scalars \f$\alpha\f$ and \f$beta\f$ have to be valid.
    !> \note Currently, only \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> \note This function is non-blocking and executed asynchronously with respect to the
    !> host. It can return before the actual computation has finished.
    !>
    !> \deprecated
    !> This function is deprecated and will be removed in a future release.
    !>
    !> @param[in]
    !> handle          handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m               number of rows of the sparse CSR matrices \f$A\f$, \f$B\f$, and \f$C\f$.
    !> @param[in]
    !> n               number of columns of the sparse CSR matrices \f$A\f$, \f$B\f$, and \f$C\f$.
    !> @param[in]
    !> alpha           scalar \f$\alpha\f$.
    !> @param[in]
    !> descrA          descriptor of the sparse CSR matrix \f$A\f$. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> nnzA            number of non-zero entries of the sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> csrValA         array of \p nnzA elements of the sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> csrRowPtrA      array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> csrColIndA      array of \p nnzA elements containing the column indices of the
    !> sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> beta            scalar \f$\beta\f$.
    !> @param[in]
    !> descrB          descriptor of the sparse CSR matrix \f$B\f$. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> nnzB            number of non-zero entries of the sparse CSR matrix \f$B\f$.
    !> @param[in]
    !> csrValB         array of \p nnzB elements of the sparse CSR matrix \f$B\f$.
    !> @param[in]
    !> csrRowPtrB      array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix \f$B\f$.
    !> @param[in]
    !> csrColIndB      array of \p nnzB elements containing the column indices of the
    !> sparse CSR matrix \f$B\f$.
    !> @param[in]
    !> descrC          descriptor of the sparse CSR matrix \f$C\f$. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[out]
    !> csrValC         array of elements of the sparse CSR matrix \f$C\f$.
    !> @param[in]
    !> csrRowPtrC      array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix \f$C\f$.
    !> @param[out]
    !> csrColIndC      array of elements containing the column indices of the
    !> sparse CSR matrix \f$C\f$.
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p n, \p nnzA, \p nnzB,
    !> \p alpha, \p descrA, \p csrValA, \p csrRowPtrA, \p csrColIndA, \p beta,
    !> \p descrB, \p csrValB, \p csrRowPtrB, \p csrColIndB, \p descrC, \p csrValC,
    !> \p csrRowPtrC, or \p csrColIndC is invalid.
    !> \retval HIPSPARSE_STATUS_NOT_SUPPORTED
    !> \ref hipsparseMatrixType_t != \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseScsrgeam(handle, m, n, alpha, descrA, nnzA, csrValA, csrRowPtrA, csrColIndA, &
                               beta, descrB, nnzB, csrValB, csrRowPtrB, csrColIndB, descrC, &
                               csrValC, csrRowPtrC, csrColIndC) &
       result(Scsrgeam) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseScsrgeam")
#else
       bind(C, name="hipsparseScsrgeam")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: alpha(*)
       type(c_ptr), value :: descrA
       integer(c_int), value :: nnzA
       real(c_float) :: csrValA(*)
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       real(c_float) :: beta(*)
       type(c_ptr), value :: descrB
       integer(c_int), value :: nnzB
       real(c_float) :: csrValB(*)
       integer(c_int) :: csrRowPtrB(*)
       integer(c_int) :: csrColIndB(*)
       type(c_ptr), value :: descrC
       real(c_float) :: csrValC(*)
       integer(c_int) :: csrRowPtrC(*)
       integer(c_int) :: csrColIndC(*)
       integer(c_int) :: Scsrgeam
    end function hipsparseScsrgeam

    !---------------------------------------------
    ! hipsparseDcsrgeam
    !---------------------------------------------
    function hipsparseDcsrgeam(handle, m, n, alpha, descrA, nnzA, csrValA, csrRowPtrA, csrColIndA, &
                               beta, descrB, nnzB, csrValB, csrRowPtrB, csrColIndB, descrC, &
                               csrValC, csrRowPtrC, csrColIndC) &
       result(Dcsrgeam) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDcsrgeam")
#else
       bind(C, name="hipsparseDcsrgeam")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: alpha(*)
       type(c_ptr), value :: descrA
       integer(c_int), value :: nnzA
       real(c_double) :: csrValA(*)
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       real(c_double) :: beta(*)
       type(c_ptr), value :: descrB
       integer(c_int), value :: nnzB
       real(c_double) :: csrValB(*)
       integer(c_int) :: csrRowPtrB(*)
       integer(c_int) :: csrColIndB(*)
       type(c_ptr), value :: descrC
       real(c_double) :: csrValC(*)
       integer(c_int) :: csrRowPtrC(*)
       integer(c_int) :: csrColIndC(*)
       integer(c_int) :: Dcsrgeam
    end function hipsparseDcsrgeam

    !---------------------------------------------
    ! hipsparseCcsrgeam
    !---------------------------------------------
    function hipsparseCcsrgeam(handle, m, n, alpha, descrA, nnzA, csrValA, csrRowPtrA, csrColIndA, &
                               beta, descrB, nnzB, csrValB, csrRowPtrB, csrColIndB, descrC, &
                               csrValC, csrRowPtrC, csrColIndC) &
       result(Ccsrgeam) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCcsrgeam")
#else
       bind(C, name="hipsparseCcsrgeam")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: alpha
       type(c_ptr), value :: descrA
       integer(c_int), value :: nnzA
       type(c_ptr), value :: csrValA
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       type(c_ptr), value :: beta
       type(c_ptr), value :: descrB
       integer(c_int), value :: nnzB
       type(c_ptr), value :: csrValB
       integer(c_int) :: csrRowPtrB(*)
       integer(c_int) :: csrColIndB(*)
       type(c_ptr), value :: descrC
       type(c_ptr), value :: csrValC
       integer(c_int) :: csrRowPtrC(*)
       integer(c_int) :: csrColIndC(*)
       integer(c_int) :: Ccsrgeam
    end function hipsparseCcsrgeam

    !---------------------------------------------
    ! hipsparseZcsrgeam
    !---------------------------------------------
    function hipsparseZcsrgeam(handle, m, n, alpha, descrA, nnzA, csrValA, csrRowPtrA, csrColIndA, &
                               beta, descrB, nnzB, csrValB, csrRowPtrB, csrColIndB, descrC, &
                               csrValC, csrRowPtrC, csrColIndC) &
       result(Zcsrgeam) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZcsrgeam")
#else
       bind(C, name="hipsparseZcsrgeam")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: alpha
       type(c_ptr), value :: descrA
       integer(c_int), value :: nnzA
       type(c_ptr), value :: csrValA
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       type(c_ptr), value :: beta
       type(c_ptr), value :: descrB
       integer(c_int), value :: nnzB
       type(c_ptr), value :: csrValB
       integer(c_int) :: csrRowPtrB(*)
       integer(c_int) :: csrColIndB(*)
       type(c_ptr), value :: descrC
       type(c_ptr), value :: csrValC
       integer(c_int) :: csrRowPtrC(*)
       integer(c_int) :: csrColIndC(*)
       integer(c_int) :: Zcsrgeam
    end function hipsparseZcsrgeam

    !---------------------------------------------
    ! hipsparseScsrgeam2_bufferSizeExt
    !---------------------------------------------
    !> \ingroup extra_module
    !> \details
    !> \p hipsparseXcsrgeam2_bufferSizeExt returns the size of the temporary storage buffer
    !> in bytes that is required by \ref hipsparseXcsrgeam2Nnz() and \ref hipsparseScsrgeam2
    !> "hipsparseXcsrgeam2()". The temporary storage buffer must be allocated by the user.
    !>
    !> \note
    !> Currently, only \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !>
    !> @param[in]
    !> handle             handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m                  number of rows of the sparse CSR matrices \f$A\f$, \f$B\f$, and \f$C\f$.
    !> @param[in]
    !> n number of columns of the sparse CSR matrices \f$A\f$, \f$B\f$, and \f$C\f$.
    !> @param[in]
    !> alpha              scalar \f$\alpha\f$.
    !> @param[in]
    !> descrA             descriptor of the sparse CSR matrix \f$A\f$. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> nnzA               number of non-zero entries of the sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> csrSortedValA      array of \p nnzA elements of the sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> csrSortedRowPtrA   array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> csrSortedColIndA   array of \p nnzA elements containing the column indices of the
    !> sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> beta               scalar \f$\beta\f$.
    !> @param[in]
    !> descrB             descriptor of the sparse CSR matrix \f$B\f$. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> nnzB               number of non-zero entries of the sparse CSR matrix \f$B\f$.
    !> @param[in]
    !> csrSortedValB      array of \p nnzB elements of the sparse CSR matrix \f$B\f$.
    !> @param[in]
    !> csrSortedRowPtrB   array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix \f$B\f$.
    !> @param[in]
    !> csrSortedColIndB   array of \p nnzB elements containing the column indices of the
    !> sparse CSR matrix \f$B\f$.
    !> @param[in]
    !> descrC             descriptor of the sparse CSR matrix \f$C\f$. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[out]
    !> csrSortedValC      array of elements of the sparse CSR matrix \f$C\f$.
    !> @param[in]
    !> csrSortedRowPtrC   array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix \f$C\f$.
    !> @param[out]
    !> csrSortedColIndC   array of elements containing the column indices of the
    !> sparse CSR matrix \f$C\f$.
    !> @param[out]
    !> pBufferSizeInBytes number of bytes of the temporary storage buffer required by
    !> hipsparseXcsrgeam2Nnz() and \ref hipsparseScsrgeam2 "hipsparseXcsrgeam2()".
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p n, \p nnzA, \p nnzB,
    !> \p alpha, \p descrA, \p csrSortedValA, \p csrSortedRowPtrA, \p csrSortedColIndA,
    !> \p beta, \p descrB, \p csrSortedValB, \p csrSortedRowPtrB, \p csrSortedColIndB,
    !> \p descrC, \p csrSortedValC, \p csrSortedRowPtrC, \p csrSortedColIndC, or
    !> \p pBufferSizeInBytes is invalid.
    !> \retval HIPSPARSE_STATUS_NOT_SUPPORTED
    !> \ref hipsparseMatrixType_t != \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseScsrgeam2_bufferSizeExt(handle, m, n, alpha, descrA, nnzA, csrSortedValA, &
                                              csrSortedRowPtrA, csrSortedColIndA, beta, descrB, &
                                              nnzB, csrSortedValB, csrSortedRowPtrB, &
                                              csrSortedColIndB, descrC, csrSortedValC, &
                                              csrSortedRowPtrC, csrSortedColIndC, &
                                              pBufferSizeInBytes) &
       result(Scsrgeam2_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseScsrgeam2_bufferSizeExt")
#else
       bind(C, name="hipsparseScsrgeam2_bufferSizeExt")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: alpha(*)
       type(c_ptr), value :: descrA
       integer(c_int), value :: nnzA
       real(c_float) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       real(c_float) :: beta(*)
       type(c_ptr), value :: descrB
       integer(c_int), value :: nnzB
       real(c_float) :: csrSortedValB(*)
       integer(c_int) :: csrSortedRowPtrB(*)
       integer(c_int) :: csrSortedColIndB(*)
       type(c_ptr), value :: descrC
       real(c_float) :: csrSortedValC(*)
       integer(c_int) :: csrSortedRowPtrC(*)
       integer(c_int) :: csrSortedColIndC(*)
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Scsrgeam2_bufferSizeExt
    end function hipsparseScsrgeam2_bufferSizeExt

    !---------------------------------------------
    ! hipsparseDcsrgeam2_bufferSizeExt
    !---------------------------------------------
    function hipsparseDcsrgeam2_bufferSizeExt(handle, m, n, alpha, descrA, nnzA, csrSortedValA, &
                                              csrSortedRowPtrA, csrSortedColIndA, beta, descrB, &
                                              nnzB, csrSortedValB, csrSortedRowPtrB, &
                                              csrSortedColIndB, descrC, csrSortedValC, &
                                              csrSortedRowPtrC, csrSortedColIndC, &
                                              pBufferSizeInBytes) &
       result(Dcsrgeam2_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDcsrgeam2_bufferSizeExt")
#else
       bind(C, name="hipsparseDcsrgeam2_bufferSizeExt")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: alpha(*)
       type(c_ptr), value :: descrA
       integer(c_int), value :: nnzA
       real(c_double) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       real(c_double) :: beta(*)
       type(c_ptr), value :: descrB
       integer(c_int), value :: nnzB
       real(c_double) :: csrSortedValB(*)
       integer(c_int) :: csrSortedRowPtrB(*)
       integer(c_int) :: csrSortedColIndB(*)
       type(c_ptr), value :: descrC
       real(c_double) :: csrSortedValC(*)
       integer(c_int) :: csrSortedRowPtrC(*)
       integer(c_int) :: csrSortedColIndC(*)
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Dcsrgeam2_bufferSizeExt
    end function hipsparseDcsrgeam2_bufferSizeExt

    !---------------------------------------------
    ! hipsparseCcsrgeam2_bufferSizeExt
    !---------------------------------------------
    function hipsparseCcsrgeam2_bufferSizeExt(handle, m, n, alpha, descrA, nnzA, csrSortedValA, &
                                              csrSortedRowPtrA, csrSortedColIndA, beta, descrB, &
                                              nnzB, csrSortedValB, csrSortedRowPtrB, &
                                              csrSortedColIndB, descrC, csrSortedValC, &
                                              csrSortedRowPtrC, csrSortedColIndC, &
                                              pBufferSizeInBytes) &
       result(Ccsrgeam2_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCcsrgeam2_bufferSizeExt")
#else
       bind(C, name="hipsparseCcsrgeam2_bufferSizeExt")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: alpha
       type(c_ptr), value :: descrA
       integer(c_int), value :: nnzA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: beta
       type(c_ptr), value :: descrB
       integer(c_int), value :: nnzB
       type(c_ptr), value :: csrSortedValB
       integer(c_int) :: csrSortedRowPtrB(*)
       integer(c_int) :: csrSortedColIndB(*)
       type(c_ptr), value :: descrC
       type(c_ptr), value :: csrSortedValC
       integer(c_int) :: csrSortedRowPtrC(*)
       integer(c_int) :: csrSortedColIndC(*)
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Ccsrgeam2_bufferSizeExt
    end function hipsparseCcsrgeam2_bufferSizeExt

    !---------------------------------------------
    ! hipsparseZcsrgeam2_bufferSizeExt
    !---------------------------------------------
    function hipsparseZcsrgeam2_bufferSizeExt(handle, m, n, alpha, descrA, nnzA, csrSortedValA, &
                                              csrSortedRowPtrA, csrSortedColIndA, beta, descrB, &
                                              nnzB, csrSortedValB, csrSortedRowPtrB, &
                                              csrSortedColIndB, descrC, csrSortedValC, &
                                              csrSortedRowPtrC, csrSortedColIndC, &
                                              pBufferSizeInBytes) &
       result(Zcsrgeam2_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZcsrgeam2_bufferSizeExt")
#else
       bind(C, name="hipsparseZcsrgeam2_bufferSizeExt")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: alpha
       type(c_ptr), value :: descrA
       integer(c_int), value :: nnzA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: beta
       type(c_ptr), value :: descrB
       integer(c_int), value :: nnzB
       type(c_ptr), value :: csrSortedValB
       integer(c_int) :: csrSortedRowPtrB(*)
       integer(c_int) :: csrSortedColIndB(*)
       type(c_ptr), value :: descrC
       type(c_ptr), value :: csrSortedValC
       integer(c_int) :: csrSortedRowPtrC(*)
       integer(c_int) :: csrSortedColIndC(*)
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Zcsrgeam2_bufferSizeExt
    end function hipsparseZcsrgeam2_bufferSizeExt

    !---------------------------------------------
    ! hipsparseXcsrgeam2Nnz
    !---------------------------------------------
    !> \ingroup extra_module
    !> \details
    !> \p hipsparseXcsrgeam2Nnz computes the total CSR non-zero elements and the CSR row
    !> offsets that point to the start of every row of the sparse CSR matrix of the
    !> resulting matrix \f$C\f$. It is assumed that \p csrRowPtrC has been allocated with
    !> size \p m+1. The required buffer size can be obtained by
    !> \ref hipsparseScsrgeam2_bufferSizeExt "hipsparseXcsrgeam2_bufferSizeExt()". The
    !> desired index base in the output CSR matrix \f$C\f$ is set in the \ref hipsparseMatDescr_t
    !> \p descrC. See \ref hipsparseSetMatIndexBase().
    !>
    !> \note
    !> As indicated, \p nnzTotalDevHostPtr can point to either host or device memory. This is
    !> controlled
    !> by setting the pointer mode. See \ref hipsparseSetPointerMode().
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !> \note
    !> Currently, only \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !>
    !> @param[in]
    !> handle             handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m                  number of rows of the sparse CSR matrices \f$A\f$, \f$B\f$, and \f$C\f$.
    !> @param[in]
    !> n number of columns of the sparse CSR matrices \f$A\f$, \f$B\f$, and \f$C\f$.
    !> @param[in]
    !> descrA             descriptor of the sparse CSR matrix \f$A\f$. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> nnzA               number of non-zero entries of the sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> csrSortedRowPtrA   array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> csrSortedColIndA   array of \p nnzA elements containing the column indices of the
    !> sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> descrB             descriptor of the sparse CSR matrix \f$B\f$. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> nnzB               number of non-zero entries of the sparse CSR matrix \f$B\f$.
    !> @param[in]
    !> csrSortedRowPtrB   array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix \f$B\f$.
    !> @param[in]
    !> csrSortedColIndB   array of \p nnzB elements containing the column indices of the
    !> sparse CSR matrix \f$B\f$.
    !> @param[in]
    !> descrC             descriptor of the sparse CSR matrix \f$C\f$. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> csrSortedRowPtrC   array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix \f$C\f$.
    !> @param[out]
    !> nnzTotalDevHostPtr pointer to the number of non-zero entries of the sparse CSR
    !> matrix \f$C\f$. \p nnzTotalDevHostPtr can be a host or device pointer.
    !> @param[in]
    !> workspace          temporary storage buffer allocated by the user.
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p n, \p nnzA, \p nnzB,
    !> \p descrA, \p csrSortedRowPtrA, \p csrSortedColIndA, \p descrB, \p csrSortedRowPtrB,
    !> \p csrSortedColIndB, \p descrC, \p csrSortedRowPtrC, or \p nnzTotalDevHostPtr is invalid.
    !> \retval HIPSPARSE_STATUS_NOT_SUPPORTED
    !> \ref hipsparseMatrixType_t != \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseXcsrgeam2Nnz(handle, m, n, descrA, nnzA, csrSortedRowPtrA, csrSortedColIndA, &
                                   descrB, nnzB, csrSortedRowPtrB, csrSortedColIndB, descrC, &
                                   csrSortedRowPtrC, nnzTotalDevHostPtr, workspace) &
       result(Xcsrgeam2Nnz) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseXcsrgeam2Nnz")
#else
       bind(C, name="hipsparseXcsrgeam2Nnz")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: descrA
       integer(c_int), value :: nnzA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: descrB
       integer(c_int), value :: nnzB
       integer(c_int) :: csrSortedRowPtrB(*)
       integer(c_int) :: csrSortedColIndB(*)
       type(c_ptr), value :: descrC
       integer(c_int) :: csrSortedRowPtrC(*)
       integer(c_int) :: nnzTotalDevHostPtr(*)
       type(c_ptr), value :: workspace
       integer(c_int) :: Xcsrgeam2Nnz
    end function hipsparseXcsrgeam2Nnz

    !---------------------------------------------
    ! hipsparseScsrgeam2
    !---------------------------------------------
    !> \ingroup extra_module
    !> \brief Sparse matrix sparse matrix addition using the CSR storage format.
    !>
    !> \details
    !> \p hipsparseXcsrgeam2 multiplies the scalar \f$\alpha\f$ with the sparse
    !> \f$m \times n\f$ matrix \f$A\f$, defined in CSR storage format, multiplies the
    !> scalar \f$\beta\f$ with the sparse \f$m \times n\f$ matrix \f$B\f$, defined in CSR
    !> storage format, and adds both resulting matrices to obtain the sparse
    !> \f$m \times n\f$ matrix \f$C\f$, defined in CSR storage format, such that
    !> \f[
    !> C := \alpha \cdot A + \beta \cdot B.
    !> \f]
    !>
    !> This computation involves a multi-step process. First, the user must call
    !> \ref hipsparseScsrgeam2_bufferSizeExt "hipsparseXcsrgeam2_bufferSizeExt()" to determine the
    !> required user allocated temporary buffer size. The user then allocates this buffer and also
    !> allocates
    !> \p csrRowPtrC to have size \p m+1. Both the temporary storage buffer and \p csrRowPtrC array
    !> are then
    !> passed to \ref hipsparseXcsrgeam2Nnz, which fills in the \p csrRowPtrC array and computes the
    !> total
    !> number of non-zeros in \f$C\f$, \p nnzC. The user then allocates both arrays \p csrColIndC
    !> and \p csrValC to have
    !> size \p nnzC and calls \p hipsparseXcsrgeam2 to complete the computation. The desired index
    !> base in
    !> the output CSR matrix \f$C\f$ is set in the \ref hipsparseMatDescr_t \p descrC. See \ref
    !> hipsparseSetMatIndexBase().
    !>
    !> \note Both scalars \f$\alpha\f$ and \f$beta\f$ have to be valid.
    !> \note Currently, only \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> \note This function is non-blocking and executed asynchronously with respect to the
    !> host. It can return before the actual computation has finished.
    !>
    !> @param[in]
    !> handle           handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m                number of rows of the sparse CSR matrices \f$A\f$, \f$B\f$, and \f$C\f$.
    !> @param[in]
    !> n                number of columns of the sparse CSR matrices \f$A\f$, \f$B\f$, and \f$C\f$.
    !> @param[in]
    !> alpha            scalar \f$\alpha\f$.
    !> @param[in]
    !> descrA           descriptor of the sparse CSR matrix \f$A\f$. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> nnzA             number of non-zero entries of the sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> csrSortedValA    array of \p nnzA elements of the sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> csrSortedRowPtrA array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> csrSortedColIndA array of \p nnzA elements containing the column indices of the
    !> sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> beta             scalar \f$\beta\f$.
    !> @param[in]
    !> descrB           descriptor of the sparse CSR matrix \f$B\f$. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> nnzB             number of non-zero entries of the sparse CSR matrix \f$B\f$.
    !> @param[in]
    !> csrSortedValB    array of \p nnzB elements of the sparse CSR matrix \f$B\f$.
    !> @param[in]
    !> csrSortedRowPtrB array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix \f$B\f$.
    !> @param[in]
    !> csrSortedColIndB array of \p nnzB elements containing the column indices of the
    !> sparse CSR matrix \f$B\f$.
    !> @param[in]
    !> descrC           descriptor of the sparse CSR matrix \f$C\f$. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[out]
    !> csrSortedValC    array of elements of the sparse CSR matrix \f$C\f$.
    !> @param[in]
    !> csrSortedRowPtrC array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix \f$C\f$.
    !> @param[out]
    !> csrSortedColIndC array of elements containing the column indices of the
    !> sparse CSR matrix \f$C\f$.
    !> @param[in]
    !> pBuffer          temporary storage buffer allocated by the user.
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p n, \p nnzA, \p nnzB,
    !> \p alpha, \p descrA, \p csrSortedValA, \p csrSortedRowPtrA, \p csrSortedColIndA, \p beta,
    !> \p descrB, \p csrSortedValB, \p csrSortedRowPtrB, \p csrSortedColIndB, \p descrC, \p
    !> csrSortedValC,
    !> \p csrSortedRowPtrC, \p csrSortedColIndC, or \p pBuffer is invalid.
    !> \retval HIPSPARSE_STATUS_NOT_SUPPORTED
    !> \ref hipsparseMatrixType_t != \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseScsrgeam2(handle, m, n, alpha, descrA, nnzA, csrSortedValA, &
                                csrSortedRowPtrA, csrSortedColIndA, beta, descrB, nnzB, &
                                csrSortedValB, csrSortedRowPtrB, csrSortedColIndB, descrC, &
                                csrSortedValC, csrSortedRowPtrC, csrSortedColIndC, pBuffer) &
       result(Scsrgeam2) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseScsrgeam2")
#else
       bind(C, name="hipsparseScsrgeam2")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: alpha(*)
       type(c_ptr), value :: descrA
       integer(c_int), value :: nnzA
       real(c_float) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       real(c_float) :: beta(*)
       type(c_ptr), value :: descrB
       integer(c_int), value :: nnzB
       real(c_float) :: csrSortedValB(*)
       integer(c_int) :: csrSortedRowPtrB(*)
       integer(c_int) :: csrSortedColIndB(*)
       type(c_ptr), value :: descrC
       real(c_float) :: csrSortedValC(*)
       integer(c_int) :: csrSortedRowPtrC(*)
       integer(c_int) :: csrSortedColIndC(*)
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Scsrgeam2
    end function hipsparseScsrgeam2

    !---------------------------------------------
    ! hipsparseDcsrgeam2
    !---------------------------------------------
    function hipsparseDcsrgeam2(handle, m, n, alpha, descrA, nnzA, csrSortedValA, &
                                csrSortedRowPtrA, csrSortedColIndA, beta, descrB, nnzB, &
                                csrSortedValB, csrSortedRowPtrB, csrSortedColIndB, descrC, &
                                csrSortedValC, csrSortedRowPtrC, csrSortedColIndC, pBuffer) &
       result(Dcsrgeam2) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDcsrgeam2")
#else
       bind(C, name="hipsparseDcsrgeam2")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: alpha(*)
       type(c_ptr), value :: descrA
       integer(c_int), value :: nnzA
       real(c_double) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       real(c_double) :: beta(*)
       type(c_ptr), value :: descrB
       integer(c_int), value :: nnzB
       real(c_double) :: csrSortedValB(*)
       integer(c_int) :: csrSortedRowPtrB(*)
       integer(c_int) :: csrSortedColIndB(*)
       type(c_ptr), value :: descrC
       real(c_double) :: csrSortedValC(*)
       integer(c_int) :: csrSortedRowPtrC(*)
       integer(c_int) :: csrSortedColIndC(*)
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Dcsrgeam2
    end function hipsparseDcsrgeam2

    !---------------------------------------------
    ! hipsparseCcsrgeam2
    !---------------------------------------------
    function hipsparseCcsrgeam2(handle, m, n, alpha, descrA, nnzA, csrSortedValA, &
                                csrSortedRowPtrA, csrSortedColIndA, beta, descrB, nnzB, &
                                csrSortedValB, csrSortedRowPtrB, csrSortedColIndB, descrC, &
                                csrSortedValC, csrSortedRowPtrC, csrSortedColIndC, pBuffer) &
       result(Ccsrgeam2) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCcsrgeam2")
#else
       bind(C, name="hipsparseCcsrgeam2")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: alpha
       type(c_ptr), value :: descrA
       integer(c_int), value :: nnzA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: beta
       type(c_ptr), value :: descrB
       integer(c_int), value :: nnzB
       type(c_ptr), value :: csrSortedValB
       integer(c_int) :: csrSortedRowPtrB(*)
       integer(c_int) :: csrSortedColIndB(*)
       type(c_ptr), value :: descrC
       type(c_ptr), value :: csrSortedValC
       integer(c_int) :: csrSortedRowPtrC(*)
       integer(c_int) :: csrSortedColIndC(*)
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Ccsrgeam2
    end function hipsparseCcsrgeam2

    !---------------------------------------------
    ! hipsparseZcsrgeam2
    !---------------------------------------------
    function hipsparseZcsrgeam2(handle, m, n, alpha, descrA, nnzA, csrSortedValA, &
                                csrSortedRowPtrA, csrSortedColIndA, beta, descrB, nnzB, &
                                csrSortedValB, csrSortedRowPtrB, csrSortedColIndB, descrC, &
                                csrSortedValC, csrSortedRowPtrC, csrSortedColIndC, pBuffer) &
       result(Zcsrgeam2) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZcsrgeam2")
#else
       bind(C, name="hipsparseZcsrgeam2")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: alpha
       type(c_ptr), value :: descrA
       integer(c_int), value :: nnzA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: beta
       type(c_ptr), value :: descrB
       integer(c_int), value :: nnzB
       type(c_ptr), value :: csrSortedValB
       integer(c_int) :: csrSortedRowPtrB(*)
       integer(c_int) :: csrSortedColIndB(*)
       type(c_ptr), value :: descrC
       type(c_ptr), value :: csrSortedValC
       integer(c_int) :: csrSortedRowPtrC(*)
       integer(c_int) :: csrSortedColIndC(*)
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Zcsrgeam2
    end function hipsparseZcsrgeam2

    !---------------------------------------------
    ! hipsparseXcsrgemmNnz
    !---------------------------------------------
    !> \ingroup extra_module
    !> \details
    !> \p hipsparseXcsrgemmNnz computes the total CSR non-zero elements and the CSR row
    !> offsets that point to the start of every row of the sparse CSR matrix of the
    !> resulting multiplied matrix \f$C\f$. It is assumed that \p csrRowPtrC has been allocated
    !> with size \p m+1. The desired index base in the output CSR matrix \f$C\f$ is set in the
    !> \ref hipsparseMatDescr_t \p descrC. See \ref hipsparseSetMatIndexBase().
    !>
    !> \note
    !> As indicated, \p nnzTotalDevHostPtr can point to either host or device memory. This is
    !> controlled
    !> by setting the pointer mode. See \ref hipsparseSetPointerMode().
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> \note
    !> For matrix products with more than 8192 intermediate products per
    !> row, an additional temporary storage buffer is allocated by the algorithm.
    !>
    !> \note
    !> Currently, only \p transA == \p transB == \ref HIPSPARSE_OPERATION_NON_TRANSPOSE is
    !> supported.
    !>
    !> \note
    !> Currently, only \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !>
    !> \deprecated
    !> This function is deprecated when using the CUDA backend (CUDA 10.0+) and will be
    !> removed in CUDA 11.0. This deprecation does not apply to the ROCm backend.
    !>
    !> @param[in]
    !> handle          handle to the hipSPARSE library context queue.
    !> @param[in]
    !> transA          matrix \f$A\f$ operation type.
    !> @param[in]
    !> transB          matrix \f$B\f$ operation type.
    !> @param[in]
    !> m number of rows of the sparse CSR matrix \f$op(A)\f$ and \f$C\f$. Must be non-negative.
    !> @param[in]
    !> n               number of columns of the sparse CSR matrix \f$op(B)\f$ and
    !> \f$C\f$. Must be non-negative.
    !> @param[in]
    !> k               number of columns of the sparse CSR matrix \f$op(A)\f$ and number of
    !> rows of the sparse CSR matrix \f$op(B)\f$. Must be non-negative.
    !> @param[in]
    !> descrA          descriptor of the sparse CSR matrix \f$A\f$. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> nnzA number of non-zero entries of the sparse CSR matrix \f$A\f$. Must be non-negative.
    !> @param[in]
    !> csrRowPtrA      array of \p m+1 elements (\f$op(A) == A\f$, \p k+1 otherwise)
    !> that point to the start of every row of the sparse CSR matrix
    !> \f$op(A)\f$.
    !> @param[in]
    !> csrColIndA      array of \p nnzA elements containing the column indices of the
    !> sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> descrB          descriptor of the sparse CSR matrix \f$B\f$. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> nnzB number of non-zero entries of the sparse CSR matrix \f$B\f$. Must be non-negative.
    !> @param[in]
    !> csrRowPtrB      array of \p k+1 elements (\f$op(B) == B\f$, \p m+1 otherwise)
    !> that point to the start of every row of the sparse CSR matrix
    !> \f$op(B)\f$.
    !> @param[in]
    !> csrColIndB      array of \p nnzB elements containing the column indices of the
    !> sparse CSR matrix \f$B\f$.
    !> @param[in]
    !> descrC          descriptor of the sparse CSR matrix \f$C\f$. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> csrRowPtrC      array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix \f$C\f$.
    !> @param[inout]
    !> nnzTotalDevHostPtr pointer to the number of non-zero entries of the sparse CSR
    !> matrix \f$C\f$. \p nnzTotalDevHostPtr can be a host or device pointer.
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p descrA, \p descrB, or \p descrC is
    !> nullptr,
    !> \p m, \p n, \p k, \p nnzA, or \p nnzB is negative, or \p csrRowPtrA, \p csrColIndA,
    !> \p csrRowPtrB, \p csrColIndB, \p csrRowPtrC, or \p nnzTotalDevHostPtr is nullptr.
    !> \retval HIPSPARSE_STATUS_NOT_SUPPORTED \p transA is not \ref
    !> HIPSPARSE_OPERATION_NON_TRANSPOSE,
    !> \p transB is not \ref HIPSPARSE_OPERATION_NON_TRANSPOSE, or
    !> \ref hipsparseMatrixType_t is not \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseXcsrgemmNnz(handle, transA, transB, m, n, k, descrA, nnzA, csrRowPtrA, &
                                  csrColIndA, descrB, nnzB, csrRowPtrB, csrColIndB, descrC, &
                                  csrRowPtrC, nnzTotalDevHostPtr) &
       result(XcsrgemmNnz) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseXcsrgemmNnz")
#else
       bind(C, name="hipsparseXcsrgemmNnz")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: transB
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: descrA
       integer(c_int), value :: nnzA
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       type(c_ptr), value :: descrB
       integer(c_int), value :: nnzB
       integer(c_int) :: csrRowPtrB(*)
       integer(c_int) :: csrColIndB(*)
       type(c_ptr), value :: descrC
       integer(c_int) :: csrRowPtrC(*)
       integer(c_int) :: nnzTotalDevHostPtr(*)
       integer(c_int) :: XcsrgemmNnz
    end function hipsparseXcsrgemmNnz

    !---------------------------------------------
    ! hipsparseScsrgemm
    !---------------------------------------------
    !> \ingroup extra_module
    !> \brief Sparse matrix and sparse matrix multiplication using the CSR storage format.
    !>
    !> \details
    !> \p hipsparseXcsrgemm multiplies the sparse \f$m \times k\f$ matrix \f$op(A)\f$, defined in
    !> CSR storage format, with the sparse \f$k \times n\f$ matrix \f$op(B)\f$, defined in CSR
    !> storage format, and stores the result in the sparse \f$m \times n\f$ matrix \f$C\f$,
    !> defined in CSR storage format, such that
    !> \f[
    !> C := op(A) \cdot op(B),
    !> \f]
    !> with
    !> \f[
    !> op(A) = \left\{
    !> \begin{array}{ll}
    !> A,   & \text{if transA == HIPSPARSE_OPERATION_NON_TRANSPOSE} \\
    !> A^T, & \text{if transA == HIPSPARSE_OPERATION_TRANSPOSE} \\
    !> A^H, & \text{if transA == HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE}
    !> \end{array}
    !> \right.
    !> \f]
    !> and
    !> \f[
    !> op(B) = \left\{
    !> \begin{array}{ll}
    !> B,   & \text{if transB == HIPSPARSE_OPERATION_NON_TRANSPOSE} \\
    !> B^T, & \text{if transB == HIPSPARSE_OPERATION_TRANSPOSE} \\
    !> B^H, & \text{if transB == HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE}
    !> \end{array}
    !> \right.
    !> \f]
    !>
    !> This computation involves a multi-step process. First, the user must allocate \p csrRowPtrC
    !> to have size \p m+1. The user then calls \ref hipsparseXcsrgemmNnz, which fills in the \p
    !> csrRowPtrC
    !> array and computes the total number of non-zeros in C, \p nnzC. The user then allocates both
    !> arrays \p csrColIndC and \p csrValC to have size \p nnzC and calls \p hipsparseXcsrgemm to
    !> complete
    !> the computation. The desired index base in the output CSR matrix C is set in the
    !> \ref hipsparseMatDescr_t \p descrC. See \ref hipsparseSetMatIndexBase().
    !>
    !> \note Currently, only \p transA == \ref HIPSPARSE_OPERATION_NON_TRANSPOSE is supported.
    !> \note Currently, only \p transB == \ref HIPSPARSE_OPERATION_NON_TRANSPOSE is supported.
    !> \note Currently, only \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> \note This function is non-blocking and executed asynchronously with respect to the
    !> host. It can return before the actual computation has finished.
    !> \note For matrix products with more than 4096 non-zero entries per
    !> row, an additional temporary storage buffer is allocated by the algorithm.
    !>
    !> @param[in]
    !> handle          handle to the hipSPARSE library context queue.
    !> @param[in]
    !> transA          matrix \f$A\f$ operation type.
    !> @param[in]
    !> transB          matrix \f$B\f$ operation type.
    !> @param[in]
    !> m               number of rows of the sparse CSR matrix \f$op(A)\f$ and \f$C\f$.
    !> @param[in]
    !> n               number of columns of the sparse CSR matrix \f$op(B)\f$ and
    !> \f$C\f$.
    !> @param[in]
    !> k               number of columns of the sparse CSR matrix \f$op(A)\f$ and number of
    !> rows of the sparse CSR matrix \f$op(B)\f$.
    !> @param[in]
    !> descrA          descriptor of the sparse CSR matrix \f$A\f$. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> nnzA            number of non-zero entries of the sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> csrValA         array of \p nnzA elements of the sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> csrRowPtrA      array of \p m+1 elements (\f$op(A) == A\f$, \p k+1 otherwise)
    !> that point to the start of every row of the sparse CSR matrix
    !> \f$op(A)\f$.
    !> @param[in]
    !> csrColIndA      array of \p nnzA elements containing the column indices of the
    !> sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> descrB          descriptor of the sparse CSR matrix \f$B\f$. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> nnzB            number of non-zero entries of the sparse CSR matrix \f$B\f$.
    !> @param[in]
    !> csrValB         array of \p nnzB elements of the sparse CSR matrix \f$B\f$.
    !> @param[in]
    !> csrRowPtrB      array of \p k+1 elements (\f$op(B) == B\f$, \p m+1 otherwise)
    !> that point to the start of every row of the sparse CSR matrix
    !> \f$op(B)\f$.
    !> @param[in]
    !> csrColIndB      array of \p nnzB elements containing the column indices of the
    !> sparse CSR matrix \f$B\f$.
    !> @param[in]
    !> descrC          descriptor of the sparse CSR matrix \f$C\f$. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[out]
    !> csrValC         array of \p nnzC elements of the sparse CSR matrix \f$C\f$.
    !> @param[in]
    !> csrRowPtrC      array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix \f$C\f$.
    !> @param[out]
    !> csrColIndC      array of \p nnzC elements containing the column indices of the
    !> sparse CSR matrix \f$C\f$.
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p n, \p k, \p nnzA, \p nnzB,
    !> \p descrA, \p csrValA, \p csrRowPtrA, \p csrColIndA, \p descrB, \p csrValB,
    !> \p csrRowPtrB, \p csrColIndB, \p descrC, \p csrValC, \p csrRowPtrC, or \p csrColIndC
    !> is invalid.
    !> \retval HIPSPARSE_STATUS_ALLOC_FAILED additional buffer for long rows could not be
    !> allocated.
    !> \retval HIPSPARSE_STATUS_NOT_SUPPORTED
    !> \p transA != \ref HIPSPARSE_OPERATION_NON_TRANSPOSE,
    !> \p transB != \ref HIPSPARSE_OPERATION_NON_TRANSPOSE, or
    !> \ref hipsparseMatrixType_t != \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseScsrgemm(handle, transA, transB, m, n, k, descrA, nnzA, csrValA, csrRowPtrA, &
                               csrColIndA, descrB, nnzB, csrValB, csrRowPtrB, csrColIndB, descrC, &
                               csrValC, csrRowPtrC, csrColIndC) &
       result(Scsrgemm) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseScsrgemm")
#else
       bind(C, name="hipsparseScsrgemm")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: transB
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: descrA
       integer(c_int), value :: nnzA
       real(c_float) :: csrValA(*)
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       type(c_ptr), value :: descrB
       integer(c_int), value :: nnzB
       real(c_float) :: csrValB(*)
       integer(c_int) :: csrRowPtrB(*)
       integer(c_int) :: csrColIndB(*)
       type(c_ptr), value :: descrC
       real(c_float) :: csrValC(*)
       integer(c_int) :: csrRowPtrC(*)
       integer(c_int) :: csrColIndC(*)
       integer(c_int) :: Scsrgemm
    end function hipsparseScsrgemm

    !---------------------------------------------
    ! hipsparseDcsrgemm
    !---------------------------------------------
    function hipsparseDcsrgemm(handle, transA, transB, m, n, k, descrA, nnzA, csrValA, csrRowPtrA, &
                               csrColIndA, descrB, nnzB, csrValB, csrRowPtrB, csrColIndB, descrC, &
                               csrValC, csrRowPtrC, csrColIndC) &
       result(Dcsrgemm) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDcsrgemm")
#else
       bind(C, name="hipsparseDcsrgemm")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: transB
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: descrA
       integer(c_int), value :: nnzA
       real(c_double) :: csrValA(*)
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       type(c_ptr), value :: descrB
       integer(c_int), value :: nnzB
       real(c_double) :: csrValB(*)
       integer(c_int) :: csrRowPtrB(*)
       integer(c_int) :: csrColIndB(*)
       type(c_ptr), value :: descrC
       real(c_double) :: csrValC(*)
       integer(c_int) :: csrRowPtrC(*)
       integer(c_int) :: csrColIndC(*)
       integer(c_int) :: Dcsrgemm
    end function hipsparseDcsrgemm

    !---------------------------------------------
    ! hipsparseCcsrgemm
    !---------------------------------------------
    function hipsparseCcsrgemm(handle, transA, transB, m, n, k, descrA, nnzA, csrValA, csrRowPtrA, &
                               csrColIndA, descrB, nnzB, csrValB, csrRowPtrB, csrColIndB, descrC, &
                               csrValC, csrRowPtrC, csrColIndC) &
       result(Ccsrgemm) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCcsrgemm")
#else
       bind(C, name="hipsparseCcsrgemm")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: transB
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: descrA
       integer(c_int), value :: nnzA
       type(c_ptr), value :: csrValA
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       type(c_ptr), value :: descrB
       integer(c_int), value :: nnzB
       type(c_ptr), value :: csrValB
       integer(c_int) :: csrRowPtrB(*)
       integer(c_int) :: csrColIndB(*)
       type(c_ptr), value :: descrC
       type(c_ptr), value :: csrValC
       integer(c_int) :: csrRowPtrC(*)
       integer(c_int) :: csrColIndC(*)
       integer(c_int) :: Ccsrgemm
    end function hipsparseCcsrgemm

    !---------------------------------------------
    ! hipsparseZcsrgemm
    !---------------------------------------------
    function hipsparseZcsrgemm(handle, transA, transB, m, n, k, descrA, nnzA, csrValA, csrRowPtrA, &
                               csrColIndA, descrB, nnzB, csrValB, csrRowPtrB, csrColIndB, descrC, &
                               csrValC, csrRowPtrC, csrColIndC) &
       result(Zcsrgemm) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZcsrgemm")
#else
       bind(C, name="hipsparseZcsrgemm")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: transA
       integer(c_int), value :: transB
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: descrA
       integer(c_int), value :: nnzA
       type(c_ptr), value :: csrValA
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       type(c_ptr), value :: descrB
       integer(c_int), value :: nnzB
       type(c_ptr), value :: csrValB
       integer(c_int) :: csrRowPtrB(*)
       integer(c_int) :: csrColIndB(*)
       type(c_ptr), value :: descrC
       type(c_ptr), value :: csrValC
       integer(c_int) :: csrRowPtrC(*)
       integer(c_int) :: csrColIndC(*)
       integer(c_int) :: Zcsrgemm
    end function hipsparseZcsrgemm

    !---------------------------------------------
    ! hipsparseScsrgemm2_bufferSizeExt
    !---------------------------------------------
    !> \ingroup extra_module
    !> \details
    !> \p hipsparseXcsrgemm2_bufferSizeExt returns the size of the temporary storage buffer
    !> in bytes that is required by \ref hipsparseXcsrgemm2Nnz() and \ref hipsparseScsrgemm2
    !> "hipsparseXcsrgemm2()". The temporary storage buffer must be allocated by the user.
    !>
    !> \note
    !> For matrix products with more than 4096 non-zero entries per row,
    !> an additional temporary storage buffer is allocated by the algorithm.
    !>
    !> \note
    !> For matrix products with more than 8192 intermediate products per
    !> row, an additional temporary storage buffer is allocated by the algorithm.
    !>
    !> \note
    !> Currently, only \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !>
    !> @param[in]
    !> handle          handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m               number of rows of the sparse CSR matrix \f$op(A)\f$ and \f$C\f$.
    !> @param[in]
    !> n               number of columns of the sparse CSR matrix \f$op(B)\f$ and
    !> \f$C\f$.
    !> @param[in]
    !> k               number of columns of the sparse CSR matrix \f$op(A)\f$ and number of
    !> rows of the sparse CSR matrix \f$op(B)\f$.
    !> @param[in]
    !> alpha           scalar \f$\alpha\f$.
    !> @param[in]
    !> descrA          descriptor of the sparse CSR matrix \f$A\f$. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> nnzA            number of non-zero entries of the sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> csrRowPtrA      array of \p m+1 elements (\f$op(A) == A\f$, \p k+1 otherwise)
    !> that point to the start of every row of the sparse CSR matrix
    !> \f$op(A)\f$.
    !> @param[in]
    !> csrColIndA      array of \p nnzA elements containing the column indices of the
    !> sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> descrB          descriptor of the sparse CSR matrix \f$B\f$. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> nnzB            number of non-zero entries of the sparse CSR matrix \f$B\f$.
    !> @param[in]
    !> csrRowPtrB      array of \p k+1 elements (\f$op(B) == B\f$, \p m+1 otherwise)
    !> that point to the start of every row of the sparse CSR matrix
    !> \f$op(B)\f$.
    !> @param[in]
    !> csrColIndB      array of \p nnzB elements containing the column indices of the
    !> sparse CSR matrix \f$B\f$.
    !> @param[in]
    !> beta            scalar \f$\beta\f$.
    !> @param[in]
    !> descrD          descriptor of the sparse CSR matrix \f$D\f$. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> nnzD            number of non-zero entries of the sparse CSR matrix \f$D\f$.
    !> @param[in]
    !> csrRowPtrD      array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix \f$D\f$.
    !> @param[in]
    !> csrColIndD      array of \p nnzD elements containing the column indices of the sparse
    !> CSR matrix \f$D\f$.
    !> @param[inout]
    !> info            structure that holds meta data for the sparse CSR matrix \f$C\f$.
    !> @param[out]
    !> pBufferSizeInBytes number of bytes of the temporary storage buffer required by
    !> hipsparseXcsrgemm2Nnz(), hipsparseScsrgemm2(), hipsparseDcsrgemm2(),
    !> hipsparseCcsrgemm2(), and hipsparseZcsrgemm2().
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p n, \p k, \p nnzA, \p nnzB, \p
    !> nnz_D,
    !> \p alpha, \p beta, \p descrA, \p csrRowPtrA, \p csrColIndA, \p descrB, \p csrRowPtrB,
    !> \p csrColIndB, \p descrD, \p csrRowPtrD, \p csrColIndD, \p info, or \p pBufferSizeInBytes
    !> is invalid.
    !> \retval HIPSPARSE_STATUS_NOT_SUPPORTED
    !> \ref hipsparseMatrixType_t != \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseScsrgemm2_bufferSizeExt(handle, m, n, k, alpha, descrA, nnzA, csrRowPtrA, &
                                              csrColIndA, descrB, nnzB, csrRowPtrB, csrColIndB, &
                                              beta, descrD, nnzD, csrRowPtrD, csrColIndD, info, &
                                              pBufferSizeInBytes) &
       result(Scsrgemm2_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseScsrgemm2_bufferSizeExt")
#else
       bind(C, name="hipsparseScsrgemm2_bufferSizeExt")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       real(c_float) :: alpha(*)
       type(c_ptr), value :: descrA
       integer(c_int), value :: nnzA
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       type(c_ptr), value :: descrB
       integer(c_int), value :: nnzB
       integer(c_int) :: csrRowPtrB(*)
       integer(c_int) :: csrColIndB(*)
       real(c_float) :: beta(*)
       type(c_ptr), value :: descrD
       integer(c_int), value :: nnzD
       integer(c_int) :: csrRowPtrD(*)
       integer(c_int) :: csrColIndD(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Scsrgemm2_bufferSizeExt
    end function hipsparseScsrgemm2_bufferSizeExt

    !---------------------------------------------
    ! hipsparseDcsrgemm2_bufferSizeExt
    !---------------------------------------------
    function hipsparseDcsrgemm2_bufferSizeExt(handle, m, n, k, alpha, descrA, nnzA, csrRowPtrA, &
                                              csrColIndA, descrB, nnzB, csrRowPtrB, csrColIndB, &
                                              beta, descrD, nnzD, csrRowPtrD, csrColIndD, info, &
                                              pBufferSizeInBytes) &
       result(Dcsrgemm2_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDcsrgemm2_bufferSizeExt")
#else
       bind(C, name="hipsparseDcsrgemm2_bufferSizeExt")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       real(c_double) :: alpha(*)
       type(c_ptr), value :: descrA
       integer(c_int), value :: nnzA
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       type(c_ptr), value :: descrB
       integer(c_int), value :: nnzB
       integer(c_int) :: csrRowPtrB(*)
       integer(c_int) :: csrColIndB(*)
       real(c_double) :: beta(*)
       type(c_ptr), value :: descrD
       integer(c_int), value :: nnzD
       integer(c_int) :: csrRowPtrD(*)
       integer(c_int) :: csrColIndD(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Dcsrgemm2_bufferSizeExt
    end function hipsparseDcsrgemm2_bufferSizeExt

    !---------------------------------------------
    ! hipsparseCcsrgemm2_bufferSizeExt
    !---------------------------------------------
    function hipsparseCcsrgemm2_bufferSizeExt(handle, m, n, k, alpha, descrA, nnzA, csrRowPtrA, &
                                              csrColIndA, descrB, nnzB, csrRowPtrB, csrColIndB, &
                                              beta, descrD, nnzD, csrRowPtrD, csrColIndD, info, &
                                              pBufferSizeInBytes) &
       result(Ccsrgemm2_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCcsrgemm2_bufferSizeExt")
#else
       bind(C, name="hipsparseCcsrgemm2_bufferSizeExt")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: alpha
       type(c_ptr), value :: descrA
       integer(c_int), value :: nnzA
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       type(c_ptr), value :: descrB
       integer(c_int), value :: nnzB
       integer(c_int) :: csrRowPtrB(*)
       integer(c_int) :: csrColIndB(*)
       type(c_ptr), value :: beta
       type(c_ptr), value :: descrD
       integer(c_int), value :: nnzD
       integer(c_int) :: csrRowPtrD(*)
       integer(c_int) :: csrColIndD(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Ccsrgemm2_bufferSizeExt
    end function hipsparseCcsrgemm2_bufferSizeExt

    !---------------------------------------------
    ! hipsparseZcsrgemm2_bufferSizeExt
    !---------------------------------------------
    function hipsparseZcsrgemm2_bufferSizeExt(handle, m, n, k, alpha, descrA, nnzA, csrRowPtrA, &
                                              csrColIndA, descrB, nnzB, csrRowPtrB, csrColIndB, &
                                              beta, descrD, nnzD, csrRowPtrD, csrColIndD, info, &
                                              pBufferSizeInBytes) &
       result(Zcsrgemm2_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZcsrgemm2_bufferSizeExt")
#else
       bind(C, name="hipsparseZcsrgemm2_bufferSizeExt")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: alpha
       type(c_ptr), value :: descrA
       integer(c_int), value :: nnzA
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       type(c_ptr), value :: descrB
       integer(c_int), value :: nnzB
       integer(c_int) :: csrRowPtrB(*)
       integer(c_int) :: csrColIndB(*)
       type(c_ptr), value :: beta
       type(c_ptr), value :: descrD
       integer(c_int), value :: nnzD
       integer(c_int) :: csrRowPtrD(*)
       integer(c_int) :: csrColIndD(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Zcsrgemm2_bufferSizeExt
    end function hipsparseZcsrgemm2_bufferSizeExt

    !---------------------------------------------
    ! hipsparseXcsrgemm2Nnz
    !---------------------------------------------
    !> \ingroup extra_module
    !> \details
    !> \p hipsparseXcsrgemm2Nnz computes the total CSR non-zero elements and the CSR row
    !> offsets that point to the start of every row of the sparse CSR matrix of the
    !> resulting multiplied matrix \f$C\f$. It is assumed that \p csrRowPtrC has been allocated
    !> with size \p m+1. The required buffer size can be obtained by
    !> \ref hipsparseScsrgemm2_bufferSizeExt "hipsparseXcsrgemm2_bufferSizeExt()". The desired
    !> index base in the output CSR matrix \f$C\f$ is set in the \ref hipsparseMatDescr_t \p descrC.
    !> See \ref hipsparseSetMatIndexBase().
    !>
    !> \note
    !> As indicated, \p nnzTotalDevHostPtr can point to either host or device memory. This is
    !> controlled
    !> by setting the pointer mode. See \ref hipsparseSetPointerMode().
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> \note
    !> For matrix products with more than 8192 intermediate products per
    !> row, an additional temporary storage buffer is allocated by the algorithm.
    !>
    !> \note
    !> Currently, only \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !>
    !> @param[in]
    !> handle          handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m               number of rows of the sparse CSR matrix \f$op(A)\f$ and \f$C\f$.
    !> @param[in]
    !> n               number of columns of the sparse CSR matrix \f$op(B)\f$ and
    !> \f$C\f$.
    !> @param[in]
    !> k               number of columns of the sparse CSR matrix \f$op(A)\f$ and number of
    !> rows of the sparse CSR matrix \f$op(B)\f$.
    !> @param[in]
    !> descrA          descriptor of the sparse CSR matrix \f$A\f$. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> nnzA            number of non-zero entries of the sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> csrRowPtrA      array of \p m+1 elements (\f$op(A) == A\f$, \p k+1 otherwise)
    !> that point to the start of every row of the sparse CSR matrix
    !> \f$op(A)\f$.
    !> @param[in]
    !> csrColIndA      array of \p nnzA elements containing the column indices of the
    !> sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> descrB          descriptor of the sparse CSR matrix \f$B\f$. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> nnzB            number of non-zero entries of the sparse CSR matrix \f$B\f$.
    !> @param[in]
    !> csrRowPtrB      array of \p k+1 elements (\f$op(B) == B\f$, \p m+1 otherwise)
    !> that point to the start of every row of the sparse CSR matrix
    !> \f$op(B)\f$.
    !> @param[in]
    !> csrColIndB      array of \p nnzB elements containing the column indices of the
    !> sparse CSR matrix \f$B\f$.
    !> @param[in]
    !> descrD          descriptor of the sparse CSR matrix \f$D\f$. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> nnzD            number of non-zero entries of the sparse CSR matrix \f$D\f$.
    !> @param[in]
    !> csrRowPtrD      array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix \f$D\f$.
    !> @param[in]
    !> csrColIndD      array of \p nnzD elements containing the column indices of the sparse
    !> CSR matrix \f$D\f$.
    !> @param[in]
    !> descrC          descriptor of the sparse CSR matrix \f$C\f$. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[out]
    !> csrRowPtrC      array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix \f$C\f$.
    !> @param[out]
    !> nnzTotalDevHostPtr pointer to the number of non-zero entries of the sparse CSR
    !> matrix \f$C\f$.
    !> @param[in]
    !> info            structure that holds meta data for the sparse CSR matrix \f$C\f$.
    !> @param[in]
    !> pBuffer         temporary storage buffer allocated by the user. The size is returned
    !> by hipsparseScsrgemm2_bufferSizeExt(), hipsparseDcsrgemm2_bufferSizeExt(),
    !> hipsparseZcsrgemm2_bufferSizeExt(), or hipsparseZcsrgemm2_bufferSizeExt().
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p n, \p k, \p nnzA, \p nnzB, \p
    !> nnzD,
    !> \p descrA, \p csrRowPtrA, \p csrColIndA, \p descrB, \p csrRowPtrB, \p csrColIndB,
    !> \p descrD, \p csrRowPtrD, \p csrColIndD, \p descrC, \p csrRowPtrC, \p nnzTotalDevHostPtr,
    !> \p info, or \p pBuffer is invalid.
    !> \retval HIPSPARSE_STATUS_ALLOC_FAILED additional buffer for long rows could not be
    !> allocated.
    !> \retval HIPSPARSE_STATUS_NOT_SUPPORTED
    !> \ref hipsparseMatrixType_t != \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseXcsrgemm2Nnz(handle, m, n, k, descrA, nnzA, csrRowPtrA, csrColIndA, descrB, &
                                   nnzB, csrRowPtrB, csrColIndB, descrD, nnzD, csrRowPtrD, &
                                   csrColIndD, descrC, csrRowPtrC, nnzTotalDevHostPtr, info, &
                                   pBuffer) &
       result(Xcsrgemm2Nnz) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseXcsrgemm2Nnz")
#else
       bind(C, name="hipsparseXcsrgemm2Nnz")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: descrA
       integer(c_int), value :: nnzA
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       type(c_ptr), value :: descrB
       integer(c_int), value :: nnzB
       integer(c_int) :: csrRowPtrB(*)
       integer(c_int) :: csrColIndB(*)
       type(c_ptr), value :: descrD
       integer(c_int), value :: nnzD
       integer(c_int) :: csrRowPtrD(*)
       integer(c_int) :: csrColIndD(*)
       type(c_ptr), value :: descrC
       integer(c_int) :: csrRowPtrC(*)
       integer(c_int) :: nnzTotalDevHostPtr(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Xcsrgemm2Nnz
    end function hipsparseXcsrgemm2Nnz

    !---------------------------------------------
    ! hipsparseScsrgemm2
    !---------------------------------------------
    !> \ingroup extra_module
    !> \brief Sparse matrix and sparse matrix multiplication using CSR storage format
    !>
    !> \details
    !> \p hipsparseXcsrgemm2 multiplies the scalar \f$\alpha\f$ with the sparse
    !> \f$m \times k\f$ matrix \f$A\f$, defined in CSR storage format, and the sparse
    !> \f$k \times n\f$ matrix \f$B\f$, defined in CSR storage format, and adds the result
    !> to the sparse \f$m \times n\f$ matrix \f$D\f$ that is multiplied by \f$\beta\f$. The
    !> final result is stored in the sparse \f$m \times n\f$ matrix \f$C\f$, defined in CSR
    !> storage format, such
    !> that
    !> \f[
    !> C := \alpha \cdot A \cdot B + \beta \cdot D
    !> \f]
    !>
    !> This computation involves a multi-step process. First, the user must call
    !> \ref hipsparseScsrgemm2_bufferSizeExt "hipsparseXcsrgemm2_bufferSizeExt()" to
    !> determine the required user-allocated temporary buffer size. The user then allocates this
    !> buffer and also allocates \p csrRowPtrC to have size \p m+1. Both the temporary storage
    !> buffer and \p csrRowPtrC array are then passed to \ref hipsparseXcsrgemm2Nnz, which fills
    !> in the \p csrRowPtrC array and computes the total number of nonzeros in \f$C\f$, \p nnzC.
    !> The user then allocates both arrays \p csrColIndC and \p csrValC to have size \p nnzC and
    !> calls \p hipsparseXcsrgemm2 to complete the computation. The desired index base in the output
    !> CSR matrix \f$C\f$ is set in the \ref hipsparseMatDescr_t \p descrC. See \ref
    !> hipsparseSetMatIndexBase().
    !>
    !> \note If \f$\alpha == 0\f$, then \f$C = \beta \cdot D\f$ will be computed.
    !> \note If \f$\beta == 0\f$, then \f$C = \alpha \cdot A \cdot B\f$ will be computed.
    !> \note \f$\alpha == beta == 0\f$ is invalid.
    !> \note Currently, only \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> \note This function is non-blocking and executed asynchronously with respect to the
    !> host. It can return before the actual computation has finished.
    !> \note For matrix products with more than 4096 non-zero entries per
    !> row, an additional temporary storage buffer is allocated by the algorithm.
    !>
    !> @param[in]
    !> handle          handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m               number of rows of the sparse CSR matrix \f$op(A)\f$ and \f$C\f$.
    !> @param[in]
    !> n               number of columns of the sparse CSR matrix \f$op(B)\f$ and
    !> \f$C\f$.
    !> @param[in]
    !> k               number of columns of the sparse CSR matrix \f$op(A)\f$ and number of
    !> rows of the sparse CSR matrix \f$op(B)\f$.
    !> @param[in]
    !> alpha           scalar \f$\alpha\f$.
    !> @param[in]
    !> descrA          descriptor of the sparse CSR matrix \f$A\f$. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> nnzA            number of non-zero entries of the sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> csrValA         array of \p nnzA elements of the sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> csrRowPtrA      array of \p m+1 elements (\f$op(A) == A\f$, \p k+1 otherwise)
    !> that point to the start of every row of the sparse CSR matrix
    !> \f$op(A)\f$.
    !> @param[in]
    !> csrColIndA      array of \p nnzA elements containing the column indices of the
    !> sparse CSR matrix \f$A\f$.
    !> @param[in]
    !> descrB          descriptor of the sparse CSR matrix \f$B\f$. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> nnzB            number of non-zero entries of the sparse CSR matrix \f$B\f$.
    !> @param[in]
    !> csrValB         array of \p nnzB elements of the sparse CSR matrix \f$B\f$.
    !> @param[in]
    !> csrRowPtrB      array of \p k+1 elements (\f$op(B) == B\f$, \p m+1 otherwise)
    !> that point to the start of every row of the sparse CSR matrix
    !> \f$op(B)\f$.
    !> @param[in]
    !> csrColIndB      array of \p nnzB elements containing the column indices of the
    !> sparse CSR matrix \f$B\f$.
    !> @param[in]
    !> beta            scalar \f$\beta\f$.
    !> @param[in]
    !> descrD          descriptor of the sparse CSR matrix \f$D\f$. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> nnzD            number of non-zero entries of the sparse CSR matrix \f$D\f$.
    !> @param[in]
    !> csrValD         array of \p nnzD elements of the sparse CSR matrix \f$D\f$.
    !> @param[in]
    !> csrRowPtrD      array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix \f$D\f$.
    !> @param[in]
    !> csrColIndD      array of \p nnzD elements containing the column indices of the
    !> sparse CSR matrix \f$D\f$.
    !> @param[in]
    !> descrC          descriptor of the sparse CSR matrix \f$C\f$. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[out]
    !> csrValC         array of \p nnzC elements of the sparse CSR matrix \f$C\f$.
    !> @param[in]
    !> csrRowPtrC      array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix \f$C\f$.
    !> @param[out]
    !> csrColIndC      array of \p nnzC elements containing the column indices of the
    !> sparse CSR matrix \f$C\f$.
    !> @param[in]
    !> info            structure that holds meta data for the sparse CSR matrix \f$C\f$.
    !> @param[in]
    !> pBuffer         temporary storage buffer allocated by the user. The size is returned
    !> by hipsparseScsrgemm2_bufferSizeExt(), hipsparseDcsrgemm2_bufferSizeExt(),
    !> hipsparseCcsrgemm2_bufferSizeExt(), or hipsparseZcsrgemm2_bufferSizeExt().
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p n, \p k, \p nnzA, \p nnzB,
    !> \p nnzD, \p alpha, \p beta, \p descrA, \p csrValA, \p csrRowPtrA, \p csrColIndA,
    !> \p descrB, \p csrValB, \p csrRowPtrB, \p csrColIndB, \p descrD, \p csrValD,
    !> \p csrRowPtrD, \p csrColIndD, \p csrValC, \p csrRowPtrC, \p csrColIndC, \p info,
    !> or \p pBuffer is invalid.
    !> \retval HIPSPARSE_STATUS_ALLOC_FAILED additional buffer for long rows could not be
    !> allocated.
    !> \retval HIPSPARSE_STATUS_NOT_SUPPORTED
    !> \ref hipsparseMatrixType_t != \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseScsrgemm2(handle, m, n, k, alpha, descrA, nnzA, csrValA, csrRowPtrA, &
                                csrColIndA, descrB, nnzB, csrValB, csrRowPtrB, csrColIndB, beta, &
                                descrD, nnzD, csrValD, csrRowPtrD, csrColIndD, descrC, csrValC, &
                                csrRowPtrC, csrColIndC, info, pBuffer) &
       result(Scsrgemm2) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseScsrgemm2")
#else
       bind(C, name="hipsparseScsrgemm2")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       real(c_float) :: alpha(*)
       type(c_ptr), value :: descrA
       integer(c_int), value :: nnzA
       real(c_float) :: csrValA(*)
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       type(c_ptr), value :: descrB
       integer(c_int), value :: nnzB
       real(c_float) :: csrValB(*)
       integer(c_int) :: csrRowPtrB(*)
       integer(c_int) :: csrColIndB(*)
       real(c_float) :: beta(*)
       type(c_ptr), value :: descrD
       integer(c_int), value :: nnzD
       real(c_float) :: csrValD(*)
       integer(c_int) :: csrRowPtrD(*)
       integer(c_int) :: csrColIndD(*)
       type(c_ptr), value :: descrC
       real(c_float) :: csrValC(*)
       integer(c_int) :: csrRowPtrC(*)
       integer(c_int) :: csrColIndC(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Scsrgemm2
    end function hipsparseScsrgemm2

    !---------------------------------------------
    ! hipsparseDcsrgemm2
    !---------------------------------------------
    function hipsparseDcsrgemm2(handle, m, n, k, alpha, descrA, nnzA, csrValA, csrRowPtrA, &
                                csrColIndA, descrB, nnzB, csrValB, csrRowPtrB, csrColIndB, beta, &
                                descrD, nnzD, csrValD, csrRowPtrD, csrColIndD, descrC, csrValC, &
                                csrRowPtrC, csrColIndC, info, pBuffer) &
       result(Dcsrgemm2) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDcsrgemm2")
#else
       bind(C, name="hipsparseDcsrgemm2")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       real(c_double) :: alpha(*)
       type(c_ptr), value :: descrA
       integer(c_int), value :: nnzA
       real(c_double) :: csrValA(*)
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       type(c_ptr), value :: descrB
       integer(c_int), value :: nnzB
       real(c_double) :: csrValB(*)
       integer(c_int) :: csrRowPtrB(*)
       integer(c_int) :: csrColIndB(*)
       real(c_double) :: beta(*)
       type(c_ptr), value :: descrD
       integer(c_int), value :: nnzD
       real(c_double) :: csrValD(*)
       integer(c_int) :: csrRowPtrD(*)
       integer(c_int) :: csrColIndD(*)
       type(c_ptr), value :: descrC
       real(c_double) :: csrValC(*)
       integer(c_int) :: csrRowPtrC(*)
       integer(c_int) :: csrColIndC(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Dcsrgemm2
    end function hipsparseDcsrgemm2

    !---------------------------------------------
    ! hipsparseCcsrgemm2
    !---------------------------------------------
    function hipsparseCcsrgemm2(handle, m, n, k, alpha, descrA, nnzA, csrValA, csrRowPtrA, &
                                csrColIndA, descrB, nnzB, csrValB, csrRowPtrB, csrColIndB, beta, &
                                descrD, nnzD, csrValD, csrRowPtrD, csrColIndD, descrC, csrValC, &
                                csrRowPtrC, csrColIndC, info, pBuffer) &
       result(Ccsrgemm2) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCcsrgemm2")
#else
       bind(C, name="hipsparseCcsrgemm2")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: alpha
       type(c_ptr), value :: descrA
       integer(c_int), value :: nnzA
       type(c_ptr), value :: csrValA
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       type(c_ptr), value :: descrB
       integer(c_int), value :: nnzB
       type(c_ptr), value :: csrValB
       integer(c_int) :: csrRowPtrB(*)
       integer(c_int) :: csrColIndB(*)
       type(c_ptr), value :: beta
       type(c_ptr), value :: descrD
       integer(c_int), value :: nnzD
       type(c_ptr), value :: csrValD
       integer(c_int) :: csrRowPtrD(*)
       integer(c_int) :: csrColIndD(*)
       type(c_ptr), value :: descrC
       type(c_ptr), value :: csrValC
       integer(c_int) :: csrRowPtrC(*)
       integer(c_int) :: csrColIndC(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Ccsrgemm2
    end function hipsparseCcsrgemm2

    !---------------------------------------------
    ! hipsparseZcsrgemm2
    !---------------------------------------------
    function hipsparseZcsrgemm2(handle, m, n, k, alpha, descrA, nnzA, csrValA, csrRowPtrA, &
                                csrColIndA, descrB, nnzB, csrValB, csrRowPtrB, csrColIndB, beta, &
                                descrD, nnzD, csrValD, csrRowPtrD, csrColIndD, descrC, csrValC, &
                                csrRowPtrC, csrColIndC, info, pBuffer) &
       result(Zcsrgemm2) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZcsrgemm2")
#else
       bind(C, name="hipsparseZcsrgemm2")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: k
       type(c_ptr), value :: alpha
       type(c_ptr), value :: descrA
       integer(c_int), value :: nnzA
       type(c_ptr), value :: csrValA
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       type(c_ptr), value :: descrB
       integer(c_int), value :: nnzB
       type(c_ptr), value :: csrValB
       integer(c_int) :: csrRowPtrB(*)
       integer(c_int) :: csrColIndB(*)
       type(c_ptr), value :: beta
       type(c_ptr), value :: descrD
       integer(c_int), value :: nnzD
       type(c_ptr), value :: csrValD
       integer(c_int) :: csrRowPtrD(*)
       integer(c_int) :: csrColIndD(*)
       type(c_ptr), value :: descrC
       type(c_ptr), value :: csrValC
       integer(c_int) :: csrRowPtrC(*)
       integer(c_int) :: csrColIndC(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Zcsrgemm2
    end function hipsparseZcsrgemm2

    !---------------------------------------------
    ! hipsparseXbsric02_zeroPivot
    !---------------------------------------------
    !> \ingroup precond_module
    !> \details
    !> \p hipsparseXbsric02_zeroPivot returns \ref HIPSPARSE_STATUS_ZERO_PIVOT if either a
    !> structural or numerical zero has been found during \ref hipsparseSbsric02_analysis
    !> "hipsparseXbsric02_analysis()" or \ref hipsparseSbsric02 "hipsparseXbsric02()" computation.
    !> The first zero pivot \f$j\f$ at \f$A_{j,j}\f$ is stored in \p position, using the same index
    !> base as the BSR matrix.
    !>
    !> \p position can be in host or device memory. If no zero pivot has been found,
    !> \p position is set to -1 and \ref HIPSPARSE_STATUS_SUCCESS is returned instead.
    !>
    !> \note
    !> If a zero pivot is found, \p position=j means that either the diagonal block \p A(j,j)
    !> is missing (structural zero) or the diagonal block \p A(j,j) is not positive definite
    !> (numerical zero).
    !>
    !> \note \p hipsparseXbsric02_zeroPivot is a blocking function. It might negatively influence
    !> performance.
    !>
    !> \deprecated
    !> This function is deprecated when using the CUDA backend (CUDA 12.0+) and will be
    !> removed in CUDA 13.0. This deprecation does not apply to the ROCm backend.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> info        structure that holds the information collected during the analysis step.
    !> @param[inout]
    !> position    pointer to zero pivot \f$j\f$, which can be in host or device memory.
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p info, or \p position is nullptr.
    !> \retval HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    !> \retval HIPSPARSE_STATUS_ZERO_PIVOT zero pivot has been found.
    function hipsparseXbsric02_zeroPivot(handle, info, position) &
       result(Xbsric02_zeroPivot) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseXbsric02_zeroPivot")
#else
       bind(C, name="hipsparseXbsric02_zeroPivot")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: info
       integer(c_int) :: position(*)
       integer(c_int) :: Xbsric02_zeroPivot
    end function hipsparseXbsric02_zeroPivot

    !---------------------------------------------
    ! hipsparseSbsric02_bufferSize
    !---------------------------------------------
    !> \ingroup precond_module
    !> \details
    !> \p hipsparseXbsric02_bufferSize returns the size of the temporary storage buffer
    !> in bytes that is required by \ref hipsparseSbsric02_analysis "hipsparseXbsric02_analysis()"
    !> and \ref hipsparseSbsric02 "hipsparseXbsric02()". The temporary storage buffer must be
    !> allocated by the user.
    !>
    !> @param[in]
    !> handle             handle to the hipSPARSE library context queue.
    !> @param[in]
    !> dirA direction that specifies whether to count non-zero elements by \ref
    !> HIPSPARSE_DIRECTION_ROW
    !> or by \ref HIPSPARSE_DIRECTION_COLUMN.
    !> @param[in]
    !> mb                 number of block rows in the sparse BSR matrix. Must be non-negative.
    !> @param[in]
    !> nnzb number of non-zero block entries of the sparse BSR matrix. Must be non-negative.
    !> @param[in]
    !> descrA             descriptor of the sparse BSR matrix.
    !> @param[in]
    !> bsrValA array of length \p nnzb*blockDim*blockDim containing the values of the sparse BSR
    !> matrix.
    !> @param[in]
    !> bsrRowPtrA array of \p mb+1 elements that point to the start of every block row of the
    !> sparse BSR matrix.
    !> @param[in]
    !> bsrColIndA array of \p nnzb elements containing the block column indices of the sparse BSR
    !> matrix.
    !> @param[in]
    !> blockDim the block dimension of the BSR matrix. Must be positive, which is between 1 and m
    !> where \p m=mb*blockDim.
    !> @param[out]
    !> info               structure that holds the information collected during the analysis step.
    !> @param[out]
    !> pBufferSizeInBytes number of bytes of the temporary storage buffer required by
    !> hipsparseSbsric02_analysis(), hipsparseDbsric02_analysis(),
    !> hipsparseCbsric02_analysis(), hipsparseZbsric02_analysis(),
    !> hipsparseSbsric02(), hipsparseDbsric02(), hipsparseCbsric02(),
    !> and hipsparseZbsric02().
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p descrA, \p bsrValA, \p bsrRowPtrA,
    !> \p bsrColIndA, \p info, or \p pBufferSizeInBytes is nullptr, \p mb, or \p nnzb is negative,
    !> or \p blockDim is invalid.
    !> \retval HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    !> \retval HIPSPARSE_STATUS_NOT_SUPPORTED \ref hipsparseMatrixType_t != \ref
    !> HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseSbsric02_bufferSize(handle, dirA, mb, nnzb, descrA, bsrValA, bsrRowPtrA, &
                                          bsrColIndA, blockDim, info, pBufferSizeInBytes) &
       result(Sbsric02_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSbsric02_bufferSize")
#else
       bind(C, name="hipsparseSbsric02_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       real(c_float) :: bsrValA(*)
       integer(c_int) :: bsrRowPtrA(*)
       integer(c_int) :: bsrColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int) :: pBufferSizeInBytes(*)
       integer(c_int) :: Sbsric02_bufferSize
    end function hipsparseSbsric02_bufferSize

    !---------------------------------------------
    ! hipsparseDbsric02_bufferSize
    !---------------------------------------------
    function hipsparseDbsric02_bufferSize(handle, dirA, mb, nnzb, descrA, bsrValA, bsrRowPtrA, &
                                          bsrColIndA, blockDim, info, pBufferSizeInBytes) &
       result(Dbsric02_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDbsric02_bufferSize")
#else
       bind(C, name="hipsparseDbsric02_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       real(c_double) :: bsrValA(*)
       integer(c_int) :: bsrRowPtrA(*)
       integer(c_int) :: bsrColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int) :: pBufferSizeInBytes(*)
       integer(c_int) :: Dbsric02_bufferSize
    end function hipsparseDbsric02_bufferSize

    !---------------------------------------------
    ! hipsparseCbsric02_bufferSize
    !---------------------------------------------
    function hipsparseCbsric02_bufferSize(handle, dirA, mb, nnzb, descrA, bsrValA, bsrRowPtrA, &
                                          bsrColIndA, blockDim, info, pBufferSizeInBytes) &
       result(Cbsric02_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCbsric02_bufferSize")
#else
       bind(C, name="hipsparseCbsric02_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       type(c_ptr), value :: bsrValA
       integer(c_int) :: bsrRowPtrA(*)
       integer(c_int) :: bsrColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int) :: pBufferSizeInBytes(*)
       integer(c_int) :: Cbsric02_bufferSize
    end function hipsparseCbsric02_bufferSize

    !---------------------------------------------
    ! hipsparseZbsric02_bufferSize
    !---------------------------------------------
    function hipsparseZbsric02_bufferSize(handle, dirA, mb, nnzb, descrA, bsrValA, bsrRowPtrA, &
                                          bsrColIndA, blockDim, info, pBufferSizeInBytes) &
       result(Zbsric02_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZbsric02_bufferSize")
#else
       bind(C, name="hipsparseZbsric02_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       type(c_ptr), value :: bsrValA
       integer(c_int) :: bsrRowPtrA(*)
       integer(c_int) :: bsrColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int) :: pBufferSizeInBytes(*)
       integer(c_int) :: Zbsric02_bufferSize
    end function hipsparseZbsric02_bufferSize

    !---------------------------------------------
    ! hipsparseSbsric02_analysis
    !---------------------------------------------
    !> \ingroup precond_module
    !> \details
    !> \p hipsparseXbsric02_analysis performs the analysis step for \ref hipsparseSbsric02
    !> "hipsparseXbsric02()". It is expected that this function will be executed only once
    !> for a given matrix and particular operation type.
    !>
    !> \note
    !> If the matrix sparsity pattern changes, the gathered information will become invalid.
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> dirA direction that specifies whether to count non-zero elements by \ref
    !> HIPSPARSE_DIRECTION_ROW or by
    !> \ref HIPSPARSE_DIRECTION_COLUMN.
    !> @param[in]
    !> mb          number of block rows in the sparse BSR matrix.
    !> @param[in]
    !> nnzb        number of non-zero block entries of the sparse BSR matrix.
    !> @param[in]
    !> descrA      descriptor of the sparse BSR matrix.
    !> @param[in]
    !> bsrValA array of length \p nnzb*blockDim*blockDim containing the values of the sparse BSR
    !> matrix.
    !> @param[in]
    !> bsrRowPtrA  array of \p mb+1 elements that point to the start of every block row of the
    !> sparse BSR matrix.
    !> @param[in]
    !> bsrColIndA array of \p nnzb elements containing the block column indices of the sparse BSR
    !> matrix.
    !> @param[in]
    !> blockDim the block dimension of the BSR matrix, which is between 1 and m where \p
    !> m=mb*blockDim.
    !> @param[out]
    !> info        structure that holds the information collected during the analysis step.
    !> @param[in]
    !> policy      \ref HIPSPARSE_SOLVE_POLICY_NO_LEVEL or \ref HIPSPARSE_SOLVE_POLICY_USE_LEVEL.
    !> @param[in]
    !> pBuffer     temporary storage buffer allocated by the user.
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval     HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p mb, \p nnzb, \p blockDim, \p descrA,
    !> \p bsrValA, \p bsrRowPtrA, \p bsrColIndA, \p info, or \p pBuffer pointer is invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    !> \retval     HIPSPARSE_STATUS_NOT_SUPPORTED
    !> \ref hipsparseMatrixType_t != \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseSbsric02_analysis(handle, dirA, mb, nnzb, descrA, bsrValA, bsrRowPtrA, &
                                        bsrColIndA, blockDim, info, policy, pBuffer) &
       result(Sbsric02_analysis) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSbsric02_analysis")
#else
       bind(C, name="hipsparseSbsric02_analysis")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       real(c_float) :: bsrValA(*)
       integer(c_int) :: bsrRowPtrA(*)
       integer(c_int) :: bsrColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Sbsric02_analysis
    end function hipsparseSbsric02_analysis

    !---------------------------------------------
    ! hipsparseDbsric02_analysis
    !---------------------------------------------
    function hipsparseDbsric02_analysis(handle, dirA, mb, nnzb, descrA, bsrValA, bsrRowPtrA, &
                                        bsrColIndA, blockDim, info, policy, pBuffer) &
       result(Dbsric02_analysis) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDbsric02_analysis")
#else
       bind(C, name="hipsparseDbsric02_analysis")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       real(c_double) :: bsrValA(*)
       integer(c_int) :: bsrRowPtrA(*)
       integer(c_int) :: bsrColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Dbsric02_analysis
    end function hipsparseDbsric02_analysis

    !---------------------------------------------
    ! hipsparseCbsric02_analysis
    !---------------------------------------------
    function hipsparseCbsric02_analysis(handle, dirA, mb, nnzb, descrA, bsrValA, bsrRowPtrA, &
                                        bsrColIndA, blockDim, info, policy, pBuffer) &
       result(Cbsric02_analysis) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCbsric02_analysis")
#else
       bind(C, name="hipsparseCbsric02_analysis")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       type(c_ptr), value :: bsrValA
       integer(c_int) :: bsrRowPtrA(*)
       integer(c_int) :: bsrColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Cbsric02_analysis
    end function hipsparseCbsric02_analysis

    !---------------------------------------------
    ! hipsparseZbsric02_analysis
    !---------------------------------------------
    function hipsparseZbsric02_analysis(handle, dirA, mb, nnzb, descrA, bsrValA, bsrRowPtrA, &
                                        bsrColIndA, blockDim, info, policy, pBuffer) &
       result(Zbsric02_analysis) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZbsric02_analysis")
#else
       bind(C, name="hipsparseZbsric02_analysis")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       type(c_ptr), value :: bsrValA
       integer(c_int) :: bsrRowPtrA(*)
       integer(c_int) :: bsrColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Zbsric02_analysis
    end function hipsparseZbsric02_analysis

    !---------------------------------------------
    ! hipsparseSbsric02
    !---------------------------------------------
    !> \ingroup precond_module
    !> \brief Incomplete Cholesky factorization with 0 fill-ins and no pivoting using the BSR
    !> storage format.
    !>
    !> \details
    !> \p hipsparseXbsric02 computes the incomplete Cholesky factorization with 0 fill-ins
    !> and no pivoting of a sparse \f$mb \times mb\f$ BSR matrix \f$A\f$, such that
    !> \f[
    !> A \approx LL^T
    !> \f]
    !>
    !> Computing the above incomplete Cholesky factorization requires three steps to complete.
    !> First,
    !> the user determines the size of the required temporary storage buffer by calling
    !> \ref hipsparseSbsric02_bufferSize "hipsparseXbsric02_bufferSize()". After this buffer size
    !> has been determined,
    !> the user allocates the buffer and passes it to \ref hipsparseSbsric02_analysis
    !> "hipsparseXbsric02_analysis()".
    !> This will perform analysis on the sparsity pattern of the matrix. Finally, the user calls \p
    !> hipsparseXbsric02
    !> to perform the actual factorization. The calculation of the buffer size and the analysis of
    !> the sparse matrix
    !> only need to be performed once for a given sparsity pattern, while the factorization can be
    !> repeatedly applied
    !> to multiple matrices having the same sparsity pattern. After all calls to \p
    !> hipsparseXbsric02 are complete,
    !> the temporary buffer can be deallocated.
    !>
    !> \p hipsparseXbsric02 requires a user-allocated temporary buffer. Its size is returned
    !> by \ref hipsparseSbsric02_bufferSize "hipsparseXbsric02_bufferSize()". Furthermore,
    !> analysis meta data is required. It can be obtained by \ref hipsparseSbsric02_analysis
    !> "hipsparseXbsric02_analysis()". \p hipsparseXbsric02 reports the first zero pivot
    !> (either numerical or structural zero). The zero pivot status can be obtained by calling
    !> \ref hipsparseXbsric02_zeroPivot().
    !>
    !> \p hipsparseXbsric02 reports the first zero pivot (either numerical or structural zero).
    !> The zero pivot status can be obtained by calling \ref hipsparseXbsric02_zeroPivot().
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> dirA direction that specifies whether to count non-zero elements by \ref
    !> HIPSPARSE_DIRECTION_ROW or by
    !> \ref HIPSPARSE_DIRECTION_COLUMN.
    !> @param[in]
    !> mb          number of block rows in the sparse BSR matrix.
    !> @param[in]
    !> nnzb        number of non-zero block entries of the sparse BSR matrix.
    !> @param[in]
    !> descrA      descriptor of the sparse BSR matrix.
    !> @param[inout]
    !> bsrValA array of length \p nnzb*blockDim*blockDim containing the values of the sparse BSR
    !> matrix.
    !> @param[in]
    !> bsrRowPtrA  array of \p mb+1 elements that point to the start of every block row of the
    !> sparse BSR matrix.
    !> @param[in]
    !> bsrColIndA array of \p nnzb elements containing the block column indices of the sparse BSR
    !> matrix.
    !> @param[in]
    !> blockDim the block dimension of the BSR matrix, which is between 1 and m where \p
    !> m=mb*blockDim.
    !> @param[in]
    !> info        structure that holds the information collected during the analysis step.
    !> @param[in]
    !> policy      \ref HIPSPARSE_SOLVE_POLICY_NO_LEVEL or \ref HIPSPARSE_SOLVE_POLICY_USE_LEVEL.
    !> @param[in]
    !> pBuffer     temporary storage buffer allocated by the user.
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval     HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p mb, \p nnzb, \p blockDim, \p descrA,
    !> \p bsrValA, \p bsrRowPtrA, or \p bsrColIndA pointer is invalid.
    !> \retval     HIPSPARSE_STATUS_ARCH_MISMATCH the device is not supported.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    !> \retval     HIPSPARSE_STATUS_NOT_SUPPORTED
    !> \ref hipsparseMatrixType_t != \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseSbsric02(handle, dirA, mb, nnzb, descrA, bsrValA, bsrRowPtrA, bsrColIndA, &
                               blockDim, info, policy, pBuffer) &
       result(Sbsric02) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSbsric02")
#else
       bind(C, name="hipsparseSbsric02")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       real(c_float) :: bsrValA(*)
       integer(c_int) :: bsrRowPtrA(*)
       integer(c_int) :: bsrColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Sbsric02
    end function hipsparseSbsric02

    !---------------------------------------------
    ! hipsparseDbsric02
    !---------------------------------------------
    function hipsparseDbsric02(handle, dirA, mb, nnzb, descrA, bsrValA, bsrRowPtrA, bsrColIndA, &
                               blockDim, info, policy, pBuffer) &
       result(Dbsric02) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDbsric02")
#else
       bind(C, name="hipsparseDbsric02")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       real(c_double) :: bsrValA(*)
       integer(c_int) :: bsrRowPtrA(*)
       integer(c_int) :: bsrColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Dbsric02
    end function hipsparseDbsric02

    !---------------------------------------------
    ! hipsparseCbsric02
    !---------------------------------------------
    function hipsparseCbsric02(handle, dirA, mb, nnzb, descrA, bsrValA, bsrRowPtrA, bsrColIndA, &
                               blockDim, info, policy, pBuffer) &
       result(Cbsric02) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCbsric02")
#else
       bind(C, name="hipsparseCbsric02")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       type(c_ptr), value :: bsrValA
       integer(c_int) :: bsrRowPtrA(*)
       integer(c_int) :: bsrColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Cbsric02
    end function hipsparseCbsric02

    !---------------------------------------------
    ! hipsparseZbsric02
    !---------------------------------------------
    function hipsparseZbsric02(handle, dirA, mb, nnzb, descrA, bsrValA, bsrRowPtrA, bsrColIndA, &
                               blockDim, info, policy, pBuffer) &
       result(Zbsric02) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZbsric02")
#else
       bind(C, name="hipsparseZbsric02")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       type(c_ptr), value :: bsrValA
       integer(c_int) :: bsrRowPtrA(*)
       integer(c_int) :: bsrColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Zbsric02
    end function hipsparseZbsric02

    !---------------------------------------------
    ! hipsparseXbsrilu02_zeroPivot
    !---------------------------------------------
    !> \ingroup precond_module
    !> \details
    !> \p hipsparseXbsrilu02_zeroPivot returns \ref HIPSPARSE_STATUS_ZERO_PIVOT if either a
    !> structural or numerical zero has been found during \ref hipsparseSbsrilu02_analysis
    !> "hipsparseXbsrilu02_analysis()" or \ref hipsparseSbsrilu02 "hipsparseXbsrilu02()"
    !> computation. The first zero pivot \f$j\f$ at \f$A_{j,j}\f$ is stored in \p position,
    !> using the same index base as the BSR matrix.
    !>
    !> \p position can be in host or device memory. If no zero pivot has been found,
    !> \p position is set to -1 and \ref HIPSPARSE_STATUS_SUCCESS is returned instead.
    !>
    !> \note
    !> If a zero pivot is found, \p position \f$=j\f$ means that either the diagonal block
    !> \f$A_{j,j}\f$ is missing (structural zero) or the diagonal block \f$A_{j,j}\f$ is not
    !> invertible (numerical zero).
    !>
    !> \note \p hipsparseXbsrilu02_zeroPivot is a blocking function. It might negatively influence
    !> performance.
    !>
    !> \deprecated
    !> This function is deprecated when using the CUDA backend (CUDA 12.0+) and will be
    !> removed in CUDA 13.0. This deprecation does not apply to the ROCm backend.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> info        structure that holds the information collected during the analysis step.
    !> @param[inout]
    !> position    pointer to zero pivot \f$j\f$, which can be in host or device memory.
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p info, or \p position is nullptr.
    !> \retval HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    !> \retval HIPSPARSE_STATUS_ZERO_PIVOT zero pivot has been found.
    function hipsparseXbsrilu02_zeroPivot(handle, info, position) &
       result(Xbsrilu02_zeroPivot) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseXbsrilu02_zeroPivot")
#else
       bind(C, name="hipsparseXbsrilu02_zeroPivot")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: info
       integer(c_int) :: position(*)
       integer(c_int) :: Xbsrilu02_zeroPivot
    end function hipsparseXbsrilu02_zeroPivot

    !---------------------------------------------
    ! hipsparseSbsrilu02_numericBoost
    !---------------------------------------------
    !> \ingroup precond_module
    !> \details
    !> \p hipsparseXbsrilu02_numericBoost enables the user to replace a numerical value in
    !> an incomplete LU factorization. \p tol is used to determine whether a numerical value
    !> is replaced by \p boost_val, such that \f$A_{j,j} = \text{boost_val}\f$ if
    !> \f$\text{tol} \ge \left|A_{j,j}\right|\f$.
    !>
    !> \note The boost value is enabled by setting \p enable_boost to 1 or disabled by
    !> setting \p enable_boost to 0.
    !>
    !> \note \p tol and \p boost_val can be in host or device memory.
    !>
    !> \deprecated
    !> This function is deprecated when using the CUDA backend (CUDA 12.0+) and will be
    !> removed in CUDA 13.0. This deprecation does not apply to the ROCm backend.
    !>
    !> @param[in]
    !> handle        handle to the hipSPARSE library context queue.
    !> @param[in]
    !> info          structure that holds the information collected during the analysis step.
    !> @param[in]
    !> enable_boost  enable/disable numeric boost.
    !> @param[in]
    !> tol           tolerance to determine whether a numerical value is replaced or not.
    !> @param[in]
    !> boost_val     boost value to replace a numerical value.
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p info, \p tol, or \p boost_val is
    !> nullptr.
    !> \retval HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    function hipsparseSbsrilu02_numericBoost(handle, info, enable_boost, tol, boost_val) &
       result(Sbsrilu02_numericBoost) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSbsrilu02_numericBoost")
#else
       bind(C, name="hipsparseSbsrilu02_numericBoost")
#endif
       import :: c_ptr, c_int, c_double, c_float
       type(c_ptr), value :: handle
       type(c_ptr), value :: info
       integer(c_int), value :: enable_boost
       real(c_double) :: tol(*)
       real(c_float) :: boost_val(*)
       integer(c_int) :: Sbsrilu02_numericBoost
    end function hipsparseSbsrilu02_numericBoost

    !---------------------------------------------
    ! hipsparseDbsrilu02_numericBoost
    !---------------------------------------------
    function hipsparseDbsrilu02_numericBoost(handle, info, enable_boost, tol, boost_val) &
       result(Dbsrilu02_numericBoost) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDbsrilu02_numericBoost")
#else
       bind(C, name="hipsparseDbsrilu02_numericBoost")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       type(c_ptr), value :: info
       integer(c_int), value :: enable_boost
       real(c_double) :: tol(*)
       real(c_double) :: boost_val(*)
       integer(c_int) :: Dbsrilu02_numericBoost
    end function hipsparseDbsrilu02_numericBoost

    !---------------------------------------------
    ! hipsparseCbsrilu02_numericBoost
    !---------------------------------------------
    function hipsparseCbsrilu02_numericBoost(handle, info, enable_boost, tol, boost_val) &
       result(Cbsrilu02_numericBoost) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCbsrilu02_numericBoost")
#else
       bind(C, name="hipsparseCbsrilu02_numericBoost")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       type(c_ptr), value :: info
       integer(c_int), value :: enable_boost
       real(c_double) :: tol(*)
       type(c_ptr), value :: boost_val
       integer(c_int) :: Cbsrilu02_numericBoost
    end function hipsparseCbsrilu02_numericBoost

    !---------------------------------------------
    ! hipsparseZbsrilu02_numericBoost
    !---------------------------------------------
    function hipsparseZbsrilu02_numericBoost(handle, info, enable_boost, tol, boost_val) &
       result(Zbsrilu02_numericBoost) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZbsrilu02_numericBoost")
#else
       bind(C, name="hipsparseZbsrilu02_numericBoost")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       type(c_ptr), value :: info
       integer(c_int), value :: enable_boost
       real(c_double) :: tol(*)
       type(c_ptr), value :: boost_val
       integer(c_int) :: Zbsrilu02_numericBoost
    end function hipsparseZbsrilu02_numericBoost

    !---------------------------------------------
    ! hipsparseSbsrilu02_bufferSize
    !---------------------------------------------
    !> \ingroup precond_module
    !> \details
    !> \p hipsparseXbsrilu02_bufferSize returns the size of the temporary storage buffer
    !> in bytes that is required by \ref hipsparseSbsrilu02_analysis "hipsparseXbsrilu02_analysis()"
    !> and \ref hipsparseSbsrilu02 "hipsparseXbsrilu02()". The temporary storage buffer must be
    !> allocated by the user.
    !>
    !> @param[in]
    !> handle             handle to the hipSPARSE library context queue.
    !> @param[in]
    !> dirA direction that specifies whether to count non-zero elements by \ref
    !> HIPSPARSE_DIRECTION_ROW
    !> or by \ref HIPSPARSE_DIRECTION_COLUMN.
    !> @param[in]
    !> mb                 number of block rows in the sparse BSR matrix.
    !> @param[in]
    !> nnzb               number of non-zero block entries of the sparse BSR matrix.
    !> @param[in]
    !> descrA             descriptor of the sparse BSR matrix.
    !> @param[in]
    !> bsrSortedValA array of length \p nnzb*blockDim*blockDim containing the values of the sparse
    !> BSR matrix.
    !> @param[in]
    !> bsrSortedRowPtrA array of \p mb+1 elements that point to the start of every block row of the
    !> sparse BSR matrix.
    !> @param[in]
    !> bsrSortedColIndA array of \p nnzb elements containing the block column indices of the sparse
    !> BSR matrix.
    !> @param[in]
    !> blockDim the block dimension of the BSR matrix, which is between 1 and m where \p
    !> m=mb*blockDim.
    !> @param[out]
    !> info               structure that holds the information collected during the analysis step.
    !> @param[out]
    !> pBufferSizeInBytes number of bytes of the temporary storage buffer required by
    !> hipsparseSbsrilu02_analysis(), hipsparseDbsrilu02_analysis(),
    !> hipsparseCbsrilu02_analysis(), hipsparseZbsrilu02_analysis(),
    !> hipsparseSbsrilu02(), hipsparseDbsrilu02(), hipsparseCbsrilu02(),
    !> and hipsparseZbsrilu02().
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval     HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p mb, \p nnzb, \p blockDim, \p descrA,
    !> \p bsrSortedValA, \p bsrSortedRowPtrA, \p bsrSortedColIndA, \p info, or
    !> \p pBufferSizeInBytes pointer is invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    !> \retval     HIPSPARSE_STATUS_NOT_SUPPORTED
    !> \ref hipsparseMatrixType_t != \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseSbsrilu02_bufferSize(handle, dirA, mb, nnzb, descrA, bsrSortedValA, &
                                           bsrSortedRowPtrA, bsrSortedColIndA, blockDim, info, &
                                           pBufferSizeInBytes) &
       result(Sbsrilu02_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSbsrilu02_bufferSize")
#else
       bind(C, name="hipsparseSbsrilu02_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       real(c_float) :: bsrSortedValA(*)
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int) :: pBufferSizeInBytes(*)
       integer(c_int) :: Sbsrilu02_bufferSize
    end function hipsparseSbsrilu02_bufferSize

    !---------------------------------------------
    ! hipsparseDbsrilu02_bufferSize
    !---------------------------------------------
    function hipsparseDbsrilu02_bufferSize(handle, dirA, mb, nnzb, descrA, bsrSortedValA, &
                                           bsrSortedRowPtrA, bsrSortedColIndA, blockDim, info, &
                                           pBufferSizeInBytes) &
       result(Dbsrilu02_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDbsrilu02_bufferSize")
#else
       bind(C, name="hipsparseDbsrilu02_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       real(c_double) :: bsrSortedValA(*)
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int) :: pBufferSizeInBytes(*)
       integer(c_int) :: Dbsrilu02_bufferSize
    end function hipsparseDbsrilu02_bufferSize

    !---------------------------------------------
    ! hipsparseCbsrilu02_bufferSize
    !---------------------------------------------
    function hipsparseCbsrilu02_bufferSize(handle, dirA, mb, nnzb, descrA, bsrSortedValA, &
                                           bsrSortedRowPtrA, bsrSortedColIndA, blockDim, info, &
                                           pBufferSizeInBytes) &
       result(Cbsrilu02_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCbsrilu02_bufferSize")
#else
       bind(C, name="hipsparseCbsrilu02_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       type(c_ptr), value :: bsrSortedValA
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int) :: pBufferSizeInBytes(*)
       integer(c_int) :: Cbsrilu02_bufferSize
    end function hipsparseCbsrilu02_bufferSize

    !---------------------------------------------
    ! hipsparseZbsrilu02_bufferSize
    !---------------------------------------------
    function hipsparseZbsrilu02_bufferSize(handle, dirA, mb, nnzb, descrA, bsrSortedValA, &
                                           bsrSortedRowPtrA, bsrSortedColIndA, blockDim, info, &
                                           pBufferSizeInBytes) &
       result(Zbsrilu02_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZbsrilu02_bufferSize")
#else
       bind(C, name="hipsparseZbsrilu02_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       type(c_ptr), value :: bsrSortedValA
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int) :: pBufferSizeInBytes(*)
       integer(c_int) :: Zbsrilu02_bufferSize
    end function hipsparseZbsrilu02_bufferSize

    !---------------------------------------------
    ! hipsparseSbsrilu02_analysis
    !---------------------------------------------
    !> \ingroup precond_module
    !> \details
    !> \p hipsparseXbsrilu02_analysis performs the analysis step for \ref hipsparseSbsrilu02
    !> "hipsparseXbsrilu02()". It is expected that this function will be executed only once
    !> for a given matrix.
    !>
    !> \note
    !> If the matrix sparsity pattern changes, the gathered information will become invalid.
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> @param[in]
    !> handle           handle to the hipSPARSE library context queue.
    !> @param[in]
    !> dirA             direction that specified whether to count non-zero elements by
    !> \ref HIPSPARSE_DIRECTION_ROW or by \ref HIPSPARSE_DIRECTION_COLUMN.
    !> @param[in]
    !> mb               number of block rows in the sparse BSR matrix.
    !> @param[in]
    !> nnzb             number of non-zero block entries of the sparse BSR matrix.
    !> @param[in]
    !> descrA           descriptor of the sparse BSR matrix.
    !> @param[in]
    !> bsrSortedValA array of length \p nnzb*blockDim*blockDim containing the values of the sparse
    !> BSR matrix.
    !> @param[in]
    !> bsrSortedRowPtrA array of \p mb+1 elements that point to the start of every block row of the
    !> sparse BSR matrix.
    !> @param[in]
    !> bsrSortedColIndA array of \p nnzb elements containing the block column indices of the sparse
    !> BSR matrix.
    !> @param[in]
    !> blockDim the block dimension of the BSR matrix, which is between 1 and m where \p
    !> m=mb*blockDim.
    !> @param[out]
    !> info             structure that holds the information collected during the analysis step.
    !> @param[in]
    !> policy \ref HIPSPARSE_SOLVE_POLICY_NO_LEVEL or \ref HIPSPARSE_SOLVE_POLICY_USE_LEVEL.
    !> @param[in]
    !> pBuffer          temporary storage buffer allocated by the user.
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval     HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p mb, \p nnzb, \p blockDim, \p descrA,
    !> \p bsrSortedValA, \p bsrSortedRowPtrA, \p bsrSortedColIndA, \p info, or \p pBuffer pointer
    !> is invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    !> \retval     HIPSPARSE_STATUS_NOT_SUPPORTED
    !> \ref hipsparseMatrixType_t != \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseSbsrilu02_analysis(handle, dirA, mb, nnzb, descrA, bsrSortedValA, &
                                         bsrSortedRowPtrA, bsrSortedColIndA, blockDim, info, &
                                         policy, pBuffer) &
       result(Sbsrilu02_analysis) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSbsrilu02_analysis")
#else
       bind(C, name="hipsparseSbsrilu02_analysis")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       real(c_float) :: bsrSortedValA(*)
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Sbsrilu02_analysis
    end function hipsparseSbsrilu02_analysis

    !---------------------------------------------
    ! hipsparseDbsrilu02_analysis
    !---------------------------------------------
    function hipsparseDbsrilu02_analysis(handle, dirA, mb, nnzb, descrA, bsrSortedValA, &
                                         bsrSortedRowPtrA, bsrSortedColIndA, blockDim, info, &
                                         policy, pBuffer) &
       result(Dbsrilu02_analysis) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDbsrilu02_analysis")
#else
       bind(C, name="hipsparseDbsrilu02_analysis")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       real(c_double) :: bsrSortedValA(*)
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Dbsrilu02_analysis
    end function hipsparseDbsrilu02_analysis

    !---------------------------------------------
    ! hipsparseCbsrilu02_analysis
    !---------------------------------------------
    function hipsparseCbsrilu02_analysis(handle, dirA, mb, nnzb, descrA, bsrSortedValA, &
                                         bsrSortedRowPtrA, bsrSortedColIndA, blockDim, info, &
                                         policy, pBuffer) &
       result(Cbsrilu02_analysis) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCbsrilu02_analysis")
#else
       bind(C, name="hipsparseCbsrilu02_analysis")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       type(c_ptr), value :: bsrSortedValA
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Cbsrilu02_analysis
    end function hipsparseCbsrilu02_analysis

    !---------------------------------------------
    ! hipsparseZbsrilu02_analysis
    !---------------------------------------------
    function hipsparseZbsrilu02_analysis(handle, dirA, mb, nnzb, descrA, bsrSortedValA, &
                                         bsrSortedRowPtrA, bsrSortedColIndA, blockDim, info, &
                                         policy, pBuffer) &
       result(Zbsrilu02_analysis) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZbsrilu02_analysis")
#else
       bind(C, name="hipsparseZbsrilu02_analysis")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       type(c_ptr), value :: bsrSortedValA
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Zbsrilu02_analysis
    end function hipsparseZbsrilu02_analysis

    !---------------------------------------------
    ! hipsparseSbsrilu02
    !---------------------------------------------
    !> \ingroup precond_module
    !> \brief Incomplete LU factorization with 0 fill-ins and no pivoting using the BSR storage
    !> format.
    !>
    !> \details
    !> \p hipsparseXbsrilu02 computes the incomplete LU factorization with 0 fill-ins and no
    !> pivoting of a sparse \f$mb \times mb\f$ BSR matrix \f$A\f$, such that
    !> \f[
    !> A \approx LU
    !> \f]
    !>
    !> Computing the above incomplete LU factorization requires three steps to complete. First,
    !> the user determines the size of the required temporary storage buffer by calling
    !> \ref hipsparseSbsrilu02_bufferSize "hipsparseXbsrilu02_bufferSize()". After this buffer size
    !> has been determined, the user allocates the buffer and passes it to
    !> \ref hipsparseSbsrilu02_analysis "hipsparseXbsrilu02_analysis()". This will perform analysis
    !> on
    !> the sparsity pattern of the matrix. Finally, the user calls \p hipsparseXbsrilu02 to perform
    !> the
    !> actual factorization. The calculation of the buffer size and the analysis of the sparse
    !> matrix
    !> only need to be performed once for a given sparsity pattern, while the factorization can be
    !> repeatedly applied to multiple matrices having the same sparsity pattern. After all calls to
    !> \ref hipsparseSbsrilu02 "hipsparseXbsrilu02()" are complete, the temporary buffer can be
    !> deallocated.
    !>
    !> \p hipsparseXbsrilu02 reports the first zero pivot (either numerical or structural zero).
    !> The zero pivot status can be obtained by calling \ref hipsparseXbsrilu02_zeroPivot().
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> @param[in]
    !> handle             handle to the hipSPARSE library context queue.
    !> @param[in]
    !> dirA               direction that specified whether to count non-zero elements by
    !> \ref HIPSPARSE_DIRECTION_ROW or by \ref HIPSPARSE_DIRECTION_COLUMN.
    !> @param[in]
    !> mb                 number of block rows in the sparse BSR matrix.
    !> @param[in]
    !> nnzb               number of non-zero block entries of the sparse BSR matrix.
    !> @param[in]
    !> descrA             descriptor of the sparse BSR matrix.
    !> @param[inout]
    !> bsrSortedValA_valM array of length \p nnzb*blockDim*blockDim containing the values of the
    !> sparse BSR matrix.
    !> @param[in]
    !> bsrSortedRowPtrA array of \p mb+1 elements that point to the start of every block row of the
    !> sparse BSR matrix.
    !> @param[in]
    !> bsrSortedColIndA array of \p nnzb elements containing the block column indices of the sparse
    !> BSR matrix.
    !> @param[in]
    !> blockDim the block dimension of the BSR matrix, which is between 1 and m where \p
    !> m=mb*blockDim.
    !> @param[in]
    !> info               structure that holds the information collected during the analysis step.
    !> @param[in]
    !> policy \ref HIPSPARSE_SOLVE_POLICY_NO_LEVEL or \ref HIPSPARSE_SOLVE_POLICY_USE_LEVEL.
    !> @param[in]
    !> pBuffer            temporary storage buffer allocated by the user.
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval     HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p mb, \p nnzb, \p blockDim, \p descrA,
    !> \p bsrSortedValA_valM, \p bsrSortedRowPtrA, or \p bsrSortedColIndA pointer is invalid.
    !> \retval     HIPSPARSE_STATUS_ARCH_MISMATCH the device is not supported.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    !> \retval     HIPSPARSE_STATUS_NOT_SUPPORTED
    !> \ref hipsparseMatrixType_t != \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseSbsrilu02(handle, dirA, mb, nnzb, descrA, bsrSortedValA_valM, &
                                bsrSortedRowPtrA, bsrSortedColIndA, blockDim, info, policy, &
                                pBuffer) &
       result(Sbsrilu02) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSbsrilu02")
#else
       bind(C, name="hipsparseSbsrilu02")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       real(c_float) :: bsrSortedValA_valM(*)
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Sbsrilu02
    end function hipsparseSbsrilu02

    !---------------------------------------------
    ! hipsparseDbsrilu02
    !---------------------------------------------
    function hipsparseDbsrilu02(handle, dirA, mb, nnzb, descrA, bsrSortedValA_valM, &
                                bsrSortedRowPtrA, bsrSortedColIndA, blockDim, info, policy, &
                                pBuffer) &
       result(Dbsrilu02) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDbsrilu02")
#else
       bind(C, name="hipsparseDbsrilu02")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       real(c_double) :: bsrSortedValA_valM(*)
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Dbsrilu02
    end function hipsparseDbsrilu02

    !---------------------------------------------
    ! hipsparseCbsrilu02
    !---------------------------------------------
    function hipsparseCbsrilu02(handle, dirA, mb, nnzb, descrA, bsrSortedValA_valM, &
                                bsrSortedRowPtrA, bsrSortedColIndA, blockDim, info, policy, &
                                pBuffer) &
       result(Cbsrilu02) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCbsrilu02")
#else
       bind(C, name="hipsparseCbsrilu02")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       type(c_ptr), value :: bsrSortedValA_valM
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Cbsrilu02
    end function hipsparseCbsrilu02

    !---------------------------------------------
    ! hipsparseZbsrilu02
    !---------------------------------------------
    function hipsparseZbsrilu02(handle, dirA, mb, nnzb, descrA, bsrSortedValA_valM, &
                                bsrSortedRowPtrA, bsrSortedColIndA, blockDim, info, policy, &
                                pBuffer) &
       result(Zbsrilu02) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZbsrilu02")
#else
       bind(C, name="hipsparseZbsrilu02")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       type(c_ptr), value :: bsrSortedValA_valM
       integer(c_int) :: bsrSortedRowPtrA(*)
       integer(c_int) :: bsrSortedColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Zbsrilu02
    end function hipsparseZbsrilu02

    !---------------------------------------------
    ! hipsparseXcsric02_zeroPivot
    !---------------------------------------------
    !> \ingroup precond_module
    !> \details
    !> \p hipsparseXcsric02_zeroPivot returns \ref HIPSPARSE_STATUS_ZERO_PIVOT if either a
    !> structural or numerical zero has been found during \ref hipsparseScsric02_analysis
    !> "hipsparseXcsric02_analysis()" or \ref hipsparseScsric02 "hipsparseXcsric02()"
    !> computation. The first zero pivot \f$j\f$ at \f$A_{j,j}\f$ is stored in \p position,
    !> using the same index base as the CSR matrix.
    !>
    !> \p position can be in host or device memory. If no zero pivot has been found,
    !> \p position is set to -1 and \ref HIPSPARSE_STATUS_SUCCESS is returned instead.
    !>
    !> \note \p hipsparseXcsric02_zeroPivot is a blocking function. It might negatively influence
    !> performance.
    !>
    !> \deprecated
    !> This function is deprecated when using the CUDA backend (CUDA 12.0+) and will be
    !> removed in CUDA 13.0. This deprecation does not apply to the ROCm backend.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> info        structure that holds the information collected during the analysis step.
    !> @param[inout]
    !> position    pointer to zero pivot \f$j\f$, which can be in host or device memory.
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p info, or \p position is nullptr.
    !> \retval HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    !> \retval HIPSPARSE_STATUS_ZERO_PIVOT zero pivot has been found.
    function hipsparseXcsric02_zeroPivot(handle, info, position) &
       result(Xcsric02_zeroPivot) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseXcsric02_zeroPivot")
#else
       bind(C, name="hipsparseXcsric02_zeroPivot")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: info
       integer(c_int) :: position(*)
       integer(c_int) :: Xcsric02_zeroPivot
    end function hipsparseXcsric02_zeroPivot

    !---------------------------------------------
    ! hipsparseScsric02_bufferSize
    !---------------------------------------------
    !> \ingroup precond_module
    !> \details
    !> \p hipsparseXcsric02_bufferSize returns the size of the temporary storage buffer in bytes
    !> that is required by \ref hipsparseScsric02_analysis "hipsparseXcsric02_analysis()" and
    !> \ref hipsparseScsric02 "hipsparseXcsric02()". The temporary storage buffer must be allocated
    !> by the user.
    !>
    !> @param[in]
    !> handle             handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m                  number of rows of the sparse CSR matrix.
    !> @param[in]
    !> nnz                number of non-zero entries of the sparse CSR matrix.
    !> @param[in]
    !> descrA             descriptor of the sparse CSR matrix.
    !> @param[in]
    !> csrSortedValA      array of \p nnz elements of the sparse CSR matrix.
    !> @param[in]
    !> csrSortedRowPtrA   array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix.
    !> @param[in]
    !> csrSortedColIndA   array of \p nnz elements containing the column indices of the sparse
    !> CSR matrix.
    !> @param[out]
    !> info               structure that holds the information collected during the analysis step.
    !> @param[out]
    !> pBufferSizeInBytes number of bytes of the temporary storage buffer required by
    !> \ref hipsparseScsric02_analysis "hipsparseXcsric02_analysis()" and
    !> \ref hipsparseScsric02 "hipsparseXcsric02()".
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p nnz, \p descrA, \p csrSortedValA,
    !> \p csrSortedRowPtrA, \p csrSortedColIndA, \p info, or \p pBufferSizeInBytes pointer is
    !> invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    !> \retval     HIPSPARSE_STATUS_NOT_SUPPORTED
    !> \ref hipsparseMatrixType_t != \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseScsric02_bufferSize(handle, m, nnz, descrA, csrSortedValA, csrSortedRowPtrA, &
                                          csrSortedColIndA, info, pBufferSizeInBytes) &
       result(Scsric02_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseScsric02_bufferSize")
#else
       bind(C, name="hipsparseScsric02_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       real(c_float) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       integer(c_int) :: pBufferSizeInBytes(*)
       integer(c_int) :: Scsric02_bufferSize
    end function hipsparseScsric02_bufferSize

    !---------------------------------------------
    ! hipsparseDcsric02_bufferSize
    !---------------------------------------------
    function hipsparseDcsric02_bufferSize(handle, m, nnz, descrA, csrSortedValA, csrSortedRowPtrA, &
                                          csrSortedColIndA, info, pBufferSizeInBytes) &
       result(Dcsric02_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDcsric02_bufferSize")
#else
       bind(C, name="hipsparseDcsric02_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       real(c_double) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       integer(c_int) :: pBufferSizeInBytes(*)
       integer(c_int) :: Dcsric02_bufferSize
    end function hipsparseDcsric02_bufferSize

    !---------------------------------------------
    ! hipsparseCcsric02_bufferSize
    !---------------------------------------------
    function hipsparseCcsric02_bufferSize(handle, m, nnz, descrA, csrSortedValA, csrSortedRowPtrA, &
                                          csrSortedColIndA, info, pBufferSizeInBytes) &
       result(Ccsric02_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCcsric02_bufferSize")
#else
       bind(C, name="hipsparseCcsric02_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       integer(c_int) :: pBufferSizeInBytes(*)
       integer(c_int) :: Ccsric02_bufferSize
    end function hipsparseCcsric02_bufferSize

    !---------------------------------------------
    ! hipsparseZcsric02_bufferSize
    !---------------------------------------------
    function hipsparseZcsric02_bufferSize(handle, m, nnz, descrA, csrSortedValA, csrSortedRowPtrA, &
                                          csrSortedColIndA, info, pBufferSizeInBytes) &
       result(Zcsric02_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZcsric02_bufferSize")
#else
       bind(C, name="hipsparseZcsric02_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       integer(c_int) :: pBufferSizeInBytes(*)
       integer(c_int) :: Zcsric02_bufferSize
    end function hipsparseZcsric02_bufferSize

    !---------------------------------------------
    ! hipsparseScsric02_bufferSizeExt
    !---------------------------------------------
    !> \ingroup precond_module
    !> \details
    !> \p hipsparseXcsric02_bufferSizeExt returns the size of the temporary storage buffer
    !> in bytes that is required by \ref hipsparseScsric02_analysis "hipsparseXcsric02_analysis()"
    !> and \ref hipsparseScsric02 "hipsparseXcsric02()". The temporary storage buffer must be
    !> allocated by the user.
    !>
    !> @param[in]
    !> handle             handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m                  number of rows of the sparse CSR matrix.
    !> @param[in]
    !> nnz                number of non-zero entries of the sparse CSR matrix.
    !> @param[in]
    !> descrA             descriptor of the sparse CSR matrix.
    !> @param[in]
    !> csrSortedValA      array of \p nnz elements of the sparse CSR matrix.
    !> @param[in]
    !> csrSortedRowPtrA   array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix.
    !> @param[in]
    !> csrSortedColIndA   array of \p nnz elements containing the column indices of the sparse
    !> CSR matrix.
    !> @param[out]
    !> info               structure that holds the information collected during the analysis step.
    !> @param[out]
    !> pBufferSizeInBytes number of bytes of the temporary storage buffer required by
    !> \ref hipsparseScsric02_analysis "hipsparseXcsric02_analysis()" and
    !> \ref hipsparseScsric02 "hipsparseXcsric02()".
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p nnz, \p descrA, \p csrSortedValA,
    !> \p csrSortedRowPtrA, \p csrSortedColIndA, \p info, or \p pBufferSizeInBytes pointer is
    !> invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    !> \retval     HIPSPARSE_STATUS_NOT_SUPPORTED
    !> \ref hipsparseMatrixType_t != \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseScsric02_bufferSizeExt(handle, m, nnz, descrA, csrSortedValA, &
                                             csrSortedRowPtrA, csrSortedColIndA, info, &
                                             pBufferSizeInBytes) &
       result(Scsric02_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseScsric02_bufferSizeExt")
#else
       bind(C, name="hipsparseScsric02_bufferSizeExt")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       real(c_float) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Scsric02_bufferSizeExt
    end function hipsparseScsric02_bufferSizeExt

    !---------------------------------------------
    ! hipsparseDcsric02_bufferSizeExt
    !---------------------------------------------
    function hipsparseDcsric02_bufferSizeExt(handle, m, nnz, descrA, csrSortedValA, &
                                             csrSortedRowPtrA, csrSortedColIndA, info, &
                                             pBufferSizeInBytes) &
       result(Dcsric02_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDcsric02_bufferSizeExt")
#else
       bind(C, name="hipsparseDcsric02_bufferSizeExt")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       real(c_double) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Dcsric02_bufferSizeExt
    end function hipsparseDcsric02_bufferSizeExt

    !---------------------------------------------
    ! hipsparseCcsric02_bufferSizeExt
    !---------------------------------------------
    function hipsparseCcsric02_bufferSizeExt(handle, m, nnz, descrA, csrSortedValA, &
                                             csrSortedRowPtrA, csrSortedColIndA, info, &
                                             pBufferSizeInBytes) &
       result(Ccsric02_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCcsric02_bufferSizeExt")
#else
       bind(C, name="hipsparseCcsric02_bufferSizeExt")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Ccsric02_bufferSizeExt
    end function hipsparseCcsric02_bufferSizeExt

    !---------------------------------------------
    ! hipsparseZcsric02_bufferSizeExt
    !---------------------------------------------
    function hipsparseZcsric02_bufferSizeExt(handle, m, nnz, descrA, csrSortedValA, &
                                             csrSortedRowPtrA, csrSortedColIndA, info, &
                                             pBufferSizeInBytes) &
       result(Zcsric02_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZcsric02_bufferSizeExt")
#else
       bind(C, name="hipsparseZcsric02_bufferSizeExt")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Zcsric02_bufferSizeExt
    end function hipsparseZcsric02_bufferSizeExt

    !---------------------------------------------
    ! hipsparseScsric02_analysis
    !---------------------------------------------
    !> \ingroup precond_module
    !> \details
    !> \p hipsparseXcsric02_analysis performs the analysis step for \ref hipsparseScsric02
    !> "hipsparseXcsric02()".
    !>
    !> \note
    !> If the matrix sparsity pattern changes, the gathered information will become invalid.
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> @param[in]
    !> handle           handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m                number of rows of the sparse CSR matrix.
    !> @param[in]
    !> nnz              number of non-zero entries of the sparse CSR matrix.
    !> @param[in]
    !> descrA           descriptor of the sparse CSR matrix.
    !> @param[in]
    !> csrSortedValA    array of \p nnz elements of the sparse CSR matrix.
    !> @param[in]
    !> csrSortedRowPtrA array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix.
    !> @param[in]
    !> csrSortedColIndA array of \p nnz elements containing the column indices of the sparse
    !> CSR matrix.
    !> @param[out]
    !> info             structure that holds the information collected during
    !> the analysis step.
    !> @param[in]
    !> policy \ref HIPSPARSE_SOLVE_POLICY_NO_LEVEL or \ref HIPSPARSE_SOLVE_POLICY_USE_LEVEL.
    !> @param[in]
    !> pBuffer          temporary storage buffer allocated by the user.
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p nnz, \p descrA, \p csrSortedValA,
    !> \p csrSortedRowPtrA, \p csrSortedColIndA, \p info, or \p pBuffer pointer is invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    !> \retval     HIPSPARSE_STATUS_NOT_SUPPORTED
    !> \ref hipsparseMatrixType_t != \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseScsric02_analysis(handle, m, nnz, descrA, csrSortedValA, csrSortedRowPtrA, &
                                        csrSortedColIndA, info, policy, pBuffer) &
       result(Scsric02_analysis) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseScsric02_analysis")
#else
       bind(C, name="hipsparseScsric02_analysis")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       real(c_float) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Scsric02_analysis
    end function hipsparseScsric02_analysis

    !---------------------------------------------
    ! hipsparseDcsric02_analysis
    !---------------------------------------------
    function hipsparseDcsric02_analysis(handle, m, nnz, descrA, csrSortedValA, csrSortedRowPtrA, &
                                        csrSortedColIndA, info, policy, pBuffer) &
       result(Dcsric02_analysis) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDcsric02_analysis")
#else
       bind(C, name="hipsparseDcsric02_analysis")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       real(c_double) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Dcsric02_analysis
    end function hipsparseDcsric02_analysis

    !---------------------------------------------
    ! hipsparseCcsric02_analysis
    !---------------------------------------------
    function hipsparseCcsric02_analysis(handle, m, nnz, descrA, csrSortedValA, csrSortedRowPtrA, &
                                        csrSortedColIndA, info, policy, pBuffer) &
       result(Ccsric02_analysis) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCcsric02_analysis")
#else
       bind(C, name="hipsparseCcsric02_analysis")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Ccsric02_analysis
    end function hipsparseCcsric02_analysis

    !---------------------------------------------
    ! hipsparseZcsric02_analysis
    !---------------------------------------------
    function hipsparseZcsric02_analysis(handle, m, nnz, descrA, csrSortedValA, csrSortedRowPtrA, &
                                        csrSortedColIndA, info, policy, pBuffer) &
       result(Zcsric02_analysis) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZcsric02_analysis")
#else
       bind(C, name="hipsparseZcsric02_analysis")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Zcsric02_analysis
    end function hipsparseZcsric02_analysis

    !---------------------------------------------
    ! hipsparseScsric02
    !---------------------------------------------
    !> \ingroup precond_module
    !> \brief Incomplete Cholesky factorization with 0 fill-ins and no pivoting using the CSR
    !> storage format.
    !>
    !> \details
    !> \p hipsparseXcsric02 computes the incomplete Cholesky factorization with 0 fill-ins
    !> and no pivoting of a sparse \f$m \times m\f$ CSR matrix \f$A\f$, such that
    !> \f[
    !> A \approx LL^T
    !> \f]
    !> where the lower triangular matrix \f$L\f$ is computed using:
    !> \f[
    !> L_{ij} = \left\{
    !> \begin{array}{ll}
    !> \sqrt{A_{jj} - \sum_{k=0}^{j-1}(L_{jk})^{2}},   & \text{if i == j} \\
    !> \frac{1}{L_{jj}}(A_{jj} - \sum_{k=0}^{j-1}L_{ik} \times L_{jk}), & \text{if i > j}
    !> \end{array}
    !> \right.
    !> \f]
    !> for each entry found in the CSR matrix \f$A\f$.
    !>
    !> Computing the above incomplete Cholesky factorization requires three steps to complete.
    !> First,
    !> the user determines the size of the required temporary storage buffer by calling
    !> \ref hipsparseScsric02_bufferSize "hipsparseXcsric02_bufferSize()". After this buffer size
    !> has been determined,
    !> the user allocates the buffer and passes it to \ref hipsparseScsric02_analysis
    !> "hipsparseXcsric02_analysis()".
    !> This will perform analysis on the sparsity pattern of the matrix. Finally, the user calls \p
    !> hipsparseScsric02,
    !> \p hipsparseDcsric02, \p hipsparseCcsric02, or \p hipsparseZcsric02 to perform the actual
    !> factorization. The calculation
    !> of the buffer size and the analysis of the sparse matrix only need to be performed once for a
    !> given sparsity pattern,
    !> while the factorization can be repeatedly applied to multiple matrices having the same
    !> sparsity pattern. After all calls
    !> to \ref hipsparseScsric02 "hipsparseXcsric02()" are complete, the temporary buffer can be
    !> deallocated.
    !>
    !> When computing the Cholesky factorization, it is possible that \f$L_{jj} == 0\f$, which would
    !> result in a division by zero.
    !> This could occur from either \f$A_{jj}\f$ not existing in the sparse CSR matrix (referred to
    !> as a structural zero) or because
    !> \f$A_{jj} - \sum_{k=0}^{j-1}(L_{jk})^{2} == 0\f$ (referred to as a numerical zero). For
    !> example, running the Cholesky
    !> factorization on the following matrix:
    !> \f[
    !> \begin{bmatrix}
    !> 2 & 1 & 0 \\
    !> 1 & 2 & 1 \\
    !> 0 & 1 & 2
    !> \end{bmatrix}
    !> \f]
    !> results in a successful Cholesky factorization, however running with the matrix:
    !> \f[
    !> \begin{bmatrix}
    !> 2 & 1 & 0 \\
    !> 1 & 1/2 & 1 \\
    !> 0 & 1 & 2
    !> \end{bmatrix}
    !> \f]
    !> results in a numerical zero because:
    !> \f[
    !> \begin{array}{ll}
    !> L_{00} &= \sqrt{2} \\
    !> L_{10} &= \frac{1}{\sqrt{2}} \\
    !> L_{11} &= \sqrt{\frac{1}{2} - (\frac{1}{\sqrt{2}})^2}
    !> &= 0
    !> \end{array}
    !> \f]
    !> The user can detect the presence of a structural zero by calling \ref
    !> hipsparseXcsric02_zeroPivot() after
    !> \ref hipsparseScsric02_analysis "hipsparseXcsric02_analysis()" and/or the presence of a
    !> structural or
    !> numerical zero by calling \ref hipsparseXcsric02_zeroPivot() after \ref hipsparseScsric02
    !> "hipsparseXcsric02()":
    !> \code{.c}
    !> hipsparseDcsric02(handle,
    !> m,
    !> nnz,
    !> descrM,
    !> csrVal,
    !> csrRowPtr,
    !> csrColInd,
    !> info,
    !> HIPSPARSE_SOLVE_POLICY_USE_LEVEL,
    !> buffer);
    !>
    !> // Check for zero pivot
    !> if(CUSPARSE_STATUS_ZERO_PIVOT == hipsparseXcsric02_zeroPivot(handle, info, &position))
    !> {
    !> printf("L has structural and/or numerical zero at L(%d,%d)\n", position, position);
    !> }
    !> \endcode
    !> In both cases, \ref hipsparseXcsric02_zeroPivot() will report the first zero pivot (either
    !> numerical or structural)
    !> found. See the full example below. The user can also set the diagonal type to be \f$1\f$
    !> using \ref hipsparseSetMatDiagType(),
    !> which will interpret the matrix \f$A\f$ as having ones on its diagonal (even if no non-zero
    !> exists in the sparsity pattern).
    !>
    !> \p hipsparseXcsric02 computes the Cholesky factorization inplace meaning that the values
    !> array \p csrSortedValA_valM of the \f$A\f$
    !> matrix is overwritten with the \f$L\f$ matrix stored in the lower triangular part of \f$A\f$:
    !>
    !> \f[
    !> \begin{align}
    !> \begin{bmatrix}
    !> a_{00} & a_{01} & a_{02} \\
    !> a_{10} & a_{11} & a_{12} \\
    !> a_{20} & a_{21} & a_{22}
    !> \end{bmatrix}
    !> \rightarrow
    !> \begin{bmatrix}
    !> l_{00} & a_{01} & a_{02} \\
    !> l_{10} & l_{11} & a_{12} \\
    !> l_{20} & l_{21} & l_{22}
    !> \end{bmatrix}
    !> \end{align}
    !> \f]
    !> The row pointer array \p csrSortedRowPtrA and the column indices array \p csrSortedColIndA
    !> remain the same for \f$A\f$ and the
    !> output as the incomplete factorization does not generate new non-zeros in the output which do
    !> not already exist in \f$A\f$.
    !>
    !> The performance of computing Cholesky factorization with hipSPARSE greatly depends on the
    !> sparsity pattern
    !> the the matrix \f$A\f$, because this is what determines the amount of parallelism available.
    !>
    !> \note
    !> The sparse CSR matrix has to be sorted. This can be achieved by calling
    !> \ref hipsparseXcsrsort().
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> @param[in]
    !> handle             handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m                  number of rows of the sparse CSR matrix.
    !> @param[in]
    !> nnz                number of non-zero entries of the sparse CSR matrix.
    !> @param[in]
    !> descrA             descriptor of the sparse CSR matrix.
    !> @param[inout]
    !> csrSortedValA_valM array of \p nnz elements of the sparse CSR matrix.
    !> @param[in]
    !> csrSortedRowPtrA   array of \p m+1 elements that point to the start
    !> of every row of the sparse CSR matrix.
    !> @param[in]
    !> csrSortedColIndA   array of \p nnz elements containing the column indices of the sparse
    !> CSR matrix.
    !> @param[in]
    !> info               structure that holds the information collected during the analysis step.
    !> @param[in]
    !> policy \ref HIPSPARSE_SOLVE_POLICY_NO_LEVEL or \ref HIPSPARSE_SOLVE_POLICY_USE_LEVEL.
    !> @param[in]
    !> pBuffer            temporary storage buffer allocated by the user.
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p nnz, \p descrA, \p
    !> csrSortedValA_valM,
    !> \p csrSortedRowPtrA, or \p csrSortedColIndA pointer is invalid.
    !> \retval     HIPSPARSE_STATUS_ARCH_MISMATCH the device is not supported.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    !> \retval     HIPSPARSE_STATUS_NOT_SUPPORTED
    !> \ref hipsparseMatrixType_t != \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseScsric02(handle, m, nnz, descrA, csrSortedValA_valM, csrSortedRowPtrA, &
                               csrSortedColIndA, info, policy, pBuffer) &
       result(Scsric02) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseScsric02")
#else
       bind(C, name="hipsparseScsric02")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       real(c_float) :: csrSortedValA_valM(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Scsric02
    end function hipsparseScsric02

    !---------------------------------------------
    ! hipsparseDcsric02
    !---------------------------------------------
    function hipsparseDcsric02(handle, m, nnz, descrA, csrSortedValA_valM, csrSortedRowPtrA, &
                               csrSortedColIndA, info, policy, pBuffer) &
       result(Dcsric02) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDcsric02")
#else
       bind(C, name="hipsparseDcsric02")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       real(c_double) :: csrSortedValA_valM(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Dcsric02
    end function hipsparseDcsric02

    !---------------------------------------------
    ! hipsparseCcsric02
    !---------------------------------------------
    function hipsparseCcsric02(handle, m, nnz, descrA, csrSortedValA_valM, csrSortedRowPtrA, &
                               csrSortedColIndA, info, policy, pBuffer) &
       result(Ccsric02) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCcsric02")
#else
       bind(C, name="hipsparseCcsric02")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrSortedValA_valM
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Ccsric02
    end function hipsparseCcsric02

    !---------------------------------------------
    ! hipsparseZcsric02
    !---------------------------------------------
    function hipsparseZcsric02(handle, m, nnz, descrA, csrSortedValA_valM, csrSortedRowPtrA, &
                               csrSortedColIndA, info, policy, pBuffer) &
       result(Zcsric02) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZcsric02")
#else
       bind(C, name="hipsparseZcsric02")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrSortedValA_valM
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Zcsric02
    end function hipsparseZcsric02

    !---------------------------------------------
    ! hipsparseXcsrilu02_zeroPivot
    !---------------------------------------------
    !> \ingroup precond_module
    !> \details
    !> \p hipsparseXcsrilu02_zeroPivot returns \ref HIPSPARSE_STATUS_ZERO_PIVOT if either a
    !> structural or numerical zero has been found during \ref hipsparseScsrilu02
    !> "hipsparseXcsrilu02()"
    !> computation. The first zero pivot \f$j\f$ at \f$A_{j,j}\f$ is stored in \p position, using
    !> the same
    !> index base as the CSR matrix.
    !>
    !> \p position can be in host or device memory. If no zero pivot has been found,
    !> \p position is set to -1 and \ref HIPSPARSE_STATUS_SUCCESS is returned instead.
    !>
    !> \note \p hipsparseXcsrilu02_zeroPivot is a blocking function. It might negatively influence
    !> performance.
    !>
    !> \deprecated
    !> This function is deprecated when using the CUDA backend (CUDA 12.0+) and will be
    !> removed in CUDA 13.0. This deprecation does not apply to the ROCm backend.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> info        structure that holds the information collected during the analysis step.
    !> @param[inout]
    !> position    pointer to zero pivot \f$j\f$, which can be in host or device memory.
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p info, or \p position is nullptr.
    !> \retval HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    !> \retval HIPSPARSE_STATUS_ZERO_PIVOT zero pivot has been found.
    function hipsparseXcsrilu02_zeroPivot(handle, info, position) &
       result(Xcsrilu02_zeroPivot) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseXcsrilu02_zeroPivot")
#else
       bind(C, name="hipsparseXcsrilu02_zeroPivot")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: info
       integer(c_int) :: position(*)
       integer(c_int) :: Xcsrilu02_zeroPivot
    end function hipsparseXcsrilu02_zeroPivot

    !---------------------------------------------
    ! hipsparseScsrilu02_numericBoost
    !---------------------------------------------
    !> \ingroup precond_module
    !> \details
    !> \p hipsparseXcsrilu02_numericBoost enables the user to replace a numerical value in
    !> an incomplete LU factorization. \p tol is used to determine whether a numerical value
    !> is replaced by \p boost_val, such that \f$A_{j,j} = \text{boost_val}\f$ if
    !> \f$\text{tol} \ge \left|A_{j,j}\right|\f$.
    !>
    !> \note The boost value is enabled by setting \p enable_boost to 1 or disabled by
    !> setting \p enable_boost to 0.
    !>
    !> \note \p tol and \p boost_val can be in host or device memory.
    !>
    !> \deprecated
    !> This function is deprecated when using the CUDA backend (CUDA 12.0+) and will be
    !> removed in CUDA 13.0. This deprecation does not apply to the ROCm backend.
    !>
    !> @param[in]
    !> handle          handle to the hipSPARSE library context queue.
    !> @param[in]
    !> info            structure that holds the information collected during the analysis step.
    !> @param[in]
    !> enable_boost    enable/disable numeric boost.
    !> @param[in]
    !> tol             tolerance to determine whether a numerical value is replaced or not.
    !> @param[in]
    !> boost_val       boost value to replace a numerical value.
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p info, \p tol, or \p boost_val is
    !> nullptr.
    !> \retval HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    function hipsparseScsrilu02_numericBoost(handle, info, enable_boost, tol, boost_val) &
       result(Scsrilu02_numericBoost) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseScsrilu02_numericBoost")
#else
       bind(C, name="hipsparseScsrilu02_numericBoost")
#endif
       import :: c_ptr, c_int, c_double, c_float
       type(c_ptr), value :: handle
       type(c_ptr), value :: info
       integer(c_int), value :: enable_boost
       real(c_double) :: tol(*)
       real(c_float) :: boost_val(*)
       integer(c_int) :: Scsrilu02_numericBoost
    end function hipsparseScsrilu02_numericBoost

    !---------------------------------------------
    ! hipsparseDcsrilu02_numericBoost
    !---------------------------------------------
    function hipsparseDcsrilu02_numericBoost(handle, info, enable_boost, tol, boost_val) &
       result(Dcsrilu02_numericBoost) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDcsrilu02_numericBoost")
#else
       bind(C, name="hipsparseDcsrilu02_numericBoost")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       type(c_ptr), value :: info
       integer(c_int), value :: enable_boost
       real(c_double) :: tol(*)
       real(c_double) :: boost_val(*)
       integer(c_int) :: Dcsrilu02_numericBoost
    end function hipsparseDcsrilu02_numericBoost

    !---------------------------------------------
    ! hipsparseCcsrilu02_numericBoost
    !---------------------------------------------
    function hipsparseCcsrilu02_numericBoost(handle, info, enable_boost, tol, boost_val) &
       result(Ccsrilu02_numericBoost) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCcsrilu02_numericBoost")
#else
       bind(C, name="hipsparseCcsrilu02_numericBoost")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       type(c_ptr), value :: info
       integer(c_int), value :: enable_boost
       real(c_double) :: tol(*)
       type(c_ptr), value :: boost_val
       integer(c_int) :: Ccsrilu02_numericBoost
    end function hipsparseCcsrilu02_numericBoost

    !---------------------------------------------
    ! hipsparseZcsrilu02_numericBoost
    !---------------------------------------------
    function hipsparseZcsrilu02_numericBoost(handle, info, enable_boost, tol, boost_val) &
       result(Zcsrilu02_numericBoost) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZcsrilu02_numericBoost")
#else
       bind(C, name="hipsparseZcsrilu02_numericBoost")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       type(c_ptr), value :: info
       integer(c_int), value :: enable_boost
       real(c_double) :: tol(*)
       type(c_ptr), value :: boost_val
       integer(c_int) :: Zcsrilu02_numericBoost
    end function hipsparseZcsrilu02_numericBoost

    !---------------------------------------------
    ! hipsparseScsrilu02_bufferSize
    !---------------------------------------------
    !> \ingroup precond_module
    !> \details
    !> \p hipsparseXcsrilu02_bufferSize returns the size of the temporary storage buffer
    !> in bytes that is required by \ref hipsparseScsrilu02_analysis "hipsparseXcsrilu02_analysis()"
    !> and \ref hipsparseScsrilu02 "hipsparseXcsrilu02()". The temporary storage buffer
    !> must be allocated by the user.
    !>
    !> @param[in]
    !> handle             handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m                  number of rows of the sparse CSR matrix.
    !> @param[in]
    !> nnz                number of non-zero entries of the sparse CSR matrix.
    !> @param[in]
    !> descrA             descriptor of the sparse CSR matrix.
    !> @param[in]
    !> csrSortedValA      array of \p nnz elements of the sparse CSR matrix.
    !> @param[in]
    !> csrSortedRowPtrA   array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix.
    !> @param[in]
    !> csrSortedColIndA   array of \p nnz elements containing the column indices of the sparse
    !> CSR matrix.
    !> @param[out]
    !> info               structure that holds the information collected during the analysis step.
    !> @param[out]
    !> pBufferSizeInBytes number of bytes of the temporary storage buffer required by
    !> \ref hipsparseScsrilu02_analysis "hipsparseXcsrilu02_analysis()" and
    !> \ref hipsparseScsrilu02 "hipsparseXcsrilu02()".
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p nnz, \p descrA, \p csrSortedValA,
    !> \p csrSortedRowPtrA, \p csrSortedColIndA, \p info, or \p pBufferSizeInBytes pointer
    !> is invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    function hipsparseScsrilu02_bufferSize(handle, m, nnz, descrA, csrSortedValA, &
                                           csrSortedRowPtrA, csrSortedColIndA, info, &
                                           pBufferSizeInBytes) &
       result(Scsrilu02_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseScsrilu02_bufferSize")
#else
       bind(C, name="hipsparseScsrilu02_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       real(c_float) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       integer(c_int) :: pBufferSizeInBytes(*)
       integer(c_int) :: Scsrilu02_bufferSize
    end function hipsparseScsrilu02_bufferSize

    !---------------------------------------------
    ! hipsparseDcsrilu02_bufferSize
    !---------------------------------------------
    function hipsparseDcsrilu02_bufferSize(handle, m, nnz, descrA, csrSortedValA, &
                                           csrSortedRowPtrA, csrSortedColIndA, info, &
                                           pBufferSizeInBytes) &
       result(Dcsrilu02_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDcsrilu02_bufferSize")
#else
       bind(C, name="hipsparseDcsrilu02_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       real(c_double) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       integer(c_int) :: pBufferSizeInBytes(*)
       integer(c_int) :: Dcsrilu02_bufferSize
    end function hipsparseDcsrilu02_bufferSize

    !---------------------------------------------
    ! hipsparseCcsrilu02_bufferSize
    !---------------------------------------------
    function hipsparseCcsrilu02_bufferSize(handle, m, nnz, descrA, csrSortedValA, &
                                           csrSortedRowPtrA, csrSortedColIndA, info, &
                                           pBufferSizeInBytes) &
       result(Ccsrilu02_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCcsrilu02_bufferSize")
#else
       bind(C, name="hipsparseCcsrilu02_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       integer(c_int) :: pBufferSizeInBytes(*)
       integer(c_int) :: Ccsrilu02_bufferSize
    end function hipsparseCcsrilu02_bufferSize

    !---------------------------------------------
    ! hipsparseZcsrilu02_bufferSize
    !---------------------------------------------
    function hipsparseZcsrilu02_bufferSize(handle, m, nnz, descrA, csrSortedValA, &
                                           csrSortedRowPtrA, csrSortedColIndA, info, &
                                           pBufferSizeInBytes) &
       result(Zcsrilu02_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZcsrilu02_bufferSize")
#else
       bind(C, name="hipsparseZcsrilu02_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       integer(c_int) :: pBufferSizeInBytes(*)
       integer(c_int) :: Zcsrilu02_bufferSize
    end function hipsparseZcsrilu02_bufferSize

    !---------------------------------------------
    ! hipsparseScsrilu02_bufferSizeExt
    !---------------------------------------------
    !> \ingroup precond_module
    !> \details
    !> \p hipsparseXcsrilu02_bufferSizeExt returns the size of the temporary storage buffer
    !> in bytes that is required by \ref hipsparseScsrilu02_analysis "hipsparseXcsrilu02_analysis()"
    !> and \ref hipsparseScsrilu02 "hipsparseXcsrilu02()". The temporary storage buffer
    !> must be allocated by the user.
    !>
    !> @param[in]
    !> handle             handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m                  number of rows of the sparse CSR matrix.
    !> @param[in]
    !> nnz                number of non-zero entries of the sparse CSR matrix.
    !> @param[in]
    !> descrA             descriptor of the sparse CSR matrix.
    !> @param[in]
    !> csrSortedValA      array of \p nnz elements of the sparse CSR matrix.
    !> @param[in]
    !> csrSortedRowPtrA   array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix.
    !> @param[in]
    !> csrSortedColIndA   array of \p nnz elements containing the column indices of the sparse
    !> CSR matrix.
    !> @param[out]
    !> info               structure that holds the information collected during the analysis step.
    !> @param[out]
    !> pBufferSizeInBytes number of bytes of the temporary storage buffer required by
    !> \ref hipsparseScsrilu02_analysis "hipsparseXcsrilu02_analysis()" and
    !> \ref hipsparseScsrilu02 "hipsparseXcsrilu02()".
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p nnz, \p descrA, \p csrSortedValA,
    !> \p csrSortedRowPtrA, \p csrSortedColIndA, \p info, or \p pBufferSizeInBytes pointer
    !> is invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    function hipsparseScsrilu02_bufferSizeExt(handle, m, nnz, descrA, csrSortedValA, &
                                              csrSortedRowPtrA, csrSortedColIndA, info, &
                                              pBufferSizeInBytes) &
       result(Scsrilu02_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseScsrilu02_bufferSizeExt")
#else
       bind(C, name="hipsparseScsrilu02_bufferSizeExt")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       real(c_float) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Scsrilu02_bufferSizeExt
    end function hipsparseScsrilu02_bufferSizeExt

    !---------------------------------------------
    ! hipsparseDcsrilu02_bufferSizeExt
    !---------------------------------------------
    function hipsparseDcsrilu02_bufferSizeExt(handle, m, nnz, descrA, csrSortedValA, &
                                              csrSortedRowPtrA, csrSortedColIndA, info, &
                                              pBufferSizeInBytes) &
       result(Dcsrilu02_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDcsrilu02_bufferSizeExt")
#else
       bind(C, name="hipsparseDcsrilu02_bufferSizeExt")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       real(c_double) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Dcsrilu02_bufferSizeExt
    end function hipsparseDcsrilu02_bufferSizeExt

    !---------------------------------------------
    ! hipsparseCcsrilu02_bufferSizeExt
    !---------------------------------------------
    function hipsparseCcsrilu02_bufferSizeExt(handle, m, nnz, descrA, csrSortedValA, &
                                              csrSortedRowPtrA, csrSortedColIndA, info, &
                                              pBufferSizeInBytes) &
       result(Ccsrilu02_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCcsrilu02_bufferSizeExt")
#else
       bind(C, name="hipsparseCcsrilu02_bufferSizeExt")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Ccsrilu02_bufferSizeExt
    end function hipsparseCcsrilu02_bufferSizeExt

    !---------------------------------------------
    ! hipsparseZcsrilu02_bufferSizeExt
    !---------------------------------------------
    function hipsparseZcsrilu02_bufferSizeExt(handle, m, nnz, descrA, csrSortedValA, &
                                              csrSortedRowPtrA, csrSortedColIndA, info, &
                                              pBufferSizeInBytes) &
       result(Zcsrilu02_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZcsrilu02_bufferSizeExt")
#else
       bind(C, name="hipsparseZcsrilu02_bufferSizeExt")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Zcsrilu02_bufferSizeExt
    end function hipsparseZcsrilu02_bufferSizeExt

    !---------------------------------------------
    ! hipsparseScsrilu02_analysis
    !---------------------------------------------
    !> \ingroup precond_module
    !> \details
    !> \p hipsparseXcsrilu02_analysis performs the analysis step for \ref hipsparseScsrilu02
    !> "hipsparseXcsrilu02()". It is expected that this function will be executed only once for
    !> a given matrix and particular operation type.
    !>
    !> \note
    !> If the matrix sparsity pattern changes, the gathered information will become invalid.
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> @param[in]
    !> handle           handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m                number of rows of the sparse CSR matrix.
    !> @param[in]
    !> nnz              number of non-zero entries of the sparse CSR matrix.
    !> @param[in]
    !> descrA           descriptor of the sparse CSR matrix.
    !> @param[in]
    !> csrSortedValA    array of \p nnz elements of the sparse CSR matrix.
    !> @param[in]
    !> csrSortedRowPtrA array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix.
    !> @param[in]
    !> csrSortedColIndA array of \p nnz elements containing the column indices of the sparse
    !> CSR matrix.
    !> @param[out]
    !> info             structure that holds the information collected during
    !> the analysis step.
    !> @param[in]
    !> policy \ref HIPSPARSE_SOLVE_POLICY_NO_LEVEL or \ref HIPSPARSE_SOLVE_POLICY_USE_LEVEL.
    !> @param[in]
    !> pBuffer          temporary storage buffer allocated by the user.
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p nnz, \p descrA, \p csrSortedValA,
    !> \p csrSortedRowPtrA, \p csrSortedColIndA, \p info, or \p pBuffer pointer is invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    function hipsparseScsrilu02_analysis(handle, m, nnz, descrA, csrSortedValA, csrSortedRowPtrA, &
                                         csrSortedColIndA, info, policy, pBuffer) &
       result(Scsrilu02_analysis) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseScsrilu02_analysis")
#else
       bind(C, name="hipsparseScsrilu02_analysis")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       real(c_float) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Scsrilu02_analysis
    end function hipsparseScsrilu02_analysis

    !---------------------------------------------
    ! hipsparseDcsrilu02_analysis
    !---------------------------------------------
    function hipsparseDcsrilu02_analysis(handle, m, nnz, descrA, csrSortedValA, csrSortedRowPtrA, &
                                         csrSortedColIndA, info, policy, pBuffer) &
       result(Dcsrilu02_analysis) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDcsrilu02_analysis")
#else
       bind(C, name="hipsparseDcsrilu02_analysis")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       real(c_double) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Dcsrilu02_analysis
    end function hipsparseDcsrilu02_analysis

    !---------------------------------------------
    ! hipsparseCcsrilu02_analysis
    !---------------------------------------------
    function hipsparseCcsrilu02_analysis(handle, m, nnz, descrA, csrSortedValA, csrSortedRowPtrA, &
                                         csrSortedColIndA, info, policy, pBuffer) &
       result(Ccsrilu02_analysis) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCcsrilu02_analysis")
#else
       bind(C, name="hipsparseCcsrilu02_analysis")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Ccsrilu02_analysis
    end function hipsparseCcsrilu02_analysis

    !---------------------------------------------
    ! hipsparseZcsrilu02_analysis
    !---------------------------------------------
    function hipsparseZcsrilu02_analysis(handle, m, nnz, descrA, csrSortedValA, csrSortedRowPtrA, &
                                         csrSortedColIndA, info, policy, pBuffer) &
       result(Zcsrilu02_analysis) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZcsrilu02_analysis")
#else
       bind(C, name="hipsparseZcsrilu02_analysis")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Zcsrilu02_analysis
    end function hipsparseZcsrilu02_analysis

    !---------------------------------------------
    ! hipsparseScsrilu02
    !---------------------------------------------
    !> \ingroup precond_module
    !> \brief Incomplete LU factorization with 0 fill-ins and no pivoting using the CSR
    !> storage format.
    !>
    !> \details
    !> \p hipsparseXcsrilu02 computes the incomplete LU factorization with 0 fill-ins and no
    !> pivoting of a sparse \f$m \times m\f$ CSR matrix \f$A\f$, such that
    !> \f[
    !> A \approx LU
    !> \f]
    !> where the lower triangular matrix \f$L\f$ and the upper triangular matrix \f$U\f$ are
    !> computed using:
    !> \f[
    !> \begin{array}{ll}
    !> L_{ij} = \frac{1}{U_{jj}}(A_{ij} - \sum_{k=0}^{j-1}L_{ik} \times U_{kj}), & \text{if i > j}
    !> \\
    !> U_{ij} = (A_{ij} - \sum_{k=0}^{j-1}L_{ik} \times U_{kj}), & \text{if i <= j}
    !> \end{array}
    !> \f]
    !> for each entry found in the CSR matrix \f$A\f$.
    !>
    !> Computing the above incomplete \f$LU\f$ factorization requires three steps to complete.
    !> First,
    !> the user determines the size of the required temporary storage buffer by calling
    !> \ref hipsparseScsrilu02_bufferSize "hipsparseXcsrilu02_bufferSize()". After this buffer size
    !> has been determined,
    !> the user allocates the buffer and passes it to \ref hipsparseScsrilu02_analysis
    !> "hipsparseXcsrilu02_analysis()".
    !> This will perform analysis on the sparsity pattern of the matrix. Finally, the user calls \p
    !> hipsparseScsrilu02,
    !> \p hipsparseDcsrilu02, \p hipsparseCcsrilu02, or \p hipsparseZcsrilu02 to perform the actual
    !> factorization. The calculation
    !> of the buffer size and the analysis of the sparse matrix only need to be performed once for a
    !> given sparsity pattern,
    !> while the factorization can be repeatedly applied to multiple matrices having the same
    !> sparsity pattern. After all calls
    !> to \ref hipsparseScsrilu02 "hipsparseXcsrilu02()" are complete, the temporary buffer can be
    !> deallocated.
    !>
    !> When computing the \f$LU\f$ factorization, it is possible that \f$U_{jj} == 0\f$ which would
    !> result in a division by zero.
    !> This could occur from either \f$A_{jj}\f$ not existing in the sparse CSR matrix (referred to
    !> as a structural zero) or because
    !> \f$A_{ij} - \sum_{k=0}^{j-1}L_{ik} \times U_{kj} == 0\f$ (referred to as a numerical zero).
    !> For example, running the
    !> \f$LU\f$ factorization on the following matrix:
    !> \f[
    !> \begin{bmatrix}
    !> 2 & 1 & 0 \\
    !> 1 & 2 & 1 \\
    !> 0 & 1 & 2
    !> \end{bmatrix}
    !> \f]
    !> results in a successful \f$LU\f$ factorization. However, running with the matrix:
    !> \f[
    !> \begin{bmatrix}
    !> 2 & 1 & 0 \\
    !> 1 & 1/2 & 1 \\
    !> 0 & 1 & 2
    !> \end{bmatrix}
    !> \f]
    !> results in a numerical zero because:
    !> \f[
    !> \begin{array}{ll}
    !> U_{00} &= 2 \\
    !> U_{01} &= 1 \\
    !> L_{10} &= \frac{1}{2} \\
    !> U_{11} &= \frac{1}{2} - \frac{1}{2}
    !> &= 0
    !> \end{array}
    !> \f]
    !> The user can detect the presence of a structural zero by calling \ref
    !> hipsparseXcsrilu02_zeroPivot() after
    !> \ref hipsparseScsrilu02_analysis "hipsparseXcsrilu02_analysis()" and/or the presence of a
    !> structural or
    !> numerical zero by calling \ref hipsparseXcsrilu02_zeroPivot() after \ref hipsparseScsrilu02
    !> "hipsparseXcsrilu02()".
    !> In both cases, \ref hipsparseXcsrilu02_zeroPivot() will report the first zero pivot (either
    !> numerical or structural)
    !> found. See the example below. The user can also set the diagonal type to be \f$1\f$ using
    !> \ref hipsparseSetMatDiagType(),
    !> which will interpret the matrix \f$A\f$ as having ones on its diagonal (even if no nonzero
    !> exists in the sparsity pattern).
    !>
    !> \p hipsparseXcsrilu02 computes the \f$LU\f$ factorization inplace, meaning that the values
    !> array \p csrSortedValA_valM of the \f$A\f$
    !> matrix is overwritten with the \f$L\f$ matrix stored in the strictly lower triangular part of
    !> \f$A\f$ and the \f$U\f$ matrix
    !> stored in the upper part of \f$A\f$:
    !>
    !> \f[
    !> \begin{align}
    !> \begin{bmatrix}
    !> a_{00} & a_{01} & a_{02} \\
    !> a_{10} & a_{11} & a_{12} \\
    !> a_{20} & a_{21} & a_{22}
    !> \end{bmatrix}
    !> \rightarrow
    !> \begin{bmatrix}
    !> u_{00} & u_{01} & u_{02} \\
    !> l_{10} & u_{11} & u_{12} \\
    !> l_{20} & l_{21} & u_{22}
    !> \end{bmatrix}
    !> \end{align}
    !> \f]
    !> The row pointer array \p csrSortedRowPtrA and the column indices array \p csrSortedColIndA
    !> remain the same for \f$A\f$ and \f$LU\f$ as
    !> the incomplete factorization does not generate new non-zeros in \f$LU\f$ which do not already
    !> exist in \f$A\f$.
    !>
    !> The performance of computing \f$LU\f$ factorization with hipSPARSE greatly depends on the
    !> sparsity pattern
    !> of the matrix \f$A\f$, because this is what determines the amount of parallelism available.
    !>
    !> \note
    !> The sparse CSR matrix has to be sorted. This can be achieved by calling
    !> \ref hipsparseXcsrsort().
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> @param[in]
    !> handle             handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m                  number of rows of the sparse CSR matrix.
    !> @param[in]
    !> nnz                number of non-zero entries of the sparse CSR matrix.
    !> @param[in]
    !> descrA             descriptor of the sparse CSR matrix.
    !> @param[inout]
    !> csrSortedValA_valM array of \p nnz elements of the sparse CSR matrix.
    !> @param[in]
    !> csrSortedRowPtrA   array of \p m+1 elements that point to the start
    !> of every row of the sparse CSR matrix.
    !> @param[in]
    !> csrSortedColIndA   array of \p nnz elements containing the column indices of the sparse
    !> CSR matrix.
    !> @param[in]
    !> info               structure that holds the information collected during the analysis step.
    !> @param[in]
    !> policy \ref HIPSPARSE_SOLVE_POLICY_NO_LEVEL or \ref HIPSPARSE_SOLVE_POLICY_USE_LEVEL.
    !> @param[in]
    !> pBuffer            temporary storage buffer allocated by the user.
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p nnz, \p descrA, \p
    !> csrSortedValA_valM,
    !> \p csrSortedRowPtrA, or \p csrSortedColIndA pointer is invalid.
    !> \retval     HIPSPARSE_STATUS_ARCH_MISMATCH the device is not supported.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    function hipsparseScsrilu02(handle, m, nnz, descrA, csrSortedValA_valM, csrSortedRowPtrA, &
                                csrSortedColIndA, info, policy, pBuffer) &
       result(Scsrilu02) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseScsrilu02")
#else
       bind(C, name="hipsparseScsrilu02")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       real(c_float) :: csrSortedValA_valM(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Scsrilu02
    end function hipsparseScsrilu02

    !---------------------------------------------
    ! hipsparseDcsrilu02
    !---------------------------------------------
    function hipsparseDcsrilu02(handle, m, nnz, descrA, csrSortedValA_valM, csrSortedRowPtrA, &
                                csrSortedColIndA, info, policy, pBuffer) &
       result(Dcsrilu02) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDcsrilu02")
#else
       bind(C, name="hipsparseDcsrilu02")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       real(c_double) :: csrSortedValA_valM(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Dcsrilu02
    end function hipsparseDcsrilu02

    !---------------------------------------------
    ! hipsparseCcsrilu02
    !---------------------------------------------
    function hipsparseCcsrilu02(handle, m, nnz, descrA, csrSortedValA_valM, csrSortedRowPtrA, &
                                csrSortedColIndA, info, policy, pBuffer) &
       result(Ccsrilu02) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCcsrilu02")
#else
       bind(C, name="hipsparseCcsrilu02")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrSortedValA_valM
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Ccsrilu02
    end function hipsparseCcsrilu02

    !---------------------------------------------
    ! hipsparseZcsrilu02
    !---------------------------------------------
    function hipsparseZcsrilu02(handle, m, nnz, descrA, csrSortedValA_valM, csrSortedRowPtrA, &
                                csrSortedColIndA, info, policy, pBuffer) &
       result(Zcsrilu02) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZcsrilu02")
#else
       bind(C, name="hipsparseZcsrilu02")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrSortedValA_valM
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: info
       integer(c_int), value :: policy
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Zcsrilu02
    end function hipsparseZcsrilu02

    !---------------------------------------------
    ! hipsparseSgpsvInterleavedBatch_bufferSizeExt
    !---------------------------------------------
    !> \ingroup precond_module
    !> \details
    !> \p hipsparseXgpsvInterleavedBatch_bufferSizeExt returns the size of the temporary storage
    !> buffer in bytes that is required by \ref hipsparseSgpsvInterleavedBatch
    !> "hipsparseXgpsvInterleavedBatch()".
    !> The temporary storage buffer must be allocated by the user.
    !>
    !> @param[in]
    !> handle             handle to the hipSPARSE library context queue.
    !> @param[in]
    !> algo               algorithm to solve the linear system.
    !> @param[in]
    !> m                  size of the pentadiagonal linear system.
    !> @param[in]
    !> ds lower diagonal (distance 2) of the pentadiagonal system. The first two entries
    !> must be zero.
    !> @param[in]
    !> dl                 lower diagonal of the pentadiagonal system. The first entry must be zero.
    !> @param[in]
    !> d                  main diagonal of the pentadiagonal system.
    !> @param[in]
    !> du                 upper diagonal of the pentadiagonal system. The last entry must be zero.
    !> @param[in]
    !> dw upper diagonal (distance 2) of the pentadiagonal system. The last two entries
    !> must be zero.
    !> @param[in]
    !> x                  Dense array of right-hand sides with dimension \p batchCount by \p m.
    !> @param[in]
    !> batchCount         The number of systems to solve.
    !> @param[out]
    !> pBufferSizeInBytes Number of bytes of the temporary storage buffer required.
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p alg, \p batchCount, \p ds, \p dl,
    !> \p d, \p du, \p dw, \p x, or \p pBufferSizeInBytes pointer is invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    function hipsparseSgpsvInterleavedBatch_bufferSizeExt(handle, algo, m, ds, dl, d, du, dw, x, &
                                                          batchCount, pBufferSizeInBytes) &
       result(SgpsvInterleavedBatch_bufferSizeExt) &
       bind(C, name="hipsparseSgpsvInterleavedBatch_bufferSizeExt")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: algo
       integer(c_int), value :: m
       real(c_float) :: ds(*)
       real(c_float) :: dl(*)
       real(c_float) :: d(*)
       real(c_float) :: du(*)
       real(c_float) :: dw(*)
       real(c_float) :: x(*)
       integer(c_int), value :: batchCount
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: SgpsvInterleavedBatch_bufferSizeExt
    end function hipsparseSgpsvInterleavedBatch_bufferSizeExt

    !---------------------------------------------
    ! hipsparseDgpsvInterleavedBatch_bufferSizeExt
    !---------------------------------------------
    function hipsparseDgpsvInterleavedBatch_bufferSizeExt(handle, algo, m, ds, dl, d, du, dw, x, &
                                                          batchCount, pBufferSizeInBytes) &
       result(DgpsvInterleavedBatch_bufferSizeExt) &
       bind(C, name="hipsparseDgpsvInterleavedBatch_bufferSizeExt")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: algo
       integer(c_int), value :: m
       real(c_double) :: ds(*)
       real(c_double) :: dl(*)
       real(c_double) :: d(*)
       real(c_double) :: du(*)
       real(c_double) :: dw(*)
       real(c_double) :: x(*)
       integer(c_int), value :: batchCount
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: DgpsvInterleavedBatch_bufferSizeExt
    end function hipsparseDgpsvInterleavedBatch_bufferSizeExt

    !---------------------------------------------
    ! hipsparseCgpsvInterleavedBatch_bufferSizeExt
    !---------------------------------------------
    function hipsparseCgpsvInterleavedBatch_bufferSizeExt(handle, algo, m, ds, dl, d, du, dw, x, &
                                                          batchCount, pBufferSizeInBytes) &
       result(CgpsvInterleavedBatch_bufferSizeExt) &
       bind(C, name="hipsparseCgpsvInterleavedBatch_bufferSizeExt")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: algo
       integer(c_int), value :: m
       type(c_ptr), value :: ds
       type(c_ptr), value :: dl
       type(c_ptr), value :: d
       type(c_ptr), value :: du
       type(c_ptr), value :: dw
       type(c_ptr), value :: x
       integer(c_int), value :: batchCount
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: CgpsvInterleavedBatch_bufferSizeExt
    end function hipsparseCgpsvInterleavedBatch_bufferSizeExt

    !---------------------------------------------
    ! hipsparseZgpsvInterleavedBatch_bufferSizeExt
    !---------------------------------------------
    function hipsparseZgpsvInterleavedBatch_bufferSizeExt(handle, algo, m, ds, dl, d, du, dw, x, &
                                                          batchCount, pBufferSizeInBytes) &
       result(ZgpsvInterleavedBatch_bufferSizeExt) &
       bind(C, name="hipsparseZgpsvInterleavedBatch_bufferSizeExt")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: algo
       integer(c_int), value :: m
       type(c_ptr), value :: ds
       type(c_ptr), value :: dl
       type(c_ptr), value :: d
       type(c_ptr), value :: du
       type(c_ptr), value :: dw
       type(c_ptr), value :: x
       integer(c_int), value :: batchCount
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: ZgpsvInterleavedBatch_bufferSizeExt
    end function hipsparseZgpsvInterleavedBatch_bufferSizeExt

    !---------------------------------------------
    ! hipsparseSgpsvInterleavedBatch
    !---------------------------------------------
    !> \ingroup precond_module
    !> \brief Interleaved batch pentadiagonal solver
    !>
    !> \details
    !> \p hipsparseXgpsvInterleavedBatch solves a batch of pentadiagonal linear systems
    !> \f[
    !> P^{i}*x^{i} = x^{i}
    !> \f]
    !> where for each batch \f$i=0\ldots\f$ \p batchCount, \f$P^{i}\f$ is a sparse pentadiagonal
    !> matrix and
    !> \f$x^{i}\f$ is a dense right-hand side vector. All of the pentadiagonal matrices,
    !> \f$P^{i}\f$, are
    !> packed in an interleaved fashion into five vectors: \p ds for the lowest diagonals, \p dl for
    !> the lower
    !> diagonals, \p d for the main diagonals, \p du for the upper diagonals, and \p dw for the
    !> highest digaonals.
    !> See below for a description of the interleaved memory pattern.
    !>
    !> Solving the batched pentadiagonal system involves two steps. First, the user calls
    !> \ref hipsparseSgpsvInterleavedBatch_bufferSizeExt
    !> "hipsparseSgpsvInterleavedBatch_bufferSizeExt()"
    !> to determine the size of the required temporary storage buffer. Once determined, the user
    !> allocates
    !> this buffer and passes it to \ref hipsparseSgpsvInterleavedBatch
    !> "hipsparseXgpsvInterleavedBatch()"
    !> to perform the actual solve. The \f$x^{i}\f$ vectors, which initially stores the right-hand
    !> side values, are
    !> overwritten with the solution after the call to
    !> \ref hipsparseSgpsvInterleavedBatch "hipsparseXgpsvInterleavedBatch()".
    !>
    !> Unlike the strided batch routines, which write each batch matrix one after the other in
    !> memory, the interleaved
    !> routines write the batch matrices such that each element from each matrix is written
    !> consecutively one after
    !> the other. For example, consider the following batch matrices:
    !>
    !> \f[
    !> \begin{bmatrix}
    !> t^{0}_{00} & t^{0}_{01} & t^{0}_{02} \\
    !> t^{0}_{10} & t^{0}_{11} & t^{0}_{12} \\
    !> t^{0}_{20} & t^{0}_{21} & t^{0}_{22}
    !> \end{bmatrix}
    !> \begin{bmatrix}
    !> t^{1}_{00} & t^{1}_{01} & t^{1}_{02} \\
    !> t^{1}_{10} & t^{1}_{11} & t^{1}_{12} \\
    !> t^{1}_{20} & t^{1}_{21} & t^{1}_{22}
    !> \end{bmatrix}
    !> \begin{bmatrix}
    !> t^{2}_{00} & t^{2}_{01} & t^{2}_{02} \\
    !> t^{2}_{10} & t^{2}_{11} & t^{2}_{12} \\
    !> t^{2}_{20} & t^{2}_{21} & t^{2}_{22}
    !> \end{bmatrix}
    !> \f]
    !>
    !> In interleaved format, the highest, higher, lowest, lower, and diagonal arrays would look
    !> like:
    !> \f[
    !> \begin{align}
    !> \text{lowest} &= \begin{bmatrix} 0 & 0 & 0 & 0 & 0 & 0 & t^{0}_{20} & t^{1}_{20} & t^{2}_{20}
    !> \end{bmatrix} \\
    !> \text{lower} &= \begin{bmatrix} 0 & 0 & 0 & t^{0}_{10} & t^{1}_{10} & t^{1}_{10} & t^{0}_{21}
    !> & t^{1}_{21} & t^{2}_{21} \end{bmatrix} \\
    !> \text{diagonal} &= \begin{bmatrix} t^{0}_{00} & t^{1}_{00} & t^{2}_{00} & t^{0}_{11} &
    !> t^{1}_{11} & t^{2}_{11} & t^{0}_{22} & t^{1}_{22} & t^{2}_{22} \end{bmatrix} \\
    !> \text{higher} &= \begin{bmatrix} t^{0}_{01} & t^{1}_{01} & t^{2}_{01} & t^{0}_{12} &
    !> t^{1}_{12} & t^{2}_{12} & 0 & 0 & 0 \end{bmatrix} \\
    !> \text{highest} &= \begin{bmatrix} t^{0}_{02} & t^{1}_{02} & t^{2}_{02} & 0 & 0 & 0 & 0 & 0 &
    !> 0 \end{bmatrix} \\
    !> \end{align}
    !> \f]
    !> For the lowest array, the first \p 2*batchCount entries are zero, and for the lower array,
    !> the first \p batchCount entries are zero.
    !> For the upper array, the last \p batchCount entries are zero, and for the highest array, the
    !> last \p 2*batchCount entries are zero.
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> algo        algorithm to solve the linear system.
    !> @param[in]
    !> m           size of the pentadiagonal linear system.
    !> @param[inout]
    !> ds          lower diagonal (distance 2) of the pentadiagonal system. The first two entries
    !> must be zero.
    !> @param[inout]
    !> dl          lower diagonal of the pentadiagonal system. The first entry must be zero.
    !> @param[inout]
    !> d           main diagonal of the pentadiagonal system.
    !> @param[inout]
    !> du          upper diagonal of the pentadiagonal system. The last entry must be zero.
    !> @param[inout]
    !> dw          upper diagonal (distance 2) of the pentadiagonal system. The last two entries
    !> must be zero.
    !> @param[inout]
    !> x           Dense array of right-hand-sides with dimension \p batchCount by \p m.
    !> @param[in]
    !> batchCount  The number of systems to solve.
    !> @param[in]
    !> pBuffer     Temporary storage buffer allocated by the user.
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval     HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p alg, \p batchCount, \p ds,
    !> \p dl, \p d, \p du, \p dw, \p x, or \p pBuffer pointer is invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    function hipsparseSgpsvInterleavedBatch(handle, algo, m, ds, dl, d, du, dw, x, batchCount, &
                                            pBuffer) &
       result(SgpsvInterleavedBatch) &
       bind(C, name="hipsparseSgpsvInterleavedBatch")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: algo
       integer(c_int), value :: m
       real(c_float) :: ds(*)
       real(c_float) :: dl(*)
       real(c_float) :: d(*)
       real(c_float) :: du(*)
       real(c_float) :: dw(*)
       real(c_float) :: x(*)
       integer(c_int), value :: batchCount
       type(c_ptr), value :: pBuffer
       integer(c_int) :: SgpsvInterleavedBatch
    end function hipsparseSgpsvInterleavedBatch

    !---------------------------------------------
    ! hipsparseDgpsvInterleavedBatch
    !---------------------------------------------
    function hipsparseDgpsvInterleavedBatch(handle, algo, m, ds, dl, d, du, dw, x, batchCount, &
                                            pBuffer) &
       result(DgpsvInterleavedBatch) &
       bind(C, name="hipsparseDgpsvInterleavedBatch")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: algo
       integer(c_int), value :: m
       real(c_double) :: ds(*)
       real(c_double) :: dl(*)
       real(c_double) :: d(*)
       real(c_double) :: du(*)
       real(c_double) :: dw(*)
       real(c_double) :: x(*)
       integer(c_int), value :: batchCount
       type(c_ptr), value :: pBuffer
       integer(c_int) :: DgpsvInterleavedBatch
    end function hipsparseDgpsvInterleavedBatch

    !---------------------------------------------
    ! hipsparseCgpsvInterleavedBatch
    !---------------------------------------------
    function hipsparseCgpsvInterleavedBatch(handle, algo, m, ds, dl, d, du, dw, x, batchCount, &
                                            pBuffer) &
       result(CgpsvInterleavedBatch) &
       bind(C, name="hipsparseCgpsvInterleavedBatch")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: algo
       integer(c_int), value :: m
       type(c_ptr), value :: ds
       type(c_ptr), value :: dl
       type(c_ptr), value :: d
       type(c_ptr), value :: du
       type(c_ptr), value :: dw
       type(c_ptr), value :: x
       integer(c_int), value :: batchCount
       type(c_ptr), value :: pBuffer
       integer(c_int) :: CgpsvInterleavedBatch
    end function hipsparseCgpsvInterleavedBatch

    !---------------------------------------------
    ! hipsparseZgpsvInterleavedBatch
    !---------------------------------------------
    function hipsparseZgpsvInterleavedBatch(handle, algo, m, ds, dl, d, du, dw, x, batchCount, &
                                            pBuffer) &
       result(ZgpsvInterleavedBatch) &
       bind(C, name="hipsparseZgpsvInterleavedBatch")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: algo
       integer(c_int), value :: m
       type(c_ptr), value :: ds
       type(c_ptr), value :: dl
       type(c_ptr), value :: d
       type(c_ptr), value :: du
       type(c_ptr), value :: dw
       type(c_ptr), value :: x
       integer(c_int), value :: batchCount
       type(c_ptr), value :: pBuffer
       integer(c_int) :: ZgpsvInterleavedBatch
    end function hipsparseZgpsvInterleavedBatch

    !---------------------------------------------
    ! hipsparseSgtsv2_bufferSizeExt
    !---------------------------------------------
    !> \ingroup precond_module
    !> \details
    !> \p hipsparseSgtsv2_bufferSizeExt returns the size of the temporary storage buffer
    !> that is required by \ref hipsparseSgtsv2 "hipsparseXgtsv2()". The temporary
    !> storage buffer must be allocated by the user.
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> \note
    !> This routine supports execution in a hipGraph context.
    !>
    !> @param[in]
    !> handle             handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m                  size of the tridiagonal linear system. Must be at least 2.
    !> @param[in]
    !> n                  number of columns in the dense matrix B. Must be non-negative.
    !> @param[in]
    !> dl                 lower diagonal of the tridiagonal system. The first entry must be zero.
    !> @param[in]
    !> d                  main diagonal of the tridiagonal system.
    !> @param[in]
    !> du                 upper diagonal of the tridiagonal system. The last entry must be zero.
    !> @param[in]
    !> B                  dense matrix of size ( \p ldb, \p n ).
    !> @param[in]
    !> ldb                leading dimension of B. Must satisfy \p ldb >= max(1, m).
    !> @param[out]
    !> pBufferSizeInBytes number of bytes of the temporary storage buffer required by
    !> \ref hipsparseSgtsv2 "hipsparseXgtsv2()".
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p dl, \p d, \p du, \p B, or
    !> \p pBufferSizeInBytes is nullptr, \p m is less than 2, \p n is negative,
    !> or \p ldb is invalid.
    !> \retval HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    function hipsparseSgtsv2_bufferSizeExt(handle, m, n, dl, d, du, B, ldb, pBufferSizeInBytes) &
       result(Sgtsv2_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSgtsv2_bufferSizeExt")
#else
       bind(C, name="hipsparseSgtsv2_bufferSizeExt")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: dl(*)
       real(c_float) :: d(*)
       real(c_float) :: du(*)
       real(c_float) :: B(*)
       integer(c_int), value :: ldb
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Sgtsv2_bufferSizeExt
    end function hipsparseSgtsv2_bufferSizeExt

    !---------------------------------------------
    ! hipsparseDgtsv2_bufferSizeExt
    !---------------------------------------------
    function hipsparseDgtsv2_bufferSizeExt(handle, m, n, dl, d, du, B, ldb, pBufferSizeInBytes) &
       result(Dgtsv2_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDgtsv2_bufferSizeExt")
#else
       bind(C, name="hipsparseDgtsv2_bufferSizeExt")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: dl(*)
       real(c_double) :: d(*)
       real(c_double) :: du(*)
       real(c_double) :: B(*)
       integer(c_int), value :: ldb
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Dgtsv2_bufferSizeExt
    end function hipsparseDgtsv2_bufferSizeExt

    !---------------------------------------------
    ! hipsparseCgtsv2_bufferSizeExt
    !---------------------------------------------
    function hipsparseCgtsv2_bufferSizeExt(handle, m, n, dl, d, du, B, ldb, pBufferSizeInBytes) &
       result(Cgtsv2_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCgtsv2_bufferSizeExt")
#else
       bind(C, name="hipsparseCgtsv2_bufferSizeExt")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: dl
       type(c_ptr), value :: d
       type(c_ptr), value :: du
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Cgtsv2_bufferSizeExt
    end function hipsparseCgtsv2_bufferSizeExt

    !---------------------------------------------
    ! hipsparseZgtsv2_bufferSizeExt
    !---------------------------------------------
    function hipsparseZgtsv2_bufferSizeExt(handle, m, n, dl, d, du, B, ldb, pBufferSizeInBytes) &
       result(Zgtsv2_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZgtsv2_bufferSizeExt")
#else
       bind(C, name="hipsparseZgtsv2_bufferSizeExt")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: dl
       type(c_ptr), value :: d
       type(c_ptr), value :: du
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Zgtsv2_bufferSizeExt
    end function hipsparseZgtsv2_bufferSizeExt

    !---------------------------------------------
    ! hipsparseSgtsv2
    !---------------------------------------------
    !> \ingroup precond_module
    !> \brief Tridiagonal solver with pivoting
    !>
    !> \details
    !> \p hipsparseXgtsv2 solves a tridiagonal system for multiple right-hand sides using pivoting
    !> \f[
    !> T*B = B
    !> \f]
    !> where \f$T\f$ is a sparse tridiagonal matrix and \f$B\f$ is a dense \f$ldb \times n\f$ matrix
    !> storing the
    !> right-hand side vectors in column order. The tridiagonal matrix \f$T\f$ is defined by three
    !> vectors: \p dl
    !> for the lower diagonal, \p d for the main diagonal, and \p du for the upper diagonal.
    !>
    !> Solving the tridiagonal system involves two steps. First, the user calls
    !> \ref hipsparseSgtsv2_bufferSizeExt "hipsparseXgtsv2_bufferSizeExt()" to determine the size of
    !> the required
    !> temporary storage buffer. After this is determined, the user allocates the buffer and passes
    !> it to
    !> \ref hipsparseSgtsv2 "hipsparseXgtsv2()" to perform the actual solve. The \f$B\f$ dense
    !> matrix, which initially
    !> stores the \p n right-hand side vectors, is overwritten with the \p n solution vectors after
    !> the call to
    !> \ref hipsparseSgtsv2 "hipsparseXgtsv2()".
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> \note
    !> This routine supports execution in a hipGraph context.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m           size of the tridiagonal linear system (must be >= 2).
    !> @param[in]
    !> n           number of columns in the dense matrix B.
    !> @param[in]
    !> dl          lower diagonal of the tridiagonal system. The first entry must be zero.
    !> @param[in]
    !> d           main diagonal of the tridiagonal system.
    !> @param[in]
    !> du          upper diagonal of the tridiagonal system. The last entry must be zero.
    !> @param[inout]
    !> B           Dense matrix of size ( \p ldb, \p n ).
    !> @param[in]
    !> ldb         Leading dimension of B. Must satisfy \p ldb >= max(1, m).
    !> @param[in]
    !> pBuffer     temporary storage buffer allocated by the user.
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval     HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p n, \p ldb, \p dl, \p d,
    !> \p du, \p B, or \p pBuffer pointer is invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    function hipsparseSgtsv2(handle, m, n, dl, d, du, B, ldb, pBuffer) &
       result(Sgtsv2) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSgtsv2")
#else
       bind(C, name="hipsparseSgtsv2")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: dl(*)
       real(c_float) :: d(*)
       real(c_float) :: du(*)
       real(c_float) :: B(*)
       integer(c_int), value :: ldb
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Sgtsv2
    end function hipsparseSgtsv2

    !---------------------------------------------
    ! hipsparseDgtsv2
    !---------------------------------------------
    function hipsparseDgtsv2(handle, m, n, dl, d, du, B, ldb, pBuffer) &
       result(Dgtsv2) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDgtsv2")
#else
       bind(C, name="hipsparseDgtsv2")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: dl(*)
       real(c_double) :: d(*)
       real(c_double) :: du(*)
       real(c_double) :: B(*)
       integer(c_int), value :: ldb
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Dgtsv2
    end function hipsparseDgtsv2

    !---------------------------------------------
    ! hipsparseCgtsv2
    !---------------------------------------------
    function hipsparseCgtsv2(handle, m, n, dl, d, du, B, ldb, pBuffer) &
       result(Cgtsv2) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCgtsv2")
#else
       bind(C, name="hipsparseCgtsv2")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: dl
       type(c_ptr), value :: d
       type(c_ptr), value :: du
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Cgtsv2
    end function hipsparseCgtsv2

    !---------------------------------------------
    ! hipsparseZgtsv2
    !---------------------------------------------
    function hipsparseZgtsv2(handle, m, n, dl, d, du, B, ldb, pBuffer) &
       result(Zgtsv2) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZgtsv2")
#else
       bind(C, name="hipsparseZgtsv2")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: dl
       type(c_ptr), value :: d
       type(c_ptr), value :: du
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Zgtsv2
    end function hipsparseZgtsv2

    !---------------------------------------------
    ! hipsparseSgtsvInterleavedBatch_bufferSizeExt
    !---------------------------------------------
    !> \ingroup precond_module
    !> \details
    !> \p hipsparseXgtsvInterleavedBatch_bufferSizeExt returns the size of the temporary storage
    !> buffer in bytes that is required by \ref hipsparseSgtsvInterleavedBatch
    !> "hipsparseXgtsvInterleavedBatch()".
    !> The temporary storage buffer must be allocated by the user.
    !>
    !> @param[in]
    !> handle             handle to the hipSPARSE library context queue.
    !> @param[in]
    !> algo Algorithm to use when solving tridiagonal systems. Options are Thomas ( \p algo=0 ),
    !> LU ( \p algo=1 ), or QR ( \p algo=2 ). The Thomas algorithm is the fastest but is not
    !> stable, while LU and QR are slower but are stable.
    !> @param[in]
    !> m                  size of the tridiagonal linear system.
    !> @param[in]
    !> dl lower diagonal of the tridiagonal system. The first element of the lower diagonal must be
    !> zero.
    !> @param[in]
    !> d                  main diagonal of the tridiagonal system.
    !> @param[in]
    !> du upper diagonal of the tridiagonal system. The last element of the upper diagonal must be
    !> zero.
    !> @param[inout]
    !> x                  Dense array of right-hand sides with dimension \p batchCount by \p m.
    !> @param[in]
    !> batchCount         The number of systems to solve.
    !> @param[out]
    !> pBufferSizeInBytes number of bytes of the temporary storage buffer required by
    !> \ref hipsparseSgtsvInterleavedBatch "hipsparseSgtsvInterleavedBatch()".
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p batchCount, \p dl, \p d, \p du,
    !> \p x, or \p pBufferSizeInBytes pointer is invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    function hipsparseSgtsvInterleavedBatch_bufferSizeExt(handle, algo, m, dl, d, du, x, &
                                                          batchCount, pBufferSizeInBytes) &
       result(SgtsvInterleavedBatch_bufferSizeExt) &
       bind(C, name="hipsparseSgtsvInterleavedBatch_bufferSizeExt")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: algo
       integer(c_int), value :: m
       real(c_float) :: dl(*)
       real(c_float) :: d(*)
       real(c_float) :: du(*)
       real(c_float) :: x(*)
       integer(c_int), value :: batchCount
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: SgtsvInterleavedBatch_bufferSizeExt
    end function hipsparseSgtsvInterleavedBatch_bufferSizeExt

    !---------------------------------------------
    ! hipsparseDgtsvInterleavedBatch_bufferSizeExt
    !---------------------------------------------
    function hipsparseDgtsvInterleavedBatch_bufferSizeExt(handle, algo, m, dl, d, du, x, &
                                                          batchCount, pBufferSizeInBytes) &
       result(DgtsvInterleavedBatch_bufferSizeExt) &
       bind(C, name="hipsparseDgtsvInterleavedBatch_bufferSizeExt")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: algo
       integer(c_int), value :: m
       real(c_double) :: dl(*)
       real(c_double) :: d(*)
       real(c_double) :: du(*)
       real(c_double) :: x(*)
       integer(c_int), value :: batchCount
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: DgtsvInterleavedBatch_bufferSizeExt
    end function hipsparseDgtsvInterleavedBatch_bufferSizeExt

    !---------------------------------------------
    ! hipsparseCgtsvInterleavedBatch_bufferSizeExt
    !---------------------------------------------
    function hipsparseCgtsvInterleavedBatch_bufferSizeExt(handle, algo, m, dl, d, du, x, &
                                                          batchCount, pBufferSizeInBytes) &
       result(CgtsvInterleavedBatch_bufferSizeExt) &
       bind(C, name="hipsparseCgtsvInterleavedBatch_bufferSizeExt")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: algo
       integer(c_int), value :: m
       type(c_ptr), value :: dl
       type(c_ptr), value :: d
       type(c_ptr), value :: du
       type(c_ptr), value :: x
       integer(c_int), value :: batchCount
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: CgtsvInterleavedBatch_bufferSizeExt
    end function hipsparseCgtsvInterleavedBatch_bufferSizeExt

    !---------------------------------------------
    ! hipsparseZgtsvInterleavedBatch_bufferSizeExt
    !---------------------------------------------
    function hipsparseZgtsvInterleavedBatch_bufferSizeExt(handle, algo, m, dl, d, du, x, &
                                                          batchCount, pBufferSizeInBytes) &
       result(ZgtsvInterleavedBatch_bufferSizeExt) &
       bind(C, name="hipsparseZgtsvInterleavedBatch_bufferSizeExt")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: algo
       integer(c_int), value :: m
       type(c_ptr), value :: dl
       type(c_ptr), value :: d
       type(c_ptr), value :: du
       type(c_ptr), value :: x
       integer(c_int), value :: batchCount
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: ZgtsvInterleavedBatch_bufferSizeExt
    end function hipsparseZgtsvInterleavedBatch_bufferSizeExt

    !---------------------------------------------
    ! hipsparseSgtsvInterleavedBatch
    !---------------------------------------------
    !> \ingroup precond_module
    !> \brief Interleaved batch tridiagonal solver.
    !>
    !> \details
    !> \p hipsparseXgtsvInterleavedBatch solves a batched tridiagonal linear system
    !> \f[
    !> T^{i}*x^{i} = x^{i}
    !> \f]
    !> where for each batch \f$i=0\ldots\f$ \p batchCount, \f$T^{i}\f$ is a sparse tridiagonal
    !> matrix and
    !> \f$x^{i}\f$ is a dense right-hand side vector. All of the tridiagonal matrices, \f$T^{i}\f$,
    !> are
    !> packed in an interleaved fashion into three vectors: \p dl for the lower diagonals, \p d for
    !> the main
    !> diagonals, and \p du for the upper diagonals. See below for a description of the interleaved
    !> memory pattern.
    !>
    !> Solving the batched tridiagonal system involves two steps. First, the user calls
    !> \ref hipsparseSgtsvInterleavedBatch_bufferSizeExt
    !> "hipsparseXgtsvInterleavedBatch_bufferSizeExt()"
    !> to determine the size of the required temporary storage buffer. Once determined, the user
    !> allocates
    !> this buffer and passes it to \ref hipsparseSgtsvInterleavedBatch
    !> "hipsparseXgtsvInterleavedBatch()"
    !> to perform the actual solve. The \f$x^{i}\f$ vectors, which initially stores the right-hand
    !> side values, are
    !> overwritten with the solution after the call to
    !> \ref hipsparseSgtsvInterleavedBatch "hipsparseXgtsvInterleavedBatch()".
    !>
    !> The user can specify different algorithms for \p hipsparseXgtsvInterleavedBatch
    !> to use. Options are Thomas ( \p algo=0 ),
    !> LU ( \p algo=1 ), or QR ( \p algo=2 ).
    !>
    !> Unlike the strided batch routines, which write each batch matrix one after the other in
    !> memory, the interleaved
    !> routines write the batch matrices such that each element from each matrix is written
    !> consecutively one after
    !> the other. For example, consider the following batch matrices:
    !>
    !> \f[
    !> \begin{bmatrix}
    !> t^{0}_{00} & t^{0}_{01} & 0 \\
    !> t^{0}_{10} & t^{0}_{11} & t^{0}_{12} \\
    !> 0 & t^{0}_{21} & t^{0}_{22}
    !> \end{bmatrix}
    !> \begin{bmatrix}
    !> t^{1}_{00} & t^{1}_{01} & 0 \\
    !> t^{1}_{10} & t^{1}_{11} & t^{1}_{12} \\
    !> 0 & t^{1}_{21} & t^{1}_{22}
    !> \end{bmatrix}
    !> \begin{bmatrix}
    !> t^{2}_{00} & t^{2}_{01} & 0 \\
    !> t^{2}_{10} & t^{2}_{11} & t^{2}_{12} \\
    !> 0 & t^{2}_{21} & t^{2}_{22}
    !> \end{bmatrix}
    !> \f]
    !>
    !> In interleaved format, the upper, lower, and diagonal arrays would look like:
    !> \f[
    !> \begin{align}
    !> \text{lower} &= \begin{bmatrix} 0 & 0 & 0 & t^{0}_{10} & t^{1}_{10} & t^{1}_{10} & t^{0}_{21}
    !> & t^{1}_{21} & t^{2}_{21} \end{bmatrix} \\
    !> \text{diagonal} &= \begin{bmatrix} t^{0}_{00} & t^{1}_{00} & t^{2}_{00} & t^{0}_{11} &
    !> t^{1}_{11} & t^{2}_{11} & t^{0}_{22} & t^{1}_{22} & t^{2}_{22} \end{bmatrix} \\
    !> \text{upper} &= \begin{bmatrix} t^{0}_{01} & t^{1}_{01} & t^{2}_{01} & t^{0}_{12} &
    !> t^{1}_{12} & t^{2}_{12} & 0 & 0 & 0 \end{bmatrix} \\
    !> \end{align}
    !> \f]
    !> For the lower array, the first \p batchCount entries are zero, and for the upper array, the
    !> last \p batchCount
    !> entries are zero.
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> algo Algorithm to use when solving tridiagonal systems. Options are Thomas ( \p algo=0 ),
    !> LU ( \p algo=1 ), or QR ( \p algo=2 ). The Thomas algorithm is the fastest but is not
    !> stable, while LU and QR are slower but are stable.
    !> @param[in]
    !> m           size of the tridiagonal linear system.
    !> @param[inout]
    !> dl lower diagonal of the tridiagonal system. The first element of the lower diagonal must be
    !> zero.
    !> @param[inout]
    !> d           main diagonal of the tridiagonal system.
    !> @param[inout]
    !> du upper diagonal of the tridiagonal system. The last element of the upper diagonal must be
    !> zero.
    !> @param[inout]
    !> x           Dense array of right-hand sides with dimension \p batchCount by \p m.
    !> @param[in]
    !> batchCount  The number of systems to solve.
    !> @param[in]
    !> pBuffer     temporary storage buffer allocated by the user.
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval     HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p batchCount, \p dl, \p d,
    !> \p du, \p x, or \p pBuffer pointer is invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    function hipsparseSgtsvInterleavedBatch(handle, algo, m, dl, d, du, x, batchCount, pBuffer) &
       result(SgtsvInterleavedBatch) &
       bind(C, name="hipsparseSgtsvInterleavedBatch")
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: algo
       integer(c_int), value :: m
       real(c_float) :: dl(*)
       real(c_float) :: d(*)
       real(c_float) :: du(*)
       real(c_float) :: x(*)
       integer(c_int), value :: batchCount
       type(c_ptr), value :: pBuffer
       integer(c_int) :: SgtsvInterleavedBatch
    end function hipsparseSgtsvInterleavedBatch

    !---------------------------------------------
    ! hipsparseDgtsvInterleavedBatch
    !---------------------------------------------
    function hipsparseDgtsvInterleavedBatch(handle, algo, m, dl, d, du, x, batchCount, pBuffer) &
       result(DgtsvInterleavedBatch) &
       bind(C, name="hipsparseDgtsvInterleavedBatch")
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: algo
       integer(c_int), value :: m
       real(c_double) :: dl(*)
       real(c_double) :: d(*)
       real(c_double) :: du(*)
       real(c_double) :: x(*)
       integer(c_int), value :: batchCount
       type(c_ptr), value :: pBuffer
       integer(c_int) :: DgtsvInterleavedBatch
    end function hipsparseDgtsvInterleavedBatch

    !---------------------------------------------
    ! hipsparseCgtsvInterleavedBatch
    !---------------------------------------------
    function hipsparseCgtsvInterleavedBatch(handle, algo, m, dl, d, du, x, batchCount, pBuffer) &
       result(CgtsvInterleavedBatch) &
       bind(C, name="hipsparseCgtsvInterleavedBatch")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: algo
       integer(c_int), value :: m
       type(c_ptr), value :: dl
       type(c_ptr), value :: d
       type(c_ptr), value :: du
       type(c_ptr), value :: x
       integer(c_int), value :: batchCount
       type(c_ptr), value :: pBuffer
       integer(c_int) :: CgtsvInterleavedBatch
    end function hipsparseCgtsvInterleavedBatch

    !---------------------------------------------
    ! hipsparseZgtsvInterleavedBatch
    !---------------------------------------------
    function hipsparseZgtsvInterleavedBatch(handle, algo, m, dl, d, du, x, batchCount, pBuffer) &
       result(ZgtsvInterleavedBatch) &
       bind(C, name="hipsparseZgtsvInterleavedBatch")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: algo
       integer(c_int), value :: m
       type(c_ptr), value :: dl
       type(c_ptr), value :: d
       type(c_ptr), value :: du
       type(c_ptr), value :: x
       integer(c_int), value :: batchCount
       type(c_ptr), value :: pBuffer
       integer(c_int) :: ZgtsvInterleavedBatch
    end function hipsparseZgtsvInterleavedBatch

    !---------------------------------------------
    ! hipsparseSgtsv2_nopivot_bufferSizeExt
    !---------------------------------------------
    !> \ingroup precond_module
    !> \details
    !> \p hipsparseXgtsv2_nopivot_bufferSizeExt returns the size of the temporary storage
    !> buffer in bytes that is required by \ref hipsparseSgtsv2_nopivot "hipsparseXgtsv2_nopivot()".
    !> The temporary storage buffer must be allocated by the user.
    !>
    !> @param[in]
    !> handle             handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m                  size of the tridiagonal linear system. Must be >= 2.
    !> @param[in]
    !> n                  number of columns in the dense matrix B. Must be non-negative.
    !> @param[in]
    !> dl                 lower diagonal of the tridiagonal system. The first entry must be zero.
    !> @param[in]
    !> d                  main diagonal of the tridiagonal system.
    !> @param[in]
    !> du                 upper diagonal of the tridiagonal system. The last entry must be zero.
    !> @param[in]
    !> B                  Dense matrix of size ( \p ldb, \p n ).
    !> @param[in]
    !> ldb                Leading dimension of B. Must satisfy \p ldb >= max(1, m).
    !> @param[out]
    !> pBufferSizeInBytes number of bytes of the temporary storage buffer required by
    !> \ref hipsparseSgtsv2_nopivot "hipsparseXgtsv2_nopivot()".
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p dl, \p d, \p du, \p B, or
    !> \p pBufferSizeInBytes is nullptr, \p m is less than 2, \p n is negative,
    !> or \p ldb is invalid.
    !> \retval HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    function hipsparseSgtsv2_nopivot_bufferSizeExt(handle, m, n, dl, d, du, B, ldb, &
                                                   pBufferSizeInBytes) &
       result(Sgtsv2_nopivot_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSgtsv2_nopivot_bufferSizeExt")
#else
       bind(C, name="hipsparseSgtsv2_nopivot_bufferSizeExt")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: dl(*)
       real(c_float) :: d(*)
       real(c_float) :: du(*)
       real(c_float) :: B(*)
       integer(c_int), value :: ldb
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Sgtsv2_nopivot_bufferSizeExt
    end function hipsparseSgtsv2_nopivot_bufferSizeExt

    !---------------------------------------------
    ! hipsparseDgtsv2_nopivot_bufferSizeExt
    !---------------------------------------------
    function hipsparseDgtsv2_nopivot_bufferSizeExt(handle, m, n, dl, d, du, B, ldb, &
                                                   pBufferSizeInBytes) &
       result(Dgtsv2_nopivot_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDgtsv2_nopivot_bufferSizeExt")
#else
       bind(C, name="hipsparseDgtsv2_nopivot_bufferSizeExt")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: dl(*)
       real(c_double) :: d(*)
       real(c_double) :: du(*)
       real(c_double) :: B(*)
       integer(c_int), value :: ldb
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Dgtsv2_nopivot_bufferSizeExt
    end function hipsparseDgtsv2_nopivot_bufferSizeExt

    !---------------------------------------------
    ! hipsparseCgtsv2_nopivot_bufferSizeExt
    !---------------------------------------------
    function hipsparseCgtsv2_nopivot_bufferSizeExt(handle, m, n, dl, d, du, B, ldb, &
                                                   pBufferSizeInBytes) &
       result(Cgtsv2_nopivot_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCgtsv2_nopivot_bufferSizeExt")
#else
       bind(C, name="hipsparseCgtsv2_nopivot_bufferSizeExt")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: dl
       type(c_ptr), value :: d
       type(c_ptr), value :: du
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Cgtsv2_nopivot_bufferSizeExt
    end function hipsparseCgtsv2_nopivot_bufferSizeExt

    !---------------------------------------------
    ! hipsparseZgtsv2_nopivot_bufferSizeExt
    !---------------------------------------------
    function hipsparseZgtsv2_nopivot_bufferSizeExt(handle, m, n, dl, d, du, B, ldb, &
                                                   pBufferSizeInBytes) &
       result(Zgtsv2_nopivot_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZgtsv2_nopivot_bufferSizeExt")
#else
       bind(C, name="hipsparseZgtsv2_nopivot_bufferSizeExt")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: dl
       type(c_ptr), value :: d
       type(c_ptr), value :: du
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Zgtsv2_nopivot_bufferSizeExt
    end function hipsparseZgtsv2_nopivot_bufferSizeExt

    !---------------------------------------------
    ! hipsparseSgtsv2_nopivot
    !---------------------------------------------
    !> \ingroup precond_module
    !> \brief Tridiagonal solver (no pivoting)
    !>
    !> \details
    !> \p hipsparseXgtsv2_nopivot solves a tridiagonal linear system for multiple right-hand sides
    !> without pivoting
    !> \f[
    !> T*B = B
    !> \f]
    !> where \f$T\f$ is a sparse tridiagonal matrix and \f$B\f$ is a dense \f$ldb \times n\f$ matrix
    !> storing the
    !> right-hand side vectors in column order. The tridiagonal matrix \f$T\f$ is defined by three
    !> vectors: \p dl
    !> for the lower diagonal, \p d for the main diagonal, and \p du for the upper diagonal.
    !>
    !> Solving the tridiagonal system with multiple right-hand sides without pivoting involves two
    !> steps. First,
    !> the user calls \ref hipsparseSgtsv2_nopivot_bufferSizeExt
    !> "hipsparseXgtsv2_nopivot_bufferSizeExt()"
    !> to determine the size of the required temporary storage buffer. Once determined, the user
    !> allocates this
    !> buffer and passes it to \ref hipsparseSgtsv2_nopivot "hipsparseXgtsv2_nopivot()" to perform
    !> the actual
    !> solve. The \f$B\f$ dense matrix, which initially stores the \p n right-hand side vectors, is
    !> overwritten
    !> with the \p n solution vectors after the call to \ref hipsparseSgtsv2_nopivot
    !> "hipsparseXgtsv2_nopivot()".
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m           size of the tridiagonal linear system (must be >= 2).
    !> @param[in]
    !> n           number of columns in the dense matrix B.
    !> @param[in]
    !> dl          lower diagonal of the tridiagonal system. The first entry must be zero.
    !> @param[in]
    !> d           main diagonal of the tridiagonal system.
    !> @param[in]
    !> du          upper diagonal of the tridiagonal system. The last entry must be zero.
    !> @param[inout]
    !> B           Dense matrix of size ( \p ldb, \p n ).
    !> @param[in]
    !> ldb         Leading dimension of B. Must satisfy \p ldb >= max(1, m).
    !> @param[in]
    !> pBuffer     temporary storage buffer allocated by the user.
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval     HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p n, \p ldb, \p dl, \p d,
    !> \p du, \p B, or \p pBuffer pointer is invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    function hipsparseSgtsv2_nopivot(handle, m, n, dl, d, du, B, ldb, pBuffer) &
       result(Sgtsv2_nopivot) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSgtsv2_nopivot")
#else
       bind(C, name="hipsparseSgtsv2_nopivot")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: dl(*)
       real(c_float) :: d(*)
       real(c_float) :: du(*)
       real(c_float) :: B(*)
       integer(c_int), value :: ldb
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Sgtsv2_nopivot
    end function hipsparseSgtsv2_nopivot

    !---------------------------------------------
    ! hipsparseDgtsv2_nopivot
    !---------------------------------------------
    function hipsparseDgtsv2_nopivot(handle, m, n, dl, d, du, B, ldb, pBuffer) &
       result(Dgtsv2_nopivot) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDgtsv2_nopivot")
#else
       bind(C, name="hipsparseDgtsv2_nopivot")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: dl(*)
       real(c_double) :: d(*)
       real(c_double) :: du(*)
       real(c_double) :: B(*)
       integer(c_int), value :: ldb
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Dgtsv2_nopivot
    end function hipsparseDgtsv2_nopivot

    !---------------------------------------------
    ! hipsparseCgtsv2_nopivot
    !---------------------------------------------
    function hipsparseCgtsv2_nopivot(handle, m, n, dl, d, du, B, ldb, pBuffer) &
       result(Cgtsv2_nopivot) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCgtsv2_nopivot")
#else
       bind(C, name="hipsparseCgtsv2_nopivot")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: dl
       type(c_ptr), value :: d
       type(c_ptr), value :: du
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Cgtsv2_nopivot
    end function hipsparseCgtsv2_nopivot

    !---------------------------------------------
    ! hipsparseZgtsv2_nopivot
    !---------------------------------------------
    function hipsparseZgtsv2_nopivot(handle, m, n, dl, d, du, B, ldb, pBuffer) &
       result(Zgtsv2_nopivot) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZgtsv2_nopivot")
#else
       bind(C, name="hipsparseZgtsv2_nopivot")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: dl
       type(c_ptr), value :: d
       type(c_ptr), value :: du
       type(c_ptr), value :: B
       integer(c_int), value :: ldb
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Zgtsv2_nopivot
    end function hipsparseZgtsv2_nopivot

    !---------------------------------------------
    ! hipsparseSgtsv2StridedBatch_bufferSizeExt
    !---------------------------------------------
    !> \ingroup precond_module
    !> \details
    !> \p hipsparseXgtsv2StridedBatch_bufferSizeExt returns the size of the temporary storage
    !> buffer in bytes that is required by \ref hipsparseSgtsv2StridedBatch
    !> "hipsparseXgtsv2StridedBatch()".
    !> The temporary storage buffer must be allocated by the user.
    !>
    !> @param[in]
    !> handle             handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m                  size of the tridiagonal linear system.
    !> @param[in]
    !> dl lower diagonal of the tridiagonal system where the ith system lower diagonal starts at
    !> \p dl+batchStride*i.
    !> @param[in]
    !> d main diagonal of the tridiagonal system where the ith system diagonal starts at
    !> \p d+batchStride*i.
    !> @param[in]
    !> du upper diagonal of the tridiagonal system where the ith system upper diagonal starts at
    !> \p du+batchStride*i.
    !> @param[inout]
    !> x Dense array of right-hand sides where the ith right-hand side starts at \p x+batchStride*i.
    !> @param[in]
    !> batchCount         The number of systems to solve.
    !> @param[in]
    !> batchStride The number of elements that separate each system, which must satisfy \p
    !> batchStride >= m.
    !> @param[out]
    !> pBufferSizeInBytes number of bytes of the temporary storage buffer required by
    !> \ref hipsparseSgtsv2StridedBatch "hipsparseXgtsv2StridedBatch()".
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p batchCount, \p batchStride, \p dl,
    !> \p d, \p du, \p x, or \p pBufferSizeInBytes pointer is invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    function hipsparseSgtsv2StridedBatch_bufferSizeExt(handle, m, dl, d, du, x, batchCount, &
                                                       batchStride, pBufferSizeInBytes) &
       result(Sgtsv2StridedBatch_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSgtsv2StridedBatch_bufferSizeExt")
#else
       bind(C, name="hipsparseSgtsv2StridedBatch_bufferSizeExt")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       real(c_float) :: dl(*)
       real(c_float) :: d(*)
       real(c_float) :: du(*)
       real(c_float) :: x(*)
       integer(c_int), value :: batchCount
       integer(c_int), value :: batchStride
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Sgtsv2StridedBatch_bufferSizeExt
    end function hipsparseSgtsv2StridedBatch_bufferSizeExt

    !---------------------------------------------
    ! hipsparseDgtsv2StridedBatch_bufferSizeExt
    !---------------------------------------------
    function hipsparseDgtsv2StridedBatch_bufferSizeExt(handle, m, dl, d, du, x, batchCount, &
                                                       batchStride, pBufferSizeInBytes) &
       result(Dgtsv2StridedBatch_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDgtsv2StridedBatch_bufferSizeExt")
#else
       bind(C, name="hipsparseDgtsv2StridedBatch_bufferSizeExt")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       real(c_double) :: dl(*)
       real(c_double) :: d(*)
       real(c_double) :: du(*)
       real(c_double) :: x(*)
       integer(c_int), value :: batchCount
       integer(c_int), value :: batchStride
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Dgtsv2StridedBatch_bufferSizeExt
    end function hipsparseDgtsv2StridedBatch_bufferSizeExt

    !---------------------------------------------
    ! hipsparseCgtsv2StridedBatch_bufferSizeExt
    !---------------------------------------------
    function hipsparseCgtsv2StridedBatch_bufferSizeExt(handle, m, dl, d, du, x, batchCount, &
                                                       batchStride, pBufferSizeInBytes) &
       result(Cgtsv2StridedBatch_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCgtsv2StridedBatch_bufferSizeExt")
#else
       bind(C, name="hipsparseCgtsv2StridedBatch_bufferSizeExt")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       type(c_ptr), value :: dl
       type(c_ptr), value :: d
       type(c_ptr), value :: du
       type(c_ptr), value :: x
       integer(c_int), value :: batchCount
       integer(c_int), value :: batchStride
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Cgtsv2StridedBatch_bufferSizeExt
    end function hipsparseCgtsv2StridedBatch_bufferSizeExt

    !---------------------------------------------
    ! hipsparseZgtsv2StridedBatch_bufferSizeExt
    !---------------------------------------------
    function hipsparseZgtsv2StridedBatch_bufferSizeExt(handle, m, dl, d, du, x, batchCount, &
                                                       batchStride, pBufferSizeInBytes) &
       result(Zgtsv2StridedBatch_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZgtsv2StridedBatch_bufferSizeExt")
#else
       bind(C, name="hipsparseZgtsv2StridedBatch_bufferSizeExt")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       type(c_ptr), value :: dl
       type(c_ptr), value :: d
       type(c_ptr), value :: du
       type(c_ptr), value :: x
       integer(c_int), value :: batchCount
       integer(c_int), value :: batchStride
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Zgtsv2StridedBatch_bufferSizeExt
    end function hipsparseZgtsv2StridedBatch_bufferSizeExt

    !---------------------------------------------
    ! hipsparseSgtsv2StridedBatch
    !---------------------------------------------
    !> \ingroup precond_module
    !> \brief Strided batch tridiagonal solver (no pivoting).
    !>
    !> \details
    !> \p hipsparseXgtsv2StridedBatch solves a batched tridiagonal linear system
    !> \f[
    !> T^{i}*x^{i} = x^{i}
    !> \f]
    !> where for each batch \f$i=0\ldots\f$ \p batchCount, \f$T^{i}\f$ is a sparse tridiagonal
    !> matrix and
    !> \f$x^{i}\f$ is a dense right-hand side vector. All of the tridiagonal matrices, \f$T^{i}\f$,
    !> are
    !> packed one after the other into three vectors: \p dl for the lower diagonals, \p d for the
    !> main
    !> diagonals, and \p du for the upper diagonals. See below for a description of the strided
    !> memory pattern.
    !>
    !> Solving the batched tridiagonal system involves two steps. First, the user calls
    !> \ref hipsparseSgtsv2StridedBatch_bufferSizeExt "hipsparseXgtsv2StridedBatch_bufferSizeExt()"
    !> to determine the size of the required temporary storage buffer. After this is determined, the
    !> user allocates
    !> this buffer and passes it to \ref hipsparseSgtsv2StridedBatch "hipsparseXgtsv2StridedBatch()"
    !> to perform the actual solve. The \f$x^{i}\f$ vectors, which initially stores the right-hand
    !> side values, are
    !> overwritten with the solution after the call to
    !> \ref hipsparseSgtsv2StridedBatch "hipsparseXgtsv2StridedBatch()".
    !>
    !> The strided batch routines write each batch matrix one after the other in memory. For
    !> example, consider
    !> the following batch matrices:
    !>
    !> \f[
    !> \begin{bmatrix}
    !> t^{0}_{00} & t^{0}_{01} & 0 \\
    !> t^{0}_{10} & t^{0}_{11} & t^{0}_{12} \\
    !> 0 & t^{0}_{21} & t^{0}_{22}
    !> \end{bmatrix}
    !> \begin{bmatrix}
    !> t^{1}_{00} & t^{1}_{01} & 0 \\
    !> t^{1}_{10} & t^{1}_{11} & t^{1}_{12} \\
    !> 0 & t^{1}_{21} & t^{1}_{22}
    !> \end{bmatrix}
    !> \begin{bmatrix}
    !> t^{2}_{00} & t^{2}_{01} & 0 \\
    !> t^{2}_{10} & t^{2}_{11} & t^{2}_{12} \\
    !> 0 & t^{2}_{21} & t^{2}_{22}
    !> \end{bmatrix}
    !> \f]
    !>
    !> In strided format, the upper, lower, and diagonal arrays would look like:
    !> \f[
    !> \begin{align}
    !> \text{lower} &= \begin{bmatrix} 0 & t^{0}_{10} & t^{0}_{21} & 0 & t^{1}_{10} & t^{1}_{21} & 0
    !> & t^{2}_{10} & t^{2}_{21} \end{bmatrix} \\
    !> \text{diagonal} &= \begin{bmatrix} t^{0}_{00} & t^{0}_{11} & t^{0}_{22} & t^{1}_{00} &
    !> t^{1}_{11} & t^{1}_{22} & t^{2}_{00} & t^{2}_{11} & t^{2}_{22} \end{bmatrix} \\
    !> \text{upper} &= \begin{bmatrix} t^{0}_{01} & t^{0}_{12} & 0 & t^{1}_{01} & t^{1}_{12} & 0 &
    !> t^{2}_{01} & t^{2}_{12} & 0 \end{bmatrix} \\
    !> \end{align}
    !> \f]
    !> For the lower array, for each batch \p i, the \p i*batchStride entries are zero, and for the
    !> upper array, the
    !> \p i*batchStride+batchStride-1 entries are zero.
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m           size of the tridiagonal linear system (must be >= 2).
    !> @param[in]
    !> dl          lower diagonal of the tridiagonal system. The first entry must be zero.
    !> @param[in]
    !> d           main diagonal of the tridiagonal system.
    !> @param[in]
    !> du          upper diagonal of the tridiagonal system. The last entry must be zero.
    !> @param[inout]
    !> x Dense array of right-hand sides where the ith right-hand side starts at \p x+batchStride*i.
    !> @param[in]
    !> batchCount  The number of systems to solve.
    !> @param[in]
    !> batchStride The number of elements that separate each system, which must satisfy \p
    !> batchStride >= m.
    !> @param[in]
    !> pBuffer     temporary storage buffer allocated by the user.
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p batchCount, \p batchStride, \p dl,
    !> \p d,
    !> \p du, \p x, or \p pBuffer pointer is invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    function hipsparseSgtsv2StridedBatch(handle, m, dl, d, du, x, batchCount, batchStride, &
                                         pBuffer) &
       result(Sgtsv2StridedBatch) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSgtsv2StridedBatch")
#else
       bind(C, name="hipsparseSgtsv2StridedBatch")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       real(c_float) :: dl(*)
       real(c_float) :: d(*)
       real(c_float) :: du(*)
       real(c_float) :: x(*)
       integer(c_int), value :: batchCount
       integer(c_int), value :: batchStride
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Sgtsv2StridedBatch
    end function hipsparseSgtsv2StridedBatch

    !---------------------------------------------
    ! hipsparseDgtsv2StridedBatch
    !---------------------------------------------
    function hipsparseDgtsv2StridedBatch(handle, m, dl, d, du, x, batchCount, batchStride, &
                                         pBuffer) &
       result(Dgtsv2StridedBatch) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDgtsv2StridedBatch")
#else
       bind(C, name="hipsparseDgtsv2StridedBatch")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       real(c_double) :: dl(*)
       real(c_double) :: d(*)
       real(c_double) :: du(*)
       real(c_double) :: x(*)
       integer(c_int), value :: batchCount
       integer(c_int), value :: batchStride
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Dgtsv2StridedBatch
    end function hipsparseDgtsv2StridedBatch

    !---------------------------------------------
    ! hipsparseCgtsv2StridedBatch
    !---------------------------------------------
    function hipsparseCgtsv2StridedBatch(handle, m, dl, d, du, x, batchCount, batchStride, &
                                         pBuffer) &
       result(Cgtsv2StridedBatch) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCgtsv2StridedBatch")
#else
       bind(C, name="hipsparseCgtsv2StridedBatch")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       type(c_ptr), value :: dl
       type(c_ptr), value :: d
       type(c_ptr), value :: du
       type(c_ptr), value :: x
       integer(c_int), value :: batchCount
       integer(c_int), value :: batchStride
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Cgtsv2StridedBatch
    end function hipsparseCgtsv2StridedBatch

    !---------------------------------------------
    ! hipsparseZgtsv2StridedBatch
    !---------------------------------------------
    function hipsparseZgtsv2StridedBatch(handle, m, dl, d, du, x, batchCount, batchStride, &
                                         pBuffer) &
       result(Zgtsv2StridedBatch) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZgtsv2StridedBatch")
#else
       bind(C, name="hipsparseZgtsv2StridedBatch")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       type(c_ptr), value :: dl
       type(c_ptr), value :: d
       type(c_ptr), value :: du
       type(c_ptr), value :: x
       integer(c_int), value :: batchCount
       integer(c_int), value :: batchStride
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Zgtsv2StridedBatch
    end function hipsparseZgtsv2StridedBatch

    !---------------------------------------------
    ! hipsparseSbsr2csr
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief Convert a sparse BSR matrix into a sparse CSR matrix.
    !>
    !> \details
    !> \p hipsparseXbsr2csr converts a BSR matrix into a CSR matrix. It is assumed
    !> that \p csrValC, \p csrColIndC, and \p csrRowPtrC are allocated. Allocation size
    !> for \p csrRowPtrC is computed by the number of block rows multiplied by the block
    !> dimension plus one. Allocation for \p csrValC and \p csrColInd is computed by
    !> the number of blocks in the BSR matrix multiplied by the block dimension squared.
    !>
    !> For example, given the BSR matrix using block dimension 2:
    !> \f[
    !> \left[
    !> \begin{array}{c | c}
    !> \begin{array}{c c}
    !> 1 & 0 \\
    !> 3 & 4
    !> \end{array} &
    !> \begin{array}{c c}
    !> 0 & 2 \\
    !> 0 & 0
    !> \end{array} \\
    !> \hline
    !> \begin{array}{c c}
    !> 5 & 0 \\
    !> 1 & 2
    !> \end{array} &
    !> \begin{array}{c c}
    !> 6 & 7 \\
    !> 3 & 4
    !> \end{array} \\
    !> \end{array}
    !> \right]
    !> \f]
    !>
    !> The resulting CSR matrix row pointer, column indices, and values arrays are:
    !> \f[
    !> \begin{align}
    !> \text{csrRowPtrC} &= \begin{bmatrix} 0 & 4 & 8 & 12 & 16 \end{bmatrix} \\
    !> \text{csrColIndC} &= \begin{bmatrix} 0 & 1 & 2 & 3 & 0 & 1 & 2 & 3 & 0 & 1 & 2 & 3 & 0 & 1 &
    !> 2 & 3 \end{bmatrix} \\
    !> \text{csrValC} &= \begin{bmatrix} 1 & 0 & 0 & 2 & 3 & 4 & 0 & 0 & 5 & 0 & 6 & 7 & 1 & 2 & 3 &
    !> 4 \end{bmatrix} \\
    !> \end{align}
    !> \f]
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> dirA the storage format of the blocks, \ref HIPSPARSE_DIRECTION_ROW or \ref
    !> HIPSPARSE_DIRECTION_COLUMN.
    !> @param[in]
    !> mb          number of block rows in the sparse BSR matrix, which must be non-negative.
    !> @param[in]
    !> nb          number of block columns in the sparse BSR matrix, which must be non-negative.
    !> @param[in]
    !> descrA      descriptor of the sparse BSR matrix. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> bsrValA array of \p nnzb*blockDim*blockDim containing the values of the sparse BSR matrix.
    !> @param[in]
    !> bsrRowPtrA  array of \p mb+1 elements that point to the start of every block row of the
    !> sparse BSR matrix.
    !> @param[in]
    !> bsrColIndA array of \p nnzb elements containing the block column indices of the sparse BSR
    !> matrix.
    !> @param[in]
    !> blockDim    size of the blocks in the sparse BSR matrix. Must be positive.
    !> @param[in]
    !> descrC      descriptor of the sparse CSR matrix. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[out]
    !> csrValC array of \p nnzb*blockDim*blockDim elements containing the values of the sparse CSR
    !> matrix.
    !> @param[out]
    !> csrRowPtrC array of \p m+1 where \p m=mb*blockDim elements that point to the start of every
    !> row of the
    !> sparse CSR matrix.
    !> @param[out]
    !> csrColIndC array of \p nnzb*blockDim*blockDim elements containing the column indices of the
    !> sparse CSR matrix.
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p descrA, \p descrC, \p bsrValA,
    !> \p bsrRowPtrA, \p bsrColIndA, \p csrValC, \p csrRowPtrC, or \p csrColIndC is nullptr,
    !> \p mb or \p nb is negative, or \p blockDim is invalid.
    function hipsparseSbsr2csr(handle, dirA, mb, nb, descrA, bsrValA, bsrRowPtrA, bsrColIndA, &
                               blockDim, descrC, csrValC, csrRowPtrC, csrColIndC) &
       result(Sbsr2csr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSbsr2csr")
#else
       bind(C, name="hipsparseSbsr2csr")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nb
       type(c_ptr), value :: descrA
       real(c_float) :: bsrValA(*)
       integer(c_int) :: bsrRowPtrA(*)
       integer(c_int) :: bsrColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: descrC
       real(c_float) :: csrValC(*)
       integer(c_int) :: csrRowPtrC(*)
       integer(c_int) :: csrColIndC(*)
       integer(c_int) :: Sbsr2csr
    end function hipsparseSbsr2csr

    !---------------------------------------------
    ! hipsparseDbsr2csr
    !---------------------------------------------
    function hipsparseDbsr2csr(handle, dirA, mb, nb, descrA, bsrValA, bsrRowPtrA, bsrColIndA, &
                               blockDim, descrC, csrValC, csrRowPtrC, csrColIndC) &
       result(Dbsr2csr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDbsr2csr")
#else
       bind(C, name="hipsparseDbsr2csr")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nb
       type(c_ptr), value :: descrA
       real(c_double) :: bsrValA(*)
       integer(c_int) :: bsrRowPtrA(*)
       integer(c_int) :: bsrColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: descrC
       real(c_double) :: csrValC(*)
       integer(c_int) :: csrRowPtrC(*)
       integer(c_int) :: csrColIndC(*)
       integer(c_int) :: Dbsr2csr
    end function hipsparseDbsr2csr

    !---------------------------------------------
    ! hipsparseCbsr2csr
    !---------------------------------------------
    function hipsparseCbsr2csr(handle, dirA, mb, nb, descrA, bsrValA, bsrRowPtrA, bsrColIndA, &
                               blockDim, descrC, csrValC, csrRowPtrC, csrColIndC) &
       result(Cbsr2csr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCbsr2csr")
#else
       bind(C, name="hipsparseCbsr2csr")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nb
       type(c_ptr), value :: descrA
       type(c_ptr), value :: bsrValA
       integer(c_int) :: bsrRowPtrA(*)
       integer(c_int) :: bsrColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: descrC
       type(c_ptr), value :: csrValC
       integer(c_int) :: csrRowPtrC(*)
       integer(c_int) :: csrColIndC(*)
       integer(c_int) :: Cbsr2csr
    end function hipsparseCbsr2csr

    !---------------------------------------------
    ! hipsparseZbsr2csr
    !---------------------------------------------
    function hipsparseZbsr2csr(handle, dirA, mb, nb, descrA, bsrValA, bsrRowPtrA, bsrColIndA, &
                               blockDim, descrC, csrValC, csrRowPtrC, csrColIndC) &
       result(Zbsr2csr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZbsr2csr")
#else
       bind(C, name="hipsparseZbsr2csr")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nb
       type(c_ptr), value :: descrA
       type(c_ptr), value :: bsrValA
       integer(c_int) :: bsrRowPtrA(*)
       integer(c_int) :: bsrColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: descrC
       type(c_ptr), value :: csrValC
       integer(c_int) :: csrRowPtrC(*)
       integer(c_int) :: csrColIndC(*)
       integer(c_int) :: Zbsr2csr
    end function hipsparseZbsr2csr

    !---------------------------------------------
    ! hipsparseXcoo2csr
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief Convert a sparse COO matrix into a sparse CSR matrix.
    !>
    !> \details
    !> \p hipsparseXcoo2csr converts the COO array containing the row indices into a
    !> CSR array of row offsets that point to the start of every row.
    !> It is assumed that the COO row index array is sorted and that all arrays have been allocated
    !> prior to calling \p hipsparseXcoo2csr.
    !>
    !> For example, given the COO row indices array:
    !> \f[
    !> \begin{align}
    !> \text{cooRowInd} &= \begin{bmatrix} 0 & 0 & 1 & 2 & 2 & 4 & 4 & 4 \end{bmatrix}
    !> \end{align}
    !> \f]
    !>
    !> the resulting CSR row pointer array after calling \p hipsparseXcoo2csr is:
    !> \f[
    !> \begin{align}
    !> \text{csrRowPtr} &= \begin{bmatrix} 0 & 2 & 3 & 5 & 8 \end{bmatrix}
    !> \end{align}
    !> \f]
    !>
    !> \note This function can also be used to convert a COO array containing the column indices
    !> into
    !> a CSC array of column offsets that point to the start of every column. In this case, it is
    !> assumed that the COO column index array is sorted instead.
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> cooRowInd   array of \p nnz elements containing the row indices of the sparse COO
    !> matrix.
    !> @param[in]
    !> nnz         number of non-zero entries of the sparse CSR matrix. Must be non-negative.
    !> @param[in]
    !> m           number of rows of the sparse CSR matrix. Must be non-negative.
    !> @param[out]
    !> csrRowPtr   array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix.
    !> @param[in]
    !> idxBase     index base. \ref HIPSPARSE_INDEX_BASE_ZERO for zero-based indexing or
    !> \ref HIPSPARSE_INDEX_BASE_ONE for one-based indexing.
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle is nullptr, \p m or \p nnz is negative,
    !> \p cooRowInd or \p csrRowPtr is nullptr when \p nnz is greater than zero, or
    !> \p idxBase is neither \ref HIPSPARSE_INDEX_BASE_ZERO nor \ref HIPSPARSE_INDEX_BASE_ONE.
    function hipsparseXcoo2csr(handle, cooRowInd, nnz, m, csrRowPtr, idxBase) &
       result(Xcoo2csr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseXcoo2csr")
#else
       bind(C, name="hipsparseXcoo2csr")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int) :: cooRowInd(*)
       integer(c_int), value :: nnz
       integer(c_int), value :: m
       integer(c_int) :: csrRowPtr(*)
       integer(c_int), value :: idxBase
       integer(c_int) :: Xcoo2csr
    end function hipsparseXcoo2csr

    !---------------------------------------------
    ! hipsparseXcoosort_bufferSizeExt
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief Sort a sparse COO matrix.
    !>
    !> \details
    !> \p hipsparseXcoosort_bufferSizeExt returns the size of the temporary storage buffer
    !> in bytes required by \ref hipsparseXcoosortByRow() and \ref hipsparseXcoosortByColumn().
    !> The temporary storage buffer must be allocated by the user.
    !>
    !> @param[in]
    !> handle              handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m                   number of rows of the sparse COO matrix.
    !> @param[in]
    !> n                   number of columns of the sparse COO matrix.
    !> @param[in]
    !> nnz                 number of non-zero entries of the sparse COO matrix.
    !> @param[in]
    !> cooRows             array of \p nnz elements containing the row indices of the sparse
    !> COO matrix.
    !> @param[in]
    !> cooCols             array of \p nnz elements containing the column indices of the sparse
    !> COO matrix.
    !> @param[out]
    !> pBufferSizeInBytes  number of bytes of the temporary storage buffer required by
    !> hipsparseXcoosortByRow() and hipsparseXcoosortByColumn().
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval     HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p n, \p nnz, \p cooRows,
    !> \p cooCols, or \p pBufferSizeInBytes pointer is invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    function hipsparseXcoosort_bufferSizeExt(handle, m, n, nnz, cooRows, cooCols, &
                                             pBufferSizeInBytes) &
       result(Xcoosort_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseXcoosort_bufferSizeExt")
#else
       bind(C, name="hipsparseXcoosort_bufferSizeExt")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       integer(c_int) :: cooRows(*)
       integer(c_int) :: cooCols(*)
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Xcoosort_bufferSizeExt
    end function hipsparseXcoosort_bufferSizeExt

    !---------------------------------------------
    ! hipsparseXcoosortByRow
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief Sort a sparse COO matrix by row.
    !>
    !> \details
    !> \p hipsparseXcoosortByRow sorts a matrix in COO format by row. The sorted
    !> permutation vector \p P can be used to obtain sorted \p cooVal array. In this
    !> case, \p P must be initialized as the identity permutation. See
    !> \ref hipsparseCreateIdentityPermutation(). To apply the permutation vector to the COO
    !> values, see \ref hipsparseSgthr "hipsparseXgthr()".
    !>
    !> \p hipsparseXcoosortByRow requires an extra temporary storage buffer that must be
    !> allocated by the user. The storage buffer size can be determined by
    !> \ref hipsparseXcoosort_bufferSizeExt().
    !>
    !> \note
    !> \p P can be \p NULL if a sorted permutation vector is not required.
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> @param[in]
    !> handle          handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m               number of rows of the sparse COO matrix.
    !> @param[in]
    !> n               number of columns of the sparse COO matrix.
    !> @param[in]
    !> nnz             number of non-zero entries of the sparse COO matrix.
    !> @param[inout]
    !> cooRows         array of \p nnz elements containing the row indices of the sparse
    !> COO matrix.
    !> @param[inout]
    !> cooCols         array of \p nnz elements containing the column indices of the sparse
    !> COO matrix.
    !> @param[inout]
    !> P               array of \p nnz integers containing the unsorted map indices. Can be
    !> \p NULL.
    !> @param[in]
    !> pBuffer         temporary storage buffer allocated by the user. The size is returned by
    !> \ref hipsparseXcoosort_bufferSizeExt().
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval     HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p n, \p nnz, \p cooRows,
    !> \p cooCols, or \p pBuffer pointer is invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    function hipsparseXcoosortByRow(handle, m, n, nnz, cooRows, cooCols, P, pBuffer) &
       result(XcoosortByRow) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseXcoosortByRow")
#else
       bind(C, name="hipsparseXcoosortByRow")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       integer(c_int) :: cooRows(*)
       integer(c_int) :: cooCols(*)
       integer(c_int) :: P(*)
       type(c_ptr), value :: pBuffer
       integer(c_int) :: XcoosortByRow
    end function hipsparseXcoosortByRow

    !---------------------------------------------
    ! hipsparseXcoosortByColumn
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief Sort a sparse COO matrix by column.
    !>
    !> \details
    !> \p hipsparseXcoosortByColumn sorts a matrix in COO format by column. The sorted
    !> permutation vector \p P can be used to obtain the sorted \p cooVal array. In this
    !> case, \p P must be initialized as the identity permutation. See
    !> \ref hipsparseCreateIdentityPermutation(). To apply the permutation vector to the COO
    !> values, see \ref hipsparseSgthr "hipsparseXgthr()".
    !>
    !> \p hipsparseXcoosortByColumn requires an extra temporary storage buffer that must be
    !> allocated by the user. The storage buffer size can be determined by
    !> \ref hipsparseXcoosort_bufferSizeExt().
    !>
    !> \note
    !> \p P can be \p NULL if a sorted permutation vector is not required.
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> @param[in]
    !> handle          handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m               number of rows of the sparse COO matrix.
    !> @param[in]
    !> n               number of columns of the sparse COO matrix.
    !> @param[in]
    !> nnz             number of non-zero entries of the sparse COO matrix.
    !> @param[inout]
    !> cooRows         array of \p nnz elements containing the row indices of the sparse
    !> COO matrix.
    !> @param[inout]
    !> cooCols         array of \p nnz elements containing the column indices of the sparse
    !> COO matrix.
    !> @param[inout]
    !> P               array of \p nnz integers containing the unsorted map indices. Can be
    !> \p NULL.
    !> @param[in]
    !> pBuffer         temporary storage buffer allocated by the user. The size is returned by
    !> \ref hipsparseXcoosort_bufferSizeExt().
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval     HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p n, \p nnz, \p cooRows,
    !> \p cooCols, or \p pBuffer pointer is invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    function hipsparseXcoosortByColumn(handle, m, n, nnz, cooRows, cooCols, P, pBuffer) &
       result(XcoosortByColumn) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseXcoosortByColumn")
#else
       bind(C, name="hipsparseXcoosortByColumn")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       integer(c_int) :: cooRows(*)
       integer(c_int) :: cooCols(*)
       integer(c_int) :: P(*)
       type(c_ptr), value :: pBuffer
       integer(c_int) :: XcoosortByColumn
    end function hipsparseXcoosortByColumn

    !---------------------------------------------
    ! hipsparseCreateIdentityPermutation
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief Create the identity map.
    !>
    !> \details
    !> \p hipsparseCreateIdentityPermutation stores the identity map in \p p, such that
    !> \f$p = 0:1:(n-1)\f$.
    !>
    !> \code{.c}
    !> for(i = 0; i < n; ++i)
    !> {
    !> p[i] = i;
    !> }
    !> \endcode
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> @param[in]
    !> handle      handle to the hipSPASRE library context queue.
    !> @param[in]
    !> n           size of the map \p p.
    !> @param[out]
    !> p           array of \p n integers containing the map.
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval     HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p n, or \p p pointer is invalid.
    function hipsparseCreateIdentityPermutation(handle, n, p) &
       result(CreateIdentityPermutation) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCreateIdentityPermutation")
#else
       bind(C, name="hipsparseCreateIdentityPermutation")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: n
       integer(c_int) :: p(*)
       integer(c_int) :: CreateIdentityPermutation
    end function hipsparseCreateIdentityPermutation

    !---------------------------------------------
    ! hipsparseScsc2dense
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief
    !> \p hipsparseXcsc2dense functions convert the sparse matrix in CSC format into a dense matrix.
    !>
    !> \details
    !> Given the input CSC matrix of size \p mxn, the routine writes the matrix to the dense array
    !> \p A such
    !> that \p A has leading dimension \p ld and is column ordered. This means that \p A has size \p
    !> ldxn where
    !> \p ld>=m. All the parameters are assumed to have been preallocated by the user. If the input
    !> CSC matrix
    !> has index base of one, it must be set in the \ref hipsparseMatDescr_t. See \ref
    !> hipsparseSetMatIndexBase()
    !> prior to calling \p hipsparseXcsc2dense.
    !>
    !> For example, consider the sparse CSC matrix:
    !> \f[
    !> \begin{align}
    !> \text{cscRowInd} &= \begin{bmatrix} 0 & 1 & 2 & 1 & 2 & 0 & 2 \end{bmatrix} \\
    !> \text{cscColPtr} &= \begin{bmatrix} 0 & 3 & 4 & 5 & 7 \end{bmatrix} \\
    !> \text{cscVal} &= \begin{bmatrix} 1 & 3 & 5 & 4 & 6 & 2 & 7 \end{bmatrix} \\
    !> \end{align}
    !> \f]
    !>
    !> \p hipsparseXcsc2dense is used to convert to the dense matrix:
    !> \f[
    !> \begin{bmatrix}
    !> 1 & 0 & 0 & 2 \\
    !> 3 & 4 & 0 & 0 \\
    !> 5 & 0 & 6 & 7
    !> \end{bmatrix}
    !> \f]
    !>
    !> where the values in the \p A array are column ordered:
    !> \f[
    !> \text{A} &= \begin{bmatrix} 1 & 3 & 5 & 0 & 4 & 0 & 0 & 0 & 6 & 2 & 0 & 7 \end{bmatrix} \\
    !> \f]
    !>
    !> \note
    !> This function is executed asynchronously with respect to the host and can return control to
    !> the application
    !> on the host before the entire result is ready.
    !>
    !> \deprecated
    !> This function is deprecated when using the CUDA backend (CUDA 11.0+) and will be
    !> removed in CUDA 12.0. This deprecation does not apply to the ROCm backend.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m           number of rows of the dense matrix \p A. Must be non-negative.
    !> @param[in]
    !> n           number of columns of the dense matrix \p A. Must be non-negative.
    !> @param[in]
    !> descr the descriptor of the dense matrix \p A. The supported matrix type is \ref
    !> HIPSPARSE_MATRIX_TYPE_GENERAL and
    !> any valid value of the \ref hipsparseIndexBase_t.
    !> @param[in]
    !> cscVal array of nnz ( = \p cscColPtr[n] - \p cscColPtr[0] ) non-zero elements of matrix \p A.
    !> @param[in]
    !> cscRowInd integer array of nnz ( = \p cscColPtr[n] - \p cscColPtr[0] ) column indices of the
    !> non-zero elements of matrix \p A.
    !> @param[in]
    !> cscColPtr integer array of \p n+1 elements that contains the start of every column and the
    !> end of the last column plus one.
    !> @param[out]
    !> A           array of dimensions (\p ld, \p n).
    !> @param[in]
    !> ld          leading dimension of dense array \p A. Must be at least \p m.
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p descr, \p cscVal, \p cscColPtr,
    !> \p cscRowInd, or \p A is nullptr, \p m or \p n is negative, or \p ld is invalid.
    function hipsparseScsc2dense(handle, m, n, descr, cscVal, cscRowInd, cscColPtr, A, ld) &
       result(Scsc2dense) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseScsc2dense")
#else
       bind(C, name="hipsparseScsc2dense")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: descr
       real(c_float) :: cscVal(*)
       integer(c_int) :: cscRowInd(*)
       integer(c_int) :: cscColPtr(*)
       real(c_float) :: A(*)
       integer(c_int), value :: ld
       integer(c_int) :: Scsc2dense
    end function hipsparseScsc2dense

    !---------------------------------------------
    ! hipsparseDcsc2dense
    !---------------------------------------------
    function hipsparseDcsc2dense(handle, m, n, descr, cscVal, cscRowInd, cscColPtr, A, ld) &
       result(Dcsc2dense) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDcsc2dense")
#else
       bind(C, name="hipsparseDcsc2dense")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: descr
       real(c_double) :: cscVal(*)
       integer(c_int) :: cscRowInd(*)
       integer(c_int) :: cscColPtr(*)
       real(c_double) :: A(*)
       integer(c_int), value :: ld
       integer(c_int) :: Dcsc2dense
    end function hipsparseDcsc2dense

    !---------------------------------------------
    ! hipsparseCcsc2dense
    !---------------------------------------------
    function hipsparseCcsc2dense(handle, m, n, descr, cscVal, cscRowInd, cscColPtr, A, ld) &
       result(Ccsc2dense) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCcsc2dense")
#else
       bind(C, name="hipsparseCcsc2dense")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: descr
       type(c_ptr), value :: cscVal
       integer(c_int) :: cscRowInd(*)
       integer(c_int) :: cscColPtr(*)
       type(c_ptr), value :: A
       integer(c_int), value :: ld
       integer(c_int) :: Ccsc2dense
    end function hipsparseCcsc2dense

    !---------------------------------------------
    ! hipsparseZcsc2dense
    !---------------------------------------------
    function hipsparseZcsc2dense(handle, m, n, descr, cscVal, cscRowInd, cscColPtr, A, ld) &
       result(Zcsc2dense) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZcsc2dense")
#else
       bind(C, name="hipsparseZcsc2dense")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: descr
       type(c_ptr), value :: cscVal
       integer(c_int) :: cscRowInd(*)
       integer(c_int) :: cscColPtr(*)
       type(c_ptr), value :: A
       integer(c_int), value :: ld
       integer(c_int) :: Zcsc2dense
    end function hipsparseZcsc2dense

    !---------------------------------------------
    ! hipsparseXcscsort_bufferSizeExt
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief Sort a sparse CSC matrix.
    !>
    !> \details
    !> \p hipsparseXcscsort_bufferSizeExt returns the size of the temporary storage buffer
    !> in bytes required by hipsparseXcscsort(). The temporary storage buffer must be
    !> allocated by the user.
    !>
    !> @param[in]
    !> handle              handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m                   number of rows of the sparse CSC matrix.
    !> @param[in]
    !> n                   number of columns of the sparse CSC matrix.
    !> @param[in]
    !> nnz                 number of non-zero entries of the sparse CSC matrix.
    !> @param[in]
    !> cscColPtr           array of \p n+1 elements that point to the start of every column of
    !> the sparse CSC matrix.
    !> @param[in]
    !> cscRowInd           array of \p nnz elements containing the row indices of the sparse
    !> CSC matrix.
    !> @param[out]
    !> pBufferSizeInBytes  number of bytes of the temporary storage buffer required by
    !> \ref hipsparseXcscsort().
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p n, \p nnz, \p cscColPtr, \p
    !> cscRowInd, or
    !> \p pBufferSizeInBytes pointer is invalid.
    function hipsparseXcscsort_bufferSizeExt(handle, m, n, nnz, cscColPtr, cscRowInd, &
                                             pBufferSizeInBytes) &
       result(Xcscsort_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseXcscsort_bufferSizeExt")
#else
       bind(C, name="hipsparseXcscsort_bufferSizeExt")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       integer(c_int) :: cscColPtr(*)
       integer(c_int) :: cscRowInd(*)
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Xcscsort_bufferSizeExt
    end function hipsparseXcscsort_bufferSizeExt

    !---------------------------------------------
    ! hipsparseXcscsort
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief Sort a sparse CSC matrix
    !>
    !> \details
    !> \p hipsparseXcscsort sorts a matrix in CSC format. The sorted permutation vector
    !> \p P can be used to obtain sorted \p cscVal array. In this case, \p P must be
    !> initialized as the identity permutation. See \ref hipsparseCreateIdentityPermutation(). To
    !> apply the permutation vector to the CSC values, see \ref hipsparseSgthr
    !> "hipsparseXgthr()".
    !>
    !> \p hipsparseXcscsort requires extra temporary storage buffer that must be allocated by
    !> the user. The storage buffer size can be determined by \ref
    !> hipsparseXcscsort_bufferSizeExt().
    !>
    !> \note
    !> \p P can be \p NULL if a sorted permutation vector is not required.
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> @param[in]
    !> handle          handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m               number of rows of the sparse CSC matrix.
    !> @param[in]
    !> n               number of columns of the sparse CSC matrix.
    !> @param[in]
    !> nnz             number of non-zero entries of the sparse CSC matrix.
    !> @param[in]
    !> descrA          descriptor of the sparse CSC matrix. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> cscColPtr       array of \p n+1 elements that point to the start of every column of
    !> the sparse CSC matrix.
    !> @param[inout]
    !> cscRowInd       array of \p nnz elements containing the row indices of the sparse
    !> CSC matrix.
    !> @param[inout]
    !> P               array of \p nnz integers containing the unsorted map indices. Can be
    !> \p NULL.
    !> @param[in]
    !> pBuffer         temporary storage buffer allocated by the user. The size is returned by
    !> \ref hipsparseXcscsort_bufferSizeExt().
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p n, \p nnz, \p descrA, \p
    !> cscColPtr,
    !> \p cscRowInd, or \p pBuffer pointer is invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    !> \retval     HIPSPARSE_STATUS_NOT_SUPPORTED
    !> \ref hipsparseMatrixType_t != \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseXcscsort(handle, m, n, nnz, descrA, cscColPtr, cscRowInd, P, pBuffer) &
       result(Xcscsort) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseXcscsort")
#else
       bind(C, name="hipsparseXcscsort")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       integer(c_int) :: cscColPtr(*)
       integer(c_int) :: cscRowInd(*)
       integer(c_int) :: P(*)
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Xcscsort
    end function hipsparseXcscsort

    !---------------------------------------------
    ! hipsparseXcsr2bsrNnz
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief
    !> This function computes the number of non-zero block columns per row and the total number of
    !> non-zero blocks in a sparse
    !> BSR matrix, given a sparse CSR matrix as input.
    !>
    !> \details
    !> Consider the matrix:
    !> \f[
    !> \begin{bmatrix}
    !> 1 & 0 & 0 & 2 \\
    !> 3 & 4 & 0 & 0 \\
    !> 5 & 0 & 6 & 7 \\
    !> 1 & 2 & 3 & 4
    !> \end{bmatrix}
    !> \f]
    !>
    !> stored as a sparse CSR matrix. This function computes both the BSR row pointer array as well
    !> as the total number
    !> of non-zero blocks that results when converting the CSR matrix to the BSR format. Assuming a
    !> block dimension of 2,
    !> the above matrix, after conversion to the BSR format, looks like:
    !>
    !> \f[
    !> \left[
    !> \begin{array}{c | c}
    !> \begin{array}{c c}
    !> 1 & 0 \\
    !> 3 & 4
    !> \end{array} &
    !> \begin{array}{c c}
    !> 0 & 2 \\
    !> 0 & 0
    !> \end{array} \\
    !> \hline
    !> \begin{array}{c c}
    !> 5 & 0 \\
    !> 1 & 2
    !> \end{array} &
    !> \begin{array}{c c}
    !> 6 & 7 \\
    !> 3 & 4
    !> \end{array} \\
    !> \end{array}
    !> \right]
    !> \f]
    !>
    !> and the resulting BSR row pointer array and total non-zero blocks after \p
    !> hipsparseXcsr2bsrNnz has been called
    !> looks like:
    !>
    !> \f[
    !> \begin{align}
    !> \text{bsrRowPtrC} &= \begin{bmatrix} 0 & 2 & 4 \end{bmatrix} \\
    !> \text{bsrNnzb} &= 4
    !> \end{align}
    !> \f]
    !>
    !> In general, when converting a CSR matrix of size \p m x \p n to a BSR matrix, the resulting
    !> BSR matrix will have size
    !> \p mb x \p nb where \p mb and \p nb equal:
    !>
    !> \f[
    !> \begin{align}
    !> \text{mb} &= \text{(m - 1) / blockDim + 1} \\
    !> \text{nb} &= \text{(n - 1) / blockDim + 1}
    !> \end{align}
    !> \f]
    !>
    !> In particular, it can be the case that \p blockDim does not divide evenly into \p m and/or \p
    !> n. In these cases, the
    !> CSR matrix is expanded in size to fit full BSR blocks. For example, using the original CSR
    !> matrix and block
    !> dimension 3 instead of 2, the function \p hipsparseXcsr2bsrNnz computes the BSR row pointer
    !> array and total number of
    !> non-zero blocks for the BSR matrix:
    !>
    !> \f[
    !> \left[
    !> \begin{array}{c | c}
    !> \begin{array}{c c c}
    !> 1 & 0 & 0 \\
    !> 3 & 4 & 0 \\
    !> 5 & 0 & 6
    !> \end{array} &
    !> \begin{array}{c c c}
    !> 2 & 0 & 0 \\
    !> 0 & 0 & 0 \\
    !> 7 & 0 & 0
    !> \end{array} \\
    !> \hline
    !> \begin{array}{c c c}
    !> 1 & 2 & 3 \\
    !> 0 & 0 & 0 \\
    !> 0 & 0 & 0
    !> \end{array} &
    !> \begin{array}{c c c}
    !> 4 & 0 & 0 \\
    !> 0 & 0 & 0 \\
    !> 0 & 0 & 0
    !> \end{array} \\
    !> \end{array}
    !> \right]
    !> \f]
    !>
    !> See hipsparseScsr2bsr() for a full code example.
    !>
    !> \note
    !> The routine supports asynchronous execution if the pointer mode is set to device.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> dirA direction that specifies whether to count non-zero elements by \ref
    !> HIPSPARSE_DIRECTION_ROW or by
    !> \ref HIPSPARSE_DIRECTION_COLUMN.
    !> @param[in]
    !> m           number of rows of the sparse CSR matrix. Must be non-negative.
    !> @param[in]
    !> n           number of columns of the sparse CSR matrix.
    !> @param[in]
    !> descrA descriptor of the sparse CSR matrix. Currently, only \ref
    !> HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> csrRowPtrA integer array containing \p m+1 elements that points to the start of each row of
    !> the CSR matrix.
    !> @param[in]
    !> csrColIndA  integer array of the column indices for each non-zero element in the CSR matrix.
    !> @param[in]
    !> blockDim the block dimension of the BSR matrix, which is between \f$1\f$ and \f$\min(m,
    !> n)\f$.
    !> @param[in]
    !> descrC descriptor of the sparse BSR matrix. Currently, only \ref
    !> HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[out]
    !> bsrRowPtrC integer array containing \p mb+1 elements that point to the start of each block
    !> row of the BSR matrix.
    !> @param[out]
    !> bsrNnzb     total number of non-zero elements in device or host memory.
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p n, \p blockDim, \p csrRowPtrA, \p
    !> csrColIndA,
    !> \p bsrRowPtrC, or \p bsrNnzb pointer is invalid.
    function hipsparseXcsr2bsrNnz(handle, dirA, m, n, descrA, csrRowPtrA, csrColIndA, blockDim, &
                                  descrC, bsrRowPtrC, bsrNnzb) &
       result(Xcsr2bsrNnz) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseXcsr2bsrNnz")
#else
       bind(C, name="hipsparseXcsr2bsrNnz")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: descrA
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: descrC
       integer(c_int) :: bsrRowPtrC(*)
       integer(c_int) :: bsrNnzb(*)
       integer(c_int) :: Xcsr2bsrNnz
    end function hipsparseXcsr2bsrNnz

    !---------------------------------------------
    ! hipsparseScsr2bsr
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief Convert a sparse CSR matrix into a sparse BSR matrix.
    !>
    !> \details
    !> \p hipsparseXcsr2bsr completes the conversion of a CSR matrix into a BSR matrix.
    !> It is assumed that \p bsrValC, \p bsrColIndC, and \p bsrRowPtrC are allocated. The
    !> allocation size for \p bsrRowPtr is computed as \p mb+1, where \p mb is the number of
    !> block rows in the BSR matrix defined as:
    !>
    !> \f[
    !> \begin{align}
    !> \text{mb} &= \text{(m - 1) / blockDim + 1}
    !> \end{align}
    !> \f]
    !>
    !> The allocation size for \p bsrColIndC, that is, \p bsrNnzb, is computed using
    !> \ref hipsparseXcsr2bsrNnz(), which also fills the \p bsrRowPtrC array. The allocation size
    !> for \p bsrValC is then equal to:
    !>
    !> \f[
    !> \text{bsrNnzb * blockDim * blockDim}
    !> \f]
    !>
    !> For example, given the CSR matrix:
    !> \f[
    !> \begin{bmatrix}
    !> 1 & 0 & 0 & 2 \\
    !> 3 & 4 & 0 & 0 \\
    !> 5 & 0 & 6 & 7 \\
    !> 1 & 2 & 3 & 4
    !> \end{bmatrix}
    !> \f]
    !>
    !> The resulting BSR matrix using block dimension 2 would look like:
    !> \f[
    !> \left[
    !> \begin{array}{c | c}
    !> \begin{array}{c c}
    !> 1 & 0 \\
    !> 3 & 4
    !> \end{array} &
    !> \begin{array}{c c}
    !> 0 & 2 \\
    !> 0 & 0
    !> \end{array} \\
    !> \hline
    !> \begin{array}{c c}
    !> 5 & 0 \\
    !> 1 & 2
    !> \end{array} &
    !> \begin{array}{c c}
    !> 6 & 7 \\
    !> 3 & 4
    !> \end{array} \\
    !> \end{array}
    !> \right]
    !> \f]
    !>
    !> The call to \ref hipsparseXcsr2bsrNnz results in the BSR row pointer array:
    !> \f[
    !> \begin{align}
    !> \text{bsrRowPtrC} &= \begin{bmatrix} 0 & 2 & 4 \end{bmatrix} \\
    !> \end{align}
    !> \f]
    !>
    !> and the call to \p hipsparseXcsr2bsr completes the conversion resulting in the BSR column
    !> indices and values arrays:
    !> \f[
    !> \begin{align}
    !> \text{bsrColIndC} &= \begin{bmatrix} 0 & 1 & 0 & 1 \end{bmatrix} \\
    !> \text{bsrValC} &= \begin{bmatrix} 1 & 0 & 3 & 4 & 0 & 2 & 0 & 0 & 5 & 0 & 1 & 2 & 6 & 7 & 3 &
    !> 4 \end{bmatrix} \\
    !> \end{align}
    !> \f]
    !>
    !> The \p dirA parameter determines the order of the BSR block values. The example above uses
    !> row order. Using column ordering
    !> would result instead in the BSR values array:
    !>
    !> \f[
    !> \text{bsrValC} &= \begin{bmatrix} 1 & 3 & 0 & 4 & 0 & 0 & 2 & 0 & 5 & 1 & 0 & 2 & 6 & 3 & 7 &
    !> 4 \end{bmatrix} \\
    !> \f]
    !>
    !> \note
    !> \p hipsparseXcsr2bsr requires extra temporary storage that is allocated internally if
    !> \p blockDim > 16.
    !>
    !> @param[in]
    !> handle       handle to the hipSPARSE library context queue.
    !> @param[in]
    !> dirA the storage format of the blocks, \ref HIPSPARSE_DIRECTION_ROW or \ref
    !> HIPSPARSE_DIRECTION_COLUMN.
    !> @param[in]
    !> m            number of rows in the sparse CSR matrix.
    !> @param[in]
    !> n            number of columns in the sparse CSR matrix.
    !> @param[in]
    !> descrA       descriptor of the sparse CSR matrix. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> csrValA      array of \p nnz elements containing the values of the sparse CSR matrix.
    !> @param[in]
    !> csrRowPtrA   array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix.
    !> @param[in]
    !> csrColIndA   array of \p nnz elements containing the column indices of the sparse CSR matrix.
    !> @param[in]
    !> blockDim     size of the blocks in the sparse BSR matrix.
    !> @param[in]
    !> descrC       descriptor of the sparse BSR matrix. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[out]
    !> bsrValC array of \p nnzb*blockDim*blockDim containing the values of the sparse BSR matrix.
    !> @param[out]
    !> bsrRowPtrC   array of \p mb+1 elements that point to the start of every block row of the
    !> sparse BSR matrix.
    !> @param[out]
    !> bsrColIndC array of \p nnzb elements containing the block column indices of the sparse BSR
    !> matrix.
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p n, \p blockDim, \p bsrValC, \p
    !> bsrRowPtrC,
    !> \p bsrColIndC, \p csrValA, \p csrRowPtrA, or \p csrColIndA pointer is invalid.
    function hipsparseScsr2bsr(handle, dirA, m, n, descrA, csrValA, csrRowPtrA, csrColIndA, &
                               blockDim, descrC, bsrValC, bsrRowPtrC, bsrColIndC) &
       result(Scsr2bsr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseScsr2bsr")
#else
       bind(C, name="hipsparseScsr2bsr")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: descrA
       real(c_float) :: csrValA(*)
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: descrC
       real(c_float) :: bsrValC(*)
       integer(c_int) :: bsrRowPtrC(*)
       integer(c_int) :: bsrColIndC(*)
       integer(c_int) :: Scsr2bsr
    end function hipsparseScsr2bsr

    !---------------------------------------------
    ! hipsparseDcsr2bsr
    !---------------------------------------------
    function hipsparseDcsr2bsr(handle, dirA, m, n, descrA, csrValA, csrRowPtrA, csrColIndA, &
                               blockDim, descrC, bsrValC, bsrRowPtrC, bsrColIndC) &
       result(Dcsr2bsr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDcsr2bsr")
#else
       bind(C, name="hipsparseDcsr2bsr")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: descrA
       real(c_double) :: csrValA(*)
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: descrC
       real(c_double) :: bsrValC(*)
       integer(c_int) :: bsrRowPtrC(*)
       integer(c_int) :: bsrColIndC(*)
       integer(c_int) :: Dcsr2bsr
    end function hipsparseDcsr2bsr

    !---------------------------------------------
    ! hipsparseCcsr2bsr
    !---------------------------------------------
    function hipsparseCcsr2bsr(handle, dirA, m, n, descrA, csrValA, csrRowPtrA, csrColIndA, &
                               blockDim, descrC, bsrValC, bsrRowPtrC, bsrColIndC) &
       result(Ccsr2bsr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCcsr2bsr")
#else
       bind(C, name="hipsparseCcsr2bsr")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrValA
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: descrC
       type(c_ptr), value :: bsrValC
       integer(c_int) :: bsrRowPtrC(*)
       integer(c_int) :: bsrColIndC(*)
       integer(c_int) :: Ccsr2bsr
    end function hipsparseCcsr2bsr

    !---------------------------------------------
    ! hipsparseZcsr2bsr
    !---------------------------------------------
    function hipsparseZcsr2bsr(handle, dirA, m, n, descrA, csrValA, csrRowPtrA, csrColIndA, &
                               blockDim, descrC, bsrValC, bsrRowPtrC, bsrColIndC) &
       result(Zcsr2bsr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZcsr2bsr")
#else
       bind(C, name="hipsparseZcsr2bsr")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrValA
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       integer(c_int), value :: blockDim
       type(c_ptr), value :: descrC
       type(c_ptr), value :: bsrValC
       integer(c_int) :: bsrRowPtrC(*)
       integer(c_int) :: bsrColIndC(*)
       integer(c_int) :: Zcsr2bsr
    end function hipsparseZcsr2bsr

    !---------------------------------------------
    ! hipsparseXcsr2coo
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief Convert a sparse CSR matrix into a sparse COO matrix.
    !>
    !> \details
    !> \p hipsparseXcsr2coo converts the CSR array containing the row offsets that point
    !> to the start of every row into a COO array of row indices. All arrays are assumed
    !> to be allocated by the user prior to calling \p hipsparseXcsr2coo.
    !>
    !> For example, given the CSR row pointer array (assuming zero index base):
    !> \f[
    !> \begin{align}
    !> \text{csrRowPtr} &= \begin{bmatrix} 0 & 1 & 3 & 4 \end{bmatrix}
    !> \end{align}
    !> \f]
    !>
    !> Calling \p hipsparseXcsr2coo results in the COO row indices array:
    !> \f[
    !> \begin{align}
    !> \text{cooRowInd} &= \begin{bmatrix} 0 & 1 & 1 & 2 \end{bmatrix}
    !> \end{align}
    !> \f]
    !>
    !> \note
    !> This function can also be used to convert a CSC array containing the column offsets into a
    !> COO
    !> array of column indices.
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> csrRowPtr   array of \p m+1 elements that point to the start of every row
    !> of the sparse CSR matrix.
    !> @param[in]
    !> nnz         number of non-zero entries of the sparse CSR matrix. Must be non-negative.
    !> @param[in]
    !> m           number of rows of the sparse CSR matrix. Must be non-negative.
    !> @param[out]
    !> cooRowInd   array of \p nnz elements containing the row indices of the sparse COO
    !> matrix.
    !> @param[in]
    !> idxBase     index base. \ref HIPSPARSE_INDEX_BASE_ZERO for zero-based indexing or
    !> \ref HIPSPARSE_INDEX_BASE_ONE for one-based indexing.
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle is nullptr, \p m or, \p nnz is negative,
    !> \p csrRowPtr or \p cooRowInd is nullptr when \p nnz is greater than zero, or
    !> \p idxBase is neither \ref HIPSPARSE_INDEX_BASE_ZERO nor \ref HIPSPARSE_INDEX_BASE_ONE.
    !> \retval HIPSPARSE_STATUS_ARCH_MISMATCH the device is not supported.
    function hipsparseXcsr2coo(handle, csrRowPtr, nnz, m, cooRowInd, idxBase) &
       result(Xcsr2coo) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseXcsr2coo")
#else
       bind(C, name="hipsparseXcsr2coo")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int) :: csrRowPtr(*)
       integer(c_int), value :: nnz
       integer(c_int), value :: m
       integer(c_int) :: cooRowInd(*)
       integer(c_int), value :: idxBase
       integer(c_int) :: Xcsr2coo
    end function hipsparseXcsr2coo

    !---------------------------------------------
    ! hipsparseScsr2csc
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief Convert a sparse CSR matrix into a sparse CSC matrix.
    !>
    !> \details
    !> \p hipsparseXcsr2csc converts a CSR matrix into a CSC matrix. \p hipsparseXcsr2csc
    !> can also be used to convert a CSC matrix into a CSR matrix. \p copyValues decides
    !> whether \p cscSortedVal is being filled during conversion (\ref HIPSPARSE_ACTION_NUMERIC)
    !> or not (\ref HIPSPARSE_ACTION_SYMBOLIC).
    !>
    !> For example given the matrix:
    !> \f[
    !> \begin{bmatrix}
    !> 1 & 0 & 0 & 2 \\
    !> 3 & 4 & 0 & 0 \\
    !> 5 & 0 & 6 & 7
    !> \end{bmatrix}
    !> \f]
    !>
    !> Represented using the sparse CSR format as:
    !> \f[
    !> \begin{align}
    !> \text{csrSortedRowPtr} &= \begin{bmatrix} 0 & 2 & 4 & 7 \end{bmatrix} \\
    !> \text{csrSortedColInd} &= \begin{bmatrix} 0 & 3 & 0 & 1 & 0 & 2 & 3 \end{bmatrix} \\
    !> \text{csrSortedVal} &= \begin{bmatrix} 1 & 2 & 3 & 4 & 5 & 6 & 7 \end{bmatrix}
    !> \end{align}
    !> \f]
    !>
    !> this function converts it to the sparse CSC format:
    !> \f[
    !> \begin{align}
    !> \text{cscSortedRowInd} &= \begin{bmatrix} 0 & 1 & 2 & 1 & 2 & 0 & 2 \end{bmatrix} \\
    !> \text{cscSortedColPtr} &= \begin{bmatrix} 0 & 3 & 4 & 5 & 7 \end{bmatrix} \\
    !> \text{cscSortedVal} &= \begin{bmatrix} 1 & 3 & 5 & 4 & 6 & 2 & 7 \end{bmatrix}
    !> \end{align}
    !> \f]
    !>
    !> The CSC arrays \p cscSortedRowInd, \p cscSortedColPtr, and \p cscSortedVal must be allocated
    !> by the
    !> user prior to calling \p hipsparseXcsr2csc().
    !>
    !> \note
    !> The resulting matrix can also be seen as the transpose of the input matrix.
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> \deprecated
    !> This function is deprecated when using the CUDA backend (CUDA 10.0+) and will be
    !> removed in CUDA 11.0. This deprecation does not apply to the ROCm backend.
    !>
    !> @param[in]
    !> handle          handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m               number of rows of the sparse CSR matrix, which must be non-negative.
    !> @param[in]
    !> n               number of columns of the sparse CSR matrix, which must be non-negative.
    !> @param[in]
    !> nnz number of non-zero entries of the sparse CSR matrix, which must be non-negative.
    !> @param[in]
    !> csrSortedVal    array of \p nnz elements of the sparse CSR matrix.
    !> @param[in]
    !> csrSortedRowPtr array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix.
    !> @param[in]
    !> csrSortedColInd array of \p nnz elements containing the column indices of the sparse
    !> CSR matrix.
    !> @param[out]
    !> cscSortedVal    array of \p nnz elements of the sparse CSC matrix.
    !> @param[out]
    !> cscSortedRowInd array of \p nnz elements containing the row indices of the sparse CSC
    !> matrix.
    !> @param[out]
    !> cscSortedColPtr array of \p n+1 elements that point to the start of every column of the
    !> sparse CSC matrix.
    !> @param[in]
    !> copyValues      \ref HIPSPARSE_ACTION_SYMBOLIC or \ref HIPSPARSE_ACTION_NUMERIC.
    !> @param[in]
    !> idxBase         index base. \ref HIPSPARSE_INDEX_BASE_ZERO for zero-based indexing or
    !> \ref HIPSPARSE_INDEX_BASE_ONE for one-based indexing.
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle is nullptr, \p m, \p n, or \p nnz is
    !> negative,
    !> \p csrSortedVal, \p csrSortedRowPtr, \p csrSortedColInd, \p cscSortedVal, \p cscSortedRowInd,
    !> or \p cscSortedColPtr is nullptr when \p nnz is greater than zero, \p copyValues is neither
    !> \ref HIPSPARSE_ACTION_SYMBOLIC nor \ref HIPSPARSE_ACTION_NUMERIC, or \p idxBase is neither
    !> \ref HIPSPARSE_INDEX_BASE_ZERO nor \ref HIPSPARSE_INDEX_BASE_ONE.
    !> \retval HIPSPARSE_STATUS_ARCH_MISMATCH the device is not supported.
    !> \retval HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    function hipsparseScsr2csc(handle, m, n, nnz, csrSortedVal, csrSortedRowPtr, csrSortedColInd, &
                               cscSortedVal, cscSortedRowInd, cscSortedColPtr, copyValues, &
                               idxBase) &
       result(Scsr2csc) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseScsr2csc")
#else
       bind(C, name="hipsparseScsr2csc")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       real(c_float) :: csrSortedVal(*)
       integer(c_int) :: csrSortedRowPtr(*)
       integer(c_int) :: csrSortedColInd(*)
       real(c_float) :: cscSortedVal(*)
       integer(c_int) :: cscSortedRowInd(*)
       integer(c_int) :: cscSortedColPtr(*)
       integer(c_int), value :: copyValues
       integer(c_int), value :: idxBase
       integer(c_int) :: Scsr2csc
    end function hipsparseScsr2csc

    !---------------------------------------------
    ! hipsparseDcsr2csc
    !---------------------------------------------
    function hipsparseDcsr2csc(handle, m, n, nnz, csrSortedVal, csrSortedRowPtr, csrSortedColInd, &
                               cscSortedVal, cscSortedRowInd, cscSortedColPtr, copyValues, &
                               idxBase) &
       result(Dcsr2csc) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDcsr2csc")
#else
       bind(C, name="hipsparseDcsr2csc")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       real(c_double) :: csrSortedVal(*)
       integer(c_int) :: csrSortedRowPtr(*)
       integer(c_int) :: csrSortedColInd(*)
       real(c_double) :: cscSortedVal(*)
       integer(c_int) :: cscSortedRowInd(*)
       integer(c_int) :: cscSortedColPtr(*)
       integer(c_int), value :: copyValues
       integer(c_int), value :: idxBase
       integer(c_int) :: Dcsr2csc
    end function hipsparseDcsr2csc

    !---------------------------------------------
    ! hipsparseCcsr2csc
    !---------------------------------------------
    function hipsparseCcsr2csc(handle, m, n, nnz, csrSortedVal, csrSortedRowPtr, csrSortedColInd, &
                               cscSortedVal, cscSortedRowInd, cscSortedColPtr, copyValues, &
                               idxBase) &
       result(Ccsr2csc) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCcsr2csc")
#else
       bind(C, name="hipsparseCcsr2csc")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       type(c_ptr), value :: csrSortedVal
       integer(c_int) :: csrSortedRowPtr(*)
       integer(c_int) :: csrSortedColInd(*)
       type(c_ptr), value :: cscSortedVal
       integer(c_int) :: cscSortedRowInd(*)
       integer(c_int) :: cscSortedColPtr(*)
       integer(c_int), value :: copyValues
       integer(c_int), value :: idxBase
       integer(c_int) :: Ccsr2csc
    end function hipsparseCcsr2csc

    !---------------------------------------------
    ! hipsparseZcsr2csc
    !---------------------------------------------
    function hipsparseZcsr2csc(handle, m, n, nnz, csrSortedVal, csrSortedRowPtr, csrSortedColInd, &
                               cscSortedVal, cscSortedRowInd, cscSortedColPtr, copyValues, &
                               idxBase) &
       result(Zcsr2csc) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZcsr2csc")
#else
       bind(C, name="hipsparseZcsr2csc")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       type(c_ptr), value :: csrSortedVal
       integer(c_int) :: csrSortedRowPtr(*)
       integer(c_int) :: csrSortedColInd(*)
       type(c_ptr), value :: cscSortedVal
       integer(c_int) :: cscSortedRowInd(*)
       integer(c_int) :: cscSortedColPtr(*)
       integer(c_int), value :: copyValues
       integer(c_int), value :: idxBase
       integer(c_int) :: Zcsr2csc
    end function hipsparseZcsr2csc

    !---------------------------------------------
    ! hipsparseCsr2cscEx2_bufferSize
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief This function computes the size of the user-allocated temporary storage buffer used
    !> when converting a sparse CSR matrix into a sparse CSC matrix.
    !>
    !> \details
    !> \p hipsparseCsr2cscEx2_bufferSize calculates the required user allocated temporary buffer
    !> needed
    !> by \ref hipsparseCsr2cscEx2 to convert a CSR matrix into a CSC matrix. \ref
    !> hipsparseCsr2cscEx2
    !> can also be used to convert a CSC matrix into a CSR matrix. \p copyValues decides
    !> whether \p cscVal is being filled during conversion (\ref HIPSPARSE_ACTION_NUMERIC)
    !> or not (\ref HIPSPARSE_ACTION_SYMBOLIC).
    !>
    !> \note
    !> The resulting matrix can also be seen as the transpose of the input matrix.
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> @param[in]
    !> handle             handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m                  number of rows of the sparse CSR matrix.
    !> @param[in]
    !> n                  number of columns of the sparse CSR matrix.
    !> @param[in]
    !> nnz                number of non-zero entries of the sparse CSR matrix.
    !> @param[in]
    !> csrVal             array of \p nnz elements of the sparse CSR matrix.
    !> @param[in]
    !> csrRowPtr          array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix.
    !> @param[in]
    !> csrColInd          array of \p nnz elements containing the column indices of the sparse
    !> CSR matrix.
    !> @param[in]
    !> cscVal             array of \p nnz elements of the sparse CSC matrix.
    !> @param[in]
    !> cscColPtr          array of \p n+1 elements that point to the start of every column of the
    !> sparse CSC matrix.
    !> @param[in]
    !> cscRowInd          array of \p nnz elements containing the row indices of the sparse
    !> CSC matrix.
    !> @param[in]
    !> valType The data type of the values arrays \p csrVal and \p cscVal. Can be HIP_R_32F,
    !> HIP_R_64F, HIP_C_32F, or HIP_C_64F.
    !> @param[in]
    !> copyValues         \ref HIPSPARSE_ACTION_SYMBOLIC or \ref HIPSPARSE_ACTION_NUMERIC.
    !> @param[in]
    !> idxBase            \ref HIPSPARSE_INDEX_BASE_ZERO or \ref HIPSPARSE_INDEX_BASE_ONE.
    !> @param[in]
    !> alg HIPSPARSE_CSR2CSC_ALG_DEFAULT, HIPSPARSE_CSR2CSC_ALG1, or HIPSPARSE_CSR2CSC_ALG2.
    !> @param[out]
    !> pBufferSizeInBytes number of bytes of the temporary storage buffer required by
    !> hipsparseCsr2cscEx2().
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p n, \p nnz, \p csrRowPtr, \p
    !> csrColInd, or
    !> \p pBufferSizeInBytes pointer is invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    function hipsparseCsr2cscEx2_bufferSize(handle, m, n, nnz, csrVal, csrRowPtr, csrColInd, &
                                            cscVal, cscColPtr, cscRowInd, valType, copyValues, &
                                            idxBase, alg, pBufferSizeInBytes) &
       result(Csr2cscEx2_bufferSize) &
       bind(C, name="hipsparseCsr2cscEx2_bufferSize")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       type(c_ptr), value :: csrVal
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       type(c_ptr), value :: cscVal
       integer(c_int) :: cscColPtr(*)
       integer(c_int) :: cscRowInd(*)
       integer(c_int), value :: valType
       integer(c_int), value :: copyValues
       integer(c_int), value :: idxBase
       integer(c_int), value :: alg
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Csr2cscEx2_bufferSize
    end function hipsparseCsr2cscEx2_bufferSize

    !---------------------------------------------
    ! hipsparseCsr2cscEx2
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief Convert a sparse CSR matrix into a sparse CSC matrix.
    !>
    !> \details
    !> \p hipsparseCsr2cscEx2 converts a CSR matrix into a CSC matrix. \p hipsparseCsr2cscEx2
    !> can also be used to convert a CSC matrix into a CSR matrix. \p copyValues decides
    !> whether \p cscVal is being filled during conversion (\ref HIPSPARSE_ACTION_NUMERIC)
    !> or not (\ref HIPSPARSE_ACTION_SYMBOLIC).
    !>
    !> \note
    !> The resulting matrix can also be seen as the transpose of the input matrix.
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m           number of rows of the sparse CSR matrix.
    !> @param[in]
    !> n           number of columns of the sparse CSR matrix.
    !> @param[in]
    !> nnz         number of non-zero entries of the sparse CSR matrix.
    !> @param[in]
    !> csrVal      array of \p nnz elements of the sparse CSR matrix.
    !> @param[in]
    !> csrRowPtr   array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix.
    !> @param[in]
    !> csrColInd   array of \p nnz elements containing the column indices of the sparse
    !> CSR matrix.
    !> @param[in]
    !> cscVal      array of \p nnz elements of the sparse CSC matrix.
    !> @param[in]
    !> cscColPtr   array of \p n+1 elements that point to the start of every column of the
    !> sparse CSC matrix.
    !> @param[in]
    !> cscRowInd   array of \p nnz elements containing the row indices of the sparse
    !> CSC matrix.
    !> @param[in]
    !> valType     The data type of the values arrays \p csrVal and \p cscVal. Can be HIP_R_32F,
    !> HIP_R_64F, HIP_C_32F, or HIP_C_64F.
    !> @param[in]
    !> copyValues  \ref HIPSPARSE_ACTION_SYMBOLIC or \ref HIPSPARSE_ACTION_NUMERIC.
    !> @param[in]
    !> idxBase     \ref HIPSPARSE_INDEX_BASE_ZERO or \ref HIPSPARSE_INDEX_BASE_ONE.
    !> @param[in]
    !> alg         HIPSPARSE_CSR2CSC_ALG_DEFAULT, HIPSPARSE_CSR2CSC_ALG1 or HIPSPARSE_CSR2CSC_ALG2.
    !> @param[in]
    !> buffer      temporary storage buffer allocated by the user. The size is returned by
    !> hipsparseCsr2cscEx2_bufferSize().
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p n, \p nnz, \p csrRowPtr, \p
    !> csrColInd, or
    !> \p pBufferSizeInBytes pointer is invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    function hipsparseCsr2cscEx2(handle, m, n, nnz, csrVal, csrRowPtr, csrColInd, cscVal, &
                                 cscColPtr, cscRowInd, valType, copyValues, idxBase, alg, buffer) &
       result(Csr2cscEx2) &
       bind(C, name="hipsparseCsr2cscEx2")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       type(c_ptr), value :: csrVal
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       type(c_ptr), value :: cscVal
       integer(c_int) :: cscColPtr(*)
       integer(c_int) :: cscRowInd(*)
       integer(c_int), value :: valType
       integer(c_int), value :: copyValues
       integer(c_int), value :: idxBase
       integer(c_int), value :: alg
       type(c_ptr), value :: buffer
       integer(c_int) :: Csr2cscEx2
    end function hipsparseCsr2cscEx2

    !---------------------------------------------
    ! hipsparseScsr2csr_compress
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief Convert a sparse CSR matrix into a compressed sparse CSR matrix.
    !>
    !> \details
    !> \p hipsparseXcsr2csr_compress converts a CSR matrix into a compressed CSR matrix by
    !> removing entries in the input CSR matrix that are below a non-negative threshold \p tol:
    !>
    !> \f[
    !> C(i,j) = A(i, j) \text{  if |A(i, j)| > tol}
    !> \f]
    !>
    !> The user must first call \ref hipsparseSnnz_compress "hipsparseXnnz_compress()" to determine
    !> the number
    !> of non-zeros per row as well as the total number of non-zeros that will exist in resulting
    !> compressed CSR
    !> matrix. The user then uses this information to allocate the column indices array \p
    !> csrColIndC and the
    !> values array \p csrValC. The user then calls \p hipsparseXcsr2csr_compress to complete the
    !> conversion.
    !>
    !> \note
    !> In the case of complex matrices, only the magnitude of the real part of \p tol is used.
    !>
    !> @param[in]
    !> handle        handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m             number of rows of the sparse CSR matrix.
    !> @param[in]
    !> n             number of columns of the sparse CSR matrix.
    !> @param[in]
    !> descrA        matrix descriptor for the CSR matrix.
    !> @param[in]
    !> csrValA       array of \p nnzA elements of the sparse CSR matrix.
    !> @param[in]
    !> csrRowPtrA    array of \p m+1 elements that point to the start of every row of the
    !> uncompressed sparse CSR matrix.
    !> @param[in]
    !> csrColIndA    array of \p nnzA elements containing the column indices of the uncompressed
    !> sparse CSR matrix.
    !> @param[in]
    !> nnzA          number of elements in the column indices and values arrays of the uncompressed
    !> sparse CSR matrix.
    !> @param[in]
    !> nnzPerRow array of length \p m containing the number of entries that will be kept per row in
    !> the final compressed CSR matrix.
    !> @param[out]
    !> csrValC       array of \p nnzC elements of the compressed sparse CSC matrix.
    !> @param[out]
    !> csrRowPtrC array of \p m+1 elements that point to the start of every column of the compressed
    !> sparse CSR matrix.
    !> @param[out]
    !> csrColIndC    array of \p nnzC elements containing the row indices of the compressed
    !> sparse CSR matrix.
    !> @param[in]
    !> tol the non-negative tolerance used for compression. If \p tol is complex, then only the
    !> magnitude
    !> of the real part is used. Entries in the input uncompressed CSR array that are below the
    !> tolerance
    !> are removed in the output compressed CSR matrix.
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p n, \p nnzA, \p tol, \p csrValA, \p
    !> csrRowPtrA,
    !> \p csrColIndA, \p csrValC, \p csrRowPtrC, \p csrColIndC, or \p nnzPerRow pointer is invalid.
    function hipsparseScsr2csr_compress(handle, m, n, descrA, csrValA, csrColIndA, csrRowPtrA, &
                                        nnzA, nnzPerRow, csrValC, csrColIndC, csrRowPtrC, tol) &
       result(Scsr2csr_compress) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseScsr2csr_compress")
#else
       bind(C, name="hipsparseScsr2csr_compress")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: descrA
       real(c_float) :: csrValA(*)
       integer(c_int) :: csrColIndA(*)
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int), value :: nnzA
       integer(c_int) :: nnzPerRow(*)
       real(c_float) :: csrValC(*)
       integer(c_int) :: csrColIndC(*)
       integer(c_int) :: csrRowPtrC(*)
       real(c_float), value :: tol
       integer(c_int) :: Scsr2csr_compress
    end function hipsparseScsr2csr_compress

    !---------------------------------------------
    ! hipsparseDcsr2csr_compress
    !---------------------------------------------
    function hipsparseDcsr2csr_compress(handle, m, n, descrA, csrValA, csrColIndA, csrRowPtrA, &
                                        nnzA, nnzPerRow, csrValC, csrColIndC, csrRowPtrC, tol) &
       result(Dcsr2csr_compress) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDcsr2csr_compress")
#else
       bind(C, name="hipsparseDcsr2csr_compress")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: descrA
       real(c_double) :: csrValA(*)
       integer(c_int) :: csrColIndA(*)
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int), value :: nnzA
       integer(c_int) :: nnzPerRow(*)
       real(c_double) :: csrValC(*)
       integer(c_int) :: csrColIndC(*)
       integer(c_int) :: csrRowPtrC(*)
       real(c_double), value :: tol
       integer(c_int) :: Dcsr2csr_compress
    end function hipsparseDcsr2csr_compress

    !---------------------------------------------
    ! hipsparseCcsr2csr_compress
    !---------------------------------------------
    function hipsparseCcsr2csr_compress(handle, m, n, descrA, csrValA, csrColIndA, csrRowPtrA, &
                                        nnzA, nnzPerRow, csrValC, csrColIndC, csrRowPtrC, tol) &
       result(Ccsr2csr_compress) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCcsr2csr_compress")
#else
       bind(C, name="hipsparseCcsr2csr_compress")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrValA
       integer(c_int) :: csrColIndA(*)
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int), value :: nnzA
       integer(c_int) :: nnzPerRow(*)
       type(c_ptr), value :: csrValC
       integer(c_int) :: csrColIndC(*)
       integer(c_int) :: csrRowPtrC(*)
       type(c_ptr), value :: tol
       integer(c_int) :: Ccsr2csr_compress
    end function hipsparseCcsr2csr_compress

    !---------------------------------------------
    ! hipsparseZcsr2csr_compress
    !---------------------------------------------
    function hipsparseZcsr2csr_compress(handle, m, n, descrA, csrValA, csrColIndA, csrRowPtrA, &
                                        nnzA, nnzPerRow, csrValC, csrColIndC, csrRowPtrC, tol) &
       result(Zcsr2csr_compress) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZcsr2csr_compress")
#else
       bind(C, name="hipsparseZcsr2csr_compress")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrValA
       integer(c_int) :: csrColIndA(*)
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int), value :: nnzA
       integer(c_int) :: nnzPerRow(*)
       type(c_ptr), value :: csrValC
       integer(c_int) :: csrColIndC(*)
       integer(c_int) :: csrRowPtrC(*)
       type(c_ptr), value :: tol
       integer(c_int) :: Zcsr2csr_compress
    end function hipsparseZcsr2csr_compress

    !---------------------------------------------
    ! hipsparseScsr2csru
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief
    !> This function converts the sorted CSR format to the unsorted CSR format. The required
    !> temporary storage has to be allocated by the user.
    function hipsparseScsr2csru(handle, m, n, nnz, descrA, csrVal, csrRowPtr, csrColInd, info, &
                                pBuffer) &
       result(Scsr2csru) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseScsr2csru")
#else
       bind(C, name="hipsparseScsr2csru")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       real(c_float) :: csrVal(*)
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Scsr2csru
    end function hipsparseScsr2csru

    !---------------------------------------------
    ! hipsparseDcsr2csru
    !---------------------------------------------
    function hipsparseDcsr2csru(handle, m, n, nnz, descrA, csrVal, csrRowPtr, csrColInd, info, &
                                pBuffer) &
       result(Dcsr2csru) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDcsr2csru")
#else
       bind(C, name="hipsparseDcsr2csru")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       real(c_double) :: csrVal(*)
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Dcsr2csru
    end function hipsparseDcsr2csru

    !---------------------------------------------
    ! hipsparseCcsr2csru
    !---------------------------------------------
    function hipsparseCcsr2csru(handle, m, n, nnz, descrA, csrVal, csrRowPtr, csrColInd, info, &
                                pBuffer) &
       result(Ccsr2csru) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCcsr2csru")
#else
       bind(C, name="hipsparseCcsr2csru")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrVal
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Ccsr2csru
    end function hipsparseCcsr2csru

    !---------------------------------------------
    ! hipsparseZcsr2csru
    !---------------------------------------------
    function hipsparseZcsr2csru(handle, m, n, nnz, descrA, csrVal, csrRowPtr, csrColInd, info, &
                                pBuffer) &
       result(Zcsr2csru) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZcsr2csru")
#else
       bind(C, name="hipsparseZcsr2csru")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrVal
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Zcsr2csru
    end function hipsparseZcsr2csru

    !---------------------------------------------
    ! hipsparseScsr2dense
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief
    !> \p hipsparseXcsr2dense functions convert the sparse matrix in CSR format into a dense matrix.
    !>
    !> \details
    !> Given the input CSR matrix of size \p mxn, the routine writes the matrix to the dense array
    !> \p A such
    !> that \p A has leading dimension \p ld and is column ordered. This means that \p A has size \p
    !> ldxn where
    !> \p ld>=m. All the parameters are assumed to have been preallocated by the user. If the input
    !> CSR matrix
    !> has index base of one, it must be set in the \ref hipsparseMatDescr_t. See \ref
    !> hipsparseSetMatIndexBase()
    !> prior to calling \p hipsparseXcsr2dense.
    !>
    !> For example, consider the sparse CSR matrix:
    !> \f[
    !> \begin{align}
    !> \text{csrRowPtr} &= \begin{bmatrix} 0 & 2 & 4 & 7 \end{bmatrix} \\
    !> \text{csrColInd} &= \begin{bmatrix} 0 & 3 & 0 & 1 & 0 & 2 & 3 \end{bmatrix} \\
    !> \text{csrVal} &= \begin{bmatrix} 1 & 2 & 3 & 4 & 5 & 6 & 7 \end{bmatrix} \\
    !> \end{align}
    !> \f]
    !>
    !> \p hipsparseXcsr2dense is used to convert to the dense matrix:
    !> \f[
    !> \begin{bmatrix}
    !> 1 & 0 & 0 & 2 \\
    !> 3 & 4 & 0 & 0 \\
    !> 5 & 0 & 6 & 7
    !> \end{bmatrix}
    !> \f]
    !>
    !> where the values in the \p A array are column ordered:
    !> \f[
    !> \text{A} &= \begin{bmatrix} 1 & 3 & 5 & 0 & 4 & 0 & 0 & 0 & 6 & 2 & 0 & 7 \end{bmatrix} \\
    !> \f]
    !>
    !> \note
    !> This function is executed asynchronously with respect to the host and can return control to
    !> the application
    !> on the host before the entire result is ready.
    !>
    !> \deprecated
    !> This function is deprecated when using the CUDA backend (CUDA 11.0+) and will be
    !> removed in CUDA 12.0. This deprecation does not apply to the ROCm backend.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m           number of rows of the dense matrix \p A. Must be non-negative.
    !> @param[in]
    !> n           number of columns of the dense matrix \p A. Must be non-negative.
    !> @param[in]
    !> descr the descriptor of the dense matrix \p A, the supported matrix type is \ref
    !> HIPSPARSE_MATRIX_TYPE_GENERAL and
    !> any valid value of the \ref hipsparseIndexBase_t.
    !> @param[in]
    !> csrVal array of nnz ( = \p csrRowPtr[m] - \p csrRowPtr[0] ) non-zero elements of matrix \p A.
    !> @param[in]
    !> csrRowPtr integer array of \p m+1 elements that contains the start of every row and the end
    !> of the last row plus one.
    !> @param[in]
    !> csrColInd integer array of nnz ( = \p csrRowPtr[m] - \p csrRowPtr[0] ) column indices of the
    !> non-zero elements of matrix \p A.
    !> @param[out]
    !> A           array of dimensions (\p ld, \p n).
    !> @param[in]
    !> ld          leading dimension of dense array \p A. Must be at least \p m.
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p descr, \p csrVal, \p csrRowPtr,
    !> \p csrColInd, or \p A is nullptr, \p m or \p n is negative, or \p ld is invalid.
    function hipsparseScsr2dense(handle, m, n, descr, csrVal, csrRowPtr, csrColInd, A, ld) &
       result(Scsr2dense) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseScsr2dense")
#else
       bind(C, name="hipsparseScsr2dense")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: descr
       real(c_float) :: csrVal(*)
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       real(c_float) :: A(*)
       integer(c_int), value :: ld
       integer(c_int) :: Scsr2dense
    end function hipsparseScsr2dense

    !---------------------------------------------
    ! hipsparseDcsr2dense
    !---------------------------------------------
    function hipsparseDcsr2dense(handle, m, n, descr, csrVal, csrRowPtr, csrColInd, A, ld) &
       result(Dcsr2dense) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDcsr2dense")
#else
       bind(C, name="hipsparseDcsr2dense")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: descr
       real(c_double) :: csrVal(*)
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       real(c_double) :: A(*)
       integer(c_int), value :: ld
       integer(c_int) :: Dcsr2dense
    end function hipsparseDcsr2dense

    !---------------------------------------------
    ! hipsparseCcsr2dense
    !---------------------------------------------
    function hipsparseCcsr2dense(handle, m, n, descr, csrVal, csrRowPtr, csrColInd, A, ld) &
       result(Ccsr2dense) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCcsr2dense")
#else
       bind(C, name="hipsparseCcsr2dense")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: descr
       type(c_ptr), value :: csrVal
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       type(c_ptr), value :: A
       integer(c_int), value :: ld
       integer(c_int) :: Ccsr2dense
    end function hipsparseCcsr2dense

    !---------------------------------------------
    ! hipsparseZcsr2dense
    !---------------------------------------------
    function hipsparseZcsr2dense(handle, m, n, descr, csrVal, csrRowPtr, csrColInd, A, ld) &
       result(Zcsr2dense) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZcsr2dense")
#else
       bind(C, name="hipsparseZcsr2dense")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: descr
       type(c_ptr), value :: csrVal
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       type(c_ptr), value :: A
       integer(c_int), value :: ld
       integer(c_int) :: Zcsr2dense
    end function hipsparseZcsr2dense

    !---------------------------------------------
    ! hipsparseScsr2gebsr_bufferSize
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief Convert a sparse CSR matrix into a sparse GEBSR matrix.
    !>
    !> \details
    !> \p hipsparseXcsr2gebsr_bufferSize returns the size of the temporary buffer that
    !> is required by \ref hipsparseXcsr2gebsrNnz and \ref hipsparseScsr2gebsr
    !> "hipsparseXcsr2gebsr()".
    !> After the temporary buffer size has been determined, it must be allocated by the user prior
    !> to calling \ref hipsparseXcsr2gebsrNnz and \ref hipsparseScsr2gebsr "hipsparseXcsr2gebsr()".
    !>
    !> See hipsparseScsr2gebsr() for a complete code example.
    !>
    !> \note
    !> The routine supports asynchronous execution if the pointer mode is set to device.
    !>
    !> @param[in]
    !> handle             handle to the hipSPARSE library context queue.
    !> @param[in]
    !> dir direction that specifies whether to count non-zero elements by \ref
    !> HIPSPARSE_DIRECTION_ROW
    !> or by \ref HIPSPARSE_DIRECTION_COLUMN.
    !> @param[in]
    !> m                  number of rows of the sparse CSR matrix.
    !> @param[in]
    !> n                  number of columns of the sparse CSR matrix.
    !> @param[in]
    !> csr_descr          descriptor of the sparse CSR matrix. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> csrVal             array of \p nnz elements containing the values of the sparse CSR matrix.
    !> @param[in]
    !> csrRowPtr integer array containing \p m+1 elements that point to the start of each row of the
    !> CSR matrix.
    !> @param[in]
    !> csrColInd integer array of the column indices for each non-zero element in the CSR matrix.
    !> @param[in]
    !> rowBlockDim        the row block dimension of the general BSR matrix. Between 1 and \p m.
    !> @param[in]
    !> colBlockDim        the col block dimension of the general BSR matrix. Between 1 and \p n.
    !> @param[out]
    !> pBufferSizeInBytes number of bytes of the temporary storage buffer required by \ref
    !> hipsparseXcsr2gebsrNnz()
    !> and \ref hipsparseScsr2gebsr "hipsparseXcsr2gebsr()".
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p n, \p rowBlockDim, \p colBlockDim,
    !> \p csrVal,
    !> \p csrRowPtr, \p csrColInd, or \p pBufferSizeInBytes pointer is invalid.
    function hipsparseScsr2gebsr_bufferSize(handle, dir, m, n, csr_descr, csrVal, csrRowPtr, &
                                            csrColInd, rowBlockDim, colBlockDim, &
                                            pBufferSizeInBytes) &
       result(Scsr2gebsr_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseScsr2gebsr_bufferSize")
#else
       bind(C, name="hipsparseScsr2gebsr_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: dir
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: csr_descr
       real(c_float) :: csrVal(*)
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       integer(c_int), value :: rowBlockDim
       integer(c_int), value :: colBlockDim
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Scsr2gebsr_bufferSize
    end function hipsparseScsr2gebsr_bufferSize

    !---------------------------------------------
    ! hipsparseDcsr2gebsr_bufferSize
    !---------------------------------------------
    function hipsparseDcsr2gebsr_bufferSize(handle, dir, m, n, csr_descr, csrVal, csrRowPtr, &
                                            csrColInd, rowBlockDim, colBlockDim, &
                                            pBufferSizeInBytes) &
       result(Dcsr2gebsr_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDcsr2gebsr_bufferSize")
#else
       bind(C, name="hipsparseDcsr2gebsr_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: dir
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: csr_descr
       real(c_double) :: csrVal(*)
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       integer(c_int), value :: rowBlockDim
       integer(c_int), value :: colBlockDim
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Dcsr2gebsr_bufferSize
    end function hipsparseDcsr2gebsr_bufferSize

    !---------------------------------------------
    ! hipsparseCcsr2gebsr_bufferSize
    !---------------------------------------------
    function hipsparseCcsr2gebsr_bufferSize(handle, dir, m, n, csr_descr, csrVal, csrRowPtr, &
                                            csrColInd, rowBlockDim, colBlockDim, &
                                            pBufferSizeInBytes) &
       result(Ccsr2gebsr_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCcsr2gebsr_bufferSize")
#else
       bind(C, name="hipsparseCcsr2gebsr_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dir
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: csr_descr
       type(c_ptr), value :: csrVal
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       integer(c_int), value :: rowBlockDim
       integer(c_int), value :: colBlockDim
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Ccsr2gebsr_bufferSize
    end function hipsparseCcsr2gebsr_bufferSize

    !---------------------------------------------
    ! hipsparseZcsr2gebsr_bufferSize
    !---------------------------------------------
    function hipsparseZcsr2gebsr_bufferSize(handle, dir, m, n, csr_descr, csrVal, csrRowPtr, &
                                            csrColInd, rowBlockDim, colBlockDim, &
                                            pBufferSizeInBytes) &
       result(Zcsr2gebsr_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZcsr2gebsr_bufferSize")
#else
       bind(C, name="hipsparseZcsr2gebsr_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dir
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: csr_descr
       type(c_ptr), value :: csrVal
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       integer(c_int), value :: rowBlockDim
       integer(c_int), value :: colBlockDim
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Zcsr2gebsr_bufferSize
    end function hipsparseZcsr2gebsr_bufferSize

    !---------------------------------------------
    ! hipsparseXcsr2gebsrNnz
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief
    !> This function computes the number of non-zero block columns per row and the total number of
    !> non-zero blocks in a sparse
    !> GEBSR matrix given a sparse CSR matrix as input.
    !>
    !> \details
    !> This is the second step in converting a CSR matrix to a GEBSR matrix. The user must first
    !> call
    !> \ref hipsparseScsr2gebsr_bufferSize "hipsparseXcsr2gebsr_bufferSize()" to determine the size
    !> of
    !> the required temporary storage buffer. The user then allocates this buffer as well as the
    !> \p bsrRowPtr array ( size \p mb+1 ) and passes both to \p hipsparseXcsr2gebsrNnz(). This
    !> second
    !> step then computes the number of non-zero block columns per row and the total number of
    !> non-zero blocks.
    !>
    !> In general, when converting a CSR matrix of size \p m x \p n to a GEBSR matrix, the resulting
    !> GEBSR matrix will have size
    !> \p mb x \p nb, where \p mb and \p nb equal:
    !> \f[
    !> \begin{align}
    !> \text{mb} &= \text{(m - 1) / rowBlockDim + 1} \\
    !> \text{nb} &= \text{(n - 1) / colBlockDim + 1}
    !> \end{align}
    !> \f]
    !>
    !> For example, given a matrix:
    !> \f[
    !> \begin{bmatrix}
    !> 1 & 0 & 0 & 2 & 4 & 0 \\
    !> 3 & 4 & 0 & 0 & 5 & 1 \\
    !> 5 & 0 & 6 & 7 & 6 & 2
    !> \end{bmatrix}
    !> \f]
    !>
    !> represented in CSR format with the arrays:
    !> \f[
    !> \begin{align}
    !> \text{csrRowPtr} &= \begin{bmatrix} 0 & 3 & 7 & 12 \end{bmatrix} \\
    !> \text{csrColInd} &= \begin{bmatrix} 0 & 3 & 4 & 0 & 1 & 4 & 5 & 0 & 2 & 3 & 4 & 5
    !> \end{bmatrix} \\
    !> \text{csrVal} &= \begin{bmatrix} 1 & 2 & 4 & 3 & 4 & 5 & 1 & 5 & 6 & 7 & 6 & 2 \end{bmatrix}
    !> \end{align}
    !> \f]
    !>
    !> the \p bsrRowPtr array and total non-zero block count will be filled with:
    !> \f[
    !> \begin{align}
    !> \text{bsrRowPtr} &= \begin{bmatrix} 0 & 3 \end{bmatrix} \\
    !> \text{*bsrNnzDevhost} &= 3
    !> \end{align}
    !> \f]
    !>
    !> after calling \p hipsparseXcsr2gebsrNnz with \p rowBlockDim=3 and \p colBlockDim=2.
    !>
    !> \note
    !> As indicated, \p bsrNnzDevhost can point either to host or device memory. This is controlled
    !> by setting the pointer mode. See \ref hipsparseSetPointerMode().
    !>
    !> It might be the case that \p rowBlockDim does not divide evenly into \p m and/or that \p
    !> colBlockDim does not divide
    !> evenly into \p n. In these cases, the CSR matrix is expanded in size to fit full GEBSR
    !> blocks. For example,
    !> using the original CSR matrix but this time with \p rowBlockDim=2 and \p colBlockDim=3, the
    !> function
    !> \p hipsparseXcsr2gebsrNnz computes the GEBSR row pointer array and total number of non-zero
    !> blocks for the GEBSR matrix:
    !>
    !> \f[
    !> \left[
    !> \begin{array}{c | c}
    !> \begin{array}{c c c}
    !> 1 & 0 & 0 \\
    !> 3 & 4 & 0
    !> \end{array} &
    !> \begin{array}{c c c}
    !> 2 & 4 & 0 \\
    !> 0 & 5 & 1
    !> \end{array} \\
    !> \hline
    !> \begin{array}{c c c}
    !> 5 & 0 & 6 \\
    !> 0 & 0 & 0
    !> \end{array} &
    !> \begin{array}{c c c}
    !> 7 & 6 & 2 \\
    !> 0 & 0 & 0
    !> \end{array}
    !> \end{array}
    !> \right]
    !> \f]
    !>
    !> See hipsparseScsr2gebsr() for a full code example.
    !>
    !> @param[in]
    !> handle        handle to the hipSPARSE library context queue.
    !> @param[in]
    !> dir direction that specifies whether to count non-zero elements by \ref
    !> HIPSPARSE_DIRECTION_ROW or by
    !> \ref HIPSPARSE_DIRECTION_COLUMN.
    !> @param[in]
    !> m             number of rows of the sparse CSR matrix.
    !> @param[in]
    !> n             number of columns of the sparse CSR matrix.
    !> @param[in]
    !> csr_descr     descriptor of the sparse CSR matrix. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> csrRowPtr integer array containing \p m+1 elements that point to the start of each row of the
    !> CSR matrix.
    !> @param[in]
    !> csrColInd integer array of the column indices for each non-zero element in the CSR matrix.
    !> @param[in]
    !> bsr_descr     descriptor of the sparse general BSR matrix. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[out]
    !> bsrRowPtr integer array containing \p mb+1 elements that point to the start of each block row
    !> of the general BSR matrix.
    !>
    !> @param[in]
    !> rowBlockDim the row block dimension of the general BSR matrix, which is between \f$1\f$ and
    !> \f$\min(m, n)\f$.
    !>
    !> @param[in]
    !> colBlockDim the col block dimension of the general BSR matrix, which is between \f$1\f$ and
    !> \f$\min(m, n)\f$.
    !>
    !> @param[out]
    !> bsrNnzDevhost total number of non-zero elements in device or host memory.
    !>
    !> @param[in]
    !> pbuffer buffer allocated by the user whose size is determined by calling \ref
    !> hipsparseScsr2gebsr_bufferSize
    !> "hipsparseXcsr2gebsr_bufferSize()".
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p n, \p rowBlockDim, \p colBlockDim,
    !> \p csrRowPtr,
    !> \p csrColInd, \p bsrRowPtr, or \p bsrNnzDevhost pointer is invalid.
    function hipsparseXcsr2gebsrNnz(handle, dir, m, n, csr_descr, csrRowPtr, csrColInd, bsr_descr, &
                                    bsrRowPtr, rowBlockDim, colBlockDim, bsrNnzDevhost, pbuffer) &
       result(Xcsr2gebsrNnz) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseXcsr2gebsrNnz")
#else
       bind(C, name="hipsparseXcsr2gebsrNnz")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dir
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: csr_descr
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       type(c_ptr), value :: bsr_descr
       integer(c_int) :: bsrRowPtr(*)
       integer(c_int), value :: rowBlockDim
       integer(c_int), value :: colBlockDim
       integer(c_int) :: bsrNnzDevhost(*)
       type(c_ptr), value :: pbuffer
       integer(c_int) :: Xcsr2gebsrNnz
    end function hipsparseXcsr2gebsrNnz

    !---------------------------------------------
    ! hipsparseScsr2gebsr
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief Convert a sparse CSR matrix into a sparse GEBSR matrix.
    !>
    !> \details
    !> \p hipsparseXcsr2gebsr converts a CSR matrix into a GEBSR matrix. It is assumed
    !> that \p bsrVal, \p bsrColInd, and \p bsrRowPtr are allocated. Allocation size
    !> for \p bsrRowPtr is computed as \p mb+1, where \p mb is the number of block rows in
    !> the GEBSR matrix. The number of non-zero blocks in the resulting GEBSR matrix
    !> is computed using \ref hipsparseXcsr2gebsrNnz, which also fills in \p bsrRowPtr.
    !>
    !> In more detail, \p hipsparseXcsr2gebsr is the third and final step of the conversion from CSR
    !> to GEBSR.
    !> The user first determines the size of the required user-allocated temporary storage buffer
    !> using
    !> \ref hipsparseScsr2gebsr_bufferSize "hipsparseXcsr2gebsr_bufferSize()". The user then
    !> allocates this buffer
    !> as well as the row pointer array \p bsrRowPtr with size \p mb+1, where \p mb is the number of
    !> block rows
    !> in the GEBSR matrix and \p nb is the number of block columns in GEBSR matrix:
    !>
    !> \f[
    !> \begin{align}
    !> \text{mb} &= \text{(m - 1) / rowBlockDim + 1} \\
    !> \text{nb} &= \text{(n - 1) / colBlockDim + 1}
    !> \end{align}
    !> \f]
    !>
    !> Both the temporary storage buffer and the GEBSR row pointer array are then passed to \ref
    !> hipsparseXcsr2gebsrNnz,
    !> which fills the GEBSR row pointer array \p bsrRowPtr and also computes the number of non-zero
    !> blocks,
    !> \p bsrNnzDevhost, that will exist in the GEBSR matrix. The user then allocates both the GEBSR
    !> column indices array
    !> \p bsrColInd with size \p bsrNnzDevhost as well as the GEBSR values array \p bsrVal with size
    !> \p bsrNnzDevhost*rowBlockDim*colBlockDim. Finally, with all arrays allocated, the conversion
    !> is completed by calling
    !> \p hipsparseXcsr2gebsr.
    !>
    !> For example, assuming the matrix:
    !> \f[
    !> \begin{bmatrix}
    !> 1 & 0 & 0 & 2 & 4 & 0 \\
    !> 3 & 4 & 0 & 0 & 5 & 1 \\
    !> 5 & 0 & 6 & 7 & 6 & 2
    !> \end{bmatrix}
    !> \f]
    !>
    !> represented in CSR format with the arrays:
    !> \f[
    !> \begin{align}
    !> \text{csrRowPtr} &= \begin{bmatrix} 0 & 3 & 7 & 12 \end{bmatrix} \\
    !> \text{csrColInd} &= \begin{bmatrix} 0 & 3 & 4 & 0 & 1 & 4 & 5 & 0 & 2 & 3 & 4 & 5
    !> \end{bmatrix} \\
    !> \text{csrVal} &= \begin{bmatrix} 1 & 2 & 4 & 3 & 4 & 5 & 1 & 5 & 6 & 7 & 6 & 2 \end{bmatrix}
    !> \end{align}
    !> \f]
    !>
    !> then using \p rowBlockDim=3 and \p colBlockDim=2, the final GEBSR matrix is:
    !> \f[
    !> \left[
    !> \begin{array}{c | c}
    !> \begin{array}{c c}
    !> 1 & 0 \\
    !> 3 & 4 \\
    !> 3 & 0
    !> \end{array} &
    !> \begin{array}{c c}
    !> 0 & 2 \\
    !> 0 & 0 \\
    !> 6 & 7
    !> \end{array} &
    !> \begin{array}{c c}
    !> 4 & 0 \\
    !> 5 & 1 \\
    !> 6 & 2
    !> \end{array}
    !> \end{array}
    !> \right]
    !> \f]
    !>
    !> and is represented with the arrays:
    !> \f[
    !> \begin{align}
    !> \text{bsrRowPtr} &= \begin{bmatrix} 0 & 3 \end{bmatrix} \\
    !> \text{bsrColInd} &= \begin{bmatrix} 0 & 1 & 2 \end{bmatrix} \\
    !> \text{bsrVal} &= \begin{bmatrix} 1 & 0 & 3 & 4 & 3 & 0 & 0 & 2 & 0 & 0 & 6 & 7 & 4 & 0 & 5 &
    !> 1 & 6 & 2 \end{bmatrix}
    !> \end{align}
    !> \f]
    !>
    !> The above example assumes that the blocks are row ordered. If instead the blocks are column
    !> ordered, the \p bsrVal arrays
    !> become:
    !> \f[
    !> \begin{align}
    !> \text{bsrVal} &= \begin{bmatrix} 1 & 3 & 3 & 0 & 4 & 0 & 0 & 0 & 6 & 2 & 0 & 7 & 4 & 5 & 6 &
    !> 0 & 1 & 2 \end{bmatrix}
    !> \end{align}
    !> \f]
    !>
    !> The block order direction is determined by \p dir.
    !>
    !> It might be the case that \p rowBlockDim does not divide evenly into \p m and/or that \p
    !> colBlockDim does not divide
    !> evenly into \p n. In these cases, the CSR matrix is expanded in size to fit full GEBSR
    !> blocks. For example,
    !> using the original CSR matrix but this time with \p rowBlockDim=2 and \p colBlockDim=3, the
    !> resulting GEBSR matrix
    !> would look like:
    !>
    !> \f[
    !> \left[
    !> \begin{array}{c | c}
    !> \begin{array}{c c c}
    !> 1 & 0 & 0 \\
    !> 3 & 4 & 0
    !> \end{array} &
    !> \begin{array}{c c c}
    !> 2 & 4 & 0 \\
    !> 0 & 5 & 1
    !> \end{array} \\
    !> \hline
    !> \begin{array}{c c c}
    !> 5 & 0 & 6 \\
    !> 0 & 0 & 0
    !> \end{array} &
    !> \begin{array}{c c c}
    !> 7 & 6 & 2 \\
    !> 0 & 0 & 0
    !> \end{array}
    !> \end{array}
    !> \right]
    !> \f]
    !>
    !> @param[in]
    !> handle       handle to the hipSPARSE library context queue.
    !> @param[in]
    !> dir the storage format of the blocks, \ref HIPSPARSE_DIRECTION_ROW or \ref
    !> HIPSPARSE_DIRECTION_COLUMN.
    !> @param[in]
    !> m            number of rows in the sparse CSR matrix.
    !> @param[in]
    !> n            number of columns in the sparse CSR matrix.
    !> @param[in]
    !> csr_descr    descriptor of the sparse CSR matrix. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> csrVal       array of \p nnz elements containing the values of the sparse CSR matrix.
    !> @param[in]
    !> csrRowPtr    array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix.
    !> @param[in]
    !> csrColInd    array of \p nnz elements containing the column indices of the sparse CSR matrix.
    !> @param[in]
    !> bsr_descr    descriptor of the sparse BSR matrix. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[out]
    !> bsrVal array of \p nnzb* \p rowBlockDim* \p colBlockDim containing the values of the sparse
    !> BSR matrix.
    !> @param[out]
    !> bsrRowPtr    array of \p mb+1 elements that point to the start of every block row of the
    !> sparse BSR matrix.
    !> @param[out]
    !> bsrColInd array of \p nnzb elements containing the block column indices of the sparse BSR
    !> matrix.
    !> @param[in]
    !> rowBlockDim  row size of the blocks in the sparse general BSR matrix.
    !> @param[in]
    !> colBlockDim  col size of the blocks in the sparse general BSR matrix.
    !> @param[in]
    !> pbuffer buffer allocated by the user. The buffer size is determined by calling \ref
    !> hipsparseScsr2gebsr_bufferSize
    !> "hipsparseXcsr2gebsr_bufferSize()".
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p n, \p rowBlockDim, \p colBlockDim,
    !> \p bsrVal,
    !> \p bsrRowPtr, \p bsrColInd, \p csrVal, \p csrRowPtr, or \p csrColInd pointer is invalid.
    function hipsparseScsr2gebsr(handle, dir, m, n, csr_descr, csrVal, csrRowPtr, csrColInd, &
                                 bsr_descr, bsrVal, bsrRowPtr, bsrColInd, rowBlockDim, &
                                 colBlockDim, pbuffer) &
       result(Scsr2gebsr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseScsr2gebsr")
#else
       bind(C, name="hipsparseScsr2gebsr")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: dir
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: csr_descr
       real(c_float) :: csrVal(*)
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       type(c_ptr), value :: bsr_descr
       real(c_float) :: bsrVal(*)
       integer(c_int) :: bsrRowPtr(*)
       integer(c_int) :: bsrColInd(*)
       integer(c_int), value :: rowBlockDim
       integer(c_int), value :: colBlockDim
       type(c_ptr), value :: pbuffer
       integer(c_int) :: Scsr2gebsr
    end function hipsparseScsr2gebsr

    !---------------------------------------------
    ! hipsparseDcsr2gebsr
    !---------------------------------------------
    function hipsparseDcsr2gebsr(handle, dir, m, n, csr_descr, csrVal, csrRowPtr, csrColInd, &
                                 bsr_descr, bsrVal, bsrRowPtr, bsrColInd, rowBlockDim, &
                                 colBlockDim, pbuffer) &
       result(Dcsr2gebsr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDcsr2gebsr")
#else
       bind(C, name="hipsparseDcsr2gebsr")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: dir
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: csr_descr
       real(c_double) :: csrVal(*)
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       type(c_ptr), value :: bsr_descr
       real(c_double) :: bsrVal(*)
       integer(c_int) :: bsrRowPtr(*)
       integer(c_int) :: bsrColInd(*)
       integer(c_int), value :: rowBlockDim
       integer(c_int), value :: colBlockDim
       type(c_ptr), value :: pbuffer
       integer(c_int) :: Dcsr2gebsr
    end function hipsparseDcsr2gebsr

    !---------------------------------------------
    ! hipsparseCcsr2gebsr
    !---------------------------------------------
    function hipsparseCcsr2gebsr(handle, dir, m, n, csr_descr, csrVal, csrRowPtr, csrColInd, &
                                 bsr_descr, bsrVal, bsrRowPtr, bsrColInd, rowBlockDim, &
                                 colBlockDim, pbuffer) &
       result(Ccsr2gebsr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCcsr2gebsr")
#else
       bind(C, name="hipsparseCcsr2gebsr")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dir
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: csr_descr
       type(c_ptr), value :: csrVal
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       type(c_ptr), value :: bsr_descr
       type(c_ptr), value :: bsrVal
       integer(c_int) :: bsrRowPtr(*)
       integer(c_int) :: bsrColInd(*)
       integer(c_int), value :: rowBlockDim
       integer(c_int), value :: colBlockDim
       type(c_ptr), value :: pbuffer
       integer(c_int) :: Ccsr2gebsr
    end function hipsparseCcsr2gebsr

    !---------------------------------------------
    ! hipsparseZcsr2gebsr
    !---------------------------------------------
    function hipsparseZcsr2gebsr(handle, dir, m, n, csr_descr, csrVal, csrRowPtr, csrColInd, &
                                 bsr_descr, bsrVal, bsrRowPtr, bsrColInd, rowBlockDim, &
                                 colBlockDim, pbuffer) &
       result(Zcsr2gebsr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZcsr2gebsr")
#else
       bind(C, name="hipsparseZcsr2gebsr")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dir
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: csr_descr
       type(c_ptr), value :: csrVal
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       type(c_ptr), value :: bsr_descr
       type(c_ptr), value :: bsrVal
       integer(c_int) :: bsrRowPtr(*)
       integer(c_int) :: bsrColInd(*)
       integer(c_int), value :: rowBlockDim
       integer(c_int), value :: colBlockDim
       type(c_ptr), value :: pbuffer
       integer(c_int) :: Zcsr2gebsr
    end function hipsparseZcsr2gebsr

    !---------------------------------------------
    ! hipsparseScsr2hyb
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief Convert a sparse CSR matrix into a sparse HYB matrix.
    !>
    !> \details
    !> \p hipsparseXcsr2hyb converts a CSR matrix into a HYB matrix. It is assumed
    !> that \p hyb has been initialized with \ref hipsparseCreateHybMat().
    !>
    !> \note
    !> This function requires a significant amount of storage for the HYB matrix,
    !> depending on the matrix structure.
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> \deprecated
    !> This function is deprecated when using the CUDA backend (CUDA 10.0+) and will be
    !> removed in CUDA 11.0. This deprecation does not apply to the ROCm backend.
    !>
    !> @param[in]
    !> handle            handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m                 number of rows of the sparse CSR matrix, which must be non-negative.
    !> @param[in]
    !> n                 number of columns of the sparse CSR matrix, which must be non-negative.
    !> @param[in]
    !> descrA            descriptor of the sparse CSR matrix. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> csrSortedValA     array containing the values of the sparse CSR matrix.
    !> @param[in]
    !> csrSortedRowPtrA  array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix.
    !> @param[in]
    !> csrSortedColIndA  array containing the column indices of the sparse CSR matrix.
    !> @param[out]
    !> hybA              sparse matrix in HYB format.
    !> @param[in]
    !> userEllWidth      width of the ELL part of the HYB matrix (only required if
    !> \p partitionType == \ref HIPSPARSE_HYB_PARTITION_USER). Must be non-negative.
    !> @param[in]
    !> partitionType     \ref HIPSPARSE_HYB_PARTITION_AUTO (recommended),
    !> \ref HIPSPARSE_HYB_PARTITION_USER, or
    !> \ref HIPSPARSE_HYB_PARTITION_MAX.
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p descrA, \p hybA, \p csrSortedValA,
    !> \p csrSortedRowPtrA, or \p csrSortedColIndA is nullptr, \p m or \p n is negative, or
    !> \p userEllWidth or \p partitionType is invalid.
    !> \retval HIPSPARSE_STATUS_ALLOC_FAILED the buffer for the HYB matrix could not be allocated.
    !> \retval HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    !> \retval HIPSPARSE_STATUS_NOT_SUPPORTED \ref hipsparseMatrixType_t != \ref
    !> HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseScsr2hyb(handle, m, n, descrA, csrSortedValA, csrSortedRowPtrA, &
                               csrSortedColIndA, hybA, userEllWidth, partitionType) &
       result(Scsr2hyb) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseScsr2hyb")
#else
       bind(C, name="hipsparseScsr2hyb")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: descrA
       real(c_float) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: hybA
       integer(c_int), value :: userEllWidth
       integer(c_int), value :: partitionType
       integer(c_int) :: Scsr2hyb
    end function hipsparseScsr2hyb

    !---------------------------------------------
    ! hipsparseDcsr2hyb
    !---------------------------------------------
    function hipsparseDcsr2hyb(handle, m, n, descrA, csrSortedValA, csrSortedRowPtrA, &
                               csrSortedColIndA, hybA, userEllWidth, partitionType) &
       result(Dcsr2hyb) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDcsr2hyb")
#else
       bind(C, name="hipsparseDcsr2hyb")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: descrA
       real(c_double) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: hybA
       integer(c_int), value :: userEllWidth
       integer(c_int), value :: partitionType
       integer(c_int) :: Dcsr2hyb
    end function hipsparseDcsr2hyb

    !---------------------------------------------
    ! hipsparseCcsr2hyb
    !---------------------------------------------
    function hipsparseCcsr2hyb(handle, m, n, descrA, csrSortedValA, csrSortedRowPtrA, &
                               csrSortedColIndA, hybA, userEllWidth, partitionType) &
       result(Ccsr2hyb) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCcsr2hyb")
#else
       bind(C, name="hipsparseCcsr2hyb")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: hybA
       integer(c_int), value :: userEllWidth
       integer(c_int), value :: partitionType
       integer(c_int) :: Ccsr2hyb
    end function hipsparseCcsr2hyb

    !---------------------------------------------
    ! hipsparseZcsr2hyb
    !---------------------------------------------
    function hipsparseZcsr2hyb(handle, m, n, descrA, csrSortedValA, csrSortedRowPtrA, &
                               csrSortedColIndA, hybA, userEllWidth, partitionType) &
       result(Zcsr2hyb) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZcsr2hyb")
#else
       bind(C, name="hipsparseZcsr2hyb")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       type(c_ptr), value :: hybA
       integer(c_int), value :: userEllWidth
       integer(c_int), value :: partitionType
       integer(c_int) :: Zcsr2hyb
    end function hipsparseZcsr2hyb

    !---------------------------------------------
    ! hipsparseXcsrsort_bufferSizeExt
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief Sort a sparse CSR matrix.
    !>
    !> \details
    !> \p hipsparseXcsrsort_bufferSizeExt returns the size of the temporary storage buffer
    !> in bytes required by hipsparseXcsrsort(). The temporary storage buffer must be allocated by
    !> the user.
    !>
    !> @param[in]
    !> handle              handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m                   number of rows of the sparse CSR matrix.
    !> @param[in]
    !> n                   number of columns of the sparse CSR matrix.
    !> @param[in]
    !> nnz                 number of non-zero entries of the sparse CSR matrix.
    !> @param[in]
    !> csrRowPtr           array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix.
    !> @param[in]
    !> csrColInd           array of \p nnz elements containing the column indices of the sparse
    !> CSR matrix.
    !> @param[out]
    !> pBufferSizeInBytes  number of bytes of the temporary storage buffer required by
    !> \ref hipsparseXcsrsort().
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p n, \p nnz, \p csrRowPtr, \p
    !> csrColInd, or
    !> \p pBufferSizeInBytes pointer is invalid.
    function hipsparseXcsrsort_bufferSizeExt(handle, m, n, nnz, csrRowPtr, csrColInd, &
                                             pBufferSizeInBytes) &
       result(Xcsrsort_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseXcsrsort_bufferSizeExt")
#else
       bind(C, name="hipsparseXcsrsort_bufferSizeExt")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Xcsrsort_bufferSizeExt
    end function hipsparseXcsrsort_bufferSizeExt

    !---------------------------------------------
    ! hipsparseXcsrsort
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief Sort a sparse CSR matrix.
    !>
    !> \details
    !> \p hipsparseXcsrsort sorts a matrix in CSR format. The sorted permutation vector
    !> \p P can be used to obtain the sorted \p csrVal array. In this case, \p P must be
    !> initialized as the identity permutation. See \ref hipsparseCreateIdentityPermutation(). To
    !> apply the permutation vector to the CSR values, see \ref hipsparseSgthr
    !> "hipsparseXgthr()".
    !>
    !> \p hipsparseXcsrsort requires extra temporary storage buffer that must be allocated by
    !> the user. The storage buffer size can be determined by hipsparseXcsrsort_bufferSizeExt().
    !>
    !> \note
    !> \p P can be \p NULL if a sorted permutation vector is not required.
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> @param[in]
    !> handle          handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m               number of rows of the sparse CSR matrix.
    !> @param[in]
    !> n               number of columns of the sparse CSR matrix.
    !> @param[in]
    !> nnz             number of non-zero entries of the sparse CSR matrix.
    !> @param[in]
    !> descrA          descriptor of the sparse CSR matrix. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> csrRowPtr       array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix.
    !> @param[inout]
    !> csrColInd       array of \p nnz elements containing the column indices of the sparse
    !> CSR matrix.
    !> @param[inout]
    !> P               array of \p nnz integers containing the unsorted map indices. Can be
    !> \p NULL.
    !> @param[in]
    !> pBuffer         temporary storage buffer allocated by the user. The size is returned by
    !> \ref hipsparseXcsrsort_bufferSizeExt().
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p n, \p nnz, \p descrA, \p
    !> csrRowPtr,
    !> \p csrColInd, or \p pBuffer pointer is invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    !> \retval     HIPSPARSE_STATUS_NOT_SUPPORTED
    !> \ref hipsparseMatrixType_t != \ref HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseXcsrsort(handle, m, n, nnz, descrA, csrRowPtr, csrColInd, P, pBuffer) &
       result(Xcsrsort) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseXcsrsort")
#else
       bind(C, name="hipsparseXcsrsort")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       integer(c_int) :: P(*)
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Xcsrsort
    end function hipsparseXcsrsort

    !---------------------------------------------
    ! hipsparseScsru2csr_bufferSizeExt
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief
    !> This function calculates the amount of temporary storage in bytes required for
    !> \p hipsparseXcsru2csr() and \p hipsparseXcsr2csru().
    function hipsparseScsru2csr_bufferSizeExt(handle, m, n, nnz, csrVal, csrRowPtr, csrColInd, &
                                              info, pBufferSizeInBytes) &
       result(Scsru2csr_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseScsru2csr_bufferSizeExt")
#else
       bind(C, name="hipsparseScsru2csr_bufferSizeExt")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       real(c_float) :: csrVal(*)
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Scsru2csr_bufferSizeExt
    end function hipsparseScsru2csr_bufferSizeExt

    !---------------------------------------------
    ! hipsparseDcsru2csr_bufferSizeExt
    !---------------------------------------------
    function hipsparseDcsru2csr_bufferSizeExt(handle, m, n, nnz, csrVal, csrRowPtr, csrColInd, &
                                              info, pBufferSizeInBytes) &
       result(Dcsru2csr_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDcsru2csr_bufferSizeExt")
#else
       bind(C, name="hipsparseDcsru2csr_bufferSizeExt")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       real(c_double) :: csrVal(*)
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Dcsru2csr_bufferSizeExt
    end function hipsparseDcsru2csr_bufferSizeExt

    !---------------------------------------------
    ! hipsparseCcsru2csr_bufferSizeExt
    !---------------------------------------------
    function hipsparseCcsru2csr_bufferSizeExt(handle, m, n, nnz, csrVal, csrRowPtr, csrColInd, &
                                              info, pBufferSizeInBytes) &
       result(Ccsru2csr_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCcsru2csr_bufferSizeExt")
#else
       bind(C, name="hipsparseCcsru2csr_bufferSizeExt")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       type(c_ptr), value :: csrVal
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Ccsru2csr_bufferSizeExt
    end function hipsparseCcsru2csr_bufferSizeExt

    !---------------------------------------------
    ! hipsparseZcsru2csr_bufferSizeExt
    !---------------------------------------------
    function hipsparseZcsru2csr_bufferSizeExt(handle, m, n, nnz, csrVal, csrRowPtr, csrColInd, &
                                              info, pBufferSizeInBytes) &
       result(Zcsru2csr_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZcsru2csr_bufferSizeExt")
#else
       bind(C, name="hipsparseZcsru2csr_bufferSizeExt")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       type(c_ptr), value :: csrVal
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Zcsru2csr_bufferSizeExt
    end function hipsparseZcsru2csr_bufferSizeExt

    !---------------------------------------------
    ! hipsparseScsru2csr
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief
    !> This function converts the unsorted CSR format to the sorted CSR format. The required
    !> temporary storage has to be allocated by the user.
    function hipsparseScsru2csr(handle, m, n, nnz, descrA, csrVal, csrRowPtr, csrColInd, info, &
                                pBuffer) &
       result(Scsru2csr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseScsru2csr")
#else
       bind(C, name="hipsparseScsru2csr")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       real(c_float) :: csrVal(*)
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Scsru2csr
    end function hipsparseScsru2csr

    !---------------------------------------------
    ! hipsparseDcsru2csr
    !---------------------------------------------
    function hipsparseDcsru2csr(handle, m, n, nnz, descrA, csrVal, csrRowPtr, csrColInd, info, &
                                pBuffer) &
       result(Dcsru2csr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDcsru2csr")
#else
       bind(C, name="hipsparseDcsru2csr")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       real(c_double) :: csrVal(*)
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Dcsru2csr
    end function hipsparseDcsru2csr

    !---------------------------------------------
    ! hipsparseCcsru2csr
    !---------------------------------------------
    function hipsparseCcsru2csr(handle, m, n, nnz, descrA, csrVal, csrRowPtr, csrColInd, info, &
                                pBuffer) &
       result(Ccsru2csr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCcsru2csr")
#else
       bind(C, name="hipsparseCcsru2csr")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrVal
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Ccsru2csr
    end function hipsparseCcsru2csr

    !---------------------------------------------
    ! hipsparseZcsru2csr
    !---------------------------------------------
    function hipsparseZcsru2csr(handle, m, n, nnz, descrA, csrVal, csrRowPtr, csrColInd, info, &
                                pBuffer) &
       result(Zcsru2csr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZcsru2csr")
#else
       bind(C, name="hipsparseZcsru2csr")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrVal
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBuffer
       integer(c_int) :: Zcsru2csr
    end function hipsparseZcsru2csr

    !---------------------------------------------
    ! hipsparseSdense2csc
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief
    !> \p hipsparseXdense2csc functions convert the matrix \p A in dense format into a sparse matrix
    !> in CSC format.
    !>
    !> \details
    !> Given a dense, column-ordered, matrix \p A with leading dimension \p ld, where \p ld>=m,
    !> \p hipsparseXdense2csc converts the matrix to a sparse CSC format matrix.
    !> All the parameters are assumed to have been preallocated by the user and the arrays
    !> are filled in based on number of non-zeros per row, which can be pre-computed with
    !> \ref hipsparseSnnz "hipsparseXnnz()". Users can set the desired index base in the output CSC
    !> matrix by setting it in the \ref hipsparseMatDescr_t. See \ref hipsparseSetMatIndexBase().
    !>
    !> As an example, if using index base zero (that is, the default) and the dense
    !> matrix:
    !>
    !> \f[
    !> \begin{bmatrix}
    !> 1 & 0 & 0 & 2 \\
    !> 3 & 4 & 0 & 0 \\
    !> 5 & 0 & 6 & 7
    !> \end{bmatrix}
    !> \f]
    !>
    !> where the \p A values have column ordering with leading dimension \p ld=m:
    !> \f[
    !> \text{A} &= \begin{bmatrix} 1 & 3 & 5 & 0 & 4 & 0 & 0 & 0 & 6 & 2 & 0 & 7 \end{bmatrix} \\
    !> \f]
    !>
    !> the conversion results in the CSC arrays:
    !>
    !> \f[
    !> \begin{align}
    !> \text{cscRowInd} &= \begin{bmatrix} 0 & 1 & 2 & 1 & 2 & 0 & 2 \end{bmatrix} \\
    !> \text{cscColPtr} &= \begin{bmatrix} 0 & 3 & 4 & 5 & 7 \end{bmatrix} \\
    !> \text{cscVal} &= \begin{bmatrix} 1 & 3 & 5 & 4 & 6 & 2 & 7 \end{bmatrix} \\
    !> \end{align}
    !> \f]
    !>
    !> This function works very similar to \ref hipsparseSdense2csr "hipsparseXdense2csr()".
    !> See hipsparseSdense2csr() for a code example.
    !>
    !> \note
    !> This function is executed asynchronously with respect to the host and can return control to
    !> the
    !> application on the host before the entire result is ready.
    !>
    !> \deprecated
    !> This function is deprecated when using the CUDA backend (CUDA 11.0+) and will be
    !> removed in CUDA 12.0. This deprecation does not apply to the ROCm backend.
    !>
    !> @param[in]
    !> handle       handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m            number of rows of the dense matrix \p A. Must be non-negative.
    !> @param[in]
    !> n            number of columns of the dense matrix \p A. Must be non-negative.
    !> @param[in]
    !> descr the descriptor of the dense matrix \p A. The supported matrix type is \ref
    !> HIPSPARSE_MATRIX_TYPE_GENERAL and
    !> any valid value of the \ref hipsparseIndexBase_t.
    !> @param[in]
    !> A            array of dimensions (\p ld, \p n).
    !> @param[in]
    !> ld           leading dimension of dense array \p A. Must be at least \p m.
    !> @param[in]
    !> nnzPerColumn array of size \p n containing the number of non-zero elements per column.
    !> @param[out]
    !> cscVal array of nnz ( = \p cscColPtr[n] - \p cscColPtr[0] ) nonzero elements of matrix \p A.
    !> @param[out]
    !> cscRowInd integer array of nnz ( = \p cscColPtr[n] - \p cscColPtr[0] ) column indices of the
    !> non-zero elements of matrix \p A.
    !> @param[out]
    !> cscColPtr integer array of \p n+1 elements that contains the start of every column and the
    !> end of the last column plus one.
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p descr, \p A, \p nnzPerColumn, \p cscVal,
    !> \p cscColPtr, or \p cscRowInd is nullptr, \p m or \p n is negative, or \p ld is invalid.
    function hipsparseSdense2csc(handle, m, n, descr, A, ld, nnzPerColumn, cscVal, cscRowInd, &
                                 cscColPtr) &
       result(Sdense2csc) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSdense2csc")
#else
       bind(C, name="hipsparseSdense2csc")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: descr
       real(c_float) :: A(*)
       integer(c_int), value :: ld
       integer(c_int) :: nnzPerColumn(*)
       real(c_float) :: cscVal(*)
       integer(c_int) :: cscRowInd(*)
       integer(c_int) :: cscColPtr(*)
       integer(c_int) :: Sdense2csc
    end function hipsparseSdense2csc

    !---------------------------------------------
    ! hipsparseDdense2csc
    !---------------------------------------------
    function hipsparseDdense2csc(handle, m, n, descr, A, ld, nnzPerColumn, cscVal, cscRowInd, &
                                 cscColPtr) &
       result(Ddense2csc) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDdense2csc")
#else
       bind(C, name="hipsparseDdense2csc")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: descr
       real(c_double) :: A(*)
       integer(c_int), value :: ld
       integer(c_int) :: nnzPerColumn(*)
       real(c_double) :: cscVal(*)
       integer(c_int) :: cscRowInd(*)
       integer(c_int) :: cscColPtr(*)
       integer(c_int) :: Ddense2csc
    end function hipsparseDdense2csc

    !---------------------------------------------
    ! hipsparseCdense2csc
    !---------------------------------------------
    function hipsparseCdense2csc(handle, m, n, descr, A, ld, nnzPerColumn, cscVal, cscRowInd, &
                                 cscColPtr) &
       result(Cdense2csc) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCdense2csc")
#else
       bind(C, name="hipsparseCdense2csc")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: descr
       type(c_ptr), value :: A
       integer(c_int), value :: ld
       integer(c_int) :: nnzPerColumn(*)
       type(c_ptr), value :: cscVal
       integer(c_int) :: cscRowInd(*)
       integer(c_int) :: cscColPtr(*)
       integer(c_int) :: Cdense2csc
    end function hipsparseCdense2csc

    !---------------------------------------------
    ! hipsparseZdense2csc
    !---------------------------------------------
    function hipsparseZdense2csc(handle, m, n, descr, A, ld, nnzPerColumn, cscVal, cscRowInd, &
                                 cscColPtr) &
       result(Zdense2csc) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZdense2csc")
#else
       bind(C, name="hipsparseZdense2csc")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: descr
       type(c_ptr), value :: A
       integer(c_int), value :: ld
       integer(c_int) :: nnzPerColumn(*)
       type(c_ptr), value :: cscVal
       integer(c_int) :: cscRowInd(*)
       integer(c_int) :: cscColPtr(*)
       integer(c_int) :: Zdense2csc
    end function hipsparseZdense2csc

    !---------------------------------------------
    ! hipsparseSdense2csr
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief
    !> \p hipsparseXdense2csr converts the matrix \p A in dense format into a sparse matrix in CSR
    !> format.
    !>
    !> \details
    !> Given a dense, column-ordered matrix \p A with leading dimension \p ld where \p ld>=m,
    !> \p hipsparseXdense2csr converts the matrix to a sparse CSR format matrix. All the parameters
    !> are assumed to have been pre-allocated by the user and the arrays are filled in based on the
    !> number
    !> of non-zeros per row, which can be pre-computed with \ref hipsparseSnnz "hipsparseXnnz()".
    !> The
    !> desired index base in the output CSR matrix is set in the \ref hipsparseMatDescr_t. See
    !> \ref hipsparseSetMatIndexBase().
    !>
    !> As an example, if using index base zero (which is the default) and the dense
    !> matrix:
    !>
    !> \f[
    !> \begin{bmatrix}
    !> 1 & 0 & 0 & 2 \\
    !> 3 & 4 & 0 & 0 \\
    !> 5 & 0 & 6 & 7
    !> \end{bmatrix}
    !> \f]
    !>
    !> The conversion results in the CSR arrays:
    !>
    !> \f[
    !> \begin{align}
    !> \text{csrRowPtr} &= \begin{bmatrix} 0 & 2 & 4 & 7 \end{bmatrix} \\
    !> \text{csrColInd} &= \begin{bmatrix} 0 & 3 & 0 & 1 & 0 & 2 & 3 \end{bmatrix} \\
    !> \text{csrVal} &= \begin{bmatrix} 1 & 2 & 3 & 4 & 5 & 6 & 7 \end{bmatrix} \\
    !> \end{align}
    !> \f]
    !>
    !> \note
    !> This function is executed asynchronously with respect to the host and can return control to
    !> the
    !> application on the host before the entire result is ready.
    !>
    !> @param[in]
    !> handle       handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m            number of rows of the dense matrix \p A. Must be non-negative.
    !> @param[in]
    !> n            number of columns of the dense matrix \p A. Must be non-negative.
    !> @param[in]
    !> descr the descriptor of the dense matrix \p A. The supported matrix type is \ref
    !> HIPSPARSE_MATRIX_TYPE_GENERAL and
    !> any valid value of the \ref hipsparseIndexBase_t.
    !> @param[in]
    !> A            array of dimensions (\p ld, \p n).
    !> @param[in]
    !> ld           leading dimension of dense array \p A, which must be at least \p m.
    !> @param[in]
    !> nnzPerRow    array of size \p m containing the number of non-zero elements per row.
    !> @param[out]
    !> csrVal array of nnz ( = \p csrRowPtr[m] - \p csrRowPtr[0] ) non-zero elements of matrix \p A.
    !> @param[out]
    !> csrRowPtr integer array of \p m+1 elements that contains the start of every row and the end
    !> of the last row plus one.
    !> @param[out]
    !> csrColInd integer array of nnz ( = \p csrRowPtr[m] - \p csrRowPtr[0] ) column indices of the
    !> non-zero elements of matrix \p A.
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p descr, \p A, \p nnzPerRow, \p csrVal,
    !> \p csrRowPtr, or \p csrColInd is nullptr, \p m or \p n is negative, or \p ld is invalid.
    function hipsparseSdense2csr(handle, m, n, descr, A, ld, nnzPerRow, csrVal, csrRowPtr, &
                                 csrColInd) &
       result(Sdense2csr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSdense2csr")
#else
       bind(C, name="hipsparseSdense2csr")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: descr
       real(c_float) :: A(*)
       integer(c_int), value :: ld
       integer(c_int) :: nnzPerRow(*)
       real(c_float) :: csrVal(*)
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       integer(c_int) :: Sdense2csr
    end function hipsparseSdense2csr

    !---------------------------------------------
    ! hipsparseDdense2csr
    !---------------------------------------------
    function hipsparseDdense2csr(handle, m, n, descr, A, ld, nnzPerRow, csrVal, csrRowPtr, &
                                 csrColInd) &
       result(Ddense2csr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDdense2csr")
#else
       bind(C, name="hipsparseDdense2csr")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: descr
       real(c_double) :: A(*)
       integer(c_int), value :: ld
       integer(c_int) :: nnzPerRow(*)
       real(c_double) :: csrVal(*)
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       integer(c_int) :: Ddense2csr
    end function hipsparseDdense2csr

    !---------------------------------------------
    ! hipsparseCdense2csr
    !---------------------------------------------
    function hipsparseCdense2csr(handle, m, n, descr, A, ld, nnzPerRow, csrVal, csrRowPtr, &
                                 csrColInd) &
       result(Cdense2csr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCdense2csr")
#else
       bind(C, name="hipsparseCdense2csr")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: descr
       type(c_ptr), value :: A
       integer(c_int), value :: ld
       integer(c_int) :: nnzPerRow(*)
       type(c_ptr), value :: csrVal
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       integer(c_int) :: Cdense2csr
    end function hipsparseCdense2csr

    !---------------------------------------------
    ! hipsparseZdense2csr
    !---------------------------------------------
    function hipsparseZdense2csr(handle, m, n, descr, A, ld, nnzPerRow, csrVal, csrRowPtr, &
                                 csrColInd) &
       result(Zdense2csr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZdense2csr")
#else
       bind(C, name="hipsparseZdense2csr")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: descr
       type(c_ptr), value :: A
       integer(c_int), value :: ld
       integer(c_int) :: nnzPerRow(*)
       type(c_ptr), value :: csrVal
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       integer(c_int) :: Zdense2csr
    end function hipsparseZdense2csr

    !---------------------------------------------
    ! hipsparseSgebsr2csr
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief Convert a sparse GEBSR matrix into a sparse CSR matrix.
    !>
    !> \details
    !> \p hipsparseXgebsr2csr converts a GEBSR matrix into a CSR matrix. It is assumed
    !> that \p csrValC, \p csrColIndC, and \p csrRowPtrC are already allocated prior to
    !> calling \p hipsparseXgebsr2csr. Allocation size for \p csrRowPtrC equals
    !> \p m+1 where:
    !>
    !> \f[
    !> \begin{align}
    !> \text{m} &= \text{mb * rowBlockDim} \\
    !> \text{n} &= \text{nb * colBlockDim}
    !> \end{align}
    !> \f]
    !>
    !> Allocation size for \p csrValC and \p csrColIndC is computed by the the number of blocks in
    !> the GEBSR
    !> matrix, \p nnzb, multiplied by the product of the block dimensions, that is, \p
    !> nnz=nnzb*rocBlockDim*colBlockDim.
    !>
    !> For example, given the GEBSR matrix:
    !> \f[
    !> \left[
    !> \begin{array}{c | c | c}
    !> \begin{array}{c c}
    !> 6 & 2 \\
    !> 1 & 4 \\
    !> 5 & 4
    !> \end{array} &
    !> \begin{array}{c c}
    !> 0 & 3 \\
    !> 5 & 0 \\
    !> 0 & 7
    !> \end{array} &
    !> \begin{array}{c c}
    !> 0 & 0 \\
    !> 0 & 0 \\
    !> 0 & 0
    !> \end{array} \\
    !> \hline
    !> \begin{array}{c c}
    !> 0 & 0 \\
    !> 0 & 0 \\
    !> 0 & 0
    !> \end{array} &
    !> \begin{array}{c c}
    !> 3 & 0 \\
    !> 0 & 0 \\
    !> 0 & 7
    !> \end{array} &
    !> \begin{array}{c c}
    !> 2 & 2 \\
    !> 4 & 3 \\
    !> 1 & 4
    !> \end{array} \\
    !> \end{array}
    !> \right]
    !> \f]
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> dirA the storage format of the blocks, \ref HIPSPARSE_DIRECTION_ROW or \ref
    !> HIPSPARSE_DIRECTION_COLUMN.
    !> @param[in]
    !> mb          number of block rows in the sparse general BSR matrix.
    !> @param[in]
    !> nb          number of block columns in the sparse general BSR matrix.
    !> @param[in]
    !> descrA      descriptor of the sparse general BSR matrix. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> bsrValA array of \p nnzb*rowBlockDim*colBlockDim containing the values of the sparse BSR
    !> matrix.
    !> @param[in]
    !> bsrRowPtrA  array of \p mb+1 elements that point to the start of every block row of the
    !> sparse BSR matrix.
    !> @param[in]
    !> bsrColIndA array of \p nnzb elements containing the block column indices of the sparse BSR
    !> matrix.
    !> @param[in]
    !> rowBlockDim row size of the blocks in the sparse general BSR matrix.
    !> @param[in]
    !> colBlockDim column size of the blocks in the sparse general BSR matrix.
    !> @param[in]
    !> descrC      descriptor of the sparse CSR matrix. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[out]
    !> csrValC array of \p nnzb*rowBlockDim*colBlockDim elements containing the values of the sparse
    !> CSR matrix.
    !> @param[out]
    !> csrRowPtrC array of \p m+1 where \p m=mb*rowBlockDim elements that point to the start of
    !> every row of the
    !> sparse CSR matrix.
    !> @param[out]
    !> csrColIndC array of \p nnzb*block_dim*block_dim elements containing the column indices of the
    !> sparse CSR matrix.
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval     HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p mb, \p nb, \p block_dim, \p bsrValA,
    !> \p bsrRowPtrA, \p bsrColIndA, \p csrValC, \p csrRowPtrC, or \p csrColIndC pointer is invalid.
    function hipsparseSgebsr2csr(handle, dirA, mb, nb, descrA, bsrValA, bsrRowPtrA, bsrColIndA, &
                                 rowBlockDim, colBlockDim, descrC, csrValC, csrRowPtrC, &
                                 csrColIndC) &
       result(Sgebsr2csr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSgebsr2csr")
#else
       bind(C, name="hipsparseSgebsr2csr")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nb
       type(c_ptr), value :: descrA
       real(c_float) :: bsrValA(*)
       integer(c_int) :: bsrRowPtrA(*)
       integer(c_int) :: bsrColIndA(*)
       integer(c_int), value :: rowBlockDim
       integer(c_int), value :: colBlockDim
       type(c_ptr), value :: descrC
       real(c_float) :: csrValC(*)
       integer(c_int) :: csrRowPtrC(*)
       integer(c_int) :: csrColIndC(*)
       integer(c_int) :: Sgebsr2csr
    end function hipsparseSgebsr2csr

    !---------------------------------------------
    ! hipsparseDgebsr2csr
    !---------------------------------------------
    function hipsparseDgebsr2csr(handle, dirA, mb, nb, descrA, bsrValA, bsrRowPtrA, bsrColIndA, &
                                 rowBlockDim, colBlockDim, descrC, csrValC, csrRowPtrC, &
                                 csrColIndC) &
       result(Dgebsr2csr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDgebsr2csr")
#else
       bind(C, name="hipsparseDgebsr2csr")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nb
       type(c_ptr), value :: descrA
       real(c_double) :: bsrValA(*)
       integer(c_int) :: bsrRowPtrA(*)
       integer(c_int) :: bsrColIndA(*)
       integer(c_int), value :: rowBlockDim
       integer(c_int), value :: colBlockDim
       type(c_ptr), value :: descrC
       real(c_double) :: csrValC(*)
       integer(c_int) :: csrRowPtrC(*)
       integer(c_int) :: csrColIndC(*)
       integer(c_int) :: Dgebsr2csr
    end function hipsparseDgebsr2csr

    !---------------------------------------------
    ! hipsparseCgebsr2csr
    !---------------------------------------------
    function hipsparseCgebsr2csr(handle, dirA, mb, nb, descrA, bsrValA, bsrRowPtrA, bsrColIndA, &
                                 rowBlockDim, colBlockDim, descrC, csrValC, csrRowPtrC, &
                                 csrColIndC) &
       result(Cgebsr2csr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCgebsr2csr")
#else
       bind(C, name="hipsparseCgebsr2csr")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nb
       type(c_ptr), value :: descrA
       type(c_ptr), value :: bsrValA
       integer(c_int) :: bsrRowPtrA(*)
       integer(c_int) :: bsrColIndA(*)
       integer(c_int), value :: rowBlockDim
       integer(c_int), value :: colBlockDim
       type(c_ptr), value :: descrC
       type(c_ptr), value :: csrValC
       integer(c_int) :: csrRowPtrC(*)
       integer(c_int) :: csrColIndC(*)
       integer(c_int) :: Cgebsr2csr
    end function hipsparseCgebsr2csr

    !---------------------------------------------
    ! hipsparseZgebsr2csr
    !---------------------------------------------
    function hipsparseZgebsr2csr(handle, dirA, mb, nb, descrA, bsrValA, bsrRowPtrA, bsrColIndA, &
                                 rowBlockDim, colBlockDim, descrC, csrValC, csrRowPtrC, &
                                 csrColIndC) &
       result(Zgebsr2csr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZgebsr2csr")
#else
       bind(C, name="hipsparseZgebsr2csr")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nb
       type(c_ptr), value :: descrA
       type(c_ptr), value :: bsrValA
       integer(c_int) :: bsrRowPtrA(*)
       integer(c_int) :: bsrColIndA(*)
       integer(c_int), value :: rowBlockDim
       integer(c_int), value :: colBlockDim
       type(c_ptr), value :: descrC
       type(c_ptr), value :: csrValC
       integer(c_int) :: csrRowPtrC(*)
       integer(c_int) :: csrColIndC(*)
       integer(c_int) :: Zgebsr2csr
    end function hipsparseZgebsr2csr

    !---------------------------------------------
    ! hipsparseSgebsr2gebsc_bufferSize
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief Convert a sparse GEBSR matrix into a sparse GEBSC matrix.
    !>
    !> \details
    !> \p hipsparseXgebsr2gebsc_bufferSize returns the size of the temporary storage buffer
    !> required by \ref hipsparseSgebsr2gebsc "hipsparseXgebsr2gebsc()". This is the first step
    !> in converting a sparse matrix in GEBSR format to a sparse matrix in GEBSC format. After
    !> the size of the temporary storage buffer has been determined, it must be allocated by the
    !> user.
    !>
    !> See hipsparseSgebsr2gebsc() for a complete code example.
    !>
    !> @param[in]
    !> handle             handle to the hipSPARSE library context queue.
    !> @param[in]
    !> mb                 number of rows of the sparse General BSR matrix.
    !> @param[in]
    !> nb                 number of columns of the sparse General BSR matrix.
    !> @param[in]
    !> nnzb               number of non-zero entries of the sparse General BSR matrix.
    !> @param[in]
    !> bsrVal array of \p nnzb*rowBlockDim*colBlockDim containing the values of the sparse General
    !> BSR matrix.
    !> @param[in]
    !> bsrRowPtr          array of \p mb+1 elements that point to the start of every row of the
    !> sparse General BSR matrix.
    !> @param[in]
    !> bsrColInd          array of \p nnzb elements containing the column indices of the sparse
    !> General BSR matrix.
    !> @param[in]
    !> rowBlockDim        row size of the blocks in the sparse General BSR matrix.
    !> @param[in]
    !> colBlockDim        column size of the blocks in the sparse General BSR matrix.
    !> @param[out]
    !> pBufferSizeInBytes number of bytes of the temporary storage buffer required by
    !> hipsparseSgebsr2gebsc(), hipsparseDgebsr2gebsc(), hipsparseCgebsr2gebsc(), and
    !> hipsparseZgebsr2gebsc().
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p mb, \p nb, \p nnzb, \p bsrRowPtr, \p
    !> bsrColInd,
    !> or \p pBufferSizeInBytes pointer is invalid.
    !> \retval     rocsparse_status_internal_error an internal error occurred.
    function hipsparseSgebsr2gebsc_bufferSize(handle, mb, nb, nnzb, bsrVal, bsrRowPtr, bsrColInd, &
                                              rowBlockDim, colBlockDim, pBufferSizeInBytes) &
       result(Sgebsr2gebsc_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSgebsr2gebsc_bufferSize")
#else
       bind(C, name="hipsparseSgebsr2gebsc_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: mb
       integer(c_int), value :: nb
       integer(c_int), value :: nnzb
       real(c_float) :: bsrVal(*)
       integer(c_int) :: bsrRowPtr(*)
       integer(c_int) :: bsrColInd(*)
       integer(c_int), value :: rowBlockDim
       integer(c_int), value :: colBlockDim
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Sgebsr2gebsc_bufferSize
    end function hipsparseSgebsr2gebsc_bufferSize

    !---------------------------------------------
    ! hipsparseDgebsr2gebsc_bufferSize
    !---------------------------------------------
    function hipsparseDgebsr2gebsc_bufferSize(handle, mb, nb, nnzb, bsrVal, bsrRowPtr, bsrColInd, &
                                              rowBlockDim, colBlockDim, pBufferSizeInBytes) &
       result(Dgebsr2gebsc_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDgebsr2gebsc_bufferSize")
#else
       bind(C, name="hipsparseDgebsr2gebsc_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: mb
       integer(c_int), value :: nb
       integer(c_int), value :: nnzb
       real(c_double) :: bsrVal(*)
       integer(c_int) :: bsrRowPtr(*)
       integer(c_int) :: bsrColInd(*)
       integer(c_int), value :: rowBlockDim
       integer(c_int), value :: colBlockDim
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Dgebsr2gebsc_bufferSize
    end function hipsparseDgebsr2gebsc_bufferSize

    !---------------------------------------------
    ! hipsparseCgebsr2gebsc_bufferSize
    !---------------------------------------------
    function hipsparseCgebsr2gebsc_bufferSize(handle, mb, nb, nnzb, bsrVal, bsrRowPtr, bsrColInd, &
                                              rowBlockDim, colBlockDim, pBufferSizeInBytes) &
       result(Cgebsr2gebsc_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCgebsr2gebsc_bufferSize")
#else
       bind(C, name="hipsparseCgebsr2gebsc_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: mb
       integer(c_int), value :: nb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: bsrVal
       integer(c_int) :: bsrRowPtr(*)
       integer(c_int) :: bsrColInd(*)
       integer(c_int), value :: rowBlockDim
       integer(c_int), value :: colBlockDim
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Cgebsr2gebsc_bufferSize
    end function hipsparseCgebsr2gebsc_bufferSize

    !---------------------------------------------
    ! hipsparseZgebsr2gebsc_bufferSize
    !---------------------------------------------
    function hipsparseZgebsr2gebsc_bufferSize(handle, mb, nb, nnzb, bsrVal, bsrRowPtr, bsrColInd, &
                                              rowBlockDim, colBlockDim, pBufferSizeInBytes) &
       result(Zgebsr2gebsc_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZgebsr2gebsc_bufferSize")
#else
       bind(C, name="hipsparseZgebsr2gebsc_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: mb
       integer(c_int), value :: nb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: bsrVal
       integer(c_int) :: bsrRowPtr(*)
       integer(c_int) :: bsrColInd(*)
       integer(c_int), value :: rowBlockDim
       integer(c_int), value :: colBlockDim
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: Zgebsr2gebsc_bufferSize
    end function hipsparseZgebsr2gebsc_bufferSize

    !---------------------------------------------
    ! hipsparseSgebsr2gebsc
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief Convert a sparse GEBSR matrix into a sparse GEBSC matrix
    !>
    !> \details
    !> \p hipsparseXgebsr2gebsc converts a GEBSR matrix into a GEBSC matrix. \p
    !> hipsparseXgebsr2gebsc
    !> can also be used to convert a GEBSC matrix into a GEBSR matrix. \p copyValues decides
    !> whether \p bscVal is being filled during conversion (\ref HIPSPARSE_ACTION_NUMERIC)
    !> or not (\ref HIPSPARSE_ACTION_SYMBOLIC).
    !>
    !> \p hipsparseXgebsr2gebsc requires extra temporary storage buffer that has to be allocated
    !> by the user. Storage buffer size can be determined by \ref hipsparseSgebsr2gebsc_bufferSize
    !> "hipsparseXgebsr2gebsc_bufferSize()".
    !>
    !> For example, given the GEBSR matrix:
    !> \f[
    !> \left[
    !> \begin{array}{c | c}
    !> \begin{array}{c c}
    !> 1 & 2 \\
    !> 3 & 4 \\
    !> 6 & 0
    !> \end{array} &
    !> \begin{array}{c c}
    !> 0 & 2 \\
    !> 0 & 0 \\
    !> 3 & 4
    !> \end{array} \\
    !> \hline
    !> \begin{array}{c c}
    !> 5 & 0 \\
    !> 1 & 2 \\
    !> 3 & 4
    !> \end{array} &
    !> \begin{array}{c c}
    !> 6 & 7 \\
    !> 3 & 4 \\
    !> 3 & 4
    !> \end{array} \\
    !> \end{array}
    !> \right]
    !> \f]
    !>
    !> represented with the arrays:
    !> \f[
    !> \begin{align}
    !> \text{bsrRowPtr} &= \begin{bmatrix} 0 & 2 & 4 \end{bmatrix} \\
    !> \text{bsrColInd} &= \begin{bmatrix} 0 & 1 & 0 & 1 \end{bmatrix} \\
    !> \text{bsrVal} &= \begin{bmatrix} 1 & 2 & 3 & 4 & 6 & 0 & 0 & 2 & 0 & 0 & 3 & 4 & 5 & 0 & 1 &
    !> 2 & 3 & 4 & 6 & 7 & 3 & 4 & 3 & 4 \end{bmatrix}
    !> \end{align}
    !> \f]
    !>
    !> this function converts the matrix to GEBSC format:
    !> \f[
    !> \begin{align}
    !> \text{bscRowInd} &= \begin{bmatrix} 0 & 1 & 0 & 1 \end{bmatrix} \\
    !> \text{bscColPtr} &= \begin{bmatrix} 0 & 2 & 4 \end{bmatrix} \\
    !> \text{bscVal} &= \begin{bmatrix} 1 & 2 & 3 & 4 & 6 & 0 & 5 & 0 & 1 & 2 & 3 & 4 & 0 & 2 & 0 &
    !> 0 & 3 & 4 & 6 & 7 & 3 & 4 & 3 & 4 \end{bmatrix}
    !> \end{align}
    !> \f]
    !>
    !> The GEBSC arrays \p bscRowInd, \p bscColPtr, and \p bscVal must be allocated by the user
    !> prior
    !> to calling \p hipsparseXgebsr2gebsc(). The \p bscRowInd array has size \p nnzb, the \p
    !> bscColPtr
    !> array has size \p nb+1, and the \p bscVal array has size \p nnzb*rowBlockDim*colBlockDim.
    !>
    !> \note
    !> The resulting matrix can also be seen as the transpose of the input matrix.
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> mb          number of rows of the sparse general BSR matrix.
    !> @param[in]
    !> nb          number of columns of the sparse general BSR matrix.
    !> @param[in]
    !> nnzb        number of non-zero entries of the sparse general BSR matrix.
    !> @param[in]
    !> bsrVal array of \p nnzb * \p rowBlockDim * \p colBlockDim elements of the sparse general BSR
    !> matrix.
    !> @param[in]
    !> bsrRowPtr   array of \p m+1 elements that point to the start of every row of the
    !> sparse general BSR matrix.
    !> @param[in]
    !> bsrColInd   array of \p nnz elements containing the column indices of the sparse
    !> general BSR matrix.
    !> @param[in]
    !> rowBlockDim row size of the blocks in the sparse general BSR matrix.
    !> @param[in]
    !> colBlockDim col size of the blocks in the sparse general BSR matrix.
    !> @param[out]
    !> bscVal      array of \p nnz elements of the sparse BSC matrix.
    !> @param[out]
    !> bscRowInd   array of \p nnz elements containing the row indices of the sparse BSC
    !> matrix.
    !> @param[out]
    !> bscColPtr   array of \p n+1 elements that point to the start of every column of the
    !> sparse BSC matrix.
    !> @param[in]
    !> copyValues  \ref HIPSPARSE_ACTION_SYMBOLIC or \ref HIPSPARSE_ACTION_NUMERIC.
    !> @param[in]
    !> idxBase     \ref HIPSPARSE_INDEX_BASE_ZERO or \ref HIPSPARSE_INDEX_BASE_ONE.
    !> @param[in]
    !> temp_buffer temporary storage buffer allocated by the user. The size is returned by
    !> \ref hipsparseSgebsr2gebsc_bufferSize "hipsparseXgebsr2gebsc_bufferSize()".
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval     HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p mb, \p nb, \p nnzb, \p bsrVal,
    !> \p bsrRowPtr, \p bsrColInd, \p bscVal, \p bscRowInd, \p bscColPtr, or
    !> \p temp_buffer pointer is invalid.
    !> \retval     HIPSPARSE_STATUS_ARCH_MISMATCH the device is not supported.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    function hipsparseSgebsr2gebsc(handle, mb, nb, nnzb, bsrVal, bsrRowPtr, bsrColInd, &
                                   rowBlockDim, colBlockDim, bscVal, bscRowInd, bscColPtr, &
                                   copyValues, idxBase, temp_buffer) &
       result(Sgebsr2gebsc) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSgebsr2gebsc")
#else
       bind(C, name="hipsparseSgebsr2gebsc")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: mb
       integer(c_int), value :: nb
       integer(c_int), value :: nnzb
       real(c_float) :: bsrVal(*)
       integer(c_int) :: bsrRowPtr(*)
       integer(c_int) :: bsrColInd(*)
       integer(c_int), value :: rowBlockDim
       integer(c_int), value :: colBlockDim
       real(c_float) :: bscVal(*)
       integer(c_int) :: bscRowInd(*)
       integer(c_int) :: bscColPtr(*)
       integer(c_int), value :: copyValues
       integer(c_int), value :: idxBase
       type(c_ptr), value :: temp_buffer
       integer(c_int) :: Sgebsr2gebsc
    end function hipsparseSgebsr2gebsc

    !---------------------------------------------
    ! hipsparseDgebsr2gebsc
    !---------------------------------------------
    function hipsparseDgebsr2gebsc(handle, mb, nb, nnzb, bsrVal, bsrRowPtr, bsrColInd, &
                                   rowBlockDim, colBlockDim, bscVal, bscRowInd, bscColPtr, &
                                   copyValues, idxBase, temp_buffer) &
       result(Dgebsr2gebsc) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDgebsr2gebsc")
#else
       bind(C, name="hipsparseDgebsr2gebsc")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: mb
       integer(c_int), value :: nb
       integer(c_int), value :: nnzb
       real(c_double) :: bsrVal(*)
       integer(c_int) :: bsrRowPtr(*)
       integer(c_int) :: bsrColInd(*)
       integer(c_int), value :: rowBlockDim
       integer(c_int), value :: colBlockDim
       real(c_double) :: bscVal(*)
       integer(c_int) :: bscRowInd(*)
       integer(c_int) :: bscColPtr(*)
       integer(c_int), value :: copyValues
       integer(c_int), value :: idxBase
       type(c_ptr), value :: temp_buffer
       integer(c_int) :: Dgebsr2gebsc
    end function hipsparseDgebsr2gebsc

    !---------------------------------------------
    ! hipsparseCgebsr2gebsc
    !---------------------------------------------
    function hipsparseCgebsr2gebsc(handle, mb, nb, nnzb, bsrVal, bsrRowPtr, bsrColInd, &
                                   rowBlockDim, colBlockDim, bscVal, bscRowInd, bscColPtr, &
                                   copyValues, idxBase, temp_buffer) &
       result(Cgebsr2gebsc) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCgebsr2gebsc")
#else
       bind(C, name="hipsparseCgebsr2gebsc")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: mb
       integer(c_int), value :: nb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: bsrVal
       integer(c_int) :: bsrRowPtr(*)
       integer(c_int) :: bsrColInd(*)
       integer(c_int), value :: rowBlockDim
       integer(c_int), value :: colBlockDim
       type(c_ptr), value :: bscVal
       integer(c_int) :: bscRowInd(*)
       integer(c_int) :: bscColPtr(*)
       integer(c_int), value :: copyValues
       integer(c_int), value :: idxBase
       type(c_ptr), value :: temp_buffer
       integer(c_int) :: Cgebsr2gebsc
    end function hipsparseCgebsr2gebsc

    !---------------------------------------------
    ! hipsparseZgebsr2gebsc
    !---------------------------------------------
    function hipsparseZgebsr2gebsc(handle, mb, nb, nnzb, bsrVal, bsrRowPtr, bsrColInd, &
                                   rowBlockDim, colBlockDim, bscVal, bscRowInd, bscColPtr, &
                                   copyValues, idxBase, temp_buffer) &
       result(Zgebsr2gebsc) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZgebsr2gebsc")
#else
       bind(C, name="hipsparseZgebsr2gebsc")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: mb
       integer(c_int), value :: nb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: bsrVal
       integer(c_int) :: bsrRowPtr(*)
       integer(c_int) :: bsrColInd(*)
       integer(c_int), value :: rowBlockDim
       integer(c_int), value :: colBlockDim
       type(c_ptr), value :: bscVal
       integer(c_int) :: bscRowInd(*)
       integer(c_int) :: bscColPtr(*)
       integer(c_int), value :: copyValues
       integer(c_int), value :: idxBase
       type(c_ptr), value :: temp_buffer
       integer(c_int) :: Zgebsr2gebsc
    end function hipsparseZgebsr2gebsc

    !---------------------------------------------
    ! hipsparseSgebsr2gebsr_bufferSize
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief
    !> This function computes the the size of the user-allocated temporary storage buffer used when
    !> converting a sparse
    !> GEBSR matrix to another sparse GEBSR matrix.
    !>
    !> \details
    !> \p hipsparseXgebsr2gebsr_bufferSize returns the size of the temporary storage buffer that is
    !> required by
    !> \ref hipsparseXgebsr2gebsrNnz() and \ref hipsparseSgebsr2gebsr "hipsparseXgebsr2gebsr()". The
    !> temporary storage
    !> buffer must be allocated by the user.
    !>
    !> @param[in]
    !> handle             handle to the hipSPARSE library context queue.
    !> @param[in]
    !> dirA the storage format of the blocks, \ref HIPSPARSE_DIRECTION_ROW or \ref
    !> HIPSPARSE_DIRECTION_COLUMN.
    !> @param[in]
    !> mb                 number of block rows of the general BSR sparse matrix \f$A\f$.
    !> @param[in]
    !> nb                 number of block columns of the general BSR sparse matrix \f$A\f$.
    !> @param[in]
    !> nnzb               number of blocks in the general BSR sparse matrix \f$A\f$.
    !> @param[in]
    !> descrA the descriptor of the general BSR sparse matrix \f$A\f$. The supported matrix type is
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL and any valid value of the \ref hipsparseIndexBase_t.
    !> @param[in]
    !> bsrValA array of \p nnzb*rowBlockDimA*colBlockDimA containing the values of the sparse
    !> general BSR matrix \f$A\f$.
    !> @param[in]
    !> bsrRowPtrA array of \p mb+1 elements that point to the start of every block row of the
    !> sparse general BSR matrix \f$A\f$.
    !> @param[in]
    !> bsrColIndA array of \p nnzb elements containing the block column indices of the sparse
    !> general BSR matrix \f$A\f$.
    !> @param[in]
    !> rowBlockDimA       row size of the blocks in the sparse general BSR matrix \f$A\f$.
    !> @param[in]
    !> colBlockDimA       column size of the blocks in the sparse general BSR matrix \f$A\f$.
    !> @param[in]
    !> rowBlockDimC       row size of the blocks in the sparse general BSR matrix \f$C\f$.
    !> @param[in]
    !> colBlockDimC       column size of the blocks in the sparse general BSR matrix \f$C\f$.
    !> @param[out]
    !> pBufferSizeInBytes number of bytes of the temporary storage buffer required by
    !> hipsparseXgebsr2gebsrNnz(),
    !> hipsparseSgebsr2gebsr(), hipsparseDgebsr2gebsr(), hipsparseCgebsr2gebsr(), and
    !> hipsparseZgebsr2gebsr().
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p mb, \p nb, \p nnzb, \p rowBlockDimA, \p
    !> colBlockDimA,
    !> \p rowBlockDimC, \p colBlockDimC, \p bsrRowPtrA, \p bsrColIndA, \p descrA, or \p
    !> pBufferSizeInBytes pointer
    !> is invalid.
    function hipsparseSgebsr2gebsr_bufferSize(handle, dirA, mb, nb, nnzb, descrA, bsrValA, &
                                              bsrRowPtrA, bsrColIndA, rowBlockDimA, colBlockDimA, &
                                              rowBlockDimC, colBlockDimC, pBufferSizeInBytes) &
       result(Sgebsr2gebsr_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSgebsr2gebsr_bufferSize")
#else
       bind(C, name="hipsparseSgebsr2gebsr_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       real(c_float) :: bsrValA(*)
       integer(c_int) :: bsrRowPtrA(*)
       integer(c_int) :: bsrColIndA(*)
       integer(c_int), value :: rowBlockDimA
       integer(c_int), value :: colBlockDimA
       integer(c_int), value :: rowBlockDimC
       integer(c_int), value :: colBlockDimC
       integer(c_int) :: pBufferSizeInBytes(*)
       integer(c_int) :: Sgebsr2gebsr_bufferSize
    end function hipsparseSgebsr2gebsr_bufferSize

    !---------------------------------------------
    ! hipsparseDgebsr2gebsr_bufferSize
    !---------------------------------------------
    function hipsparseDgebsr2gebsr_bufferSize(handle, dirA, mb, nb, nnzb, descrA, bsrValA, &
                                              bsrRowPtrA, bsrColIndA, rowBlockDimA, colBlockDimA, &
                                              rowBlockDimC, colBlockDimC, pBufferSizeInBytes) &
       result(Dgebsr2gebsr_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDgebsr2gebsr_bufferSize")
#else
       bind(C, name="hipsparseDgebsr2gebsr_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       real(c_double) :: bsrValA(*)
       integer(c_int) :: bsrRowPtrA(*)
       integer(c_int) :: bsrColIndA(*)
       integer(c_int), value :: rowBlockDimA
       integer(c_int), value :: colBlockDimA
       integer(c_int), value :: rowBlockDimC
       integer(c_int), value :: colBlockDimC
       integer(c_int) :: pBufferSizeInBytes(*)
       integer(c_int) :: Dgebsr2gebsr_bufferSize
    end function hipsparseDgebsr2gebsr_bufferSize

    !---------------------------------------------
    ! hipsparseCgebsr2gebsr_bufferSize
    !---------------------------------------------
    function hipsparseCgebsr2gebsr_bufferSize(handle, dirA, mb, nb, nnzb, descrA, bsrValA, &
                                              bsrRowPtrA, bsrColIndA, rowBlockDimA, colBlockDimA, &
                                              rowBlockDimC, colBlockDimC, pBufferSizeInBytes) &
       result(Cgebsr2gebsr_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCgebsr2gebsr_bufferSize")
#else
       bind(C, name="hipsparseCgebsr2gebsr_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       type(c_ptr), value :: bsrValA
       integer(c_int) :: bsrRowPtrA(*)
       integer(c_int) :: bsrColIndA(*)
       integer(c_int), value :: rowBlockDimA
       integer(c_int), value :: colBlockDimA
       integer(c_int), value :: rowBlockDimC
       integer(c_int), value :: colBlockDimC
       integer(c_int) :: pBufferSizeInBytes(*)
       integer(c_int) :: Cgebsr2gebsr_bufferSize
    end function hipsparseCgebsr2gebsr_bufferSize

    !---------------------------------------------
    ! hipsparseZgebsr2gebsr_bufferSize
    !---------------------------------------------
    function hipsparseZgebsr2gebsr_bufferSize(handle, dirA, mb, nb, nnzb, descrA, bsrValA, &
                                              bsrRowPtrA, bsrColIndA, rowBlockDimA, colBlockDimA, &
                                              rowBlockDimC, colBlockDimC, pBufferSizeInBytes) &
       result(Zgebsr2gebsr_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZgebsr2gebsr_bufferSize")
#else
       bind(C, name="hipsparseZgebsr2gebsr_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       type(c_ptr), value :: bsrValA
       integer(c_int) :: bsrRowPtrA(*)
       integer(c_int) :: bsrColIndA(*)
       integer(c_int), value :: rowBlockDimA
       integer(c_int), value :: colBlockDimA
       integer(c_int), value :: rowBlockDimC
       integer(c_int), value :: colBlockDimC
       integer(c_int) :: pBufferSizeInBytes(*)
       integer(c_int) :: Zgebsr2gebsr_bufferSize
    end function hipsparseZgebsr2gebsr_bufferSize

    !---------------------------------------------
    ! hipsparseXgebsr2gebsrNnz
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief This function is used when converting a GEBSR sparse matrix \f$A\f$ to another GEBSR
    !> sparse matrix \f$C\f$.
    !> Specifically, this function determines the number of non-zero blocks that will exist in
    !> \f$C\f$ (stored using either a host
    !> or device pointer) and computes the row pointer array for \f$C\f$.
    !>
    !> \details
    !> The routine supports asynchronous execution.
    !>
    !> @param[in]
    !> handle             handle to the hipSPARSE library context queue.
    !> @param[in]
    !> dirA the storage format of the blocks, \ref HIPSPARSE_DIRECTION_ROW or \ref
    !> HIPSPARSE_DIRECTION_COLUMN.
    !> @param[in]
    !> mb                 number of block rows of the general BSR sparse matrix \f$A\f$.
    !> @param[in]
    !> nb                 number of block columns of the general BSR sparse matrix \f$A\f$.
    !> @param[in]
    !> nnzb               number of blocks in the general BSR sparse matrix \f$A\f$.
    !> @param[in]
    !> descrA the descriptor of the general BSR sparse matrix \f$A\f$. The supported matrix type is
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL and any valid value of the \ref hipsparseIndexBase_t.
    !> @param[in]
    !> bsrRowPtrA array of \p mb+1 elements that point to the start of every block row of the
    !> sparse general BSR matrix \f$A\f$.
    !> @param[in]
    !> bsrColIndA array of \p nnzb elements containing the block column indices of the sparse
    !> general BSR matrix \p A.
    !> @param[in]
    !> rowBlockDimA       row size of the blocks in the sparse general BSR matrix \f$A\f$.
    !> @param[in]
    !> colBlockDimA       column size of the blocks in the sparse general BSR matrix \f$A\f$.
    !> @param[in]
    !> descrC the descriptor of the general BSR sparse matrix \f$C\f$. The supported matrix type is
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL and any valid value of the \ref hipsparseIndexBase_t.
    !> @param[in]
    !> bsrRowPtrC array of \p mbC+1 elements that point to the start of every block row of the
    !> sparse general BSR matrix \f$C\f$ where \p mbC = ( \p m+rowBlockDimC-1 ) / \p rowBlockDimC.
    !> @param[in]
    !> rowBlockDimC       row size of the blocks in the sparse general BSR matrix \f$C\f$.
    !> @param[in]
    !> colBlockDimC       column size of the blocks in the sparse general BSR matrix \f$C\f$.
    !> @param[out]
    !> nnzTotalDevHostPtr total number of non-zero blocks in general BSR sparse matrix \f$C\f$,
    !> stored using device or host memory.
    !> @param[out]
    !> buffer buffer allocated by the user. The size is determined by calling \ref
    !> hipsparseSgebsr2gebsr_bufferSize
    !> "hipsparseXgebsr2gebsr_bufferSize()".
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p mb, \p nb, \p nnzb, \p rowBlockDimA, \p
    !> colBlockDimA, \p rowBlockDimC,
    !> \p colBlockDimC, \p bsrRowPtrA, \p bsrColIndA, \p bsrRowPtrC, \p descrA, \p descrC, \p buffer
    !> pointer is invalid.
    function hipsparseXgebsr2gebsrNnz(handle, dirA, mb, nb, nnzb, descrA, bsrRowPtrA, bsrColIndA, &
                                      rowBlockDimA, colBlockDimA, descrC, bsrRowPtrC, &
                                      rowBlockDimC, colBlockDimC, nnzTotalDevHostPtr, buffer) &
       result(Xgebsr2gebsrNnz) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseXgebsr2gebsrNnz")
#else
       bind(C, name="hipsparseXgebsr2gebsrNnz")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       integer(c_int) :: bsrRowPtrA(*)
       integer(c_int) :: bsrColIndA(*)
       integer(c_int), value :: rowBlockDimA
       integer(c_int), value :: colBlockDimA
       type(c_ptr), value :: descrC
       integer(c_int) :: bsrRowPtrC(*)
       integer(c_int), value :: rowBlockDimC
       integer(c_int), value :: colBlockDimC
       integer(c_int) :: nnzTotalDevHostPtr(*)
       type(c_ptr), value :: buffer
       integer(c_int) :: Xgebsr2gebsrNnz
    end function hipsparseXgebsr2gebsrNnz

    !---------------------------------------------
    ! hipsparseSgebsr2gebsr
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief
    !> This function converts the GEBSR sparse matrix \f$A\f$ to another GEBSR sparse matrix
    !> \f$C\f$.
    !>
    !> \details
    !> The conversion uses three steps. First, the user calls \ref hipsparseSgebsr2gebsr_bufferSize
    !> "hipsparseXgebsr2gebsr_bufferSize()" to determine the size of the required temporary storage
    !> buffer.
    !> The user then allocates this buffer. Secondly, the user then allocates \p mbC+1 integers for
    !> the row
    !> pointer array for \f$C\f$ where:
    !> \f[
    !> \begin{align}
    !> \text{mbC} &= \text{(m - 1) / rowBlockDimC + 1} \\
    !> \text{nbC} &= \text{(n - 1) / colBlockDimC + 1}
    !> \end{align}
    !> \f]
    !> The user then calls hipsparseXgebsr2gebsrNnz() to fill in the row pointer array for \f$C\f$ (
    !> \p bsrRowPtrC ) and
    !> determine the number of non-zero blocks that will exist in \f$C\f$. Finally, the user
    !> allocates space for the column
    !> indices array of \f$C\f$ to have \p nnzbC elements and space for the values array of \f$C\f$
    !> to have
    !> \p nnzbC*rowBlockDimC*colBlockDimC and then calls \p hipsparseXgebsr2gebsr to complete the
    !> conversion.
    !>
    !> It could be the case that \p rowBlockDimC does not divide evenly into \p m or \p colBlockDim
    !> does not divide evenly
    !> into \p n. In these cases, the GEBSR matrix is expanded in size to fit full GEBSR blocks. For
    !> example, if
    !> the original GEBSR matrix A (using \p rowBlockDimA=2, \p colBlockDimA=3) looks like:
    !>
    !> \f[
    !> \left[
    !> \begin{array}{c | c}
    !> \begin{array}{c c c}
    !> 1 & 0 & 0 \\
    !> 3 & 4 & 0
    !> \end{array} &
    !> \begin{array}{c c c}
    !> 2 & 0 & 0 \\
    !> 4 & 5 & 6
    !> \end{array} \\
    !> \hline
    !> \begin{array}{c c c}
    !> 1 & 2 & 3 \\
    !> 1 & 2 & 0
    !> \end{array} &
    !> \begin{array}{c c c}
    !> 4 & 0 & 0 \\
    !> 3 & 0 & 1
    !> \end{array} \\
    !> \end{array}
    !> \right]
    !> \f]
    !>
    !> then if the user specifies \p rowBlockDimC=3 and \p colBlockDimC=2, the output GEBSR matrix C
    !> would be:
    !>
    !> \f[
    !> \left[
    !> \begin{array}{c | c | c}
    !> \begin{array}{c c}
    !> 1 & 0 \\
    !> 3 & 4 \\
    !> 1 & 2
    !> \end{array} &
    !> \begin{array}{c c}
    !> 0 & 2 \\
    !> 0 & 4 \\
    !> 3 & 4
    !> \end{array} &
    !> \begin{array}{c c}
    !> 0 & 0 \\
    !> 5 & 6 \\
    !> 0 & 0
    !> \end{array} \\
    !> \hline
    !> \begin{array}{c c}
    !> 1 & 2 \\
    !> 0 & 0 \\
    !> 0 & 0
    !> \end{array} &
    !> \begin{array}{c c}
    !> 0 & 3 \\
    !> 0 & 0 \\
    !> 0 & 0
    !> \end{array} &
    !> \begin{array}{c c}
    !> 0 & 1 \\
    !> 0 & 0 \\
    !> 0 & 0
    !> \end{array} \\
    !> \end{array}
    !> \right]
    !> \f]
    !>
    !> @param[in]
    !> handle        handle to the hipSPARSE library context queue.
    !> @param[in]
    !> dirA the storage format of the blocks, \ref HIPSPARSE_DIRECTION_ROW or \ref
    !> HIPSPARSE_DIRECTION_COLUMN.
    !> @param[in]
    !> mb            number of block rows of the general BSR sparse matrix \f$A\f$.
    !> @param[in]
    !> nb            number of block columns of the general BSR sparse matrix \f$A\f$.
    !> @param[in]
    !> nnzb          number of blocks in the general BSR sparse matrix \f$A\f$.
    !> @param[in]
    !> descrA the descriptor of the general BSR sparse matrix \f$A\f$. The supported matrix type is
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL and also any valid value of the \ref hipsparseIndexBase_t.
    !> @param[in]
    !> bsrValA array of \p nnzb*rowBlockDimA*colBlockDimA containing the values of the sparse
    !> general BSR matrix \f$A\f$.
    !> @param[in]
    !> bsrRowPtrA    array of \p mb+1 elements that point to the start of every block row of the
    !> sparse general BSR matrix \f$A\f$.
    !> @param[in]
    !> bsrColIndA array of \p nnzb elements containing the block column indices of the sparse
    !> general BSR matrix \f$A\f$.
    !> @param[in]
    !> rowBlockDimA  row size of the blocks in the sparse general BSR matrix \f$A\f$.
    !> @param[in]
    !> colBlockDimA  column size of the blocks in the sparse general BSR matrix \f$A\f$.
    !> @param[in]
    !> descrC the descriptor of the general BSR sparse matrix \f$C\f$. The supported matrix type is
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL and any valid value of the \ref hipsparseIndexBase_t.
    !> @param[in]
    !> bsrValC array of \p nnzbC*rowBlockDimC*colBlockDimC containing the values of the sparse
    !> general BSR matrix \f$C\f$.
    !> @param[in]
    !> bsrRowPtrC    array of \p mbC+1 elements that point to the start of every block row of the
    !> sparse general BSR matrix \f$C\f$.
    !> @param[in]
    !> bsrColIndC array of \p nnzbC elements containing the block column indices of the sparse
    !> general BSR matrix \f$C\f$.
    !> @param[in]
    !> rowBlockDimC  row size of the blocks in the sparse general BSR matrix \f$C\f$.
    !> @param[in]
    !> colBlockDimC  column size of the blocks in the sparse general BSR matrix \f$C\f$.
    !> @param[out]
    !> buffer buffer allocated by the user. The size is determined by calling \ref
    !> hipsparseSgebsr2gebsr_bufferSize
    !> "hipsparseXgebsr2gebsr_bufferSize()".
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p mb, \p nb, \p nnzb, \p rowBlockDimA, \p
    !> colBlockDimA,
    !> \p rowBlockDimC, \p colBlockDimC, \p bsrRowPtrA, \p bsrColIndA, \p bsrValA, \p bsrRowPtrC, \p
    !> bsrColIndC,
    !> \p bsrValC, \p descrA, \p descrC, or \p buffer pointer is invalid.
    function hipsparseSgebsr2gebsr(handle, dirA, mb, nb, nnzb, descrA, bsrValA, bsrRowPtrA, &
                                   bsrColIndA, rowBlockDimA, colBlockDimA, descrC, bsrValC, &
                                   bsrRowPtrC, bsrColIndC, rowBlockDimC, colBlockDimC, buffer) &
       result(Sgebsr2gebsr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSgebsr2gebsr")
#else
       bind(C, name="hipsparseSgebsr2gebsr")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       real(c_float) :: bsrValA(*)
       integer(c_int) :: bsrRowPtrA(*)
       integer(c_int) :: bsrColIndA(*)
       integer(c_int), value :: rowBlockDimA
       integer(c_int), value :: colBlockDimA
       type(c_ptr), value :: descrC
       real(c_float) :: bsrValC(*)
       integer(c_int) :: bsrRowPtrC(*)
       integer(c_int) :: bsrColIndC(*)
       integer(c_int), value :: rowBlockDimC
       integer(c_int), value :: colBlockDimC
       type(c_ptr), value :: buffer
       integer(c_int) :: Sgebsr2gebsr
    end function hipsparseSgebsr2gebsr

    !---------------------------------------------
    ! hipsparseDgebsr2gebsr
    !---------------------------------------------
    function hipsparseDgebsr2gebsr(handle, dirA, mb, nb, nnzb, descrA, bsrValA, bsrRowPtrA, &
                                   bsrColIndA, rowBlockDimA, colBlockDimA, descrC, bsrValC, &
                                   bsrRowPtrC, bsrColIndC, rowBlockDimC, colBlockDimC, buffer) &
       result(Dgebsr2gebsr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDgebsr2gebsr")
#else
       bind(C, name="hipsparseDgebsr2gebsr")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       real(c_double) :: bsrValA(*)
       integer(c_int) :: bsrRowPtrA(*)
       integer(c_int) :: bsrColIndA(*)
       integer(c_int), value :: rowBlockDimA
       integer(c_int), value :: colBlockDimA
       type(c_ptr), value :: descrC
       real(c_double) :: bsrValC(*)
       integer(c_int) :: bsrRowPtrC(*)
       integer(c_int) :: bsrColIndC(*)
       integer(c_int), value :: rowBlockDimC
       integer(c_int), value :: colBlockDimC
       type(c_ptr), value :: buffer
       integer(c_int) :: Dgebsr2gebsr
    end function hipsparseDgebsr2gebsr

    !---------------------------------------------
    ! hipsparseCgebsr2gebsr
    !---------------------------------------------
    function hipsparseCgebsr2gebsr(handle, dirA, mb, nb, nnzb, descrA, bsrValA, bsrRowPtrA, &
                                   bsrColIndA, rowBlockDimA, colBlockDimA, descrC, bsrValC, &
                                   bsrRowPtrC, bsrColIndC, rowBlockDimC, colBlockDimC, buffer) &
       result(Cgebsr2gebsr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCgebsr2gebsr")
#else
       bind(C, name="hipsparseCgebsr2gebsr")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       type(c_ptr), value :: bsrValA
       integer(c_int) :: bsrRowPtrA(*)
       integer(c_int) :: bsrColIndA(*)
       integer(c_int), value :: rowBlockDimA
       integer(c_int), value :: colBlockDimA
       type(c_ptr), value :: descrC
       type(c_ptr), value :: bsrValC
       integer(c_int) :: bsrRowPtrC(*)
       integer(c_int) :: bsrColIndC(*)
       integer(c_int), value :: rowBlockDimC
       integer(c_int), value :: colBlockDimC
       type(c_ptr), value :: buffer
       integer(c_int) :: Cgebsr2gebsr
    end function hipsparseCgebsr2gebsr

    !---------------------------------------------
    ! hipsparseZgebsr2gebsr
    !---------------------------------------------
    function hipsparseZgebsr2gebsr(handle, dirA, mb, nb, nnzb, descrA, bsrValA, bsrRowPtrA, &
                                   bsrColIndA, rowBlockDimA, colBlockDimA, descrC, bsrValC, &
                                   bsrRowPtrC, bsrColIndC, rowBlockDimC, colBlockDimC, buffer) &
       result(Zgebsr2gebsr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZgebsr2gebsr")
#else
       bind(C, name="hipsparseZgebsr2gebsr")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: mb
       integer(c_int), value :: nb
       integer(c_int), value :: nnzb
       type(c_ptr), value :: descrA
       type(c_ptr), value :: bsrValA
       integer(c_int) :: bsrRowPtrA(*)
       integer(c_int) :: bsrColIndA(*)
       integer(c_int), value :: rowBlockDimA
       integer(c_int), value :: colBlockDimA
       type(c_ptr), value :: descrC
       type(c_ptr), value :: bsrValC
       integer(c_int) :: bsrRowPtrC(*)
       integer(c_int) :: bsrColIndC(*)
       integer(c_int), value :: rowBlockDimC
       integer(c_int), value :: colBlockDimC
       type(c_ptr), value :: buffer
       integer(c_int) :: Zgebsr2gebsr
    end function hipsparseZgebsr2gebsr

    !---------------------------------------------
    ! hipsparseShyb2csr
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief Convert a sparse HYB matrix into a sparse CSR matrix.
    !>
    !> \details
    !> \p hipsparseXhyb2csr converts a HYB matrix into a CSR matrix.
    !>
    !> \note
    !> This function is non-blocking and executed asynchronously with respect to the host.
    !> It can return before the actual computation has finished.
    !>
    !> \deprecated
    !> This function is deprecated when using the CUDA backend (CUDA 10.0+) and will be
    !> removed in CUDA 11.0. This deprecation does not apply to the ROCm backend.
    !>
    !> @param[in]
    !> handle            handle to the hipSPARSE library context queue.
    !> @param[in]
    !> descrA            descriptor of the sparse HYB matrix. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> hybA              sparse matrix in HYB format.
    !> @param[out]
    !> csrSortedValA     array containing the values of the sparse CSR matrix.
    !> @param[out]
    !> csrSortedRowPtrA  array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix.
    !> @param[out]
    !> csrSortedColIndA  array containing the column indices of the sparse CSR matrix.
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p descrA, \p hybA, \p csrSortedValA,
    !> \p csrSortedRowPtrA, or \p csrSortedColIndA is nullptr.
    !> \retval HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    !> \retval HIPSPARSE_STATUS_NOT_SUPPORTED \ref hipsparseMatrixType_t != \ref
    !> HIPSPARSE_MATRIX_TYPE_GENERAL.
    function hipsparseShyb2csr(handle, descrA, hybA, csrSortedValA, csrSortedRowPtrA, &
                               csrSortedColIndA) &
       result(Shyb2csr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseShyb2csr")
#else
       bind(C, name="hipsparseShyb2csr")
#endif
       import :: c_ptr, c_float, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: descrA
       type(c_ptr), value :: hybA
       real(c_float) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       integer(c_int) :: Shyb2csr
    end function hipsparseShyb2csr

    !---------------------------------------------
    ! hipsparseDhyb2csr
    !---------------------------------------------
    function hipsparseDhyb2csr(handle, descrA, hybA, csrSortedValA, csrSortedRowPtrA, &
                               csrSortedColIndA) &
       result(Dhyb2csr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDhyb2csr")
#else
       bind(C, name="hipsparseDhyb2csr")
#endif
       import :: c_ptr, c_double, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: descrA
       type(c_ptr), value :: hybA
       real(c_double) :: csrSortedValA(*)
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       integer(c_int) :: Dhyb2csr
    end function hipsparseDhyb2csr

    !---------------------------------------------
    ! hipsparseChyb2csr
    !---------------------------------------------
    function hipsparseChyb2csr(handle, descrA, hybA, csrSortedValA, csrSortedRowPtrA, &
                               csrSortedColIndA) &
       result(Chyb2csr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseChyb2csr")
#else
       bind(C, name="hipsparseChyb2csr")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: descrA
       type(c_ptr), value :: hybA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       integer(c_int) :: Chyb2csr
    end function hipsparseChyb2csr

    !---------------------------------------------
    ! hipsparseZhyb2csr
    !---------------------------------------------
    function hipsparseZhyb2csr(handle, descrA, hybA, csrSortedValA, csrSortedRowPtrA, &
                               csrSortedColIndA) &
       result(Zhyb2csr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZhyb2csr")
#else
       bind(C, name="hipsparseZhyb2csr")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: descrA
       type(c_ptr), value :: hybA
       type(c_ptr), value :: csrSortedValA
       integer(c_int) :: csrSortedRowPtrA(*)
       integer(c_int) :: csrSortedColIndA(*)
       integer(c_int) :: Zhyb2csr
    end function hipsparseZhyb2csr

    !---------------------------------------------
    ! hipsparseSnnz
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief
    !> \p hipsparseXnnz computes the number of non-zero elements per row or column and the total
    !> number of non-zero elements in a dense matrix.
    !>
    !> \details
    !> For example, given the dense matrix:
    !> \f[
    !> \begin{bmatrix}
    !> 1 & 0 & 0 & 2 \\
    !> 3 & 4 & 0 & 0 \\
    !> 5 & 0 & 6 & 7
    !> \end{bmatrix}
    !> \f]
    !>
    !> using \p dirA == \ref HIPSPARSE_DIRECTION_ROW results in:
    !> \f[
    !> \begin{align}
    !> \text{nnzPerRowColumn} &= \begin{bmatrix} 2 & 2 & 3 \end{bmatrix} \\
    !> \text{nnzTotalDevHostPtr} &= 7
    !> \end{align}
    !> \f]
    !>
    !> while using \p dirA == \ref HIPSPARSE_DIRECTION_COLUMN results in:
    !> \f[
    !> \begin{align}
    !> \text{nnzPerRowColumn} &= \begin{bmatrix} 3 & 1 & 1 & 2 \end{bmatrix} \\
    !> \text{nnzTotalDevHostPtr} &= 7
    !> \end{align}
    !> \f]
    !>
    !> The array \p nnzPerRowColumn must be allocated by the user before calling \p hipsparseXnnz
    !> and
    !> has length equal to \p m if \p dirA == \ref HIPSPARSE_DIRECTION_ROW or \p n if
    !> \p dirA == \ref HIPSPARSE_DIRECTION_COLUMN.
    !>
    !> For a complete code example showing its usage, see the example found with
    !> hipsparseSdense2csr().
    !>
    !> \note
    !> As indicated, \p nnzTotalDevHostPtr can point either to host or device memory. This is
    !> controlled
    !> by setting the pointer mode. See \ref hipsparseSetPointerMode().
    !>
    !> \note
    !> The routine supports asynchronous execution if the pointer mode is set to device.
    !>
    !> @param[in]
    !> handle             handle to the hipSPARSE library context queue.
    !> @param[in]
    !> dirA direction that specifies whether to count non-zero elements by \ref
    !> HIPSPARSE_DIRECTION_ROW
    !> or by \ref HIPSPARSE_DIRECTION_COLUMN.
    !> @param[in]
    !> m                  number of rows of the dense matrix \p A. Must be non-negative.
    !> @param[in]
    !> n                  number of columns of the dense matrix \p A. Must be non-negative.
    !> @param[in]
    !> descrA             the descriptor of the dense matrix \p A.
    !> @param[in]
    !> A                  array of dimensions (\p lda, \p n).
    !> @param[in]
    !> lda                leading dimension of dense array \p A. Must be at least \p m.
    !> @param[out]
    !> nnzPerRowColumn array of size \p m or \p n containing the number of non-zero elements per row
    !> or column, respectively.
    !> @param[out]
    !> nnzTotalDevHostPtr total number of non-zero elements in device or host memory.
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p descrA, \p A, \p nnzPerRowColumn,
    !> or \p nnzTotalDevHostPtr is nullptr, \p m or \p n is negative, or \p lda is invalid.
    function hipsparseSnnz(handle, dirA, m, n, descrA, A, lda, nnzPerRowColumn, &
                           nnzTotalDevHostPtr) &
       result(Snnz) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSnnz")
#else
       bind(C, name="hipsparseSnnz")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: descrA
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: nnzPerRowColumn(*)
       integer(c_int) :: nnzTotalDevHostPtr(*)
       integer(c_int) :: Snnz
    end function hipsparseSnnz

    !---------------------------------------------
    ! hipsparseDnnz
    !---------------------------------------------
    function hipsparseDnnz(handle, dirA, m, n, descrA, A, lda, nnzPerRowColumn, &
                           nnzTotalDevHostPtr) &
       result(Dnnz) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDnnz")
#else
       bind(C, name="hipsparseDnnz")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: descrA
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       integer(c_int) :: nnzPerRowColumn(*)
       integer(c_int) :: nnzTotalDevHostPtr(*)
       integer(c_int) :: Dnnz
    end function hipsparseDnnz

    !---------------------------------------------
    ! hipsparseCnnz
    !---------------------------------------------
    function hipsparseCnnz(handle, dirA, m, n, descrA, A, lda, nnzPerRowColumn, &
                           nnzTotalDevHostPtr) &
       result(Cnnz) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCnnz")
#else
       bind(C, name="hipsparseCnnz")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: descrA
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: nnzPerRowColumn(*)
       integer(c_int) :: nnzTotalDevHostPtr(*)
       integer(c_int) :: Cnnz
    end function hipsparseCnnz

    !---------------------------------------------
    ! hipsparseZnnz
    !---------------------------------------------
    function hipsparseZnnz(handle, dirA, m, n, descrA, A, lda, nnzPerRowColumn, &
                           nnzTotalDevHostPtr) &
       result(Znnz) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZnnz")
#else
       bind(C, name="hipsparseZnnz")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: dirA
       integer(c_int), value :: m
       integer(c_int), value :: n
       type(c_ptr), value :: descrA
       type(c_ptr), value :: A
       integer(c_int), value :: lda
       integer(c_int) :: nnzPerRowColumn(*)
       integer(c_int) :: nnzTotalDevHostPtr(*)
       integer(c_int) :: Znnz
    end function hipsparseZnnz

    !---------------------------------------------
    ! hipsparseSnnz_compress
    !---------------------------------------------
    !> \ingroup conv_module
    !> This function is used as the first step in converting a CSR matrix to a compressed CSR
    !> matrix.
    !>
    !> \details
    !> Given a sparse CSR matrix and a non-negative tolerance, this function computes how many
    !> entries would be left
    !> in each row of the matrix if elements less than the tolerance were removed. It also computes
    !> the total number
    !> of remaining elements in the matrix.
    !>
    !> Given an input sparse matrix \f$A\f$ in CSR format, the resulting compressed sparse CSR
    !> matrix \f$C\f$ is
    !> computed using:
    !> \f[
    !> C(i,j) = A(i, j) \text{  if |A(i, j)| > tol}
    !> \f]
    !>
    !> The user first allocates \p nnzPerRow with size \p m elements, then calls \p
    !> hipsparseXnnz_compress.
    !> The function fills in the \p nnzPerRow array and sets the total number of non-zeros found in
    !> \p nnzC.
    !>
    !> See hipsparseScsr2csr_compress() for a full code example.
    !>
    !> \note
    !> In the case of complex matrices, only the magnitude of the real part of \p tol is used.
    !>
    !> @param[in]
    !> handle        handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m             number of rows of the sparse CSR matrix.
    !> @param[in]
    !> descrA        the descriptor of the sparse CSR matrix.
    !> @param[in]
    !> csrValA       array of \p nnzA elements of the sparse CSR matrix.
    !> @param[in]
    !> csrRowPtrA    array of \p m+1 elements that point to the start of every row of the
    !> uncompressed sparse CSR matrix.
    !> @param[out]
    !> nnzPerRow array of length \p m containing the number of entries that will be kept per row in
    !> the final compressed CSR matrix.
    !> @param[out]
    !> nnzC          number of elements in the column indices and values arrays of the compressed
    !> sparse CSR matrix. Can be either host or device pointer.
    !> @param[in]
    !> tol the non-negative tolerance used for compression. If \p tol is complex, then only the
    !> magnitude
    !> of the real part is used. Entries in the input uncompressed CSR array that are below the
    !> tolerance
    !> are removed in output compressed CSR matrix.
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p n, \p tol, \p csrValA, \p
    !> csrRowPtrA, \p nnzPerRow, or \p nnzC
    !> pointer is invalid.
    function hipsparseSnnz_compress(handle, m, descrA, csrValA, csrRowPtrA, nnzPerRow, nnzC, tol) &
       result(Snnz_compress) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSnnz_compress")
#else
       bind(C, name="hipsparseSnnz_compress")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       type(c_ptr), value :: descrA
       real(c_float) :: csrValA(*)
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: nnzPerRow(*)
       integer(c_int) :: nnzC(*)
       real(c_float), value :: tol
       integer(c_int) :: Snnz_compress
    end function hipsparseSnnz_compress

    !---------------------------------------------
    ! hipsparseDnnz_compress
    !---------------------------------------------
    function hipsparseDnnz_compress(handle, m, descrA, csrValA, csrRowPtrA, nnzPerRow, nnzC, tol) &
       result(Dnnz_compress) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDnnz_compress")
#else
       bind(C, name="hipsparseDnnz_compress")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       type(c_ptr), value :: descrA
       real(c_double) :: csrValA(*)
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: nnzPerRow(*)
       integer(c_int) :: nnzC(*)
       real(c_double), value :: tol
       integer(c_int) :: Dnnz_compress
    end function hipsparseDnnz_compress

    !---------------------------------------------
    ! hipsparseCnnz_compress
    !---------------------------------------------
    function hipsparseCnnz_compress(handle, m, descrA, csrValA, csrRowPtrA, nnzPerRow, nnzC, tol) &
       result(Cnnz_compress) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCnnz_compress")
#else
       bind(C, name="hipsparseCnnz_compress")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrValA
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: nnzPerRow(*)
       integer(c_int) :: nnzC(*)
       type(c_ptr), value :: tol
       integer(c_int) :: Cnnz_compress
    end function hipsparseCnnz_compress

    !---------------------------------------------
    ! hipsparseZnnz_compress
    !---------------------------------------------
    function hipsparseZnnz_compress(handle, m, descrA, csrValA, csrRowPtrA, nnzPerRow, nnzC, tol) &
       result(Znnz_compress) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZnnz_compress")
#else
       bind(C, name="hipsparseZnnz_compress")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrValA
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: nnzPerRow(*)
       integer(c_int) :: nnzC(*)
       type(c_ptr), value :: tol
       integer(c_int) :: Znnz_compress
    end function hipsparseZnnz_compress

    !---------------------------------------------
    ! hipsparseSpruneCsr2csr_bufferSize
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief Convert and prune a sparse CSR matrix into a sparse CSR matrix.
    !>
    !> \details
    !> \p hipsparseXpruneCsr2csr_bufferSize returns the size of the temporary buffer that
    !> is required by \p hipsparseXpruneCsr2csrNnz and \p hipsparseXpruneCsr2csr. The
    !> temporary storage buffer must be allocated by the user.
    !>
    !> @param[in]
    !> handle             handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m                  number of rows in the sparse CSR matrix.
    !> @param[in]
    !> n                  number of columns in the sparse CSR matrix.
    !> @param[in]
    !> nnzA               number of non-zeros in the sparse CSR matrix A.
    !> @param[in]
    !> descrA             descriptor of the sparse CSR matrix A. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> csrValA array of \p nnzA elements containing the values of the sparse CSR matrix A.
    !> @param[in]
    !> csrRowPtrA         array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix A.
    !> @param[in]
    !> csrColIndA array of \p nnzA elements containing the column indices of the sparse CSR matrix
    !> A.
    !> @param[in]
    !> threshold pointer to the non-negative pruning threshold, which can exist in either host or
    !> device memory.
    !> @param[in]
    !> descrC             descriptor of the sparse CSR matrix C. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> csrValC array of \p nnzC elements containing the values of the sparse CSR matrix C.
    !> @param[in]
    !> csrRowPtrC         array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix C.
    !> @param[in]
    !> csrColIndC array of \p nnzC elements containing the column indices of the sparse CSR matrix
    !> C.
    !> @param[out]
    !> pBufferSizeInBytes number of bytes of the temporary storage buffer required by
    !> hipsparseSpruneCsr2csrNnz(),
    !> hipsparseDpruneCsr2csrNnz(), hipsparseSpruneCsr2csr(), and hipsparseDpruneCsr2csr().
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle or \p pBufferSizeInBytes pointer is invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    function hipsparseSpruneCsr2csr_bufferSize(handle, m, n, nnzA, descrA, csrValA, csrRowPtrA, &
                                               csrColIndA, threshold, descrC, csrValC, csrRowPtrC, &
                                               csrColIndC, pBufferSizeInBytes) &
       result(SpruneCsr2csr_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpruneCsr2csr_bufferSize")
#else
       bind(C, name="hipsparseSpruneCsr2csr_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnzA
       type(c_ptr), value :: descrA
       real(c_float) :: csrValA(*)
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       real(c_float) :: threshold(*)
       type(c_ptr), value :: descrC
       real(c_float) :: csrValC(*)
       integer(c_int) :: csrRowPtrC(*)
       integer(c_int) :: csrColIndC(*)
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: SpruneCsr2csr_bufferSize
    end function hipsparseSpruneCsr2csr_bufferSize

    !---------------------------------------------
    ! hipsparseDpruneCsr2csr_bufferSize
    !---------------------------------------------
    function hipsparseDpruneCsr2csr_bufferSize(handle, m, n, nnzA, descrA, csrValA, csrRowPtrA, &
                                               csrColIndA, threshold, descrC, csrValC, csrRowPtrC, &
                                               csrColIndC, pBufferSizeInBytes) &
       result(DpruneCsr2csr_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDpruneCsr2csr_bufferSize")
#else
       bind(C, name="hipsparseDpruneCsr2csr_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnzA
       type(c_ptr), value :: descrA
       real(c_double) :: csrValA(*)
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       real(c_double) :: threshold(*)
       type(c_ptr), value :: descrC
       real(c_double) :: csrValC(*)
       integer(c_int) :: csrRowPtrC(*)
       integer(c_int) :: csrColIndC(*)
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: DpruneCsr2csr_bufferSize
    end function hipsparseDpruneCsr2csr_bufferSize

    !---------------------------------------------
    ! hipsparseSpruneCsr2csr_bufferSizeExt
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief Convert and prune sparse a CSR matrix into a sparse CSR matrix.
    !>
    !> \details
    !> \p hipsparseXpruneCsr2csr_bufferSizeExt returns the size of the temporary buffer that
    !> is required by \ref hipsparseSpruneCsr2csrNnz "hipsparseXpruneCsr2csrNnz()" and
    !> \ref hipsparseSpruneCsr2csr "hipsparseXpruneCsr2csr()". The temporary storage buffer
    !> must be allocated by the user.
    !>
    !> @param[in]
    !> handle             handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m                  number of rows in the sparse CSR matrix.
    !> @param[in]
    !> n                  number of columns in the sparse CSR matrix.
    !> @param[in]
    !> nnzA               number of non-zeros in the sparse CSR matrix A.
    !> @param[in]
    !> descrA             descriptor of the sparse CSR matrix A. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> csrValA array of \p nnzA elements containing the values of the sparse CSR matrix A.
    !> @param[in]
    !> csrRowPtrA         array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix A.
    !> @param[in]
    !> csrColIndA array of \p nnzA elements containing the column indices of the sparse CSR matrix
    !> A.
    !> @param[in]
    !> threshold pointer to the non-negative pruning threshold, which can exist in either host or
    !> device memory.
    !> @param[in]
    !> descrC             descriptor of the sparse CSR matrix C. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> csrValC array of \p nnzC elements containing the values of the sparse CSR matrix C.
    !> @param[in]
    !> csrRowPtrC         array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix C.
    !> @param[in]
    !> csrColIndC array of \p nnzC elements containing the column indices of the sparse CSR matrix
    !> C.
    !> @param[out]
    !> pBufferSizeInBytes number of bytes of the temporary storage buffer required by
    !> hipsparseSpruneCsr2csrNnz(),
    !> hipsparseDpruneCsr2csrNnz(), hipsparseSpruneCsr2csr(), and hipsparseDpruneCsr2csr().
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle or \p pBufferSizeInBytes pointer is invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    function hipsparseSpruneCsr2csr_bufferSizeExt(handle, m, n, nnzA, descrA, csrValA, csrRowPtrA, &
                                                  csrColIndA, threshold, descrC, csrValC, &
                                                  csrRowPtrC, csrColIndC, pBufferSizeInBytes) &
       result(SpruneCsr2csr_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpruneCsr2csr_bufferSizeExt")
#else
       bind(C, name="hipsparseSpruneCsr2csr_bufferSizeExt")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnzA
       type(c_ptr), value :: descrA
       real(c_float) :: csrValA(*)
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       real(c_float) :: threshold(*)
       type(c_ptr), value :: descrC
       real(c_float) :: csrValC(*)
       integer(c_int) :: csrRowPtrC(*)
       integer(c_int) :: csrColIndC(*)
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: SpruneCsr2csr_bufferSizeExt
    end function hipsparseSpruneCsr2csr_bufferSizeExt

    !---------------------------------------------
    ! hipsparseDpruneCsr2csr_bufferSizeExt
    !---------------------------------------------
    function hipsparseDpruneCsr2csr_bufferSizeExt(handle, m, n, nnzA, descrA, csrValA, csrRowPtrA, &
                                                  csrColIndA, threshold, descrC, csrValC, &
                                                  csrRowPtrC, csrColIndC, pBufferSizeInBytes) &
       result(DpruneCsr2csr_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDpruneCsr2csr_bufferSizeExt")
#else
       bind(C, name="hipsparseDpruneCsr2csr_bufferSizeExt")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnzA
       type(c_ptr), value :: descrA
       real(c_double) :: csrValA(*)
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       real(c_double) :: threshold(*)
       type(c_ptr), value :: descrC
       real(c_double) :: csrValC(*)
       integer(c_int) :: csrRowPtrC(*)
       integer(c_int) :: csrColIndC(*)
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: DpruneCsr2csr_bufferSizeExt
    end function hipsparseDpruneCsr2csr_bufferSizeExt

    !---------------------------------------------
    ! hipsparseSpruneCsr2csrNnz
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief Convert and prune sparse a CSR matrix into a sparse CSR matrix.
    !>
    !> \details
    !> \p hipsparseXpruneCsr2csrNnz computes the number of non-zero elements per row and the total
    !> number of non-zero elements in a sparse CSR matrix after elements less than the threshold are
    !> pruned from the matrix.
    !>
    !> \note The routine supports asynchronous execution if the pointer mode is set to device.
    !>
    !> @param[in]
    !> handle             handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m                  number of rows in the sparse CSR matrix.
    !> @param[in]
    !> n                  number of columns in the sparse CSR matrix.
    !> @param[in]
    !> nnzA               number of non-zeros in the sparse CSR matrix A.
    !> @param[in]
    !> descrA             descriptor of the sparse CSR matrix A. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> csrValA array of \p nnzA elements containing the values of the sparse CSR matrix A.
    !> @param[in]
    !> csrRowPtrA         array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix A.
    !> @param[in]
    !> csrColIndA array of \p nnzA elements containing the column indices of the sparse CSR matrix
    !> A.
    !> @param[in]
    !> threshold pointer to the non-negative pruning threshold which can exist in either host or
    !> device memory.
    !> @param[in]
    !> descrC             descriptor of the sparse CSR matrix C. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[out]
    !> csrRowPtrC         array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix C.
    !> @param[out]
    !> nnzTotalDevHostPtr total number of nonzero elements in device or host memory.
    !> @param[out]
    !> buffer buffer allocated by the user whose size is determined by calling \ref
    !> hipsparseSpruneCsr2csr_bufferSize
    !> "hipsparseXpruneCsr2csr_bufferSize()".
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p n, \p nnzA, \p threshold, \p
    !> descrA,
    !> \p descrC, \p csrValA, \p csrRowPtrA, \p csrColIndA, \p csrRowPtrC, \p nnzTotalDevHostPtr,
    !> or \p buffer pointer is invalid.
    function hipsparseSpruneCsr2csrNnz(handle, m, n, nnzA, descrA, csrValA, csrRowPtrA, &
                                       csrColIndA, threshold, descrC, csrRowPtrC, &
                                       nnzTotalDevHostPtr, buffer) &
       result(SpruneCsr2csrNnz) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpruneCsr2csrNnz")
#else
       bind(C, name="hipsparseSpruneCsr2csrNnz")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnzA
       type(c_ptr), value :: descrA
       real(c_float) :: csrValA(*)
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       real(c_float) :: threshold(*)
       type(c_ptr), value :: descrC
       integer(c_int) :: csrRowPtrC(*)
       integer(c_int) :: nnzTotalDevHostPtr(*)
       type(c_ptr), value :: buffer
       integer(c_int) :: SpruneCsr2csrNnz
    end function hipsparseSpruneCsr2csrNnz

    !---------------------------------------------
    ! hipsparseDpruneCsr2csrNnz
    !---------------------------------------------
    function hipsparseDpruneCsr2csrNnz(handle, m, n, nnzA, descrA, csrValA, csrRowPtrA, &
                                       csrColIndA, threshold, descrC, csrRowPtrC, &
                                       nnzTotalDevHostPtr, buffer) &
       result(DpruneCsr2csrNnz) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDpruneCsr2csrNnz")
#else
       bind(C, name="hipsparseDpruneCsr2csrNnz")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnzA
       type(c_ptr), value :: descrA
       real(c_double) :: csrValA(*)
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       real(c_double) :: threshold(*)
       type(c_ptr), value :: descrC
       integer(c_int) :: csrRowPtrC(*)
       integer(c_int) :: nnzTotalDevHostPtr(*)
       type(c_ptr), value :: buffer
       integer(c_int) :: DpruneCsr2csrNnz
    end function hipsparseDpruneCsr2csrNnz

    !---------------------------------------------
    ! hipsparseSpruneCsr2csr
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief Convert and prune a sparse CSR matrix into a sparse CSR matrix.
    !>
    !> \details
    !> This function converts the sparse CSR matrix A into a sparse CSR matrix C by pruning values
    !> in A
    !> that are less than the threshold. All the parameters are assumed to have been preallocated by
    !> the user.
    !> The user first calls \ref hipsparseSpruneCsr2csr_bufferSize
    !> "hipsparseXpruneCsr2csr_bufferSize()" to
    !> determine the size of the buffer used by \ref hipsparseSpruneCsr2csrNnz
    !> "hipsparseXpruneCsr2csrNnz()"
    !> and \p hipsparseXpruneCsr2csr(), which the user then allocates. The user then allocates \p
    !> csrRowPtrC to
    !> have \p m+1 elements and then calls hipsparseXpruneCsr2csrNnz(), which fills in the \p
    !> csrRowPtrC array
    !> and stores the number of elements that are larger than the pruning \p threshold in \p
    !> nnzTotalDevHostPtr.
    !> The user then calls \p hipsparseXpruneCsr2csr() to complete the conversion. This function is
    !> executed asynchronously
    !> with respect to the host and can return control to the application on the host before the
    !> entire result is ready.
    !>
    !> @param[in]
    !> handle        handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m             number of rows in the sparse CSR matrix.
    !> @param[in]
    !> n             number of columns in the sparse CSR matrix.
    !> @param[in]
    !> nnzA          number of non-zeros in the sparse CSR matrix A.
    !> @param[in]
    !> descrA        descriptor of the sparse CSR matrix A. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> csrValA       array of \p nnzA elements containing the values of the sparse CSR matrix A.
    !> @param[in]
    !> csrRowPtrA    array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix A.
    !> @param[in]
    !> csrColIndA array of \p nnzA elements containing the column indices of the sparse CSR matrix
    !> A.
    !> @param[in]
    !> threshold pointer to the non-negative pruning threshold which can exist in either host or
    !> device memory.
    !> @param[in]
    !> descrC        descriptor of the sparse CSR matrix C. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[out]
    !> csrValC       array of \p nnzC elements containing the values of the sparse CSR matrix C.
    !> @param[in]
    !> csrRowPtrC    array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix C.
    !> @param[out]
    !> csrColIndC array of \p nnzC elements containing the column indices of the sparse CSR matrix
    !> C.
    !> @param[in]
    !> buffer buffer allocated by the user whose size is determined by calling \ref
    !> hipsparseSpruneCsr2csr_bufferSize
    !> "hipsparseXpruneCsr2csr_bufferSize()".
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p n, \p nnzA, \p threshold, \p
    !> descrA, \p descrC, \p csrValA,
    !> \p csrRowPtrA, \p csrcolindA, \p csrvalC, \p csrrowptrC, \p csrcolIndC, or \p buffer pointer
    !> is invalid.
    function hipsparseSpruneCsr2csr(handle, m, n, nnzA, descrA, csrValA, csrRowPtrA, csrColIndA, &
                                    threshold, descrC, csrValC, csrRowPtrC, csrColIndC, buffer) &
       result(SpruneCsr2csr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpruneCsr2csr")
#else
       bind(C, name="hipsparseSpruneCsr2csr")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnzA
       type(c_ptr), value :: descrA
       real(c_float) :: csrValA(*)
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       real(c_float) :: threshold(*)
       type(c_ptr), value :: descrC
       real(c_float) :: csrValC(*)
       integer(c_int) :: csrRowPtrC(*)
       integer(c_int) :: csrColIndC(*)
       type(c_ptr), value :: buffer
       integer(c_int) :: SpruneCsr2csr
    end function hipsparseSpruneCsr2csr

    !---------------------------------------------
    ! hipsparseDpruneCsr2csr
    !---------------------------------------------
    function hipsparseDpruneCsr2csr(handle, m, n, nnzA, descrA, csrValA, csrRowPtrA, csrColIndA, &
                                    threshold, descrC, csrValC, csrRowPtrC, csrColIndC, buffer) &
       result(DpruneCsr2csr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDpruneCsr2csr")
#else
       bind(C, name="hipsparseDpruneCsr2csr")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnzA
       type(c_ptr), value :: descrA
       real(c_double) :: csrValA(*)
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       real(c_double) :: threshold(*)
       type(c_ptr), value :: descrC
       real(c_double) :: csrValC(*)
       integer(c_int) :: csrRowPtrC(*)
       integer(c_int) :: csrColIndC(*)
       type(c_ptr), value :: buffer
       integer(c_int) :: DpruneCsr2csr
    end function hipsparseDpruneCsr2csr

    !---------------------------------------------
    ! hipsparseSpruneCsr2csrByPercentage_bufferSize
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief Convert and prune by percentage a sparse CSR matrix into a sparse CSR matrix.
    !>
    !> \details
    !> \p hipsparseXpruneCsr2csrByPercentage_bufferSize returns the size of the temporary buffer
    !> that
    !> is required by \ref hipsparseSpruneCsr2csrNnzByPercentage
    !> "hipsparseXpruneCsr2csrNnzByPercentage()".
    !> The temporary storage buffer must be allocated by the user.
    !>
    !> @param[in]
    !> handle              handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m                   number of rows in the sparse CSR matrix.
    !> @param[in]
    !> n                   number of columns in the sparse CSR matrix.
    !> @param[in]
    !> nnzA                number of non-zeros in the sparse CSR matrix A.
    !> @param[in]
    !> descrA              descriptor of the sparse CSR matrix A. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> csrValA array of \p nnzA elements containing the values of the sparse CSR matrix A.
    !> @param[in]
    !> csrRowPtrA          array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix A.
    !> @param[in]
    !> csrColIndA array of \p nnzA elements containing the column indices of the sparse CSR matrix
    !> A.
    !> @param[in]
    !> percentage          \p percentage>=0 and \p percentage<=100.
    !> @param[in]
    !> descrC              descriptor of the sparse CSR matrix C. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> csrValC array of \p nnzC elements containing the values of the sparse CSR matrix C.
    !> @param[in]
    !> csrRowPtrC          array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix C.
    !> @param[in]
    !> csrColIndC array of \p nnzC elements containing the column indices of the sparse CSR matrix
    !> C.
    !> @param[in]
    !> info                prune info structure.
    !> @param[out]
    !> pBufferSizeInBytes number of bytes of the temporary storage buffer required by
    !> hipsparseSpruneCsr2csrNnzByPercentage(),
    !> hipsparseDpruneCsr2csrNnzByPercentage(), hipsparseSpruneCsr2csrByPercentage(),
    !> and hipsparseDpruneCsr2csrByPercentage().
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle or \p pBufferSizeInBytes pointer is invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    function hipsparseSpruneCsr2csrByPercentage_bufferSize(handle, m, n, nnzA, descrA, csrValA, &
                                                           csrRowPtrA, csrColIndA, percentage, &
                                                           descrC, csrValC, csrRowPtrC, &
                                                           csrColIndC, info, pBufferSizeInBytes) &
       result(SpruneCsr2csrByPercentage_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpruneCsr2csrByPercentage_bufferSize")
#else
       bind(C, name="hipsparseSpruneCsr2csrByPercentage_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnzA
       type(c_ptr), value :: descrA
       real(c_float) :: csrValA(*)
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       real(c_float), value :: percentage
       type(c_ptr), value :: descrC
       real(c_float) :: csrValC(*)
       integer(c_int) :: csrRowPtrC(*)
       integer(c_int) :: csrColIndC(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: SpruneCsr2csrByPercentage_bufferSize
    end function hipsparseSpruneCsr2csrByPercentage_bufferSize

    !---------------------------------------------
    ! hipsparseDpruneCsr2csrByPercentage_bufferSize
    !---------------------------------------------
    function hipsparseDpruneCsr2csrByPercentage_bufferSize(handle, m, n, nnzA, descrA, csrValA, &
                                                           csrRowPtrA, csrColIndA, percentage, &
                                                           descrC, csrValC, csrRowPtrC, &
                                                           csrColIndC, info, pBufferSizeInBytes) &
       result(DpruneCsr2csrByPercentage_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDpruneCsr2csrByPercentage_bufferSize")
#else
       bind(C, name="hipsparseDpruneCsr2csrByPercentage_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnzA
       type(c_ptr), value :: descrA
       real(c_double) :: csrValA(*)
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       real(c_double), value :: percentage
       type(c_ptr), value :: descrC
       real(c_double) :: csrValC(*)
       integer(c_int) :: csrRowPtrC(*)
       integer(c_int) :: csrColIndC(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: DpruneCsr2csrByPercentage_bufferSize
    end function hipsparseDpruneCsr2csrByPercentage_bufferSize

    !---------------------------------------------
    ! hipsparseSpruneCsr2csrByPercentage_bufferSizeExt
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief Convert and prune by percentage a sparse CSR matrix into a sparse CSR matrix.
    !>
    !> \details
    !> \p hipsparseXpruneCsr2csrByPercentage_bufferSizeExt returns the size of the temporary buffer
    !> that
    !> is required by \ref hipsparseSpruneCsr2csrNnzByPercentage
    !> "hipsparseXpruneCsr2csrNnzByPercentage()".
    !> The temporary storage buffer must be allocated by the user.
    !>
    !> @param[in]
    !> handle              handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m                   number of rows in the sparse CSR matrix.
    !> @param[in]
    !> n                   number of columns in the sparse CSR matrix.
    !> @param[in]
    !> nnzA                number of non-zeros in the sparse CSR matrix A.
    !> @param[in]
    !> descrA              descriptor of the sparse CSR matrix A. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> csrValA array of \p nnzA elements containing the values of the sparse CSR matrix A.
    !> @param[in]
    !> csrRowPtrA          array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix A.
    !> @param[in]
    !> csrColIndA array of \p nnzA elements containing the column indices of the sparse CSR matrix
    !> A.
    !> @param[in]
    !> percentage          \p percentage>=0 and \p percentage<=100.
    !> @param[in]
    !> descrC              descriptor of the sparse CSR matrix C. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> csrValC array of \p nnzC elements containing the values of the sparse CSR matrix C.
    !> @param[in]
    !> csrRowPtrC          array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix C.
    !> @param[in]
    !> csrColIndC array of \p nnzC elements containing the column indices of the sparse CSR matrix
    !> C.
    !> @param[in]
    !> info                prune info structure.
    !> @param[out]
    !> pBufferSizeInBytes number of bytes of the temporary storage buffer required by
    !> hipsparseSpruneCsr2csrNnzByPercentage(),
    !> hipsparseDpruneCsr2csrNnzByPercentage(), hipsparseSpruneCsr2csrByPercentage(),
    !> and hipsparseDpruneCsr2csrByPercentage().
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle or \p pBufferSizeInBytes pointer is invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    function hipsparseSpruneCsr2csrByPercentage_bufferSizeExt(handle, m, n, nnzA, descrA, csrValA, &
                                                              csrRowPtrA, csrColIndA, percentage, &
                                                              descrC, csrValC, csrRowPtrC, &
                                                              csrColIndC, info, &
                                                              pBufferSizeInBytes) &
       result(SpruneCsr2csrByPercentage_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpruneCsr2csrByPercentage_bufferSizeExt")
#else
       bind(C, name="hipsparseSpruneCsr2csrByPercentage_bufferSizeExt")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnzA
       type(c_ptr), value :: descrA
       real(c_float) :: csrValA(*)
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       real(c_float), value :: percentage
       type(c_ptr), value :: descrC
       real(c_float) :: csrValC(*)
       integer(c_int) :: csrRowPtrC(*)
       integer(c_int) :: csrColIndC(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: SpruneCsr2csrByPercentage_bufferSizeExt
    end function hipsparseSpruneCsr2csrByPercentage_bufferSizeExt

    !---------------------------------------------
    ! hipsparseDpruneCsr2csrByPercentage_bufferSizeExt
    !---------------------------------------------
    function hipsparseDpruneCsr2csrByPercentage_bufferSizeExt(handle, m, n, nnzA, descrA, csrValA, &
                                                              csrRowPtrA, csrColIndA, percentage, &
                                                              descrC, csrValC, csrRowPtrC, &
                                                              csrColIndC, info, &
                                                              pBufferSizeInBytes) &
       result(DpruneCsr2csrByPercentage_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDpruneCsr2csrByPercentage_bufferSizeExt")
#else
       bind(C, name="hipsparseDpruneCsr2csrByPercentage_bufferSizeExt")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnzA
       type(c_ptr), value :: descrA
       real(c_double) :: csrValA(*)
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       real(c_double), value :: percentage
       type(c_ptr), value :: descrC
       real(c_double) :: csrValC(*)
       integer(c_int) :: csrRowPtrC(*)
       integer(c_int) :: csrColIndC(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: DpruneCsr2csrByPercentage_bufferSizeExt
    end function hipsparseDpruneCsr2csrByPercentage_bufferSizeExt

    !---------------------------------------------
    ! hipsparseSpruneCsr2csrNnzByPercentage
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief Convert and prune by percentage a sparse CSR matrix into a sparse CSR matrix.
    !>
    !> \details
    !> \p hipsparseXpruneCsr2csrNnzByPercentage computes the number of non-zero elements per row and
    !> the total
    !> number of non-zero elements in a sparse CSR matrix after elements less than the threshold are
    !> pruned from the matrix.
    !>
    !> \note The routine supports asynchronous execution if the pointer mode is set to device.
    !>
    !> @param[in]
    !> handle             handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m                  number of rows in the sparse CSR matrix.
    !> @param[in]
    !> n                  number of columns in the sparse CSR matrix.
    !> @param[in]
    !> nnzA               number of non-zeros in the sparse CSR matrix A.
    !> @param[in]
    !> descrA             descriptor of the sparse CSR matrix A. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> csrValA array of \p nnzA elements containing the values of the sparse CSR matrix A.
    !> @param[in]
    !> csrRowPtrA         array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix A.
    !> @param[in]
    !> csrColIndA array of \p nnzA elements containing the column indices of the sparse CSR matrix
    !> A.
    !> @param[in]
    !> percentage         \p percentage>=0 and \p percentage<=100.
    !> @param[in]
    !> descrC             descriptor of the sparse CSR matrix C. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[out]
    !> csrRowPtrC         array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix C.
    !> @param[out]
    !> nnzTotalDevHostPtr total number of non-zero elements in device or host memory.
    !> @param[in]
    !> info               prune info structure.
    !> @param[out]
    !> buffer             buffer allocated by the user whose size is determined by calling
    !> \ref hipsparseSpruneCsr2csrByPercentage_bufferSize
    !> "hipsparseXpruneCsr2csrByPercentage_bufferSize()".
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p n, \p nnzA, \p percentage, \p
    !> descrA, \p descrC,
    !> \p info, \p csrValA, \p csrRowPtrA, \p csrColIndA, \p csrRowPtrC, \p nnzTotalDevHostPtr, or
    !> \p buffer
    !> pointer is invalid.
    function hipsparseSpruneCsr2csrNnzByPercentage(handle, m, n, nnzA, descrA, csrValA, &
                                                   csrRowPtrA, csrColIndA, percentage, descrC, &
                                                   csrRowPtrC, nnzTotalDevHostPtr, info, buffer) &
       result(SpruneCsr2csrNnzByPercentage) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpruneCsr2csrNnzByPercentage")
#else
       bind(C, name="hipsparseSpruneCsr2csrNnzByPercentage")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnzA
       type(c_ptr), value :: descrA
       real(c_float) :: csrValA(*)
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       real(c_float), value :: percentage
       type(c_ptr), value :: descrC
       integer(c_int) :: csrRowPtrC(*)
       integer(c_int) :: nnzTotalDevHostPtr(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: buffer
       integer(c_int) :: SpruneCsr2csrNnzByPercentage
    end function hipsparseSpruneCsr2csrNnzByPercentage

    !---------------------------------------------
    ! hipsparseDpruneCsr2csrNnzByPercentage
    !---------------------------------------------
    function hipsparseDpruneCsr2csrNnzByPercentage(handle, m, n, nnzA, descrA, csrValA, &
                                                   csrRowPtrA, csrColIndA, percentage, descrC, &
                                                   csrRowPtrC, nnzTotalDevHostPtr, info, buffer) &
       result(DpruneCsr2csrNnzByPercentage) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDpruneCsr2csrNnzByPercentage")
#else
       bind(C, name="hipsparseDpruneCsr2csrNnzByPercentage")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnzA
       type(c_ptr), value :: descrA
       real(c_double) :: csrValA(*)
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       real(c_double), value :: percentage
       type(c_ptr), value :: descrC
       integer(c_int) :: csrRowPtrC(*)
       integer(c_int) :: nnzTotalDevHostPtr(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: buffer
       integer(c_int) :: DpruneCsr2csrNnzByPercentage
    end function hipsparseDpruneCsr2csrNnzByPercentage

    !---------------------------------------------
    ! hipsparseSpruneCsr2csrByPercentage
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief Convert and prune by percentage a sparse CSR matrix into a sparse CSR matrix.
    !>
    !> \details
    !> This function converts the sparse CSR matrix A into a sparse CSR matrix C by pruning values
    !> in A
    !> that are less than the threshold. All the parameters are assumed to have been preallocated by
    !> the user.
    !> The user first calls \ref hipsparseSpruneCsr2csr_bufferSize
    !> "hipsparseXpruneCsr2csr_bufferSize()" to
    !> determine the size of the buffer used by \ref hipsparseSpruneCsr2csrNnz
    !> "hipsparseXpruneCsr2csrNnz()" and
    !> \p hipsparseXpruneCsr2csr(), which the user then allocates. The user then allocates \p
    !> csrRowPtrC to have
    !> \p m+1 elements and then calls \ref hipsparseSpruneCsr2csrNnz "hipsparseXpruneCsr2csrNnz()"
    !> which fills
    !> in the \p csrRowPtrC array and stores the number of elements that are larger than the pruning
    !> \p threshold
    !> in \p nnzTotalDevHostPtr. The user then calls \p hipsparseXpruneCsr2csr() to complete the
    !> conversion. The function
    !> is executed asynchronously with respect to the host and can return control to the application
    !> on the host
    !> before the entire result is ready.
    !>
    !> @param[in]
    !> handle        handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m             number of rows in the sparse CSR matrix.
    !> @param[in]
    !> n             number of columns in the sparse CSR matrix.
    !> @param[in]
    !> nnzA          number of non-zeros in the sparse CSR matrix A.
    !> @param[in]
    !> descrA        descriptor of the sparse CSR matrix A. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[in]
    !> csrValA       array of \p nnzA elements containing the values of the sparse CSR matrix A.
    !> @param[in]
    !> csrRowPtrA    array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix A.
    !> @param[in]
    !> csrColIndA array of \p nnzA elements containing the column indices of the sparse CSR matrix
    !> A.
    !> @param[in]
    !> percentage    \p percentage>=0 and \p percentage<=100.
    !> @param[in]
    !> descrC        descriptor of the sparse CSR matrix C. Currently, only
    !> \ref HIPSPARSE_MATRIX_TYPE_GENERAL is supported.
    !> @param[out]
    !> csrValC       array of \p nnz_C elements containing the values of the sparse CSR matrix C.
    !> @param[in]
    !> csrRowPtrC    array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix C.
    !> @param[out]
    !> csrColIndC array of \p nnz_C elements containing the column indices of the sparse CSR matrix
    !> C.
    !> @param[in]
    !> info          prune info structure.
    !> @param[in]
    !> buffer        buffer allocated by the user whose size is determined by calling
    !> \ref hipsparseSpruneCsr2csrByPercentage_bufferSize
    !> "hipsparseXpruneCsr2csrByPercentage_bufferSize()".
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p n, \p nnzA, \p percentage, \p
    !> descrA, \p descrC, \p info,
    !> \p csrValA, \p csrRowPtrA, \p csrColIndA, \p csrValC, \p csrRowPtrC, \p csrColIndC, or \p
    !> buffer pointer is
    !> invalid.
    function hipsparseSpruneCsr2csrByPercentage(handle, m, n, nnzA, descrA, csrValA, csrRowPtrA, &
                                                csrColIndA, percentage, descrC, csrValC, &
                                                csrRowPtrC, csrColIndC, info, buffer) &
       result(SpruneCsr2csrByPercentage) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpruneCsr2csrByPercentage")
#else
       bind(C, name="hipsparseSpruneCsr2csrByPercentage")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnzA
       type(c_ptr), value :: descrA
       real(c_float) :: csrValA(*)
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       real(c_float), value :: percentage
       type(c_ptr), value :: descrC
       real(c_float) :: csrValC(*)
       integer(c_int) :: csrRowPtrC(*)
       integer(c_int) :: csrColIndC(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: buffer
       integer(c_int) :: SpruneCsr2csrByPercentage
    end function hipsparseSpruneCsr2csrByPercentage

    !---------------------------------------------
    ! hipsparseDpruneCsr2csrByPercentage
    !---------------------------------------------
    function hipsparseDpruneCsr2csrByPercentage(handle, m, n, nnzA, descrA, csrValA, csrRowPtrA, &
                                                csrColIndA, percentage, descrC, csrValC, &
                                                csrRowPtrC, csrColIndC, info, buffer) &
       result(DpruneCsr2csrByPercentage) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDpruneCsr2csrByPercentage")
#else
       bind(C, name="hipsparseDpruneCsr2csrByPercentage")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       integer(c_int), value :: nnzA
       type(c_ptr), value :: descrA
       real(c_double) :: csrValA(*)
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       real(c_double), value :: percentage
       type(c_ptr), value :: descrC
       real(c_double) :: csrValC(*)
       integer(c_int) :: csrRowPtrC(*)
       integer(c_int) :: csrColIndC(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: buffer
       integer(c_int) :: DpruneCsr2csrByPercentage
    end function hipsparseDpruneCsr2csrByPercentage

    !---------------------------------------------
    ! hipsparseSpruneDense2csr_bufferSize
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief
    !> \p hipsparseXpruneDense2csr_bufferSize computes the the size of the user-allocated temporary
    !> storage buffer
    !> used when converting a dense matrix to a pruned CSR matrix.
    !>
    !> \details
    !> Specifically given an input dense column-ordered matrix A, with leading dimension \p lda,
    !> where \p lda>=m,
    !> the resulting pruned sparse CSR matrix C is computed using:
    !> \f[
    !> |C(i,j)| = A(i, j) \text{  if |A(i, j)| > threshold}
    !> \f]
    !>
    !> The first step in this conversion is to determine the required user-allocated buffer size
    !> using \p hipsparseXpruneDense2csr_bufferSize() that will be passed to the subsequent steps of
    !> the conversion.
    !> After the buffer size has been determined, the user must allocate it. This user-allocated
    !> buffer is then passed
    !> to \ref hipsparseSpruneDense2csrNnz "hipsparseXpruneDense2csrNnz()" and \ref
    !> hipsparseSpruneDense2csr
    !> "hipsparseXpruneDense2csr()" to complete the conversion. The user is responsible for then
    !> freeing the buffer after
    !> the conversion has been completed.
    !>
    !> See hipsparseSpruneDense2csr() for a full code example.
    !>
    !> \deprecated
    !> This function is deprecated when using the CUDA backend (CUDA 12.0+) and will be
    !> removed in CUDA 13.0. This deprecation does not apply to the ROCm backend.
    !>
    !> @param[in]
    !> handle             handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m                  number of rows of the dense matrix \p A. Must be non-negative.
    !> @param[in]
    !> n                  number of columns of the dense matrix \p A. Must be non-negative.
    !> @param[in]
    !> A                  array of dimensions (\p lda, \p n).
    !> @param[in]
    !> lda                leading dimension of dense array \p A. Must be at least \p m.
    !> @param[in]
    !> threshold pointer to the pruning non-negative threshold, which can exist in either host or
    !> device memory.
    !> @param[in]
    !> descr the descriptor of the dense matrix \p A. The supported matrix type is \ref
    !> HIPSPARSE_MATRIX_TYPE_GENERAL
    !> and any valid value of the \ref hipsparseIndexBase_t.
    !> @param[in]
    !> csrVal array of nnz ( = \p csrRowPtr[m] - \p csrRowPtr[0] ) non-zero elements of matrix \p A.
    !> @param[in]
    !> csrRowPtr integer array of \p m+1 elements that contains the start of every row and the end
    !> of the last row plus one.
    !> @param[in]
    !> csrColInd integer array of nnz ( = \p csrRowPtr[m] - \p csrRowPtr[0] ) column indices of the
    !> non-zero elements of matrix \p A.
    !> @param[out]
    !> pBufferSizeInBytes number of bytes of the temporary storage buffer required by
    !> hipsparseSpruneDense2csrNnz(), hipsparseDpruneDense2csrNnz(),
    !> hipsparseSpruneDense2csr(), and hipsparseDpruneDense2csr().
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle or \p pBufferSizeInBytes is nullptr,
    !> or \p m or \p n is negative.
    !> \retval HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    function hipsparseSpruneDense2csr_bufferSize(handle, m, n, A, lda, threshold, descr, csrVal, &
                                                 csrRowPtr, csrColInd, pBufferSizeInBytes) &
       result(SpruneDense2csr_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpruneDense2csr_bufferSize")
#else
       bind(C, name="hipsparseSpruneDense2csr_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: threshold(*)
       type(c_ptr), value :: descr
       real(c_float) :: csrVal(*)
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: SpruneDense2csr_bufferSize
    end function hipsparseSpruneDense2csr_bufferSize

    !---------------------------------------------
    ! hipsparseDpruneDense2csr_bufferSize
    !---------------------------------------------
    function hipsparseDpruneDense2csr_bufferSize(handle, m, n, A, lda, threshold, descr, csrVal, &
                                                 csrRowPtr, csrColInd, pBufferSizeInBytes) &
       result(DpruneDense2csr_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDpruneDense2csr_bufferSize")
#else
       bind(C, name="hipsparseDpruneDense2csr_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: threshold(*)
       type(c_ptr), value :: descr
       real(c_double) :: csrVal(*)
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: DpruneDense2csr_bufferSize
    end function hipsparseDpruneDense2csr_bufferSize

    !---------------------------------------------
    ! hipsparseSpruneDense2csr_bufferSizeExt
    !---------------------------------------------
    function hipsparseSpruneDense2csr_bufferSizeExt(handle, m, n, A, lda, threshold, descr, &
                                                    csrVal, csrRowPtr, csrColInd, &
                                                    pBufferSizeInBytes) &
       result(SpruneDense2csr_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpruneDense2csr_bufferSizeExt")
#else
       bind(C, name="hipsparseSpruneDense2csr_bufferSizeExt")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: threshold(*)
       type(c_ptr), value :: descr
       real(c_float) :: csrVal(*)
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: SpruneDense2csr_bufferSizeExt
    end function hipsparseSpruneDense2csr_bufferSizeExt

    !---------------------------------------------
    ! hipsparseDpruneDense2csr_bufferSizeExt
    !---------------------------------------------
    function hipsparseDpruneDense2csr_bufferSizeExt(handle, m, n, A, lda, threshold, descr, &
                                                    csrVal, csrRowPtr, csrColInd, &
                                                    pBufferSizeInBytes) &
       result(DpruneDense2csr_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDpruneDense2csr_bufferSizeExt")
#else
       bind(C, name="hipsparseDpruneDense2csr_bufferSizeExt")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: threshold(*)
       type(c_ptr), value :: descr
       real(c_double) :: csrVal(*)
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: DpruneDense2csr_bufferSizeExt
    end function hipsparseDpruneDense2csr_bufferSizeExt

    !---------------------------------------------
    ! hipsparseSpruneDense2csrNnz
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief
    !> \p hipsparseXpruneDense2csrNnz computes the number of non-zero elements per row and the total
    !> number of non-zero elements in a dense matrix after the elements less than the (non-negative)
    !> threshold are
    !> pruned from the matrix.
    !>
    !> \details
    !> Given an input dense column ordered matrix \p A, with leading dimension \p lda where \p
    !> lda>=m,
    !> the resulting pruned sparse CSR matrix \f$C\f$ is computed using:
    !> \f[
    !> |C(i,j)| = A(i, j) \text{  if |A(i, j)| > threshold}
    !> \f]
    !>
    !> First, the user must determine the size of the required temporary buffer using the routine
    !> \ref hipsparseSpruneDense2csr_bufferSize "hipsparseXpruneDense2csr_bufferSize()" and then
    !> allocate it. Next,
    !> the user allocates \p csrRowPtr with size \p m+1. Then the function passes both the temporary
    !> storage buffer and
    !> \p csrRowPtr to \p hipsparseXpruneDense2csrNnz to determine the total number of non-zeros
    !> that
    !> will exist in the sparse CSR matrix C (after pruning has been performed on \p A ) as well as
    !> fill the output CSR
    !> row pointer array \p csrRowPtr.
    !>
    !> For example, given the dense matrix:
    !>
    !> \f[
    !> \begin{bmatrix}
    !> 6 & 2 & 3 & 7 \\
    !> 5 & 6 & 7 & 8 \\
    !> 5 & 4 & 8 & 1
    !> \end{bmatrix}
    !> \f]
    !>
    !> and the \p threshold value 5, the resulting matrix after pruning is:
    !>
    !> \f[
    !> \begin{bmatrix}
    !> 6 & 0 & 0 & 7 \\
    !> 0 & 6 & 7 & 8 \\
    !> 0 & 0 & 8 & 0
    !> \end{bmatrix}
    !> \f]
    !>
    !> and the corresponding row pointer array and non-zero count:
    !>
    !> \f[
    !> \begin{align}
    !> \text{csrRowPtr} &= \begin{bmatrix} 0 & 2 & 5 & 6 \end{bmatrix} \\
    !> \text{nnzTotalDevHostPtr} &= 6
    !> \end{align}
    !> \f]
    !>
    !> The above example assumes a zero index base for the output CSR matrix. Users can set the
    !> desired index base
    !> in the output CSR matrix by setting it in the \ref hipsparseMatDescr_t. See \ref
    !> hipsparseSetMatIndexBase().
    !>
    !> For a full code example on how to use this routine, see hipsparseSpruneDense2csr().
    !>
    !> \note
    !> The routine supports asynchronous execution if the pointer mode is set to device.
    !>
    !> @param[in]
    !> handle             handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m                  number of rows of the dense matrix \p A.
    !> @param[in]
    !> n                  number of columns of the dense matrix \p A.
    !> @param[in]
    !> A                  array of dimensions (\p lda, \p n).
    !> @param[in]
    !> lda                leading dimension of the dense array \p A.
    !> @param[in]
    !> threshold pointer to the pruning non-negative threshold, which can exist in either host or
    !> device memory.
    !> @param[in]
    !> descr              the descriptor of the dense matrix \p A.
    !> @param[out]
    !> csrRowPtr integer array of \p m+1 elements that contains the start of every row and the end
    !> of the last row plus one.
    !> @param[out]
    !> nnzTotalDevHostPtr total number of non-zero elements in device or host memory.
    !> @param[out]
    !> buffer             buffer allocated by the user whose size is determined by calling
    !> \ref hipsparseSpruneDense2csr_bufferSize "hipsparseXpruneDense2csr_bufferSize()" or
    !> \ref hipsparseSpruneDense2csr_bufferSizeExt "hipsparseXpruneDense2csr_bufferSizeExt()".
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p n, \p lda, \p A, \p threshold, \p
    !> descr, \p csrRowPtr,
    !> \p nnzTotalDevHostPtr, or \p buffer pointer is invalid.
    function hipsparseSpruneDense2csrNnz(handle, m, n, A, lda, threshold, descr, csrRowPtr, &
                                         nnzTotalDevHostPtr, buffer) &
       result(SpruneDense2csrNnz) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpruneDense2csrNnz")
#else
       bind(C, name="hipsparseSpruneDense2csrNnz")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: threshold(*)
       type(c_ptr), value :: descr
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: nnzTotalDevHostPtr(*)
       type(c_ptr), value :: buffer
       integer(c_int) :: SpruneDense2csrNnz
    end function hipsparseSpruneDense2csrNnz

    !---------------------------------------------
    ! hipsparseDpruneDense2csrNnz
    !---------------------------------------------
    function hipsparseDpruneDense2csrNnz(handle, m, n, A, lda, threshold, descr, csrRowPtr, &
                                         nnzTotalDevHostPtr, buffer) &
       result(DpruneDense2csrNnz) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDpruneDense2csrNnz")
#else
       bind(C, name="hipsparseDpruneDense2csrNnz")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: threshold(*)
       type(c_ptr), value :: descr
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: nnzTotalDevHostPtr(*)
       type(c_ptr), value :: buffer
       integer(c_int) :: DpruneDense2csrNnz
    end function hipsparseDpruneDense2csrNnz

    !---------------------------------------------
    ! hipsparseSpruneDense2csr
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief
    !> \p hipsparseXpruneDense2csr converts the matrix \p A in dense format into a sparse matrix in
    !> CSR format,
    !> while pruning values that are less than the (non-negative) threshold. All the parameters are
    !> assumed
    !> to have been pre-allocated by the user.
    !>
    !> \details
    !> Given an input dense column ordered matrix \p A, with leading dimension \p lda, where \p
    !> lda>=m,
    !> the resulting pruned sparse CSR matrix C is computed using:
    !> \f[
    !> |C(i,j)| = A(i, j) \text{  if |A(i, j)| > threshold}
    !> \f]
    !>
    !> The user first calls \ref hipsparseSpruneDense2csr_bufferSize
    !> "hipsparseXpruneDense2csr_bufferSize()" to
    !> determine the size of the required user-allocated temporary storage buffer. The user then
    !> allocates this
    !> buffer. Next, the user allocates \p csrRowPtr to have \p m+1 elements and then calls
    !> \ref hipsparseSpruneDense2csrNnz "hipsparseXpruneDense2csrNnz()", which fills in the \p
    !> csrRowPtr array
    !> and stores the number of elements that are larger than the pruning \p threshold in \p
    !> nnzTotalDevHostPtr.
    !> The user then allocates \p csrColInd and \p csrVal to have size \p nnzTotalDevHostPtr and
    !> completes the
    !> conversion by calling \p hipsparseXpruneDense2csr().
    !>
    !> For example, performing these steps with the dense input matrix \p A :
    !> \f[
    !> \begin{bmatrix}
    !> 6 & 2 & 3 & 7 \\
    !> 5 & 6 & 7 & 8 \\
    !> 5 & 4 & 8 & 1
    !> \end{bmatrix}
    !> \f]
    !>
    !> and the \p threshold value 5, results in the pruned matrix C:
    !>
    !> \f[
    !> \begin{bmatrix}
    !> 6 & 0 & 0 & 7 \\
    !> 0 & 6 & 7 & 8 \\
    !> 0 & 0 & 8 & 0
    !> \end{bmatrix}
    !> \f]
    !>
    !> and corresponding CSR row, column, and values arrays:
    !>
    !> \f[
    !> \begin{align}
    !> \text{csrRowPtr} &= \begin{bmatrix} 0 & 2 & 5 & 6 \end{bmatrix} \\
    !> \text{csrColInd} &= \begin{bmatrix} 0 & 3 & 1 & 2 & 3 & 2 \end{bmatrix} \\
    !> \text{csrVal} &= \begin{bmatrix} 6 & 7 & 6 & 7 & 8 & 8 \end{bmatrix} \\
    !> \end{align}
    !> \f]
    !>
    !> \note
    !> The routine \p hipsparseXpruneDense2csr() is executed asynchronously with respect to the host
    !> and can
    !> return control to the application on the host before the entire result is ready.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m           number of rows of the dense matrix \p A.
    !> @param[in]
    !> n           number of columns of the dense matrix \p A.
    !> @param[in]
    !> A           array of dimensions (\p lda, \p n).
    !> @param[in]
    !> lda         leading dimension of dense array \p A.
    !> @param[in]
    !> threshold pointer to the non-negative pruning threshold, which can exist in either host or
    !> device memory.
    !> @param[in]
    !> descr the descriptor of the dense matrix \p A. The supported matrix type is \ref
    !> HIPSPARSE_MATRIX_TYPE_GENERAL
    !> and any valid value of the \ref hipsparseIndexBase_t.
    !> @param[out]
    !> csrVal array of nnz ( = \p csrRowPtr[m] - \p csrRowPtr[0] ) non-zero elements of matrix \p A.
    !> @param[in]
    !> csrRowPtr integer array of \p m+1 elements that contains the start of every row and the end
    !> of the last row plus one.
    !> @param[out]
    !> csrColInd integer array of nnz ( = \p csrRowPtr[m] - \p csrRowPtr[0] ) column indices of the
    !> non-zero elements of matrix \p A.
    !>
    !> @param[in]
    !> buffer     temporary storage buffer allocated by the user. The size is returned by
    !> \ref hipsparseSpruneDense2csr_bufferSize "hipsparseXpruneDense2csr_bufferSize()" or
    !> \ref hipsparseSpruneDense2csr_bufferSizeExt "hipsparseXpruneDense2csr_bufferSizeExt()".
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p n, \p lda, \p A, \p descr, \p
    !> threshold, \p csrVal,
    !> \p csrRowPtr, \p csrColInd, or \p buffer pointer is invalid.
    function hipsparseSpruneDense2csr(handle, m, n, A, lda, threshold, descr, csrVal, csrRowPtr, &
                                      csrColInd, buffer) &
       result(SpruneDense2csr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpruneDense2csr")
#else
       bind(C, name="hipsparseSpruneDense2csr")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float) :: threshold(*)
       type(c_ptr), value :: descr
       real(c_float) :: csrVal(*)
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       type(c_ptr), value :: buffer
       integer(c_int) :: SpruneDense2csr
    end function hipsparseSpruneDense2csr

    !---------------------------------------------
    ! hipsparseDpruneDense2csr
    !---------------------------------------------
    function hipsparseDpruneDense2csr(handle, m, n, A, lda, threshold, descr, csrVal, csrRowPtr, &
                                      csrColInd, buffer) &
       result(DpruneDense2csr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDpruneDense2csr")
#else
       bind(C, name="hipsparseDpruneDense2csr")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double) :: threshold(*)
       type(c_ptr), value :: descr
       real(c_double) :: csrVal(*)
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       type(c_ptr), value :: buffer
       integer(c_int) :: DpruneDense2csr
    end function hipsparseDpruneDense2csr

    !---------------------------------------------
    ! hipsparseSpruneDense2csrByPercentage_bufferSize
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief
    !> \p hipsparseXpruneDense2csrByPercentage_bufferSize functions convert the size of the
    !> user-allocated temporary
    !> storage buffer used when converting a dense matrix to a pruned CSR matrix where the pruning
    !> is done
    !> based on a \p percentage.
    !>
    !> \details
    !> When converting and pruning a dense matrix \p A to a CSR matrix by percentage, the
    !> following steps are performed. First, the user calls
    !> \p hipsparseXpruneDense2csrByPercentage_bufferSize, which determines the size of the
    !> temporary storage buffer. After this is determined, this buffer must be allocated by the
    !> user.
    !> Next, the user allocates the \p csrRowPtr array to have \p m+1 elements and calls
    !> \ref hipsparseSpruneDense2csrNnzByPercentage "hipsparseXpruneDense2csrNnzByPercentage()".
    !> Finally, the user finishes the conversion by allocating the \p csrColInd and \p csrVal arrays
    !> (whose size is determined by the value at \p nnzTotalDevHostPtr) and calling
    !> \ref hipsparseSpruneDense2csrByPercentage "hipsparseXpruneDense2csrByPercentage()".
    !>
    !> The pruning by \p percentage works by first sorting the absolute values of the dense
    !> matrix \p A. Users can then determine a position in this sorted array by
    !> \f[
    !> pos = ceil(m \cdot n \cdot (percentage/100)) - 1 \\
    !> pos = \min(pos, m \cdot n-1) \\
    !> pos = \max(pos, 0) \\
    !> threshold = sorted_A[pos]
    !> \f]
    !>
    !> After the user has this threshold, they can prune values in the dense matrix \p A, as in
    !> \ref hipsparseSpruneDense2csr "hipsparseXpruneDense2csr()".
    !>
    !> \note
    !> This function is executed asynchronously with respect to the host and can return control to
    !> the
    !> application on the host before the entire result is ready.
    !>
    !> @param[in]
    !> handle             handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m                  number of rows of the dense matrix \p A.
    !> @param[in]
    !> n                  number of columns of the dense matrix \p A.
    !> @param[in]
    !> A                  array of dimensions (\p lda, \p n).
    !> @param[in]
    !> lda                leading dimension of dense array \p A.
    !> @param[in]
    !> percentage         \p percentage>=0 and \p percentage<=100.
    !> @param[in]
    !> descr the descriptor of the dense matrix \p A. The supported matrix type is \ref
    !> HIPSPARSE_MATRIX_TYPE_GENERAL and
    !> any valid value of the \ref hipsparseIndexBase_t.
    !> @param[in]
    !> csrVal array of nnz ( = \p csrRowPtr[m] - \p csrRowPtr[0] ) nonzero elements of matrix \p A.
    !> @param[in]
    !> csrRowPtr integer array of \p m+1 elements that contains the start of every row and the end
    !> of the last row plus one.
    !> @param[in]
    !> csrColInd integer array of nnz ( = \p csrRowPtr[m] - \p csrRowPtr[0] ) column indices of the
    !> non-zero elements of matrix \p A.
    !> @param[in]
    !> info               prune information structure.
    !> @param[out]
    !> pBufferSizeInBytes number of bytes of the temporary storage buffer required by
    !> hipsparseSpruneDense2csrNnzByPercentage() and hipsparseDpruneDense2csrNnzByPercentage().
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE the \p handle or \p pBufferSizeInBytes pointer is
    !> invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    function hipsparseSpruneDense2csrByPercentage_bufferSize(handle, m, n, A, lda, percentage, &
                                                             descr, csrVal, csrRowPtr, csrColInd, &
                                                             info, pBufferSizeInBytes) &
       result(SpruneDense2csrByPercentage_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpruneDense2csrByPercentage_bufferSize")
#else
       bind(C, name="hipsparseSpruneDense2csrByPercentage_bufferSize")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float), value :: percentage
       type(c_ptr), value :: descr
       real(c_float) :: csrVal(*)
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: SpruneDense2csrByPercentage_bufferSize
    end function hipsparseSpruneDense2csrByPercentage_bufferSize

    !---------------------------------------------
    ! hipsparseDpruneDense2csrByPercentage_bufferSize
    !---------------------------------------------
    function hipsparseDpruneDense2csrByPercentage_bufferSize(handle, m, n, A, lda, percentage, &
                                                             descr, csrVal, csrRowPtr, csrColInd, &
                                                             info, pBufferSizeInBytes) &
       result(DpruneDense2csrByPercentage_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDpruneDense2csrByPercentage_bufferSize")
#else
       bind(C, name="hipsparseDpruneDense2csrByPercentage_bufferSize")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double), value :: percentage
       type(c_ptr), value :: descr
       real(c_double) :: csrVal(*)
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: DpruneDense2csrByPercentage_bufferSize
    end function hipsparseDpruneDense2csrByPercentage_bufferSize

    !---------------------------------------------
    ! hipsparseSpruneDense2csrByPercentage_bufferSizeExt
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief
    !> This function computes the size of the user-allocated temporary storage buffer used
    !> when converting and pruning by \p percentage a dense matrix to a CSR matrix.
    !>
    !> \details
    !> When converting and pruning a dense matrix \p A to a CSR matrix by \p percentage, the
    !> following steps are performed. First, the user calls
    !> \p hipsparseXpruneDense2csrByPercentage_bufferSizeExt, which determines the size of the
    !> temporary storage buffer. After this is determined, this buffer must be allocated by the
    !> user.
    !> Next, the user allocates the \p csrRowPtr array to have \p m+1 elements and calls
    !> \ref hipsparseSpruneDense2csrNnzByPercentage "hipsparseXpruneDense2csrNnzByPercentage()".
    !> Finally, the user finishes the conversion by allocating the \p csrColInd and \p csrVal arrays
    !> (whose size is determined by the value at \p nnzTotalDevHostPtr) and calling
    !> \ref hipsparseSpruneDense2csrByPercentage "hipsparseXpruneDense2csrByPercentage()".
    !>
    !> The pruning by \p percentage works by first sorting the absolute values of the dense
    !> matrix \p A. Users can then determine a position in this sorted array by
    !> \f[
    !> pos = ceil(m \cdot n \cdot (percentage/100)) - 1 \\
    !> pos = \min(pos, m \cdot n-1) \\
    !> pos = \max(pos, 0) \\
    !> threshold = sorted_A[pos]
    !> \f]
    !>
    !> After users have this threshold, they can prune values in the dense matrix \p A, as in
    !> \ref hipsparseSpruneDense2csr "hipsparseXpruneDense2csr()".
    !>
    !> \note
    !> This function is executed asynchronously with respect to the host and can return control to
    !> the
    !> application on the host before the entire result is ready.
    !>
    !> @param[in]
    !> handle             handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m                  number of rows of the dense matrix \p A.
    !> @param[in]
    !> n                  number of columns of the dense matrix \p A.
    !> @param[in]
    !> A                  array of dimensions (\p lda, \p n).
    !> @param[in]
    !> lda                leading dimension of dense array \p A.
    !> @param[in]
    !> percentage         \p percentage>=0 and \p percentage<=100.
    !> @param[in]
    !> descr the descriptor of the dense matrix \p A. The supported matrix type is \ref
    !> HIPSPARSE_MATRIX_TYPE_GENERAL and
    !> any valid value of the \ref hipsparseIndexBase_t.
    !> @param[in]
    !> csrVal array of nnz ( = \p csrRowPtr[m] - \p csrRowPtr[0] ) non-zero elements of matrix \p A.
    !> @param[in]
    !> csrRowPtr integer array of \p m+1 elements that contains the start of every row and the end
    !> of the last row plus one.
    !> @param[in]
    !> csrColInd integer array of nnz ( = \p csrRowPtr[m] - \p csrRowPtr[0] ) column indices of the
    !> non-zero elements of matrix \p A.
    !> @param[in]
    !> info               prune information structure.
    !> @param[out]
    !> pBufferSizeInBytes number of bytes of the temporary storage buffer required by
    !> hipsparseSpruneDense2csrNnzByPercentage() and hipsparseDpruneDense2csrNnzByPercentage().
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE the \p handle or \p pBufferSizeInBytes pointer is
    !> invalid.
    !> \retval     HIPSPARSE_STATUS_INTERNAL_ERROR an internal error occurred.
    function hipsparseSpruneDense2csrByPercentage_bufferSizeExt(handle, m, n, A, lda, percentage, &
                                                                descr, csrVal, csrRowPtr, &
                                                                csrColInd, info, &
                                                                pBufferSizeInBytes) &
       result(SpruneDense2csrByPercentage_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpruneDense2csrByPercentage_bufferSizeExt")
#else
       bind(C, name="hipsparseSpruneDense2csrByPercentage_bufferSizeExt")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float), value :: percentage
       type(c_ptr), value :: descr
       real(c_float) :: csrVal(*)
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: SpruneDense2csrByPercentage_bufferSizeExt
    end function hipsparseSpruneDense2csrByPercentage_bufferSizeExt

    !---------------------------------------------
    ! hipsparseDpruneDense2csrByPercentage_bufferSizeExt
    !---------------------------------------------
    function hipsparseDpruneDense2csrByPercentage_bufferSizeExt(handle, m, n, A, lda, percentage, &
                                                                descr, csrVal, csrRowPtr, &
                                                                csrColInd, info, &
                                                                pBufferSizeInBytes) &
       result(DpruneDense2csrByPercentage_bufferSizeExt) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDpruneDense2csrByPercentage_bufferSizeExt")
#else
       bind(C, name="hipsparseDpruneDense2csrByPercentage_bufferSizeExt")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double), value :: percentage
       type(c_ptr), value :: descr
       real(c_double) :: csrVal(*)
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: DpruneDense2csrByPercentage_bufferSizeExt
    end function hipsparseDpruneDense2csrByPercentage_bufferSizeExt

    !---------------------------------------------
    ! hipsparseSpruneDense2csrNnzByPercentage
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief
    !> This function computes the number of non-zero elements per row and the total number of
    !> non-zero elements in a dense matrix when converting and pruning by \p percentage a dense
    !> matrix to a CSR matrix.
    !>
    !> \details
    !> When converting and pruning a dense matrix \p A to a CSR matrix by \p percentage, the
    !> following steps are performed. First, the user calls
    !> \ref hipsparseSpruneDense2csrByPercentage_bufferSize
    !> "hipsparseXpruneDense2csrByPercentage_bufferSize()",
    !> which determines the size of the temporary storage buffer. After this is determined, this
    !> buffer must be allocated
    !> by the user. Next, the user allocates the \p csrRowPtr array to have \p m+1 elements and
    !> calls
    !> \p hipsparseXpruneDense2csrNnzByPercentage. Finally, the user finishes the conversion
    !> by allocating the \p csrColInd and \p csrVal arrays (which have a size determined by the
    !> value
    !> at \p nnzTotalDevHostPtr) and calling \ref hipsparseSpruneDense2csrByPercentage
    !> "hipsparseXpruneDense2csrByPercentage()".
    !>
    !> The pruning by \p percentage works by first sorting the absolute values of the dense
    !> matrix \p A. Users can then determine a position in this sorted array by
    !> \f[
    !> pos = ceil(m \cdot n \cdot (percentage/100)) - 1 \\
    !> pos = \min(pos, m \cdot n-1) \\
    !> pos = \max(pos, 0) \\
    !> threshold = sorted_A[pos]
    !> \f]
    !>
    !> After users have this threshold, they can prune values in the dense matrix \p A, as in
    !> \ref hipsparseSpruneDense2csr "hipsparseXpruneDense2csr()".
    !>
    !> \note
    !> This routine supports asynchronous execution if the pointer mode is set to device.
    !>
    !> @param[in]
    !> handle             handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m                  number of rows of the dense matrix \p A.
    !> @param[in]
    !> n                  number of columns of the dense matrix \p A.
    !> @param[in]
    !> A                  array of dimensions (\p lda, \p n).
    !> @param[in]
    !> lda                leading dimension of dense array \p A.
    !> @param[in]
    !> percentage         \p percentage>=0 and \p percentage<=100.
    !> @param[in]
    !> descr              the descriptor of the dense matrix \p A.
    !> @param[out]
    !> csrRowPtr integer array of \p m+1 elements that contains the start of every row and the end
    !> of the last row plus one.
    !> @param[out]
    !> nnzTotalDevHostPtr total number of non-zero elements in device or host memory.
    !> @param[in]
    !> info               prune information structure
    !> @param[out]
    !> buffer             buffer allocated by the user whose size is determined by calling
    !> \ref hipsparseSpruneDense2csrByPercentage_bufferSize
    !> "hipsparseXpruneDense2csrByPercentage_bufferSize()"
    !> or \ref hipsparseSpruneDense2csrByPercentage_bufferSizeExt
    !> "hipsparseXpruneDense2csrByPercentage_bufferSizeExt()".
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p n, \p lda, \p percentage, \p A, \p
    !> descr, \p info, \p csrRowPtr,
    !> \p nnzTotalDevHostPtr, or \p buffer pointer is invalid.
    function hipsparseSpruneDense2csrNnzByPercentage(handle, m, n, A, lda, percentage, descr, &
                                                     csrRowPtr, nnzTotalDevHostPtr, info, buffer) &
       result(SpruneDense2csrNnzByPercentage) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpruneDense2csrNnzByPercentage")
#else
       bind(C, name="hipsparseSpruneDense2csrNnzByPercentage")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float), value :: percentage
       type(c_ptr), value :: descr
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: nnzTotalDevHostPtr(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: buffer
       integer(c_int) :: SpruneDense2csrNnzByPercentage
    end function hipsparseSpruneDense2csrNnzByPercentage

    !---------------------------------------------
    ! hipsparseDpruneDense2csrNnzByPercentage
    !---------------------------------------------
    function hipsparseDpruneDense2csrNnzByPercentage(handle, m, n, A, lda, percentage, descr, &
                                                     csrRowPtr, nnzTotalDevHostPtr, info, buffer) &
       result(DpruneDense2csrNnzByPercentage) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDpruneDense2csrNnzByPercentage")
#else
       bind(C, name="hipsparseDpruneDense2csrNnzByPercentage")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double), value :: percentage
       type(c_ptr), value :: descr
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: nnzTotalDevHostPtr(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: buffer
       integer(c_int) :: DpruneDense2csrNnzByPercentage
    end function hipsparseDpruneDense2csrNnzByPercentage

    !---------------------------------------------
    ! hipsparseSpruneDense2csrByPercentage
    !---------------------------------------------
    !> \ingroup conv_module
    !> \brief
    !> This function computes the number of non-zero elements per row and the total number of
    !> non-zero elements in a dense matrix when converting and pruning by \p percentage a dense
    !> matrix to a CSR matrix.
    !>
    !> \details
    !> When converting and pruning a dense matrix \p A to a CSR matrix by \p percentage, the
    !> following steps are performed. First, the user calls \ref
    !> hipsparseSpruneDense2csrByPercentage_bufferSize
    !> "hipsparseXpruneDense2csrByPercentage_bufferSize()", which determines the size of the
    !> temporary storage buffer. After this is determined, this buffer must be allocated by the
    !> user.
    !> Next, the user allocates the \p csrRowPtr array to have \p m+1 elements and calls
    !> \ref hipsparseSpruneDense2csrNnzByPercentage "hipsparseXpruneDense2csrNnzByPercentage()".
    !> Finally, the
    !> user finishes the conversion by allocating the \p csrColInd and \p csrVal arrays (which have
    !> a size
    !> determined by the value at \p nnzTotalDevHostPtr) and calling \p
    !> hipsparseXpruneDense2csrByPercentage.
    !>
    !> The pruning by \p percentage works by first sorting the absolute values of the dense
    !> matrix \p A. Users can then determine a position in this sorted array by
    !> \f[
    !> pos = ceil(m \ cdot n \cdot (percentage/100)) - 1 \\
    !> pos = \min(pos, m \cdot n-1) \\
    !> pos = \max(pos, 0) \\
    !> threshold = sorted_A[pos]
    !> \f]
    !>
    !> After users have this threshold, they can prune values in the dense matrix \p A, as in
    !> \ref hipsparseSpruneDense2csr "hipsparseXpruneDense2csr()".
    !>
    !> \note
    !> This routine support asynchronous execution if the pointer mode is set to device.
    !>
    !> @param[in]
    !> handle      handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m           number of rows of the dense matrix \p A.
    !> @param[in]
    !> n           number of columns of the dense matrix \p A.
    !> @param[in]
    !> A           array of dimensions (\p lda, \p n).
    !> @param[in]
    !> lda         leading dimension of dense array \p A.
    !> @param[in]
    !> percentage  \p percentage>=0 and \p percentage<=100.
    !> @param[in]
    !> descr the descriptor of the dense matrix \p A. The supported matrix type is \ref
    !> HIPSPARSE_MATRIX_TYPE_GENERAL and
    !> any valid value of the \ref hipsparseIndexBase_t.
    !> @param[out]
    !> csrVal array of nnz ( = \p csrRowPtr[m] - \p csrRowPtr[0] ) non-zero elements of matrix \p A.
    !> @param[in]
    !> csrRowPtr integer array of \p m+1 elements that contains the start of every row and the end
    !> of the last row plus one.
    !> @param[out]
    !> csrColInd integer array of nnz ( = \p csrRowPtr[m] - \p csrRowPtr[0] ) column indices of the
    !> non-zero elements of matrix \p A.
    !> @param[in]
    !> info prune  information structure
    !> @param[in]
    !> buffer      temporary storage buffer allocated by the user. The size is returned by
    !> \ref hipsparseSpruneDense2csrByPercentage_bufferSize
    !> "hipsparseXpruneDense2csrByPercentage_bufferSize()" or
    !> \ref hipsparseSpruneDense2csrByPercentage_bufferSizeExt
    !> "hipsparseXpruneDense2csrByPercentage_bufferSizeExt()".
    !>
    !> \retval     HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p m, \p n, \p lda, \p percentage, \p A, \p
    !> descr, \p info, \p csrVal,
    !> \p csrRowPtr, \p csrColInd, or \p buffer pointer is invalid.
    function hipsparseSpruneDense2csrByPercentage(handle, m, n, A, lda, percentage, descr, csrVal, &
                                                  csrRowPtr, csrColInd, info, buffer) &
       result(SpruneDense2csrByPercentage) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpruneDense2csrByPercentage")
#else
       bind(C, name="hipsparseSpruneDense2csrByPercentage")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_float) :: A(*)
       integer(c_int), value :: lda
       real(c_float), value :: percentage
       type(c_ptr), value :: descr
       real(c_float) :: csrVal(*)
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: buffer
       integer(c_int) :: SpruneDense2csrByPercentage
    end function hipsparseSpruneDense2csrByPercentage

    !---------------------------------------------
    ! hipsparseDpruneDense2csrByPercentage
    !---------------------------------------------
    function hipsparseDpruneDense2csrByPercentage(handle, m, n, A, lda, percentage, descr, csrVal, &
                                                  csrRowPtr, csrColInd, info, buffer) &
       result(DpruneDense2csrByPercentage) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDpruneDense2csrByPercentage")
#else
       bind(C, name="hipsparseDpruneDense2csrByPercentage")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: n
       real(c_double) :: A(*)
       integer(c_int), value :: lda
       real(c_double), value :: percentage
       type(c_ptr), value :: descr
       real(c_double) :: csrVal(*)
       integer(c_int) :: csrRowPtr(*)
       integer(c_int) :: csrColInd(*)
       type(c_ptr), value :: info
       type(c_ptr), value :: buffer
       integer(c_int) :: DpruneDense2csrByPercentage
    end function hipsparseDpruneDense2csrByPercentage

    !---------------------------------------------
    ! hipsparseScsrcolor
    !---------------------------------------------
    !> \ingroup reordering_module
    !> \brief Coloring of the adjacency graph of the matrix \f$A\f$ stored in the CSR format.
    !>
    !> \details
    !> \p hipsparseXcsrcolor performs the coloring of the undirected graph represented by the
    !> (symmetric) sparsity
    !> pattern of the matrix \f$A\f$ stored in CSR format. Graph coloring is a way of coloring the
    !> nodes of a graph
    !> such that no two adjacent nodes are of the same color. The \p fractionToColor is a parameter
    !> to only color
    !> a given percentage of the graph nodes. The remaining uncolored nodes receive distinct new
    !> colors. The optional
    !> \p reordering array is a permutation array that groups unknowns of the same color. The matrix
    !> \f$A\f$
    !> must be stored as a general matrix with a symmetric sparsity pattern, and if the matrix
    !> \f$A\f$ is non-symmetric,
    !> then the user is responsible to provide the symmetric part \f$\frac{A+A^T}{2}\f$.
    !>
    !> \deprecated
    !> This function is deprecated when using the CUDA backend (CUDA 12.0+) and will be
    !> removed in CUDA 13.0. This deprecation does not apply to the ROCm backend.
    !>
    !> @param[in]
    !> handle          handle to the hipSPARSE library context queue.
    !> @param[in]
    !> m               number of rows of sparse matrix \f$A\f$. Must be non-negative.
    !> @param[in]
    !> nnz             number of non-zero entries of sparse matrix \f$A\f$. Must be non-negative.
    !> @param[in]
    !> descrA          sparse matrix descriptor.
    !> @param[in]
    !> csrValA         array of \p nnz elements of the sparse CSR matrix.
    !> @param[in]
    !> csrRowPtrA      array of \p m+1 elements that point to the start of every row of the
    !> sparse CSR matrix.
    !> @param[in]
    !> csrColIndA      array of \p nnz elements containing the column indices of the sparse
    !> CSR matrix.
    !> @param[in]
    !> fractionToColor fraction of nodes to be colored, which should be in the interval
    !> \f$[0.0,1.0]\f$. For example, \f$0.8\f$ implies that
    !> \f$80\f$ percent of nodes will be colored.
    !> @param[out]
    !> ncolors         resulting number of distinct colors.
    !> @param[out]
    !> coloring        resulting mapping of colors.
    !> @param[out]
    !> reordering optional resulting reordering permutation if \p reordering is a non-null pointer.
    !> @param[inout]
    !> info            structure that holds the information collected during the coloring algorithm.
    !>
    !> \retval HIPSPARSE_STATUS_SUCCESS the operation completed successfully.
    !> \retval HIPSPARSE_STATUS_NOT_INITIALIZED \p handle is not initialized.
    !> \retval HIPSPARSE_STATUS_INVALID_VALUE \p handle, \p descrA, \p fractionToColor,
    !> \p ncolors, \p coloring, or \p info is nullptr, \p m or \p nnz is negative, or
    !> \p csrValA, \p csrRowPtrA, or \p csrColIndA is nullptr when \p nnz is greater than zero.
    function hipsparseScsrcolor(handle, m, nnz, descrA, csrValA, csrRowPtrA, csrColIndA, &
                                fractionToColor, ncolors, coloring, reordering, info) &
       result(Scsrcolor) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseScsrcolor")
#else
       bind(C, name="hipsparseScsrcolor")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       real(c_float) :: csrValA(*)
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       real(c_float) :: fractionToColor(*)
       integer(c_int) :: ncolors(*)
       integer(c_int) :: coloring(*)
       integer(c_int) :: reordering(*)
       type(c_ptr), value :: info
       integer(c_int) :: Scsrcolor
    end function hipsparseScsrcolor

    !---------------------------------------------
    ! hipsparseDcsrcolor
    !---------------------------------------------
    function hipsparseDcsrcolor(handle, m, nnz, descrA, csrValA, csrRowPtrA, csrColIndA, &
                                fractionToColor, ncolors, coloring, reordering, info) &
       result(Dcsrcolor) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDcsrcolor")
#else
       bind(C, name="hipsparseDcsrcolor")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       real(c_double) :: csrValA(*)
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       real(c_double) :: fractionToColor(*)
       integer(c_int) :: ncolors(*)
       integer(c_int) :: coloring(*)
       integer(c_int) :: reordering(*)
       type(c_ptr), value :: info
       integer(c_int) :: Dcsrcolor
    end function hipsparseDcsrcolor

    !---------------------------------------------
    ! hipsparseCcsrcolor
    !---------------------------------------------
    function hipsparseCcsrcolor(handle, m, nnz, descrA, csrValA, csrRowPtrA, csrColIndA, &
                                fractionToColor, ncolors, coloring, reordering, info) &
       result(Ccsrcolor) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCcsrcolor")
#else
       bind(C, name="hipsparseCcsrcolor")
#endif
       import :: c_ptr, c_int, c_float
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrValA
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       real(c_float) :: fractionToColor(*)
       integer(c_int) :: ncolors(*)
       integer(c_int) :: coloring(*)
       integer(c_int) :: reordering(*)
       type(c_ptr), value :: info
       integer(c_int) :: Ccsrcolor
    end function hipsparseCcsrcolor

    !---------------------------------------------
    ! hipsparseZcsrcolor
    !---------------------------------------------
    function hipsparseZcsrcolor(handle, m, nnz, descrA, csrValA, csrRowPtrA, csrColIndA, &
                                fractionToColor, ncolors, coloring, reordering, info) &
       result(Zcsrcolor) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseZcsrcolor")
#else
       bind(C, name="hipsparseZcsrcolor")
#endif
       import :: c_ptr, c_int, c_double
       type(c_ptr), value :: handle
       integer(c_int), value :: m
       integer(c_int), value :: nnz
       type(c_ptr), value :: descrA
       type(c_ptr), value :: csrValA
       integer(c_int) :: csrRowPtrA(*)
       integer(c_int) :: csrColIndA(*)
       real(c_double) :: fractionToColor(*)
       integer(c_int) :: ncolors(*)
       integer(c_int) :: coloring(*)
       integer(c_int) :: reordering(*)
       type(c_ptr), value :: info
       integer(c_int) :: Zcsrcolor
    end function hipsparseZcsrcolor

    !---------------------------------------------
    ! hipsparseCreateSpVec
    !---------------------------------------------
    function hipsparseCreateSpVec(spVecDescr, size, nnz, indices, values, idxType, idxBase, &
                                  valueType) &
       result(CreateSpVec) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCreateSpVec")
#else
       bind(C, name="hipsparseCreateSpVec")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: spVecDescr
       integer(c_long), value :: size
       integer(c_long), value :: nnz
       type(c_ptr), value :: indices
       type(c_ptr), value :: values
       integer(c_int), value :: idxType
       integer(c_int), value :: idxBase
       integer(c_int), value :: valueType
       integer(c_int) :: CreateSpVec
    end function hipsparseCreateSpVec

    !---------------------------------------------
    ! hipsparseCreateConstSpVec
    !---------------------------------------------
    function hipsparseCreateConstSpVec(spVecDescr, size, nnz, indices, values, idxType, idxBase, &
                                       valueType) &
       result(CreateConstSpVec) &
       bind(C, name="hipsparseCreateConstSpVec")
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: spVecDescr
       integer(c_long), value :: size
       integer(c_long), value :: nnz
       type(c_ptr), value :: indices
       type(c_ptr), value :: values
       integer(c_int), value :: idxType
       integer(c_int), value :: idxBase
       integer(c_int), value :: valueType
       integer(c_int) :: CreateConstSpVec
    end function hipsparseCreateConstSpVec

    !---------------------------------------------
    ! hipsparseDestroySpVec
    !---------------------------------------------
    function hipsparseDestroySpVec(spVecDescr) &
       result(DestroySpVec) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDestroySpVec")
#else
       bind(C, name="hipsparseDestroySpVec")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: spVecDescr
       integer(c_int) :: DestroySpVec
    end function hipsparseDestroySpVec

    !---------------------------------------------
    ! hipsparseSpVecGet
    !---------------------------------------------
    function hipsparseSpVecGet(spVecDescr, size, nnz, indices, values, idxType, idxBase, &
                               valueType) &
       result(SpVecGet) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpVecGet")
#else
       bind(C, name="hipsparseSpVecGet")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: spVecDescr
       type(c_ptr), value :: size
       type(c_ptr), value :: nnz
       type(c_ptr) :: indices
       type(c_ptr) :: values
       integer(c_int) :: idxType(*)
       integer(c_int) :: idxBase(*)
       integer(c_int) :: valueType(*)
       integer(c_int) :: SpVecGet
    end function hipsparseSpVecGet

    !---------------------------------------------
    ! hipsparseConstSpVecGet
    !---------------------------------------------
    function hipsparseConstSpVecGet(spVecDescr, size, nnz, indices, values, idxType, idxBase, &
                                    valueType) &
       result(ConstSpVecGet) &
       bind(C, name="hipsparseConstSpVecGet")
       import :: c_ptr, c_int
       type(c_ptr), value :: spVecDescr
       type(c_ptr), value :: size
       type(c_ptr), value :: nnz
       type(c_ptr) :: indices
       type(c_ptr) :: values
       integer(c_int) :: idxType(*)
       integer(c_int) :: idxBase(*)
       integer(c_int) :: valueType(*)
       integer(c_int) :: ConstSpVecGet
    end function hipsparseConstSpVecGet

    !---------------------------------------------
    ! hipsparseSpVecGetIndexBase
    !---------------------------------------------
    function hipsparseSpVecGetIndexBase(spVecDescr, idxBase) &
       result(SpVecGetIndexBase) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpVecGetIndexBase")
#else
       bind(C, name="hipsparseSpVecGetIndexBase")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: spVecDescr
       integer(c_int) :: idxBase(*)
       integer(c_int) :: SpVecGetIndexBase
    end function hipsparseSpVecGetIndexBase

    !---------------------------------------------
    ! hipsparseSpVecGetValues
    !---------------------------------------------
    function hipsparseSpVecGetValues(spVecDescr, values) &
       result(SpVecGetValues) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpVecGetValues")
#else
       bind(C, name="hipsparseSpVecGetValues")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: spVecDescr
       type(c_ptr) :: values
       integer(c_int) :: SpVecGetValues
    end function hipsparseSpVecGetValues

    !---------------------------------------------
    ! hipsparseConstSpVecGetValues
    !---------------------------------------------
    function hipsparseConstSpVecGetValues(spVecDescr, values) &
       result(ConstSpVecGetValues) &
       bind(C, name="hipsparseConstSpVecGetValues")
       import :: c_ptr, c_int
       type(c_ptr), value :: spVecDescr
       type(c_ptr) :: values
       integer(c_int) :: ConstSpVecGetValues
    end function hipsparseConstSpVecGetValues

    !---------------------------------------------
    ! hipsparseSpVecSetValues
    !---------------------------------------------
    function hipsparseSpVecSetValues(spVecDescr, values) &
       result(SpVecSetValues) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpVecSetValues")
#else
       bind(C, name="hipsparseSpVecSetValues")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: spVecDescr
       type(c_ptr), value :: values
       integer(c_int) :: SpVecSetValues
    end function hipsparseSpVecSetValues

    !---------------------------------------------
    ! hipsparseCreateCoo
    !---------------------------------------------
    function hipsparseCreateCoo(spMatDescr, rows, cols, nnz, cooRowInd, cooColInd, cooValues, &
                                cooIdxType, idxBase, valueType) &
       result(CreateCoo) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCreateCoo")
#else
       bind(C, name="hipsparseCreateCoo")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: spMatDescr
       integer(c_long), value :: rows
       integer(c_long), value :: cols
       integer(c_long), value :: nnz
       type(c_ptr), value :: cooRowInd
       type(c_ptr), value :: cooColInd
       type(c_ptr), value :: cooValues
       integer(c_int), value :: cooIdxType
       integer(c_int), value :: idxBase
       integer(c_int), value :: valueType
       integer(c_int) :: CreateCoo
    end function hipsparseCreateCoo

    !---------------------------------------------
    ! hipsparseCreateConstCoo
    !---------------------------------------------
    function hipsparseCreateConstCoo(spMatDescr, rows, cols, nnz, cooRowInd, cooColInd, cooValues, &
                                     cooIdxType, idxBase, valueType) &
       result(CreateConstCoo) &
       bind(C, name="hipsparseCreateConstCoo")
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: spMatDescr
       integer(c_long), value :: rows
       integer(c_long), value :: cols
       integer(c_long), value :: nnz
       type(c_ptr), value :: cooRowInd
       type(c_ptr), value :: cooColInd
       type(c_ptr), value :: cooValues
       integer(c_int), value :: cooIdxType
       integer(c_int), value :: idxBase
       integer(c_int), value :: valueType
       integer(c_int) :: CreateConstCoo
    end function hipsparseCreateConstCoo

    !---------------------------------------------
    ! hipsparseCreateCooAoS
    !---------------------------------------------
    function hipsparseCreateCooAoS(spMatDescr, rows, cols, nnz, cooInd, cooValues, cooIdxType, &
                                   idxBase, valueType) &
       result(CreateCooAoS) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCreateCooAoS")
#else
       bind(C, name="hipsparseCreateCooAoS")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: spMatDescr
       integer(c_long), value :: rows
       integer(c_long), value :: cols
       integer(c_long), value :: nnz
       type(c_ptr), value :: cooInd
       type(c_ptr), value :: cooValues
       integer(c_int), value :: cooIdxType
       integer(c_int), value :: idxBase
       integer(c_int), value :: valueType
       integer(c_int) :: CreateCooAoS
    end function hipsparseCreateCooAoS

    !---------------------------------------------
    ! hipsparseCreateCsr
    !---------------------------------------------
    function hipsparseCreateCsr(spMatDescr, rows, cols, nnz, csrRowOffsets, csrColInd, csrValues, &
                                csrRowOffsetsType, csrColIndType, idxBase, valueType) &
       result(CreateCsr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCreateCsr")
#else
       bind(C, name="hipsparseCreateCsr")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: spMatDescr
       integer(c_long), value :: rows
       integer(c_long), value :: cols
       integer(c_long), value :: nnz
       type(c_ptr), value :: csrRowOffsets
       type(c_ptr), value :: csrColInd
       type(c_ptr), value :: csrValues
       integer(c_int), value :: csrRowOffsetsType
       integer(c_int), value :: csrColIndType
       integer(c_int), value :: idxBase
       integer(c_int), value :: valueType
       integer(c_int) :: CreateCsr
    end function hipsparseCreateCsr

    !---------------------------------------------
    ! hipsparseCreateConstCsr
    !---------------------------------------------
    function hipsparseCreateConstCsr(spMatDescr, rows, cols, nnz, csrRowOffsets, csrColInd, &
                                     csrValues, csrRowOffsetsType, csrColIndType, idxBase, &
                                     valueType) &
       result(CreateConstCsr) &
       bind(C, name="hipsparseCreateConstCsr")
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: spMatDescr
       integer(c_long), value :: rows
       integer(c_long), value :: cols
       integer(c_long), value :: nnz
       type(c_ptr), value :: csrRowOffsets
       type(c_ptr), value :: csrColInd
       type(c_ptr), value :: csrValues
       integer(c_int), value :: csrRowOffsetsType
       integer(c_int), value :: csrColIndType
       integer(c_int), value :: idxBase
       integer(c_int), value :: valueType
       integer(c_int) :: CreateConstCsr
    end function hipsparseCreateConstCsr

    !---------------------------------------------
    ! hipsparseCreateCsc
    !---------------------------------------------
    function hipsparseCreateCsc(spMatDescr, rows, cols, nnz, cscColOffsets, cscRowInd, cscValues, &
                                cscColOffsetsType, cscRowIndType, idxBase, valueType) &
       result(CreateCsc) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCreateCsc")
#else
       bind(C, name="hipsparseCreateCsc")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: spMatDescr
       integer(c_long), value :: rows
       integer(c_long), value :: cols
       integer(c_long), value :: nnz
       type(c_ptr), value :: cscColOffsets
       type(c_ptr), value :: cscRowInd
       type(c_ptr), value :: cscValues
       integer(c_int), value :: cscColOffsetsType
       integer(c_int), value :: cscRowIndType
       integer(c_int), value :: idxBase
       integer(c_int), value :: valueType
       integer(c_int) :: CreateCsc
    end function hipsparseCreateCsc

    !---------------------------------------------
    ! hipsparseCreateConstCsc
    !---------------------------------------------
    function hipsparseCreateConstCsc(spMatDescr, rows, cols, nnz, cscColOffsets, cscRowInd, &
                                     cscValues, cscColOffsetsType, cscRowIndType, idxBase, &
                                     valueType) &
       result(CreateConstCsc) &
       bind(C, name="hipsparseCreateConstCsc")
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: spMatDescr
       integer(c_long), value :: rows
       integer(c_long), value :: cols
       integer(c_long), value :: nnz
       type(c_ptr), value :: cscColOffsets
       type(c_ptr), value :: cscRowInd
       type(c_ptr), value :: cscValues
       integer(c_int), value :: cscColOffsetsType
       integer(c_int), value :: cscRowIndType
       integer(c_int), value :: idxBase
       integer(c_int), value :: valueType
       integer(c_int) :: CreateConstCsc
    end function hipsparseCreateConstCsc

    !---------------------------------------------
    ! hipsparseCreateBlockedEll
    !---------------------------------------------
    function hipsparseCreateBlockedEll(spMatDescr, rows, cols, ellBlockSize, ellCols, ellColInd, &
                                       ellValue, ellIdxType, idxBase, valueType) &
       result(CreateBlockedEll) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCreateBlockedEll")
#else
       bind(C, name="hipsparseCreateBlockedEll")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: spMatDescr
       integer(c_long), value :: rows
       integer(c_long), value :: cols
       integer(c_long), value :: ellBlockSize
       integer(c_long), value :: ellCols
       type(c_ptr), value :: ellColInd
       type(c_ptr), value :: ellValue
       integer(c_int), value :: ellIdxType
       integer(c_int), value :: idxBase
       integer(c_int), value :: valueType
       integer(c_int) :: CreateBlockedEll
    end function hipsparseCreateBlockedEll

    !---------------------------------------------
    ! hipsparseCreateConstBlockedEll
    !---------------------------------------------
    function hipsparseCreateConstBlockedEll(spMatDescr, rows, cols, ellBlockSize, ellCols, &
                                            ellColInd, ellValue, ellIdxType, idxBase, valueType) &
       result(CreateConstBlockedEll) &
       bind(C, name="hipsparseCreateConstBlockedEll")
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: spMatDescr
       integer(c_long), value :: rows
       integer(c_long), value :: cols
       integer(c_long), value :: ellBlockSize
       integer(c_long), value :: ellCols
       type(c_ptr), value :: ellColInd
       type(c_ptr), value :: ellValue
       integer(c_int), value :: ellIdxType
       integer(c_int), value :: idxBase
       integer(c_int), value :: valueType
       integer(c_int) :: CreateConstBlockedEll
    end function hipsparseCreateConstBlockedEll

    !---------------------------------------------
    ! hipsparseCreateSlicedEll
    !---------------------------------------------
    function hipsparseCreateSlicedEll(spMatDescr, rows, cols, nnz, sellValuesSize, sliceSize, &
                                      sellSliceOffsets, sellColInd, sellValues, &
                                      sellSliceOffsetsType, sellColIndType, idxBase, valueType) &
       result(CreateSlicedEll) &
       bind(C, name="hipsparseCreateSlicedEll")
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: spMatDescr
       integer(c_long), value :: rows
       integer(c_long), value :: cols
       integer(c_long), value :: nnz
       integer(c_long), value :: sellValuesSize
       integer(c_long), value :: sliceSize
       type(c_ptr), value :: sellSliceOffsets
       type(c_ptr), value :: sellColInd
       type(c_ptr), value :: sellValues
       integer(c_int), value :: sellSliceOffsetsType
       integer(c_int), value :: sellColIndType
       integer(c_int), value :: idxBase
       integer(c_int), value :: valueType
       integer(c_int) :: CreateSlicedEll
    end function hipsparseCreateSlicedEll

    !---------------------------------------------
    ! hipsparseCreateConstSlicedEll
    !---------------------------------------------
    function hipsparseCreateConstSlicedEll(spMatDescr, rows, cols, nnz, sellValuesSize, sliceSize, &
                                           sellSliceOffsets, sellColInd, sellValues, &
                                           sellSliceOffsetsType, sellColIndType, idxBase, &
                                           valueType) &
       result(CreateConstSlicedEll) &
       bind(C, name="hipsparseCreateConstSlicedEll")
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: spMatDescr
       integer(c_long), value :: rows
       integer(c_long), value :: cols
       integer(c_long), value :: nnz
       integer(c_long), value :: sellValuesSize
       integer(c_long), value :: sliceSize
       type(c_ptr), value :: sellSliceOffsets
       type(c_ptr), value :: sellColInd
       type(c_ptr), value :: sellValues
       integer(c_int), value :: sellSliceOffsetsType
       integer(c_int), value :: sellColIndType
       integer(c_int), value :: idxBase
       integer(c_int), value :: valueType
       integer(c_int) :: CreateConstSlicedEll
    end function hipsparseCreateConstSlicedEll

    !---------------------------------------------
    ! hipsparseDestroySpMat
    !---------------------------------------------
    function hipsparseDestroySpMat(spMatDescr) &
       result(DestroySpMat) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDestroySpMat")
#else
       bind(C, name="hipsparseDestroySpMat")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: spMatDescr
       integer(c_int) :: DestroySpMat
    end function hipsparseDestroySpMat

    !---------------------------------------------
    ! hipsparseCooGet
    !---------------------------------------------
    function hipsparseCooGet(spMatDescr, rows, cols, nnz, cooRowInd, cooColInd, cooValues, &
                             idxType, idxBase, valueType) &
       result(CooGet) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCooGet")
#else
       bind(C, name="hipsparseCooGet")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: spMatDescr
       type(c_ptr), value :: rows
       type(c_ptr), value :: cols
       type(c_ptr), value :: nnz
       type(c_ptr) :: cooRowInd
       type(c_ptr) :: cooColInd
       type(c_ptr) :: cooValues
       integer(c_int) :: idxType(*)
       integer(c_int) :: idxBase(*)
       integer(c_int) :: valueType(*)
       integer(c_int) :: CooGet
    end function hipsparseCooGet

    !---------------------------------------------
    ! hipsparseConstCooGet
    !---------------------------------------------
    function hipsparseConstCooGet(spMatDescr, rows, cols, nnz, cooRowInd, cooColInd, cooValues, &
                                  idxType, idxBase, valueType) &
       result(ConstCooGet) &
       bind(C, name="hipsparseConstCooGet")
       import :: c_ptr, c_int
       type(c_ptr), value :: spMatDescr
       type(c_ptr), value :: rows
       type(c_ptr), value :: cols
       type(c_ptr), value :: nnz
       type(c_ptr) :: cooRowInd
       type(c_ptr) :: cooColInd
       type(c_ptr) :: cooValues
       integer(c_int) :: idxType(*)
       integer(c_int) :: idxBase(*)
       integer(c_int) :: valueType(*)
       integer(c_int) :: ConstCooGet
    end function hipsparseConstCooGet

    !---------------------------------------------
    ! hipsparseCooAoSGet
    !---------------------------------------------
    function hipsparseCooAoSGet(spMatDescr, rows, cols, nnz, cooInd, cooValues, idxType, idxBase, &
                                valueType) &
       result(CooAoSGet) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCooAoSGet")
#else
       bind(C, name="hipsparseCooAoSGet")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: spMatDescr
       type(c_ptr), value :: rows
       type(c_ptr), value :: cols
       type(c_ptr), value :: nnz
       type(c_ptr) :: cooInd
       type(c_ptr) :: cooValues
       integer(c_int) :: idxType(*)
       integer(c_int) :: idxBase(*)
       integer(c_int) :: valueType(*)
       integer(c_int) :: CooAoSGet
    end function hipsparseCooAoSGet

    !---------------------------------------------
    ! hipsparseCsrGet
    !---------------------------------------------
    function hipsparseCsrGet(spMatDescr, rows, cols, nnz, csrRowOffsets, csrColInd, csrValues, &
                             csrRowOffsetsType, csrColIndType, idxBase, valueType) &
       result(CsrGet) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCsrGet")
#else
       bind(C, name="hipsparseCsrGet")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: spMatDescr
       type(c_ptr), value :: rows
       type(c_ptr), value :: cols
       type(c_ptr), value :: nnz
       type(c_ptr) :: csrRowOffsets
       type(c_ptr) :: csrColInd
       type(c_ptr) :: csrValues
       integer(c_int) :: csrRowOffsetsType(*)
       integer(c_int) :: csrColIndType(*)
       integer(c_int) :: idxBase(*)
       integer(c_int) :: valueType(*)
       integer(c_int) :: CsrGet
    end function hipsparseCsrGet

    !---------------------------------------------
    ! hipsparseConstCsrGet
    !---------------------------------------------
    function hipsparseConstCsrGet(spMatDescr, rows, cols, nnz, csrRowOffsets, csrColInd, &
                                  csrValues, csrRowOffsetsType, csrColIndType, idxBase, valueType) &
       result(ConstCsrGet) &
       bind(C, name="hipsparseConstCsrGet")
       import :: c_ptr, c_int
       type(c_ptr), value :: spMatDescr
       type(c_ptr), value :: rows
       type(c_ptr), value :: cols
       type(c_ptr), value :: nnz
       type(c_ptr) :: csrRowOffsets
       type(c_ptr) :: csrColInd
       type(c_ptr) :: csrValues
       integer(c_int) :: csrRowOffsetsType(*)
       integer(c_int) :: csrColIndType(*)
       integer(c_int) :: idxBase(*)
       integer(c_int) :: valueType(*)
       integer(c_int) :: ConstCsrGet
    end function hipsparseConstCsrGet

    !---------------------------------------------
    ! hipsparseCscGet
    !---------------------------------------------
    function hipsparseCscGet(spMatDescr, rows, cols, nnz, cscColOffsets, cscRowInd, cscValues, &
                             cscColOffsetsType, cscRowIndType, idxBase, valueType) &
       result(CscGet) &
       bind(C, name="hipsparseCscGet")
       import :: c_ptr, c_int
       type(c_ptr), value :: spMatDescr
       type(c_ptr), value :: rows
       type(c_ptr), value :: cols
       type(c_ptr), value :: nnz
       type(c_ptr) :: cscColOffsets
       type(c_ptr) :: cscRowInd
       type(c_ptr) :: cscValues
       integer(c_int) :: cscColOffsetsType(*)
       integer(c_int) :: cscRowIndType(*)
       integer(c_int) :: idxBase(*)
       integer(c_int) :: valueType(*)
       integer(c_int) :: CscGet
    end function hipsparseCscGet

    !---------------------------------------------
    ! hipsparseConstCscGet
    !---------------------------------------------
    function hipsparseConstCscGet(spMatDescr, rows, cols, nnz, cscColOffsets, cscRowInd, &
                                  cscValues, cscColOffsetsType, cscRowIndType, idxBase, valueType) &
       result(ConstCscGet) &
       bind(C, name="hipsparseConstCscGet")
       import :: c_ptr, c_int
       type(c_ptr), value :: spMatDescr
       type(c_ptr), value :: rows
       type(c_ptr), value :: cols
       type(c_ptr), value :: nnz
       type(c_ptr) :: cscColOffsets
       type(c_ptr) :: cscRowInd
       type(c_ptr) :: cscValues
       integer(c_int) :: cscColOffsetsType(*)
       integer(c_int) :: cscRowIndType(*)
       integer(c_int) :: idxBase(*)
       integer(c_int) :: valueType(*)
       integer(c_int) :: ConstCscGet
    end function hipsparseConstCscGet

    !---------------------------------------------
    ! hipsparseBlockedEllGet
    !---------------------------------------------
    function hipsparseBlockedEllGet(spMatDescr, rows, cols, ellBlockSize, ellCols, ellColInd, &
                                    ellValue, ellIdxType, idxBase, valueType) &
       result(BlockedEllGet) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseBlockedEllGet")
#else
       bind(C, name="hipsparseBlockedEllGet")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: spMatDescr
       type(c_ptr), value :: rows
       type(c_ptr), value :: cols
       type(c_ptr), value :: ellBlockSize
       type(c_ptr), value :: ellCols
       type(c_ptr) :: ellColInd
       type(c_ptr) :: ellValue
       integer(c_int) :: ellIdxType(*)
       integer(c_int) :: idxBase(*)
       integer(c_int) :: valueType(*)
       integer(c_int) :: BlockedEllGet
    end function hipsparseBlockedEllGet

    !---------------------------------------------
    ! hipsparseConstBlockedEllGet
    !---------------------------------------------
    function hipsparseConstBlockedEllGet(spMatDescr, rows, cols, ellBlockSize, ellCols, ellColInd, &
                                         ellValue, ellIdxType, idxBase, valueType) &
       result(ConstBlockedEllGet) &
       bind(C, name="hipsparseConstBlockedEllGet")
       import :: c_ptr, c_int
       type(c_ptr), value :: spMatDescr
       type(c_ptr), value :: rows
       type(c_ptr), value :: cols
       type(c_ptr), value :: ellBlockSize
       type(c_ptr), value :: ellCols
       type(c_ptr) :: ellColInd
       type(c_ptr) :: ellValue
       integer(c_int) :: ellIdxType(*)
       integer(c_int) :: idxBase(*)
       integer(c_int) :: valueType(*)
       integer(c_int) :: ConstBlockedEllGet
    end function hipsparseConstBlockedEllGet

    !---------------------------------------------
    ! hipsparseCsrSetPointers
    !---------------------------------------------
    function hipsparseCsrSetPointers(spMatDescr, csrRowOffsets, csrColInd, csrValues) &
       result(CsrSetPointers) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCsrSetPointers")
#else
       bind(C, name="hipsparseCsrSetPointers")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: spMatDescr
       type(c_ptr), value :: csrRowOffsets
       type(c_ptr), value :: csrColInd
       type(c_ptr), value :: csrValues
       integer(c_int) :: CsrSetPointers
    end function hipsparseCsrSetPointers

    !---------------------------------------------
    ! hipsparseCscSetPointers
    !---------------------------------------------
    function hipsparseCscSetPointers(spMatDescr, cscColOffsets, cscRowInd, cscValues) &
       result(CscSetPointers) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCscSetPointers")
#else
       bind(C, name="hipsparseCscSetPointers")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: spMatDescr
       type(c_ptr), value :: cscColOffsets
       type(c_ptr), value :: cscRowInd
       type(c_ptr), value :: cscValues
       integer(c_int) :: CscSetPointers
    end function hipsparseCscSetPointers

    !---------------------------------------------
    ! hipsparseCooSetPointers
    !---------------------------------------------
    function hipsparseCooSetPointers(spMatDescr, cooRowInd, cooColInd, cooValues) &
       result(CooSetPointers) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCooSetPointers")
#else
       bind(C, name="hipsparseCooSetPointers")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: spMatDescr
       type(c_ptr), value :: cooRowInd
       type(c_ptr), value :: cooColInd
       type(c_ptr), value :: cooValues
       integer(c_int) :: CooSetPointers
    end function hipsparseCooSetPointers

    !---------------------------------------------
    ! hipsparseSpMatGetSize
    !---------------------------------------------
    function hipsparseSpMatGetSize(spMatDescr, rows, cols, nnz) &
       result(SpMatGetSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpMatGetSize")
#else
       bind(C, name="hipsparseSpMatGetSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: spMatDescr
       type(c_ptr), value :: rows
       type(c_ptr), value :: cols
       type(c_ptr), value :: nnz
       integer(c_int) :: SpMatGetSize
    end function hipsparseSpMatGetSize

    !---------------------------------------------
    ! hipsparseSpMatGetFormat
    !---------------------------------------------
    function hipsparseSpMatGetFormat(spMatDescr, format) &
       result(SpMatGetFormat) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpMatGetFormat")
#else
       bind(C, name="hipsparseSpMatGetFormat")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: spMatDescr
       integer(c_int) :: format(*)
       integer(c_int) :: SpMatGetFormat
    end function hipsparseSpMatGetFormat

    !---------------------------------------------
    ! hipsparseSpMatGetIndexBase
    !---------------------------------------------
    function hipsparseSpMatGetIndexBase(spMatDescr, idxBase) &
       result(SpMatGetIndexBase) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpMatGetIndexBase")
#else
       bind(C, name="hipsparseSpMatGetIndexBase")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: spMatDescr
       integer(c_int) :: idxBase(*)
       integer(c_int) :: SpMatGetIndexBase
    end function hipsparseSpMatGetIndexBase

    !---------------------------------------------
    ! hipsparseSpMatGetValues
    !---------------------------------------------
    function hipsparseSpMatGetValues(spMatDescr, values) &
       result(SpMatGetValues) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpMatGetValues")
#else
       bind(C, name="hipsparseSpMatGetValues")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: spMatDescr
       type(c_ptr) :: values
       integer(c_int) :: SpMatGetValues
    end function hipsparseSpMatGetValues

    !---------------------------------------------
    ! hipsparseConstSpMatGetValues
    !---------------------------------------------
    function hipsparseConstSpMatGetValues(spMatDescr, values) &
       result(ConstSpMatGetValues) &
       bind(C, name="hipsparseConstSpMatGetValues")
       import :: c_ptr, c_int
       type(c_ptr), value :: spMatDescr
       type(c_ptr) :: values
       integer(c_int) :: ConstSpMatGetValues
    end function hipsparseConstSpMatGetValues

    !---------------------------------------------
    ! hipsparseSpMatSetValues
    !---------------------------------------------
    function hipsparseSpMatSetValues(spMatDescr, values) &
       result(SpMatSetValues) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpMatSetValues")
#else
       bind(C, name="hipsparseSpMatSetValues")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: spMatDescr
       type(c_ptr), value :: values
       integer(c_int) :: SpMatSetValues
    end function hipsparseSpMatSetValues

    !---------------------------------------------
    ! hipsparseSpMatGetStridedBatch
    !---------------------------------------------
    function hipsparseSpMatGetStridedBatch(spMatDescr, batchCount) &
       result(SpMatGetStridedBatch) &
       bind(C, name="hipsparseSpMatGetStridedBatch")
       import :: c_ptr, c_int
       type(c_ptr), value :: spMatDescr
       integer(c_int) :: batchCount(*)
       integer(c_int) :: SpMatGetStridedBatch
    end function hipsparseSpMatGetStridedBatch

    !---------------------------------------------
    ! hipsparseSpMatSetStridedBatch
    !---------------------------------------------
    function hipsparseSpMatSetStridedBatch(spMatDescr, batchCount) &
       result(SpMatSetStridedBatch) &
       bind(C, name="hipsparseSpMatSetStridedBatch")
       import :: c_ptr, c_int
       type(c_ptr), value :: spMatDescr
       integer(c_int), value :: batchCount
       integer(c_int) :: SpMatSetStridedBatch
    end function hipsparseSpMatSetStridedBatch

    !---------------------------------------------
    ! hipsparseCooSetStridedBatch
    !---------------------------------------------
    function hipsparseCooSetStridedBatch(spMatDescr, batchCount, batchStride) &
       result(CooSetStridedBatch) &
       bind(C, name="hipsparseCooSetStridedBatch")
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: spMatDescr
       integer(c_int), value :: batchCount
       integer(c_long), value :: batchStride
       integer(c_int) :: CooSetStridedBatch
    end function hipsparseCooSetStridedBatch

    !---------------------------------------------
    ! hipsparseCsrSetStridedBatch
    !---------------------------------------------
    function hipsparseCsrSetStridedBatch(spMatDescr, batchCount, offsetsBatchStride, &
                                         columnsValuesBatchStride) &
       result(CsrSetStridedBatch) &
       bind(C, name="hipsparseCsrSetStridedBatch")
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: spMatDescr
       integer(c_int), value :: batchCount
       integer(c_long), value :: offsetsBatchStride
       integer(c_long), value :: columnsValuesBatchStride
       integer(c_int) :: CsrSetStridedBatch
    end function hipsparseCsrSetStridedBatch

    !---------------------------------------------
    ! hipsparseSpMatGetAttribute
    !---------------------------------------------
    function hipsparseSpMatGetAttribute(spMatDescr, attribute, data, dataSize) &
       result(SpMatGetAttribute) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpMatGetAttribute")
#else
       bind(C, name="hipsparseSpMatGetAttribute")
#endif
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: spMatDescr
       integer(c_int), value :: attribute
       type(c_ptr), value :: data
       integer(c_long), value :: dataSize
       integer(c_int) :: SpMatGetAttribute
    end function hipsparseSpMatGetAttribute

    !---------------------------------------------
    ! hipsparseSpMatSetAttribute
    !---------------------------------------------
    function hipsparseSpMatSetAttribute(spMatDescr, attribute, data, dataSize) &
       result(SpMatSetAttribute) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpMatSetAttribute")
#else
       bind(C, name="hipsparseSpMatSetAttribute")
#endif
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: spMatDescr
       integer(c_int), value :: attribute
       type(c_ptr), value :: data
       integer(c_long), value :: dataSize
       integer(c_int) :: SpMatSetAttribute
    end function hipsparseSpMatSetAttribute

    !---------------------------------------------
    ! hipsparseCreateDnVec
    !---------------------------------------------
    function hipsparseCreateDnVec(dnVecDescr, size, values, valueType) &
       result(CreateDnVec) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCreateDnVec")
#else
       bind(C, name="hipsparseCreateDnVec")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: dnVecDescr
       integer(c_long), value :: size
       type(c_ptr), value :: values
       integer(c_int), value :: valueType
       integer(c_int) :: CreateDnVec
    end function hipsparseCreateDnVec

    !---------------------------------------------
    ! hipsparseCreateConstDnVec
    !---------------------------------------------
    function hipsparseCreateConstDnVec(dnVecDescr, size, values, valueType) &
       result(CreateConstDnVec) &
       bind(C, name="hipsparseCreateConstDnVec")
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: dnVecDescr
       integer(c_long), value :: size
       type(c_ptr), value :: values
       integer(c_int), value :: valueType
       integer(c_int) :: CreateConstDnVec
    end function hipsparseCreateConstDnVec

    !---------------------------------------------
    ! hipsparseDestroyDnVec
    !---------------------------------------------
    function hipsparseDestroyDnVec(dnVecDescr) &
       result(DestroyDnVec) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDestroyDnVec")
#else
       bind(C, name="hipsparseDestroyDnVec")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: dnVecDescr
       integer(c_int) :: DestroyDnVec
    end function hipsparseDestroyDnVec

    !---------------------------------------------
    ! hipsparseDnVecGet
    !---------------------------------------------
    function hipsparseDnVecGet(dnVecDescr, size, values, valueType) &
       result(DnVecGet) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDnVecGet")
#else
       bind(C, name="hipsparseDnVecGet")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: dnVecDescr
       type(c_ptr), value :: size
       type(c_ptr) :: values
       integer(c_int) :: valueType(*)
       integer(c_int) :: DnVecGet
    end function hipsparseDnVecGet

    !---------------------------------------------
    ! hipsparseConstDnVecGet
    !---------------------------------------------
    function hipsparseConstDnVecGet(dnVecDescr, size, values, valueType) &
       result(ConstDnVecGet) &
       bind(C, name="hipsparseConstDnVecGet")
       import :: c_ptr, c_int
       type(c_ptr), value :: dnVecDescr
       type(c_ptr), value :: size
       type(c_ptr) :: values
       integer(c_int) :: valueType(*)
       integer(c_int) :: ConstDnVecGet
    end function hipsparseConstDnVecGet

    !---------------------------------------------
    ! hipsparseDnVecGetValues
    !---------------------------------------------
    function hipsparseDnVecGetValues(dnVecDescr, values) &
       result(DnVecGetValues) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDnVecGetValues")
#else
       bind(C, name="hipsparseDnVecGetValues")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: dnVecDescr
       type(c_ptr) :: values
       integer(c_int) :: DnVecGetValues
    end function hipsparseDnVecGetValues

    !---------------------------------------------
    ! hipsparseConstDnVecGetValues
    !---------------------------------------------
    function hipsparseConstDnVecGetValues(dnVecDescr, values) &
       result(ConstDnVecGetValues) &
       bind(C, name="hipsparseConstDnVecGetValues")
       import :: c_ptr, c_int
       type(c_ptr), value :: dnVecDescr
       type(c_ptr) :: values
       integer(c_int) :: ConstDnVecGetValues
    end function hipsparseConstDnVecGetValues

    !---------------------------------------------
    ! hipsparseDnVecSetValues
    !---------------------------------------------
    function hipsparseDnVecSetValues(dnVecDescr, values) &
       result(DnVecSetValues) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDnVecSetValues")
#else
       bind(C, name="hipsparseDnVecSetValues")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: dnVecDescr
       type(c_ptr), value :: values
       integer(c_int) :: DnVecSetValues
    end function hipsparseDnVecSetValues

    !---------------------------------------------
    ! hipsparseCreateDnMat
    !---------------------------------------------
    function hipsparseCreateDnMat(dnMatDescr, rows, cols, ld, values, valueType, order) &
       result(CreateDnMat) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseCreateDnMat")
#else
       bind(C, name="hipsparseCreateDnMat")
#endif
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: dnMatDescr
       integer(c_long), value :: rows
       integer(c_long), value :: cols
       integer(c_long), value :: ld
       type(c_ptr), value :: values
       integer(c_int), value :: valueType
       integer(c_int), value :: order
       integer(c_int) :: CreateDnMat
    end function hipsparseCreateDnMat

    !---------------------------------------------
    ! hipsparseCreateConstDnMat
    !---------------------------------------------
    function hipsparseCreateConstDnMat(dnMatDescr, rows, cols, ld, values, valueType, order) &
       result(CreateConstDnMat) &
       bind(C, name="hipsparseCreateConstDnMat")
       import :: c_ptr, c_long, c_int
       type(c_ptr) :: dnMatDescr
       integer(c_long), value :: rows
       integer(c_long), value :: cols
       integer(c_long), value :: ld
       type(c_ptr), value :: values
       integer(c_int), value :: valueType
       integer(c_int), value :: order
       integer(c_int) :: CreateConstDnMat
    end function hipsparseCreateConstDnMat

    !---------------------------------------------
    ! hipsparseDestroyDnMat
    !---------------------------------------------
    function hipsparseDestroyDnMat(dnMatDescr) &
       result(DestroyDnMat) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDestroyDnMat")
#else
       bind(C, name="hipsparseDestroyDnMat")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: dnMatDescr
       integer(c_int) :: DestroyDnMat
    end function hipsparseDestroyDnMat

    !---------------------------------------------
    ! hipsparseDnMatGet
    !---------------------------------------------
    function hipsparseDnMatGet(dnMatDescr, rows, cols, ld, values, valueType, order) &
       result(DnMatGet) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDnMatGet")
#else
       bind(C, name="hipsparseDnMatGet")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: dnMatDescr
       type(c_ptr), value :: rows
       type(c_ptr), value :: cols
       type(c_ptr), value :: ld
       type(c_ptr) :: values
       integer(c_int) :: valueType(*)
       integer(c_int) :: order(*)
       integer(c_int) :: DnMatGet
    end function hipsparseDnMatGet

    !---------------------------------------------
    ! hipsparseConstDnMatGet
    !---------------------------------------------
    function hipsparseConstDnMatGet(dnMatDescr, rows, cols, ld, values, valueType, order) &
       result(ConstDnMatGet) &
       bind(C, name="hipsparseConstDnMatGet")
       import :: c_ptr, c_int
       type(c_ptr), value :: dnMatDescr
       type(c_ptr), value :: rows
       type(c_ptr), value :: cols
       type(c_ptr), value :: ld
       type(c_ptr) :: values
       integer(c_int) :: valueType(*)
       integer(c_int) :: order(*)
       integer(c_int) :: ConstDnMatGet
    end function hipsparseConstDnMatGet

    !---------------------------------------------
    ! hipsparseDnMatGetValues
    !---------------------------------------------
    function hipsparseDnMatGetValues(dnMatDescr, values) &
       result(DnMatGetValues) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDnMatGetValues")
#else
       bind(C, name="hipsparseDnMatGetValues")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: dnMatDescr
       type(c_ptr) :: values
       integer(c_int) :: DnMatGetValues
    end function hipsparseDnMatGetValues

    !---------------------------------------------
    ! hipsparseConstDnMatGetValues
    !---------------------------------------------
    function hipsparseConstDnMatGetValues(dnMatDescr, values) &
       result(ConstDnMatGetValues) &
       bind(C, name="hipsparseConstDnMatGetValues")
       import :: c_ptr, c_int
       type(c_ptr), value :: dnMatDescr
       type(c_ptr) :: values
       integer(c_int) :: ConstDnMatGetValues
    end function hipsparseConstDnMatGetValues

    !---------------------------------------------
    ! hipsparseDnMatSetValues
    !---------------------------------------------
    function hipsparseDnMatSetValues(dnMatDescr, values) &
       result(DnMatSetValues) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDnMatSetValues")
#else
       bind(C, name="hipsparseDnMatSetValues")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: dnMatDescr
       type(c_ptr), value :: values
       integer(c_int) :: DnMatSetValues
    end function hipsparseDnMatSetValues

    !---------------------------------------------
    ! hipsparseDnMatGetStridedBatch
    !---------------------------------------------
    function hipsparseDnMatGetStridedBatch(dnMatDescr, batchCount, batchStride) &
       result(DnMatGetStridedBatch) &
       bind(C, name="hipsparseDnMatGetStridedBatch")
       import :: c_ptr, c_int
       type(c_ptr), value :: dnMatDescr
       integer(c_int) :: batchCount(*)
       type(c_ptr), value :: batchStride
       integer(c_int) :: DnMatGetStridedBatch
    end function hipsparseDnMatGetStridedBatch

    !---------------------------------------------
    ! hipsparseDnMatSetStridedBatch
    !---------------------------------------------
    function hipsparseDnMatSetStridedBatch(dnMatDescr, batchCount, batchStride) &
       result(DnMatSetStridedBatch) &
       bind(C, name="hipsparseDnMatSetStridedBatch")
       import :: c_ptr, c_int, c_long
       type(c_ptr), value :: dnMatDescr
       integer(c_int), value :: batchCount
       integer(c_long), value :: batchStride
       integer(c_int) :: DnMatSetStridedBatch
    end function hipsparseDnMatSetStridedBatch

    !---------------------------------------------
    ! hipsparseAxpby
    !---------------------------------------------
    function hipsparseAxpby(handle, alpha, vecX, beta, vecY) &
       result(Axpby) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseAxpby")
#else
       bind(C, name="hipsparseAxpby")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: alpha
       type(c_ptr), value :: vecX
       type(c_ptr), value :: beta
       type(c_ptr), value :: vecY
       integer(c_int) :: Axpby
    end function hipsparseAxpby

    !---------------------------------------------
    ! hipsparseDenseToSparse_bufferSize
    !---------------------------------------------
    function hipsparseDenseToSparse_bufferSize(handle, matA, matB, alg, pBufferSizeInBytes) &
       result(DenseToSparse_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDenseToSparse_bufferSize")
#else
       bind(C, name="hipsparseDenseToSparse_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: matA
       type(c_ptr), value :: matB
       integer(c_int), value :: alg
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: DenseToSparse_bufferSize
    end function hipsparseDenseToSparse_bufferSize

    !---------------------------------------------
    ! hipsparseDenseToSparse_analysis
    !---------------------------------------------
    function hipsparseDenseToSparse_analysis(handle, matA, matB, alg, externalBuffer) &
       result(DenseToSparse_analysis) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDenseToSparse_analysis")
#else
       bind(C, name="hipsparseDenseToSparse_analysis")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: matA
       type(c_ptr), value :: matB
       integer(c_int), value :: alg
       type(c_ptr), value :: externalBuffer
       integer(c_int) :: DenseToSparse_analysis
    end function hipsparseDenseToSparse_analysis

    !---------------------------------------------
    ! hipsparseDenseToSparse_convert
    !---------------------------------------------
    function hipsparseDenseToSparse_convert(handle, matA, matB, alg, externalBuffer) &
       result(DenseToSparse_convert) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseDenseToSparse_convert")
#else
       bind(C, name="hipsparseDenseToSparse_convert")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: matA
       type(c_ptr), value :: matB
       integer(c_int), value :: alg
       type(c_ptr), value :: externalBuffer
       integer(c_int) :: DenseToSparse_convert
    end function hipsparseDenseToSparse_convert

    !---------------------------------------------
    ! hipsparseGather
    !---------------------------------------------
    function hipsparseGather(handle, vecY, vecX) &
       result(Gather) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseGather")
#else
       bind(C, name="hipsparseGather")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: vecY
       type(c_ptr), value :: vecX
       integer(c_int) :: Gather
    end function hipsparseGather

    !---------------------------------------------
    ! hipsparseRot
    !---------------------------------------------
    function hipsparseRot(handle, c_coeff, s_coeff, vecX, vecY) &
       result(Rot) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseRot")
#else
       bind(C, name="hipsparseRot")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: c_coeff
       type(c_ptr), value :: s_coeff
       type(c_ptr), value :: vecX
       type(c_ptr), value :: vecY
       integer(c_int) :: Rot
    end function hipsparseRot

    !---------------------------------------------
    ! hipsparseScatter
    !---------------------------------------------
    function hipsparseScatter(handle, vecX, vecY) &
       result(Scatter) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseScatter")
#else
       bind(C, name="hipsparseScatter")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: vecX
       type(c_ptr), value :: vecY
       integer(c_int) :: Scatter
    end function hipsparseScatter

    !---------------------------------------------
    ! hipsparseSDDMM_bufferSize
    !---------------------------------------------
    function hipsparseSDDMM_bufferSize(handle, opA, opB, alpha, A, B, beta, C, computeType, alg, &
                                       pBufferSizeInBytes) &
       result(SDDMM_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSDDMM_bufferSize")
#else
       bind(C, name="hipsparseSDDMM_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: opA
       integer(c_int), value :: opB
       type(c_ptr), value :: alpha
       type(c_ptr), value :: A
       type(c_ptr), value :: B
       type(c_ptr), value :: beta
       type(c_ptr), value :: C
       integer(c_int), value :: computeType
       integer(c_int), value :: alg
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: SDDMM_bufferSize
    end function hipsparseSDDMM_bufferSize

    !---------------------------------------------
    ! hipsparseSDDMM_preprocess
    !---------------------------------------------
    function hipsparseSDDMM_preprocess(handle, opA, opB, alpha, A, B, beta, C, computeType, alg, &
                                       tempBuffer) &
       result(SDDMM_preprocess) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSDDMM_preprocess")
#else
       bind(C, name="hipsparseSDDMM_preprocess")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: opA
       integer(c_int), value :: opB
       type(c_ptr), value :: alpha
       type(c_ptr), value :: A
       type(c_ptr), value :: B
       type(c_ptr), value :: beta
       type(c_ptr), value :: C
       integer(c_int), value :: computeType
       integer(c_int), value :: alg
       type(c_ptr), value :: tempBuffer
       integer(c_int) :: SDDMM_preprocess
    end function hipsparseSDDMM_preprocess

    !---------------------------------------------
    ! hipsparseSDDMM
    !---------------------------------------------
    function hipsparseSDDMM(handle, opA, opB, alpha, A, B, beta, C, computeType, alg, tempBuffer) &
       result(SDDMM) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSDDMM")
#else
       bind(C, name="hipsparseSDDMM")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: opA
       integer(c_int), value :: opB
       type(c_ptr), value :: alpha
       type(c_ptr), value :: A
       type(c_ptr), value :: B
       type(c_ptr), value :: beta
       type(c_ptr), value :: C
       integer(c_int), value :: computeType
       integer(c_int), value :: alg
       type(c_ptr), value :: tempBuffer
       integer(c_int) :: SDDMM
    end function hipsparseSDDMM

    !---------------------------------------------
    ! hipsparseSparseToDense_bufferSize
    !---------------------------------------------
    function hipsparseSparseToDense_bufferSize(handle, matA, matB, alg, pBufferSizeInBytes) &
       result(SparseToDense_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSparseToDense_bufferSize")
#else
       bind(C, name="hipsparseSparseToDense_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: matA
       type(c_ptr), value :: matB
       integer(c_int), value :: alg
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: SparseToDense_bufferSize
    end function hipsparseSparseToDense_bufferSize

    !---------------------------------------------
    ! hipsparseSparseToDense
    !---------------------------------------------
    function hipsparseSparseToDense(handle, matA, matB, alg, externalBuffer) &
       result(SparseToDense) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSparseToDense")
#else
       bind(C, name="hipsparseSparseToDense")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       type(c_ptr), value :: matA
       type(c_ptr), value :: matB
       integer(c_int), value :: alg
       type(c_ptr), value :: externalBuffer
       integer(c_int) :: SparseToDense
    end function hipsparseSparseToDense

    !---------------------------------------------
    ! hipsparseSpGEMM_createDescr
    !---------------------------------------------
    function hipsparseSpGEMM_createDescr(descr) &
       result(SpGEMM_createDescr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpGEMM_createDescr")
#else
       bind(C, name="hipsparseSpGEMM_createDescr")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: descr
       integer(c_int) :: SpGEMM_createDescr
    end function hipsparseSpGEMM_createDescr

    !---------------------------------------------
    ! hipsparseSpGEMM_destroyDescr
    !---------------------------------------------
    function hipsparseSpGEMM_destroyDescr(descr) &
       result(SpGEMM_destroyDescr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpGEMM_destroyDescr")
#else
       bind(C, name="hipsparseSpGEMM_destroyDescr")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: descr
       integer(c_int) :: SpGEMM_destroyDescr
    end function hipsparseSpGEMM_destroyDescr

    !---------------------------------------------
    ! hipsparseSpGEMM_workEstimation
    !---------------------------------------------
    function hipsparseSpGEMM_workEstimation(handle, opA, opB, alpha, matA, matB, beta, matC, &
                                            computeType, alg, spgemmDescr, bufferSize1, &
                                            externalBuffer1) &
       result(SpGEMM_workEstimation) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpGEMM_workEstimation")
#else
       bind(C, name="hipsparseSpGEMM_workEstimation")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: opA
       integer(c_int), value :: opB
       type(c_ptr), value :: alpha
       type(c_ptr), value :: matA
       type(c_ptr), value :: matB
       type(c_ptr), value :: beta
       type(c_ptr), value :: matC
       integer(c_int), value :: computeType
       integer(c_int), value :: alg
       type(c_ptr), value :: spgemmDescr
       type(c_ptr), value :: bufferSize1
       type(c_ptr), value :: externalBuffer1
       integer(c_int) :: SpGEMM_workEstimation
    end function hipsparseSpGEMM_workEstimation

    !---------------------------------------------
    ! hipsparseSpGEMM_compute
    !---------------------------------------------
    function hipsparseSpGEMM_compute(handle, opA, opB, alpha, matA, matB, beta, matC, computeType, &
                                     alg, spgemmDescr, bufferSize2, externalBuffer2) &
       result(SpGEMM_compute) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpGEMM_compute")
#else
       bind(C, name="hipsparseSpGEMM_compute")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: opA
       integer(c_int), value :: opB
       type(c_ptr), value :: alpha
       type(c_ptr), value :: matA
       type(c_ptr), value :: matB
       type(c_ptr), value :: beta
       type(c_ptr), value :: matC
       integer(c_int), value :: computeType
       integer(c_int), value :: alg
       type(c_ptr), value :: spgemmDescr
       type(c_ptr), value :: bufferSize2
       type(c_ptr), value :: externalBuffer2
       integer(c_int) :: SpGEMM_compute
    end function hipsparseSpGEMM_compute

    !---------------------------------------------
    ! hipsparseSpGEMM_copy
    !---------------------------------------------
    function hipsparseSpGEMM_copy(handle, opA, opB, alpha, matA, matB, beta, matC, computeType, &
                                  alg, spgemmDescr) &
       result(SpGEMM_copy) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpGEMM_copy")
#else
       bind(C, name="hipsparseSpGEMM_copy")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: opA
       integer(c_int), value :: opB
       type(c_ptr), value :: alpha
       type(c_ptr), value :: matA
       type(c_ptr), value :: matB
       type(c_ptr), value :: beta
       type(c_ptr), value :: matC
       integer(c_int), value :: computeType
       integer(c_int), value :: alg
       type(c_ptr), value :: spgemmDescr
       integer(c_int) :: SpGEMM_copy
    end function hipsparseSpGEMM_copy

    !---------------------------------------------
    ! hipsparseSpGEMMreuse_workEstimation
    !---------------------------------------------
    function hipsparseSpGEMMreuse_workEstimation(handle, opA, opB, matA, matB, matC, alg, &
                                                 spgemmDescr, bufferSize1, externalBuffer1) &
       result(SpGEMMreuse_workEstimation) &
       bind(C, name="hipsparseSpGEMMreuse_workEstimation")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: opA
       integer(c_int), value :: opB
       type(c_ptr), value :: matA
       type(c_ptr), value :: matB
       type(c_ptr), value :: matC
       integer(c_int), value :: alg
       type(c_ptr), value :: spgemmDescr
       type(c_ptr), value :: bufferSize1
       type(c_ptr), value :: externalBuffer1
       integer(c_int) :: SpGEMMreuse_workEstimation
    end function hipsparseSpGEMMreuse_workEstimation

    !---------------------------------------------
    ! hipsparseSpGEMMreuse_nnz
    !---------------------------------------------
    function hipsparseSpGEMMreuse_nnz(handle, opA, opB, matA, matB, matC, alg, spgemmDescr, &
                                      bufferSize2, externalBuffer2, bufferSize3, externalBuffer3, &
                                      bufferSize4, externalBuffer4) &
       result(SpGEMMreuse_nnz) &
       bind(C, name="hipsparseSpGEMMreuse_nnz")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: opA
       integer(c_int), value :: opB
       type(c_ptr), value :: matA
       type(c_ptr), value :: matB
       type(c_ptr), value :: matC
       integer(c_int), value :: alg
       type(c_ptr), value :: spgemmDescr
       type(c_ptr), value :: bufferSize2
       type(c_ptr), value :: externalBuffer2
       type(c_ptr), value :: bufferSize3
       type(c_ptr), value :: externalBuffer3
       type(c_ptr), value :: bufferSize4
       type(c_ptr), value :: externalBuffer4
       integer(c_int) :: SpGEMMreuse_nnz
    end function hipsparseSpGEMMreuse_nnz

    !---------------------------------------------
    ! hipsparseSpGEMMreuse_copy
    !---------------------------------------------
    function hipsparseSpGEMMreuse_copy(handle, opA, opB, matA, matB, matC, alg, spgemmDescr, &
                                       bufferSize5, externalBuffer5) &
       result(SpGEMMreuse_copy) &
       bind(C, name="hipsparseSpGEMMreuse_copy")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: opA
       integer(c_int), value :: opB
       type(c_ptr), value :: matA
       type(c_ptr), value :: matB
       type(c_ptr), value :: matC
       integer(c_int), value :: alg
       type(c_ptr), value :: spgemmDescr
       type(c_ptr), value :: bufferSize5
       type(c_ptr), value :: externalBuffer5
       integer(c_int) :: SpGEMMreuse_copy
    end function hipsparseSpGEMMreuse_copy

    !---------------------------------------------
    ! hipsparseSpGEMMreuse_compute
    !---------------------------------------------
    function hipsparseSpGEMMreuse_compute(handle, opA, opB, alpha, matA, matB, beta, matC, &
                                          computeType, alg, spgemmDescr) &
       result(SpGEMMreuse_compute) &
       bind(C, name="hipsparseSpGEMMreuse_compute")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: opA
       integer(c_int), value :: opB
       type(c_ptr), value :: alpha
       type(c_ptr), value :: matA
       type(c_ptr), value :: matB
       type(c_ptr), value :: beta
       type(c_ptr), value :: matC
       integer(c_int), value :: computeType
       integer(c_int), value :: alg
       type(c_ptr), value :: spgemmDescr
       integer(c_int) :: SpGEMMreuse_compute
    end function hipsparseSpGEMMreuse_compute

    !---------------------------------------------
    ! hipsparseSpMM_bufferSize
    !---------------------------------------------
    function hipsparseSpMM_bufferSize(handle, opA, opB, alpha, matA, matB, beta, matC, &
                                      computeType, alg, pBufferSizeInBytes) &
       result(SpMM_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpMM_bufferSize")
#else
       bind(C, name="hipsparseSpMM_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: opA
       integer(c_int), value :: opB
       type(c_ptr), value :: alpha
       type(c_ptr), value :: matA
       type(c_ptr), value :: matB
       type(c_ptr), value :: beta
       type(c_ptr), value :: matC
       integer(c_int), value :: computeType
       integer(c_int), value :: alg
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: SpMM_bufferSize
    end function hipsparseSpMM_bufferSize

    !---------------------------------------------
    ! hipsparseSpMM_preprocess
    !---------------------------------------------
    function hipsparseSpMM_preprocess(handle, opA, opB, alpha, matA, matB, beta, matC, &
                                      computeType, alg, externalBuffer) &
       result(SpMM_preprocess) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpMM_preprocess")
#else
       bind(C, name="hipsparseSpMM_preprocess")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: opA
       integer(c_int), value :: opB
       type(c_ptr), value :: alpha
       type(c_ptr), value :: matA
       type(c_ptr), value :: matB
       type(c_ptr), value :: beta
       type(c_ptr), value :: matC
       integer(c_int), value :: computeType
       integer(c_int), value :: alg
       type(c_ptr), value :: externalBuffer
       integer(c_int) :: SpMM_preprocess
    end function hipsparseSpMM_preprocess

    !---------------------------------------------
    ! hipsparseSpMM
    !---------------------------------------------
    function hipsparseSpMM(handle, opA, opB, alpha, matA, matB, beta, matC, computeType, alg, &
                           externalBuffer) &
       result(SpMM) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpMM")
#else
       bind(C, name="hipsparseSpMM")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: opA
       integer(c_int), value :: opB
       type(c_ptr), value :: alpha
       type(c_ptr), value :: matA
       type(c_ptr), value :: matB
       type(c_ptr), value :: beta
       type(c_ptr), value :: matC
       integer(c_int), value :: computeType
       integer(c_int), value :: alg
       type(c_ptr), value :: externalBuffer
       integer(c_int) :: SpMM
    end function hipsparseSpMM

    !---------------------------------------------
    ! hipsparseSpMV_bufferSize
    !---------------------------------------------
    function hipsparseSpMV_bufferSize(handle, opA, alpha, matA, vecX, beta, vecY, computeType, &
                                      alg, pBufferSizeInBytes) &
       result(SpMV_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpMV_bufferSize")
#else
       bind(C, name="hipsparseSpMV_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: opA
       type(c_ptr), value :: alpha
       type(c_ptr), value :: matA
       type(c_ptr), value :: vecX
       type(c_ptr), value :: beta
       type(c_ptr), value :: vecY
       integer(c_int), value :: computeType
       integer(c_int), value :: alg
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: SpMV_bufferSize
    end function hipsparseSpMV_bufferSize

    !---------------------------------------------
    ! hipsparseSpMV_preprocess
    !---------------------------------------------
    function hipsparseSpMV_preprocess(handle, opA, alpha, matA, vecX, beta, vecY, computeType, &
                                      alg, externalBuffer) &
       result(SpMV_preprocess) &
       bind(C, name="hipsparseSpMV_preprocess")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: opA
       type(c_ptr), value :: alpha
       type(c_ptr), value :: matA
       type(c_ptr), value :: vecX
       type(c_ptr), value :: beta
       type(c_ptr), value :: vecY
       integer(c_int), value :: computeType
       integer(c_int), value :: alg
       type(c_ptr), value :: externalBuffer
       integer(c_int) :: SpMV_preprocess
    end function hipsparseSpMV_preprocess

    !---------------------------------------------
    ! hipsparseSpMV
    !---------------------------------------------
    function hipsparseSpMV(handle, opA, alpha, matA, vecX, beta, vecY, computeType, alg, &
                           externalBuffer) &
       result(SpMV) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpMV")
#else
       bind(C, name="hipsparseSpMV")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: opA
       type(c_ptr), value :: alpha
       type(c_ptr), value :: matA
       type(c_ptr), value :: vecX
       type(c_ptr), value :: beta
       type(c_ptr), value :: vecY
       integer(c_int), value :: computeType
       integer(c_int), value :: alg
       type(c_ptr), value :: externalBuffer
       integer(c_int) :: SpMV
    end function hipsparseSpMV

    !---------------------------------------------
    ! hipsparseSpSM_createDescr
    !---------------------------------------------
    function hipsparseSpSM_createDescr(descr) &
       result(SpSM_createDescr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpSM_createDescr")
#else
       bind(C, name="hipsparseSpSM_createDescr")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: descr
       integer(c_int) :: SpSM_createDescr
    end function hipsparseSpSM_createDescr

    !---------------------------------------------
    ! hipsparseSpSM_destroyDescr
    !---------------------------------------------
    function hipsparseSpSM_destroyDescr(descr) &
       result(SpSM_destroyDescr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpSM_destroyDescr")
#else
       bind(C, name="hipsparseSpSM_destroyDescr")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: descr
       integer(c_int) :: SpSM_destroyDescr
    end function hipsparseSpSM_destroyDescr

    !---------------------------------------------
    ! hipsparseSpSM_bufferSize
    !---------------------------------------------
    function hipsparseSpSM_bufferSize(handle, opA, opB, alpha, matA, matB, matC, computeType, alg, &
                                      spsmDescr, pBufferSizeInBytes) &
       result(SpSM_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpSM_bufferSize")
#else
       bind(C, name="hipsparseSpSM_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: opA
       integer(c_int), value :: opB
       type(c_ptr), value :: alpha
       type(c_ptr), value :: matA
       type(c_ptr), value :: matB
       type(c_ptr), value :: matC
       integer(c_int), value :: computeType
       integer(c_int), value :: alg
       type(c_ptr), value :: spsmDescr
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: SpSM_bufferSize
    end function hipsparseSpSM_bufferSize

    !---------------------------------------------
    ! hipsparseSpSM_analysis
    !---------------------------------------------
    function hipsparseSpSM_analysis(handle, opA, opB, alpha, matA, matB, matC, computeType, alg, &
                                    spsmDescr, externalBuffer) &
       result(SpSM_analysis) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpSM_analysis")
#else
       bind(C, name="hipsparseSpSM_analysis")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: opA
       integer(c_int), value :: opB
       type(c_ptr), value :: alpha
       type(c_ptr), value :: matA
       type(c_ptr), value :: matB
       type(c_ptr), value :: matC
       integer(c_int), value :: computeType
       integer(c_int), value :: alg
       type(c_ptr), value :: spsmDescr
       type(c_ptr), value :: externalBuffer
       integer(c_int) :: SpSM_analysis
    end function hipsparseSpSM_analysis

    !---------------------------------------------
    ! hipsparseSpSM_solve
    !---------------------------------------------
    function hipsparseSpSM_solve(handle, opA, opB, alpha, matA, matB, matC, computeType, alg, &
                                 spsmDescr, externalBuffer) &
       result(SpSM_solve) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpSM_solve")
#else
       bind(C, name="hipsparseSpSM_solve")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: opA
       integer(c_int), value :: opB
       type(c_ptr), value :: alpha
       type(c_ptr), value :: matA
       type(c_ptr), value :: matB
       type(c_ptr), value :: matC
       integer(c_int), value :: computeType
       integer(c_int), value :: alg
       type(c_ptr), value :: spsmDescr
       type(c_ptr), value :: externalBuffer
       integer(c_int) :: SpSM_solve
    end function hipsparseSpSM_solve

    !---------------------------------------------
    ! hipsparseSpSM_solve_ex
    !---------------------------------------------
    function hipsparseSpSM_solve_ex(handle, opA, opB, alpha, matA, matB, matC, computeType, alg, &
                                    spsmDescr) &
       result(SpSM_solve_ex) &
       bind(C, name="hipsparseSpSM_solve_ex")
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: opA
       integer(c_int), value :: opB
       type(c_ptr), value :: alpha
       type(c_ptr), value :: matA
       type(c_ptr), value :: matB
       type(c_ptr), value :: matC
       integer(c_int), value :: computeType
       integer(c_int), value :: alg
       type(c_ptr), value :: spsmDescr
       integer(c_int) :: SpSM_solve_ex
    end function hipsparseSpSM_solve_ex

    !---------------------------------------------
    ! hipsparseSpSV_createDescr
    !---------------------------------------------
    function hipsparseSpSV_createDescr(descr) &
       result(SpSV_createDescr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpSV_createDescr")
#else
       bind(C, name="hipsparseSpSV_createDescr")
#endif
       import :: c_ptr, c_int
       type(c_ptr) :: descr
       integer(c_int) :: SpSV_createDescr
    end function hipsparseSpSV_createDescr

    !---------------------------------------------
    ! hipsparseSpSV_destroyDescr
    !---------------------------------------------
    function hipsparseSpSV_destroyDescr(descr) &
       result(SpSV_destroyDescr) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpSV_destroyDescr")
#else
       bind(C, name="hipsparseSpSV_destroyDescr")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: descr
       integer(c_int) :: SpSV_destroyDescr
    end function hipsparseSpSV_destroyDescr

    !---------------------------------------------
    ! hipsparseSpSV_bufferSize
    !---------------------------------------------
    function hipsparseSpSV_bufferSize(handle, opA, alpha, matA, x, y, computeType, alg, spsvDescr, &
                                      pBufferSizeInBytes) &
       result(SpSV_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpSV_bufferSize")
#else
       bind(C, name="hipsparseSpSV_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: opA
       type(c_ptr), value :: alpha
       type(c_ptr), value :: matA
       type(c_ptr), value :: x
       type(c_ptr), value :: y
       integer(c_int), value :: computeType
       integer(c_int), value :: alg
       type(c_ptr), value :: spsvDescr
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: SpSV_bufferSize
    end function hipsparseSpSV_bufferSize

    !---------------------------------------------
    ! hipsparseSpSV_analysis
    !---------------------------------------------
    function hipsparseSpSV_analysis(handle, opA, alpha, matA, x, y, computeType, alg, spsvDescr, &
                                    externalBuffer) &
       result(SpSV_analysis) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpSV_analysis")
#else
       bind(C, name="hipsparseSpSV_analysis")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: opA
       type(c_ptr), value :: alpha
       type(c_ptr), value :: matA
       type(c_ptr), value :: x
       type(c_ptr), value :: y
       integer(c_int), value :: computeType
       integer(c_int), value :: alg
       type(c_ptr), value :: spsvDescr
       type(c_ptr), value :: externalBuffer
       integer(c_int) :: SpSV_analysis
    end function hipsparseSpSV_analysis

    !---------------------------------------------
    ! hipsparseSpSV_solve
    !---------------------------------------------
    function hipsparseSpSV_solve(handle, opA, alpha, matA, x, y, computeType, alg, spsvDescr) &
       result(SpSV_solve) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpSV_solve")
#else
       bind(C, name="hipsparseSpSV_solve")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: opA
       type(c_ptr), value :: alpha
       type(c_ptr), value :: matA
       type(c_ptr), value :: x
       type(c_ptr), value :: y
       integer(c_int), value :: computeType
       integer(c_int), value :: alg
       type(c_ptr), value :: spsvDescr
       integer(c_int) :: SpSV_solve
    end function hipsparseSpSV_solve

    !---------------------------------------------
    ! hipsparseSpVV_bufferSize
    !---------------------------------------------
    function hipsparseSpVV_bufferSize(handle, opX, vecX, vecY, result, computeType, &
                                      pBufferSizeInBytes) &
       result(SpVV_bufferSize) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpVV_bufferSize")
#else
       bind(C, name="hipsparseSpVV_bufferSize")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: opX
       type(c_ptr), value :: vecX
       type(c_ptr), value :: vecY
       type(c_ptr), value :: result
       integer(c_int), value :: computeType
       type(c_ptr), value :: pBufferSizeInBytes
       integer(c_int) :: SpVV_bufferSize
    end function hipsparseSpVV_bufferSize

    !---------------------------------------------
    ! hipsparseSpVV
    !---------------------------------------------
    function hipsparseSpVV(handle, opX, vecX, vecY, result, computeType, externalBuffer) &
       result(SpVV) &
#ifdef USE_CUDA_NAMES
       bind(C, name="cusparseSpVV")
#else
       bind(C, name="hipsparseSpVV")
#endif
       import :: c_ptr, c_int
       type(c_ptr), value :: handle
       integer(c_int), value :: opX
       type(c_ptr), value :: vecX
       type(c_ptr), value :: vecY
       type(c_ptr), value :: result
       integer(c_int), value :: computeType
       type(c_ptr), value :: externalBuffer
       integer(c_int) :: SpVV
    end function hipsparseSpVV

  end interface
end module hipfort_hipsparse
