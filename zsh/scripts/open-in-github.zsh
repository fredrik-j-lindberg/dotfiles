function openGitRepo() {
  local syntax="openGitRepo <remoteUrl>"
  local remoteUrl=$1
  if [ -z "$1" ]; then
    echo "Missing origin remote. Syntax: \n$syntax"
    return
  fi

  local baseUrl=$(echo $remoteUrl | cut -d ":" -f 1 | cut -d "@" -f 2)
  local repo=$(echo $remoteUrl | cut -d ":" -f 2 | cut -d "." -f 1)
  local link="https://$baseUrl/$repo"
  if [[ -n $2 ]]; then
    link="$link/$2"
  fi
  open $link
}

function gh() {
  local remoteUrl
  local remoteName="origin"
  if [[ -n $2 ]]; then
    remoteName=$2
  fi
  if [[ $1 == "." ]]; then
    remoteUrl=$(git config --get remote.$remoteName.url)
  else
    local dir=$(find $HOME/git -type d -exec test -e '{}/.git' ';' -print -prune | fzf)
    remoteUrl=$(git config --file $dir/.git/config --get remote.$remoteName.url)
  fi
  if [[ -z "$remoteUrl" ]]; then
    echo "Could not find remote url at this location. Make sure it is a git repo!"
  else
    openGitRepo $remoteUrl $3
  fi
}

function ghc(){
  gh $1 $2 commit/$3
}
function ghb(){
  gh $1 $2 tree/$3
}
