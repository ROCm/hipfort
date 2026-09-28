.. meta::
  :description: How to migrate from hipFORT to the Fortran bindings packaged with ROCm
  :keywords: fortran, hipFORT, migration, ROCm, bindings, rocBLAS, amdflang, deprecation

*************************************************
Migrating to the Fortran bindings shipped in ROCm
*************************************************

Who this is for
===============

You build **hipFORT** yourself and call ROCm through it: ``use hipfort_rocblas``,
``hipMalloc``, ``rocblas_dgemm``.

In one line: **the bindings move into ROCm itself (rocm-systems and
rocm-libraries), you rename your** ``use`` **statements and link a per-library
Fortran archive, and nothing else in your code changes.**

.. note::

   **Using a ROCm library's own Fortran module instead?** If you write
   ``use rocblas`` against ``/opt/rocm/include/rocblas/rocblas_module.f90``, or
   ``use rocsparse``, or ``use rocrand_m``, this page is not yours. Those
   modules ship with the library rather than with hipFORT, and their migration
   has a different deadline, different edits, and — unlike this one — call sites
   that do change. See :doc:`migration-guide-in-tree`.

The layout of the new bindings (one self-contained module per library, ROCm
only) is previewed in `hipFORT pull request #540
<https://github.com/ROCm/hipfort/pull/540>`_.

Are there breaking changes?
===========================

Yes, but they are limited and mechanical: your code will not compile or link
unchanged. Two edits are required, and the CUDA backend is dropped.

*  **Source.** The module names change: ``use hipfort_rocblas`` becomes
   ``use rocblas``.
*  **Build.** The link target changes: ``find_package(hipfort)`` and
   ``hipfort::rocblas`` become ``find_package(rocblas-fortran)`` and
   ``roc::rocblas_fortran``.
*  **NVIDIA users.** The CUDA (``nvptx``) backend is not carried into the new
   bindings.

Everything at the call level (routine names, arguments, calling styles) is
unchanged, so the two edits are find-and-replace, not a rewrite. The details
are in `What you change`_.

Do I need to do anything now?
=============================

**No.** Today's hipFORT keeps working, unchanged, until it is removed at ROCm
11.0; keep building it yourself as you do today. Any time before 11.0, make the
two changes in `What you change`_. Old and new share the same interfaces
underneath, so you migrate on your own schedule.

That said, sooner is better than later. The edit itself is mechanical, so the
value of doing it early is not the edit, it is the room it leaves you
afterwards: if anything behaves differently (a routine that was generated
incorrectly, an overload that resolves differently, a build-system wrinkle),
you want to hit it with releases to spare rather than while 11.0 is closing.
Early reports also get fixed for everyone, so the sooner your code runs against
the new bindings, the better they are when the rest of the ecosystem moves.

Timeline
========

.. list-table::
   :header-rows: 1
   :widths: 15 85

   * - ROCm
     - What happens
   * - **≤ 10.1**
     - Nothing changes. Keep using hipFORT as today.
   * - **10.2**
     - The new bindings ship inside ROCm (packaged, modernized). You can
       migrate, and this is the release to aim for rather than the last one
       before 11.0.
   * - **11.0**
     - The old hipFORT is removed. You must be on the new bindings by this
       release.

hipFORT gets this window because it is a separate repository and can go on
existing beside ROCm for a release. A library's own in-tree module cannot: it
lives in the library being changed, so it is replaced in place at 10.2, a
release earlier. If that is your situation, see :doc:`migration-guide-in-tree`.

What you change
===============

Two things: the modules you ``use``, and the Fortran library you link. Your
actual calls (routine names, arguments, calling style) do not change.

Rename your ``use`` statements
------------------------------

The ``hipfort_`` prefix is dropped, and each library collapses to a single
module named after the library.

