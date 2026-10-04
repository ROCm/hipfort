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
   has a different deadline, different edits, and, unlike this one, call sites
   that do change. See :doc:`migration-guide-in-tree`.

Why the bindings are moving
===========================

hipFORT is a separate repository that you build and install next to ROCm. It
has always lagged behind ROCm: a routine added to rocBLAS reached Fortran only
when hipFORT was regenerated, which for several years did not happen at all, and
a hipFORT build had to be matched by hand to the ROCm it ran against. Moving the
bindings into ROCm fixes that at the root:

*  **Always complete and current.** Each binding is generated from the headers
   of the library it ships with, in the same build. Every entry point the
   ``.so`` exports is declared, and none that it does not.
*  **Nothing extra to build.** The bindings arrive precompiled with ROCm, in the
   same packages as the libraries. There is no separate project to clone,
   configure, and keep in step.
*  **Pay for what you use.** One module and one archive per library instead of
   one archive for everything, so a code that only calls rocBLAS links only
   rocBLAS's binding.
*  **One way to build and find them.** The same CMake options, install layout,
   and ``find_package`` pattern across all thirteen bindings, where today each
   library that has a Fortran module does it differently.
*  **Easier to improve.** Because the bindings are generated, a request such as
   a typed overload, a missing routine, or a corrected argument type becomes a
   generator change that reaches every library at once, instead of a hand edit
   that has to be repeated in each.

The price is the migration on this page: two mechanical edits, done once.

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

Timeline
========

.. list-table::
   :header-rows: 1
   :widths: 20 80

   * - ROCm
     - What happens
   * - **≤ 10.1**
     - Nothing changes. Keep using hipFORT as today.
   * - **10.2 to 10.x**
     - The new bindings ship inside ROCm. **hipFORT is still maintained beside
       them**, so both work and you can migrate at any point in this window.
       Aim for the start of it rather than the end.
   * - **11.0**
     - hipFORT is removed. You must be on the new bindings by this release.

**Do I need to do anything now?** No. Today's hipFORT keeps working until it is
removed at ROCm 11.0, and old and new share the same interfaces underneath, so
you migrate on your own schedule. Migrate early anyway: the edit is mechanical,
but if something does behave differently you want releases to spare, and an
early report gets fixed for everyone.

A binding is versioned with its library and stays valid across a major ROCm
series: a ``rocblas.mod`` built for 10.2 is still the right one on any 10.x.y,
and the CMake package accepts any version with the same major number. You
revisit your build at a major release, not at every point release.

Codes that build on several ROCm versions
-----------------------------------------

If one code base has to build on systems that will not reach ROCm 10.2 for a
while (a production machine frozen on ROCm 6.x, for example) and on newer ones,
you have two options:

*  **Stay on hipFORT until your oldest system reaches 10.2.** hipFORT keeps
   working through the 10.x series, so a single hipFORT-based build covers
   everything until then. On each system, use the hipFORT release that matches
   its ROCm (hipFORT tags them ``rocm-<version>``, for example ``rocm-6.3.3``):
   a binding declares the entry points of the ROCm it was generated from, and a
   newer one can reference routines an older ``.so`` does not export.
*  **Switch per system with a thin wrapper module.** Both bindings export the
   same names, so a module of your own can pick one at compile time, and the
   rest of your code ``use``\ s the wrapper and never sees the difference:

   .. code-block:: fortran

      ! my_rocblas.F90 (capital F: preprocessed)
      module my_rocblas
      #ifdef HAVE_ROCM_FORTRAN
        use rocblas
      #else
        use hipfort_rocblas
        use hipfort_rocblas_enums
      #endif
      end module my_rocblas

   .. code-block:: cmake

      find_package(rocblas-fortran CONFIG QUIET)
      if(TARGET roc::rocblas_fortran)
        target_link_libraries(app PRIVATE roc::rocblas roc::rocblas_fortran)
        target_compile_definitions(app PRIVATE HAVE_ROCM_FORTRAN)
      else()
        find_package(hipfort REQUIRED)
        target_link_libraries(app PRIVATE hipfort::rocblas)
      endif()

   Test the target rather than ``rocblas-fortran_FOUND``: the package can be
   found but have nothing installed for your compiler.

