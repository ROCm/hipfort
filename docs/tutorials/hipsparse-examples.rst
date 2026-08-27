.. meta::
  :description: hipSPARSE examples written with the hipFORT Fortran interfaces
  :keywords: hipFORT, ROCm, hipSPARSE, sparse, Fortran, examples, tutorials

******************
hipSPARSE examples
******************

`hipSPARSE <https://rocm.docs.amd.com/projects/hipSPARSE/en/latest/>`_ is a thin
portability layer over rocSPARSE on AMD GPUs and cuSPARSE on NVIDIA GPUs. Its API
mirrors cuSPARSE, so the same source builds against either backend. hipFORT
exposes it through the ``hipfort_hipsparse`` module.

Every program on this page is a complete, self-contained example that is built
and run as part of the hipFORT test suite. The Fortran 2008 sources live in
``test/f2008/hipsparse`` and the equivalent Fortran 2003 sources, which use
``type(c_ptr)`` device pointers and explicit byte counts instead of Fortran
array pointers, live in ``test/f2003/hipsparse``.

If you want direct access to rocSPARSE rather than a portable interface, the
equivalent programs are written against the ``hipfort_rocsparse`` module.

Where a routine has the four precisions, the example is provided for each: ``s``
(real single), ``d`` (real double), ``c`` (complex single), and ``z`` (complex
double). This page shows the double-precision program of each group; the other
precisions differ only in the host data type and the ``hipsparse`` prefix
letter.

Conventions
===========

hipSPARSE follows a small number of conventions that recur in every example:

* **Sparse matrix formats.** Most examples store the sparse matrix in CSR
  (compressed sparse row): a row-pointer array, a column-index array, and a
  values array. A few routines take COO (coordinate) row/column arrays.
* **Zero-based indexing.** The examples use ``HIPSPARSE_INDEX_BASE_ZERO``, so
  CSR row pointers and column indices start at 0, matching the cuSPARSE
  samples. The Fortran host arrays that hold them are ordinary 1-based arrays
  whose *values* are 0-based.
* **Two API generations.** The generic API (SpMV, SpMM, SDDMM, SpSV, SpSM)
  wraps the operands in matrix/vector descriptors (``hipsparseCreateCsr``,
  ``hipsparseCreateDnMat``, ``hipsparseCreateDnVec``) and runs in stages: query
  a workspace size, optionally preprocess/analyze, then compute. The older
  level-2/level-3 API (``csrsv2``, ``csrilu02``, ``gemvi``) uses an info handle
  and a matrix descriptor (``hipsparseCreateMatDescr``).
* **Zero-size buffers.** When a workspace query returns 0, pass a null pointer,
  not an allocated one: hipSPARSE returns ``HIPSPARSE_STATUS_INVALID_VALUE`` if
  a non-null buffer is supplied for a zero-size workspace. The examples allocate
  the buffer only when the queried size is positive.
* **Every call returns a status code.** The examples wrap hipSPARSE calls in
  ``hipsparseCheck`` and HIP calls in ``hipCheck`` from the ``hipfort_check``
  module, both of which abort on failure.

Building an example
===================

The examples only need the ``hipsparse`` and ``hip`` hipFORT components:

.. code-block:: cmake

   find_package(hipfort REQUIRED COMPONENTS hip hipsparse)

   add_executable(my_sparse hipsparse_dspmv.f08)
   target_link_libraries(my_sparse PRIVATE hipfort::hipsparse hipfort::hip)

See :doc:`../how-to/using-hipfort` for the full set of build options.

Sparse matrix-vector and matrix-matrix products
===============================================

``SpMV`` multiplies a sparse matrix by a dense vector,
``y = alpha*A*x + beta*y``, using the generic API: a CSR descriptor for ``A``
and dense-vector descriptors for ``x`` and ``y``, run through the
``SpMV_bufferSize`` and ``SpMV`` stages.

.. literalinclude:: ../../test/f2008/hipsparse/hipsparse_dspmv.f08
   :language: fortran

``SpMM`` multiplies a sparse matrix by a dense matrix,
``C = alpha*A*B + beta*C``, with dense-matrix descriptors for ``B`` and ``C``.

