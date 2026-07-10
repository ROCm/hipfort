! Auto-generated unified error-check helper (hipCheck, rocblasCheck, …)
! DO NOT EDIT — re-run the generator to update.

module hipfort_check
  implicit none
contains
  subroutine hipCheck(status)
#ifdef USE_CUDA_NAMES
    use hipfort_cuda_errors, only: cudaSuccess
    implicit none
    integer(kind(cudaSuccess)) :: status
    if (status /= cudaSuccess) then
#else
    use hipfort_enums, only: HIP_SUCCESS
    implicit none
    integer(kind(HIP_SUCCESS)) :: status
    if (status /= HIP_SUCCESS) then
#endif
      write (*, *) "HIP ERROR: code = ", status
      stop 1
    end if
  end subroutine hipCheck
  subroutine hipblasCheck(status)
    use hipfort_hipblas_enums, only: HIPBLAS_STATUS_SUCCESS
    implicit none
    integer(kind(HIPBLAS_STATUS_SUCCESS)) :: status
    if (status /= HIPBLAS_STATUS_SUCCESS) then
      write (*, *) "HIPBLAS ERROR: code = ", status
      stop 1
    end if
  end subroutine hipblasCheck
  subroutine hipfftCheck(status)
    use hipfort_hipfft_enums, only: HIPFFT_SUCCESS
    implicit none
    integer(kind(HIPFFT_SUCCESS)) :: status
    if (status /= HIPFFT_SUCCESS) then
      write (*, *) "HIPFFT ERROR: code = ", status
      stop 1
    end if
  end subroutine hipfftCheck
  subroutine hiprandCheck(status)
    use hipfort_hiprand_enums, only: HIPRAND_STATUS_SUCCESS
    implicit none
    integer(kind(HIPRAND_STATUS_SUCCESS)) :: status
    if (status /= HIPRAND_STATUS_SUCCESS) then
      write (*, *) "HIPRAND ERROR: code = ", status
      stop 1
    end if
  end subroutine hiprandCheck
  subroutine hipsolverCheck(status)
    use hipfort_hipsolver_enums, only: HIPSOLVER_STATUS_SUCCESS
    implicit none
    integer(kind(HIPSOLVER_STATUS_SUCCESS)) :: status
    if (status /= HIPSOLVER_STATUS_SUCCESS) then
      write (*, *) "HIPSOLVER ERROR: code = ", status
      stop 1
    end if
  end subroutine hipsolverCheck
  subroutine hipsparseCheck(status)
    use hipfort_hipsparse_enums, only: HIPSPARSE_STATUS_SUCCESS
    implicit none
    integer(kind(HIPSPARSE_STATUS_SUCCESS)) :: status
    if (status /= HIPSPARSE_STATUS_SUCCESS) then
      write (*, *) "HIPSPARSE ERROR: code = ", status
      stop 1
    end if
  end subroutine hipsparseCheck
  subroutine rocblasCheck(status)
    use hipfort_rocblas_enums, only: rocblas_status_success
    implicit none
    integer(kind(rocblas_status_success)) :: status
    if (status /= rocblas_status_success) then
      write (*, *) "ROCBLAS ERROR: code = ", status
      stop 1
    end if
  end subroutine rocblasCheck
  subroutine rocfftCheck(status)
    use hipfort_rocfft_enums, only: rocfft_status_success
    implicit none
    integer(kind(rocfft_status_success)) :: status
    if (status /= rocfft_status_success) then
      write (*, *) "ROCFFT ERROR: code = ", status
      stop 1
    end if
  end subroutine rocfftCheck
  subroutine rocrandCheck(status)
    use hipfort_rocrand_enums, only: ROCRAND_STATUS_SUCCESS
    implicit none
    integer(kind(ROCRAND_STATUS_SUCCESS)) :: status
    if (status /= ROCRAND_STATUS_SUCCESS) then
      write (*, *) "ROCRAND ERROR: code = ", status
      stop 1
    end if
  end subroutine rocrandCheck
  subroutine rocsolverCheck(status)
    use hipfort_rocsolver_enums, only: rocblas_status_success
    implicit none
    integer(kind(rocblas_status_success)) :: status
    if (status /= rocblas_status_success) then
      write (*, *) "ROCSOLVER ERROR: code = ", status
      stop 1
    end if
  end subroutine rocsolverCheck
  subroutine rocsparseCheck(status)
    use hipfort_rocsparse_enums, only: rocsparse_status_success
    implicit none
    integer(kind(rocsparse_status_success)) :: status
    if (status /= rocsparse_status_success) then
      write (*, *) "ROCSPARSE ERROR: code = ", status
      stop 1
    end if
  end subroutine rocsparseCheck
end module hipfort_check
