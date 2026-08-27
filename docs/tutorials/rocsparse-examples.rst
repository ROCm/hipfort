.. meta::
  :description: rocSPARSE examples written with the hipFORT Fortran interfaces
  :keywords: hipFORT, ROCm, rocSPARSE, sparse, Fortran, examples, tutorials

******************
rocSPARSE examples
******************

`rocSPARSE <https://rocm.docs.amd.com/projects/rocSPARSE/en/latest/>`_ is the AMD
implementation of sparse linear algebra for AMD GPUs. hipFORT exposes it through
the ``hipfort_rocsparse`` module, which mirrors the rocSPARSE C API one to one.
rocSPARSE reuses the rocBLAS handle type, so the examples that create a handle
call ``rocsparse_create_handle`` from the same module.

Every program on this page is a complete, self-contained example that is built
and run as part of the hipFORT test suite. The Fortran 2008 sources live in
``test/f2008/rocsparse`` and the equivalent Fortran 2003 sources, which use
``type(c_ptr)`` device pointers and explicit byte counts instead of Fortran
array pointers, live in ``test/f2003/rocsparse``.

Where a routine has the four precisions, the example is provided for each: ``s``
(real single), ``d`` (real double), ``c`` (complex single), and ``z`` (complex
double). This page shows the double-precision program of each group; the other
precisions differ only in the host data type and the ``rocsparse_`` prefix
letter.

Conventions
===========

rocSPARSE follows a small number of conventions that recur in every example:

* **Sparse matrix formats.** Most examples store the sparse matrix in CSR
  (compressed sparse row): a row-pointer array, a column-index array, and a
  values array. Block variants use BSR, and a few routines take COO
  (coordinate) row/column arrays.
* **Zero-based indexing.** The examples use ``rocsparse_index_base_zero``, so
  CSR row pointers and column indices start at 0, matching the C samples. The
  Fortran host arrays that hold them are ordinary 1-based arrays whose *values*
  are 0-based.
* **The generic API is descriptor- and stage-based.** The newer routines
  (SpMV, SpMM, SDDMM, SpSV, SpSM) wrap the operands in matrix/vector descriptors
  (``rocsparse_create_csr_descr``, ``rocsparse_create_dnmat_descr``,
  ``rocsparse_create_dnvec_descr``) and run in stages: query a workspace size,
  optionally preprocess/analyze, then compute. The descriptor constructors are
  ``c_ptr``-only (no array overloads), so device buffers are passed via
  ``c_loc(...)`` even in the Fortran 2008 examples.
* **Scalars.** ``alpha`` and ``beta`` are passed by address (``c_loc(alpha)``)
  in the generic API, and as host scalars by reference in the older
  level-2/level-3 routines such as ``bsrmv`` and ``gemvi``.
* **Every call returns a status code.** The examples wrap rocSPARSE calls in
  ``rocsparseCheck`` and HIP calls in ``hipCheck`` from the ``hipfort_check``
  module, both of which abort on failure.

Building an example
===================

The examples need the ``rocsparse``, ``rocblas``, and ``hip`` hipFORT
components:

.. code-block:: cmake

   find_package(hipfort REQUIRED COMPONENTS hip rocblas rocsparse)

   add_executable(my_sparse rocsparse_dspmv.f08)
   target_link_libraries(my_sparse PRIVATE hipfort::rocsparse hipfort::rocblas hipfort::hip)

See :doc:`../how-to/using-hipfort` for the full set of build options.

Sparse matrix-vector and matrix-matrix products
===============================================

``spmv`` multiplies a sparse matrix by a dense vector, ``y = alpha*A*x + beta*y``,
using the generic API: a CSR descriptor for ``A`` and dense-vector descriptors
for ``x`` and ``y``, run through the ``buffer_size`` and ``compute`` stages.

.. literalinclude:: ../../test/f2008/rocsparse/rocsparse_dspmv.f08
   :language: fortran

``spmm`` multiplies a sparse matrix by a dense matrix, ``C = alpha*A*B + beta*C``,
with dense-matrix descriptors for ``B`` and ``C`` and the three
``buffer_size`` / ``preprocess`` / ``compute`` stages.

.. literalinclude:: ../../test/f2008/rocsparse/rocsparse_dspmm.f08
   :language: fortran

Sampled dense-dense matrix multiplication
=========================================

``sddmm`` is the transpose of the SpMM data flow: the dense product ``A*B`` is
evaluated only at the nonzero positions of a sparse ``C``, giving
``C = alpha * (A*B) .* spy(C) + beta*C``. It is the core primitive behind
attention and graph-neural-network kernels. The example uses dense descriptors
for ``A`` and ``B``, a CSR descriptor for ``C``, and the three sddmm stages.

.. literalinclude:: ../../test/f2008/rocsparse/rocsparse_dsddmm.f08
   :language: fortran

rocSPARSE also supports a batched SDDMM: the dense operands are strided-batched
with ``rocsparse_dnmat_set_strided_batch`` and the sparse ``C`` shares one
sparsity pattern across the batch with ``rocsparse_csr_set_strided_batch``.

.. literalinclude:: ../../test/f2008/rocsparse/rocsparse_dsddmm_batched.f08
   :language: fortran

