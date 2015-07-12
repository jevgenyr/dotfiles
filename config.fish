set -U EDITOR vim

set -x PATH $PATH . "$HOME/bin"

# Remove fish greeting
set fish_greeting

# Aliases: Common
function ll
  ls -la $argv
end
function tmuxx
  tmux -2 $argv
end
function xclip
  xclip -selection c $argv
end

# Aliases: Git
function gaa
  git add --all
end
function gc
  git commit $argv
end
function gp
  git push origin HEAD $argv
end
function gs
  git status -sb
end
function glog
  git log --all --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative
end
function gco
  git checkout $argv
end
function gcl
  git checkout -
end
function gcm
  git checkout master
end

# Helpers: Postgres
function pgup
  postgres -D /data/postgres -h 0.0.0.0
end

# Helpers: Redis
function redisup
  redis-server "$HOME/dotfiles/conf/redis.conf"
end

# Helpers: Go
set -x GOPATH "$HOME/code/go"
set -x GOROOT "$HOME/code/dev/go"
set -x PATH $PATH "$GOROOT/bin" "$GOPATH/bin"
set -x wd "$GOPATH/src/github.com"
set -x wdk "$wd/kiasaki"

# Helpers: Node.js
set -x NVM_DIR "$HOME/.nvm"
if test -e "$NVM_DIR/nvm.sh"
  source "$NVM_DIR/nvm.sh"
end

# Helpers: Ruby
eval (rbenv init -)

# Source computer specific config
source "$HOME/env.fish"

# Move closer to project
cd "$HOME/code/repos"
