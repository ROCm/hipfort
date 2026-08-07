# Copyright (c) 2020-2026 Advanced Micro Devices, Inc. All rights reserved.
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

file(GLOB HIPFORT_SRC_HIP_F90 "${CMAKE_CURRENT_SOURCE_DIR}/hipfort/*.f90")
file(GLOB HIPFORT_SRC_HIP_F90_UPPER "${CMAKE_CURRENT_SOURCE_DIR}/hipfort/*.F90")
set(HIPFORT_SRC_HIP ${HIPFORT_SRC_HIP_F90} ${HIPFORT_SRC_HIP_F90_UPPER})

# The Fortran 2008 array interfaces (USE_FPOINTER_INTERFACES) default ON whenever
# the compiler supports Fortran 2008. Exposed as a cache option so it can be forced
# OFF for an old compiler, or one whose F2008 support is buggy (e.g. some Intel
# releases) — the library then builds with plain C-binding interfaces only.
set(_hipfort_fpointer_default OFF)
if(CMAKE_Fortran_COMPILER_SUPPORTS_F08)
  set(_hipfort_fpointer_default ON)
endif()
option(HIPFORT_USE_FPOINTER_INTERFACES
  "Enable the Fortran 2008 array interfaces" ${_hipfort_fpointer_default})

# The F2008 interfaces cannot be built on a compiler without F2008 support. FORCE
# the cache so the effective value is consistent in the test/ subdirectory too.
if(HIPFORT_USE_FPOINTER_INTERFACES AND NOT CMAKE_Fortran_COMPILER_SUPPORTS_F08)
  message(WARNING
    "HIPFORT_USE_FPOINTER_INTERFACES was requested but ${CMAKE_Fortran_COMPILER} "
    "does not support Fortran 2008; disabling it (plain C-binding build).")
  set(HIPFORT_USE_FPOINTER_INTERFACES OFF CACHE BOOL
    "Enable the Fortran 2008 array interfaces" FORCE)
endif()

# Experimental: replace the per-rank array interfaces (rank_0..rank_N + full_rank)
# with a single Fortran 2018 assumed-rank (dimension(..)) specific per routine.
# One overload then accepts an actual argument of any rank. Opt-in and nested in
# USE_FPOINTER_INTERFACES (the two are mutually exclusive in each generic).
# Requires a Fortran 2018 compiler.
option(HIPFORT_ASSUMED_RANK "Use the F2018 assumed-rank array interfaces" OFF)

# Guard the opt-in: assumed-rank is nested in the F2008 interfaces and additionally
# needs a Fortran 2018 compiler (c_loc() of a dimension(..) argument; see the
# CMAKE_Fortran_COMPILER_SUPPORTS_F18 probe in the top-level CMakeLists.txt). If it
# was requested but either prerequisite is missing, warn and fall back to the
# per-rank interfaces (or plain C bindings if those are off too) rather than
# failing the build. FORCE the cache so test/ sees the same effective value.
if(HIPFORT_ASSUMED_RANK AND NOT (HIPFORT_USE_FPOINTER_INTERFACES AND CMAKE_Fortran_COMPILER_SUPPORTS_F18))
  message(WARNING
    "HIPFORT_ASSUMED_RANK was requested but the Fortran 2018 assumed-rank "
    "interfaces are unavailable (they need a Fortran 2018 compiler and the F2008 "
    "interfaces enabled); disabling the assumed-rank interfaces (the build falls "
    "back to the per-rank F2008 interfaces, or the plain F2003 C bindings if "
    "HIPFORT_USE_FPOINTER_INTERFACES is off).")
  set(HIPFORT_ASSUMED_RANK OFF CACHE BOOL
    "Use the F2018 assumed-rank array interfaces" FORCE)
endif()

set(HIPFORT_ARCH "amdgcn")
    # amdgcn
    set(HIPFORT_LIB      "hipfort-${HIPFORT_ARCH}")
    set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/include/hipfort/${HIPFORT_ARCH})
    ADD_LIBRARY(${HIPFORT_LIB} STATIC 
        ${HIPFORT_SRC_HIP} 
        )
    target_include_directories(${HIPFORT_LIB}
      PUBLIC
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}/hipfort/amdgcn>
    )
    IF(HIPFORT_USE_FPOINTER_INTERFACES)
    	target_compile_definitions(${HIPFORT_LIB} PRIVATE USE_FPOINTER_INTERFACES)
    	IF(HIPFORT_ASSUMED_RANK)
    		target_compile_definitions(${HIPFORT_LIB} PRIVATE USE_ASSUMED_RANK_INTERFACES)
    	ENDIF(HIPFORT_ASSUMED_RANK)
    ENDIF(HIPFORT_USE_FPOINTER_INTERFACES)
    target_compile_definitions(${HIPFORT_LIB} PRIVATE _HIPFORT_ARCH='${HIPFORT_ARCH}')
    # Install Target hipfort-amdgcn
    # CMAKE_INSTALL_LIBDIR/INCLUDEDIR already carry the toolchain-specific
    # subdirectory (see HIPFORT_MULTITOOLCHAIN_LAYOUT in the top-level
    # CMakeLists.txt), so they must not be suffixed with FORTRAN_LIBRARY_SUBDIR
    # again -- doing so nests the archive and mod files one level too deep
    # (e.g. lib/fortran/<compiler>/fortran/<compiler>).
    rocm_install_targets(
        TARGETS ${HIPFORT_LIB}
        EXPORT hipfort-amdgcn-targets
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
        INCLUDE
           ${CMAKE_Fortran_MODULE_DIRECTORY}
    )

