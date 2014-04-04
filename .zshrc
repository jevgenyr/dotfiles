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
export PATH="$(brew --prefix josegonzalez/php/php55)/bin:$PATH"
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

# ssh agent
SSH_ENV=$HOME/.ssh/environment
function start_agent {
  echo "Initializing new SSH agent..."
  /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
  echo succeeded
  chmod 600 "${SSH_ENV}"
  . "${SSH_ENV}" > /dev/null
  /usr/bin/ssh-add
}
if [ -f "${SSH_ENV}" ]; then
  . "${SSH_ENV}" > /dev/null
  ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
    start_agent;
  }
else
  start_agent;
fi

cd ~/Code/GitRepos/
