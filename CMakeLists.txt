cmake_minimum_required(VERSION 3.18..4.0 FATAL_ERROR)

if(DEFINED HIPFORT_COMPILER)
  message(DEPRECATION "HIPFORT_COMPILER is deprecated. Use CMAKE_Fortran_COMPILER instead.")
  set(CMAKE_Fortran_COMPILER "${HIPFORT_COMPILER}" CACHE STRING "Fortran compiler")
endif()

if(DEFINED HIPFORT_AR)
  message(DEPRECATION "HIPFORT_AR is deprecated. Use CMAKE_AR instead.")
  set(CMAKE_AR "${HIPFORT_AR}" CACHE STRING "Archiving tool for static libraries")
endif()

if(DEFINED HIPFORT_RANLIB)
  message(DEPRECATION "HIPFORT_RANLIB is deprecated. Use CMAKE_RANLIB instead.")
  set(CMAKE_RANLIB "${HIPFORT_RANLIB}" CACHE STRING "Randomizing tool for static libraries")
endif()

if(DEFINED HIPFORT_COMPILER_FLAGS)
  message(DEPRECATION "HIPFORT_COMPILER_FLAGS is deprecated. Use CMAKE_Fortran_FLAGS instead.")
  set(CMAKE_Fortran_FLAGS "${HIPFORT_COMPILER_FLAGS}" CACHE STRING "Flags for the Fortran compiler and linker")
endif()

if(DEFINED HIPFORT_BUILD_TYPE)
  message(DEPRECATION "HIPFORT_BUILD_TYPE is deprecated. Use CMAKE_BUILD_TYPE instead.")
  set(CMAKE_BUILD_TYPE "${HIPFORT_BUILD_TYPE}" CACHE STRING "Build type to generate")
endif()

if(DEFINED HIPFORT_INSTALL_DIR)
  message(DEPRECATION "HIPFORT_INSTALL_DIR is deprecated. Use CMAKE_INSTALL_PREFIX instead.")
  set(CMAKE_INSTALL_PREFIX "${HIPFORT_INSTALL_DIR}" CACHE STRING "Install directory")
endif()

# hipfort itself is pure Fortran. C is enabled because hip-config.cmake pulls in FindThreads.
PROJECT(hipfort VERSION 0.9.0 LANGUAGES Fortran C)

# get compiler name
get_filename_component(FCNAME ${CMAKE_Fortran_COMPILER} NAME)

# HIPFORT_MULTITOOLCHAIN_LAYOUT is gone: the per-compiler layout is now
# unconditional, and it is each binding's own business rather than a global
# install prefix. rocm_add_fortran_binding() puts the .mod in
# include/fortran/<compiler>/ and the .a in lib/fortran/<compiler>/, where
# <compiler> is the name you would type (amdflang, gfortran, ftn, ...) rather
# than the CMake compiler ID. There is nothing left to opt out of, because a
# .mod written by one compiler cannot be read by another.
if(DEFINED HIPFORT_MULTITOOLCHAIN_LAYOUT)
  message(WARNING
    "HIPFORT_MULTITOOLCHAIN_LAYOUT is gone; the per-compiler install layout is "
    "unconditional. See docs/how-to/migration-guide.rst, 'Where the files install'.")
endif()

include(GNUInstallDirs)

# ROCm root, resolved once for every find_package/find_program below.
# Precedence: -DROCM_PATH > $ROCM_PATH > hipcc on PATH > /opt/rocm.
if(NOT DEFINED ROCM_PATH)
  if(DEFINED ENV{ROCM_PATH})
    set(_rocm_path "$ENV{ROCM_PATH}")
  else()
    find_program(HIPFORT_HIPCC_EXECUTABLE NAMES hipcc hipconfig)
    mark_as_advanced(HIPFORT_HIPCC_EXECUTABLE)
    if(HIPFORT_HIPCC_EXECUTABLE)
      # REALPATH first: distros symlink hipcc into /usr/bin, whose parent is not ROCm.
      get_filename_component(_rocm_path "${HIPFORT_HIPCC_EXECUTABLE}" REALPATH)
      get_filename_component(_rocm_path "${_rocm_path}" DIRECTORY)
      get_filename_component(_rocm_path "${_rocm_path}" DIRECTORY)
    else()
      set(_rocm_path "/opt/rocm")
    endif()
  endif()
  set(ROCM_PATH "${_rocm_path}" CACHE PATH "ROCm installation root")
  unset(_rocm_path)
endif()

message("-- HIPFORT -------------  cmake START -------------------")
message("-- Fortran Compiler:       ${CMAKE_Fortran_COMPILER}")
message("-- Build Type:             ${CMAKE_BUILD_TYPE}")
message("-- Installation Directory: ${CMAKE_INSTALL_PREFIX}")
message("-- ROCm Path:              ${ROCM_PATH}")
message("-- hipfort Version:        ${hipfort_VERSION}")
message("-- HIPFORT ----------------------------------------------")

