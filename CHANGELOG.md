# Changelog for hipfort

## (Unreleased)

### Added

* CMake option `HIPFORT_USE_FPOINTER_INTERFACES` to control the Fortran 2008 array interfaces (`USE_FPOINTER_INTERFACES`).
It defaults to `ON` when the compiler supports Fortran 2008; set `-DHIPFORT_USE_FPOINTER_INTERFACES=OFF` to build with the plain Fortran 2003 `type(c_ptr)` interfaces only, for an old compiler or one whose Fortran 2008 support is buggy.
`hipfort` now also probes for Fortran 2018 support at configure time: `HIPFORT_ASSUMED_RANK` is gated on it (and on `HIPFORT_USE_FPOINTER_INTERFACES`). Without a Fortran 2018 compiler it warns and falls back to the per-rank Fortran 2008 interfaces instead of failing the build; with `-DHIPFORT_USE_FPOINTER_INTERFACES=OFF` there are no array interfaces at all, only the plain Fortran 2003 `type(c_ptr)` ones.
* Experimental Fortran 2018 assumed-rank array interfaces, enabled with the `-DHIPFORT_ASSUMED_RANK=ON` CMake option (guarded by `USE_ASSUMED_RANK_INTERFACES`).
When enabled, each array generic is backed by a single `dimension(..)` overload that accepts an actual of any rank.
The overloads are mutually exclusive with the classic per-rank interfaces.
Only contiguous arrays may be passed.
* CMake option `HIPFORT_EXTENDED_TESTS` (default `OFF`) that links each backend
static archive into a shared library with `-Wl,--whole-archive` and
`-Wl,--no-undefined`, failing on any unresolved symbol. It is opt-in because it
needs a recent, fully installed ROCm (amdgcn) or CUDA (nvptx) stack with every
math library present to be certain it passes; each backend's test is skipped when
its libraries are not found. Override the library directories with
`HIPFORT_ROCM_LIB_DIR` / `HIPFORT_CUDA_LIB_DIR`.

### Changed

* The per-backend static archives are now cleaned to contain only the symbols
their backend can resolve. `libhipfort-amdgcn.a` no longer includes
`hipfort_cuda_errors` (the CUDA `cudaError_t` enum, referenced only under
`USE_CUDA_NAMES`), and `libhipfort-nvptx.a` no longer includes the AMD-only
rocBLAS / rocSOLVER / rocSPARSE / rocFFT / rocRAND API modules (whose `roc*`
symbols have no CUDA equivalent). Each archive can therefore be turned into a
shared library against its own backend's libraries alone, with no dangling
symbols. The `roc*_enums` modules stay in both backends. They define only
`enum, bind(c)` constants that `hipfort_check` uses regardless of backend.

### Fixed

* Test executables no longer fail to link with compilers whose driver defaults to
  `--as-needed`, such as `gfortran` on Ubuntu. `libhipfort-amdgcn.a` is shared by
  every `hipfort::` component, so CMake placed it after the ROCm shared libraries
  and the linker discarded them before the archive referenced their symbols. They
  are now build-interface dependencies of the archive, which puts the archive first.

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
