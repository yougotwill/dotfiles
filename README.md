# yougotwill dotfiles

you got dotfiles!

## my macOS setup

Start with my [.zshrc](.zshrc)

For some of the custom scripts that I use check out the [bin](bin folder) folder.

Check out the [.brew folder](.brew/brews) for files listing the various CLIs and apps that I use (includes apps installed from the Apple App Store and VS Code extensions).

Check out the `.default-X` files for global packages installed under asdf.

## Applications
### Special Mentions
- Aerospace (My Window Manager of choice)
- Firefox
- Iina
- Kitty
- LibreOffice
- Logseq
- Nimble Commander
- Session
- Spotify
- Thunderbird
- Typora
- Visual Studio Code

## How I manage my dotfiles
Inspired by [https://www.atlassian.com/git/tutorials/dotfiles](https://www.atlassian.com/git/tutorials/dotfiles)

There are various ways to manage your dotfiles but I thought that this method had the least dependencies and was pretty clean.

## How to install

1. Download this [script](bin/dotfiles-install.sh), open your favourite terminal and then run it (don't forget to make it executable)!
2. Trust in the force.
3. If it succeeds you should receive the message `dotfiles are setup!`.
4. Install [Homebrew](https://github.com/Homebrew/brew) by copying and pasting again into your terminal the code below.

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
5. Install [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh) by copying and pasting again into your terminal the code below.

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
6. Install [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)` by copying and pasting again into your terminal the code below.

```shell
/usr/bin/git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
7. Install the [spaceship](https://github.com/spaceship-prompt/spaceship-prompt) prompt by copying and pasting again into your terminal the code below.

```shell
/usr/bin/git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
```
8. Install [asdf](https://github.com/asdf-vm/asdf) by copying and pasting again into your terminal the code below.

```shell
/usr/bin/git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
```

9. Run `brestore`. This will install all the packages, applications and VS Code extensions using Homebrew. You can install them incrementally using the `brestore-` aliases see [my aliases](.zshrc.d/aliases) for more info.
10. Grab a coffee or go for that run you keep procrastinating because this might take a while.
11. Import global pipx packages with `pipx-import`.
12. Import global pnpm packages with `pnpm-import`.
13. Import my configuration for Nimble Commander using `nc-import`.
13. That's it you should be finished! 🎉
