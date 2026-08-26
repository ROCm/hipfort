# HIPFORT using OpenMP offload with amdflang to AMD GPUs

cmake_minimum_required(VERSION 3.25)
project(hipfort_openmp LANGUAGES Fortran C CXX)

##### Compiler ##############
# This file is intended to be used with amdflang
set(CMAKE_Fortran_COMPILER "amdflang" CACHE FILEPATH "Fortran compiler (set full path to amdflang if needed)")

if(NOT CMAKE_Fortran_COMPILER_ID MATCHES "LLVMFlang")
    message(FATAL_ERROR "This project is intended to be used with amdflang or equivalent")
endif()

set(CMAKE_Fortran_FLAGS "-O3 -g -cpp -fno-fast-math")

######## OpenMP offload ##########

# GPU target (amdgcn arch), default to a recent AMD GPU arch; user may override
set(GPU_ARCH "None" CACHE STRING "AMD GPU architecture for OpenMP/HIP offload (e.g. gfx906,gfx90a)")

if (GPU_ARCH MATCHES "None")
    message(FATAL_ERROR "Please provide the GPU_ARCH (e.g. gfx906,gfx90a)")
endif()

# Unified shared memory
option(USM "Turn on if your GPU and CPU share physical memory" OFF)

# Find OpenMP
find_package(OpenMP REQUIRED)
# Create a Fortran source file for testing OpenMP offload capabilities
file(WRITE ${CMAKE_BINARY_DIR}/config_tests/test_omp_offload.f90 "
program main

    use iso_fortran_env,         only: i32 => int32, r64 => real64
    use iso_c_binding
    use omp_lib

    implicit none

    integer(i32), parameter   :: n = 4000_i32
    complex(r64), parameter   :: zzero = cmplx(0.0, 0.0, kind=r64)
    complex(r64), parameter   :: zone  = cmplx(1.0, 0.0, kind=r64)

    complex(r64), pointer, contiguous :: A(:,:)
    type(c_ptr) :: A_cptr

    complex(r64), allocatable :: B(:,:)
    complex(r64), allocatable :: C(:,:)
    integer(i32)              :: i, j
    real(r64)                :: start, finish

    call cpu_time(start)

    ! Imagine B is given by an external routine in the CPU
    allocate(B(n,n), source=cmplx(42.0, 42.0, kind=r64))
    !$omp target enter data map(to: B)

    allocate(C(n,n))
    !$omp target enter data map(alloc: C)

    A_cptr = omp_target_alloc(2 * c_sizeof(1.0_c_double) * n * n, omp_get_default_device())
    call c_f_pointer(A_cptr, A, int([n,n],kind=c_size_t))
    A(0:n-1,0:n-1) => A(:,:)

    !$omp target has_device_addr(A)
    !$omp teams distribute parallel do simd private(i, j) collapse(2)
    do i = 0, n-1
        do j = 0, n-1
            A(j,i) = fillA(i,j) + 1.0
            C(j,i) = A(j,i) + B(j,i)
        end do
    end do
    !$omp end teams distribute parallel do simd
    !$omp end target

    nullify(A)
    call omp_target_free(A_cptr, omp_get_default_device())
    !$omp target update from(C)
    !$omp target exit data map(delete: C)
    !$omp target exit data map(delete: B)

    call cpu_time(finish)

    write(*,*) A(1,1)
    print '(\"Time = \", f16.3, \" seconds.\")', finish - start

contains

    pure complex(r64) function fillA(i,j)

        integer(i32), intent(in) :: i, j
        !$omp declare target(fillA)

        fillA = cmplx(0, 0, r64)

    end function fillA

end program main")

# Create a log file for the config test
set(OMPOFFLOAD_CONFIG_TEST_LOG "${CMAKE_BINARY_DIR}/config_tests/ompoffload_test_log.txt")
file(WRITE "${OMPOFFLOAD_CONFIG_TEST_LOG}" "Compilation Log:\n")
set(OMPOFFLOAD_CONFIG_TEST_LOG_STR "")

# Try to compile and run the Fortran test program during configuration.
execute_process(
        COMMAND ${CMAKE_Fortran_COMPILER} ${OpenMP_Fortran_FLAGS} -o test_omp_offload test_omp_offload.f90
        WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/config_tests
        RESULT_VARIABLE OMPOFFLOAD_TEST_COMPILE_RESULT
        OUTPUT_VARIABLE OMPOFFLOAD_CONFIG_TEST_LOG_STR
        ERROR_VARIABLE  OMPOFFLOAD_CONFIG_TEST_LOG_STR
)

# Append the compilation log to the log file
file(APPEND "${OMPOFFLOAD_CONFIG_TEST_LOG}" "${OMPOFFLOAD_CONFIG_TEST_LOG_STR}\n")

# Check the compilation result and display a status message
if (OMPOFFLOAD_TEST_COMPILE_RESULT)
    message(STATUS "OMP OFFLOAD: Supported")
else()
    message(STATUS "OMP OFFLOAD: Unsupported")
endif()

if (USM)
    set(USM_FLAGS "-fopenmp-force-usm")
    add_compile_definitions(_USM_)
endif()

set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} ${OpenMP_Fortran_FLAGS} -fopenmp-version=51 --offload-arch=${GPU_ARCH} -fopenmp-offload-mandatory ${USM_FLAGS}")

