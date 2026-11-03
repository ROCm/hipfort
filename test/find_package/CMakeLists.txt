###############################################################################
# Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
#
# SPDX-License-Identifier: MIT
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#
###############################################################################

# Minimal consumer for the per-library find_package regression test
# (see run_find_package_test.cmake and SWDEV-427498). It asks for the HIP
# binding only, so it needs no ROCm math library to be installed.
cmake_minimum_required(VERSION 3.18)
project(hipfort_find_package_consumer Fortran C)

find_package(hip-fortran REQUIRED)

# The config must be found through the shim at the standard
# <prefix>/<libdir>/cmake/hip-fortran, <libdir> being the platform's (lib, or
# lib64 on SUSE, RHEL and Fedora), which is what a plain
# -DCMAKE_PREFIX_PATH=<prefix> resolves. The shim then forwards to
# <libdir>/fortran/<compiler>/cmake/hip-fortran, so the config path naming the
# shim is the point of the check rather than an accident.
# HIP_FORTRAN_EXPECTED_CONFIG is that path.
get_filename_component(_found "${hip-fortran_CONFIG}" REALPATH)
get_filename_component(_expected "${HIP_FORTRAN_EXPECTED_CONFIG}" REALPATH)
if(NOT _found STREQUAL _expected)
  message(FATAL_ERROR
    "hip-fortran was found via '${hip-fortran_CONFIG}', but expected "
    "'${HIP_FORTRAN_EXPECTED_CONFIG}', reachable from the install prefix.")
endif()

# The target the shim ultimately has to deliver. Without this the test would
# pass on a prefix where the shim resolves but the per-compiler targets file it
# forwards to is missing or belongs to another toolchain.
if(NOT TARGET hip::hip_fortran)
  message(FATAL_ERROR "find_package(hip-fortran) did not define hip::hip_fortran.")
endif()

message(STATUS "hip-fortran found from the install prefix: ${hip-fortran_CONFIG}")
