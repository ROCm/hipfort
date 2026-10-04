.. meta::
  :description: How to migrate from a ROCm library's own hand-written Fortran module to the generated bindings
  :keywords: fortran, ROCm, migration, rocBLAS, rocSPARSE, rocRAND, in-tree module, bindings

*********************************************************
Migrating from a library's own Fortran module
*********************************************************

Who this is for
===============

You call a ROCm math library from Fortran through the module **that library
ships itself**, ``use rocblas`` compiled against
``/opt/rocm/include/rocblas/rocblas_module.f90``, ``use rocsparse``,
``use rocrand_m``. Several ROCm libraries have shipped a hand-written Fortran
module next to their C API for years. At ROCm 10.2 a generated binding
supersedes them and they are removed.

If instead you build **hipFORT** yourself and write ``use hipfort_rocblas``,
this page is not yours: see :doc:`migration-guide`. The two migrations share a
destination and almost nothing else. Different deadlines, different edits, and
a different answer to whether your call sites change.

.. note::

   **Your call sites change in a few places.** A ``use <lib>_enums`` line to
   delete in every case, and a short, per-library list of signature changes,
   one of which (handle creation in rocBLAS and hipBLAS) still compiles but
   fails at run time. Read `What changes at your call sites`_ before you
   rebuild.

Why the modules are being replaced
==================================

Each of these modules was written and maintained by hand next to its library,
and it shows: they cover a subset of the C API, they lag behind it, and every
library delivered its module differently (a source file to compile, a ``.mod``,
a shared library, or nothing installed at all). The generated binding that
replaces them is produced from the library's own headers in the same build, so
it declares every entry point the ``.so`` exports, with the same layout,
options and CMake package in every library. hipSOLVER's binding, for example,
goes from 224 interfaces to 546.

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
     - Nothing installed; compiled only into hipSPARSE's own samples
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
rather than a replacement. The same is true in practice of hipSPARSE and
hipSOLVER, whose modules never reached an install tree: only a build of the
library itself could use them.

Note how little of that is uniform, which is much of the point of the move: five
option names across seven libraries, as many different defaults, and four
different ways of delivering the same kind of artifact. All of it collapses to
one ``BUILD_FORTRAN_BINDINGS`` and one installed archive per library.

What you change in your build
=============================

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

The generated source is still installed, at
``<datadir>/<library>/fortran/<library>.F90``
(``/opt/rocm/share/rocblas/fortran/rocblas.F90``), for compilers other than
``amdflang``; see :doc:`migration-guide`, **The installed sources**.

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

Without CMake, add ``-I/opt/rocm/include/fortran/amdflang`` to find
``rocblas.mod`` and ``-L/opt/rocm/lib/fortran/amdflang -lrocblas_fortran``
before ``-lrocblas``.

The target naming, the per-compiler install layout, what to build with a
compiler other than ``amdflang``, and the build options are identical to the
hipFORT migration and are not repeated here. See :doc:`migration-guide`,
sections **Do I need to build anything?**, **Compile and link**,
**Compiler support** and **Build options**.

What changes at your call sites
===============================

The generated bindings follow the C API more closely than the hand-written
modules did: an output argument is a typed variable passed by reference rather
than a ``type(c_ptr)`` you build with ``c_loc``, and an enum argument has the
enum's kind rather than a bare ``integer(c_int)``. Most of these differences
are compile errors that point at the line to fix. **One is not**, so start
there.

Every library: delete the ``<lib>_enums`` line
----------------------------------------------

The enumerators moved into the library module, so the separate module is gone:

.. code-block:: fortran

   use rocblas
   use rocblas_enums   ! delete this line

rocBLAS and hipBLAS: pass the handle itself to the create call
--------------------------------------------------------------

.. warning::

   The hand-written modules took the handle **by value**, so you wrote
   ``rocblas_create_handle(c_loc(handle))``. The generated bindings take it
   **by reference**, like the C API. The old call still compiles, because
   ``c_loc(handle)`` is a valid ``type(c_ptr)`` expression, but the library
   now writes the new handle into a temporary, and ``handle`` stays unset.
   Your first call on it fails at run time, far from the cause.

.. code-block:: fortran

   type(c_ptr), target :: handle

   ! before (hand-written module)
   stat = rocblas_create_handle(c_loc(handle))
   ! after (generated binding)
   stat = rocblas_create_handle(handle)

The same applies to ``hipblasCreate``. Search for it rather than waiting for a
crash: ``grep -rniE '(rocblas_create_handle|hipblasCreate)[[:space:]]*\([[:space:]]*c_loc' .``

Scalar arguments such as ``alpha`` and ``beta`` do **not** change: the
generated generic still accepts ``c_loc(alpha)`` (a ``type(c_ptr)``), and with
the default array interfaces it also accepts the host scalar itself, for host
pointer mode.

rocBLAS and hipBLAS: the rest
-----------------------------

These are compile errors when they hit:

*  **Modes.** ``rocblas_get_pointer_mode`` and ``rocblas_set_pointer_mode``
   take an ``integer(kind(rocblas_pointer_mode_host))`` rather than an
   ``integer(c_int)``. hipBLAS's ``hipblasGetPointerMode`` and
   ``hipblasGetAtomicsMode`` return the mode in a variable of the enum's kind
   passed by reference, not through ``c_loc``.
*  hipBLAS: the stride arguments of the strided-batched solver routines
   (``hipblasSgetrfStridedBatched`` and its family) are
   ``integer(c_int64_t)``, as in the C API.
