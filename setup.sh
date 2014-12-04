#!/bin/bash

command_exists () {
  type "$1" &> /dev/null;
}

if command_exists curl; then
  echo "Skipping: Curl already installed"
else
  echo "Installing: Curl"
  sudo apt-get install curl
fi
if command_exists git; then
  echo "Skipping: Git already installed"
else
  echo "Installing: Git"
  sudo apt-get install git
fi
if [[ ! -d "$HOME/.cask" ]]; then
  echo "Installing: Cask"
  `curl -fsSkL https://raw.github.com/cask/cask/master/go | python`
else
  echo "Skipping: Cask already installed"
fi

code=$HOME/code
for directory in $code "$HOME/.bin" "$HOME/pgdata" "$code/dev" "$code/repos" "$code/libs"; do
  if [[ ! -d $directory ]]; then
    mkdir $directory
    echo "Installing: Creating directory $directory"
  else
    echo "Skipping: Directory $directory exists"
  fi
done

# Setup shell & dotfiles
for file in "bashrc" "tmux.conf" "vimrc" "gvimrc" "vim" "gitconfig" "bash_profile" "psqlrc" "emacs.d"; do
  rm -rf "$HOME/.$file"
  ln -s "$HOME/dotfiles/$file" "$HOME/.$file"
  echo "Installing: Linking file .$file"
done

for file in "$HOME/.env" "$HOME/.hushlogin"; do
  if [ ! -f $file ]; then
    touch $file
  fi
done

# Install composer
if command_exists composer; then
  echo "Skipping: Composer alredy installed"
else
  cd "$code/dev"
  curl -sS https://getcomposer.org/installer | php
  ln -s $code/dev/composer.phar $HOME/.bin/composer
  echo "Installing: Composer in $code/dev/composer.phar"
fi
