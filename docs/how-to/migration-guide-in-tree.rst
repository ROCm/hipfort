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
module next to their C API for years. At ROCm 10.3 a generated binding
supersedes them and they are removed.

If instead you build **hipFORT** yourself and write ``use hipfort_rocblas``,
this page is not yours: see :doc:`migration-guide`. The two migrations share a
destination and almost nothing else. Different deadlines, different edits, and
a different answer to whether your call sites change.

.. note::

   **Your call sites change in a few places.** A ``use <lib>_enums`` line to
   delete wherever you have one, and a short, per-library list of signature
   changes. A few of them still compile but go wrong at run time: creating a
   handle or reading a stream in rocBLAS, hipBLAS and hipSOLVER, and the
   argument order of rocSPARSE's ``csr2csr_compress``. Read
   `What changes at your call sites`_ before you rebuild.

Why the modules are being replaced
==================================

Each of these modules was written and maintained by hand next to its library,
and it shows: they cover a subset of the C API, they lag behind it, and every
library delivered its module differently (a source file to compile, a ``.mod``,
a shared library, or nothing installed at all). The generated binding that
replaces them is generated from the library's own headers and committed next to
them, so it declares every entry point the ``.so`` exports, with the same
layout, options and CMake package in every library. hipSOLVER's binding, for
example, goes from 224 entry points to 546.

Your deadline is 10.3
=====================

Not 11.0, as for hipFORT users. ROCm 10.3 is the release where the hand-written
module is removed and the generated one takes its place, and **there is no window in which both exist**:
for five of the seven libraries the two carry the same module name and cannot
coexist in one build.

That is also why these modules are removed rather than deprecated in place. The
old module is already called ``rocblas``, not ``hipfort_rocblas``, so there is
no prefixed-versus-bare distinction to keep two versions apart. At 10.3 there is
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
     - Build option
   * - rocBLAS
     - ``rocblas``, ``rocblas_enums``
     - ``.f90`` source in ``include/rocblas/``, compiled by you
     - None: always installed (``BUILD_FORTRAN_CLIENTS`` only built the
       in-tree Fortran clients)
   * - hipBLAS
     - ``hipblas``, ``hipblas_enums``
     - ``.f90`` source in ``include/hipblas/``, compiled by you
     - None: always installed (``BUILD_FORTRAN_CLIENTS`` only built the
       in-tree Fortran clients)
   * - rocSPARSE
     - ``rocsparse``, ``rocsparse_enums``
     - ``.f90`` source in ``include/rocsparse/``, compiled by you
     - None: always installed (``BUILD_FORTRAN_CLIENTS`` only built the
       in-tree Fortran clients)
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
     - ``.f90`` sources under ``rocrand/src/fortran/``, installed only by a
       rocRAND built with the option; ROCm packages never shipped them
     - ``BUILD_FORTRAN_WRAPPER`` (``OFF``)
   * - hipRAND
     - ``hiprand_m``, ``hipfor``
     - ``.f90`` sources under ``hiprand/src/fortran/``, installed only by a
       hipRAND built with the option; ROCm packages never shipped them
     - ``BUILD_FORTRAN_WRAPPER`` (``OFF``)
   * - rocFFT, hipFFT, hipFFTW, rocSOLVER
     - *none*
     - n/a
     - n/a

If your library is in the last row, there is no in-tree migration to make: those
libraries never shipped a Fortran module, so the generated binding is new surface
rather than a replacement. The same is true in practice of hipSPARSE and
hipSOLVER, whose ``.f90`` and ``.mod`` never reached an install tree: only a
build of the library itself could use them.

Note how little of that is uniform, which is much of the point of the move:
three libraries installed a source file unconditionally, one compiled its module
only into its own samples, one exported a shared library without its module, and
two installed sources only behind an option that is off by default. All of it
collapses to one ``BUILD_FORTRAN_BINDINGS`` and one installed archive per
library.

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
compile it as part of your own build today. Stop: the file is gone at 10.3, and
a compiled module now ships with ROCm. Drop it from your source list and link
the archive instead.

