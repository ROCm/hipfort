.. meta::
  :description: rocSOLVER examples written with the hipFORT Fortran interfaces
  :keywords: hipFORT, ROCm, rocSOLVER, LAPACK, Fortran, examples, tutorials

******************
rocSOLVER examples
******************

`rocSOLVER <https://rocm.docs.amd.com/projects/rocSOLVER/en/latest/>`_ is the AMD
implementation of LAPACK for AMD GPUs. hipFORT exposes it through the
``hipfort_rocsolver`` module, which mirrors the rocSOLVER C API one to one.
rocSOLVER is built on rocBLAS and reuses its handle type, so every program also
uses the ``hipfort_rocblas`` module for ``rocblas_create_handle`` and the
``rocblas_*`` enumerators.

Every program on this page is complete and self-contained, and is built
and run as part of the hipFORT test suite. The Fortran 2008 sources live in
``test/f2008/rocsolver`` and the equivalent Fortran 2003 sources, which use
``type(c_ptr)`` device pointers and explicit byte counts instead of Fortran
array pointers, live in ``test/f2003/rocsolver``.

hipSOLVER offers the same functionality through an API that follows cuSOLVER;
see the :doc:`hipSOLVER examples <hipsolver-examples>`.

Each routine is provided in the four LAPACK precisions where it has
them: ``s`` (real single), ``d`` (real double), ``c`` (complex single), and
``z`` (complex double). This page shows the double-precision program of each
group; the other precisions differ only in the host data type and the
``rocsolver_`` prefix letter.

Conventions
===========

rocSOLVER follows a small number of conventions that recur in every program:

* **Column-major storage.** rocSOLVER matrices are column-major, which matches
  Fortran's native array layout, so a Fortran 2-D array maps directly onto a
  rocSOLVER matrix with leading dimension ``lda = size(A, 1)``.
* **The** ``info`` **output lives in device memory.** rocSOLVER writes the
  factorization status ``info`` to a *device* pointer, so the hipFORT binding
  types that argument as ``type(c_ptr)``. Back it with a device allocation and
  pass ``c_loc(dInfo)``; passing a host scalar faults on the GPU. For the
  batched routines ``info`` is an array of ``batch_count`` integers on the
  device.
* **Pivots and scalar factors are device arrays.** Arguments such as ``ipiv``
  (pivot indices) and ``tau`` (Householder scalars) are outputs written on the
  device and are passed as device buffers.
* **rocBLAS enumerators select variants.** ``rocblas_operation_none`` /
  ``rocblas_operation_transpose`` choose whether a routine works on ``A`` or
  ``A**T``; ``rocblas_fill_upper`` / ``rocblas_fill_lower`` choose the stored
  triangle; ``rocblas_evect_*`` and ``rocblas_svect_*`` choose whether vectors
  are computed.
* **Every call returns a status code.** The ``hipfort_check`` module provides
  ``hipCheck`` for HIP calls and ``rocsolverCheck`` for rocSOLVER calls; both abort
  on failure. Most of the programs below route rocSOLVER status codes through
  ``hipCheck`` as well. That works because both status enumerations use ``0`` for
  success, but prefer ``rocsolverCheck`` in new code so that a failure is reported
  as a rocSOLVER error rather than a HIP one.

Building and running
====================

The programs need the ``rocsolver``, ``rocblas``, and ``hip`` hipFORT
components:

.. code-block:: cmake

   find_package(hipfort REQUIRED COMPONENTS hip rocblas rocsolver)

   add_executable(my_solver rocsolver_dgetrf.f08)
   target_link_libraries(my_solver PRIVATE hipfort::rocsolver hipfort::rocblas hipfort::hip)

See :doc:`../how-to/using-hipfort` for the full set of build options.

LU factorization and solve
==========================

``getrf`` computes the LU factorization ``A = P*L*U`` with partial pivoting,
writing the factors in place over ``A`` and the pivot indices into ``ipiv``.
The program factorizes a matrix and reconstructs ``L*U`` to confirm the result.

.. literalinclude:: ../../test/f2008/rocsolver/rocsolver_dgetrf.f08
   :language: fortran

``getrs`` uses the factors and pivots from ``getrf`` to solve ``A*X = B``. The
program picks a known solution ``x``, forms ``b = A*x``, factorizes, solves, and
checks that the recovered ``X`` matches ``x``.

.. literalinclude:: ../../test/f2008/rocsolver/rocsolver_dgetrs.f08
   :language: fortran

The ``getrf_npvt`` variant factorizes without pivoting (valid when no row
interchanges are needed, as for a diagonally dominant matrix), and ``getf2`` is
the unblocked kernel with the same interface. See
``test/f2008/rocsolver/rocsolver_dgetrf_npvt.f08`` and
``rocsolver_dgetf2.f08``.

Batched LU
==========

rocSOLVER factorizes many matrices with one call in two forms. The
*array-of-pointers* form, ``getrf_batched``, takes ``A`` as a device array of
per-matrix device pointers, and ``ipiv`` and ``info`` as device arrays indexed
by batch.

.. literalinclude:: ../../test/f2008/rocsolver/rocsolver_dgetrf_batched.f08
   :language: fortran

The *strided-batched* form, ``getrf_strided_batched``, instead stores the
matrices contiguously in one device buffer and locates each by a fixed stride,
which avoids building a pointer array. See
``test/f2008/rocsolver/rocsolver_dgetrf_strided_batched.f08``.

The 64-bit integer API
======================

