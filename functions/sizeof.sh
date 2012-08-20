# Shows human-readable size of filesystem elements.
# Author: Matti Schneider <hi@mattischneider.fr>

# Shows human-readable size of the given filesystem element.
# $1 = path to file or folder of which the size is to be computed
_sizeof() {
	du -hc "$1" | tail -n 1
}

# Shows human-readable size of the given filesystem elements.
# $* (optional) = paths to files or folders of which the size is to be computed. If none are passed, defaults to the current directory.
sizeof() {
	if [[ $# = 0 ]]
	then _sizeof "."
	fi
	
	for file in "$@"
	do _sizeof "$file"
	done
}