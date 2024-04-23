# yougotwill dotfiles

you got dotfiles!

My Macbook Pro setup

Currently the following are included:

## Packages
- Homebrew
- ohmyzsh
- asdf
- pipx

## CLI

My [.zshrc](.zshrc)

My vim configuration [.vimrc](.vimrc).

My git configuration [.gitconfig](.gitconfig).

For some of the custom scripts that I use check out the [bin](bin folder) folder.

Check out the [Brewfile](Brewfile) for the list of various CLIs and apps that I use (includes apps installed from the Apple App Store).

Check out the [npm.global.txt](npm.global.txt) for the list of my globalled installed npm packages

## Applications
### Special Mentions
- Amethyst (My Window Manager of choice)
- Firefox
- Google Chrome
- Iina
- LibreOffice
- Logseq
- Slack
- Source Tree
- Spotify
- Sublime Text
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
git clone --bare https://github.com/yougotwill/dotfiles.git $HOME/.dotfiles
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
echo "To install the global npm packages install node and run npx backup-global file" 
```

2. Trust in the force.
3. If it succeeds you should receive the message `dotfiles loaded successfully`.
4. Install homebrew by copying and pasting again into your terminal the code below.

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
5. Install `ohmyzsh` by copying and pasting again into your terminal the code below.

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
6. Install the `spaceship` prompt by copying and pasting again into your terminal the code below.

```bash
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
```
7. Install `asdf` by copying and pasting again into your terminal the code below.

```bash
/usr/bin/git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
```

8. Run `brestore`. This will install all the cli and application stuff. You can install parts separately by using the `brestore-` alias see [.aliases](.aliases) for more info.
9. Grab a coffee or go for that run you keep procrastinating because this might take a while.
10. Run `pip install -r requirements.txt`.
11. Run `pipx-import`.
12. To install the global npm packages install node and run `npx backup-global file`.
13. That's it you should be finished!🎉

