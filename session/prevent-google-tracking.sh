# Credit: https://raamdev.com/2008/howto-remove-google-software-update-on-mac-os-x/

# Remove Google Software Update
if [[ -d ~/Library/Google/GoogleSoftwareUpdate ]]
then ~/Library/Google/GoogleSoftwareUpdate/GoogleSoftwareUpdate.bundle/Contents/Resources/ksinstall --nuke
fi

# Prevent reinstalls
touch ~/Library/Google/GoogleSoftwareUpdate
sudo chown nobody:nobody ~/Library/Google/GoogleSoftwareUpdate