If you need the new bindings on a ROCm older than 10.2, `open an issue
<https://github.com/ROCm/hipfort/issues>`_ saying which release: the bindings
are generated from a release's headers, and an older release can be generated
on request.

Do I need to build anything?
============================

Usually not. Find your case:

.. list-table::
   :header-rows: 1
   :widths: 45 55

   * - Your situation
     - What you build
   * - ROCm 10.2 or later, compiling with ``amdflang``
     - **Nothing.** The ``.mod`` and ``.a`` files are installed with ROCm.
       Point your build at them (`Compile and link`_).
   * - ROCm 10.2 or later, compiling with ``gfortran``, Cray ``ftn``, or any
       other compiler
     - **Each binding you use, once per compiler.** A ``.mod`` only works
       with the compiler that wrote it. The sources are installed with ROCm,
       so this is one short build per library (`Building a binding with your
       compiler`_). The C libraries are not rebuilt.
   * - You build ROCm itself from source (Spack, EasyBuild, a distribution
       package)
     - **Nothing extra.** With a Fortran compiler present, the bindings are
       built along with each library, by that compiler.
   * - ROCm older than 10.2
     - **hipFORT, as today.** See `Codes that build on several ROCm versions`_.
   * - Windows
     - **Each binding you use, from the repository.** ROCm for Windows ships
       no Fortran compiler, so it ships neither the compiled bindings nor
       their sources. See `Windows`_.

Compile and link
================

Each library you ``use`` needs two things from the bindings: its ``.mod`` file
at compile time and its ``lib<lib>_fortran.a`` archive at link time. Both are
installed under a subdirectory named after the compiler that built them:

.. list-table::
   :header-rows: 1
   :widths: 25 75

   * - File
     - Location (stock ROCm install, ``amdflang``)
   * - ``rocblas.mod``, ``hip.mod``, ...
     - ``/opt/rocm/include/fortran/amdflang/``, the directory to pass to ``-I``
   * - ``librocblas_fortran.a``, ...
     - ``/opt/rocm/lib/fortran/amdflang/``, the directory to pass to ``-L``
   * - ``rocblas.F90``, ``hip.F90``, ...
     - ``/opt/rocm/share/<library>/fortran/``, the sources (see
       `The installed sources`_)

No C header is involved: Fortran reads only the ``.mod``.

With CMake
----------

Enable Fortran in your project and ask for the ``<library>-fortran`` package of
each library you use. The target adds the ``-I`` and ``-L`` for your compiler
and pulls in the C library:

.. code-block:: cmake

   project(app LANGUAGES Fortran)

   find_package(hip-fortran REQUIRED)
   find_package(rocblas-fortran REQUIRED)

   add_executable(app app.f90)
   target_link_libraries(app PRIVATE hip::hip_fortran roc::rocblas_fortran)

If ROCm is not in ``/opt/rocm``, add its prefix to ``CMAKE_PREFIX_PATH``. If
you built a binding into a prefix of your own, add that prefix too.

Without CMake
-------------

Point ``-I`` and ``-L`` at your compiler's subdirectory, and link the Fortran
archive of each library you ``use`` before the C libraries:

.. code-block:: shell

   amdflang app.f90 \
     -I/opt/rocm/include/fortran/amdflang \
     -L/opt/rocm/lib/fortran/amdflang -lrocblas_fortran -lhip_fortran \
     -L/opt/rocm/lib -lrocblas -lamdhip64 \
     -o app

