# oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="amuse"
DISABLE_CORRECTION="true"
source $ZSH/oh-my-zsh.sh

# plugins
plugins=(git)

# bin paths
export PATH="$(brew --prefix josegonzalez/php/php55)/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - --no-rehash)"

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=vim


# aliases
alias b='bundle'
alias bi='bundle install'

# git aliases
alias gaa='git add --all'
alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push origin HEAD'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias grm="git status | grep deleted | awk '{\$1=\$2=\"\"; print \$0}' | sed 's/^[ \t]*//' | sed 's/ /\\\\ /g' | xargs git rm"

cd ~/Code/GitRepos/

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
