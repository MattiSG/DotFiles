# Proxy a network interface on macOS to a server through an SSH tunnel

TUNNEL_PORT=2465  # set this to an available port on your machine
TUNNEL_SERVER='root@139.99.105.193'  # set this to a server on which you can SSH
TUNNEL_INTERFACE='Wi-Fi'  # set this to the name of the interface to proxy; you can get this name in the Network pane of System Preferences
TUNNEL_REMOTE_PORT=443  # set this to a port on which you set up sshd to listen to on the proxy server; 443 is disabled by default, but using this port circumvents proxy prevention in countries that filter internet access, since traffic is disguised as HTTPS

function tunnel_pid() {
	ps aux | grep $TUNNEL_PORT | grep ssh | tr -s ' ' | cut -d ' ' -f 2
}

# Thanks to:
# https://mikeash.com/ssh_socks.html
# https://gist.github.com/jordelver/3073101
function proxy() {
	if [[ -z $TUNNEL_SERVER ]]
	then
		echo 'No proxy server set!'
		return 1
	fi

	if [[ $1 = 'on' ]]
	then
		ssh -Nf -D $TUNNEL_PORT $TUNNEL_SERVER -p $TUNNEL_REMOTE_PORT
		echo "Tunnel PID: $(tunnel_pid)"
		sudo networksetup -setsocksfirewallproxy "$TUNNEL_INTERFACE" localhost $TUNNEL_PORT
	elif [[ $1 = 'off' ]]
	then
		if [[ $(tunnel_pid) ]]
		then
			kill $(tunnel_pid)
			echo "Tunnel stopped"
		fi
		sudo networksetup -setsocksfirewallproxystate "$TUNNEL_INTERFACE" off
	fi

	echo "Interface: $TUNNEL_INTERFACE"
	networksetup -getsocksfirewallproxy "$TUNNEL_INTERFACE"
	echo "External IP: $(ip)"
}
