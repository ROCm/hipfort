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

# Partition the sources by backend so each archive only carries what its backend
# can actually resolve:
#   * the roc* API modules (rocBLAS/rocSOLVER/rocSPARSE/rocFFT/rocRAND) wrap
#     AMD-only libraries with no CUDA equivalent -> amdgcn only. Compiling them for
#     nvptx just adds unresolvable roc* symbols to the archive. Their *_enums
#     modules are kept in both backends: they carry only `enum, bind(c)` constants
#     (no external symbols) and hipfort_check uses the roc*_status enums for its
#     error-check helpers regardless of backend.
#   * hipfort_cuda_errors (the cudaError_t enum) is only used under USE_CUDA_NAMES
#     -> nvptx only. On amdgcn every `use hipfort_cuda_errors` is #ifdef'd out.
# Everything else is common to both backends.
set(HIPFORT_SRC_ROC "")
foreach(_roclib rocblas rocsolver rocsparse rocfft rocrand)
  file(GLOB _rocfiles "${CMAKE_CURRENT_SOURCE_DIR}/hipfort/hipfort_${_roclib}.[fF]90")  # API module only, not *_enums
  list(APPEND HIPFORT_SRC_ROC ${_rocfiles})
endforeach()
file(GLOB HIPFORT_SRC_CUDA_ERRORS "${CMAKE_CURRENT_SOURCE_DIR}/hipfort/hipfort_cuda_errors.[fF]90")

set(HIPFORT_SRC_COMMON ${HIPFORT_SRC_HIP})
list(REMOVE_ITEM HIPFORT_SRC_COMMON ${HIPFORT_SRC_ROC} ${HIPFORT_SRC_CUDA_ERRORS})

set(HIPFORT_SRC_AMDGCN ${HIPFORT_SRC_COMMON} ${HIPFORT_SRC_ROC})            # + AMD-only roc*
set(HIPFORT_SRC_NVPTX  ${HIPFORT_SRC_COMMON} ${HIPFORT_SRC_CUDA_ERRORS})    # + CUDA-only cuda_errors

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

# The CUDA backend is built even on ROCm-only builds; turn it off if unused.
option(HIPFORT_BUILD_NVPTX "Build the CUDA (nvptx) backend archive" ON)

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
        ${HIPFORT_SRC_AMDGCN}
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

if(HIPFORT_BUILD_NVPTX)
set(HIPFORT_ARCH "nvptx")
    # nvptx
    set(HIPFORT_LIB     "hipfort-${HIPFORT_ARCH}")
    set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/include/hipfort/${HIPFORT_ARCH})
    ADD_LIBRARY(${HIPFORT_LIB} STATIC
         ${HIPFORT_SRC_NVPTX}
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
        INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
        INCLUDE
           ${CMAKE_Fortran_MODULE_DIRECTORY}
    )

    rocm_install(
      EXPORT hipfort-nvptx-targets
      FILE hipfort-nvptx-targets.cmake
      NAMESPACE hipfort::
      DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/hipfort
    )
endif()
   
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

set(HIPFORT_BASE_LIB hipfort-amdgcn)

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

