# AMD toolchain file for hipfort (amdflang, AMD ROCm backend).
#
# This is the recommended default: amdflang is the LLVM-based Fortran compiler
# shipped with ROCm.
#
# Usage:
#   cmake -S . -B build -DCMAKE_TOOLCHAIN_FILE=cmake/toolchains/amdflang.cmake
#
# The ROCm compilers are looked up on PATH. Set $ROCM_PATH or -DROCM_PATH= if
# your install is elsewhere.

set(CMAKE_Fortran_COMPILER amdflang   CACHE FILEPATH "Fortran compiler")
set(CMAKE_C_COMPILER       amdclang   CACHE FILEPATH "C compiler")

# Free-form parsing and C preprocessing are enabled by hipfort itself, via
# CMAKE_Fortran_FORMAT and CMAKE_Fortran_PREPROCESS in the top-level
# CMakeLists.txt. CMake emits the preprocessing flag each compiler expects
# (-cpp for amdflang), so there is no need to add a preprocessing or free-form
# flag here.