.. list-table::
   :header-rows: 1
   :widths: 60 40

   * - Old (``hipfort_`` prefix, split modules)
     - New (one module, no prefix)
   * - ``use hipfort`` (HIP runtime; plus ``hipfort_types``, ``hipfort_enums``)
     - ``use hip``
   * - ``use hipfort_rocblas`` (plus ``_enums``)
     - ``use rocblas``
   * - ``use hipfort_hipblas`` (plus ``_enums``)
     - ``use hipblas``
   * - ``use hipfort_rocsparse`` (plus ``_enums``)
     - ``use rocsparse``
   * - ``use hipfort_hipsparse`` (plus ``_enums``)
     - ``use hipsparse``
   * - ``use hipfort_rocfft`` (plus ``_enums``)
     - ``use rocfft``
   * - ``use hipfort_hipfft`` (plus ``_enums``)
     - ``use hipfft``
   * - ``use hipfort_hipfftw`` (plus ``_enums``, ``_types``)
     - ``use hipfftw``
   * - ``use hipfort_rocsolver`` (plus ``_enums``)
     - ``use rocsolver``
   * - ``use hipfort_hipsolver`` (plus ``_enums``)
     - ``use hipsolver``
   * - ``use hipfort_rocrand`` (plus ``_enums``, ``_types``)
     - ``use rocrand``
   * - ``use hipfort_hiprand`` (plus ``_enums``)
     - ``use hiprand``

The HIP memory helpers you might ``use`` directly (``hipfort_hipmalloc``,
``hipfort_hipmemcpy``, ``hipfort_hiphostregister``) fold into ``use hip`` as
well.

The shared helper modules go away. Delete these ``use`` lines; their symbols
now come from the library module you already ``use``:

.. list-table::
   :header-rows: 1
   :widths: 35 65

   * - Old
     - Where the symbols are now
   * - ``use hipfort_check``
     - In each library module (``hipCheck`` in ``hip``, ``rocblasCheck`` in
       ``rocblas``, and so on)
   * - ``use hipfort_handles``
     - In each library module (``rocblas_handle`` in ``rocblas``, and so on)
   * - ``use hipfort_auxiliary``
     - In ``hip`` (``hipGetDeviceProperties``)

Profiling (``hipfort_roctx``) is a special case, so it is not in the tables
above: the new ``roctx`` binding is deferred rather than shipped in the initial
packaged set, because ROCTx itself is moving into rocprofiler-sdk upstream and
its home is not yet settled. If you annotate Fortran with ``hipfort_roctx``
today, old hipFORT keeps working through the 10.x series; past that, until a
packaged ``roctx`` binding lands, call the C ROCTx API directly through
``iso_c_binding`` (it is a handful of ``bind(C)`` interfaces).

Only ``hipfort_cuda_errors`` (the CUDA-backend error enum) has no new
equivalent: it is tied to the dropped CUDA backend and retires with hipFORT at
11.0.

A rename looks like this; the calls in between are untouched:

.. code-block:: fortran

   ! before
   use hipfort
   use hipfort_check
   use hipfort_rocblas

   ! after
   use hip          ! runtime + hipCheck
   use rocblas

This is a replacement, not an addition: delete the old ``use hipfort_rocblas``
line.

.. warning::

   Do **not** keep ``use hipfort_rocblas`` and ``use rocblas`` in the same
   scope: both export the same public names (``rocblas_dgemm``,
   ``rocblas_handle``, the enums, and so on), so the compiler cannot tell which
   one you mean and the file will not compile.

Different files in the same program can still migrate independently, because
the clash is only within a single scope (see the `FAQ`_).

Doing the rename automatically
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The rename is regular enough to script, so you do not have to walk a large
codebase by hand. On a Git tree, this rewrites every ``use`` line in place:

.. code-block:: shell

   libs='rocblas|hipblas|rocsparse|hipsparse|hipfftw|rocfft|hipfft|rocsolver|hipsolver|rocrand|hiprand'

   sed -i -E \
     -e "/^[[:space:]]*use[[:space:]]+hipfort_($libs)_(enums|types)\b/Id" \
     -e "/^[[:space:]]*use[[:space:]]+hipfort_(check|handles|auxiliary|types|enums)\b/Id" \
     -e "s/^([[:space:]]*use[[:space:]]+)hipfort_($libs)\b/\1\2/I" \
     -e "s/^([[:space:]]*use[[:space:]]+)hipfort_(hipmalloc|hipmemcpy|hiphostregister)\b/\1hip/I" \
     -e "s/^([[:space:]]*use[[:space:]]+)hipfort\b/\1hip/I" \
     $(git ls-files '*.f90' '*.F90')

The first two rules delete the modules that fold away, and the last three
rename what is left.

