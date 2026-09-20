!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! ==============================================================================
! hipfort: FORTRAN Interfaces for GPU kernels
! ==============================================================================
! Copyright (c) 2024-2026 Advanced Micro Devices, Inc. All rights reserved.
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

module hipfort_roctx
  use, intrinsic :: iso_c_binding
  implicit none

  !>  Mark an event.
  !>
  !>  @param[in] message - The message associated with the event.
  interface roctxMark
    subroutine roctxMark_(message) bind(c, name="roctxMarkA")
      use iso_c_binding
      implicit none
      type(c_ptr),value :: message
    end subroutine
  end interface

  !>  Start a new nested range.
  !>
  !>  Nested ranges are stacked and local to the current CPU thread.
  !>
  !>  @param[in] message - The message associated with this range.
  !>
  !>  @return Returns the level this nested range is started at. Nested range
  !>  levels are 0 based.
  interface roctxRangePush
    function roctxRangePush_(message) bind(c, name="roctxRangePushA")
      use iso_c_binding
      implicit none
      integer(c_int) :: roctxRangePush_
      type(c_ptr),value :: message
    end function
  end interface

  !>  Stop the current nested range.
  !>
  !>  Stop the current nested range, and pop it from the stack. If a nested range
  !>  was active before the last one was started, it becomes again the current
  !>  nested range.
  !>
  !>  @return Returns the level the stopped nested range was started at, or a
  !>  negative value if there was no nested range active.
  interface roctxRangePop
    function roctxRangePop_() bind(c, name="roctxRangePop")
      use iso_c_binding
      implicit none
      integer(c_int) :: roctxRangePop_
    end function
  end interface

  !>  @brief Starts a process range.
  !>
  !>  Start/stop ranges can be started and stopped in different threads. Each
  !>  timespan is assigned a unique range ID.
  !>
  !>  @param [in] message The message associated with this range.
  !>
  !>  @return Returns the ID of the new range.
  interface roctxRangeStart
    function roctxRangeStart_(message) bind(c, name="roctxRangeStartA")
      use iso_c_binding
      implicit none
      integer(c_int64_t) :: roctxRangeStart_
      type(c_ptr),value :: message
    end function
  end interface

  !>  Stop a process range.
  !>
  !>  @param [in] id `roctx_range_id_t` returned from `roctxRangeStartA` to stop
  interface roctxRangeStop
    subroutine roctxRangeStop_(id) bind(c, name="roctxRangeStop")
      use iso_c_binding
      implicit none
      integer(c_int64_t),value :: id
    end subroutine
  end interface

  !>  @brief Request any currently running profiling tool that is should stop collecting data.
  !>
  !>  Within a profiling tool, it is recommended that the tool cache all active contexts at the time
  !>  of
  !>  the request and then stop them. By convention, the application should pass zero to indicate a
  !>  global pause of the profiler in the current process. If the application wishes to pause only
  !>  the
  !>  current thread, the application should obtain the thread ID via `roctxGetThreadId`.
  !>
  !>  @param [in] tid Zero for all threads in current process or non-zero for a specific thread
  !>
  !>  @return int A profiling tool may choose to set this value to a non-zero value to indicate a
  !>  failure while executing the request or lack of support. If the profiling tool supports pausing
  !>  but is already paused, the tool should ignore the request and return zero.
  interface roctxProfilerPause
    function roctxProfilerPause_(tid) bind(c, name="roctxProfilerPause")
      use iso_c_binding
      implicit none
      integer(c_int) :: roctxProfilerPause_
      integer(c_int64_t),value :: tid
    end function
  end interface

  !>  @brief Request any currently running profiling tool that is should resume collecting data.
  !>
  !>  Within a profiling tool, it is recommended that the tool re-activated the active contexts
  !>  which
  !>  were cached when the pause request was issued. By convention, the application should pass zero
  !>  to
  !>  indicate a global pause of the profiler in the current process. If the application wishes to
  !>  pause only the current thread, the application should obtain the thread ID via
  !>  `roctxGetThreadId`.
  !>
  !>  @param [in] tid Zero for all threads in current process or non-zero for a specific thread
  !>
  !>  @return int A profiling tool may choose to set this value to a non-zero value to indicate a
  !>  failure while executing the request or lack of support. If the profiling tool is supports
  !>  resuming but is already active, the tool should ignore the request and return zero.
  interface roctxProfilerResume
    function roctxProfilerResume_(tid) bind(c, name="roctxProfilerResume")
      use iso_c_binding
      implicit none
      integer(c_int) :: roctxProfilerResume_
      integer(c_int64_t),value :: tid
    end function
  end interface

  !>  @brief Indicate to a profiling tool that, where possible, you would like the current CPU OS
  !>  thread to be labeled by the provided name in the output of the profiling tool.
  !>
  !>  Rocprofiler does not provide explicit support for how profiling tools handle this request:
  !>  support for this capability is tool specific. ROCTx does NOT rename the thread via
  !>  `pthread_setname_np`.
  !>
  !>  @param [in] name Name for the current OS thread
  !>
  !>  @return int A profiling tool may choose to set this value to a non-zero value to indicate a
  !>  failure while executing the request or lack of support
  interface roctxNameOsThread
    function roctxNameOsThread_(name) bind(c, name="roctxNameOsThread")
      use iso_c_binding
      implicit none
      integer(c_int) :: roctxNameOsThread_
      type(c_ptr),value :: name
    end function
  end interface

  !>  @brief Indicate to a profiling tool that, where possible, you would like the given HSA agent
  !>  to be labeled by the provided name in the output of the profiling tool.
  !>
  !>  Rocprofiler does not provide any explicit support for how profiling tools handle this request:
  !>  support for this capability is tool specific.
  !>
  !>  @param [in] name Name for the specified agent
  !>  @param [in] agent Pointer to a HSA agent identifier
  !>
  !>  @return int A profiling tool may choose to set this value to a non-zero value to indicate a
  !>  failure while executing the request or lack of support
  interface roctxNameHsaAgent
    function roctxNameHsaAgent_(name,agent) bind(c, name="roctxNameHsaAgent")
      use iso_c_binding
      implicit none
      integer(c_int) :: roctxNameHsaAgent_
      type(c_ptr),value :: name
      type(c_ptr),value :: agent
    end function
  end interface

  !>  @brief Indicate to a profiling tool that, where possible, you would like the given HIP device
  !>  id
  !>  to be labeled by the provided name in the output of the profiling tool.
  !>
  !>  Rocprofiler does not provide any explicit support for how profiling tools handle this request:
  !>  support for this capability is tool specific.
  !>
  !>  @param [in] name Name for the specified device
  !>  @param [in] device_id HIP device ordinal
  !>
  !>  @return int A profiling tool may choose to set this value to a non-zero value to indicate a
  !>  failure while executing the request or lack of support
  interface roctxNameHipDevice
    function roctxNameHipDevice_(name,device_id) bind(c, name="roctxNameHipDevice")
      use iso_c_binding
      implicit none
      integer(c_int) :: roctxNameHipDevice_
      type(c_ptr),value :: name
      integer(c_int),value :: device_id
    end function
  end interface

  !>  @brief Indicate to a profiling tool that, where possible, you would like the given HIP stream
  !>  to be labeled by the provided name in the output of the profiling tool.
  !>
  !>  Rocprofiler does not provide any explicit support for how profiling tools handle this request:
  !>  support for this capability is tool specific.
  !>
  !>  @param [in] name Name for the specified stream
  !>  @param [in] stream A `hipStream_t` value (hipStream_t == ihipStream_t*)
  !>
  !>  @return int A profiling tool may choose to set this value to a non-zero value to indicate a
  !>  failure while executing the request or lack of support
  interface roctxNameHipStream
    function roctxNameHipStream_(name,stream) bind(c, name="roctxNameHipStream")
      use iso_c_binding
      implicit none
      integer(c_int) :: roctxNameHipStream_
      type(c_ptr),value :: name
      type(c_ptr),value :: stream
    end function
  end interface

  !>  @brief Retrieve a id value for the current thread which will be identical to the id value a
  !>  profiling tool gets via `rocprofiler_get_thread_id(rocprofiler_thread_id_t*)`
  !>
  !>  @param tid - [out] Pointer to where the value should be placed
  !>
  !>  @return int A profiling tool may choose to set this value to a non-zero value to indicate a
  !>  failure while executing the request or lack of support
  interface roctxGetThreadId
    function roctxGetThreadId_(tid) bind(c, name="roctxGetThreadId")
      use iso_c_binding
      implicit none
      integer(c_int) :: roctxGetThreadId_
      type(c_ptr),value :: tid
    end function
  end interface

end module hipfort_roctx
