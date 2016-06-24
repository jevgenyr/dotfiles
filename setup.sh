#!/bin/bash

osx=false
if [[ "$OSTYPE" == "darwin"* ]]; then
  osx=true
fi

# Install apps via brew
if $osx; then
  brew tap petere/postgresql
  brew install postgresql-9.5 sqlite redis
  brew install curl git tmux tig tree jq httpie mercurial vim
  brew install reattach-to-user-namespace the_silver_searcher
  brew link -f postgresql-9.5
else
  sudo apt-get install make git emacs24-nox silversearcher-ag curl tmux
fi

# Clone dotfiles in case we just curl'ed the setup.sh file
if [ ! -d "$HOME/dotfiles" ]; then
  git clone https://github.com/kiasaki/dotfiles.git
fi

# Directories: Create
sudo mkdir -p /data/db
sudo chown "$USER" /data/db
sudo mkdir -p /data/redis
sudo chown "$USER" /data/redis
sudo mkdir -p /data/postgres
sudo chown "$USER" /data/postgres
mkdir -p ~/bin ~/code ~/.vim
mkdir -p ~/code/dev ~/code/repos ~/code/venv ~/code/go
mkdir -p ~/.vim/autoload ~/.vim/swaps ~/.vim/colors ~/.vim/syntax
mkdir -p ~/.atom
mkdir -p ~/.config/nvim ~/.config/nvim/autoload ~/.config/nvim/colors

# Files: Symlinks
dotfiles=~/dotfiles/dotfiles
rm -rf ~/.bashrc ~/.bash_profile ~/.zshrc ~/.tmux.conf ~/.vimrc ~/.psqlrc ~/.ghci ~/.emacs.d ~/.npmrc ~/.config/nvim/init.vim
ln -s $dotfiles/bashrc ~/.bashrc
ln -s $dotfiles/bash_profile ~/.bash_profile
ln -s $dotfiles/zshrc ~/.zshrc
ln -s $dotfiles/vimrc ~/.vimrc
ln -s $dotfiles/emacs.d ~/.emacs.d
ln -s $dotfiles/tmux.conf ~/.tmux.conf
ln -s $dotfiles/ghci ~/.ghci
ln -s $dotfiles/psqlrc ~/.psqlrc
ln -s $dotfiles/npmrc ~/.npmrc
ln -s $dotfiles/vimrc ~/.config/nvim/init.vim

# Files: Creations
[ ! -f ~/.env ] && touch ~/.env
[ ! -f ~/.hushlogin ] && touch ~/.hushlogin

# Files: Copies
[ ! -f ~/.vim/autoload/plug.vim ] && cp ~/dotfiles/vim/plug.vim ~/.vim/autoload/plug.vim
[ ! -f ~/.gitconfig ] && cp ~/dotfiles/dotfiles/.gitconfig ~/.gitconfig
[ ! -f ~/.atom/config.cson ] && cp $dotfiles/atom/config.cson ~/.atom/config.cson
[ ! -f ~/.atom/keymap.cson ] && cp $dotfiles/atom/keymap.cson ~/.atom/keymap.cson
[ ! -f ~/.config/nvim/colors/smyck.vim ] && cp ~/dotfiles/vim/smyck.vim ~/.config/nvim/colors/smyck.vim
[ ! -f ~/.config/nvim/autoload/plug.vim ] && cp ~/dotfiles/vim/plug.vim ~/.config/nvim/autoload/plug.vim

# Language: Go
if [ ! -f $HOME/code/dev/go/bin/go ]; then
  if $osx; then
    curl -o go.tar.gz https://storage.googleapis.com/golang/go1.6.darwin-amd64.tar.gz
  else
    curl -o go.tar.gz https://storage.googleapis.com/golang/go1.6.linux-amd64.tar.gz
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
$GOROOT/bin/go get github.com/nsf/gocode
$GOROOT/bin/go get github.com/rogpeppe/godef
$GOROOT/bin/go get golang.org/x/tools/cmd/...

# Language: Node.js
if [ ! -d "$HOME/n" ]; then
  curl -L http://git.io/n-install | bash -s -- -n -y
fi

echo "All done!"
