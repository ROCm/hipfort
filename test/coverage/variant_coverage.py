#!/usr/bin/env python3
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

"""Measure how thoroughly the test suite exercises the generated bindings.

hipfort is generated code. For each routine the generator emits a raw bind(C)
interface plus, where the arguments allow it, Fortran module procedures that
wrap it:

    <routine>_rank_0     scalar / raw c_ptr argument
    <routine>_rank_1     1-D Fortran array
    <routine>_full_rank  N-D Fortran array
    <routine>_typed      typed scalars (and Fortran strings) in place of the
                         type(c_ptr) the bind(C) interface takes
    <routine>_devptr     the same, keeping the device-pointer-mode scalars as
                         type(c_ptr); also _rank_N_devptr / _full_rank_devptr

Each one is a distinct wrapper body that marshals its arguments with c_loc
and calls the bind(C) interface, so gcov can tell whether a test actually
executed it. The HIP runtime (hipMalloc, hipMemcpy, hipHostRegister) also ships array
overloads, keyed by element type and rank instead -- hipmalloc_i4_2_source,
hipfree_c4_1 -- and those are counted too, as a "hip runtime" row.

This script reports, per library, how many of those wrapper bodies ran, counted
over the routines that have at least one test.

Note what this does *not* measure. A test that calls the raw bind(C) interface
directly -- which every Fortran 2003 test does, and which is a perfectly correct
way to use the library -- executes no wrapper body and is therefore invisible
here. Routines that get no wrapper at all (no array or typed-scalar argument)
contribute nothing for the same reason. This is a measure of how much of the
*generator's* output is live, not a measure of API test coverage.

F2018 assumed-rank overloads are excluded: they are off by default, so they are
not callable in a normal build.

Usage (normally driven by the `coverage` CMake target):
    python3 variant_coverage.py --build <build-dir> [--html FILE] [--json FILE]
    python3 variant_coverage.py --build <build-dir> --clean

Requires a build configured with -DHIPFORT_CODE_COVERAGE=ON that has been run
once, and a gcov matching the gfortran that produced it.
"""

import argparse
import gzip
import html
import json
import os
import re
import shutil
import subprocess
import sys
from collections import defaultdict

# Each entry is a reported row: the label, and the binding modules to scan for
# it. The math libraries are one module each; the HIP runtime spreads its array
# overloads over several.
GROUPS = [
    ("rocblas",  ["hipfort_rocblas"]),
    ("rocsolver", ["hipfort_rocsolver"]),
    ("rocsparse", ["hipfort_rocsparse"]),
    ("rocfft",   ["hipfort_rocfft"]),
    ("rocrand",  ["hipfort_rocrand"]),
    ("hipblas",  ["hipfort_hipblas"]),
    ("hipsolver", ["hipfort_hipsolver"]),
    ("hipsparse", ["hipfort_hipsparse"]),
    ("hipfft",   ["hipfort_hipfft"]),
    ("hipfftw",  ["hipfort_hipfftw"]),
    ("hiprand",  ["hipfort_hiprand"]),
    ("roctx",    ["hipfort_roctx"]),
    ("hip runtime", ["hipfort", "hipfort_hipmalloc", "hipfort_hipmemcpy",
                     "hipfort_hiphostregister"]),
]

# The generated wrappers are named <routine>_rank_0 / _rank_1 / _full_rank,
# <routine>_typed, <routine>_devptr and <routine>_rank_N_devptr /
# _full_rank_devptr; all of a routine's wrappers form one family.
VARIANT_RE = re.compile(r"(.+?)_((?:rank_\d+|full_rank)(?:_devptr)?|typed|devptr)$")

# The HIP runtime overloads are keyed by element type and rank instead, as in
# hipmalloc_i4_2_source or hipfree_c4_1, so the family is the routine plus its
# type and the variant is the rank with any flavour suffix. Both schemes leave
# out assumed_rank, which is off by default and so not callable.
HIP_VARIANT_RE = re.compile(r"(.+?_(?:i|r|c|l)\d+)_(\d+(?:_[a-z0-9_]+)?)$")


def matching_gcov():
    """gcov-<major> for the gfortran on PATH, else plain gcov: a gcov of another
    major version cannot read the .gcno files."""
    try:
        major = subprocess.run(["gfortran", "-dumpversion"], capture_output=True,
                               text=True).stdout.strip().split(".")[0]
    except OSError:
        major = ""
    return (major and shutil.which(f"gcov-{major}")) or shutil.which("gcov")


def find_object_dir(build):
    """Locate the object directory holding the instrumented binding modules."""
    direct = os.path.join(build, "lib", "CMakeFiles", "hipfort-amdgcn.dir", "hipfort")
    if os.path.isdir(direct):
        return direct
    tail = os.path.join("hipfort-amdgcn.dir", "hipfort")
    for root, _dirs, _files in os.walk(build):
        if root.endswith(tail):
            return root
    return None


