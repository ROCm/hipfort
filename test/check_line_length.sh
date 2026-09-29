#!/usr/bin/env bash
###############################################################################
# Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
#
# SPDX-License-Identifier: MIT
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#
###############################################################################

# Fail if any Fortran line is 132 characters or longer. Free-form Fortran allows
# at most 132 and hipfort passes no flag to raise that, so we keep one character
# of margin.

set -uo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
MAX=131

mapfile -t FILES < <(find "$ROOT/lib" "$ROOT/test" -type f \
  \( -name '*.f90' -o -name '*.F90' -o -name '*.f03' -o -name '*.F03' \
     -o -name '*.f08' \) | sort)

# A scan that finds nothing must not pass silently.
if [ "${#FILES[@]}" -eq 0 ]; then
  echo "No Fortran sources found under $ROOT" >&2
  exit 1
fi

# LC_ALL=C makes length() count bytes, independent of the caller's locale.
VIOLATIONS="$(LC_ALL=C awk -v max="$MAX" -v root="$ROOT/" '
  length($0) > max {
    file = FILENAME
    sub(root, "", file)
    printf "  %s:%d is %d characters\n", file, FNR, length($0)
  }' "${FILES[@]}")"

if [ -n "$VIOLATIONS" ]; then
  echo "Fortran lines of 132 characters or more:"
  echo "$VIOLATIONS"
  echo "Wrap them with a trailing '&'."
  exit 1
fi

echo "Checked ${#FILES[@]} Fortran files, none over $MAX characters."
