# Replaces all non-UNIX (CR, CRLF) line endings with UNIX line endings (LF) in the given files.
function crlfconv() {	# $* : files to convert
	if [[ $# = 0 ]]
	then
		echo "Usage: crlfconv file_to_convert [another_file [another…]]"
		return 1
	fi

	local result=0

	for file in "$@"
	do
		echo -n "Converting ${file}… "

		if _crlfconv "$file"
		then
			echo "done"
		else
			echo "**error**"
			result=1
		fi
	done

	return $result
}

function _crlfconv() {	# converts the given file's line endings to UNIX-style.
	perl -pi -e 's/\r\n?/\n/g' "$(readlink $1 || echo $1)" # perl's in-place editing (-i) overwrites symlinks with a new version of the file; prevent this behavior by editing original files in place
}
