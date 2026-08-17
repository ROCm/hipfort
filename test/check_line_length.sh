#!/usr/bin/env bash
# Fail if any Fortran line is 132 characters or longer. Free-form Fortran allows
# at most 132, and hipfort passes no flag to raise that.

set -uo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
MAX=131

mapfile -t FILES < <(find "$ROOT/lib" "$ROOT/test" -type f \
  \( -name '*.f90' -o -name '*.F90' -o -name '*.f03' -o -name '*.f08' \) | sort)

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
