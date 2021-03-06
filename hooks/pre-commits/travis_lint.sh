#!/bin/sh

if echo "$1" | egrep --quiet '^\.travis\.yml'
then
	if ! command -v travis > /dev/null 2>&1	# http://stackoverflow.com/questions/592620
	then
		echo 'Missing Travis gem to lint your .travis.yml. Trying to install it for you…'
		gem install travis || exit 126
	fi

	travis lint --exit-code
fi
