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
  array and a number of elements instead of a ``type(c_ptr)`` and a byte
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

How a variant is selected
-------------------------

Each C routine ``X`` becomes a generic interface ``X``. You always call ``X``;
the compiler picks the specific procedure that matches your arguments. The
Fortran 2008 and Fortran 2018 specifics are compiled in or out by the
preprocessor, which is why the binding sources are ``.F90`` files:

.. code-block:: fortran

   interface rocblas_dscal
     function rocblas_dscal_(handle, n, alpha, x, incx) bind(c, name="rocblas_dscal")
       ...
     end function
     module procedure rocblas_dscal_typed
   #ifdef USE_ASSUMED_RANK
     module procedure rocblas_dscal_assumed_rank
   #else
   #ifdef USE_ASSUMED_SHAPE
     module procedure rocblas_dscal_rank_0, rocblas_dscal_rank_1
   #endif
   #endif
   end interface

``-DHIPFORT_USE_FPOINTER_INTERFACES=ON`` (the default when the compiler supports
Fortran 2008) defines ``USE_ASSUMED_SHAPE``, and ``-DHIPFORT_ASSUMED_RANK=ON``
defines ``USE_ASSUMED_RANK`` instead. If you compile the binding sources yourself,
define the same macro.

Specific procedure names
------------------------

The specific procedures appear under these names in the API reference and in the
supported-API tables. Call them through the generic name ``X``.

.. list-table::
   :header-rows: 1
   :widths: 22 12 66

   * - Specific
     - Standard
     - What it takes
   * - ``X_``
     - Fortran 2003
     - The ``bind(C)`` interface of the C routine: every pointer is a
       ``type(c_ptr), value``, and buffer sizes are in bytes.
   * - ``X_typed``
     - Fortran 2003
     - A scalar the C routine takes through a pointer (``alpha``, an output
       size, ...) as a Fortran variable; buffers stay ``type(c_ptr)``. See
       `Scalar arguments passed by pointer`_.
   * - ``X_devptr``
     - Fortran 2003
     - For routines that mix scalars read per the pointer mode and host-only
       scalars: the former as ``type(c_ptr)``, the latter as variables. See
       `Device pointer mode`_.
   * - ``X_opt``
     - Fortran 2003
     - An argument the C API allows to be ``NULL`` as an ``optional`` argument,
       passed as ``c_null_ptr`` when absent. It takes the place of ``X_`` in the
       generic.
   * - ``X_rank_N``
     - Fortran 2008
     - Buffers as Fortran arrays of rank ``N``, ``dimension(:,...)``, and their
       sizes in elements. ``N`` goes from 0 (a scalar) up to the highest rank
       the routine supports.
   * - ``X_full_rank``
     - Fortran 2008
     - A buffer followed by its leading dimension (``A``, ``lda``) as a 2-D
       array, ``dimension(:,:)``; you still pass the leading dimension.
   * - ``X_rank_N_devptr``, ``X_full_rank_devptr``
     - Fortran 2008
     - As above, with a scalar that ``X_rank_N`` takes as a variable passed as a
       ``type(c_ptr)`` instead: a scalar the GPU writes (hipSOLVER's
       ``devInfo``), or a result in device pointer mode (``rocblas_sdot``'s
       ``result``). See `Device-only scalars`_.
   * - ``X_assumed_rank``, ``X_assumed_rank_devptr``
     - Fortran 2018
     - Buffers as ``contiguous, dimension(..)`` arrays of any rank, replacing the
       ``X_rank_N`` and ``X_full_rank`` specifics. See
       `Assumed-rank interfaces (Fortran 2018)`_.

Other kinds of arguments
------------------------

* **Handles** (``rocblas_handle``, ``hipStream_t``, plan and descriptor handles)
  are ``type(c_ptr)``, passed by value.
* **Enumerations** are named constants of ``enum, bind(c)`` blocks, in the
  ``hipfort_<lib>_enums`` modules (``hipfort_enums`` for HIP). Pass the constants,
  such as ``rocblas_operation_none``; their kind is that of a C ``int``.
* **Structures** of the C API (``hipDeviceProp_t``, ...) are ``bind(c)`` derived
  types in ``hipfort_types`` and the ``hipfort_<lib>_types`` modules.
