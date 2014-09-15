# Basic VM Bashrc

export PATH="~/.bin:.:/usr/local/bin:$PATH"

# Go
export GOPATH=$HOME/code/go
export GOROOT=$HOME/code/dev/go
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOPATH/bin
export wd=$GOPATH/src/github.com/kiasaki

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=vim

# Git aliases
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

alias op='xdg-open .'
alias clean='find . -name "*.DS_Store" -type f -delete'

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

# Get closer to projects
cd $HOME/code/repos
