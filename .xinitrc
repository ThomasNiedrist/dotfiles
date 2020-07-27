#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
setxkbmap de
xset r rate 300 50
xrdb --merge ~/.Xresources
exec dwm
exec picom -b
exec feh --bg-scale /home/thomas/.config/Wallpaper.jpg
