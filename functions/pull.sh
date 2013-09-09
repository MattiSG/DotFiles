# Pulls from a Git repo, updating all submodules.

function pull() {	# [options to pass to `git pull`
	git pull "$@" &&
	git submodule sync &&
	git submodule update --init --recursive
}
