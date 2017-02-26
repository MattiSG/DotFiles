TUNNEL_PORT=2983
SERVER=''

function tunnel_pid() {
	ps aux | grep $TUNNEL_PORT | grep ssh | tr -s ' ' | cut -d ' ' -f 2
}

# Thanks to:
# https://mikeash.com/ssh_socks.html
# https://gist.github.com/jordelver/3073101
function proxy() {
	if [[ -z $SERVER ]]
	then
		echo 'No proxy server set!'
		return 1
	fi

	local interface="Wi-Fi"

	if [[ $1 = 'on' ]]
	then
		ssh -Nf -D $TUNNEL_PORT $SERVER
		echo "Tunnel PID: $(tunnel_pid)"
		sudo networksetup -setsocksfirewallproxy $interface localhost $TUNNEL_PORT
	elif [[ $1 = 'off' ]]
	then
		if [[ $(tunnel_pid) ]]
		then
			kill $(tunnel_pid)
			echo "Tunnel stopped"
		fi
		sudo networksetup -setsocksfirewallproxystate $interface off
	fi

	networksetup -getsocksfirewallproxy $interface
	echo "External IP: $(ip)"
}
