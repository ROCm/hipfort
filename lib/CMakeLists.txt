# Copyright (c) 2020-2026 Advanced Micro Devices, Inc. All rights reserved.
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
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

# Sandbox preview of the post-split build.
#
# This directory no longer builds anything itself. After the split there is no
# hipfort: each library's binding is built, installed and exported by the
# library's own repository, so what used to be one glob and one
# libhipfort-amdgcn.a is now thirteen independent subprojects, each producing
# its own archive, its own .mod and its own config package:
#
#   roc::rocblas_fortran   librocblas_fortran.a   rocblas.mod   rocblas-fortran
#   hip::hipfft_fortran    libhipfft_fortran.a    hipfft.mod    hipfft-fortran
#   ...
#
# All this file does is stand in for those thirteen separate builds, so the set
# can be configured at once and tested together. Every <lib>/fortran directory
# below is a standalone CMake project and can equally be configured on its own;
# see any of their CMakeLists.txt, and the "Building one library's binding from
# source" section of docs/how-to/migration-guide.rst.
#
# What is deliberately gone, because it goes away with the split:
#   * the single hipfort-amdgcn archive, and the hipfort::<lib> component
#     targets that fronted it;
#   * find_package(hipfort) and its config/shim, replaced per library by
#     find_package(<lib>-fortran);
#   * the nvptx backend, with the rest of the CUDA support.

# The find_package calls in each subdirectory pass no PATHS, the way they will
# in rocm-systems / rocm-libraries, where the C library is either a sibling in
# the same build or already on CMAKE_PREFIX_PATH. Putting ROCM_PATH there covers
# both those lookups and the transitive find_dependency calls a ROCm package
# config makes for its own dependencies (hipblas-config.cmake, for instance,
# does find_dependency(hipblas-common), which PATHS would not reach).
list(APPEND CMAKE_PREFIX_PATH ${ROCM_PATH})

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/Modules")
include(ROCmFortranBinding)

# The CUDA backend does not survive the split. The packaged bindings are
# generated for ROCm only and carry no USE_CUDA_NAMES branch, so an "nvptx"
# build of these sources would compile cleanly and still bind hip*/roc* symbols.
# Fail loudly rather than hand back a silently wrong archive.
if(HIPFORT_BUILD_NVPTX)
  message(FATAL_ERROR
    "HIPFORT_BUILD_NVPTX is not supported by the packaged bindings: they are "
    "generated for ROCm only and carry no USE_CUDA_NAMES branch, so the archive "
    "would still be bound to hip*/roc* symbols. The CUDA backend is dropped by "
    "the split; see docs/how-to/migration-guide.rst.")
endif()

# These two fold into the tri-state FORTRAN_ARRAY_INTERFACES. Warn rather than
# silently ignore: a script still passing -DHIPFORT_ASSUMED_RANK=ON would
# otherwise get the default interfaces and no hint as to why.
foreach(_old HIPFORT_USE_FPOINTER_INTERFACES HIPFORT_ASSUMED_RANK)
  if(DEFINED ${_old})
    message(WARNING
      "${_old} is gone. The two booleans are replaced by the tri-state "
      "FORTRAN_ARRAY_INTERFACES (none, assumed-shape, assumed-rank); see the "
      "option table in docs/how-to/migration-guide.rst.")
  endif()
endforeach()

# rocSOLVER's module USEs rocBLAS's, so rocBLAS has to be configured first for
# the target to exist when rocSOLVER looks for it. Everything else is
# independent, and the order below is just the reading order.
add_subdirectory(rocm-systems/hip/fortran)
add_subdirectory(rocm-systems/roctx/fortran)

add_subdirectory(rocm-libraries/rocblas/fortran)
add_subdirectory(rocm-libraries/rocsolver/fortran)
add_subdirectory(rocm-libraries/hipblas/fortran)
add_subdirectory(rocm-libraries/hipsolver/fortran)
add_subdirectory(rocm-libraries/rocsparse/fortran)
add_subdirectory(rocm-libraries/hipsparse/fortran)
add_subdirectory(rocm-libraries/rocfft/fortran)
add_subdirectory(rocm-libraries/hipfft/fortran)
add_subdirectory(rocm-libraries/hipfftw/fortran)
add_subdirectory(rocm-libraries/rocrand/fortran)
add_subdirectory(rocm-libraries/hiprand/fortran)
