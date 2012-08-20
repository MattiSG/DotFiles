# Opens the given manpages in Preview.
pdfman () {
	man -t "$@" | open -f -a /Applications/Preview.app
}