# Espanso

Personal [Espanso](https://espanso.org/) text expansion config — shortcuts for git, dev workflows, Obsidian callouts, and more.

## What's Included

```
config/
├── default.yml          # Global espanso settings
├── config:vscode.yaml   # VS Code specific config
├── obsidian.yaml        # Obsidian specific config
└── vscode.yaml          # Additional VS Code config

match/
├── base.yml             # Base text expansions (available everywhere)
├── _obsidian.yaml       # Obsidian callout snippets
└── packages/            # Additional match packages
```

**Base matches** — email, localhost, virtual env activation, common git commands, current IP, today's date.

**Obsidian matches** — full set of callout snippets (`> [!note]`, `> [!warning]`, etc.).

## Setup

### Prerequisites

```sh
brew install espanso
```

### Installation

Run the fresh-install script to symlink this directory as espanso's config:

```sh
cd ~/Documents/code/configs/espanso
bash scripts/fresh-install.sh
```

The script stops espanso, migrates any existing config, creates the symlink at `~/Library/Application Support/espanso`, and restarts espanso.

## Usage

| Trigger | Output |
|---------|--------|
| `:email` | `gauthier.kelly@artefact.com` |
| `:gs` | `git status` |
| `:gcm` | `git commit -m ""` |
| `:venv` | `source .venv/bin/activate` |
| `:note` | `> [!note]` (Obsidian) |
| `:today` | Current date |
| `:ip` | Current IP address |

Useful commands:

```sh
espanso status        # Check status
espanso restart       # Restart after config changes
espanso match list    # List all available matches
```

## Customization

- Edit `match/base.yml` to add or modify shortcuts
- Create new files in `match/` for app-specific expansions
- Adjust global settings in `config/default.yml`
