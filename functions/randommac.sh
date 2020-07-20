# Credit: @anthonyheddings
function randommac() { # [$1 = interface to set up a random MAC address for, defaults to en0]
	interface=${1:-en0}
	echo "Previous MAC address for $cyanf$interface$reset was $redf`mymac $interface`$reset"

	openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//' | xargs sudo ifconfig $interface ether

	echo "New MAC address for $cyanf$interface$reset is $greenf`mymac $interface`$reset"
}

function mymac() {
	ifconfig ${1:-en0} | grep ether | cut -d ' ' -f 2
}
