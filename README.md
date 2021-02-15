hipfort: Fortran Interface For GPU Kernel Libraries
===================================================

This repository contains the source and testing for hipfort.  
This is a FORTRAN interface library for accessing GPU Kernels.

## Build and test hipfort from source

Install `gfortran`, `git`, `cmake`, and HIP, if not yet installed.
Then build, install, and test hipfort from source with the commands below:
```
git clone https://github.com/ROCmSoftwarePlatform/hipfort
mkdir build ; cd build
cmake -DHIPFORT_INSTALL_DIR=/tmp/hipfort ..
make install
export PATH=/tmp/hipfort/bin:$PATH
cd ../test/f2003/vecadd
hipfc -v hip_implementation.cpp main.f03
./a.out
```

The above steps demonstrate the use of the `hipfc` utility. `hipfc` calls `hipcc` for non-Fortran files and then
compiles the Fortran files and links to the object file created by `hipcc`.

## hipfc wrapper compiler and Makefile.hipfort

Aside from Fortran interfaces to the HIP and ROCm GPU libraries, hipfort ships the `hipfc` wrapper compiler
and a `Makefile.hipfort` that can be included into a project's build system. Both are located in the `bin/` subdirectory
of the repository. While both can be configured via a number of environment variables, `hipfc` also understands a greater number of 
command line options that you can print to screen via `hipfc -h`. 

Among the environment variables, the most important are:

| Variable | Description | Default |
|---|---|---|
| `HIP_PLATFORM` | The platform to compile for (either 'amd' or 'nvcc') | `amd` |
| `ROCM_PATH` | Path to CUDA installation | `/opt/rocm` |
| `CUDA_PATH` | Path to ROCm installation | `/usr/local/cuda` | 
| `HIPFORT_COMPILER` | Fortran compiler to be used | `gfortran` | 

## Examples and tests

The examples, which simultaneously serve as tests, are located in the 
`f2003` and `f2008` subdirectories of the repo's `test/` folder.
Both test collections implement the same tests but require
that the used Fortran compiler supports at least the respective Fortran standard.
There are further subcategories per `hip*` or `roc*` library that is tested.

### Building a single test

> **NOTE** Only the `hip*` tests can be compiled for CUDA devices. The `roc*` tests cannot.

> **NOTE** The AMD GPU make targets append the correct libraries to the `CFLAGS` variable internally.

To compile for AMD devices you can simply call `make` in the test directories.

If you want to compile for CUDA devices, you need to build as follows:
```
make CFLAGS="--offload-arch=sm_70 <libs>"
```
where you must substitute `<libs>` by `-lcublas`, `-lcusparse`, ... as needed.
Compilation typically boils down to calling `hipfc` as follows:

```
hipfc <CFLAGS> <test_name>.f03 -o <test_name>
```

The `vecadd` test is the exception as the additional HIP C++ source must be supplied too:

```
hipfc <CFLAGS> hip_implementation.cpp main.f03 -o main
```

### Building and running all tests

You can build and run the whole test collection from the `build/` folder (see [Build and test hipfort from source](#build-and-test-hipfort-from-source)) or
from the `test/` folder. The instructions are given below.

#### AMD GPUs

> **NOTE**: Running all tests as below requires that all ROCm math libraries can be found at `/opt/rocm`.
Specify a different ROCm location via the `ROCM_PATH` environment variable.

> **NOTE**: When using older ROCm versions, you might need to manually set the environment variable `HIP_PLATFORM` to `hcc`
before running the tests.

```
cd build/
make all-tests-run
```

Alternatively:

```
cd test/
make run_all
```

#### NVIDIA GPUs

> **NOTE**: Running all tests as below requires that CUDA can be found at `/usr/local/cuda`. Specify a different CUDA location via the `CUDA_PATH` environment variable
> or supply it to the `CFLAGS` variable by appending `-cuda-path <path_to_cuda>`.

> **NOTE**: Choose offload architecture value according to used device.

```
cd build/
make all-tests-run CFLAGS="--offload-arch=sm_70 -lcublas -lcusolver -lcufft"
```

Alternatively:

```
cd test/
make run_all CFLAGS="--offload-arch=sm_70 -lcublas -lcusolver -lcufft"
```

## Copyright, License, and Disclaimer

<A NAME="Copyright">

Copyright (c) 2021 Advanced Micro Devices, Inc. All rights reserved.
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
