#!/bin/bash

# Source for all list generating commands:
# https://wiki.archlinux.org/title/Pacman/Tips_and_tricks#List_of_installed_packages

pkgListDir="$HOME/.config/pkglists"
creationTime="$(date --rfc-3339="seconds")"

function setupListings () {
    case "$1" in
        AUR)
            pacman -Qqem > "$pkgListDir"/"$1"/"AUR-$creationTime.txt"
            if [ ! -e "$pkgListDir"/"$1"/"AUR-$creationTime.txt" ]; then
                echo "ERROR: failed to create $pkgListDir/$1/AUR-$creationTime.txt"
                exit 1
            else
                echo -e "AUR listing: $pkgListDir/$1/AUR-$creationTime.txt\n"
            fi
            ;;

        Flatpak)
            flatpak list --app > "$pkgListDir"/"$1"/"FLATPAK-$creationTime.txt"
            if [ ! -e "$pkgListDir"/"$1"/"FLATPAK-$creationTime.txt" ]; then
                echo "ERROR: failed to create $pkgListDir/$1/'FLATPAK-$creationTime.txt'"
                exit 1
            else
                echo -e "Flatpak listing: $pkgListDir/$1/FLATPAK-$creationTime.txt\n"
            fi
            ;;

        Optional)
            comm -13 <(pacman -Qqdt | sort) <(pacman -Qqdtt | sort) > "$pkgListDir"/"$1"/"OPTIONAL-$creationTime.txt"
            if [ ! -e "$pkgListDir"/"$1"/"OPTIONAL-$creationTime.txt" ]; then
                echo "ERROR: failed to create $pkgListDir/$1/OPTIONAL-$creationTime.txt"
                exit 1
            else
                echo -e "Optional dependency listing: $pkgListDir/$1/OPTIONAL-$creationTime.txt\n"
            fi
            ;;

        Explicit)
            pacman -Qqten > "$pkgListDir"/"$1"/"EXPLICIT-$creationTime.txt"
            if [ ! -e "$pkgListDir"/"$1"/"EXPLICIT-$creationTime.txt" ]; then
                echo "ERROR: failed to create $pkgListDir/$1/'EXPLICIT-$creationTime.txt'"
                exit 1
            else
                echo -e "Explicit install listing: $pkgListDir/$1/EXPLICIT-$creationTime\n"
            fi
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
            echo -e "New package listing master directory: $pkgListDir\n"
        fi

        if [ -f "$pkgListDir"/"$source" ]; then
            echo "Error: $pkgListDir/$source exists as a file."
            exit 1
        elif [ ! -e "$pkgListDir"/"$source" ]; then
            mkdir -p "$pkgListDir"/"$source"
            echo "New $source listing directory: $pkgListDir/$source"
        fi

        setupListings "$source"
    done
}

setupDirectories "AUR" "Flatpak" "Optional" "Explicit"
