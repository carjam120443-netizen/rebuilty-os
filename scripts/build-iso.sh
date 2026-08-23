#!/usr/bin/env bash
set -euo pipefail

# ReactOS currently uses the bootcd target when the complete ReactOS
# source tree is configured with its supported build environment. This
# wrapper gives the workflow a clearer failure mode and finds the ISO
# produced by the build instead of assuming a particular target exists.

BUILD_DIR="${1:-build}"

if [ ! -d "$BUILD_DIR" ]; then
  echo "Build directory '$BUILD_DIR' does not exist."
  exit 1
fi

if cmake --build "$BUILD_DIR" --target help 2>/dev/null | grep -Eq '(^|[[:space:]])bootcd([[:space:]]|$)'; then
  echo "Building bootcd target..."
  cmake --build "$BUILD_DIR" --target bootcd
else
  echo "The configured source does not expose a bootcd target."
  echo "Available CMake targets:"
  cmake --build "$BUILD_DIR" --target help || true
  echo "\nThis usually means the ReactOS tree was not configured with the full ReactOS build system."
  exit 2
fi

ISO="$(find "$BUILD_DIR" -type f \( -iname '*.iso' -o -iname '*.ISO' \) -print -quit)"

if [ -z "$ISO" ]; then
  echo "Build completed but no ISO was found under $BUILD_DIR."
  exit 3
fi

cp "$ISO" "RebuiltyOS.iso"
echo "ISO created: RebuiltyOS.iso"
ls -lh "RebuiltyOS.iso"
