# Mah verey own bashrc
export PATH="~/.bin:.:/usr/local/bin:$PATH"
# Put Cask in path for emacs
export PATH="$HOME/.cask/bin:$PATH"

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=vim

stty start undef
stty stop undef


#####
# Aliases
#####
  alias ll='ls -la'
  alias be='bundle exec '
  alias op='xdg-open .'
  alias clean='find . -name "*.DS_Store" -type f -delete'
  alias em='emacs '
  alias caskup='(cd $HOME/.emacs.d/; $HOME/.cask/bin/cask install)'


#####
# Git aliases
#####
  alias gaa='git add --all'
  alias gc='git commit'
  alias gp='git push origin HEAD'
  alias gpr='git pull --rebase'
  alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
  alias gd='git diff'
  alias gca='git commit -a'
  alias gco='git checkout'
  alias gcm='git checkout master'
  alias gb='git branch'
  alias gs='git status -sb'
  alias gfr='git fetch && git rebase'

#####
# Ansible aliases
#####
  alias asv='ansible-vault '
  alias asp='ansible-playbook --ask-vault-pass -v '

#####
# Postgres helpers
#####
  alias pgup="postgres -D $HOME/pgdata"


#####
# Go helpers
#####
  export GOPATH=$HOME/code/go
  export GOROOT=$HOME/code/dev/go
  export PATH=$PATH:$GOROOT/bin
  export PATH=$PATH:$GOPATH/bin
  export wd=$GOPATH/src/github.com/kiasaki


#####
# Node.js helpers
#####
  export NVM_DIR="/Users/kiasaki/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"


#####
# Python helpers
#####
  # New virtual env
  export VENV_PYTHON=$HOME/code/dev/pypy/bin/pypy
  export VENV_HOME=$HOME/code/venv
  function venvn {
    if [[ ! -d $VENV_HOME ]]; then
      mkdir -p $VENV_HOME
    fi
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
#####
  blk='\[\e[0;30m\]' # Black - Regular
  red='\[\e[0;31m\]' # Red
  grn='\[\e[0;32m\]' # Green
  ylw='\[\e[0;33m\]' # Yellow
  blu='\[\e[0;34m\]' # Blue
  pur='\[\e[0;35m\]' # Purple
  cyn='\[\e[0;36m\]' # Cyan
  wht='\[\e[0;37m\]' # White
  rst='\[\e[0m\]'    # Text Reset

  function git_info {
    git rev-parse --is-inside-work-tree &> /dev/null;
    if [ $? -eq 0 ]; then
      __git_branch="`git branch 2> /dev/null | grep -e ^* | sed 's/* //'`"
      echo "$(printf '(%s)' $__git_branch)"
    fi
  }
  function git_changes {
    git rev-parse --is-inside-work-tree &> /dev/null;
    if [ $? -eq 0 ]; then
      echo `git status` | grep "nothing to commit" > /dev/null 2>&1
      if [ $? -ne 0 ]; then
        echo '<!> '
      fi
    fi
  }

  # Nice PS1 line
  export PS1="$cyn\u$wht at $cyn\h$wht in $ylw\W $red"'$(git_changes)'"$grn"'$(git_info)'"\n$grn[\$?]$wht $ $rst"

  # Those are computer specific config / secrets
  source $HOME/.env

  # Source completions
  source $HOME/dotfiles/completion/git.sh
  source $HOME/dotfiles/completion/hub.sh

  # Get closer to projects
  cd $HOME/code/repos

