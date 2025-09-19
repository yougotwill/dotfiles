[ -f ~/.colima/colima.zsh ] && source ~/.colima/colima.zsh

# kitty
[ -f $HOME/bin/kitty-macos-match-appearance.sh ] && source $HOME/bin/kitty-macos-match-appearance.sh

# spaceship zsh prompt
[ -f $(brew --prefix)/opt/spaceship/spaceship.zsh ] && source $(brew --prefix)/opt/spaceship/spaceship.zsh

# syntax highlighting
[ -f $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
