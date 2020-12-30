#!/bin/bash
# dbus-update-activation-environment --systemd DISPLAY;
# 
# exec mate-session
# exec gnome-session 
# 
# setxkbmap -layout us,de -option grp:alt_shift_toggle,ctrl:nocaps;
# Win + Space toggle layout us/de
setxkbmap -layout us,de -option grp:win_space_toggle;
# remap caps lock to escape
# setxkbmap -option caps:escape &
# exec i3

# --- dwm 
# nitrogen --restore
# dwmblocks &
# picom -b &
# dunst &
# exec dbus-launch /home/moritz/Repos/melops/dwm/dwm
autorandr thinkarch &
picom -b & 
dunst & 
exec dbus-launch dwm
# --- end dwm

