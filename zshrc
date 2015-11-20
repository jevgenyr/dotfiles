# Keep 5000 lines of history ignoring duplicates
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.history
setopt inc_append_history hist_ignore_dups

# Error if glob does not match.
setopt nomatch

# Allow comments in interactive shell.
setopt interactive_comments

# No.
unsetopt beep

# Vim line editing.
bindkey -v

# Initialize completion.
autoload -Uz compinit && compinit

# Prompt with single character on the left, normally green, magenta over SSH,
# red after a failed command. Directory and git branch on the right.
setopt prompt_subst
autoload colors && colors
[[ -n "$SSH_CLIENT" ]] && _prompt_ssh_color="$fg[magenta]"
_prompt_git_branch() {
  [[ -f .git/HEAD ]] || return 0
  local head
  read head < .git/HEAD
  case "$head" in
    ref:*)
      echo ":${head#*/*/}"
      ;;
    *)
      echo ":${head:0:7}"
      ;;
  esac
}
PROMPT='%{%(?.$fg[green]$_prompt_ssh_color.$fg[red])%}»%{$reset_color%} '
RPROMPT='%{$fg[blue]%}%-50<…<%~%{$fg[yellow]%}$(_prompt_git_branch)%{$reset_color%}'

# Print a newline before every prompt after the first one.
_newline_precmd() { _newline_precmd() { echo } }

# Color ls output
export CLICOLOR=1

export EDITOR=vim
export PATH="/usr/bin:/bin:/usr/local/bin:/usr/sbin:/sbin"
export PATH="$PATH:~/bin:."

#####
# Aliases
alias ll='ls -la'
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
venvn() { (cd $VENV_HOME && virtualenv --python=$VENV_PYTHON $1) }
# Activate specific virtual env
venva() { . "$HOME/code/venv/$1/bin/activate" }
# Deactivate shortcut
alias venvd='deactivate'

#####
# Ruby helpers
if [ -n "$BASH_VERSION" ] || [ -n "$ZSH_VERSION" ]; then
  if [[ -d /usr/local/share/chruby ]]; then
    source /usr/local/share/chruby/chruby.sh
    source /usr/local/share/chruby/auto.sh
  fi
fi

# Load computer specific config & secrets
source $HOME/.env

# Get closer to projects
cd $HOME/code/repos
