#!/bin/bash
# Validates the syntax of a Python file with flake8.
# $1 = file path

if echo "$1" | egrep --quiet '\.py$'
then flake8 --jobs=auto "$1"
fi
