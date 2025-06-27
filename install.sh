#!/bin/bash
# SteamWaydroidLauncher - Arch Linux One-Line Installer
# Usage: curl -fsSL https://raw.githubusercontent.com/LeonRein/SteamWaydroidLauncher/main/SteamWaydroidLauncher-pkgbuild/install.sh | bash

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Print functions
print_info() { echo -e "${BLUE}[INFO]${NC} $1"; }
print_success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
print_warning() { echo -e "${YELLOW}[WARNING]${NC} $1"; }
print_error() { echo -e "${RED}[ERROR]${NC} $1"; }

# Check if pacman is available
check_pacman() {
    if ! command -v pacman >/dev/null 2>&1; then
        print_error "This installer requires pacman (Arch Linux package manager)."
        print_info "For other distributions, please use manual installation from the main repository."
        exit 1
    fi
    print_info "pacman detected - proceeding with installation"
}

# Check if running as root
check_root() {
    if [[ $EUID -eq 0 ]]; then
        print_error "Do not run this script as root!"
        print_error "This script needs to build packages as a regular user and will ask for sudo when needed."
        exit 1
    fi
}

# Install base-devel if not present
install_base_devel() {
    if ! pacman -Qq base-devel >/dev/null 2>&1; then
        print_info "Installing base-devel (required for building packages)..."
        sudo pacman -Sy --needed --noconfirm base-devel
    fi
    
    if ! command -v git >/dev/null 2>&1; then
        print_info "Installing git..."
        sudo pacman -S --needed --noconfirm git
    fi
}



# Build and install package
build_and_install() {
    print_info "Downloading PKGBUILD..."
    
    # Create temporary directory
    TEMP_DIR=$(mktemp -d)
    cd "$TEMP_DIR"
    
    # Download the PKGBUILD and related files
    curl -fsSL "https://raw.githubusercontent.com/LeonRein/SteamWaydroidLauncher-pkgbuild/main/PKGBUILD" -o PKGBUILD
    curl -fsSL "https://raw.githubusercontent.com/LeonRein/SteamWaydroidLauncher-pkgbuild/main/steamwaydroidlauncher.install" -o steamwaydroidlauncher.install
    
    print_info "Building package..."
    
    # Build the package
    makepkg -si --noconfirm
    
    print_success "Package built and installed successfully!"
    
    # Cleanup
    cd /
    rm -rf "$TEMP_DIR"
}

# Main installation process
main() {
    print_info "SteamWaydroidLauncher Arch Linux Installer"
    print_info "=========================================="
    
    # System checks
    check_pacman
    check_root
    
    # Install build dependencies
    install_base_devel
    
    # Build and install the package
    build_and_install
    
    print_success "SteamWaydroidLauncher installed successfully!"
    print_info ""
    print_info "For more information, visit: https://github.com/LeonRein/SteamWaydroidLauncher"
    print_info ""
    print_info "To uninstall: sudo pacman -R steamwaydroidlauncher-git"
}

# Handle interruption
trap 'print_error "Installation interrupted!"; cd /; rm -rf "$TEMP_DIR" 2>/dev/null || true; exit 1' INT TERM

# Run main function
main "$@"
