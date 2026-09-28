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

.. warning::

   **Your call sites do change**, and this is the part that surprises people.
   The hand-written modules declare scalar and string arguments differently from
   the generated ones, so code that compiles today will not. This is not a
   handful of edge cases; it is every routine taking an ``alpha`` or ``beta``.
   See `Your call sites change`_ before you plan the work.

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

Your call sites change
======================

This is the part with no counterpart in the hipFORT migration, where the claim
"your calls do not change" holds. Here it does not.

The hand-written modules pass scalars as opaque pointers; the generated bindings
declare them with their actual type. Taking ``rocblas_daxpy``:

.. list-table::
   :header-rows: 1
   :widths: 30 35 35

   * - Argument
     - Hand-written module
     - Generated binding
   * - ``alpha``
     - ``type(c_ptr), value``
     - ``real(c_double)``

So a call written for the old module has nothing to resolve against:

.. code-block:: fortran

   ! today, against rocblas_module.f90
   call ROCBLAS_CHECK(rocblas_daxpy(handle, n, c_loc(alpha), dx, 1, dy, 1))

   ! error against the generated binding:
   !   There is no specific function for the generic 'rocblas_daxpy'

Character arguments differ the same way. ``rocsparse_get_git_rev`` takes
``character(c_char) :: rev(*)`` in the hand-written module and
``type(c_ptr), value`` in the generated one, so passing a character variable
fails with a type mismatch.

How much is affected
--------------------

Every routine taking an ``alpha`` or ``beta`` scalar. Measured against the
libraries' own sample programs — the ones shipped in
``clients/samples/example_fortran_*.f90``, compiled unmodified — **all 18 fail
to build**: four in rocBLAS, fourteen in rocSPARSE. The errors seen were on
``rocblas_daxpy``, ``rocblas_sscal``, ``rocsparse_dcsrmv``, ``dcoomv``,
``dellmv``, ``dhybmv`` and ``dbsrmv``, plus the character case above. They
reduce to the two differences described here rather than to eighteen separate
problems.

.. note::

   **Why no build of yours caught this earlier.** The two forms are
   *ABI-identical*: a non-``value`` Fortran dummy is passed by address, which is
   exactly what ``c_loc(alpha)`` passed by value already is. Nothing is wrong at
   the call boundary, and no symbol- or link-level check can see it. The break
   is purely at the source level, which is why it only shows up when real client
   code is compiled.

What to do about it
-------------------

Grep for the affected call sites before you start, so you size the work
correctly:

.. code-block:: shell

   grep -rnE 'c_loc *\( *(alpha|beta)' --include='*.f90' --include='*.F90' .

Each one loses its ``c_loc()`` and passes the scalar directly. That is
mechanical, but it is an edit per call site rather than an edit per file, so
plan for it.

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
`Your call sites change`_. The one new constraint is that they need the
bindings, so ``-DBUILD_FORTRAN_CLIENTS=ON -DBUILD_FORTRAN_BINDINGS=OFF`` is
refused with an error naming the flag to turn back on.