With another compiler, replace ``amdflang`` in both paths with that compiler's
directory (``gfortran``, ``ftn``, and so on; see `Where the files install`_)
and use the prefix you installed your build of the bindings into.

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
   :widths: 38 16 26 20

   * - Old ``use`` (``hipfort_`` prefix, split modules)
     - New ``use``
     - Link (CMake target)
     - CMake package
   * - ``use hipfort`` (HIP runtime; plus ``hipfort_types``, ``hipfort_enums``)
     - ``use hip``
     - ``hip::hip_fortran``
     - ``hip-fortran``
   * - ``use hipfort_roctx``
     - ``use roctx``
     - ``roc::roctx_fortran``
     - ``roctx-fortran``
   * - ``use hipfort_rocblas`` (plus ``_enums``)
     - ``use rocblas``
     - ``roc::rocblas_fortran``
     - ``rocblas-fortran``
   * - ``use hipfort_hipblas`` (plus ``_enums``)
     - ``use hipblas``
     - ``roc::hipblas_fortran``
     - ``hipblas-fortran``
   * - ``use hipfort_rocsparse`` (plus ``_enums``)
     - ``use rocsparse``
     - ``roc::rocsparse_fortran``
     - ``rocsparse-fortran``
   * - ``use hipfort_hipsparse`` (plus ``_enums``)
     - ``use hipsparse``
     - ``roc::hipsparse_fortran``
     - ``hipsparse-fortran``
   * - ``use hipfort_rocfft`` (plus ``_enums``)
     - ``use rocfft``
     - ``roc::rocfft_fortran``
     - ``rocfft-fortran``
   * - ``use hipfort_hipfft`` (plus ``_enums``)
     - ``use hipfft``
     - ``hip::hipfft_fortran``
     - ``hipfft-fortran``
   * - ``use hipfort_hipfftw`` (plus ``_enums``, ``_types``)
     - ``use hipfftw``
     - ``hip::hipfftw_fortran``
     - ``hipfftw-fortran`` (installed with hipFFT)
   * - ``use hipfort_rocsolver`` (plus ``_enums``)
     - ``use rocsolver``
     - ``roc::rocsolver_fortran``
     - ``rocsolver-fortran``
   * - ``use hipfort_hipsolver`` (plus ``_enums``)
     - ``use hipsolver``
     - ``roc::hipsolver_fortran``
     - ``hipsolver-fortran``
   * - ``use hipfort_rocrand`` (plus ``_enums``, ``_types``)
     - ``use rocrand``
     - ``roc::rocrand_fortran``
     - ``rocrand-fortran``
   * - ``use hipfort_hiprand`` (plus ``_enums``)
     - ``use hiprand``
     - ``hip::hiprand_fortran``
     - ``hiprand-fortran``

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

   libs='roctx|rocblas|hipblas|rocsparse|hipsparse|hipfftw|rocfft|hipfft|rocsolver|hipsolver|rocrand|hiprand'

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
*  ``use hipfort_cuda_errors`` is left untouched on purpose; it has no new
   equivalent (see above).
*  Fixed-form sources, continuation lines, and ``use`` lines behind
   preprocessor guards are not covered.
   ``grep -rniE 'use[[:space:]]+hipfort' .`` finds whatever the rules missed.

The recipe above is the whole of what a migration tool would do. If you would
rather have the tool, `open an issue <https://github.com/ROCm/hipfort/issues>`_.

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

The two spellings are deliberate: ROCm hyphenates *package* names
(``hipblas-common``) and underscores *targets* and archives
(``librocblas_fortran.a``). ``find_package(rocblas)`` alone does not define
``roc::rocblas_fortran``; ask for ``rocblas-fortran``.

The package and target for each library are in the table under
`Rename your use statements`_, and the raw archive is
``lib<lib>_fortran.a`` (for example ``librocblas_fortran.a``) if you link
without CMake (`Without CMake`_).

Compiler support
================

Which compiler?
---------------

The bindings support ``amdflang`` (ROCm's bundled LLVM Flang, the recommended
default), ``gfortran``, and other ``iso_c_binding``-capable compilers such as
Cray Fortran, Intel ``ifx``, and NVIDIA ``nvfortran``.

