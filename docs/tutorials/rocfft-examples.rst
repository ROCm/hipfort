.. meta::
  :description: rocFFT examples written with the hipFORT Fortran interfaces
  :keywords: hipFORT, ROCm, rocFFT, FFT, Fortran, examples, tutorials

***************
rocFFT examples
***************

`rocFFT <https://rocm.docs.amd.com/projects/rocFFT/en/latest/>`_ is the AMD
implementation of the fast Fourier transform for AMD GPUs. hipFORT exposes it
through the ``hipfort_rocfft`` module, which mirrors the rocFFT C API one to
one.

Every program on this page is a complete, self-contained example that is built
and run as part of the hipFORT test suite. The Fortran 2008 sources live in
``test/f2008/rocfft`` and the equivalent Fortran 2003 sources, which use
``type(c_ptr)`` device pointers and explicit byte counts instead of Fortran
array pointers, live in ``test/f2003/rocfft``.

Most of the examples are Fortran counterparts of the C++ samples shipped with
rocFFT in ``clients/samples/rocfft``:

.. list-table::
   :header-rows: 1
   :widths: 45 55

   * - rocFFT sample
     - hipFORT example
   * - ``rocfft_example_complexcomplex.cpp``
     - `Complex-to-complex transform`_, `Out-of-place transforms`_,
       `Managing the work buffer`_
   * - ``rocfft_example_realcomplex.cpp``
     - `Real-to-complex and complex-to-real transforms`_,
       `In-place real transforms`_
   * - ``rocfft_example_set_stream.cpp``
     - `Running on HIP streams`_
   * - ``rocfft_example_callback.cpp``
     - Not available: load and store callbacks require device functions, which
       cannot be written in Fortran.

The remaining examples cover material from the rocFFT how-to guides:
`Normalizing with a scale factor`_, `Inspecting a plan`_ and
`Reusing compiled kernels`_.

Two areas have no Fortran counterpart. Distributed transforms, which the
``clients/samples/multi_gpu`` sample demonstrates, are built on the rocFFT
field and brick API that is still an experimental preview, and MPI transforms
need a rocFFT built with MPI support. The hipFORT interfaces for both
(``rocfft_field_create``, ``rocfft_brick_create``,
``rocfft_plan_description_set_comm`` and friends) are generated and callable,
but they are not exercised by the test suite.

Transform workflow
==================

A rocFFT transform always follows the same sequence:

#. Call ``rocfft_setup`` once before any other rocFFT call.
#. Optionally create a plan description with ``rocfft_plan_description_create``
   to set a data layout, a scale factor, or other advanced properties.
#. Create a plan with ``rocfft_plan_create``, passing the placement
   (in-place or not), the transform type, the precision, the rank, the
   transform lengths, and the batch size.
#. Optionally create an execution info handle with
   ``rocfft_execution_info_create`` to supply a HIP stream or a work buffer.
#. Run the transform with ``rocfft_execute``.
#. Release the plan with ``rocfft_plan_destroy`` and call ``rocfft_cleanup``
   when the application is done with rocFFT.

Keep the following conventions in mind:

* rocFFT transforms are **unnormalized**. A forward transform followed by an
  inverse transform of length ``N`` returns ``N`` times the original data,
  unless a scale factor is attached to one of the plans.
* The ``lengths`` array passed to ``rocfft_plan_create`` starts with the
  fastest-varying dimension, which matches Fortran's column-major storage:
  for an ``Nx`` by ``Ny`` transform, ``lengths = [Nx, Ny]``.
* Real forward transforms produce Hermitian-symmetric output, so only
  ``N/2 + 1`` complex values are stored. Size the complex buffer accordingly.
* ``rocfft_execute`` takes *arrays* of buffer pointers. In Fortran you pass a
  ``type(c_ptr)`` expression, such as ``c_loc(dx)``, and the compiler passes
  its address. For in-place transforms the output argument is ``c_null_ptr``.
* Every rocFFT call returns a status code. The examples wrap them in
  ``rocfftCheck`` from the ``hipfort_check`` module, which aborts on failure.

Building an example
===================

The examples only need the ``rocfft`` and ``hip`` hipFORT components:

.. code-block:: cmake

   find_package(hipfort REQUIRED COMPONENTS hip rocfft)

   add_executable(my_fft rocfft_c2c_1d_z.f08)
   target_link_libraries(my_fft PRIVATE hipfort::rocfft hipfort::hip)

See :doc:`../how-to/using-hipfort` for the full set of build options.

Complex-to-complex transform
============================

The simplest case: an in-place, single-batch, one-dimensional complex-to-complex
transform in double precision. The program runs a forward transform followed by
an inverse transform and checks that the result is ``N`` times the input, which
demonstrates that rocFFT does not normalize.

.. literalinclude:: ../../test/f2008/rocfft/rocfft_c2c_1d_z.f08
   :language: fortran

