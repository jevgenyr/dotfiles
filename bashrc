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

txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
txtrst='\e[0m'    # Text Reset

function color_my_prompt {
  local __tu="$txtcyn\u"
  local __th="$txtwht at $txtcyn\h"
  local __tl="$txtwht in $txtylw\w"
  local __in_git=`git rev-parse --is-inside-work-tree &> /dev/null`
  local __git_branch="`git branch 2> /dev/null | grep -e ^* | sed 's/* //'`"
  if $__in_git; then
    __tg="$txtpur ($__git_branch)"
  else
    __tg=""
  fi

  local __tnl="\n$txtgrn[\$?]$txtwht ↪ "
  local __tend="$txtrst"
  export PS1="$__tu$__th$__tl$__tg$__tnl$__tend"
}
color_my_prompt
#export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h: \[\e[33m\]\w\[\e[0m\]\n\$ '