One catch is worth knowing: there is no portable Fortran ABI, so a ``.mod``
(and its compiled ``.a``) is tied to one compiler, and even one compiler
version; two compilers cannot share a ``.mod``. ROCm therefore ships the
bindings precompiled for ``amdflang`` only, and with any other compiler you
build the bindings you use (see `Do I need to build anything?`_).

.. note::

   **Mixing amdflang versions.** A ``.mod`` is tied to the compiler *version*
   too. From ROCm 10.1, the opt-in ``-fmodule-mismatch-check=warn`` lets
   ``amdflang`` read a ``.mod`` written by another ``amdflang`` version,
   warning instead of erroring. It covers version skew inside ``amdflang``
   only: nothing lets ``gfortran`` read an ``amdflang`` ``.mod``. Rebuild when
   you can, because the warning means the two artifacts were not built
   together.

The C libraries you link (``libamdhip64.so``, ``librocblas.so``, and so on) are
the stable, compiler-agnostic ABI; only the thin Fortran layer is
compiler-specific.

Windows
-------

The bindings are Linux-first. ROCm for Windows ships no Fortran compiler, so
``BUILD_FORTRAN_BINDINGS`` defaults to ``OFF`` there, and a Windows install
contains no ``.mod``, no ``lib<lib>_fortran`` archive, and no installed
``.F90``. Nothing in the bindings is Linux-specific, though: they are plain
``iso_c_binding`` code. With a Fortran compiler of your own (Intel ``ifx``, for
example), take the ``fortran/`` directory from the repository at the tag of
your ROCm and build it as in `Building a binding with your compiler`_. This
path is not tested yet; if you try it, please
`report how it went <https://github.com/ROCm/hipfort/issues>`_.

Where the files install
-----------------------

Because the artifacts are compiler-specific, they install under a per-compiler
subdirectory: the ``.mod`` files in ``<includedir>/fortran/<compiler>/`` and the
``.a`` files in ``<libdir>/fortran/<compiler>/``. Several compilers can
therefore share one prefix, and a CMake ``find_package`` picks your compiler's
subdirectory automatically; if you link with raw flags, point ``-I`` and ``-L``
at it.

``<libdir>`` and ``<includedir>`` are the platform's own: ``lib64`` on Fedora,
RHEL and SUSE, ``lib/<triplet>`` on Debian multiarch. A stock ROCm install
gives ``/opt/rocm/include/fortran/amdflang/`` and
``/opt/rocm/lib/fortran/amdflang/``. Elsewhere, check the packager's
``CMAKE_INSTALL_LIBDIR`` before writing a path by hand.

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
lowercased. The name ignores the compiler version, so two versions of one
compiler would share a directory; ``<LIB>_FORTRAN_COMPILER_DIR`` (for example
``-DROCBLAS_FORTRAN_COMPILER_DIR=gfortran-13``) gives a build its own, and the
CMake package finds it.

If nothing is installed for your compiler, the package fails and names what is,
so that you can tell a rebuild from a redirect:

.. code-block:: none

   This project builds with gfortran, but no rocrand.mod for it is installed
   under /opt/rocm/include/fortran. Available: amdflang. A Fortran .mod cannot
   be shared across compilers; rebuild the bindings with gfortran, or set
   ROCRAND_FORTRAN_COMPILER_DIR to the directory to use.

The installed sources
=====================

Every package installs, beside the compiled binding, the Fortran source it was
compiled from:

.. code-block:: shell

   <datadir>/<library>/fortran/<library>.F90

which on a stock install is, for example,
``/opt/rocm/share/rocblas/fortran/rocblas.F90``:

.. list-table::
   :header-rows: 1
   :widths: 30 70

   * - Package
     - Installed source
   * - HIP
     - ``share/hip/fortran/hip.F90``
   * - ROCTx
     - ``share/roctx/fortran/roctx.F90``
   * - hipFFT
     - ``share/hipfft/fortran/hipfft.F90`` and ``hipfftw.F90``
   * - Every other library
     - ``share/<library>/fortran/<library>.F90`` (``rocblas``, ``hipblas``,
       ``rocsparse``, ``hipsparse``, ``rocfft``, ``rocsolver``, ``hipsolver``,
       ``rocrand``, ``hiprand``)

