#!/usr/bin/env bash

set -euo pipefail

echo "======================================================================="
echo "==> Start setting up my dotfiles..."
echo "======================================================================="

# Some paths
SCRIPT_PATH="$(realpath "$0")"
VOLUME_NAME=$(df -P "$SCRIPT_PATH" | tail -1 | awk '{print $1}')
MOUNTPOINT=$(df -P "$SCRIPT_PATH" | tail -1 | awk '{print $6}')

# Create a variable for the current directory absolute path
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOME_DIR="$(cd ~ && pwd)"
# Where the ~/Code symlink should point. Override with CODE_DIR=... ./setup.sh
CODE_DIR="${CODE_DIR:-$MOUNTPOINT/Code}"
BREWFILE_PATH="$DOTFILES_DIR/Brewfile"
# Set BREW_UPGRADE=1 to also `brew upgrade` every installed package.
BREW_UPGRADE="${BREW_UPGRADE:-0}"
BACKUP_SUFFIX="pre-dotfiles-$(date +%Y%m%d%H%M%S)"

# Move an existing path aside, unless it is already the symlink we want.
# Real files/dirs are renamed to "<path>.<BACKUP_SUFFIX>" rather than deleted.
backup_path() {
    local target="$1"
    [ -e "$target" ] || [ -L "$target" ] || return 0

    if [ -L "$target" ] && [ "$(readlink "$target")" = "${2:-}" ]; then
        return 0
    fi

    if [ -L "$target" ]; then
        rm -f "$target"
    else
        echo "    backing up $target -> $target.$BACKUP_SUFFIX"
        mv "$target" "$target.$BACKUP_SUFFIX"
    fi
}

# Idempotently link SRC -> DEST, preserving anything already at DEST.
link() {
    local src="$1" dest="$2"
    backup_path "$dest" "$src"
    mkdir -p "$(dirname "$dest")"
    ln -sfn "$src" "$dest"
    echo "    linked $dest -> $src"
}

## Install Homebrew
if ! command -v brew &> /dev/null; then
    echo "======================================================================="
    echo "==> Installing Homebrew..."
    echo "======================================================================="
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
brew update
if [ "$BREW_UPGRADE" = "1" ]; then
    brew upgrade
fi
echo "--- Done updating Homebrew. ---" && echo ""

# Install PHP
echo "======================================================================="
echo "==> Installing PHP.new (PHP, Laravel, Composer)..."
echo "======================================================================="
# php.new is Laravel's official installer; sets up PHP, Composer and the Laravel installer.
/bin/bash -c "$(curl -fsSL https://php.new/install/mac)"
echo "--- Done installing PHP. ---" && echo ""

# Install Homebrew packages and apps
echo "======================================================================="
echo "==> Installing homebrew packages and apps from Brewfile..."
echo "======================================================================="
brew bundle --file "$BREWFILE_PATH"
echo "--- Done installing Homebrew packages and apps. ---" && echo ""

# Git
echo "======================================================================="
echo "==> Linking Git..."
echo "======================================================================="
link "$DOTFILES_DIR/git/.gitconfig" ~/.gitconfig
link "$DOTFILES_DIR/git/.gitignore" ~/.gitignore
echo "--- Done linking Git. ---" && echo ""

# ZSH
echo "======================================================================="
echo "==> Linking ZSH..."
echo "======================================================================="
link "$DOTFILES_DIR/zsh/.zshrc" ~/.zshrc
echo "--- Done linking ZSH. ---" && echo ""

## Link up dotfiles
mkdir -p "$HOME_DIR/.config"
echo "======================================================================="
echo "==> Linking up dotfiles..."
echo "======================================================================="
cd "$DOTFILES_DIR"
if ! stow --simulate --verbose .; then
    echo "Stow preflight failed; resolve the conflicts before continuing." >&2
    exit 1
fi
stow .
echo "--- Done linking dotfiles. ---" && echo ""

# Code
echo "======================================================================="
echo "==> Linking Code"
echo "======================================================================="
if [ -d "$CODE_DIR" ]; then
    link "$CODE_DIR" ~/Code
else
    echo "    skipping ~/Code: $CODE_DIR does not exist (set CODE_DIR=... to override)"
fi
echo "--- Done. ---" && echo ""

# tmux
echo "======================================================================="
echo "==> Tmux Plugins"
echo "======================================================================="
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    echo "--- Done installing TPM. ---" && echo ""
else
    echo "--- TPM already exists, skipping installation. ---" && echo ""
fi

# Link up editor configs
echo "======================================================================="
echo "==> Linking up editor configs..."
echo "======================================================================="
link "$DOTFILES_DIR/vscode" "$HOME_DIR/Library/Application Support/Code/User"
echo "--- Done linking VS Code config. ---" && echo ""
link "$DOTFILES_DIR/cursor" "$HOME_DIR/Library/Application Support/Cursor/User"
echo "--- Done linking Cursor config. ---" && echo ""


echo "======================================================================="
echo "==> Done!"
echo "======================================================================="
