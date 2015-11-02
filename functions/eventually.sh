function eventually() {	# $@ = command to execute
	while ! $@
	do
		echo '--------'
		date
		echo '--------'
		sleep 1
	done
}
