# Cross-platform Darwin open(1)
# Simply add this function definition above any OSX script that uses the “open” command
# For additional information on the “open” command, see https://developer.apple.com/library/mac/#documentation/darwin/reference/manpages/man1/open.1.html
function open() {
	if [[ $(uname) = "Darwin" ]]
	then /usr/bin/open "$@"	#OS X
	else xdg-open "$@" &> /dev/null &	# credit: http://stackoverflow.com/questions/264395
	fi
}

# Open the given element, or the current directory, delegating handler selection to the OS.
# Credit: https://github.com/MoOx/dotfiles/blob/master/backpack/functions/os
function o() {
	open "${@:-.}"
}
