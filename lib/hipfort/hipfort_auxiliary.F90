!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! ==============================================================================
! hipfort: FORTRAN Interfaces for GPU kernels
! ==============================================================================
! Copyright (c) 2020-2026 Advanced Micro Devices, Inc. All rights reserved.
! [MITx11 License]
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
! FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
! AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
! LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
! OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
! THE SOFTWARE.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

module hipfort_auxiliary
  !>  @brief Returns device properties.
  !>
  !>  @param [out] prop written with device properties
  !>  @param [in]  deviceId which device to query for information
  !>
  !>  @returns `hipSuccess`, `hipErrorInvalidDevice`
  !>  @bug HIP-Clang always returns 0 for maxThreadsPerMultiProcessor
  !>  @bug HIP-Clang always returns 0 for regsPerBlock
  !>  @bug HIP-Clang always returns 0 for l2CacheSize
  !>
  !>  Populates hipGetDeviceProperties with information for the specified device.
  interface hipGetDeviceProperties
#ifdef USE_CUDA_NAMES
    function hipGetDeviceProperties_(prop,deviceId) bind(c, name="cudaGetDeviceProperties")
#else
    function hipGetDeviceProperties_(prop,deviceId) bind(c, name="hipGetDevicePropertiesR0600")
#endif
      use iso_c_binding
#ifdef USE_CUDA_NAMES
      use hipfort_cuda_errors
#endif
      use hipfort_enums
      use hipfort_types
      implicit none
#ifdef USE_CUDA_NAMES
      integer(kind(cudaSuccess)) :: hipGetDeviceProperties_
#else
      integer(kind(hipSuccess)) :: hipGetDeviceProperties_
#endif
      type(hipDeviceProp_t),intent(out) :: prop
      integer(c_int),value :: deviceId
    end function
  end interface

end module hipfort_auxiliary
