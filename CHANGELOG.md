# Changelog for hipfort

## Unreleased

### Added

* `hipfort_check`: every `<lib>Check` routine now reports a failing status by
  name, then its code, for example
  `HIPBLAS ERROR: HIPBLAS_STATUS_INVALID_VALUE (code 3)` instead of
  `HIPBLAS ERROR: code = 3`. The names come from each library's status enum, so
  this covers the libraries with no to-string function of their own (hipFFT,
  hipRAND, hipSOLVER, rocFFT, rocRAND, rocSOLVER) and adds no link dependency:
  `hipfort_check` still references no library symbol. A build with
  `USE_CUDA_NAMES` keeps printing the code only, since CUDA statuses do not
  follow the HIP values. `hipCheck` now compares against `hipSuccess`, from
  `hipError_t`, rather than `HIP_SUCCESS`, from a legacy four-entry enum; both
  are 0.
* Tutorial pages of complete, runnable Fortran programs for rocBLAS and hipBLAS,
  and for rocRAND and hipRAND.
* rocBLAS tests for `nrm2`/`asum`, `iamax`/`iamin`, `ger`, `syrk`/`herk`,
  `symm`/`hemm`, `geam` and `gemm_ex`, and hipBLAS tests for `nrm2`/`asum`,
  `iamax`, `syrk`/`symm`, `trmm`, `geam` and `GemmEx`.
* rocRAND and hipRAND tests for the `mrg32k3a`, `mtgp32` and `sobol32`
  generators and for the Poisson and log-normal distributions.
* CMake option `HIPFORT_BUILD_AMDGCN` (default `ON`), the mirror of
  `HIPFORT_BUILD_NVPTX`, controlling whether the ROCm (`amdgcn`) backend archive
  is built. `-DHIPFORT_BUILD_AMDGCN=OFF` gives a CUDA-only build; until now that
  archive was produced unconditionally and there was no way to skip it. Setting
  both options to `OFF` is a configure error.

  The two remain independent switches rather than one backend selector.
  `HIPFORT_BUILD_NVPTX` defaults to `ON`, so reading it as a selector would mean
  every default build -- with no option passed at all -- stopped producing
  `libhipfort-amdgcn.a`.

### Changed

* **Breaking, for anyone compiling the `.F90` by hand.** The preprocessor macros
  that select the array interfaces are renamed, and each now selects its own
  tier: `USE_ASSUMED_SHAPE` for the per-rank overloads (Fortran 2008) and
  `USE_ASSUMED_RANK` for the single `dimension(..)` form (Fortran 2018). They
  replace `USE_FPOINTER_INTERFACES` and `USE_ASSUMED_RANK_INTERFACES`.

  The old pair was a trap. `USE_FPOINTER_INTERFACES` was a master switch whose
  name said nothing about arrays, and `USE_ASSUMED_RANK_INTERFACES` was read
  only inside it, so asking for assumed-rank alone -- the macro whose name is
  exactly what you want -- produced no overloads at all. The generic kept only
  its `type(c_ptr)` specific and the caller got "no specific function for the
  generic" with nothing to explain it. The two are still mutually exclusive,
  because an assumed-rank dummy is not distinguishable by rank from the per-rank
  specifics, but that is now expressed as `#ifdef`/`#else` rather than nesting.

  The CMake options are unchanged: `HIPFORT_USE_FPOINTER_INTERFACES` and
  `HIPFORT_ASSUMED_RANK` still mean what they meant, and a build that goes
  through CMake needs no change.

* **Breaking.** `hipfort_roctx` is generated rather than hand-written, and its
  `const char*` arguments are now `type(c_ptr)` like every other `char*` argument
  in hipfort, instead of `character(kind=c_char) :: message(*)`. Code that passed
  a Fortran string must pass a C pointer to a NUL-terminated,
  `character(kind=c_char)` array target:

  ```fortran
  character(kind=c_char), dimension(6), target :: msg = &
      [c_char_"z", c_char_"o", c_char_"n", c_char_"e", c_null_char, c_null_char]
  ret = roctxRangePush(c_loc(msg))
  ```

  This removes the last per-library exception in the binding generator: ROCTx was
  the only module in `lib/hipfort/` that exposed `char*` as a Fortran string.
* `hipfort_roctx` is generated from `rocprofiler-sdk-roctx/roctx.h`, the header
  behind the package `hipfort::roctx` actually links, rather than the legacy
  `roctracer/roctx.h`. It binds twelve entry points instead of five, adding
  `roctxProfilerPause`, `roctxProfilerResume`, `roctxGetThreadId` and the
  `roctxName{OsThread,HsaAgent,HipDevice,HipStream}` family.
  `roctx_version_major` and `roctx_version_minor` are gone: they exist only in the
  legacy header, and the library hipfort links does not export them.
