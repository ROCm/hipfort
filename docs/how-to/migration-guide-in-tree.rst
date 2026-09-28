.. meta::
  :description: How to migrate from a ROCm library's own hand-written Fortran module to the generated bindings
  :keywords: fortran, ROCm, migration, rocBLAS, rocSPARSE, rocRAND, in-tree module, bindings

*********************************************************
Migrating from a library's own Fortran module
*********************************************************

Who this is for
===============

You call a ROCm math library from Fortran through the module **that library
ships itself** — ``use rocblas`` compiled against
``/opt/rocm/include/rocblas/rocblas_module.f90``, ``use rocsparse``,
``use rocrand_m``. Several ROCm libraries have shipped a hand-written Fortran
module next to their C API for years. At ROCm 10.2 a generated binding
supersedes them and they are removed.

If instead you build **hipFORT** yourself and write ``use hipfort_rocblas``,
this page is not yours: see :doc:`migration-guide`. The two migrations share a
destination and almost nothing else — different deadlines, different edits, and
a different answer to whether your call sites change.

.. note::

   **Your call sites very nearly do not change.** Two one-line edits remain: a
   ``use <lib>_enums`` to delete, and, if you print the library revision, a
   ``c_loc()`` to add. Scalar arguments, which an early draft of the bindings did
   break, no longer do. See `Two small source edits`_.

Your deadline is 10.2
=====================

Not 11.0. That is the release where the hand-written module is removed and the
generated one takes its place, and **there is no window in which both exist**:
for five of the seven libraries the two carry the same module name and cannot
coexist in one build.

That is also why these modules are removed rather than deprecated in place. The
old module is already called ``rocblas``, not ``hipfort_rocblas``, so there is
no prefixed-versus-bare distinction to keep two versions apart. At 10.2 there is
exactly one ``rocblas`` module in the tree, the generated one. Unlike the
hipFORT migration, there is no gradual file-by-file window.

What you are coming from
========================

.. list-table::
   :header-rows: 1
   :widths: 13 23 30 34

   * - Library
     - Modules
     - How you got it
     - Option that gated it
   * - rocBLAS
     - ``rocblas``, ``rocblas_enums``
     - ``.f90`` source in ``include/rocblas/``, compiled by you
     - ``BUILD_FORTRAN_CLIENTS`` (``ON``)
   * - hipBLAS
     - ``hipblas``, ``hipblas_enums``
     - ``.f90`` source in ``include/hipblas/``, compiled by you
     - ``BUILD_FORTRAN_CLIENTS`` (``ON``, ``OFF`` on Windows)
   * - rocSPARSE
     - ``rocsparse``, ``rocsparse_enums``
     - ``.f90`` source in ``include/rocsparse/``, compiled by you
     - ``BUILD_FORTRAN_CLIENTS`` (``ON``)
   * - hipSPARSE
     - ``hipsparse``, ``hipsparse_enums``
     - ``.mod`` in ``include/hipsparse/``
     - ``HIPSPARSE_ENABLE_FORTRAN`` (``ON``, but only declared under
       ``HIPSPARSE_ENABLE_CLIENT``, itself ``OFF``)
   * - hipSOLVER
     - ``hipsolver``, ``hipsolver_enums``
     - Nothing installed; only ``roc::hipsolver_fortran`` (a ``.so``). See
       `Special cases`_
     - ``BUILD_FORTRAN_BINDINGS`` (``${UNIX}``),
       ``EXPORT_FORTRAN_BINDINGS`` (``ON``)
   * - rocRAND
     - ``rocrand_m``, ``hipfor``
     - ``.f90`` sources in ``rocrand/src/fortran/``, compiled by you
     - ``BUILD_FORTRAN_WRAPPER`` (``OFF``)
   * - hipRAND
     - ``hiprand_m``, ``hipfor``
     - ``.f90`` sources in ``hiprand/src/fortran/``, compiled by you
     - ``BUILD_FORTRAN_WRAPPER`` (``OFF``)
   * - rocFFT, hipFFT, rocSOLVER
     - *none*
     - —
     - —

If your library is in the last row, there is no in-tree migration to make: those
three never shipped a Fortran module, so the generated binding is new surface
rather than a replacement.

