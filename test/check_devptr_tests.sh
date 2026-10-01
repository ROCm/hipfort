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

# Structural audit of the *_devptr.f03 device-pointer-mode tests.
#
# These tests only prove anything if they really put the scalar in device
# memory AND really switch the handle. A test that silently kept a host scalar
# would still pass -- it would just compute the right answer for the wrong
# reason and assert nothing about the type(c_ptr),value scalar binding.
#
# This catches that statically. It cannot prove the library performed a device
# load; the evidence for that is the negative control recorded in the commit
# message (flipping the enum back to host mode makes every one of these
# segfault, because the device address is then dereferenced on the host).

set -uo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
FAIL=0

note() { echo "  $1" >&2; FAIL=1; }

mapfile -t FILES < <(find "$ROOT/test/f2003" -name '*_devptr.f03' | sort)

# A scan that finds nothing must not pass silently.
if [ "${#FILES[@]}" -eq 0 ]; then
  echo "No *_devptr.f03 tests found under $ROOT/test/f2003" >&2
  exit 1
fi

for f in "${FILES[@]}"; do
  rel="${f#"$ROOT"/}"
  lib="$(basename "$(dirname "$f")")"

  case "$lib" in
    rocblas)   want="rocblas_pointer_mode_device"   ;;
    hipblas)   want="HIPBLAS_POINTER_MODE_DEVICE"   ;;
    rocsparse) want="rocsparse_pointer_mode_device" ;;
    hipsparse) want="HIPSPARSE_POINTER_MODE_DEVICE" ;;
    *) note "$rel: unexpected library directory '$lib'"; continue ;;
  esac

  # 1. the handle is switched to this library's device pointer mode
  grep -q "$want" "$f" || note "$rel: missing $want"

  # 2. ...and nothing switches it back, or leaves the host spelling behind
  if grep -qiE "pointer_mode_host|POINTER_MODE_HOST|set_pointer_mode\([^)]*, *0 *\)" "$f"; then
    note "$rel: still selects host pointer mode somewhere"
  fi

  # 3. every device scalar is allocated, filled from its host twin, and freed
  for s in alpha beta; do
    grep -q "d_$s" "$f" || continue
    grep -q "hipMalloc(d_$s," "$f" || note "$rel: d_$s is never hipMalloc'd"
    # tolerate the aligned spacing the hand-written tests use
    grep -qE "hipMemcpy\(d_$s, +c_loc\($s\), *.*hipMemcpyHostToDevice" "$f" \
      || note "$rel: d_$s is never filled from the host $s"
    grep -q "hipFree(d_$s)" "$f" || note "$rel: d_$s is never freed"
  done

  # 4. no call site still passes the host scalar. The staging hipMemcpy is the
  #    one legitimate c_loc(alpha)/c_loc(beta), so exclude those lines only.
  stray="$(grep -nE "c_loc\((alpha|beta)\)" "$f" | grep -v "hipMemcpy(d_" || true)"
  [ -z "$stray" ] || note "$rel: host scalar still passed at: ${stray//$'\n'/ ; }"

  # 5. the verification still reads the host scalar, so a device/host mismatch
  #    shows up as a wrong result instead of being asserted away
  grep -vE "hipMemcpy\(d_|type\(c_ptr\)|^\s*!" "$f" | grep -qE "\balpha\b" \
    || note "$rel: host alpha is no longer used in the verification"

  # 6. it is a variant of a real host test, not an orphan
  host="${f/_devptr.f03/.f03}"
  [ -f "$host" ] || note "$rel: no host counterpart $(basename "$host")"
done

if [ "$FAIL" -ne 0 ]; then
  echo "Device-pointer-mode test audit FAILED." >&2
  exit 1
fi

echo "Audited ${#FILES[@]} *_devptr.f03 tests, all structurally sound."
