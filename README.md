dotfiles
========

My very own dotfiles :D

## Install on a new computer

```
cd ~
git clone git@github.com:kiasaki/dotfiles.git
cd dotfiles
./setup.sh
```

That's it, that's all. You are up and running with the best config possible (for kiasaki)

**Ensure homebrew is installed before**:

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## OSX defaults

For sane developer defaults on an OSX machine run `./osx`.

## Contents

Mostly config for the following:

- Vim
- Emacs
- Git
- Git helpers
- Bash shell
- Bash aliases and shortcuts
- tmux
- Ruby
- MongoDB
- PostgreSQL
- Redis
- Go

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
cd ~
git clone git@github.com:kiasaki/dotfiles.git
cd dotfiles
```

Run `setup.sh` and `osx.sh` and enter password/say yes a few times

```
./osx.sh
./setup.sh
```

Get Pages, Moom and Hues from the Mac App Store.

In System Setting, set keyboard modifier key for Caps Lock to Control.

While in System Setting, set keyboard shortcuts for switching spaces to `Ctrl+Shift+[hl]`.

Open finder, press `cmd+,` and make sure the sidebar shows only wanted items, then, configure the toolbar to only have path, view mode & search widgets.

Hold shift with the mouse over the dock's resize bar and move it to the left.

Change default shell:

```
chsh -s /bin/zsh kiasaki
```

## irssi first run

`
/server add -auto -network Freenode irc.freenode.net 6667
/network add -nick <your-nick> Freenode
/channel add -auto #chicken Freenode
/channel add -auto #scheme Freenode
/channel add -auto #go-nuts Freenode
/channel add -auto #Node.js Freenode
/network add -autosendcmd "/msg nickserv identify <password>; wait 2000" Freenode
`