Note how little of that is uniform, which is much of the point of the move: five
option names across seven libraries, as many different defaults, and four
different ways of delivering the same kind of artifact. All of it collapses to
one ``BUILD_FORTRAN_BINDINGS`` and one installed archive per library.

What you change
===============

Rename what little moves
------------------------

Five of these modules are already named after their library, so the generated
module reuses the name and your ``use`` line does not move.

.. list-table::
   :header-rows: 1
   :widths: 50 50

   * - Old
     - New
   * - ``use rocblas``, ``use hipblas``, ``use rocsparse``,
       ``use hipsparse``, ``use hipsolver``
     - Unchanged. Same module name, now coming from the generated binding
   * - ``use rocblas_enums``, ``use hipblas_enums``, ``use rocsparse_enums``,
       ``use hipsparse_enums``, ``use hipsolver_enums``
     - Delete the line. The enumerators moved into the library module you
       already ``use``
   * - ``use rocrand_m``
     - ``use rocrand``
   * - ``use hiprand_m``
     - ``use hiprand``
   * - ``use hipfor`` (the small HIP module rocRAND and hipRAND shipped
       alongside theirs)
     - ``use hip``

Stop compiling the library's source
-----------------------------------

The build change catches people precisely because the ``use`` line often does
not move. rocBLAS, hipBLAS and rocSPARSE installed their module as a **source**
file (``/opt/rocm/include/rocblas/rocblas_module.f90``), so you almost certainly
compile it as part of your own build today. Stop: the file is gone at 10.2, and
a compiled module now ships with ROCm. Drop it from your source list and link
the archive instead.

rocRAND and hipRAND did the same thing one level further out, installing their
sources under ``<lib>/src/fortran/`` and pointing at them from the config
package with ``rocrand_FORTRAN_SRC_DIRS`` and ``hiprand_FORTRAN_SRC_DIRS``.
Those variables are gone; ``find_package(rocrand-fortran)`` now hands you
``roc::rocrand_fortran`` directly, with nothing of yours left to compile.

Link the per-library Fortran archive
------------------------------------

.. code-block:: cmake

   # before: you compiled rocblas_module.f90 into your own target
   find_package(rocblas REQUIRED)
   target_sources(app PRIVATE /opt/rocm/include/rocblas/rocblas_module.f90)
   target_link_libraries(app PRIVATE roc::rocblas)

   # after
   find_package(rocblas-fortran REQUIRED)   # find_dependency()s rocblas itself
   target_link_libraries(app PRIVATE roc::rocblas roc::rocblas_fortran)

The target naming, the per-compiler install layout, the build options, and the
raw (non-CMake) link line are identical to the hipFORT migration and are not
repeated here. See :doc:`migration-guide`, sections
**Link the per-library Fortran archive**, **Build options** and
**Compiler support**.

Two small source edits
======================

Scalar arguments used to be the worry here, and are not. The hand-written
modules pass ``alpha`` and ``beta`` as ``type(c_ptr), value``, and an early
draft of the generated bindings declared them with their actual type, which
broke every call site passing ``c_loc(alpha)``. The generator now emits **both**
forms as specifics of the same generic:

.. code-block:: fortran

   interface rocblas_daxpy
     function rocblas_daxpy_(handle, n, alpha, ...)       ! real(c_double) :: alpha
     function rocblas_daxpy_dptr(handle, n, alpha, ...)   ! type(c_ptr), value :: alpha

so ``c_loc(alpha)`` resolves on the ``_dptr`` specific and your existing call
sites compile untouched. Two differences remain, and both are one-line fixes.

Delete the ``<lib>_enums`` line
-------------------------------

The enumerators moved into the library module, so the separate module is gone:

.. code-block:: fortran

   use rocblas
   use rocblas_enums   ! delete this line

That is the whole of it for most files. Measured against the libraries' own
samples in ``clients/samples/example_fortran_*.f90``, compiled unmodified: of
rocBLAS's four, two build as they stand and two need only this deletion.

Character output arguments
--------------------------

``rocsparse_get_git_rev`` and ``rocsparse_get_version`` take
``character(c_char) :: rev(*)`` in the hand-written module and
``type(c_ptr), value`` in the generated one, so passing a character variable
fails:

