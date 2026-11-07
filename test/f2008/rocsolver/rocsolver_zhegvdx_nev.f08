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

!!!!!!!!!!!!!!
! rocsolver_zhegvdx: `nev` and `info` as device-only scalars (Fortran 2008
! interfaces)
!
! nev and info are single values the GPU writes (the array overloads took them
! as one-element arrays before). They are taken as one integer that lives on
! the device (a rank-0 pointer allocated with hipMalloc): with A, B and Z as
! 2-D device arrays the call resolves to rocsolver_zhegvdx_full_rank, and with
! nev and info as type(c_ptr) to rocsolver_zhegvdx_full_rank_devptr.
! A is the Hermitian tridiagonal matrix with 2 on the diagonal and -i / +i
! off it, unitarily similar to tridiag(-1, 2, -1): its eigenvalues are
! 2 - 2 cos(k pi / (n+1)). With B = I and erange = index, il..iu, checks
! nev = iu - il + 1, eigenvalues il..iu, and A z = lambda z for their vectors.
!!!!!!!!!!!!!!
!
program zhegvdx_nev
  use iso_c_binding
  use hip
  use rocblas
  use rocsolver

  implicit none
  integer :: i, k, form
  integer(c_int), parameter :: N = 5, lda = 5, ldb = 5, ldz = 5, il = 2, iu = 4
  real(c_double), parameter :: pi = 4.0d0 * atan(1.0d0)
  real(c_double), parameter :: vl = 0.0d0, vu = 0.0d0   ! unused with erange = index
  complex(c_double_complex) :: hA(N,N), hB(N,N), hZ(ldz,N), r(N)
  real(c_double) :: hW(N), wref
  integer(c_int) :: hNev, hInfo
  complex(c_double_complex), pointer :: dA(:,:), dB(:,:), dZ(:,:)
  real(c_double), pointer :: dW(:)
  integer(c_int), pointer :: dNev          ! device scalars (rank 0)
  integer(c_int), pointer :: dInfo
  type(c_ptr) :: handle
  real(c_double), parameter :: tol = 1.0d-12

  write(*,"(a)",advance="no") "-- Running test 'rocsolver_zhegvdx_nev' (Fortran 2008 interfaces) - "

  hA = (0.0d0, 0.0d0); hB = (0.0d0, 0.0d0)
  do i = 1, N
    hA(i,i) = (2.0d0, 0.0d0); hB(i,i) = (1.0d0, 0.0d0)
    if (i < N) then
      hA(i+1,i) = (0.0d0, -1.0d0); hA(i,i+1) = (0.0d0, 1.0d0)
    end if
  end do

  call rocblasCheck(rocblas_create_handle(handle))
  call hipCheck(hipMalloc(dA, lda, N))
  call hipCheck(hipMalloc(dB, ldb, N))
  call hipCheck(hipMalloc(dZ, ldz, N))
  call hipCheck(hipMalloc(dW, N))
  call hipCheck(hipMalloc(dNev))
  call hipCheck(hipMalloc(dInfo))

  do form = 1, 2
    call hipCheck(hipMemcpy(dA, hA, hipMemcpyHostToDevice))
    call hipCheck(hipMemcpy(dB, hB, hipMemcpyHostToDevice))
    hNev = -1; hInfo = -1
    call hipCheck(hipMemcpy(dNev, hNev, hipMemcpyHostToDevice))
    call hipCheck(hipMemcpy(dInfo, hInfo, hipMemcpyHostToDevice))
    if (form == 1) then
      ! nev, info as integer device variables -> _full_rank
      call rocsolverCheck(rocsolver_zhegvdx(handle, rocblas_eform_ax, rocblas_evect_original, &
           rocblas_erange_index, rocblas_fill_upper, N, dA, lda, dB, ldb, vl, vu, il, iu, &
           dNev, dW, dZ, ldz, dInfo))
    else
      ! nev, info as type(c_ptr) -> _full_rank_devptr
      call rocsolverCheck(rocsolver_zhegvdx(handle, rocblas_eform_ax, rocblas_evect_original, &
           rocblas_erange_index, rocblas_fill_upper, N, dA, lda, dB, ldb, vl, vu, il, iu, &
           c_loc(dNev), dW, dZ, ldz, c_loc(dInfo)))
    end if
    call hipCheck(hipMemcpy(hNev, dNev, hipMemcpyDeviceToHost))
    call hipCheck(hipMemcpy(hInfo, dInfo, hipMemcpyDeviceToHost))
    call hipCheck(hipMemcpy(hW, dW, hipMemcpyDeviceToHost))
    call hipCheck(hipMemcpy(hZ, dZ, hipMemcpyDeviceToHost))

    if (hInfo /= 0) then
      write(*,*) "FAILED! form ", form, " info = ", hInfo, " (expected 0)"; call exit(1)
    end if
    if (hNev /= iu - il + 1) then
      write(*,*) "FAILED! form ", form, " nev = ", hNev, " expected ", iu - il + 1; call exit(1)
    end if
    do k = 1, hNev
      wref = 2.0d0 - 2.0d0 * cos((il + k - 1) * pi / (N + 1))
      if (abs(hW(k) - wref) > tol) then
        write(*,*) "FAILED! form ", form, " W(", k, ") = ", hW(k), " expected ", wref; call exit(1)
      end if
      ! eigenvector: A z = lambda z (B = I)
      r = matmul(hA, hZ(1:N,k)) - hW(k) * hZ(1:N,k)
      if (maxval(abs(r)) > tol .or. abs(sqrt(sum(abs(hZ(1:N,k))**2)) - 1.0d0) > tol) then
        write(*,*) "FAILED! form ", form, " eigenvector ", k, " residual ", maxval(abs(r)); call exit(1)
      end if
    end do
  end do

  call hipCheck(hipFree(dA))
  call hipCheck(hipFree(dB))
  call hipCheck(hipFree(dZ))
  call hipCheck(hipFree(dW))
  call hipCheck(hipFree(dNev))
  call hipCheck(hipFree(dInfo))
  call rocblasCheck(rocblas_destroy_handle(handle))
  call hipCheck(hipDeviceReset())

  write(*,*) "PASSED!"

end program zhegvdx_nev