set(HIPFORT_ARCH "nvptx")
    # nvptx
    set(HIPFORT_LIB     "hipfort-${HIPFORT_ARCH}")
    set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/include/hipfort/${HIPFORT_ARCH})
    # The roc* modules are AMD-only; compiling them here leaves ~1200 dangling symbols.
    set(HIPFORT_SRC_CUDA ${HIPFORT_SRC_HIP})
    list(FILTER HIPFORT_SRC_CUDA EXCLUDE REGEX
         "hipfort_roc(blas|blas_auxiliary|fft|rand|solver|sparse)\\.F90$")
    ADD_LIBRARY(${HIPFORT_LIB} STATIC
         ${HIPFORT_SRC_CUDA}
         )
    IF(HIPFORT_USE_FPOINTER_INTERFACES)
    	target_compile_definitions(${HIPFORT_LIB} PRIVATE USE_FPOINTER_INTERFACES)
    	IF(HIPFORT_ASSUMED_RANK)
    		target_compile_definitions(${HIPFORT_LIB} PRIVATE USE_ASSUMED_RANK_INTERFACES)
    	ENDIF(HIPFORT_ASSUMED_RANK)
    ENDIF(HIPFORT_USE_FPOINTER_INTERFACES)
    target_compile_definitions(${HIPFORT_LIB} PRIVATE USE_CUDA_NAMES)
    target_compile_definitions(${HIPFORT_LIB} PRIVATE _HIPFORT_ARCH='${HIPFORT_ARCH}')
    # Install Target hipfort-nvptx
    rocm_install_targets(
        TARGETS ${HIPFORT_LIB}
        EXPORT hipfort-nvptx-targets
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        INCLUDE
           ${CMAKE_Fortran_MODULE_DIRECTORY}
    )

    rocm_install(
      EXPORT hipfort-nvptx-targets
      FILE hipfort-nvptx-targets.cmake
      NAMESPACE hipfort::
      DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/hipfort
    )
   

    find_package(CUDAToolkit)
    # Install include files marking as devel component
    rocm_install(DIRECTORY ${CMAKE_BINARY_DIR}/include/hipfort
                 DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
		 COMPONENT devel)

rocm_install(
  EXPORT hipfort-amdgcn-targets
  FILE hipfort-amdgcn-targets.cmake
  NAMESPACE hipfort::
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/hipfort
)

if(NOT DEFINED HIPFORT_BASE_LIB)
  set(HIPFORT_BASE_LIB hipfort-amdgcn)
endif()

macro(hipfort_add_component name imported_target)
  add_library(hipfort-${name} INTERFACE)
  add_library(hipfort::${name} ALIAS hipfort-${name})
  set_target_properties(hipfort-${name}
    PROPERTIES
      EXPORT_NAME ${name}
  )
  target_link_libraries(hipfort-${name} INTERFACE ${HIPFORT_BASE_LIB} ${imported_target})
  # The archive is shared by every component, so CMake orders it after the ROCm
  # .so files and --as-needed drops them. This dependency puts the archive first.
  target_link_libraries(${HIPFORT_BASE_LIB} INTERFACE "$<BUILD_INTERFACE:${imported_target}>")
  rocm_install(
    TARGETS
      hipfort-${name}
    EXPORT hipfort-${name}-targets
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
  )
  rocm_install(
    EXPORT hipfort-${name}-targets
    FILE hipfort-${name}-targets.cmake
    NAMESPACE hipfort::
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/hipfort
  )
endmacro()

