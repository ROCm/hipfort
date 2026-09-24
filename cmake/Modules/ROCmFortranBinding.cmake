# Copyright (c) 2026 Advanced Micro Devices, Inc. All rights reserved.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

# rocm_add_fortran_binding(): build, install and export one library's Fortran
# binding.
#
# In the split this module is not part of any library: it belongs in rocm-cmake,
# beside ROCMInstallTargets and the other ROCM* helpers, so that every
# rocm-systems / rocm-libraries project gets the same options, the same
# per-compiler install layout and the same target naming without restating them.
# It lives here so the sandbox can show all thirteen bindings built the way the
# real ones will be; each <lib>/fortran/CMakeLists.txt is what would actually
# ship in the library's repository.
#
# The conventions implemented here are the ones documented in
# docs/how-to/migration-guide.rst:
#
#   target     <namespace>::<lib>_fortran   (roc:: or hip::, matching the C library)
#   archive    lib<lib>_fortran.a
#   module     <lib>.mod, from a single self-contained <lib>.F90
#   package    <lib>-fortran  (hyphenated package, underscored target -- ROCm
#                              hyphenates package names and underscores targets)
#   .mod       <prefix>/include/fortran/<compiler>/
#   .a         <prefix>/lib/fortran/<compiler>/
#
# Usage:
#   rocm_add_fortran_binding(
#     LIBRARY         rocsolver          # names the module, archive and target
#     NAMESPACE       roc                # roc:: or hip::
#     SOURCE          rocsolver.F90
#     C_PACKAGE       rocsolver          # find_package() name of the C library
#     C_TARGET        roc::rocsolver     # imported target to link
#     FORTRAN_DEPENDS rocblas            # other bindings whose .mod this one USEs
#   )

include_guard(GLOBAL)

include(CMakeParseArguments)
include(CMakePackageConfigHelpers)
include(CheckFortranSourceCompiles)

set(_ROCM_FORTRAN_BINDING_DIR "${CMAKE_CURRENT_LIST_DIR}")

