# shell
alias rc='${EDITOR} ~/.zshrc'
alias rcd='${EDITOR} ~/.zshrc.d/'
alias rr='exec $SHELL'
alias ohmyzsh='${EDITOR} ~/.oh-my-zsh'

# destructive
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias t='trash'

# navigation
alias cat='bat'
alias cl='clear'
alias f='fd -Hip' # find with fd showing hidden files, ignoring case and displaying the full path
alias l='lk'
alias li='lk --icons'
alias ls='eza'
alias la='ls -a'
alias ll='ls -l --time-style=long-iso'
alias lla='ll -a'
alias pd='pushd'
alias qd='popd'
alias q='exit'

# asdf
alias asdfrc='${EDITOR} ~/.asdfrc'

# brew
alias b='brew'
alias bcu='brew cu --all'
alias bcpin='brew cu pin'
alias bcunpin='brew cu unpin'
alias bpinned='brew list --pinned && brew cu pinned'
alias bupdate='brew update && brew outdated --formula && brew outdated --cask --greedy-auto-updates'
alias bu='bupdate'
alias bupgradefonts='brew list --cask | grep font- | xargs brew upgrade --fetch-HEAD --greedy'
alias bupgrade='brew upgrade --formula && brew cu --no-brew-update --all --yes --quiet'
alias bup='bupgrade'
alias bclean='brew cleanup && brew autoremove'
alias bcl='bclean'
alias bbackup-delete='trash ~/.brew/*'
alias bbackup-taps='brew bundle dump --taps --file ~/.brew/taps'
alias bbackup-brews='brew bundle dump --brews --file ~/.brew/brews'
alias bbackup-casks='brew bundle dump --casks --file ~/.brew/casks'
alias bbackup-casks-pinned='brew cu pinned --no-brew-update --export ~/.brew/casks-pinned'
alias bbackup-mas='brew bundle dump --mas --file ~/.brew/mas'
alias bbackup-vscode='brew bundle dump --vscode --file ~/.brew/vscode'
alias bbackup="bbackup-delete && bbackup-taps && bbackup-brews && bbackup-casks && bbackup-casks-pinned && bbackup-mas && bbackup-vscode && echo 'homebrew backed up to ~/.brew'"
alias brestore-taps='brew bundle --file ~/.brew/taps'
alias brestore-brews='brew bundle --file ~/.brew/brews'
alias brestore-casks='brew bundle --file ~/.brew/casks'
alias brestore-casks-pinned='brew cu pinned --no-brew-update --load ~/.brew/casks-pinned'
alias brestore-mas='brew bundle --file ~/.brew/mas'
alias brestore-vscode='brew bundle --file ~/.brew/vscode'
alias brestore="brestore-taps && brestore-brews && brestore-casks && brestore-casks-pinned && brestore-mas && brestore-vscode && echo 'homebrew restored from ~/.brew'"

# cmus
alias cmus-control='brew services restart cmus-control'
alias cmus-status='cmus-remote -Q'
alias cmus-play='cmus-remote -p'
alias cmus-pause='cmus-remote -u'

# dotfiles backup
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias config-install='chmod 755 ~/bin/dotfiles-install.sh && dotfiles-install.sh'
alias config-backup='bbackup && pnpm-export && pipx-export && flirc-backup && nc-export'
alias config-lg='lg -g .dotfiles -w $HOME'

# fedora
alias ost='rpm-ostree'
alias tb='toolbox'

# flirc
alias flirc='/Applications/Flirc.app/Contents/Resources/flirc_util'
alias flirc-export='/Applications/Flirc.app/Contents/Resources/flirc_util saveconfig ~/skip/flirc-usb'
alias flirc-import='/Applications/Flirc.app/Contents/Resources/flirc_util loadconfig ~/skip/flirc-usb'
alias flirc-settings='/Applications/Flirc.app/Contents/Resources/flirc_util settings > ~/skip/flirc-usb-settings.txt'
alias flirc-backup="flirc-export && flirc-settings && echo 'flirc usb backed up to ~/skip'"

# folders
alias appsupport='cd ~/Library/Application\ Support'
alias cloudstorage='cd ~/Library/CloudStorage/'
alias desk='cd ~/Desktop'
alias dev='cd ~/dev'
alias docs='cd ~/Documents'
alias down='cd ~/Downloads'
alias prj='cd ~/projects'
alias sides='cd ~/sides'
alias work='cd ~/work'

