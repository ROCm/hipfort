.. meta::
  :description: RCCL examples written with the hipFORT Fortran interfaces
  :keywords: hipFORT, ROCm, RCCL, NCCL, collectives, all-reduce, multi-GPU, Fortran, examples, tutorials

*************
RCCL examples
*************

`RCCL <https://rocm.docs.amd.com/projects/rccl/en/latest/>`_, the ROCm
Communication Collectives Library, runs collective operations such as
all-reduce and broadcast across GPUs, in one process or across many. Its API
keeps the names of NVIDIA's NCCL: ``ncclAllReduce``, ``ncclCommInitRank``,
``ncclSum`` and so on. hipFORT exposes it through the ``hipfort_rccl`` module,
together with ``hipfort_rccl_enums`` for the data types, reduction operations
and status codes, and ``hipfort_rccl_types`` for ``ncclUniqueId`` and
``ncclConfig_t``. ``hipfort_rccl`` is available on AMD GPUs only.

Every program on this page is a complete example that is built and run as part
of the hipFORT test suite, from ``test/f2003/rccl`` and ``test/f2008/rccl``.

RCCL call pattern
=================

An RCCL program follows the same sequence:

#. Create one communicator per GPU that takes part. A single process that
   drives several GPUs creates them all at once with ``ncclCommInitAll``. With
   one process per GPU, as in an MPI code, rank 0 creates an ``ncclUniqueId``
   with ``ncclGetUniqueId`` and sends it to the other ranks, and every rank then
   calls ``ncclCommInitRank``.
#. Allocate the device buffers and create a stream per GPU.
#. Call the collective, for example ``ncclAllReduce``, on each GPU's stream.
#. Synchronize the stream before reading the result.
#. Destroy the communicators with ``ncclCommDestroy``.

Keep the following conventions in mind:

* The collectives take their buffers as ``type(c_ptr)``, because the element
  type is an argument (``ncclFloat32``, ``ncclFloat64``, ``ncclInt32``, ...):
  pass a pointer from ``hipMalloc``, or ``c_loc`` of a device array. The count
  is a number of elements, typed ``integer(c_size_t)``, not a byte count.
* Collectives are asynchronous: they are queued on the stream you pass.
* When one thread issues the collectives of several GPUs, put them between
  ``ncclGroupStart`` and ``ncclGroupEnd``. Otherwise the first call can block,
  waiting for GPUs whose calls have not been issued yet.
* Every RCCL call returns a status code. The examples wrap them in
  ``ncclCheck`` from the ``hipfort_check`` module, which aborts on failure.

Building an example
===================

The examples only need the ``rccl`` and ``hip`` hipFORT components:

.. code-block:: cmake

   find_package(hipfort REQUIRED COMPONENTS hip rccl)
   add_executable(my_allreduce rccl_allreduce_multi.f08)
   target_link_libraries(my_allreduce PRIVATE hipfort::rccl hipfort::hip)

See :doc:`../how-to/using-hipfort` for the full set of build options.

One communicator per GPU
========================

This program creates one communicator per visible GPU with ``ncclCommInitAll``,
which writes them into an array of communicators. Each GPU's buffer holds its
rank plus one, and a sum over all GPUs leaves ``ndev*(ndev+1)/2`` in every
element. It needs two GPUs, and reports itself as skipped with fewer.

.. literalinclude:: ../../test/f2008/rccl/rccl_allreduce_multi.f08
   :language: fortran
   :start-at: program rccl_allreduce_multi

``test/f2003/rccl/rccl_allreduce_multi.f03`` is the Fortran 2003 version, with
``type(c_ptr)`` device pointers and byte counts.

A communicator from a unique ID
===============================

This program builds a communicator of one rank the way an MPI code builds one
per rank: ``ncclGetUniqueId``, then ``ncclCommInitRank``, which takes the
``ncclUniqueId`` by value. It checks the communicator's size, rank and device,
then runs ``ncclAllReduce`` and ``ncclBroadcast``. It needs one GPU.

.. literalinclude:: ../../test/f2003/rccl/rccl_allreduce_single.f03
   :language: fortran
   :start-at: program rccl_allreduce_single

With MPI, rank 0 calls ``ncclGetUniqueId`` and broadcasts the identifier, which
is 128 bytes (``NCCL_UNIQUE_ID_BYTES``), before every rank creates its
communicator. This excerpt is not part of the test suite:

.. code-block:: fortran

   use mpi_f08
   type(ncclUniqueId) :: id
   integer :: rank, nranks

   call MPI_Comm_rank(MPI_COMM_WORLD, rank)
   call MPI_Comm_size(MPI_COMM_WORLD, nranks)
   if (rank == 0) call ncclCheck(ncclGetUniqueId(id))
   call MPI_Bcast(id, NCCL_UNIQUE_ID_BYTES, MPI_BYTE, 0, MPI_COMM_WORLD)
   call ncclCheck(ncclCommInitRank(comm, nranks, id, rank))

``test/f2003/rccl/rccl_version.f03`` shows ``ncclGetVersion`` and
``ncclGetErrorString``, which returns a C string.
