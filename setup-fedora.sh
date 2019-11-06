#!/usr/bin/env bash
set -ex

# flatpak remote-add flathub https://flathub.org/repo/flathub.flatpakrepo

sudo dnf install -y python3 python3-devel cmake git-lfs ripgrep htop jq xclip \
  neovim python3-neovim tmux redis postgresql-server  postgresql-devel \
  libX11-devel libXft-devel

pip3 install ansible virtualenv

# libvirt for kvm for the Android emulator
sudo dnf install @virtualization
sudo systemctl start libvirtd
sudo systemctl enable libvirtd

# docker
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo systemctl enable docker
sudo systemctl start docker

if sudo test ! -d "/var/lib/pgsql/data/log";  then
  sudo /usr/bin/postgresql-setup --initdb
  sudo systemctl enable postgresql
  sudo systemctl restart postgresql
  pushd ~ >/dev/null
  sudo -u postgres psql -c "create user $USER with superuser;" || true
  sudo -u postgres psql -c "create database $USER with owner $USER;" || true
  popd
fi

sudo systemctl enable redis

sudo cp -r ~/dotfiles/support/fonts/go /usr/share/fonts/go
sudo cp -r ~/dotfiles/support/fonts/input /usr/share/fonts/input
fc-cache -f -v

bash ./support/u.gnomeshell.sh

mkdir -p ~/bin ~/code/{dev,repos,venv,go}
mkdir -p ~/.vim/{autoload,colors,syntax} ~/.config/nvim/{autoload,colors,syntax}
rm -rf ~/.vimrc     && ln -s $HOME/dotfiles/dotfiles/vimrc ~/.vimrc
rm -rf ~/.bashrc    && ln -s $HOME/dotfiles/dotfiles/bashrc ~/.bashrc
rm -rf ~/.psqlrc    && ln -s $HOME/dotfiles/dotfiles/psqlrc ~/.psqlrc
rm -rf ~/.tmux.conf && ln -s $HOME/dotfiles/dotfiles/tmux.conf ~/.tmux.conf
rm -rf ~/.vim/colors/u.vim         && ln -s $HOME/dotfiles/vim/u.vim ~/.vim/colors/u.vim
rm -rf ~/.config/nvim/init.vim     && ln -s $HOME/dotfiles/dotfiles/vimrc ~/.config/nvim/init.vim
rm -rf ~/.config/nvim/colors/u.vim && ln -s $HOME/dotfiles/vim/u.vim ~/.config/nvim/colors/u.vim

[ ! -f ~/.env ] && touch ~/.env
[ ! -f ~/.hushlogin ] && touch ~/.hushlogin
[ ! -f ~/.npmrc ] && cp $HOME/dotfiles/dotfiles/npmrc ~/.npmrc
[ ! -f ~/.gitconfig ] && cp $HOME/dotfiles/dotfiles/gitconfig ~/.gitconfig
[ ! -f ~/.vim/autoload/plug.vim ] && cp ~/dotfiles/vim/plug.vim ~/.vim/autoload/plug.vim
[ ! -f ~/.config/nvim/autoload/plug.vim ] && cp ~/dotfiles/vim/plug.vim ~/.config/nvim/autoload/plug.vim

if [ ! -f $HOME/code/dev/go/bin/go ]; then
  curl -o go.tar.gz http://storage.googleapis.com/golang/go1.13.linux-amd64.tar.gz
  tar -xzf go.tar.gz
  mv go ~/code/dev
  rm go.tar.gz
fi

if [ ! -d "$HOME/n" ]; then
  curl -L http://git.io/n-install | bash -s -- -n -y
  export PATH="$PATH:$HOME/n/bin"
  $HOME/n/bin/npm i -g yarn
  $HOME/n/bin/npm i -g eslint
fi

git lfs install

curl https://cli-assets.heroku.com/install.sh | sh

if [ ! -d $HOME/code/repos/st ]; then
  git clone git://git.suckless.org/st ~/code/repos/st
fi
rm -f ~/code/repos/st/config.h
ln -s ~/dotfiles/support/st-config.h ~/code/repos/st/config.h
cd ~/code/repos/st
sudo make clean install
cd -
