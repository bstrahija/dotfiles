# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Paths
export CPPFLAGS=-I/opt/X11/include

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-extras github git-remote-branch laravel brew textmate osx composer)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$HOME/.rbenv/shims:/Applications/MAMP/bin/php/php5.4.10/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/X11/bin:/opt/local/bin:/usr/local/git/bin:PATH=$HOME/.rbenv/bin:/usr/local/Cellar/ruby/1.9.3-p374:/var/lib/gems/1.8/bin:/usr/local/Cellar/imagemagick/6.8.0-10/bin:/Applications/VirtualBox.app/Contents/MacOS:


# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Zend Framework
alias zf=/usr/local/ZendFramework/bin/zf.sh

# CTags
alias ctags=/usr/local/bin/ctags

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# -------------------------------------------------------------------
# Global
# -------------------------------------------------------------------
alias ls='ls -laGh'
alias 'today=calendar -A 0 -f /usr/share/calendar/calendar.mark | sort'
alias 'dus=du -sckx * | sort -nr'
alias 'adventure=emacs -batch -l dunnet'
alias 'mailsize=du -hs ~/Library/mail'
alias 'bk=cd $OLDPWD'
alias 'ttop=top -ocpu -R -F -s 2 -n30'
alias phpmamp='/Applications/MAMP/bin/php/php5.4.10/bin/php'
alias c='clear'
alias la='ls -alh'
alias cdd='cd -'  # back to last directory
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias mkdir='mkdir -pv'
alias h='history'
alias j='jobs -l'
alias path='echo -e ${PATH//:/\\n}'
alias nowdate='date +"%d-%m-%Y"'
alias df='df -H'
alias du='du -ch'
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'


# Quick way to rebuild the Launch Services database and get rid
# of duplicates in the Open With submenu.
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'

# -------------------------------------------------------------------
# Git
# -------------------------------------------------------------------
alias ga='git add'
alias gp='git push'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m'
alias gma='git commit -am'
alias gacm='git acm'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
alias gta='git tag -a -m'
alias gf='git reflog'
alias git='hub'

# -------------------------------------------------------------------
# CodeIgniter
# -------------------------------------------------------------------
alias getci='git clone -b 2.1-stable git://github.com/EllisLab/CodeIgniter.git'
alias getsparks='php -r "$(curl -fsSL http://getsparks.org/go-sparks)"'
alias spark='php tools/spark'
alias cisetup='rm -Rf .git; rm .gitignore; rm license.txt; rm -Rf user_guide; mv system application;'


# -------------------------------------------------------------------
# Laravel
# -------------------------------------------------------------------
# alias laravel="git clone -o laravel https://github.com/laravel/laravel.git"
alias laravel="composer create-project laravel/laravel"
alias artisan='php artisan'
alias art='php artisan'
alias bob='php artisan bob::build'
alias migrate="php artisan migrate"
alias serve="php artisan serve"
alias dump="php artisan dump"
alias t="phpunit"

# Generators Package
alias g:c="php artisan generate:controller"
alias g:m="php artisan generate:model"
alias g:v="php artisan generate:view"
alias g:mig="php artisan generate:migration"
alias g:t="php artisan generate:test"
alias g:r="php artisan generate:resource"
alias g:s="php artisan generate:scaffold"
alias g:f="php artisan generate:form"


# -------------------------------------------------------------------
# Composer
# -------------------------------------------------------------------
alias cmpi='composer install'
alias cmpu='composer update'
alias cmpd='composer dump-autoload --optimize'
