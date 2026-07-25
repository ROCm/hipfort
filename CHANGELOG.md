# Change Log for hipfort

## (Unreleased)

### Added

* **hipFFTW support.** Added Fortran interfaces to the FFTW3-compatible hipFFTW
  library, in new `hipfort_hipfftw` modules, plus a `hipfort::hipfftw` CMake target.
* **Regenerated all Fortran bindings** against the ROCm 7.14.0 API. This covers the
  HIP runtime and every math library. It exposes the functions and enums added since
  the last release in hipBLAS, rocBLAS, hipSPARSE, rocSPARSE, hipSOLVER, rocSOLVER,
  and the HIP runtime. The Doxygen documentation from the C headers is now carried
  onto the Fortran interfaces and onto derived-type fields. The interfaces are up to
  date for use with ROCm 7.14.0.
* Added the rocSOLVER generalized symmetric/Hermitian eigensolver interfaces
  `?sygvdx`/`?hegvdx`.
* Added the rocSOLVER ILP64 (`*_64`) eigenvalue interfaces.
* Added the `[C, ldC]` output arguments to the non-strided hipBLAS TRMM interfaces,
  to match the current hipBLAS API.
* Added Fortran interfaces for the interleaved batch pentadiagonal solver:
  `rocsparse_Xgpsv_interleaved_batch` and
  `rocsparse_Xgpsv_interleaved_batch_buffer_size` (rocSPARSE), and
  `hipsparseXgpsvInterleavedBatch` and
  `hipsparseXgpsvInterleavedBatch_bufferSizeExt` (hipSPARSE), for the `s`, `d`,
  `c`, and `z` precisions, plus the `rocsparse_gpsv_interleaved_alg` enum.
* Added the `hiprandCheck` error-check helper for hipRAND status codes
  (`use hipfort_check`).
* Added example CMake toolchain files in `cmake/toolchains/`, for amdflang, GNU,
  Intel `ifx`/`ifort`, Cray, and NVHPC. Select one with `-DCMAKE_TOOLCHAIN_FILE`
  to build hipfort with a different Fortran compiler or backend.

### Changed

* **Scalar output arguments are now passed by reference.** Interfaces that return a
  single value through a pointer now take a plain `integer`/`real` scalar, instead
  of a `type(c_ptr), value`. This covers `hipDeviceGetAttribute`, `hipDeviceTotalMem`,
  the `*_bufferSize`/`*_bufferSizeExt` queries, and the version and descriptor
  getters. Call them directly, for example
  `istat = hipDeviceGetAttribute(value, attr, dev)`, with no `C_LOC(value)`. Existing
  code that passes `C_LOC(x)` to these routines must now pass `x`.
* Derived types are emitted in per-library `hipfort_<lib>_types` modules. A module is
  generated only when a binding references one of its types. Unreferenced complex,
  half, and bfloat16 struct mirrors are no longer emitted.
* **CUDA/NVIDIA backend (`-DUSE_CUDA_NAMES`).** This build targets NVIDIA machines
  that have the CUDA toolkit but no HIP/ROCm libraries, so the interfaces bind
  directly to the CUDA libraries. Every `cu*` binding is now validated against the
  real CUDA libraries. Interfaces with no CUDA equivalent are compiled for AMD only,
  instead of binding a symbol that does not exist. This includes the regular
  `hipSOLVER` API, the legacy `hipSPARSE` API (removed in CUDA 12), some batched
  `hipBLAS` extensions, and a few HIP runtime and hipRAND calls.
* hipfort now installs its libraries and Fortran module files into toolchain-specific
  subdirectories, `lib/fortran/<compiler>` and `include/fortran/<compiler>`, so
  several Fortran toolchains can coexist. This is controlled by the new
  `HIPFORT_MULTITOOLCHAIN_LAYOUT` CMake option (`ON` by default). The exported
  `hipfort::*` targets resolve the paths automatically.
* Updated the `rocblas_?trmm` interfaces to match the current rocBLAS API.
* Updated the rocFFT `set_scale_factor` interface.
* Refined generic (overload) resolution in the generated bindings.
* On the NVIDIA/CUDA backend (`USE_CUDA_NAMES`), `hipCheck` now compares the returned
  `cudaError_t` directly against `cudaSuccess`, instead of translating it through
  `hipCUDAErrorTohipError`. Failures report the native status code.

### Fixed

* `hipGetDeviceProperties` now binds the `hipGetDevicePropertiesR0600` symbol, which
  matches the ROCm 6.0+ `hipDeviceProp_t` layout. It previously bound the legacy
  symbol, whose older layout produced wrong device-property field values.
* `fftw_iodim64` members now use `c_ptrdiff_t` instead of `c_long`, matching FFTW's
  `ptrdiff_t` fields. This gives the correct struct layout on LLP64 platforms such
  as Windows.

### Removed

* Removed the deprecated `hipfc` compiler wrapper, the `Makefile.hipfort` include
  file, and the `mygpu`/`mymcpu`/`myarchgpu` GPU autodetection utilities. Build
  hipfort-based applications by invoking the Fortran and HIP compilers directly, and
  link against the exported `hipfort::*` CMake targets.
* Removed the `rocblas_hgemm_kernel_name`, `rocblas_sgemm_kernel_name`, and
  `rocblas_dgemm_kernel_name` interfaces. The corresponding rocBLAS API functions
  were removed in ROCm 7.1.0.
* Removed the unused legacy `lib/modules-amdgcn` modules (`hip_blas`,
  `rocblas_module`, `rocfft`, `rocsparse_module`, and related enum modules).

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