The rules cannot step on each other, because ``_`` is a word character:
``hipfort_rocblas_enums`` is deleted by rule 1 rather than renamed to
``rocblas_enums`` by rule 3. The ``I`` flag covers ``USE HIPFORT_ROCBLAS`` as
well, and ``only:`` clauses survive the rename
(``use hipfort_rocblas, only: rocblas_dgemm`` becomes
``use rocblas, only: rocblas_dgemm``).

Then read the diff, because a few things are deliberately left to you:

*  A file might end up with two ``use hip`` lines (from ``use hipfort`` and
   ``use hipfort_hipmalloc``, for example). That is valid Fortran and compiles
   fine; collapse them if you prefer.
*  A file that used ``hipfort_check``, ``hipfort_handles``, or
   ``hipfort_auxiliary`` without ever using ``hipfort`` itself loses those
   symbols, because the delete rules take the whole line. Add ``use hip``
   there.
*  ``use hipfort_roctx`` and ``use hipfort_cuda_errors`` are left untouched on
   purpose; they have no packaged equivalent yet (see above).
*  Fixed-form sources, continuation lines, and ``use`` lines behind
   preprocessor guards are not covered.
   ``grep -rniE 'use[[:space:]]+hipfort' .`` finds whatever the rules missed.

A supported migration tool is worth shipping if codebases turn out to need more
than this; the recipe above is the whole of what it would do, so
`open an issue <https://github.com/ROCm/hipfort/issues>`_ if you would rather
have the tool.

Link the per-library Fortran archive
------------------------------------

Instead of one ``libhipfort-*.a`` for everything, each library ships its own
Fortran archive and CMake target. The target sits in the C library's own
namespace (``roc::`` or ``hip::``) with a ``_fortran`` suffix, and it lives in
its own config package, ``<lib>-fortran``, which pulls the C library in for
you:

.. code-block:: cmake

   # before
   find_package(hipfort REQUIRED)
   target_link_libraries(app PRIVATE hipfort::rocblas)

   # after
   find_package(rocblas-fortran REQUIRED)   # find_dependency()s rocblas itself
   target_link_libraries(app PRIVATE roc::rocblas roc::rocblas_fortran)

.. note::

   **The ``find_package`` line is temporary; the target name is not.** Yes, the
   two are spelled differently, and deliberately: ``rocblas-fortran`` is a
   *package* name, which ROCm hyphenates (``hipblas-common``, ``rocm-cmake``),
   while ``rocblas_fortran`` is a *target* and an archive, which ROCm
   underscores (``libhipsolver_fortran.so``). You only meet the hyphenated one
   because of the gap below.

   ``find_package(rocblas)`` on its own does **not** define
   ``roc::rocblas_fortran`` today. The Fortran config is installed beside the C
   one precisely so that ``rocblas-config.cmake`` can pick it up with a bare
   ``include(rocblas-fortran-config.cmake OPTIONAL)``, but that hook does not
   exist yet and has to be added in rocm-cmake first.
   (``rocm_export_targets``'s existing ``INCLUDE`` argument is not it: it emits
   a non-optional ``include()``, and emits it *before* the targets file, so the
   Fortran config would run before ``roc::rocblas`` exists.)

   Once the hook lands, ``find_package(rocblas)`` alone is enough,
   ``rocblas-fortran`` goes back to being an internal file name you never type,
   and the ``target_link_libraries`` line above keeps working unchanged either
   way.

.. list-table::
   :header-rows: 1
   :widths: 25 25 50

   * - Library
     - ``use``
     - Link (CMake target)
   * - HIP runtime
     - ``use hip``
     - ``hip::hip_fortran``
   * - rocBLAS
     - ``use rocblas``
     - ``roc::rocblas_fortran``
   * - hipBLAS
     - ``use hipblas``
     - ``roc::hipblas_fortran``
   * - rocSPARSE
     - ``use rocsparse``
     - ``roc::rocsparse_fortran``
   * - hipSPARSE
     - ``use hipsparse``
     - ``roc::hipsparse_fortran``
   * - rocFFT
     - ``use rocfft``
     - ``roc::rocfft_fortran``
   * - hipFFT
     - ``use hipfft``
     - ``hip::hipfft_fortran``
   * - hipFFTW
     - ``use hipfftw``
     - ``hip::hipfftw_fortran`` (packaged with hipFFT)
   * - rocSOLVER
     - ``use rocsolver``
     - ``roc::rocsolver_fortran``
   * - hipSOLVER
     - ``use hipsolver``
     - ``roc::hipsolver_fortran``
   * - rocRAND
     - ``use rocrand``
     - ``roc::rocrand_fortran``
   * - hipRAND
     - ``use hiprand``
     - ``hip::hiprand_fortran``

