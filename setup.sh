#!/bin/bash
set -e

log() {
  echo "----> $1"
}

osx=false
if [[ "$(uname)" == "Darwin" ]]; then
  osx=true
fi

log "Directories"
sudo mkdir -p /data/db  && sudo chown "$USER" /data/db
sudo mkdir -p /data/redis && sudo chown "$USER" /data/redis
sudo mkdir -p /data/postgres && sudo chown "$USER" /data/postgres
mkdir -p ~/bin ~/code/{dev,repos,venv,go}
mkdir -p ~/.vim/{autoload,colors,syntax} ~/.config/nvim/{autoload,colors,syntax}

log "Files: Symlinks"
rm -rf ~/.vimrc                    && ln -s $HOME/dotfiles/dotfiles/vimrc ~/.vimrc
rm -rf ~/.kshrc                    && ln -s $HOME/dotfiles/dotfiles/kshrc ~/.kshrc
rm -rf ~/.mkshrc                   && ln -s $HOME/dotfiles/dotfiles/kshrc ~/.mkshrc
rm -rf ~/.ushrc                    && ln -s $HOME/dotfiles/dotfiles/ushrc ~/.ushrc
rm -rf ~/.bashrc                   && ln -s $HOME/dotfiles/dotfiles/bashrc ~/.bashrc
rm -rf ~/.flake8                   && ln -s $HOME/dotfiles/dotfiles/flake8 ~/.flake8
rm -rf ~/.psqlrc                   && ln -s $HOME/dotfiles/dotfiles/psqlrc ~/.psqlrc
rm -rf ~/bin/waves                 && ln -s $HOME/dotfiles/bin/waves ~/bin/waves
rm -rf ~/bin/colors                && ln -s $HOME/dotfiles/bin/colors ~/bin/colors
rm -rf ~/.tmux.conf                && ln -s $HOME/dotfiles/dotfiles/tmux.conf ~/.tmux.conf
rm -rf ~/.alacritty.yml            && ln -s $HOME/dotfiles/dotfiles/alacritty.yml ~/.alacritty.yml
rm -rf ~/.vim/colors/u.vim         && ln -s $HOME/dotfiles/vim/u.vim ~/.vim/colors/u.vim
rm -rf ~/.config/nvim/init.vim     && ln -s $HOME/dotfiles/dotfiles/vimrc ~/.config/nvim/init.vim
rm -rf ~/.config/nvim/colors/u.vim && ln -s $HOME/dotfiles/vim/u.vim ~/.config/nvim/colors/u.vim

log "Files: Creations"
[ ! -f ~/.env ] && touch ~/.env
[ ! -f ~/.hushlogin ] && touch ~/.hushlogin

log "Files: Copies"
[ ! -f ~/.npmrc ] && cp $HOME/dotfiles/dotfiles/npmrc ~/.npmrc
[ ! -f ~/.gitconfig ] && cp $HOME/dotfiles/dotfiles/gitconfig ~/.gitconfig
[ ! -f ~/.vim/autoload/plug.vim ] && cp ~/dotfiles/vim/plug.vim ~/.vim/autoload/plug.vim
[ ! -f ~/.config/nvim/autoload/plug.vim ] && cp ~/dotfiles/vim/plug.vim ~/.config/nvim/autoload/plug.vim

log "Language: Go"
if [ ! -f $HOME/code/dev/go/bin/go ]; then
  log "Language: Go: Fetching binaries"
  if $osx; then
    curl -o go.tar.gz https://storage.googleapis.com/golang/go1.12.4.darwin-amd64.tar.gz
  else
    curl -o go.tar.gz http://storage.googleapis.com/golang/go1.12.4.linux-amd64.tar.gz
  fi
  tar -xzf go.tar.gz
  mv go ~/code/dev
  rm go.tar.gz
fi
export GOROOT=~/code/dev/go
export GOPATH=~/code/go
export GOBIN=~/bin
mkdir -p $GOPATH/src/github.com/kiasaki
log "Language: Go: Installing tools"
$GOROOT/bin/go get -u github.com/spf13/hugo
$GOROOT/bin/go get -u github.com/motemen/gore

log "Language: Rust"
if [ ! -d "$HOME/.rustup" ]; then
  curl https://sh.rustup.rs -sSf | sh -s -- --no-modify-path --default-toolchain nightly
fi

log "Language: Node.js"
if [ ! -d "$HOME/n" ]; then
  log "Language: Node.js: Fetching binaries"
  curl -L http://git.io/n-install | bash -s -- -n -y
  export PATH="$PATH:$HOME/n/bin"
  $HOME/n/bin/npm i -g yarn
  $HOME/n/bin/npm i -g eslint
fi

log "Language: Ruby"
if ! [ -x "$(command -v chruby)" ]; then
  log "Language: Ruby: Installing chruby"
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

log "DONE!"
