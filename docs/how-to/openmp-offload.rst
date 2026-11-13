.. meta::
  :description: How to call hipFORT library routines on arrays mapped with OpenMP offload
  :keywords: hipFORT, ROCm, Fortran, OpenMP, offload, use_device_addr, amdflang, hipBLAS

*********************************
Using hipFORT with OpenMP offload
*********************************

Applications built with LLVM Flang (``amdflang`` in ROCm) and OpenMP offload
often manage GPU data with ``map`` clauses instead of ``hipMalloc`` and
``hipMemcpy``. hipFORT routines can work directly on these mapped arrays. On a
GPU without unified memory, the library needs the device address of each array,
not its host address. The ``use_device_addr`` clause provides it.

The example on this page is adapted from one by Lynd Stringer.

The pattern
===========

The following program computes ``y := alpha * x + y`` three times with
``hipblasSaxpy`` on arrays mapped to the device by OpenMP: twice with
``use_device_addr``, once through each interface, and once with
``use_device_ptr``:

.. literalinclude:: ../../test/openmp/hipblas/test_hipblas_saxpy_device_addr.f90
   :language: fortran
   :start-at: program test_hipblas_saxpy_device_addr

The outer ``target data`` region copies ``x`` and ``y`` to the device and
copies ``y`` back to the host when it ends. In the inner region,
``use_device_addr(x, y)`` makes ``x`` and ``y`` refer to their device copies,
so hipBLAS reads and writes device memory. Keep three points in mind:

* **Synchronize before the outer** ``end target data``. hipBLAS routines are
  asynchronous: they return once the work is queued. Without a call to
  ``hipDeviceSynchronize`` (or a synchronization of the handle's stream), the
  outer ``end target data`` can copy ``y`` back before the GPU has written it.
  The example waits for the whole device for brevity; an application usually
  waits only for the handle's stream (``hipblasGetStream``, then
  ``hipStreamSynchronize``).
* ``alpha`` **stays on the host.** Only arrays go in ``use_device_addr``. The
  handle uses the default host pointer mode, so hipBLAS reads ``alpha`` from
  host memory. To pass a device scalar instead, see :doc:`fortran-interfaces`.
* **One generic, two interfaces.** The first call uses the array overload:
  ``x`` and ``y`` are passed as Fortran arrays and hipFORT takes their
  addresses. The second call uses the raw interface, which follows the C API
  and needs only Fortran 2003: inside ``use_device_addr``, ``c_loc(x)`` is the
  device address, passed as a ``type(c_ptr)``. Both are specific procedures of
  the generic ``hipblasSaxpy``.

The offload is done in a subroutine whose dummy arguments ``x(n)`` and
``y(n)`` are explicit-shape, because of an ``amdflang`` limitation. An
allocatable or assumed-shape array carries a descriptor. With the ``amdflang``
versions tested (ROCm 10.1 and 10.2), ``use_device_addr`` on such an array
maps the descriptor too, and the host then reads it from device memory, which
crashes on a discrete GPU. Explicit-shape dummies have no descriptor, so they
avoid the problem. The third call shows the other way, which works on the
allocatables themselves: ``use_device_ptr`` on ``type(c_ptr)`` variables set to
``c_loc(x)`` and ``c_loc(y)`` before the region, passed to the raw interface.

Build the program with the OpenMP offload flags, for example
``amdflang -fopenmp --offload-arch=gfx90a``, and link it against
``hipfort::hipblas``. The hipFORT test suite builds and runs this example when
the Fortran compiler is LLVM Flang with OpenMP offload support; see
``test/openmp/README.openmp``.

If you link with ``-Wl,--gc-sections`` (see :ref:`hipfort-gc-sections`), also
link with ``-Wl,-z,nostart-stop-gc``. ``amdflang`` links with ``ld.lld``, which
by default lets ``-Wl,--gc-sections`` remove the table of offload kernels, so
the program aborts at its first ``target`` construct.

Unified memory
==============

On a system with unified memory, such as the MI300A, a program built with
``-fopenmp-force-usm`` can pass host arrays to the library directly. The
``target data`` regions and ``use_device_addr`` are then not needed, but the
``hipDeviceSynchronize`` call before reading the results on the host still is.

Run such a program with XNACK on (``HSA_XNACK=1``): with XNACK off, the GPU
cannot access host memory on demand, and the first library call faults. The
same holds for a program that passes host allocations to a library without
``-fopenmp-force-usm``. The ``test/openmp/<library>/test_*_host.f90`` programs
of the hipFORT test suite do exactly that, one per library, and run only in the
XNACK matrix below.

To run the test suite in both XNACK modes, configure it with
``-DBUILD_TESTING=ON -DHIPFORT_XNACK_MATRIX=ON``. Every test then also runs with
``HSA_XNACK=1``, and with LLVM Flang, each OpenMP offload test also runs as a
``-fopenmp-force-usm`` build. The option is off by default.
