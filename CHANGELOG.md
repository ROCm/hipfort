# Changelog for hipfort

## Unreleased

### Resolved issues

* Fixed the build of the tests with the HPE Cray Fortran compiler: the
  `pointer_attributes` tests compare addresses in a way it accepts.
* The Cray compiler no longer warns that `hipfort_check` may use its status name
  unallocated (ftn-7206), nor, when building hipfort and its tests, that a scope
  uses a module twice (ftn-878, which the standard allows: the modules re-export
  their enums).
* The `find_package` test looks for the installed `hipfort-config.cmake` under
  the platform's libdir (`lib64` on SUSE, RHEL and Fedora), where it is
  installed, rather than under `lib`. The rocBLAS `caxpy_typed` test compares
  with a relative tolerance, which a fused multiply-add on the GPU meets.

## hipfort 0.7.2 for ROCm 7.13.0

### Added

* Regenerated all Fortran bindings against the ROCm 7.13 API.
* This release is a backport to ROCm 7.13. If possible, upgrade directly to
  ROCm 10.2 and the hipfort release for it instead, to limit the disruption.

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
