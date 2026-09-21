# NVIDIA HPC SDK toolchain file for hipfort (nvfortran, NVIDIA/CUDA backend).
#
# Usage:
#   cmake -S . -B build -DCMAKE_TOOLCHAIN_FILE=cmake/toolchains/nvhpc.cmake
#
# NOTE: this toolchain only selects the NVIDIA HPC compilers. When HIP_PLATFORM
# is not "amd" and both CUDA and the nvptx archive are available, hipfort
# exports the hip* component targets (hipfort::hip, hipfort::hipblas, ...)
# linked against the CUDA libraries; the roc* components and the FFTW3 API have
# no CUDA counterpart. The hipfort-config.cmake package config, however, is
# still generated for the AMD platform only, so find_package(hipfort) does not
# resolve the CUDA backend. Set HIP_PLATFORM/ROCM_PATH below to match your
# installation.

set(CMAKE_Fortran_COMPILER nvfortran CACHE FILEPATH "NVIDIA Fortran compiler")
set(CMAKE_C_COMPILER       nvc       CACHE FILEPATH "NVIDIA C compiler")

# Select the NVIDIA HIP backend. Adjust the paths to your HIP/CUDA install.
# set(HIP_PLATFORM nvidia    CACHE STRING "HIP platform (amd or nvidia)")
# set(ROCM_PATH    <hip-root> CACHE PATH   "HIP installation root")

# nvfortran does not implement -march=native the way GNU does; leave the
# portable defaults from cmake/Modules/SetFortranFlags.cmake in place.

# Free-form parsing and C preprocessing are enabled by hipfort itself, via
# CMAKE_Fortran_FORMAT and CMAKE_Fortran_PREPROCESS in the top-level
# CMakeLists.txt. CMake emits the preprocessing flag each compiler expects
# (-Mpreprocess for nvfortran), so there is no need to add a preprocessing or
# free-form flag here.
