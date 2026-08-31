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
PROJECT(hipfort VERSION 0.8.0 LANGUAGES Fortran C)

# get compiler name
get_filename_component(FCNAME ${CMAKE_Fortran_COMPILER} NAME)

# setup default install directories
option(HIPFORT_MULTITOOLCHAIN_LAYOUT "Install library files to toolchain-specific subdirectories" ON)
if(HIPFORT_MULTITOOLCHAIN_LAYOUT)
  set(FORTRAN_LIBRARY_SUBDIR "fortran/${FCNAME}" CACHE STRING "Compiler-specific library symlink subdirectory")
  set(CMAKE_INSTALL_LIBDIR "lib/${FORTRAN_LIBRARY_SUBDIR}" CACHE STRING "Library install directory")
  set(CMAKE_INSTALL_INCLUDEDIR "include/${FORTRAN_LIBRARY_SUBDIR}" CACHE STRING "Mod files install directory")
else()
  set(CMAKE_INSTALL_LIBDIR "lib" CACHE STRING "Library install directory")
  set(CMAKE_INSTALL_INCLUDEDIR "include" CACHE STRING "Mod files install directory")
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

# Test for Fortran 08 support by using an f08-specific construct.
IF(NOT DEFINED CMAKE_Fortran_COMPILER_SUPPORTS_F08)
  MESSAGE(CHECK_START "Checking whether ${CMAKE_Fortran_COMPILER} supports Fortran 08")
  INCLUDE(CheckFortranSourceCompiles)
  CHECK_FORTRAN_SOURCE_COMPILES("
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
    " CMAKE_Fortran_COMPILER_SUPPORTS_F08)
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

# Test for Fortran 2018 support using the assumed-rank construct the generated
# bindings rely on: an assumed-rank (dimension(..)) dummy passed to c_loc(). This
# is exactly what the USE_ASSUMED_RANK_INTERFACES wrappers do, so it is the right
# discriminator for whether HIPFORT_ASSUMED_RANK can be enabled.
IF(NOT DEFINED CMAKE_Fortran_COMPILER_SUPPORTS_F18)
  MESSAGE(CHECK_START "Checking whether ${CMAKE_Fortran_COMPILER} supports Fortran 2018")
  INCLUDE(CheckFortranSourceCompiles)
  # NB: CHECK_FORTRAN_SOURCE_COMPILES writes the snippet to a .F file (fixed form),
  # so — like the Fortran 08 test above — every statement must start at column 7.
  CHECK_FORTRAN_SOURCE_COMPILES("
      module mod18
      contains
      function foo(x) result(p)
      use iso_c_binding
      integer(c_int),target,contiguous,dimension(..) :: x
      type(c_ptr) :: p
      p = c_loc(x)
      end function
      end module
      PROGRAM TESTFortran18
      use mod18
      use iso_c_binding
      implicit none
      integer(c_int),target :: a(5)
      type(c_ptr) :: p
      p = foo(a)
      END PROGRAM TESTFortran18
    " CMAKE_Fortran_COMPILER_SUPPORTS_F18)
  IF(CMAKE_Fortran_COMPILER_SUPPORTS_F18)
    MESSAGE(CHECK_PASS "yes")
    file(APPEND ${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/CMakeOutput.log
      "Determining if the Fortran compiler supports Fortran 2018 passed with "
      "the following output:\n${OUTPUT}\n\n")
    set(CMAKE_Fortran_COMPILER_SUPPORTS_F18 1)
  ELSE(CMAKE_Fortran_COMPILER_SUPPORTS_F18)
    MESSAGE(CHECK_FAIL "no")
    file(APPEND ${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/CMakeError.log
      "Determining if the Fortran compiler supports Fortran 2018 failed with "
      "the following output:\n${OUTPUT}\n\n")
    set(CMAKE_Fortran_COMPILER_SUPPORTS_F18 0)
  ENDIF(CMAKE_Fortran_COMPILER_SUPPORTS_F18)
  unset(CMAKE_Fortran_COMPILER_SUPPORTS_F18 CACHE)
ENDIF(NOT DEFINED CMAKE_Fortran_COMPILER_SUPPORTS_F18)

# Set compile flags for DEBUG, # RELEASE, or TESTING.  
INCLUDE(${CMAKE_MODULE_PATH}/SetFortranFlags.cmake) 
message("-- Done setting FortranFlags")
message("-- CMAKE_Fortran_FLAGS_DEBUG:   ${CMAKE_Fortran_FLAGS_DEBUG}")
message("-- CMAKE_Fortran_FLAGS_RELEASE: ${CMAKE_Fortran_FLAGS_RELEASE}")
message("-- CMAKE_Fortran_FLAGS_TESTING: ${CMAKE_Fortran_FLAGS_TESTING}")

# There is an error in CMAKE with this flag for pgf90.  Unset it
IF(FCNAME STREQUAL "pgf90")
    UNSET(CMAKE_SHARED_LIBRARY_LINK_Fortran_FLAGS)
ENDIF(FCNAME STREQUAL "pgf90")

option(BUILD_TESTING "Build tests" OFF)

# Extended tests: link each backend static archive into a shared library with
# -Wl,--no-undefined and fail on any unresolved symbol. Each backend's test is
# only added when all of its runtime libraries are found (see lib/CMakeLists.txt),
# so this is a no-op on machines without the corresponding ROCm/CUDA stack.
# Opt-in (default OFF): it needs a recent, complete ROCm or CUDA install (all math
# libraries present) to be certain it passes, so it is not part of the default
# test suite.
option(HIPFORT_EXTENDED_TESTS "Link each backend static archive into a shared library and fail on undefined symbols (needs a recent, complete ROCm/CUDA install)" OFF)
set(HIPFORT_ROCM_LIB_DIR "" CACHE PATH "Directory of the ROCm runtime libraries for the amdgcn extended shared-link test (default: <ROCM_PATH>/lib)")
set(HIPFORT_CUDA_LIB_DIR "" CACHE PATH "Directory of the CUDA runtime libraries for the nvptx extended shared-link test (default: from find_package(CUDAToolkit))")

if(BUILD_TESTING OR HIPFORT_EXTENDED_TESTS)
  enable_testing()
endif()

# Subdirectories and packaging
# NOTE: rocm-cmake must be be included before
# adding subdirectories.
INCLUDE(${CMAKE_MODULE_PATH}/rocm-cmake.cmake)
rocm_setup_version(VERSION ${VERSION})
ADD_SUBDIRECTORY(${CMAKE_SOURCE_DIR}/lib)
ADD_SUBDIRECTORY(${CMAKE_SOURCE_DIR}/test)

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
