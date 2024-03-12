# Path to your oh-my-zsh installation.
export ZSH="/Users/will/.oh-my-zsh"

# homebrew
CPU=$(uname -p)
if [[ "$CPU" == "arm" ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
    export PATH="/opt/homebrew/sbin:$PATH"
    export PATH="/opt/homebrew/openssl@3/bin:$PATH"
    export EDITOR=/opt/homebrew/bin/nano
    alias oldbrew=/usr/local/bin/brew
else
    export PATH="/usr/local/bin:$PATH"
    export PATH="/usr/local/sbin:$PATH"
    export PATH="/usr/local/opt/openssl@3/bin:$PATH"
    export EDITOR=/usr/local/bin/nano
fi
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ANALYTICS=1

# custom scripts
export PATH="/Users/will/bin/:$PATH"

# for compilers
export LDFLAGS="-L/opt/homebrew/opt/readline/lib"
export CPPFLAGS="-I/opt/homebrew/opt/readline/include"

# set locale and language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR='nvim'

# reactjs
export BROWSER=none

# dotnet
export DOTNET_CLI_TELEMETRY_OPTOUT="true"
# export DOTNET_ROOT="/opt/homebrew/opt/dotnet/libexec"
# export MSBuildSDKsPath="/opt/homebrew/Cellar/dotnet/5.0.104/libexec/sdk/5.0.104/Sdks"

# flutter
export PATH="$HOME/flutter/bin:$PATH"

# fzf
export FZF_DEFAULT_COMMAND="fd"
export FZF_CTRL_T_OPTS=""
export FZF_CTRL_T_COMMAND='$FZF_DEFAULT_COMMAND'

# go
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# java
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export JAVA_HOME=$(/usr/libexec/java_home)

# pnpm
export PNPM_HOME="/Users/will/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# pipx
export PATH="$PATH:/Users/will/.local/bin"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && source ~/.config/tabtab/zsh/__tabtab.zsh || true

# postgres
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

# python
# for cmus-osx
export PYTHON_CONFIGURE_OPTS="--enable-framework"

# spicetify
export SPICETIFY_INSTALL="/Users/will/.spicetify"
export PATH="$SPICETIFY_INSTALL:$PATH"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="avit"

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

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-autosuggestions zsh-interactive-cd last-working-dir z fzf npm yarn asdf)

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

[ -f ~/.asdf/asdf.sh ] && source ~/.asdf/asdf.sh
[ -f ~/.colima/colima.zsh ] && source ~/.colima/colima.zsh
[ -f ~/.fzf.sh ] && source ~/.fzf.zsh

# completions
eval $(thefuck --alias)
eval "$(gh completion -s zsh)"
eval "$(flutter zsh-completion)"
# eval "$(register-python-argcomplete pipx)"

source $ZSH/oh-my-zsh.sh

# User configuration

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
