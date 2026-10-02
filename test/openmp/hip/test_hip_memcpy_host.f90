! HIP runtime copies driven straight onto host allocatables: no hipMalloc, no
! OpenMP mapping. The GPU reads and writes the Fortran arrays in place, which
! requires unified shared memory.
!
! hipMemset is not exercised here: it rejects a plain host pointer with
! hipErrorInvalidValue even when XNACK is on.
program test_hip_memcpy_host

        use iso_fortran_env,  only: i32=>int32
        use iso_c_binding
        use hipfort
        use hipfort_enums

        implicit none

        integer(i32), parameter :: n = 1024
        integer(c_int), allocatable, target :: a(:), b(:), c(:)
        type(c_ptr)       :: stream = c_null_ptr
        integer(c_size_t) :: nbytes
        integer(i32) :: cerr, i
        character(len=8) :: xnack

        call get_environment_variable("HSA_XNACK", xnack)
        write(*,*) "HSA_XNACK = ", trim(xnack)

        nbytes = int(n, c_size_t) * 4
        allocate(a(n), b(n), c(n))
        do i = 1, n
           a(i) = i
        end do
        b = -1
        c = -1

        cerr = hipSetDevice(0)
        if (cerr /= hipSuccess) error stop "hipSetDevice failed"

        cerr = hipMemcpy(c_loc(b(1)), c_loc(a(1)), nbytes, hipMemcpyDeviceToDevice)
        if (cerr /= hipSuccess) then
           write(*,*) "hipMemcpy on host buffers returned ", cerr
           error stop "FAILED"
        end if

        cerr = hipDeviceSynchronize()
        if (cerr /= hipSuccess) error stop "hipDeviceSynchronize failed"

        do i = 1, n
           if (b(i) /= a(i)) then
              write(*,*) "after memcpy b(", i, ") = ", b(i), " expected ", a(i)
              error stop "FAILED"
           end if
        end do

        cerr = hipStreamCreate(stream)
        if (cerr /= hipSuccess) error stop "hipStreamCreate failed"

        cerr = hipMemcpyAsync(c_loc(c(1)), c_loc(b(1)), nbytes, hipMemcpyDeviceToDevice, stream)
        if (cerr /= hipSuccess) then
           write(*,*) "hipMemcpyAsync on host buffers returned ", cerr
           error stop "FAILED"
        end if

        cerr = hipStreamSynchronize(stream)
        if (cerr /= hipSuccess) error stop "hipStreamSynchronize failed"

        do i = 1, n
           if (c(i) /= a(i)) then
              write(*,*) "after async memcpy c(", i, ") = ", c(i), " expected ", a(i)
              error stop "FAILED"
           end if
        end do

        cerr = hipStreamDestroy(stream)
        if (cerr /= hipSuccess) error stop "hipStreamDestroy failed"

        deallocate(a, b, c)

        write(*,*) "PASSED!"

end program test_hip_memcpy_host