# git
alias g='git'
alias ga='git add'
alias gaa='git add -all'
alias gb='git branch'
alias gc='git commit'
alias gc!='git commit -v --amend'
alias gcl='git clean -i'
alias gcm='git checkout $(git_main_branch)'
alias gcd='git checkout $(git_develop_branch)'
alias gch='git checkout'
alias gd='git diff --patch-with-stat'
alias gdc='git diff --patch-with-stat --cached'
alias gds='git diff --patch-with-stat --staged'
alias gf='git fetch'
alias gfa='git fetch --all'
alias gfo='git fetch origin'
alias gfu='git fetch upstream'
alias gl='git pull'
alias glo='git pull origin'
alias glu='git pull upstream'
alias gp='git push'
alias gpo='git push origin'
alias gpo-u='git push --set-upstream origin'
alias gpu='git push upstream'
alias gpu-u='git push --set-upstream upstream'
alias gr='git remote'
alias grv='git remote -v'
alias gra='git remote add'
alias grru='git remote rename origin upstream'
alias gs='git switch'
alias gsb='git status -sb'
alias gt='git log --pretty=reference --date=iso'
alias gT='git log --pretty=fuller --date=iso'
alias lg='lazygit'
alias gitdiff='git diff --name-only | uniq | xargs code'
alias ghrepo='gh repo set-default'
alias gremotesprune='git remote | grep -vE "^(origin|upstream)$" | xargs -I {} git remote remove {} && git tag -l | xargs git tag -d && git fetch --tags'
alias gcleanup='git maintenance run --task=gc && git maintenance run --task=commit-graph'
alias wt='git worktree'

# github
alias co='gh copilot'

# karabiner
alias keyboardconfig='${EDITOR} ~/.config/karabiner/karabiner.json'

# nimble commander
alias nc="open -a 'Nimble Commander'"
alias nc-import="cp ~/.config/nimble-commander/Config.json ~/Library/Application\ Support/Nimble\ Commander/Config/Config.json && echo 'nimble commander config imported from ~/.config/nimble-comander/Config.json'"
alias nc-export="cp ~/Library/Application\ Support/Nimble\ Commander/Config/Config.json ~/.config/nimble-commander/Config.json && echo 'nimble commander config exported from ~/Library/Application Support/Nimble Commander/Config/Config.json'"

# nodejs
alias npmr='npm run'
alias pn='pnpm'
alias pni='pnpm install --frozen-lockfile'
alias rmnext='rm -Rf **/.next'
alias rmnode='rm -Rf **/node_modules'
alias yif='yarn install --frozen-lockfile'
alias yii='yarn install --immutable-cache'

# pdm
alias pdmv='pdm venv'

# pipx
alias pipx-export="trash ~/.config/pipx/requirements.txt && pipx list | grep 'package' | sed -e 's/package \([^ ]*\) \([^,]*\),.*/\1==\2/' > ~/.config/pipx/requirements.txt && echo 'pipx packages exported to ~/.config/pipx/requirements.txt'"
alias pipx-import="cat ~/.config/pipx/requirements.txt | xargs pipx install && echo 'pipx packages imported from ~/.config/pipx/requirements.txt'"

# pnpm 
alias pnpm-export="trash ~/.default-pnpm-packages && pnpm list -g --depth=0 --parseable | tail -n +2 | sed -E 's|.*/([^@]+)@([^/]+).*|\1@\2|' > ~/.default-pnpm-packages && echo 'pnpm packages exported to ~/.default-pnpm-packages'"
alias pnpm-import="cat ~/.default-pnpm-packages | xargs pnpm install -g && echo 'pnpm packages imported from ~/.default-pnpm-packages'"

# python
alias pv=". .venv/bin/activate"
alias pvs="python -m venv .venv"
alias pvr="pip freeze > requirements.txt"
alias pvi="pip install -r requirements.txt"

# tmux
alias tm='tmux'
alias tmuxconf='${EDITOR} ~/.tmux.conf'

# vim
alias vimrc='${EDITOR} ~/.vimrc'
alias vimplugs='cd ~/.config/nvim/plugged'
alias n='nvim'
alias vi='nvim'
alias vim='nvim'
alias vimf='nvim $(fzf)'

# misc
alias about='neofetch --backend off'
alias ae='aerospace'
alias aerc='~/.config/aerospace/aerospace.toml'
alias defb='defaultbrowser'
alias dc='docker compose'
alias k='kitten'
alias mpva='mpv --no-video'
alias screenshotlocation='defaults write com.apple.screencapture location ~/Pictures/Screenshots'
alias spd='brews start spotifyd'
alias spdq='brews stop spotifyd'
alias sqlitebrowser='/Applications/DB\ Browser\ for\ SQLite.app/Contents/MacOS/DB\ Browser\ for\ SQLite'
alias s='kitten ssh'
alias ssx='ssh -Xv'
alias ts='tailscale'
alias ydl='cd ~/Downloads && yt-dlp'
alias ydl-audio='cd ~/Downloads && yt-dlp -x --embed-thumbnail'
