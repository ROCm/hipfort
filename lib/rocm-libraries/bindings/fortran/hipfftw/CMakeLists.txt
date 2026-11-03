# hipFFTW's Fortran binding (the FFTW3-compatible API).
#
# After the split this is bindings/fortran/hipfft/CMakeLists.txt in
# rocm-libraries, where hipFFT's project builds hipFFTW's binding too: hipFFTW
# ships with hipFFT. It is a project of its own, built against the installed
# library, which TheRock builds after the library itself. It stands alone
# because the shipped .mod only matches the compiler ROCm built it with: on any
# other compiler you rebuild just this binding against an installed ROCm,
# without rebuilding hipFFT itself.
#
#   cmake -S bindings/fortran/hipfft -B build/hipfftw-fortran \
#     -DCMAKE_Fortran_COMPILER=gfortran -DCMAKE_PREFIX_PATH=/opt/rocm
#
# Compiling hipfftw.F90 needs only a Fortran compiler: it is self-contained
# Fortran and references neither the C headers nor the .so, which resolve when
# the application links.

cmake_minimum_required(VERSION 3.18..4.0 FATAL_ERROR)

if(CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
  # C is enabled because hipfft-config.cmake pulls in FindThreads.
  project(hipfftw-fortran LANGUAGES Fortran C)
  # In rocm-libraries this helper comes from rocm-cmake, as
  #   find_package(ROCmCMakeBuildTools REQUIRED)
  # The sandbox keeps it in hipfort's tree instead.
  list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/../../../../../cmake/Modules")
endif()

include(ROCmFortranBinding)

rocm_fortran_require_c_package(hipfft)

# The FFTW3-compatible symbols live in a separate libhipfftw in some ROCm
# versions and are folded into libhipfft in others. Prefer the dedicated target
# when the installed hipFFT exports one.
if(TARGET hip::hipfftw)
  set(_hipfftw_c_target hip::hipfftw)
else()
  set(_hipfftw_c_target hip::hipfft)
endif()

rocm_add_fortran_binding(
  LIBRARY   hipfftw
  NAMESPACE hip
  SOURCE    hipfftw.F90
  C_PACKAGE hipfft
  C_TARGET  ${_hipfftw_c_target})
