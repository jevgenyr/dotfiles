#!/bin/bash

command_exists() {
  type "$1" &> /dev/null;
}

osx=false
if [[ "$OSTYPE" == "darwin"* ]]; then
  osx=true
fi

if $osx; then
  brew install curl git tmux tig tree graphviz bazaar
  brew install hub
else
  if [[ `uname -r` == *"ARCH" ]]; then
    sudo pacman -S vim git curl alsa-utils tig
  else
    sudo apt-get install -y curl git tmux tig tree bzr
    sudo apt-get install -y htop
  fi
fi

# Directories
code=$HOME/code
for directory in "$HOME/.bin" "$HOME/pgdata" $code "$code/dev" "$code/repos" \
"$HOME/.vim" "$HOME/.vim/autoload" "$HOME/.vim/autoload" "$code/venv" \
"$HOME/.vim/swaps" "$HOME/.vim/backups" "$HOME/.vim/undo" "$HOME/.vim/colors"; do
  if [[ ! -d $directory ]]; then
    mkdir $directory
  fi
done

# File symlinks
for file in "bashrc" "bash_profile" "tmux.conf" "vimrc" "psqlrc" "i3" "Xresources" "xinitrc"; do
  rm -rf "$HOME/.$file"
  ln -s "$HOME/dotfiles/$file" "$HOME/.$file"
done

# File touches
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
