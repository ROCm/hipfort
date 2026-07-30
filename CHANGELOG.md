# Change Log for hipfort

## hipfort 0.8.0 for ROCm 7.14.0 (Unreleased)

### Added

* **Regenerated all Fortran bindings** against the ROCm 7.14.0 API. This covers the
  HIP runtime and every math library. It exposes the functions and enums added since
  the last release in rocBLAS, hipBLAS, rocSPARSE, hipSPARSE, rocSOLVER, hipSOLVER,
  rocFFT, hipFFT, rocRAND, hipRAND, and the HIP runtime, and carries the Doxygen
  documentation from the C headers onto the Fortran interfaces and derived-type fields.
* **hipFFTW support.** Added Fortran interfaces to the FFTW3-compatible hipFFTW
  library, in new `hipfort_hipfftw` modules, plus a `hipfort::hipfftw` CMake target.
* Notable new interfaces surfaced by the regeneration: the rocSOLVER generalized
  symmetric/Hermitian eigensolvers `?sygvdx`/`?hegvdx`, the rocSOLVER ILP64 (`*_64`)
  eigenvalue interfaces, and the interleaved batch pentadiagonal solver
  (`rocsparse_Xgpsv_interleaved_batch`/`hipsparseXgpsvInterleavedBatch`, `s/d/c/z`,
  with the `rocsparse_gpsv_interleaved_alg` enum).
* Expanded the test suite from 32 to 266 tests. Added rocRAND, hipFFT and hipFFTW
  tests, and widened rocSOLVER coverage from 3 to 62 tests (including the `info`
  device-pointer routines). The 14 new hipFFT tests mirror the rocFFT round-trip
  tests: C2C 1D in single and double precision, R2C/C2R 1D in single and double
  precision, C2C 2D and 3D, and batched C2C 1D via `hipfftPlanMany`, each written
  in both the Fortran 2003 and Fortran 2008 interface styles.
* Added the `hiprandCheck` error-check helper for hipRAND status codes
  (`use hipfort_check`).
* Added example CMake toolchain files in `cmake/toolchains/`, for amdflang and GNU.
  Select one with `-DCMAKE_TOOLCHAIN_FILE` to build hipfort with a different Fortran
  compiler or backend.
* Documented how to build hipfort applications with CMake, in the *Using hipFORT*
  how-to guide. It covers `find_package(hipfort)`, the exported `hipfort::*` targets,
  and the multiple-Fortran-toolchain install layout.
* Added a *rocFFT examples* documentation page that walks through complete Fortran
  programs for complex-to-complex, real, multi-dimensional, batched, and out-of-place
  transforms, scale factors, work buffers, HIP streams, plan introspection, the
  compiled-kernel cache, and the version query. The page includes the test sources
  directly, so the documented code is the code that is built and run by CTest.
* Added rocFFT tests for in-place real transforms (padded layout with explicit
  `rocfft_array_type_real`/`rocfft_array_type_hermitian_interleaved`), out-of-place
  transforms, plan scale factors, explicit work buffers
  (`rocfft_plan_get_work_buffer_size`, `rocfft_execution_info_set_work_buffer`),
  transforms on user-supplied HIP streams (`rocfft_execution_info_set_stream`),
  plan introspection (`rocfft_plan_get_print`), the compiled-kernel cache
  (`rocfft_cache_serialize`, `rocfft_cache_deserialize`,
  `rocfft_cache_buffer_free`), and `rocfft_get_version_string`, in both the
  `f2003` and `f2008` dialects.

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
* **Breaking: rocSOLVER `info` is now a device pointer.** The `info` output is written
  on the GPU, so these routines now take a `type(c_ptr)` that points to device memory,
  instead of a host `integer`. Allocate it with `hipMalloc` and pass the device
  pointer. Code that passed a host integer no longer compiles. This affects `getrf`,
  `getri`, `potrf`, `sytrf`, `gesv`, `posv`, `syev`, `heev`, `trtri`, and the related
  factorization and eigenvalue routines.
* The TRMM interfaces (rocBLAS and hipBLAS) now include the out-of-place `[C, ldc]`
  output arguments, matching the current API.
* **CUDA/NVIDIA backend (`-DUSE_CUDA_NAMES`).** This build targets NVIDIA machines
  that have the CUDA toolkit but no HIP/ROCm libraries, so the interfaces bind directly
  to the CUDA libraries. Every `cu*` binding is now validated against the real CUDA
  libraries, and interfaces with no CUDA equivalent are compiled for AMD only instead
  of binding a symbol that does not exist (the regular hipSOLVER API, the legacy
  hipSPARSE API removed in CUDA 12, some batched hipBLAS extensions, and a few HIP
  runtime and hipRAND calls). `hipCheck` now compares the returned `cudaError_t`
  directly against `cudaSuccess` instead of translating it through
  `hipCUDAErrorTohipError`; failures report the native status code.
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
