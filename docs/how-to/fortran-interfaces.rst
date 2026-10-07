.. meta::
  :description: The Fortran interface variants hipFORT generates and how to call them
  :keywords: hipFORT, ROCm, Fortran, interfaces, hipMalloc, assumed-rank, f2003, f2008, f2018, c_loc, pointer mode

**************************
Fortran interface variants
**************************

hipFORT generates more than one Fortran interface for the same underlying C
routine. Which ones are available depends on the Fortran compiler used to build
hipFORT and on two CMake options. This page describes the variants, how they
differ at the call site, and how to choose between them.

For the wider picture — which libraries hipFORT wraps, and how to link against
them — see :doc:`using-hipfort`.

The three variants
==================

* **Fortran 2003 C bindings.** Always present. Device memory is held in a
  ``type(c_ptr)`` and sizes are counted in bytes. These only require the
  ``iso_c_binding`` module.
* **Fortran 2008 array overloads.** Generated once per rank, they take a Fortran
  array pointer and a number of elements instead of a ``type(c_ptr)`` and a byte
  count. They reduce the chance of compile-time and runtime errors and make the
  call site easier to read. hipFORT enables them automatically once it detects
  Fortran 2008 support in the compiler.
* **Fortran 2018 assumed-rank overloads.** An experimental opt-in that replaces
  the per-rank overloads with a single ``dimension(..)`` overload. See
  `Assumed-rank interfaces (Fortran 2018)`_ below.

By convention, application and test sources that rely on the array overloads use
the ``.f08`` file extension (see the ``test/f2008`` examples), while Fortran 2003
sources use ``.f03``.

Independently of these variants, a routine that takes a scalar through a pointer
accepts either the Fortran variable or its address; see
`Scalar arguments passed by pointer`_.

Allocating and copying device memory
====================================

The Fortran 2003 form holds the device pointer in a ``type(c_ptr)`` and counts
bytes:

.. code-block:: fortran

   use iso_c_binding
   use hipfort
   integer      :: ierr       ! error code
   real, target :: a_h(5,6)   ! host array ('target' is required by c_loc)
   type(c_ptr)  :: a_d        ! device array pointer
   !
   ! real has 4 bytes; the '_c_size_t' suffix writes 4 as an integer(c_size_t)
   ierr = hipMalloc(a_d, size(a_h)*4_c_size_t)
   ierr = hipMemcpy(a_d, c_loc(a_h), size(a_h)*4_c_size_t, &
                    hipMemcpyHostToDevice)

The array overloads take a Fortran array pointer and a shape, and count
elements rather than bytes:

.. code-block:: fortran

   use hipfort
   integer       :: ierr      ! error code
   real          :: a_h(5,6)  ! host array
   real, pointer :: a_d(:,:)  ! device array pointer
   !
   ierr = hipMalloc(a_d, shape(a_h))   ! or hipMalloc(a_d, [5,6])
                                       ! or hipMalloc(a_d, 5, 6)
   ierr = hipMemcpy(a_d, a_h, size(a_h), hipMemcpyHostToDevice)

``hipMalloc`` is also overloaded with ``mold``, ``source`` and ``dsource``
arguments, in the spirit of the ``ALLOCATE`` intrinsic. ``mold`` takes the shape
of another array without copying anything, while ``source`` takes its shape
(including bounds) and performs a blocking copy to the device:

.. code-block:: fortran

   ierr = hipMalloc(a_d, mold=a_h)     ! shape of a_h, no copy
   ierr = hipMalloc(a_d, source=a_h)   ! shape of a_h, plus a copy from the host

Use ``dsource`` instead of ``source`` when the source array already lives on the
device.

Unlike the array interfaces of the math libraries, these ``hipMalloc`` and
``hipMemcpy`` overloads are unconditional, so they are available in every
hipFORT build.

Scalar arguments passed by pointer
==================================

Many C routines take a scalar through a pointer: ``alpha`` and ``beta`` in the
BLAS and sparse libraries, or an output such as a buffer size, a version or a
count. hipFORT offers two forms of each such routine under the same name, and the
compiler picks one from the type of the argument:

* **The Fortran variable.** hipFORT passes its address to the library. This is
  the usual call, for a scalar held on the host:

  .. code-block:: fortran

     real(c_double)    :: alpha, beta
     integer(c_size_t) :: buffer_size
     !
     ierr = rocblas_dgemm(handle, transa, transb, m, n, k, alpha, &
                          dA, lda, dB, ldb, beta, dC, ldc)
     ierr = rocsparse_dgemvi_buffer_size(handle, trans, m, n, nnz, buffer_size)