find_package(hip PATHS ${ROCM_PATH})
find_package(CUDAToolkit QUIET)
if(HIP_PLATFORM STREQUAL "amd")
  if(hip_FOUND)
    hipfort_add_component(hip hip::host)
  else()
    message(STATUS "Skipping hipfort::hip target export")
  endif()

  find_package(rocprofiler-sdk-roctx PATHS ${ROCM_PATH})
  if(rocprofiler-sdk-roctx_FOUND)
    hipfort_add_component(roctx rocprofiler-sdk-roctx::rocprofiler-sdk-roctx)
  else()
    message(STATUS "Skipping hipfort::roctx target export")
  endif()

  find_package(rocblas PATHS ${ROCM_PATH})
  if(rocblas_FOUND)
    hipfort_add_component(rocblas roc::rocblas)
  else()
    message(STATUS "Skipping hipfort::rocblas target export")
  endif()

  find_package(hipblas PATHS ${ROCM_PATH})
  if(hipblas_FOUND)
    hipfort_add_component(hipblas roc::hipblas)
  else()
    message(STATUS "Skipping hipfort::hipblas target export")
  endif()

  find_package(rocfft PATHS ${ROCM_PATH})
  if(rocfft_FOUND)
    hipfort_add_component(rocfft roc::rocfft)
  else()
    message(STATUS "Skipping hipfort::rocfft target export")
  endif()

  find_package(hipfft PATHS ${ROCM_PATH})
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

  find_package(rocrand PATHS ${ROCM_PATH})
  if(rocrand_FOUND)
    hipfort_add_component(rocrand roc::rocrand)
  else()
    message(STATUS "Skipping hipfort::rocrand target export")
  endif()

  find_package(hiprand PATHS ${ROCM_PATH})
  if(hiprand_FOUND)
    hipfort_add_component(hiprand hip::hiprand)
  else()
    message(STATUS "Skipping hipfort::hiprand target export")
  endif()

  find_package(rocsolver PATHS ${ROCM_PATH})
  if(rocsolver_FOUND)
    hipfort_add_component(rocsolver roc::rocsolver)
  else()
    message(STATUS "Skipping hipfort::rocsolver target export")
  endif()

  find_package(hipsolver PATHS ${ROCM_PATH})
  if(hipsolver_FOUND)
    hipfort_add_component(hipsolver roc::hipsolver)
  else()
    message(STATUS "Skipping hipfort::hipsolver target export")
  endif()

  find_package(rocsparse PATHS ${ROCM_PATH})
  if(rocsparse_FOUND)
    hipfort_add_component(rocsparse roc::rocsparse)
  else()
    message(STATUS "Skipping hipfort::rocsparse target export")
  endif()

  find_package(hipsparse PATHS ${ROCM_PATH})
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

  # With the multitoolchain layout the package files above live under
  # lib/fortran/<compiler>/cmake/hipfort, which is not on CMake's default
  # find_package search path. Also install a compiler-agnostic shim at the
  # standard lib/cmake/hipfort so `find_package(hipfort)` succeeds from the
  # install prefix (e.g. /opt/rocm); at use time it forwards to the toolchain
  # subdirectory matching the consumer's Fortran compiler. The version file is
  # compiler-independent and installed alongside so version checks still work.
  if(HIPFORT_MULTITOOLCHAIN_LAYOUT)
    # Plain install() (not rocm_install) because rocm_install does not support
    # RENAME; the file is still packaged by CPACK.
    install(
      FILES ${CMAKE_CURRENT_SOURCE_DIR}/hipfort-config-shim.cmake
      RENAME hipfort-config.cmake
      DESTINATION lib/cmake/hipfort
    )
    install(
      FILES ${CMAKE_CURRENT_BINARY_DIR}/hipfort-config-version.cmake
      DESTINATION lib/cmake/hipfort
    )
  endif()
elseif(CUDAToolkit_FOUND AND TARGET hipfort-nvptx)
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

