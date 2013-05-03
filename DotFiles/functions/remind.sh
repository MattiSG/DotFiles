# Add reminder to Reminders.app (OS X 10.8)
# Usage: `remind 'foo'` or `echo 'foo' | remind`
function remind() {
	local text
	if [ -t 0 ]; then
		text="$1" # argument
	else
		text=$(cat) # pipe
	fi
	osascript >/dev/null <<EOF
tell application "Reminders"
	tell the default list
		make new reminder with properties {name:"$text"}
	end tell
end tell
EOF
}
