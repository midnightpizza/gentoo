# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Gofish gopher server"
HOMEPAGE="http://gofish.sourceforge.net"
SRC_URI="https://downloads.sourceforge.net/gofish/${P}.tar.gz"
S="${WORKDIR}/${PN}"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 ~ppc ~x86"

# See bug #905314 for bsd-games blocker.
RDEPEND="
	acct-group/gopher
	acct-user/gopher
	!games-misc/bsd-games
"

DOCS=( Configure_GoFish )

src_configure() {
	local myeconfargs=(
		--localstatedir=/var
		--disable-mmap-cache
	)

	econf "${myeconfargs[@]}"
}

src_install() {
	default
	newinitd "${FILESDIR}"/gofish-1.2-r1.rc gofish
	newconfd "${FILESDIR}"/gofish-1.2-r1.confd gofish
}
