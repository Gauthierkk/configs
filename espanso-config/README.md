# Espanso Configuration

This repository contains my personal [espanso](https://espanso.org/) configuration files. Espanso is a cross-platform text expander written in Rust that allows you to create custom shortcuts and snippets to boost your productivity.

## Repository Structure

```
config/
├── default.yml          # Global espanso configuration
├── config:vscode.yaml   # VS Code specific configuration
├── obsidian.yaml        # Obsidian specific configuration
└── vscode.yaml          # Additional VS Code configuration

match/
├── base.yml            # Base text expansions (available everywhere)
├── _obsidian.yaml      # Obsidian-specific callout snippets
└── packages/           # Additional match packages (currently empty)
```

## What's Included

### Base Matches (`match/base.yml`)
- **General shortcuts**: Email, localhost, espanso info
- **Development**: Virtual environment activation
- **Git commands**: Common git operations (status, add, commit, push, pull, branch management)
- **Dynamic content**: Current IP address, today's date

### Obsidian Matches (`match/_obsidian.yaml`)
- Complete set of Obsidian callout snippets (note, info, tip, warning, danger, etc.)
- Formatted as `> [!callout-type]` for easy note-taking

### Configuration
- Customized global settings in `config/default.yml`
- Application-specific configurations for VS Code and Obsidian

## Installation

### Prerequisites
First, make sure you have espanso installed on your system:

**macOS:**
```bash
brew install espanso
```

**Linux:**
```bash
# Download and install from https://espanso.org/install/
```

**Windows:**
```bash
# Download installer from https://espanso.org/install/
```

### Installing This Configuration

This setup uses a **symlink** so that espanso reads its config directly from this Git repo. This way you can manage your config with version control from a convenient location.

1. **Clone this repository** wherever you like:
   ```bash
   git clone https://github.com/Gauthierkk/configs.git ~/Documents/code/configs
   ```

2. **Run the fresh-install script** to create the symlink:
   ```bash
   cd ~/Documents/code/configs/espanso-config
   bash scripts/fresh-install.sh
   ```

   This script will:
   - Stop espanso
   - Back up any existing config by moving its contents into the repo directory
   - Create a symlink from espanso's config path to this repo
   - Restart espanso

   The default paths used by the script are:
   | | Path |
   |---|---|
   | **Espanso config** (macOS) | `~/Library/Application Support/espanso` |
   | **Git repo** | `~/Documents/code/configs/espanso-config` |

   Edit the variables at the top of `scripts/fresh-install.sh` if your paths differ.

### Manual Symlink Setup

If you prefer to set up the symlink yourself:

1. Stop espanso and back up any existing config:
   ```bash
   espanso stop
   mv ~/Library/Application\ Support/espanso ~/Library/Application\ Support/espanso.backup
   ```

2. Create the symlink:
   ```bash
   ln -s ~/Documents/code/configs/espanso-config ~/Library/Application\ Support/espanso
   ```

3. Restart espanso:
   ```bash
   espanso restart
   ```

> **Note:** On Linux the config path is `~/.config/espanso` and on Windows it is `%APPDATA%\espanso`.

## Usage Examples

Once installed, you can use these shortcuts anywhere on your system:

- `:email` → `gauthier.kelly@artefact.com`
- `:gs` → `git status`
- `:gcm` → `git commit -m ""`
- `:venv` → `source .venv/bin/activate`
- `:note` → `> [!note]` (in Obsidian)
- `:today` → Current date
- `:ip` → Your current IP address

## Customization

Feel free to modify these configurations to suit your needs:

1. **Edit base matches**: Modify `match/base.yml` to add your own shortcuts
2. **Add app-specific matches**: Create new files in the `match/` directory
3. **Adjust global settings**: Edit `config/default.yml`

## Espanso Commands

Useful espanso commands for managing your configuration:

```bash
espanso status          # Check espanso status
espanso restart         # Restart espanso service
espanso stop            # Stop espanso
espanso start           # Start espanso
espanso edit            # Edit configuration files
espanso match list      # List all available matches
espanso package list    # List installed packages
```

## Contributing

If you find useful shortcuts or improvements, feel free to submit a pull request!

## Resources

- [Espanso Official Documentation](https://espanso.org/docs/)
- [Espanso GitHub Repository](https://github.com/federico-terzi/espanso)
- [Community Packages](https://hub.espanso.org/)