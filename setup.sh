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
echo "--- Zsh ---"
cp "${SCRIPT_DIR}/.zshrc" "${HOME}/.zshrc"
echo "Copied .zshrc to ${HOME}/.zshrc"

echo ""
echo "--- Claude Code ---"
bash "${SCRIPT_DIR}/.claude/setup.sh"

echo ""
echo "=== All configs installed ==="
