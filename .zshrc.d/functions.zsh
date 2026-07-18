appid () {
  mdls $1 | grep 'kMDItemCFBundleIdentifier'
}

bkp () {
  cp $1 $1.bkp
}

bupgrade () {
  # prevents brew upgrade exiting if you want to ignore a pinned formula
  HOMEBREW_NO_ASK=1 brew upgrade --formula --quiet
  unset HOMEBREW_NO_ASK
  brew cu --no-brew-update --all --yes --quiet
}

# Only works on casks
bupgradeforce () {
  for cask in "$@"; do
    brew cu unpin "$cask" || continue
    brew cu --no-brew-update --all --force --yes --quiet "$cask"
    brew cu pin "$cask"
  done
}

tm () {
  tmux has-session -t $1 2>/dev/null

  if [ "$?" -eq 0 ]; then
    tmux attach -t $1
  else
    tmux new -s $1
  fi
}

cmux () {
  tmux has-session -t cmus 2>/dev/null

  if [ "$?" -eq 0 ]; then
    tmux attach -t cmus
  else
    tmux new -s cmus /opt/homebrew/bin/cmus
  fi
}

sp () {
  tmux has-session -t ncspot 2>/dev/null

  if [ "$?" -eq 0 ]; then
    tmux attach -t ncspot
  else
    tmux new -s ncspot /opt/homebrew/bin/ncspot
  fi
}

hl () {
  ${@:2} | bat --paging=never -l $1
}

setDarkAppearance () {
  defaults write $1 NSRequiresAquaSystemAppearance $2
  echo "set dark appearance for $1 to $2"
}

wta () {
  if [ -z "$1" ]; then
      echo "Usage: wta <branch-name>"
      return 1
  fi

  local new_worktree_dir="$(basename "$PWD")-${1//\//-}"
  git worktree add ../$new_worktree_dir $1
}

wtab () {
  if [ -z "$1" ]; then
      echo "Usage: wta <branch-name>"
      return 1
  fi

  local new_worktree_dir="$(basename "$PWD")-${1//\//-}"
  git worktree add -b $1 ../$new_worktree_dir
}