def clean(build):
    """Remove the .gcda counters left by a previous run."""
    removed = 0
    for root, _dirs, files in os.walk(build):
        for name in files:
            if name.endswith(".gcda"):
                os.remove(os.path.join(root, name))
                removed += 1
    print(f"removed {removed} .gcda file(s) under {build}")


def run_suite(build, cmake_exe, ctest_exe):
    """Build everything that can build, then run the suite once.

    Neither step is allowed to abort the measurement. A test can fail to link
    because its routine is missing from the installed runtime (the bindings
    track a newer ROCm than the machine has), and a test can fail outright;
    either way the remaining tests still produce coverage worth reporting, and
    it is the precheckin job -- not this one -- that gates build and test
    correctness.
    """
    jobs = str(os.cpu_count() or 4)
    print(">>> building the test suite")
    subprocess.run([cmake_exe, "--build", build, "-j", jobs], check=False)
    # Second pass keeps going past a failing target so the rest still link.
    subprocess.run([cmake_exe, "--build", build, "-j", jobs, "--", "-k"], check=False)

    # Counters accumulate across runs, so start from a clean slate: one pass in,
    # one pass out. A stale .gcda would otherwise be counted a second time.
    clean(build)

    print(">>> running the test suite once")
    subprocess.run([ctest_exe, "--test-dir", build, "--output-on-failure"], check=False)


def load_gcov(gcno, gcov_exe):
    """Run gcov on one .gcno and return the parsed JSON, or None."""
    result = subprocess.run([gcov_exe, "--json-format", "--stdout", gcno],
                            capture_output=True)
    if not result.stdout:
        return None
    for decode in (lambda b: json.loads(b),
                   lambda b: json.loads(gzip.decompress(b))):
        try:
            return decode(result.stdout)
        except Exception:
            continue
    return None


def measure(build, gcov_exe):
    """Return {group: {run, gen, tested, families, detail}} (None when no data)."""
    objdir = find_object_dir(build)
    if objdir is None:
        sys.exit(f"error: no instrumented binding objects under {build}. "
                 f"Configure with -DHIPFORT_CODE_COVERAGE=ON and build first.")

    results = {}
    for label, modules in GROUPS:
        generated = defaultdict(set)   # family -> variants emitted
        executed = defaultdict(set)    # family -> variants that ran
        saw_data = False

        for module in modules:
            gcno = os.path.join(objdir, f"{module}.F90.gcno")
            if not os.path.exists(gcno):
                continue
            # The module was built, so the group is reportable even if it turns
            # out to hold no wrapper bodies at all -- that is "no array
            # overloads", which is a real answer, not missing data.
            saw_data = True
            data = load_gcov(gcno, gcov_exe)
            if not data or not data.get("files"):
                continue
            for line in data["files"][0]["lines"]:
                fn = line.get("function_name")
                if not fn:
                    continue
                if "_assumed_rank" in fn:
                    continue    # off by default; see the module docstring
                match = VARIANT_RE.match(fn) or HIP_VARIANT_RE.match(fn)
                if not match:
                    continue
                family, variant = match.group(1), match.group(2)
                generated[family].add(variant)
                if line.get("count", 0) > 0:
                    executed[family].add(variant)

        if not saw_data:
            results[label] = None
            continue

        tested = [f for f in generated if executed[f]]
        results[label] = {
            "run": sum(len(executed[f]) for f in tested),
            "gen": sum(len(generated[f]) for f in tested),
            "tested": len(tested),
            "families": len(generated),
            "detail": {f: (len(executed[f]), len(generated[f])) for f in tested},
        }
    return results


def totals(results):
    run = sum(r["run"] for r in results.values() if r)
    gen = sum(r["gen"] for r in results.values() if r)
    return run, gen


def print_report(results, show_partial=False):
    header = f"{'library':12} {'variants run/gen':>18} {'coverage':>9} {'tested routines':>16}"
    print(header)
    print("-" * len(header))
    for lib, _modules in GROUPS:
        r = results.get(lib)
        if not r or r["gen"] == 0:
            note = ("(none tested)" if r["families"] else "(no wrappers)") if r else "(no data)"
            print(f"{lib:12} {note:>18} {'n/a':>9} {(r['tested'] if r else 0):>16}")
            continue
        pct = f"{round(100 * r['run'] / r['gen'])}%"
        ratio = f"{r['run']}/{r['gen']}"
        print(f"{lib:12} {ratio:>18} {pct:>9} {r['tested']:>16}")
    print("-" * len(header))
    run, gen = totals(results)
    pct = f"{round(100 * run / gen)}%" if gen else "n/a"
    ratio = f"{run}/{gen}"
    print(f"{'TOTAL':12} {ratio:>18} {pct:>9}")

    if show_partial:
        print("\nRoutines not covering every variant they generate:")
        for lib, _modules in GROUPS:
            r = results.get(lib)
            if not r:
                continue
            partial = sorted((name, hit, gen_)
                             for name, (hit, gen_) in r["detail"].items() if hit < gen_)
            if not partial:
                continue
            print(f"  [{lib}] {len(partial)} routine(s):")
            for name, hit, gen_ in partial[:12]:
                short = re.sub(r"^__hipfort_\w+_MOD_", "", name)
                print(f"      {short:40} {hit}/{gen_}")
            if len(partial) > 12:
                print(f"      ... and {len(partial) - 12} more")


