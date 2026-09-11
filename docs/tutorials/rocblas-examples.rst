.. meta::
  :description: rocBLAS examples written with the hipFORT Fortran interfaces
  :keywords: hipFORT, ROCm, rocBLAS, BLAS, Fortran, examples, tutorials

****************
rocBLAS examples
****************

`rocBLAS <https://rocm.docs.amd.com/projects/rocBLAS/en/latest/>`_ is the AMD
implementation of the Basic Linear Algebra Subprograms (BLAS) for AMD GPUs.
hipFORT exposes it through the ``hipfort_rocblas`` module, which mirrors the
rocBLAS C API one to one, together with ``hipfort_rocblas_enums`` for the
enumerations (``rocblas_operation_none``, ``rocblas_fill_lower`` and so on).
rocSOLVER and rocSPARSE reuse the rocBLAS handle type, so the patterns on this
page carry over to those libraries as well.

Every program on this page is a complete, self-contained example that is built
and run as part of the hipFORT test suite. The Fortran 2008 sources live in
``test/f2008/rocblas``. Most of them have an equivalent Fortran 2003 source in
``test/f2003/rocblas``, which uses ``type(c_ptr)`` device pointers and explicit
byte counts instead of Fortran array pointers. The two batched-pointer and
packed-storage examples, ``dgemv_batched`` and ``stpsv``, are Fortran 2008
only. One further program, ``test/f2018/rocblas/saxpy.f90``, exercises the
Fortran 2018 assumed-rank interfaces and is described below.

hipBLAS offers the same functionality through an API that follows cuBLAS; see
the :doc:`hipBLAS examples <hipblas-examples>`.

The examples are grouped the way the BLAS routines themselves are: Level 1
operates on vectors, Level 2 on a matrix and a vector, and Level 3 on two
matrices. Most routines are provided in four precisions, identified by the
usual BLAS prefix: ``s`` (single-precision real), ``d`` (double-precision
real), ``c`` (single-precision complex) and ``z`` (double-precision complex).
Each section below shows one precision and names the sibling test files that
cover the others.

rocBLAS call pattern
=====================

A rocBLAS program always follows the same sequence:

#. Create a handle with ``rocblas_create_handle``.
#. Optionally choose how scalar arguments and results are passed with
   ``rocblas_set_pointer_mode``: host pointer mode (``0``) reads ``alpha``,
   ``beta`` and scalar results such as a dot product from host memory, while
   device pointer mode expects them on the device.
#. Allocate device memory and copy the input data over, either with
   ``hipMalloc``/``hipMemcpy`` or, in the Fortran 2008 interfaces, with the
   ``hipMalloc(source=...)`` shortcut that allocates and copies in one call.
#. Call the rocBLAS routine.
#. Call ``hipDeviceSynchronize`` before reading a result, whether it was
   written to a host scalar or to device memory.
#. Copy device results back to the host.
#. Free the device memory and release the handle with
   ``rocblas_destroy_handle``.

Keep the following conventions in mind:

* rocBLAS matrices are stored column-major, which matches Fortran's native
  array layout directly, so no transpose trick is needed to call rocBLAS from
  Fortran.
* The leading dimension of a device matrix is usually just its first
  dimension, ``size(dA,1)``.
* Enumerations such as ``rocblas_operation_none``, ``rocblas_fill_lower``,
  ``rocblas_diagonal_non_unit`` and ``rocblas_side_left`` come from the
  ``hipfort_rocblas_enums`` module (re-exported by ``hipfort_rocblas``).
* Every rocBLAS call returns a status code. The examples wrap them in
  ``rocblasCheck`` from the ``hipfort_check`` module, which aborts on failure.
  (``dgemv_batched.f08`` uses ``hipCheck`` for its rocBLAS calls instead; both
  abort on a non-zero status.)

Building an example
===================

The examples only need the ``rocblas`` and ``hip`` hipFORT components:

.. code-block:: cmake

   find_package(hipfort REQUIRED COMPONENTS hip rocblas)

   add_executable(my_blas saxpy.f08)
   target_link_libraries(my_blas PRIVATE hipfort::rocblas hipfort::hip)

See :doc:`../how-to/using-hipfort` for the full set of build options.

Level 1: vector operations
==========================

Scaled vector update (axpy)
----------------------------

``rocblas_?axpy`` computes ``y := alpha * x + y``. This example runs it in
single precision and checks the result against the expected value.

