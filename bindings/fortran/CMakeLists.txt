# Sandbox superbuild: builds the thirteen bindings of this directory as TheRock
# does. Each bindings/fortran/<lib> is a standalone project, built against the
# installed ROCm and installed into one prefix in dependency order, so that a
# binding finds the ones it uses (HIP for every test, rocBLAS for rocSOLVER)
# with find_package. Their tests join this build's ctest.
#
# It takes the hipFORT build's Fortran compiler and array interface level, so a
# CI stage tests the bindings in the same configuration as hipFORT. With
# HIPFORT_XNACK_MATRIX, each binding's tests run in both HSA_XNACK modes.

include(ExternalProject)

if(DEFINED ROCM_PATH)
  set(_rocm "${ROCM_PATH}")
elseif(DEFINED ENV{ROCM_PATH})
  set(_rocm "$ENV{ROCM_PATH}")
else()
  set(_rocm "/opt/rocm")
endif()

if(HIPFORT_ASSUMED_RANK)
  set(_tier assumed-rank)
elseif(NOT HIPFORT_USE_FPOINTER_INTERFACES)
  set(_tier none)
else()
  set(_tier assumed-shape)
endif()

set(_prefix "${CMAKE_CURRENT_BINARY_DIR}/install")
set(_args
  "-DCMAKE_Fortran_COMPILER=${CMAKE_Fortran_COMPILER}"
  "-DCMAKE_PREFIX_PATH=${_prefix}|${_rocm}"
  "-DCMAKE_INSTALL_PREFIX=${_prefix}"
  "-DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}"
  "-DROCM_PATH=${_rocm}"
  "-DFORTRAN_ARRAY_INTERFACES=${_tier}"
  "-DBUILD_FORTRAN_CLIENTS=${BUILD_TESTING}")
# The HIP binding's kernel tests need a HIP compiler.
if(EXISTS "${_rocm}/lib/llvm/bin/clang++")
  list(APPEND _args "-DCMAKE_HIP_COMPILER=${_rocm}/lib/llvm/bin/clang++")
endif()

# <lib>:<dependencies>. HIP first, every test uses it; rocBLAS before rocSOLVER.
set(_bindings
  "hip:" "roctx:" "rccl:hip" "rocblas:hip" "hipblas:hip" "rocsolver:hip,rocblas"
  "hipsolver:hip" "rocsparse:hip" "hipsparse:hip" "rocfft:hip" "hipfft:hip"
  "rocrand:hip" "hiprand:hip")

# An installed hipSOLVER built with EXPORT_FORTRAN_BINDINGS=ON exports the
# hand-written roc::hipsolver_fortran, and the hipSOLVER binding then refuses to
# configure. TheRock builds hipSOLVER with it OFF; other installs may not.
file(GLOB _hipsolver_targets "${_rocm}/lib*/cmake/hipsolver/hipsolver-targets*.cmake")
foreach(_f IN LISTS _hipsolver_targets)
  file(READ "${_f}" _text)
  if(_text MATCHES "hipsolver_fortran")
    message(STATUS "Fortran bindings: ${_rocm} has a hipSOLVER that exports its own "
                   "roc::hipsolver_fortran, skipping the hipSOLVER binding")
    list(REMOVE_ITEM _bindings "hipsolver:hip")
    break()
  endif()
endforeach()

foreach(_entry IN LISTS _bindings)
  string(REPLACE ":" ";" _parts "${_entry}")
  list(GET _parts 0 _lib)
  set(_deps)
  list(LENGTH _parts _n)
  if(_n GREATER 1)
    list(GET _parts 1 _d)
    string(REPLACE "," ";" _d "${_d}")
    foreach(_x IN LISTS _d)
      list(APPEND _deps "fortran_binding_${_x}")
    endforeach()
  endif()
  set(_bin "${CMAKE_CURRENT_BINARY_DIR}/${_lib}")
  ExternalProject_Add(fortran_binding_${_lib}
    SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/${_lib}"
    BINARY_DIR "${_bin}"
    INSTALL_DIR "${_prefix}"
    LIST_SEPARATOR |
    CMAKE_ARGS ${_args}
    DEPENDS ${_deps}
    BUILD_ALWAYS ON
    USES_TERMINAL_BUILD ON)
  if(HIPFORT_XNACK_MATRIX)
    # As hipFORT's tests: run the binding's whole ctest once in each HSA_XNACK
    # mode, pinned, rather than read its tests one by one under the runner's.
    foreach(_mode IN ITEMS 0 1)
      set(_name fortran_binding_${_lib})
      if(_mode)
        string(APPEND _name _xnack)
      endif()
      add_test(NAME ${_name}
               COMMAND ${CMAKE_CTEST_COMMAND} --output-on-failure
               WORKING_DIRECTORY "${_bin}")
      set_tests_properties(${_name} PROPERTIES ENVIRONMENT "HSA_XNACK=${_mode}"
                                               TIMEOUT 3600)
    endforeach()
  else()
    # The binding's own CTestTestfile, read from its build directory.
    file(WRITE "${CMAKE_CURRENT_BINARY_DIR}/${_lib}-tests.cmake" "subdirs(\"${_bin}\")\n")
    set_property(DIRECTORY APPEND PROPERTY TEST_INCLUDE_FILES
                 "${CMAKE_CURRENT_BINARY_DIR}/${_lib}-tests.cmake")
  endif()
endforeach()
