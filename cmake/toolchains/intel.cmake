# Intel oneAPI toolchain file for hipfort (ifx, AMD ROCm backend).
#
# Uses the LLVM-based Intel compilers (ifx/icx/icpx). For the end-of-life
# classic ifort compiler, see intel-classic.cmake.
#
# Requires the C/C++ Intel compilers (icx/icpx) in addition to the Fortran one
# (ifx): this file sets all three, and hipfort enables C and CXX because
# find_package(hip) requires them. Install the Intel oneAPI C/C++ component
# alongside ifx (they are separate downloads), or edit the CMAKE_C_COMPILER /
# CMAKE_CXX_COMPILER lines below to point at another available C/C++ compiler.
#
# Usage:
#   source /opt/intel/oneapi/setvars.sh
#   cmake -S . -B build -DCMAKE_TOOLCHAIN_FILE=cmake/toolchains/intel.cmake

set(CMAKE_Fortran_COMPILER ifx  CACHE FILEPATH "Intel Fortran compiler (LLVM)")
set(CMAKE_C_COMPILER       icx  CACHE FILEPATH "Intel C compiler (LLVM)")
set(CMAKE_CXX_COMPILER     icpx CACHE FILEPATH "Intel C++ compiler (LLVM)")

if(NOT DEFINED ROCM_PATH AND DEFINED ENV{ROCM_PATH})
  set(ROCM_PATH "$ENV{ROCM_PATH}" CACHE PATH "ROCm installation root")
endif()

# Free-form parsing and C preprocessing are enabled by hipfort itself, via
# CMAKE_Fortran_FORMAT and CMAKE_Fortran_PREPROCESS in the top-level
# CMakeLists.txt. CMake emits the preprocessing flag each compiler expects
# (-fpp for ifx), so there is no need to add a preprocessing or free-form
# flag here.
