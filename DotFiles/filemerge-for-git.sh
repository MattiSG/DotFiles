#!/bin/bash

# Credit: http://www.jotlab.com/2009/11/16/how-to-use-filemerge-with-git-as-a-diff-tool-on-osx/
/usr/bin/opendiff "$2" "$5" -merge "$1"
