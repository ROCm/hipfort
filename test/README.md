# hipfort tests

The test programs are grouped by Fortran standard: `f2003/`, `f2008/`, `f2018/`,
plus `openmp/`. Each subdirectory holds one directory per ROCm library. Tests are
registered in `CMakeLists.txt` and run through CTest.

Sources use the extension matching their standard, `.f03` and `.f08`, except
`f2018/`, which uses `.f90`. No Fortran driver recognizes a `.f18` suffix without
compiler-dependent flags.

Build and run them the usual way:

```bash
cmake -S . -B build -DBUILD_TESTING=ON
cmake --build build -j
cd build && ctest --output-on-failure
```

The `f2018/` tests are only registered when the experimental assumed-rank
interfaces are enabled with `-DHIPFORT_ASSUMED_RANK=ON`.

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
