!!!!!!!!!!!!!!
! rocsparse scsrilu0 example (incomplete LU, single)
! see: https:!rocm.docs.amd.com/projects/rocSPARSE/en/latest/
!
! Computes the ILU(0) factorization of a sparse matrix in place
! (buffer_size -> analysis -> compute, with a mat descriptor and a mat info
! object). For a tridiagonal matrix there is no fill-in, so ILU(0) equals the
! exact LU factorization and the overwritten CSR values are checked against the
! hand-computed factors (unit lower L, upper U packed into one array).
!
!   A = [ 4 1 0 ]     LU (in place) = [ 4    1    0   ]
!       [ 1 4 1 ]                     [ 1/4  15/4 1   ]
!       [ 0 1 4 ]                     [ 0    4/15 56/15]
!!!!!!!!!!!!!!
!
program zcsrilu0
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocsparse
  implicit none
  integer :: i
  integer(c_int), parameter :: m = 3, nnz = 7
  integer(c_int) :: hRowPtr(4) = (/0, 2, 5, 7/)
  integer(c_int) :: hColInd(7) = (/0, 1, 0, 1, 2, 1, 2/)
  complex(c_double_complex) :: hVal(7) = (/ &
    (4.0d0,0.0d0), (1.0d0,0.0d0), (1.0d0,0.0d0), (4.0d0,0.0d0), &
    (1.0d0,0.0d0), (1.0d0,0.0d0), (4.0d0,0.0d0)/)
  complex(c_double_complex) :: hOut(7)
  complex(c_double_complex) :: hExp(7)
  type(c_ptr) :: handle = c_null_ptr
  type(c_ptr) :: descr = c_null_ptr, info = c_null_ptr
  integer(c_int), pointer :: dRowPtr(:), dColInd(:)
  complex(c_double_complex), pointer :: dVal(:)
  type(c_ptr) :: dBuf
  integer(c_size_t) :: bufSize
  write(*,"(a)",advance="no") "-- Running test 'rocsparse_zcsrilu0' (Fortran 2008 interfaces) - "

  hExp(1) = (4.0d0,0.0d0)
  hExp(2) = (1.0d0,0.0d0)
  hExp(3) = (1.0d0,0.0d0)/(4.0d0,0.0d0)
  hExp(4) = (4.0d0,0.0d0) - ((1.0d0,0.0d0)/(4.0d0,0.0d0))*(1.0d0,0.0d0)
  hExp(5) = (1.0d0,0.0d0)
  hExp(6) = (1.0d0,0.0d0)/hExp(4)
  hExp(7) = (4.0d0,0.0d0) - hExp(6)*(1.0d0,0.0d0)

  call hipCheck(hipMalloc(dRowPtr, source=hRowPtr))
  call hipCheck(hipMalloc(dColInd, source=hColInd))
  call hipCheck(hipMalloc(dVal,    source=hVal))

  call rocsparseCheck(rocsparse_create_handle(handle))
  call rocsparseCheck(rocsparse_create_mat_descr(descr))
  call rocsparseCheck(rocsparse_create_mat_info(info))

  call rocsparseCheck(rocsparse_zcsrilu0_buffer_size(handle, m, nnz, descr, dVal, dRowPtr, &
       dColInd, info, bufSize))
  call hipCheck(hipMalloc(dBuf, max(bufSize, 1_c_size_t)))
  call rocsparseCheck(rocsparse_zcsrilu0_analysis(handle, m, nnz, descr, dVal, dRowPtr, dColInd, &
       info, rocsparse_analysis_policy_reuse, rocsparse_solve_policy_auto, dBuf))
  call rocsparseCheck(rocsparse_zcsrilu0(handle, m, nnz, descr, dVal, dRowPtr, dColInd, &
       info, rocsparse_solve_policy_auto, dBuf))
  call hipCheck(hipDeviceSynchronize())
  call hipCheck(hipMemcpy(hOut, dVal, hipMemcpyDeviceToHost))

  do i = 1, nnz
     if (abs(hOut(i) - hExp(i)) > 1.0d-10) then
        write(*,*) "FAILED! val(", i, ") = ", hOut(i), " expected ", hExp(i); call exit(1)
     end if
  end do
  call rocsparseCheck(rocsparse_destroy_mat_info(info))
  call rocsparseCheck(rocsparse_destroy_mat_descr(descr))
  call rocsparseCheck(rocsparse_destroy_handle(handle))
  call hipCheck(hipFree(dRowPtr)); call hipCheck(hipFree(dColInd)); call hipCheck(hipFree(dVal))
  call hipCheck(hipFree(dBuf))
  write(*,*) "PASSED!"
end program zcsrilu0
