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
CODE_DIR="$MOUNTPOINT/Code"
BREWFILE_PATH="$DOTFILES_DIR/Brewfile"

## Install Homebrew
if ! command -v brew &> /dev/null; then
    echo "======================================================================="
    echo "==> Installing Homebrew..."
    echo "======================================================================="
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
brew update && brew upgrade
echo "--- Done updating Homebrew. ---" && echo ""

# Install PHP
echo "======================================================================="
echo "==> Installing PHP.new (PHP, Laravel, Composer)..."
echo "======================================================================="
/bin/bash -c "$(curl -fsSL https://php.new/install/mac)"
echo "--- Done installing PHP. ---" && echo ""

# Install Homebrew packages and apps
echo "======================================================================="
echo "==> Installing homebrew packages and apps from Brewfile..."
echo "======================================================================="
brew bundle
echo "--- Done installing Homebrew packages and apps. ---" && echo ""

# Git
echo "======================================================================="
echo "==> Linking Git..."
echo "======================================================================="
rm ~/.gitconfig
rm ~/.gitignore
ln -s "$DOTFILES_DIR/git/.gitconfig" ~/.gitconfig
ln -s "$DOTFILES_DIR/git/.gitignore" ~/.gitignore
echo "--- Done linking Git. ---" && echo ""

# ZSH
echo "======================================================================="
echo "==> Linking ZSH..."
echo "======================================================================="
rm ~/.zshrc
ln -s "$DOTFILES_DIR/zsh/.zshrc" ~/.zshrc
echo "--- Done linking ZSH. ---" && echo ""

## Link up dotfiles
mkdir "$HOME_DIR/.config"
echo "======================================================================="
echo "==> Linking up dotfiles..."
echo "======================================================================="
cd "$DOTFILES_DIR"
stow .
echo "--- Done linking dotfiles. ---" && echo ""

# Code
echo "======================================================================="
echo "==> Linking Code"
echo "======================================================================="
rm ~/Code
ln -s "$CODE_DIR" ~/Code
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
rm -rf "$HOME_DIR/Library/Application Support/Code/User"
ln -s "$DOTFILES_DIR/vscode" "$HOME_DIR/Library/Application Support/Code/User"
echo "--- Done linking VS Code config. ---" && echo ""
rm -rf "$HOME_DIR/Library/Application Support/Cursor/User"
ln -s "$DOTFILES_DIR/cursor" "$HOME_DIR/Library/Application Support/Cursor/User"
echo "--- Done linking Cursor config. ---" && echo ""
rm -rf "$HOME_DIR/Library/Application Support/Windsurf/User"
ln -s "$DOTFILES_DIR/windsurf" "$HOME_DIR/Library/Application Support/Windsurf/User"
echo "--- Done linking Windsurf config. ---" && echo ""


echo "======================================================================="
echo "==> Done!"
echo "======================================================================="
