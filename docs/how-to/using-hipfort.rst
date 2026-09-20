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
the Fortran 2003 standard (`f2003`). These interfaces typically require passing ``type(c_ptr)`` variables
and the number of bytes to memory management. Some examples include ``hipMalloc`` and math library routines like ``hipblasDGEMM``.

If your compiler can understand the Fortran 2008 (`f2008`) code constructs,
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

AMD's ``amdflang`` (ROCm's LLVM Flang, bundled with ROCm) is the recommended default, and
``gfortran`` (version 7.5.0 or newer) is also supported.
Please open an issue at https://github.com/ROCm/hipfort/issues if you run into problems.

Allocating and copying device memory
------------------------------------

The Fortran 2003 form holds the device pointer in a ``type(c_ptr)`` and counts
bytes:

.. code-block:: fortran

   use iso_c_binding
   use hipfort
   integer      :: ierr       ! error code
   real, target :: a_h(5,6)   ! host array ('target' is required by c_loc)
   type(c_ptr)  :: a_d        ! device array pointer
   !
   ! real has 4 bytes; the '_c_size_t' suffix writes 4 as an integer(c_size_t)
   ierr = hipMalloc(a_d, size(a_h)*4_c_size_t)
   ierr = hipMemcpy(a_d, c_loc(a_h), size(a_h)*4_c_size_t, &
                    hipMemcpyHostToDevice)

The array overloads take a Fortran array pointer and a shape, and count
elements rather than bytes:

.. code-block:: fortran

   use hipfort
   integer       :: ierr      ! error code
   real          :: a_h(5,6)  ! host array
   real, pointer :: a_d(:,:)  ! device array pointer
   !
   ierr = hipMalloc(a_d, shape(a_h))   ! or hipMalloc(a_d, [5,6])
                                       ! or hipMalloc(a_d, 5, 6)
   ierr = hipMemcpy(a_d, a_h, size(a_h), hipMemcpyHostToDevice)

``hipMalloc`` is also overloaded with ``mold``, ``source`` and ``dsource``
arguments, in the spirit of the ``ALLOCATE`` intrinsic. ``mold`` takes the shape
of another array without copying anything, while ``source`` takes its shape
(including bounds) and performs a blocking copy to the device:

.. code-block:: fortran

   ierr = hipMalloc(a_d, mold=a_h)     ! shape of a_h, no copy
   ierr = hipMalloc(a_d, source=a_h)   ! shape of a_h, plus a copy from the host

Use ``dsource`` instead of ``source`` when the source array already lives on the
device.

Unlike the array interfaces of the math libraries, these ``hipMalloc`` and
``hipMemcpy`` overloads are not guarded by ``USE_FPOINTER_INTERFACES``, so they
are available in every hipFORT build.

Assumed-rank interfaces (Fortran 2018)
--------------------------------------

The Fortran 2008 array interfaces are generated once per rank, so each generic
carries a fixed set of ranks. Building hipFORT with
``-DHIPFORT_ASSUMED_RANK=ON`` replaces those per-rank overloads with a single
Fortran 2018 ``dimension(..)`` overload that accepts an actual argument of any
rank. This is what lets a rank-3 array be passed to a routine whose per-rank
overloads stop at rank 1, such as ``rocblas_saxpy``.

The option is experimental and ``OFF`` by default. Note the following:

* It is **mutually exclusive** with the classic per-rank interfaces rather than
  additive: enabling it replaces them.
* It requires a Fortran 2018 compiler (hipFORT probes for ``c_loc()`` of a
  ``dimension(..)`` argument) and the Fortran 2008 interfaces. If either is
  missing, hipFORT warns and falls back to the per-rank interfaces instead of
  failing the build.
* Only **contiguous** arrays may be passed.
* ``hipMalloc`` keeps its per-rank overloads either way; ``hipMemcpy``,
  ``hipMemcpyAsync`` and ``hipMemcpy2D`` gain assumed-rank forms.

``test/f2018/rocblas/saxpy.f90`` is the one program that exercises this mode; it
is skipped unless the option is enabled. See the
:doc:`rocBLAS examples <../tutorials/rocblas-examples>` for a walkthrough.

Building your application with CMake
------------------------------------

hipFORT installs CMake package files, so you can locate it with ``find_package``
and link against its exported ``hipfort::*`` targets. Each target pulls in the
right Fortran module (``.mod``) search path, the hipFORT library, and the
underlying ROCm library it wraps.

.. code-block:: cmake

   cmake_minimum_required(VERSION 3.18)
   project(my_app Fortran)

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
