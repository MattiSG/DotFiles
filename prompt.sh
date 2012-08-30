source $(dirname "$BASH_SOURCE")/../MSGShellUtils/ui.sh

user() {
	echo -n $boldon
	if [[ $USER == "matti" ]]
	then echo -n $greenf"∵"
	else echo -n $redf$USER"@"
	fi
	echo -n $reset
}

host() {
	echo -n $boldon
	if [[ $HOSTNAME == "MBP-Alcmene.local" ]]
	then echo -n $greenf"∴ "
	else echo -n "$yellowf$HOSTNAME:"
	fi
	echo -n $reset
}

directory() {
	local pwd="$(pwd)"
	
	echo -n $purplef
	if [[ $pwd == $HOME ]]
	then echo -n $boldon'~'
	elif [[ $pwd == '/' ]]
	then echo -n $boldon'/'
	else echo -n $(basename "$(dirname "$pwd")")/$boldon$(basename "$pwd")
	fi
	echo -n $reset
}


function parse_git_dirty() {
	[[ $(git status 2> /dev/null | wc -l) != "       2" ]] && echo '⊛'
}

function gitinfo() {
	result=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1/")
	if [[ -n $result ]]
	then echo -n " $cyanf[$result]$boldon$(parse_git_dirty)$reset"
	fi
}


export PS1='$(user)$(host)$(directory)$(gitinfo) › '