.. literalinclude:: ../../test/f2008/rocblas/saxpy.f08
   :language: fortran

``test/f2008/rocblas/daxpy.f08``, ``caxpy.f08`` and ``zaxpy.f08`` run the same
computation in double-precision real, single-precision complex and
double-precision complex, respectively.

Arrays of rank greater than one
--------------------------------

The Fortran 2008 array interfaces shown above are generated per rank and stop
at rank 1 for vector arguments, so a rank-3 array cannot be handed to
``rocblas_saxpy`` directly. Building hipFORT with the ``HIPFORT_ASSUMED_RANK``
option replaces those rank-specific overloads with a single Fortran 2018
``dimension(..)`` wrapper that accepts an array of any rank. The following
program passes rank-3 ``dx`` and ``dy`` to the same generic, with ``n``
counting all of the elements:

.. literalinclude:: ../../test/f2018/rocblas/saxpy.f90
   :language: fortran

This is the only assumed-rank example in the test suite, and it is skipped
unless ``HIPFORT_ASSUMED_RANK`` is enabled.

Vector scaling (scal)
---------------------

``rocblas_?scal`` computes ``x := alpha * x``. The operation is in place, so
the device vector is both the input and the output; this example copies the
result into a second host array to keep the original input available for
verification.

.. literalinclude:: ../../test/f2008/rocblas/sscal.f08
   :language: fortran

``test/f2008/rocblas/dscal.f08``, ``cscal.f08`` and ``zscal.f08`` cover the
remaining precisions.

Complex vectors additionally have a mixed-precision form in which ``alpha`` is
real rather than complex: ``rocblas_csscal`` scales a single-precision complex
vector by a single-precision real scalar, and ``rocblas_zdscal`` does the same
in double precision. See ``test/f2008/rocblas/csscal.f08`` and ``zdscal.f08``.

Dot products
------------

``rocblas_?dot`` computes the dot product of two real vectors and returns the
scalar result through a pointer whose location (host or device) is set by
``rocblas_set_pointer_mode``.

.. literalinclude:: ../../test/f2008/rocblas/sdot.f08
   :language: fortran

``test/f2008/rocblas/ddot.f08`` is the double-precision equivalent.

Complex vectors have two dot product variants: ``rocblas_?dotc`` conjugates
the first vector before multiplying, and ``rocblas_?dotu`` does not. Compare
``test/f2008/rocblas/cdotc.f08`` and ``cdotu.f08`` (also available in double
precision as ``zdotc.f08`` and ``zdotu.f08``) to see the different expected
results for the same input data.

Euclidean norm (nrm2)
---------------------

``rocblas_?nrm2`` computes the Euclidean norm of a vector and returns it
through a pointer whose location follows the pointer mode.

.. literalinclude:: ../../test/f2008/rocblas/snrm2.f08
   :language: fortran

``test/f2008/rocblas/dnrm2.f08`` is the double-precision equivalent. The
complex forms are named for both types involved, because the norm of a complex
vector is real: ``rocblas_scnrm2`` takes a single-precision complex vector and
returns a single-precision real result, and ``rocblas_dznrm2`` is its
double-precision counterpart. See ``scnrm2.f08`` and ``dznrm2.f08``.

Sum of absolute values (asum)
-----------------------------

``rocblas_?asum`` sums the absolute values of a vector's elements. For complex
vectors it sums ``abs(real(x)) + abs(aimag(x))`` per element rather than the
complex modulus.

.. literalinclude:: ../../test/f2008/rocblas/sasum.f08
   :language: fortran

``test/f2008/rocblas/dasum.f08`` is the double-precision equivalent, and
``scasum.f08`` and ``dzasum.f08`` are the mixed real/complex forms named on the
same convention as ``scnrm2``.

Index of the largest or smallest element (iamax and iamin)
-----------------------------------------------------------

``rocblas_i?amax`` returns the index of the element with the largest absolute
value, and ``rocblas_i?amin`` the smallest. The returned index is **1-based**,
so it can be used to subscript a Fortran array directly.

.. literalinclude:: ../../test/f2008/rocblas/isamax.f08
   :language: fortran

Both routines exist in all four precisions: ``isamax.f08``, ``idamax.f08``,
``icamax.f08`` and ``izamax.f08`` for the maximum, and ``isamin.f08``,
``idamin.f08``, ``icamin.f08`` and ``izamin.f08`` for the minimum.

