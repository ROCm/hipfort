# Minimal consumer for the per-library find_package regression test
# (see run_find_package_test.cmake and SWDEV-427498). It asks for the HIP
# binding only, so it needs no ROCm math library to be installed.
cmake_minimum_required(VERSION 3.18)
project(hipfort_find_package_consumer Fortran C)

find_package(hip-fortran REQUIRED)

# The config must be found through the shim at the standard
# <prefix>/lib/cmake/hip-fortran, which is what a plain
# -DCMAKE_PREFIX_PATH=<prefix> resolves. The shim then forwards to
# lib/fortran/<compiler>/cmake/hip-fortran, so the config path naming the shim
# is the point of the check rather than an accident.
if(NOT "${hip-fortran_CONFIG}" MATCHES "/lib/cmake/hip-fortran/hip-fortran-config.cmake$")
  message(FATAL_ERROR
    "hip-fortran was found via '${hip-fortran_CONFIG}', but expected the standard "
    "lib/cmake/hip-fortran location reachable from the install prefix.")
endif()

# The target the shim ultimately has to deliver. Without this the test would
# pass on a prefix where the shim resolves but the per-compiler targets file it
# forwards to is missing or belongs to another toolchain.
if(NOT TARGET hip::hip_fortran)
  message(FATAL_ERROR "find_package(hip-fortran) did not define hip::hip_fortran.")
endif()

message(STATUS "hip-fortran found from the install prefix: ${hip-fortran_CONFIG}")
