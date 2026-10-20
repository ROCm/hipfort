.. meta::
  :description: hipFFT examples written with the hipFORT Fortran interfaces
  :keywords: hipFORT, ROCm, hipFFT, FFT, Fortran, examples, tutorials

***************
hipFFT examples
***************

`hipFFT <https://rocm.docs.amd.com/projects/hipFFT/en/latest/>`_ is a thin layer
over rocFFT with an API that follows cuFFT. hipFORT exposes it through the
``hipfort_hipfft`` module.

Every program on this page is complete and self-contained, and is built
and run as part of the hipFORT test suite. The Fortran 2008 version of each
program lives in ``test/f2008/hipfft``, and the equivalent Fortran 2003 version,
which uses ``type(c_ptr)`` device pointers and explicit byte counts instead of
Fortran array pointers, lives in ``test/f2003/hipfft``. The Xt programs exist
only in the Fortran 2003 form.

If you want direct access to rocFFT rather than a cuFFT-style interface, see
the :doc:`rocFFT examples <rocfft-examples>`. For FFTW3-compatible code, see the
:doc:`hipFFTW examples <hipfftw-examples>`.

Transform workflow
==================

A hipFFT transform follows the same sequence as cuFFT:

#. Create a plan with ``hipfftPlan1d``, ``hipfftPlan2d``, ``hipfftPlan3d`` or
   ``hipfftPlanMany``, passing the transform lengths and the transform type.
   ``hipfftPlan1d`` and ``hipfftPlanMany`` also take a batch count;
   ``hipfftPlan2d`` and ``hipfftPlan3d`` always describe a single transform.
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

Use ``HIPFFT_C2C`` and ``complex(4)`` host data for a single-precision
transform, as in ``test/f2008/hipfft/hipfft_c2c_1d_c.f08``.

Real-to-complex and complex-to-real transforms
==============================================

Real transforms use ``HIPFFT_D2Z`` and ``HIPFFT_Z2D``. Because the spectrum of
real data is Hermitian symmetric, the complex buffer holds ``N/2 + 1`` elements.

.. literalinclude:: ../../test/f2008/hipfft/hipfft_r2c_c2r_1d_d.f08
   :language: fortran

``test/f2008/hipfft/hipfft_r2c_c2r_1d_s.f08`` is the single-precision
equivalent, using ``HIPFFT_R2C`` and ``HIPFFT_C2R``.

Multi-dimensional transforms
============================

A two-dimensional transform uses ``hipfftPlan2d``. The last dimension is
contiguous, so a plan created as ``hipfftPlan2d(plan, Nx, Ny, type)`` expects
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
and friends refine that estimate for a given handle and parameter set, and
``hipfftGetSize`` reports the exact requirement of a plan that has already been
made.

.. literalinclude:: ../../test/f2008/hipfft/hipfft_estimate_getsize_d.f08
   :language: fortran

Managing the work area
======================

By default a plan allocates its own work area. Call
``hipfftSetAutoAllocation`` with ``0`` before building the plan to turn that
off, then supply your own buffer with ``hipfftSetWorkArea``. This lets several
plans share one allocation, or lets the application control when the memory is
reserved. Plans built this way use ``hipfftCreate`` and ``hipfftMakePlanMany``
rather than ``hipfftPlanMany``, because auto-allocation has to be turned off
between the two calls, and the required work area size is only known once
``hipfftMakePlanMany`` has returned it.

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

Transforms on hipDataType with the Xt API
=========================================

``hipfftXtMakePlanMany`` describes a batched transform like
``hipfftMakePlanMany``, but takes 64-bit lengths, strides and distances, and
names the input, output and execution data types with ``hipDataType`` values
(``HIP_C_32F``, ``HIP_C_64F``, ``HIP_R_32F``, ...) instead of a transform type.
``hipfftXtGetSizeMany`` returns the work area size for the same parameters, and
``hipfftXtExec`` runs the plan whatever its data types, taking the direction for
complex transforms.

.. literalinclude:: ../../test/f2003/hipfft/hipfft_xt_makeplanmany_c.f03
   :language: fortran

Multi-GPU transforms
====================

A plan can be spread over several GPUs of the same process. The data then lives
in a descriptor that hipFFT allocates and distributes, rather than in a buffer
of yours:

