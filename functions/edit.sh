# Opens files with EDITOR, creating them if they don't exist.
# Author: Matti Schneider <hi@mattischneider.fr>

# Opens the given file with the set EDITOR, creating it if it doesn't exist.
# $1 = path to file to edit
_edit() {
	if ! [[ -e $1 ]]
	then
		mkdir -p $(dirname $1) 2> /dev/null
		touch $1
	fi
	
	open -a "$EDITOR" $1	
}

# Opens all given files with the set EDITOR, creating them if they don't exist.
# $* = paths to files to edit
edit() {
	for f in "$@"
	do _edit "$f"
	done
}
