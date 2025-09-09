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

# Install Homebrew packages

echo "==> Installing homebrew packages..."
echo "======================================================================="
packages=(
    bat # Better cat
    btop # Better top
    dust # Better du
    eza # Better ls
    fastfetch
    flashspace # Spaces replacement
    fzf # Fuzzy finder
    git
    helix # Helix editor
    jq # JSON processor
    lnav # Log file viewer
    mailpit # Local email testing
    mysql-client
    nano
    nanorc
    nvim # Neovim
    nvm
    php-cs-fixer
    prettyping # Better ping
    ripgrep
    speedtest-cli
    starship
    stow
    stripe/stripe-cli/stripe # Stripe CLI
    thefuck
    tmux
    tmuxinator
    tpm
    tldr
    trash
    wp-cli
    xh # CURL alternative
    yarn
    zellij # Terminal multiplexer
    zoxide # Smart directory navigation
    zsh-syntax-highlighting # ZSH syntax highlighting
    zsh-autosuggestions # ZSH command suggestions
    zsh-completions # ZSH completions
)
brew install "${packages[@]}"
echo "--- Done installing Homebrew packages. ---" && echo ""

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
ECHO "======================================================================="
ECHO "==> tMUX pLUGINS"
ECHO "======================================================================="
IF [ ! -D ~/.TMUX/PLUGINS/TPM ]; THEN
    GIT CLONE HTTPS://GITHUB.COM/TMUX-PLUGINS/TPM ~/.TMUX/PLUGINS/TPM
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

# Install fonts
echo "======================================================================="
echo "==> Installing fonts..."
echo "======================================================================="
apps=(
    font-caskaydia-cove-nerd-font
    font-caskaydia-mono-nerd-font
    font-fira-code-nerd-font
    font-jetbrains-mono-nerd-font
    font-meslo-lg-nerd-font
    font-monaspace-nerd-font
    font-roboto-mono-nerd-font
    font-ubuntu-mono-nerd-font
)
brew install "${apps[@]}" --cask
echo "--- Done installing fonts. ---" && echo ""

# Install apps
echo "======================================================================="
echo "==> Installing apps..."
echo "======================================================================="
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
    imageoptim # Image optimization
    jordanbaird-ice
    karabiner-elements
    linear-linear
    notion # Note-taking app
    mechvibes # Keyboard sound effects
    obsidian # Note-taking app
    ollama-app # Local AI model hosting
    pearcleaner
    postman # API development
    raycast
    reamp # Winamp cl
    reaper # Digital audio workstation
    reflex-app # forward play key to Spotify
    rocket # Emojis
    sesh # Tmux sessions
    setapp
    signal # Secure messaging
    slack
    stats
    steam
    stremio
    sublime-text
    transmission
    viber
    virtualbox
    visual-studio-code
    yq
    zed
    zen-browser
    zoom
)
brew install "${apps[@]}" --cask
echo "--- Done installing apps. ---" && echo ""

echo "======================================================================="
echo "==> Done!"
echo "======================================================================="
