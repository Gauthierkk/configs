# Starship

Custom [Starship](https://starship.rs/) prompt config with [Nerd Font](https://www.nerdfonts.com/) symbol overrides for 40+ modules — languages, tools, git, OS indicators, and more.

## What's Included

The [`starship.toml`](starship.toml) replaces default module symbols with Nerd Font icons:

- **Languages** — Python, Rust, Go, Node.js, Java, Ruby, C/C++, and more
- **Tools** — Docker, Conda, Gradle, Meson, CMake, etc.
- **Version control** — Git branch, commit tags, Fossil, Pijul, Mercurial
- **Cloud** — AWS, Google Cloud
- **OS indicators** — macOS, Linux distros, Windows, BSD variants
- **System** — Memory usage, package info, hostname SSH symbol

## Setup

### Prerequisites

- macOS with [Homebrew](https://brew.sh/)
- `zsh` shell (default on macOS)

### Installation

```sh
cd ~/Documents/code/configs/starship
chmod +x setup.sh
./setup.sh
```

The script installs Starship and FiraCode Nerd Font via Homebrew (skipping if present), then configures `~/.zshrc` with:

```sh
export STARSHIP_CONFIG="/path/to/starship.toml"
eval "$(starship init zsh)"
```

Safe to run multiple times. Restart your shell or `source ~/.zshrc` after.

### Font setup

**VS Code** — add to settings JSON:

```json
{
  "editor.fontFamily": "FiraCode Nerd Font Mono",
  "terminal.integrated.fontFamily": "FiraCode Nerd Font Mono"
}
```

**iTerm2** — Settings → Profiles → Text → Font → **FiraCode Nerd Font Mono**

## Customization

Edit `starship.toml` to tweak symbols, add modules, or change prompt behaviour. See the [Starship config docs](https://starship.rs/config/) for the full reference.
