# Maintainer: Safwan Nayeem Yousuf <safwannayeemyousuf.com>
pkgname=ramallahos-shell-config
pkgver=1
pkgrel=1
pkgdesc="BASH, FISH & ZSH configs for RamallahOS"
arch=('any')
url="https://github.com/ramallahos/$pkgname"
license=('GPL3')
depends=('bash' 'fish' 'zsh' 'zsh-autosuggestions' 'zsh-completions' 'zsh-autocomplete' 'starship' 'fzf')
makedepends=('coreutils')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

package() {
    cd "$pkgname"
    install -d "${pkgdir}/etc/skel/.config/fish/"
    install -d "${pkgdir}/usr/share/resources/${pkgname}/"
    install -Dm 755 ".bashrc" "${pkgdir}/etc/skel/.config/bash/.bashrc"
    install -Dm 755 ".bash_profile" "${pkgdir}/etc/skel/.bash_profile"
    install -Dm 755 ".bashrc" "${pkgdir}/etc/bash.bashrc"
    install -Dm 755 "config.fish" "${pkgdir}/etc/skel/.config/fish/config.fish"
    install -Dm 755 "config.fish" "${pkgdir}/root/.config/fish/config.fish"
    install -Dm 755 "aliasrc" "${pkgdir}/usr/share/resources/${pkgname}/aliasrc"
    install -Dm 755 ".zshrc" "${pkgdir}/etc/skel/.config/zsh/.zshrc"
    install -Dm 755 ".zprofile" "${pkgdir}/etc/skel/.zprofile"
    install -Dm 755 ".zcompdump" "${pkgdir}/etc/skel/.zcompdump"
    install -Dm 755 ".zshenv" "${pkgdir}/etc/skel/.zshenv"
    install -Dm 755 ".zshrc" "${pkgdir}/root/.zshrc"
    install -Dm 755 ".zprofile" "${pkgdir}/root/.zprofile"
    install -Dm 755 ".zcompdump" "${pkgdir}/root/.zcompdump"
    install -Dm 755 ".zshenv" "${pkgdir}/root/.zshenv"
}
