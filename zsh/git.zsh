# Enable git automcompletion
# https://www.oliverspryn.com/blog/adding-git-completion-to-zsh
zstyle ':completion:*:*:git:*' script $ZSH_DIR/scripts/git-completion.bash
fpath=($ZSH_DIR $fpath)

autoload -Uz compinit && compinit
# --------------------------------------------------------------