The ``_64`` routines accept 64-bit problem dimensions, pivots, and ``info`` for
problems that exceed the 32-bit range. ``getrf_64`` performs the same
factorization as ``getrf`` with ``integer(c_int64_t)`` dimensions; the device
buffers, including the int64 ``ipiv`` and ``info``, are passed as
``type(c_ptr)`` because the ``_64`` routines have no native-array overloads.

.. literalinclude:: ../../test/f2008/rocsolver/rocsolver_dgetrf_64.f08
   :language: fortran

Cholesky factorization and solve
================================

``potrf`` computes the Cholesky factorization of a symmetric (or Hermitian)
positive-definite matrix, writing the factor into the triangle chosen by the
fill mode. The program uses ``rocblas_fill_upper`` and checks the factor against
the known Cholesky root.

.. literalinclude:: ../../test/f2008/rocsolver/rocsolver_dpotrf.f08
   :language: fortran

``potrs`` solves ``A*X = B`` from a ``potrf`` factorization, and ``posv``
combines the factorization and the solve in a single call. See
``test/f2008/rocsolver/rocsolver_dpotrs.f08`` and ``rocsolver_dposv.f08``.

QR factorization
================

``geqrf`` computes ``A = Q*R``, storing ``R`` in the upper triangle of ``A`` and
the Householder vectors that represent ``Q`` below it, with their scalar factors
in ``ipiv``/``tau``.

.. literalinclude:: ../../test/f2008/rocsolver/rocsolver_dgeqrf.f08
   :language: fortran

``Q`` is never formed explicitly by ``geqrf``. Two follow-on routines use its
compact representation: ``orgqr`` (``ungqr`` for complex) generates the explicit
orthogonal matrix ``Q``, and ``ormqr`` (``unmqr`` for complex) multiplies a
given matrix by ``Q`` or ``Q**T`` without forming it. See
``test/f2008/rocsolver/rocsolver_dorgqr.f08`` and ``rocsolver_dormqr.f08``.

Linear least squares
====================

``gels`` solves the least-squares problem ``min || A*X - B ||`` (or the
minimum-norm problem for underdetermined systems) using a QR or LQ
factorization. The program solves a square nonsingular system and confirms the
overwritten ``B`` recovers the known solution.

.. literalinclude:: ../../test/f2008/rocsolver/rocsolver_dgels.f08
   :language: fortran

Symmetric eigenvalues
=====================

``syev`` (``heev`` for Hermitian matrices) computes the eigenvalues, and
optionally the eigenvectors, of a symmetric matrix. The
``rocblas_evect_none``/``rocblas_evect_original`` argument selects whether
eigenvectors are produced; the program requests eigenvalues only.

.. literalinclude:: ../../test/f2008/rocsolver/rocsolver_dsyev.f08
   :language: fortran

``syevd``/``heevd`` solve the same problem with a divide-and-conquer algorithm,
and ``syevj``/``heevj`` with a Jacobi algorithm. See
``test/f2008/rocsolver/rocsolver_dsyevd.f08`` and ``rocsolver_dsyevj.f08``.

Singular value decomposition
============================

``gesvd`` computes the singular value decomposition ``A = U*S*V**T``. The
``rocblas_svect_*`` arguments choose which of the singular-vector matrices are
computed. The program requests all vectors and reconstructs ``A`` from the
factors (rocSOLVER returns ``V**T``).

.. literalinclude:: ../../test/f2008/rocsolver/rocsolver_dgesvd.f08
   :language: fortran

``gesvdj`` computes the same decomposition with a Jacobi algorithm, which is
often faster for small matrices. See
``test/f2008/rocsolver/rocsolver_dgesvdj.f08``.

Symmetric indefinite factorization
==================================

``sytrf`` computes the Bunch-Kaufman factorization of a symmetric indefinite
matrix, and ``sytrs`` uses that factorization to solve ``A*X = B``. The program
factorizes with ``rocblas_fill_upper`` and checks the recovered solution.

.. literalinclude:: ../../test/f2008/rocsolver/rocsolver_dsytrs.f08
   :language: fortran

Triangular inverse
==================

``trtri`` inverts a triangular matrix in place. The program inverts an
upper-triangular matrix and checks ``U * U^-1 == I``.

.. literalinclude:: ../../test/f2008/rocsolver/rocsolver_dtrtri.f08
   :language: fortran

Reductions to condensed form
============================

Several rocSOLVER routines reduce a matrix to a condensed form used inside the
eigenvalue and SVD algorithms. ``getrf`` aside, these are lower-level building
blocks:

* ``gebrd`` reduces a general matrix to bidiagonal form.
* ``sytrd`` reduces a symmetric matrix to tridiagonal form, and ``latrd``
  reduces a leading block of it.
* ``sterf`` computes the eigenvalues of a symmetric tridiagonal matrix, and
  ``steqr``/``stedc`` compute its eigenvalues and eigenvectors.
* ``larft`` forms the triangular factor of a block of Householder reflectors.

.. literalinclude:: ../../test/f2008/rocsolver/rocsolver_dgebrd.f08
   :language: fortran

The tridiagonal eigenvalue solver ``sterf`` takes only the diagonal and
off-diagonal of the tridiagonal matrix:

.. literalinclude:: ../../test/f2008/rocsolver/rocsolver_dsterf.f08
   :language: fortran

See ``test/f2008/rocsolver`` for the ``sytrd``, ``latrd``, ``steqr``,
``stedc``, and ``larft`` programs.
