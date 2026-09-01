.. meta::
  :description: hipSOLVER examples written with the hipFORT Fortran interfaces
  :keywords: hipFORT, ROCm, hipSOLVER, LAPACK, Fortran, examples, tutorials

******************
hipSOLVER examples
******************

`hipSOLVER <https://rocm.docs.amd.com/projects/hipSOLVER/en/latest/>`_ is a thin
layer over rocSOLVER whose API follows cuSOLVER. hipFORT exposes it through the
``hipfort_hipsolver`` module.

Every program on this page is complete and self-contained, and is built
and run as part of the hipFORT test suite. The Fortran 2008 tests live in
``test/f2008/hipsolver`` and the equivalent Fortran 2003 sources, which use
``type(c_ptr)`` device pointers and explicit byte counts instead of Fortran
array pointers, live in ``test/f2003/hipsolver``.

If you want direct access to rocSOLVER rather than a cuSOLVER-style interface,
see the :doc:`rocSOLVER examples <rocsolver-examples>`, where the equivalent
programs are written against the ``hipfort_rocsolver`` module.

Each routine is provided in the four LAPACK precisions where it has
them: ``s`` (real single), ``d`` (real double), ``c`` (complex single), and
``z`` (complex double). This page shows the double-precision program of each
group; the other precisions differ only in the host data type and the
``hipsolver`` prefix letter.

Solver workflow
===============

Unlike LAPACK, hipSOLVER routines need an explicit GPU workspace. A typical call
follows the same sequence as cuSOLVER:

#. Create a handle with ``hipsolverCreate``.
#. Query the workspace size with the routine's ``_bufferSize`` companion (for
   example ``hipsolverDgetrf_bufferSize``), then allocate that many bytes on the
   device.
#. Run the routine, passing the workspace and its size.
#. Read back the device ``info`` output to check for success.
#. Release the handle with ``hipsolverDestroy``.

Keep the following conventions in mind:

* **Column-major storage.** hipSOLVER matrices are column-major, which matches
  Fortran's native array layout, so a Fortran 2-D array maps directly onto a
  matrix with leading dimension ``lda = size(A, 1)``.
* **An explicit workspace.** Most routines take a device work buffer and its
  length. Size it with the matching ``_bufferSize`` query rather than guessing;
  the buffer stays a bare ``type(c_ptr)`` in both dialects.
* **The** ``info`` **output lives in device memory.** hipSOLVER writes the
  factorization status to a *device* pointer, so it must be backed by a device
  allocation, not a host scalar. For the batched routines ``info`` is an array of
  ``batch_count`` integers on the device.
* **Enumerators select variants.** ``HIPSOLVER_FILL_MODE_UPPER`` /
  ``HIPSOLVER_FILL_MODE_LOWER`` choose the stored triangle, and
  ``HIPSOLVER_EIG_MODE_NOVECTOR`` / ``HIPSOLVER_EIG_MODE_VECTOR`` choose whether
  eigenvectors are computed. The SVD job arguments are ``character(c_char)`` job
  codes (``'N'``, ``'A'``, ``'S'``, ``'V'``) passed by value.
* **Every call returns a status code.** The programs wrap hipSOLVER calls in
  ``hipsolverCheck`` and HIP calls in ``hipCheck`` from the ``hipfort_check``
  module, both of which abort on failure.

Building and running
====================

The programs only need the ``hipsolver`` and ``hip`` hipFORT components:

.. code-block:: cmake

   find_package(hipfort REQUIRED COMPONENTS hip hipsolver)

   add_executable(my_solver hipsolver_dgetrf.f08)
   target_link_libraries(my_solver PRIVATE hipfort::hipsolver hipfort::hip)

See :doc:`../how-to/using-hipfort` for the full set of build options.

LU factorization and solve
==========================

``getrf`` computes the LU factorization ``A = P*L*U`` with partial pivoting,
writing the factors in place over ``A`` and the pivot indices into ``ipiv``. The
program queries the workspace with ``hipsolverDgetrf_bufferSize``, factorizes,
and reconstructs ``L*U`` to confirm the result.

