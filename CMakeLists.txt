CMAKE_MINIMUM_REQUIRED(VERSION 3.0.2)
# Default compiler gfortran, otherwise cmake Fortran package will set it to f95
# You can override the compiler with cmake -DHIPFORT_COMPILER=
set(HIPFORT_COMPILER "/usr/bin/gfortran" CACHE STRING "Fortran Compiler to build HIPFORT")
set(HIPFORT_AR "/usr/bin/gcc-ar" CACHE STRING "Static archive command")
set(HIPFORT_RANLIB "/usr/bin/gcc-ranlib" CACHE STRING "ranlib used to create Static archive")
set(HIPFORT_COMPILER_FLAGS "-std=f2003 -ffree-form -cpp -ffree-line-length-512" CACHE STRING "Compiler flags to build HIPFORT")
set(HIPFORT_BUILD_TYPE "RELEASE"  CACHE STRING "Set to RELEASE TESTING or DEBUG")
#  These next two values are for  the iniital release of hipfort for ROCm
#  Other integrators and future ROCm releases should build hipfort as follows:
#     cmake -DHIPFORT_INSTALL_DIR=/opt/rocm-<release>/hipfort -DHIPFORT_VERSION=<release> <githubrepo>
set(HIPFORT_INSTALL_DIR  "/opt/rocm-3.8.0/hipfort"  CACHE STRING "Install directory for hipfort")
set(HIPFORT_VERSION  "3.8-0"  CACHE STRING "Version of HIPFORT to build")
message("-- HIPFORT -------------  cmake START -------------------")
message("-- HIPFORT_COMPILER:       ${HIPFORT_COMPILER}")
message("-- HIPFORT_AR:             ${HIPFORT_AR}")
message("-- HIPFORT_RANLIB:         ${HIPFORT_RANLIB}")
message("-- HIPFORT_COMPILER_FLAGS: ${HIPFORT_COMPILER_FLAGS}")
message("-- HIPFORT_BUILD_TYPE:     ${HIPFORT_BUILD_TYPE}")
message("-- HIPFORT_INSTALL_DIR:    ${HIPFORT_INSTALL_DIR}")
message("-- HIPFORT_VERSION:        ${HIPFORT_VERSION}")
message("-- HIPFORT ----------------------------------------------")

set(CMAKE_Fortran_COMPILER_INIT ${HIPFORT_COMPILER})
PROJECT(hipfort Fortran C)

SET(CMAKE_BUILD_TYPE ${HIPFORT_BUILD_TYPE})
SET(VERSION ${HIPFORT_VERSION})
SET(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/Modules/")
SET(CMAKE_AR ${HIPFORT_AR})
SET(CMAKE_RANLIB ${HIPFORT_RANLIB})
SET(CMAKE_INSTALL_PREFIX ${HIPFORT_INSTALL_DIR})
message("-- CMAKE_INSTALL_PREFIX:${CMAKE_INSTALL_PREFIX}")

INCLUDE(FortranCInterface)
FortranCInterface_VERIFY()
IF(NOT FortranCInterface_VERIFIED_C)
	MESSAGE(FATAL_ERROR "Fortran compiler must support C Interface")
ENDIF(NOT FortranCInterface_VERIFIED_C)
	
IF(NOT CMAKE_Fortran_COMPILER_SUPPORTS_F90)
    MESSAGE(FATAL_ERROR "Fortran compiler does not support F90")
ENDIF(NOT CMAKE_Fortran_COMPILER_SUPPORTS_F90)

#OPTION(USE_MPI "Use the MPI library for parallelization" OFF)
#OPTION(USE_OPENMP "Use OpenMP for parallelization" OFF)

# Set compile flags for DEBUG, # RELEASE, or TESTING.  
INCLUDE(${CMAKE_MODULE_PATH}/SetFortranFlags.cmake) 
message("-- Done seFortranFlags")

# There is an error in CMAKE with this flag for pgf90.  Unset it
GET_FILENAME_COMPONENT(FCNAME ${CMAKE_Fortran_COMPILER} NAME)
IF(FCNAME STREQUAL "pgf90")
    UNSET(CMAKE_SHARED_LIBRARY_LINK_Fortran_FLAGS)
ENDIF(FCNAME STREQUAL "pgf90")

ADD_SUBDIRECTORY(${CMAKE_SOURCE_DIR}/lib)
ADD_SUBDIRECTORY(${CMAKE_SOURCE_DIR}/test)
ADD_SUBDIRECTORY(${CMAKE_SOURCE_DIR}/bin)

# Packaging
INCLUDE(${CMAKE_MODULE_PATH}/rocm-cmake.cmake)
rocm_setup_version(VERSION ${VERSION})
set(CPACK_DEBIAN_PACKAGE_DEPENDS "hip-rocclr (>= 3.5.0)")
set(CPACK_RPM_PACKAGE_REQUIRES "hip-rocclr >= 3.5.0")
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/LICENSE")
if(NOT CPACK_PACKAGING_INSTALL_PREFIX)
  set(CPACK_PACKAGING_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")
endif()

set(CPACK_RPM_EXCLUDE_FROM_AUTO_FILELIST_ADDITION "\${CPACK_PACKAGING_INSTALL_PREFIX}" "\${CPACK_PACKAGING_INSTALL_PREFIX}/include" )

rocm_create_package(
  NAME hipfort
  DESCRIPTION "Radeon Open Compute Parallel Primitives Library"
  MAINTAINER "hipfort Maintainer <hipfort-maintainer@amd.com>"
)

message("-- HIPFORT -------------  cmake DONE --------------------")