Use ``rocfft_precision_single`` and ``complex(4)`` host data for a single
precision transform, as in ``test/f2008/rocfft/rocfft_c2c_1d_c.f08``.

Real-to-complex and complex-to-real transforms
==============================================

Real transforms use ``rocfft_transform_type_real_forward`` and
``rocfft_transform_type_real_inverse``. Because the spectrum of real data is
Hermitian symmetric, the complex buffer holds ``N/2 + 1`` elements.

.. literalinclude:: ../../test/f2008/rocfft/rocfft_r2c_c2r_1d_d.f08
   :language: fortran

In-place real transforms
========================

An in-place real transform reads real values and writes ``N/2 + 1`` complex
values into the same allocation, so the real buffer must be padded to
``2*(N/2 + 1)`` reals: two extra reals in the contiguous dimension. The input
and output array types are declared on a plan description with
``rocfft_plan_description_set_data_layout``.

.. literalinclude:: ../../test/f2008/rocfft/rocfft_r2c_c2r_1d_inplace_d.f08
   :language: fortran

Multi-dimensional transforms
============================

A multi-dimensional transform only differs in the rank argument and the number
of entries in the ``lengths`` array. The first entry is the fastest-varying
dimension.

.. literalinclude:: ../../test/f2008/rocfft/rocfft_c2c_2d_z.f08
   :language: fortran

``test/f2008/rocfft/rocfft_c2c_3d_z.f08`` extends the same pattern to three
dimensions.

Batched transforms
==================

To transform many signals with one plan, pass the batch count as the
``number_of_transforms`` argument and describe the memory layout with
``rocfft_plan_description_set_data_layout``. The distance argument gives the
number of elements between the start of consecutive signals.

.. literalinclude:: ../../test/f2008/rocfft/rocfft_c2c_1d_batched_z.f08
   :language: fortran

Out-of-place transforms
=======================

With ``rocfft_placement_notinplace``, the result is written to a separate
buffer that is passed as the third argument of ``rocfft_execute``. Note that
rocFFT is allowed to overwrite the input buffer of an out-of-place transform,
so do not rely on its contents afterwards.

.. literalinclude:: ../../test/f2008/rocfft/rocfft_c2c_1d_notinplace_z.f08
   :language: fortran

Normalizing with a scale factor
===============================

Instead of scaling the result with a separate kernel, attach a scale factor to
a plan description. rocFFT multiplies every output element by that factor, so a
factor of ``1/N`` on the inverse plan makes the round trip reproduce the input.

.. literalinclude:: ../../test/f2008/rocfft/rocfft_scale_factor_z.f08
   :language: fortran

Managing the work buffer
========================

Large transforms need scratch memory. rocFFT allocates and frees it on every
``rocfft_execute`` call unless the application provides a buffer. Query the
requirement with ``rocfft_plan_get_work_buffer_size`` and hand a buffer over
with ``rocfft_execution_info_set_work_buffer`` to control its lifetime or to
share one allocation between several plans.

.. literalinclude:: ../../test/f2008/rocfft/rocfft_work_buffer_z.f08
   :language: fortran

Running on HIP streams
======================

By default rocFFT executes on the null stream. Associate an application-owned
stream with an execution info handle to overlap independent transforms. The
handle must be passed to every ``rocfft_execute`` call that should use the
stream, and each stream has to be synchronized before its results are read
back. This example runs two independent transforms on two streams.

.. literalinclude:: ../../test/f2008/rocfft/rocfft_stream_z.f08
   :language: fortran

Inspecting a plan
=================

``rocfft_plan_get_print`` writes a summary of a plan to stdout: the precision,
the transform type, the placement, the array types, and the strides, offsets
and distances that rocFFT derived from the plan description. It is the quickest
way to confirm that a layout was described as intended. The call writes from C,
so flush the Fortran output unit first to keep both streams in order.

.. literalinclude:: ../../test/f2008/rocfft/rocfft_plan_print_z.f08
   :language: fortran

Reusing compiled kernels
========================

rocFFT ships kernels for common problems and compiles the rest when a plan is
created. Those runtime-compiled kernels are cached in memory for the lifetime
of the process. ``rocfft_cache_serialize`` copies the cache into a buffer that
rocFFT allocates, which the application can store and hand to
``rocfft_cache_deserialize`` in a later process to avoid compiling the same
kernels again. Release the buffer with ``rocfft_cache_buffer_free``.

.. literalinclude:: ../../test/f2008/rocfft/rocfft_cache_z.f08
   :language: fortran

Setting the ``ROCFFT_RTC_CACHE_PATH`` environment variable to a writable file
achieves the same result without any application code: rocFFT then persists
compiled kernels there by itself.

Querying the rocFFT version
===========================

``rocfft_get_version_string`` fills a C string buffer of at least 30
characters. Pass the address of the first element of a ``character(kind=c_char)``
array and the buffer capacity, then copy the result up to the terminating NUL.

.. literalinclude:: ../../test/f2008/rocfft/rocfft_version.f08
   :language: fortran