* `hipfort_roctx` joins the AMD-only set of modules: it now compiles code that
  calls the ROCTx entry points, which do not exist on a CUDA system, so
  `libhipfort-nvptx.a` drops it alongside the `roc*` API modules.
* The `hipMalloc` and `hipMemcpy` interface variants moved off the *hipFORT
  examples* tutorial page onto a new *Fortran interface variants* how-to page,
  which also documents the experimental Fortran 2018 assumed-rank mode. The
  tutorial section now holds only pages of complete programs for a specific
  library.
* **Breaking, two routines.** `hipFuncGetAttribute` and
  `hipDeviceGetP2PAttribute` take their `value` output as `integer(c_int)` by
  reference, matching the C `int*` and every sibling getter
  (`hipGetDeviceFlags`, `hipGraphNodeGetEnabled`, …). They were the only two
  declaring it `type(c_ptr), value`. A caller passing `c_loc(x)` must now pass
  `x` itself.

### Removed

* **Breaking, two routines.** `hipfort_rocblas` no longer declares
  `rocblas_set_optimal_device_memory_size_impl` and
  `rocblas_device_malloc_alloc`. Both are variadic in C, Fortran cannot express
  `...`, and the interfaces dropped it — so the variable arguments could never
  be passed, and calling a variadic function through a fixed-arity prototype is
  undefined on the x86-64 SysV ABI regardless. They are internal helpers backing
  the C++ `rocblas_device_malloc` wrapper and have no Fortran use.

### Fixed

* The array overloads of `hipMalloc`, `hipMallocManaged`, `hipHostMalloc`,
  `hipMemcpy`, `hipMemcpyAsync` and `hipHostRegister` computed byte counts as
  `int(size(x), c_size_t)`. `size` returns a default integer, so the element
  count overflowed before the conversion for arrays of more than 2^31 - 1
  elements (16 GiB of `real(c_double)`), and the call received a wrong size.
  They use `size(x, kind=c_size_t)` now.
* The rank 1 to 7 overloads of `hipFree` and `hipHostFree` passed
  `c_loc(ptr(1,...,1))` to the C call, which is the base of the allocation only
  when every lower bound is 1. A pointer from `hipMalloc(..., lbounds=)`, or one
  remapped with `ptr(0:,0:) => ptr`, was freed through an address inside the
  allocation rather than the one the allocator returned. ROCm happens to resolve
  such an address to its allocation and free it, but HIP and CUDA both document
  that the pointer must be the one the allocation returned. They pass
  `c_loc(ptr)` now, like the rank 0 overloads already did.
* `roctx_range_id_t` is a `uint64_t`, but `hipfort_roctx` declared it
  `integer(c_size_t)`. Both are eight bytes on every platform ROCm supports, so
  this was harmless in practice; it is `integer(c_int64_t)` now.
* The eight-byte integer overloads of the BLAS `SetVector`/`GetVector` and
  `SetMatrix`/`GetMatrix` families, and their `Async` variants, declared their
  array `integer(c_long)`, which is eight bytes only on LP64. They are
  `integer(c_int64_t)` now, the width those overloads already promise by passing
  an element size of `8` to the underlying C call. No change on Linux, where the
  two kinds coincide; on an LLP64 target `c_long` is four bytes, so the overload
  misstated its element size and also became indistinguishable from the
  four-byte one, which makes a compiler reject the enclosing generic outright.
* Fixed every failing test reporting success. 413 failure branches across 271 test
  programs ended in a bare `call exit`, which returns a zero exit status under
  gfortran, so a program could print `FAILED!` and still be recorded as passing by
  CTest. They now use `call exit(1)`. This uncovered 27 tests that were failing
  silently, notably `gesvdj` in all four precisions, `gels`, `zgetrf`, `zgeqrf`,
  `zpotrf`, and the rocSPARSE `sptrsv`/`sptrsm` pair.
* Fixed `hipfort::hipblas` being silently skipped when ROCm is installed outside
  CMake's default search prefixes. `ROCM_PATH` is now added to `CMAKE_PREFIX_PATH`,
  so the `find_dependency(hipblas-common)` that `hipblas-config.cmake` performs
  resolves as well; `PATHS` alone applies only to the `find_package` call that
  names it and is not propagated to a package's own dependency lookups.
* Fixed factual errors across the tutorial pages, where the prose contradicted
  the bindings or the program it showed, and added the rocBLAS, hipBLAS, rocRAND
  and hipRAND pages to the documentation landing page, which listed only nine of
  the thirteen tutorials.
* Fixed incorrect reference data and weak checks in the test programs the
  tutorials show. Most notably the `getrf` and `getf2` reference matrices were
  transposed by a spurious `reshape(..., order=(/2,1/))`, so those programs
  printed `FAILED!` on every run.

## hipfort 0.9.0 for ROCm 10.0.0

### Added

