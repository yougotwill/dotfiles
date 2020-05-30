# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/neon/.oh-my-zsh"

# homebrew
export PATH="/usr/local/sbin:$PATH"

# custom scripts
export PATH="/Users/neon/bin/:$PATH"

# for compilers
export LDFLAGS="-L/usr/local/opt/readline/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include"

export EDITOR='nvim'

# reactjs
export BROWSER=none

# fzf
export FZF_DEFAULT_COMMAND="fd"
export FZF_CTRL_T_OPTS=""
export FZF_CTRL_T_COMMAND='$FZF_DEFAULT_COMMAND'

# nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# pipenv
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="custom"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-autosuggestions fzf git nvm osx)

source $ZSH/oh-my-zsh.sh
source ~/.secrets # private tokens, aliases, etc.
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# aliases
# bluetooth
alias bt='blueutil'

# boilerplates
alias boil-js="echo 'boiling...' && cp -a ~/Documents/SourceTree/js-boilerplate/. . && rm -Rf .git && rm src/assets/.keep && subl project.sublime-project"
alias boil-react="echo 'boiling...' && cp -a ~/Documents/SourceTree/react-starter/. . && rm -Rf .git && subl project.sublime-project"

# brew
alias brewc='brew cask'
alias brewoutdated='brew update && brew outdated && brew cask outdated --greedy && mas outdated'
alias brewlist='brew list && brew cask list && mas list'
alias brewdelete='brew rmtree'
alias brews='brew services'

# cmus
alias cmus='tmux new-session -A -D -s cmus cmus'
alias cmus-control='brew services restart cmus-control'
alias cmus-status='cmus-remote -Q'

# configs
alias rr="source ~/.zshrc"
alias zshrc="${EDITOR} ~/.zshrc"
alias ohmyzsh="${EDITOR} ~/.oh-my-zsh"
alias vimrc="${EDITOR} ~/.vimrc"
alias vimplugs="cd /Users/neon/.config/nvim/plugged"
alias tmuxconf="${EDITOR} ~/.tmux.conf"
alias keyboardconfig="${EDITOR} ~/.config/karabiner/karabiner.json"

# dotfiles backup
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias config-install='chmod 755 ~/bin/dotfiles-install.sh && dotfiles-install.sh'
alias config-backup='cd ~ && rm Brewfile && brew bundle dump && rm requirements.txt && pip freeze > requirements.txt && bkg backup'

# file navigation
alias ls='exa -lF --time-style=long-iso'
alias ll='exa -F'
alias la='ls -a'

# folder navigation
alias desk='cd ~/Desktop'
alias down='cd ~/Downloads'
alias prj='cd ~/Documents/SourceTree/'

# tmux
alias tmux-iterm='tmux -CC'
alias tmux-attach='tmux attach-session -t'
alias tmux-list='tmux list-session'

# misc
alias x='exit'
alias vim='nvim'
alias vimf='vim $(fzf)'
alias rm='rm -i'
alias rmdir='rm -r'
alias t='trash'
alias fdr='fd -Hip' # find with fd showing hidden files, ignoring case and displaying full path
alias gitdiff="git diff --name-only | uniq | xargs code"
alias ydl='cd ~/Downloads && youtube-dl'
alias ydl-audio='cd ~/Downloads && youtube-dl -x'
alias yt='mpsyt'
alias defb='defaultbrowser'
alias diskfix='diskutil list && diskutil mount disk2s3' # hard drive fix when the FILES partition isn't loading
alias screenshotlocation='defaults write com.apple.screencapture location ~/Pictures/Screenshots'
alias neofetch='neofetch --config ~/.neofetch'
alias vimium-help='open ~/Documents/Vimium.md'
alias sublproject='subl project.sublime-project'
alias work='cd ~/_work'
alias schoolworkbackup='rsync -arP --exclude 'dev' --exclude 'prep' /Volumes/WILL16GB/Documents SchoolWork'
alias userchrome='vim ~/Library/Application\ Support/Firefox/Profiles/ijwtd4lv.default/chrome/userChrome.css'