The raw archive is ``lib<lib>_fortran.a`` (for example ``librocblas_fortran.a``)
if you link without CMake.

Build options
=============

If you consume ROCm's shipped bindings, you pass none of these. hipFORT's
``HIPFORT_*`` options were options for building *hipFORT*, and under the
packaged track you no longer build it: the bindings arrive precompiled, with
the array overloads on and assumed-rank off. The options below matter only
when you rebuild a binding yourself, which is the non-``amdflang`` case in
`Building one library's binding from source`_.

The switch that replaces "do I build hipFORT at all" is
``BUILD_FORTRAN_BINDINGS``, which every ``rocm-systems`` and ``rocm-libraries``
project exposes. It is ``ON`` by default but guarded: the bindings are built
when a Fortran compiler is present, and silently skipped when one is not, so a
C-only site never has to acquire a Fortran compiler. Pass
``-DBUILD_FORTRAN_BINDINGS=OFF`` to opt out even when you have one.

.. list-table::
   :header-rows: 1
   :widths: 40 60

   * - Old hipFORT option
     - New equivalent
   * - (build hipFORT, or do not)
     - ``BUILD_FORTRAN_BINDINGS``, per library, ``ON`` but guarded
   * - ``HIPFORT_USE_FPOINTER_INTERFACES`` (``ON`` with F2008) and
       ``HIPFORT_ASSUMED_RANK`` (``OFF``)
     - Both fold into one tri-state ``FORTRAN_ARRAY_INTERFACES``, which is
       ``none``, ``assumed-shape`` (the default), or ``assumed-rank``
   * - ``HIPFORT_MULTITOOLCHAIN_LAYOUT`` (``ON``)
     - Gone. The per-compiler layout is unconditional (see
       `Where the files install`_)
   * - ``HIPFORT_BUILD_NVPTX`` (``ON``)
     - Gone, with the CUDA backend
   * - ``HIPFORT_COMPILER``, ``HIPFORT_AR``, ``HIPFORT_RANLIB``,
       ``HIPFORT_COMPILER_FLAGS``, ``HIPFORT_BUILD_TYPE``,
       ``HIPFORT_INSTALL_DIR`` (already deprecated)
     - Gone. Use the plain ``CMAKE_*`` variables, as hipFORT already tells you
       to
   * - ``BUILD_TESTING``, ``HIPFORT_ROCM_LIB_DIR``, ``HIPFORT_CUDA_LIB_DIR``
     - ``BUILD_FORTRAN_TESTS`` (``OFF``), per library. hipFORT's single suite
       splits into each library's ``fortran/test/``
   * - ``HIPFORT_EXTENDED_TESTS``
     - Gone, with both audits it gated. The shared-link check went with the
       single archive it linked, and the exhaustive per-library symbol tests
       with it: each referenced every ``bind(C)`` routine of a library, so any
       entry point missing from the installed ROCm became a build error. Both
       are link-time audits of the bindings themselves rather than tests of
       your code, and belong beside each library after the split. What you
       build is the runtime suite, under ``BUILD_FORTRAN_TESTS``

Each switch also has a per-library override, so one library can differ from the
rest of a monorepo build: ``<LIB>_BUILD_FORTRAN_BINDINGS`` and
``<LIB>_BUILD_FORTRAN_TESTS`` (for example
``-DROCSPARSE_BUILD_FORTRAN_BINDINGS=OFF``) win over the global spelling when
set. ``<LIB>_FORTRAN_COMPILER_DIR`` overrides the per-compiler subdirectory
name described in `Where the files install`_. You do not need it merely because
a prefix holds several compilers' artifacts, since that case resolves on its
own; it is for naming a directory the compiler alone does not imply, such as a
version-suffixed ``gfortran-13.3.0``, or for selecting one deliberately.

