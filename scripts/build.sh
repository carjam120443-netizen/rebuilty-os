#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="$ROOT/third_party/reactos"
BUILD="$ROOT/build"
ARCH="${ARCH:-amd64}"

"$ROOT/scripts/fetch-reactos.sh"

if ! command -v cmake >/dev/null 2>&1; then
  echo "ERROR: CMake is required."
  exit 1
fi
if ! command -v ninja >/dev/null 2>&1; then
  echo "ERROR: Ninja is required."
  exit 1
fi

# ReactOS provides the Windows-compatible NT/Win32 implementation used by
# Rebuilty OS. RosBE is recommended because it supplies the cross compiler
# and other build tools expected by ReactOS.
if [ -z "${ROS_ARCH:-}" ]; then
  echo "NOTE: ROS_ARCH is not set. If this build fails, enter a ReactOS Build"
  echo "Environment (RosBE) first, then rerun this script."
fi

cmake -S "$SRC" -B "$BUILD" -G Ninja \
  -DARCH="$ARCH" \
  -DCMAKE_BUILD_TYPE="${BUILD_TYPE:-Release}" \
  -DENABLE_ROSAPPS=1

cmake --build "$BUILD" -- -k0

echo
echo "Rebuilty OS / ReactOS-compatible build completed."
echo "Build directory: $BUILD"