.. code-block:: none

   error: Actual argument type 'CHARACTER(KIND=1,LEN=12_8)' is not compatible
   with dummy argument type 'c_ptr'

Pass ``c_loc(rev)`` instead, with ``rev`` declared ``target``. This is the one
difference that is not a deletion, and it is confined to the handful of
version- and revision-query helpers: no computational routine is affected. It
is also what makes all fourteen rocSPARSE samples fail at once, since each of
them opens by printing the library revision.

.. note::

   Both differences are source-level only. The generated interfaces bind the
   same C symbols with the same ABI, so nothing changes at the call boundary and
   no symbol or link check can see them. They show up when real client code is
   compiled, which is why the libraries' own samples are the useful test.

If you hit a difference not described here, report it at
`hipfort issues <https://github.com/ROCm/hipfort/issues>`_ rather than working
around it locally: these are generator differences, and a fix there fixes it for
everyone.


Special cases
=============

Two libraries do not migrate the way the rest do, because the new names collide
with names they already used.

**hipSOLVER reuses a target name that already meant something else.** hipSOLVER
is the one library that already exported ``roc::hipsolver_fortran``, and it was
a *shared* library built from the hand-written ``hipsolver_module.f90``. The
generated binding takes the same public name, but it is a *static* archive with
a different module inside. So a build that links ``roc::hipsolver_fortran``
today keeps linking and quietly gets the other thing; re-check those call sites
rather than assuming the upgrade was transparent. ``libhipsolver_fortran.so``
also stops existing, which matters if you link it by filename or depend on its
soversion.

Few builds should actually be affected, because that module was never
installable: the guard that installs ``hipsolver_module.f90`` is never defined
anywhere, so no ``.f90`` and no ``.mod`` ever reached an install tree, and the
backward-compatibility symlinks beside it point at a file that is not there.
Only an in-tree hipSOLVER build could consume it.

hipSOLVER also already had a ``BUILD_FORTRAN_BINDINGS`` option, meaning "build
the hand-written module" and defaulting to ``${UNIX}`` rather than ``ON``. The
name now means the generated bindings, as everywhere else. Its companions
``EXPORT_FORTRAN_BINDINGS`` and ``BUILD_FORTRAN_MODULE`` retire with the module
they gated.

**hipRAND had two Fortran tracks, and refuses to build both.** hipRAND's
deprecated hand-written wrapper (``hiprand_m.f90``, plus the small ``hipfor``
module beside it) is gated by ``BUILD_FORTRAN_WRAPPER``, and both it and the
generated binding want a target named ``hiprand_fortran``. Two ``add_library``
calls with one name is a hard CMake error whose message names neither option,
so the build stops earlier with one that does: turn off
``BUILD_FORTRAN_WRAPPER`` to keep the generated bindings, or
``HIPRAND_BUILD_FORTRAN_BINDINGS`` to keep the wrapper. Nothing picks a winner
for you, because a site that set ``BUILD_FORTRAN_WRAPPER=ON`` asked for the
wrapper. Once the wrapper is removed the question disappears, and
``BUILD_FORTRAN_WRAPPER`` retires with it. rocRAND had the same option and the
same wrapper, and has already been through this.

What ``BUILD_FORTRAN_CLIENTS`` still means
==========================================

``BUILD_FORTRAN_CLIENTS``, which rocBLAS, hipBLAS and rocSPARSE already have, is
**not** the switch that builds the bindings and is not renamed. It means "build
the Fortran part of ``clients/``" (rocSPARSE's Fortran samples, rocBLAS and
hipBLAS's ``*_fortran_client`` wrappers), it keeps its ``ON`` default, and that
surface survives. What changes is where its module comes from: those samples
used to compile the hand-written ``.f90`` in-tree and now link the generated
``roc::<lib>_fortran`` — which is exactly why they are affected by
`Two small source edits`_. The one new constraint is that they need the
bindings, so ``-DBUILD_FORTRAN_CLIENTS=ON -DBUILD_FORTRAN_BINDINGS=OFF`` is
refused with an error naming the flag to turn back on.
