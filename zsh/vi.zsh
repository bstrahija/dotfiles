bindkey -v
export KEYTIMEOUT=1

# Press v in normal mode to open the current command in $EDITOR
export EDITOR='nvim'
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

export VI_MODE_SET_CURSOR=true

function zle-keymap-select {
  if [[ $KEYMAP == vicmd ]]; then
	echo -ne '\e[1 q'  # block cursor
  else
	echo -ne '\e[5 q'  # beam cursor
  fi
}
zle -N zle-keymap-select

function zle-line-init() {
  zle -K viins
  echo -ne '\e[5 q'  # beam cursor
}
zle -N zle-line-init

# Yank to system clipboard
function vi-yank-clipboard() {
  zle vi-yank
  echo "$CUTBUFFER" | pbcopy -i
}
zle -N vi-yank-clipboard
bindkey -M vicmd y vi-yank-clipboard
