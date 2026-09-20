.. meta::
  :description: The Fortran interface variants hipFORT generates and how to call them
  :keywords: hipFORT, ROCm, Fortran, interfaces, hipMalloc, assumed-rank, f2003, f2008, f2018

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
  call site easier to read. They are guarded by the ``USE_FPOINTER_INTERFACES``
  preprocessor definition, which hipFORT enables automatically once it detects
  Fortran 2008 support in the compiler.
* **Fortran 2018 assumed-rank overloads.** An experimental opt-in that replaces
  the per-rank overloads with a single ``dimension(..)`` overload. See
  `Assumed-rank interfaces (Fortran 2018)`_ below.

By convention, application and test sources that rely on the array overloads use
the ``.f08`` file extension (see the ``test/f2008`` examples), while Fortran 2003
sources use ``.f03``.

Allocating and copying device memory
====================================

The Fortran 2003 form holds the device pointer in a ``type(c_ptr)`` and counts
bytes:

.. code-block:: fortran

   use iso_c_binding
   use hip
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

   use hip
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
``hipMemcpy`` overloads are not guarded by ``USE_FPOINTER_INTERFACES``, so they
are available in every hipFORT build.

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
