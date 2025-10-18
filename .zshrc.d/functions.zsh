appid () {
  mdls $1 | grep 'kMDItemCFBundleIdentifier'
}

bkp () {
  cp $1 $1.bkp
}

bupgradepin () {
  bcu unpin $1 && brew cu --no-brew-update --all --quiet --force --yes $1 && bcu pin $1
}

tx () {
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
