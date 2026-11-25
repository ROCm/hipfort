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

module hipfort_rccl
  use hipfort_rccl_enums
  use hipfort_rccl_types
  implicit none

  interface ncclMemAlloc
    function ncclMemAlloc_(ptr,mySize) bind(c, name="ncclMemAlloc")
      import
      implicit none
      integer(c_int) :: ncclMemAlloc_
      type(c_ptr) :: ptr
      integer(c_size_t),value :: mySize
    end function
  end interface

  interface ncclMemFree
    function ncclMemFree_(ptr) bind(c, name="ncclMemFree")
      import
      implicit none
      integer(c_int) :: ncclMemFree_
      type(c_ptr),value :: ptr
    end function
  end interface

  !>  @brief      Return the RCCL_VERSION_CODE of RCCL in the supplied integer.
  !>     @details    This integer is coded with the MAJOR, MINOR and PATCH level of RCCL.
  !>     @return     Result code. See `rccl_result_code` for more details.
  !>
  !>     @param[out] version - Pointer to where version will be stored
  interface ncclGetVersion
    function ncclGetVersion_(version) bind(c, name="ncclGetVersion")
      import
      implicit none
      integer(c_int) :: ncclGetVersion_
      type(c_ptr),value :: version
    end function

    module procedure ncclGetVersion_typed
  end interface

  !>  @brief      Generates an ID for ncclCommInitRank.
  !>     @details    Generates an ID to be used in ncclCommInitRank.
  !>                 ncclGetUniqueId should be called once by a single rank and the
  !>                 ID should be distributed to all ranks in the communicator before
  !>                 using it as a parameter for ncclCommInitRank.
  !>     @return     Result code. See `rccl_result_code` for more details.
  !>
  !>     @param[out] uniqueId - Pointer to where uniqueId will be stored
  interface ncclGetUniqueId
    function ncclGetUniqueId_(uniqueId) bind(c, name="ncclGetUniqueId")
      import
      implicit none
      integer(c_int) :: ncclGetUniqueId_
      type(ncclUniqueId) :: uniqueId
    end function
  end interface

  !>  @brief      Create a new communicator with config.
  !>     @details    Create a new communicator (multi thread/process version) with a configuration
  !>                 set by users. See `rccl_config_type` for more details.
  !>                 Each rank is associated to a CUDA device, which has to be set before calling
  !>                 ncclCommInitRank.
  !>     @return     Result code. See `rccl_result_code` for more details.
  !>
  !>     @param[out] comm - Pointer to created communicator
  !>     @param[in] nranks - Total number of ranks participating in this communicator
  !>     @param[in] commId - UniqueId required for initialization
  !>     @param[in] rank - Current rank to create communicator for. [0 to nranks-1]
  !>     @param[in] config - Pointer to communicator configuration
  interface ncclCommInitRankConfig
    function ncclCommInitRankConfig_(comm,nranks,commId,rank,config) &
        bind(c, name="ncclCommInitRankConfig")
      import
      implicit none
      integer(c_int) :: ncclCommInitRankConfig_
      type(c_ptr) :: comm
      integer(c_int),value :: nranks
      type(ncclUniqueId),value :: commId
      integer(c_int),value :: rank
      type(ncclConfig_t) :: config
    end function
  end interface

  !>  @brief      Creates a new communicator (multi thread/process version).
  !>     @details    Rank must be between 0 and nranks-1 and unique within a communicator clique.
  !>                 Each rank is associated to a CUDA device, which has to be set before calling
  !>                 ncclCommInitRank.  ncclCommInitRank implicitly syncronizes with other ranks,
  !>                 so it must be called by different threads/processes or use
  !>                 ncclGroupStart/ncclGroupEnd.
  !>     @return     Result code. See `rccl_result_code` for more details.
  !>
  !>     @param[out] comm - Pointer to created communicator
  !>     @param[in] nranks - Total number of ranks participating in this communicator
  !>     @param[in] commId - UniqueId required for initialization
  !>     @param[in] rank - Current rank to create communicator for
  interface ncclCommInitRank
    function ncclCommInitRank_(comm,nranks,commId,rank) bind(c, name="ncclCommInitRank")
      import
      implicit none
      integer(c_int) :: ncclCommInitRank_
      type(c_ptr) :: comm
      integer(c_int),value :: nranks
      type(ncclUniqueId),value :: commId
      integer(c_int),value :: rank
    end function
  end interface

  !>  @brief      Creates a clique of communicators (single process version).
  !>     @details    This is a convenience function to create a single-process communicator clique.
  !>                 Returns an array of ndev newly initialized communicators in comm.
  !>                 comm should be pre-allocated with size at least ndev*sizeof(ncclComm_t).
  !>                 If devlist is NULL, the first ndev HIP devices are used.
  !>                 Order of devlist defines user-order of processors within the communicator.
  !>     @return     Result code. See `rccl_result_code` for more details.
  !>
  !>     @param[out] comm - Pointer to array of created communicators
  !>     @param[in] ndev - Total number of ranks participating in this communicator
  !>     @param[in] devlist - Array of GPU device indices to create for
  interface ncclCommInitAll
    function ncclCommInitAll_(comm,ndev,devlist) bind(c, name="ncclCommInitAll")
      import
      implicit none
      integer(c_int) :: ncclCommInitAll_
      type(c_ptr) :: comm(*)
      integer(c_int),value :: ndev
      type(c_ptr),value :: devlist
    end function

#ifdef USE_ASSUMED_RANK
    module procedure ncclCommInitAll_assumed_rank
#else
#ifdef USE_ASSUMED_SHAPE
    module procedure &
      ncclCommInitAll_rank_0,&
      ncclCommInitAll_rank_1
