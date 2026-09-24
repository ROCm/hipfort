.. meta::
  :description: How to use hipFORT
  :keywords: fortran, hipFORT, compiler, AMD, ROCm, usage guide

*********************************
Using hipFORT in your application
*********************************

The following topic provides instructions and tips for using hipFORT.

Fortran interfaces
==================

hipFORT provides interfaces to the HIP runtime and to the ROCm libraries:

*  **HIP runtime and tooling**:

   *  HIP runtime
   *  ROCTx

*  **ROCm math libraries** (``roc*``):

   *  rocBLAS
   *  rocFFT
   *  rocRAND
   *  rocSOLVER
   *  rocSPARSE

*  **HIP math libraries** (``hip*``), whose APIs follow their NVIDIA
   counterparts:

   *  hipBLAS
   *  hipFFT
   *  hipRAND
   *  hipSOLVER
   *  hipSPARSE

*  **FFTW3-compatible interface**:

   *  hipFFTW, whose routine names, planner flags, and calling sequence follow FFTW3
      rather than an NVIDIA library

The available interfaces depend on which Fortran compiler was used to compile the hipFORT modules and libraries.
The interfaces use the ``iso_c_binding`` module, so the minimum requirement is a Fortran compiler that supports
the Fortran 2003 standard (``f2003``). These interfaces typically require passing ``type(c_ptr)`` variables
and the number of bytes to memory management routines such as ``hipMalloc``, and ``type(c_ptr)`` variables
to math library routines such as ``hipblasDgemm``.

If your compiler can understand the Fortran 2008 (``f2008``) code constructs,
additional interfaces are compiled into the hipFORT modules and libraries.
These interfaces take Fortran (array) variables and the number of elements, instead of ``type(c_ptr)``
variables and the number of bytes. Therefore, they reduce the chance of introducing compile-time and runtime errors
into your code and make it easier to read.

These additional interfaces are guarded by the ``USE_FPOINTER_INTERFACES`` preprocessor definition,
which hipFORT enables automatically once it detects Fortran 2008 support in your compiler. The
``hipMalloc`` and ``hipMemcpy`` array overloads are an exception: they are not guarded and are
therefore available in every hipFORT build. By convention,
application and test sources that rely on them use the ``.f08`` file extension (see the ``test/f2008``
examples), while Fortran 2003 sources use ``.f03``.

For a side-by-side comparison of the call sites, the ``hipMalloc`` ``mold``,
``source`` and ``dsource`` overloads, and the experimental Fortran 2018
assumed-rank mode, see :doc:`fortran-interfaces`.

AMD's ``amdflang`` (ROCm's LLVM Flang, bundled with ROCm) is the recommended default, and
``gfortran`` (version 7.5.0 or newer) is also supported.
Please open an issue at https://github.com/ROCm/hipfort/issues if you run into problems.

Building your application with CMake
------------------------------------

Each library ships its own Fortran archive and its own CMake package, so you
locate the ones you use with ``find_package`` and link their targets. A target
pulls in the right Fortran module (``.mod``) search path, the Fortran archive,
and the C library it wraps.

.. code-block:: cmake

   cmake_minimum_required(VERSION 3.18)
   project(my_app Fortran C)

   find_package(rocblas-fortran REQUIRED)   # find_dependency()s rocblas itself
   find_package(hipblas-fortran REQUIRED)
   find_package(hip-fortran REQUIRED)

   add_executable(my_app main.f08)
   target_link_libraries(my_app PRIVATE
     roc::rocblas_fortran roc::hipblas_fortran hip::hip_fortran)

Ask for one package per library your code ``use``\ s. The target sits in the C
library's own namespace with a ``_fortran`` suffix, so it is
``roc::rocblas_fortran`` but ``hip::hipfft_fortran``; the full table is in
:doc:`migration-guide`. Note that the package name is hyphenated and the target
underscored, which is ROCm's convention for the two rather than an
inconsistency. The Fortran language must be enabled before ``find_package``.

If the bindings are not in a default location, point CMake at them with
``CMAKE_PREFIX_PATH``.

Multiple Fortran toolchains
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fortran ``.mod`` files are compiler-specific, so a binding works only with the
compiler that produced it. Several toolchains therefore coexist by construction:
the modules and archives install into compiler-specific subdirectories
(``include/fortran/<compiler>`` and ``lib/fortran/<compiler>``), where
``<compiler>`` is the name you would type (``amdflang``, ``gfortran``, ``ftn``,
and so on). There is nothing to enable, and nothing to opt out of.

``find_package`` resolves the subdirectory matching your Fortran compiler
automatically, so your application picks up modules and archives built with the
same compiler. Asking for a binding that was not built with your compiler is a
``find_package`` failure naming the toolchains that *are* installed, rather than
an unreadable-module error later in the build.

To build hipFORT itself with a specific compiler or backend, use one of the example
toolchain files in ``cmake/toolchains`` via ``-DCMAKE_TOOLCHAIN_FILE=...``.

Examples
--------

For complete, runnable programs, see the
:doc:`HIP runtime examples <../tutorials/hip-examples>` and, for the ROCm math
libraries, the :doc:`rocBLAS examples <../tutorials/rocblas-examples>`, the
:doc:`rocFFT examples <../tutorials/rocfft-examples>`, the
:doc:`rocRAND examples <../tutorials/rocrand-examples>`, the
:doc:`rocSOLVER examples <../tutorials/rocsolver-examples>`, and the
:doc:`rocSPARSE examples <../tutorials/rocsparse-examples>`.
The ``hip*`` libraries, whose APIs follow their NVIDIA counterparts, have their
own examples: the :doc:`hipBLAS examples <../tutorials/hipblas-examples>`, the
:doc:`hipFFT examples <../tutorials/hipfft-examples>`, the
:doc:`hipRAND examples <../tutorials/hiprand-examples>`, the
:doc:`hipSOLVER examples <../tutorials/hipsolver-examples>`, and the
:doc:`hipSPARSE examples <../tutorials/hipsparse-examples>`.
For the FFTW3-compatible interface, see the
:doc:`hipFFTW examples <../tutorials/hipfftw-examples>`.

Supported HIP and ROCm APIs
---------------------------

The current set of hipFORT interfaces is derived from ROCm 10.0.0. The following tables list the supported APIs:

* :doc:`HIP API <../doxygen/html/md_input_2supported__api__hip>`
* :doc:`hipBLAS API <../doxygen/html/md_input_2supported__api__hipblas>`
* :doc:`hipFFT API <../doxygen/html/md_input_2supported__api__hipfft>`
* :doc:`hipFFTW API <../doxygen/html/md_input_2supported__api__hipfftw>`
* :doc:`hipRAND API <../doxygen/html/md_input_2supported__api__hiprand>`
* :doc:`hipSOLVER API <../doxygen/html/md_input_2supported__api__hipsolver>`
* :doc:`hipSPARSE API <../doxygen/html/md_input_2supported__api__hipsparse>`
* :doc:`rocBLAS API <../doxygen/html/md_input_2supported__api__rocblas>`
* :doc:`rocFFT API <../doxygen/html/md_input_2supported__api__rocfft>`
* :doc:`rocRAND API <../doxygen/html/md_input_2supported__api__rocrand>`
* :doc:`rocSOLVER API <../doxygen/html/md_input_2supported__api__rocsolver>`
* :doc:`rocSPARSE API <../doxygen/html/md_input_2supported__api__rocsparse>`
* :doc:`ROCTx API <../doxygen/html/md_input_2supported__api__roctx>`

.. note::

   Use the **Search** function from the hipFORT table of contents to get more information on the arguments for an interface.
