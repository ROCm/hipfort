# hipfort tests

The test programs are grouped by Fortran standard: `f2003/`, `f2008/`, `f2018/`,
plus `openmp/`. Each subdirectory holds one directory per ROCm library, plus
`vecadd/` in `f2003/` and `f2008/`, which pairs a Fortran driver with a HIP C++
kernel. Tests are registered in `CMakeLists.txt` and run through CTest.

Sources use the extension matching their standard, `.f03` and `.f08`, except
`f2018/` and `openmp/`, which use `.f90`. No Fortran driver recognizes a `.f18`
suffix without compiler-dependent flags.

Build and run them the usual way:

```bash
cmake -S . -B build -DBUILD_TESTING=ON
cmake --build build -j
cd build && ctest --output-on-failure
```

The `f2018/` tests are only registered when the experimental assumed-rank
interfaces are enabled with `-DHIPFORT_ASSUMED_RANK=ON`.

Besides the per-library programs, `CMakeLists.txt` also registers the
`find_package(hipfort)` install regression test (`find_package/`) and the
`check_line_length.sh` source lint.

Two more test groups are gated as well. The exhaustive per-library symbol tests
(`f2003/<lib>/test_<lib>.F03`, auto-generated files that reference every
`bind(c)` routine of a library) and the shared-link checks are opt-in with
`-DHIPFORT_EXTENDED_TESTS=ON` (off by default): they need a complete ROCm (or
CUDA) install and turn any missing symbol into a build error. The runtime
library directories they link against can be overridden with
`-DHIPFORT_ROCM_LIB_DIR=` and `-DHIPFORT_CUDA_LIB_DIR=`.

The `openmp/` tests need OpenMP offload, so they are only built with LLVM Flang
(`amdflang`) and a host LAPACK for the reference result; any other toolchain
skips them silently, while under LLVM Flang a missing GPU or LAPACK skips them
with an explicit reason. The offload target defaults to `native` and is
overridden with `-DHIPFORT_OFFLOAD_ARCH=gfxNNN`.

## check_compilers.sh

Fortran `.mod` files are not portable between compilers, and `HIPFORT_ASSUMED_RANK`
changes which interfaces are compiled, so each combination needs its own build.
`check_compilers.sh` does that for every compiler it finds, using the toolchain
files in `cmake/toolchains`:

```bash
bash test/check_compilers.sh                  # every compiler found, both variants
bash test/check_compilers.sh gnu amdflang     # only these toolchains
bash test/check_compilers.sh --build-only     # skip ctest, no GPU needed
bash test/check_compilers.sh --no-assumed-rank
BUILD_ROOT=/tmp/hf bash test/check_compilers.sh
```

Compilers that are not installed are skipped, and the run degrades to build-only
when no GPU is visible. It exits non-zero if any available configuration fails.
Builds land in `build/compilers/<label>` with a log per configuration.

This is the local equivalent of the CI compiler matrix, so a CI failure can be
reproduced without going through Jenkins.
