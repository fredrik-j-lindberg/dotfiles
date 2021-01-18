function usage() {
  echo "USAGE: gh [.] [-r <remote name>] [-c <commit hash>] [-b <branch name>]"
  return
}

function gh() {
  local useCurrentDir=false
  if [[ $1 == "." ]]; then
    useCurrentDir=true
    shift 1
  fi

  TEMP=$(getopt rcbh $@)
  if [ $? != 0 ]; then
    usage
    return
  fi

  local remoteName="origin"
  local commit
  local branch
  local rest
  for i; do
    case "$i" in
    -r)
      remoteName=$2
      shift 2
      ;;

    -c)
      commit=$2
      shift 2
      ;;

    -b)
      branch=$2
      shift 2
      ;;

    -h)
      usage() return
      ;;

    --)
      shift
      break
      ;;
    esac
  done

  local remoteUrl=$(getRemoteUrl $useCurrentDir)
  if [[ -z "$remoteUrl" ]]; then
    echo "Could not find remote url at this location for remote '$remoteName'. Make sure it is a git repo!"
    return
  fi

  if [[ -n $commit ]]; then
    openGitRepo $remoteUrl commit/$commit
  elif [[ -n $branch ]]; then
    openGitRepo $remoteUrl tree/$branch
  else
    openGitRepo $remoteUrl
  fi
}

function getRemoteUrl() {
  local useCurrentDir=$1
  local remoteUrl
  if [[ $useCurrentDir == true ]]; then
    remoteUrl=$(git config --get remote.$remoteName.url)
  else
    local dir=$(find $HOME/git -type d -exec test -e '{}/.git' ';' -print -prune | fzf)
    remoteUrl=$(git config --file $dir/.git/config --get remote.$remoteName.url)
  fi
  echo $remoteUrl
}

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
