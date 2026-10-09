# Changelog for hipfort

## hipfort 0.10.0 for ROCm 10.1.0

### Added

* Regenerated all Fortran bindings against the ROCm 10.1 API. 59 routines are
  new: rocSOLVER (+28), hipBLAS (+8), rocBLAS (+6), hipSPARSE (+5), rocFFT
  (+4), rocSPARSE (+3), hipSOLVER (+2), HIP (+2) and hipFFT (+1). The only
  routines dropped are the two rocBLAS helpers listed under *Removed*.
* CMake option `HIPFORT_BUILD_AMDGCN` (default `ON`), the counterpart of
  `HIPFORT_BUILD_NVPTX`. `-DHIPFORT_BUILD_AMDGCN=OFF` skips
  `libhipfort-amdgcn.a` for a CUDA-only build. The two options stay independent
  switches, and setting both to `OFF` is a configure error.
* `hipfort_roctx` binds twelve ROCTx entry points instead of five, adding
  `roctxProfilerPause`, `roctxProfilerResume`, `roctxGetThreadId` and the
  `roctxName{OsThread,HsaAgent,HipDevice,HipStream}` family.
* The `<lib>Check` routines of `hipfort_check` report a failing status by name,
  for example `HIPBLAS ERROR: HIPBLAS_STATUS_INVALID_VALUE (code 3)` instead of
  `HIPBLAS ERROR: code = 3`. This covers every library, including those with no
  to-string function of their own (hipFFT, hipRAND, hipSOLVER, rocFFT, rocRAND,
  rocSOLVER), and adds no link dependency. A `USE_CUDA_NAMES` build still prints
  the code only.
* Tutorial pages of complete, runnable Fortran programs for rocBLAS, hipBLAS,
  rocRAND and hipRAND, and a *Fortran interface variants* how-to page covering
  the `hipMalloc`/`hipMemcpy` array interfaces, the experimental Fortran 2018
  assumed-rank mode, and the two forms of a scalar passed by pointer: when to
  pass the variable and when its address, the device pointer mode, and
  hipSOLVER's `devInfo`.
* Test coverage for:
  * the BLAS `nrm2`, `asum`, `iamax`/`iamin`, `ger`, `syrk`/`herk`,
    `symm`/`hemm`, `trmm`, `geam` and `gemm_ex` routines in rocBLAS and hipBLAS;
  * every `N`/`T`/`C` combination of `gemm` and `gemv`, on rectangular padded
    matrices with complex `alpha`/`beta` and non-unit increments;
  * the device pointer mode of the BLAS and sparse libraries;
  * the version, pointer-mode, handle-state and descriptor getters of nine
    libraries;
  * the rocRAND and hipRAND `mrg32k3a`, `mtgp32` and `sobol32` generators and
    the Poisson and log-normal distributions;
  * the `_typed` forms of scalar arguments, through rocBLAS, hipBLAS, rocSPARSE
    and hipSPARSE tests that pass `alpha`, `beta` or a result as Fortran
    variables, and hipSOLVER `getrf` tests that pass a device `devInfo` to the
    array overloads.

### Changed

* Every pointer-mode scalar and host output now comes in two forms under the
  same generic.
  The `bind(C)` specific takes it as `type(c_ptr), value`, the C API's own
  spelling, and a `<routine>_typed` module procedure takes the Fortran variable
  (`integer`, `real`, `complex` or the enum kind) and passes its address, so
  both calls work:

  ```fortran
  st = rocblas_daxpy(handle, n, alpha, dx, incx, dy, incy)
  st = rocblas_daxpy(handle, n, c_loc(alpha), dx, incx, dy, incy)
  ```

  This covers:
  * the scalars a library reads or writes per its handle's pointer mode:
    `alpha` and `beta` throughout rocBLAS, hipBLAS, rocSPARSE and hipSPARSE,
    the `dot`, `nrm2`, `asum` and `iamax`/`iamin` results and the `rot`, `rotg`
    and `rotmg` scalars of rocBLAS and hipBLAS, the sparse `doti`/`dotci`
    results, `nnzTotalDevHostPtr`, the nnz counts of the `*_nnz` routines and
    the pivot positions. The `type(c_ptr)` form makes
    `rocblas_pointer_mode_device` and its equivalents usable from Fortran;
  * the host outputs: the HIP runtime queries (`hipStreamGetId`,
    `hipStreamGetCaptureInfo`, `hipFuncGetAttribute`,
    `hipDeviceGetP2PAttribute`, the `hipOccupancy*` and `hipGraph*` counts,
    ...), the version, pointer-mode, math-mode and handle-state getters of the
    BLAS, sparse and solver libraries, the hipSPARSE and rocSPARSE descriptor
    getters, `hipblasGetProperty`, `hipfftGetProperty`, the hipBLAS
    `getrs`/`geqrf`/`gels` `info`, the hipSOLVER buffer sizes, `*gels`
    `niters` and `*{sy,he}evdx`/`*{sy,he}gvdx` `nev`, the `csrcolor` color
    count, `hipChooseDevice`, and `rocfft_cache_serialize`. An output the C
    API lets the caller skip is `optional` in the `_typed` form; pass
    `c_null_ptr` to the `type(c_ptr)` one.

  Scalars that only ever live on the device, such as rocSOLVER `info` and
  hipSOLVER `devInfo`, keep the `type(c_ptr)` form only.

  The 28 rocSPARSE and hipSPARSE routines with both kinds (`alpha`/`beta` beside
  a buffer size) also get `<routine>_devptr`, for the device pointer mode: the
  pointer-mode scalars as `type(c_ptr)`, the host outputs typed.

  The array overloads take the BLAS results and the hipBLAS `info` as
  variables too; their `<routine>_rank_N_devptr` variants keep the
  `type(c_ptr)` these arguments have always taken there.
