.. meta::
  :description: HIP runtime examples written with the hipFORT Fortran interfaces
  :keywords: hipFORT, ROCm, HIP, runtime, Fortran, examples, tutorials

********************
HIP runtime examples
********************

The `HIP runtime <https://rocm.docs.amd.com/projects/HIP/en/latest/>`_ is the
API used to manage devices, memory, streams, events, graphs and kernel
launches. hipFORT exposes it through the ``hipfort`` module, with enumerators in
``hipfort_enums``, derived types in ``hipfort_types``, and the status-checking
helpers in ``hipfort_check``. A few routines live in their own modules:
``hipGetDeviceProperties`` in ``hipfort_auxiliary``, ``hipMemcpy2DAsync`` in
``hipfort_hipmemcpy`` and ``hipHostRegister`` in ``hipfort_hiphostregister``.

Every program on this page is complete and self-contained, and is built and run
as part of the hipFORT test suite. The sources live in ``test/f2003/hip``, and
the programs that benefit from Fortran array pointers have a Fortran 2008 twin
in ``test/f2008/hip``.

Conventions
===========

* **Device pointers.** The Fortran 2003 programs hold device memory in a
  ``type(c_ptr)`` and pass byte counts, as in ``hipMalloc(dx, nbytes)`` and
  ``hipMemcpy(dx, c_loc(hx(1)), nbytes, hipMemcpyHostToDevice)``. The Fortran
  2008 interfaces instead accept a Fortran array pointer and an element count,
  as in ``hipMalloc(dx, n)`` or ``hipMalloc(dx, source=hx)``.
* **Every call returns a status code.** The programs wrap calls in ``hipCheck``
  from the ``hipfort_check`` module, which aborts on failure. A call whose
  non-success return is the thing being tested, such as ``hipStreamQuery``,
  keeps the status in a variable instead.
* **Enumerators are integers.** Declare status variables as
  ``integer(kind(hipSuccess))`` so they match the kind the interfaces return.
* **Host callbacks and kernel stubs** are passed as ``c_funloc`` of a procedure
  declared ``bind(c)``.

Building and running
====================

The programs only need the ``hip`` hipFORT component:

.. code-block:: cmake

   find_package(hipfort REQUIRED COMPONENTS hip)

   add_executable(my_app stream.f03)
   target_link_libraries(my_app PRIVATE hipfort::hip)

See :doc:`../how-to/using-hipfort` for the full set of build options.

Device management
=================

The device queries report how many GPUs are visible, select one for the calling
thread, and read back its limits and free memory.

.. literalinclude:: ../../test/f2003/hip/device_management.f03
   :language: fortran

``hipGetDeviceProperties`` returns the same information in one
``hipDeviceProp_t`` structure; ``test/f2003/hip/device_properties.f03`` reads it
and cross-checks a few fields against ``hipDeviceGetAttribute``.

Memory copies and fills
=======================

Beyond ``hipMemcpy`` and ``hipMemset``, the runtime offers pitched two
dimensional operations, typed fills, and asynchronous forms that take a stream.

.. literalinclude:: ../../test/f2003/hip/memory_ops.f03
   :language: fortran

``test/f2003/hip/memcpy2d.f03`` covers ``hipMemcpy2D`` on a column-major matrix,
and ``test/f2003/hip/memcpy_async.f03`` covers ``hipMemcpyAsync`` and
``hipMemcpyWithStream``.

Pinned and managed memory
=========================

``hipHostMalloc`` allocates page-locked host memory, which the GPU can copy
to and from without a staging buffer.

.. literalinclude:: ../../test/f2003/hip/host_malloc.f03
   :language: fortran

An existing host array can be page-locked in place with ``hipHostRegister``
(``test/f2003/hip/host_register.f03``). ``hipMallocManaged``
(``test/f2003/hip/malloc_managed.f03``) allocates memory that both the host and
the device address directly, and ``test/f2003/hip/mem_advise.f03`` adds
migration hints on top of it. ``test/f2003/hip/pointer_attributes.f03`` queries
which of the three kinds a pointer belongs to.

