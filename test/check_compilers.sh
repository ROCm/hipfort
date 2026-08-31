#!/usr/bin/env bash
# Build hipfort and run its CTest suite once per Fortran compiler, with and without
# HIPFORT_ASSUMED_RANK. Each combination needs its own build: .mod files are not
# portable between compilers. Missing compilers are skipped.
#
# Local equivalent of the math-ci hipfort precheckin job.
#
# Usage:
#   bash test/check_compilers.sh                  # every compiler found, both variants
#   bash test/check_compilers.sh gnu amdflang     # only these toolchains
#   bash test/check_compilers.sh --build-only     # skip ctest (no GPU needed)
#   bash test/check_compilers.sh --no-assumed-rank
#   BUILD_ROOT=/tmp/hfm bash test/check_compilers.sh
#
# Exit: non-zero if any available configuration fails to build or fails ctest.

set -uo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"           # repo root; this script lives in test/
BUILD_ROOT="${BUILD_ROOT:-$ROOT/build/compilers}"   # under build/, which .gitignore covers
CTEST_ARGS="${CTEST_ARGS:---output-on-failure}"

# ROCm root, resolved as in the top-level CMakeLists.txt.
if [ -z "${ROCM_PATH:-}" ] && _hipcc="$(command -v hipcc)"; then
  ROCM_PATH="$(dirname "$(dirname "$(readlink -f "$_hipcc")")")"
fi
ROCM_PATH="${ROCM_PATH:-/opt/rocm}"

# toolchain (cmake/toolchains/<name>.cmake) | binary probed for availability.
# CI gates amdflang and gnu; the rest are for developer machines that have them.
TOOLCHAINS=(
  "amdflang|amdflang"
  "gnu|gfortran"
  "intel|ifx"
  "intel-classic|ifort"
  "nvhpc|nvfortran"
  "cray|ftn"
)

# amdflang/flang may live under ROCm rather than on PATH.
EXTRA_PATHS=("$ROCM_PATH/bin" "$ROCM_PATH/llvm/bin")
find_bin() {
  command -v "$1" 2>/dev/null && return
  local d
  for d in "${EXTRA_PATHS[@]}"; do
    [ -x "$d/$1" ] && { echo "$d/$1"; return; }
  done
  return 1
}

BUILD_ONLY=false
ASSUMED_RANK=true
SELECTED=()
for a in "$@"; do
  case "$a" in
    --build-only) BUILD_ONLY=true ;;
    --no-assumed-rank) ASSUMED_RANK=false ;;
    -*) echo "unknown option: $a" >&2; exit 2 ;;
    *) SELECTED+=("$a") ;;
  esac
done

# Degrade to build-only on a CPU-only host, but say so. `grep -c` not `grep -q`:
# under pipefail a quiet grep makes rocminfo die of SIGPIPE and the check invert.
if ! $BUILD_ONLY && [ "$(rocminfo 2>/dev/null | grep -c 'gfx')" = 0 ]; then
  echo "NOTE: no AMD GPU visible (rocminfo reports no gfx agent), building only."
  BUILD_ONLY=true
fi

rc=0 any=0
declare -a SUMMARY=()

# run_config <label> <toolchain file> <compiler binary> [extra cmake args...]
run_config() {
  local label="$1" tc="$2" bin="$3"; shift 3
  local bdir="$BUILD_ROOT/$label" log="$BUILD_ROOT/$label.log"
  mkdir -p "$BUILD_ROOT"; rm -rf "$bdir"
  printf "  ....  %-22s %s\n" "$label" "$bin"

  # Prepend PATH so the toolchain file's bare compiler names resolve.
  local -x PATH="$(dirname "$bin"):$PATH"

  if ! cmake -S "$ROOT" -B "$bdir" \
        -DCMAKE_TOOLCHAIN_FILE="$tc" \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTING=ON \
        -DCMAKE_PREFIX_PATH="$ROCM_PATH" \
        "$@" >"$log" 2>&1; then
    printf "  FAIL  %-22s (configure) log: %s\n" "$label" "$log"
    tail -15 "$log" | sed 's/^/      /'
    SUMMARY+=("FAIL  $label (configure)"); rc=1; return
  fi
  if ! cmake --build "$bdir" -j "$(nproc)" >>"$log" 2>&1; then
    printf "  FAIL  %-22s (build) log: %s\n" "$label" "$log"
    tail -25 "$log" | sed 's/^/      /'
    SUMMARY+=("FAIL  $label (build)"); rc=1; return
  fi
  if $BUILD_ONLY; then
    printf "  BUILT %-22s (ctest skipped)\n" "$label"
    SUMMARY+=("BUILT $label (not run)"); return
  fi
  if ! ( cd "$bdir" && ctest $CTEST_ARGS ) >>"$log" 2>&1; then
    printf "  FAIL  %-22s (ctest) log: %s\n" "$label" "$log"
    sed -n '/tests passed/,$p' "$log" | head -30 | sed 's/^/      /'
    SUMMARY+=("FAIL  $label (ctest)"); rc=1; return
  fi
  local ntests
  ntests="$(grep -oE '[0-9]+% tests passed, [0-9]+ tests failed out of [0-9]+' "$log" | tail -1)"
  printf "  PASS  %-22s %s\n" "$label" "$ntests"
  SUMMARY+=("PASS  $label  $ntests")
}

for entry in "${TOOLCHAINS[@]}"; do
  name="${entry%%|*}"; probe="${entry#*|}"
  # Select by toolchain name or by compiler name, so `gnu` and `gfortran` both work.
  if [ "${#SELECTED[@]}" -gt 0 ] &&
     [[ ! " ${SELECTED[*]} " == *" $name "* ]] &&
     [[ ! " ${SELECTED[*]} " == *" $probe "* ]]; then
    continue
  fi
  tc="$ROOT/cmake/toolchains/$name.cmake"
  [ -f "$tc" ] || { echo "  SKIP  $name (no $tc)"; continue; }
  if ! bin="$(find_bin "$probe")"; then
    printf "  SKIP  %-22s (%s not installed)\n" "$name" "$probe"
    SUMMARY+=("SKIP  $name")
    continue
  fi
  any=1

  run_config "$name" "$tc" "$bin"
  # Assumed-rank swaps the array interfaces and enables test/f2018, so it needs
  # its own build rather than a rerun.
  if $ASSUMED_RANK; then
    run_config "$name-assumed-rank" "$tc" "$bin" -DHIPFORT_ASSUMED_RANK=ON
  fi
done

echo
echo "Summary:"
printf '  %s\n' "${SUMMARY[@]}"
[ "$any" -eq 0 ] && { echo "No Fortran compiler found."; exit 127; }
exit $rc