set(CMAKE_Fortran_FORMAT FREE)
set(CMAKE_Fortran_PREPROCESS ON)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/Modules")

INCLUDE(FortranCInterface)
FortranCInterface_VERIFY()
IF(NOT FortranCInterface_VERIFIED_C)
  MESSAGE(FATAL_ERROR "Fortran compiler must support C Interface")
ENDIF(NOT FortranCInterface_VERIFIED_C)
	
IF(NOT CMAKE_Fortran_COMPILER_SUPPORTS_F90)
  MESSAGE(FATAL_ERROR "Fortran compiler does not support F90")
ENDIF(NOT CMAKE_Fortran_COMPILER_SUPPORTS_F90)

# The Fortran 2008 / 2018 probes that decide which array interface tier
# FORTRAN_ARRAY_INTERFACES can actually reach. They live in the binding helper
# rather than here, because a standalone <lib>/fortran build needs them just as
# much and there is no hipfort top level in that case. Results are cached, so
# this runs the probes once and the subdirectories reuse them.
# NB: CMAKE_MODULE_PATH is appended to exactly once, above. Several INCLUDE()s
# below interpolate it as a single directory (${CMAKE_MODULE_PATH}/x.cmake), so
# a second entry would turn it into a ";"-joined list and break them.
include(ROCmFortranBinding)
rocm_fortran_probe_standards()

# Set compile flags for DEBUG, RELEASE, or TESTING.
INCLUDE(${CMAKE_MODULE_PATH}/SetFortranFlags.cmake) 
message("-- Done setting FortranFlags")
message("-- CMAKE_Fortran_FLAGS_DEBUG:   ${CMAKE_Fortran_FLAGS_DEBUG}")
message("-- CMAKE_Fortran_FLAGS_RELEASE: ${CMAKE_Fortran_FLAGS_RELEASE}")
message("-- CMAKE_Fortran_FLAGS_TESTING: ${CMAKE_Fortran_FLAGS_TESTING}")

# There is an error in CMAKE with this flag for pgf90.  Unset it
IF(FCNAME STREQUAL "pgf90")
    UNSET(CMAKE_SHARED_LIBRARY_LINK_Fortran_FLAGS)
ENDIF(FCNAME STREQUAL "pgf90")

# BUILD_TESTING becomes BUILD_FORTRAN_TESTS, per library: after the split
# hipFORT's single suite is distributed into each library's fortran/test/, and a
# monorepo build needs a switch that means "the Fortran tests" rather than "all
# tests". BUILD_FORTRAN_TESTS itself is declared by rocm_fortran_binding_options()
# so a standalone <lib>/fortran build has it too.
if(DEFINED BUILD_TESTING AND NOT DEFINED BUILD_FORTRAN_TESTS)
  message(WARNING
    "BUILD_TESTING is replaced by BUILD_FORTRAN_TESTS; honouring it this once. "
    "See the option table in docs/how-to/migration-guide.rst.")
  set(BUILD_FORTRAN_TESTS ${BUILD_TESTING} CACHE BOOL "Build the Fortran bindings' test suite" FORCE)
endif()
rocm_fortran_binding_options()

# The exhaustive per-library symbol tests, on top of the runtime ones. Opt-in:
# they reference every bind(c) routine of a library, so a symbol missing from an
# older or partial ROCm turns into a build error. Handy to audit one ROCm
# version, unhelpful as a default.
#
# The shared-link test that HIPFORT_EXTENDED_TESTS also gated is gone with the
# single archive it linked. Its per-library successor belongs beside each
# binding rather than here, and is not part of this preview.
option(BUILD_FORTRAN_EXTENDED_TESTS "Add the exhaustive per-library Fortran symbol tests (needs a recent, complete ROCm install)" OFF)
if(DEFINED HIPFORT_EXTENDED_TESTS)
  message(WARNING
    "HIPFORT_EXTENDED_TESTS is replaced by BUILD_FORTRAN_EXTENDED_TESTS; "
    "honouring it this once.")
  set(BUILD_FORTRAN_EXTENDED_TESTS ${HIPFORT_EXTENDED_TESTS} CACHE BOOL
    "Add the exhaustive per-library Fortran symbol tests" FORCE)
endif()

if(BUILD_FORTRAN_TESTS OR BUILD_FORTRAN_EXTENDED_TESTS)
  enable_testing()
endif()

# Subdirectories and packaging
# NOTE: rocm-cmake must be included before
# adding subdirectories.
INCLUDE(${CMAKE_MODULE_PATH}/rocm-cmake.cmake)
rocm_setup_version(VERSION ${VERSION})
ADD_SUBDIRECTORY(${CMAKE_SOURCE_DIR}/lib)
ADD_SUBDIRECTORY(${CMAKE_SOURCE_DIR}/test)

set(CPACK_DEBIAN_PACKAGE_DEPENDS "hip-runtime-amd (>= 6.0.0)")
set(CPACK_RPM_PACKAGE_REQUIRES "hip-runtime-amd >= 6.0.0")
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
