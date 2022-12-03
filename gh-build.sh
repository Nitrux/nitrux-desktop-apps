#! /bin/sh

apt-get --yes update
apt-get --yes install wget equivs curl git

deps=$(sed -e '/^#.*$/d; /^$/d; /^\s*$/d' package/dependencies | paste -sd ,)
git_commit=$(git rev-parse --short HEAD)

> configuration printf "%s\n" \
	"Section: misc" \
	"Priority: optional" \
	"Homepage: https://nxos.org" \
	"Package: nx-desktop-apps-legacy" \
	"Version: 0.3.9-$git_commit" \
	"Maintainer: Uri Herrera <uri_herrera@nxos.org>" \
	"Depends: $deps" \
	"Conflicts: nx-desktop-apps" \
	"Architecture: amd64" \
	"Description: NX Desktop Apps metapackage for Nitrux."

equivs-build configuration