rocRAND and hipRAND did the same thing one level further out, installing their
sources under ``<lib>/src/fortran/`` and pointing at them from the config
package with ``<lib>_FORTRAN_SRC_DIR`` and ``<lib>_FORTRAN_SRC_DIRS``.
``find_package(rocrand)`` and ``find_package(hiprand)`` no longer set those, nor
``<lib>_FORTRAN_FOUND``. ``find_package(rocrand-fortran)``
(``roc::rocrand_fortran``) and ``find_package(hiprand-fortran)``
(``hip::hiprand_fortran``) now hand you the binding directly, and set
``<lib>_FORTRAN_FOUND``. Nothing of yours is left to compile.

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
before ``-lrocblas -lamdhip64``.

The target naming, the per-compiler install layout, what to build with a
compiler other than ``amdflang``, and the build options are identical to the
hipFORT migration and are not repeated here. See :doc:`migration-guide`,
sections **Do I need to build anything?**, **Compile and link** (including
**Binding and library versions**), **Compiler support** and **Build options**.

What changes at your call sites
===============================

The generated bindings follow the C API more closely than the hand-written
modules did. Every routine ``X`` is a generic around its raw ``bind(C)``
interface, named ``X_``, and typed forms. An output scalar can therefore be
passed as a typed variable, and the old ``c_loc(x)`` spelling still compiles and
still works. The exception is a pointer the library writes, such as a new
handle, a stream or an info object: that is a ``type(c_ptr)`` passed by
reference, and the old ``c_loc(...)`` spelling still compiles but leaves your
variable unset. Most other differences are compile errors that point at the
line to fix. **The pointer outputs are not**, so start there.

Two changes apply to every library:

*  **Keyword arguments.** Dummy names now follow the C headers, so if you call
   with keywords some names changed (for example ``stride_A`` is ``strideA`` and
   ``info`` is ``myInfo`` in hipBLAS). The compiler flags each one.
*  **Procedure pointers.** ``X`` is now a generic. To point a procedure pointer
   at a routine or pass it as an argument, name its specific ``X_``.

Every library that had one: delete the ``<lib>_enums`` line
-----------------------------------------------------------

The enumerators moved into the library module, so the separate module is gone:

.. code-block:: fortran

   use rocblas
   use rocblas_enums   ! delete this line

rocBLAS, hipBLAS and hipSOLVER: pass the handle itself to the create call
-------------------------------------------------------------------------

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

The same applies to ``rocblas_get_stream``, ``hipblasCreate``,
``hipblasGetStream``, ``hipsolverCreate``, ``hipsolverGetStream``,
``hipsolverCreateGesvdjInfo`` and ``hipsolverCreateSyevjInfo``. Search for them
rather than waiting for a crash:
``grep -rniE '(rocblas_create_handle|rocblas_get_stream|hipblasCreate|hipblasGetStream|hipsolverCreate[a-z]*|hipsolverGetStream)[[:space:]]*\([^)]*c_loc' .``

Scalar arguments such as ``alpha`` and ``beta`` do **not** change: the
generated generic still accepts ``c_loc(alpha)`` (a ``type(c_ptr)``), and it
also accepts the host scalar itself, for host pointer mode, whatever
``FORTRAN_ARRAY_INTERFACES`` is set to.

rocBLAS and hipBLAS: the rest
-----------------------------

These are compile errors when they hit:

*  **Modes and other output scalars.** ``hipblasGetPointerMode``,
   ``hipblasGetAtomicsMode``, ``hipblasGetBatchAlphaStride`` and
   ``hipblasGetBatchBetaStride`` now also accept a typed variable passed by
   reference; ``c_loc(x)`` still works.
*  hipBLAS: the stride arguments of the strided-batched solver routines
   (``hipblasSgetrfStridedBatched`` and its family) are
   ``integer(c_int64_t)``, as in the C API.
*  hipBLAS: the ``HIP_R_*`` / ``HIP_C_*`` datatype enumerators used by the
   ``_ex`` routines are no longer re-exported by ``hipblas``. They come from
   ``use hip``, HIP's own binding: ``find_package(hip-fortran)`` and
   ``hip::hip_fortran``.

rocSPARSE
---------

rocSPARSE has the longest list, all in ``projects/rocsparse/CHANGELOG.md``.
The ones you are likely to meet:

