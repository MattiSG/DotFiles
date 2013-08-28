function eventually() {	# $@ = command to execute
	while ! $@
	do
		echo '--------'
		date
		echo '--------'
	done
}
