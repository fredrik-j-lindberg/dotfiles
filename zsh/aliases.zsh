########## Begin Aliases
alias vim="nvim"
alias ezsh="nvim $ZSH_DIR/.zshrc"
alias ealias="nvim $ZSH_DIR/aliases.zsh"
alias evim="nvim ~/.config/nvim/init.vim"
alias etig="nvim ~/.tigrc"
alias fzfvim='nvim $(fzf)'
alias fzfvimhidden='nvim $(find . | fzf)'
########## End Aliases

########## Begin Custom Functions
function openGitRepo() {
  local syntax="openGitRepo <originRemote>"
  local originRemote=$1
  if [ -z "$1" ]; then
    echo "Missing origin remote. Syntax: \n$syntax"
    return
  fi

  local baseUrl=$(echo $originRemote | cut -d ":" -f 1 | cut -d "@" -f 2)
  local repo=$(echo $originRemote | cut -d ":" -f 2 | cut -d "." -f 1)
  local link="https://$baseUrl/$repo"
  if [[ -n $2 ]]; then
    link="$link/$2"
  fi
  open $link
}

function gh() {
  local remoteUrl
  if [[ $1 == "." ]]; then
    remoteUrl=$(git config --get remote.origin.url)
  else
    local dir=$(find $HOME/git -type d -exec test -e '{}/.git' ';' -print -prune | fzf)
    remoteUrl=$(git config --file $dir/.git/config --get remote.origin.url)
  fi
  if [[ -z "$remoteUrl" ]]; then
    echo "Could not find remote url at this location. Make sure it is a git repo!"
  else
    openGitRepo $remoteUrl $2
  fi
}

function ghc(){
  gh $1 commit/$2
}
function ghb(){
  gh $1 tree/$2
}

########## End Custom Functions
