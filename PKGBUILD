# Maintainer: LeonRein <LeonRein at protom dot me>
_pkgname=steamwaydroidlauncher
pkgname=${_pkgname}-git
pkgver=1.0.0.r0.g1234567
pkgrel=1
pkgdesc="Waydroid launcher and helper scripts for Steam integration with caged Wayland environment"
arch=('any')
url="https://github.com/LeonRein/SteamWaydroidLauncher"
license=('GPL3')
depends=('bash' 'waydroid' 'cage' 'wlr-randr' 'xorg-xrandr' 'kdialog' 'polkit')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')
install=${_pkgname}.install

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

package() {
  cd "${_pkgname}"

  # Install binaries
  install -Dm755 "bin/swl-add-waydroid-app" "$pkgdir/usr/bin/swl-add-waydroid-app"
  install -Dm755 "bin/swl-launch" "$pkgdir/usr/bin/swl-launch"
  install -Dm755 "bin/swl-cleanup-apps" "$pkgdir/usr/bin/swl-cleanup-apps"

  # Install helper scripts to /usr/lib/swl
  install -Dm755 "lib/waydroid-container-restart" "$pkgdir/usr/lib/swl/waydroid-container-restart"
  install -Dm755 "lib/waydroid-container-start" "$pkgdir/usr/lib/swl/waydroid-container-start"
  install -Dm755 "lib/waydroid-container-stop" "$pkgdir/usr/lib/swl/waydroid-container-stop"
  install -Dm755 "lib/waydroid-fix-controllers" "$pkgdir/usr/lib/swl/waydroid-fix-controllers"

  # Install polkit policy files
  install -Dm644 "polkit-1/actions/org.swl.waydroid.policy" "$pkgdir/usr/share/polkit-1/actions/org.swl.waydroid.policy"
  install -Dm644 "polkit-1/rules.d/30-waydroid.rules" "$pkgdir/usr/share/polkit-1/rules.d/30-waydroid.rules"

  # Install controller configuration
  install -Dm644 "share/Vendor_28de_Product_11ff.kl" "$pkgdir/usr/share/swl/Vendor_28de_Product_11ff.kl"
  
  # Install desktop directory and menu files
  install -Dm644 "share/swl.directory" "$pkgdir/usr/share/desktop-directories/swl.directory"
  install -Dm644 "share/swl-applications.menu" "$pkgdir/etc/xdg/menus/applications-merged/swl-applications.menu"
  
  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install desktop entries
  install -Dm644 desktop/swl-add-waydroid.desktop "$pkgdir/usr/share/applications/swl-add-waydroid.desktop"
  install -Dm644 desktop/swl-launch.desktop "$pkgdir/usr/share/applications/swl-launch.desktop"
  install -Dm644 desktop/swl-stop-waydroid.desktop "$pkgdir/usr/share/applications/swl-stop-waydroid.desktop"
  install -Dm644 desktop/swl-cleanup-apps.desktop "$pkgdir/usr/share/applications/swl-cleanup-apps.desktop"
}