The source is there for three reasons:

*  **Any compiler can use ROCm.** The ``.mod`` and ``.a`` only serve
   ``amdflang``; the ``.F90`` serves every compiler. Nothing to clone, no
   other repository to track.
*  **It cannot disagree with your libraries.** It was generated from the same
   headers as the installed ``.so``, in the same build, so it declares exactly
   the entry points your ROCm exports. A copy taken from another release or
   branch can declare routines your ``.so`` does not have, and fail at link
   time.
*  **It is the reference.** It is the authoritative list of what the binding
   declares, with the argument types and the documentation comments from the C
   headers, readable without a ``.mod`` viewer.

It sits under ``share/`` rather than ``include/`` because it is
compiler-independent: everything under ``<includedir>/fortran/`` is
partitioned by compiler, so a source file there would be read as naming one.

Building a binding with your compiler
-------------------------------------

The ``.F90`` is self-contained Fortran: compiling it needs only a Fortran
compiler, no C headers and no ``.so``, since the vendor symbols resolve when
you link your application. The C libraries are not rebuilt.

**By hand**, compile each source you need into a ``.mod`` and an object file.
The array overloads are behind ``-DUSE_ASSUMED_SHAPE=1``; without it you get
only the raw ``type(c_ptr)`` interfaces:

.. code-block:: shell

   mkdir -p mods
   for lib in hip rocblas; do
     gfortran -c -DUSE_ASSUMED_SHAPE=1 -Jmods \
       /opt/rocm/share/$lib/fortran/$lib.F90 -o mods/$lib.o
   done

   gfortran app.f90 -Imods mods/rocblas.o mods/hip.o \
     -L/opt/rocm/lib -lrocblas -lamdhip64 -o app

**With CMake**, which also installs the result in the per-compiler layout with
its CMake package, so that ``find_package(rocblas-fortran)`` works as for the
shipped bindings. Each library's ``fortran/`` directory is a self-contained
project; build it against your installed ROCm, into a prefix of your own:

.. code-block:: shell

   cmake -S <source of rocblas>/fortran -B build/rocblas-fortran \
     -DCMAKE_Fortran_COMPILER=gfortran \
     -DCMAKE_PREFIX_PATH=/opt/rocm \
     -DCMAKE_INSTALL_PREFIX=$HOME/rocm-fortran
   cmake --build build/rocblas-fortran
   cmake --install build/rocblas-fortran

The ``fortran/`` project lives in the library's repository,
`rocm-systems <https://github.com/ROCm/rocm-systems>`_ for HIP and ROCTx,
`rocm-libraries <https://github.com/ROCm/rocm-libraries>`_ for the math
libraries, under ``projects/<library>/fortran``. Check out the tag of the ROCm
you have installed (both repositories tag releases as ``therock-<version>``),
for the reason given above.

Then compile your application with ``-I$HOME/rocm-fortran/include/fortran/gfortran``
and ``-L$HOME/rocm-fortran/lib/fortran/gfortran``, or add
``$HOME/rocm-fortran`` to ``CMAKE_PREFIX_PATH``.

A binding that ``use``\ s another needs the other's ``.mod``, built with the
same compiler, so build in dependency order. Today that is one case: rocSOLVER
``use``\ s rocBLAS, so build rocBLAS's binding first, and put its prefix on
``CMAKE_PREFIX_PATH`` (or the ``-I`` line) when you build rocSOLVER's.

Build options
=============

**Skip this section if you only use ROCm's precompiled bindings.** These
options control how the bindings are *built*. They matter if you build ROCm
from source, or build a binding yourself as above. They replace the
``HIPFORT_*`` options you passed to hipFORT's build, which you no longer run.

