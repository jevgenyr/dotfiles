code=$HOME/code

# Sudo directories
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
  "$HOME/.vim" "$HOME/.vim/autoload" "$HOME/.vim/swaps" "$HOME/.vim/colors" \
  "$HOME/.vim/syntax"; do
  if [[ ! -d $directory ]]; then
    mkdir $directory
  fi
done

# File symlinks
for file in "bashrc" "bash_profile" "tmux.conf" "vimrc" "psqlrc" "ghci" "nvimrc"; do
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
if [ ! -f "$HOME/.vim/syntax/solo.vim" ]; then
  cp "$HOME/dotfiles/vim/solo.vim" "$HOME/.vim/syntax/solo.vim"
fi
if [ ! -f "$HOME/.gitconfig" ]; then
  cp "$HOME/dotfiles/gitconfig" "$HOME/.gitconfig"
fi
if [ ! -f "$HOME/.config/fish/functions/fish_prompt.fish" ]; then
  mkdir -p "$HOME/.config/fish/functions"
  cp "$HOME/dotfiles/conf/fish/fish_prompt.fish" "$HOME/.config/fish/functions/fish_prompt.fish"
fi
