# rocTX's Fortran binding (the profiler annotation API).
#
# After the split this is bindings/fortran/CMakeLists.txt in rocm-systems, where
# one project builds the HIP and ROCTx bindings together, against the installed
# libraries; TheRock builds it after rocprofiler-sdk. rocTX ships inside
# rocprofiler-sdk, which is why the C package found below is
# rocprofiler-sdk-roctx rather than roctx.
#
#   cmake -S bindings/fortran -B build/roctx-fortran \
#     -DCMAKE_Fortran_COMPILER=gfortran -DCMAKE_PREFIX_PATH=/opt/rocm
#
# Note that rocTX ships under two names that are NOT interchangeable:
# librocprofiler-sdk-roctx exports the plain symbols, while the legacy
# libroctx64 exports them versioned (roctxMarkA@@ROCTX_4.1). The binding is
# built against the imported target below, so it resolves the same one the
# rocprofiler-sdk-roctx package does.

cmake_minimum_required(VERSION 3.18..4.0 FATAL_ERROR)

if(CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
  # C is enabled because the rocprofiler-sdk-roctx config pulls in FindThreads.
  project(roctx-fortran LANGUAGES Fortran C)
  # In rocm-systems this helper comes from rocm-cmake, as
  #   find_package(ROCmCMakeBuildTools REQUIRED)
  # The sandbox keeps it in hipfort's tree instead.
  list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/../../../../../cmake/Modules")
endif()

include(ROCmFortranBinding)

rocm_fortran_require_c_package(rocprofiler-sdk-roctx)

rocm_add_fortran_binding(
  LIBRARY   roctx
  NAMESPACE roc
  SOURCE    roctx.F90
  C_PACKAGE rocprofiler-sdk-roctx
  C_TARGET  rocprofiler-sdk-roctx::rocprofiler-sdk-roctx)
