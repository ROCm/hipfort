!!!!!!!!!!!!!!
! rocsparse scsric0 example (incomplete Cholesky, single)
! see: https:!rocm.docs.amd.com/projects/rocSPARSE/en/latest/
!
! Computes the IC(0) factorization of an SPD sparse matrix in place
! (buffer_size -> analysis -> compute, with a mat descriptor and a mat info
! object). For an SPD tridiagonal matrix there is no fill-in, so IC(0) equals the
! exact Cholesky factor L (A = L*L^T). csric0 overwrites the lower-triangular
! part (including the diagonal) with L; the strict upper part is left unchanged.
! The lower/diagonal CSR entries are checked against the hand-computed L.
!
!   A = [ 4 1 0 ]   L = [ 2       0        0      ]
!       [ 1 4 1 ]       [ 1/2     sqrt(15)/2   0  ]
!       [ 0 1 4 ]       [ 0       2/sqrt(15) l33  ]
!!!!!!!!!!!!!!
!
program scsric0
  use iso_c_binding
  use hipfort
  use hipfort_check
  use hipfort_rocsparse
  implicit none
  integer :: i
  integer(c_int), parameter :: m = 3, nnz = 7
  integer(c_int) :: hRowPtr(4) = (/0, 2, 5, 7/)
  integer(c_int) :: hColInd(7) = (/0, 1, 0, 1, 2, 1, 2/)
  real(c_float) :: hVal(7) = (/4.0, 1.0, 1.0, 4.0, 1.0, 1.0, 4.0/)
  real(c_float) :: hOut(7)
  real(c_float) :: L11, L21, L22, L32, L33
  type(c_ptr) :: handle = c_null_ptr
  type(c_ptr) :: descr = c_null_ptr, info = c_null_ptr
  integer(c_int), pointer :: dRowPtr(:), dColInd(:)
  real(c_float), pointer :: dVal(:)
  type(c_ptr) :: dBuf
  integer(c_size_t) :: bufSize
  write(*,"(a)",advance="no") "-- Running test 'rocsparse_scsric0' (Fortran 2008 interfaces) - "

  L11 = sqrt(4.0)
  L21 = 1.0 / L11
  L22 = sqrt(4.0 - L21*L21)
  L32 = 1.0 / L22
  L33 = sqrt(4.0 - L32*L32)

  call hipCheck(hipMalloc(dRowPtr, source=hRowPtr))
  call hipCheck(hipMalloc(dColInd, source=hColInd))
  call hipCheck(hipMalloc(dVal,    source=hVal))

  call rocsparseCheck(rocsparse_create_handle(handle))
  call rocsparseCheck(rocsparse_create_mat_descr(descr))
  call rocsparseCheck(rocsparse_create_mat_info(info))

  call rocsparseCheck(rocsparse_scsric0_buffer_size(handle, m, nnz, descr, dVal, dRowPtr, &
       dColInd, info, bufSize))
  call hipCheck(hipMalloc(dBuf, max(bufSize, 1_c_size_t)))
  call rocsparseCheck(rocsparse_scsric0_analysis(handle, m, nnz, descr, dVal, dRowPtr, dColInd, &
       info, rocsparse_analysis_policy_reuse, rocsparse_solve_policy_auto, dBuf))
  call rocsparseCheck(rocsparse_scsric0(handle, m, nnz, descr, dVal, dRowPtr, dColInd, &
       info, rocsparse_solve_policy_auto, dBuf))
  call hipCheck(hipDeviceSynchronize())
  call hipCheck(hipMemcpy(hOut, dVal, hipMemcpyDeviceToHost))

  if (abs(hOut(1) - L11) > 1.0e-5 .or. abs(hOut(3) - L21) > 1.0e-5 .or. &
      abs(hOut(4) - L22) > 1.0e-5 .or. abs(hOut(6) - L32) > 1.0e-5 .or. &
      abs(hOut(7) - L33) > 1.0e-5) then
     write(*,*) "FAILED! L = ", hOut(1), hOut(3), hOut(4), hOut(6), hOut(7), &
                " expected ", L11, L21, L22, L32, L33
     call exit(1)
  end if
  call rocsparseCheck(rocsparse_destroy_mat_info(info))
  call rocsparseCheck(rocsparse_destroy_mat_descr(descr))
  call rocsparseCheck(rocsparse_destroy_handle(handle))
  call hipCheck(hipFree(dRowPtr)); call hipCheck(hipFree(dColInd)); call hipCheck(hipFree(dVal))
  call hipCheck(hipFree(dBuf))
  write(*,*) "PASSED!"
end program scsric0
