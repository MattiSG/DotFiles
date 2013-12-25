# Opens files with EDITOR, creating them if they don't exist.
# Author: Matti Schneider <hi@mattischneider.fr>

# Opens the given file with the set EDITOR, creating it if it doesn't exist.
# $1 = path to file to edit
_edit() {
	if ! [[ -e "$*" ]]
	then
		mkdir -p "$(dirname "$*")" 2> /dev/null
		touch "$*"
	fi

	open -a "Sublime Text 2" "$*"
}

# Opens all given files with the set EDITOR, creating them if they don't exist.
# $* = paths to files to edit
edit() {
	for f in "$@"
	do _edit "$f"
	done
}
