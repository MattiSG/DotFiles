#!/bin/bash

source $(dirname "$BASH_SOURCE")/lib/MSGShellUtils/paths.sh

oldPath="$(removeTrailingSlash $1)"
newPath="$(removeTrailingSlash $2)"

if ! [[ -d "$oldPath" ]]
then
	echo "'$oldPath' is not a directory"
	echo
	echo "Usage: $(basename $0) <oldPath> <newPath>"	# TODO: check that <newPath> does not exist yet
	exit 1
fi

# Credit: http://stackoverflow.com/a/13942859/594053
originUrl=$(git config --local --get submodule.$oldPath.url)

## add new submodule
mkdir -p $(dirname "$newPath")	# TODO: add && everywhere (use staged_process?)
git submodule add "$originUrl" "$newPath"	# TODO: copy the commit ID of the old submodule
# TODO: move existing instead of cloning the whole repo (see StackOverflow answer)

## remove old submodule
git config -f .git/config --remove-section "submodule.$oldPath"
git config -f .gitmodules --remove-section "submodule.$oldPath"
git rm --cached "$oldPath"
rm -rf "$oldPath"	# remove old src
rm -rf ".git/modules/$oldPath"	# cleanup gitdir

git add .gitmodules

echo "Done!"
echo
echo "Move $(basename $oldPath) submodule"	# TODO: prepare commit message
