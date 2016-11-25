# Credit: https://raamdev.com/2008/howto-remove-google-software-update-on-mac-os-x/

if [[ -d ~/Library/Google/GoogleSoftwareUpdate ]]
then
	~/Library/Google/GoogleSoftwareUpdate/GoogleSoftwareUpdate.bundle/Contents/Resources/ksinstall --nuke
	echo "Removed Google Software Update"
fi

if ! touch ~/Library/Google/GoogleSoftwareUpdate 2> /dev/null
then
	echo "Installation of Google Software Update already prevented"
else
	echo "Requesting access to prevent future installations of Google Software Update…"
	sudo chown nobody:nobody ~/Library/Google/GoogleSoftwareUpdate
	echo "done"
fi
