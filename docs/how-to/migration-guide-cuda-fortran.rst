.. meta::
  :description: How to port CUDA Fortran library calls to the Fortran bindings shipped in ROCm
  :keywords: fortran, CUDA Fortran, migration, ROCm, bindings, hipBLAS, hipFFT, cuBLAS, cuFFT

*****************************
Migrating from CUDA Fortran
*****************************

Who this is for
===============

You compile with ``nvfortran`` and call NVIDIA's libraries through the CUDA
Fortran interface modules: ``use cublas_v2``, ``use cufft``, ``use curand``.
NVIDIA documents these modules in its
`Fortran CUDA Interfaces <https://docs.nvidia.com/hpc-sdk/compilers/fortran-cuda-interfaces/>`_
guide.

The Fortran bindings shipped in ROCm (see :doc:`migration-guide`) have one
module per HIP library, and their module, routine and constant names follow
CUDA Fortran's, with ``hip`` in place of ``cu``. The library calls therefore
port by renaming. CUDA Fortran's language extensions (device arrays, kernels)
do not: they are not library calls, and the code that uses them has to be
rewritten.

There is no automatic tool: HIPIFY does not process Fortran. The renames below
are regular enough for ``sed``, but read the result.

Modules
=======

.. list-table::
   :header-rows: 1
   :widths: 22 18 30 30

   * - CUDA Fortran ``use``
     - ROCm ``use``
     - Link (CMake target)
     - CMake package
   * - ``use cudafor`` (runtime API)
     - ``use hip``
     - ``hip::hip_fortran``
     - ``hip-fortran``
   * - ``use cublas``, ``use cublas_v2``
     - ``use hipblas``
     - ``roc::hipblas_fortran``
     - ``hipblas-fortran``
   * - ``use cufft``
     - ``use hipfft``
     - ``hip::hipfft_fortran``
     - ``hipfft-fortran``
   * - ``use cufftXt``
     - ``use hipfftxt``
     - ``hip::hipfft_fortran``
     - ``hipfft-fortran``
   * - ``use cusparse``
     - ``use hipsparse``
     - ``roc::hipsparse_fortran``
     - ``hipsparse-fortran``
   * - ``use cusolverDn``
     - ``use hipsolver``
     - ``roc::hipsolver_fortran``
     - ``hipsolver-fortran``
   * - ``use curand``
     - ``use hiprand``
     - ``hip::hiprand_fortran``
     - ``hiprand-fortran``
   * - ``use nvtx``
     - ``use roctx``
     - ``roc::roctx_fortran``
     - ``roctx-fortran``

hipFFT is split the way cuFFT is. Every ``hipfftXt*`` and ``hipfftMp*``
routine is in ``hipfftxt``, including ``hipfftXtSetWorkArea``, which the C
header ``hipfft.h`` declares, and every other ``hipfft*`` routine is in
``hipfft``. ``hipfftxt`` uses and re-exports ``hipfft``, as ``cufftXt`` does
``cufft``, so ``use hipfftxt`` alone gives the whole API. Both modules are in
the same archive. The module is named in lowercase, but Fortran names are
case-insensitive, so ``use hipfftXt`` works too.

Each library module also needs ``use hip`` wherever your code allocates device
memory or synchronizes, as ``cudafor`` did. How to compile and link against the
bindings is in the *Compile and link* section of :doc:`migration-guide`.

Before the bindings ship in ROCm (see the timeline in :doc:`migration-guide`),
hipFORT provides the same interfaces under ``hipfort_`` names: ``hipfort`` for
``hip``, ``hipfort_hipblas`` for ``hipblas``, ``hipfort_hipfftxt`` for
``hipfftxt``, and so on, with the enumerations in ``hipfort_<lib>_enums`` and
the check routines in ``hipfort_check``.

Routines and constants
======================

Routine and constant names map by replacing the ``cu`` or ``CU`` prefix with
``hip`` or ``HIP``:

.. list-table::
   :header-rows: 1
   :widths: 50 50

   * - CUDA Fortran
     - ROCm
   * - ``cublasSgemm``, ``CUBLAS_OP_N``
     - ``hipblasSgemm``, ``HIPBLAS_OP_N``
   * - ``cufftPlan1d``, ``CUFFT_Z2Z``, ``CUFFT_FORWARD``
     - ``hipfftPlan1d``, ``HIPFFT_Z2Z``, ``HIPFFT_FORWARD``
   * - ``cusparseCreate``, ``CUSPARSE_INDEX_BASE_ONE``
     - ``hipsparseCreate``, ``HIPSPARSE_INDEX_BASE_ONE``
   * - ``cusolverDnDgetrf``
     - ``hipsolverDnDgetrf``
   * - ``curandCreateGenerator``, ``CURAND_RNG_PSEUDO_DEFAULT``
     - ``hiprandCreateGenerator``, ``HIPRAND_RNG_PSEUDO_DEFAULT``
   * - ``cudaMemcpy``, ``cudaMemcpyDeviceToHost``
     - ``hipMemcpy``, ``hipMemcpyDeviceToHost``

