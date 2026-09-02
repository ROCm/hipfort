.. meta::
  :description: hipFORT examples and API references
  :keywords: hipFORT, ROCm, API, documentation, examples, tutorials

****************
hipFORT examples
****************

Use the following examples to express Fortran 2003 (`f2003`) interfaces:

**Example 1**


.. code-block::

    use iso_c_binding
    use hipfort
    integer        :: ierr        ! error code
    real, target   :: a_h(5,6)    ! host array ('target' is required by c_loc)
    type(c_ptr)    :: a_d         ! device array pointer
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

   ``hipMalloc`` is also overloaded with ``source`` and ``mold`` arguments, similar to
   the ``ALLOCATE`` intrinsic. Unlike the array interfaces of the math libraries, the
   ``hipMalloc`` and ``hipMemcpy`` overloads are not guarded by
   ``USE_FPOINTER_INTERFACES``, so they are available in every hipFORT build.
   For example:

.. code-block::

        integer     :: ierr        ! error code
        real        :: a_h(5,6)    ! host array
        real,pointer :: a_d(:,:)   ! device array pointer
        !
        ierr = hipMalloc(a_d,source=a_h)       ! take shape (incl. bounds) of a_h and perform a blocking copy to device

In addition to ``source``, there is also ``dsource``, which is used if the source is a device array.

Library examples
================

Complete, runnable programs are available for the HIP runtime and the ROCm math
libraries:

* :doc:`HIP runtime examples <./hip-examples>`
* :doc:`rocFFT examples <./rocfft-examples>`
* :doc:`rocSOLVER examples <./rocsolver-examples>`
* :doc:`rocSPARSE examples <./rocsparse-examples>`

The ``hip*`` libraries offer the same functionality through APIs that follow
their NVIDIA counterparts:

* :doc:`hipFFT examples <./hipfft-examples>`
* :doc:`hipSOLVER examples <./hipsolver-examples>`
* :doc:`hipSPARSE examples <./hipsparse-examples>`

hipFFTW instead exposes an FFTW3-compatible API:

* :doc:`hipFFTW examples <./hipfftw-examples>`
