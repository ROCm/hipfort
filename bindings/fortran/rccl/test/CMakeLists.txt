# Copyright (c) Advanced Micro Devices, Inc., or its affiliates.
#
# SPDX-License-Identifier: MIT

set(CMAKE_Fortran_FORMAT FREE)
if(CMAKE_Fortran_COMPILER_ID MATCHES "Intel")
    string(
        REPLACE
        "<SOURCE>"
        "-Tf <SOURCE>"
        CMAKE_Fortran_COMPILE_OBJECT
        "${CMAKE_Fortran_COMPILE_OBJECT}"
    )
endif()
if(NOT APPLE AND NOT WIN32)
    add_link_options(-Wl,--gc-sections)
endif()

if(NOT TARGET roc::rccl)
    message(
        STATUS
        "RCCL: rccl was not found, skipping the Fortran binding tests (they "
        "link it). Point CMAKE_PREFIX_PATH at an installed ROCm to build them."
    )
    return()
endif()

# All but the version test `use hip`.
if(NOT TARGET hip::hip_fortran)
    find_package(hip-fortran QUIET)
endif()

include(GNUInstallDirs)
set(_ctest "${CMAKE_CURRENT_BINARY_DIR}/rccl-fortran-CTestTestfile.cmake")
file(WRITE "${_ctest}" "")

# rccl_fortran_add_test(<name> <source> [hip] [multi]): hip links the HIP
# binding, multi marks a test that needs two GPUs and exits 77 without them.
function(rccl_fortran_add_test name src)
    if("hip" IN_LIST ARGN AND NOT TARGET hip::hip_fortran)
        return()
    endif()
    set_source_files_properties(${src} PROPERTIES LANGUAGE Fortran)
    add_executable(rccl_fortran_test_${name} ${src})
    set_target_properties(
        rccl_fortran_test_${name}
        PROPERTIES
            LINKER_LANGUAGE Fortran
            Fortran_MODULE_DIRECTORY
                "${CMAKE_CURRENT_BINARY_DIR}/${name}.mod.dir"
    )
    target_link_libraries(rccl_fortran_test_${name} PRIVATE rccl_fortran)
    if("hip" IN_LIST ARGN)
        target_link_libraries(
            rccl_fortran_test_${name}
            PRIVATE hip::hip_fortran
        )
    endif()
    add_test(NAME rccl_fortran_${name} COMMAND rccl_fortran_test_${name})
    set_tests_properties(rccl_fortran_${name} PROPERTIES LABELS "gpu")
    file(
        APPEND "${_ctest}"
        "add_test(rccl_fortran_${name} \"../rccl_fortran_test_${name}\")\n"
    )
    if("multi" IN_LIST ARGN)
        set_tests_properties(
            rccl_fortran_${name}
            PROPERTIES SKIP_RETURN_CODE 77
        )
        file(
            APPEND "${_ctest}"
            "set_tests_properties(rccl_fortran_${name} PROPERTIES SKIP_RETURN_CODE 77)\n"
        )
    endif()
    install(
        TARGETS rccl_fortran_test_${name}
        RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}" COMPONENT tests
    )
endfunction()

rccl_fortran_add_test(version rccl_version.f03)
rccl_fortran_add_test(allreduce_single rccl_allreduce_single.f03 hip)
rccl_fortran_add_test(allreduce_multi rccl_allreduce_multi.f03 hip multi)
if(NOT FORTRAN_ARRAY_INTERFACES STREQUAL "none")
    rccl_fortran_add_test(allreduce_multi_f08 rccl_allreduce_multi.f08 hip multi)
endif()

install(
    FILES "${_ctest}"
    DESTINATION "${CMAKE_INSTALL_BINDIR}/rccl-fortran"
    COMPONENT tests
    RENAME CTestTestfile.cmake
)
