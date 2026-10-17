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

! Exercises rocrand_get_version, the rocRAND library version query.
!
! Since the recent argument reclassification, 'version' is a plain
! integer(c_int) output dummy (see hipfort_rocrand.F90), so the variable is
! passed directly rather than wrapped in c_loc().
!
! The test poisons the output variable first, so a binding that silently failed
! to write through would be caught. It then checks that the returned code is a
! plausible encoded version (ROCRAND_VERSION = major*100000 + minor*100 +
! patch, see rocrand_version.h) and that a second query returns the same value.
! The exact version number is deliberately NOT hard-coded so the test survives
! ROCm upgrades.
!
! This is a pure query routine that touches no device memory, so the Fortran
! 2008 variant is identical to the Fortran 2003 one apart from the banner.
program rocrand_version_test

    use iso_c_binding
    use hip
    use rocrand

    implicit none

    integer(c_int), parameter :: poison = -12345

    integer(c_int) :: version, version2
    integer(c_int) :: major, minor, patch

    write(*,"(a)",advance="no") "-- Running test 'rocRAND version' &
                                &(Fortran 2008 interfaces) - "

    version = poison
    version2 = poison

    call rocrandCheck(rocrand_get_version(version))
    call rocrandCheck(rocrand_get_version(version2))

    if (version == poison) then
       write(*,*) "FAILED! rocrand_get_version did not write the output argument"
       STOP 1
    end if

    if (version <= 0) then
       write(*,*) "FAILED! rocrand_get_version returned a non-positive code: ", version
       STOP 1
    end if

    major = version / 100000
    minor = mod(version / 100, 1000)
    patch = mod(version, 100)

    if (major < 1) then
       write(*,*) "FAILED! implausible rocRAND major version: ", major, " (code ", version, ")"
       STOP 1
    end if

    if (minor < 0 .or. minor > 999) then
       write(*,*) "FAILED! implausible rocRAND minor version: ", minor, " (code ", version, ")"
       STOP 1
    end if

    if (patch < 0 .or. patch > 99) then
       write(*,*) "FAILED! implausible rocRAND patch version: ", patch, " (code ", version, ")"
       STOP 1
    end if

    if (version2 /= version) then
       write(*,*) "FAILED! rocrand_get_version is not stable: ", version, " then ", version2
       STOP 1
    end if

    write(*,"(a,i0,a,i0,a,i0,a,i0,a)") " PASSED! rocRAND version: ", &
         major, ".", minor, ".", patch, " (code ", version, ")"

end program rocrand_version_test