* hipSOLVER `devInfo` is device memory. The `bind(C)` specific takes it as
  `type(c_ptr), value`, with no typed form: a host integer next to `type(c_ptr)`
  buffers would be written by the GPU. The array overloads take it as an
  `integer`, like the device arrays next to it, and their `_devptr` variants as
  a `type(c_ptr)`. `tau` is an array in the array overloads.
* The hipFFTW guru planners take `dims` and `howmany_dims` as
  `type(fftw_iodim)` / `type(fftw_iodim64)` arrays in every precision. The
  `hipfftGetProperty` rank overloads are removed, as its value is a plain
  integer.
* **Breaking.** Apart from ROCTx (below), six patterns of code written against
  hipfort 0.9.0 no longer compile:
  * hipSOLVER, an `integer` `devInfo` passed with `type(c_ptr)` buffers: pass
    `c_loc(devInfo)`, or the `type(c_ptr)` from `hipMalloc`;
  * hipSOLVER array overloads, `tau` passed as an element, `dTau(1)`: pass the
    array;
  * hipSOLVER `*syevdx_bufferSize`, `*heevdx_bufferSize`, `*sygvdx_bufferSize`
    and `*hegvdx_bufferSize`, `nev` passed as a `type(c_ptr)` while `lwork` is
    typed: pass both variables, or both addresses;
  * `rocsolver_chegvdx` and `rocsolver_zhegvdx`, `nev` passed as an integer: it
    is a device pointer, as for the rest of the `*gvdx` family, so pass
    `c_loc(nev)`;
  * the hipFFTW guru planners, a scalar `dims`: pass an array;
  * the single-precision hipFFTW guru planners (`fftwf_plan_guru*`),
    `c_loc(dims)`: pass the `type(fftw_iodim)` array itself.

  One more change compiles but behaves differently: the array of host pointers
  of `hipsolverRfBatchSetupHost`, `hipsolverRfBatchResetValues` and
  `hipsolverRfBatchSolve` is now `type(c_ptr), value`. Pass `c_loc` of the
  array; code that passed its first element, `arr(1)`, now passes the first
  pointer instead of the address of the array.
* **Breaking.** `hipfort_roctx` is generated from
  `rocprofiler-sdk-roctx/roctx.h`, which is the header behind the library that
  `hipfort::roctx` links, rather than the legacy `roctracer/roctx.h`. Its
  `const char*` arguments are now `type(c_ptr)`, like every other `char*`
  argument in hipfort. Pass `c_loc` of a NUL-terminated
  `character(kind=c_char)` array instead of a Fortran string:

  ```fortran
  character(kind=c_char), dimension(5), target :: msg = &
      [c_char_"z", c_char_"o", c_char_"n", c_char_"e", c_null_char]
  ret = roctxRangePush(c_loc(msg))
  ```

  `hipfort_roctx` is now AMD-only and is no longer part of
  `libhipfort-nvptx.a`.
* **Breaking, for anyone compiling the `.F90` files by hand.** The preprocessor
  macros that select the array interfaces are renamed: `USE_ASSUMED_SHAPE`
  selects the per-rank overloads (Fortran 2008) and `USE_ASSUMED_RANK` selects
  the `dimension(..)` form (Fortran 2018). They replace
  `USE_FPOINTER_INTERFACES` and `USE_ASSUMED_RANK_INTERFACES`. Previously,
  defining only the latter produced no array overloads at all. The CMake
  options `HIPFORT_USE_FPOINTER_INTERFACES` and `HIPFORT_ASSUMED_RANK` are
  unchanged.
