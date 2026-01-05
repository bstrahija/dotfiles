# Homebrew
export HOMEBREW_PREFIX=$(brew --prefix)

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# MySQL
export PATH="$HOMEBREW_PREFIX/opt/mysql-client/bin:$PATH"

# Laravel
export PATH="$HOME/.config/composer/vendor/laravel/pint/builds:$PATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias zshconfig="code ~/.zshrc"

# Add my aliases
source ~/.config/zsh/aliases.zh

# zoxide (better cd)
eval "$(zoxide init zsh)"

# yazi file manager
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# WordPress
source ~/.config/wordpress/wordpress.zsh

# ZSH plugins
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# Vi mode
source ~/.config/zsh /vi.zsh

# Aliases
eval "$(atuin init zsh)"
eval $(thefuck --alias)

# OpenCode
export PATH=/Users/boris/.opencode/bin:$PATH
export PATH="/opt/homebrew/sbin:$PATH"

# Herd injected NVM configuration
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

[[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"

# This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# FZF
export FZF_DEFAULT_OPTS="
  --preview 'if [[ -d {} ]]; then
                eza --tree --color=always --level=2 {};
              else
                bat --style=numbers --color=always {} 2>/dev/null ||
                cat {} 2>/dev/null;
              fi'
  --preview-window=right:60%
"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# bun completions
[ -s "/Users/boris/.bun/_bun" ] && source "/Users/boris/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/Users/boris/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/Users/boris/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

# Herd injected PHP binary.
export PATH="/Users/boris/Library/Application Support/Herd/bin/":$PATH

# Herd injected PHP 8.5 configuration.
export HERD_PHP_85_INI_SCAN_DIR="/Users/boris/Library/Application Support/Herd/config/php/85/"

# Herd injected PHP 8.4 configuration.
export HERD_PHP_84_INI_SCAN_DIR="/Users/boris/Library/Application Support/Herd/config/php/84/"

# Herd injected PHP 8.3 configuration.
export HERD_PHP_83_INI_SCAN_DIR="/Users/boris/Library/Application Support/Herd/config/php/83/"

# Herd injected PHP 8.2 configuration.
export HERD_PHP_82_INI_SCAN_DIR="/Users/boris/Library/Application Support/Herd/config/php/82/"

# Herd injected PHP 8.1 configuration.
export HERD_PHP_81_INI_SCAN_DIR="/Users/boris/Library/Application Support/Herd/config/php/81/"

# Herd injected PHP 8.0 configuration.
export HERD_PHP_80_INI_SCAN_DIR="/Users/boris/Library/Application Support/Herd/config/php/80/"

# Herd injected PHP 7.4 configuration.
export HERD_PHP_74_INI_SCAN_DIR="/Users/boris/Library/Application Support/Herd/config/php/74/"
