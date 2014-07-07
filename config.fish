set -x fish_greeting ''

set -U EDITOR vim
set -U fish_user_paths $fish_user_paths /home/kiasaki/.bin

# Easier navigation: .., ..., and ~
alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~"

# Shortcuts
alias d="cd ~/Dropbox"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias p="cd ~/code/repos"

# Ruby on Rails
alias b='bundle'
alias bi='bundle install'

# Git
alias gaa='git add --all'
alias gc='git commit'
alias gp='git push origin HEAD'
alias gpr='git pull --rebase'
alias gcm='git checkout master'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gd='git diff'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status -sb' # it's fun.
alias grm="git status | grep deleted | awk '{\$1=\$2=\"\"; print \$0}' | sed 's/^[ \t]*//' | sed 's/ /\\\\ /g' | xargs git rm"

cd ~/code/repos

# Prompt line
function fish_prompt
   if not set -q __git_cb
      set __git_cb (set_color magenta)'('(git branch ^/dev/null | grep \* | sed 's/* //')')'(set_color normal)
   end

   echo #space between commands

   set_color yellow
   printf '%s' (whoami)
   set_color normal
   printf ' at '

   set_color cyan
   printf '%s' (hostname|cut -d . -f 1)
   set_color normal
   printf ' in '

   set_color $fish_color_cwd
   printf '%s %s' (prompt_pwd) $__git_cb
   set_color normal

   # Line 2
   echo
   printf '↪ '
   set_color normal
end