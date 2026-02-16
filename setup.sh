#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "=== Setting up all configs ==="

echo ""
echo "--- Homebrew ---"
bash "${SCRIPT_DIR}/homebrew/setup.sh"

echo ""
echo "--- Espanso ---"
bash "${SCRIPT_DIR}/espanso/scripts/fresh-install.sh"

echo ""
echo "--- Starship ---"
bash "${SCRIPT_DIR}/starship/setup.sh"

echo ""
echo "=== All configs installed ==="