*  **Buffer sizes.** The 69 ``*_buffer_size`` routines also accept the size as
   an ``integer(c_size_t)`` passed by reference; ``c_loc`` of it still works.
   The four ``rocsparse_Xgebsr2gebsc_buffer_size`` routines name it
   ``p_buffer_size``.
*  **Git revision.** ``rocsparse_get_git_rev`` takes ``type(c_ptr), value``
   rather than ``character(c_char) :: rev(*)``: declare the buffer ``target``
   and pass ``c_loc(rev)``. ``rocsparse_get_version`` is unchanged.
*  **Sorting.** ``rocsparse_csrsort`` and ``rocsparse_cscsort`` take the
   matrix descriptor, as in the C API (one argument more).
*  **Argument order.** ``rocsparse_Xcsr2csr_compress`` has its row-pointer and
   column-index arguments in the C order. Both have the same type, so **a call
   in the old order still compiles** and passes the row pointer where the
   column indices are read: check each call by hand.
*  **Handle creation with an error object.** ``rocsparse_handle_create``'s
   ``p_error`` is an optional ``type(c_ptr)`` passed by reference. Omit it
   where you passed ``c_null_ptr``, which now hands over the address of a null
   pointer, and pass your ``type(c_ptr)`` variable itself rather than ``c_loc``
   of it.
*  **Keyword arguments.** Beyond the general rule above: ``info`` is
   ``myInfo``, ``result`` is ``myResult``, ``mat_type`` is ``myType``, and a few
   routine-specific renames such as ``bsr_dim`` to ``block_dim`` in
   ``rocsparse_Xbsrmv``; the CHANGELOG lists them all.
*  **ILP64.** A rocSPARSE built with ``BUILD_ROCSPARSE_ILP64`` ships no Fortran
   binding.

hipSPARSE and hipSOLVER
-----------------------

Their hand-written modules were never installed, so only code built inside the
library's own tree can have used them. For hipSPARSE nothing changes beyond the
``use hipsparse_enums`` line and keyword names: pointer-mode scalars stay
``type(c_ptr), value``. For hipSOLVER, handle and info creation is the trap
described above. Outputs such as ``lwork``, sweep counts and residuals also
accept a typed variable by reference, and ``c_loc`` still works. Two changes are
compile errors: ``jobu`` and ``jobv`` of ``hipsolverXgesvd`` are
``character(c_char)``, and ``lwork`` of ``hipsolverXXgels`` and
``hipsolverXXgesv`` is ``integer(c_size_t)``.

rocRAND and hipRAND
-------------------

Rename the module (`Rename what little moves`_) and replace ``use hipfor``
with ``use hip``, which comes from HIP's binding: add
``find_package(hip-fortran)`` and link ``hip::hip_fortran``.

