# Regression test for SWDEV-427498, carried over to the per-library packages.
#
# find_package(<lib>-fortran) must work from the install prefix (e.g.
# -DCMAKE_PREFIX_PATH=/opt/rocm). The artifacts are compiler-specific, so the
# real package files live under lib/fortran/<compiler>/cmake/<lib>-fortran and a
# shim at lib/cmake/<lib>-fortran forwards to the subdirectory matching the
# consumer's Fortran compiler. That indirection is exactly what this checks: it
# is what breaks first if the per-compiler layout and the shim disagree.
#
# Invoked via `cmake -P` with:
#   -DHIPFORT_BUILD_DIR=<hipfort build tree>
#   -DCONSUMER_SRC=<test/find_package>
#   -DWORK_DIR=<scratch dir>
#   -DFORTRAN_COMPILER=<Fortran compiler>
#
# It installs the bindings from the build tree into WORK_DIR/install, then
# configures the consumer against that prefix. Any nonzero exit fails the test.

file(REMOVE_RECURSE "${WORK_DIR}")
set(_prefix "${WORK_DIR}/install")

execute_process(
  COMMAND "${CMAKE_COMMAND}" --install "${HIPFORT_BUILD_DIR}" --prefix "${_prefix}"
  RESULT_VARIABLE _rc OUTPUT_VARIABLE _log ERROR_VARIABLE _log)
if(NOT _rc EQUAL 0)
  message(FATAL_ERROR "cmake --install failed (${_rc}):\n${_log}")
endif()

# hip is the binding every program needs, so it is the one worth asserting on:
# a prefix without it is not usable whatever else installed correctly.
if(NOT EXISTS "${_prefix}/lib/cmake/hip-fortran/hip-fortran-config.cmake")
  message(FATAL_ERROR
    "no hip-fortran-config.cmake at ${_prefix}/lib/cmake/hip-fortran "
    "(find_package(hip-fortran) would not discover it from the install prefix).")
endif()

# ROCm goes on the prefix path alongside the install: hip-fortran's config
# find_dependency()s hip, so resolving the binding means resolving the C library
# behind it too. The whole -D must stay one quoted argument, so that the ";"
# reaches the child as a literal and is read there as a two-element list;
# unquoted it would split into two arguments to execute_process, and escaped
# ("\;") it would arrive as a single path with a backslash in it.
execute_process(
  COMMAND "${CMAKE_COMMAND}"
          -S "${CONSUMER_SRC}" -B "${WORK_DIR}/consumer"
          -DCMAKE_Fortran_COMPILER=${FORTRAN_COMPILER}
          "-DCMAKE_PREFIX_PATH=${_prefix};${ROCM_PATH}"
  RESULT_VARIABLE _rc OUTPUT_VARIABLE _log ERROR_VARIABLE _log)
message(STATUS "${_log}")
if(NOT _rc EQUAL 0)
  message(FATAL_ERROR "find_package(hip-fortran) from the install prefix failed (${_rc}):\n${_log}")
endif()
message(STATUS "find_package(hip-fortran) from the install prefix: OK")
