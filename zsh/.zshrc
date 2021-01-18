export ZSH_DIR="$HOME/git/dotfiles/zsh"

# Load config files
[ -f $ZSH_DIR/prompt.zsh ] && source $ZSH_DIR/prompt.zsh #Should be loaded first (Instaprompt)
[ -f $ZSH_DIR/aliases.zsh ] && source $ZSH_DIR/aliases.zsh
[ -f $ZSH_DIR/node.zsh ] && source $ZSH_DIR/node.zsh
[ -f $ZSH_DIR/oh-my-zsh.zsh ] && source $ZSH_DIR/oh-my-zsh.zsh
[ -f $ZSH_DIR/vim.zsh ] && source $ZSH_DIR/vim.zsh
[ -f $ZSH_DIR/company-specific.zsh ] && source $ZSH_DIR/company-specific.zsh

# Load script functions
[ -f $ZSH_DIR/scripts/open-in-github.zsh ] && source $ZSH_DIR/scripts/open-in-github.zsh

path+=($HOME/bin:/usr/local/bin)
export PATH