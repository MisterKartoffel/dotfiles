#!/bin/bash

# Source for all list generating commands:
# https://wiki.archlinux.org/title/Pacman/Tips_and_tricks#List_of_installed_packages

pkgListDir="$HOME/.config/pkglists"
creationTime="$(date --rfc-3339="seconds")"

function setupListings () {
    case "$1" in
        aur)
            pacman -Qqem > "$pkgListDir"/"$1"/"AUR-$creationTime.txt"
            echo -e "Created explicitly installed AUR package listing at $pkgListDir/$1/'AUR-$creationTime'\n"
            ;;

        flatpak)
            flatpak list --app > "$pkgListDir"/"$1"/"FLATPAK-$creationTime.txt"
            echo -e "Created installed Flatpak apps listing at $pkgListDir/$1/'FLATPAK-$creationTime.txt'\n"
            ;;

        optional)
            comm -13 <(pacman -Qqdt | sort) <(pacman -Qqdtt | sort) > "$pkgListDir"/"$1"/"OPTIONAL-$creationTime.txt"
            echo -e "Created installed optional dependency package listing at $pkgListDir/$1/'OPTIONAL-$creationTime.txt'\n"
            ;;

        explicit)
            pacman -Qqten > "$pkgListDir"/"$1"/"EXPLICIT-$creationTime.txt"
            echo -e "Created explicitly installed package listing at $pkgListDir/$1/'EXPLICIT-$creationTime'\n"
            ;;

        *)
            echo "Error: $1 undefined as a source."
            exit 1
            ;;
    esac
}

function setupDirectories () {
    for source in "$@";
    do
        if [ -f "$pkgListDir" ]; then
            echo "Error: $pkgListDir exists as a file."
            exit 1
        elif [ ! -e "$pkgListDir" ]; then
            mkdir "$pkgListDir"
            echo -e "Package listing master directory created at $pkgListDir\n"
        fi

        if [ -f "$pkgListDir"/"$source" ]; then
            echo "Error: $pkgListDir/$source exists as a file."
            exit 1
        elif [ ! -e "$pkgListDir"/"$source" ]; then
            mkdir -p "$pkgListDir"/"$source"
            echo "Created $source listing directory at $pkgListDir/$source"
        fi

        setupListings "$source"
    done
}

setupDirectories "aur" "flatpak" "optional" "explicit"

unset pkgListDir
unset creationTime
unset setupListings
unset setupDirectories
