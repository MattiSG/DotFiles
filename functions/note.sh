# Add note to Notes.app (OS X 10.8)
# Usage: `note 'foo'` or `echo 'foo' | note`
function note() {
	local text
	if [ -t 0 ]; then # argument
		text="$1"
	else # pipe
		text=$(cat)
	fi
	body=$(echo "$text" | sed -E 's|$|<br>|g')
	osascript >/dev/null <<EOF
tell application "Notes"
	tell account "iCloud"
		tell folder "Notes"
			make new note with properties {name:"$text", body:"$body"}
		end tell
	end tell
end tell
EOF
}
