#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="$ROOT/third_party/reactos"
REF="master"

if [ -n "${REACTOS_REF:-}" ]; then
  REF="$REACTOS_REF"
fi

if [ -d "$SRC/.git" ]; then
  echo "ReactOS source already exists at $SRC"
  exit 0
fi

mkdir -p "$(dirname "$SRC")"
echo "Fetching ReactOS ($REF)..."
git clone --depth 1 --branch "$REF" https://github.com/reactos/reactos.git "$SRC"
echo "ReactOS source is ready. Its original license and notices are preserved in third_party/reactos."
