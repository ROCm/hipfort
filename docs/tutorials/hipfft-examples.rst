.. meta::
  :description: hipFFT examples written with the hipFORT Fortran interfaces
  :keywords: hipFORT, ROCm, hipFFT, FFT, Fortran, examples, tutorials

***************
hipFFT examples
***************

`hipFFT <https://rocm.docs.amd.com/projects/hipFFT/en/latest/>`_ is a thin layer
over rocFFT whose API follows cuFFT. hipFORT exposes it through the
``hipfort_hipfft`` module.

Every program on this page is complete and self-contained, and is built
and run as part of the hipFORT test suite. The Fortran 2008 tests live in
``test/f2008/hipfft`` and the equivalent Fortran 2003 sources, which use
``type(c_ptr)`` device pointers and explicit byte counts instead of Fortran
array pointers, live in ``test/f2003/hipfft``.

If you want direct access to rocFFT rather than a cuFFT-style interface, see
:doc:`rocfft-examples`.

Transform workflow
==================

A hipFFT transform follows the same sequence as cuFFT:

#. Create a plan with ``hipfftPlan1d``, ``hipfftPlan2d``, ``hipfftPlan3d`` or
   ``hipfftPlanMany``, passing the transform lengths, the transform type and
   the batch count.
#. Run the transform with the ``hipfftExec`` routine matching the plan type:
   ``hipfftExecZ2Z`` and ``hipfftExecC2C`` for complex-to-complex,
   ``hipfftExecD2Z`` and ``hipfftExecR2C`` for real-to-complex,
   ``hipfftExecZ2D`` and ``hipfftExecC2R`` for complex-to-real.
#. Release the plan with ``hipfftDestroy``.

Keep the following conventions in mind:

* hipFFT transforms are **unnormalized**. A forward transform followed by an
  inverse transform of length ``N`` returns ``N`` times the original data.
* The transform type encodes the precision: ``HIPFFT_Z2Z`` and ``HIPFFT_D2Z``
  are double precision, ``HIPFFT_C2C`` and ``HIPFFT_R2C`` are single.
* Complex-to-complex transforms take a direction, ``HIPFFT_FORWARD`` or
  ``HIPFFT_BACKWARD``. Real transforms take their direction from the type.
* Real forward transforms produce Hermitian-symmetric output, so only
  ``N/2 + 1`` complex values are stored. Size the complex buffer accordingly.
* Multi-dimensional plans take lengths in C order, with the **last** dimension
  contiguous. This is the opposite of rocFFT, which takes the fastest-varying
  dimension first.
* Every hipFFT call returns a status code. The programs wrap them in
  ``hipfftCheck`` from the ``hipfort_check`` module, which aborts on failure.

Building and running
====================

The programs only need the ``hipfft`` and ``hip`` hipFORT components:

.. code-block:: cmake

   find_package(hipfort REQUIRED COMPONENTS hip hipfft)

   add_executable(my_fft hipfft_c2c_1d_z.f08)
   target_link_libraries(my_fft PRIVATE hipfort::hipfft hipfort::hip)

See :doc:`../how-to/using-hipfort` for the full set of build options.

Complex-to-complex transform
============================

The simplest case: an in-place, single-batch, one-dimensional complex-to-complex
transform in double precision. The program runs a forward transform followed by
an inverse transform and checks that the result is ``N`` times the input, which
demonstrates that hipFFT does not normalize.

.. literalinclude:: ../../test/f2008/hipfft/hipfft_c2c_1d_z.f08
   :language: fortran

Use ``HIPFFT_C2C`` and ``complex(4)`` host data for a single precision
transform, as in ``test/f2008/hipfft/hipfft_c2c_1d_c.f08``.

Real-to-complex and complex-to-real transforms
==============================================

Real transforms use ``HIPFFT_D2Z`` and ``HIPFFT_Z2D``. Because the spectrum of
real data is Hermitian symmetric, the complex buffer holds ``N/2 + 1`` elements.

.. literalinclude:: ../../test/f2008/hipfft/hipfft_r2c_c2r_1d_d.f08
   :language: fortran

``test/f2008/hipfft/hipfft_r2c_c2r_1d_s.f08`` is the single precision
equivalent, using ``HIPFFT_R2C`` and ``HIPFFT_C2R``.

Multi-dimensional transforms
============================

A two-dimensional transform uses ``hipfftPlan2d``. The last dimension is
contiguous, so a plan created as ``hipfftPlan2d(plan, Nx, Ny, ...)`` expects
``Ny`` to vary fastest in memory.

.. literalinclude:: ../../test/f2008/hipfft/hipfft_c2c_2d_z.f08
   :language: fortran

``test/f2008/hipfft/hipfft_c2c_3d_z.f08`` extends the same pattern to three
dimensions with ``hipfftPlan3d``.

Batched transforms
==================

To transform many signals with one plan, use ``hipfftPlanMany`` and pass the
batch count. The ``inembed`` and ``onembed`` arrays describe the memory layout;
passing null pointers selects the contiguous default.

.. literalinclude:: ../../test/f2008/hipfft/hipfft_c2c_1d_batched_z.f08
   :language: fortran

Advanced data layout
====================

``hipfftPlanMany`` also describes strided and interleaved data. The stride is
the distance between consecutive elements of one transform, and the distance is
the gap between the start of consecutive transforms. This program batches a
two-dimensional transform.

.. literalinclude:: ../../test/f2008/hipfft/hipfft_planmany_2d_z2z.f08
   :language: fortran

Querying the work area size
===========================

hipFFT needs scratch memory whose size depends on the transform. There are two
ways to ask about it. ``hipfftEstimate1d`` and friends give a heuristic upper
bound before a plan exists, which is useful for budgeting. ``hipfftGetSize1d``
and ``hipfftGetSize`` report the exact requirement of a plan that has already
been created.

.. literalinclude:: ../../test/f2008/hipfft/hipfft_estimate_getsize_d.f08
   :language: fortran

Managing the work area
======================

By default a plan allocates its own work area. Call
``hipfftSetAutoAllocation`` with ``0`` before building the plan to turn that
off, then supply your own buffer with ``hipfftSetWorkArea``. This lets several
plans share one allocation, or lets the application control when the memory is
reserved. Plans built this way use ``hipfftCreate`` and ``hipfftMakePlanMany``
rather than ``hipfftPlanMany``, because the work area has to be configured
between the two calls.

.. literalinclude:: ../../test/f2008/hipfft/hipfft_makeplanmany_z.f08
   :language: fortran

Running on HIP streams
======================

By default hipFFT executes on the null stream. Bind a plan to an
application-owned stream with ``hipfftSetStream`` to overlap independent
transforms. Each stream has to be synchronized before its results are read
back. This program runs two plans, each on its own stream, with different
input harmonics so that a swapped stream would be visible in the output.

.. literalinclude:: ../../test/f2008/hipfft/hipfft_setstream_z.f08
   :language: fortran
