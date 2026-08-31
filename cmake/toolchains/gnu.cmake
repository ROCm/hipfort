# GNU toolchain file for hipfort (GNU Fortran, AMD ROCm backend).
#
# Usage:
#   cmake -S . -B build -DCMAKE_TOOLCHAIN_FILE=cmake/toolchains/gnu.cmake
#
# This is the default configuration used to build hipfort against ROCm.

set(CMAKE_Fortran_COMPILER gfortran CACHE FILEPATH "Fortran compiler")

# find_package(hip) pulls in hip-config.cmake, which requires C and CXX to be
# enabled. The stock gcc/g++ are sufficient: hipfort builds only Fortran module
# files, so no device (.hip) sources are compiled here.
set(CMAKE_C_COMPILER   gcc CACHE FILEPATH "C compiler")
set(CMAKE_CXX_COMPILER g++ CACHE FILEPATH "C++ compiler")

# ROCm root: $ROCM_PATH or hipcc on PATH; override with -DROCM_PATH=.
# Free-form parsing and C preprocessing are enabled by hipfort itself, via
# CMAKE_Fortran_FORMAT and CMAKE_Fortran_PREPROCESS in the top-level
# CMakeLists.txt. CMake emits the preprocessing flag each compiler expects
# (-cpp for gfortran), so there is no need to add a preprocessing or free-form
# flag here.
