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

! Exercises the rocBLAS handle query routines, i.e. the getters whose output
! scalar is now a plain Fortran dummy argument instead of a type(c_ptr),value.
!
! Two independent properties are asserted:
!   (a) rocblas_get_stream returns, bit for bit, the HIP stream that was handed
!       to rocblas_set_stream.  'stream' is passed by value, 'got' is a bare
!       type(c_ptr) that rocBLAS fills in, so it is passed directly.
!   (b) rocblas_pointer_to_mode classifies a genuine hipMalloc'd allocation as
!       rocblas_pointer_mode_device and a plain Fortran host array as
!       rocblas_pointer_mode_host.  It is a pure query function returning the
!       mode (not a status), so it is not wrapped in rocblasCheck.
!   The int64 batch stride setters/getters (rocblas_{set,get}_batch_*_stride)
!   came after ROCm 7.13, so they are not tested here.
!
! Any mismatch prints "FAILED! ..." and stops with exit code 1; otherwise the
! test prints "PASSED!".
program rocblas_handle_query

    use iso_c_binding
    use hipfort
    use hipfort_check
    use hipfort_rocblas
    use hipfort_rocblas_enums

    implicit none

    integer, parameter :: N = 256
    integer(c_size_t), parameter :: Nbytes = N * 8

    type(c_ptr) :: handle = c_null_ptr
    type(c_ptr) :: stream = c_null_ptr
    type(c_ptr) :: got = c_null_ptr
    type(c_ptr) :: dptr = c_null_ptr

    real(c_double), target :: hx(N)

    integer(kind(rocblas_pointer_mode_host)) :: mode

    write(*,"(a)",advance="no") "-- Running test 'rocblas_handle_query' &
                                &(Fortran 2003 interfaces) - "

    call rocblasCheck(rocblas_create_handle(handle))
    call hipCheck(hipStreamCreate(stream))

    ! (a) Stream round-trip: set by value, get into a bare c_ptr.
    call rocblasCheck(rocblas_set_stream(handle, stream))
    call rocblasCheck(rocblas_get_stream(handle, got))

    if (transfer(got, 0_c_intptr_t) /= transfer(stream, 0_c_intptr_t)) then
        write(*,*) "FAILED! rocblas_get_stream did not return the stream that was set"
        STOP 1
    end if

    ! (b) Pointer classification against real device and host memory.
    hx = 1.0_c_double
    call hipCheck(hipMalloc(dptr, Nbytes))
    call hipCheck(hipMemcpy(dptr, c_loc(hx(1)), Nbytes, hipMemcpyHostToDevice))

    mode = rocblas_pointer_to_mode(dptr)
    if (mode /= rocblas_pointer_mode_device) then
        write(*,*) "FAILED! rocblas_pointer_to_mode misclassified the device allocation, mode = ", mode
        call hipCheck(hipFree(dptr))
        STOP 1
    end if

    mode = rocblas_pointer_to_mode(c_loc(hx(1)))
    if (mode /= rocblas_pointer_mode_host) then
        write(*,*) "FAILED! rocblas_pointer_to_mode misclassified the host array, mode = ", mode
        call hipCheck(hipFree(dptr))
        STOP 1
    end if

    call hipCheck(hipFree(dptr))

    call rocblasCheck(rocblas_destroy_handle(handle))
    call hipCheck(hipStreamDestroy(stream))

    write(*,*) "PASSED! stream round-trip ok, pointer modes host/device ok"

end program rocblas_handle_query
