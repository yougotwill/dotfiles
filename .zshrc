# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Disable app analytics https://consoledonottrack.com/
export DO_NOT_TRACK=1

# homebrew
CPU=$(uname -p)
if [[ "$CPU" == "arm" ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
    export PATH="/opt/homebrew/sbin:$PATH"
    export PATH="/opt/homebrew/openssl@3/bin:$PATH"
    export EDITOR="/opt/homebrew/bin/nvim"
    alias oldbrew="/usr/local/bin/brew"
else
    export PATH="/usr/local/bin:$PATH"
    export PATH="/usr/local/sbin:$PATH"
    export PATH="/usr/local/opt/openssl@3/bin:$PATH"
    export EDITOR="/usr/local/bin/nvim"
fi
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSTALL_CLEANUP=1

# homebrew shell completion
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

# custom scripts
export PATH="$HOME/bin/:$PATH"

# for compilers
# export LDFLAGS="-L/opt/homebrew/opt/readline/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/readline/include"

# set locale and language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# cmus-osx
export PYTHON_CONFIGURE_OPTS="--enable-framework"

# asdf
[ -f ~/.asdf/asdf.sh ] && source ~/.asdf/asdf.sh
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

# dotnet
export DOTNET_CLI_TELEMETRY_OPTOUT="true"
# export DOTNET_ROOT="/opt/homebrew/opt/dotnet/libexec"
# export MSBuildSDKsPath="/opt/homebrew/Cellar/dotnet/5.0.104/libexec/sdk/5.0.104/Sdks"

# flutter
export PATH="$HOME/flutter/bin:$PATH"

# foundry
export PATH="$HOME/.foundry/bin:$PATH"

# fzf
export FZF_DEFAULT_COMMAND="fd"
export FZF_CTRL_T_OPTS=""
export FZF_CTRL_T_COMMAND='$FZF_DEFAULT_COMMAND'

# go
export ASDF_GOLANG_MOD_VERSION_ENABLED=true
[ -f $HOME/.asdf/plugins/golang/set-env.sh ] && source $HOME/.asdf/plugins/golang/set-env.sh

# huff
export PATH="$PATH:$HOME/.huff/bin"

# java
[ -f $HOME/.asdf/plugins/java/setjava-home.zsh ] && source $HOME/.asdf/plugins/java/set-java-home.zsh

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# pipx
export PATH="$PATH:$HOME/.local/bin"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && source ~/.config/tabtab/zsh/__tabtab.zsh || true

# postgres
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# python
# for cmus-osx
export PYTHON_CONFIGURE_OPTS="--enable-framework"

# reactjs
export BROWSER=none

# spicetify
export SPICETIFY_INSTALL="$HOME/.spicetify"
export PATH="$SPICETIFY_INSTALL:$PATH"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME=""

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
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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

# Uncomment the following line if you want to ignore all duplicate commands in
# the history list.
HIST_IGNORE_ALL_DUPS="true"

# oh-my-zsh
# Skip all plugin aliases
zstyle ':omz:plugins:*' aliases no
# exceptions
zstyle ':omz:plugins:z' aliases yes

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-interactive-cd zsh-autosuggestions fzf z npm pdm)

source $ZSH/oh-my-zsh.sh

# User configuration

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Tmux on startup
# ZSH_TMUX_AUTOSTART="true"
# Don't automatically connect to a previous session if it exists, you can attached instead
# ZSH_TMUX_AUTOCONNECT="false"

# check if file exists and then source
[ -f ~/.secrets ] && source ~/.secrets # private tokens, aliases, etc.
[ -f ~/.aliases ] && source ~/.aliases
[ -f ~/.aliases-work ] && source ~/.aliases-work
[ -f ~/.functions ] && source ~/.functions
[ -f ~/.shortcuts ] && source ~/.shortcuts
[ -f ~/.colima/colima.zsh ] && source ~/.colima/colima.zsh

# completions
eval $(thefuck --alias)
eval "$(gh completion -s zsh)"
eval "$(flutter zsh-completion)"

source ~/bin/kitty-macos-match-appearance.sh

# spaceship zsh prompt
[ -f $(brew --prefix)/opt/spaceship/spaceship.zsh ] && source $(brew --prefix)/opt/spaceship/spaceship.zsh

# syntax highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

