# Opens files with EDITOR, creating them if they don't exist.
# Author: Matti Schneider <hi@mattischneider.fr>

# Opens the given file with the set EDITOR, creating it if it doesn't exist.
# $1 = path to file to edit
_edit() {
	target="$*"	# allow unprotected spaces

	if ! [[ -e "$target" ]]
	then
		mkdir -p "$(dirname "$target")" 2> /dev/null
		touch "$target"
	elif [ -h "$target" ]
	then target=`readlink "$target"`
	fi

	open -a "Sublime Text 2" "$target"
}

# Opens all given files with the set EDITOR, creating them if they don't exist.
# $* = paths to files to edit; defaults to the cwd
edit() {
	for f in "${@:-.}"
	do _edit "$f"
	done
}
