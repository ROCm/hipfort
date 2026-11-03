# rocBLAS's Fortran binding.
#
# After the split this is projects/rocblas/fortran/CMakeLists.txt in rocm-libraries,
# pulled into the library's own build by add_subdirectory(fortran) under
# BUILD_FORTRAN_BINDINGS. It is also a project in its own right, because the
# shipped .mod only matches the compiler ROCm built it with: on any other
# compiler you rebuild just this binding against an installed ROCm, without
# rebuilding rocBLAS itself.
#
#   cmake -S projects/rocblas/fortran -B build/rocblas-fortran \
#     -DCMAKE_Fortran_COMPILER=gfortran -DCMAKE_PREFIX_PATH=/opt/rocm
#
# Compiling rocblas.F90 needs only a Fortran compiler: it is self-contained
# Fortran and references neither the C headers nor the .so, which resolve when
# the application links.

cmake_minimum_required(VERSION 3.18..4.0 FATAL_ERROR)

if(CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
  # C is enabled because rocblas-config.cmake pulls in FindThreads.
  project(rocblas-fortran LANGUAGES Fortran C)
  # In rocm-libraries this helper comes from rocm-cmake, as
  #   find_package(ROCmCMakeBuildTools REQUIRED)
  # The sandbox keeps it in hipfort's tree instead.
  list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/../../../../cmake/Modules")
endif()

include(ROCmFortranBinding)

rocm_fortran_require_c_package(rocblas)

rocm_add_fortran_binding(
  LIBRARY   rocblas
  NAMESPACE roc
  SOURCE    rocblas.F90
  C_PACKAGE rocblas
  C_TARGET  roc::rocblas)