Level 2: matrix-vector operations
==================================

Matrix-vector multiplication
------------------------------

``rocblas_?gemv`` computes ``y := alpha * op(A) * x + beta * y``. This example
uses constant matrix and vector entries so the expected result is a constant
vector and easy to check.

.. literalinclude:: ../../test/f2008/rocblas/sgemv.f08
   :language: fortran

``test/f2008/rocblas/dgemv.f08``, ``cgemv.f08`` and ``zgemv.f08`` cover the
remaining precisions.

Batched matrix-vector multiplication
--------------------------------------

``rocblas_?gemv_batched`` runs several independent ``gemv`` calls in one
launch. ``A``, ``x`` and ``y`` are each passed as a device array of device
pointers, one per batch, rather than as a single Fortran array, so this
example builds and uploads those pointer arrays explicitly.

.. literalinclude:: ../../test/f2008/rocblas/dgemv_batched.f08
   :language: fortran

This is the only batched ``gemv`` example; there is no single-precision or
complex counterpart in the test suite.

Rank-1 update (ger)
-------------------

``rocblas_?ger`` computes ``A := alpha * x * y**T + A``, adding the outer
product of two vectors to a matrix in place.

.. literalinclude:: ../../test/f2008/rocblas/sger.f08
   :language: fortran

``test/f2008/rocblas/dger.f08`` is the double-precision equivalent. Complex
vectors split the routine in two, on the same conjugated/unconjugated
distinction as ``dotc`` and ``dotu``: ``rocblas_?gerc`` conjugates ``y`` and
forms ``x * y**H``, while ``rocblas_?geru`` does not and forms ``x * y**T``.
See ``cgerc.f08``, ``cgeru.f08``, ``zgerc.f08`` and ``zgeru.f08``.

Triangular solve
------------------

``rocblas_?trsv`` solves ``A * x = b`` in place for a triangular matrix
``A``, given the fill mode (``rocblas_fill_lower`` or ``rocblas_fill_upper``),
the transpose operation and whether the diagonal is unit or not. ``dx`` holds
``b`` on entry and ``x`` on exit.

.. literalinclude:: ../../test/f2008/rocblas/strsv.f08
   :language: fortran

``test/f2008/rocblas/dtrsv.f08``, ``ctrsv.f08`` and ``ztrsv.f08`` cover the
remaining precisions.

Packed triangular solve
--------------------------

``rocblas_?tpsv`` solves the same problem as ``trsv``, but the triangular
matrix is stored in packed form: only the referenced triangle is kept, in a
single one-dimensional array, which halves the memory footprint for large
matrices.

.. literalinclude:: ../../test/f2008/rocblas/stpsv.f08
   :language: fortran

This is the only packed-storage example; there is no double-precision or
complex counterpart in the test suite.

Level 3: matrix-matrix operations
==================================

Matrix-matrix multiplication
------------------------------

``rocblas_?gemm`` computes ``C := alpha * op(A) * op(B) + beta * C``. As with
``gemv``, this example uses constant matrix entries so the exact result is a
constant matrix.

.. literalinclude:: ../../test/f2008/rocblas/dgemm.f08
   :language: fortran

``test/f2008/rocblas/sgemm.f08``, ``cgemm.f08`` and ``zgemm.f08`` cover the
remaining precisions.

Batched matrix multiplication
--------------------------------

``rocblas_?gemm_batched`` runs several independent ``gemm`` calls in one
launch, with ``A``, ``B`` and ``C`` each passed as a device array of device
pointers. hipFORT's Fortran 2008 pointer-convenience interfaces cannot be used
for this argument shape: passing a plain array would only give rocBLAS a
single pointer, not the array of device pointers the routine requires. This
test therefore builds the pointer array with the same ``type(c_ptr)`` idiom
used in the Fortran 2003 interfaces, and only the per-batch device allocations
use the Fortran 2008 ``hipMalloc(source=...)`` shortcut.

.. literalinclude:: ../../test/f2008/rocblas/dgemm_batched.f08
   :language: fortran

``test/f2008/rocblas/sgemm_batched.f08``, ``cgemm_batched.f08`` and
``zgemm_batched.f08`` cover the remaining precisions.

Strided-batched matrix multiplication
-----------------------------------------