#endif
#endif
  end interface

  !>  @brief      Finalize a communicator.
  !>     @details    ncclCommFinalize flushes all issued communications
  !>                 and marks communicator state as ncclInProgress. The state will change to
  !>                 ncclSuccess
  !>                 when the communicator is globally quiescent and related resources are freed;
  !>                 then,
  !>                 calling ncclCommDestroy can locally free the rest of the resources (e.g.
  !>                 communicator
  !>                 itself) without blocking.
  !>     @return     Result code. See `rccl_result_code` for more details.
  !>
  !>     @param[in] comm - Communicator to finalize
  interface ncclCommFinalize
    function ncclCommFinalize_(comm) bind(c, name="ncclCommFinalize")
      import
      implicit none
      integer(c_int) :: ncclCommFinalize_
      type(c_ptr),value :: comm
    end function
  end interface

  !>  @brief      Frees local resources associated with communicator object.
  !>     @details    Destroy all local resources associated with the passed in communicator object
  !>     @return     Result code. See `rccl_result_code` for more details.
  !>
  !>     @param[in] comm - Communicator to destroy
  interface ncclCommDestroy
    function ncclCommDestroy_(comm) bind(c, name="ncclCommDestroy")
      import
      implicit none
      integer(c_int) :: ncclCommDestroy_
      type(c_ptr),value :: comm
    end function
  end interface

  !>  @brief      Abort any in-progress calls and destroy the communicator object.
  !>     @details    Frees resources associated with communicator object and aborts any operations
  !>                 that might still be running on the device.
  !>     @return     Result code. See `rccl_result_code` for more details.
  !>
  !>     @param[in] comm - Communicator to abort and destroy
  interface ncclCommAbort
    function ncclCommAbort_(comm) bind(c, name="ncclCommAbort")
      import
      implicit none
      integer(c_int) :: ncclCommAbort_
      type(c_ptr),value :: comm
    end function
  end interface

  !>  @brief      Revoke a communicator without destroying it.
  !>     @details    Aborts in-flight collectives by raising the comm's abort flag,
  !>                 stops the proxy service, and rejects subsequently enqueued
  !>                 collectives with ncclInvalidUsage. The abort flag is cleared
  !>                 once the asynchronous revoke job completes, so the communicator
  !>                 remains valid as a parent for ncclCommSplit / ncclCommShrink /
  !>                 ncclCommGrow, and may be torn down via ncclCommDestroy /
  !>                 ncclCommAbort.
  !>                 Because in-flight collectives are aborted (not drained), revoke
  !>                 can recover from peers that have failed mid-collective; output
  !>                 buffers of an aborted collective contain undefined data.
  !>                 ncclCommFinalize on a revoked communicator is invalid and returns
  !>                 ncclInvalidUsage.
  !>                 Pass NCCL_REVOKE_DEFAULT for revokeFlags; other values are rejected
  !>                 with ncclInvalidArgument.
  !>     @return     Result code. See `rccl_result_code` for more details.
  !>
  !>     @param[in] comm - Communicator to revoke
  !>     @param[in] revokeFlags - Reserved; must be NCCL_REVOKE_DEFAULT
  interface ncclCommRevoke
    function ncclCommRevoke_(comm,revokeFlags) bind(c, name="ncclCommRevoke")
      import
      implicit none
      integer(c_int) :: ncclCommRevoke_
      type(c_ptr),value :: comm
      integer(c_int),value :: revokeFlags
    end function
  end interface

  !>  @brief      Create one or more communicators from an existing one.
  !>     @details    Creates one or more communicators from an existing one.
  !>                 Ranks with the same color will end up in the same communicator.
  !>                 Within the new communicator, key will be used to order ranks.
  !>                 NCCL_SPLIT_NOCOLOR as color will indicate the rank will not be part of any
  !>                 group
  !>                 and will therefore return a NULL communicator.
  !>                 If config is NULL, the new communicator will inherit the original
  !>                 communicator's configuration
  !>     @return     Result code. See `rccl_result_code` for more details.
  !>
  !>     @param[in] comm - Original communicator object for this rank
  !>     @param[in] color - Color to assign this rank
  !>     @param[in] key - Key used to order ranks within the same new communicator
  !>     @param[out] newcomm - Pointer to new communicator
  !>     @param[in] config - Config file for new communicator. May be NULL to inherit from comm
  interface ncclCommSplit
    function ncclCommSplit_(comm,color,key,newcomm,config) bind(c, name="ncclCommSplit")
      import
      implicit none
      integer(c_int) :: ncclCommSplit_
      type(c_ptr),value :: comm
      integer(c_int),value :: color
      integer(c_int),value :: key
      type(c_ptr) :: newcomm
      type(ncclConfig_t) :: config
    end function
  end interface

  !>  @brief      Shrink existing communicator.
  !>     @details    Ranks in excludeRanksList will be removed form the existing communicator.
  !>                 Within the new communicator, ranks will be re-ordered to fill the gap of
  !>                 removed ones.
  !>                 If config is NULL, the new communicator will inherit the original
  !>                 communicator's configuration.
  !>                 The flag enables NCCL to adapt to various states of the parent communicator,
  !>                 see NCCL_SHRINK flags.
  !>     @return     Result code. See `rccl_result_code` for more details.
  !>
  !>     @param[in] comm - Original communicator object for this rank
  !>     @param[in] excludeRanksList - List of ranks to be exluded
  !>     @param[in] excludeRanksCount - Number of ranks to be excluded
  !>     @param[out] newcomm - Pointer to new communicator
  !>     @param[in] config - Config file for new communicator. May be NULL to inherit from comm
  !>     @param[in] shrinkFlags - Flag to adapt to various states of the parent communicator (see
  !>     NCCL_SHRINK flags)
  interface ncclCommShrink
    function ncclCommShrink_(comm,excludeRanksList,excludeRanksCount,newcomm,config,shrinkFlags) &
        bind(c, name="ncclCommShrink")
      import
      implicit none
      integer(c_int) :: ncclCommShrink_
      type(c_ptr),value :: comm
      type(c_ptr),value :: excludeRanksList
      integer(c_int),value :: excludeRanksCount
      type(c_ptr) :: newcomm
      type(ncclConfig_t) :: config
      integer(c_int),value :: shrinkFlags
    end function

#ifdef USE_ASSUMED_RANK
    module procedure ncclCommShrink_assumed_rank
#else
#ifdef USE_ASSUMED_SHAPE
    module procedure &
      ncclCommShrink_rank_0,&
      ncclCommShrink_rank_1
