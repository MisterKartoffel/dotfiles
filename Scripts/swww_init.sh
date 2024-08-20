#!/bin/sh

# This allows you to control which image to init the daemon with according
# to the time of day. You may change the match cases as you see fit.
# This currently only takes hours into account, but it should be easy to
# modify to also use minutes, or days of the week, if you want.
#
# Use it simply by calling this script instead of swww-daemon

WALLPAPER=$(find /home/felipe/Wallpapers -type f | shuf -n 1)

swww img $WALLPAPER											# Set new wallpaper
cp --remove-destination $WALLPAPER /usr/share/sddm/themes/sugar-candy/Backgrounds/background.png	# Update SDDM background to new wallpaper
cp --remove-destination $WALLPAPER /home/felipe/.config/hypr/background.png				# Update hyprlock background to new wallpaper
killall waybar && nohup waybar &									# Kill and restart waybar
