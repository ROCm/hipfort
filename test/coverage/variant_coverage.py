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
interface, <routine>_, inside a generic interface <routine>. Two measures are
reported per library.

Routines -- API coverage. The denominator is every bind(C) <routine>_ declared
in the library's binding module(s): the complete API, counted once per routine
however many #ifdef branches declare it. A routine is covered only when a call
to its raw bind(C) interface is seen to execute:

  * a test source line that executed (gcov count > 0) names <routine>_
    (case-insensitive, whole identifier), or
  * a line of the binding module itself that executed names <routine>_, that
    is, a wrapper's own raw call ran, or
  * a test line that executed names the generic <routine>, and either the
    generic has no module procedures, so it can only resolve to the raw
    interface, or that test's object file references the routine's bind(C)
    symbol (nm -u), so the generic resolved to the raw interface there.

Entering a wrapper is not enough: some skip the raw call (hipFree with
only_if_allocated on an unassociated pointer never calls hipFree_). One blind
spot remains: a test object with a raw call to a routine that never ran plus an
executed generic call routed through a wrapper credits that routine.

The test programs are compiled with --coverage too, so this is line-level:
comments, declarations and `use` lines have no count and never give credit, and
a call after a test's early stop or crash has count 0. A one-line
`if (cond) call x()` shares its count with the condition, so the action is
credited only when gcov reports no unexecuted block on the line (the exhaustive
symbol tests guard every call with `if (never)`, and must not count). A name
used by a test for something else (a local variable of the same name) would be
credited.

Variants -- generator coverage. Where the arguments allow it, the generator also
emits Fortran module procedures that wrap the bind(C) interface:

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

This measure counts how many of those wrapper bodies ran, over the routines
that have at least one wrapper executed. Only some routines get wrappers, so it
says how much of the *generator's* output is live, not how much of the API is
tested; that is what the routines measure is for.

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
# it. The math libraries are one module each; the HIP runtime spreads its
# routines and array overloads over several (hipGetDeviceProperties lives alone
# in hipfort_auxiliary).
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
    ("hipfftxt", ["hipfort_hipfftxt"]),
    ("hipfftw",  ["hipfort_hipfftw"]),
    ("hiprand",  ["hipfort_hiprand"]),
    ("roctx",    ["hipfort_roctx"]),
    ("hip runtime", ["hipfort", "hipfort_hipmalloc", "hipfort_hipmemcpy",
                     "hipfort_hiphostregister", "hipfort_auxiliary"]),
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

# The binding sources, found relative to this script (test/coverage/ -> lib/hipfort/).
BINDING_SRC = os.path.join(os.path.dirname(os.path.abspath(__file__)),
                           os.pardir, os.pardir, "lib", "hipfort")

# String literals and trailing comments, dropped before looking for names.
NOISE_RE = re.compile(r"'[^']*'|\"[^\"]*\"|!.*")
TOKEN_RE = re.compile(r"[a-z_]\w*")
# The raw interface of a routine: function|subroutine <routine>_(...)
# bind(c [, name="<C symbol>"]).
BIND_C_RE = re.compile(r"\b(?:function|subroutine)\s+(\w+)_\s*\(.*\bbind\s*\(\s*c\b"
                       r"(?:\s*,\s*name\s*=\s*['\"](\w+)['\"])?")
LOGICAL_IF_RE = re.compile(r"(?:\d+\s+)?if\s*\(")


def statements(text, keep_strings=False):
    """Yield (line numbers, code) per Fortran statement: & continuations joined,
    comments, string contents (unless keep_strings) and preprocessor lines
    dropped, lowercased."""
    def noise(m):
        if m.group().startswith("!"):
            return ""
        return m.group() if keep_strings else "''"
    nums, parts = [], []
    for num, raw in enumerate(text.splitlines(), 1):
        if raw.lstrip().startswith("#"):
            continue
        code = NOISE_RE.sub(noise, raw).strip()
        if not code:
            continue    # blank or comment line, possibly inside a continuation
        nums.append(num)
        parts.append(code.lstrip("&").rstrip("&"))
        if not code.endswith("&"):
            yield nums, " ".join(parts).lower()
            nums, parts = [], []


def parse_bindings(text):
    """Return (routines, wrapped) for a binding module's source. routines maps
    every bind(C) interface <routine>_, lowercased and without the underscore,
    to its C symbol(s), lowercased: one entry however many #ifdef branches
    declare it. wrapped is the generic interfaces that hold module procedures,
    which a generic call may resolve to instead."""
    routines, wrapped, generic = defaultdict(set), set(), None
    for _nums, code in statements(text, keep_strings=True):
        m = BIND_C_RE.search(code)
        if m:
            routines[m.group(1)].add(m.group(2) or f"{m.group(1)}_")
        elif re.match(r"interface\s+(\w+)$", code):
            generic = code.split()[1]
        elif re.match(r"end\s*interface\b", code):
            generic = None
        elif generic and re.match(r"module\s+procedure\b", code):
            wrapped.add(generic)
    return dict(routines), wrapped


