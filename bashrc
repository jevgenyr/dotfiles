export EDITOR=vim

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

#####
# Aliases
alias ll='ls -la'
alias clean='find . -name "*.DS_Store" -type f -delete'
alias tmux='tmux -2'
alias xclip='xclip -selection c'

#####
# Git aliases
alias gaa='git add --all'
alias gc='git commit'
alias gp='git push origin HEAD'
alias gs='git status -sb'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gco='git checkout'
alias gcl='git checkout -'
alias gcm='git checkout master'

#####
# Ansible aliases
alias asv='ansible-vault '
alias asp='ansible-playbook --ask-vault-pass -v '

#####
# Postgres helpers
alias pgup="postgres -D /data/postgres"

#####
# Redis helpers
alias redisup="redis-server $HOME/dotfiles/conf/redis.conf"

#####
# Go helpers
export GOPATH=$HOME/code/go
export GOROOT=$HOME/code/dev/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export wd=$GOPATH/src/github.com
function gogetk {
  `go get github.com/kiasaki/$1`
}

#####
# Node.js helpers
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
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
# Shell PS1 line & base dir & .env
source $HOME/dotfiles/prompt.sh

# Those are computer specific config / secrets
source $HOME/.env

# Have a bin folder in my home directory
export PATH="$PATH:$HOME/.bin"

# Source completions
source $HOME/dotfiles/completion/git.sh
source $HOME/dotfiles/completion/hub.sh

# Get closer to projects
cd $HOME/code/repos