The interface tiers themselves do not change: the raw ``type(c_ptr)`` surface
is Fortran 2003 and is always present, the ergonomic array overloads are
Fortran 2008 and stay on, and the assumed-rank variants are Fortran 2018 and
stay opt-in. What changes is that one option now selects between them instead
of two. That follows the language: assumed-rank *replaces* the per-rank
variants rather than adding to them, because an assumed-rank dummy is not
distinguishable by rank from the per-rank specifics, so the two cannot legally
coexist in one generic. Two booleans could express that illegal combination;
three values cannot. For a side-by-side comparison of the call sites, see
:doc:`fortran-interfaces`.

The shipped bindings are built at the default, ``assumed-shape``, which is what
hipFORT gives you today on any Fortran 2008 compiler. You only need the option
in a from-source rebuild, either to opt into ``assumed-rank`` or to drop to
``none`` on a compiler whose Fortran 2008 support you do not trust.

Building the bindings' own test suite is a separate switch,
``BUILD_FORTRAN_TESTS``, ``OFF`` by default and guarded the same way: asking
for the tests when the bindings were not built is a skip, not an error.

``BUILD_FORTRAN_CLIENTS``, which rocBLAS, hipBLAS and rocSPARSE already have, is
**not** that switch and is not renamed: it builds the Fortran part of each
library's own ``clients/``, which is a concern of those libraries rather than of
hipFORT. See :doc:`migration-guide-in-tree` if you build with it.

To check from CMake whether a binding is actually available, use the per-package
flag ``<pkg>_FORTRAN_FOUND`` (for example ``rocblas_FORTRAN_FOUND``), which the
Fortran config package defines. Inside a ROCm build tree there are two more
specific variables: ``ROCM_HAVE_FORTRAN`` reports only that a Fortran compiler
exists, while ``<LIB>_HAVE_FORTRAN_BINDINGS`` (for example
``ROCSPARSE_HAVE_FORTRAN_BINDINGS``) is true only when that library's bindings
were really built. The two are deliberately distinct, because the compiler can
be present while a given library has ``BUILD_FORTRAN_BINDINGS=OFF``.
(``ROCM_LIBS_HAVE_FORTRAN`` is the older spelling of ``ROCM_HAVE_FORTRAN`` and
is still honoured.)

Compiler support
================

Which compiler?
---------------

The bindings support ``amdflang`` (ROCm's bundled LLVM Flang, the recommended
default), ``gfortran`` (7.5.0 or newer), and other ``iso_c_binding``-capable
compilers such as Cray Fortran.

One catch is worth knowing: there is no portable Fortran ABI, so a ``.mod``
(and its compiled ``.a``) is tied to one compiler, and even one compiler
version; two compilers cannot share a ``.mod``. ROCm therefore ships the
bindings precompiled for ``amdflang``:

*  **Building with amdflang?** Link the shipped bindings as they are.
*  **Building with another compiler (gfortran, Cray, and so on)?** The shipped
   ``.mod`` will not match, so build the bindings from source with your own
   compiler. This is automatic: when you build ROCm from source with a Fortran
   compiler present, the bindings build by default and you get a ``.mod`` that
   matches your compiler (pass ``-DBUILD_FORTRAN_BINDINGS=OFF`` to skip them).

.. note::

   **Mixing amdflang versions.** Strictly, a ``.mod`` is tied to the compiler
   *version* too, so an ``amdflang`` other than the one that built the shipped
   bindings would normally refuse to read them. ``amdflang`` relaxes that:
   starting with ROCm 10.1, the opt-in ``-fmodule-mismatch-check=warn`` lets it
   read a ``.mod`` written by a different ``amdflang`` version, reporting a
   warning instead of an error. The default is unchanged, and the flag only
   covers version skew inside ``amdflang``: nothing lets ``gfortran`` read an
   ``amdflang`` ``.mod``, or the reverse. When you can rebuild the binding with
   the compiler you are actually using, still do, because the warning is
   telling you the two artifacts were not built together.

The C libraries you link (``libamdhip64.so``, ``librocblas.so``, and so on) are
the stable, compiler-agnostic ABI; only the thin Fortran layer is
compiler-specific.

Where the files install
-----------------------

