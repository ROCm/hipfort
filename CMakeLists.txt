CMAKE_MINIMUM_REQUIRED(VERSION 3.5)
PROJECT(hipfort VERSION 0.5 LANGUAGES Fortran C CXX) # hip-config.cmake requires CXX enabled

#Setting Default value for libdir
set(CMAKE_INSTALL_LIBDIR "lib" CACHE STRING "Library install directory")

#include definitions for GNU install dir cmake flags.
include(GNUInstallDirs)

# THESE ARE ABSOLUTE JUNK AND TOTALLY BREAK CMAKE
# Default compiler gfortran, otherwise cmake Fortran package will set it to f95
# You can override the compiler with cmake -DHIPFORT_COMPILER=
set(HIPFORT_COMPILER ${CMAKE_Fortran_COMPILER_INIT} CACHE STRING "Fortran Compiler to build HIPFORT")
set(HIPFORT_AR ${CMAKE_AR} CACHE STRING "Static archive command")
set(HIPFORT_RANLIB ${CMAKE_RANLIB} CACHE STRING "ranlib used to create Static archive")
set(HIPFORT_COMPILER_FLAGS ${CMAKE_Fortran_FLAGS_INIT} CACHE STRING "Compiler flags to build HIPFORT")
set(HIPFORT_BUILD_TYPE ${CMAKE_BUILD_TYPE}  CACHE STRING "Set to RELEASE TESTING or DEBUG")
set(HIPFORT_VERSION ${hipfort_VERSION}  CACHE STRING "Version of HIPFORT to build")

#  The ROCm release manager and other integrators should build hipfort as follows:
#     cmake -DHIPFORT_INSTALL_DIR=/opt/rocm-<release>/hipfort -DHIPFORT_VERSION=<release> <githubrepo>

set(HIPFORT_INSTALL_DIR  "/usr/local/hipfort-${HIPFORT_VERSION}" CACHE STRING "Install directory for hipfort")
IF(CMAKE_INSTALL_PREFIX)
  # Make HIPFORT_INSTALL_DIR be the same as CmAKE_INSTALL_PREFIX
  set(HIPFORT_INSTALL_DIR ${CMAKE_INSTALL_PREFIX})
ELSE()
  # Make CMAKE_INSTALL_PREFIX be the same as HIPFORT_INSTALL_PREFIX
  set(CMAKE_INSTALL_PREFIX ${HIPFORT_INSTALL_DIR})
ENDIF()
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
set(CMAKE_Fortran_FORMAT FREE)

#SET(CMAKE_BUILD_TYPE ${HIPFORT_BUILD_TYPE})
#SET(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/Modules/")
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/Modules")
#SET(CMAKE_AR ${HIPFORT_AR})
#SET(CMAKE_RANLIB ${HIPFORT_RANLIB})
#SET(CMAKE_INSTALL_PREFIX ${HIPFORT_INSTALL_DIR})
message("-- CMAKE_INSTALL_PREFIX:${CMAKE_INSTALL_PREFIX}")

INCLUDE(FortranCInterface)
FortranCInterface_VERIFY()
IF(NOT FortranCInterface_VERIFIED_C)
  MESSAGE(FATAL_ERROR "Fortran compiler must support C Interface")
ENDIF(NOT FortranCInterface_VERIFIED_C)
	
IF(NOT CMAKE_Fortran_COMPILER_SUPPORTS_F90)
  MESSAGE(FATAL_ERROR "Fortran compiler does not support F90")
ENDIF(NOT CMAKE_Fortran_COMPILER_SUPPORTS_F90)

