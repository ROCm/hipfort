.. meta::
  :description: Install guide for hipFORT
  :keywords: install, hipFORT, AMD, ROCm, building, tests

*********************************
Installing and building hipFORT
*********************************

This topic discusses how to build and install hipFORT from source with CMake.
It also provides information on how to build and run the tests.

Prerequisites
===============

hipFORT requires a Fortran compiler that supports at least the Fortran 2003 standard.
GFortran version 7.5.0 or newer is the primary tested compiler (see the `GFortran website
<https://fortran-lang.org/learn/os_setup/install_gfortran/>`_), and AMD ``amdflang`` (LLVM Flang) is
also supported. Other standard-conforming compilers such as NVIDIA ``nvfortran``, Intel ``ifx``/``ifort``,
and the Cray Fortran compiler (for example on LUMI) are not officially supported, but hipFORT should
build with them too. Please open an issue at https://github.com/ROCm/hipfort/issues if you run into problems.
Ready-made CMake toolchain files for each of these compilers are provided; see :ref:`hipfort-toolchain-files`.

.. _build-test-hipfort-from-source:

Building and testing hipFORT from source
==========================================

#. Ensure you have installed ``gfortran``, ``git``, ``cmake``, and :doc:`HIP <hip:index>`.
#. Build, install, and test hipFORT from source using the following commands:

   .. code-block:: shell

      git clone https://github.com/ROCm/hipfort.git
      cd hipfort
      cmake -S. -Bbuild -DCMAKE_INSTALL_PREFIX=/tmp/hipfort -DBUILD_TESTING=ON
      cmake --build build
      cmake --install build
      ctest --test-dir build

   .. note::

      The hipFORT installation compiles a backend for ROCm (``hipfort-amdgcn``).
      When installing hipFORT from source, you do not need to specify the ``HIP_PLATFORM`` environment variable.

Customizing the build
-----------------------

You can customize the build by setting the following environment variables:

*  ``FC``: The Fortran compiler to use
*  ``FFLAGS``: Compiler flags for building hipFORT

or by setting the CMake cache variables:

*  ``CMAKE_BUILD_TYPE``: Set to ``RELEASE``, ``TESTING``, or ``DEBUG``
*  ``CMAKE_AR``: Static archive command
*  ``CMAKE_RANLIB``: The ``ranlib`` used to create the static archive
*  ``CMAKE_INSTALL_PREFIX``: The install directory

.. _hipfort-toolchain-files:

Toolchain files
-----------------

Rather than setting the compiler and backend cache variables by hand, you can select a
ready-made CMake toolchain file from ``cmake/toolchains/`` with ``-DCMAKE_TOOLCHAIN_FILE``:

.. code-block:: shell

   cmake -S . -Bbuild -DCMAKE_TOOLCHAIN_FILE=cmake/toolchains/amdflang.cmake

Each file only sets the Fortran, C, and C++ compilers (plus optional ``ROCM_PATH`` and
``HIP_PLATFORM`` hints), so they compose with the other build options above.

.. list-table::
   :header-rows: 1

   * - Toolchain file
     - Compiler
     - Backend
   * - ``amdflang.cmake``
     - ``amdflang`` (ROCm LLVM Flang)
     - AMD ROCm (recommended default)
   * - ``gnu.cmake``
     - ``gfortran``
     - AMD ROCm
   * - ``intel.cmake``
     - ``ifx`` (Intel LLVM)
     - AMD ROCm
   * - ``intel-classic.cmake``
     - ``ifort`` (EOL)
     - AMD ROCm
   * - ``cray.cmake``
     - Cray ``ftn``
     - AMD ROCm
   * - ``nvhpc.cmake``
     - ``nvfortran``
     - NVIDIA/CUDA

Copy any of these as a starting point for your own site-specific toolchain.

Linking against hipFORT
========================

To use hipFORT in your project, invoke your Fortran and HIP compilers directly and link
against the appropriate ROCm libraries. hipFORT provides exported CMake targets (such as
``hipfort::hip``, ``hipfort::rocblas``, and ``hipfort::hipblas``) to make this straightforward:

.. code-block:: cmake

   find_package(hipfort REQUIRED)
   add_executable(my_app main.f08)
   target_link_libraries(my_app PRIVATE hipfort::hipblas hipfort::hip)


Examples and tests
====================

The examples in the ``f2003`` and ``f2008`` subdirectories of the ``test`` folder in the repository
also serve as tests. Both test collections implement the same tests. However, the ``f2008`` tests require the
Fortran compiler to support the Fortran 2008 standard or newer.
The ``f2003`` tests only require support for the Fortran 2003 (`f2003`) standard.
The ``f2003`` and ``f2008`` subdirectories are further subdivided into tests for the various hip* and roc* libraries.

Building and running the tests
-------------------------------

The tests are driven by CTest. Configure the build with ``-DBUILD_TESTING=ON``,
build hipFORT, and run the suite with ``ctest``
(see :ref:`build-test-hipfort-from-source`).

The commands below expect the ROCm math libraries to be found at ``/opt/rocm``.
To specify a different ROCm location, use the ``ROCM_PATH`` environment variable.

.. code-block:: shell

   cmake -S. -Bbuild -DCMAKE_INSTALL_PREFIX=/tmp/hipfort -DBUILD_TESTING=ON
   cmake --build build
   ctest --test-dir build

To run a single test, pass its name to ``ctest`` using the ``-R`` filter:

.. code-block:: shell

   ctest --test-dir build -R hipfort_test_f2008_hipblas_dgemm
