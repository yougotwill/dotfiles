# Disable app analytics https://consoledonottrack.com/
export DO_NOT_TRACK=1

# homebrew
CPU=$(uname -p)
if [[ "$CPU" == "arm" ]]; then
    export HOMEBREW_PATH="/opt/homebrew"
    export PATH="/opt/homebrew/bin:$PATH"
    export PATH="/opt/homebrew/sbin:$PATH"
    export PATH="/opt/homebrew/openssl@3/bin:$PATH"
    export EDITOR="/opt/homebrew/bin/nvim"
    alias oldbrew="/usr/local/bin/brew"
else
    export HOMEBREW_PATH="/usr/local"
    export PATH="/usr/local/bin:$PATH"
    export PATH="/usr/local/sbin:$PATH"
    export PATH="/usr/local/opt/openssl@3/bin:$PATH"
    export EDITOR="/usr/local/bin/nvim"
fi
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSTALL_CLEANUP=1

# set locale and language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# dotnet
export DOTNET_CLI_TELEMETRY_OPTOUT="true"
# export DOTNET_ROOT="/usr/local/opt/dotnet/libexec"
# export MSBuildSDKsPath="/usr/local/Cellar/dotnet/5.0.104/libexec/sdk/5.0.104/Sdks"

# foundry
export PATH="$HOME/.foundry/bin:$PATH"

# huff
export PATH="$PATH:$HOME/.huff/bin"

# pip
# use pipx for anything global
export PIP_REQUIRE_VIRTUALENV=true

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# postgres
export PATH="$(brew --prefix)/opt/postgresql@16/bin:$PATH"

# python
# for cmus-osx
# export PYTHON_CONFIGURE_OPTS="--enable-framework"

# reactjs
export BROWSER=none

# spicetify
export SPICETIFY_INSTALL="$HOME/.spicetify"
export PATH="$SPICETIFY_INSTALL:$PATH"
