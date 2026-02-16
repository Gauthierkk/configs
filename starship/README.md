# Starship Config

A version-controlled [Starship](https://starship.rs/) prompt configuration with [Nerd Font](https://www.nerdfonts.com/) symbol overrides for 40+ modules — languages, tools, git, OS indicators, and more.

## Prerequisites

- macOS with [Homebrew](https://brew.sh/) installed
- `zsh` shell (default on macOS)

## 1. Clone & Run Setup

```sh
git clone https://github.com/Gauthierkk/configs.git ~/Documents/code/configs
cd ~/Documents/code/configs/starship
chmod +x setup.sh
./setup.sh
```

The `setup.sh` script will:

1. **Install Starship** via Homebrew (skips if already installed)
2. **Install FiraCode Nerd Font** via Homebrew (skips if already installed)
3. **Configure your shell** by appending the following to `~/.zshrc`:

```sh
export STARSHIP_CONFIG="/path/to/this/repo/starship.toml"
eval "$(starship init zsh)"
```

It checks for existing entries before adding, so it's safe to run multiple times.

After running, restart your shell or source your config:

```sh
source ~/.zshrc
```

## 2. App Specific Settings

### VS Code

Open your VS Code settings JSON (**Cmd+Shift+P** → "Preferences: Open User Settings (JSON)") and add or update the following:

```json
{
  "editor.fontFamily": "FiraCode Nerd Font Mono",
  "terminal.integrated.fontFamily": "FiraCode Nerd Font Mono"
}
```

This sets both the editor and the integrated terminal to use the Nerd Font.

### iTerm2

1. Open **iTerm2 → Settings** (or press **Cmd+,**)
2. Go to **Profiles → Text**
3. Under **Font**, select **FiraCode Nerd Font Mono**
4. Optionally adjust the font size to your preference



## What the Config Does

The [`starship.toml`](starship.toml) replaces default Starship module symbols with Nerd Font icons. This includes custom symbols for:

- **Languages** — Python, Rust, Go, Node.js, Java, Ruby, C/C++, and many more
- **Tools** — Docker, Conda, Gradle, Meson, CMake, etc.
- **Version control** — Git branch, Git commit tags, Fossil, Pijul, Mercurial
- **Cloud** — AWS, Google Cloud
- **OS indicators** — macOS, Linux distros, Windows, BSD variants, and others
- **System** — Memory usage, package info, hostname SSH symbol

## Customisation

Edit `starship.toml` to tweak symbols, add new modules, or change prompt behaviour. See the [Starship configuration docs](https://starship.rs/config/) for the full reference.
