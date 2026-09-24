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

module roctx
  use, intrinsic :: iso_c_binding
  implicit none

  interface

    !---------------------------------------------
    ! roctxMark
    !---------------------------------------------
    !>  Mark an event.
    !>
    !>  @param[in] message - The message associated with the event.
    subroutine roctxMark(message) &
       bind(C, name="roctxMarkA")
       import :: c_ptr
       type(c_ptr), value :: message
    end subroutine roctxMark

    !---------------------------------------------
    ! roctxRangePush
    !---------------------------------------------
    !>  Start a new nested range.
    !>
    !>  Nested ranges are stacked and local to the current CPU thread.
    !>
    !>  @param[in] message - The message associated with this range.
    !>
    !>  @return Returns the level this nested range is started at. Nested range
    !>  levels are 0 based.
    function roctxRangePush(message) &
       result(RangePush) &
       bind(C, name="roctxRangePushA")
       import :: c_ptr, c_int
       type(c_ptr), value :: message
       integer(c_int) :: RangePush
    end function roctxRangePush

    !---------------------------------------------
    ! roctxRangePop
    !---------------------------------------------
    !>  Stop the current nested range.
    !>
    !>  Stop the current nested range, and pop it from the stack. If a nested range
    !>  was active before the last one was started, it becomes again the current
    !>  nested range.
    !>
    !>  @return Returns the level the stopped nested range was started at, or a
    !>  negative value if there was no nested range active.
    function roctxRangePop() &
       result(RangePop) &
       bind(C, name="roctxRangePop")
       import :: c_int
       integer(c_int) :: RangePop
    end function roctxRangePop

    !---------------------------------------------
    ! roctxRangeStart
    !---------------------------------------------
    !>  @brief Starts a process range.
    !>
    !>  Start/stop ranges can be started and stopped in different threads. Each
    !>  timespan is assigned a unique range ID.
    !>
    !>  @param [in] message The message associated with this range.
    !>
    !>  @return Returns the ID of the new range.
    function roctxRangeStart(message) &
       result(RangeStart) &
       bind(C, name="roctxRangeStartA")
       import :: c_ptr, c_int64_t
       type(c_ptr), value :: message
       integer(c_int64_t) :: RangeStart
    end function roctxRangeStart

    !---------------------------------------------
    ! roctxRangeStop
    !---------------------------------------------
    !>  Stop a process range.
    !>
    !>  @param [in] id `roctx_range_id_t` returned from `roctxRangeStartA` to stop
    subroutine roctxRangeStop(id) &
       bind(C, name="roctxRangeStop")
       import :: c_int64_t
       integer(c_int64_t), value :: id
    end subroutine roctxRangeStop

    !---------------------------------------------
    ! roctxProfilerPause
    !---------------------------------------------
    !>  @brief Request any currently running profiling tool that is should stop collecting data.
    !>
    !>  Within a profiling tool, it is recommended that the tool cache all active contexts at the
    !>  time of
    !>  the request and then stop them. By convention, the application should pass zero to indicate
    !>  a
    !>  global pause of the profiler in the current process. If the application wishes to pause only
    !>  the
    !>  current thread, the application should obtain the thread ID via `roctxGetThreadId`.
    !>
    !>  @param [in] tid Zero for all threads in current process or non-zero for a specific thread
    !>
    !>  @return int A profiling tool may choose to set this value to a non-zero value to indicate a
    !>  failure while executing the request or lack of support. If the profiling tool supports
    !>  pausing
    !>  but is already paused, the tool should ignore the request and return zero.
    function roctxProfilerPause(tid) &
       result(ProfilerPause) &
       bind(C, name="roctxProfilerPause")
       import :: c_int64_t, c_int
       integer(c_int64_t), value :: tid
       integer(c_int) :: ProfilerPause
    end function roctxProfilerPause

    !---------------------------------------------
    ! roctxProfilerResume
    !---------------------------------------------
    !>  @brief Request any currently running profiling tool that is should resume collecting data.
    !>
    !>  Within a profiling tool, it is recommended that the tool re-activated the active contexts
    !>  which
    !>  were cached when the pause request was issued. By convention, the application should pass
    !>  zero to
    !>  indicate a global pause of the profiler in the current process. If the application wishes to
    !>  pause only the current thread, the application should obtain the thread ID via
    !>  `roctxGetThreadId`.
    !>
    !>  @param [in] tid Zero for all threads in current process or non-zero for a specific thread
    !>
    !>  @return int A profiling tool may choose to set this value to a non-zero value to indicate a
    !>  failure while executing the request or lack of support. If the profiling tool is supports
    !>  resuming but is already active, the tool should ignore the request and return zero.
    function roctxProfilerResume(tid) &
       result(ProfilerResume) &
       bind(C, name="roctxProfilerResume")
       import :: c_int64_t, c_int
       integer(c_int64_t), value :: tid
       integer(c_int) :: ProfilerResume
    end function roctxProfilerResume

    !---------------------------------------------
    ! roctxNameOsThread
    !---------------------------------------------
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
    function roctxNameOsThread(name) &
       result(NameOsThread) &
       bind(C, name="roctxNameOsThread")
       import :: c_ptr, c_int
       type(c_ptr), value :: name
       integer(c_int) :: NameOsThread
    end function roctxNameOsThread

    !---------------------------------------------
    ! roctxNameHsaAgent
    !---------------------------------------------
    !>  @brief Indicate to a profiling tool that, where possible, you would like the given HSA agent
    !>  to be labeled by the provided name in the output of the profiling tool.
    !>
    !>  Rocprofiler does not provide any explicit support for how profiling tools handle this
    !>  request:
    !>  support for this capability is tool specific.
    !>
    !>  @param [in] name Name for the specified agent
    !>  @param [in] agent Pointer to a HSA agent identifier
    !>
    !>  @return int A profiling tool may choose to set this value to a non-zero value to indicate a
    !>  failure while executing the request or lack of support
    function roctxNameHsaAgent(name, agent) &
       result(NameHsaAgent) &
       bind(C, name="roctxNameHsaAgent")
       import :: c_ptr, c_int
       type(c_ptr), value :: name
       type(c_ptr), value :: agent
       integer(c_int) :: NameHsaAgent
    end function roctxNameHsaAgent

    !---------------------------------------------
    ! roctxNameHipDevice
    !---------------------------------------------
    !>  @brief Indicate to a profiling tool that, where possible, you would like the given HIP
    !>  device id
    !>  to be labeled by the provided name in the output of the profiling tool.
    !>
    !>  Rocprofiler does not provide any explicit support for how profiling tools handle this
    !>  request:
    !>  support for this capability is tool specific.
    !>
    !>  @param [in] name Name for the specified device
    !>  @param [in] device_id HIP device ordinal
    !>
    !>  @return int A profiling tool may choose to set this value to a non-zero value to indicate a
    !>  failure while executing the request or lack of support
    function roctxNameHipDevice(name, device_id) &
       result(NameHipDevice) &
       bind(C, name="roctxNameHipDevice")
       import :: c_ptr, c_int
       type(c_ptr), value :: name
       integer(c_int), value :: device_id
       integer(c_int) :: NameHipDevice
    end function roctxNameHipDevice

    !---------------------------------------------
    ! roctxNameHipStream
    !---------------------------------------------
    !>  @brief Indicate to a profiling tool that, where possible, you would like the given HIP
    !>  stream
    !>  to be labeled by the provided name in the output of the profiling tool.
    !>
    !>  Rocprofiler does not provide any explicit support for how profiling tools handle this
    !>  request:
    !>  support for this capability is tool specific.
    !>
    !>  @param [in] name Name for the specified stream
    !>  @param [in] stream A `hipStream_t` value (hipStream_t == ihipStream_t*)
    !>
    !>  @return int A profiling tool may choose to set this value to a non-zero value to indicate a
    !>  failure while executing the request or lack of support
    function roctxNameHipStream(name, stream) &
       result(NameHipStream) &
       bind(C, name="roctxNameHipStream")
       import :: c_ptr, c_int
       type(c_ptr), value :: name
       type(c_ptr), value :: stream
       integer(c_int) :: NameHipStream
    end function roctxNameHipStream

    !---------------------------------------------
    ! roctxGetThreadId
    !---------------------------------------------
    !>  @brief Retrieve a id value for the current thread which will be identical to the id value a
    !>  profiling tool gets via `rocprofiler_get_thread_id(rocprofiler_thread_id_t*)`
    !>
    !>  @param tid - [out] Pointer to where the value should be placed
    !>
    !>  @return int A profiling tool may choose to set this value to a non-zero value to indicate a
    !>  failure while executing the request or lack of support
    function roctxGetThreadId(tid) &
       result(GetThreadId) &
       bind(C, name="roctxGetThreadId")
       import :: c_ptr, c_int
       type(c_ptr), value :: tid
       integer(c_int) :: GetThreadId
    end function roctxGetThreadId

  end interface

end module roctx