find_package(hip PATHS ${ROCM_PATH} /opt/rocm)
if(HIP_PLATFORM STREQUAL "amd")
  if(hip_FOUND)
    hipfort_add_component(hip hip::host)
  else()
    message(STATUS "Skipping hipfort::hip target export")
  endif()

  find_package(rocprofiler-sdk-roctx PATHS ${ROCM_PATH} /opt/rocm)
  if(rocprofiler-sdk-roctx_FOUND)
    hipfort_add_component(roctx rocprofiler-sdk-roctx::rocprofiler-sdk-roctx)
  else()
    message(STATUS "Skipping hipfort::roctx target export")
  endif()

  find_package(rocblas PATHS ${ROCM_PATH} /opt/rocm)
  if(rocblas_FOUND)
    hipfort_add_component(rocblas roc::rocblas)
  else()
    message(STATUS "Skipping hipfort::rocblas target export")
  endif()

  find_package(hipblas PATHS ${ROCM_PATH} /opt/rocm)
  if(hipblas_FOUND)
    hipfort_add_component(hipblas roc::hipblas)
  else()
    message(STATUS "Skipping hipfort::hipblas target export")
  endif()

  find_package(rocfft PATHS ${ROCM_PATH} /opt/rocm)
  if(rocfft_FOUND)
    hipfort_add_component(rocfft roc::rocfft)
  else()
    message(STATUS "Skipping hipfort::rocfft target export")
  endif()

  find_package(hipfft PATHS ${ROCM_PATH} /opt/rocm)
  if(hipfft_FOUND)
    hipfort_add_component(hipfft hip::hipfft)
    # hipFFTW: the FFTW3-compatible API. In some ROCm versions its symbols live
    # in a separate libhipfftw (hip::hipfftw target); in others they are folded
    # into libhipfft. Prefer the dedicated target when present.
    if(TARGET hip::hipfftw)
      hipfort_add_component(hipfftw hip::hipfftw)
    else()
      hipfort_add_component(hipfftw hip::hipfft)
    endif()
  else()
    message(STATUS "Skipping hipfort::hipfft target export")
  endif()

  find_package(rocrand PATHS ${ROCM_PATH} /opt/rocm)
  if(rocrand_FOUND)
    hipfort_add_component(rocrand roc::rocrand)
  else()
    message(STATUS "Skipping hipfort::rocrand target export")
  endif()

  find_package(hiprand PATHS ${ROCM_PATH} /opt/rocm)
  if(hiprand_FOUND)
    hipfort_add_component(hiprand hip::hiprand)
  else()
    message(STATUS "Skipping hipfort::hiprand target export")
  endif()

  find_package(rocsolver PATHS ${ROCM_PATH} /opt/rocm)
  if(rocsolver_FOUND)
    hipfort_add_component(rocsolver roc::rocsolver)
  else()
    message(STATUS "Skipping hipfort::rocsolver target export")
  endif()

  find_package(hipsolver PATHS ${ROCM_PATH} /opt/rocm)
  if(hipsolver_FOUND)
    hipfort_add_component(hipsolver roc::hipsolver)
  else()
    message(STATUS "Skipping hipfort::hipsolver target export")
  endif()

  find_package(rocsparse PATHS ${ROCM_PATH} /opt/rocm)
  if(rocsparse_FOUND)
    hipfort_add_component(rocsparse roc::rocsparse)
  else()
    message(STATUS "Skipping hipfort::rocsparse target export")
  endif()

  find_package(hipsparse PATHS ${ROCM_PATH} /opt/rocm)
  if(hipsparse_FOUND)
    hipfort_add_component(hipsparse roc::hipsparse)
  else()
    message(STATUS "Skipping hipfort::hipsparse target export")
  endif()

  include(CMakePackageConfigHelpers)

  configure_package_config_file(
    hipfort-config.cmake.in
    ${CMAKE_CURRENT_BINARY_DIR}/hipfort-config.cmake
    INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/hipfort
    NO_CHECK_REQUIRED_COMPONENTS_MACRO
  )

  write_basic_package_version_file(
    ${CMAKE_CURRENT_BINARY_DIR}/hipfort-config-version.cmake
    VERSION "${HIPFORT_VERSION_MAJOR}.${HIPFORT_VERSION_MINOR}.${HIPFORT_VERSION_PATCH}"
    COMPATIBILITY SameMajorVersion
  )

  rocm_install(
    FILES
      ${CMAKE_CURRENT_BINARY_DIR}/hipfort-config.cmake
      ${CMAKE_CURRENT_BINARY_DIR}/hipfort-config-version.cmake
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/hipfort
  )
elseif(CUDAToolkit_FOUND)
  # Only the hip* components exist here; roc* and the FFTW3 API have no CUDA counterpart.
  set(HIPFORT_BASE_LIB hipfort-nvptx)
  foreach(pair "hip:cudart" "hipblas:cublas" "hipfft:cufft"
               "hiprand:curand" "hipsolver:cusolver" "hipsparse:cusparse")
    string(REPLACE ":" ";" pair "${pair}")
    list(GET pair 0 _comp)
    list(GET pair 1 _cudalib)
    if(TARGET CUDA::${_cudalib})
      hipfort_add_component(${_comp} CUDA::${_cudalib})
    else()
      message(STATUS "Skipping hipfort::${_comp} target export (no CUDA::${_cudalib})")
    endif()
  endforeach()
endif()