The arguments are in the same order. Every library routine takes its handle
first, as in ``cublas_v2``; a call written against the legacy ``cublas``
module, which takes no handle, needs one added.

``cusolverDn*`` routines become ``hipsolverDn*``, which is hipSOLVER's
compatibility API. Once the code runs, AMD recommends moving to hipSOLVER's
regular ``hipsolver*`` API, which performs better; it is in the same
``hipsolver`` module.

Each library module also has a check routine, ``hipCheck``, ``hipblasCheck``,
``hipfftCheck`` and so on, which prints the name of a failed status and stops
with ``stop 1``. They are ROCm additions with no NVIDIA counterpart; where your
code tests ``istat`` itself, you can keep doing so.

What you rewrite
================

*  **Handles.** CUDA Fortran declares each handle with a type of its own
   (``type(cublasHandle)``, ``type(cusparseHandle)``,
   ``type(cusolverDnHandle)``, ``type(curandGenerator)``) and a cuFFT plan as
   an ``integer``. In the ROCm bindings every handle and plan is a
   ``type(c_ptr)``, from ``iso_c_binding``.
*  **Device memory.** CUDA Fortran allocates arrays with the ``device``
   attribute with ``allocate``, and copies them with assignment
   (``a_d = a``). HIP Fortran has no device attribute: a device array is a
   Fortran pointer, allocated with ``hipMalloc`` (``hipMalloc(a_d, m, n)``, or
   ``hipMalloc(a_d, source=a)`` to allocate and copy in one call), copied with
   ``hipMemcpy``, and freed with ``hipFree``. The library routines accept these
   pointers directly, or a ``type(c_ptr)``.
*  **Kernels.** ``attributes(global)`` and ``attributes(device)`` procedures,
   the ``<<<grid, block>>>`` launch, and ``!$cuf kernel do`` directives have no
   HIP Fortran equivalent. Port these loops to OpenMP offload
   (``!$omp target teams distribute parallel do``), or write the kernel in HIP
   C++ and call a ``bind(C)`` launcher from Fortran.
*  **Profiling ranges.** The ``nvtx`` module's ``nvtxStartRange`` and
   ``nvtxEndRange`` helpers become ROCTx calls, which follow the C API instead:
   ``roctxRangePush('zone'//c_null_char)`` and ``roctxRangePop()``.

A cuBLAS call, before and after:

.. code-block:: fortran

   ! CUDA Fortran
   use cudafor
   use cublas_v2
   real :: a(m,k), b(k,n), c(m,n), alpha = 1.0, beta = 0.0
   real, device, allocatable :: a_d(:,:), b_d(:,:), c_d(:,:)
   type(cublasHandle) :: handle
   integer :: istat

   istat = cublasCreate(handle)
   allocate(a_d(m,k), b_d(k,n), c_d(m,n))
   a_d = a
   b_d = b
   istat = cublasSgemm(handle, CUBLAS_OP_N, CUBLAS_OP_N, m, n, k, &
                       alpha, a_d, m, b_d, k, beta, c_d, m)
   c = c_d
   deallocate(a_d, b_d, c_d)
   istat = cublasDestroy(handle)

.. code-block:: fortran

   ! ROCm
   use iso_c_binding
   use hip
   use hipblas
   real(c_float) :: a(m,k), b(k,n), c(m,n), alpha = 1.0, beta = 0.0
   real(c_float), pointer :: a_d(:,:), b_d(:,:), c_d(:,:)
   type(c_ptr) :: handle = c_null_ptr

   call hipblasCheck(hipblasCreate(handle))
   call hipCheck(hipMalloc(a_d, source=a))
   call hipCheck(hipMalloc(b_d, source=b))
   call hipCheck(hipMalloc(c_d, m, n))
   call hipblasCheck(hipblasSgemm(handle, HIPBLAS_OP_N, HIPBLAS_OP_N, m, n, k, &
                                  alpha, a_d, m, b_d, k, beta, c_d, m))
   call hipCheck(hipMemcpy(c, c_d, hipMemcpyDeviceToHost))
   call hipCheck(hipFree(a_d))
   call hipCheck(hipFree(b_d))
   call hipCheck(hipFree(c_d))
   call hipblasCheck(hipblasDestroy(handle))

What has no equivalent
======================

These CUDA Fortran modules have no ROCm Fortran counterpart:

*  ``cublasXt`` and ``cublasMp`` (multi-GPU BLAS) and ``cusolverMp``
   (distributed solvers).
*  ``curand_device`` and ``openacc_curand``, which generate random numbers
   inside device code.
*  ``cutensor_v2`` and ``cutensorex``. hipTensor has no Fortran binding.
*  ``nccl`` and ``nvshmem``. Their ROCm counterparts, RCCL and rocSHMEM, have
   no Fortran binding.

Code that needs one of these keeps a C or C++ layer for it, called through
``bind(C)``. If a binding would help your code,
`open an issue <https://github.com/ROCm/hipfort/issues>`_.