*  hipBLAS: the ``HIP_R_*`` / ``HIP_C_*`` datatype enumerators used by the
   ``_ex`` routines are no longer re-exported by ``hipblas``. They come from
   ``use hip``, HIP's own binding.

rocSPARSE
---------

rocSPARSE has the longest list, all in ``projects/rocsparse/CHANGELOG.md``.
The ones you are likely to meet:

*  **Buffer sizes.** The 69 ``*_buffer_size`` routines return the size in an
   ``integer(c_size_t)`` passed by reference, instead of a ``type(c_ptr)``:
   pass the variable, not ``c_loc`` of it.
*  **Git revision.** ``rocsparse_get_git_rev`` takes ``type(c_ptr), value``
   rather than ``character(c_char) :: rev(*)``: declare the buffer ``target``
   and pass ``c_loc(rev)``. ``rocsparse_get_version`` is unchanged.
*  **Sorting.** ``rocsparse_csrsort`` and ``rocsparse_cscsort`` take the
   matrix descriptor, as in the C API (one argument more).
*  **Argument order.** ``rocsparse_Xcsr2csr_compress`` has its row-pointer and
   column-index arguments in the C order. Both are integer arrays, so **a call
   in the old order still compiles** and passes the wrong array: check each
   call by hand.
*  **Keyword arguments.** If you call with keywords, a few dummy names
   changed (``info`` is ``myInfo``, ``result`` is ``myResult``).

hipSPARSE and hipSOLVER
-----------------------

Their hand-written modules were never installed, so only code built inside the
library's own tree can have used them. The same kinds of changes apply:
output scalars (buffer sizes, ``lwork``, sweep counts, residuals) are typed
variables passed by reference instead of ``type(c_ptr)``, handles are created
by reference, and hipSOLVER's ``jobu`` / ``jobv`` are ``character(c_char)``.
The compiler flags each one.

rocRAND and hipRAND
-------------------

Rename the module (`Rename what little moves`_) and replace ``use hipfor``
with ``use hip``.

.. note::

   Apart from the argument order in ``rocsparse_Xcsr2csr_compress``, these
   differences are visible to the compiler but not to the linker: the
   generated interfaces bind the same C symbols, so no symbol or link check
   sees them. They show up when real client code is compiled, which is why it
   is worth building your code against the new bindings early.

If you hit a difference not described here, report it at
`hipfort issues <https://github.com/ROCm/hipfort/issues>`_ rather than working
around it locally: these are generator differences, and a fix there fixes it for
everyone.

Building on ROCm versions before and after 10.2
===============================================

Because the module name stays the same, a code that has to build on both sides
of 10.2 does not need a wrapper module; only the build differs. Compile the
hand-written source where it exists, and link the generated binding otherwise:

.. code-block:: cmake

   find_package(rocblas-fortran CONFIG QUIET)
   if(TARGET roc::rocblas_fortran)          # ROCm 10.2 or later
     target_link_libraries(app PRIVATE roc::rocblas roc::rocblas_fortran)
   else()                                   # before 10.2
     find_package(rocblas REQUIRED)
     find_file(ROCBLAS_MODULE_F90 rocblas_module.f90
               PATH_SUFFIXES include/rocblas REQUIRED)
     target_sources(app PRIVATE ${ROCBLAS_MODULE_F90})
     target_link_libraries(app PRIVATE roc::rocblas)
   endif()

The call sites are the harder part, because of the changes above. Write them
the new way (``rocblas_create_handle(handle)``, no ``use rocblas_enums``) and
adjust the few that differ behind a preprocessor guard, or move to hipFORT
(see :doc:`migration-guide`), which already uses the new calling conventions
and is maintained beside the new bindings until ROCm 11.0.

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
the hand-written module". The name now means the generated bindings, as
everywhere else, and keeps its ``${UNIX}`` default. Its companions
``EXPORT_FORTRAN_BINDINGS`` and ``BUILD_FORTRAN_MODULE`` retire with the module
they gated.

**rocRAND and hipRAND drop** ``BUILD_FORTRAN_WRAPPER``. Their deprecated
hand-written wrappers (``rocrand_m.f90``, ``hiprand_m.f90``, and the small
``hipfor`` module beside each) are removed together with the option that built
them, and the generated binding takes over the ``<lib>_fortran`` target name.
A build that still passes ``-DBUILD_FORTRAN_WRAPPER=ON`` is not refused: CMake
only reports the variable as unused, and you get the generated binding. Switch
to ``use rocrand`` or ``use hiprand``.

What ``BUILD_FORTRAN_CLIENTS`` still means
==========================================

``BUILD_FORTRAN_CLIENTS``, which rocBLAS, hipBLAS and rocSPARSE already have, is
**not** the switch that builds the bindings and is not renamed. It means "build
the Fortran part of ``clients/``" (rocSPARSE's Fortran samples, rocBLAS and
hipBLAS's ``*_fortran_client`` wrappers), it keeps its ``ON`` default, and that
surface survives. It now also builds each binding's own tests in
``fortran/test/``.

What changes is where its module comes from: those samples used to compile the
hand-written ``.f90`` in-tree and now link the generated
``roc::<lib>_fortran``. The one new constraint is that they need the bindings:
with ``-DBUILD_FORTRAN_BINDINGS=OFF``, or no Fortran compiler, the Fortran
clients are skipped with a message saying why, and the rest of the build goes
on.
