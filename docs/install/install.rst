.. meta::
  :description: Install guide for hipFORT
  :keywords: install, hipFORT, AMD, ROCm, building, tests

*******************************
Installing and building hipFORT
*******************************

This topic discusses how to build and install hipFORT from source with CMake.
It also provides information on how to build and run the tests.

Prerequisites
=============

hipFORT requires a Fortran compiler that supports at least the Fortran 2003 standard.
AMD ``amdflang`` (ROCm's LLVM Flang, bundled with ROCm) is the recommended default;
``gfortran`` version 7.5.0 or newer (see the `GFortran website
<https://fortran-lang.org/learn/os_setup/install_gfortran/>`_) is also supported.
A C compiler is also required: hipFORT enables the C language in CMake so that
``hip-config.cmake`` can be used.
Please open an issue at https://github.com/ROCm/hipfort/issues if you run into problems.
Ready-made CMake toolchain files are provided; see :ref:`hipfort-toolchain-files`.

.. _build-test-hipfort-from-source:

Building and testing hipFORT from source
========================================

#. Ensure you have installed a Fortran compiler and a C compiler (``amdflang`` and ``amdclang``, or ``gfortran`` and ``gcc``), ``git``, ``cmake``, and :doc:`HIP <hip:index>`.
#. Build, install, and test hipFORT from source using the following commands:

   .. code-block:: shell

      git clone https://github.com/ROCm/hipfort.git
      cd hipfort
      cmake -S. -Bbuild -DCMAKE_INSTALL_PREFIX=/tmp/hipfort -DBUILD_FORTRAN_CLIENTS=ON
      cmake --build build
      cmake --install build
      ctest --test-dir build

   .. note::

      The bindings are generated for ROCm only: there is no CUDA (``nvptx``) backend,
      and configuring with ``-DHIPFORT_BUILD_NVPTX=ON`` is an error.
      When installing hipFORT from source, you do not need to specify the ``HIP_PLATFORM`` environment variable.

Customizing the build
---------------------

You can customize the build by setting the following environment variables:

*  ``FC``: The Fortran compiler to use
*  ``FFLAGS``: Compiler flags for building hipFORT

or by setting the CMake cache variables:

*  ``CMAKE_BUILD_TYPE``: Set to ``RELEASE``, ``TESTING``, or ``DEBUG``
*  ``CMAKE_AR``: Static archive command
*  ``CMAKE_RANLIB``: The ``ranlib`` used to create the static archive
*  ``CMAKE_INSTALL_PREFIX``: The install directory
*  ``ROCM_PATH``: The ROCm installation root, if it cannot be detected automatically
*  ``FORTRAN_ARRAY_INTERFACES``: The array interfaces to generate, one of ``none`` (the ``type(c_ptr)`` interfaces only, Fortran 2003),
   ``assumed-shape`` (the per-rank array overloads, Fortran 2008; the default) or ``assumed-rank``
   (the experimental Fortran 2018 assumed-rank overloads instead of the per-rank ones).
   It replaces ``HIPFORT_USE_FPOINTER_INTERFACES`` and ``HIPFORT_ASSUMED_RANK``, which are now ignored with a warning.
*  ``<LIB>_FORTRAN_COMPILER_DIR``: The compiler-specific install subdirectory (``include/fortran/<compiler>``, ``lib/fortran/<compiler>``),
   named after the compiler by default. The per-compiler layout is always used; ``HIPFORT_MULTITOOLCHAIN_LAYOUT`` is gone.
*  ``BUILD_FORTRAN_BINDINGS``: Build the Fortran bindings (``ON`` by default)
*  ``BUILD_FORTRAN_CLIENTS``: Build the CTest suite (``ON`` by default). It replaces ``BUILD_TESTING``,
   which is still honoured with a warning when ``BUILD_FORTRAN_CLIENTS`` is not set.

.. _hipfort-toolchain-files:

Toolchain files
---------------

Rather than setting the compiler cache variables by hand, you can select a
ready-made CMake toolchain file from ``cmake/toolchains/`` with ``-DCMAKE_TOOLCHAIN_FILE``:

.. code-block:: shell

   cmake -S . -Bbuild -DHIPFORT_BUILD_NVPTX=OFF -DCMAKE_TOOLCHAIN_FILE=cmake/toolchains/amdflang.cmake

Each file only sets the Fortran and C compilers, so they compose with the other build
options above. hipFORT is pure Fortran, so no C++ compiler is required.

Linking against hipFORT
=======================

Each library ships its own Fortran module, archive, CMake package and target, so you
ask for one package per library you ``use`` and link its target:

.. code-block:: cmake

   # C is required by the CMake package of HIP, which finds Threads.
   project(my_app LANGUAGES Fortran C)

   find_package(hipblas-fortran REQUIRED)   # find_dependency()s hipblas itself
   find_package(hip-fortran REQUIRED)
   add_executable(my_app main.f08)
   target_link_libraries(my_app PRIVATE roc::hipblas_fortran hip::hip_fortran)

The target sits in the C library's own namespace with a ``_fortran`` suffix, so it is
``roc::rocblas_fortran`` but ``hip::hipfft_fortran``. The package name is hyphenated and
the target underscored, which is ROCm's convention for the two rather than an inconsistency.
The Fortran language must be enabled before ``find_package``. See
:doc:`../how-to/using-hipfort` for the full list of packages and targets.

On Linux, link your executable with ``-Wl,--gc-sections``. It keeps only the
binding wrappers your program calls, and lets the program link against a ROCm
release older than the bindings as long as it does not call the newer routines.
See :ref:`hipfort-gc-sections`.


Examples and tests
==================

The examples in the ``f2003`` and ``f2008`` subdirectories of the ``test`` folder in the repository
also serve as tests. The two collections largely overlap, but they are not identical: some tests exist
only in one of them. The ``f2008`` tests require the Fortran compiler to support the Fortran 2008
standard or newer. The ``f2003`` tests only require support for the Fortran 2003 standard.
The ``f2003`` and ``f2008`` subdirectories are further subdivided into tests for the various ``hip*`` and ``roc*`` libraries.
The ``test`` folder also contains an ``f2018`` subdirectory holding an experimental example built on the
Fortran 2018 assumed-rank interfaces. That example is only registered with CTest when hipFORT is configured
with ``-DFORTRAN_ARRAY_INTERFACES=assumed-rank`` (``assumed-shape`` by default). The ``openmp`` subdirectory holds OpenMP target-offload
tests, which require an offload-capable compiler (LLVM Flang) and a host LAPACK.

Building and running the tests
------------------------------

The tests are driven by CTest. Configure the build with ``-DBUILD_FORTRAN_CLIENTS=ON`` (the default),
build hipFORT, and run the suite with ``ctest``
(see :ref:`build-test-hipfort-from-source`).

The commands below need the ROCm math libraries. The ROCm root is detected from
``ROCM_PATH`` or from ``hipcc`` on your ``PATH``; override with ``-DROCM_PATH=``.

.. code-block:: shell

   cmake -S. -Bbuild -DCMAKE_INSTALL_PREFIX=/tmp/hipfort -DBUILD_FORTRAN_CLIENTS=ON
   cmake --build build
   ctest --test-dir build

To run a single test, pass its name to ``ctest`` using the ``-R`` filter:

.. code-block:: shell

   ctest --test-dir build -R hipfort_test_f2008_hipblas_dgemm
