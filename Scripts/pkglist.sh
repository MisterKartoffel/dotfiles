#!/bin/bash

# WARNING: THIS SCRIPT IS REFERENCED
# BY FULL PATH IN /etc/pacman.d/hooks/96-pkglistgen_post.hook

creationTime="$(date --rfc-3339="seconds")"
pkgListDir="$HOME/.config/pkglists"

if [ ! -e "$pkgListDir" ]; then
    mkdir -p $pkgListDir/{aur,repositories,optional,flatpak}
    echo "Created $pkgListDir and subdirectories."
elif [ -f "$pkgListDir" ]; then
    echo "Error: $pkgListDir exists as a file."
    exit -1
fi

if [ -e "$pkgListDir" ]; then
    if [ ! -e "$pkgListDir/aur" ]; then
        echo "Error: $pkgListDir/aur does not exist."
        exit -1
    elif [ ! -e "$pkgListDir/repositories" ]; then
        echo "Error: $pkgListDir/repositories does not exist."
        exit -1
    elif [ ! -e "$pkgListDir/optional" ]; then
        echo "Error: $pkgListDir/optional does not exist."
        exit -1
    elif [ ! -e "$pkgListDir/flatpak" ]; then
        echo "Error: $pkgListDir/flatpak does not exist."
        exit -1
    else
        pacman -Qqten > $pkgListDir/repositories/"EXPLICIT-$creationTime.txt"
        echo "Created explicitly installed package listing at $pkgListDir/repositories/'EXPLICIT-$creationTime'"

        pacman -Qqem > $pkgListDir/aur/"AUR-$creationTime.txt"
        echo "Created explicitly installed AUR package listing at $pkgListDir/aur/'AUR-$creationTime'"

        comm -13 <(pacman -Qqdt | sort) <(pacman -Qqdtt | sort) > $pkgListDir/optional/"OPTIONAL-$creationTime.txt"
        echo "Created installed optional dependency package listing at $pkgListDir/optional/'OPTIONAL-$creationTime.txt'"

        flatpak list --app > $pkgListDir/flatpak/"FLATPAK-$creationTime.txt"
        echo "Created installed flatpak apps listing at $pkgListDir/flatpak/'FLATPAK-$creationTime.txt'"
    fi
fi

unset creationTime
unset pkgListDir
