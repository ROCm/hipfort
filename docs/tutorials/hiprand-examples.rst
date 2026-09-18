.. meta::
  :description: hipRAND examples written with the hipFORT Fortran interfaces
  :keywords: hipFORT, ROCm, hipRAND, random, Fortran, examples, tutorials

****************
hipRAND examples
****************

`hipRAND <https://rocm.docs.amd.com/projects/hipRAND/en/latest/>`_ is a thin
layer over rocRAND whose API follows cuRAND. hipFORT exposes it through the
``hipfort_hiprand`` module, together with ``hipfort_hiprand_enums`` for the
generator enumerations (``HIPRAND_RNG_PSEUDO_PHILOX4_32_10`` and so on). The
programs below import both explicitly.

Every program on this page is a complete, self-contained example that is built
and run as part of the hipFORT test suite. The Fortran 2008 sources live in
``test/f2008/hiprand`` and the equivalent Fortran 2003 sources, which use
``type(c_ptr)`` device pointers and explicit byte counts instead of Fortran
array pointers, live in ``test/f2003/hiprand``.

If you want direct access to rocRAND rather than a cuRAND-style interface, see
the :doc:`rocRAND examples <rocrand-examples>`, where the equivalent programs
are written against the ``hipfort_rocrand`` module. The two test suites cover
exactly the same generators and distributions, so the pages differ only in the
names of the entry points:

* ``hiprandCreateGenerator`` and ``hiprandDestroyGenerator`` replace
  ``rocrand_create_generator`` and ``rocrand_destroy_generator``.
* ``hiprandSetPseudoRandomGeneratorSeed`` replaces ``rocrand_set_seed``, and
  ``hiprandSetQuasiRandomGeneratorDimensions`` replaces
  ``rocrand_set_quasi_random_generator_dimensions``.
* ``hiprandGenerateUniform``, ``hiprandGenerateNormal`` and the rest replace
  the ``rocrand_generate_*`` family.
* The generator enumerators are spelled ``HIPRAND_RNG_*`` rather than
  ``ROCRAND_RNG_*``, with the same suffixes.

The page is organised by generator, because that is the one choice a program
makes up front. Each section shows one worked example and names the sibling
programs that pair the same generator with the other distributions.

hipRAND call pattern
====================

A hipRAND program always follows the same sequence:

#. Create a generator with ``hiprandCreateGenerator``, passing the enumerator
   that selects the algorithm.
#. Configure it: pseudo-random generators take a seed via
   ``hiprandSetPseudoRandomGeneratorSeed``, while quasi-random generators take
   a dimension count via ``hiprandSetQuasiRandomGeneratorDimensions``.
#. Allocate a device buffer to receive the numbers.
#. Call the ``hiprandGenerate*`` routine for the distribution you want.
#. Call ``hipDeviceSynchronize`` before reading the results.
#. Copy the buffer back to the host.
#. Free the device memory and release the generator with
   ``hiprandDestroyGenerator``.

Keep the following conventions in mind:

* hipRAND writes **directly into device memory**; there is no host-side
  generation path. The output buffer argument is typed ``type(c_ptr)`` in the
  binding, so the Fortran 2008 programs pass ``c_loc(dx(1))`` rather than the
  array pointer itself.
* The count argument is the number of *elements*, typed
  ``integer(c_size_t)``, not a byte count.
* A fixed seed makes a pseudo-random sequence reproducible, which is what lets
  these programs assert on sample statistics.
* Every hipRAND call returns a status code. The examples wrap them in
  ``hiprandCheck`` from the ``hipfort_check`` module, which aborts on failure.

Building an example
===================

The examples only need the ``hiprand`` and ``hip`` hipFORT components:

.. code-block:: cmake

   find_package(hipfort REQUIRED COMPONENTS hip hiprand)

   add_executable(my_rand philox_uniform.f08)
   target_link_libraries(my_rand PRIVATE hipfort::hiprand hipfort::hip)

See :doc:`../how-to/using-hipfort` for the full set of build options.

Output distributions
====================

Every generator on this page supports the same four combinations, which differ
only in the routine called and the type of the output buffer:

* ``hiprandGenerateUniform`` fills the buffer with ``real(c_float)`` values
  distributed uniformly over ``(0, 1]``, so a correct sample has a mean near
  0.5. ``hiprandGenerateUniformDouble`` is the ``real(c_double)`` form.
