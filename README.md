# hipfort: Fortran interfaces to HIP and the ROCm libraries

> [!WARNING]
> hipFORT is deprecated. It is maintained through the ROCm 10.x series and removed in ROCm 11.0.
> From ROCm 10.3, ROCm ships Fortran bindings for HIP, ROCTx and the math libraries itself,
> one module and one CMake package per library (`use hip`, `use rocblas`, `find_package(rocblas-fortran)`).
> See the [migration guide](https://rocm.docs.amd.com/projects/hipfort/en/latest/how-to/migration-guide.html).

hipfort provides Fortran interfaces to the HIP runtime and the ROCm libraries:

* **HIP runtime and tooling:** HIP runtime, ROCTx
* **HIP math libraries (`hip*`):** hipBLAS, hipFFT, hipFFTXt, hipRAND, hipSOLVER, hipSPARSE
* **FFTW3-compatible interface:** hipFFTW
* **ROCm math libraries (`roc*`):** rocBLAS, rocFFT, rocRAND, rocSOLVER, rocSPARSE

The interfaces are derived from ROCm 10.2.0. They take `type(c_ptr)` arguments, and
with a Fortran 2008 compiler, hipfort also provides interfaces that take Fortran
arrays directly.

## Documentation

> [!NOTE]
> The published hipfort documentation is available at [hipfort](https://rocm.docs.amd.com/projects/hipfort/en/latest/index.html) in an organized, easy-to-read format, with search and a table of contents. The documentation source files reside in the hipfort/docs folder of this repository. As with all ROCm projects, the documentation is open source. For more information, see [Contribute to ROCm documentation](https://rocm.docs.amd.com/en/latest/contribute/contributing.html).

It covers:

* [Installing hipfort](https://rocm.docs.amd.com/projects/hipfort/en/develop/install/install.html), including the CMake options, the toolchain files and the tests
* [Using hipfort](https://rocm.docs.amd.com/projects/hipfort/en/develop/how-to/using-hipfort.html): linking with and without CMake, and the supported API of each library
* [The Fortran interfaces](https://rocm.docs.amd.com/projects/hipfort/en/develop/how-to/fortran-interfaces.html): Fortran 2003, Fortran 2008 and the experimental assumed-rank interfaces
* [Using hipfort with OpenMP offload](https://rocm.docs.amd.com/projects/hipfort/en/develop/how-to/openmp-offload.html)

## Build and test hipfort from source

Install `git`, `cmake`, HIP, a Fortran compiler, and a matching C compiler, if not yet
installed. `amdflang`/`amdclang` (ROCm's LLVM Flang and Clang, bundled with ROCm) is the
recommended default, and `gfortran`/`gcc` (version 7.5.0 or newer) is also supported.
Then build, install, and test hipfort from source with the commands below:

```shell
git clone https://github.com/ROCm/hipfort.git
cd hipfort
cmake -S . -B build -DCMAKE_INSTALL_PREFIX=/tmp/hipfort -DHIPFORT_BUILD_NVPTX=OFF -DBUILD_TESTING=ON
cmake --build build
cmake --install build
ctest --test-dir build
```

The tests need an AMD GPU and the libraries listed above, from your ROCm installation.

## Using hipfort with CMake

hipfort exports one CMake target per library (such as `hipfort::hip`, `hipfort::rocblas`,
and `hipfort::hipblas`):

```cmake
# C is required by the CMake package of HIP, which finds Threads.
project(my_app LANGUAGES Fortran C)

find_package(hipfort REQUIRED COMPONENTS hip hipblas)
add_executable(my_app main.f08)
target_link_libraries(my_app PRIVATE hipfort::hipblas hipfort::hip)
```

List each library you use as a `COMPONENTS` entry. On Linux, also link with
`-Wl,--gc-sections` to keep only the wrappers you call. See
[Using hipfort](https://rocm.docs.amd.com/projects/hipfort/en/develop/how-to/using-hipfort.html) for the details and for building without CMake.

Please [open an issue](https://github.com/ROCm/hipfort/issues) if you run into problems.

## License

hipfort is licensed under the MIT license. See [LICENSE](LICENSE).
