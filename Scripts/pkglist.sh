#!/bin/bash

pkgListDir="$HOME/.config/pkglists"

function setupListings () {
    local creationTime
    creationTime="$(date --rfc-3339="seconds")"

    case "$1" in
        aur)
            pacman -Qqem > "$pkgListDir"/"$1"/"AUR-$creationTime.txt"
            echo "Created explicitly installed AUR package listing at $pkgListDir/$1/'AUR-$creationTime'"
            ;;

        flatpak)
            flatpak list --app > "$pkgListDir"/"$1"/"FLATPAK-$creationTime.txt"
            echo "Created installed Flatpak apps listing at $pkgListDir/$1/'FLATPAK-$creationTime.txt'"
            ;;

        optional)
            comm -13 <(pacman -Qqdt | sort) <(pacman -Qqdtt | sort) > "$pkgListDir"/"$1"/"OPTIONAL-$creationTime.txt"
            echo "Created installed optional dependency package listing at $pkgListDir/$1/'OPTIONAL-$creationTime.txt'"
            ;;

        repositories)
            pacman -Qqten > "$pkgListDir"/"$1"/"EXPLICIT-$creationTime.txt"
            echo "Created explicitly installed package listing at $pkgListDir/$1/'EXPLICIT-$creationTime'"
            ;;

        *)
            echo "Error: $1 undefined as a source."
            exit 1
            ;;
    esac

    unset creationTime
}

function setupDirectories () {
    for source in "$@";
    do
        if [ -f "$pkgListDir" ]; then
            echo "Error: $pkgListDir exists as a file."
            exit 1
        elif [ ! -e "$pkgListDir" ]; then
            mkdir "$pkgListDir"
            echo "Package listing master directory created at $pkgListDir"
        fi

        if [ -f "$pkgListDir"/"$source" ]; then
            echo "Error: $pkgListDir/$source exists as a file."
            exit 1
        elif [ ! -e "$pkgListDir"/"$source" ]; then
            mkdir -p "$pkgListDir"/"$source"
            echo "Created $source listing directory at $pkgListDir/$source"
            setupListings "$source"
        fi
    done
}

setupDirectories "aur" "flatpak" "optional" "repositories"

unset pkgListDir
unset setupDirectories
unset setupListings
