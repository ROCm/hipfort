# HPE Cray toolchain file for hipfort (Cray Fortran via the ftn wrapper).
#
# On a Cray system, load the relevant environment modules first (for example
# PrgEnv-cray and rocm), then configure with:
#   cmake -S . -B build -DCMAKE_TOOLCHAIN_FILE=cmake/toolchains/cray.cmake
#
# The Cray compiler drivers (ftn/cc) forward to the underlying compilers and
# already know about the system headers and libraries.

set(CMAKE_Fortran_COMPILER ftn CACHE FILEPATH "Cray Fortran wrapper")
set(CMAKE_C_COMPILER       cc  CACHE FILEPATH "Cray C wrapper")

# cmake/Modules/SetFortranFlags.cmake already special-cases the Cray compiler,
# so no extra Fortran flags are needed here. Ensure ROCM_PATH points at the
# ROCm install (usually provided by the 'rocm' environment module).
if(NOT DEFINED ROCM_PATH AND DEFINED ENV{ROCM_PATH})
  set(ROCM_PATH "$ENV{ROCM_PATH}" CACHE PATH "ROCm installation root")
endif()

# Free-form parsing and C preprocessing are enabled by hipfort itself, via
# CMAKE_Fortran_FORMAT and CMAKE_Fortran_PREPROCESS in the top-level
# CMakeLists.txt. CMake emits the preprocessing flag each compiler expects
# (-eZ for the Cray compiler), so there is no need to add a preprocessing or
# free-form flag here.
