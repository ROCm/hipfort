#!/usr/bin/env python3
# Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: MIT
"""Self-check: variant_coverage.py credits a routine only on a line that ran."""

import os
import sys

sys.dont_write_bytecode = True  # keep the source tree clean when CTest runs this
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from variant_coverage import executed_names  # noqa: E402

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

# gcov line records, as gcov --json-format writes them: the call on line 5 ran;
# line 7 ran but its guarded call did not (an unexecuted block); the stop on
# line 8 fired, so line 9 never ran. Lines 2-4 carry no record at all.
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
print("ok")
