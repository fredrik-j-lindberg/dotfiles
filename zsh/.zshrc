export DOTFILES_DIR="$HOME/git/personal/dotfiles"
export ZSH_DIR="$DOTFILES_DIR/zsh"
export HISTFILE=$ZSH_DIR/.zsh_history

# Make brew command available on path
path+=(/opt/homebrew/bin)
# Make most commands available on path
path+=($HOME/bin:/usr/local/bin)
export PATH

# Load config files
[ -f $ZSH_DIR/prompt.zsh ] && source $ZSH_DIR/prompt.zsh #Should be loaded first (Instaprompt)
[ -f $ZSH_DIR/aliases.zsh ] && source $ZSH_DIR/aliases.zsh
[ -f $ZSH_DIR/node.zsh ] && source $ZSH_DIR/node.zsh
[ -f $ZSH_DIR/oh-my-zsh.zsh ] && source $ZSH_DIR/oh-my-zsh.zsh
[ -f $ZSH_DIR/vim.zsh ] && source $ZSH_DIR/vim.zsh
[ -f $ZSH_DIR/company-specific.zsh ] && source $ZSH_DIR/company-specific.zsh

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# Set up smart cd with zoxide
eval "$(zoxide init --cmd cd zsh)"

# Set up zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Load script functions
# [ -f $ZSH_DIR/scripts/open-in-github.zsh ] && source $ZSH_DIR/scripts/open-in-github.zsh # Disable when using githubs cli tool