``BUILD_FORTRAN_BINDINGS`` replaces "do I build hipFORT at all". Every
``rocm-systems`` and ``rocm-libraries`` project exposes it, ``ON`` by default
on Linux (``OFF`` on Windows, where ROCm ships no Fortran compiler) but
guarded: built when a Fortran compiler is present, silently skipped when one is
not, so a C-only site never needs one. ``-DBUILD_FORTRAN_BINDINGS=OFF`` opts
out.

.. list-table::
   :header-rows: 1
   :widths: 40 60

   * - Old hipFORT option
     - New equivalent
   * - (build hipFORT, or do not)
     - ``BUILD_FORTRAN_BINDINGS``, per library, ``ON`` on Linux but guarded
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
     - ``BUILD_FORTRAN_CLIENTS`` (``ON``), per library. hipFORT's single suite
       splits into each library's ``fortran/test/``, and rides on the same
       switch as the Fortran clients rather than having one of its own
   * - ``HIPFORT_EXTENDED_TESTS``
     - Gone, with both link-time audits it gated, which checked the bindings
       themselves rather than your code. What you build is the runtime suite,
       under ``BUILD_FORTRAN_CLIENTS``

Each switch also has a per-library override, so one library can differ from the
rest of a monorepo build: ``<LIB>_BUILD_FORTRAN_BINDINGS`` and
``<LIB>_BUILD_FORTRAN_CLIENTS`` (for example
``-DROCSPARSE_BUILD_FORTRAN_BINDINGS=OFF``) win over the global spelling when
set. ``<LIB>_FORTRAN_COMPILER_DIR`` overrides the per-compiler subdirectory name
(`Where the files install`_).

The array tiers themselves are unchanged: raw ``type(c_ptr)`` (Fortran 2003)
always present, array overloads (2008) on, assumed-rank (2018) opt-in. One
option now selects between them instead of two, because assumed-rank
*replaces* the per-rank variants rather than adding to them: an assumed-rank
dummy is not distinguishable by rank from the per-rank specifics, so the two
cannot legally coexist in one generic, and two booleans could express that
illegal combination. See :doc:`fortran-interfaces` for the call sites side by
side. The shipped bindings use the default, ``assumed-shape``, which is what
hipFORT gives you today.

The bindings' test suite rides on ``BUILD_FORTRAN_CLIENTS``, ``ON`` by default
and guarded the same way: asking for it when the bindings were not built is a
skip, not an error. rocBLAS, hipBLAS and rocSPARSE already had that name for
"build the Fortran part of ``clients/``"; it now covers both.

To test from CMake whether a binding is available, use
``if(TARGET roc::rocblas_fortran)`` after ``find_package(rocblas-fortran)``.
Inside a ROCm build tree, ``<LIB>_HAVE_FORTRAN_BINDINGS`` is true only when
that library's bindings were built, since a Fortran compiler can be present
with ``BUILD_FORTRAN_BINDINGS=OFF``.

Trying the bindings before ROCm 10.2
====================================

The bindings are under review in one pull request per library. Until they ship
in a ROCm release, you can try them by building a binding from its pull request
branch against a recent ROCm, such as a TheRock nightly, with the commands in
`Building a binding with your compiler`_. Build HIP's binding first: the other
bindings' tests ``use hip``.

.. list-table::
   :header-rows: 1
   :widths: 30 70

   * - Library
     - Pull request
   * - HIP
     - `rocm-systems#11923 <https://github.com/ROCm/rocm-systems/pull/11923>`_
   * - ROCTx
     - `rocm-systems#12700 <https://github.com/ROCm/rocm-systems/pull/12700>`_
   * - rocBLAS
     - `rocm-libraries#12533 <https://github.com/ROCm/rocm-libraries/pull/12533>`_
   * - hipBLAS
     - `rocm-libraries#12370 <https://github.com/ROCm/rocm-libraries/pull/12370>`_
   * - rocSOLVER
     - `rocm-libraries#12582 <https://github.com/ROCm/rocm-libraries/pull/12582>`_
   * - hipSOLVER
     - `rocm-libraries#12581 <https://github.com/ROCm/rocm-libraries/pull/12581>`_
   * - rocSPARSE
     - `rocm-libraries#12514 <https://github.com/ROCm/rocm-libraries/pull/12514>`_
   * - hipSPARSE
     - `rocm-libraries#12368 <https://github.com/ROCm/rocm-libraries/pull/12368>`_
   * - rocFFT
     - `rocm-libraries#12366 <https://github.com/ROCm/rocm-libraries/pull/12366>`_
   * - hipFFT, hipFFTW
     - `rocm-libraries#12367 <https://github.com/ROCm/rocm-libraries/pull/12367>`_
   * - rocRAND
     - `rocm-libraries#12505 <https://github.com/ROCm/rocm-libraries/pull/12505>`_
   * - hipRAND
     - `rocm-libraries#12506 <https://github.com/ROCm/rocm-libraries/pull/12506>`_