Because the artifacts are compiler-specific, they install under a per-compiler
subdirectory: the ``.mod`` files in ``<includedir>/fortran/<compiler>/`` and the
``.a`` files in ``<libdir>/fortran/<compiler>/``. A CMake ``find_package`` picks
your compiler's subdirectory automatically, including when a prefix holds more
than one compiler's artifacts; if you link with raw flags, point ``-I`` and
``-L`` at it.

``<libdir>`` and ``<includedir>`` are the platform's own, not a literal ``lib``
and ``include``: ``lib64`` on Fedora, RHEL and SUSE, and ``lib/<triplet>`` on
Debian multiarch. On a stock ROCm install they come out as ``lib`` and
``include``, so the concrete paths are ``/opt/rocm/include/fortran/amdflang/``
and ``/opt/rocm/lib/fortran/amdflang/``, and the examples below use those. If
you install the bindings somewhere else, check which the packager's
``CMAKE_INSTALL_LIBDIR`` gave you before writing the path by hand.

If nothing is installed for your compiler, the package fails and names what is,
so that you can tell a rebuild from a redirect:

.. code-block:: none

   This project builds with gfortran, but no rocrand.mod for it is installed
   under /opt/rocm/include/fortran. Available: amdflang. A Fortran .mod cannot
   be shared across compilers; rebuild the bindings with gfortran, or set
   ROCRAND_FORTRAN_COMPILER_DIR to the directory to use.

``<compiler>`` is the name you would type, not the CMake compiler ID:

.. list-table::
   :header-rows: 1
   :widths: 50 50

   * - Compiler
     - ``<compiler>``
   * - ROCm's LLVM Flang
     - ``amdflang``
   * - GNU
     - ``gfortran``
   * - Cray
     - ``ftn``
   * - Intel LLVM / Intel Classic
     - ``ifx`` / ``ifort``
   * - NVIDIA HPC
     - ``nvfortran``

Anything else falls back to the basename of ``CMAKE_Fortran_COMPILER``,
lowercased. ``<LIB>_FORTRAN_COMPILER_DIR`` overrides the choice.

Linking without CMake, the command is the same for every compiler; only the
``<compiler>`` subdirectory changes. For a program using rocBLAS:

.. code-block:: shell

   # amdflang (links ROCm's precompiled bindings)
   amdflang app.f90 \
     -I/opt/rocm/include/fortran/amdflang \
     -L/opt/rocm/lib/fortran/amdflang -lrocblas_fortran \
     -L/opt/rocm/lib -lrocblas -lamdhip64 -o app

   # gfortran (bindings built from source with gfortran)
   gfortran app.f90 \
     -I/opt/rocm/include/fortran/gfortran \
     -L/opt/rocm/lib/fortran/gfortran -lrocblas_fortran \
     -L/opt/rocm/lib -lrocblas -lamdhip64 -o app

Link the Fortran archive (``-lrocblas_fortran``) before the C library
(``-lrocblas``) and the HIP runtime (``-lamdhip64``), and give each library you
``use`` its own ``-l<lib>_fortran``.

Building one library's binding from source
------------------------------------------

If you are on a non-``amdflang`` compiler, you build the binding yourself, but
you do not have to rebuild the C library. The generated ``.F90`` is
self-contained Fortran, so compiling it needs only a Fortran compiler: it does
not rebuild rocBLAS, and it needs neither the C headers nor the ``.so`` at
build time (the vendor symbols resolve when you link your application).

Getting the sources
~~~~~~~~~~~~~~~~~~~

ROCm ships the bindings precompiled for ``amdflang`` only, but it installs the
``.F90`` they were generated from alongside them, so the source is already on
your prefix:

.. code-block:: shell

   /opt/rocm/share/<library>/fortran/<library>.F90

for example ``/opt/rocm/share/rocblas/fortran/rocblas.F90``. Nothing to clone,
and nothing to match up: the installed source was generated from the same
headers as the installed library, so it cannot declare an entry point the
``.so`` does not export.

It sits under ``share/`` rather than the include tree because the ``.F90`` is
compiler-independent, unlike the ``.mod``. Everything under
``<includedir>/fortran/`` is partitioned by compiler, so a source file placed
there would be read as if it named one.