#endif
#endif
  end interface

  !>  @brief      Generate a per-communicator unique ID for growing a communicator.
  !>     @details    Generates a unique ID on an existing communicator. The ID must be
  !>                 distributed to the ranks joining through ncclCommGrow.
  !>                 Constraints:
  !>                 - A new ID cannot be generated while a previous ID is unconsumed.
  !>                 - Each ID can only be used once (no reuse after consumption).
  !>                 - The grow operation must complete before calling this again.
  !>     @return     Result code. See `rccl_result_code` for more details.
  !>
  !>     @param[in] comm - Existing communicator that coordinates the grow
  !>     @param[out] uniqueId - Pointer to the generated unique ID
  interface ncclCommGetUniqueId
    function ncclCommGetUniqueId_(comm,uniqueId) bind(c, name="ncclCommGetUniqueId")
      import
      implicit none
      integer(c_int) :: ncclCommGetUniqueId_
      type(c_ptr),value :: comm
      type(ncclUniqueId) :: uniqueId
    end function
  end interface

  !>  @brief      Grow a communicator by adding new ranks.
  !>     @details    Creates a larger communicator from an existing one plus newly
  !>                 joining ranks. The unique ID obtained from ncclCommGetUniqueId
  !>                 must be distributed to the new ranks. Parameter usage:
  !>                 - Existing non-root ranks: comm set, uniqueId = NULL, rank = -1
  !>                 - Existing root rank: comm set, uniqueId = &id, rank = -1
  !>                 - New ranks: comm = NULL, uniqueId = &id, rank = assigned
  !>                 The unique ID is consumed upon a successful grow and cannot be reused.
  !>                 If config is NULL, the new communicator inherits the original
  !>                 communicator's configuration.
  !>     @return     Result code. See `rccl_result_code` for more details.
  !>
  !>     @param[in] comm - Existing communicator, or NULL for newly joining ranks
  !>     @param[in] nRanks - Total number of ranks in the new communicator
  !>     @param[in] uniqueId - Unique ID from ncclCommGetUniqueId; NULL on existing non-root ranks
  !>     @param[in] rank - Rank in the new communicator for joining ranks; -1 for existing ranks
  !>     @param[out] newcomm - Pointer to the new communicator
  !>     @param[in] config - Config for the new communicator. May be NULL to inherit from comm
  interface ncclCommGrow
    function ncclCommGrow_(comm,nRanks,uniqueId,rank,newcomm,config) bind(c, name="ncclCommGrow")
      import
      implicit none
      integer(c_int) :: ncclCommGrow_
      type(c_ptr),value :: comm
      integer(c_int),value :: nRanks
      type(ncclUniqueId) :: uniqueId
      integer(c_int),value :: rank
      type(c_ptr) :: newcomm
      type(ncclConfig_t) :: config
    end function
  end interface

  !>  @brief Creates a new communicator (multi thread/process version), similar to
  !>  ncclCommInitRankConfig.
  !>      @details    Allows to use more than one ncclUniqueId (up to one per rank),
  !>                  indicated by nId, to accelerate the init operation.
  !>                  The number of ncclUniqueIds and their order must be the same for every rank.
  !>      @return     Result code. See `rccl_result_code` for more details.
  !>
  !>      @param[out] newcomm - Pointer to new communicator
  !>      @param[in] nranks - Total number of ranks participating in this communicator
  !>      @param[in] myrank - Current rank
  !>      @param[in] nId - Number of unique IDs
  !>      @param[in] commIds - List of unique IDs
  !>      @param[in] config - Config file for new communicator. May be NULL to inherit from comm
  interface ncclCommInitRankScalable
    function ncclCommInitRankScalable_(newcomm,nranks,myrank,nId,commIds,config) &
        bind(c, name="ncclCommInitRankScalable")
      import
      implicit none
      integer(c_int) :: ncclCommInitRankScalable_
      type(c_ptr) :: newcomm
      integer(c_int),value :: nranks
      integer(c_int),value :: myrank
      integer(c_int),value :: nId
      type(ncclUniqueId) :: commIds
      type(ncclConfig_t) :: config
    end function
  end interface

  !>  @brief      Returns a string for each result code.
  !>     @details    Returns a human-readable string describing the given result code.
  !>     @return     String containing description of result code.
  !>
  !>     @param[in] myResult - Result code to get description for
  interface ncclGetErrorString
    function ncclGetErrorString_(myResult) bind(c, name="ncclGetErrorString")
      import
      implicit none
      type(c_ptr) :: ncclGetErrorString_
      integer(c_int),value :: myResult
    end function
  end interface

  interface ncclGetLastError
    function ncclGetLastError_(comm) bind(c, name="ncclGetLastError")
      import
      implicit none
      type(c_ptr) :: ncclGetLastError_
      type(c_ptr),value :: comm
    end function
  end interface

  interface ncclResetDebugInit
    subroutine ncclResetDebugInit_() bind(c, name="ncclResetDebugInit")
      import
      implicit none
    end subroutine
  end interface

  !>  @brief      Checks whether the comm has encountered any asynchronous errors
  !>     @details    Query whether the provided communicator has encountered any asynchronous errors
  !>     @return     Result code. See `rccl_result_code` for more details.
  !>
  !>     @param[in] comm - Communicator to query
  !>     @param[out] asyncError - Pointer to where result code will be stored
  interface ncclCommGetAsyncError
    function ncclCommGetAsyncError_(comm,asyncError) bind(c, name="ncclCommGetAsyncError")
      import
      implicit none
      integer(c_int) :: ncclCommGetAsyncError_
      type(c_ptr),value :: comm
      type(c_ptr),value :: asyncError
    end function

    module procedure ncclCommGetAsyncError_typed
  end interface

  !>  @brief      Gets the number of ranks in the communicator clique.
  !>     @details Returns the number of ranks in the communicator clique (as set during
  !>     initialization)
  !>     @return     Result code. See `rccl_result_code` for more details.
  !>
  !>     @param[in] comm - Communicator to query
  !>     @param[out] count - Pointer to where number of ranks will be stored
  interface ncclCommCount
    function ncclCommCount_(comm,count) bind(c, name="ncclCommCount")
      import
      implicit none
      integer(c_int) :: ncclCommCount_
      type(c_ptr),value :: comm
      type(c_ptr),value :: count
    end function

    module procedure ncclCommCount_typed
  end interface

  !>  @brief      Get the ROCm device index associated with a communicator
  !>     @details    Returns the ROCm device number associated with the provided communicator.
  !>     @return     Result code. See `rccl_result_code` for more details.
  !>
  !>     @param[in] comm - Communicator to query
  !>     @param[out] device - Pointer to where the associated ROCm device index will be stored
  interface ncclCommCuDevice
    function ncclCommCuDevice_(comm,device) bind(c, name="ncclCommCuDevice")
      import
      implicit none
      integer(c_int) :: ncclCommCuDevice_
      type(c_ptr),value :: comm
      type(c_ptr),value :: device
    end function

    module procedure ncclCommCuDevice_typed
  end interface

  !>  @brief      Get the rank associated with a communicator
  !>     @details    Returns the user-ordered "rank" associated with the provided communicator.
  !>     @return     Result code. See `rccl_result_code` for more details.
  !>
  !>     @param[in] comm - Communicator to query
  !>     @param[out] rank - Pointer to where the associated rank will be stored
  interface ncclCommUserRank
    function ncclCommUserRank_(comm,rank) bind(c, name="ncclCommUserRank")
      import
      implicit none
      integer(c_int) :: ncclCommUserRank_
      type(c_ptr),value :: comm
      type(c_ptr),value :: rank
    end function

    module procedure ncclCommUserRank_typed
  end interface

  interface ncclCommRegister
    function ncclCommRegister_(comm,buff,mySize,handle) bind(c, name="ncclCommRegister")
      import
      implicit none
      integer(c_int) :: ncclCommRegister_
      type(c_ptr),value :: comm
      type(c_ptr),value :: buff
      integer(c_size_t),value :: mySize
      type(c_ptr) :: handle
    end function
  end interface

  interface ncclCommDeregister
    function ncclCommDeregister_(comm,handle) bind(c, name="ncclCommDeregister")
      import
      implicit none
      integer(c_int) :: ncclCommDeregister_
      type(c_ptr),value :: comm
      type(c_ptr),value :: handle
    end function
  end interface

  !>  @brief      Suspend communicator operations to free resources.
  !>     @details    Releases the resources selected by @p flags. The communicator
  !>                 cannot be used until `ncclCommResume` is called; a collective
  !>                 issued in the meantime returns ncclInvalidUsage.
  !>     @return     Result code. See `rccl_result_code` for more details.
  !>
  !>     @param[in] comm - Communicator to suspend
  !>     @param[in] flags - Bitmask of NCCL_SUSPEND_* flags (e.g. `NCCL_SUSPEND_MEM`)
  interface ncclCommSuspend
    function ncclCommSuspend_(comm,flags) bind(c, name="ncclCommSuspend")
      import
      implicit none
      integer(c_int) :: ncclCommSuspend_
      type(c_ptr),value :: comm
      integer(c_int),value :: flags
    end function
  end interface

  !>  @brief      Resume a previously suspended communicator.
  !>     @details    Reacquires every resource that was released by the matching
  !>                 `ncclCommSuspend` call.
  !>     @return     Result code. See `rccl_result_code` for more details.
  !>
  !>     @param[in] comm - Communicator to resume
  interface ncclCommResume
    function ncclCommResume_(comm) bind(c, name="ncclCommResume")
      import
      implicit none
      integer(c_int) :: ncclCommResume_
      type(c_ptr),value :: comm
    end function
  end interface

  !>  @brief      Query communicator memory statistics.
  !>     @return     Result code. See `rccl_result_code` for more details.
  !>
  !>     @param[in] comm - Communicator to query
  !>     @param[in] stat - One of `ncclCommMemStat_t` values
  !>     @param[out] myValue - Pointer to receive the memory statistic value
  interface ncclCommMemStats
    function ncclCommMemStats_(comm,stat,myValue) bind(c, name="ncclCommMemStats")
      import
      implicit none
      integer(c_int) :: ncclCommMemStats_
      type(c_ptr),value :: comm
      integer(c_int),value :: stat
      type(c_ptr),value :: myValue
    end function

    module procedure ncclCommMemStats_typed
  end interface

  interface ncclCommWindowRegister
    function ncclCommWindowRegister_(comm,buff,mySize,win,winFlags) &
        bind(c, name="ncclCommWindowRegister")
      import
      implicit none
      integer(c_int) :: ncclCommWindowRegister_
      type(c_ptr),value :: comm
      type(c_ptr),value :: buff
      integer(c_size_t),value :: mySize
      type(c_ptr) :: win
      integer(c_int),value :: winFlags
    end function
  end interface

  interface ncclCommWindowDeregister
    function ncclCommWindowDeregister_(comm,win) bind(c, name="ncclCommWindowDeregister")
      import
      implicit none
      integer(c_int) :: ncclCommWindowDeregister_
      type(c_ptr),value :: comm
      type(c_ptr),value :: win
    end function
  end interface

  interface ncclWinGetUserPtr
    function ncclWinGetUserPtr_(comm,win,outUserPtr) bind(c, name="ncclWinGetUserPtr")
      import
      implicit none
      integer(c_int) :: ncclWinGetUserPtr_
      type(c_ptr),value :: comm
      type(c_ptr),value :: win
      type(c_ptr) :: outUserPtr
    end function
  end interface

  !>  @brief      Create a custom pre-multiplier reduction operator
  !>     @details    Creates a new reduction operator which pre-multiplies input values by a given
  !>                 scalar locally before reducing them with peer values via summation. For use
  !>                 only with collectives launched against *comm* and *datatype*. The
  !> residence* argument indicates how/when the memory pointed to by *scalar*
  !>                 will be dereferenced. Upon return, the newly created operator's handle
  !>                 is stored in *op*.
  !>     @return     Result code. See `rccl_result_code` for more details.
  !>
  !>     @param[out] op - Pointer to where newly created custom reduction operator is to be stored
  !>     @param[in] scalar - Pointer to scalar value.
  !>     @param[in] datatype - Scalar value datatype
  !>     @param[in] residence - Memory type of the scalar value
  !>     @param[in] comm - Communicator to associate with this custom reduction operator
  interface ncclRedOpCreatePreMulSum
    function ncclRedOpCreatePreMulSum_(op,scalar,datatype,residence,comm) &
        bind(c, name="ncclRedOpCreatePreMulSum")
      import
      implicit none
      integer(c_int) :: ncclRedOpCreatePreMulSum_
      type(c_ptr),value :: op
      type(c_ptr),value :: scalar
      integer(c_int),value :: datatype
      integer(c_int),value :: residence
      type(c_ptr),value :: comm
    end function

    module procedure ncclRedOpCreatePreMulSum_typed
  end interface

  !>  @brief      Destroy custom reduction operator
  !>     @details    Destroys the reduction operator *op*. The operator must have been created by
  !>                 ncclRedOpCreatePreMul with the matching communicator *comm*. An operator may be
  !>                 destroyed as soon as the last RCCL function which is given that operator
  !>                 returns.
  !>     @return     Result code. See `rccl_result_code` for more details.
  !>
  !>     @param[in] op - Custom reduction operator is to be destroyed
  !>     @param[in] comm - Communicator associated with this reduction operator
  interface ncclRedOpDestroy
    function ncclRedOpDestroy_(op,comm) bind(c, name="ncclRedOpDestroy")
      import
      implicit none
      integer(c_int) :: ncclRedOpDestroy_
      integer(c_int),value :: op
      type(c_ptr),value :: comm
    end function
  end interface

  !>  @brief      Reduce
  !>     @details    Reduces data arrays of length *count* in *sendbuff* into *recvbuff* using *op*
  !>                 operation.
  !> recvbuff* may be NULL on all calls except for root device.
  !> root* is the rank (not the HIP device) where data will reside after the
  !>                  operation is complete.
  !>                 In-place operation will happen if sendbuff == recvbuff.
  !>     @return     Result code. See `rccl_result_code` for more details.
  !>
  !>     @param[in] sendbuff - Local device data buffer to be reduced
  !>     @param[in,out] recvbuff - Data buffer where result is stored (only for *root* rank). May be
  !>     null for other ranks.
  !>     @param[in] count - Number of elements in every send buffer
  !>     @param[in] datatype - Data buffer element datatype
  !>     @param[in] op - Reduction operator type
  !>     @param[in] root - Rank where result data array will be stored
  !>     @param[in] comm - Communicator group object to execute on
  !>     @param[in] stream - HIP stream to execute collective on
  interface ncclReduce
    function ncclReduce_(sendbuff,recvbuff,count,datatype,op,root,comm,stream) &
        bind(c, name="ncclReduce")
      import
      implicit none
      integer(c_int) :: ncclReduce_
      type(c_ptr),value :: sendbuff
      type(c_ptr),value :: recvbuff
      integer(c_size_t),value :: count
      integer(c_int),value :: datatype
      integer(c_int),value :: op
      integer(c_int),value :: root
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
    end function
  end interface

  !>  @brief      (Deprecated) Broadcast (in-place)
  !>     @details    Copies *count* values from *root* to all other devices.
  !>                 root is the rank (not the CUDA device) where data resides before the
  !>                 operation is started.
  !>                 This operation is implicitly in-place.
  !>     @return     Result code. See `rccl_result_code` for more details.
  !>
  !>     @param[in,out] buff - Input array on *root* to be copied to other ranks. Output array for
  !>     all ranks.
  !>     @param[in] count - Number of elements in data buffer
  !>     @param[in] datatype - Data buffer element datatype
  !>     @param[in] root - Rank owning buffer to be copied to others
  !>     @param[in] comm - Communicator group object to execute on
  !>     @param[in] stream - HIP stream to execute collective on
  interface ncclBcast
    function ncclBcast_(buff,count,datatype,root,comm,stream) bind(c, name="ncclBcast")
      import
      implicit none
      integer(c_int) :: ncclBcast_
      type(c_ptr),value :: buff
      integer(c_size_t),value :: count
      integer(c_int),value :: datatype
      integer(c_int),value :: root
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
    end function
  end interface

  !>  @brief      Broadcast
  !>     @details    Copies *count* values from *sendbuff* on *root* to *recvbuff* on all devices.
  !> root* is the rank (not the HIP device) where data resides before the operation is started.
  !> sendbuff* may be NULL on ranks other than *root*.
  !>                 In-place operation will happen if *sendbuff* == *recvbuff*.
  !>     @return     Result code. See `rccl_result_code` for more details.
  !>
  !>     @param[in] sendbuff - Data array to copy (if *root*).  May be NULL for other ranks
  !>     @param[in,out] recvbuff - Data array to store received array
  !>     @param[in] count - Number of elements in data buffer
  !>     @param[in] datatype - Data buffer element datatype
  !>     @param[in] root - Rank of broadcast root
  !>     @param[in] comm - Communicator group object to execute on
  !>     @param[in] stream - HIP stream to execute collective on
  interface ncclBroadcast
    function ncclBroadcast_(sendbuff,recvbuff,count,datatype,root,comm,stream) &
        bind(c, name="ncclBroadcast")
      import
      implicit none
      integer(c_int) :: ncclBroadcast_
      type(c_ptr),value :: sendbuff
      type(c_ptr),value :: recvbuff
      integer(c_size_t),value :: count
      integer(c_int),value :: datatype
      integer(c_int),value :: root
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
    end function
  end interface

  !>  @brief      All-Reduce
  !>     @details    Reduces data arrays of length *count* in *sendbuff* using *op* operation, and
  !>                 leaves identical copies of result on each *recvbuff*.
  !>                 In-place operation will happen if sendbuff == recvbuff.
  !>     @return     Result code. See `rccl_result_code` for more details.
  !>
  !>     @param[in] sendbuff - Input data array to reduce
  !>     @param[in,out] recvbuff - Data array to store reduced result array
  !>     @param[in] count - Number of elements in data buffer
  !>     @param[in] datatype - Data buffer element datatype
  !>     @param[in] op - Reduction operator
  !>     @param[in] comm - Communicator group object to execute on
  !>     @param[in] stream - HIP stream to execute collective on
  interface ncclAllReduce
    function ncclAllReduce_(sendbuff,recvbuff,count,datatype,op,comm,stream) &
        bind(c, name="ncclAllReduce")
      import
      implicit none
      integer(c_int) :: ncclAllReduce_
      type(c_ptr),value :: sendbuff
      type(c_ptr),value :: recvbuff
      integer(c_size_t),value :: count
      integer(c_int),value :: datatype
      integer(c_int),value :: op
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
    end function
  end interface

  !>  @brief      All-Reduce-with-Bias
  !>     @details    Reduces data arrays of length *count* in *sendbuff* using *op* operation, and
  !>                 leaves identical copies of result on each *recvbuff*.
  !>                 In-place operation will happen if sendbuff == recvbuff.
  !>     @return     Result code. See `rccl_result_code` for more details.
  !>
  !>     @param[in] sendbuff - Input data array to reduce
  !>     @param[in,out] recvbuff - Data array to store reduced result array
  !>     @param[in] count - Number of elements in data buffer
  !>     @param[in] datatype - Data buffer element datatype
  !>     @param[in] op - Reduction operator
  !>     @param[in] comm - Communicator group object to execute on
  !>     @param[in] stream - HIP stream to execute collective on
  !>     @param[in] acc - Bias data array to reduce
  interface ncclAllReduceWithBias
    function ncclAllReduceWithBias_(sendbuff,recvbuff,count,datatype,op,comm,stream,acc) &
        bind(c, name="ncclAllReduceWithBias")
      import
      implicit none
      integer(c_int) :: ncclAllReduceWithBias_
      type(c_ptr),value :: sendbuff
      type(c_ptr),value :: recvbuff
      integer(c_size_t),value :: count
      integer(c_int),value :: datatype
      integer(c_int),value :: op
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
      type(c_ptr),value :: acc
    end function
  end interface

  !>  @brief      Reduce-Scatter
  !>     @details    Reduces data in *sendbuff* using *op* operation and leaves reduced result
  !>                 scattered over the devices so that *recvbuff* on rank i will contain the i-th
  !>                 block of the result.
  !>                 Assumes sendcount is equal to nranks*recvcount, which means that *sendbuff*
  !>                 should have a size of at least nranks*recvcount elements.
  !>                 In-place operations will happen if recvbuff == sendbuff + rank * recvcount.
  !>     @return     Result code. See `rccl_result_code` for more details.
  !>
  !>     @param[in] sendbuff - Input data array to reduce
  !>     @param[in,out] recvbuff - Data array to store reduced result subarray
  !>     @param[in] recvcount - Number of elements each rank receives
  !>     @param[in] datatype - Data buffer element datatype
  !>     @param[in] op - Reduction operator
  !>     @param[in] comm - Communicator group object to execute on
  !>     @param[in] stream - HIP stream to execute collective on
  interface ncclReduceScatter
    function ncclReduceScatter_(sendbuff,recvbuff,recvcount,datatype,op,comm,stream) &
        bind(c, name="ncclReduceScatter")
      import
      implicit none
      integer(c_int) :: ncclReduceScatter_
      type(c_ptr),value :: sendbuff
      type(c_ptr),value :: recvbuff
      integer(c_size_t),value :: recvcount
      integer(c_int),value :: datatype
      integer(c_int),value :: op
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
    end function
  end interface

  !>  @brief      All-Gather
  !>     @details    Each device gathers *sendcount* values from other GPUs into *recvbuff*,
  !>                 receiving data from rank i at offset i*sendcount.
  !>                 Assumes recvcount is equal to nranks*sendcount, which means that recvbuff
  !>                 should have a size of at least nranks*sendcount elements.
  !>                 In-place operations will happen if sendbuff == recvbuff + rank * sendcount.
  !>     @return     Result code. See `rccl_result_code` for more details.
  !>
  !>     @param[in] sendbuff - Input data array to send
  !>     @param[in,out] recvbuff - Data array to store the gathered result
  !>     @param[in] sendcount - Number of elements each rank sends
  !>     @param[in] datatype - Data buffer element datatype
  !>     @param[in] comm - Communicator group object to execute on
  !>     @param[in] stream - HIP stream to execute collective on
  interface ncclAllGather
    function ncclAllGather_(sendbuff,recvbuff,sendcount,datatype,comm,stream) &
        bind(c, name="ncclAllGather")
      import
      implicit none
      integer(c_int) :: ncclAllGather_
      type(c_ptr),value :: sendbuff
      type(c_ptr),value :: recvbuff
      integer(c_size_t),value :: sendcount
      integer(c_int),value :: datatype
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
    end function
  end interface

  !>  @brief      All-to-All
  !>     @details    Each device sends count values to all other devices and receives count values
  !>                 from all other devices. Data to send to destination rank j is taken from
  !>                 sendbuff+j*count and data received from source rank i is placed at
  !>                 recvbuff+i*count.
  !>     @return     Result code. See `rccl_result_code` for more details.
  !>
  !>     @param[in] sendbuff - Data array to send (contains blocks for each other rank)
  !>     @param[in,out] recvbuff - Data array to receive (contains blocks from each other rank)
  !>     @param[in] count - Number of elements to send between each pair of ranks
  !>     @param[in] datatype - Data buffer element datatype
  !>     @param[in] comm - Communicator group object to execute on
  !>     @param[in] stream - HIP stream to execute collective on
  interface ncclAlltoAll
    function ncclAlltoAll_(sendbuff,recvbuff,count,datatype,comm,stream) &
        bind(c, name="ncclAlltoAll")
      import
      implicit none
      integer(c_int) :: ncclAlltoAll_
      type(c_ptr),value :: sendbuff
      type(c_ptr),value :: recvbuff
      integer(c_size_t),value :: count
      integer(c_int),value :: datatype
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
    end function
  end interface

  !>  @brief      All-To-Allv
  !>     @details    Device (i) sends sendcounts[j] of data from offset sdispls[j]
  !>                 to device (j). At the same time, device (i) receives recvcounts[j] of data
  !>                 from device (j) to be placed at rdispls[j].
  !>                 sendcounts, sdispls, recvcounts and rdispls are all measured in the units
  !>                 of datatype, not bytes.
  !>                 In-place operation will happen if sendbuff == recvbuff.
  !>     @return     Result code. See `rccl_result_code` for more details.
  !>
  !>     @param[in] sendbuff - Data array to send (contains blocks for each other rank)
  !>     @param[in] sendcounts - Array containing number of elements to send to each participating
  !>     rank
  !>     @param[in] sdispls - Array of offsets into *sendbuff* for each participating rank
  !>     @param[in,out] recvbuff - Data array to receive (contains blocks from each other rank)
  !>     @param[in] recvcounts - Array containing number of elements to receive from each
  !>     participating rank
  !>     @param[in] rdispls - Array of offsets into *recvbuff* for each participating rank
  !>     @param[in] datatype - Data buffer element datatype
  !>     @param[in] comm - Communicator group object to execute on
  !>     @param[in] stream - HIP stream to execute collective on
  interface ncclAlltoAllv
    function ncclAlltoAllv_(sendbuff,sendcounts,sdispls,recvbuff,recvcounts,rdispls,datatype,comm, &
        stream) &
        bind(c, name="ncclAlltoAllv")
      import
      implicit none
      integer(c_int) :: ncclAlltoAllv_
      type(c_ptr),value :: sendbuff
      type(c_ptr),value :: sendcounts
      type(c_ptr),value :: sdispls
      type(c_ptr),value :: recvbuff
      type(c_ptr),value :: recvcounts
      type(c_ptr),value :: rdispls
      integer(c_int),value :: datatype
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
    end function

