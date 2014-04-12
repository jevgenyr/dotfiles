#!/bin/sh

if [ ! -d "$HOME/.bin" ]; then
	mkdir "$HOME/.bin"
fi
if [ ! -d "$HOME/dev" ]; then
	mkdir "$HOME/dev"
fi
if [ ! -d "$HOME/code" ]; then
	mkdir "$HOME/code"
fi

sudo apt-get install vim git curl zsh php5 php5-json

cd "$HOME/dev"
rm "$HOME/.bin/composer"
curl -sS https://getcomposer.org/installer | php
cd "$HOME/.bin"
ln -s $HOME/dev/composer.phar composer

if [ ! -d "$HOME/.oh-my-zsh" ]; then
	curl -L http://install.ohmyz.sh | sh
	sudo chsh -s $(which zsh) kiasaki
	rm $HOME/.zshrc
fi

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
