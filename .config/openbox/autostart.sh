#!/bin/bash

#cairo-compmgr &
xrandr  --output VGA1 --auto --output HDMI1 --auto --right-of VGA1 &
sleep 2
xscreensaver -nosplash &
parcellite &

sleep 2                                                                  # allow Openbox to fully load to then load desktop apps
urxvtd -q -f -o

if [ $(pgrep Thunar) ];                                                  # using Thunar as automounter
 then true;
 else Thunar --daemon &
fi

feh --bg-scale /home/ace/store/wall/Outflow.jpg &    # set background
(sleep 2s && tint2) &                                                                   # panel
#(sleep 2s && trayer --expand true --transparent true --alpha 255 --margin 130 --widthtype request --edge bottom --align right --heighttype pixel --height 24 --tint 000000 --SetDockType true) &           # tray dock
conky --daemonize &
pidgin &
#gnome-do &
DESKTOP_ENV="OPENBOX"
if which /usr/lib64/openbox/xdg-autostart >/dev/null; then
  /usr/lib64/openbox/xdg-autostart $DESKTOP_ENV
fi
source /etc/profile
