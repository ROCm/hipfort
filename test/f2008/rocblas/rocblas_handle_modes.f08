!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
!
! SPDX-License-Identifier: MIT
!
! Permission is hereby granted, free of charge, to any person obtaining a copy
! of this software and associated documentation files (the "Software"), to deal
! in the Software without restriction, including without limitation the rights
! to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
! copies of the Software, and to permit persons to whom the Software is
! furnished to do so, subject to the following conditions:
!
! The above copyright notice and this permission notice shall be included in
! all copies or substantial portions of the Software.
!
! THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
! IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
! FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
! AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
! LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
! OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
! THE SOFTWARE.
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

! Exercises the rocBLAS handle mode getters and setters:
!   rocblas_{set,get}_pointer_mode, rocblas_{set,get}_atomics_mode and
!   rocblas_{set,get}_math_mode.
!
! The three set_* routines take their mode by value, while the three get_*
! routines take a *bare* (non-value) enum scalar that rocBLAS fills in, so the
! variable is passed directly and never wrapped in c_loc.
!
! The test decides pass/fail by round-tripping: each mode variable is primed
! with the sentinel -1, the default is read back and checked, a new mode is set
! and read back, then the original mode is restored and read back again. Any
! mismatch prints "FAILED! ..." and stops with a non-zero exit code.
!
! No device memory is involved, so this file is identical to its Fortran 2003
! counterpart apart from the banner.

program rocblas_handle_modes_test

    use iso_c_binding
    use hipfort_check
    use hipfort_rocblas

    implicit none

    type(c_ptr) :: handle

    integer(kind(rocblas_pointer_mode_host))  :: pmode
    integer(kind(rocblas_atomics_not_allowed)) :: amode
    integer(kind(rocblas_default_math))       :: mmode

    write(*,"(a)",advance="no") "-- Running test 'rocblas_handle_modes' (Fortran 2008 interfaces) - "

    call rocblasCheck(rocblas_create_handle(handle))

    !---------------------------------------------------------------------
    ! Pointer mode: a fresh handle defaults to host pointers.
    !---------------------------------------------------------------------
    pmode = -1
    call rocblasCheck(rocblas_get_pointer_mode(handle, pmode))
    if (pmode /= rocblas_pointer_mode_host) then
       write(*,*) "FAILED! fresh handle pointer mode is not rocblas_pointer_mode_host"
       STOP 1
    end if

    call rocblasCheck(rocblas_set_pointer_mode(handle, rocblas_pointer_mode_device))
    pmode = -1
    call rocblasCheck(rocblas_get_pointer_mode(handle, pmode))
    if (pmode /= rocblas_pointer_mode_device) then
       write(*,*) "FAILED! rocblas_get_pointer_mode did not return rocblas_pointer_mode_device"
       STOP 1
    end if

    call rocblasCheck(rocblas_set_pointer_mode(handle, rocblas_pointer_mode_host))
    pmode = -1
    call rocblasCheck(rocblas_get_pointer_mode(handle, pmode))
    if (pmode /= rocblas_pointer_mode_host) then
       write(*,*) "FAILED! rocblas_get_pointer_mode did not restore rocblas_pointer_mode_host"
       STOP 1
    end if

    !---------------------------------------------------------------------
    ! Atomics mode: rocBLAS documents atomics as turned off by default.
    !---------------------------------------------------------------------
    amode = -1
    call rocblasCheck(rocblas_get_atomics_mode(handle, amode))
    if (amode /= rocblas_atomics_not_allowed) then
       write(*,*) "FAILED! fresh handle atomics mode is not rocblas_atomics_not_allowed"
       STOP 1
    end if

    call rocblasCheck(rocblas_set_atomics_mode(handle, rocblas_atomics_allowed))
    amode = -1
    call rocblasCheck(rocblas_get_atomics_mode(handle, amode))
    if (amode /= rocblas_atomics_allowed) then
       write(*,*) "FAILED! rocblas_get_atomics_mode did not return rocblas_atomics_allowed"
       STOP 1
    end if

    call rocblasCheck(rocblas_set_atomics_mode(handle, rocblas_atomics_not_allowed))
    amode = -1
    call rocblasCheck(rocblas_get_atomics_mode(handle, amode))
    if (amode /= rocblas_atomics_not_allowed) then
       write(*,*) "FAILED! rocblas_get_atomics_mode did not restore rocblas_atomics_not_allowed"
       STOP 1
    end if

    !---------------------------------------------------------------------
    ! Math mode: the default is rocblas_default_math everywhere.
    !---------------------------------------------------------------------
    mmode = -1
    call rocblasCheck(rocblas_get_math_mode(handle, mmode))
    if (mmode /= rocblas_default_math) then
       write(*,*) "FAILED! fresh handle math mode is not rocblas_default_math"
       STOP 1
    end if

    ! Requesting xf32 reports rocblas_status_success on every architecture, but
    ! it is silently ignored on devices without XF32 XDL support (only gfx94x
    ! honours it), so the handle may legitimately stay on rocblas_default_math.
    ! Asserting a hard round-trip here would be a false failure; instead check
    ! that the getter wrote a valid member of the enum over the -1 sentinel.
    call rocblasCheck(rocblas_set_math_mode(handle, rocblas_xf32_xdl_math_op))
    mmode = -1
    call rocblasCheck(rocblas_get_math_mode(handle, mmode))
    if (mmode /= rocblas_default_math .and. mmode /= rocblas_xf32_xdl_math_op) then
       write(*,*) "FAILED! rocblas_get_math_mode returned a value outside the rocblas_math_mode enum"
       STOP 1
    end if

    call rocblasCheck(rocblas_set_math_mode(handle, rocblas_default_math))
    mmode = -1
    call rocblasCheck(rocblas_get_math_mode(handle, mmode))
    if (mmode /= rocblas_default_math) then
       write(*,*) "FAILED! rocblas_get_math_mode did not restore rocblas_default_math"
       STOP 1
    end if

    call rocblasCheck(rocblas_destroy_handle(handle))

    write(*,*) "PASSED! pointer/atomics/math: ", pmode, amode, mmode

end program rocblas_handle_modes_test
