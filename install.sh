#!/bin/sh

# Setup needed folders
if [ ! -d "$HOME/.bin" ]; then
	mkdir "$HOME/.bin"
fi
if [ ! -d "$HOME/dev" ]; then
	mkdir "$HOME/dev"
fi
if [ ! -d "$HOME/code" ]; then
	mkdir "$HOME/code"
fi

# Install necessary folders
sudo apt-get install vim git curl zsh php5 php5-json

# Install composer for php
cd "$HOME/dev"
rm "$HOME/.bin/composer"
curl -sS https://getcomposer.org/installer | php
cd "$HOME/.bin"
ln -s $HOME/dev/composer.phar composer

# Install oh-my-zsh & change default shell
if [ ! -d "$HOME/.oh-my-zsh" ]; then
	curl -L http://install.ohmyz.sh | sh
	sudo chsh -s $(which zsh) kiasaki
	rm $HOME/.zshrc
fi

# Install rbenv if it's not there
if [ ! -d "$HOME/.rbenv" ]; then
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
fi

# Symlink EVERYTHING!
DOTFILES="$HOME/dotfiles"

rm $HOME/.zshrc
rm $HOME/.tmux.conf
rm $HOME/.gitconfig
rm $HOME/.hushlogin
rm $HOME/.vimrc
rm $HOME/.aliases
rm -r $HOME/.vim
ln -s $DOTFILES/.zshrc $HOME/.zshrc
ln -s $DOTFILES/.tmux.conf $HOME/.tmux.conf
ln -s $DOTFILES/.gitconfig $HOME/.gitconfig
ln -s $DOTFILES/.hushlogin $HOME/.hushlogin
ln -s $DOTFILES/.vimrc $HOME/.vimrc
ln -s $DOTFILES/.aliases $HOME/.aliases
ln -s $DOTFILES/.vim $HOME/.vim

echo "All done mista!"