.. note::

   On a ROCm that predates this, the source is not installed and you fetch it
   from the repository its library lives in:
   `rocm-systems <https://github.com/ROCm/rocm-systems>`_ for HIP,
   `rocm-libraries <https://github.com/ROCm/rocm-libraries>`_ for the math
   libraries, under ``projects/<library>/fortran``. Check out the tag matching
   the ROCm you have installed, not the default branch: a binding generated
   from a newer ROCm declares entry points your installed ``.so`` does not
   export. Both repositories tag releases as ``therock-<version>``.

   .. code-block:: shell

      git clone --depth 1 --branch therock-10.0 \
        --filter=blob:none --sparse \
        https://github.com/ROCm/rocm-libraries.git
      cd rocm-libraries
      git sparse-checkout set projects/rocblas/fortran

If you build ROCm from source already (through Spack, EasyBuild, or a distro
package build), you have the tree and this step does not apply: pass
``-DBUILD_FORTRAN_BINDINGS=ON`` to that build instead and the bindings come out
built with your compiler.

Building it
~~~~~~~~~~~

Each library's ``fortran/`` directory is a self-contained CMake project. Point
it at an installed ROCm and build only the binding:

.. code-block:: shell

   # gfortran (amdflang: same commands, only -DCMAKE_Fortran_COMPILER changes)
   cmake -S projects/rocblas/fortran -B build/rocblas-fortran \
     -DCMAKE_Fortran_COMPILER=gfortran \
     -DCMAKE_PREFIX_PATH=/opt/rocm \
     -DCMAKE_INSTALL_PREFIX=/opt/rocm
   cmake --build build/rocblas-fortran
   cmake --install build/rocblas-fortran

Add ``-DFORTRAN_ARRAY_INTERFACES=assumed-rank`` here if you want the Fortran
2018 variants; see `Build options`_ for the rest.

``CMAKE_PREFIX_PATH`` lets the build find the installed C library (its version,
and any dependency binding); ``CMAKE_INSTALL_PREFIX`` puts the ``.mod`` and
``lib<lib>_fortran.a`` under your compiler's subdirectory. Building the C
library with ``-DBUILD_FORTRAN_BINDINGS=ON`` does the same thing under the hood
(it just invokes this ``fortran/`` build through ``add_subdirectory``), but it
rebuilds the C library too, which is much heavier.

A binding that ``use``\ s another (rocSOLVER ``use``\ s rocBLAS) needs the
dependency's ``.mod``, compiled with the same compiler, so build in dependency
order: rocBLAS's binding first, then rocSOLVER's, both with the same compiler.
rocSOLVER's build finds rocBLAS's binding through
``find_package(rocblas-fortran)``, or reuses the ``roc::rocblas_fortran``
target directly when both are configured in the same tree.

Building the C library alone first and the Fortran binding standalone later is
fine, because the Fortran target ships in its own config package rather than in
the C library's export set. A binding installed afterwards is picked up by
``find_package(rocblas-fortran)`` without the C library having to know about
it, and its absence is simply a package that is not found.

What does not work yet is reaching it through the C package:
``find_package(rocblas)`` will not expose ``roc::rocblas_fortran`` until
rocm-cmake grows the ``OPTIONAL`` include hook described above. Until then, ask
for ``rocblas-fortran`` explicitly.

What does not change
====================

*  **Your calls.** ``hipMalloc``, ``rocblas_dgemm``, ``hipblasDgemm``, the enum
   and type names, and ``hipCheck`` keep their names and signatures. Only the
   module you ``use`` changes.
*  **Calling styles.** Raw ``type(c_ptr)`` still works (including for OpenMP
   target data); the array, typed-handle, and string overloads still resolve
   under the same name; you never touch ``iso_c_binding``.
*  **The vendor libraries.** You still link the same ``.so``
   (``libamdhip64.so``, ``librocblas.so``, and so on). Only the Fortran ``.a``
   and ``.mod`` change.

Special cases
=============

The in-tree Fortran modules that rocBLAS, hipSOLVER, hipRAND and the others
shipped themselves have collisions of their own at 10.2; those are covered in
:doc:`migration-guide-in-tree`, not here.

**If you build for NVIDIA (CUDA)**, the ``nvptx`` backend is dropped from the
new bindings. It survives only in old hipFORT until 11.0.

FAQ
===

**Do I have to change my code now?**

