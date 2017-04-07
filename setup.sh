#!/bin/bash
set -e

osx=false
if [[ "$OSTYPE" == "darwin"* ]]; then
  osx=true
fi

# Clone dotfiles in case we just curl'ed the setup.sh file
if [ ! -d "$HOME/dotfiles" ]; then
  git clone https://github.com/kiasaki/dotfiles.git
fi

if [ ! -d "$HOME/.rustup" ]; then
  curl https://sh.rustup.rs -sSf | sh -s -- --no-modify-path --default-toolchain nightly
fi

# Directories: Create
sudo mkdir -p /data/db
sudo chown "$USER" /data/db
sudo mkdir -p /data/redis
sudo chown "$USER" /data/redis
sudo mkdir -p /data/postgres
sudo chown "$USER" /data/postgres
mkdir -p ~/bin
mkdir -p ~/.atom
mkdir -p ~/code/{dev,repos,venv,go}
mkdir -p ~/.vim/{autoload,swaps,colors,syntax}
mkdir -p ~/.config/nvim/{autoload,colors}

# Files: Symlinks
dotfiles=~/dotfiles/dotfiles
rm -rf ~/.mkshrc ~/.bashrc ~/.bash_profile ~/.zshrc ~/.ushrc ~/.tmux.conf ~/.vimrc ~/.psqlrc ~/.ghci ~/.emacs.d ~/.config/nvim/init.vim ~/.alacritty.yml ~/bin/wave ~/bin/waverun
ln -s $dotfiles/mkshrc ~/.mkshrc
ln -s $dotfiles/bashrc ~/.bashrc
ln -s $dotfiles/bash_profile ~/.bash_profile
ln -s $dotfiles/zshrc ~/.zshrc
ln -s $dotfiles/vimrc ~/.vimrc
ln -s $dotfiles/emacs.d ~/.emacs.d
ln -s $dotfiles/tmux.conf ~/.tmux.conf
ln -s $dotfiles/ghci ~/.ghci
ln -s $dotfiles/ushrc ~/.ushrc
ln -s $dotfiles/psqlrc ~/.psqlrc
ln -s $dotfiles/vimrc ~/.config/nvim/init.vim
ln -s $dotfiles/alacritty.yml ~/.alacritty.yml
ln -s $HOME/dotfiles/bin/wave ~/bin/wave
ln -s $HOME/dotfiles/bin/waverun ~/bin/waverun

# Files: Creations
[ ! -f ~/.env ] && touch ~/.env
[ ! -f ~/.hushlogin ] && touch ~/.hushlogin

# Files: Copies
[ ! -f ~/.vim/autoload/plug.vim ] && \
  cp ~/dotfiles/vim/plug.vim ~/.vim/autoload/plug.vim
[ ! -f ~/.vim/colors/solarized.vim ] && \
  cp ~/dotfiles/vim/solarized.vim ~/.vim/colors/solarized.vim
[ ! -f ~/.vim/colors/dracula.vim ] && \
  cp ~/dotfiles/vim/dracula.vim ~/.vim/colors/dracula.vim
[ ! -f ~/.config/nvim/autoload/plug.vim ] && \
  cp ~/dotfiles/vim/plug.vim ~/.config/nvim/autoload/plug.vim
[ ! -f ~/.config/nvim/colors/solarized.vim ] && \
  cp ~/dotfiles/vim/solarized.vim ~/.config/nvim/colors/solarized.vim
[ ! -f ~/.config/nvim/colors/dracula.vim ] && \
  cp ~/dotfiles/vim/dracula.vim ~/.config/nvim/colors/dracula.vim
[ ! -f ~/.gitconfig ] && \
  cp $dotfiles/gitconfig ~/.gitconfig
[ ! -f ~/.npmrc ] && \
  cp $dotfiles/npmrc ~/.npmrc
[ ! -f ~/.atom/config.cson ] && \
  cp $dotfiles/atom/config.cson ~/.atom/config.cson
[ ! -f ~/.atom/keymap.cson ] && \
  cp $dotfiles/atom/keymap.cson ~/.atom/keymap.cson

# Language: Go
if [ ! -f $HOME/code/dev/go/bin/go ]; then
  if $osx; then
    curl -o go.tar.gz https://storage.googleapis.com/golang/go1.7.1.darwin-amd64.tar.gz
  else
    curl -o go.tar.gz https://storage.googleapis.com/golang/go1.7.1.linux-amd64.tar.gz
  fi
  tar -xzf go.tar.gz
  mv go ~/code/dev
  rm go.tar.gz
fi
export GOROOT=~/code/dev/go
export GOPATH=~/code/go
export GOBIN=$HOME/bin
mkdir -p $GOPATH/src/github.com/kiasaki
echo "Fetching hk, hugo, godep, gore & others"
$GOROOT/bin/go get github.com/motemen/gore
$GOROOT/bin/go get github.com/heroku/hk
$GOROOT/bin/go get github.com/spf13/hugo
$GOROOT/bin/go get github.com/tools/godep
$GOROOT/bin/go get github.com/FiloSottile/gvt
$GOROOT/bin/go get github.com/nsf/gocode
$GOROOT/bin/go get github.com/rogpeppe/godef
$GOROOT/bin/go get golang.org/x/tools/cmd/...
$GOROOT/bin/go get github.com/jteeuwen/go-bindata/...

# Language: Node.js
if [ ! -d "$HOME/n" ]; then
  curl -L http://git.io/n-install | bash -s -- -n -y
  $HOME/n/bin/npm i -g yarn
  $HOME/n/bin/npm i -g eslint
fi

# Language: Ruby

if ! [ -x "$(command -v chruby)" ]; then
  if $osx; then
    brew install ruby-install chruby
  else
    wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz
    tar -xzvf chruby-0.3.9.tar.gz
    cd chruby-0.3.9/
    sudo make install
    cd ..
    rm -r chruby-0.3.9/ chruby-0.3.9.tar.gz

    wget -O ruby-install-0.6.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.6.0.tar.gz
    tar -xzvf ruby-install-0.6.0.tar.gz
    cd ruby-install-0.6.0/
    sudo make install
    cd ..
    rm -r ruby-install-0.6.0/ ruby-install-0.6.0.tar.gz
  fi
fi

echo "All done!"