def covered_routines(routines, wrapped, tests, binding_names):
    """The routines whose raw bind(C) interface was seen to execute (see the
    module docstring). routines and wrapped come from parse_bindings; tests is
    one (executed names, undefined symbols) pair per test object, and
    binding_names the executed names of the binding modules."""
    in_tests = set().union(*(executed for executed, _undefined in tests))

    def raw_call(routine, symbols):
        if f"{routine}_" in binding_names or f"{routine}_" in in_tests:
            return True
        if routine not in in_tests:
            return False
        return routine not in wrapped or any(
            routine in executed and symbols & undefined for executed, undefined in tests)

    return {r for r, symbols in routines.items() if raw_call(r, symbols)}


def split_logical_if(code):
    """Split `if (cond) action` into (cond, action); other statements are
    (code, "")."""
    m = LOGICAL_IF_RE.match(code)
    if not m or re.search(r"\)\s*then$", code):
        return code, ""
    depth = 0
    for i in range(m.end() - 1, len(code)):
        depth += {"(": 1, ")": -1}.get(code[i], 0)
        if depth == 0:
            return code[:i + 1], code[i + 1:]
    return code, ""


def executed_names(text, gcov_lines):
    """Identifiers on the statements of `text` that executed, per gcov's lines.

    Only statements with a count above zero give credit, so comments,
    declarations and calls after an early stop or crash never do. The action of
    a one-line `if (cond) action` shares its line's count with the condition, so
    it counts only when gcov saw no unexecuted block on the line.
    """
    by_line = {line["line_number"]: line for line in gcov_lines}
    names = set()
    for nums, code in statements(text):
        hits = [by_line[n] for n in nums if n in by_line]
        if not any(h.get("count", 0) > 0 for h in hits):
            continue
        cond, action = split_logical_if(code)
        names.update(TOKEN_RE.findall(cond))
        if action and not any(h.get("unexecuted_block", True) for h in hits):
            names.update(TOKEN_RE.findall(action))
    return names


def names_in(data):
    """executed_names over every source file in one gcov JSON result."""
    names = set()
    for entry in (data or {}).get("files", []):
        path = os.path.join(data.get("current_working_directory", ""), entry["file"])
        if os.path.isfile(path):
            with open(path, errors="replace") as fh:
                names |= executed_names(fh.read(), entry["lines"])
    return names


def undefined_symbols(obj):
    """The undefined symbols an object file references, lowercased."""
    if not os.path.isfile(obj):
        return set()
    out = subprocess.run(["nm", "-u", obj], capture_output=True, text=True).stdout
    return {line.split()[-1].lower() for line in out.splitlines() if line.strip()}


def called_in_tests(build, gcov_exe):
    """One (executed identifiers, undefined symbols) pair per instrumented test
    object; the object file sits next to its .gcno (x.f03.gcno, x.f03.o)."""
    tests = []
    for root, _dirs, files in os.walk(build):
        if root.endswith(os.path.join(".dir", "hipfort")):
            continue    # the bindings themselves (hipfort-amdgcn, hipfort-nvptx)
        for name in files:
            if not name.endswith(".gcno"):
                continue
            gcno = os.path.join(root, name)
            executed = names_in(load_gcov(gcno, gcov_exe))
            if executed:
                tests.append((executed, undefined_symbols(gcno[:-len(".gcno")] + ".o")))
    return tests


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
    """Return {group: {run, gen, tested, families, detail, routines_run,
    routines_gen}} (None when no data)."""
    objdir = find_object_dir(build)
    if objdir is None:
        sys.exit(f"error: no instrumented binding objects under {build}. "
                 f"Configure with -DHIPFORT_CODE_COVERAGE=ON and build first.")
    tests = called_in_tests(build, gcov_exe)

    results = {}
    for label, modules in GROUPS:
        generated = defaultdict(set)   # family -> variants emitted
        executed = defaultdict(set)    # family -> variants that ran
        routines = defaultdict(set)    # bind(C) routine -> C symbols
        wrapped = set()                # generics with module procedures
        raw_calls = set()              # names on executed binding-module lines
        saw_data = False

        for module in modules:
            source = os.path.join(BINDING_SRC, f"{module}.F90")
            if os.path.exists(source):
                with open(source, errors="replace") as fh:
                    found, generics = parse_bindings(fh.read())
                for routine, symbols in found.items():
                    routines[routine] |= symbols
                wrapped |= generics
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
            raw_calls |= names_in(data)
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
            "routines_gen": len(routines),
            "routines_run": len(covered_routines(routines, wrapped, tests, raw_calls)),
        }
    return results


