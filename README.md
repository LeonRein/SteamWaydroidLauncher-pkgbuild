# SteamWaydroidLauncher AUR Package

Waydroid launcher and helper scripts for Steam integration, originally from the [Bazzite project](https://github.com/ublue-os/bazzite).

## Features

- Launch Waydroid in a caged environment
- Add Android apps directly to Steam
- Automatic controller configuration
- Clean desktop integration

## Installation

### One-Line Installer (Arch Linux)
```bash
curl -fsSL https://raw.githubusercontent.com/LeonRein/SteamWaydroidLauncher/main/SteamWaydroidLauncher-pkgbuild/install.sh | bash
```

### Manual AUR Installation
```bash
# Git version (recommended)
paru -S steamwaydroidlauncher-git

# Stable version
paru -S steamwaydroidlauncher
```

## Setup

**Important**: You must initialize Waydroid before using SWL:

```bash
sudo waydroid init
```

Follow the [Waydroid documentation](https://docs.waydro.id/) for complete setup.

## Usage

### Basic Commands
```bash
# Launch Waydroid
swl-launch

# Add apps to Steam
swl-add-waydroid-app
```

### Desktop Applications
Find these in your application menu under "SWL" category:
- **SWL: Launch Waydroid**
- **SWL: Add Waydroid App to Steam** 
- **SWL: Stop Waydroid**

## License

GPL-3.0 License
