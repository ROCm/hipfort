# Code-coverage support for the hipfort test suite.
#
# Enable with -DHIPFORT_CODE_COVERAGE=ON. This instruments the generated binding
# modules with gcov and adds two targets:
#
#   coverage_cleanup   discard the .gcda counters left by a previous run
#   coverage           run the test suite once, then measure and write a report
#
# The report is written to <build>/lcoverage/index.html, with the raw numbers in
# <build>/lcoverage/variant_coverage.json.
#
# What is measured
# ----------------
# hipfort is generated code, and the only part of it with an instrumentable body
# is the set of Fortran array overloads the generator emits per routine
# (_rank_0, _rank_1, _full_rank). The report counts how many of those wrapper
# bodies actually executed. Tests that call the raw bind(C) interface -- which
# every Fortran 2003 test does, and which is correct usage -- execute no wrapper
# and so do not register, and routines that get no array overloads cannot
# register at all. Read the number as how much of the generator's output is
# live, not as API test coverage. See test/coverage/variant_coverage.py.
#
# Requirements
# ------------
# GNU Fortran, plus a gcov of the same major version (gcov-13 for gfortran 13).
# The tests must run on a GPU: coverage data only exists for code that executed.

option(HIPFORT_CODE_COVERAGE
       "Instrument the bindings with gcov and add the coverage targets (GNU Fortran only)"
       OFF)

if(NOT HIPFORT_CODE_COVERAGE)
  return()
endif()

if(NOT CMAKE_Fortran_COMPILER_ID STREQUAL "GNU")
  message(FATAL_ERROR
          "HIPFORT_CODE_COVERAGE requires GNU Fortran (found "
          "${CMAKE_Fortran_COMPILER_ID}); coverage is collected with gcov.")
endif()

if(NOT BUILD_TESTING)
  message(FATAL_ERROR
          "HIPFORT_CODE_COVERAGE needs the test suite: configure with -DBUILD_TESTING=ON.")
endif()

# Match gcov to the compiler. A mismatched gcov cannot read the .gcno format.
string(REGEX MATCH "^[0-9]+" _hipfort_gcc_major "${CMAKE_Fortran_COMPILER_VERSION}")
find_program(HIPFORT_GCOV_EXECUTABLE
             NAMES "gcov-${_hipfort_gcc_major}" gcov
             DOC "gcov matching the Fortran compiler")
if(NOT HIPFORT_GCOV_EXECUTABLE)
  message(FATAL_ERROR "HIPFORT_CODE_COVERAGE: no gcov found (looked for gcov-${_hipfort_gcc_major}, gcov).")
endif()

find_package(Python3 COMPONENTS Interpreter REQUIRED)

# -O0 keeps each wrapper a distinct body. Optimised builds inline the wrappers
# away and link-time optimisation scatters their counters across translation
# units, which zeroes the measurement.
add_compile_options($<$<COMPILE_LANGUAGE:Fortran>:--coverage>
                    $<$<COMPILE_LANGUAGE:Fortran>:-O0>)
add_link_options(--coverage)

# --as-needed drops the ROCm libraries before the hipfort archive references
# them, so keep every recorded dependency.
add_link_options(-Wl,--no-as-needed)

set(HIPFORT_COVERAGE_SCRIPT "${CMAKE_CURRENT_SOURCE_DIR}/test/coverage/variant_coverage.py")
set(HIPFORT_COVERAGE_DIR "${CMAKE_BINARY_DIR}/lcoverage")

add_custom_target(coverage_cleanup
  COMMAND "${Python3_EXECUTABLE}" "${HIPFORT_COVERAGE_SCRIPT}"
          --build "${CMAKE_BINARY_DIR}" --clean
  COMMENT "Discarding gcov counters from any previous run"
  VERBATIM)

# The script drives the whole sequence (build, discard stale counters, run the
# suite once, measure). It deliberately does not stop on a failing build or test
# target: a routine can be missing from the installed runtime, and the remaining
# tests still produce coverage worth reporting. Build and test correctness is
# gated by the precheckin job, not this one.
add_custom_target(coverage
  COMMAND "${Python3_EXECUTABLE}" "${HIPFORT_COVERAGE_SCRIPT}"
          --build "${CMAKE_BINARY_DIR}"
          --run
          --cmake "${CMAKE_COMMAND}"
          --ctest "${CMAKE_CTEST_COMMAND}"
          --gcov "${HIPFORT_GCOV_EXECUTABLE}"
          --partial
          --html "${HIPFORT_COVERAGE_DIR}/index.html"
          --json "${HIPFORT_COVERAGE_DIR}/variant_coverage.json"
  COMMENT "Running the test suite and measuring variant-execution coverage"
  USES_TERMINAL
  VERBATIM)

message(STATUS "Code coverage enabled: gcov = ${HIPFORT_GCOV_EXECUTABLE}, report = ${HIPFORT_COVERAGE_DIR}/index.html")
