# yougotwill dotfiles

you got dotfiles!

## my macOS setup

My [.zshrc](.zshrc)

My [.aliases](.aliases)

My neovim configuration [.vimrc](.vimrc).

My git configuration [.gitconfig](.gitconfig).

For some of the custom scripts that I use check out the [bin](bin folder) folder.

Check out the various `Brewfiles` for the list of various CLIs and apps that I use (includes apps installed from the Apple App Store and VS Code extensions).

Check out the `.default` files for global packages installed under asdf.

## Applications
### Special Mentions
- Amethyst (My Window Manager of choice)
- Discord
- Firefox
- Iina
- Kitty
- LibreOffice
- Logseq
- Loop
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

1. Open your favourite terminal then copy and paste the code below into it. 

   Feel free to paste the code into a script first and then run that. 

```zsh
/usr/bin/git clone --bare https://github.com/yougotwill/dotfiles.git $HOME/.dotfiles
function config {
  /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}
mkdir -p .dotfiles-backup
config checkout
if [ $? = 0 ]; then
 echo "dotfiles loaded successfully";
 else
  echo "Backing up pre-existing dot files.";
  config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no
echo "dotfiles are setup!"
echo "Go back to https://github.com/yougotwill/dotfiles/blob/master/README.md and read further instructions." 
```

2. Trust in the force.
3. If it succeeds you should receive the message `dotfiles are setup!`.
4. Install [Homebrew](https://github.com/Homebrew/brew) by copying and pasting again into your terminal the code below.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
5. Install [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh) by copying and pasting again into your terminal the code below.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
6. Install [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)` by copying and pasting again into your terminal the code below.

```bash
/usr/bin/git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
7. Install the [spaceship](https://github.com/spaceship-prompt/spaceship-prompt) prompt by copying and pasting again into your terminal the code below.

```bash
/usr/bin/git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
```
8. Install [asdf](https://github.com/asdf-vm/asdf) by copying and pasting again into your terminal the code below.

```bash
/usr/bin/git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
```

9. Run `brestore`. This will install all the packages, applications and VS Code extensions using Homebrew. You can install them incrementally using the `brestore-` aliases see [my aliases](.aliases) for more info.
10. Grab a coffee or go for that run you keep procrastinating because this might take a while.
11. Run `pip install -r requirements.txt`.
12. Run `pipx-import`.
13. To install the global npm packages install node and run `npx backup-global file`.
14. That's it you should be finished!🎉