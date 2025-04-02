.. meta::
  :description: Install guide for hipFORT
  :keywords: install, hipFORT, AMD, ROCm, building, tests

*********************************
Installing and building hipFORT
*********************************

This topic discusses how to build hipFORT from source and use the Makefile.
It also provides information on how to build and run the tests.

Prerequisites
===============

hipFORT requires GFortran version 7.5.0 or newer.
For more information, see the `GFortran website. <https://fortran-lang.org/learn/os_setup/install_gfortran/>`_

.. _build-test-hipfort-from-source:

Building and testing hipFORT from source
==========================================

1. Ensure you have installed ``gfortran``, ``git``, ``cmake``, and :doc:`HIP <hip:index>`.
2. Build, install, and test hipFORT from source using the following commands:

   .. code-block:: shell

      git clone https://github.com/ROCm/hipfort.git
      cd hipfort
      cmake -S. -Bbuild -DHIPFORT_INSTALL_DIR=/tmp/hipfort -DBUILD_TESTING=ON
      make -C build
      make -C build check

.. note::
        The hipFORT installation will compile backends for both ROCm (``hipfort-amdgcn``) and CUDA (``hipfort-nvptx``) backends. When installing hipFORT from source, you do not need to specify the `HIP_PLATFORM` environment variable.

Customizing the build
=======================
You can customize the build by setting the following environment variables:

* `HIPFORT_COMPILER` - Fortran compiler to be used
* `HIPFORT_AR` - Static archive command
* `HIPFORT_RANLIB` - ranlib used to create Static archive
* `HIPFORT_COMPILER_FLAGS` - Compiler flags to build hipFORT
* `HIPFORT_BUILD_TYPE` - Set to RELEASE TESTING or DEBUG
* `HIPFORT_INSTALL_DIR` - Install directory for hipFORT

.. note::
        Setting the `CMAKE_INSTALL_DIR` build variable will **not** influence the installation location.
        Setting the `CMAKE_Fortran_COMPILER` build variable will **not** influence the Fortran compiler used to build hipFORT.

Fortran interfaces
===================

`hipfort` provides interfaces to the following HIP and ROCm libraries:

* **HIP:**   HIP runtime, hipBLAS, hipSPARSE, hipFFT, hipRAND, hipSOLVER

* **ROCm:** rocBLAS, rocSPARSE, rocFFT, rocRAND, rocSOLVER

.. note:: 

hipSOLVER interfaces will only work with AMD GPUs.

While the HIP interfaces and libraries allow the writing of portable code for both AMD and CUDA devices, ROCm can only be used with AMD devices.

The available interfaces depend on the Fortran compiler used to compile the `hipfort` modules and libraries. As the interfaces use the `iso_c_binding` module, the minimum requirement is a Fortran compiler that supports the Fortran 2003 standard (`f2003`). These interfaces typically require passing `type(c_ptr)` variables and the number of bytes to memory management. For example, `hipMalloc` and math library routines like `hipblasDGEMM`.

If your compiler understands the Fortran 2008 (`f2008`) code constructs in `hipfort`'s source and test files, additional interfaces are compiled into the `hipfort` modules and libraries. 
These directly take Fortran (array) variables, the number of elements instead of `type(c_ptr)` variables, and the number of bytes, respectively. Therefore, they reduce the chance of introducing compile-time and runtime errors into your code and make it easier to read, too.

.. note:: 

If you plan to use the `f2008` interfaces, we recommend `gfortran` version `7.5.0` or newer as we have observed problems with older versions.

Examples
--------

Use the following examples to express `f2003` interfaces:

**Example 1**


.. code-block:: 

    use iso_c_binding
    use hipfort
    integer     :: ierr        ! error code
    real        :: a_h(5,6)    ! host array
    type(c_ptr) :: a_d         ! device array pointer
    !
    ierr = hipMalloc(a_d,size(a_h)*4_c_size_t) ! real has 4 bytes
                                           ! append suffix '_c_size_t' to write '4' 
                                           ! as 'integer(c_size_t)'
    ierr = hipMemcpy(a_d,c_loc(a_h),size(a_h)*4_c_size_t,hipMemcpyHostToDevice)


**Example 2**

.. code-block::

        use hipfort
        integer     :: ierr        ! error code
        real        :: a_h(5,6)    ! host array
        real,pointer :: a_d(:,:)   ! device array pointer
        !
        ierr = hipMalloc(a_d,shape(a_h))      ! or hipMalloc(a_d,[5,6]) or hipMalloc(a_d,5,6) or hipMalloc(a_d,mold=a_h)
        ierr = hipMemcpy(a_d,a_h,size(a_h),hipMemcpyHostToDevice)



.. note::

The `f2008` interfaces also overload `hipMalloc`, similar to the Fortran 2008 `ALLOCATE` intrinsic. For example,

.. code-block:: 

        integer     :: ierr        ! error code
        real        :: a_h(5,6)    ! host array
        real,pointer :: a_d(:,:)   ! device array pointer
        !
        ierr = hipMalloc(a_d,source=a_h)       ! take shape (incl. bounds) of a_h and perform a blocking copy to device

In addition to `source`, there is also `dsource` in case the source is a device array.

Supported HIP and ROCm API
---------------------------

The current batch of HIPFORT interfaces is derived from ROCm 4.5.0. The following tables list the supported API:

* :doc:`HIP API <../doxygen/html/md_input_supported_api_hip>`
* :doc:`hipBLAS API <../doxygen/html/md_input_supported_api_hipblas>` 
* :doc:`hipFFT API <../doxygen/html/md_input_supported_api_hipfft>` 
* :doc:`hipRAND API <../doxygen/html/md_input_supported_api_hiprand>`
* :doc:`hipSOLVER API <../doxygen/html/md_input_supported_api_hipsolver>`
* :doc:`hipSPARSE API <../doxygen/html/md_input_supported_api_hipsparse>`
* :doc:`rocBLAS API <../doxygen/html/md_input_supported_api_rocblas>`
* :doc:`rocFFT API <../doxygen/html/md_input_supported_api_rocfft>`
* :doc:`rocRAND API <../doxygen/html/md_input_supported_api_rocrand>`
* :doc:`rocSOLVER API <../doxygen/html/md_input_supported_api_rocsolver>`
* :doc:`rocSPARSE API <../doxygen/html/md_input_supported_api_rocsparse>`


You may further find it convenient to directly use the ``Search`` function from the hipFORT TOC to get information on the arguments of an interface.

hipfc wrapper compiler and Makefile.hipfort
================================================

Along with Fortran interfaces for the HIP and ROCm libraries, hipFORT ships the hipfc wrapper compiler
and a ``Makefile.fort`` file that can be included in a project's build system.
hipfc can be found in the ``bin/`` directory, while ``Makefile.hipfort`` is in the ``share/hipfort`` directory
of the repository.

Both build mechanisms can be configured using a number of environment variables, but hipfc
includes a greater number of command-line options. You can list these options using the following command:

.. code-block:: shell

   hipfc -h

.. note::

   The hipfc wrapper compiler is deprecated and will be removed in a future release. Users are
   encouraged to call the Fortran or HIP compilers directly instead of relying on the hipfc wrapper.
   The hipFORT component provides exported CMake targets that can be used to link to the appropriate
   ROCm libraries.

The following table lists the most important environment variables:

.. list-table::
   :widths: 25 25 50
   :header-rows: 1

   * - Environment variable
     - Description
     - Default
   * - ``HIP_PLATFORM``
     - The platform to compile for (``amd`` or ``nvidia``)
     - ``amd``
   * - ``ROCM_PATH``
     - Path to the ROCm installation
     - ``/opt/rocm``
   * - ``CUDA_PATH``
     - Path to the CUDA installation
     - ``/usr/local/cuda``
   * - ``HIPFORT_COMPILER``
     -  Fortran compiler to use
     - ``gfortran``


Examples and tests
====================

The examples in the ``f2003`` and ``f2008`` subdirectories of the ``test`` folder in the repository
also serve as tests. Both test collections implement the same tests. However, the ``f2008`` tests require the
Fortran compiler to support the Fortran 2008 standard or newer.
The ``f2003`` tests only require support for the Fortran 2003 (`f2003`) standard.
The ``f2003`` and ``f2008`` subdirectories are further subdivided into tests for the various hip* and roc* libraries.

Building a single test
-----------------------

To compile for AMD devices, call the ``make`` command from within the test directories.

.. note::

   The ``make`` targets append the linker flags for AMD devices to the ``CFLAGS`` variable by default.

To compile for CUDA devices, use the ``make`` command to build as follows:

.. code-block:: shell

   make CFLAGS="--offload-arch=sm_70 <libs>"


Substitute ``<libs>`` for the actual library, such as ``-lcublas`` or ``-lcusparse``.

.. note:: 

        Only the hip* tests can be compiled for CUDA devices. The roc* tests cannot be compiled for CUDA devices. 

To compile using hipfc, run the following command:

.. code-block:: shell

   hipfc <CFLAGS> <test_name>.f03 -o <test_name>


The ``vecadd`` test is the only exception. It also requires the HIP C++ source.

.. code-block:: shell

   hipfc <CFLAGS> hip_implementation.cpp main.f03 -o main


Building and running all tests
-------------------------------

You can build and run the whole test collection from the ``build/`` folder
(see :ref:`build-test-hipfort-from-source`) or
from the ``test/`` folder. Follow the instructions below corresponding to the platform you are building for.

AMD devices
^^^^^^^^^^^^

The command to run all tests, as shown below, expects the ROCm math libraries to be found at ``/opt/rocm``.
To specify a different ROCm location, use the ``ROCM_PATH`` environment variable.

.. note::

   When using older ROCm versions, you might need to manually set the environment variable ``HIP_PLATFORM``
   to ``hcc`` before running the tests.

To run the tests from the ``build`` subdirectory, use these commands:

.. code-block:: shell

   cd build/
   make all-tests-run

Alternatively, run the following commands from the ``test`` directory:

.. code-block:: shell

   cd test/
   make run_all

CUDA devices
^^^^^^^^^^^^

To run the tests as shown below, CUDA must be found at ``/usr/local/cuda``.
To specify a different CUDA location, use the ``CUDA_PATH`` environment variable or provide it as part of the ``CFLAGS`` variable
by appending ``-cuda-path <path_to_cuda>``. 

.. note::

   Choose the offload architecture value according to the device being used.

To run the tests from the ``build`` subdirectory, use these commands:

.. code-block:: shell

   cd build/
   make all-tests-run CFLAGS="--offload-arch=sm_70 -lcublas -lcusolver -lcufft"


Alternatively, run the following commands from the ``test`` directory:

.. code-block:: shell

   cd test/
   make run_all CFLAGS="--offload-arch=sm_70 -lcublas -lcusolver -lcufft"