#ifdef USE_ASSUMED_RANK
    module procedure ncclAlltoAllv_assumed_rank
#else
#ifdef USE_ASSUMED_SHAPE
    module procedure &
      ncclAlltoAllv_rank_0,&
      ncclAlltoAllv_rank_1
#endif
#endif
  end interface

  !>  @brief      Gather
  !>     @details    Each rank sends count elements from sendbuff to the root rank.
  !>                 On the root rank, data from rank i is placed at recvbuff + i*count.
  !>                 On non-root ranks, recvbuff is not used.
  !>                 root is the rank where data will be gathered.
  !>
  !>                 In-place operations will happen if sendbuff == recvbuff + root * count.
  !>     @return     Result code. See `rccl_result_code` for more details.
  !>
  !>     @param[in] sendbuff - Data array to send
  !>     @param[in,out] recvbuff - Data array to recv
  !>     @param[in] count - Number of elements
  !>     @param[in] datatype - Data buffer element datatype
  !>     @param[in] root - Rank of gather root
  !>     @param[in] comm - Communicator group object to execute on
  !>     @param[in] stream - HIP stream to execute collective on
  interface ncclGather
    function ncclGather_(sendbuff,recvbuff,count,datatype,root,comm,stream) &
        bind(c, name="ncclGather")
      import
      implicit none
      integer(c_int) :: ncclGather_
      type(c_ptr),value :: sendbuff
      type(c_ptr),value :: recvbuff
      integer(c_size_t),value :: count
      integer(c_int),value :: datatype
      integer(c_int),value :: root
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
    end function
  end interface

  !>  @brief      Scatter
  !>     @details    On the root rank, count elements from sendbuff+i*count are sent to rank i.
  !>                 On non-root ranks, sendbuff is not used.
  !>                 Each rank receives count elements into recvbuff.
  !>                 root is the rank that will distribute the data.
  !>
  !>                 In-place operations will happen if recvbuff == sendbuff + root * count.
  !>     @return     Result code. See `rccl_result_code` for more details.
  !>
  !>     @param[in] sendbuff - Data array to send
  !>     @param[in,out] recvbuff - Data array to recv
  !>     @param[in] count - Number of elements
  !>     @param[in] datatype - Data buffer element datatype
  !>     @param[in] root - Rank of scatter root
  !>     @param[in] comm - Communicator group object to execute on
  !>     @param[in] stream - HIP stream to execute collective on
  interface ncclScatter
    function ncclScatter_(sendbuff,recvbuff,count,datatype,root,comm,stream) &
        bind(c, name="ncclScatter")
      import
      implicit none
      integer(c_int) :: ncclScatter_
      type(c_ptr),value :: sendbuff
      type(c_ptr),value :: recvbuff
      integer(c_size_t),value :: count
      integer(c_int),value :: datatype
      integer(c_int),value :: root
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
    end function
  end interface

  interface ncclAllReduceConfig
    function ncclAllReduceConfig_(sendbuff,recvbuff,count,datatype,op,comm,stream,config) &
        bind(c, name="ncclAllReduceConfig")
      import
      implicit none
      integer(c_int) :: ncclAllReduceConfig_
      type(c_ptr),value :: sendbuff
      type(c_ptr),value :: recvbuff
      integer(c_size_t),value :: count
      integer(c_int),value :: datatype
      integer(c_int),value :: op
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
      type(ncclCollConfig_t) :: config
    end function
  end interface

  interface ncclBroadcastConfig
    function ncclBroadcastConfig_(sendbuff,recvbuff,count,datatype,root,comm,stream,config) &
        bind(c, name="ncclBroadcastConfig")
      import
      implicit none
      integer(c_int) :: ncclBroadcastConfig_
      type(c_ptr),value :: sendbuff
      type(c_ptr),value :: recvbuff
      integer(c_size_t),value :: count
      integer(c_int),value :: datatype
      integer(c_int),value :: root
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
      type(ncclCollConfig_t) :: config
    end function
  end interface

  interface ncclReduceConfig
    function ncclReduceConfig_(sendbuff,recvbuff,count,datatype,op,root,comm,stream,config) &
        bind(c, name="ncclReduceConfig")
      import
      implicit none
      integer(c_int) :: ncclReduceConfig_
      type(c_ptr),value :: sendbuff
      type(c_ptr),value :: recvbuff
      integer(c_size_t),value :: count
      integer(c_int),value :: datatype
      integer(c_int),value :: op
      integer(c_int),value :: root
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
      type(ncclCollConfig_t) :: config
    end function
  end interface

  interface ncclAllGatherConfig
    function ncclAllGatherConfig_(sendbuff,recvbuff,sendcount,datatype,comm,stream,config) &
        bind(c, name="ncclAllGatherConfig")
      import
      implicit none
      integer(c_int) :: ncclAllGatherConfig_
      type(c_ptr),value :: sendbuff
      type(c_ptr),value :: recvbuff
      integer(c_size_t),value :: sendcount
      integer(c_int),value :: datatype
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
      type(ncclCollConfig_t) :: config
    end function
  end interface

  interface ncclReduceScatterConfig
    function ncclReduceScatterConfig_(sendbuff,recvbuff,recvcount,datatype,op,comm,stream,config) &
        bind(c, name="ncclReduceScatterConfig")
      import
      implicit none
      integer(c_int) :: ncclReduceScatterConfig_
      type(c_ptr),value :: sendbuff
      type(c_ptr),value :: recvbuff
      integer(c_size_t),value :: recvcount
      integer(c_int),value :: datatype
      integer(c_int),value :: op
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
      type(ncclCollConfig_t) :: config
    end function
  end interface

  interface ncclAlltoAllConfig
    function ncclAlltoAllConfig_(sendbuff,recvbuff,count,datatype,comm,stream,config) &
        bind(c, name="ncclAlltoAllConfig")
      import
      implicit none
      integer(c_int) :: ncclAlltoAllConfig_
      type(c_ptr),value :: sendbuff
      type(c_ptr),value :: recvbuff
      integer(c_size_t),value :: count
      integer(c_int),value :: datatype
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
      type(ncclCollConfig_t) :: config
    end function
  end interface

  interface ncclGatherConfig
    function ncclGatherConfig_(sendbuff,recvbuff,count,datatype,root,comm,stream,config) &
        bind(c, name="ncclGatherConfig")
      import
      implicit none
      integer(c_int) :: ncclGatherConfig_
      type(c_ptr),value :: sendbuff
      type(c_ptr),value :: recvbuff
      integer(c_size_t),value :: count
      integer(c_int),value :: datatype
      integer(c_int),value :: root
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
      type(ncclCollConfig_t) :: config
    end function
  end interface

  interface ncclScatterConfig
    function ncclScatterConfig_(sendbuff,recvbuff,count,datatype,root,comm,stream,config) &
        bind(c, name="ncclScatterConfig")
      import
      implicit none
      integer(c_int) :: ncclScatterConfig_
      type(c_ptr),value :: sendbuff
      type(c_ptr),value :: recvbuff
      integer(c_size_t),value :: count
      integer(c_int),value :: datatype
      integer(c_int),value :: root
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
      type(ncclCollConfig_t) :: config
    end function
  end interface

  !>  @brief      Send
  !>     @details    Send data from *sendbuff* to rank *peer*.
  !>                 Rank *peer* needs to call ncclRecv with the same *datatype* and the same
  !>                 *count*
  !>                 as this rank.
  !>                 This operation is blocking for the GPU. If multiple ncclSend and ncclRecv
  !>                 operations
  !>                 need to progress concurrently to complete, they must be fused within a
  !>                 ncclGroupStart /
  !>                 ncclGroupEnd section.
  !>     @return     Result code. See `rccl_result_code` for more details.
  !>
  !>     @param[in] sendbuff - Data array to send
  !>     @param[in] count - Number of elements to send
  !>     @param[in] datatype - Data buffer element datatype
  !>     @param[in] peer - Peer rank to send to
  !>     @param[in] comm - Communicator group object to execute on
  !>     @param[in] stream - HIP stream to execute collective on
  interface ncclSend
    function ncclSend_(sendbuff,count,datatype,peer,comm,stream) bind(c, name="ncclSend")
      import
      implicit none
      integer(c_int) :: ncclSend_
      type(c_ptr),value :: sendbuff
      integer(c_size_t),value :: count
      integer(c_int),value :: datatype
      integer(c_int),value :: peer
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
    end function
  end interface

  !>  @brief      Receive
  !>     @details    Receive data from rank *peer* into *recvbuff*.
  !>                 Rank *peer* needs to call ncclSend with the same datatype and the same count
  !>                 as this rank.
  !>                 This operation is blocking for the GPU. If multiple ncclSend and ncclRecv
  !>                 operations
  !>                 need to progress concurrently to complete, they must be fused within a
  !>                 ncclGroupStart/
  !>                 ncclGroupEnd section.
  !>     @return     Result code. See `rccl_result_code` for more details.
  !>
  !>     @param[in,out] recvbuff - Data array to receive
  !>     @param[in] count - Number of elements to receive
  !>     @param[in] datatype - Data buffer element datatype
  !>     @param[in] peer - Peer rank to send to
  !>     @param[in] comm - Communicator group object to execute on
  !>     @param[in] stream - HIP stream to execute collective on
  interface ncclRecv
    function ncclRecv_(recvbuff,count,datatype,peer,comm,stream) bind(c, name="ncclRecv")
      import
      implicit none
      integer(c_int) :: ncclRecv_
      type(c_ptr),value :: recvbuff
      integer(c_size_t),value :: count
      integer(c_int),value :: datatype
      integer(c_int),value :: peer
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
    end function
  end interface

  interface ncclPutSignal
    function ncclPutSignal_(localbuff,count,datatype,peer,peerWin,peerWinOffset,sigIdx,ctx,flags, &
        comm,stream) &
        bind(c, name="ncclPutSignal")
      import
      implicit none
      integer(c_int) :: ncclPutSignal_
      type(c_ptr),value :: localbuff
      integer(c_size_t),value :: count
      integer(c_int),value :: datatype
      integer(c_int),value :: peer
      type(c_ptr),value :: peerWin
      integer(c_size_t),value :: peerWinOffset
      integer(c_int),value :: sigIdx
      integer(c_int),value :: ctx
      integer(c_int),value :: flags
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
    end function
  end interface

  interface ncclSignal
    function ncclSignal_(peer,sigIdx,ctx,flags,comm,stream) bind(c, name="ncclSignal")
      import
      implicit none
      integer(c_int) :: ncclSignal_
      integer(c_int),value :: peer
      integer(c_int),value :: sigIdx
      integer(c_int),value :: ctx
      integer(c_int),value :: flags
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
    end function
  end interface

  interface ncclWaitSignal
    function ncclWaitSignal_(nDesc,signalDescs,comm,stream) bind(c, name="ncclWaitSignal")
      import
      implicit none
      integer(c_int) :: ncclWaitSignal_
      integer(c_int),value :: nDesc
      type(ncclWaitSignalDesc_t) :: signalDescs
      type(c_ptr),value :: comm
      type(c_ptr),value :: stream
    end function
  end interface

  !>  @brief      Group Start
  !>     @details    Start a group call. All calls to RCCL until ncclGroupEnd will be fused into
  !>                 a single RCCL operation. Nothing will be started on the HIP stream until
  !>                 ncclGroupEnd.
  !>     @return     Result code. See `rccl_result_code` for more details.
  interface ncclGroupStart
    function ncclGroupStart_() bind(c, name="ncclGroupStart")
      import
      implicit none
      integer(c_int) :: ncclGroupStart_
    end function
  end interface

  !>  @brief      Group End
  !>     @details    End a group call. Start a fused RCCL operation consisting of all calls since
  !>                 ncclGroupStart. Operations on the HIP stream depending on the RCCL operations
  !>                 need to be called after ncclGroupEnd.
  !>     @return     Result code. See `rccl_result_code` for more details.
  interface ncclGroupEnd
    function ncclGroupEnd_() bind(c, name="ncclGroupEnd")
      import
      implicit none
      integer(c_int) :: ncclGroupEnd_
    end function
  end interface

  interface ncclGroupSimulateEnd
    function ncclGroupSimulateEnd_(simInfo) bind(c, name="ncclGroupSimulateEnd")
      import
      implicit none
      integer(c_int) :: ncclGroupSimulateEnd_
      type(ncclSimInfo_t) :: simInfo
    end function
  end interface

  interface ncclSetEncryption
    function ncclSetEncryption_(config) bind(c, name="ncclSetEncryption")
      import
      implicit none
      integer(c_int) :: ncclSetEncryption_
      type(ncclEncryptionConfig_t) :: config
    end function
  end interface

  interface ncclParamBind
    function ncclParamBind_(out,key) bind(c, name="ncclParamBind")
      import
      implicit none
      integer(c_int) :: ncclParamBind_
      type(c_ptr) :: out
      type(c_ptr),value :: key
    end function
  end interface

  interface ncclParamGetI8
    function ncclParamGetI8_(h,out) bind(c, name="ncclParamGetI8")
      import
      implicit none
      integer(c_int) :: ncclParamGetI8_
      type(c_ptr),value :: h
      type(c_ptr),value :: out
    end function

    module procedure ncclParamGetI8_typed
  end interface

  interface ncclParamGetI16
    function ncclParamGetI16_(h,out) bind(c, name="ncclParamGetI16")
      import
      implicit none
      integer(c_int) :: ncclParamGetI16_
      type(c_ptr),value :: h
      type(c_ptr),value :: out
    end function

    module procedure ncclParamGetI16_typed
  end interface

  interface ncclParamGetI32
    function ncclParamGetI32_(h,out) bind(c, name="ncclParamGetI32")
      import
      implicit none
      integer(c_int) :: ncclParamGetI32_
      type(c_ptr),value :: h
      type(c_ptr),value :: out
    end function

    module procedure ncclParamGetI32_typed
  end interface

  interface ncclParamGetI64
    function ncclParamGetI64_(h,out) bind(c, name="ncclParamGetI64")
      import
      implicit none
      integer(c_int) :: ncclParamGetI64_
      type(c_ptr),value :: h
      type(c_ptr),value :: out
    end function

    module procedure ncclParamGetI64_typed
  end interface

  interface ncclParamGetU8
    function ncclParamGetU8_(h,out) bind(c, name="ncclParamGetU8")
      import
      implicit none
      integer(c_int) :: ncclParamGetU8_
      type(c_ptr),value :: h
      type(c_ptr),value :: out
    end function

    module procedure ncclParamGetU8_typed
  end interface

  interface ncclParamGetU16
    function ncclParamGetU16_(h,out) bind(c, name="ncclParamGetU16")
      import
      implicit none
      integer(c_int) :: ncclParamGetU16_
      type(c_ptr),value :: h
      type(c_ptr),value :: out
    end function

    module procedure ncclParamGetU16_typed
  end interface

  interface ncclParamGetU32
    function ncclParamGetU32_(h,out) bind(c, name="ncclParamGetU32")
      import
      implicit none
      integer(c_int) :: ncclParamGetU32_
      type(c_ptr),value :: h
      type(c_ptr),value :: out
    end function

    module procedure ncclParamGetU32_typed
  end interface

  interface ncclParamGetU64
    function ncclParamGetU64_(h,out) bind(c, name="ncclParamGetU64")
      import
      implicit none
      integer(c_int) :: ncclParamGetU64_
      type(c_ptr),value :: h
      type(c_ptr),value :: out
    end function

    module procedure ncclParamGetU64_typed
  end interface

  interface ncclParamGetStr
    function ncclParamGetStr_(h,out) bind(c, name="ncclParamGetStr")
      import
      implicit none
      integer(c_int) :: ncclParamGetStr_
      type(c_ptr),value :: h
      type(c_ptr) :: out
    end function
  end interface

  interface ncclParamGet
    function ncclParamGet_(h,out,maxLen,len) bind(c, name="ncclParamGet")
      import
      implicit none
      integer(c_int) :: ncclParamGet_
      type(c_ptr),value :: h
      type(c_ptr),value :: out
      integer(c_int),value :: maxLen
      type(c_ptr),value :: len
    end function

    module procedure ncclParamGet_typed
  end interface

  interface ncclParamGetParameter
    function ncclParamGetParameter_(key,myValue,valueLen) bind(c, name="ncclParamGetParameter")
      import
      implicit none
      integer(c_int) :: ncclParamGetParameter_
      type(c_ptr),value :: key
      type(c_ptr) :: myValue
      type(c_ptr),value :: valueLen
    end function

    module procedure ncclParamGetParameter_typed
  end interface

  interface ncclParamGetAllParameterKeys
    function ncclParamGetAllParameterKeys_(table,tableLen) &
        bind(c, name="ncclParamGetAllParameterKeys")
      import
      implicit none
      integer(c_int) :: ncclParamGetAllParameterKeys_
      type(c_ptr) :: table
      type(c_ptr),value :: tableLen
    end function

    module procedure ncclParamGetAllParameterKeys_typed
  end interface

  interface ncclParamDumpAll
    subroutine ncclParamDumpAll_() bind(c, name="ncclParamDumpAll")
      import
      implicit none
    end subroutine
  end interface


  contains

    function ncclGetVersion_typed(version)
      implicit none
      integer(kind(ncclSuccess)) :: ncclGetVersion_typed
      integer(c_int),target :: version
      !
      ncclGetVersion_typed = ncclGetVersion_(c_loc(version))
    end function

    function ncclCommGetAsyncError_typed(comm,asyncError)
      implicit none
      integer(kind(ncclSuccess)) :: ncclCommGetAsyncError_typed
      type(c_ptr), value :: comm
      integer(kind(ncclSuccess)),target :: asyncError
      !
      ncclCommGetAsyncError_typed = ncclCommGetAsyncError_(comm,c_loc(asyncError))
    end function

    function ncclCommCount_typed(comm,count)
      implicit none
      integer(kind(ncclSuccess)) :: ncclCommCount_typed
      type(c_ptr), value :: comm
      integer(c_int),target :: count
      !
      ncclCommCount_typed = ncclCommCount_(comm,c_loc(count))
    end function

    function ncclCommCuDevice_typed(comm,device)
      implicit none
      integer(kind(ncclSuccess)) :: ncclCommCuDevice_typed
      type(c_ptr), value :: comm
      integer(c_int),target :: device
      !
      ncclCommCuDevice_typed = ncclCommCuDevice_(comm,c_loc(device))
    end function

    function ncclCommUserRank_typed(comm,rank)
      implicit none
      integer(kind(ncclSuccess)) :: ncclCommUserRank_typed
      type(c_ptr), value :: comm
      integer(c_int),target :: rank
      !
      ncclCommUserRank_typed = ncclCommUserRank_(comm,c_loc(rank))
    end function

    function ncclCommMemStats_typed(comm,stat,myValue)
      implicit none
      integer(kind(ncclSuccess)) :: ncclCommMemStats_typed
      type(c_ptr), value :: comm
      integer(kind(ncclStatGpuMemSuspend)) :: stat
      integer(c_int64_t),target :: myValue
      !
      ncclCommMemStats_typed = ncclCommMemStats_(comm,stat,c_loc(myValue))
    end function

    function ncclRedOpCreatePreMulSum_typed(op,scalar,datatype,residence,comm)
      implicit none
      integer(kind(ncclSuccess)) :: ncclRedOpCreatePreMulSum_typed
      integer(kind(ncclSum)),target :: op
      type(c_ptr), value :: scalar
      integer(kind(ncclInt8)) :: datatype
      integer(kind(ncclScalarDevice)) :: residence
      type(c_ptr), value :: comm
      !
      ncclRedOpCreatePreMulSum_typed = ncclRedOpCreatePreMulSum_(c_loc(op),scalar,datatype, &
        residence,comm)
    end function

    function ncclParamGetI8_typed(h,out)
      implicit none
      integer(kind(ncclSuccess)) :: ncclParamGetI8_typed
      type(c_ptr), value :: h
      integer(c_int8_t),target :: out
      !
      ncclParamGetI8_typed = ncclParamGetI8_(h,c_loc(out))
    end function

    function ncclParamGetI16_typed(h,out)
      implicit none
      integer(kind(ncclSuccess)) :: ncclParamGetI16_typed
      type(c_ptr), value :: h
      integer(c_int16_t),target :: out
      !
      ncclParamGetI16_typed = ncclParamGetI16_(h,c_loc(out))
    end function

    function ncclParamGetI32_typed(h,out)
      implicit none
      integer(kind(ncclSuccess)) :: ncclParamGetI32_typed
      type(c_ptr), value :: h
      integer(c_int32_t),target :: out
      !
      ncclParamGetI32_typed = ncclParamGetI32_(h,c_loc(out))
    end function

    function ncclParamGetI64_typed(h,out)
      implicit none
      integer(kind(ncclSuccess)) :: ncclParamGetI64_typed
      type(c_ptr), value :: h
      integer(c_int64_t),target :: out
      !
      ncclParamGetI64_typed = ncclParamGetI64_(h,c_loc(out))
    end function

    function ncclParamGetU8_typed(h,out)
      implicit none
      integer(kind(ncclSuccess)) :: ncclParamGetU8_typed
      type(c_ptr), value :: h
      integer(c_int8_t),target :: out
      !
      ncclParamGetU8_typed = ncclParamGetU8_(h,c_loc(out))
    end function

    function ncclParamGetU16_typed(h,out)
      implicit none
      integer(kind(ncclSuccess)) :: ncclParamGetU16_typed
      type(c_ptr), value :: h
      integer(c_int16_t),target :: out
      !
      ncclParamGetU16_typed = ncclParamGetU16_(h,c_loc(out))
    end function

    function ncclParamGetU32_typed(h,out)
      implicit none
      integer(kind(ncclSuccess)) :: ncclParamGetU32_typed
      type(c_ptr), value :: h
      integer(c_int32_t),target :: out
      !
      ncclParamGetU32_typed = ncclParamGetU32_(h,c_loc(out))
    end function

    function ncclParamGetU64_typed(h,out)
      implicit none
      integer(kind(ncclSuccess)) :: ncclParamGetU64_typed
      type(c_ptr), value :: h
      integer(c_int64_t),target :: out
      !
      ncclParamGetU64_typed = ncclParamGetU64_(h,c_loc(out))
    end function

    function ncclParamGet_typed(h,out,maxLen,len)
      implicit none
      integer(kind(ncclSuccess)) :: ncclParamGet_typed
      type(c_ptr), value :: h
      type(c_ptr), value :: out
      integer(c_int) :: maxLen
      integer(c_int),target :: len
      !
      ncclParamGet_typed = ncclParamGet_(h,out,maxLen,c_loc(len))
    end function

    function ncclParamGetParameter_typed(key,myValue,valueLen)
      implicit none
      integer(kind(ncclSuccess)) :: ncclParamGetParameter_typed
      type(c_ptr), value :: key
      type(c_ptr) :: myValue
      integer(c_int),target :: valueLen
      !
      ncclParamGetParameter_typed = ncclParamGetParameter_(key,myValue,c_loc(valueLen))
    end function

    function ncclParamGetAllParameterKeys_typed(table,tableLen)
      implicit none
      integer(kind(ncclSuccess)) :: ncclParamGetAllParameterKeys_typed
      type(c_ptr) :: table
      integer(c_int),target :: tableLen
      !
      ncclParamGetAllParameterKeys_typed = ncclParamGetAllParameterKeys_(table,c_loc(tableLen))
    end function


