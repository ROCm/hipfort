# Changelog for hipfort

## Unreleased

### Added

* Tutorial pages of complete, runnable Fortran programs for rocBLAS and hipBLAS,
  and for rocRAND and hipRAND.
* rocBLAS tests for `nrm2`/`asum`, `iamax`/`iamin`, `ger`, `syrk`/`herk`,
  `symm`/`hemm`, `geam` and `gemm_ex`, and hipBLAS tests for `nrm2`/`asum`,
  `iamax`, `syrk`/`symm`, `trmm`, `geam` and `GemmEx`.
* rocRAND and hipRAND tests for the `mrg32k3a`, `mtgp32` and `sobol32`
  generators and for the Poisson and log-normal distributions.

### Changed

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

### Fixed

* `roctx_range_id_t` is a `uint64_t`, but `hipfort_roctx` declared it
  `integer(c_size_t)`. Both are eight bytes on every platform ROCm supports, so
  this was harmless in practice; it is `integer(c_int64_t)` now.

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
