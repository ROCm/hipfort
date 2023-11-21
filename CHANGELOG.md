# Change Log for hipfort

## hipfort for ROCm 6.0.0
### Added
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


## hipfort for ROCm 5.7.0
### Added
- Added `rocm_agent_enumerator` fallback for hipfc architecture autodetection

### Changed
- Updated documentation to use the Sphinx toolchain and publish to ReadTheDocs
- Updated `HIP_PLATFORM` from 'nvcc' to 'nvidia'


## hipfort for ROCm 5.7.0
### Added
- Added hipfc architecture autodetection for gx1101 devices


## hipfort for ROCm 5.5.0
### Fixed
- Fixed hipfc architecture autodetection for gfx90a devices that were
  previously unrecognized
