#!/usr/bin/env sh

PALETTE=""

# Blacks
PALETTE="$PALETTE:#252537374a4a"
PALETTE="$PALETTE:#3a3a52526b6b"

# Red
PALETTE="$PALETTE:#bdbd4a4a4a4a"
PALETTE="$PALETTE:#cccc66666666"

# Green
PALETTE="$PALETTE:#b7b7cece4242"
PALETTE="$PALETTE:#bdbde0e07777"

# Yellow
PALETTE="$PALETTE:#fefea6a63c3c"
PALETTE="$PALETTE:#ffffe8e86363"

# Blue
PALETTE="$PALETTE:#6666aaaabbbb"
PALETTE="$PALETTE:#aaaaccccbbbb"

# Magenta
PALETTE="$PALETTE:#f2f26b6b9e9e"
PALETTE="$PALETTE:#ffff58587979"

# Cyan
PALETTE="$PALETTE:#7272adad8c8c"
PALETTE="$PALETTE:#9f9fe3e3bcbc"

# White
PALETTE="$PALETTE:#ddddeeeedddd"
PALETTE="$PALETTE:#ffffffffffff"

gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/palette $PALETTE
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/background_color "#13131d1d2424"
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/foreground_color "#ddddeeeedddd"
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/bold_color "#ddddeeeedddd"
gconftool-2 -s -t bool /apps/gnome-terminal/profiles/Default/bold_color_same_as_fg "false"
gconftool-2 -s -t bool /apps/gnome-terminal/profiles/Default/use_theme_colors "false"
gconftool-2 -s -t bool /apps/gnome-terminal/profiles/Default/use_theme_background "false"

unset PALETTE