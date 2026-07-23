# Change Log for hipfort

## (Unreleased)

### Added

* Added Fortran interfaces for the interleaved batch pentadiagonal solver:
  `rocsparse_Xgpsv_interleaved_batch` and
  `rocsparse_Xgpsv_interleaved_batch_buffer_size` (rocSPARSE), and
  `hipsparseXgpsvInterleavedBatch` and
  `hipsparseXgpsvInterleavedBatch_bufferSizeExt` (hipSPARSE), for the `s`, `d`,
  `c`, and `z` precisions, along with the `rocsparse_gpsv_interleaved_alg` enum.
* Added the `hiprandCheck` error-check helper for hipRAND status codes
  (`use hipfort_check`).

### Changed

* On the NVIDIA/CUDA backend (`USE_CUDA_NAMES`), `hipCheck` now compares the
  returned `cudaError_t` directly against `cudaSuccess` instead of translating
  it through `hipCUDAErrorTohipError`; failures report the native status code.

### Removed

* Removed the deprecated `hipfc` compiler wrapper, the `Makefile.hipfort`
  include file, and the `mygpu`/`mymcpu`/`myarchgpu` GPU autodetection
  utilities. Build hipfort-based applications by invoking the Fortran and HIP
  compilers directly and linking against the exported `hipfort::*` CMake
  targets.
* Removed the `rocblas_hgemm_kernel_name`, `rocblas_sgemm_kernel_name`, and
  `rocblas_dgemm_kernel_name` interfaces. The corresponding rocBLAS API
  functions were removed in ROCm 7.1.0.

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
