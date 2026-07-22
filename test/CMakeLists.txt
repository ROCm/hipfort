#
# File: test/CMakeLists.txt

# These tests are all Makefile based tests.
# Each test is contained in its own subdirectory of this test directory
# The Makefile must create a binary with the same name as the directory name.

cmake_minimum_required(VERSION 3.18..4.0 FATAL_ERROR)
if ("${CMAKE_SOURCE_DIR}" STREQUAL "${CMAKE_CURRENT_SOURCE_DIR}")
  project(test-hipfort)
endif()

# make-based test infrastructure

set(CMAKE_BUILD_PARALLEL_LEVEL "4" CACHE STRING "Number of build jobs")

add_custom_target(all-f2003-tests
	COMMAND make -C ${CMAKE_CURRENT_SOURCE_DIR} -j${CMAKE_BUILD_PARALLEL_LEVEL} PREFIX=f2003 build)
add_custom_target(all-f2003-tests-run
	COMMAND make -C ${CMAKE_CURRENT_SOURCE_DIR} -j1 PREFIX=f2003 run
	DEPENDS all-f2003-tests)
add_custom_target(all-f2003-tests-clean
	COMMAND make -C ${CMAKE_CURRENT_SOURCE_DIR} -j${CMAKE_BUILD_PARALLEL_LEVEL} PREFIX=f2003 clean)

add_custom_target(all-f2008-tests
	COMMAND make -C ${CMAKE_CURRENT_SOURCE_DIR} -j${CMAKE_BUILD_PARALLEL_LEVEL} PREFIX=f2008 build)
add_custom_target(all-f2008-tests-run
	COMMAND make -C ${CMAKE_CURRENT_SOURCE_DIR} -j1 PREFIX=f2008 run
	DEPENDS all-f2008-tests)
add_custom_target(all-f2008-tests-clean
	COMMAND make -C ${CMAKE_CURRENT_SOURCE_DIR} -j${CMAKE_BUILD_PARALLEL_LEVEL} PREFIX=f2008 clean)

add_custom_target(all-tests
	COMMAND make -C ${CMAKE_CURRENT_SOURCE_DIR} -j${CMAKE_BUILD_PARALLEL_LEVEL} build_all)
add_custom_target(all-tests-run
	COMMAND make -C ${CMAKE_CURRENT_SOURCE_DIR} -j1 run_all
	DEPENDS all-tests)
add_custom_target(all-tests-clean
	COMMAND make -C ${CMAKE_CURRENT_SOURCE_DIR} -j${CMAKE_BUILD_PARALLEL_LEVEL} clean_all)


# cmake-based test infrastructure

