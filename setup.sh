#!/bin/bash

osx=false
if [[ "$OSTYPE" == "darwin"* ]]; then
  osx=true
fi

if $osx; then
  brew tap petere/postgresql
  brew install curl git tmux tig tree graphviz bazaar hub vim
  brew install rabbitmq redis ansible jq rbenv nvm rethinkdb
  brew install the_silver_searcher postgresql-9.4 sqlite httpie
  brew install ssh-copy-id mongodb mcrypt
else
  if [[ `uname -r` == *"ARCH" ]]; then
    sudo pacman -S vim git curl alsa-utils tig
  else
    sudo apt-get install -y curl git tmux tig tree bzr htop
  fi
fi

for directory in "/data" "/data/db" "/data/redis" "/data/postgres"; do
  if [[ ! -d $directory ]]; then
    sudo mkdir $directory
    sudo chown $USER $directory
  fi
done

# Directories
code=$HOME/code
for directory in \
  "$HOME/bin" "$code" "$code/dev" "$code/repos" "$code/venv" "$code/go" \
  "$HOME/.vim" "$HOME/.vim/autoload" "$HOME/.vim/swaps" \
  "$HOME/.vim/backups" "$HOME/.vim/undo" "$HOME/.vim/colors"; do
  if [[ ! -d $directory ]]; then
    mkdir $directory
  fi
done

# Go packages
if $osx; then
  if [ ! -f "$code/dev/go/bin/go" ]; then
    curl -o go.tar.gz https://storage.googleapis.com/golang/go1.4.2.darwin-amd64-osx10.8.tar.gz
    tar -xzf go.tar.gz
    mv go "$code/dev"
    rm go.tar.gz
  fi

  export GOROOT=$code/dev/go
  export GOPATH=$code/go
  export GOBIN=$HOME/bin
  echo "Fetching muun ,gin, goreman, hk"
  $code/dev/go/bin/go get github.com/kiasaki/muun
  $code/dev/go/bin/go get github.com/codegangsta/gin
  $code/dev/go/bin/go get github.com/mattn/goreman
  $code/dev/go/bin/go get github.com/heroku/hk
fi

# File symlinks
for file in "bashrc" "bash_profile" "tmux.conf" "vimrc" "psqlrc" "i3" "Xresources" "xinitrc" "ghci"; do
  rm -rf "$HOME/.$file"
  ln -s "$HOME/dotfiles/$file" "$HOME/.$file"
done

# File creations
for file in "$HOME/.env" "$HOME/.hushlogin"; do
  if [ ! -f $file ]; then
    touch $file
  fi
done

# File copies
if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
  cp "$HOME/dotfiles/vim/plug.vim" "$HOME/.vim/autoload/plug.vim"
fi
if [ ! -f "$HOME/.vim/colors/hybrid.vim" ]; then
  cp "$HOME/dotfiles/vim/hybrid.vim" "$HOME/.vim/colors/hybrid.vim"
fi
if [ ! -f "$HOME/.gitconfig" ]; then
  cp "$HOME/dotfiles/gitconfig" "$HOME/.gitconfig"
fi

echo "All done!"
