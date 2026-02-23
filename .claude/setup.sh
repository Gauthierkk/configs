#!/bin/bash
set -euo pipefail
# Ensure ~/.claude points to this repo's .claude config
rm -rf "$HOME/.claude"
ln -s "$HOME/.config/.claude" "$HOME/.claude"
