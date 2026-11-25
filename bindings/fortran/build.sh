#!/usr/bin/env bash
# Build, install and test the thirteen Fortran bindings of this directory, the way
# TheRock does: each bindings/fortran/<lib> is a standalone CMake project, built
# against the installed ROCm and installed into one prefix, in dependency order,
# so that a binding finds the ones it uses (HIP for every test, rocBLAS for
# rocSOLVER) with find_package.
#
#   bindings/fortran/build.sh [extra cmake args...]
#
# Environment:
#   ROCM_PATH   installed ROCm                    (default: /opt/rocm)
#   PREFIX      where the bindings are installed  (default: bindings/fortran/install)
#   BUILD_DIR   where they are built              (default: bindings/fortran/build)
#   FC          Fortran compiler                  (default: each binding's probe, amdflang first)
#   JOBS        parallel build jobs               (default: nproc)
#   RUN_TESTS   1 to run each binding's ctest     (default: 1; the tests need an AMD GPU)
#
# Extra arguments go to every configure, for example
#   bindings/fortran/build.sh -DFORTRAN_ARRAY_INTERFACES=assumed-rank

set -euo pipefail
here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ROCM_PATH="${ROCM_PATH:-/opt/rocm}"
PREFIX="${PREFIX:-$here/install}"
BUILD_DIR="${BUILD_DIR:-$here/build}"
JOBS="${JOBS:-$(nproc)}"
RUN_TESTS="${RUN_TESTS:-1}"

# HIP first: every test uses it. rocBLAS before rocSOLVER, whose module uses rocblas.
libs=(hip roctx rccl rocblas hipblas rocsolver hipsolver rocsparse hipsparse rocfft hipfft rocrand hiprand)

fc_args=()
[[ -n "${FC:-}" ]] && fc_args=(-DCMAKE_Fortran_COMPILER="$FC")

for lib in "${libs[@]}"; do
  printf '\n=== %s\n' "$lib"
  cmake -S "$here/$lib" -B "$BUILD_DIR/$lib" \
        -DCMAKE_PREFIX_PATH="$PREFIX;$ROCM_PATH" \
        -DCMAKE_INSTALL_PREFIX="$PREFIX" \
        "${fc_args[@]}" "$@"
  cmake --build "$BUILD_DIR/$lib" -j "$JOBS"
  cmake --install "$BUILD_DIR/$lib"
done

if [[ "$RUN_TESTS" == 1 ]]; then
  failed=()
  for lib in "${libs[@]}"; do
    printf '\n=== %s tests\n' "$lib"
    ctest --test-dir "$BUILD_DIR/$lib" --output-on-failure || failed+=("$lib")
  done
  if (( ${#failed[@]} )); then
    printf '\nFailed: %s\n' "${failed[*]}"
    exit 1
  fi
fi
printf '\nInstalled in %s\n' "$PREFIX"
