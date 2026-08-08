# Regression test for SWDEV-427498: find_package(hipfort) must work from the
# install prefix (e.g. -DCMAKE_PREFIX_PATH=/opt/rocm), including with the
# multitoolchain layout, where the package files live under
# lib/fortran/<compiler>/cmake/hipfort and a shim at lib/cmake/hipfort forwards
# to them.
#
# Invoked via `cmake -P` with:
#   -DHIPFORT_BUILD_DIR=<hipfort build tree>
#   -DCONSUMER_SRC=<test/find_package>
#   -DWORK_DIR=<scratch dir>
#   -DFORTRAN_COMPILER=<Fortran compiler>
#
# It installs hipfort from the build tree into WORK_DIR/install, then configures
# the consumer against that prefix. Any nonzero exit fails the test.

file(REMOVE_RECURSE "${WORK_DIR}")
set(_prefix "${WORK_DIR}/install")

execute_process(
  COMMAND "${CMAKE_COMMAND}" --install "${HIPFORT_BUILD_DIR}" --prefix "${_prefix}"
  RESULT_VARIABLE _rc OUTPUT_VARIABLE _log ERROR_VARIABLE _log)
if(NOT _rc EQUAL 0)
  message(FATAL_ERROR "cmake --install failed (${_rc}):\n${_log}")
endif()

# The config must be reachable from the prefix at the standard lib/cmake/hipfort.
if(NOT EXISTS "${_prefix}/lib/cmake/hipfort/hipfort-config.cmake")
  message(FATAL_ERROR
    "no hipfort-config.cmake at ${_prefix}/lib/cmake/hipfort (find_package would "
    "not discover hipfort from the install prefix).")
endif()

execute_process(
  COMMAND "${CMAKE_COMMAND}"
          -S "${CONSUMER_SRC}" -B "${WORK_DIR}/consumer"
          -DCMAKE_Fortran_COMPILER=${FORTRAN_COMPILER}
          -DCMAKE_PREFIX_PATH=${_prefix}
  RESULT_VARIABLE _rc OUTPUT_VARIABLE _log ERROR_VARIABLE _log)
message(STATUS "${_log}")
if(NOT _rc EQUAL 0)
  message(FATAL_ERROR "find_package(hipfort) from the install prefix failed (${_rc}):\n${_log}")
endif()
message(STATUS "find_package(hipfort) from the install prefix: OK")
