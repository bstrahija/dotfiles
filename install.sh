echo "Installing .dotfiles"
echo "---"

# Install PHP
echo "==> Installing PHP.new (PHP, Laravel, Composer)..."
/bin/bash -c "$(curl -fsSL https://php.new/install/mac)"

# Install Homebrew packages
echo "==> Installing homebrew packages..."
brew install starship nvim lnav fzf zoxide dust eza neofetch starship nano nanorc btop tmuxinator

# ZSH / Starship
echo "==> Linking ZSH..."
ln -s /Volumes/Superhero/DotFiles ~/.dotfiles
rm ~/.config/aliases
rm ~/.zshrc
ln -s ~/.dotfiles/aliases ~/.config/aliases
ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc
ln -s ~/.dotfiles/starship/starship.toml ~/.config/starship.toml

# Composer
echo "==> Linking Composer..."
rm ~/.config/composer
ln -s ~/.dotfiles/composer ~/.config/composer

# Git
echo "==> Linking Git..."
rm ~/.gitconfig
rm ~/.gitignore
ln -s ~/.dotfiles/git/config ~/.gitconfig
ln -s ~/.dotfiles/git/ignore ~/.gitignore

# Nano
echo "==> Linking Nano..."
rm ~/.config/nano
ln -s ~/.dotfiles/nano ~/.config/nano

# Btop
echo "==> Linking btop..."
rm ~/.config/btop
ln -s ~/.dotfiles/btop ~/.config/btop

# Neofetch
echo "==> Linking neofetch..."
rm ~/.config/neofetch
ln -s ~/.dotfiles/neofetch ~/.config/neofetch

# Ghostty
echo "==> Linking Ghostty"
rm ~/.config/ghostty
ln -s ~/.dotfiles/ghostty ~/.config/ghostty

# Composer
echo "==> Linking wezterm..."
rm ~/.config/wezterm
ln -s ~/.dotfiles/wezterm ~/.config/wezterm

# NeoVim
echo "==> Linking NeoVim"
rm ~/.config/nvim
ln -s ~/.dotfiles/nvim ~/.config/nvim

# TMUX
echo "==> Linking TMUX"
ln -s ~/.dotfiles/tmux/tmux.conf ~/.config/tmux/tmux.conf

# TMUXinator
echo "==> Linking TMUXinator"
rm ~/.config/tmuxinator
ln -s ~/.dotfiles/tmuxinator ~/.config/tmuxinator

# Code
echo "==> Linking Code"
ln -s /Volumes/Superhero/Code ~/Code

# Install apps
echo "==> Installing apps..."
apps=(
    alt-tab
    charmstone
    dbngin
    dockey
    dropbox
    ghostty
    github
    google-chrome
    google-drive
    herd
    hyperkey
    iina
    jordanbaird-ice
    pika
    raycast
    rocket
    setapp
    skype
    slack
    stats
    viber
    zen-browser
)
brew install "${apps[@]}" --cask

# Windsurf
echo "==> Linking Windsurf"
rm ~/Library/Application\ Support/Windsurf/User/settings.json
rm ~/Library/Application\ Support/Windsurf/User/keybindings.json
rm -rf ~/Library/Application\ Support/Windsurf/User/snippets
ln -s ~/.dotfiles/windsurf/settings.json ~/Library/Application\ Support/Windsurf/User/settings.json
ln -s ~/.dotfiles/windsurf/keybindings.json ~/Library/Application\ Support/Windsurf/User/keybindings.json
ln -s ~/.dotfiles/windsurf/snippets ~/Library/Application\ Support/Windsurf/User/snippets

echo "Done."