#. Create an empty plan with ``hipfftCreate``, and list the GPUs with
   ``hipfftXtSetGPUs`` **before** making it.
#. Make the plan with ``hipfftMakePlan2d``, ``hipfftMakePlan3d`` or
   ``hipfftMakePlanMany``. A multi-GPU plan writes one work area size per GPU,
   so pass the first element of an ``integer(c_size_t)`` array with one slot
   per GPU.
#. Allocate the data with ``hipfftXtMalloc``. It returns the address of a
   ``hipLibXtDesc`` in a ``type(c_ptr)``.
#. Copy the host data in and out with ``hipfftXtMemcpy``, passing that
   ``type(c_ptr)`` on the device side, and run the transform with the
   ``hipfftXtExecDescriptor`` routine matching the plan type
   (``hipfftXtExecDescriptorZ2Z``, ``hipfftXtExecDescriptorC2C``, ...).
#. Release the descriptor with ``hipfftXtFree``, then the plan with
   ``hipfftDestroy``.

The descriptor is owned by hipFFT. Associate a ``type(hipLibXtDesc), pointer``
with the address ``hipfftXtMalloc`` returned, using ``c_f_pointer``, and pass
that pointer to ``hipfftXtExecDescriptor*`` and ``hipfftXtFree``. Never pass a
copy of the type: ``hipfftXtFree`` would then release the wrong address. The
``descriptor`` field leads in the same way to a ``hipXtDesc``, whose ``nGPUs``,
``GPUs``, ``data`` and ``size`` fields say where each part of the data is.

The ``hipLibXtDesc`` and ``hipXtDesc`` types are in the
``hipfort_hipfft_types`` module, which ``hipfort_hipfft`` uses, and the Xt
constants (``HIPFFT_XT_FORMAT_INPLACE``, ``HIPFFT_COPY_HOST_TO_DEVICE``, ...)
are in ``hipfort_hipfft_enums``.

On AMD GPUs a descriptor needs a plan over two or more GPUs, and unbatched
one-dimensional transforms are not supported. This program runs a
two-dimensional transform on two GPUs, forward then inverse, and checks the
result against the input; on a machine with fewer than two GPUs it reports so
and the test is skipped.

.. literalinclude:: ../../test/f2003/hipfft/hipfft_xt_descriptor_z.f03
   :language: fortran

Multi-process transforms with MPI
=================================

``hipfftMpAttachComm``, ``hipfftXtSetDistribution`` and
``hipfftXtSetSubformatDefault`` distribute a transform over the ranks of an MPI
communicator. They are bound in ``hipfort_hipfft``, but exist only in a hipFFT
built with MPI support (``HIPFFT_MPI_ENABLE``), which the ROCm packages are
not: with those, a program that calls them does not link.

``hipfftMpAttachComm`` takes a ``type(c_ptr)`` to a **C** ``MPI_Comm``, not a
Fortran communicator handle. The size and the representation of ``MPI_Comm``
depend on the MPI implementation, so build it in C from the Fortran handle with
``MPI_Comm_f2c``, for example with this helper:

.. code-block:: c

   #include <mpi.h>
   #include <stdlib.h>

   /* The C communicator for a Fortran one, in storage the caller frees. */
   void* c_comm_from_fortran(MPI_Fint fcomm)
   {
     MPI_Comm* comm = malloc(sizeof *comm);
     *comm = MPI_Comm_f2c(fcomm);
     return comm;
   }

.. code-block:: fortran

   use iso_c_binding
   use mpi_f08
   use hipfort_check
   use hipfort_hipfft

   interface
     function c_comm_from_fortran(fcomm) bind(c, name="c_comm_from_fortran")
       import :: c_ptr, c_int
       integer(c_int), value :: fcomm
       type(c_ptr) :: c_comm_from_fortran
     end function
   end interface

   type(c_ptr) :: comm

   comm = c_comm_from_fortran(MPI_COMM_WORLD%MPI_VAL)
   call hipfftCheck(hipfftMpAttachComm(plan, HIPFFT_COMM_MPI, comm))

hipFFT keeps the pointer rather than a copy of the communicator, so the storage
it points to has to outlive the plan. The plan must be attached to the
communicator before it is made.
