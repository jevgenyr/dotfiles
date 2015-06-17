# Install mac apps & brew

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)”

brew install caskroom/cask/brew-cask
brew cask install dropbox
brew cask install skype

cat <<EOF
############################

  Now go and install the following from the app store:

  - Moom
  - Cafeine
  - Breaktime
  - The Unarchiver
  - Hues
  - Evernote
  - Slack
  - Xcode

  Then setup the following:

  - Dropbox
  - 1Password

############################
EOF
