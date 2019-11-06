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

## Installing (Ubuntu server)

```
ssh-keygen -t rsa -b 4096
cat ~/.ssh/id_rsa.pub
# add to github
sudo apt install make git mosh neovim curl htop tmux jq silversearcher-ag ranger redis-server
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install -qq -y neovim
git clone git@github.com:kiasaki/dotfiles.git
cd dotfiles
./setup.sh
sudo apt install postgresql
sudo -u postgres psql -c "create user $USER with superuser with login;";
sudo -u postgres psql -c "create database $USER with owner $USER;"
sudo apt-get update && sudo apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update && sudo apt-get install -y kubectl
```

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

### Adding st & android studio's custom `.desktop`

```
cp support/st.desktop ~/.local/share/applications/st.desktop
```

### Bump max file watches

echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

## License

MIT
