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

# Regression test for SWDEV-427498: find_package(hipfort) must work from the
# install prefix (e.g. -DCMAKE_PREFIX_PATH=/opt/rocm), including with the
# multitoolchain layout, where the package files live under
# lib/fortran/<compiler>/cmake/hipfort and a shim at lib/cmake/hipfort forwards
# to them.
#
# Invoked via `cmake -P` with:
#   -DHIPFORT_BUILD_DIR=<hipfort build tree>
#   -DCONSUMER_SRC=<test/find_package>
#   -DWORK_DIR=<scratch dir>
#   -DFORTRAN_COMPILER=<Fortran compiler>
#
# It installs hipfort from the build tree into WORK_DIR/install, then configures
# the consumer against that prefix. Any nonzero exit fails the test.

file(REMOVE_RECURSE "${WORK_DIR}")
set(_prefix "${WORK_DIR}/install")

execute_process(
  COMMAND "${CMAKE_COMMAND}" --install "${HIPFORT_BUILD_DIR}" --prefix "${_prefix}"
  RESULT_VARIABLE _rc OUTPUT_VARIABLE _log ERROR_VARIABLE _log)
if(NOT _rc EQUAL 0)
  message(FATAL_ERROR "cmake --install failed (${_rc}):\n${_log}")
endif()

# The config must be reachable from the prefix at the standard lib/cmake/hipfort.
if(NOT EXISTS "${_prefix}/lib/cmake/hipfort/hipfort-config.cmake")
  message(FATAL_ERROR
    "no hipfort-config.cmake at ${_prefix}/lib/cmake/hipfort (find_package would "
    "not discover hipfort from the install prefix).")
endif()

execute_process(
  COMMAND "${CMAKE_COMMAND}"
          -S "${CONSUMER_SRC}" -B "${WORK_DIR}/consumer"
          -DCMAKE_Fortran_COMPILER=${FORTRAN_COMPILER}
          -DCMAKE_PREFIX_PATH=${_prefix}
  RESULT_VARIABLE _rc OUTPUT_VARIABLE _log ERROR_VARIABLE _log)
message(STATUS "${_log}")
if(NOT _rc EQUAL 0)
  message(FATAL_ERROR "find_package(hipfort) from the install prefix failed (${_rc}):\n${_log}")
endif()
message(STATUS "find_package(hipfort) from the install prefix: OK")
