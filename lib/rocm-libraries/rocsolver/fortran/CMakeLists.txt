# rocSOLVER's Fortran binding.
#
# After the split this is projects/rocsolver/fortran/CMakeLists.txt in
# rocm-libraries, pulled into the library's own build by
# add_subdirectory(fortran) under BUILD_FORTRAN_BINDINGS. It is also a project
# in its own right, because the shipped .mod only matches the compiler ROCm
# built it with: on any other compiler you rebuild just this binding against an
# installed ROCm, without rebuilding rocSOLVER itself.
#
#   cmake -S projects/rocsolver/fortran -B build/rocsolver-fortran \
#     -DCMAKE_Fortran_COMPILER=gfortran -DCMAKE_PREFIX_PATH=/opt/rocm
#
# rocSOLVER is the one binding that USEs another: its module takes a handful of
# enumerators from rocblas rather than redeclaring them. That makes rocBLAS's
# .mod a build input, so the two must be built by the same compiler and in
# dependency order -- rocBLAS's binding first. See FORTRAN_DEPENDS below.

cmake_minimum_required(VERSION 3.18..4.0 FATAL_ERROR)

if(CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
  # C is enabled because rocsolver-config.cmake pulls in FindThreads.
  project(rocsolver-fortran LANGUAGES Fortran C)
  # In rocm-libraries this helper comes from rocm-cmake, as
  #   find_package(ROCmCMakeBuildTools REQUIRED)
  # The sandbox keeps it in hipfort's tree instead.
  list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/../../../../cmake/Modules")
endif()

include(ROCmFortranBinding)

rocm_fortran_require_c_package(rocsolver)

# Reuse rocBLAS's binding when it is configured in the same tree, and fall back
# to an installed one otherwise. This is the standalone case: rocBLAS's binding
# has to already be installed, built with this same compiler.
if(NOT TARGET roc::rocblas_fortran)
  find_package(rocblas-fortran REQUIRED)
endif()

rocm_add_fortran_binding(
  LIBRARY         rocsolver
  NAMESPACE       roc
  SOURCE          rocsolver.F90
  C_PACKAGE       rocsolver
  C_TARGET        roc::rocsolver
  FORTRAN_DEPENDS roc::rocblas_fortran)
