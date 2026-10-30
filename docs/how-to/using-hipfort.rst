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

These additional interfaces are enabled automatically once hipFORT detects Fortran 2008
support in your compiler. This includes the ``hipMalloc``, ``hipMemcpy`` and
``hipHostRegister`` array overloads. By convention,
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

hipFORT installs CMake package files, so you can locate it with ``find_package``
and link against its exported ``hipfort::*`` targets. Each target pulls in the
right Fortran module (``.mod``) search path, the hipFORT library, and the
underlying ROCm library it wraps.

.. code-block:: cmake

   cmake_minimum_required(VERSION 3.18)
   # C is required by the CMake package of HIP, which finds Threads.
   project(my_app LANGUAGES Fortran C)

   find_package(hipfort REQUIRED COMPONENTS hip rocblas hipblas)

   add_executable(my_app main.f08)
   target_link_libraries(my_app PRIVATE hipfort::rocblas hipfort::hipblas hipfort::hip)

List the libraries your code uses as ``COMPONENTS`` (``hip``, ``roctx``,
``rocblas``, ``rocfft``, ``rocrand``, ``rocsolver``, ``rocsparse``,
``hipblas``, ``hipfft``, ``hipfftw``, ``hiprand``, ``hipsolver``,
``hipsparse``) and link the matching ``hipfort::<component>`` targets.
A ``hipfort::<component>`` target is only defined when that component is listed,
and the Fortran language must be enabled before ``find_package(hipfort)``.
If hipFORT is not in a default location,
point CMake at it with ``-Dhipfort_ROOT=/path/to/hipfort`` (or
``CMAKE_PREFIX_PATH``).

.. _hipfort-gc-sections:

Linking only the routines you call
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Each hipFORT module compiles to one object file, and a linker takes whole object
files from an archive, so a program that calls one rocBLAS routine links every
rocBLAS wrapper of hipFORT. hipFORT compiles each procedure into its own section,
so linking with ``-Wl,--gc-sections`` keeps only the wrappers your program calls,
and the program is smaller.

It also matters when hipFORT is newer than the installed ROCm, for example when
you build hipFORT from its ``develop`` branch against an older ROCm release. A
wrapper can then call a routine the installed library does not export. Without
``-Wl,--gc-sections``, that wrapper makes every link against the library fail,
even if your program never calls the routine. With it, your program links as
long as it only calls routines the installed library exports.

On Linux, add the option to your executable:

.. code-block:: cmake

   if(NOT APPLE AND NOT WIN32)
     target_link_options(my_app PRIVATE -Wl,--gc-sections)
   endif()

Write ``-Wl,--gc-sections`` rather than ``LINKER:--gc-sections``: CMake 3.27
passes the latter to ``amdflang`` without the ``-Wl,`` prefix, and the link fails.
Without CMake, add ``-Wl,--gc-sections`` to the command that links your program.

.. note::

   If you build a shared library rather than an executable, also link it with
   ``-Wl,--exclude-libs,libhipfort-amdgcn.a``. A shared library exports its
   global symbols by default, including the hipFORT wrappers it links, and the
   linker never removes an exported symbol, so ``-Wl,--gc-sections`` alone keeps
   them all. ``--exclude-libs`` keeps the wrappers in your library, where your
   code calls them as before, but stops exporting them, so the unused ones can
   be removed.

Multiple Fortran toolchains
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fortran ``.mod`` files are compiler-specific, so a hipFORT build works only with
the compiler that produced it. To let several toolchains coexist, hipFORT installs
its modules and libraries into compiler-specific subdirectories
(``include/fortran/<compiler>`` and ``lib/fortran/<compiler>``). This is enabled by
the ``HIPFORT_MULTITOOLCHAIN_LAYOUT`` CMake option (``ON`` by default). The exported
``hipfort::*`` targets resolve these paths automatically, so your application picks
the right modules and library by using the hipFORT installation that was built with
the same Fortran compiler.

To build hipFORT itself with a specific compiler, use one of the example
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

The current set of hipFORT interfaces is derived from ROCm 7.13.0. With an older
ROCm, some of these routines are missing from the installed libraries: link with
``-Wl,--gc-sections`` (see :ref:`hipfort-gc-sections`) so that your program still
links as long as it does not call them. The following tables list the supported APIs:

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
