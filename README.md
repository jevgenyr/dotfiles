dotfiles
========

My very own dotfiles ^^,

## Setting up a new computer

**Ensure homebrew is installed first**:

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Then you simply need to grab git, this repo and run `setup.sh`

```
brew install git
git clone https://github.com/kiasaki/dotfiles.git ~/dotfiles
cd ~/dotfiles
./setup.sh
```

That's it, that's all. You are up and running with the best config possible (for kiasaki)


## OSX defaults

For sane developer defaults on an OSX machine run `./setup-osx.sh`.

## On a remote ubuntu server or virtual machine

There is a separate `setup-server.sh` that has nothing "osx" related but still
gives you go, nodejs, emacs, vim, psql & git config with a comfy bash shell.

```
wget https://raw.githubusercontent.com/kiasaki/dotfiles/master/setup-server.sh
chmod +x setup-server.sh
./setup-server.sh
```

_It'll even clone the `dotfiles` for you! Hurray for less steps and automation!_

## Contents

Mostly configuration for the following:

- vim
- emacs
- git
- bash + aliases and helpers
- zsh + aliases and helpers
- tmux
- psql
- redis
- go
- nodejs
- ruby

## Step by step new osx instructions

Get Homebrew (runs xcode-select also)

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Create an ssh key, copy it, open safari and add it to Github & Heroku.

```
ssh-keygen
cat ~/.ssh/id_rsa.pub | pbcopy
```

Clone `dotfiles` using git.

```
git clone git@github.com:kiasaki/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

Run `setup.sh` and `setup-osx.sh` and enter password/say yes a few times

```
./setup-osx.sh
./setup.sh
```

Get Pages, Moom, BreakTime and Hues from the Mac App Store.

In System Setting, set keyboard modifier key for Caps Lock to Control.

While in System Setting, set keyboard shortcuts for switching spaces to `Ctrl+Shift+[hl]`.

Open finder, press `Cmd+,` and make sure the sidebar shows only wanted items, then, configure the toolbar to only have path, view mode & search widgets.

Hold shift with the mouse over the dock's resize bar and move it to the left.

Change default shell:

```
chsh -s /bin/zsh kiasaki
```

## irssi first run

```
/server add -auto -network Freenode irc.freenode.net 6667
/network add -nick <your-nick> Freenode
/channel add -auto #chicken Freenode
/channel add -auto #scheme Freenode
/channel add -auto #go-nuts Freenode
/channel add -auto #Node.js Freenode
/network add -autosendcmd "/msg nickserv identify <password>; wait 2000" Freenode
```
