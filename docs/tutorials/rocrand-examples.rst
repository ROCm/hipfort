.. meta::
  :description: rocRAND examples written with the hipFORT Fortran interfaces
  :keywords: hipFORT, ROCm, rocRAND, random, Fortran, examples, tutorials

****************
rocRAND examples
****************

`rocRAND <https://rocm.docs.amd.com/projects/rocRAND/en/latest/>`_ generates
pseudo-random and quasi-random numbers directly into device memory on AMD
GPUs. hipFORT exposes it through the ``rocrand`` module, which carries
the generator enumerations (``ROCRAND_RNG_PSEUDO_PHILOX4_32_10`` and so on)
as well.

Every program on this page is a complete, self-contained example that is built
and run as part of the hipFORT test suite. The Fortran 2008 version of each
program lives in ``test/f2008/rocrand``, and the equivalent Fortran 2003
version, which uses ``type(c_ptr)`` device pointers and explicit byte counts
instead of Fortran array pointers, lives in ``test/f2003/rocrand``.

hipRAND offers the same functionality through an API that follows cuRAND; see
the :doc:`hipRAND examples <hiprand-examples>`.

The page is organized by generator, because that is the one choice a program
makes up front. Each section shows one worked example and names the sibling
programs that pair the same generator with the other distributions.

rocRAND call pattern
====================

A rocRAND program always follows the same sequence:

#. Create a generator with ``rocrand_create_generator``, passing the
   enumerator that selects the algorithm.
#. Configure it: pseudo-random generators take a seed via
   ``rocrand_set_seed``, while quasi-random generators take a dimension count
   via ``rocrand_set_quasi_random_generator_dimensions``.
#. Allocate a device buffer to receive the numbers.
#. Call the ``rocrand_generate_*`` routine for the distribution you want.
#. Call ``hipDeviceSynchronize`` before reading the results.
#. Copy the buffer back to the host.
#. Free the device memory and release the generator with
   ``rocrand_destroy_generator``.

Keep the following conventions in mind:

* The programs generate **directly into device memory**. The C-binding
  overload takes ``type(c_ptr)``, and the programs call it explicitly with
  ``c_loc(dx(1))`` so the same source compiles whether or not the Fortran
  2008 array overloads are enabled. (rocRAND also provides host generators via
  ``rocrand_create_generator_host``, which are not covered here.)
* The count argument is the number of *elements*, typed
  ``integer(c_size_t)``, not a byte count.
* A fixed seed makes a pseudo-random sequence reproducible, which is what lets
  these programs assert on sample statistics.
* Every rocRAND call returns a status code. The examples wrap them in
  ``rocrandCheck`` from the ``rocrand`` module, which aborts on failure.

Building an example
===================

The examples only need the ``rocrand`` and ``hip`` hipFORT components:

.. code-block:: cmake

   find_package(hipfort REQUIRED COMPONENTS hip rocrand)

   add_executable(my_rand philox_uniform.f08)
   target_link_libraries(my_rand PRIVATE hipfort::rocrand hipfort::hip)

See :doc:`../how-to/using-hipfort` for the full set of build options.

Output distributions
====================

Every generator on this page supports the same four combinations, which differ
only in the routine called and the type of the output buffer:

* ``rocrand_generate_uniform`` fills the buffer with ``real(c_float)`` values
  distributed uniformly over ``(0, 1]``, so a correct sample has a mean near
  0.5. ``rocrand_generate_uniform_double`` is the ``real(c_double)`` form.
* ``rocrand_generate_normal`` takes a mean and a standard deviation in
  addition to the buffer and count, and ``rocrand_generate_normal_double`` is
  its double-precision form.

Two further distributions, Poisson and log-normal, are exercised only with the
Philox generator and are covered in their own section at the end of the page.

Pseudo-random generators
========================

The four pseudo-random generators are interchangeable in these programs: each
is created with its own enumerator, seeded with ``rocrand_set_seed``, and then
used identically.