def totals(results, run_key="run", gen_key="gen"):
    run = sum(r[run_key] for r in results.values() if r)
    gen = sum(r[gen_key] for r in results.values() if r)
    return run, gen


def percent(run, gen):
    return f"{round(100 * run / gen)}%" if gen else "n/a"


def print_report(results, show_partial=False):
    header = (f"{'library':12} {'routines run/gen':>17} {'coverage':>9} "
              f"{'variants run/gen':>18} {'coverage':>9} {'wrapped tested':>15}")
    print(header)
    print("-" * len(header))
    for lib, _modules in GROUPS:
        r = results.get(lib)
        if not r:
            print(f"{lib:12} {'(no data)':>17}")
            continue
        routines = f"{r['routines_run']}/{r['routines_gen']}"
        rpct = percent(r["routines_run"], r["routines_gen"])
        if r["gen"] == 0:
            variants = "(none tested)" if r["families"] else "(no wrappers)"
        else:
            variants = f"{r['run']}/{r['gen']}"
        print(f"{lib:12} {routines:>17} {rpct:>9} {variants:>18} "
              f"{percent(r['run'], r['gen']):>9} {r['tested']:>15}")
    print("-" * len(header))
    run, gen = totals(results)
    rrun, rgen = totals(results, "routines_run", "routines_gen")
    print(f"{'TOTAL':12} {f'{rrun}/{rgen}':>17} {percent(rrun, rgen):>9} "
          f"{f'{run}/{gen}':>18} {percent(run, gen):>9}")

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
    rrun, rgen = totals(results, "routines_run", "routines_gen")
    rows = []
    for lib, _modules in GROUPS:
        r = results.get(lib)
        if not r:
            rows.append(f"<tr><td>{html.escape(lib)}</td><td colspan=5 class=na>no data</td></tr>")
            continue
        routines = (f"<td>{r['routines_run']}/{r['routines_gen']}</td>"
                    f"<td>{percent(r['routines_run'], r['routines_gen'])}</td>")
        if r["gen"] == 0:
            variants = (f"<td colspan=2 class=na>"
                        f"{'none tested' if r['families'] else 'no wrappers'}</td>")
        else:
            variants = f"<td>{r['run']}/{r['gen']}</td><td>{percent(r['run'], r['gen'])}</td>"
        rows.append(f"<tr><td>{html.escape(lib)}</td>{routines}{variants}"
                    f"<td>{r['tested']}</td></tr>")
    doc = f"""<!DOCTYPE html>
<html lang="en"><head><meta charset="utf-8">
<title>hipfort binding coverage</title>
<style>
 body {{ font-family: system-ui, sans-serif; margin: 2rem; color: #222; }}
 h1 {{ font-size: 1.3rem; }} .big {{ font-size: 2.2rem; font-weight: 600; }}
 table {{ border-collapse: collapse; margin-top: 1rem; }}
 th, td {{ border: 1px solid #ccc; padding: .35rem .7rem; text-align: right; }}
 th:first-child, td:first-child {{ text-align: left; }}
 .na {{ color: #777; font-style: italic; text-align: center; }}
 p.note {{ max-width: 46rem; color: #444; line-height: 1.45; }}
</style></head><body>
<h1>hipfort binding coverage</h1>
<p class="big">{rrun}/{rgen} routines &nbsp;({percent(rrun, rgen)})</p>
<p>{run}/{gen} wrapper variants ({percent(run, gen)})</p>
<table>
 <tr><th>library</th><th>routines run/declared</th><th>coverage</th>
 <th>variants run/generated</th><th>coverage</th><th>wrapped routines tested</th></tr>
 {chr(10) + ' '.join(rows)}
</table>
<p class="note"><b>Routines</b> counts every <code>bind(C)</code> interface
(<code>&lt;routine&gt;_</code>) in the library's binding module, the complete
API. A routine is covered when a call to that raw interface is seen to run: a
test line or a wrapper line that executed names <code>&lt;routine&gt;_</code>,
or a test line that executed names the generic <code>&lt;routine&gt;</code>
and the generic resolves to the raw interface (it has no wrappers, or the
test's object file references the routine's C symbol). Entering a wrapper is
not enough. Credit is per line: a call after a test's early stop or crash, a
comment or a declaration does not count.</p>
<p class="note"><b>Variants</b> counts the generated Fortran wrapper bodies
(<code>rank_0</code>, <code>rank_1</code>, <code>full_rank</code>,
<code>typed</code>, <code>devptr</code>) that actually executed, over the
routines that have at least one wrapper executed. Only some routines get
wrappers, so read this as how much of the <em>generator's</em> output is
live.</p>
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
                         {k: r[k] for k in ("run", "gen", "tested", "families",
                                            "routines_run", "routines_gen")})
                   for lib, r in results.items()}
        with open(args.json, "w") as fh:
            json.dump(compact, fh, indent=2)
        print(f"wrote {args.json}")


if __name__ == "__main__":
    main()
