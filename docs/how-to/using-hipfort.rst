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
   *  rocTX

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
   *  hipFFTW
   *  hipRAND
   *  hipSOLVER
   *  hipSPARSE

The available interfaces depend on which Fortran compiler was used to compile the hipFORT modules and libraries.
The interfaces use the ``iso_c_binding`` module, so the minimum requirement is a Fortran compiler that supports
the Fortran 2003 standard (`f2003`). These interfaces typically require passing ``type(c_ptr)`` variables
and the number of bytes to memory management. Some examples include ``hipMalloc`` and math library routines like ``hipblasDGEMM``.

If your compiler can understand the Fortran 2008 (`f2008`) code constructs,
additional interfaces are compiled into the hipFORT modules and libraries.
These interfaces take Fortran (array) variables, the number of elements instead of ``type(c_ptr)`` variables,
and the number of bytes, respectively. Therefore, they reduce the chance of introducing compile-time and runtime errors
into your code and make it easier to read.

These additional interfaces are guarded by the ``USE_FPOINTER_INTERFACES`` preprocessor definition,
which hipFORT enables automatically once it detects Fortran 2008 support in your compiler. By convention,
application and test sources that rely on them use the ``.f08`` file extension (see the ``test/f2008``
examples), while Fortran 2003 sources use ``.f03``.

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

   find_package(hipfort REQUIRED COMPONENTS hip rocblas hipblas)

   add_executable(my_app main.f08)
   target_link_libraries(my_app PRIVATE hipfort::rocblas hipfort::hipblas hipfort::hip)

List the libraries your code uses as ``COMPONENTS`` (``hip``, ``roctx``,
``rocblas``, ``rocfft``, ``rocrand``, ``rocsolver``, ``rocsparse``,
``hipblas``, ``hipfft``, ``hipfftw``, ``hiprand``, ``hipsolver``,
``hipsparse``) and link the matching ``hipfort::<component>`` targets.
``hipfort::hip`` is always required. If hipFORT is not in a default location,
point CMake at it with ``-Dhipfort_ROOT=/path/to/hipfort`` (or
``CMAKE_PREFIX_PATH``).

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

To build hipFORT itself with a specific compiler or backend, use one of the example
toolchain files in ``cmake/toolchains`` via ``-DCMAKE_TOOLCHAIN_FILE=...``.

Examples
--------

To see some examples for the `f2003` and `f2008` interfaces, see the :doc:`hipFORT samples <../tutorials/examples>`.
For complete, runnable programs that use a ROCm math library, see the
:doc:`rocFFT examples <../tutorials/rocfft-examples>`, the
:doc:`rocSOLVER examples <../tutorials/rocsolver-examples>`, and the
:doc:`rocSPARSE examples <../tutorials/rocsparse-examples>`.
The ``hip*`` libraries, whose APIs follow their NVIDIA counterparts, have their
own examples: the :doc:`hipFFT examples <../tutorials/hipfft-examples>`, the
:doc:`hipFFTW examples <../tutorials/hipfftw-examples>`, the
:doc:`hipSOLVER examples <../tutorials/hipsolver-examples>`, and the
:doc:`hipSPARSE examples <../tutorials/hipsparse-examples>`.

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

.. note::

   Use the **Search** function from the hipFORT table of contents to get more information on the arguments for an interface.
