#
# File: test/CMakeLists.txt

# These tests are all Makefile based tests.
# Each test is contained in its own subdirectory of this test directory
# The Makefile must create a binary with the same name as the directory name.
#
# To add a test with the name X
#   1. Create subdirectory X with sources and a Makefile that generates binary X
#   2. Add X to the list of testnames below.
#   3. Add the execution of X to the list of commands below.
#   4. Rebuild hipfort, in the build directory run "make help" you should see
#      new targets X and X-run.
#   5. type "make X-run" to test compile and build of binary X
#
cmake_minimum_required(VERSION 2.8 FATAL_ERROR)
if ("${CMAKE_SOURCE_DIR}" STREQUAL "${CMAKE_CURRENT_SOURCE_DIR}")
  project(test-hipfort)
endif()
set(make_env HIPFORT_HOME=${CMAKE_BINARY_DIR} HIPFORT_COMPILER=${HIPFORT_COMPILER})

set(testnames vecadd rocfft rocsparse rocblas hipblas)
foreach(testname ${testnames})
   file(GLOB HIPFORT_TEST_FILES "${CMAKE_CURRENT_SOURCE_DIR}/${testname}/*")
   add_custom_command(
      OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/${testname}
      COMMAND ${make_env} make -C ${CMAKE_CURRENT_SOURCE_DIR}/${testname}
      WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
      DEPENDS ${HIPFORT_TEST_FILES} util_scripts hipfort-amdgcn hipfort-nvptx)
   add_custom_target(${testname} DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/${testname})
   if(${testname} STREQUAL "hipblas")
      # hipblas has three binaries to test
      add_custom_command(OUTPUT ${testname}-phantom-run
         COMMAND echo --- Running ${testname} test
         COMMAND ./dscal
         COMMAND ./dgemm
         COMMAND ./dger
         DEPENDS ${testname})
   else()
      # All other tests create a binary with the same name as directory name
      add_custom_command(OUTPUT ${testname}-phantom-run
         COMMAND echo --- Running ${testname} test
         COMMAND ./${testname}
         DEPENDS ${testname})
   endif()
   add_custom_target(${testname}-run DEPENDS ${testname}-phantom-run)
endforeach()

add_custom_target(all-tests DEPENDS ${testnames})
add_custom_command(
   OUTPUT  phantom-run-all
   COMMAND echo --- Running vecadd
   COMMAND ./vecadd
   COMMAND echo --- Running dscal
   COMMAND ./dscal
   COMMAND echo --- Running dgemm
   COMMAND ./dgemm
   COMMAND echo --- Running dger
   COMMAND ./dger
   COMMAND echo --- Running rocblas
   COMMAND ./rocblas
   COMMAND echo --- Running rocfft
   COMMAND ./rocfft
   COMMAND echo --- Running rocsparse
   COMMAND ./rocsparse
   DEPENDS all-tests)

add_custom_target(all-tests-run
  DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/phantom-run-all)
