echo "======================================================================="
echo "==> Start setting up my dotfiles..."
echo "======================================================================="

# Create a variable that stores the current volume name
VOLUME_NAME="Superhero"

# Create a variable for the current directory absolute path
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOME_DIR="$(cd ~ && pwd)"
CODE_DIR="/Volumes/$VOLUME_NAME/Code"

## Install Homebrew
if ! command -v brew &> /dev/null; then
    echo "======================================================================="
    echo "==> Installing Homebrew..."
    echo "======================================================================="
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
brew update && brew upgrade
echo "--- Done. ---" && echo ""

# Install PHP
echo "======================================================================="
echo "==> Installing PHP.new (PHP, Laravel, Composer)..."
echo "======================================================================="
/bin/bash -c "$(curl -fsSL https://php.new/install/mac)"
echo "--- Done. ---" && echo ""

# Install Homebrew packages
echo "======================================================================="
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
    jq # JSON processor
    lnav # Log file viewer
    mailpit # Local email testing
    nano
    nanorc
    nvim # Neovim
    nvm
    prettyping # Better ping
    speedtest-cli
    starship
    stripe/stripe-cli/stripe # Stripe CLI
    trash
    xh # CURL alternative
    zellij # Terminal multiplexer
    zoxide # Smart directory navigation
)
brew install "${packages[@]}"
echo "--- Done. ---" && echo ""

# Git
echo "======================================================================="
echo "==> Linking Git..."
echo "======================================================================="
rm ~/.gitconfig
rm ~/.gitignore
ln -s "$DOTFILES_DIR/git/.gitconfig" ~/.gitconfig
ln -s "$DOTFILES_DIR/git/.gitignore" ~/.gitignore
echo "--- Done. ---" && echo ""

# ZSH
echo "======================================================================="
echo "==> Linking ZSH..."
echo "======================================================================="
rm ~/.zshrc
ln -s "$DOTFILES_DIR/zshrc/.zshrc" ~/.zshrc
echo "--- Done. ---" && echo ""

## Link up dotfiles
echo "======================================================================="
echo "==> Linking up dotfiles with stow..."
echo "======================================================================="
brew install stow
stow .
echo "--- Done. ---" && echo ""

# Code
echo "======================================================================="
echo "==> Linking Code"
echo "======================================================================="
rm ~/Code
ln -s "$CODE_DIR" ~/Code
echo "--- Done. ---" && echo ""

## Link up editor config
echo "======================================================================="
echo "==> Linking up editor config..."
echo "======================================================================="
rm -rf "~/Library/Application Support/Cursor/User"
ln -s "$DOTFILES_DIR/cursor" "$HOME_DIR/Library/Application Support/Cursor/User"
echo "--- From --- $DOTFILES_DIR/cursor"
echo "--- To --- $HOME_DIR/Library/Application Support/Cursor/User"
echo "--- Done. ---" && echo ""

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
echo "--- Done. ---" && echo ""

echo "======================================================================="
echo "==> Done!"
echo "======================================================================="
