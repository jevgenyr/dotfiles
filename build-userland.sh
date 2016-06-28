set -e

extroot="$HOME/code/repos/ext"

mkdir -p "$HOME/bin"
mkdir -p "$extroot"

# noice - file explorer
if [ ! -d "$extroot/noice" ]; then
  git clone git://git.2f30.org/noice.git "$extroot/noice"
fi
pushd "$extroot/noice"
make PREFIX="$HOME"
sudo make install PREFIX="$HOME"
popd

# iris - tiny scheme interpreter
if [ ! -d "$extroot/iris" ]; then
  git clone git://git.2f30.org/iris.git "$extroot/iris"
fi
pushd "$extroot/iris"
make
cp iris "$HOME/bin"
popd

# pass - the standard unix password manager
if [ ! -d "$extroot/pass" ]; then
  git clone https://git.zx2c4.com/password-store "$extroot/pass"
fi
pushd "$extroot/pass"
sudo make install PREFIX=/usr/local
popd

# sbase - suckless unix tools
if [ ! -d "$extroot/sbase" ]; then
  git clone git://git.suckless.org/sbase "$extroot/sbase"
fi
pushd "$extroot/sbase"
# sudo make install PREFIX="$HOME"
popd

# stagit - static git page generator
# git clone git://git.2f30.org/stagit.git

# abduco - a tool for session {at,de}tach support
if [ ! -d "$extroot/abduco" ]; then
  git clone https://github.com/martanne/abduco.git "$extroot/abduco"
fi
pushd "$extroot/abduco"
# Add -D_DARWIN_C_SOURCE to CFLAGS on Darwin
make PREFIX="$HOME"
sudo make install PREFIX="$HOME"
popd

# dvtm - dynamic virtual terminal manager
if [ ! -d "$extroot/dvtm" ]; then
  git clone https://github.com/martanne/dvtm.git "$extroot/dvtm"
fi
pushd "$extroot/dvtm"
# Add -D_DARWIN_C_SOURCE to CFLAGS on Darwin
make LIBS="-lc -lutil -lncurses" PREFIX="$HOME"
sudo make install PREFIX="$HOME"
popd
