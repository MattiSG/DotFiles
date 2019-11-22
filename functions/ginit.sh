# Initializes a new Git repository
# $1 (optional) = path to repository to init. Defaults to the current directory.
ginit() {
	if ! [[ -f "$1" ]]
	then mkdir "$1"
	fi

	if [[ "$1" ]]
	then cd "$1"
	fi

	git init

	open . -a GitUp
}
