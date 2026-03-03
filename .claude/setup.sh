#!/bin/bash
set -euo pipefail
# Ensure ~/.claude points to this repo's .claude config
rm -rf "$HOME/.claude"
ln -s "$HOME/.config/.claude" "$HOME/.claude"

# Install plugins
claude plugin install github@claude-plugins-official
claude plugin install skill-creator@claude-plugins-official
claude plugin install typescript-lsp@claude-plugins-official
claude plugin install pyright-lsp@claude-plugins-official
claude plugin install rust-analyzer-lsp@claude-plugins-official
