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

# Minimal consumer for the hipfort find_package regression test
# (see run_find_package_test.cmake and SWDEV-427498). It only checks that
# find_package(hipfort) is discoverable from the install prefix, so it requests
# no components and needs no ROCm math libraries.
cmake_minimum_required(VERSION 3.18)
project(hipfort_find_package_consumer Fortran)

find_package(hipfort REQUIRED)

# The config must be found at <prefix>/<libdir>/cmake/hipfort, <libdir> being the
# platform's (lib, or lib64 on SUSE, RHEL and Fedora) — either the real config
# (flat layout) or the shim that forwards to the toolchain-specific one
# (multitoolchain layout). This is exactly what find_package resolves from a
# plain -DCMAKE_PREFIX_PATH=<prefix>. HIPFORT_EXPECTED_CONFIG is that path.
get_filename_component(_found "${hipfort_CONFIG}" REALPATH)
get_filename_component(_expected "${HIPFORT_EXPECTED_CONFIG}" REALPATH)
if(NOT _found STREQUAL _expected)
  message(FATAL_ERROR
    "hipfort was found via '${hipfort_CONFIG}', but expected "
    "'${HIPFORT_EXPECTED_CONFIG}', reachable from the install prefix.")
endif()
message(STATUS "hipfort found from the install prefix: ${hipfort_CONFIG}")
