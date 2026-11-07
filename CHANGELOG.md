# Changelog for hipfort

## Unreleased

### Added

* `X_strided_rank` array overloads for the strided-batched routines of
  rocBLAS, hipBLAS, rocSOLVER and hipSOLVER, which take each operand with the
  batch as one more dimension: `A(lda, n, batch_count)`, and a vector of each
  batch entry as a column of a 2-D array. `X_full_rank` keeps taking the batch
  packed in the last dimension, as before.
* Array overloads for the routines that had none, derived from the C
  signature: every routine with a data buffer now has them (in rocSOLVER 1002
  routines instead of 680, hipSOLVER 461 instead of 164, rocSPARSE 470 instead
  of 347, hipBLAS 846 instead of 752, rocBLAS 838 instead of 700, HIP 20,
  hipFFTW 32), with `_devptr` twins wherever an argument may be a device pointer.
* `_devptr` twins of the array overloads for an array of one value per batch
  entry that is also passed as a `type(c_ptr)`, in routines that take another
  array: the `info` of rocSOLVER's batched routines, of
  `hipsolverXgetrfBatched`, `hipsolverXgetriBatched` and
  `hipblasXgetrfStridedBatched`, the results of the strided-batched reductions
  of rocBLAS and hipBLAS (`dot`, `dotc`, `dotu`, `asum`, `nrm2`, `iamax`,
  `iamin`), and `rotm`'s `param`. The array overloads take them as Fortran
  arrays, in host or device memory.
* `hipStreamGetCaptureInfo_spt` and `hipStreamGetCaptureInfo_v2_spt` get the
  optional arguments of their base routine: `pId` is optional in the `_typed`
  form of the first, and the second gains an `_opt` form.
* Regenerated all Fortran bindings against the ROCm 10.2 API, adding 77
  routines: four in the HIP runtime (`hipDeviceFlushGPUDirectRDMAWrites`,
  `hipKernelSetAttributeForDevice`, `hipLibraryGetModule`,
  `hipModuleEnumerateFunctions`), the batched `gels`, `geqrf`, `getrf`, `getri`
  and `getrs` routines and `hipsolverDnXtrtri` in hipSOLVER, the `gehd2` and
  `gehrd` families in rocSOLVER, and `rocsparse_spsort_*`,
  `rocsparse_dnmat_copy_data` and `rocsparse_dnmat_transpose` in rocSPARSE.
* The hipFFT Xt API in the new `hipfort_hipfftxt` module (`hipfort::hipfftxt`
  CMake component), as CUDA Fortran's `cufftXt`: it uses `hipfort_hipfft`, so
  `use hipfort_hipfftxt` alone gives the whole hipFFT API, and
  `hipfort_hipfft` keeps the `hipfft.h` API only. The routines are `bind(C)`
  interfaces (with `_typed` forms for `hipfftXtMakePlanMany` and
  `hipfftXtGetSizeMany`): the multi-GPU routines (`hipfftXtSetGPUs`,
  `hipfftXtSetWorkArea`, `hipfftXtMalloc`, `hipfftXtMemcpy`, `hipfftXtFree`, the
  `hipfftXtExecDescriptor*` family), `hipfftXtMakePlanMany`,
  `hipfftXtGetSizeMany` and `hipfftXtExec` on `hipDataType`, and the callback
  routines. The `hipXtDesc` and `hipLibXtDesc` types are in
  `hipfort_hipfftxt_types`, and the Xt enums in `hipfort_hipfftxt_enums`.
  On AMD GPUs the descriptor routines need a plan spread over two or more GPUs,
  and a multi-GPU plan writes one work size per GPU: pass `c_loc` of an
  `integer(c_size_t)` array as `workSize`. The multi-process routines
  of `hipfftMp.h` (`hipfftMpAttachComm`, `hipfftXtSetDistribution`,
  `hipfftXtSetSubformatDefault`) are bound too, but exist only in a hipFFT built
  with MPI support, which the ROCm packages are not. On the CUDA backend the Xt
  and multi-process routines added here are not available. The hipFFT examples document
  the multi-GPU and MPI workflows.
