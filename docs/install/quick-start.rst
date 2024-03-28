.. meta::
  :description: Install rocDecode
  :keywords: install, rocDecode, AMD, ROCm


Installation
*********************************


Prerequisites
===============

* gfortran version 7.5.0 or newer

Building and testing hipfort from source
==========================================

1. Install `gfortran`, `git`, `cmake`, and HIP, if not yet installed. 
2. Build, install, and test hipFORTfrom source with the commands below:

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

