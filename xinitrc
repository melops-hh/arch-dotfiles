#!/bin/bash
# dbus-update-activation-environment --systemd DISPLAY;
# 
# /home/moritz/.screenlayout/work2.sh
# /home/moritz/.screenlayout/default.sh
#exec mate-session
# exec gnome-session 
# 
# setxkbmap -layout us,de -option grp:alt_shift_toggle,ctrl:nocaps;
# Win + Space toggle layout us/de
#setxkbmap -layout us,de -option grp:win_space_toggle,ctrl:nocaps;
# remap caps lock to escape
# setxkbmap -option caps:escape &
# exec i3

# --- dwm 
# nitrogen --restore
# dwmblocks &
# picom -b &
# dunst &
# exec dbus-launch /home/moritz/Repos/melops/dwm/dwm
# --- end dwm

# exec /home/moritz/dwm/dwm
# exec /home/moritz/dwm_testing/dwm