* ``hiprandGenerateNormal`` takes a mean and a standard deviation in addition
  to the buffer and count, and ``hiprandGenerateNormalDouble`` is its
  double-precision form.

Two further distributions, Poisson and log-normal, are exercised only with the
Philox generator and are covered in their own section at the end of the page.

Pseudo-random generators
========================

The four pseudo-random generators are interchangeable in these programs: each
is created with its own enumerator, seeded with
``hiprandSetPseudoRandomGeneratorSeed``, and then used identically.

XORWOW
------

``HIPRAND_RNG_PSEUDO_XORWOW`` selects the xorshift-based XORWOW generator.
This example generates uniform single-precision values and checks the sample
mean.

.. literalinclude:: ../../test/f2008/hiprand/xorwow_uniform.f08
   :language: fortran

``test/f2008/hiprand/xorwow_uniform_double.f08``, ``xorwow_normal.f08`` and
``xorwow_normal_double.f08`` cover the remaining distributions.

Philox
------

``HIPRAND_RNG_PSEUDO_PHILOX4_32_10`` selects the counter-based Philox
generator. This example uses the normal distribution, so it also shows the
extra ``mean`` and ``stddev`` arguments; it checks both the sample mean and
the sample standard deviation, since a generator producing the right mean with
the wrong spread would otherwise pass.

.. literalinclude:: ../../test/f2008/hiprand/philox_normal.f08
   :language: fortran

``test/f2008/hiprand/philox_uniform.f08``, ``philox_uniform_double.f08`` and
``philox_normal_double.f08`` cover the remaining distributions. Philox is also
the generator used for the Poisson and log-normal programs below.

MRG32K3A
--------

``HIPRAND_RNG_PSEUDO_MRG32K3A`` selects the combined multiple-recursive
generator.

.. literalinclude:: ../../test/f2008/hiprand/mrg32k3a_uniform.f08
   :language: fortran

``test/f2008/hiprand/mrg32k3a_uniform_double.f08``, ``mrg32k3a_normal.f08``
and ``mrg32k3a_normal_double.f08`` cover the remaining distributions.

MTGP32
------

``HIPRAND_RNG_PSEUDO_MTGP32`` selects the Mersenne Twister for graphics
processors. This example uses the double-precision normal distribution.

.. literalinclude:: ../../test/f2008/hiprand/mtgp32_normal.f08
   :language: fortran

``test/f2008/hiprand/mtgp32_uniform.f08``, ``mtgp32_uniform_double.f08`` and
``mtgp32_normal_double.f08`` cover the remaining distributions.

Quasi-random generators
=======================

Sobol32
-------

``HIPRAND_RNG_QUASI_SOBOL32`` produces a low-discrepancy sequence, which fills
the sample space more evenly than a pseudo-random stream. It is configured
with a dimension count instead of a seed, so
``hiprandSetQuasiRandomGeneratorDimensions`` replaces the
``hiprandSetPseudoRandomGeneratorSeed`` call; everything else is unchanged.

.. literalinclude:: ../../test/f2008/hiprand/sobol32_uniform.f08
   :language: fortran

``test/f2008/hiprand/sobol32_uniform_double.f08``, ``sobol32_normal.f08`` and
``sobol32_normal_double.f08`` cover the remaining distributions.

Poisson and log-normal distributions
====================================

These two distributions are exercised with the Philox generator only, so that
a failure points at the distribution entry point rather than at the generator.

Poisson
-------

``hiprandGeneratePoisson`` draws from a Poisson distribution with parameter
``lambda``. Unlike the other distributions it produces **unsigned 32-bit
integers** rather than floating-point values, so the host and device buffers
are ``integer(c_int)`` while ``lambda`` remains ``real(c_double)``. A Poisson
distribution has mean ``lambda``, which is what the program checks.

.. literalinclude:: ../../test/f2008/hiprand/philox_poisson.f08
   :language: fortran

This is the only Poisson program in the test suite.

Log-normal
----------

``hiprandGenerateLogNormal`` produces values whose logarithm is normally
distributed with the given mean and standard deviation. Every sample is
therefore strictly positive, and the program verifies the distribution by
taking logs and checking the resulting mean and standard deviation.

.. literalinclude:: ../../test/f2008/hiprand/philox_log_normal.f08
   :language: fortran

``hiprandGenerateLogNormalDouble`` is the double-precision form; see
``test/f2008/hiprand/philox_log_normal_double.f08``.