.. literalinclude:: ../../test/f2008/hipsolver/hipsolver_dgetrf.f08
   :language: fortran

``getrs`` uses the factors and pivots from ``getrf`` to solve ``A*X = B``. The
program picks a known solution ``x``, forms ``b = A*x``, factorizes, solves, and
checks that the recovered ``X`` matches ``x``.

.. literalinclude:: ../../test/f2008/hipsolver/hipsolver_dgetrs.f08
   :language: fortran

Cholesky factorization and solve
================================

``potrf`` computes the Cholesky factorization of a symmetric (or Hermitian)
positive-definite matrix, writing the factor into the triangle chosen by the
fill mode. The program uses ``HIPSOLVER_FILL_MODE_UPPER`` and checks the factor
against the known Cholesky root.

.. literalinclude:: ../../test/f2008/hipsolver/hipsolver_dpotrf.f08
   :language: fortran

``potrs`` solves ``A*X = B`` from a ``potrf`` factorization. The program forms
``b = A*x`` for a known ``x`` and confirms the solve recovers it.

.. literalinclude:: ../../test/f2008/hipsolver/hipsolver_dpotrs.f08
   :language: fortran

Batched Cholesky
================

``potrfBatched`` factorizes many matrices with one call. The batched API takes
``A`` as an array of device pointers that itself lives in *device* memory: each
matrix is allocated on the device, their device addresses are collected in a
host array, and that array is copied to a device buffer whose address is passed
as ``A``. ``info`` is a device array indexed by batch.

.. literalinclude:: ../../test/f2008/hipsolver/hipsolver_dpotrfbatched.f08
   :language: fortran

QR factorization
================

``geqrf`` computes ``A = Q*R``, storing ``R`` in the upper triangle of ``A`` and
the Householder vectors that represent ``Q`` below it, with their scalar factors
in ``tau``.

.. literalinclude:: ../../test/f2008/hipsolver/hipsolver_dgeqrf.f08
   :language: fortran

``Q`` is never formed explicitly by ``geqrf``. Two follow-on routines use its
compact representation: ``orgqr`` (``ungqr`` for complex) generates the explicit
orthogonal matrix ``Q``, and ``ormqr`` (``unmqr`` for complex) multiplies a
given matrix by ``Q`` or ``Q**T`` without forming it.

.. literalinclude:: ../../test/f2008/hipsolver/hipsolver_dorgqr.f08
   :language: fortran

.. literalinclude:: ../../test/f2008/hipsolver/hipsolver_dormqr.f08
   :language: fortran

Symmetric eigenvalues
=====================

``syevd`` (``heevd`` for Hermitian matrices) computes the eigenvalues, and
optionally the eigenvectors, of a symmetric matrix with a divide-and-conquer
algorithm. The ``HIPSOLVER_EIG_MODE_*`` argument selects whether eigenvectors are
produced; the program requests eigenvalues only and checks their sum against the
trace.

.. literalinclude:: ../../test/f2008/hipsolver/hipsolver_dsyevd.f08
   :language: fortran

``syevj``/``heevj`` solve the same problem with a Jacobi algorithm, which is
often faster for small matrices. With ``HIPSOLVER_EIG_MODE_VECTOR`` the matrix is
overwritten with the eigenvectors; the program confirms each eigenpair satisfies
``A*v = lambda*v``.

.. literalinclude:: ../../test/f2008/hipsolver/hipsolver_dsyevj.f08
   :language: fortran

Singular value decomposition
============================

``gesvd`` computes the singular value decomposition ``A = U*S*V**T``. The
``character(c_char)`` job codes choose which singular-vector matrices are
computed. The program requests singular values only (``'N'``) and checks the
convention-independent invariant ``sum(sigma_i**2) == ||A||_F**2``.

.. literalinclude:: ../../test/f2008/hipsolver/hipsolver_dgesvd.f08
   :language: fortran

``gesvdj`` computes the same decomposition with a Jacobi algorithm. The program
requests all vectors and reconstructs ``A`` from the factors, which avoids the
sign and order ambiguity of the singular vectors.

.. literalinclude:: ../../test/f2008/hipsolver/hipsolver_dgesvdj.f08
   :language: fortran