#if defined(USE_ASSUMED_SHAPE) || defined(USE_ASSUMED_RANK)

#ifdef USE_ASSUMED_RANK
    function ncclCommInitAll_assumed_rank(comm,ndev,devlist)
      implicit none
      integer(kind(ncclSuccess)) :: ncclCommInitAll_assumed_rank
      type(c_ptr) :: comm(*)
      integer(c_int) :: ndev
      integer(c_int),target,dimension(..) :: devlist
      !
      ncclCommInitAll_assumed_rank = ncclCommInitAll_(comm,ndev,c_loc(devlist))
    end function

#else
    function ncclCommInitAll_rank_0(comm,ndev,devlist)
      implicit none
      integer(kind(ncclSuccess)) :: ncclCommInitAll_rank_0
      type(c_ptr) :: comm(*)
      integer(c_int) :: ndev
      integer(c_int),target :: devlist
      !
      ncclCommInitAll_rank_0 = ncclCommInitAll_(comm,ndev,c_loc(devlist))
    end function

    function ncclCommInitAll_rank_1(comm,ndev,devlist)
      implicit none
      integer(kind(ncclSuccess)) :: ncclCommInitAll_rank_1
      type(c_ptr) :: comm(*)
      integer(c_int) :: ndev
      integer(c_int),target,dimension(:) :: devlist
      !
      ncclCommInitAll_rank_1 = ncclCommInitAll_(comm,ndev,c_loc(devlist))
    end function

