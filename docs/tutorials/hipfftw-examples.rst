.. meta::
  :description: hipFFTW examples written with the hipFORT Fortran interfaces
  :keywords: hipFORT, ROCm, hipFFTW, FFTW, FFT, Fortran, examples, tutorials

****************
hipFFTW examples
****************

hipFFTW is the FFTW3-compatible interface shipped with
`hipFFT <https://rocm.docs.amd.com/projects/hipFFT/en/latest/>`_. The routine
names, planner flags and calling sequence are those of FFTW3, so existing FFTW
code moves across with little change. hipFORT exposes it through the
``hipfort_hipfftw`` module.

The one difference that matters: the ``in`` and ``out`` arguments are
**device** pointers. FFTW declares them ``void*``, so a pointer from
``hipMalloc`` passes straight through, but host arrays do not work.

Every program on this page is a complete, self-contained example that is built
and run as part of the hipFORT test suite. The tests live in
``test/f2003/hipfftw``. Unlike the other FFT libraries there is no Fortran 2008
variant, because the FFTW API is pointer-based throughout and gains nothing
from Fortran array pointers.

For the cuFFT-style interface to the same library, see :doc:`hipfft-examples`.

Transform workflow
==================

A hipFFTW transform follows the FFTW3 sequence:

#. Allocate device memory with ``hipMalloc``, or host-accessible memory with
   ``fftw_alloc_real`` and ``fftw_alloc_complex``.
#. Build a plan with ``fftw_plan_dft_1d``, ``fftw_plan_dft_r2c_1d``,
   ``fftw_plan_many_dft`` or ``fftw_plan_guru_dft``.
#. Run it with the matching ``fftw_execute_dft``, ``fftw_execute_dft_r2c`` or
   ``fftw_execute_dft_c2r``.
#. Release the plan with ``fftw_destroy_plan``.

Keep the following conventions in mind:

* FFTW transforms are **unnormalized**. A forward transform followed by an
  inverse transform of length ``N`` returns ``N`` times the original data.
* Planner flags are the standard FFTW values. ``FFTW_ESTIMATE`` is not emitted
  by the generated enums module, so declare it yourself as
  ``integer(c_int), parameter :: FFTW_ESTIMATE = 64``.
* Real forward transforms produce Hermitian-symmetric output, so only
  ``N/2 + 1`` complex values are stored.
* Multi-dimensional transforms use C row-major order, so the last dimension is
  contiguous.
* The double precision routines are named ``fftw_*`` and the single precision
  ones ``fftwf_*``.

Building an example
===================

The examples only need the ``hipfftw`` and ``hip`` hipFORT components:

.. code-block:: cmake

   find_package(hipfort REQUIRED COMPONENTS hip hipfftw)

   add_executable(my_fft hipfftw_c2c.f03)
   target_link_libraries(my_fft PRIVATE hipfort::hipfftw hipfort::hip)

See :doc:`../how-to/using-hipfort` for the full set of build options.

Complex-to-complex transform
============================

A one-dimensional complex-to-complex transform. The plan is built with
``fftw_plan_dft_1d`` over two device pointers and executed once. The input is
a sum of two harmonics, so the output has energy in exactly two bins.

.. literalinclude:: ../../test/f2003/hipfftw/hipfftw_c2c.f03
   :language: fortran

Real-to-complex and complex-to-real transforms
==============================================

``fftw_plan_dft_r2c_1d`` and ``fftw_plan_dft_c2r_1d`` build the two halves of a
real round trip. The complex side holds ``N/2 + 1`` elements.

.. literalinclude:: ../../test/f2003/hipfftw/hipfftw_r2c_c2r.f03
   :language: fortran

Multi-dimensional transforms
============================

``fftw_plan_dft_2d`` takes the dimensions in C order, so the second argument
varies fastest in memory.

.. literalinclude:: ../../test/f2003/hipfftw/hipfftw_dft_2d.f03
   :language: fortran

``test/f2003/hipfftw/hipfftw_dft_3d.f03`` extends the same pattern to three
dimensions with ``fftw_plan_dft_3d``.

Batched transforms
==================

The ``_many`` planners transform a batch of signals with one plan. The
``inembed`` and ``onembed`` arguments describe the memory layout, ``stride``
is the gap between elements of one transform and ``dist`` the gap between the
start of consecutive transforms. This example covers the complex-to-complex,
real-to-complex and complex-to-real cases.

.. literalinclude:: ../../test/f2003/hipfftw/hipfftw_many.f03
   :language: fortran

The guru interface
==================

The guru interface describes a transform as arrays of ``fftw_iodim``
descriptors, one per dimension, each giving a length and its input and output
strides. It expresses layouts the simpler planners cannot.

Note how the arrays are passed: the dummy arguments are scalar
``type(fftw_iodim)``, so the example passes the first element of each array and
the callee receives the base address of the contiguous struct array.

.. literalinclude:: ../../test/f2003/hipfftw/hipfftw_guru.f03
   :language: fortran

Allocating buffers
==================

``fftw_alloc_real`` and ``fftw_alloc_complex``, along with the ``fftwf_``
single precision forms, return correctly aligned host-accessible buffers that
can be handed straight to a plan. Use ``c_f_pointer`` to get a Fortran array
view, and release them with ``fftw_free``.

.. literalinclude:: ../../test/f2003/hipfftw/hipfftw_alloc.f03
   :language: fortran
