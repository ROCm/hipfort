# hipRAND's Fortran binding.
#
# After the split this is bindings/fortran/hiprand/CMakeLists.txt in
# rocm-libraries. It is a project of its own, built against the installed
# library, which TheRock builds after the library itself. It stands alone
# because the shipped .mod only matches the compiler ROCm built it with: on any
# other compiler you rebuild just this binding against an installed ROCm,
# without rebuilding hipRAND itself.
#
#   cmake -S bindings/fortran/hiprand -B build/hiprand-fortran \
#     -DCMAKE_Fortran_COMPILER=gfortran -DCMAKE_PREFIX_PATH=/opt/rocm
#
# Compiling hiprand.F90 needs only a Fortran compiler: it is self-contained
# Fortran and references neither the C headers nor the .so, which resolve when
# the application links.

cmake_minimum_required(VERSION 3.18..4.0 FATAL_ERROR)

if(CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
  # C is enabled because hiprand-config.cmake pulls in FindThreads.
  project(hiprand-fortran LANGUAGES Fortran C)
  # In rocm-libraries this helper comes from rocm-cmake, as
  #   find_package(ROCmCMakeBuildTools REQUIRED)
  # The sandbox keeps it in hipfort's tree instead.
  list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/../../../../../cmake/Modules")
endif()

include(ROCmFortranBinding)

rocm_fortran_require_c_package(hiprand)

rocm_add_fortran_binding(
  LIBRARY   hiprand
  NAMESPACE hip
  SOURCE    hiprand.F90
  C_PACKAGE hiprand
  C_TARGET  hip::hiprand)
