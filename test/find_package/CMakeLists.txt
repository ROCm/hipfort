# Minimal consumer for the hipfort find_package regression test
# (see run_find_package_test.cmake and SWDEV-427498). It only checks that
# find_package(hipfort) is discoverable from the install prefix, so it requests
# no components and needs no ROCm math libraries.
cmake_minimum_required(VERSION 3.18)
project(hipfort_find_package_consumer Fortran)

find_package(hipfort REQUIRED)

# The config must be found at the standard <prefix>/lib/cmake/hipfort — either the
# real config (flat layout) or the shim that forwards to the toolchain-specific
# one (multitoolchain layout). This is exactly what find_package resolves from a
# plain -DCMAKE_PREFIX_PATH=<prefix>.
if(NOT hipfort_CONFIG MATCHES "/lib/cmake/hipfort/hipfort-config.cmake$")
  message(FATAL_ERROR
    "hipfort was found via '${hipfort_CONFIG}', but expected the standard "
    "lib/cmake/hipfort location reachable from the install prefix.")
endif()
message(STATUS "hipfort found from the install prefix: ${hipfort_CONFIG}")
