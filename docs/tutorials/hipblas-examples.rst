.. meta::
  :description: hipBLAS examples written with the hipFORT Fortran interfaces
  :keywords: hipFORT, ROCm, hipBLAS, BLAS, Fortran, examples, tutorials

****************
hipBLAS examples
****************

`hipBLAS <https://rocm.docs.amd.com/projects/hipBLAS/en/latest/>`_ is a thin
layer over rocBLAS whose API follows cuBLAS. hipFORT exposes it through the
``hipfort_hipblas`` module, which mirrors the hipBLAS C API one to one and
re-exports the enumerations (``HIPBLAS_OP_N``, ``HIPBLAS_FILL_MODE_LOWER`` and
so on) from ``hipfort_hipblas_enums``.

Every program on this page is a complete, self-contained example that is built
and run as part of the hipFORT test suite. The Fortran 2008 sources live in
``test/f2008/hipblas`` and the equivalent Fortran 2003 sources, which use
``type(c_ptr)`` device pointers and explicit byte counts instead of Fortran
array pointers, live in ``test/f2003/hipblas``. The packed triangular solve,
``stpsv``, is Fortran 2008 only.

If you want direct access to rocBLAS rather than a cuBLAS-style interface, see
the :doc:`rocBLAS examples <rocblas-examples>`, where the equivalent programs
are written against the ``hipfort_rocblas`` module.

The examples are grouped the way the BLAS routines themselves are: Level 1
operates on vectors, Level 2 on a matrix and a vector, and Level 3 on two
matrices. Most routines are provided in four precisions, identified by the
usual BLAS prefix: ``s`` (single-precision real), ``d`` (double-precision
real), ``c`` (single-precision complex) and ``z`` (double-precision complex).
Each section below shows one precision and names the sibling test files that
cover the others.

hipBLAS call pattern
=====================

A hipBLAS program always follows the same sequence:

#. Create a handle with ``hipblasCreate``.
#. Allocate device memory and copy the input data over, either with
   ``hipMalloc``/``hipMemcpy`` or, in the Fortran 2008 interfaces, with the
   ``hipMalloc(source=...)`` shortcut that allocates and copies in one call.
#. Call the hipBLAS routine.
#. Call ``hipDeviceSynchronize`` before reading a result, whether it was
   written to a host scalar or to device memory.
#. Copy device results back to the host.
#. Free the device memory and release the handle with ``hipblasDestroy``.

Keep the following conventions in mind:

* hipBLAS starts in host pointer mode, so ``alpha``, ``beta`` and scalar
  results such as a dot product are read from host memory without any setup
  call. Only a program that wants those values to live on the device needs
  ``hipblasSetPointerMode``. This is the main day-to-day difference from
  rocBLAS, whose examples set the pointer mode explicitly.
* hipBLAS matrices are stored column-major, which matches Fortran's native
  array layout directly, so no transpose trick is needed to call hipBLAS from
  Fortran.
* The leading dimension of a device matrix is usually just its first
  dimension, ``size(dA,1)``.
* Enumerations such as ``HIPBLAS_OP_N``, ``HIPBLAS_FILL_MODE_LOWER``,
  ``HIPBLAS_DIAG_NON_UNIT`` and ``HIPBLAS_SIDE_LEFT`` come from the
  ``hipfort_hipblas_enums`` module, which ``hipfort_hipblas`` re-exports, so
  ``use hipfort_hipblas`` on its own is enough.
* Every hipBLAS call returns a status code. The examples wrap them in
  ``hipblasCheck`` from the ``hipfort_check`` module, which aborts on failure.
  (``sgemv.f08`` and ``sger.f08`` route their hipBLAS calls through
  ``hipCheck`` instead; both abort on a non-zero status.)

Building an example
===================

The examples only need the ``hipblas`` and ``hip`` hipFORT components:

.. code-block:: cmake

   find_package(hipfort REQUIRED COMPONENTS hip hipblas)

   add_executable(my_blas saxpy.f08)
   target_link_libraries(my_blas PRIVATE hipfort::hipblas hipfort::hip)