# ---------------------------------------------------------------------------
# HIPFORT_EXTENDED_TESTS: verify each backend static archive links into a shared
# library with every symbol resolved. Each test runs
#   $FC -fPIC -shared -Wl,--whole-archive libhipfort-<arch>.a -Wl,--no-whole-archive
#       -Wl,--no-undefined -L<dir> <-l deps> -o libhipfort-<arch>.so
# and fails (non-zero exit) on any unresolved symbol. A backend's test is only
# added when all of its runtime libraries are found, so this is a no-op without
# the corresponding stack. Override the lib directories with HIPFORT_ROCM_LIB_DIR
# / HIPFORT_CUDA_LIB_DIR (e.g. to point nvptx at a non-default CUDA toolkit).
if(HIPFORT_EXTENDED_TESTS)
  # amdflang/LLVMFlang emits absolute R_X86_64_64 relocations for its derived-type
  # module descriptors (e.g. in the *_types modules) that its default linker,
  # ld.lld, refuses in a shared object — and -fPIC does not change them (a flang
  # codegen limitation). Allow text relocations so the shared-link check still
  # validates symbol resolution; the flag is accepted by both ld.lld and GNU ld.
  # gfortran + GNU ld links these archives without it.
  set(_shared_ldflags "")
  if(CMAKE_Fortran_COMPILER_ID STREQUAL "LLVMFlang" OR CMAKE_Fortran_COMPILER_ID STREQUAL "Flang")
    set(_shared_ldflags -Wl,-z,notext)
  endif()

  # ---- amdgcn: link against the ROCm runtime libraries ----
  if(TARGET hipfort-amdgcn)
    set(_amd_dir "${HIPFORT_ROCM_LIB_DIR}")
    if(NOT _amd_dir)
      set(_amd_dir "${ROCM_PATH}/lib")
    endif()
    # NB: the HIP runtime is libamdhip64, not "libhip".
    set(_amd_libs hipfftw hipfft rocfft hipsolver rocsolver hipblas rocblas
                  rocrand hiprand hipsparse rocsparse amdhip64)
    set(_amd_ok TRUE)
    set(_amd_missing "")
    foreach(_l IN LISTS _amd_libs)
      unset(_amd_lib_${_l} CACHE)
      find_library(_amd_lib_${_l} NAMES ${_l} HINTS ${_amd_dir} NO_DEFAULT_PATH)
      if(NOT _amd_lib_${_l})
        set(_amd_ok FALSE)
        list(APPEND _amd_missing ${_l})
      endif()
    endforeach()
    if(_amd_ok)
      set(_amd_lflags "")
      foreach(_l IN LISTS _amd_libs)
        list(APPEND _amd_lflags "-l${_l}")
      endforeach()
      add_test(NAME hipfort_shared_link_amdgcn
        COMMAND ${CMAKE_Fortran_COMPILER} -fPIC -shared ${_shared_ldflags}
                -Wl,--whole-archive $<TARGET_FILE:hipfort-amdgcn> -Wl,--no-whole-archive
                -Wl,--no-undefined -L${_amd_dir} ${_amd_lflags}
                -o ${CMAKE_CURRENT_BINARY_DIR}/libhipfort-amdgcn.so)
      message(STATUS "HIPFORT_EXTENDED_TESTS: added amdgcn shared-link test (libs in ${_amd_dir})")
    else()
      message(STATUS "HIPFORT_EXTENDED_TESTS: skipping amdgcn shared-link test; missing in ${_amd_dir}: ${_amd_missing}")
    endif()
  endif()

  # ---- nvptx: link against the CUDA runtime libraries ----
  if(TARGET hipfort-nvptx)
    set(_cuda_dir "${HIPFORT_CUDA_LIB_DIR}")
    if(NOT _cuda_dir)
      find_package(CUDAToolkit QUIET)
      if(CUDAToolkit_FOUND)
        set(_cuda_dir "${CUDAToolkit_LIBRARY_DIR}")
      endif()
    endif()
    # Only the CUDA math/runtime libraries are needed: the whole-archive shared
    # link references solely the C symbols the archive's wrappers actually *call*
    # (the bind(C) interface bodies alone emit no reference). That set is entirely
    # runtime (cuda*/cublas*/...); the ~50 CUDA driver-API (cu*) routines are only
    # declared, never called here, so libcuda is not required. (The exhaustive
    # test_hip symbol test *does* call them and links the driver stub itself.)
    set(_cuda_libs cufft cusolver cublas curand cusparse cudart)
    set(_cuda_ok FALSE)
    set(_cuda_missing "")
    if(_cuda_dir)
      set(_cuda_ok TRUE)
      foreach(_l IN LISTS _cuda_libs)
        unset(_cuda_lib_${_l} CACHE)
        find_library(_cuda_lib_${_l} NAMES ${_l} HINTS ${_cuda_dir} NO_DEFAULT_PATH)
        if(NOT _cuda_lib_${_l})
          set(_cuda_ok FALSE)
          list(APPEND _cuda_missing ${_l})
        endif()
      endforeach()
    endif()
    if(_cuda_ok)
      set(_cuda_lflags "")
      foreach(_l IN LISTS _cuda_libs)
        list(APPEND _cuda_lflags "-l${_l}")
      endforeach()
      add_test(NAME hipfort_shared_link_nvptx
        COMMAND ${CMAKE_Fortran_COMPILER} -fPIC -shared ${_shared_ldflags}
                -Wl,--whole-archive $<TARGET_FILE:hipfort-nvptx> -Wl,--no-whole-archive
                -Wl,--no-undefined -L${_cuda_dir} ${_cuda_lflags}
                -o ${CMAKE_CURRENT_BINARY_DIR}/libhipfort-nvptx.so)
      message(STATUS "HIPFORT_EXTENDED_TESTS: added nvptx shared-link test (libs in ${_cuda_dir})")
    else()
      message(STATUS "HIPFORT_EXTENDED_TESTS: skipping nvptx shared-link test; CUDA libraries not found (set HIPFORT_CUDA_LIB_DIR). missing: ${_cuda_missing}")
    endif()
  endif()
endif()
