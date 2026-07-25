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

# The Fortran 2008 array interfaces (USE_FPOINTER_INTERFACES) rely on generic
# interfaces that the Intel compilers (ifx/ifort) reject as ambiguous. Build the
# Fortran 2003 (type(c_ptr)) interfaces there instead.
set(HIPFORT_USE_FPOINTER_INTERFACES OFF)
if(CMAKE_Fortran_COMPILER_SUPPORTS_F08 AND NOT CMAKE_Fortran_COMPILER_ID MATCHES "Intel")
  set(HIPFORT_USE_FPOINTER_INTERFACES ON)
elseif(CMAKE_Fortran_COMPILER_SUPPORTS_F08)
  message(STATUS "Intel Fortran (${CMAKE_Fortran_COMPILER_ID}) detected: building the "
                 "Fortran 2003 (type(c_ptr)) interfaces; the Fortran 2008 array "
                 "interfaces are disabled to avoid a generic-interface ambiguity "
                 "rejected by ifx/ifort.")
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
    ADD_LIBRARY(${HIPFORT_LIB} STATIC 
         ${HIPFORT_SRC_HIP} 
         )
    # The CUDA/NVIDIA backend only exposes the interfaces that have a cu*
    # equivalent (the bogus cu* name mappings were dropped in #394), so the
    # Fortran 2008 array wrappers -- which call the raw hip* bindings that are
    # not declared under USE_CUDA_NAMES -- cannot be built here. Build only the
    # Fortran 2003 (type(c_ptr)) interfaces on nvptx, so do NOT define
    # USE_FPOINTER_INTERFACES for this target.
    target_compile_definitions(${HIPFORT_LIB} PRIVATE USE_CUDA_NAMES)
    target_compile_definitions(${HIPFORT_LIB} PRIVATE _HIPFORT_ARCH='${HIPFORT_ARCH}')
    # Install Target hipfort-nvptx
    rocm_install_targets(
        TARGETS ${HIPFORT_LIB}
        INCLUDE
           ${CMAKE_Fortran_MODULE_DIRECTORY}
    )
   
    # Install include files marking as devel component
    rocm_install(DIRECTORY ${CMAKE_BINARY_DIR}/include/hipfort
                 DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
		 COMPONENT devel)

#   target_link_libraries(${HIPFORT_LIB} PUBLIC 
#   /usr/local/cuda/targets/x86_64-linux/lib/libcudart_static.a)

rocm_install(
  EXPORT hipfort-amdgcn-targets
  FILE hipfort-amdgcn-targets.cmake
  NAMESPACE hipfort::
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/hipfort
)

macro(hipfort_add_component name imported_target)
  add_library(hipfort-${name} INTERFACE)
  add_library(hipfort::${name} ALIAS hipfort-${name})
  set_target_properties(hipfort-${name}
    PROPERTIES
      EXPORT_NAME ${name}
  )
  target_link_libraries(hipfort-${name} INTERFACE hipfort-amdgcn ${imported_target})
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
endif()