No. Old hipFORT stays available until ROCm 11.0, so you can migrate any time
before then, but sooner is better than later: the edit is mechanical, and doing
it early leaves room to hit and report anything it turns up, in your code or in
the bindings, instead of racing the removal.

**Will I be warned before old hipFORT is removed?**

Old hipFORT keeps compiling and working through the 10.x series; whether it
emits a build-time deprecation notice during that window is still being
decided. Either way nothing is removed before ROCm 11.0, so a build that works
today keeps working until then.

**Can I install both the old and new bindings at once?**

Yes. Nothing collides, so you can migrate one file at a time:

.. list-table::
   :header-rows: 1
   :widths: 20 30 30 20

   * - Axis
     - Old hipFORT
     - New bindings
     - Clash?
   * - Module names
     - ``hipfort``, ``hipfort_rocblas``, ...
     - ``hip``, ``rocblas``, ...
     - No (prefixed versus bare)
   * - ``.mod`` files
     - ``<includedir>/fortran/<compiler>/hipfort/<backend>/``
     - ``<includedir>/fortran/<compiler>/``
     - No (different subpaths)
   * - Archives
     - ``libhipfort-amdgcn.a``
     - ``librocblas_fortran.a``, ...
     - No (different filenames)
   * - Symbols in the ``.a``
     - Mangled ``__hipfort_rocblas_MOD_...``
     - Mangled ``__rocblas_MOD_...``
     - No (mangled per module name)
   * - CMake package
     - ``find_package(hipfort)`` gives ``hipfort::rocblas``
     - ``find_package(rocblas-fortran)`` gives ``roc::rocblas_fortran``
     - No

Two rules: build both with the same compiler as your application (a ``.mod`` is
compiler-specific); and never ``use`` both bindings for the same library in one
scope, because they export the same public names (``rocblas_dgemm``,
``rocblas_handle``, the enums, and so on) and the reference becomes ambiguous.
Note that this is a *source*-level clash only: at the object level the two
archives coexist fine, because their symbols are mangled per module name
(``__hipfort_rocblas_MOD_...`` versus ``__rocblas_MOD_...``), which is why
migrating one file at a time works.

.. note::

   **This answer is about hipFORT**, and the first row of the table is why it
   cannot extend to a library's own in-tree module: that one is already named
   ``rocblas``, not ``hipfort_rocblas``, so there is no prefixed-versus-bare
   distinction to keep the two apart. Same module name, no coexistence, no
   file-by-file window. See :doc:`migration-guide-in-tree`.

**My code is old fixed-form Fortran. Can I use these bindings?**

Yes, in all but one case. Fixed form is not the same thing as an old standard:
a ``.f`` file with ``DO ... CONTINUE`` loops, implicit typing, and a 72-column
layout compiles fine with a current compiler, and it can ``use hip`` like any
other source. The requirement is only that the *compiler* handles Fortran
2003's ``iso_c_binding``, which every compiler in service does, not that your
code looks modern. The one thing that cannot work is a translation unit
compiled as pre-Fortran 90: below that, the language has no modules, so there
is no ``use`` statement to write and nothing to bind to. That is not a change
either, because hipFORT never had a callable path for such code. If you are
genuinely stuck there,
`open an issue <https://github.com/ROCm/hipfort/issues>`_ rather than
hand-writing glue: the answer in that case is a small C shim with F77 linkage
(plus an ``INCLUDE`` file for the constants), and it is something that can be
generated for the entry points you call.

**Will my calls break?**

Your *calls* will not: routine names, arguments, and calling styles stay the
same. But your code will not compile or link until you make the two edits
(rename the ``use`` line, change the link target); that is the breaking part,
and it is the whole of the migration.

**Where do I get the new bindings?**

They ship precompiled with ROCm (10.2 and later), with no separate install. To
build them in a source tree yourself, build with a Fortran compiler present:
the bindings are on by default (skipped automatically if no Fortran compiler is
found, and ``-DBUILD_FORTRAN_BINDINGS=OFF`` opts out).

**Why is this changing?**

Today's hipFORT is written partially by hand in a separate repository, so it
lags behind ROCm and sometimes misses functions or adds them late. The new
bindings are generated straight from the ROCm headers and ship with ROCm, so
they stay complete and current, and you no longer install or version-match a
separate package.
