.. meta::
  :description: Quick start installation guide for hipFORT.
  :keywords: install, hipFORT, AMD, ROCm, quick start


Quick start installation guide
*********************************

This topic discusses how to quickly build hipFORT from source.

Prerequisites
===============

hipFORT requires a Fortran compiler that supports at least the Fortran 2003 standard.
GFortran version 7.5.0 or newer is the primary tested compiler (see the `GFortran website
<https://fortran-lang.org/learn/os_setup/install_gfortran/>`_), and AMD ``amdflang`` (LLVM Flang) is
also supported. Other standard-conforming compilers such as NVIDIA ``nvfortran``, Intel ``ifx``/``ifort``,
and the Cray Fortran compiler (for example on LUMI) are not officially supported, but hipFORT should
build with them too. Please open an issue at https://github.com/ROCm/hipfort/issues if you run into problems.

Building and testing hipFORT from source
==========================================

1. Ensure you have installed ``gfortran``, ``git``, ``cmake``, and :doc:`HIP <hip:index>`.
2. Build, install, and test hipFORT from source using the following commands:

   .. code-block:: shell

      git clone https://github.com/ROCm/hipfort.git
      cd hipfort
      cmake -S. -Bbuild -DCMAKE_INSTALL_PREFIX=/tmp/hipfort -DBUILD_TESTING=ON
      cmake --build build
      cmake --install build
      ctest --test-dir build