#endif
#ifdef USE_ASSUMED_RANK
    function ncclCommShrink_assumed_rank(comm,excludeRanksList,excludeRanksCount,newcomm,config, &
        shrinkFlags)
      implicit none
      integer(kind(ncclSuccess)) :: ncclCommShrink_assumed_rank
      type(c_ptr), value :: comm
      integer(c_int),target,dimension(..) :: excludeRanksList
      integer(c_int) :: excludeRanksCount
      type(c_ptr) :: newcomm
      type(ncclConfig_t) :: config
      integer(c_int) :: shrinkFlags
      !
      ncclCommShrink_assumed_rank = ncclCommShrink_(comm,c_loc(excludeRanksList), &
        excludeRanksCount,newcomm,config,shrinkFlags)
    end function

#else
    function ncclCommShrink_rank_0(comm,excludeRanksList,excludeRanksCount,newcomm,config, &
        shrinkFlags)
      implicit none
      integer(kind(ncclSuccess)) :: ncclCommShrink_rank_0
      type(c_ptr), value :: comm
      integer(c_int),target :: excludeRanksList
      integer(c_int) :: excludeRanksCount
      type(c_ptr) :: newcomm
      type(ncclConfig_t) :: config
      integer(c_int) :: shrinkFlags
      !
      ncclCommShrink_rank_0 = ncclCommShrink_(comm,c_loc(excludeRanksList),excludeRanksCount, &
        newcomm,config,shrinkFlags)
    end function

    function ncclCommShrink_rank_1(comm,excludeRanksList,excludeRanksCount,newcomm,config, &
        shrinkFlags)
      implicit none
      integer(kind(ncclSuccess)) :: ncclCommShrink_rank_1
      type(c_ptr), value :: comm
      integer(c_int),target,dimension(:) :: excludeRanksList
      integer(c_int) :: excludeRanksCount
      type(c_ptr) :: newcomm
      type(ncclConfig_t) :: config
      integer(c_int) :: shrinkFlags
      !
      ncclCommShrink_rank_1 = ncclCommShrink_(comm,c_loc(excludeRanksList),excludeRanksCount, &
        newcomm,config,shrinkFlags)
    end function

