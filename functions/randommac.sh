# Credit: @anthonyheddings
function randommac() { # [$1 = interface to set up a random MAC address for, defaults to en0]
	openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//' | xargs sudo ifconfig ${1:-en0} ether
}
