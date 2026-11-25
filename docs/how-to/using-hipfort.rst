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
   *  hipFFTXt
   *  hipRAND
   *  hipSOLVER
   *  hipSPARSE

*  **FFTW3-compatible interface**:

   *  hipFFTW, whose routine names, planner flags, and calling sequence follow FFTW3
      rather than an NVIDIA library

*  **Communication**:

   *  RCCL, whose routine names follow NCCL

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

.. _hipfort-modules:

Modules
-------

Each library has its own module, CMake component and ROCm library. Its
constants and C structures are in separate modules.

.. list-table::
   :header-rows: 1
   :widths: 22 14 26 38

   * - Module
     - CMake component
     - Link with
     - Constants and types
   * - ``hipfort``
     - ``hip``
     - ``-lamdhip64``
     - ``hipfort_enums``, ``hipfort_types``
   * - ``hipfort_check``
     - ``hip``
     - No ROCm library
     - None
   * - ``hipfort_roctx``
     - ``roctx``
     - ``-lrocprofiler-sdk-roctx``
     - None
   * - ``hipfort_rccl``
     - ``rccl``
     - ``-lrccl``
     - ``hipfort_rccl_enums``, ``hipfort_rccl_types``
   * - ``hipfort_rocblas``
     - ``rocblas``
     - ``-lrocblas``
     - ``hipfort_rocblas_enums``
   * - ``hipfort_rocsolver``
     - ``rocsolver``
     - ``-lrocsolver -lrocblas``
     - ``hipfort_rocsolver_enums``
   * - ``hipfort_rocsparse``
     - ``rocsparse``
     - ``-lrocsparse``
     - ``hipfort_rocsparse_enums``
   * - ``hipfort_rocfft``
     - ``rocfft``
     - ``-lrocfft``
     - ``hipfort_rocfft_enums``
   * - ``hipfort_rocrand``
     - ``rocrand``
     - ``-lrocrand``
     - ``hipfort_rocrand_enums``, ``hipfort_rocrand_types``
   * - ``hipfort_hipblas``
     - ``hipblas``
     - ``-lhipblas``
     - ``hipfort_hipblas_enums``
   * - ``hipfort_hipsolver``
     - ``hipsolver``
     - ``-lhipsolver``
     - ``hipfort_hipsolver_enums``
   * - ``hipfort_hipsparse``
     - ``hipsparse``
     - ``-lhipsparse``
     - ``hipfort_hipsparse_enums``
   * - ``hipfort_hipfft``
     - ``hipfft``
     - ``-lhipfft``
     - ``hipfort_hipfft_enums``
   * - ``hipfort_hipfftxt``
     - ``hipfftxt``
     - ``-lhipfft``
     - ``hipfort_hipfftxt_enums``, ``hipfort_hipfftxt_types``
   * - ``hipfort_hipfftw``
     - ``hipfftw``
     - ``-lhipfftw``
     - ``hipfort_hipfftw_enums``, ``hipfort_hipfftw_types``
   * - ``hipfort_hiprand``
     - ``hiprand``
     - ``-lhiprand``
     - ``hipfort_hiprand_enums``

``hipfort_hipfftxt`` uses ``hipfort_hipfft``, so ``use hipfort_hipfftxt`` alone gives
the whole hipFFT API. ``hipfort_check`` has the ``hipCheck``, ``hipblasCheck``, ...
routines, which call no ROCm library. rocSOLVER takes a rocBLAS handle, so a
rocSOLVER program also links rocBLAS. ``-lamdhip64``, the HIP runtime, is always
needed.

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

List the libraries your code uses as ``COMPONENTS`` (the components are in
:ref:`hipfort-modules`) and link the matching ``hipfort::<component>`` targets.
A ``hipfort::<component>`` target is only defined when that component is listed,
and the Fortran language must be enabled before ``find_package(hipfort)``.
If hipFORT is not in a default location,
point CMake at it with ``-Dhipfort_ROOT=/path/to/hipfort`` (or
``CMAKE_PREFIX_PATH``).

.. _hipfort-without-cmake:

Building your application without CMake
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ROCm does not ship hipFORT: build it and install it with the Fortran compiler you
use for your application (``cmake --install build --prefix <prefix>``). With the
default layout, its modules are in ``<prefix>/include/fortran/<compiler>/hipfort/amdgcn``
and its library in ``<prefix>/lib/fortran/<compiler>``, where ``<compiler>`` is,
for example, ``amdflang`` or ``gfortran``.

A program that uses hipBLAS compiles and links with:

.. code-block:: shell

   amdflang main.f90 -o main \
     -I<prefix>/include/fortran/amdflang/hipfort/amdgcn \
     -L<prefix>/lib/fortran/amdflang -lhipfort-amdgcn \
     -L<rocm>/lib -lhipblas -lamdhip64 -Wl,-rpath,<rocm>/lib

* ``-I`` points the compiler at the hipFORT modules (``.mod`` files).
* ``-lhipfort-amdgcn`` is the hipFORT library. It holds the module procedures:
  the array forms of the routines (``hipblasSaxpy`` on Fortran arrays), the
  ``hipCheck``, ``hipblasCheck``, ... routines of ``hipfort_check``, and the
  ``hipMalloc`` and ``hipMemcpy`` overloads.
* Each module you ``use`` needs the ROCm library it binds, in the "Link with"
  column of :ref:`hipfort-modules`. ``-lamdhip64``, the HIP runtime, is always needed.
* ``-Wl,-rpath`` lets the program find the ROCm libraries at run time without
  ``LD_LIBRARY_PATH``.

With OpenMP offload, add ``-fopenmp`` and ``--offload-arch=<gfx>``
(see :doc:`openmp-offload`).

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

   If your program uses OpenMP offload, also link it with
   ``-Wl,-z,nostart-stop-gc``. ``amdflang`` links with ``ld.lld``, which by
   default lets ``-Wl,--gc-sections`` remove the table of offload kernels, so
   the program aborts at its first ``target`` construct.

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
:doc:`hipFFTW examples <../tutorials/hipfftw-examples>`, and for collectives
across GPUs, the :doc:`RCCL examples <../tutorials/rccl-examples>`.

Supported HIP and ROCm APIs
---------------------------

The current set of hipFORT interfaces is derived from ROCm 10.2.0. With an older
ROCm, some of these routines are missing from the installed libraries: link with
``-Wl,--gc-sections`` (see :ref:`hipfort-gc-sections`) so that your program still
links as long as it does not call them. The following tables list the supported APIs:

* :doc:`HIP API <../doxygen/html/md_input_2supported__api__hip>`
* :doc:`hipBLAS API <../doxygen/html/md_input_2supported__api__hipblas>`
* :doc:`hipFFT API <../doxygen/html/md_input_2supported__api__hipfft>`
* :doc:`hipFFT Xt API <../doxygen/html/md_input_2supported__api__hipfftxt>`
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
* :doc:`RCCL API <../doxygen/html/md_input_2supported__api__rccl>`

.. note::

   Use the **Search** function from the hipFORT table of contents to get more information on the arguments for an interface.
