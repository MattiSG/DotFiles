# Create a data URL from a file
function dataurl() {
	local mimeType=$(file --mime-type "$1" | cut -d ' ' -f2)
	if [[ $mimeType == text/* ]]; then
		mimeType="${mimeType};charset=utf-8"
	fi
	echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}