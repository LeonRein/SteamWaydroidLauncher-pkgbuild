pkgname=SteamWaydroidLauncher-git
pkgver=r359.df62cdc
pkgrel=1
pkgdesc="Waydroid launcher and helper scripts for Steam (latest git version)"
arch=('any')
url="https://github.com/LeonRein/SteamWaydroidLauncher"
license=('GPL')
depends=('waydroid' 'cage' 'wlr-randr' 'xorg-xdpyinfo' 'kdialog')
source=("git+https://github.com/LeonRein/SteamWaydroidLauncher.git#branch=dev")
md5sums=('SKIP')

pkgver() {
  cd SteamWaydroidLauncher
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

package() {
  cd SteamWaydroidLauncher

  # Install binaries
  install -Dm755 "bin/swl-launch" "$pkgdir/usr/bin/swl-launch"
  install -Dm755 "bin/swl-startup-waydroid" "$pkgdir/usr/bin/swl-startup-waydroid"
  install -Dm755 "bin/swl-shutdown-waydroid" "$pkgdir/usr/bin/swl-shutdown-waydroid"
  install -Dm755 "bin/swl-sudoers-add" "$pkgdir/usr/bin/swl-sudoers-add"
  install -Dm755 "bin/swl-sudoers-remove" "$pkgdir/usr/bin/swl-sudoers-remove"
  install -Dm755 "bin/swl-add-waydroid-app" "$pkgdir/usr/bin/swl-add-waydroid-app"

  # Install helper scripts to /usr/lib/swl
  install -Dm755 "lib/reset-maxpid" "$pkgdir/usr/lib/swl/reset-maxpid"
  install -Dm755 "lib/set-maxpid" "$pkgdir/usr/lib/swl/set-maxpid"
  install -Dm755 "lib/setup-logging.sh" "$pkgdir/usr/lib/swl/setup-logging.sh"
  install -Dm755 "lib/start-waydroid-container" "$pkgdir/usr/lib/swl/start-waydroid-container"
  install -Dm755 "lib/stop-waydroid-container" "$pkgdir/usr/lib/swl/stop-waydroid-container"
  install -Dm755 "lib/wait-for-boot" "$pkgdir/usr/lib/swl/wait-for-boot"

  # Install documentation
  install -Dm644 "doc/sudoers-template" "$pkgdir/usr/share/doc/swl/sudoers-template"
  
  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
