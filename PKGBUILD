pkgname=SteamWaydroidLauncher-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Waydroid launcher and helper scripts for Steam (latest git version)"
arch=('any')
url="https://github.com/LeonRein/SteamWaydroidLauncher"
license=('GPL')
depends=('bash' 'waydroid' 'cage' 'wlr-randr' 'xorg-xrandr' 'kdialog' 'polkit')
source=("git+https://github.com/LeonRein/SteamWaydroidLauncher.git#branch=bazzite")
md5sums=('SKIP')
install=steamwaydroidlauncher.install

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
  install -Dm755 "bin/swl-add-waydroid-app" "$pkgdir/usr/bin/swl-add-waydroid-app"
  install -Dm755 "bin/swl-launch" "$pkgdir/usr/bin/swl-launch"

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
  
  # Install desktop category directory
  install -Dm644 "share/SteamWaydroidLauncher.directory" "$pkgdir/usr/share/desktop-directories/SteamWaydroidLauncher.directory"
  
  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install desktop entries
  install -Dm644 desktop/swl-add-waydroid.desktop "$pkgdir/usr/share/applications/swl-add-waydroid.desktop"
  install -Dm644 desktop/swl-launch.desktop "$pkgdir/usr/share/applications/swl-launch.desktop"
}