# ---------------------------------------------------------------------------
# rocm_fortran_probe_standards()
#
# Sets CMAKE_Fortran_COMPILER_SUPPORTS_F08 / _F18 in the cache. They decide
# which array interface tier FORTRAN_ARRAY_INTERFACES can actually reach, so
# they have to run in a standalone <lib>/fortran build as well as in a full
# monorepo one. Cached, so the probes compile once per build tree.
# ---------------------------------------------------------------------------
function(rocm_fortran_probe_standards)
  if(NOT CMAKE_Fortran_COMPILER_LOADED)
    return()
  endif()

  # NB: CHECK_FORTRAN_SOURCE_COMPILES writes the snippet to a .F file (fixed
  # form), so every statement must start at column 7.
  if(NOT DEFINED CMAKE_Fortran_COMPILER_SUPPORTS_F08)
    message(CHECK_START "Checking whether ${CMAKE_Fortran_COMPILER} supports Fortran 2008")
    check_fortran_source_compiles("
      module mod08
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
        use mod08
        implicit none
        integer :: a(5)
        integer,allocatable :: b(:)
        allocate(b,mold=a)
        deallocate(b)
      END PROGRAM TESTFortran08
    " _rocm_fortran_f08)
    if(_rocm_fortran_f08)
      message(CHECK_PASS "yes")
    else()
      message(CHECK_FAIL "no")
    endif()
    set(CMAKE_Fortran_COMPILER_SUPPORTS_F08 ${_rocm_fortran_f08} CACHE INTERNAL
      "Whether the Fortran compiler supports Fortran 2008")
  endif()

  # Probed with the construct the bindings actually rely on: an assumed-rank
  # (dimension(..)) dummy passed to c_loc(), which is exactly what the
  # USE_ASSUMED_RANK_INTERFACES wrappers do.
  if(NOT DEFINED CMAKE_Fortran_COMPILER_SUPPORTS_F18)
    message(CHECK_START "Checking whether ${CMAKE_Fortran_COMPILER} supports Fortran 2018")
    check_fortran_source_compiles("
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
    " _rocm_fortran_f18)
    if(_rocm_fortran_f18)
      message(CHECK_PASS "yes")
    else()
      message(CHECK_FAIL "no")
    endif()
    set(CMAKE_Fortran_COMPILER_SUPPORTS_F18 ${_rocm_fortran_f18} CACHE INTERNAL
      "Whether the Fortran compiler supports Fortran 2018")
  endif()
endfunction()

# ---------------------------------------------------------------------------
# rocm_fortran_require_c_package(<package>)
#
# Locate the C library a binding wraps. A missing package is fatal in a
# standalone <lib>/fortran build (you asked for that binding and nothing else),
# and a skip inside a larger build (the rest of it still has work to do). Must
# be a macro: the skip returns from the including CMakeLists.txt.
# ---------------------------------------------------------------------------
macro(rocm_fortran_require_c_package _pkg)
  find_package(${_pkg} QUIET)
  if(NOT ${_pkg}_FOUND)
    if(CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
      message(FATAL_ERROR
        "${_pkg} was not found. Point the build at an installed ROCm with "
        "-DCMAKE_PREFIX_PATH=/opt/rocm.")
    endif()
    message(STATUS "Skipping the ${_pkg} Fortran binding: ${_pkg} was not found")
    return()
  endif()
endmacro()

# ---------------------------------------------------------------------------
# rocm_fortran_compiler_dir(<out> [LIBRARY <lib>])
#
# The per-compiler subdirectory name. A .mod is readable only by the compiler
# (and version) that wrote it, so the artifacts cannot share one directory; the
# name is the compiler you would type rather than the CMake compiler ID, since
# it ends up in a -I/-L that a user writes by hand.
#
# <LIB>_FORTRAN_COMPILER_DIR overrides it, which matters only at a site that
# installs several compilers' artifacts side by side under names of its own.
# ---------------------------------------------------------------------------
function(rocm_fortran_compiler_dir _out)
  cmake_parse_arguments(_arg "" "LIBRARY" "" ${ARGN})

  if(_arg_LIBRARY)
    string(TOUPPER "${_arg_LIBRARY}" _upper)
    if(${_upper}_FORTRAN_COMPILER_DIR)
      set(${_out} "${${_upper}_FORTRAN_COMPILER_DIR}" PARENT_SCOPE)
      return()
    endif()
  endif()

  # Named compilers get the spelling users know them by; gfortran rather than
  # GNU, and gfortran rather than the gfortran-13 a distro may install it as.
  set(_map_GNU       gfortran)
  set(_map_Cray      ftn)
  set(_map_IntelLLVM ifx)
  set(_map_Intel     ifort)
  set(_map_NVHPC     nvfortran)

  if(DEFINED _map_${CMAKE_Fortran_COMPILER_ID})
    set(${_out} "${_map_${CMAKE_Fortran_COMPILER_ID}}" PARENT_SCOPE)
    return()
  endif()

  # Everything else falls back to the basename, lowercased. ROCm's LLVM Flang
  # lands here and yields "amdflang" on its own, which is the documented name.
  get_filename_component(_base "${CMAKE_Fortran_COMPILER}" NAME_WE)
  string(TOLOWER "${_base}" _base)
  set(${_out} "${_base}" PARENT_SCOPE)
endfunction()

# ---------------------------------------------------------------------------
# rocm_fortran_binding_options()
#
# Declares the options shared by every binding. Idempotent: each library's
# CMakeLists.txt calls it, and in a monorepo build the first call wins.
# ---------------------------------------------------------------------------
macro(rocm_fortran_binding_options)
  rocm_fortran_probe_standards()

  # "Do I build the bindings at all", the switch that replaces "do I build
  # hipFORT". ON, but guarded below by whether a Fortran compiler is actually
  # present, so a C-only site never has to acquire one.
  option(BUILD_FORTRAN_BINDINGS "Build the Fortran bindings" ON)
  option(BUILD_FORTRAN_TESTS "Build the Fortran bindings' test suite" OFF)

  # One tri-state replaces hipFORT's HIPFORT_USE_FPOINTER_INTERFACES plus
  # HIPFORT_ASSUMED_RANK. Two booleans could express a combination the language
  # forbids: an assumed-rank dummy is not distinguishable by rank from the
  # per-rank specifics, so assumed-rank *replaces* them rather than adding to
  # them and the two cannot legally coexist in one generic. Three values cannot
  # express it.
  set(FORTRAN_ARRAY_INTERFACES "assumed-shape" CACHE STRING
    "Array interfaces to generate: none, assumed-shape (F2008), assumed-rank (F2018)")
  set_property(CACHE FORTRAN_ARRAY_INTERFACES
    PROPERTY STRINGS none assumed-shape assumed-rank)
endmacro()

# ---------------------------------------------------------------------------
# rocm_fortran_array_interface_defs(<out>)
#
# The preprocessor macros implementing the selected tier, after downgrading it
# to what the compiler can actually do. The raw type(c_ptr) surface is Fortran
# 2003 and always present, so "none" is always reachable.
# ---------------------------------------------------------------------------
function(rocm_fortran_array_interface_defs _out)
  set(_level "${FORTRAN_ARRAY_INTERFACES}")

  if(NOT _level MATCHES "^(none|assumed-shape|assumed-rank)$")
    message(FATAL_ERROR
      "FORTRAN_ARRAY_INTERFACES must be none, assumed-shape or assumed-rank, "
      "not '${_level}'.")
  endif()

  # Downgrade rather than fail: a compiler that cannot do F2018 can still build
  # every interface below it, and the binding is useful at any tier.
  if(_level STREQUAL "assumed-rank" AND NOT CMAKE_Fortran_COMPILER_SUPPORTS_F18)
    message(WARNING
      "FORTRAN_ARRAY_INTERFACES=assumed-rank needs a Fortran 2018 compiler; "
      "${CMAKE_Fortran_COMPILER} is not one. Falling back to assumed-shape.")
    set(_level "assumed-shape")
  endif()
  if(_level STREQUAL "assumed-shape" AND NOT CMAKE_Fortran_COMPILER_SUPPORTS_F08)
    message(WARNING
      "FORTRAN_ARRAY_INTERFACES=assumed-shape needs a Fortran 2008 compiler; "
      "${CMAKE_Fortran_COMPILER} is not one. Falling back to none "
      "(the plain Fortran 2003 C bindings).")
    set(_level "none")
  endif()

  set(_defs "")
  if(_level STREQUAL "assumed-shape")
    set(_defs USE_FPOINTER_INTERFACES)
  elseif(_level STREQUAL "assumed-rank")
    # Nested, not exclusive: the assumed-rank specifics are emitted inside the
    # same USE_FPOINTER_INTERFACES guards, with USE_ASSUMED_RANK_INTERFACES
    # selecting them over the per-rank ones.
    set(_defs USE_FPOINTER_INTERFACES USE_ASSUMED_RANK_INTERFACES)
  endif()
  set(${_out} "${_defs}" PARENT_SCOPE)
endfunction()

# ---------------------------------------------------------------------------
# rocm_add_fortran_binding(...)
# ---------------------------------------------------------------------------
function(rocm_add_fortran_binding)
  cmake_parse_arguments(_rfb
    ""
    "LIBRARY;NAMESPACE;SOURCE;C_PACKAGE;C_TARGET"
    "FORTRAN_DEPENDS"
    ${ARGN})

  foreach(_required LIBRARY NAMESPACE SOURCE C_PACKAGE C_TARGET)
    if(NOT _rfb_${_required})
      message(FATAL_ERROR "rocm_add_fortran_binding: ${_required} is required")
    endif()
  endforeach()

  set(_lib "${_rfb_LIBRARY}")
  string(TOUPPER "${_lib}" _LIB)
  set(_target "${_lib}_fortran")

  rocm_fortran_binding_options()

  # ---- should this binding be built? -------------------------------------
  # <LIB>_BUILD_FORTRAN_BINDINGS wins over the global spelling when set, so one
  # library can differ from the rest of a monorepo build.
  set(_enabled ${BUILD_FORTRAN_BINDINGS})
  if(DEFINED ${_LIB}_BUILD_FORTRAN_BINDINGS)
    set(_enabled ${${_LIB}_BUILD_FORTRAN_BINDINGS})
  endif()

  # Guarded, not required: no Fortran compiler is a skip, not an error.
  if(_enabled AND NOT CMAKE_Fortran_COMPILER_LOADED)
    message(STATUS
      "${_lib}: no Fortran compiler, skipping the Fortran bindings "
      "(ask for them explicitly with ${_LIB}_BUILD_FORTRAN_BINDINGS=ON to make "
      "this an error instead).")
    set(_enabled OFF)
  endif()

  set(${_LIB}_HAVE_FORTRAN_BINDINGS ${_enabled} CACHE INTERNAL
    "Whether ${_lib}'s Fortran bindings were built")
  if(NOT _enabled)
    return()
  endif()

  # ---- where the artifacts go --------------------------------------------
  rocm_fortran_compiler_dir(_cdir LIBRARY ${_lib})
  set(_moddir "${CMAKE_BINARY_DIR}/include/fortran/${_cdir}")
  set(_install_libdir     "lib/fortran/${_cdir}")
  set(_install_includedir "include/fortran/${_cdir}")
  # The package files are per-compiler for the same reason the .mod is, so they
  # sit beside the archive rather than at lib/cmake/, and a compiler-agnostic
  # shim at the standard location forwards to them (see below).
  set(_install_cmakedir "${_install_libdir}/cmake/${_lib}-fortran")

  # One module directory shared by every binding in the build tree: rocsolver
  # USEs rocblas, and a single directory is what lets the Fortran module scanner
  # order the two without either naming the other's build layout.
  set(CMAKE_Fortran_MODULE_DIRECTORY "${_moddir}")

  # ---- the archive --------------------------------------------------------
  add_library(${_target} STATIC "${_rfb_SOURCE}")

  # Normally the namespaced alias is the name everything links. It can already
  # be taken: hipSOLVER is the one library that ALREADY exports
  # roc::hipsolver_fortran, a *shared* library built from its hand-written
  # hipsolver_module.f90, so find_package(hipsolver) imports that name before we
  # get here and CMake refuses a second target with it. The generated binding
  # supersedes that module at 10.2 and takes the same public name, so the
  # collision is transitional: it only happens while building against a ROCm
  # whose C package still ships the old target. Fall back to the plain target
  # name inside this build tree rather than failing the whole configure, and say
  # so, because the alternative is silently linking the other thing.
  set(_link_target ${_rfb_NAMESPACE}::${_target})
  if(TARGET ${_rfb_NAMESPACE}::${_target})
    set(_link_target ${_target})
    message(WARNING
      "${_rfb_C_PACKAGE} already exports ${_rfb_NAMESPACE}::${_target} (the "
      "hand-written Fortran binding it shipped before the split), so this build "
      "links the generated one as plain '${_target}' instead. The installed "
      "${_lib}-fortran package still exports it as ${_rfb_NAMESPACE}::${_target}, "
      "so consuming that install on a ROCm whose ${_rfb_C_PACKAGE} still defines "
      "the name will collide the same way. See 'Special cases' in "
      "docs/how-to/migration-guide.rst.")
  else()
    add_library(${_rfb_NAMESPACE}::${_target} ALIAS ${_target})
  endif()

  # The name the rest of this build tree must link. Callers use this rather than
  # reconstructing <namespace>::<lib>_fortran, which is not always reachable.
  set(ROCM_FORTRAN_TARGET_${_lib} ${_link_target} CACHE INTERNAL
    "Target to link for ${_lib}'s Fortran binding in this build tree")

  set_target_properties(${_target} PROPERTIES
    Fortran_MODULE_DIRECTORY "${_moddir}"
    Fortran_PREPROCESS ON
    LINKER_LANGUAGE Fortran
    EXPORT_NAME ${_target}
    POSITION_INDEPENDENT_CODE ON)

  rocm_fortran_array_interface_defs(_defs)
  if(_defs)
    target_compile_definitions(${_target} PRIVATE ${_defs})
  endif()

  target_include_directories(${_target} PUBLIC
    $<BUILD_INTERFACE:${_moddir}>
    $<INSTALL_INTERFACE:${_install_includedir}>)

  # PUBLIC: the C library is a link dependency of anything using the binding,
  # and its headers are irrelevant here -- the generated .F90 is self-contained
  # Fortran, so building it needs neither the C headers nor the .so.
  target_link_libraries(${_target} PUBLIC ${_rfb_C_TARGET})
  # FORTRAN_DEPENDS names namespaced targets (roc::rocblas_fortran), which
  # resolve either to the alias of a binding configured in the same tree or to
  # the imported target a find_package(<dep>-fortran) brought in. Both spell the
  # dependency the same way, so nothing here has to know which it got.
  foreach(_dep IN LISTS _rfb_FORTRAN_DEPENDS)
    target_link_libraries(${_target} PUBLIC ${_dep})
  endforeach()

  # ---- install ------------------------------------------------------------
  install(TARGETS ${_target}
    EXPORT ${_lib}-fortran-targets
    ARCHIVE DESTINATION ${_install_libdir}
    LIBRARY DESTINATION ${_install_libdir}
    INCLUDES DESTINATION ${_install_includedir})

  # Only this library's own .mod: the module directory is shared by the whole
  # build tree, so installing the directory would make every package ship every
  # other package's module.
  install(FILES "${_moddir}/${_lib}.mod"
    DESTINATION ${_install_includedir})

  install(EXPORT ${_lib}-fortran-targets
    FILE ${_lib}-fortran-targets.cmake
    NAMESPACE ${_rfb_NAMESPACE}::
    DESTINATION ${_install_cmakedir})

  # ---- the package --------------------------------------------------------
  # roc::rocblas_fortran -> find_dependency(rocblas-fortran): the target is
  # underscored and the package hyphenated, so the config cannot just repeat the
  # target name.
  set(_rfb_fortran_dependencies "")
  foreach(_dep IN LISTS _rfb_FORTRAN_DEPENDS)
    string(REGEX REPLACE "^.*::" "" _dep_pkg "${_dep}")
    string(REGEX REPLACE "_fortran$" "" _dep_pkg "${_dep_pkg}")
    string(APPEND _rfb_fortran_dependencies "find_dependency(${_dep_pkg}-fortran)\n")
  endforeach()

  configure_package_config_file(
    "${_ROCM_FORTRAN_BINDING_DIR}/rocm-fortran-binding-config.cmake.in"
    "${CMAKE_CURRENT_BINARY_DIR}/${_lib}-fortran-config.cmake"
    INSTALL_DESTINATION ${_install_cmakedir}
    NO_CHECK_REQUIRED_COMPONENTS_MACRO)
  install(FILES "${CMAKE_CURRENT_BINARY_DIR}/${_lib}-fortran-config.cmake"
    DESTINATION ${_install_cmakedir})

  # The real config lives under lib/fortran/<compiler>/, which is not on
  # find_package's search path. Install a compiler-agnostic shim at the standard
  # lib/cmake/<lib>-fortran so find_package(<lib>-fortran) succeeds from the
  # install prefix; it resolves the compiler at use time, so every toolchain
  # install can write the same shim without conflict.
  configure_file(
    "${_ROCM_FORTRAN_BINDING_DIR}/rocm-fortran-binding-shim.cmake.in"
    "${CMAKE_CURRENT_BINARY_DIR}/shim/${_lib}-fortran-config.cmake"
    @ONLY)
  install(FILES "${CMAKE_CURRENT_BINARY_DIR}/shim/${_lib}-fortran-config.cmake"
    DESTINATION "lib/cmake/${_lib}-fortran")

  # Reports the in-tree link name, which is not the exported one when the
  # namespaced target was already taken (see the collision above).
  message(STATUS
    "${_lib}: Fortran binding -> ${_link_target} "
    "(lib${_target}.a, ${_lib}.mod, ${_cdir})")
endfunction()