* **Its address, a** ``type(c_ptr)``. This is the C API's own spelling. Use it
  to pass a device address, to pass ``c_null_ptr`` for an output the C API lets
  you skip, or to keep calling with ``c_loc``:

  .. code-block:: fortran

     real(c_double), target :: alpha, beta
     !
     ierr = rocblas_dgemm(handle, transa, transb, m, n, k, c_loc(alpha), &
                          dA, lda, dB, ldb, c_loc(beta), dC, ldc)

An output the C API lets you skip is an ``optional`` argument of the first form.

Device pointer mode
-------------------

``alpha``, ``beta`` and a few other scalars are read from host or device memory
depending on the pointer mode of the handle (``rocblas_set_pointer_mode``,
``hipblasSetPointerMode``, ``rocsparse_set_pointer_mode``,
``hipsparseSetPointerMode``). The Fortran-variable form passes the address of the
variable, which is normally host memory, so it is for the host pointer mode, the
default. In device pointer mode, pass the device address as a ``type(c_ptr)``:

.. code-block:: fortran

   type(c_ptr) :: d_alpha, d_beta   ! device memory, from hipMalloc
   !
   ierr = rocblas_set_pointer_mode(handle, rocblas_pointer_mode_device)
   ierr = rocblas_dgemm(handle, transa, transb, m, n, k, d_alpha, &
                        dA, lda, dB, ldb, d_beta, dC, ldc)

A few rocSPARSE and hipSPARSE routines take both kinds of scalar, for example
``rocsparse_dcsrgemm_buffer_size``, which reads ``alpha`` and ``beta`` per the
pointer mode but always writes ``buffer_size`` on the host. In device pointer
mode, pass ``alpha`` and ``beta`` as ``type(c_ptr)`` and ``buffer_size`` as the
variable.

The Fortran 2008 array overloads take ``alpha`` and ``beta`` as Fortran variables
only. To use them in device pointer mode, the variables themselves must live on
the device, for example a ``real(c_double), pointer`` allocated with
``hipMalloc``; otherwise, call the ``type(c_ptr)`` form.

Device-only scalars
-------------------

hipSOLVER's ``devInfo`` is written by the GPU, so it is always device memory.

* With ``type(c_ptr)`` buffers, pass it as a ``type(c_ptr)``, for example the
  one ``hipMalloc`` returned. There is no Fortran-variable form here: a host
  integer would be written by the GPU.
* With the Fortran 2008 array overloads, pass either an integer that lives on
  the device, such as an ``integer(c_int), pointer`` allocated with
  ``hipMalloc``, like the arrays beside it, or a ``type(c_ptr)``.

.. note::

   In the API reference and the supported-API tables, the Fortran-variable form
   of a routine ``X`` appears as the module procedure ``X_typed``, and the
   device-pointer-mode form of the routines that mix both kinds of scalar as
   ``X_devptr``. Call them through the generic name ``X``.

Assumed-rank interfaces (Fortran 2018)
======================================

The Fortran 2008 array interfaces are generated once per rank, so each generic
carries a fixed set of ranks. Building hipFORT with
``-DHIPFORT_ASSUMED_RANK=ON`` replaces those per-rank overloads with a single
Fortran 2018 ``dimension(..)`` overload that accepts an actual argument of any
rank. This is what lets a rank-3 array be passed to a routine whose per-rank
overloads stop at rank 1, such as ``rocblas_saxpy``.

The option is experimental and ``OFF`` by default. Note the following:

* It is **mutually exclusive** with the classic per-rank interfaces rather than
  additive: enabling it replaces them.
* It requires a Fortran 2018 compiler (hipFORT probes for ``c_loc()`` of a
  ``dimension(..)`` argument) and the Fortran 2008 interfaces. If either is
  missing, hipFORT warns and falls back to the per-rank interfaces instead of
  failing the build.
* Only **contiguous** arrays may be passed.
* ``hipMalloc`` keeps its per-rank overloads either way; ``hipMemcpy``,
  ``hipMemcpyAsync`` and ``hipMemcpy2D`` gain assumed-rank forms.

``test/f2018/rocblas/saxpy.f90`` is the one program that exercises this mode; it
is skipped unless the option is enabled. See the
:doc:`rocBLAS examples <../tutorials/rocblas-examples>` for a walkthrough.
