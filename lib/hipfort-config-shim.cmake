# hipfort package shim.
#
# Installed at <prefix>/lib/cmake/hipfort/hipfort-config.cmake when hipfort is
# built with HIPFORT_MULTITOOLCHAIN_LAYOUT=ON. Fortran .mod files are
# compiler-specific, so the real hipfort package files are installed under a
# compiler-specific subdirectory, <prefix>/lib/fortran/<compiler>/cmake/hipfort,
# which is not on CMake's default find_package search path. This shim lets
# `find_package(hipfort)` succeed from the install prefix (e.g. /opt/rocm) by
# forwarding to the subdirectory that matches the consuming project's Fortran
# compiler. It resolves the compiler at use time, so every toolchain install can
# write the same shim without conflict.

if(NOT CMAKE_Fortran_COMPILER)
  set(hipfort_FOUND FALSE)
  set(hipfort_NOT_FOUND_MESSAGE
      "hipfort requires the Fortran language to be enabled before find_package(hipfort); add Fortran to project(...) or call enable_language(Fortran).")
  return()
endif()

get_filename_component(_hipfort_fc "${CMAKE_Fortran_COMPILER}" NAME)
get_filename_component(_hipfort_prefix "${CMAKE_CURRENT_LIST_DIR}/../../.." ABSOLUTE)
set(_hipfort_real "${_hipfort_prefix}/lib/fortran/${_hipfort_fc}/cmake/hipfort/hipfort-config.cmake")

if(NOT EXISTS "${_hipfort_real}")
  file(GLOB _hipfort_toolchains RELATIVE "${_hipfort_prefix}/lib/fortran" "${_hipfort_prefix}/lib/fortran/*")
  set(hipfort_FOUND FALSE)
  set(hipfort_NOT_FOUND_MESSAGE
      "hipfort is not installed for the Fortran compiler '${_hipfort_fc}'. Available toolchains: ${_hipfort_toolchains}. Rebuild hipfort with this compiler, or set hipfort_DIR to the matching lib/fortran/<compiler>/cmake/hipfort directory.")
  unset(_hipfort_fc)
  unset(_hipfort_prefix)
  unset(_hipfort_real)
  return()
endif()

include("${_hipfort_real}")
unset(_hipfort_fc)
unset(_hipfort_prefix)
unset(_hipfort_real)
