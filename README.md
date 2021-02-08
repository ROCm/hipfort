hipfort: Fortran Interface For GPU Kernel Libraries
===================================================

This repository contains the source and testing for hipfort.  
This is a FORTRAN interface library for accessing GPU Kernels.

## Build and test hipfort from source

Install gfortran, git, cmake, and hip, if not yet installed.
Then build, install, and test hipfort from source with these commands.
```
git clone https://github.com/ROCmSoftwarePlatform/hipfort
mkdir build ; cd build
cmake -DHIPFORT_INSTALL_DIR=/tmp/hipfort ..
make install
export PATH=/tmp/hipfort/bin:$PATH
cd ../test/f2003/vecadd
hipfc -v hip_implementation.cpp main.f03
./a.out
cd ../../f2008/vecadd
hipfc -v hip_implementation.cpp main.f03
./a.out
```

The above steps demonstrate the use of the hipfc utility. hipfc calls hipcc for non-Fortran files and then
compiles the Fortran files and links to the object file created by hipcc.

## TESTS/Examples

Tests can be run from the `cmake` `build` folder 
or directly from the repo's `test` subfolder.

### AMD GPUs

```
cd build/
make all-tests-run
```

Alternatively:

```
cd test/
make run_all
```

### NVIDIA GPUs

```
cd build/
make all-tests-run CFLAGS="--offload-arch=sm_70 -lcublas -lcusolver -lcufft"
```

Alternatively:

```
cd test/
make run_all CFLAGS="--offload-arch=sm_70 -lcublas -lcusolver -lcufft"
```

| **NOTE**: Choose offload architecture value according to used device.

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
