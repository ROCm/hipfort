# Classic Intel Fortran toolchain file for hipfort (ifort, AMD ROCm backend).
#
# Note: the classic ifort compiler is end-of-life; prefer intel.cmake (ifx) for
# new setups. This file is provided for legacy environments.
#
# Usage:
#   source /opt/intel/oneapi/setvars.sh
#   cmake -S . -B build -DCMAKE_TOOLCHAIN_FILE=cmake/toolchains/intel-classic.cmake

set(CMAKE_Fortran_COMPILER ifort CACHE FILEPATH "Classic Intel Fortran compiler")
set(CMAKE_C_COMPILER       icx   CACHE FILEPATH "Intel C compiler (LLVM)")
set(CMAKE_CXX_COMPILER     icpx  CACHE FILEPATH "Intel C++ compiler (LLVM)")

if(NOT DEFINED ROCM_PATH AND DEFINED ENV{ROCM_PATH})
  set(ROCM_PATH "$ENV{ROCM_PATH}" CACHE PATH "ROCm installation root")
endif()

# Free-form parsing and C preprocessing are enabled by hipfort itself, via
# CMAKE_Fortran_FORMAT and CMAKE_Fortran_PREPROCESS in the top-level
# CMakeLists.txt. CMake emits the preprocessing flag each compiler expects
# (-fpp for ifort), so there is no need to add a preprocessing or free-form
# flag here.
