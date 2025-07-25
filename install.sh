## Link up dotfiles
brew install stow
stow .

echo "Installing .dotfiles"
echo "---"

# Install PHP
echo "==> Installing PHP.new (PHP, Laravel, Composer)..."
/bin/bash -c "$(curl -fsSL https://php.new/install/mac)"

# Install Homebrew packages
echo "==> Installing homebrew packages..."
packages=(
    bat # Better cat
    btop # Better top
    dust # Better du
    eza # Better ls
    fastfetch
    flashspace # Spaces replacement
    fzf # Fuzzy finder
    git
    jq # JSON processor
    lnav # Log file viewer
    nano
    nanorc
    nvim # Neovim
    nvm
    prettyping # Better ping
    starship
    stripe/stripe-cli/stripe # Stripe CLI
    trash
    xh # CURL alternative
    zellij # Terminal multiplexer
    zoxide # Smart directory navigation
)
brew install "${apps[@]}"

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

# Install apps
echo "==> Installing apps..."
apps=(
    alt-tab
    coconutbattery
    dbngin # Database management
    dockey
    dropbox
    eqmac
    ghostty
    gimp
    github
    google-chrome
    google-drive
    handbrake-app # Video transcoder
    herd # Laravel development
    iina # Media player
    jordanbaird-ice
    linear-linear
    notion # Note-taking app
    obsidian # Note-taking app
    pearcleaner
    pika # Color picker
    postman # API development
    raycast
    reamp # Winamp cl
    reaper # Digital audio workstation
    reflex-app # forward play key to Spotify
    rocket # Emojis
    setapp
    signal # Secure messaging
    slack
    speedtest-cli
    stats
    steam
    stremio
    sublime-text
    transmission
    viber
    virtualbox
    visual-studio-code
    zen-browser
    zoom
)
brew install "${apps[@]}" --cask

echo "Done."
