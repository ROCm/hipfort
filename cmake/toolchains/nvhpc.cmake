# NVIDIA HPC SDK toolchain file for hipfort (nvfortran, NVIDIA/CUDA backend).
#
# Usage:
#   cmake -S . -B build -DCMAKE_TOOLCHAIN_FILE=cmake/toolchains/nvhpc.cmake
#
# NOTE: hipfort selects the NVIDIA code path (USE_CUDA_NAMES) from the platform
# reported by find_package(hip), *not* from this file. To build the CUDA backend
# you must have HIP configured for NVIDIA and CUDA available. Set HIP_PLATFORM
# and ROCM_PATH below (or on the command line) to match your installation.

set(CMAKE_Fortran_COMPILER nvfortran CACHE FILEPATH "NVIDIA Fortran compiler")
set(CMAKE_C_COMPILER       nvc       CACHE FILEPATH "NVIDIA C compiler")
set(CMAKE_CXX_COMPILER     nvc++     CACHE FILEPATH "NVIDIA C++ compiler")

# Select the NVIDIA HIP backend. Adjust the paths to your HIP/CUDA install.
# set(HIP_PLATFORM nvidia    CACHE STRING "HIP platform (amd or nvidia)")
# set(ROCM_PATH    /opt/rocm CACHE PATH   "HIP installation root")

# nvfortran does not implement -march=native the way GNU does; leave the
# portable defaults from cmake/Modules/SetFortranFlags.cmake in place.

# Free-form parsing and C preprocessing are enabled by hipfort itself, via
# CMAKE_Fortran_FORMAT and CMAKE_Fortran_PREPROCESS in the top-level
# CMakeLists.txt. CMake emits the preprocessing flag each compiler expects
# (-Mpreprocess for nvfortran), so there is no need to add a preprocessing or
# free-form flag here.
