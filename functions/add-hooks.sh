function add-hooks() {
	hook_type=${1:-pre-commit}
	ln -s "$(dirname $BASH_SOURCE)/hooks/$hook_type" .git/hooks/$hook_type
}
