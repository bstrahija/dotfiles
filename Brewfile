#############################################################
# ~/.Brewfile - Software Installs for MacOS                 #
#                                                           #
# List of packages to be installed / updated via Homebrew   #
# Usage, run: $ brew bundle --global --file $HOME/.Brewfile #
#############################################################

# Options
cask_args appdir: '/Applications', require_sha: true

# Taps
tap 'homebrew/services'
tap 'browsh-org/homebrew-browsh'
tap 'jesseduffield/lazygit'

#############################################################
# Command Line                                              #
#############################################################

# CLI
brew 'git'   # Version control
brew 'jj'    # Version control
brew 'nvim'  # Text editor
brew 'tmux'  # Term multiplexer

# CLI Basics
brew 'atuin'                   # Shell history with search and more
brew 'bat'                     # Output highlighting (better cat)
brew 'btop'                    # Resource monitor (better top)
brew 'duf'                     # Get info on mounted disks (better df)
brew 'dust'                    # Disk usage with a nicer UI (better du)
brew 'eza'                     # Listing files with info (better ls)
brew 'exiftool'                # Read, write and modify exif data
brew 'fzf'                     # Fuzzy file finder and filtering
brew 'jdupes'                  # Duplicate file finder
brew 'jq'                      # JSON parser, output and query files
brew 'lnav'                    # Log file viewer
brew 'mailpit'                 # Local SMTP server with web interface
brew 'most'                    # Multi-window scroll pager (better less)
brew 'nano'                    # Simple text editor
brew 'nanorc'                  # Syntax highlighting for nano
brew 'prettyping'              # Pretty ping (better ping)
brew 'ripgrep'                 # Searching within files (better grep)
brew 'rsync'                   # Fast incremental file transfer
brew 'sd'                      # RegEx find and replace (better sed)
brew 'speedtest-cli'           # Speedtest from the CLI
brew 'starship'                # Cross-shell prompt
brew 'stow'                    # Manage dotfiles
brew 'thefuck'                 # Auto-correct miss-typed commands
brew 'tmuxinator'              # Manage complex tmux sessions
brew 'tpm'                     # Tmux plugin manager
brew 'tldr'                    # Community-maintained docs (better man)
brew 'xh'                      # Friendly curl (better curl)
brew 'yarn'                    # Node package manager (better npm)
brew 'zellij'                  # Terminal workspace (better tmux)
brew 'zsh-syntax-highlighting' # ZSH syntax highlighting
brew 'zsh-autosuggestions'     # ZSH command suggestions
brew 'zsh-completions'         # ZSH completions
brew 'zoxide'                  # Auto-learning navigation (better cd)

# CLI Productivity Apps
brew 'browsh'       # Web browser, in terminal
brew 'mutt'         # Email client

# CLI Dev tools
brew 'gh'                        # GitHub CLI
brew 'httpie'                    # HTTP / API testing testing client
brew 'lazygit'                   # Full Git management app
brew 'mysql-client'              # MySQL command line tools
cask 'ngrok'                     # Reverse proxy for sharing localhost
brew 'node'                      # JavaScript runtime
brew 'nvm'                       # Node version manager
brew 'php-cs-fixer'              # PHP coding standards fixer
brew 'stripe/stripe-cli/stripe'  # Stripe CLI
brew 'wp-cli'                    # WordPress command line tools

# CLI Misc
brew 'cowsay'       # Have an ASCII cow say your message
brew 'figlet'       # Output text as big ASCII art text
brew 'lolcat'       # Make console output rainbow colored
brew 'fastfetch'    # Show system data and distribution info
brew 'pipes-sh'     # Cool terminal pipe screen saver

#############################################################
# Desktop Applications                                      #
#############################################################

# Creativity
cask 'audacity'     # Audio editor / recorder
cask 'gimp'         # Photo editor
brew 'handbrake'    # Video transcoder
cask 'imageoptim'   # Image compression
cask 'inkscape'     # Vector editor
cask 'reaper'       # Audio production

# Development
cask 'dbngin'              # Database management
cask 'ghostty'             # Terminal
cask 'github'              # GitHub desktop client
cask 'herd'                # Local PHP and Laravel development environment
cask 'linear-linear'       # Project management
cask 'notion'              # Note taking and project management
cask 'obsidian'            # Note taking and knowledge base
cask 'postman'             # API development
cask 'sublime-text'        # Text editor
cask 'virtualbox'          # Virtualization
cask 'visual-studio-code'  # Code editor
cask 'zed'                 # Code editor

# Media
cask 'eqmac'                                 # System-wide equalizer
cask 'handbrake-app'                         # Video transcoder
cask 'iina'                                  # Modern media player
brew 'pandoc'                                # Universal file converter
cask 'reamp'                                 # Audio player
cask 'reflex-app'                            # Forward play key to Spotify
cask 'spotify', args: { require_sha: false } # Music streaming
cask 'stremio'                               # Video streaming
cask 'transmission'                          # Torrent client
cask 'vlc'                                   # Media player

# Comms
cask 'signal'  # Secure messaging
cask 'slack'   # Team communication
cask 'viber'   # Messaging and calls
cask 'zoom'    # Video conferencing

# Other
cask 'alt-tab'                                      # App switcher
cask 'coconutbattery'                               # Battery health monitor
cask 'dockey'                                       # Manage mac dock
cask 'firefox'                                      # Web browser
cask 'flashspace'                                   # Better workspaces
cask 'google-chrome', args: { require_sha: false }  # Web browser
cask 'google-drive'                                 # Cloud storage
cask 'jordanbaird-ice'                              # Clean menu bar
cask 'localsend'                                    # Local file sharing
cask 'karabiner-elements'                           # Keyboard remap
cask 'pearcleaner'                                  # Uninstall apps
cask 'raycast'                                      # Productivity launcher
cask 'setapp'                                       # Paid apps subscription
cask 'stats'                                        # System monitor
cask 'zen'                                          # Web browser

# AI
cask 'ollama-app'    # Local LLMs


#############################################################
# MacOS-Specific Stuff                                      #
#############################################################

# Fonts
cask 'font-hack'
cask 'font-caskaydia-cove-nerd-font'
cask 'font-caskaydia-mono-nerd-font'
cask 'font-fira-code-nerd-font'
cask 'font-jetbrains-mono-nerd-font'
cask 'font-meslo-lg-nerd-font'
cask 'font-monaspace-nerd-font'
cask 'font-roboto-mono-nerd-font'
cask 'font-ubuntu-mono-nerd-font'

# Mac OS Quick-Look Plugins
cask 'qlcolorcode'    # QL for code with highlighting
cask 'qlmarkdown'     # QL for markdown files
cask 'qlprettypatch'  # QL for patch / diff files
cask 'qlvideo'        # QL for video formats
cask 'quicklook-csv'  # QL for tables in CSV format
cask 'quicklook-json', args: { require_sha: false } # QL for JSON, with trees
cask 'webpquicklook',  args: { require_sha: false } # QL for WebP image files
