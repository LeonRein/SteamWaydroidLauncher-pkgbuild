pkgname=SteamWaydroidLauncher-git
pkgver=r1.0
pkgrel=1
pkgdesc="Waydroid launcher and helper scripts for Steam (latest git version)"
arch=('any')
url="https://github.com/LeonRein/SteamWaydroidLauncher"
license=('GPL')
depends=('waydroid' 'cage' 'wlr-randr' 'xdpyinfo' 'kdialog')
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

  install -Dm755 "bin/swl-launch" "$pkgdir/usr/bin/swl-launch"
  install -Dm755 "bin/swl-startup-waydroid" "$pkgdir/usr/bin/swl_startup-waydroid"
  install -Dm755 "bin/swl-shutdown-waydroid" "$pkgdir/usr/bin/swl_shutdown-waydroid"
  install -Dm755 "bin/swl-sudoers-add" "$pkgdir/usr/bin/swl-sudoers-add"
  install -Dm755 "bin/swl-sudoers-remove" "$pkgdir/usr/bin/swl-sudoers-remove"

  install -Dm644 "doc/sudoers-template" "$pkgdir/usr/share/doc/swl/sudoers-template"
  
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
