# Executes the passed command, and outputs its status code.
function verbose() {	# $@: command to execute
	"$@"

	local status=$?
	
	echo $status
	return $status
}