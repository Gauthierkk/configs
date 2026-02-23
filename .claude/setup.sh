#!/bin/bash
set -euo pipefail
# Ensure ~/.claude points to this repo's .claude config
ln -sfn "$HOME/.config/.claude" "$HOME/.claude"