* Regenerated all Fortran bindings against the ROCm 10.0 API. This covers the HIP
  runtime and every math library, and exposes the functions, enumerators, and
  structures added since ROCm 7.14.0.
* Added `hipfort_rocrand_types`, a new module holding the rocRAND `uint4` and
  `rocrand_discrete_distribution_st` derived types.
* Added the `hipCpuDeviceId` and `hipInvalidDeviceId` device-id constants to
  `hipfort_enums`.
* Tutorial pages of complete, runnable Fortran programs for the HIP runtime, hipFFT,
  hipFFTW, hipSOLVER, rocSOLVER, hipSPARSE and rocSPARSE, a ROCTx page with its
  supported-API table, and documentation of the rocFFT callbacks.
* Experimental Fortran 2018 assumed-rank array interfaces, enabled with
  `-DHIPFORT_ASSUMED_RANK=ON`. Each array generic is then backed by a single
  `dimension(..)` overload accepting an actual of any rank;
  it is mutually exclusive with the classic per-rank interfaces, and only
  contiguous arrays may be passed.
* CMake option `HIPFORT_BUILD_NVPTX` (default `ON`) that controls whether the CUDA
  (nvptx) backend archive is built. `-DHIPFORT_BUILD_NVPTX=OFF` skips
  `libhipfort-nvptx` on ROCm-only systems, halving the build time.

### Changed

* hipfort no longer enables the C++ language. It is pure Fortran (C is enabled only
  because `hip-config.cmake` pulls in `FindThreads`), so a C++ compiler is no longer
  required to build it, and the bundled toolchain files no longer set
  `CMAKE_CXX_COMPILER`.
* Each per-backend archive now contains only the symbols its backend can resolve:
  `libhipfort-amdgcn.a` drops `hipfort_cuda_errors` and `libhipfort-nvptx.a`
  drops the AMD-only `roc*` API modules.

### Removed

* **Breaking.** `hipfort_rocsolver` no longer binds the eight rocSOLVER
  compatibility aliases: `rocsolver_create_handle`, `rocsolver_destroy_handle`,
  `rocsolver_set_stream`, `rocsolver_get_stream`, `rocsolver_set_vector`,
  `rocsolver_get_vector`, `rocsolver_set_matrix` and `rocsolver_get_matrix`.
  Each is a redirection to the rocBLAS routine of the same name, carries an
  upstream deprecation attribute, and lives in `rocsolver-aliases.h`, whose
  banner reads "THESE ALIASES ARE NOT MAINTAINED ANYMORE ... USE ROCBLAS TYPES
  AND FUNCTIONS DIRECTLY". Replace `rocsolver_` with `rocblas_` in the call: all
  eight targets are already bound in `hipfort_rocblas`, so nothing else changes.
  Note the aliases are still exported by `librocsolver.so`, so this is a
  source-level change only.

  Recorded after the fact. The binding disappeared in this release as a
  side effect of regenerating rocSOLVER, and went out with no entry here.

### Fixed

* Fixed several HIP derived types that had been emitted as opaque byte blobs
  now expose their named scalar fields (`resType`, `size`, `flags`, ...)
  alongside a correctly sized filler for the embedded C unions, so the
  layout stays exact.

## hipfort 0.8.0 for ROCm 7.14.0

### Added

* **Regenerated all Fortran bindings** against the ROCm 7.14.0 API. This covers the
  HIP runtime and every math library. It exposes the functions and enums added since
  the last release in rocBLAS, hipBLAS, rocSPARSE, hipSPARSE, rocSOLVER, hipSOLVER,
  rocFFT, hipFFT, rocRAND, hipRAND, and the HIP runtime, and carries the Doxygen
  documentation from the C headers onto the Fortran interfaces and derived-type fields.
* Added Fortran interfaces to the FFTW3-compatible hipFFTW library,
  in new `hipfort_hipfftw` modules, plus a `hipfort::hipfftw` CMake target.
* Added the `hiprandCheck` error-check helper for hipRAND status codes (`use hipfort_check`).
* Added example CMake toolchain files in `cmake/toolchains`.
  Select one with `-DCMAKE_TOOLCHAIN_FILE` to build hipfort with a different Fortran
  compiler or backend.
* Documented how to build hipfort applications with CMake, in the *Using hipFORT*
  how-to guide. It covers `find_package(hipfort)`, the exported `hipfort::*` targets,
  and the multiple-Fortran-toolchain install layout.
* Added a *rocFFT examples* documentation page that walks through complete Fortran
  programs for complex-to-complex, real, multi-dimensional, batched, and out-of-place
  transforms, scale factors, work buffers, HIP streams, plan introspection, the
  compiled-kernel cache, and the version query.

### Changed