################# ROCm libraries ########################
# Find rocFFT
find_package(rocfft REQUIRED)
set(rocfftlib ${ROCFFT_LIBRARIES})
message(STATUS "rocFFT found : ${rocfftlib}")

# Find rocBLAS
find_package(rocblas REQUIRED)
set(rocblaslib ${ROCBLAS_LIBRARIES})
message(STATUS "rocblas found : ${rocblaslib}")

# Find rocSOLVER
find_package(rocsolver REQUIRED)
set(rocsolverlib ${ROCSOLVER_LIBRARIES})
message(STATUS "rocSOLVER found: ${rocsolverlib}")

# Find rocRAND
find_package(rocrand REQUIRED)
message(STATUS "rocRAND found")

# Find rocSPARSE
find_package(rocsparse REQUIRED)
message(STATUS "rocSPARSE found")

# Find hipBLAS
find_package(hipblas REQUIRED)
message(STATUS "hipBLAS found")

message(STATUS "ROCM include directory: ${ROCFFT_INCLUDE_DIRS}")
file(READ ${ROCFFT_INCLUDE_DIRS}/rocm-core/rocm_version.h FILE_CONTENT)

# Use regular expressions to extract version numbers
string(REGEX MATCH "#define ROCM_VERSION_MAJOR[ \t]+([0-9]+)" _major_match "${FILE_CONTENT}")
string(REGEX MATCH "#define ROCM_VERSION_MINOR[ \t]+([0-9]+)" _minor_match "${FILE_CONTENT}")
string(REGEX MATCH "#define ROCM_VERSION_PATCH[ \t]+([0-9]+)" _patch_match "${FILE_CONTENT}")

# If not found, default to 0
if(_major_match)
    string(REGEX REPLACE "#define ROCM_VERSION_MAJOR[ \t]+([0-9]+)" "\\1" ROCM_VERSION_MAJOR "${_major_match}")
else()
    set(ROCM_VERSION_MAJOR 0)
endif()

if(_minor_match)
    string(REGEX REPLACE "#define ROCM_VERSION_MINOR[ \t]+([0-9]+)" "\\1" ROCM_VERSION_MINOR "${_minor_match}")
else()
    set(ROCM_VERSION_MINOR 0)
endif()

if(_patch_match)
    string(REGEX REPLACE "#define ROCM_VERSION_PATCH[ \t]+([0-9]+)" "\\1" ROCM_VERSION_PATCH "${_patch_match}")
else()
    set(ROCM_VERSION_PATCH 0)
endif()

if ((ROCM_VERSION_MAJOR EQUAL 0) AND (ROCM_VERSION_MINOR EQUAL 0) AND (ROCM_VERSION_PATCH EQUAL 0))
    message(FATAL_ERROR "ROCm version not found")
else()
    message(STATUS "ROCM version : ${ROCM_VERSION_MAJOR}.${ROCM_VERSION_MINOR}.${ROCM_VERSION_PATCH}")
endif()

set(ROCM_VERSION_NUM ${ROCM_VERSION_MAJOR}.${ROCM_VERSION_MINOR}${ROCM_VERSION_PATCH})

