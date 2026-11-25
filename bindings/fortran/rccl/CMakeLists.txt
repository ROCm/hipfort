# Copyright (c) Advanced Micro Devices, Inc., or its affiliates.
#
# SPDX-License-Identifier: MIT

# Fortran bindings for RCCL: the `rccl` module, roc::rccl_fortran and the
# rccl-fortran package. rccl.F90 is generated from the RCCL headers by
# rocm-fortran-generator; do not edit it by hand, regenerate it. A standalone
# project, built against an installed RCCL (find_package(rccl)).

cmake_minimum_required(VERSION 3.19)

project(rccl-fortran LANGUAGES NONE)

# "${UNIX}": ROCm ships no Fortran compiler on Windows, where the probe would
# pick up a stray gfortran that enable_language(Fortran) then rejects.
option(BUILD_FORTRAN_BINDINGS "Build the RCCL Fortran bindings" "${UNIX}")
option(BUILD_FORTRAN_CLIENTS "Build the RCCL Fortran binding tests" ON)
set(FORTRAN_ARRAY_INTERFACES
    "assumed-shape"
    CACHE STRING
    "Array-argument overloads to expose: none, assumed-shape, or assumed-rank"
)
set_property(
    CACHE FORTRAN_ARRAY_INTERFACES
    PROPERTY STRINGS none assumed-shape assumed-rank
)

# dev, as the HIP Fortran bindings: the two install side by side.
set(RCCL_FORTRAN_INSTALL_COMPONENT
    "dev"
    CACHE STRING
    "Install component of the RCCL Fortran bindings"
)

if(NOT BUILD_FORTRAN_BINDINGS)
    return()
endif()

include("${CMAKE_CURRENT_SOURCE_DIR}/cmake/ROCmFortranCompiler.cmake")
if(NOT CMAKE_Fortran_COMPILER)
    message(
        STATUS
        "RCCL: no Fortran compiler found, skipping the Fortran bindings"
    )
    return()
endif()

enable_language(Fortran)

# Before the target: its INSTALL_INTERFACE include directory uses CMAKE_INSTALL_*.
include(GNUInstallDirs)

if(NOT FORTRAN_ARRAY_INTERFACES MATCHES "^(none|assumed-shape|assumed-rank)$")
    message(
        FATAL_ERROR
        "FORTRAN_ARRAY_INTERFACES must be none, assumed-shape or assumed-rank, "
        "not '${FORTRAN_ARRAY_INTERFACES}'."
    )
endif()

add_library(rccl_fortran STATIC rccl.F90)
add_library(roc::rccl_fortran ALIAS rccl_fortran)

if(FORTRAN_ARRAY_INTERFACES STREQUAL "assumed-shape")
    target_compile_definitions(rccl_fortran PRIVATE USE_ASSUMED_SHAPE=1)
elseif(FORTRAN_ARRAY_INTERFACES STREQUAL "assumed-rank")
    target_compile_definitions(rccl_fortran PRIVATE USE_ASSUMED_RANK=1)
endif()

# Each module compiles to one object, and a linker extracts whole objects from
# an archive, so a program that calls one wrapper links all of them. One section
# per procedure lets a program linked with -Wl,--gc-sections keep only the
# wrappers it calls, and still link when another wrapper names a C function the
# installed library does not export. Only these compilers split the sections
# (the Intel ones accept the flags but do not), and not every version takes the
# flags: the amdflang of ROCm 7.13 rejects them.
include(CheckFortranCompilerFlag)
check_fortran_compiler_flag(
    -ffunction-sections
    RCCL_FORTRAN_HAVE_FUNCTION_SECTIONS
)
check_fortran_compiler_flag(-fdata-sections RCCL_FORTRAN_HAVE_DATA_SECTIONS)
if(RCCL_FORTRAN_HAVE_FUNCTION_SECTIONS AND RCCL_FORTRAN_HAVE_DATA_SECTIONS)
    target_compile_options(
        rccl_fortran
        PRIVATE
            "$<$<COMPILE_LANG_AND_ID:Fortran,GNU,LLVMFlang,Flang,NVHPC>:-ffunction-sections;-fdata-sections>"
    )
endif()

# A .mod is compiler-specific, so artifacts install per compiler, named as the
# user types it. Keep in step with rccl-fortran-config.cmake.in, which
# recomputes this name.
if(CMAKE_Fortran_COMPILER_ID STREQUAL "GNU")
    set(_fc_name "gfortran")
elseif(CMAKE_Fortran_COMPILER_ID MATCHES "Flang") # Flang, LLVMFlang
    set(_fc_name "amdflang")
elseif(CMAKE_Fortran_COMPILER_ID STREQUAL "Cray")
    set(_fc_name "ftn")
elseif(CMAKE_Fortran_COMPILER_ID STREQUAL "IntelLLVM")
    set(_fc_name "ifx")
elseif(CMAKE_Fortran_COMPILER_ID STREQUAL "Intel")
    set(_fc_name "ifort")
elseif(CMAKE_Fortran_COMPILER_ID STREQUAL "NVHPC")
    set(_fc_name "nvfortran")
else()
    get_filename_component(_fc_name "${CMAKE_Fortran_COMPILER}" NAME_WE)
    string(TOLOWER "${_fc_name}" _fc_name)
endif()

# A .mod is tied to the compiler version too: sites with several set this.
set(RCCL_FORTRAN_COMPILER_DIR
    "${_fc_name}"
    CACHE STRING
    "Per-compiler subdirectory the .mod and the archive install under"
)

set(_moddir "${CMAKE_CURRENT_BINARY_DIR}/include")
set_target_properties(
    rccl_fortran
    PROPERTIES
        Fortran_MODULE_DIRECTORY "${_moddir}"
        Fortran_PREPROCESS ON
        Fortran_FORMAT FREE
        POSITION_INDEPENDENT_CODE ON
)

