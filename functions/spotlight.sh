# Searches for the given strings recursively in the current directory.
# --off: stop indexing (useful when running mad on your battery)
# --on: start indexing again
function spotlight() {
	if [[ $1 == '--off' ]]
	then sudo mdutil -a -i off
	elif [[ $1 == '--on' ]]
	then sudo mdutil -a -i on
	else mdfind -onlyin . $*
	fi
}
