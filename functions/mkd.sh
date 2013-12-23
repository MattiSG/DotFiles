# Create a new directory and enter it
# Credit: https://github.com/MoOx/dotfiles/blob/master/backpack/functions/os
function mkd() {
	dir="${1:-tmp}"
	mkdir -p "$dir" && cd "$dir"
}