See :doc:`../how-to/using-hipfort` for the full set of build options.

Level 1: vector operations
==========================

Scaled vector update (axpy)
----------------------------

``hipblas?axpy`` computes ``y := alpha * x + y``. This example runs it in
single precision and checks the result against the expected value.

.. literalinclude:: ../../test/f2008/hipblas/saxpy.f08
   :language: fortran

``test/f2008/hipblas/daxpy.f08``, ``caxpy.f08`` and ``zaxpy.f08`` run the same
computation in double-precision real, single-precision complex and
double-precision complex, respectively.

Vector scaling (scal)
---------------------

``hipblas?scal`` computes ``x := alpha * x``. The operation is in place, so
the device vector is both the input and the output.

.. literalinclude:: ../../test/f2008/hipblas/dscal.f08
   :language: fortran

This is the only ``scal`` example in the test suite; there is no
single-precision or complex counterpart. The :doc:`rocBLAS examples
<rocblas-examples>` cover the remaining precisions, including the
mixed-precision forms that scale a complex vector by a real scalar.

Vector copy and swap
--------------------

``hipblas?copy`` copies ``x`` into ``y`` on the device, leaving ``x``
untouched.

.. literalinclude:: ../../test/f2008/hipblas/scopy.f08
   :language: fortran

``hipblas?swap`` exchanges the contents of the two vectors instead, so both
are modified. The program below checks that ``x`` and ``y`` have traded
values.

.. literalinclude:: ../../test/f2008/hipblas/sswap.f08
   :language: fortran

Both are single-precision only in the test suite, and neither has a rocBLAS
counterpart there.

Dot products
------------

``hipblas?dot`` computes the dot product of two real vectors and returns the
scalar result through a pointer. Because hipBLAS is in host pointer mode by
default, that pointer is an ordinary host variable.

.. literalinclude:: ../../test/f2008/hipblas/sdot.f08
   :language: fortran

``test/f2008/hipblas/ddot.f08`` is the double-precision equivalent.

Complex vectors have two dot product variants: ``hipblas?dotc`` conjugates
the first vector before multiplying, and ``hipblas?dotu`` does not. Compare
``test/f2008/hipblas/cdotc.f08`` and ``cdotu.f08`` (also available in double
precision as ``zdotc.f08`` and ``zdotu.f08``) to see the different expected
results for the same input data.

Euclidean norm (nrm2)
---------------------

``hipblas?nrm2`` computes the Euclidean norm of a vector and returns it
through a pointer, which in host pointer mode is an ordinary host variable.

.. literalinclude:: ../../test/f2008/hipblas/snrm2.f08
   :language: fortran

``test/f2008/hipblas/dnrm2.f08`` is the double-precision equivalent. The
complex forms are named for both types involved, because the norm of a complex
vector is real: ``hipblasScnrm2`` takes a single-precision complex vector and
returns a single-precision real result, and ``hipblasDznrm2`` is its
double-precision counterpart. See ``scnrm2.f08`` and ``dznrm2.f08``.

Sum of absolute values (asum)
-----------------------------

``hipblas?asum`` sums the absolute values of a vector's elements. For complex
vectors it sums ``abs(real(x)) + abs(aimag(x))`` per element rather than the
complex modulus.

.. literalinclude:: ../../test/f2008/hipblas/sasum.f08
   :language: fortran

``test/f2008/hipblas/dasum.f08`` is the double-precision equivalent, and
``scasum.f08`` and ``dzasum.f08`` are the mixed real/complex forms named on the
same convention as ``scnrm2``.

Index of the largest element (iamax)
--------------------------------------

``hipblasI?amax`` returns the index of the element with the largest absolute
value. The returned index is **1-based**, so it can be used to subscript a
Fortran array directly.

.. literalinclude:: ../../test/f2008/hipblas/isamax.f08
   :language: fortran

