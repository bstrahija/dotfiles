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

# Zellij
echo "==> Linking Zellij"
ln -s ~/.dotfiles/zelliy/config.kdl ~/.config//zelliy/config.kdl

# TMUXinator
echo "==> Linking TMUXinator"
rm ~/.config/tmuxinator
ln -s ~/.dotfiles/tmuxinator ~/.config/tmuxinator

# Code
echo "==> Linking Code"
ln -s /Volumes/Superhero/Code ~/Code

# Install packages
echo "==> Installing apps..."
packages=(
    bat # Better cat
    btop # Better top
    dust # Better du
    eza # Better ls
    fastfetch
    fzf # Fuzzy finder
    git
    lnav # Log file viewer
    nvim # Neovim
    prettyping # Better ping
    zellij # Terminal multiplexer\
    zoxide # Smart directory navigation
)
brew install "${apps[@]}"

# Install apps
echo "==> Installing apps..."
apps=(
    alt-tab
    coconutbattery
    dbngin
    dockey
    dropbox
    ghostty
    github
    google-chrome
    google-drive
    herd
    iina
    jordanbaird-ice
    pika # Color picker
    raycast
    reamp # Winamp cl
    reflex-app # forward play key to Spotify
    rocket # Emojis
    setapp
    skype
    slack
    stats
    steam
    viber
    visual-studio-code
    zen-browser
)
brew install "${apps[@]}" --cask

echo "Done."