``rocblas_?gemm_strided_batched`` also runs several ``gemm`` calls in one
launch, but ``A``, ``B`` and ``C`` are contiguous device arrays with a fixed
stride between the start of each batch's matrix, instead of an array of
pointers. This is usually simpler to set up than ``gemm_batched`` when the
batches are already laid out contiguously in memory.

.. literalinclude:: ../../test/f2008/rocblas/dgemm_strided_batched.f08
   :language: fortran

``test/f2008/rocblas/sgemm_strided_batched.f08``,
``cgemm_strided_batched.f08`` and ``zgemm_strided_batched.f08`` cover the
remaining precisions.

Triangular matrix multiplication
------------------------------------

``rocblas_?trmm`` computes ``C := alpha * op(A) * B`` (or the mirrored
right-hand form), where ``A`` is triangular. This example exercises the
out-of-place, 14-argument form of the interface, which writes the result to a
separate ``C`` buffer instead of overwriting ``B``.

.. literalinclude:: ../../test/f2008/rocblas/dtrmm.f08
   :language: fortran

``dtrmm`` is the only ``trmm`` example among the rocBLAS programs.

Triangular solve with multiple right-hand sides
----------------------------------------------------

``rocblas_?trsm`` solves ``A * X = alpha * B`` in place for a triangular
matrix ``A`` and a matrix of right-hand sides ``B``, which is the ``gemm``-like
counterpart of ``trsv``. ``dB`` holds ``B`` on entry and the solution ``X`` on
exit.

.. literalinclude:: ../../test/f2008/rocblas/dtrsm.f08
   :language: fortran

``test/f2008/rocblas/strsm.f08``, ``ctrsm.f08`` and ``ztrsm.f08`` cover the
remaining precisions.

Rank-k update (syrk and herk)
--------------------------------

``rocblas_?syrk`` computes ``C := alpha * op(A) * op(A)**T + beta * C``, where
``C`` is symmetric and only the triangle chosen by the fill mode is
referenced.

.. literalinclude:: ../../test/f2008/rocblas/ssyrk.f08
   :language: fortran

``test/f2008/rocblas/dsyrk.f08``, ``csyrk.f08`` and ``zsyrk.f08`` cover the
remaining precisions. For complex data there is also a Hermitian form,
``rocblas_?herk``, which uses ``A * A**H`` and produces a matrix with a real
diagonal; see ``cherk.f08`` and ``zherk.f08``.

Symmetric and Hermitian matrix product (symm and hemm)
---------------------------------------------------------

``rocblas_?symm`` computes ``C := alpha * A * B + beta * C`` with ``A``
symmetric, or the mirrored right-hand form selected by the ``side`` argument.
As with ``syrk``, only one triangle of ``A`` is referenced.

.. literalinclude:: ../../test/f2008/rocblas/ssymm.f08
   :language: fortran

``test/f2008/rocblas/dsymm.f08``, ``csymm.f08`` and ``zsymm.f08`` cover the
remaining precisions, and ``rocblas_?hemm`` is the Hermitian form for complex
data; see ``chemm.f08`` and ``zhemm.f08``.

Matrix addition and transposition (geam)
--------------------------------------------

``rocblas_?geam`` computes ``C := alpha * op(A) + beta * op(B)``. Because each
operand has its own transpose flag and either scalar may be zero, the same
routine also serves as an out-of-place transpose or a scaled copy.

.. literalinclude:: ../../test/f2008/rocblas/sgeam.f08
   :language: fortran

``test/f2008/rocblas/dgeam.f08``, ``cgeam.f08`` and ``zgeam.f08`` cover the
remaining precisions.

Extended-precision matrix multiplication (gemm_ex)
------------------------------------------------------

``rocblas_gemm_ex`` computes ``D := alpha * op(A) * op(B) + beta * C`` with the
type of every buffer, and the type used for the arithmetic, given explicitly as
``rocblas_datatype_*`` arguments. That makes it the entry point for mixed
precision work, and it writes to a separate ``D`` rather than overwriting
``C``. A ``rocblas_gemm_algo_*`` argument selects the algorithm. This example
keeps every buffer and the compute type at ``rocblas_datatype_f32_r``, so it
performs an ordinary single-precision ``gemm``.

.. literalinclude:: ../../test/f2008/rocblas/gemm_ex.f08
   :language: fortran

Because the buffer types are runtime arguments rather than part of the routine
name, there is a single ``gemm_ex`` program rather than one per precision.
