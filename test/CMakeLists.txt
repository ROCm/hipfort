

cmake_minimum_required(VERSION 2.8 FATAL_ERROR)
if ("${CMAKE_SOURCE_DIR}" STREQUAL "${CMAKE_CURRENT_SOURCE_DIR}")
  project(test-hipfort)
endif()

file(GLOB HIPFORT_VECADD_FILES "${CMAKE_CURRENT_SOURCE_DIR}/vecadd/*")
file(GLOB HIPFORT_HIPBLAS_FILES "${CMAKE_CURRENT_SOURCE_DIR}/hipblas/*")
file(GLOB HIPFORT_FFT_FILES "${CMAKE_CURRENT_SOURCE_DIR}/fft/*")
file(GLOB HIPFORT_ROCBLAS_FILES "${CMAKE_CURRENT_SOURCE_DIR}/rocblas/*")

add_custom_command(
   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/vecadd
   COMMAND HIPFORT_HOME=${CMAKE_BINARY_DIR} make -C ${CMAKE_CURRENT_SOURCE_DIR}/vecadd
   WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR} 
   DEPENDS ${HIPFORT_VECADD_FILES}
)
add_custom_command(
   OUTPUT  hipblas-phantom-vecadd-file
   COMMAND echo --- Running vecadd test
   COMMAND ./vecadd
   DEPENDS 
      ${CMAKE_CURRENT_BINARY_DIR}/vecadd util_scripts
)
add_custom_target(run-vecadd
  DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/hipblas-phantom-vecadd-file util_scripts
)

add_custom_command(
   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/rocfft
   COMMAND HIPFORT_HOME=${CMAKE_BINARY_DIR} make -C ${CMAKE_CURRENT_SOURCE_DIR}/fft
   WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR} 
   DEPENDS ${HIPFORT_FFT_FILES}
)
add_custom_command(
   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/dgemm ${CMAKE_CURRENT_BINARY_DIR}/dscal ${CMAKE_CURRENT_BINARY_DIR}/dger
   COMMAND HIPFORT_HOME=${CMAKE_BINARY_DIR} make -C ${CMAKE_CURRENT_SOURCE_DIR}/hipblas
   WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR} 
   DEPENDS ${HIPFORT_HIPBLAS_FILES}
)
add_custom_command(
   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/saxpy
   COMMAND HIPFORT_HOME=${CMAKE_BINARY_DIR} make -C ${CMAKE_CURRENT_SOURCE_DIR}/rocblas
   WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
   DEPENDS ${HIPFORT_ROCBLAS_FILES}
)

add_custom_command(
   OUTPUT  hipblas-phantom-build-file
   COMMAND echo --- DONE Building all tests
   DEPENDS 
      ${CMAKE_CURRENT_BINARY_DIR}/vecadd
      ${CMAKE_CURRENT_BINARY_DIR}/dscal
      ${CMAKE_CURRENT_BINARY_DIR}/dger
      ${CMAKE_CURRENT_BINARY_DIR}/dgemm
      ${CMAKE_CURRENT_BINARY_DIR}/saxpy
      ${CMAKE_CURRENT_BINARY_DIR}/rocfft
)
add_custom_command(
   OUTPUT  hipblas-phantom-run-file
   COMMAND echo --- Running vecadd
   COMMAND ./vecadd
   COMMAND echo --- Running dscal
   COMMAND ./dscal
   COMMAND echo --- Running dgemm
   COMMAND ./dgemm
   COMMAND echo --- Running dger
   COMMAND ./dger
   COMMAND echo --- Running saxpy
   COMMAND ./saxpy
   COMMAND echo --- Running rocfft
   COMMAND ./rocfft
   DEPENDS 
      ${CMAKE_CURRENT_BINARY_DIR}/vecadd
      ${CMAKE_CURRENT_BINARY_DIR}/dscal
      ${CMAKE_CURRENT_BINARY_DIR}/dger
      ${CMAKE_CURRENT_BINARY_DIR}/dgemm
      ${CMAKE_CURRENT_BINARY_DIR}/saxpy
      ${CMAKE_CURRENT_BINARY_DIR}/rocfft
)
add_custom_target(build-test
  DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/hipblas-phantom-build-file
)
add_custom_target(run-test
  DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/hipblas-phantom-run-file
)
