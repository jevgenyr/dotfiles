# Frederic's .zsrhc
# https://github.com/kiasaki/dotfiles

# oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="../../dotfiles/my_zsh_theme"
DISABLE_CORRECTION="true"
source $ZSH/oh-my-zsh.sh

# oh-my-zsh plugins
plugins=(git)

# bin paths
export PATH="$HOME/.bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"

# env vars
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=vim

# aditionnal sources
source $HOME/.aliases
eval "$(rbenv init - --no-rehash)"
