export EDITOR=nvim
export PATH="/usr/bin:/bin:/usr/local/bin:/usr/sbin:/sbin"
export PATH=".:$HOME/bin:$PATH"

stty start undef
stty stop undef

# History
export HISTSIZE=5000
export HISTFILESIZE=10000
export HISTCONTROL=ignoreboth:erasedups # no duplicate entries
shopt -s histappend                     # append history file
export PROMPT_COMMAND="history -a"      # update histfile after every command

# Ls
platform=`uname`
if [[ $platform == 'linux' ]]; then
  alias ls='ls --color=auto -p'
elif [[ $platform == 'Darwin' ]]; then
  alias ls='ls -Gp'
fi

kernel_name=`uname -r`
if [[ $kernel_name == *"ARCH" ]]; then
  export KEYMAP=ca_multi.map.gz
  sudo localectl set-keymap --no-convert ca_multi
  if [[ -z "$DISPLAY" ]]; then
    sudo localectl set-x11-keymap --no-convert ca "" multi
  fi
fi

which setxkbmap>/dev/null && setxkbmap -option caps:ctrl_modifier

#####
# Aliases
alias ll='ls -la'
alias vim='nvim'
alias tmux='tmux -2'
alias xclip='xclip -selection c'

#####
# Git aliases
alias gaa='git add --all'
alias gc='git commit'
alias gca='git commit --amend --reuse-message=HEAD'
alias gp='git push origin HEAD'
alias gs='git status -sb'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gco='git checkout'
alias gcl='git checkout -'
alias gcm='git checkout master'
alias gphm='git push heroku master'

#####
# Tmux helpers
tn() { [ -n "$1" ] && tmux new -s "$1" || tmux new }
ta() { [ -n "$1" ] && tmux attach -t "$1" || tmux attach }

#####
# Ansible aliases
alias asv='ansible-vault '
alias asp='ansible-playbook --ask-vault-pass -v '

#####
# Postgres helpers
alias pgup="postgres -D /data/postgres -h 0.0.0.0"

#####
# Redis helpers
alias redisup="redis-server $HOME/dotfiles/conf/redis.conf"

#####
# InfluxDB helpers
alias influxup="influxd -config /usr/local/etc/influxdb.conf"

#####
# Go helpers
export GOPATH=$HOME/code/go
export GOROOT=$HOME/code/dev/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export wd=$GOPATH/src/github.com
export wdk=$GOPATH/src/github.com/kiasaki

#####
# Node.js helpers
export NVM_DIR="$HOME/.nvm"
[[ -f "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
alias dienode="ps -ax | grep node | head -1 | sed 's/^ //' | cut -d ' ' -f 1 | xargs kill | echo"

#####
# Python helpers
# New virtual env
export VENV_PYTHON=`which python`
export VENV_HOME=$HOME/code/venv
function venvn {
  (cd $VENV_HOME && virtualenv --python=$VENV_PYTHON $1)
}
# Activate specific virtual env
function venva {
  . "$HOME/code/venv/$1/bin/activate"
}
# Deactivate shortcut
alias venvd='deactivate'

#####
# Ruby helpers
if [ -n "$BASH_VERSION" ] || [ -n "$ZSH_VERSION" ]; then
  if [[ -d /usr/local/share/chruby ]]; then
    source /usr/local/share/chruby/chruby.sh
    source /usr/local/share/chruby/auto.sh
    RUBIES+=(~/.rbenv/versions/*)
  fi
fi


#####
# Shell PS1 line & base dir & .env

#source $HOME/dotfiles/prompt.sh
export PS1="\[\e[0;36m\]\W>\[\e[0m\] "

# Source completions
source $HOME/dotfiles/completion/git.sh
source $HOME/dotfiles/completion/hub.sh

# Load computer specific config & secrets
source $HOME/.env

# Get closer to projects
cd $HOME/code/repos