def write_html(results, path):
    """Emit a small self-contained report (no external tooling required)."""
    run, gen = totals(results)
    pct = round(100 * run / gen) if gen else 0
    rows = []
    for lib, _modules in GROUPS:
        r = results.get(lib)
        if not r or r["gen"] == 0:
            rows.append(f"<tr><td>{html.escape(lib)}</td><td colspan=2 class=na>"
                        f"{'none tested' if r and r['families'] else 'no wrappers'}</td>"
                        f"<td>{(r['tested'] if r else 0)}</td></tr>")
            continue
        lpct = round(100 * r["run"] / r["gen"])
        rows.append(f"<tr><td>{html.escape(lib)}</td><td>{r['run']}/{r['gen']}</td>"
                    f"<td>{lpct}%</td><td>{r['tested']}</td></tr>")
    doc = f"""<!DOCTYPE html>
<html lang="en"><head><meta charset="utf-8">
<title>hipfort variant-execution coverage</title>
<style>
 body {{ font-family: system-ui, sans-serif; margin: 2rem; color: #222; }}
 h1 {{ font-size: 1.3rem; }} .big {{ font-size: 2.2rem; font-weight: 600; }}
 table {{ border-collapse: collapse; margin-top: 1rem; }}
 th, td {{ border: 1px solid #ccc; padding: .35rem .7rem; text-align: right; }}
 th:first-child, td:first-child {{ text-align: left; }}
 .na {{ color: #777; font-style: italic; text-align: center; }}
 p.note {{ max-width: 46rem; color: #444; line-height: 1.45; }}
</style></head><body>
<h1>hipfort variant-execution coverage</h1>
<p class="big">{run}/{gen} &nbsp;({pct}%)</p>
<table>
 <tr><th>library</th><th>variants run/generated</th><th>coverage</th><th>tested routines</th></tr>
 {chr(10) + ' '.join(rows)}
</table>
<p class="note">Counts the generated Fortran wrapper bodies
(<code>rank_0</code>, <code>rank_1</code>, <code>full_rank</code>,
<code>typed</code>, <code>devptr</code>) that actually executed, over the
routines that have at least one test. Tests that call the raw
<code>bind(C)</code> interface directly &mdash; every Fortran 2003 test does
&mdash; execute no wrapper and are not counted, and routines that get no
wrapper cannot contribute at all. Read this as how much of the
<em>generator's</em> output is live, not as API test coverage.</p>
</body></html>
"""
    os.makedirs(os.path.dirname(os.path.abspath(path)), exist_ok=True)
    with open(path, "w") as fh:
        fh.write(doc)
    print(f"wrote {path}")


def main():
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--build", required=True, help="coverage build directory")
    parser.add_argument("--clean", action="store_true",
                        help="delete .gcda counters and exit")
    parser.add_argument("--run", action="store_true",
                        help="build and run the suite before measuring")
    parser.add_argument("--cmake", default="cmake", help="cmake executable (with --run)")
    parser.add_argument("--ctest", default="ctest", help="ctest executable (with --run)")
    parser.add_argument("--gcov", help="gcov executable (default: match gfortran)")
    parser.add_argument("--html", metavar="FILE", help="write an HTML report")
    parser.add_argument("--json", metavar="FILE", help="write per-library JSON")
    parser.add_argument("--partial", action="store_true",
                        help="also list routines that miss some of their variants")
    args = parser.parse_args()

    if args.clean:
        clean(args.build)
        return

    gcov = args.gcov or matching_gcov()
    if not gcov:
        sys.exit("error: no gcov found; install the one matching your gfortran.")

    if args.run:
        run_suite(args.build, args.cmake, args.ctest)

    results = measure(args.build, gcov)
    print_report(results, show_partial=args.partial)

    if args.html:
        write_html(results, args.html)
    if args.json:
        compact = {lib: (None if not r else
                         {k: r[k] for k in ("run", "gen", "tested", "families")})
                   for lib, r in results.items()}
        with open(args.json, "w") as fh:
            json.dump(compact, fh, indent=2)
        print(f"wrote {args.json}")


if __name__ == "__main__":
    main()
