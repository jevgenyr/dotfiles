#!/bin/bash
set -xe

pushd ~ >/dev/null

# Install source code pro font
#$HOME/dotfiles/support/install-source-code-pro-font.sh

# Install applications and libraries
if ! [ -x "$(command -v nvim)" ]; then
  sudo apt-get install -qq -y python-dev python-pip python3-dev python3-pip
  sudo add-apt-repository ppa:neovim-ppa/unstable
  sudo apt-get update
  sudo apt-get install -qq -y neovim
fi

if ! [ -x "$(command -v psql)" ]; then
  sudo apt-get install -qq -y postgresql
  sudo -u postgres psql -c "create user $USER with superuser;";
  sudo -u postgres psql -c "create database $USER with owner $USER;"
fi

libs="build-essential libfreetype6-dev"
pkgs=()
which make >/dev/null || pkgs+=(make)
which curl >/dev/null || pkgs+=(curl)
which cmake >/dev/null || pkgs+=(cmake)
which fc-cache >/dev/null || pkgs+=(fontconfig)
which git >/dev/null || pkgs+=(git)
which htop >/dev/null || pkgs+=(htop)
which xclip >/dev/null || pkgs+=(xclip)
which mosh >/dev/null || pkgs+=(mosh)
which tmux >/dev/null || pkgs+=(tmux)
which curl >/dev/null || pkgs+=(curl)
which jq >/dev/null || pkgs+=(jq)
which ag >/dev/null || pkgs+=(silversearcher-ag)
which redis-cli >/dev/null || pkgs+=(redis-server)

if [ ! -z "${pkgs}" ]; then
  sudo apt-get install -qq -y "${pkgs[@]}" $libs
fi


# Install deps for building suckless apps
sudo apt-get install -qq -y xorg-dev

# Install st
if [ ! -d $HOME/code/repos/st ]; then
  git clone git://git.suckless.org/st ~/code/repos/st
fi
rm -f ~/code/repos/st/config.h
ln -s ~/dotfiles/support/st-config.h ~/code/repos/st/config.h
cd ~/code/repos/st
sudo make clean install

# Install slock
if [ ! -d $HOME/code/repos/slock ]; then
  git clone git://git.suckless.org/slock ~/code/repos/slock
fi
cd ~/code/repos/slock
sudo make clean install

# Install Input font
sudo cp -r ~/dotfiles/support/fonts/go /usr/share/fonts/truetype/go
sudo cp -r ~/dotfiles/support/fonts/input /usr/share/fonts/truetype/input
fc-cache -f -v


popd >/dev/null