#endif
#ifdef USE_ASSUMED_RANK
    function ncclAlltoAllv_assumed_rank(sendbuff,sendcounts,sdispls,recvbuff,recvcounts,rdispls, &
        datatype,comm,stream)
      implicit none
      integer(kind(ncclSuccess)) :: ncclAlltoAllv_assumed_rank
      type(c_ptr), value :: sendbuff
      integer(c_size_t),target,dimension(..) :: sendcounts
      integer(c_size_t),target,dimension(..) :: sdispls
      type(c_ptr), value :: recvbuff
      integer(c_size_t),target,dimension(..) :: recvcounts
      integer(c_size_t),target,dimension(..) :: rdispls
      integer(kind(ncclInt8)) :: datatype
      type(c_ptr), value :: comm
      type(c_ptr), value :: stream
      !
      ncclAlltoAllv_assumed_rank = ncclAlltoAllv_(sendbuff,c_loc(sendcounts),c_loc(sdispls), &
        recvbuff,c_loc(recvcounts),c_loc(rdispls),datatype,comm,stream)
    end function

#else
    function ncclAlltoAllv_rank_0(sendbuff,sendcounts,sdispls,recvbuff,recvcounts,rdispls, &
        datatype,comm,stream)
      implicit none
      integer(kind(ncclSuccess)) :: ncclAlltoAllv_rank_0
      type(c_ptr), value :: sendbuff
      integer(c_size_t),target :: sendcounts
      integer(c_size_t),target :: sdispls
      type(c_ptr), value :: recvbuff
      integer(c_size_t),target :: recvcounts
      integer(c_size_t),target :: rdispls
      integer(kind(ncclInt8)) :: datatype
      type(c_ptr), value :: comm
      type(c_ptr), value :: stream
      !
      ncclAlltoAllv_rank_0 = ncclAlltoAllv_(sendbuff,c_loc(sendcounts),c_loc(sdispls),recvbuff, &
        c_loc(recvcounts),c_loc(rdispls),datatype,comm,stream)
    end function

    function ncclAlltoAllv_rank_1(sendbuff,sendcounts,sdispls,recvbuff,recvcounts,rdispls, &
        datatype,comm,stream)
      implicit none
      integer(kind(ncclSuccess)) :: ncclAlltoAllv_rank_1
      type(c_ptr), value :: sendbuff
      integer(c_size_t),target,dimension(:) :: sendcounts
      integer(c_size_t),target,dimension(:) :: sdispls
      type(c_ptr), value :: recvbuff
      integer(c_size_t),target,dimension(:) :: recvcounts
      integer(c_size_t),target,dimension(:) :: rdispls
      integer(kind(ncclInt8)) :: datatype
      type(c_ptr), value :: comm
      type(c_ptr), value :: stream
      !
      ncclAlltoAllv_rank_1 = ncclAlltoAllv_(sendbuff,c_loc(sendcounts),c_loc(sdispls),recvbuff, &
        c_loc(recvcounts),c_loc(rdispls),datatype,comm,stream)
    end function

#endif
#endif
end module hipfort_rccl