Once they are merged, TheRock builds and packages them with the rest of ROCm,
and its nightly builds are the first place to get them precompiled. Reports
from trying a real code are especially welcome at this stage:
`open an issue <https://github.com/ROCm/hipfort/issues>`_.

What does not change
====================

*  **Your calls.** ``hipMalloc``, ``rocblas_dgemm``, ``hipblasDgemm``, the enum
   and type names, and ``hipCheck`` keep their names and signatures. Only the
   module you ``use`` changes. The bindings come from the same generator as
   current hipFORT; if you are on an older hipFORT release, a few argument
   types have since been corrected (an output scalar typed by reference instead
   of ``type(c_ptr)``, for example), and the compiler points at each one.
*  **Calling styles.** Raw ``type(c_ptr)`` still works (including for OpenMP
   target data); the array, typed-handle, and string overloads still resolve
   under the same name; you never touch ``iso_c_binding``.
*  **The vendor libraries.** You still link the same ``.so``
   (``libamdhip64.so``, ``librocblas.so``, and so on). Only the Fortran ``.a``
   and ``.mod`` change.

Special cases
=============

The in-tree Fortran modules that rocBLAS, hipSPARSE, hipRAND and the others
shipped themselves have collisions of their own at 10.2; those are covered in
:doc:`migration-guide-in-tree`, not here.

**If you build for NVIDIA (CUDA)**, the ``nvptx`` backend is dropped from the
new bindings. It survives only in old hipFORT until 11.0.

FAQ
===

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

Two rules: build both with the same compiler as your application, and never
``use`` both bindings for the same library in one scope. The clash is
*source*-level only. The archives coexist fine, because symbols are mangled
per module name, which is why migrating one file at a time works.

.. note::

   **This answer is about hipFORT**, and the first row of the table is why it
   cannot extend to a library's own in-tree module: that one is already named
   ``rocblas``, not ``hipfort_rocblas``, so there is no prefixed-versus-bare
   distinction to keep the two apart. Same module name, no coexistence, no
   file-by-file window. See :doc:`migration-guide-in-tree`.

**My code is old fixed-form Fortran. Can I use these bindings?**

Yes. Fixed form is not an old *standard*: a ``.f`` file with ``DO ...
CONTINUE``, implicit typing and a 72-column layout can ``use hip`` like any
other source. The requirement is on the compiler, which must handle Fortran
2003's ``iso_c_binding``, not on how your code looks.

The exception is a unit compiled as pre-Fortran 90, which has no modules and so
no ``use`` statement to write. hipFORT never had a path for that either. If you
are stuck there, `open an issue <https://github.com/ROCm/hipfort/issues>`_
rather than hand-writing glue, because a C shim with F77 linkage can be
generated.

**Will my calls break?**

Your *calls* will not: routine names, arguments, and calling styles stay the
same. But your code will not compile or link until you make the two edits
(rename the ``use`` line, change the link target); that is the breaking part,
and it is the whole of the migration.

**Where do I get the new bindings?**

They ship precompiled for ``amdflang`` with ROCm 10.2 and later, with no
separate install. For another compiler, see
`Building a binding with your compiler`_; before 10.2, see
`Trying the bindings before ROCm 10.2`_.