##### BLAS/LAPACK #####
find_library(BLIS_LIBRARY NAMES blis-mt blis)
find_library(FLAME_LIBRARY NAMES flame)
if(NOT FLAME_LIBRARY OR NOT BLIS_LIBRARY)
    find_package(BLAS REQUIRED)
    find_package(LAPACK REQUIRED)
    list(APPEND BLAS_LIBRARIES ${LAPACK_LIBRARIES})
else()
    set(BLAS_LIBRARIES "${BLIS_LIBRARY}")
    list(APPEND BLAS_LIBRARIES ${FLAME_LIBRARY})
endif()
message(STATUS "Linear algebra libraries found : ${BLAS_LIBRARIES}")

##### HIPFORT source ######
file(GLOB_RECURSE hipfort_src
    "${CMAKE_SOURCE_DIR}/../../lib/hipfort/*.F90"
    "${CMAKE_SOURCE_DIR}/../../lib/hipfort/*.f90")

# flang_rt.hostdevice was renamed flang_rt.runtime; pick whichever the toolchain has
include(CheckFortranSourceCompiles)
set(FLANG_RT "flang_rt.hostdevice")
find_library(FLANG_RT_HOSTDEVICE NAMES flang_rt.hostdevice
             HINTS ${ROCM_PATH}/lib/llvm/lib /opt/rocm/lib/llvm/lib PATH_SUFFIXES clang/*/lib/x86_64-unknown-linux-gnu)
if(NOT FLANG_RT_HOSTDEVICE)
    set(FLANG_RT "flang_rt.runtime")
endif()

##### Programs ############

add_executable(test_rocblas_dgemv_host ${CMAKE_SOURCE_DIR}/rocblas/test_rocblas_dgemv_host.f90 ${hipfort_src})
target_link_libraries(test_rocblas_dgemv_host PUBLIC roc::rocblas ${FLANG_RT})
set_property(TARGET test_rocblas_dgemv_host PROPERTY LINKER_LANGUAGE Fortran)

add_executable(test_rocsolver_zhegvdx ${CMAKE_SOURCE_DIR}/rocsolver/test_rocsolver_zhegvdx.f90 ${hipfort_src})
add_executable(test_rocsolver_zhegvdx_host ${CMAKE_SOURCE_DIR}/rocsolver/test_rocsolver_zhegvdx_host.f90 ${hipfort_src})
target_link_libraries(test_rocsolver_zhegvdx_host PUBLIC roc::rocsolver ${BLAS_LIBRARIES} ${FLANG_RT})
set_property(TARGET test_rocsolver_zhegvdx_host PROPERTY LINKER_LANGUAGE Fortran)
target_link_libraries(test_rocsolver_zhegvdx PUBLIC roc::rocsolver ${BLAS_LIBRARIES} ${FLANG_RT})
set_property(TARGET test_rocsolver_zhegvdx PROPERTY LINKER_LANGUAGE Fortran)

#### Test ####
enable_testing()
add_test(NAME test_rocsolver_zhegvdx COMMAND test_rocsolver_zhegvdx)
add_test(NAME test_rocsolver_zhegvdx_host COMMAND test_rocsolver_zhegvdx_host)
add_test(NAME test_rocblas_dgemv_host COMMAND test_rocblas_dgemv_host)






add_executable(test_rocfft_c2c_1d_z_host ${CMAKE_SOURCE_DIR}/rocfft/test_rocfft_c2c_1d_z_host.f90 ${hipfort_src})
target_link_libraries(test_rocfft_c2c_1d_z_host PUBLIC roc::rocfft /opt/rocm/lib/libamdhip64.so ${FLANG_RT})
set_property(TARGET test_rocfft_c2c_1d_z_host PROPERTY LINKER_LANGUAGE Fortran)
add_test(NAME test_rocfft_c2c_1d_z_host COMMAND test_rocfft_c2c_1d_z_host)

add_executable(test_rocrand_philox_uniform_host ${CMAKE_SOURCE_DIR}/rocrand/test_rocrand_philox_uniform_host.f90 ${hipfort_src})
target_link_libraries(test_rocrand_philox_uniform_host PUBLIC roc::rocrand ${FLANG_RT})
set_property(TARGET test_rocrand_philox_uniform_host PROPERTY LINKER_LANGUAGE Fortran)
add_test(NAME test_rocrand_philox_uniform_host COMMAND test_rocrand_philox_uniform_host)

add_executable(test_hiprand_philox_uniform_host ${CMAKE_SOURCE_DIR}/hiprand/test_hiprand_philox_uniform_host.f90 ${hipfort_src})
target_link_libraries(test_hiprand_philox_uniform_host PUBLIC /opt/rocm/lib/libhiprand.so /opt/rocm/lib/libamdhip64.so ${FLANG_RT})
set_property(TARGET test_hiprand_philox_uniform_host PROPERTY LINKER_LANGUAGE Fortran)
add_test(NAME test_hiprand_philox_uniform_host COMMAND test_hiprand_philox_uniform_host)

add_executable(test_hipblas_dgemv_host ${CMAKE_SOURCE_DIR}/hipblas/test_hipblas_dgemv_host.f90 ${hipfort_src})
target_link_libraries(test_hipblas_dgemv_host PUBLIC roc::hipblas /opt/rocm/lib/libamdhip64.so ${FLANG_RT})
set_property(TARGET test_hipblas_dgemv_host PROPERTY LINKER_LANGUAGE Fortran)
add_test(NAME test_hipblas_dgemv_host COMMAND test_hipblas_dgemv_host)

add_executable(test_rocsparse_dcsrmv_host ${CMAKE_SOURCE_DIR}/rocsparse/test_rocsparse_dcsrmv_host.f90 ${hipfort_src})
target_link_libraries(test_rocsparse_dcsrmv_host PUBLIC roc::rocsparse /opt/rocm/lib/libamdhip64.so ${FLANG_RT})
set_property(TARGET test_rocsparse_dcsrmv_host PROPERTY LINKER_LANGUAGE Fortran)
add_test(NAME test_rocsparse_dcsrmv_host COMMAND test_rocsparse_dcsrmv_host)

add_executable(test_hipfft_c2c_1d_z_host ${CMAKE_SOURCE_DIR}/hipfft/test_hipfft_c2c_1d_z_host.f90 ${hipfort_src})
target_link_libraries(test_hipfft_c2c_1d_z_host PUBLIC /opt/rocm/lib/libhipfft.so /opt/rocm/lib/libamdhip64.so ${FLANG_RT})
set_property(TARGET test_hipfft_c2c_1d_z_host PROPERTY LINKER_LANGUAGE Fortran)
add_test(NAME test_hipfft_c2c_1d_z_host COMMAND test_hipfft_c2c_1d_z_host)

add_executable(test_hipsolver_dsyevd_host ${CMAKE_SOURCE_DIR}/hipsolver/test_hipsolver_dsyevd_host.f90 ${hipfort_src})
target_link_libraries(test_hipsolver_dsyevd_host PUBLIC /opt/rocm/lib/libhipsolver.so /opt/rocm/lib/libamdhip64.so ${FLANG_RT})
set_property(TARGET test_hipsolver_dsyevd_host PROPERTY LINKER_LANGUAGE Fortran)
add_test(NAME test_hipsolver_dsyevd_host COMMAND test_hipsolver_dsyevd_host)

add_executable(test_hipsparse_dcsrmv_host ${CMAKE_SOURCE_DIR}/hipsparse/test_hipsparse_dcsrmv_host.f90 ${hipfort_src})
target_link_libraries(test_hipsparse_dcsrmv_host PUBLIC /opt/rocm/lib/libhipsparse.so /opt/rocm/lib/libamdhip64.so ${FLANG_RT})
set_property(TARGET test_hipsparse_dcsrmv_host PROPERTY LINKER_LANGUAGE Fortran)
add_test(NAME test_hipsparse_dcsrmv_host COMMAND test_hipsparse_dcsrmv_host)

add_executable(test_hip_memcpy_host ${CMAKE_SOURCE_DIR}/hip/test_hip_memcpy_host.f90 ${hipfort_src})
target_link_libraries(test_hip_memcpy_host PUBLIC /opt/rocm/lib/libamdhip64.so ${FLANG_RT})
set_property(TARGET test_hip_memcpy_host PROPERTY LINKER_LANGUAGE Fortran)
add_test(NAME test_hip_memcpy_host COMMAND test_hip_memcpy_host)