if(BUILD_TESTING)
  function(hipfort_add_test lib func dir)
    # Build absolute source path and fail early if checkout is incomplete.
    set(src "${CMAKE_CURRENT_SOURCE_DIR}/${dir}/${lib}/${func}.f03")
    if(NOT EXISTS "${src}")
      message(FATAL_ERROR "Missing test source: ${src}")
    endif()

    # Force language detection for .f03 in toolchains where CMake misses it.
    set_source_files_properties("${src}" PROPERTIES LANGUAGE Fortran)
    add_executable(hipfort_test_${dir}_${lib}_${func} "${src}")
    set_target_properties(hipfort_test_${dir}_${lib}_${func}
      PROPERTIES LINKER_LANGUAGE Fortran)
    target_link_libraries(hipfort_test_${dir}_${lib}_${func} PRIVATE hipfort::${lib} hipfort::hip)

    # the tests call EXIT, which is a GNU extension in gfortran
    target_compile_options(hipfort_test_${dir}_${lib}_${func} PRIVATE $<$<COMPILE_LANG_AND_ID:Fortran,GNU>:-std=gnu>)
    
    add_test(
      NAME hipfort_test_${dir}_${lib}_${func}
      COMMAND hipfort_test_${dir}_${lib}_${func}
    )
  endfunction()

  if(TARGET hipfort::hipblas)
    hipfort_add_test(hipblas cgemm f2003)
    hipfort_add_test(hipblas dgemm f2003)
    hipfort_add_test(hipblas dger f2003)
    hipfort_add_test(hipblas dscal f2003)
    hipfort_add_test(hipblas saxpy f2003)
    hipfort_add_test(hipblas scopy f2003)
    hipfort_add_test(hipblas sgemv f2003)
    hipfort_add_test(hipblas sger f2003)
    hipfort_add_test(hipblas sswap f2003)

    hipfort_add_test(hipblas cgemm f2008)
    hipfort_add_test(hipblas dgemm f2008)
    hipfort_add_test(hipblas dger f2008)
    hipfort_add_test(hipblas dscal f2008)
    hipfort_add_test(hipblas saxpy f2008)
    hipfort_add_test(hipblas scopy f2008)
    hipfort_add_test(hipblas sgemv f2008)
    hipfort_add_test(hipblas sger f2008)
    hipfort_add_test(hipblas sswap f2008)
  endif()

  if(TARGET hipfort::hipfft)
    hipfort_add_test(hipfft hipfft f2003)
    hipfort_add_test(hipfft hipfft f2008)
  endif()

  if(TARGET hipfort::hipsolver)
    hipfort_add_test(hipsolver hipsolverdgetrf f2008)
  endif()

  if(TARGET hipfort::rocblas)
    hipfort_add_test(rocblas saxpy f2003)
    hipfort_add_test(rocblas daxpy f2003)
    hipfort_add_test(rocblas caxpy f2003)
    hipfort_add_test(rocblas zaxpy f2003)
    hipfort_add_test(rocblas dtrmm f2003)
    hipfort_add_test(rocblas saxpy f2008)
    hipfort_add_test(rocblas daxpy f2008)
    hipfort_add_test(rocblas caxpy f2008)
    hipfort_add_test(rocblas zaxpy f2008)
    hipfort_add_test(rocblas dtrmm f2008)
    hipfort_add_test(rocblas sgemm f2003)
    hipfort_add_test(rocblas dgemm f2003)
    hipfort_add_test(rocblas cgemm f2003)
    hipfort_add_test(rocblas zgemm f2003)
    hipfort_add_test(rocblas sgemm f2008)
    hipfort_add_test(rocblas dgemm f2008)
    hipfort_add_test(rocblas cgemm f2008)
    hipfort_add_test(rocblas zgemm f2008)
    hipfort_add_test(rocblas sgemm_batched f2003)
    hipfort_add_test(rocblas dgemm_batched f2003)
    hipfort_add_test(rocblas cgemm_batched f2003)
    hipfort_add_test(rocblas zgemm_batched f2003)
    hipfort_add_test(rocblas sgemm_strided_batched f2003)
    hipfort_add_test(rocblas dgemm_strided_batched f2003)
    hipfort_add_test(rocblas cgemm_strided_batched f2003)
    hipfort_add_test(rocblas zgemm_strided_batched f2003)
    hipfort_add_test(rocblas sgemm_batched f2008)
    hipfort_add_test(rocblas dgemm_batched f2008)
    hipfort_add_test(rocblas cgemm_batched f2008)
    hipfort_add_test(rocblas zgemm_batched f2008)
    hipfort_add_test(rocblas sgemm_strided_batched f2008)
    hipfort_add_test(rocblas dgemm_strided_batched f2008)
    hipfort_add_test(rocblas cgemm_strided_batched f2008)
    hipfort_add_test(rocblas zgemm_strided_batched f2008)
    hipfort_add_test(rocblas sgemv f2003)
    hipfort_add_test(rocblas dgemv f2003)
    hipfort_add_test(rocblas cgemv f2003)
    hipfort_add_test(rocblas zgemv f2003)
    hipfort_add_test(rocblas sgemv f2008)
    hipfort_add_test(rocblas dgemv f2008)
    hipfort_add_test(rocblas cgemv f2008)
    hipfort_add_test(rocblas zgemv f2008)
    hipfort_add_test(rocblas strsv f2003)
    hipfort_add_test(rocblas dtrsv f2003)
    hipfort_add_test(rocblas ctrsv f2003)
    hipfort_add_test(rocblas ztrsv f2003)
    hipfort_add_test(rocblas strsv f2008)
    hipfort_add_test(rocblas dtrsv f2008)
    hipfort_add_test(rocblas ctrsv f2008)
    hipfort_add_test(rocblas ztrsv f2008)
    hipfort_add_test(rocblas strsm f2003)
    hipfort_add_test(rocblas dtrsm f2003)
    hipfort_add_test(rocblas ctrsm f2003)
    hipfort_add_test(rocblas ztrsm f2003)
    hipfort_add_test(rocblas strsm f2008)
    hipfort_add_test(rocblas dtrsm f2008)
    hipfort_add_test(rocblas ctrsm f2008)
    hipfort_add_test(rocblas ztrsm f2008)
  endif()

  if(TARGET hipfort::rocfft)
    hipfort_add_test(rocfft rocfft f2003)
    hipfort_add_test(rocfft rocfft f2008)
  endif()

  if(TARGET hipfort::rocsolver)
    hipfort_add_test(rocsolver rocsolver_dgeqrf f2003)
    hipfort_add_test(rocsolver rocsolver_dgeqrf f2008)
    hipfort_add_test(rocsolver rocsolver_dsterf f2003)
    hipfort_add_test(rocsolver rocsolver_dsterf f2008)
    hipfort_add_test(rocsolver rocsolver_dgetrf_strided_batched f2003)
    hipfort_add_test(rocsolver rocsolver_dgetrf_strided_batched f2008)
    hipfort_add_test(rocsolver rocsolver_sgeqrf f2008)
    hipfort_add_test(rocsolver rocsolver_cgeqrf f2008)
    hipfort_add_test(rocsolver rocsolver_zgeqrf f2008)
    hipfort_add_test(rocsolver rocsolver_sgetrf f2008)
    hipfort_add_test(rocsolver rocsolver_dgetrf f2008)
    hipfort_add_test(rocsolver rocsolver_cgetrf f2008)
    hipfort_add_test(rocsolver rocsolver_zgetrf f2008)
    hipfort_add_test(rocsolver rocsolver_spotrf f2008)
    hipfort_add_test(rocsolver rocsolver_dpotrf f2008)
    hipfort_add_test(rocsolver rocsolver_cpotrf f2008)
    hipfort_add_test(rocsolver rocsolver_zpotrf f2008)
    hipfort_add_test(rocsolver rocsolver_sgetrs f2008)
    hipfort_add_test(rocsolver rocsolver_dgetrs f2008)
    hipfort_add_test(rocsolver rocsolver_cgetrs f2008)
    hipfort_add_test(rocsolver rocsolver_zgetrs f2008)
    hipfort_add_test(rocsolver rocsolver_spotrs f2008)
    hipfort_add_test(rocsolver rocsolver_dpotrs f2008)
    hipfort_add_test(rocsolver rocsolver_cpotrs f2008)
    hipfort_add_test(rocsolver rocsolver_zpotrs f2008)
    hipfort_add_test(rocsolver rocsolver_sgesvd f2008)
    hipfort_add_test(rocsolver rocsolver_dgesvd f2008)
    hipfort_add_test(rocsolver rocsolver_cgesvd f2008)
    hipfort_add_test(rocsolver rocsolver_zgesvd f2008)
    hipfort_add_test(rocsolver rocsolver_ssyevd f2008)
    hipfort_add_test(rocsolver rocsolver_dsyevd f2008)
    hipfort_add_test(rocsolver rocsolver_cheevd f2008)
    hipfort_add_test(rocsolver rocsolver_zheevd f2008)
  endif()

  if(TARGET hipfort::rocsparse)
    hipfort_add_test(rocsparse ddoti f2003)
    hipfort_add_test(rocsparse ddoti f2008)
  endif()

  if(TARGET hipfort::roctx)
    include(CheckLanguage)
    check_language(HIP)
    if(CMAKE_HIP_COMPILER)
      enable_language(HIP)
      hipfort_add_test(roctx main f2003)
      target_sources(hipfort_test_f2003_roctx_main PRIVATE f2003/roctx/hip_implementation.cpp)
      set_source_files_properties(f2003/roctx/hip_implementation.cpp
        PROPERTIES
          LANGUAGE HIP
      )
      set_target_properties(hipfort_test_f2003_roctx_main
        PROPERTIES
          LINKER_LANGUAGE Fortran
          POSITION_INDEPENDENT_CODE ON
      )
    endif()
  endif()
endif()
