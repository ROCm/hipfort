#!/usr/bin/env python3
# Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: MIT
"""Self-check: variant_coverage.py credits a routine only when a raw bind(C)
call to it is seen to execute."""

import os
import sys

sys.dont_write_bytecode = True  # keep the source tree clean when CTest runs this
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from variant_coverage import (covered_routines, executed_names,  # noqa: E402
                              parse_bindings)

# Line-level credit in a test: only the call on line 5 ran. Line 7 ran but its
# guarded call did not (an unexecuted block); the stop on line 8 fired, so
# line 9 never ran. Lines 2-4 carry no gcov record at all.
SOURCE = """\
program t
  use hipfort, only: routineD
  integer :: ierr, never_
  ! routineC is only mentioned here
  ierr = routineA_(1, &
                   2)
  if (never_ > 0) ierr = routineE(1)
  if (ierr == 0) stop 1
  call routineB(ierr)
end program t
"""
LINES = [
    {"line_number": 5, "count": 1, "unexecuted_block": False},
    {"line_number": 7, "count": 1, "unexecuted_block": True},
    {"line_number": 8, "count": 1, "unexecuted_block": False},
    {"line_number": 9, "count": 0, "unexecuted_block": True},
]
names = executed_names(SOURCE, LINES)
routines = {r for r in ("routinea", "routineb", "routinec", "routined", "routinee")
            if r in names or f"{r}_" in names}
assert routines == {"routinea"}, routines

# Raw-call credit. hipFree has a wrapper that skips hipFree_ for an unassociated
# pointer; hipInit has no wrapper, so its generic can only be the raw call.
BINDING = """\
module m
  interface hipFree
    function hipFree_(ptr) bind(c, name="hipFree")
      type(c_ptr), value :: ptr
    end function
    module procedure hipFree_i4_0
  end interface
  interface hipInit
    function hipInit_(flags) bind(c, name="hipInit")
      integer(c_int), value :: flags
    end function
  end interface
contains
  function hipFree_i4_0(ptr, only_if_allocated) result(res)
    integer(c_int), pointer, intent(inout) :: ptr
    logical, intent(in), optional :: only_if_allocated
    res = 0
    if (associated(ptr)) then
      res = hipFree_(c_loc(ptr))
    end if
  end function hipFree_i4_0
end module m
"""
TEST = """\
  ierr = hipFree(p, .true.)
  ierr = hipInit(0)
"""


def binding_lines(raw_call_count):
    """Wrapper entry and guard ran; the hipFree_ call on line 19 ran or not."""
    return [{"line_number": n, "count": 1, "unexecuted_block": False}
            for n in (14, 17, 18, 21)] + [
        {"line_number": 19, "count": raw_call_count, "unexecuted_block": False}]


declared, wrapped = parse_bindings(BINDING)
assert declared == {"hipfree": {"hipfree"}, "hipinit": {"hipinit"}}, declared
assert wrapped == {"hipfree"}, wrapped
test_names = executed_names(TEST, [{"line_number": 1, "count": 1},
                                   {"line_number": 2, "count": 1}])
# The test object's undefined symbols say which specific hipFree it linked:
# the wrapper (module procedure) or the raw bind(C) symbol itself.
VIA_WRAPPER = {"__m_mod_hipfree_i4_0", "hipinit"}
VIA_RAW = {"hipfree", "hipinit"}
for raw_call_count, undefined, expected in (
        (0, VIA_WRAPPER, {"hipinit"}),               # wrapper skipped hipFree_
        (1, VIA_WRAPPER, {"hipfree", "hipinit"}),    # wrapper's hipFree_ ran
        (0, VIA_RAW, {"hipfree", "hipinit"})):       # generic resolved to raw
    got = covered_routines(declared, wrapped, [(test_names, undefined)],
                           executed_names(BINDING, binding_lines(raw_call_count)))
    assert got == expected, (raw_call_count, undefined, got)
print("ok")