* **Character strings:** a ``const char*`` input is a ``type(c_ptr)`` in ``X_``,
  and a ``character(kind=c_char, len=*)`` in ``X_typed`` where the library takes
  a name or a message (ROCTx). Terminate the string with ``c_null_char``, as C
  expects: ``roctxRangePush("solve"//c_null_char)``.
* **Callbacks** (``hipStreamAddCallback``, ``hipLaunchHostFunc``, ...) are
  ``type(c_funptr)``: pass ``c_funloc`` of a ``bind(c)`` procedure.
* **Batched routines** (``*_batched``) take ``A`` as a device array of device
  pointers, one per matrix: pass the ``type(c_ptr)`` of that array, which you
  fill with the ``type(c_ptr)`` of each matrix. The ``*_strided_batched`` forms
  take one array and a stride instead.
* **64-bit routines** (``*_64`` in rocBLAS, hipBLAS and rocSOLVER) take their
  sizes, increments and leading dimensions as ``integer(c_int64_t)``, and have
  the same variants as the 32-bit ones.

Every routine returns its library's status. The ``hipfort_check`` module has a
helper per library (``hipCheck``, ``rocblasCheck``, ``hipsolverCheck``, ...) that
prints the status by name and stops the program when a call fails.

Passing arrays to the array overloads
-------------------------------------

The array overloads hand the address of the array to the C library, which reads
it as one contiguous block. Pass **contiguous** arrays: a whole array, or a
section such as ``a(:, j)`` or ``a(i:j)``. A strided section such as
``a(1:n:2)`` is not rejected by the Fortran 2008 overloads, but the library then
reads the wrong elements. The Fortran 2018 overloads declare their arrays
``contiguous``, so the compiler passes a contiguous copy of such a section,
which is fatal for an array in device memory on GPUs without XNACK enabled.

The address is that of your array, valid as long as the array is. For an
asynchronous routine, such as ``hipMemcpyAsync`` from a host array, keep the
array alive and unchanged until the stream has completed, and give it the
``target`` attribute: if the compiler has to pass a temporary copy (an
expression, a non-contiguous section), the copy disappears when the call
returns, while the transfer may still be running.

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

The other allocation forms:

* ``hipMalloc(a_d, n1, n2, ...)`` takes one length per dimension, as
  ``integer(c_int)`` or ``integer(c_size_t)``.
* ``hipMalloc(a_d, dims=[n1, n2], lbounds=[0, 0])`` sets the lower bounds of the
  pointer; ``dims8`` and ``lbounds8`` are their ``integer(c_int64_t)`` spelling.
  Pass exactly one of ``dims``, ``dims8``, ``mold``, ``source`` and ``dsource``.
* ``hipMallocManaged`` and ``hipHostMalloc`` take the same forms, followed by the
  HIP ``flags``. In the forms with lengths, ``flags`` is optional and defaults to
  ``hipMemAttachGlobal`` and ``hipHostMallocDefault``.
* ``hipFree(a_d)`` and ``hipHostFree(a_d)`` free the memory and nullify the
  pointer. ``hipFree(a_d, only_if_allocated=.true.)`` does nothing when ``a_d``
  is not associated.

When an allocation fails, the pointer is left unassociated, so
``associated(a_d)`` tells whether the memory exists, and ``hipFree(a_d,
only_if_allocated=.true.)`` is safe in a cleanup path.

The copy routines count elements, not bytes: the ``length`` of ``hipMemcpy`` and
``hipMemcpyAsync``, and the pitches, ``width`` and ``height`` of ``hipMemcpy2D``
and ``hipMemcpy2DAsync``, for arrays of the same element type on both sides.
``hipHostRegister(a, flags)`` registers a whole host array; a form with lengths
registers its first elements. ``hipHostGetDevicePointer`` and
``hipHostGetFlags`` take the host array itself.

These typed families exist for ``logical(c_bool)``, ``integer(c_int)``,
``integer(c_int64_t)``, ``real(c_float)``, ``real(c_double)``,
``complex(c_float_complex)`` and ``complex(c_double_complex)`` arrays of rank 0
to 7.

The vector and matrix transfer helpers of rocBLAS and hipBLAS
(``rocblas_set_vector``, ``hipblasGetMatrix``, their asynchronous forms, ...)
have the same element types: a vector as a scalar or a rank-1 array, and a
matrix as a scalar, a rank-2 array, whose leading dimension is then ``size(A, 1)``, or as
a rank-1 array with an explicit leading dimension. The element size the C
routine takes is derived from the array type.

Like the array interfaces of the math libraries, these ``hipMalloc`` and
``hipMemcpy`` overloads exist only when the Fortran 2008 interfaces are enabled: a
build with
``-DHIPFORT_USE_FPOINTER_INTERFACES=OFF`` has only the ``type(c_ptr)`` forms.
The allocation routines (``hipMalloc``, ``hipMallocManaged``, ``hipHostMalloc``,
``hipFree``, ``hipHostFree``) and ``hipHostRegister`` have no assumed-rank form, so
their per-rank overloads stay available with ``-DHIPFORT_ASSUMED_RANK=ON``.

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

   These forms appear as the ``X_typed`` and ``X_devptr`` specifics in the API
   reference; see `Specific procedure names`_.

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
  missing, hipFORT warns and falls back to the per-rank interfaces (or to the
  ``type(c_ptr)`` interfaces only, if the Fortran 2008 interfaces are off)
  instead of failing the build.
* Only **contiguous** arrays may be passed.
* ``hipMalloc`` keeps its per-rank overloads either way; ``hipMemcpy``,
  ``hipMemcpyAsync``, ``hipMemcpy2D`` and ``hipMemcpy2DAsync`` gain assumed-rank
  forms.

``test/f2018/rocblas/saxpy.f90`` is the one program that exercises this mode; it
is skipped unless the option is enabled. See the
:doc:`rocBLAS examples <../tutorials/rocblas-examples>` for a walkthrough.
