brew tap petere/postgresql
brew install curl git tmux tig tree graphviz bazaar hub vim
brew install rabbitmq redis ansible jq rbenv rethinkdb
brew install the_silver_searcher postgresql-9.4 sqlite httpie
brew install ssh-copy-id mongodb mcrypt ghc

code=$HOME/code
 
mkdir -p "$code/dev"

# Go
if [ ! -f "$code/dev/go/bin/go" ]; then
	curl -o go.tar.gz https://storage.googleapis.com/golang/go1.4.2.darwin-amd64-osx10.8.tar.gz
	tar -xzf go.tar.gz
	mv go "$code/dev"
	rm go.tar.gz
fi

export GOROOT=$code/dev/go
export GOPATH=$code/go
export GOBIN=$HOME/bin

echo "Fetching muun, gin, goreman, hk"
$code/dev/go/bin/go get github.com/kiasaki/muun
$code/dev/go/bin/go get github.com/codegangsta/gin
$code/dev/go/bin/go get github.com/mattn/goreman
$code/dev/go/bin/go get github.com/heroku/hk

# nvm
(git clone https://github.com/creationix/nvm.git ~/.nvm && cd ~/.nvm && git checkout `git describe --abbrev=0 --tags`)
. ~/.nvm/nvm.sh
nvm install 0.12.4