* Array overloads (`rank_N`, `full_rank`, assumed-rank) for the ILP64 (`_64`)
  routines of rocBLAS, hipBLAS and rocSOLVER (`rocblas_sscal_64`, ...), the same
  as for their 32-bit counterparts. They only had their `bind(C)` and, for some,
  `_typed` forms. rocBLAS's `rocblas_{set,get}_{vector,matrix}*_64`
  transfer helpers still have only their `bind(C)` form.

### Changed

* The single values rocSOLVER writes on the GPU are taken as one value: `info`
  (every non-batched routine), `n_sweeps` and `residual` (`gesvdj`, `syevj`,
  `heevj`, `sygvj`, `hegvj`), `nev` (`syevx`, `heevx`, `syevdx`, `heevdx`,
  `sygvx`, `hegvx`, `sygvdx`, `stein`, `stebz`), `nsplit` (`stebz`), `nsv`
  (`gesvdx`, `bdsvdx`), `nr` and `sigma` (`cholqr`), `anorm` and `rcond`
  (`gecon`), `norm` (`lange`), and the `info` of `hipsolverDnXpotrf` and
  `hipsolverDnXpotrs`. The array overloads take an integer or real variable on
  the device (an `integer(c_int), pointer` allocated with `hipMalloc`), and
  their `_devptr` twins a `type(c_ptr)`, which the array overloads took before.
  A call through the generic name with a `type(c_ptr)` compiles as before.
* `hipblasXrotBatched` and `hipblasXrotStridedBatched` take `c` and `s` as
  scalars read per the pointer mode, as rocBLAS does: the `_typed` form takes
  them as variables, the `_devptr` form as `type(c_ptr)`.
* **Breaking.** Arguments the bindings classified against the C documentation:
  * `info` of `hipblasXgeqrf`, `hipblasXgetrs` and their `StridedBatched` forms,
    `p_buffer_size` of `rocsparse_Xgebsr2gebsc_buffer_size` and `fractionToColor`
    of `hipsparseXcsrcolor` are host values, which the library writes or reads
    on the host: their `_devptr` forms, which took them as device pointers, are
    gone (88 procedures). Pass a Fortran variable.
  * `nev` and `info` of `rocsolver_chegvdx` and `rocsolver_zhegvdx`, the `alpha`
    of `hipsparseXcsrsm2_bufferSizeExt` and the `threshold` of the hipSPARSE
    `prune` size queries are single values, not one-element arrays (38
    procedures).
* A specific procedure whose argument moves from `type(c_ptr)` to a Fortran
  variable or array keeps its name; its `type(c_ptr)` form is the `_devptr`
  specific of the same overload. Calls through the generic names resolve as
  before; a call to the specific by name may need the `_devptr` one.
* **Breaking for calls by keyword.** The `bind(C)` specifics of
  `hipblasSetVector`, `hipblasGetVector`,
  `hipblasSetMatrix`, `hipblasGetMatrix` and their `Async` forms spell their
  arguments as the hipBLAS headers do: `elemSize`, `AP` and `BP` instead of
  `elem_size`, `A` and `B`. Only calls by keyword are affected; the array
  overloads are unchanged.
* Each backend archive (`libhipfort-amdgcn.a`, `libhipfort-nvptx.a`) is
  compiled with one section per procedure (`-ffunction-sections
  -fdata-sections`) when the Fortran compiler accepts these flags, which the
  amdflang of ROCm 7.13 does not. A program linked with `-Wl,--gc-sections` keeps only the
  wrappers it calls, instead of all of a library's wrappers, and still links
  when another wrapper names a C function that the installed library does not
  export. The tests link that way. A shared library that links an archive also
  needs `-Wl,--exclude-libs` naming it, for example
  `-Wl,--exclude-libs,libhipfort-amdgcn.a`.
* **Breaking.** The array overloads of `hipMalloc`, `hipMallocManaged`,
  `hipHostMalloc`, `hipFree`, `hipHostFree`, the `hipMemcpy` families and the
  `hipHostRegister` family are now part of the Fortran 2008 array overloads, like
  those of the math libraries. A build with `-DHIPFORT_USE_FPOINTER_INTERFACES=OFF`
  no longer has them: pass a `type(c_ptr)` and a byte count.