target_include_directories(
    rccl_fortran
    PUBLIC
        "$<BUILD_INTERFACE:${_moddir}>"
        "$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}/fortran/${RCCL_FORTRAN_COMPILER_DIR}>"
)

# Link interface only. rccl-config.cmake needs C or CXX enabled; QUIET because
# the bindings build without RCCL.
enable_language(C)
find_package(rccl QUIET)

# Never left empty: it is @-substituted into a bare if() in the installed config.
if(TARGET roc::rccl)
    target_link_libraries(rccl_fortran INTERFACE roc::rccl)
    set(RCCL_FORTRAN_NEEDS_C_PACKAGE TRUE)
else()
    message(
        STATUS
        "RCCL: rccl was not found, so the Fortran bindings carry no link "
        "interface; a consumer will have to link it (-lrccl) itself."
    )
    set(RCCL_FORTRAN_NEEDS_C_PACKAGE FALSE)
endif()

# The uninstrumented Fortran executables cannot link an ASan librccl.
if(BUILD_FORTRAN_CLIENTS AND THEROCK_SANITIZER MATCHES "ASAN")
    message(
        STATUS
        "RCCL: address sanitizer is enabled, skipping the Fortran binding tests."
    )
    set(BUILD_FORTRAN_CLIENTS OFF)
endif()

if(BUILD_FORTRAN_CLIENTS)
    enable_testing()
    add_subdirectory(test)
endif()

include(CMakePackageConfigHelpers)

set(_fortran_pkgdir "${CMAKE_INSTALL_LIBDIR}/cmake/rccl-fortran")

install(
    TARGETS rccl_fortran
    EXPORT rccl-fortran-targets
    ARCHIVE
        DESTINATION
            "${CMAKE_INSTALL_LIBDIR}/fortran/${RCCL_FORTRAN_COMPILER_DIR}"
        COMPONENT ${RCCL_FORTRAN_INSTALL_COMPONENT}
)
install(
    DIRECTORY "${_moddir}/"
    DESTINATION
        "${CMAKE_INSTALL_INCLUDEDIR}/fortran/${RCCL_FORTRAN_COMPILER_DIR}"
    COMPONENT ${RCCL_FORTRAN_INSTALL_COMPONENT}
    FILES_MATCHING
    PATTERN "*.mod"
)

# Under share/, not include/fortran/, whose entries the config lists as compilers.
install(
    FILES "${CMAKE_CURRENT_SOURCE_DIR}/rccl.F90"
    DESTINATION "${CMAKE_INSTALL_DATADIR}/rccl/fortran"
    COMPONENT ${RCCL_FORTRAN_INSTALL_COMPONENT}
)
install(
    EXPORT rccl-fortran-targets
    FILE rccl-fortran-targets.cmake
    NAMESPACE roc::
    DESTINATION "${_fortran_pkgdir}"
    COMPONENT ${RCCL_FORTRAN_INSTALL_COMPONENT}
)

set(RCCL_FORTRAN_LIBDIR "${CMAKE_INSTALL_LIBDIR}/fortran")
set(RCCL_FORTRAN_INCLUDEDIR "${CMAKE_INSTALL_INCLUDEDIR}/fortran")

configure_package_config_file(
    "${CMAKE_CURRENT_SOURCE_DIR}/rccl-fortran-config.cmake.in"
    "${CMAKE_CURRENT_BINARY_DIR}/rccl-fortran-config.cmake"
    INSTALL_DESTINATION "${_fortran_pkgdir}"
    # Not RCCL_FORTRAN_COMPILER_DIR: it is a directory name, not a path.
    PATH_VARS RCCL_FORTRAN_LIBDIR RCCL_FORTRAN_INCLUDEDIR
)
install(
    FILES "${CMAKE_CURRENT_BINARY_DIR}/rccl-fortran-config.cmake"
    DESTINATION "${_fortran_pkgdir}"
    COMPONENT ${RCCL_FORTRAN_INSTALL_COMPONENT}
)

# From RCCL's makefiles/version.mk, as RCCL's own CMake reads it.
set(_rccl_version_file
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../projects/rccl/makefiles/version.mk"
)
set(_fortran_version "")
if(EXISTS "${_rccl_version_file}")
    file(READ "${_rccl_version_file}" _rccl_v)
    set(_rccl_parts "")
    foreach(_part MAJOR MINOR PATCH)
        if(_rccl_v MATCHES "NCCL_${_part} *:= *([0-9]+)")
            list(APPEND _rccl_parts "${CMAKE_MATCH_1}")
        endif()
    endforeach()
    list(LENGTH _rccl_parts _n)
    if(_n EQUAL 3)
        list(JOIN _rccl_parts "." _fortran_version)
    endif()
    unset(_rccl_v)
    unset(_rccl_parts)
endif()

if(_fortran_version)
    write_basic_package_version_file(
        "${CMAKE_CURRENT_BINARY_DIR}/rccl-fortran-config-version.cmake"
        VERSION "${_fortran_version}"
        COMPATIBILITY SameMajorVersion
    )
    install(
        FILES "${CMAKE_CURRENT_BINARY_DIR}/rccl-fortran-config-version.cmake"
        DESTINATION "${_fortran_pkgdir}"
        COMPONENT ${RCCL_FORTRAN_INSTALL_COMPONENT}
    )
else()
    message(
        STATUS
        "RCCL: could not determine the version from RCCL's version.mk, so no "
        "rccl-fortran-config-version.cmake is installed and a "
        "versioned find_package(rccl-fortran) will not match."
    )
endif()
