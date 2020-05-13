
cmake_minimum_required(VERSION 2.8 FATAL_ERROR)
if ("${CMAKE_SOURCE_DIR}" STREQUAL "${CMAKE_CURRENT_SOURCE_DIR}")
  project(hipfort-tools)
endif()

# ensure mymcpu utility and Makefile.hipfort are available in build directory 
add_custom_command( OUTPUT bindir
   COMMAND /bin/mkdir -p ${CMAKE_CURRENT_BINARY_DIR}/../bin
   DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/gputable.txt)
add_custom_command( OUTPUT gputable.txt
   COMMAND /bin/cp -p ${CMAKE_CURRENT_SOURCE_DIR}/gputable.txt ${CMAKE_CURRENT_BINARY_DIR}/../bin/gputable.txt
   DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/gputable.txt)
add_custom_command( OUTPUT myarchgpu
   COMMAND /bin/cp -p ${CMAKE_CURRENT_SOURCE_DIR}/myarchgpu ${CMAKE_CURRENT_BINARY_DIR}/../bin/myarchgpu
   DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/myarchgpu)
add_custom_command( OUTPUT Makefile.hipfort
   COMMAND /bin/cp -p ${CMAKE_CURRENT_SOURCE_DIR}/Makefile.hipfort ${CMAKE_CURRENT_BINARY_DIR}/../bin/Makefile.hipfort
   DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/Makefile.hipfort)
add_custom_target(util_scripts ALL DEPENDS bindir gputable.txt myarchgpu Makefile.hipfort)

install(PROGRAMS
   ${CMAKE_CURRENT_SOURCE_DIR}/gputable.txt
   ${CMAKE_CURRENT_SOURCE_DIR}/mymcpu
   ${CMAKE_CURRENT_SOURCE_DIR}/mygpu
   ${CMAKE_CURRENT_SOURCE_DIR}/myarchgpu
   ${CMAKE_CURRENT_SOURCE_DIR}/Makefile.hipfort 
   DESTINATION bin
)

