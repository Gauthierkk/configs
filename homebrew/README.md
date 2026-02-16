# Homebrew

A version-controlled [Brewfile](https://github.com/Homebrew/homebrew-bundle) listing all Homebrew packages and casks I use.

## What's Included

The `Brewfile` tracks CLI tools (`gh`, `starship`, `uv`) and casks (`espanso`, `claude-code`, `font-fira-code-nerd-font`, `gemini`).

## Setup

### Prerequisites

- macOS with [Homebrew](https://brew.sh/)

### Installation

```sh
cd ~/Documents/code/configs/homebrew
chmod +x setup.sh
./setup.sh
```

The script installs Homebrew if missing, then syncs with the Brewfile — installing anything missing and removing anything not listed (`brew bundle --cleanup`).

## Customization

After installing or removing packages, regenerate the Brewfile from what's currently installed:

```sh
brew bundle dump --file=Brewfile --force
```

Or edit the Brewfile by hand to keep it curated.