Virtual memory management
=========================

The virtual memory API separates the address range from the physical memory
backing it: reserve a range, create a physical allocation, map one onto the
other, then grant the device access. This allows an allocation to grow without
changing the pointer the application already holds.

.. literalinclude:: ../../test/f2003/hip/virtual_memory.f03
   :language: fortran

Streams
=======

Work queued on the same stream runs in order, and work on different streams may
overlap. Streams can be created with flags and with a priority from the range
the device reports.

.. literalinclude:: ../../test/f2003/hip/stream_flags.f03
   :language: fortran

``test/f2003/hip/stream.f03`` shows the basic create, synchronize and destroy
sequence.

Host functions on a stream
==========================

``hipStreamAddCallback`` and ``hipLaunchHostFunc`` run a host procedure once the
work queued before it on the stream has completed.

.. literalinclude:: ../../test/f2003/hip/stream_callback.f03
   :language: fortran

Events
======

Events mark a point in a stream. They time device work and make one stream wait
for another.

.. literalinclude:: ../../test/f2003/hip/event_timing.f03
   :language: fortran

``test/f2003/hip/event.f03`` shows the shorter form: record, synchronize and
read the elapsed time.

Graphs
======

A graph records a sequence of operations and their dependencies once, so that
repeated executions skip the per-call launch overhead. The simplest way to
build one is to capture a stream.

.. literalinclude:: ../../test/f2003/hip/graph.f03
   :language: fortran

A graph can also be built node by node, with the dependencies stated
explicitly.

.. literalinclude:: ../../test/f2003/hip/graph_nodes.f03
   :language: fortran

``test/f2003/hip/graph_memset_node.f03`` adds a memset node from a
``hipMemsetParams`` structure, and ``test/f2003/hip/graph_empty_node.f03``
builds a diamond shape with an empty node as the join point.

Launching a kernel
==================

Kernels themselves are written in HIP C++. The Fortran program calls a small
``bind(c)`` launcher that the HIP compiler builds alongside it.

.. literalinclude:: ../../test/f2003/vecadd/main.f03
   :language: fortran

The kernel and its launcher:

.. literalinclude:: ../../test/f2003/vecadd/hip_implementation.cpp
   :language: cpp

Loading a code object
=====================

The module API loads a kernel from a code object at run time, which avoids
linking any HIP C++ into the Fortran program. Build the code object with
``hipcc --genco`` and look the kernel up by its mangled name.

.. literalinclude:: ../../test/f2003/hip/module_kernel.f03
   :language: fortran

Occupancy
=========

The occupancy calculator reports how many blocks of a given size can be
resident on a compute unit, and suggests a block size that maximizes occupancy.
Both entry points take the host stub of a kernel.

.. literalinclude:: ../../test/f2003/hip/occupancy.f03
   :language: fortran

``hipModuleOccupancyMaxActiveBlocksPerMultiprocessor`` answers the same
question for a kernel loaded from a code object.

Cooperative launch
==================

A cooperative launch guarantees that every block of the grid is resident at the
same time, which is what allows a kernel to synchronize across the whole grid.
The grid is therefore limited by the occupancy of the kernel times the number of
compute units, and a larger grid is rejected.

.. literalinclude:: ../../test/f2003/hip/cooperative_launch.f03
   :language: fortran

Error handling and version queries
==================================

HIP records the last error per thread. ``hipPeekAtLastError`` reads it and
``hipGetLastError`` reads and clears it, and both a short name and a
description are available for any status code.

.. literalinclude:: ../../test/f2003/hip/error_version.f03
   :language: fortran

Peer access
===========

On a multi-GPU host, one device can address another device's memory once peer
access is enabled between them.

.. literalinclude:: ../../test/f2003/hip/peer_access.f03
   :language: fortran
