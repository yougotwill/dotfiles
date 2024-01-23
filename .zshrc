# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/will/.oh-my-zsh"

# homebrew
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ANALYTICS=1
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/openssl@3/bin:$PATH"

# custom scripts
export PATH="/Users/will/bin/:$PATH"

# for compilers
export LDFLAGS="-L/usr/local/opt/readline/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include"

# set locale and language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR='nvim'

# reactjs
export BROWSER=none

# dotnet
export DOTNET_CLI_TELEMETRY_OPTOUT="true"
# export DOTNET_ROOT="/usr/local/opt/dotnet/libexec"
# export MSBuildSDKsPath="/usr/local/Cellar/dotnet/5.0.104/libexec/sdk/5.0.104/Sdks"

# flutter
export PATH="/Users/will/dev/flutter/bin:$PATH"

# fzf
export FZF_DEFAULT_COMMAND="fd"
export FZF_CTRL_T_OPTS=""
export FZF_CTRL_T_COMMAND='$FZF_DEFAULT_COMMAND'

# go
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# java
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export JAVA_HOME=$(/usr/libexec/java_home)

# pnpm
export PNPM_HOME="/Users/will/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# tabtab source for packages

# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

# postgres
export PATH="/usr/local/opt/postgresql@15/bin:$PATH"

# python
# for cmus-osx
export PYTHON_CONFIGURE_OPTS="--enable-framework"

# ruby
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# spicetify
export SPICETIFY_INSTALL="/Users/will/spicetify-cli"
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
plugins=(tmux zsh-autosuggestions zsh-interactive-cd last-working-dir fzf npm yarn z)

# Tmux on startup
ZSH_TMUX_AUTOSTART="true"
# Don't automatically connect to a previous session if it exists, you can attached instead
ZSH_TMUX_AUTOCONNECT="false"

source $ZSH/oh-my-zsh.sh
# source ~/.secrets # private tokens, aliases, etc.
source ~/.aliases
source ~/.aliases-work
source ~/.functions
source ~/.shortcuts

source ~/.asdf/asdf.sh
source ~/.asdf/completions/asdf.bash

source ~/.colima/colima.zsh

eval $(thefuck --alias)
eval "$(gh completion -s zsh)"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