.. literalinclude:: ../../test/f2008/hipsparse/hipsparse_dspmm.f08
   :language: fortran

Sampled dense-dense matrix multiplication
=========================================

``SDDMM`` is the transpose of the SpMM data flow: the dense product ``A*B`` is
evaluated only at the nonzero positions of a sparse ``C``, giving
``C = alpha * (A*B) .* spy(C) + beta*C``. The example uses dense descriptors for
``A`` and ``B``, a CSR descriptor for ``C``, and the three
``SDDMM_bufferSize`` / ``SDDMM_preprocess`` / ``SDDMM`` stages.

.. literalinclude:: ../../test/f2008/hipsparse/hipsparse_dsddmm.f08
   :language: fortran

Sparse triangular solves
========================

The generic ``SpSV`` solves a sparse triangular system for a single right-hand
side, and ``SpSM`` solves it for several right-hand sides at once. Both add an
analysis stage between the buffer-size query and the solve.

.. literalinclude:: ../../test/f2008/hipsparse/hipsparse_dsptrsv.f08
   :language: fortran

.. literalinclude:: ../../test/f2008/hipsparse/hipsparse_dsptrsm.f08
   :language: fortran

The older ``csrsv2`` triangular solve uses the info-handle API instead: create
a matrix descriptor and a ``csrsv2`` info object, query the buffer size, run the
analysis phase, then solve.

.. literalinclude:: ../../test/f2008/hipsparse/hipsparse_dcsrsv2.f08
   :language: fortran

Sparse matrix-matrix multiplication
===================================

``csrgemm`` multiplies two sparse matrices, ``C = alpha*A*B``. Because the
sparsity pattern of ``C`` is not known in advance, the routine runs in two
passes: ``nnz`` first computes the number of nonzeros and the row pointers of
``C``, then the values pass fills the columns and values.

.. literalinclude:: ../../test/f2008/hipsparse/hipsparse_dcsrgemm.f08
   :language: fortran

Incomplete-LU preconditioner
============================

``csrilu02`` computes an incomplete LU factorization with zero fill-in, used as
a preconditioner. It follows the info-handle pattern: a buffer-size query, an
analysis phase that inspects the pattern, and the factorization itself, with a
zero-pivot query to detect breakdown.

.. literalinclude:: ../../test/f2008/hipsparse/hipsparse_dcsrilu02.f08
   :language: fortran

Tridiagonal solver
==================

``gtsv`` solves a tridiagonal system given its three diagonals. It is a direct
banded solver rather than an iterative one.

.. literalinclude:: ../../test/f2008/hipsparse/hipsparse_sgtsv.f08
   :language: fortran

Sparse vector operations
========================

``gthr`` gathers the entries of a dense vector ``y`` at a set of indices into a
compact sparse vector ``x_val``, and ``sctr`` scatters a sparse vector back into
a dense one. They are the pack/unpack pair for the sparse-vector format.

.. literalinclude:: ../../test/f2008/hipsparse/hipsparse_dgthr.f08
   :language: fortran

.. literalinclude:: ../../test/f2008/hipsparse/hipsparse_dsctr.f08
   :language: fortran

``gemvi`` multiplies a dense matrix by a sparse vector,
``y = alpha*A*x + beta*y``, sizing its workspace with a ``gemvi_bufferSize``
query.

.. literalinclude:: ../../test/f2008/hipsparse/hipsparse_dgemvi.f08
   :language: fortran

Format conversions
==================

hipSPARSE converts between the sparse formats. ``csr2csc`` converts CSR to CSC,
which is equivalent to transposing the sparse matrix.

.. literalinclude:: ../../test/f2008/hipsparse/hipsparse_dcsr2csc.f08
   :language: fortran

``csr2coo`` and ``coo2csr`` convert between the CSR row-pointer array and the
COO row-index array, the compressed and expanded forms of the same row
information. These are index-only conversions, so they have a single ``X``
(type-agnostic) entry point rather than one per precision.

.. literalinclude:: ../../test/f2008/hipsparse/hipsparse_xcsr2coo.f08
   :language: fortran

.. literalinclude:: ../../test/f2008/hipsparse/hipsparse_xcoo2csr.f08
   :language: fortran
