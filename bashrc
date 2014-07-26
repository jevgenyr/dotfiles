# Basic VM Bashrc

export PATH="./bin:$PATH"

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=vim
export APP_ENV=development

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

alias op='xdg-open .'

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
    echo `git status` | grep "nothing to commit" > /dev/null 2>&1
    if [ "$?" -eq "0" ]; then
      # @4 - Clean repository - nothing to commit
      echo -e "\e[0;32m$(printf '(%s)' $__git_branch)"
    else
      # @5 - Changes to working tree
      echo -e "\e[0;31m$(printf '(%s)' $__git_branch)"
    fi
  fi
}

export PS1="$cyn\u$wht at $cyn\h$wht in $ylw\W "'$(git_info)'"\n$grn[\$?]$wht $ $rst"
#export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h: \[\e[33m\]\w\[\e[0m\]\n\$ '

source $HOME/.env

cd $HOME/code/repos