``test/f2008/hipblas/idamax.f08``, ``icamax.f08`` and ``izamax.f08`` cover the
remaining precisions. The matching ``iamin`` routines have no hipBLAS example
here; the :doc:`rocBLAS examples <rocblas-examples>` cover them.

Level 2: matrix-vector operations
==================================

Matrix-vector multiplication
------------------------------

``hipblas?gemv`` computes ``y := alpha * op(A) * x + beta * y``. This example
uses constant matrix and vector entries so the expected result is a constant
vector and easy to check.

.. literalinclude:: ../../test/f2008/hipblas/sgemv.f08
   :language: fortran

``test/f2008/hipblas/dgemv.f08``, ``cgemv.f08`` and ``zgemv.f08`` cover the
remaining precisions.

Rank-1 update (ger)
-------------------

``hipblas?ger`` computes ``A := alpha * x * y**T + A``, adding the outer
product of two vectors to a matrix in place. This program keeps the
``type(c_ptr)`` device pointers and explicit byte counts of the Fortran 2003
style even though it lives among the Fortran 2008 sources.

.. literalinclude:: ../../test/f2008/hipblas/sger.f08
   :language: fortran

``test/f2008/hipblas/dger.f08`` is the double-precision equivalent. The
rocBLAS suite additionally provides the conjugated and unconjugated complex
forms, ``gerc`` and ``geru``; see the :doc:`rocBLAS examples
<rocblas-examples>`.

Triangular solve
------------------

``hipblas?trsv`` solves ``A * x = b`` in place for a triangular matrix ``A``,
given the fill mode (``HIPBLAS_FILL_MODE_LOWER`` or
``HIPBLAS_FILL_MODE_UPPER``), the transpose operation and whether the diagonal
is unit or not. ``dx`` holds ``b`` on entry and ``x`` on exit.

.. literalinclude:: ../../test/f2008/hipblas/strsv.f08
   :language: fortran

``test/f2008/hipblas/dtrsv.f08``, ``ctrsv.f08`` and ``ztrsv.f08`` cover the
remaining precisions.

Packed triangular solve
--------------------------

``hipblas?tpsv`` solves the same problem as ``trsv``, but the triangular
matrix is stored in packed form: only the referenced triangle is kept, in a
single one-dimensional array, which halves the memory footprint for large
matrices.

.. literalinclude:: ../../test/f2008/hipblas/stpsv.f08
   :language: fortran

This is the only packed-storage example; there is no double-precision or
complex counterpart in the test suite.

Level 3: matrix-matrix operations
==================================

Matrix-matrix multiplication
------------------------------

``hipblas?gemm`` computes ``C := alpha * op(A) * op(B) + beta * C``. As with
``gemv``, this example uses constant matrix entries so the exact result is a
constant matrix.

.. literalinclude:: ../../test/f2008/hipblas/dgemm.f08
   :language: fortran

``test/f2008/hipblas/sgemm.f08``, ``cgemm.f08`` and ``zgemm.f08`` cover the
remaining precisions.

Batched matrix multiplication
--------------------------------

``hipblas?gemmBatched`` runs several independent ``gemm`` calls in one launch,
with ``A``, ``B`` and ``C`` each passed as a device array of device pointers.
hipFORT's Fortran 2008 pointer-convenience interfaces cannot be used for this
argument shape: passing a plain array would only give hipBLAS a single
pointer, not the array of device pointers the routine requires. This test
therefore builds the pointer array with the same ``type(c_ptr)`` idiom used in
the Fortran 2003 interfaces.

.. literalinclude:: ../../test/f2008/hipblas/dgemm_batched.f08
   :language: fortran

``test/f2008/hipblas/sgemm_batched.f08``, ``cgemm_batched.f08`` and
``zgemm_batched.f08`` cover the remaining precisions.

Strided-batched matrix multiplication
-----------------------------------------