.. note::

   Apart from the pointer outputs (handle, stream and info creation,
   rocSPARSE's ``p_error``) and the argument order in
   ``rocsparse_Xcsr2csr_compress``, these differences are visible to the compiler but not to the linker: the
   generated interfaces bind the same C symbols, so no symbol or link check
   sees them. They show up when real client code is compiled, which is why it
   is worth building your code against the new bindings early.

If you hit a difference not described here, report it at
`hipfort issues <https://github.com/ROCm/hipfort/issues>`_ rather than working
around it locally: these are generator differences, and a fix there fixes it for
everyone.

Building on ROCm versions before and after 10.3
===============================================

Because the module name stays the same, a code that has to build on both sides
of 10.3 does not need a wrapper module; only the build differs. Compile the
hand-written source where it exists, and link the generated binding otherwise:

.. code-block:: cmake

   find_package(rocblas-fortran CONFIG QUIET)
   if(TARGET roc::rocblas_fortran)          # ROCm 10.3 or later
     target_link_libraries(app PRIVATE roc::rocblas roc::rocblas_fortran)
   else()                                   # before 10.3
     find_package(rocblas REQUIRED)
     find_file(ROCBLAS_MODULE_F90 rocblas_module.f90
               HINTS /opt/rocm PATH_SUFFIXES include/rocblas REQUIRED)
     target_sources(app PRIVATE ${ROCBLAS_MODULE_F90})
     target_link_libraries(app PRIVATE roc::rocblas)
   endif()

The call sites are the harder part. The handle and stream calls and the
``rocblas_enums`` line differ on each side, so guard them: define a macro in the
10.3 branch above, ``target_compile_definitions(app PRIVATE
ROCBLAS_FORTRAN_GENERATED)``, use a preprocessed ``.F90`` file, and guard the
``use`` line and the call separately (a ``use`` must come first in its scope):

.. code-block:: fortran

   use rocblas
   #ifndef ROCBLAS_FORTRAN_GENERATED
   use rocblas_enums
   #endif
   ...
   #ifdef ROCBLAS_FORTRAN_GENERATED
   stat = rocblas_create_handle(handle)
   #else
   stat = rocblas_create_handle(c_loc(handle))
   #endif

Or move to hipFORT (see :doc:`migration-guide`), which already uses the new
calling conventions and is maintained beside the new bindings until ROCm 11.0.

Special cases
=============

Two cases do not migrate the way the rest do, because the new names collide with
names the libraries already used.

**hipSOLVER reuses a target name that already meant something else.** hipSOLVER
is the one library that already exported ``roc::hipsolver_fortran``, and it was
a *shared* library built from the hand-written ``hipsolver_module.f90``. The
generated binding takes the same public name, but it is a *static* archive,
``libhipsolver_fortran.a``, with a regenerated ``hipsolver`` module, and it
comes from its own package. ``find_package(hipsolver)`` no longer defines
``roc::hipsolver_fortran``, so a build that links it must add
``find_package(hipsolver-fortran REQUIRED)``, then re-check its call sites
(`hipSPARSE and hipSOLVER`_). ``libhipsolver_fortran.so``
also stops existing, which matters if you link it by filename or depend on its
soversion.

Few builds should actually be affected, because that module was never
installable: the guard that installs ``hipsolver_module.f90`` is never defined
anywhere, so no ``.f90`` and no ``.mod`` ever reached an install tree, and the
backward-compatibility symlinks beside it point at a file that is not there.
Only an in-tree hipSOLVER build could consume it.

hipSOLVER also already had a ``BUILD_FORTRAN_BINDINGS`` option, meaning "build
the hand-written module". The name now means the generated bindings, as
everywhere else, and keeps its default, ``ON`` on Linux, except that it is now
``OFF`` on the CUDA backend. ``EXPORT_FORTRAN_BINDINGS`` and the never-defined
``BUILD_FORTRAN_MODULE`` guard retire with the module they gated.

**rocRAND and hipRAND drop** ``BUILD_FORTRAN_WRAPPER``. Their deprecated
hand-written wrappers (``rocrand_m.f90``, ``hiprand_m.f90``, and the small
``hipfor`` module beside each) are removed together with the option that built
them, and the generated binding takes over the ``<lib>_fortran`` target name.
A build that still passes ``-DBUILD_FORTRAN_WRAPPER=ON`` is not refused: CMake
only reports the variable as unused, and you get the generated binding. Switch
to ``use rocrand`` or ``use hiprand`` (with ``BUILD_FORTRAN_BINDINGS``, which
is ``ON`` on Linux and ``OFF`` on hipRAND's CUDA backend).

What ``BUILD_FORTRAN_CLIENTS`` still means
==========================================

``BUILD_FORTRAN_CLIENTS``, which rocBLAS, hipBLAS and rocSPARSE already have, is
**not** the switch that builds the bindings and is not renamed. It means "build
the Fortran part of ``clients/``" (rocSPARSE's Fortran samples, rocBLAS and
hipBLAS's ``*_fortran_client`` wrappers), it keeps its ``ON`` default, and that
surface survives. For rocSPARSE it now also builds the binding's own tests in
``fortran/test/``.

What changes is where its module comes from: those samples used to compile the
hand-written ``.f90`` in-tree and now link the generated
``roc::<lib>_fortran``. The one new constraint is that they need the bindings:
with ``-DBUILD_FORTRAN_BINDINGS=OFF``, or no Fortran compiler, the Fortran
clients are skipped with a message saying why, and the rest of the build goes
on.
