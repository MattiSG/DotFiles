# Pulls from a Git repo, updating all submodules.

# $@ = options to pass to `git pull`
function pull() {
	git pull "$@" &&
	git submodule sync &&
	git submodule update --init --recursive
}
