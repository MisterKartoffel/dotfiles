#!/bin/sh

WALLPAPER=$(find /home/felipe/Pictures/Wallpapers -type f | shuf -n 1)

swww img $WALLPAPER                                                                                 # Set new wallpaper
cp -f $WALLPAPER /usr/share/sddm/themes/sugar-candy/Backgrounds/background.png	                    # Update SDDM background to new wallpaper
ln -f $WALLPAPER /home/felipe/.config/hypr/background.png				                            # Update hyprlock background to new wallpaper
killall waybar && nohup waybar &                                									# Kill and restart waybar
