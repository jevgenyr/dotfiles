#!/bin/sh

xset +fp /usr/local/lib/X11/fonts/terminus
xset fp refresh

# Screensavers off
xset -dpms
xset s off
xset s noblank
xset s noexpose

#setterm -blank 0
#setterm -powerdown 0

# Key repeat rate
xset r rate 340 25

# Ctrl-Alt-Bksp to kill x
setxkbmap -option terminate:ctrl_alt_bksp &

# Update resources
xrdb -merge ~/.Xresources

# Console
xsetroot -cursor_name left_ptr
xsetroot -solid '#80a0af'

xmodmap -e "remove Lock = Caps_Lock"
xmodmap -e "keysym Caps_Lock = Control_L"
xmodmap -e "add Control = Control_L"

# urxvt daemon
#urxvtd -q -o -f &

while true
do
	VOL=$(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')
	LOCALTIME=$(date +%Z\=%Y-%m-%dT%H:%M)
	OTHERTIME=$(TZ=Europe/London date +%Z\=%H:%M)
	IP=$(for i in `ip r`; do echo $i; done | grep -A 1 src | tail -n1) # can get confused if you use vmware
	TEMP="$(($(cat /sys/class/thermal/thermal_zone0/temp) / 1000))C"

	if acpi -a | grep off-line > /dev/null
	then
		BAT="Bat. $(acpi -b | awk '{ print $4 " " $5 }' | tr -d ',')"
		xsetroot -name "$IP $BAT $VOL $TEMP $LOCALTIME $OTHERTIME"
	else
		xsetroot -name "$IP $VOL $TEMP $LOCALTIME $OTHERTIME"
	fi
	sleep 20s
done &


# xcompmgr
xcompmgr -cCfFD 3 &

exec ratpoison
