# Homebrew (hardcoded to skip a `brew --prefix` subprocess on every shell start)
export HOMEBREW_PREFIX="/opt/homebrew"

# If you come from bash you might have to change your $PATH.
export PATH="/opt/homebrew/bin:$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"

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

# Java
export JAVA_HOME=$(/usr/libexec/java_home -v 25)

# ZSH plugins
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# Vi mode
source ~/.config/zsh/vi.zsh

# Aliases
eval "$(atuin init zsh)"

# thefuck is slow to init (Python startup), so load it lazily on first use
fuck() {
  unfunction fuck
  eval "$(thefuck --alias)"
  fuck "$@"
}

# Homebrew sbin
export PATH="/opt/homebrew/sbin:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

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

# =========================================================
# Fuzzy finder
# =========================================================

# macOS / Homebrew (Apple Silicon)
if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi

# fzf configuration
source ~/.config/zsh/fzf.zsh

# bun completions
[ -s "/Users/boris/.bun/_bun" ] && source "/Users/boris/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# PHPDevTools
[ -f ~/phpdevtools/licence.txt ] && export DEVSENSE_PHP_LS_LICENSE="$(< ~/phpdevtools/licence.txt)"

# Herd injected PHP binary.
export PATH="/Users/boris/Library/Application Support/Herd/bin/:/Users/boris/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/Users/boris/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

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

# opencode
export PATH="$HOME/.opencode/bin:$PATH"

# Worktrunk
if command -v wt >/dev/null 2>&1; then eval "$(command wt config shell init zsh)"; fi
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/boris/.docker/completions $fpath)
autoload -Uz compinit
(( ${+_comps[docker]} )) || compinit
# End of Docker CLI completions


### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/boris/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)


export DOCKER_HOST=unix://$HOME/.rd/docker.sock
export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE=/var/run/docker.sock
# export TESTCONTAINERS_HOST_OVERRIDE=$(rdctl shell ip a show vznat | awk '/inet / {sub("/.*",""); print $2}')

# efd completion
# eval "$(_EFD_COMPLETE=zsh_source efd)"

# Add JBang to environment
alias j!=jbang
export PATH="$HOME/.jbang/bin:$PATH"
