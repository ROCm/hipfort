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
# so no extra Fortran flags are needed here. The ROCm root comes from the 'rocm'
# environment module.
# Free-form parsing and C preprocessing are enabled by hipfort itself, via
# CMAKE_Fortran_FORMAT and CMAKE_Fortran_PREPROCESS in the top-level
# CMakeLists.txt. CMake emits the preprocessing flag each compiler expects
# (-eT for the Cray compiler, -eZ before CCE 8.5), so there is no need to add a
# preprocessing or free-form flag here.
