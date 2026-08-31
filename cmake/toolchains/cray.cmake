# HPE Cray toolchain file for hipfort (Cray Fortran via the ftn wrapper).
#
# On a Cray system, load the relevant environment modules first (for example
# PrgEnv-cray and rocm), then configure with:
#   cmake -S . -B build -DCMAKE_TOOLCHAIN_FILE=cmake/toolchains/cray.cmake
#
# The Cray compiler drivers (ftn/cc/CC) forward to the underlying compilers and
# already know about the system headers and libraries.

set(CMAKE_Fortran_COMPILER ftn CACHE FILEPATH "Cray Fortran wrapper")
set(CMAKE_C_COMPILER       cc  CACHE FILEPATH "Cray C wrapper")
set(CMAKE_CXX_COMPILER     CC  CACHE FILEPATH "Cray C++ wrapper")

# cmake/Modules/SetFortranFlags.cmake already special-cases the Cray compiler,
# so no extra Fortran flags are needed here. The ROCm root comes from the 'rocm'
# environment module.
# Free-form parsing and C preprocessing are enabled by hipfort itself, via
# CMAKE_Fortran_FORMAT and CMAKE_Fortran_PREPROCESS in the top-level
# CMakeLists.txt. CMake emits the preprocessing flag each compiler expects
# (-eZ for the Cray compiler), so there is no need to add a preprocessing or
# free-form flag here.
