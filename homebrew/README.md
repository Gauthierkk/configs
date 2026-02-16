# Homebrew Config

A version-controlled [Brewfile](https://github.com/Homebrew/homebrew-bundle) listing all Homebrew packages and casks I use.

## Setup

```sh
chmod +x setup.sh
./setup.sh
```

This installs Homebrew (if needed) and runs `brew bundle` against the Brewfile.

## Updating the Brewfile

After installing or removing packages, regenerate from what's currently installed:

```sh
brew bundle dump --file=Brewfile --force
```

Or edit the Brewfile by hand to keep it curated.