``hipblas?gemmStridedBatched`` also runs several ``gemm`` calls in one launch,
but ``A``, ``B`` and ``C`` are contiguous device arrays with a fixed stride
between the start of each batch's matrix, instead of an array of pointers.
This is usually simpler to set up than the batched form when the batches are
already laid out contiguously in memory.

.. literalinclude:: ../../test/f2008/hipblas/dgemm_strided_batched.f08
   :language: fortran

``test/f2008/hipblas/sgemm_strided_batched.f08``,
``cgemm_strided_batched.f08`` and ``zgemm_strided_batched.f08`` cover the
remaining precisions.

Triangular solve with multiple right-hand sides
----------------------------------------------------

``hipblas?trsm`` solves ``A * X = alpha * B`` in place for a triangular matrix
``A`` and a matrix of right-hand sides ``B``, which is the ``gemm``-like
counterpart of ``trsv``. ``dB`` holds ``B`` on entry and the solution ``X`` on
exit.

.. literalinclude:: ../../test/f2008/hipblas/dtrsm.f08
   :language: fortran

``test/f2008/hipblas/strsm.f08``, ``ctrsm.f08`` and ``ztrsm.f08`` cover the
remaining precisions.

Triangular matrix multiplication
------------------------------------

``hipblas?trmm`` computes ``C := alpha * op(A) * B`` (or the mirrored
right-hand form), where ``A`` is triangular and only the triangle chosen by
the fill mode is referenced.

.. literalinclude:: ../../test/f2008/hipblas/strmm.f08
   :language: fortran

``test/f2008/hipblas/dtrmm.f08``, ``ctrmm.f08`` and ``ztrmm.f08`` cover the
remaining precisions.

Rank-k update (syrk)
------------------------

``hipblas?syrk`` computes ``C := alpha * op(A) * op(A)**T + beta * C``, where
``C`` is symmetric and only the triangle chosen by the fill mode is
referenced.

.. literalinclude:: ../../test/f2008/hipblas/ssyrk.f08
   :language: fortran

``test/f2008/hipblas/dsyrk.f08``, ``csyrk.f08`` and ``zsyrk.f08`` cover the
remaining precisions. The Hermitian form, ``herk``, has no hipBLAS example
here; the :doc:`rocBLAS examples <rocblas-examples>` cover it.

Symmetric matrix product (symm)
-----------------------------------

``hipblas?symm`` computes ``C := alpha * A * B + beta * C`` with ``A``
symmetric, or the mirrored right-hand form selected by the ``side`` argument.
As with ``syrk``, only one triangle of ``A`` is referenced.

.. literalinclude:: ../../test/f2008/hipblas/ssymm.f08
   :language: fortran

``test/f2008/hipblas/dsymm.f08``, ``csymm.f08`` and ``zsymm.f08`` cover the
remaining precisions. The Hermitian form, ``hemm``, likewise appears only
among the rocBLAS programs.

Matrix addition and transposition (geam)
--------------------------------------------

``hipblas?geam`` computes ``C := alpha * op(A) + beta * op(B)``. Because each
operand has its own transpose flag and either scalar may be zero, the same
routine also serves as an out-of-place transpose or a scaled copy.

.. literalinclude:: ../../test/f2008/hipblas/sgeam.f08
   :language: fortran

``test/f2008/hipblas/dgeam.f08``, ``cgeam.f08`` and ``zgeam.f08`` cover the
remaining precisions.

Extended-precision matrix multiplication (GemmEx)
------------------------------------------------------

``hipblasGemmEx`` computes ``D := alpha * op(A) * op(B) + beta * C`` with the
type of every buffer, and the type used for the arithmetic, given explicitly
as arguments rather than fixed by the routine name. That makes it the entry
point for mixed precision work.

.. literalinclude:: ../../test/f2008/hipblas/gemmex.f08
   :language: fortran

Because the buffer types are runtime arguments, there is a single ``GemmEx``
program rather than one per precision. Note the source file is ``gemmex.f08``,
without the underscore used by the rocBLAS equivalent ``gemm_ex.f08``.
