.. meta::
  :description: Install rocDecode
  :keywords: install, rocDecode, AMD, ROCm


Installation
*********************************


Prerequisites
===============

* hipSOLVER interfaces will only work for AMD GPUs.

* We recommend gfortran version 7.5.0 or newer, as we have observed problems with older versions.

Building and testing hipfort from source
==========================================

Install `gfortran`, `git`, `cmake`, and HIP, if not yet installed. Then build, install, and test hipfort from source with the commands below:

.. code-block:: 

        git clone https://github.com/ROCmSoftwarePlatform/hipfort
        mkdir build ; cd build
        cmake -DHIPFORT_INSTALL_DIR=/tmp/hipfort ..
        make install
        export PATH=/tmp/hipfort/bin:$PATH
        cd ../test/f2003/vecadd
        hipfc -v hip_implementation.cpp main.f03
        ./a.out



.. note::
The above steps demonstrate the use of the `hipfc` utility. `hipfc` calls `hipcc` for non-Fortran files and then compiles the Fortran files and links to the object file created by `hipcc`.

Fortran interfaces
===================

`hipfort` provides interfaces to the following HIP and ROCm libraries:

* **HIP:**   HIP runtime, hipBLAS, hipSPARSE, hipFFT, hipRAND, hipSOLVER
* **ROCm:** rocBLAS, rocSPARSE, rocFFT, rocRAND, rocSOLVER

While the HIP interfaces and libraries allow to write portable code for both AMD and CUDA devices, the ROCm ones can only be used with AMD devices.

The available interfaces depend on the Fortran compiler that is used to compile the `hipfort` modules and libraries. As the interfaces make use of the `iso_c_binding` module, the minimum requirement is a Fortran compiler that supports the Fortran 2003 standard (`f2003`). These interfaces typically require to pass `type(c_ptr)` variables and the number of bytes to memory management (e.g. `hipMalloc`) and math library routines, for example, `hipblasDGEMM`.

If your compiler understands the Fortran 2008 (`f2008`) code constructs that occur in `hipfort`'s source and test files, additional interfaces are compiled into the `hipfort` modules and libraries. 
These directly take Fortran (array) variables and the number of elements instead of `type(c_ptr)` variables and the number of bytes, respectively. Therefore, they reduce the chance to introduce compile-time and runtime errors into your code and makes it easier to read too.

.. note:: 
If you plan to use the `f2008` interfaces, we recommend `gfortran` version `7.5.0` or newer as we have observed problems with older versions.

Examples
--------

Use the following examples to express `f2003` interfaces:

**Example 1**


.. code-block:: Fortran

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
```

**Example 2**

.. code-block:: Fortran

        use hipfort
        integer     :: ierr        ! error code
        real        :: a_h(5,6)    ! host array
        real,pointer :: a_d(:,:)   ! device array pointer
        !
        ierr = hipMalloc(a_d,shape(a_h))      ! or hipMalloc(a_d,[5,6]) or hipMalloc(a_d,5,6) or hipMalloc(a_d,mold=a_h)
        ierr = hipMemcpy(a_d,a_h,size(a_h),hipMemcpyHostToDevice)



.. note::

The `f2008` interfaces also overload `hipMalloc`, similar to the Fortran 2008 `ALLOCATE` intrinsic. For example,

.. code-block:: Fortran

        integer     :: ierr        ! error code
        real        :: a_h(5,6)    ! host array
        real,pointer :: a_d(:,:)   ! device array pointer
        !
        ierr = hipMalloc(a_d,source=a_h)       ! take shape (incl. bounds) of a_h and perform a blocking copy to device



In addition to `source`, there is also `dsource` in case the source is a device array.
