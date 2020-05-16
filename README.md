# yougotwill dotfiles

you got dotfiles!

My Macbook Pro setup

Currently the following are included:

## Packages
- Homebrew
- Pip
- Npm

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
- Slack
- Source Tree
- Spotify
- Sublime Text
- Typora
- Visual Studio Code

Check out my [Brewfile](Brewfile) for the rest of the applications that I use.

## How I manage my dotfiles
Inspired by [https://www.atlassian.com/git/tutorials/dotfiles](https://www.atlassian.com/git/tutorials/dotfiles)

There are various ways to manage your dotfiles but I thought that this method had the least dependencies and was pretty clean.

## How to install

1. Open your favourite terminal then copy and paste the code below into it. 

   Feel free to paste the code into a script first and then run that. 

```zsh
git clone --bare https://github.com/yougotwill/dotfiles.git $HOME/.dotfiles
  2 function config {
  3    /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
  4 }
  5 mkdir -p .dotfiles-backup
  6 config checkout
  7 if [ $? = 0 ]; then
  8   echo "dotfiles loaded successfully";
  9   else
 10     echo "Backing up pre-existing dot files.";
 11     config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}
 12 fi;
 13 config checkout
 14 config config status.showUntrackedFiles no
 15 echo "To install the global npm packages install node and run npx backup-global file" 
```

2. Trust in the force.
3. If it succeeds you should receive the message `dotfiles loaded successfully`.
4. Install homebrew by copying and pasting again into your terminal the code below.

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

5. Run `brew bundle`. This will install all the cli and application stuff.
6. Grab a coffee or go for that run you keep procrastinating because this might take a while.
7. Once that is all done run the following `pip install -r requirements.txt`.
8. To install the global npm packages install node and run `npx backup-global file`.
8. That's it you should be finished!🎉

