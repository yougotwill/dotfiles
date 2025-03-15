# Kitty Terminal dark mode support
if [[ "$TERM" == "xterm-kitty" && "$(uname)" == "Darwin" ]]; then
  if [[ "$(defaults read -g AppleInterfaceStyle 2>/dev/null)" =~ '^Dark' ]]; then
    $(kitten themes Default)
  else
    $(kitten themes PaperColor\ Light)
  fi
fi
