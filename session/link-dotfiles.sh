#!/bin/bash
# Symlinks all dotfiles into user's home dir.

cd "$(dirname "$BASH_SOURCE")/../dots"
DOTFILES_DIR="$(pwd)"

actionForAllFiles=''

# Inspired by <https://github.com/MoOx/dotfiles/blob/master/bin/dotfiles>
function link() {	# $1 = source file; $2 = target file
	local source="$1"
	local target="$2"

	local action=$actionForAllFiles
	local skip=''

	if [[ `readlink "$target"` == "$source" ]]
	then
		echo "$target already linked"
		skip=true
	elif [[ -e "$target" ]] || [[ -h "$target" ]]
	then
		if [[ -z $actionForAllFiles ]]
		then
			read -p "File '$target' already exists. [s]kip (default), [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?" -n 1 action
			echo
		fi

		case $action in
			O) actionForAllFiles='o';;
			B) actionForAllFiles='b';;
			S) actionForAllFiles='s';;
		esac

		case ${actionForAllFiles:-$action} in
			o) rm "$target";;
			b) mv -v "$target" "$target~";;	# TODO: doesn't handle what happens if a backup already exists
			*) skip=true;;
		esac
	fi

	if [[ -z $skip ]]
	then ln -s -v "$source" "$target"
	fi
}

cd ..

for file in $(find dots -type f)
do
	dotfile=$(echo $file | cut -d '/' -f 2-)	# remove "dots/" directory
	link "$DOTFILES_DIR/$dotfile" "$HOME/.$dotfile"
done
