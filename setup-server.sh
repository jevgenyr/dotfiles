#!/bin/bash

sudo apt-get install make git emacs24-nox silversearcher-ag

# Directories
code=$HOME/code
for directory in \
  "$HOME/bin" "$code" "$code/dev" "$code/repos" "$code/venv" "$code/go" \
  "$HOME/.vim" "$HOME/.vim/autoload" "$HOME/.vim/swaps" "$HOME/.vim/colors" \
  "$HOME/.vim/syntax"; do
  if [[ ! -d $directory ]]; then
    mkdir $directory
  fi
done

# Go packages
if $osx; then
  if [ ! -f "$code/dev/go/bin/go" ]; then
    curl -o go.tar.gz https://storage.googleapis.com/golang/go1.6.linux-amd64.tar.gz
    tar -xzf go.tar.gz
    mv go "$code/dev"
    rm go.tar.gz
  fi

  export GOROOT=$code/dev/go
  export GOPATH=$code/go
  export GOBIN=$HOME/bin
  mkdir -p $GOPATH/src/github.com/kiasaki
  echo "Fetching hk, hugo, godep & goreman"
  $code/dev/go/bin/go get github.com/heroku/hk
  $code/dev/go/bin/go get github.com/spf13/hugo
  $code/dev/go/bin/go get github.com/tools/godep
  $code/dev/go/bin/go get github.com/mattn/goreman
  $code/dev/go/bin/go get github.com/nsf/gocode
  $code/dev/go/bin/go get github.com/rogpeppe/godef
  $code/dev/go/bin/go get golang.org/x/tools/cmd/...
fi

# Node.js setup
if [ ! -d "$HOME/n" ]; then
  curl -L http://git.io/n-install | bash
  export N_PREFIX=$HOME/n
  export PATH=$PATH:$N_PREFIX/bin
  npm i -g gulp
  npm i -g bower
  npm i -g watch
  npm i -g http-server
fi

# File symlinks
for file in "bashrc" "bash_profile" "zshrc" "tmux.conf" "vimrc" "psqlrc" \
  "ghci" "nvimrc" "npmrc" "emacs.d"; do
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
if [ ! -f "$HOME/.vim/syntax/scheme.vim" ]; then
  cp "$HOME/dotfiles/vim/scheme.vim" "$HOME/.vim/syntax/scheme.vim"
fi
if [ ! -f "$HOME/.vim/colors/bwop.vim" ]; then
  cp "$HOME/dotfiles/vim/bwop.vim" "$HOME/.vim/colors/bwop.vim"
fi
if [ ! -f "$HOME/.gitconfig" ]; then
  cp "$HOME/dotfiles/gitconfig" "$HOME/.gitconfig"
fi

echo "Fetching Leiningen"
curl -o ~/bin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
chmod +x ~/bin/lein

echo "All done!"