XORWOW
------

``ROCRAND_RNG_PSEUDO_XORWOW`` selects the xorshift-based XORWOW generator.
This example generates uniform single-precision values and checks the sample
mean.

.. literalinclude:: ../../test/f2008/rocrand/xorwow_uniform.f08
   :language: fortran

``test/f2008/rocrand/xorwow_uniform_double.f08``, ``xorwow_normal.f08`` and
``xorwow_normal_double.f08`` cover the remaining distributions.

Philox
------

``ROCRAND_RNG_PSEUDO_PHILOX4_32_10`` selects the counter-based Philox
generator. This example uses the normal distribution, so it also shows the
extra ``mean`` and ``stddev`` arguments; it checks both the sample mean and
the sample standard deviation, since a generator producing the right mean with
the wrong spread would otherwise pass.

.. literalinclude:: ../../test/f2008/rocrand/philox_normal.f08
   :language: fortran

``test/f2008/rocrand/philox_uniform.f08``,
``philox_uniform_double.f08`` and ``philox_normal_double.f08`` cover the
remaining distributions. Philox is also the generator used for the Poisson and
log-normal programs below.

MRG32K3A
--------

``ROCRAND_RNG_PSEUDO_MRG32K3A`` selects the combined multiple-recursive
generator.

.. literalinclude:: ../../test/f2008/rocrand/mrg32k3a_uniform.f08
   :language: fortran

``test/f2008/rocrand/mrg32k3a_uniform_double.f08``, ``mrg32k3a_normal.f08``
and ``mrg32k3a_normal_double.f08`` cover the remaining distributions.

MTGP32
------

``ROCRAND_RNG_PSEUDO_MTGP32`` selects the Mersenne Twister for graphics
processors. This example uses the normal distribution.

.. literalinclude:: ../../test/f2008/rocrand/mtgp32_normal.f08
   :language: fortran

``test/f2008/rocrand/mtgp32_uniform.f08``, ``mtgp32_uniform_double.f08`` and
``mtgp32_normal_double.f08`` cover the remaining distributions.

Quasi-random generators
=======================

Sobol32
-------

``ROCRAND_RNG_QUASI_SOBOL32`` produces a low-discrepancy sequence, which fills
the sample space more evenly than a pseudo-random stream. It is configured
with a dimension count instead of a seed, so
``rocrand_set_quasi_random_generator_dimensions`` replaces the
``rocrand_set_seed`` call; everything else is unchanged.

.. literalinclude:: ../../test/f2008/rocrand/sobol32_uniform.f08
   :language: fortran

``test/f2008/rocrand/sobol32_uniform_double.f08``, ``sobol32_normal.f08`` and
``sobol32_normal_double.f08`` cover the remaining distributions.

Poisson and log-normal distributions
====================================

These two distributions are exercised with the Philox generator only, so that
a failure points at the distribution entry point rather than at the generator.

Poisson
-------

``rocrand_generate_poisson`` draws from a Poisson distribution with parameter
``lambda``. Unlike the other distributions it produces **unsigned 32-bit
integers** rather than floating-point values, so the host and device buffers
are ``integer(c_int)`` while ``lambda`` remains ``real(c_double)``. A Poisson
distribution has mean ``lambda``, which is what the program checks.

.. literalinclude:: ../../test/f2008/rocrand/philox_poisson.f08
   :language: fortran

This is the only Poisson program in the test suite.

Log-normal
----------

``rocrand_generate_log_normal`` produces values whose logarithm is normally
distributed with the given mean and standard deviation. Every sample is
therefore strictly positive, and the program verifies the distribution by
taking logs and checking the resulting mean and standard deviation.

.. literalinclude:: ../../test/f2008/rocrand/philox_log_normal.f08
   :language: fortran

``rocrand_generate_log_normal_double`` is the double-precision form; see
``test/f2008/rocrand/philox_log_normal_double.f08``.
