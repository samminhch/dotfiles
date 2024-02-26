#!/usr/bin/sh

swayidle timeout 150 '/usr/bin/gtklock -d -i' \
    timeout 300 'hyprctl "dispatch dpms off"' \
    timeout 360 'systemctl suspend' \
    resume 'hyprctl "dispatch dpms on"' \
    before-sleep '/usr/bin/gtklock -d -i'
