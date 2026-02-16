#!/bin/bash

# Setup script to install starship, Nerd Font, and configure the shell

# Install starship via Homebrew
if command -v starship &>/dev/null; then
  echo "starship is already installed — skipping."
else
  echo "Installing starship..."
  brew install starship
fi

# Install FiraCode Nerd Font Mono via Homebrew
if brew list --cask font-fira-code-nerd-font &>/dev/null 2>&1; then
  echo "FiraCode Nerd Font is already installed — skipping."
else
  echo "Installing FiraCode Nerd Font..."
  brew install --cask font-fira-code-nerd-font
fi

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
ZSHRC="$HOME/.zshrc"
CONFIG_LINE="export STARSHIP_CONFIG=\"$REPO_DIR/starship.toml\""
INIT_LINE='eval "$(starship init zsh)"'

# Check if lines already exist in .zshrc
if grep -qF 'STARSHIP_CONFIG=' "$ZSHRC" 2>/dev/null; then
  echo "STARSHIP_CONFIG is already set in $ZSHRC — skipping."
else
  echo "" >> "$ZSHRC"
  echo "# starship config stored in your git repo" >> "$ZSHRC"
  echo "$CONFIG_LINE" >> "$ZSHRC"
  echo "Added STARSHIP_CONFIG to $ZSHRC"
fi

if grep -qF 'starship init zsh' "$ZSHRC" 2>/dev/null; then
  echo "starship init is already in $ZSHRC — skipping."
else
  echo "$INIT_LINE" >> "$ZSHRC"
  echo "Added starship init to $ZSHRC"
fi

echo ""
echo "Done! Restart your shell or run: source $ZSHRC"
