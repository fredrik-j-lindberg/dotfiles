export ZSH_DIR="$HOME/git/dotfiles/zsh"

# Load config files
[ -f $ZSH_DIR/prompt.zsh ] && source $ZSH_DIR/prompt.zsh #Should be loaded first (Instaprompt)
[ -f $ZSH_DIR/aliases.zsh ] && source $ZSH_DIR/aliases.zsh
[ -f $ZSH_DIR/node.zsh ] && source $ZSH_DIR/node.zsh
[ -f $ZSH_DIR/oh-my-zsh.zsh ] && source $ZSH_DIR/oh-my-zsh.zsh

path+=($HOME/bin:/usr/local/bin)

######### Begin User Config
### Begin Vim Config
# Enable vim keybinds in terminal
bindkey -v

# Disable the delay between mode changes
KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.######### End User Config
#### End Vim Config
########## End User Config
export PATH