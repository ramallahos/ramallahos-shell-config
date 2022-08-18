# Maintainer: Safwan Nayeem Yousuf <safwannayeemyousuf.com>
pkgname=ramallahos-shell-config
pkgver=1
pkgrel=1
pkgdesc="BASH, FISH & ZSH configs for RamallahOS"
arch=('any')
url="https://github.com/ramallahos/$pkgname"
license=('GPL3')
depends=('bash' 'fish' 'zsh')
makedepends=('coreutils')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

package() {
    cd "$pkgname"
    install -d "${pkgdir}/etc/skel/.config/fish/"
	install -Dm 755 ".bashrc" "${pkgdir}/etc/skel/.bashrc"
	install -Dm 755 "config.fish" "${pkgdir}/etc/skel/.config/fish/config.fish"
    install -Dm 755 "aliasrc" "${pkgdir}/etc/skel/.config/aliasrc"
    install -Dm 755 ".zshrc" "${pkgdir}/etc/skel/.zshrc"
    install -Dm 755 ".zprofile" "${pkgdir}/etc/skel/.zprofile"
    install -Dm 755 ".zcompdump" "${pkgdir}/etc/skel/.zcompdump"
    install -Dm 755 ".zshenv" "${pkgdir}/etc/skel/.zshenv"
}
