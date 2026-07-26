# hipfort: Fortran Interface For GPU Kernel Libraries

This repository contains the source and testing for hipfort.  
This is a FORTRAN interface library for accessing GPU Kernels.

## Documentation

> [!NOTE]
> The published hipfort documentation is available at [hipfort](https://rocm.docs.amd.com/projects/hipfort/en/latest/index.html) in an organized, easy-to-read format, with search and a table of contents. The documentation source files reside in the hipfort/docs folder of this repository. As with all ROCm projects, the documentation is open source. For more information, see [Contribute to ROCm documentation](https://rocm.docs.amd.com/en/latest/contribute/contributing.html).

## Build and test hipfort from source

Install `git`, `cmake`, HIP, and a Fortran compiler, if not yet installed. `amdflang`
(ROCm's LLVM Flang, bundled with ROCm) is the recommended default; `gfortran` (version
7.5.0 or newer) is also supported.
Then build, install, and test hipfort from source with the commands below:

```shell
git clone https://github.com/ROCm/hipfort.git
cd hipfort
cmake -S . -B build -DCMAKE_INSTALL_PREFIX=/tmp/hipfort -DBUILD_TESTING=ON
cmake --build build
cmake --install build
ctest --test-dir build
```

### Toolchain files

Example CMake toolchain files are provided in [`cmake/toolchains`](cmake/toolchains)
to select the Fortran compiler and backend without setting cache variables by
hand. Pass one with `-DCMAKE_TOOLCHAIN_FILE`:

```shell
cmake -S . -B build -DCMAKE_TOOLCHAIN_FILE=cmake/toolchains/amdflang.cmake
```

| Toolchain file | Compiler | Backend |
| -------------- | ---------- | ------- |
| `amdflang.cmake` | `amdflang` (ROCm LLVM Flang) | AMD ROCm (**recommended default**) |
| `gnu.cmake`    | `gfortran` | AMD ROCm |
| `intel.cmake`  | `ifx` (Intel LLVM) | AMD ROCm |
| `intel-classic.cmake` | `ifort` (EOL) | AMD ROCm |
| `cray.cmake`   | Cray `ftn` | AMD ROCm |
| `nvhpc.cmake`  | `nvfortran` | NVIDIA/CUDA |

Copy any of these as a starting point for your own site-specific toolchain.

## Fortran interfaces

`hipfort` provides interfaces to the following HIP and ROCm libraries:

* **HIP:**   HIP runtime, hipBLAS, hipSPARSE, hipFFT, hipFFTW, hipRAND, hipSOLVER
* **ROCm:** rocBLAS, rocSPARSE, rocFFT, rocRAND, rocSOLVER

While the HIP interfaces and libraries allow to write portable code, the ROCm ones 
can only be used with AMD devices.

The available interfaces depend on the Fortran compiler that is used to compile the `hipfort` modules and libraries.
As the interfaces make use of the `iso_c_binding` module, the minimum requirement is a Fortran compiler 
that supports the Fortran 2003 standard (`f2003`).
These interfaces typically require to pass `type(c_ptr)` variables and the number of bytes to memory
management (e.g. `hipMalloc`) and math library routines (e.g. `hipblasDGEMM`).
`gfortran` is the primary tested compiler, and AMD's `amdflang` (LLVM Flang) is also supported.
Other standard-conforming Fortran compilers such as NVIDIA `nvfortran`, Intel `ifx`/`ifort`, and the
Cray Fortran compiler (for example on LUMI) are not officially supported, but `hipfort` should
build with them too. Please [open an issue](https://github.com/ROCm/hipfort/issues) if you run into problems.

If your compiler understands the Fortran 2008 (`f2008`) code constructs that occur in `hipfort`'s source and test files, 
additional interfaces are compiled into the `hipfort` modules and libraries. 
These directly take Fortran (array) variables and the number of
elements instead of `type(c_ptr)` variables and the number of bytes, respectively. 
Therefore, they reduce the chance to introduce compile-time and runtime errors
into your code and makes it easier to read too.
These additional interfaces are guarded by the `USE_FPOINTER_INTERFACES` preprocessor
definition, which `hipfort` enables automatically once it detects Fortran 2008 support
in your compiler. By convention, application and test sources that rely on them use the
`.f08` file extension (see the `test/f2008` examples), while Fortran 2003 sources use `.f03`.

> **NOTE**: If you plan to use the `f2008` interfaces, we recommend `gfortran` version `7.5.0` or newer
as we have observed problems with older versions.

### Example

While you could write the following using the `f2003` interfaces:

```Fortran
use iso_c_binding
use hipfort
integer     :: ierr        ! error code
real        :: a_h(5,6)    ! host array
type(c_ptr) :: a_d         ! device array pointer
!
ierr = hipMalloc(a_d,size(a_h)*4_c_size_t) ! real has 4 bytes
                                           ! append suffix '_c_size_t' to write '4' 
                                           ! as 'integer(c_size_t)'
ierr = hipMemcpy(a_d,c_loc(a_h),size(a_h)*4_c_size_t,hipMemcpyHostToDevice)
```

you could express the same with the `f2008` interfaces as follows:

```Fortran
use hipfort
integer     :: ierr        ! error code
real        :: a_h(5,6)    ! host array
real,pointer :: a_d(:,:)   ! device array pointer
!
ierr = hipMalloc(a_d,shape(a_h))      ! or hipMalloc(a_d,[5,6]) or hipMalloc(a_d,5,6) or hipMalloc(a_d,mold=a_h)
ierr = hipMemcpy(a_d,a_h,size(a_h),hipMemcpyHostToDevice)
```

The `f2008` interfaces also overload `hipMalloc` similar to the Fortran 2008 `ALLOCATE` intrinsic. 
So you could write the whole code as shown below:

```Fortran
integer     :: ierr        ! error code
real        :: a_h(5,6)    ! host array
real,pointer :: a_d(:,:)   ! device array pointer
!
ierr = hipMalloc(a_d,source=a_h)       ! take shape (incl. bounds) of a_h and perform a blocking copy to device
```

In addition to `source`, there is also `dsource` in case the source is a device array.

### Supported HIP and ROCm API

The current batch of HIPFORT interfaces is derived from ROCm 7.14.0.
The following tables list the supported API:

* [HIP](https://github.com/ROCm/hipfort/blob/develop/docs/doxygen/input/supported_api_hip.md)
* [hipBLAS](https://github.com/ROCm/hipfort/blob/develop/docs/doxygen/input/supported_api_hipblas.md)
* [hipFFT](https://github.com/ROCm/hipfort/blob/develop/docs/doxygen/input/supported_api_hipfft.md)
* [hipFFTW](https://github.com/ROCm/hipfort/blob/develop/docs/doxygen/input/supported_api_hipfftw.md)
* [hipRAND](https://github.com/ROCm/hipfort/blob/develop/docs/doxygen/input/supported_api_hiprand.md)
* [hipSOLVER](https://github.com/ROCm/hipfort/blob/develop/docs/doxygen/input/supported_api_hipsolver.md)
* [hipSPARSE](https://github.com/ROCm/hipfort/blob/develop/docs/doxygen/input/supported_api_hipsparse.md)
* [rocBLAS](https://github.com/ROCm/hipfort/blob/develop/docs/doxygen/input/supported_api_rocblas.md)
* [rocFFT](https://github.com/ROCm/hipfort/blob/develop/docs/doxygen/input/supported_api_rocfft.md)
* [rocRAND](https://github.com/ROCm/hipfort/blob/develop/docs/doxygen/input/supported_api_rocrand.md)
* [rocSOLVER](https://github.com/ROCm/hipfort/blob/develop/docs/doxygen/input/supported_api_rocsolver.md)
* [rocSPARSE](https://github.com/ROCm/hipfort/blob/develop/docs/doxygen/input/supported_api_rocsparse.md)

You may further find it convenient to directly use the search function on
[HIPFORT's documentation page](https://rocm.docs.amd.com/projects/hipfort/en/latest/) to get information on the arguments of an interface

## Limitations

* **NVIDIA/CUDA backend (`-DUSE_CUDA_NAMES`).** This build targets NVIDIA machines that
  have the CUDA toolkit but no HIP/ROCm libraries, so the interfaces bind directly to the
  CUDA libraries (cuBLAS, cuSOLVER, ...) instead of HIP. Coverage is not complete:
  interfaces with no CUDA equivalent (the regular hipSOLVER API, the legacy hipSPARSE API,
  some hipBLAS extensions, and a few HIP runtime and hipRAND calls) are compiled for AMD
  only.

## Linking against hipfort

To use hipfort in your project, invoke your Fortran and HIP compilers directly and
link against the appropriate ROCm libraries. hipfort provides exported CMake targets
(such as `hipfort::hip`, `hipfort::rocblas`, and `hipfort::hipblas`) to make this
straightforward:

```cmake
find_package(hipfort REQUIRED)
add_executable(my_app main.f08)
target_link_libraries(my_app PRIVATE hipfort::hipblas hipfort::hip)
```

## Examples and tests

The examples, which simultaneously serve as tests, are located in the 
`f2003` and `f2008` subdirectories of the repo's `test/` folder.
Both test collections implement the same tests but require
that the used Fortran compiler supports at least the respective Fortran standard.
There are further subcategories per `hip*` or `roc*` library that is tested.

### Building and running the tests

The tests are driven by CTest. Configure the build with `-DBUILD_TESTING=ON`,
build hipfort, and run the suite with `ctest`.

> **NOTE**: Running the tests requires that all ROCm math libraries can be found at `/opt/rocm`.
Specify a different ROCm location via the `ROCM_PATH` environment variable.

```shell
cmake -S. -Bbuild -DCMAKE_INSTALL_PREFIX=/tmp/hipfort -DBUILD_TESTING=ON
cmake --build build
ctest --test-dir build
```

To run a single test, pass its name to `ctest` via the `-R` filter, for example:

```shell
ctest --test-dir build -R hipfort_test_f2008_hipblas_dgemm
```

## Copyright, License, and Disclaimer

<A NAME="Copyright">

Copyright (c) 2020-2026 Advanced Micro Devices, Inc. All rights reserved.
[MITx11 License]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
