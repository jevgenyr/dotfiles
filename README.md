# dotfiles

My very own dotfiles ^^,

## Contents

Mostly configuration for the following:

- vim
- emacs
- git
- bash + aliases and helpers
- zsh + aliases and helpers
- tmux
- psql
- redis
- go
- nodejs
- ruby

## Installing (macOS)

### 1. Homebrew

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### 2. SSH & Identity

Create an ssh key, copy it, open safari and add it to Github & Heroku.

```
ssh-keygen
cat ~/.ssh/id_rsa.pub | pbcopy
```

### 3. Fetch dotfiles

Clone `dotfiles` using git.

```
git clone git@github.com:kiasaki/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 4. Run setup

Run `setup.sh` and `setup-osx.sh` and enter password/say yes a few times

```
./setup-osx.sh
./setup.sh
```

### 5. Change default shell

Change default shell:

```
chsh -s /bin/zsh kiasaki
```

### 5. Conclusion: Other app and mouse driven config

Get Pages, Moom, BreakTime, F.lux and Hues from the Mac App Store.

In System Setting, set keyboard modifier key for Caps Lock to Control.

While in System Setting, set keyboard shortcuts for switching spaces to `Ctrl+Shift+[hl]`.

Open finder, press `Cmd+,` and make sure the sidebar shows only wanted items, then, configure the toolbar to only have path, view mode & search widgets.

Hold shift with the mouse over the dock's resize bar and move it to the left.

## Installing (Ubuntu)

```
wget https://raw.githubusercontent.com/kiasaki/dotfiles/master/setup.sh
./setup.sh
```

## Installing (ElementaryOS)

```
sudo apt-get install software-properties-common vim git zsh xclip gdebi
sudo apt-get install python-dev python-pip python3-dev python3-pip
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
chsh -s /bin/zsh
ssh-keygen -t rsa -b 2048
cat ~/.ssh/id_rsa.pub | xclip -i
# Install Chrome using Epiphany & `sudo gdebi ~/Downloads/chrome.deb`
# Add new SSH key to GitHub
git clone git@github.com:kiasaki/dotfiles.sh
cd dotfiles
./setup.sh
./setup-ubuntu.sh
```



## License

MIT