Sparse triangular solves
========================

``sptrsv`` solves a sparse triangular system ``op(A)*y = alpha*x`` for a single
right-hand side. The generic API adds an analysis stage between the buffer-size
query and the solve, which inspects the sparsity pattern once and can be reused.

.. literalinclude:: ../../test/f2008/rocsparse/rocsparse_dsptrsv.f08
   :language: fortran

``sptrsm`` solves the same kind of system with several right-hand sides at once,
taking a dense-matrix descriptor for the right-hand sides.

.. literalinclude:: ../../test/f2008/rocsparse/rocsparse_dsptrsm.f08
   :language: fortran

Sparse matrix arithmetic
========================

``csrgemm`` multiplies two sparse matrices, ``C = alpha*A*B``. Because the
sparsity pattern of ``C`` is not known in advance, the routine runs in two
passes: ``nnz`` first computes the number of nonzeros and the row pointers of
``C``, then the values pass fills the columns and values.

.. literalinclude:: ../../test/f2008/rocsparse/rocsparse_dcsrgemm.f08
   :language: fortran

``csrgeam`` adds two sparse matrices, ``C = alpha*A + beta*B``, with the same
two-pass structure.

.. literalinclude:: ../../test/f2008/rocsparse/rocsparse_dcsrgeam.f08
   :language: fortran

Block-sparse matrix-vector products
===================================

``bsrmv`` multiplies a matrix stored in BSR (block sparse row) format by a dense
vector. BSR groups the nonzeros into fixed-size dense blocks, which suits
matrices with a natural block structure. The routine takes a matrix descriptor
and a matrix-info handle.

.. literalinclude:: ../../test/f2008/rocsparse/rocsparse_dbsrmv.f08
   :language: fortran

``gebsrmv`` is the general variant, allowing rectangular blocks with separate
row and column block dimensions.

.. literalinclude:: ../../test/f2008/rocsparse/rocsparse_dgebsrmv.f08
   :language: fortran

Incomplete factorization preconditioners
========================================

Incomplete factorizations produce approximate factors that keep the sparsity of
the input and are used as preconditioners. Each runs an analysis stage before
the compute stage. ``csrilu0`` computes an incomplete LU factorization with zero
fill-in; on a matrix with no fill-in (such as a tridiagonal one) it reproduces
the exact LU, which the example checks.

.. literalinclude:: ../../test/f2008/rocsparse/rocsparse_dcsrilu0.f08
   :language: fortran

``csric0`` is the incomplete Cholesky counterpart for a symmetric positive
definite matrix.

.. literalinclude:: ../../test/f2008/rocsparse/rocsparse_dcsric0.f08
   :language: fortran

``spildlt0`` computes an incomplete LDL\ :sup:`H` factorization through the
generic descriptor API, with descriptor-create, set-input, analysis and compute
stages, and a get-output query for the singularity status.

.. literalinclude:: ../../test/f2008/rocsparse/rocsparse_spildlt0.f08
   :language: fortran

Tridiagonal and pentadiagonal solvers
=====================================

``gtsv`` solves a tridiagonal system given its three diagonals. It is a direct
banded solver rather than an iterative one.

.. literalinclude:: ../../test/f2008/rocsparse/rocsparse_sgtsv.f08
   :language: fortran

``gpsv_interleaved_batch`` solves a batch of pentadiagonal systems whose data is
interleaved across the batch, a layout that lets the GPU coalesce memory access
across the independent systems.

.. literalinclude:: ../../test/f2008/rocsparse/zgpsv_interleaved_batch.f08
   :language: fortran

Sparse vector operations
========================

``gthr`` gathers the entries of a dense vector ``y`` at a set of indices into a
compact sparse vector ``x_val``, and ``sctr`` scatters a sparse vector back into
a dense one. They are the pack/unpack pair for the sparse-vector format.

.. literalinclude:: ../../test/f2008/rocsparse/rocsparse_dgthr.f08
   :language: fortran

.. literalinclude:: ../../test/f2008/rocsparse/rocsparse_dsctr.f08
   :language: fortran

``doti`` computes the dot product of a sparse vector with a dense one, and
``gemvi`` multiplies a dense matrix by a sparse vector,
``y = alpha*A*x + beta*y``.

.. literalinclude:: ../../test/f2008/rocsparse/ddoti.f08
   :language: fortran

.. literalinclude:: ../../test/f2008/rocsparse/rocsparse_dgemvi.f08
   :language: fortran

Format conversions
==================

rocSPARSE converts between the sparse formats. ``csr2csc`` converts CSR to CSC,
which is equivalent to transposing the sparse matrix.

.. literalinclude:: ../../test/f2008/rocsparse/rocsparse_dcsr2csc.f08
   :language: fortran

``csr2coo`` and ``coo2csr`` convert between the CSR row-pointer array and the
COO row-index array, the compressed and expanded forms of the same row
information.

.. literalinclude:: ../../test/f2008/rocsparse/rocsparse_csr2coo.f08
   :language: fortran

.. literalinclude:: ../../test/f2008/rocsparse/rocsparse_coo2csr.f08
   :language: fortran
