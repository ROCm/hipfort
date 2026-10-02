# The HIP runtime's Fortran binding.
#
# After the split this is projects/hip/fortran/CMakeLists.txt in rocm-systems,
# pulled into HIP's own build by add_subdirectory(fortran) under
# BUILD_FORTRAN_BINDINGS. It is also a project in its own right, because the
# shipped .mod only matches the compiler ROCm built it with: on any other
# compiler you rebuild just this binding against an installed ROCm, without
# rebuilding HIP itself.
#
# This is the one nearly every program needs: hipMalloc, hipMemcpy, streams,
# events and hipCheck all live here, so most applications link it alongside
# whichever math library binding they use.
#
#   cmake -S projects/hip/fortran -B build/hip-fortran \
#     -DCMAKE_Fortran_COMPILER=gfortran -DCMAKE_PREFIX_PATH=/opt/rocm
#
# Compiling hip.F90 needs only a Fortran compiler: it is self-contained
# Fortran and references neither the C headers nor the .so, which resolve when
# the application links.

cmake_minimum_required(VERSION 3.18..4.0 FATAL_ERROR)

if(CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
  # C is enabled because hip-config.cmake pulls in FindThreads.
  project(hip-fortran LANGUAGES Fortran C)
  # In rocm-systems this helper comes from rocm-cmake, as
  #   find_package(ROCmCMakeBuildTools REQUIRED)
  # The sandbox keeps it in hipfort's tree instead.
  list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/../../../../cmake/Modules")
endif()

include(ROCmFortranBinding)

rocm_fortran_require_c_package(hip)

rocm_add_fortran_binding(
  LIBRARY   hip
  NAMESPACE hip
  SOURCE    hip.F90
  C_PACKAGE hip
  C_TARGET  hip::host)
