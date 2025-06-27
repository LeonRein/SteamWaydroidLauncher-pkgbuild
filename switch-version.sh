#!/bin/bash
# Helper script to switch between git and stable PKGBUILD versions

case "$1" in
    git)
        echo "Switching to git version..."
        if [ -f "PKGBUILD-git" ]; then
            cp PKGBUILD-git PKGBUILD
            echo "Git version is now active"
        else
            echo "PKGBUILD-git not found! Current PKGBUILD is already the git version."
        fi
        ;;
    stable)
        echo "Switching to stable version..."
        if [ -f "PKGBUILD-stable" ]; then
            # Backup current PKGBUILD as git version if it doesn't exist
            if [ ! -f "PKGBUILD-git" ]; then
                cp PKGBUILD PKGBUILD-git
            fi
            cp PKGBUILD-stable PKGBUILD
            echo "Stable version is now active"
            echo "Remember to update the sha256sum after downloading the source!"
        else
            echo "PKGBUILD-stable not found!"
            exit 1
        fi
        ;;
    backup)
        echo "Creating backup of current PKGBUILD..."
        if grep -q "_pkgname=.*-git" PKGBUILD; then
            cp PKGBUILD PKGBUILD-git
            echo "Backed up as PKGBUILD-git"
        else
            cp PKGBUILD PKGBUILD-stable
            echo "Backed up as PKGBUILD-stable"
        fi
        ;;
    *)
        echo "Usage: $0 {git|stable|backup}"
        echo "  git    - Switch to git version"
        echo "  stable - Switch to stable release version"
        echo "  backup - Backup current PKGBUILD based on its type"
        exit 1
        ;;
esac
