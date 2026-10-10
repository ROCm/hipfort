# Changelog for hipfort

## hipfort 0.10.0 for ROCm 10.1.0

### Added

* Regenerated all Fortran bindings against the ROCm 10.1 API, adding 59
  routines.
* Added seven ROCTx entry points to `hipfort_roctx`: `roctxProfilerPause`,
  `roctxProfilerResume`, `roctxGetThreadId` and the `roctxName*` family.
* Added the status name to the `hipfort_check` error message for every library,
  for example `HIPBLAS ERROR: HIPBLAS_STATUS_INVALID_VALUE (code 3)`.
* Added CMake option `HIPFORT_BUILD_AMDGCN` (default `ON`), the counterpart of
  `HIPFORT_BUILD_NVPTX`: `-DHIPFORT_BUILD_AMDGCN=OFF` gives a CUDA-only build.
* Added CMake option `HIPFORT_CODE_COVERAGE` (default `OFF`) for a gcov coverage
  report of the tests.
* Tutorial pages for rocBLAS, hipBLAS, rocRAND and hipRAND, and a *Fortran
  interface variants* how-to page.

### Changed

* **Breaking.** Code written for hipfort 0.9.0 that does any of the following
  must be updated:
  * `hipsolverRfBatchSetupHost`, `hipsolverRfBatchResetValues` and
    `hipsolverRfBatchSolve` take their array of host pointers as
    `type(c_ptr), value`: pass `c_loc(arr)`. **Passing `arr(1)` still compiles
    but now gives wrong results.**
  * Calling a `bind(C)` routine by its `<routine>_` name, such as
    `hipGetDevice_`, with a variable where the C API takes a pointer: call the
    generic name, or pass `c_loc`.
  * Passing a variable as hipSOLVER `devInfo` with `type(c_ptr)` buffers, as
    `nev` of `rocsolver_{c,z}hegvdx`, or as `alpha`/`tau` of
    `rocsolver_?larfg`/`?larf`: pass a device pointer.
  * Passing an element such as `dTau(1)` as `tau` to the hipSOLVER array
    overloads, or a scalar or `c_loc(dims)` as `dims` to the hipFFTW guru
    planners: pass the array.
  * Passing an address as `nev` and a variable as `lwork` to
    `hipsolverDsyevdx_bufferSize`: pass two variables or two addresses.
  * Passing a `character(kind=c_char)` array to `hipfort_roctx`: pass `c_loc`
    of it.
* Arguments the C API takes by pointer (pointer-mode `alpha`, `beta` and
  results of the BLAS and sparse libraries, host outputs such as buffer sizes
  and getters) accept either the Fortran variable or its address. Passing an
  address makes the device pointer mode usable:

  ```fortran
  st = rocblas_daxpy(handle, n, alpha, dx, incx, dy, incy)
  st = rocblas_daxpy(handle, n, c_loc(alpha), dx, incx, dy, incy)
  ```

  Each form is also available by name, as `<routine>_typed` and, for the
  rocSPARSE and hipSPARSE routines that take both `alpha`/`beta` and a host
  output, `<routine>_devptr`.
* `hipfort_roctx` now binds the rocprofiler-sdk ROCTx API instead of the legacy
  roctracer one. Its string arguments take a `character(kind=c_char)` string
  terminated by `c_null_char`, or a `type(c_ptr)`. It is now AMD-only.
* The hipFFTW guru planners now take `dims` and `howmany_dims` as
  `type(fftw_iodim)`/`type(fftw_iodim64)` arrays in every precision.
* Installation now follows `GNUInstallDirs` instead of a literal `lib`.
* The package now requires `hip-runtime-amd >= 6.0.0`.

### Removed

* **Breaking.** Removed the array overloads of `hipfftGetProperty`, whose
  `value` is a scalar: pass an integer.
* Removed `rocblas_set_optimal_device_memory_size_impl` and
  `rocblas_device_malloc_alloc`, variadic C helpers that Fortran cannot call.

### Fixed

* Fixed wrong byte counts in the array overloads of `hipMalloc`, `hipMemcpy` and
  related routines for more than 2^31 - 1 elements.
* Fixed the array overloads of `hipFree` and `hipHostFree`, which passed a wrong
  address when the lower bounds are not 1.
* Fixed the `source`/`dsource` forms of `hipMalloc`, `hipMallocManaged` and
  `hipHostMalloc`, which copied after a failed allocation and hid the failure.
* Fixed arguments passed the wrong way:
  * the device pointer arrays of `rocblas_?{tr,tp}mv_batched`;
  * `nev` of `rocsolver_{c,z}hegvdx`, and `alpha` and `tau` of
    `rocsolver_?larfg`/`?larf`;
  * `coloring` and `reordering` of the `csrcolor` array overloads;
  * the eight-byte integer overloads of the BLAS `Set`/`Get` `Vector`/`Matrix`
    routines on Windows.
* Fixed rocSPARSE's nullable `error` arguments, which are now `optional`.
* Fixed `c_funloc(kernel)` and similar constants requiring a text relocation in
  PIE executables.
* Fixed the `USE_CUDA_NAMES` bindings, whose enumerator values, entry points and
  structure layouts now match CUDA.
* Fixed the DEB package, which lacked the `find_package(hipfort)` config files,
  and `hipfort::hipblas`, which was skipped when ROCm was outside the default
  CMake prefixes.
* Fixed the compiler flags for NVHPC with `-DBUILD_NATIVE=ON` and for Intel in
  Release builds.

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
