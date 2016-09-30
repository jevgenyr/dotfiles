#!/bin/bash
pushd ~ >/dev/null

# Install deps for building suckless apps
sudo apt-get install xorg-dev

# Install st
if [ ! -d $HOME/code/repos/st ]; then
  git clone git://git.suckless.org/st ~/code/repos/st
fi
ln -s ~/dotfiles/support/st-config.h ~/code/repos/st/config.h
cd ~/code/repos/st
sudo make clean install

# Install slock
if [ ! -d $HOME/code/repos/slock ]; then
  git clone git://git.suckless.org/slock ~/code/repos/slock
fi
cd ~/code/repos/slock
sudo make clean install

# Install Input font
cp ~/dotfiles/support/input_font /usr/share/fonts/truetype/Input
fc-cache -f -v

popd >/dev/null