# Test for Fortran 08 support by using an f08-specific construct.
IF(NOT DEFINED CMAKE_Fortran_COMPILER_SUPPORTS_F08)
  MESSAGE(CHECK_START "Checking whether ${CMAKE_Fortran_COMPILER} supports Fortran 08")
  FILE(WRITE ${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/CMakeTmp/testFortranCompilerF08.f90 "
    module mod
      interface foo
        module procedure :: foo_a,foo_b
      end interface
    contains
      subroutine foo_a(a)
        use iso_c_binding
        integer,target,dimension(:) :: a
        type(c_ptr) :: a_ptr
        a_ptr = c_loc(a) ! gfortran < 4.9 fails here
      end
      subroutine foo_b(b)
        integer,pointer,dimension(:,:) :: b
      end
    end
    PROGRAM TESTFortran08
      use mod
      implicit none
      integer :: a(5)
      integer,allocatable :: b(:)
      allocate(b,mold=a)
      deallocate(b)
    END PROGRAM TESTFortran08
")
  TRY_COMPILE(CMAKE_Fortran_COMPILER_SUPPORTS_F08 ${CMAKE_BINARY_DIR}
    ${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/CMakeTmp/testFortranCompilerF08.f90
    OUTPUT_VARIABLE OUTPUT)
  IF(CMAKE_Fortran_COMPILER_SUPPORTS_F08)
    MESSAGE(CHECK_PASS "yes")
    file(APPEND ${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/CMakeOutput.log
      "Determining if the Fortran compiler supports Fortran 08 passed with "
      "the following output:\n${OUTPUT}\n\n")
    set(CMAKE_Fortran_COMPILER_SUPPORTS_F08 1)
  ELSE(CMAKE_Fortran_COMPILER_SUPPORTS_F08)
    MESSAGE(CHECK_FAIL "no")
    file(APPEND ${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/CMakeError.log
      "Determining if the Fortran compiler supports Fortran 08 failed with "
      "the following output:\n${OUTPUT}\n\n")
    set(CMAKE_Fortran_COMPILER_SUPPORTS_F08 0)
  ENDIF(CMAKE_Fortran_COMPILER_SUPPORTS_F08)
  unset(CMAKE_Fortran_COMPILER_SUPPORTS_F08 CACHE)
ENDIF(NOT DEFINED CMAKE_Fortran_COMPILER_SUPPORTS_F08)

#OPTION(USE_MPI "Use the MPI library for parallelization" OFF)
#OPTION(USE_OPENMP "Use OpenMP for parallelization" OFF)

IF(CMAKE_Fortran_COMPILER_ID MATCHES "(Cray|LLVMFlang)")
  set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} ${HIPFORT_COMPILER_FLAGS}")
ELSE(CMAKE_Fortran_COMPILER_ID MATCHES "(Cray|LLVMFlang)")
IF(CMAKE_Fortran_COMPILER_SUPPORTS_F08)
  set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} ${HIPFORT_COMPILER_FLAGS} -std=f2008")
ELSE(CMAKE_Fortran_COMPILER_SUPPORTS_F08)
  set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} ${HIPFORT_COMPILER_FLAGS} -std=f2003")
ENDIF(CMAKE_Fortran_COMPILER_SUPPORTS_F08)
ENDIF(CMAKE_Fortran_COMPILER_ID MATCHES "(Cray|LLVMFlang)")
 
# Set compile flags for DEBUG, # RELEASE, or TESTING.  
INCLUDE(${CMAKE_MODULE_PATH}/SetFortranFlags.cmake) 
message("-- Done setting FortranFlags")

# There is an error in CMAKE with this flag for pgf90.  Unset it
GET_FILENAME_COMPONENT(FCNAME ${CMAKE_Fortran_COMPILER} NAME)
IF(FCNAME STREQUAL "pgf90")
    UNSET(CMAKE_SHARED_LIBRARY_LINK_Fortran_FLAGS)
ENDIF(FCNAME STREQUAL "pgf90")

option(BUILD_TESTING "Build tests" OFF)
if(BUILD_TESTING)
  enable_testing()
endif()

# Subdirectories and packaging
# NOTE: rocm-cmake must be be included before
# adding subdirectories.
INCLUDE(${CMAKE_MODULE_PATH}/rocm-cmake.cmake)
rocm_setup_version(VERSION ${VERSION})
ADD_SUBDIRECTORY(${CMAKE_SOURCE_DIR}/lib)
ADD_SUBDIRECTORY(${CMAKE_SOURCE_DIR}/test)
ADD_SUBDIRECTORY(${CMAKE_SOURCE_DIR}/bin)

set(CPACK_DEBIAN_PACKAGE_DEPENDS "hip-runtime-amd (>= 4.5.0)")
set(CPACK_RPM_PACKAGE_REQUIRES "hip-runtime-amd >= 4.5.0")
# Package name changed from hipfort to hipfort-devel/dev
# Backward compatibility support for old package name
set(CPACK_DEBIAN_PACKAGE_PROVIDES "hipfort")
set(CPACK_DEBIAN_PACKAGE_REPLACES "hipfort")
set(CPACK_DEBIAN_PACKAGE_CONFLICTS "hipfort")
set(CPACK_RPM_PACKAGE_PROVIDES "hipfort")
set(CPACK_RPM_PACKAGE_OBSOLETES "hipfort")

set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/LICENSE")
if(NOT CPACK_PACKAGING_INSTALL_PREFIX)
  set(CPACK_PACKAGING_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")
endif()

set(CPACK_RPM_EXCLUDE_FROM_AUTO_FILELIST_ADDITION "\${CPACK_PACKAGING_INSTALL_PREFIX}")
# Prevent rpmbuild from stripping binaries, which caused issues on CentOS
set(CPACK_RPM_SPEC_INSTALL_POST "/bin/true")

rocm_create_package(
  NAME hipfort
  DESCRIPTION "Fortran Interface For GPU Kernel Libraries"
  MAINTAINER "Hipfort maintainer <hipfort-maintainer@amd.com>"
  HEADER_ONLY # Enabled For generating Only -devel pkg.
)

message("-- HIPFORT -------------  cmake DONE --------------------")