* hipfort now follows the platform install layout. Libraries and modules go to
  `CMAKE_INSTALL_LIBDIR`/`CMAKE_INSTALL_INCLUDEDIR` as set by `GNUInstallDirs`
  (`lib64` on Fedora, RHEL and SUSE, `lib/<triplet>` on Debian multiarch)
  instead of a literal `lib`. A user-supplied `-DCMAKE_INSTALL_LIBDIR` no longer
  drops the `fortran/<compiler>` subdirectory. The package config shim and the
  version file are installed beside the config they point to.
* The package now requires `hip-runtime-amd >= 6.0.0`, the first release that
  exports the `hipGetDevicePropertiesR0600` symbol that hipfort binds.
* Every source and build file carries the same MIT license header with an
  `SPDX-License-Identifier` line.

### Removed

* `rocblas_set_optimal_device_memory_size_impl` and
  `rocblas_device_malloc_alloc` are no longer bound. Both are variadic C helpers
  behind the C++ `rocblas_device_malloc` wrapper. Fortran cannot express their
  variable arguments, so these bindings could not be called correctly.

### Fixed

* The array overloads of `hipMalloc`, `hipMallocManaged`, `hipHostMalloc`,
  `hipMemcpy`, `hipMemcpyAsync` and `hipHostRegister` computed wrong byte counts
  for arrays of more than 2^31 - 1 elements, because the element count
  overflowed a default integer.
* The rank 1 to 7 overloads of `hipFree` and `hipHostFree` passed the address of
  the first element of the array, which is not the base of the allocation when
  the lower bounds are not 1, for example after `hipMalloc(..., lbounds=)` or a
  remapping such as `ptr(0:,0:) => ptr`. They now pass the base address.
* `rocblas_{s,d,c,z}{tr,tp}mv_batched` and their `_64` variants passed their
  arrays of device pointers by reference, so rocBLAS received a host address.
* `rocsolver_chegvdx` and `rocsolver_zhegvdx` take `nev` as a device pointer,
  like the rest of the `*gvdx` family (see *Changed*).
* The eight-byte integer overloads of the BLAS `Set`/`Get` `Vector`/`Matrix`
  routines and their `Async` variants declared their arrays `integer(c_long)`,
  which is four bytes on LLP64 targets. They are `integer(c_int64_t)` now.
* `hipfort::hipblas` was silently skipped when ROCm was installed outside the
  default CMake search prefixes. `ROCM_PATH` is now added to
  `CMAKE_PREFIX_PATH`, so the dependencies of the hipBLAS package resolve as
  well.
* Release builds passed wrong flags to two compilers: `-ta=host` instead of
  `-tp=host` to NVHPC/PGI, and the removed `-vec-report0` instead of `-vec` to
  Intel.
* Tests can now fail. 413 failure branches ended in a bare `call exit`, which
  returns 0 under gfortran. Fixing this uncovered 27 tests that had been failing
  silently. Several other tests that could not fail, tolerances that did not
  match the precision, and incorrect reference data were also fixed. The batched
  SDDMM test is dropped, because rocSPARSE does not support batched SDDMM.
* Fixed factual errors across the tutorial pages, and added the missing
  tutorials to the documentation landing page.
* The `source`/`dsource` forms of `hipMalloc`, `hipMallocManaged` and
  `hipHostMalloc` copied even when the allocation had failed, and returned the
  copy's status, so the allocation failure went unreported. They now copy only
  after a successful allocation.
* The array overloads of `rocsparse_?csrcolor` and `hipsparse?csrcolor` took
  `coloring` and `reordering` as scalars, although both are arrays of size `m`.
* rocSPARSE's nullable `error` arguments (`spgeam`, `spmv_set_input`,
  `v2_spmv`, ...) are `optional`, so NULL can be passed by omitting them.
* Under `USE_CUDA_NAMES`, the compatibility-API `hipsolver?gesvd_bufferSize`
  and `hipsolver??gels_bufferSize` were bound to the `cusolverDn` routines of
  the same name, whose arguments differ. They are now ROCm-only.
* The modules compile without warnings under gfortran `-Wall`. The bind(C)
  interfaces declared enum-valued arguments and results as
  `integer(kind(<enumerator>))`, which gfortran reported about 12,000 times as
  possibly not C interoperable (`-Wc-binding-type`). They are declared
  `integer(c_int)` now, which is the same type.

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
