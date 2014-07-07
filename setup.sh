#!/bin/sh

sudo apt-get install curl git

code="$HOME/code"

for directory in $code "$HOME/.bin" "$code/dev" "$code/repos" "$code/libs"; do
  if [ ! -d $directory ]; then
    mkdir $directory
  fi
done
if [[ -f "$HOME/.env" ]]; then
  touch $HOME/.env
fi

# Setup shell
sudo apt-add-repository ppa:fish-shell/release-2
sudo apt-get update
sudo apt-get install fish
chsh -s /usr/bin/fish
mkdir -p ~/.config/fish/functions/
ln -s ~/dotfiles/config.fish ~/.config/fish/config.fish
ln -s ~/dotfiles/fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish

# Install composer
rm "$HOME/.bin/composer"
cd "$code/dev"
curl -sS https://getcomposer.org/installer | php
ln -s $code/dev/composer.phar $HOME/.bin/composer