* **Breaking.** The array overloads of the hipSOLVER batched routines
  (`hipsolver[SDCZ]{potrf,potrs,getrf,getri,gels,gesvdj,syevj,heevj}Batched`)
  take `devInfo` as an `integer(c_int)` array of `batch_count` entries, which is
  what hipSOLVER writes, instead of a single integer. Pass the device array
  itself, or call the `bind(C)` specific with `type(c_ptr)` arguments;
  `getrfBatched` and `getriBatched` also have `_devptr` forms that take it as a
  `type(c_ptr)`. The `gels` batched routines gain array overloads.
* `fftw_iodim64` declares its fields `integer(c_intptr_t)` instead of
  `integer(c_ptrdiff_t)`, a Fortran 2008 kind, so `hipfort_hipfftw_types`
  compiles with a Fortran 2003 compiler. Both kinds are equal on every
  platform ROCm supports, so existing code is unaffected.
* The `_typed` forms of hipSOLVER and hipSPARSE declare their `hipDataType`
  arguments `integer(c_int)`, like their `bind(C)` interfaces, instead of
  `integer(kind(HIP_R_32F))`. Both are the C `int` kind, so existing code is
  unaffected, and these routines no longer `use hipfort_enums`.
* The assumed-rank overloads (`-DHIPFORT_ASSUMED_RANK=ON`) no longer declare
  their arrays `contiguous`, like the per-rank ones. Given a non-contiguous
  section, the compiler used to pass a copy made in a host temporary: fatal for
  an array in device memory on GPUs without XNACK enabled, and freed when the
  call returns while an asynchronous routine is still reading it. Both forms
  now take the address of the array as it is, so pass contiguous arrays.

* The modules compile 2 to 3 times faster with gfortran and amdflang, and the
  Cray compiler no longer takes an hour on the assumed-shape rocSOLVER module
  (8 s now). Each module `use`s `iso_c_binding` and its enums once, and its
  interfaces `import` them, instead of a `use` in each of its thousands of
  interfaces and wrappers, which `ftn` read again every time. The modules export
  the same names as before.

### Fixed

* On the CUDA backend, `hipDeviceAttributeGPUDirectRDMASupported`,
  `hipDeviceAttributeGPUDirectRDMAFlushWritesOptions` and
  `hipDeviceAttributeGPUDirectRDMAWritesOrdering` had their HIP values (97 to
  99), so `hipDeviceGetAttribute` returned other CUDA attributes. They now have
  their CUDA values (116 to 118).

* An array overload of `hipMalloc`, `hipMallocManaged` or `hipHostMalloc` that
  fails now leaves its pointer unassociated. It used to associate it with
  whatever the uninitialized C pointer held (NULL, or an arbitrary address if HIP
  returned before writing it), so `associated(ptr)` was true and
  `hipFree(ptr, only_if_allocated=.true.)` freed that address. `hipFree` and
  `hipHostFree` no longer take `c_loc` of an unassociated pointer: without
  `only_if_allocated` they free NULL, as the C call does.
* Fixed `-DHIPFORT_ASSUMED_RANK=ON` with nvfortran, whose `c_loc` of an
  assumed-rank argument returns a wrong address for a scalar or an array of rank
  2 or more: the assumed-rank overloads passed a wrong pointer to the C library.
  The configure probe now runs a program that checks the address for ranks 0, 1
  and 2 instead of only compiling it, so nvfortran falls back to the per-rank
  interfaces with a warning.

* The Cray compiler no longer warns that `hipfort_check` may use its status name
  unallocated (ftn-7206), nor, when building hipfort and its tests, that a scope
  uses a module twice (ftn-878, which the standard allows: the modules re-export
  their enums). The `pointer_attributes` tests compare addresses in a way the
  Cray compiler accepts.
* The `find_package` test looks for the installed `hipfort-config.cmake` under
  the platform's libdir (`lib64` on SUSE, RHEL and Fedora), where it is
  installed, rather than under `lib`.

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
