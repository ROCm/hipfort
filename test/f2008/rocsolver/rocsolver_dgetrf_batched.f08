!!!!!!!!!!!!!!
! dgetrf_batched example (batched LU, array-of-pointers form)
! see: https:!rocm.docs.amd.com/projects/rocSOLVER/en/latest/
!
! Exercises the "array of device pointers" argument class: A is a device array
! of pointers, one per batch matrix (not the strided form). We factor two copies
! of the same matrix and check each against the known packed LU, plus info == 0.
! rocSOLVER writes info to DEVICE memory.
!!!!!!!!!!!!!!
!
program dgetrf_batched
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocblas
  use hipfort_rocsolver
  implicit none
  integer :: i, j, b
  integer(c_int), parameter :: M = 3, N = 3, lda = 3, batch = 2
  real(c_double), target :: hA1(3,3) = reshape((/12, 6, -4, -51, 167, 24, 4, -68, -41/), (/3,3/))
  real(c_double), target :: hA2(3,3) = reshape((/12, 6, -4, -51, 167, 24, 4, -68, -41/), (/3,3/))
  real(c_double) :: hResult(3,3) = reshape((/&
    12.0000000000000000d0,   0.500000000000000000d0,  -0.333333333333333315d0,&
   -51.0000000000000000d0, 192.500000000000000d0,      0.363636363636363688d-01,&
     4.00000000000000000d0, -70.0000000000000000d0,   -37.1212121212121176d0/), shape(hResult), order=(/2,1/))
  real(c_double), target :: hOut(3,3)
  integer(c_int), target :: hInfo(batch)
  type(c_ptr) :: d1 = c_null_ptr, d2 = c_null_ptr
  type(c_ptr), target :: hptrs(batch)
  type(c_ptr) :: dA_ptrs = c_null_ptr, dIpiv = c_null_ptr, dInfo = c_null_ptr, handle = c_null_ptr
  integer(c_size_t) :: matbytes, psize
  real(c_double) :: error
  real(c_double), parameter :: error_max = 10 * epsilon(error_max)

  write(*,"(a)",advance="no") "-- Running test 'rocsolver_dgetrf_batched' (Fortran 2008 interfaces) - "

  matbytes = int(M,c_size_t) * int(N,c_size_t) * 8
  psize    = c_sizeof(d1)   ! size of one device pointer

  ! Per-batch device matrices, copied from host.
  call hipCheck(hipMalloc(d1, matbytes))
  call hipCheck(hipMalloc(d2, matbytes))
  call hipCheck(hipMemcpy(d1, c_loc(hA1(1,1)), matbytes, hipMemcpyHostToDevice))
  call hipCheck(hipMemcpy(d2, c_loc(hA2(1,1)), matbytes, hipMemcpyHostToDevice))

  ! Device array of the two matrix pointers.
  hptrs(1) = d1
  hptrs(2) = d2
  call hipCheck(hipMalloc(dA_ptrs, int(batch,c_size_t) * psize))
  call hipCheck(hipMemcpy(dA_ptrs, c_loc(hptrs(1)), int(batch,c_size_t) * psize, hipMemcpyHostToDevice))

  ! Strided pivots (n per matrix) and one info per batch.
  call hipCheck(hipMalloc(dIpiv, int(N,c_size_t) * int(batch,c_size_t) * 4))
  call hipCheck(hipMalloc(dInfo, int(batch,c_size_t) * 4))

  call hipCheck(rocblas_create_handle(handle))

  call hipCheck(rocsolver_dgetrf_batched(handle, M, N, dA_ptrs, lda, dIpiv, int(N,c_int64_t), dInfo, batch))

  call hipCheck(hipMemcpy(c_loc(hInfo(1)), dInfo, int(batch,c_size_t)*4, hipMemcpyDeviceToHost))
  do b = 1, batch
     if (hInfo(b) /= 0) then
        write(*,*) "FAILED! info(", b, ") = ", hInfo(b)
        call exit(1)
     end if
  end do

  ! Check both factored matrices against the reference packed LU.
  do b = 1, batch
     if (b == 1) then
        call hipCheck(hipMemcpy(c_loc(hOut(1,1)), d1, matbytes, hipMemcpyDeviceToHost))
     else
        call hipCheck(hipMemcpy(c_loc(hOut(1,1)), d2, matbytes, hipMemcpyDeviceToHost))
     end if
     do j = 1, N
        do i = 1, M
           error = abs(hOut(i,j) - hResult(i,j)) / max(abs(hResult(i,j)), 1.0_c_double)
           if (error > error_max) then
              write(*,*) "FAILED! batch ", b, " hOut(", i, ",", j, ") = ", hOut(i,j)
              call exit(1)
           end if
        end do
     end do
  end do

  call hipCheck(hipFree(d1)); call hipCheck(hipFree(d2)); call hipCheck(hipFree(dA_ptrs))
  call hipCheck(hipFree(dIpiv)); call hipCheck(hipFree(dInfo))
  call hipCheck(rocblas_destroy_handle(handle)); call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"

end program dgetrf_batched
