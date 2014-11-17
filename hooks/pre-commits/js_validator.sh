#!/bin/bash

# Validates the syntax of a JS file with the Esprima parser.
# $1 = JavaScript file path
validate() {
	# from http://ariya.ofilabs.com/2012/10/javascript-validator-with-esprima.html

	esvalidate "$1"
	if [ $? -eq 1 ]
	then
		echo "JavaScript syntax error in $1"
		exit 1
	fi
}

if (echo "$1" | egrep --quiet '\.js$' | egrep --quiet --invert-match 'spec')	# it's a javascript file, but not a spec file
then validate "$1"
fi