* **Breaking: host scalar output arguments are now passed by reference.** Interfaces
  that write a single value into host memory through a pointer now take a plain
  `integer`/`real` scalar, instead of a `type(c_ptr), value`. This covers
  `hipDeviceGetAttribute`, `hipDeviceTotalMem`, `hipStreamGetDevice`, the
  `*_bufferSize`/`*_bufferSizeExt` queries, and the version and descriptor getters.
  Call them directly, for example `istat = hipDeviceGetAttribute(value, attr, dev)`,
  with no `C_LOC(value)`; existing code that passes `C_LOC(x)` must now pass `x`.
  Outputs that live on the device, such as rocSOLVER `info`, remain `type(c_ptr)`
  device pointers.
* hipfort now installs its libraries and Fortran module files into toolchain-specific
  subdirectories, `lib/fortran/<compiler>` and `include/fortran/<compiler>`, so several
  Fortran toolchains can coexist. This is controlled by the new
  `HIPFORT_MULTITOOLCHAIN_LAYOUT` CMake option (`ON` by default). The exported
  `hipfort::*` targets resolve the paths automatically.

### Removed

* Removed the deprecated `hipfc` compiler wrapper, the `Makefile.hipfort` include file,
  and the `mygpu`/`mymcpu`/`myarchgpu` GPU autodetection utilities. Build
  hipfort-based applications by invoking the Fortran and HIP compilers directly, and
  link against the exported `hipfort::*` CMake targets.
* Removed the `rocblas_hgemm_kernel_name`, `rocblas_sgemm_kernel_name`, and
  `rocblas_dgemm_kernel_name` interfaces. The corresponding rocBLAS API functions were
  removed in ROCm 7.1.0.
* Removed the unused legacy `lib/modules-amdgcn` modules (`hip_blas`, `rocblas_module`,
  `rocfft`, `rocsparse_module`, and related enum modules).

### Fixed

* `hipGetDeviceProperties` now binds the `hipGetDevicePropertiesR0600` symbol, which
  matches the ROCm 6.0+ `hipDeviceProp_t` layout. It previously bound the legacy
  symbol, whose older layout produced wrong device-property field values.
* Batched rocBLAS, hipBLAS, and rocSOLVER routines now pass their array of device
  pointers by value. The array holds device pointers and lives on the device, so it is
  passed directly, not by reference.
* `use hipfort` now re-exports the host-register helpers (`hipHostRegister`,
  `hipHostGetDevicePointer`, `hipHostUnregister`); they previously required an
  explicit `use hipfort_hiphostregister`.

## hipfort 0.7.1 for ROCm 7.1.0

### Added

* Support for building with CMake 4.0.

### Resolved issues

* Fixed a potential integer overflow issue in `hipMalloc` interfaces.

## hipfort 0.7.0 for ROCm 7.0.0

### Added

* Added documentation clarifying how hipfort is built for the NVIDIA
  platform. Thanks [@fluidnumerics-joe](https://github.com/fluidnumerics-joe)!

### Changed

* Updated and reorganized documentation for clarity and consistency.

## hipfort 0.6.0 for ROCm 6.4.0

### Upcoming changes

* The hipfc compiler wrapper has been deprecated and will be removed
  in a future release. Users are encouraged to directly invoke their
  Fortran or HIP compilers as appropriate for each source file.

## hipfort 0.5.1 for ROCm 6.3.2

### Added

* Support for building with LLVM Flang

### Resolved issues

* Fixed the exported `hipfort::hipsparse` CMake target

## hipfort 0.5.0 for ROCm 6.3.0

### Added

* Added roctx to the hipfort interfaces

### Changed

* Updated the hipsolver bindings

## hipfort 0.4-0 for ROCm 6.0.1

### Resolved issues

- Included hipfort-config.cmake in the deb and rpm packages

## hipfort 0.4-0 for ROCm 6.0.0

### Additions

- Added an exported hipfort-config.cmake with the following targets:
  - `hipfort::hip`
  - `hipfort::rocblas`
  - `hipfort::hipblas`
  - `hipfort::rocfft`
  - `hipfort::hipfft`
  - `hipfort::rocsolver`
  - `hipfort::hipsolver`
  - `hipfort::rocrand`
  - `hipfort::hiprand`
  - `hipfort::rocsparse`
  - `hipfort::hipsparse`

## hipfort 0.4-0 for ROCm 5.7.0

### Additions

- Added `rocm_agent_enumerator` fallback for hipfc architecture autodetection

### Changes

- Updated documentation to use the Sphinx toolchain and publish to ReadTheDocs
- Updated `HIP_PLATFORM` from 'nvcc' to 'nvidia'

## hipfort 0.4-0 for ROCm 5.6.0

### Additions

- Added hipfc architecture autodetection for gx1101 devices

## hipfort 0.4-0 for ROCm 5.5.0

### Fixes

- Fixed hipfc architecture autodetection for gfx90a devices that were
  previously unrecognized
