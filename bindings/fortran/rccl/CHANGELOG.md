# Changelog for the RCCL Fortran binding

## Unreleased

### Added

* Generated Fortran bindings for the RCCL API, as a single `rccl` module: `use rccl`, link
  `roc::rccl_fortran`. A standalone CMake project in `bindings/fortran/rccl`, built against an
  installed RCCL. Controlled by `BUILD_FORTRAN_BINDINGS` (`ON` on Linux, `OFF` on Windows, where
  ROCm ships no Fortran compiler), `FORTRAN_ARRAY_INTERFACES` and `BUILD_FORTRAN_CLIENTS` (the
  tests in `test/`, which use the HIP binding). Found with `find_package(rccl-fortran)`; the
  archive and `.mod` files install per compiler under `<libdir>/fortran/<compiler>` and
  `<includedir>/fortran/<compiler>`, the tests under `<bindir>/rccl-fortran`.
  The package sets `rccl_FORTRAN_LIBRARIES`, the target to link (`roc::rccl_fortran`), and
  `rccl_FORTRAN_INCLUDE_DIRS`, the directory of its `.mod` files.
