#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# Startup applications, does not work, use rc.lua
# /usr/bin/redshift &
# /usr/bin/firefox &

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Use .Xmodmap to map keyboard
if [ -s ~/.Xmodmap ]; then
  xmodmap ~/.Xmodmap
fi

# Load .Xresources manually (required when not using a desktop environment)
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# exec gnome-session
# exec startkde
# exec startxfce4
exec awesome
